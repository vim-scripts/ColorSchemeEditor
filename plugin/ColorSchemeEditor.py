#!/usr/bin/python
# ColorSchemeEditor.vim: Provides a GUI to facilitate creating/editing a Vim colorscheme
# Maintainer:       Erik Falor <ewfalor@gmail.com>
# Date:             Mar 05, 2008
# Version:          1.0.2 beta
# License:          Vim license

import logging
import os
import re
import sys
import time
import traceback
from subprocess import Popen, PIPE, STDOUT
import pygtk
pygtk.require('2.0')
import gtk
import gtk.glade

#TODO:
#1.     Get the ColorSelection widget to use 24 bit colors instead of 48-bit colors
#2.     Put the communication with Vim into a thread && handle asynchronously
#7.     Vim helpfile - clicking &Help opens the Vim help page in Vim.
#8.     Color-code the values in the listview
#14.    Integrate rgb.txt
#19.    Add a tooltip to explain what the different highlight elements are in the TreeView
#33.    Make adding and removing highlight groups undoable
#35.    Setting NONE attribute checkbox does not result in an atomic undo.
#36.    Removing highlight groups from list:
#       If it is a preferred/default highlight group, remove from tree and send a "hi <group> clear"
#       Otherwise, just remove it from the tree
#37.    Using the eye-dropper causes a crash in Win32; PyGTK tries to bail out, but fails to secure enough
#       resources for the "unsaved changes" nag screen 
#39.    If you change the Name in the metadata, should that sent to Vim?

#def gtk.check_version(required_major, required_minor, required_micro)required_major :  the required major version number
#required_minor :   the required minor version number
#required_micro :   the required micro version number
#Returns :  None if the underlying GTK+ library is compatible or a string describing the mismatch

gladefile = "%s/ColorSchemeEditor.glade" % sys.argv[2]
logging.basicConfig(level=logging.DEBUG,
        datefmt='%H:%M:%S',
        format='%(asctime)s %(levelname)s %(message)s',)

class ColorSchemeEditor:
    """This is the ColorSchemeEditor application"""

    def __init__(self):
        self.version            = 'v1.0 beta'
        self.serverName         = sys.argv[1]
        self.colorSchemeFile    = ''
        self.colorSchemeName    = ''
        self.dirty              = False
        self.locked             = False
        
        #regular expressions used to parse output of :highlight command
        self.re_guifg           = re.compile("guifg=(#?[\w]+)")
        self.re_guibg           = re.compile("guibg=(#?[\w]+)")
        self.re_gui             = re.compile("gui=(#?[\w,]+)")
        self.re_link            = re.compile("links to ([\w]+)")
        self.re_clear           = re.compile("cleared")

        #Set the Glade file
        self.wTree = gtk.glade.XML(gladefile, "toplevel") 
        self.toplevel = self.wTree.get_widget("toplevel")
        self.toplevel.connect("delete_event", self.OnDeleteEvent)

        #Create our dictionary of handlers and connect
        dic = { "on_toplevel_destroy" : self.OnQuit,
                "on_about1_activate" : self.OnAbout,
                "on_btAdd_clicked" : self.OnAdd,
                "on_btRemove_clicked" : self.OnRemove,
                "on_menuQuit_activate" : self.OnQuit,
                "on_menuSaveAs_activate" : self.OnSaveAs,
                "on_menuSave_activate" : self.OnSave,
                "on_refresh_activate" : self.OnRefresh,
                "on_tbRedo_clicked" : self.OnUndo,
                "on_tbRefresh_clicked" : self.OnRefresh,
                "on_tbSave_clicked" : self.OnSave,
                "on_tbUndo_clicked" : self.OnUndo,
                "on_tbConnect_clicked" : self.OnConnect,
                "on_menuConnect_activate" : self.OnConnect,
                "on_tvVimHighlights_row_activated" : self.OnHighlightRowActivated,
                "on_btExpand_clicked" : self.OnExpand,
                "on_btCollapse_clicked" : self.OnCollapse,
                "on_help1_activate" : self.OnHelp,
                }
        self.wTree.signal_autoconnect(dic)

        #allocate the colormap
        self.visual             = gtk.gdk.Visual(24, gtk.gdk.VISUAL_TRUE_COLOR)
        self.colormap           = gtk.gdk.Colormap(self.visual, True)

        #get handles to color selectors
        self.csForeground       = self.wTree.get_widget("csForeground")
        self.csBackground       = self.wTree.get_widget("csBackground")
        #connect "color_changed" event
        for w in [ self.csForeground, self.csBackground ]:
            w.handlerID = w.connect("color_changed", self.OnColorChange)

        #get handles on checkboxes
        self.cbBold             = self.wTree.get_widget("cbBold")
        self.cbUnderline        = self.wTree.get_widget("cbUnderline")
        self.cbUndercurl        = self.wTree.get_widget("cbUndercurl")
        self.cbReverse          = self.wTree.get_widget("cbReverse")
        self.cbItalic           = self.wTree.get_widget("cbItalic")
        self.cbStandout         = self.wTree.get_widget("cbStandout")
        self.cbNone             = self.wTree.get_widget("cbNone")
        #connect "toggled" event
        for w in [ self.cbBold, self.cbUnderline, self.cbUndercurl, self.cbReverse, self.cbItalic,
                self.cbStandout, self.cbNone,  ]:
            w.handlerID = w.connect("toggled", self.OnCheckboxToggle)

        #get handles on foreground/background color buttons
        self.colorButtons = []
        for button in ['btFgFg', 'btFgBg', 'btBgFg', 'btBgBg', 'btFgNone', 'btBgNone']:
            self.colorButtons.append( self.wTree.get_widget(button) )
        #connect "color_changed" event
        for w in self.colorButtons:
            w.handlerID = w.connect("clicked", self.OnBtColorClicked)

        #get handles on background lignt/dark radiobuttons
        self.rbLight            =  self.wTree.get_widget('rbLight') 
        self.rbDark             =  self.wTree.get_widget('rbDark') 
        if self.GetBackground() == 'dark':
            self.rbDark.set_active(True)
        else:
            self.rbLight.set_active(True)
        #connect "toggled" event
        self.rbDark.handlerID   = self.rbDark.connect("toggled", self.OnRbBgToggled)
        self.rbLight.handlerID  = self.rbLight.connect("toggled", self.OnRbBgToggled)

        #handle undo/redo buttons
        self.undoStack = UndoStackButton(self.wTree.get_widget("tbUndo"))
        self.redoStack = UndoStackButton(self.wTree.get_widget("tbRedo"))

        #get handles on Metadata text entires
        self.entColorSchemeName = self.wTree.get_widget("entColorSchemeName")
        self.entMaintainer      = self.wTree.get_widget("entMaintainer")
        self.entEmail           = self.wTree.get_widget("entEmail")
        self.entVersion         = self.wTree.get_widget("entVersion")
        self.entURL             = self.wTree.get_widget("entURL")
        self.texLicense         = self.wTree.get_widget("texLicense").get_buffer()
        self.texNotes           = self.wTree.get_widget("texNotes").get_buffer()
        for w in [ self.entColorSchemeName, self.entMaintainer, self.entEmail,
                self.entVersion, self.entURL, self.texLicense, self.texNotes]:
            w.handlerID = w.connect("changed", self.MakeDirty)

        #set ordinals and names for the columns of our treeview
        self.colElement         = 0
        self.colFG              = 1
        self.colBG              = 2
        self.colAttr            = 3
        self.sElement           = "Element"
        self.sFG                = "Foreground"
        self.sBG                = "Background"
        self.sAttr              = "Attributes"

        #get the Vim highlights treeview
        self.tvVimHighlights    = self.wTree.get_widget("tvVimHighlights")

        #self.tvVimHighlights.set_vadjustment(gtk.Adjustment(value=1, lower=1, upper=1, step_incr=1, page_incr=1))
        #add the columns to the treeview
        #first, the Element column
        colm = gtk.TreeViewColumn(self.sElement, gtk.CellRendererText(), text=self.colElement)
        colm.set_resizable(True)
        colm.set_sort_column_id(self.colElement)
        self.tvVimHighlights.append_column(colm)
        self.tvVimHighlights.set_expander_column(colm)

        #second, the Foreground column
        colm = gtk.TreeViewColumn(self.sFG, gtk.CellRendererText(), text=self.colFG)
        colm.set_resizable(True)
        colm.set_sort_column_id(self.colFG)
        self.tvVimHighlights.append_column(colm)
        
        #third, the Background column
        colm = gtk.TreeViewColumn(self.sBG, gtk.CellRendererText(), text=self.colBG)
        colm.set_resizable(True)
        colm.set_sort_column_id(self.colBG)
        self.tvVimHighlights.append_column(colm)

        #fourth, the Attributes column
        colm = gtk.TreeViewColumn(self.sAttr, gtk.CellRendererText(), text=self.colAttr)
        colm.set_resizable(True)
        colm.set_sort_column_id(self.colAttr)
        self.tvVimHighlights.append_column(colm)

        #Create a TreeStore model to use with our treeview
        self.vimTreeStoreDict   = TreeStoreDict(str, str, str, str)
        #attach model to treeview
        self.tvVimHighlights.set_model(self.vimTreeStoreDict)
        #set the selection mode
        self.tvVimHighlights.get_selection().set_mode(gtk.SELECTION_BROWSE)
        #self.InsertEditorGroups()

        #determine Debug level:
        if not self.GetDebugLevel():
            logging.disable(1000) #turn off all debug messages
        #set up statusbars
        self.sbConnection       = self.wTree.get_widget("sbConnection")
        self.sbConnectionCtx    = self.sbConnection.get_context_id("sbConnectionCtx")
        self.sbConnection.push(self.sbConnectionCtx, "Connected to Vim instance %s" % self.serverName)

        self.sbColorsname       = self.wTree.get_widget("sbColorsname")
        self.sbColorsnameCtx    = self.sbColorsname.get_context_id("sbColorsnameCtx")
        self.colorSchemeName    = self.GetColorSchemeName()
        if self.colorSchemeName == 'Unnamed':
            self.sbColorsname.push(self.sbColorsnameCtx, "Editing unnamed color scheme")
        else:
            self.sbColorsname.push(self.sbColorsnameCtx, "Editing color scheme '%s'" % self.colorSchemeName)

        #get a handle to gtk.Settings object
        #self.set                = gtk.settings_get_for_screen(self.toplevel.get_screen())
        self.set = gtk.settings_get_default()

        # Add visible highlight groups to the list store:
        # also set the default palette for this colorscheme, if present
        try:
            self.PopulateHighlightTree()
            self.lockControls()
            self.GetMetadata()
            self.unlockControls()
        except VimRemoteException, vre:
            self.Disconnect()

    def PopulateHighlightTree(self):
        self.InsertEditorGroups()
        hl = {}
        firsttime = True
        #TODO: add exception handling
        for line in self.VimRemoteExec("CSE_GetAllHighlights()"):
            if line.isspace():
                continue

            if not line.startswith(' ') and not firsttime and (hl.has_key('hlName') or line.startswith('END')):
                if hl.has_key('cleared'):
                    parentName = 'cleared'
                    self.vimTreeStoreDict.append('cleared',
                        [hl['hlName'], '', '', ''])
                elif hl.has_key('link'):
                    parentName = hl['link']
                    self.vimTreeStoreDict.append(parentName,
                        [hl['hlName'], '', '', ''])
                    #TODO: fix this up - when would hl NOT have key 'hlName'?
                    #should I just say 'and hl.get('hlName', '') not in self.vimTreeStoreDict?
                elif hl.has_key('hlName') and hl['hlName'] not in self.vimTreeStoreDict:
                    self.vimTreeStoreDict.append(None, [hl.get('hlName', ''),
                        hl.get('fgcolor', ''),
                        hl.get('bgcolor', ''),
                        hl.get('guiattr', '')])
                else:
                    self.vimTreeStoreDict.set(hl.get('hlName', ''), self.colElement, hl.get('hlName', ''),
                        self.colFG, hl.get('fgcolor', ''),
                        self.colBG, hl.get('bgcolor', ''),
                        self.colAttr, hl.get('guiattr', ''))

                hl = {}

            guifg = self.re_guifg.search(line)
            guibg = self.re_guibg.search(line)
            gui   = self.re_gui.search(line)
            link  = self.re_link.search(line)
            clear = self.re_clear.search(line)

            #skip irrelevant lines
            if guifg == None and guibg == None and gui == None and link == None and clear == None:
                continue
            else:
                if not line.startswith(' '):
                    hl['hlName'] = line.split()[0]
                if guifg != None:
                    hl['fgcolor'] = guifg.group(1)
                if guibg != None:
                    hl['bgcolor'] = guibg.group(1)
                if gui != None:
                    hl['guiattr'] = gui.group(1)
                if link != None:
                    hl['link'] = link.group(1)
                if clear != None:
                    hl['cleared'] = True

            firsttime = False
        self.tvVimHighlights.collapse_all()

    def VimRemoteExec(self, command):
        """runs a command against the vim server"""
        cmd = [ 'vim', '--servername' , self.serverName , '--remote-expr', command]
        ret = []
        p = Popen(cmd, stdout=PIPE, stderr=STDOUT)

        chld_out = p.stdout
        #check for errors
        for line in chld_out:
            if line.startswith('E247') or line.startswith('E449'):
                raise VimRemoteException, line.strip()
            ret.append(line)
        return ret

    def SetCheckboxes(self, attrs):
        """set checkboxes according to contents of list attrs"""
        logging.debug( "ENTER SetCheckboxes()")
        self.ResetCheckboxes()
        logging.debug( "\t===UNCHECK cbNone===")
        self.cbNone.set_active(False)
        for attr in attrs:
            if attr == 'bold':
                logging.debug("\t===CHECK cbBold===")
                self.cbBold.set_active(True)
            elif attr == 'underline':
                logging.debug("\t===CHECK cbUnderline===")
                self.cbUnderline.set_active(True)
            elif attr == 'undercurl':
                logging.debug("\t===CHECK cbUndercurl===")
                self.cbUndercurl.set_active(True)
            elif attr == 'reverse' or attr == 'inverse':
                logging.debug("\t===CHECK cbReverse===")
                self.cbReverse.set_active(True)
            elif attr == 'italic':
                logging.debug("\t===CHECK cbItalic===")
                self.cbItalic.set_active(True)
            elif attr == 'standout':
                logging.debug("\t===CHECK cbStandout===")
                self.cbStandout.set_active(True)
            elif attr == 'NONE':
                self.ResetCheckboxes()
                logging.debug("\t===CHECK cbNone===")
                self.cbNone.set_active(True)
        logging.debug("EXIT  SetCheckboxes()")

    def ResetCheckboxes(self):
        """uncheck all Attribute checkboxes"""
        logging.debug("ENTER ResetCheckboxes()")
        for cb in [ self.cbBold, self.cbUnderline, self.cbUndercurl,
                self.cbReverse, self.cbItalic, self.cbStandout]:
            cb.set_active(False)
        logging.debug("EXIT ResetCheckboxes()")

    def ColorToString(self, gdkColor):
        """renders a gdkColor into a 24-bit color hex triplet string"""
        #print  "!!!ColorToString() BEFORE: #%X %X %X" % (gdkColor.red, gdkColor.green, gdkColor.blue)
        #print  "!!!ColorToString() AFTER : #%.2X%.2X%.2X" % (gdkColor.red / 256, gdkColor.green / 256, gdkColor.blue / 256)
        return  "#%.2X%.2X%.2X" % (gdkColor.red / 256, gdkColor.green / 256, gdkColor.blue / 256)
        
    def WriteColorScheme(self):
        """writes the contents of the listview out to a file"""
        if self.colorSchemeFile == '':
            return

        #test if file exists but is not writeable
        if os.access(self.colorSchemeFile, os.F_OK) and not os.access(self.colorSchemeFile, os.W_OK):
            msg = gtk.MessageDialog(parent=None, flags=gtk.DIALOG_MODAL,
                    type=gtk.MESSAGE_ERROR, buttons=gtk.BUTTONS_OK,
                    message_format="Write permission denied on file '%s'" % self.colorSchemeFile)
            msg.set_title("Error writing colorscheme")
            msg.run()
            msg.destroy()
            return

        lines = ['" Colorscheme created with ColorSchemeEditor %s\n' % self.version]
        #write out metadata lines
        metadata = {}
        name = self.entColorSchemeName.get_text()
        if 0 < len(name):
            lines.append('"Name: %s\n' % name)
            metadata['Name'] = name
            self.colorSchemeName = name
            #self.VimRemoteExec("let g:colors_name = self.colors_name")

        maintainer = self.entMaintainer.get_text()
        if 0 < len(maintainer):
            metadata['Maintainer'] = maintainer

        email = self.entEmail.get_text()
        if 0 < len(email):
            metadata['Email'] = email

        if len(maintainer) > 0 and len(email) > 0:
            lines.append('"Maintainer: %s <%s>\n' % (maintainer, email))
        elif len(maintainer) > 0:
            lines.append('"Maintainer: %s\n' % maintainer)
        else:
            lines.append('"Maintainer: %s\n' % email)

        ver = self.entVersion.get_text()
        if 0 < len(ver):
            metadata['Version'] = ver
            lines.append('"Version: %s\n' % ver)

        lastchanged = time.strftime('%Y %b %d')
        metadata['Last Change'] = lastchanged
        lines.append('"Last Change: %s\n' %lastchanged)

        url = self.entURL.get_text()
        if 0 < len(url):
            metadata['URL'] = url
            lines.append('"URL: %s\n' % url)

        #license
        s,e = self.texLicense.get_bounds()
        t = self.texLicense.get_text(s,e)
        if len(t) > 0 and not t.isspace():
            text = t.split("\n")
            metadata['License'] = [l for l in text]
            lines.append('"License: %s\n' % text[0])
            lines.extend( '"%s\n' % l for l in text[1:])
            lines.append("\n")

        #notes
        s,e = self.texNotes.get_bounds()
        t = self.texNotes.get_text(s,e)
        if len(t) > 0 and not t.isspace():
            text = t.split("\n")
            metadata['Notes'] = [l for l in text]
            lines.append('"Notes: %s\n' % text[0])
            lines.extend( '"%s\n' % l for l in text[1:])
            lines.append("\n")

        #custom palette
        metadata['Palette'] = self.set.get_property("gtk-color-palette")

        #write out boilerplate stuff, version checking, set g:colors_name, etc.
        if self.rbDark.get_active():
            lines.append("set background=dark\n")
        else:
            lines.append("set background=light\n")

        lines.append("if version > 580\n")
        lines.append("\thighlight clear\n")
        lines.append('\tif exists("syntax_on")\n')
        lines.append("\t\tsyntax reset\n")
        lines.append("\tendif\n")
        lines.append("endif\n")
        lines.append('let g:colors_name = "%s"\n\n' % self.colorSchemeName)
        
        def formCmd(item):
            """forms a :highlight command out of listview element"""
            iter = self.vimTreeStoreDict.get(item, None)
            if iter == None:
                return "highlight clear %s\n" % item
            parIter = self.vimTreeStoreDict.iter_parent(iter) 
            if parIter == None:
                hlName = self.vimTreeStoreDict.get_value(iter, self.colElement)
                if hlName == None:
                    hlName = ''
                fgStr  = self.vimTreeStoreDict.get_value(iter, self.colFG)
                if fgStr == None:
                    fgStr = ''
                bgStr  = self.vimTreeStoreDict.get_value(iter, self.colBG) 
                if bgStr == None:
                    bgStr = ''
                attrs  = self.vimTreeStoreDict.get_value(iter, self.colAttr)
                if attrs == None:
                    attrs = ''

                cmd = 'highlight ' + item
                if fgStr != '' and fgStr != 'NONE':
                    cmd += ' guifg=' + fgStr
                if bgStr != '' and bgStr != 'NONE':
                    cmd += ' guibg=' + bgStr
                if attrs != '' and attrs != 'NONE':
                    cmd += ' gui=' + attrs
                else:
                    cmd += ' gui=NONE'
                cmd += "\n"
            else:
                parName = self.vimTreeStoreDict.get_value(parIter, self.colElement)
                cmd = 'highlight link %s %s\n' % (item, parName)
            return cmd

        #write out v:version > 700 Editor highlighting groups
        lines.append('if v:version >= 700\n')
        for item in [ 'CursorColumn', 'CursorLine', 'Pmenu', 'PmenuSel',
                'PmenuSbar', 'PmenuThumb', 'SpellBad', 'SpellCap',
                'SpellLocal', 'SpellRare', 'TabLine', 'TabLineFill',
                'TabLineSel' ]:
            lines.append("\t" + formCmd(item))
        lines.append('endif\n')

        #write out v:version < 700 Editor highlighting groups
        for item in [ 'Cursor', 'CursorIM', 'DiffAdd', 'DiffChange',
                'DiffDelete', 'DiffText', 'Directory', 'ErrorMsg',
                'FoldColumn', 'Folded', 'IncSearch', 'LineNr', 'MatchParen',
                'ModeMsg', 'MoreMsg', 'NonText', 'Normal', 'Question', 'Search',
                'SignColumn', 'SpecialKey', 'StatusLine', 'StatusLineNC',
                'Title', 'VertSplit', 'Visual', 'VisualNOS', 'WarningMsg',
                'WildMenu' ]:
            lines.append(formCmd(item))

        #write out Preferred syntax highlighting groups
        for item in [ 'Boolean', 'Character', 'Comment', 'Conditional',
                'Constant', 'Debug', 'Define', 'Delimiter', 'Error',
                'Exception', 'Float', 'Function', 'Identifier', 'Ignore',
                'Include', 'Keyword', 'Label', 'Macro', 'Number', 'Operator',
                'PreCondit', 'PreProc', 'Repeat', 'Special', 'SpecialChar',
                'SpecialComment', 'Statement', 'StorageClass', 'String',
                'Structure', 'Tag', 'Todo', 'Type', 'Typedef', 'Underlined' ]:
            lines.append(formCmd(item))

        #dump metadata dictionary
        lines.append('\n\n"ColorScheme metadata{{{\nif v:version >= 700\n\tlet g:%s_Metadata = {\n' % self.colorSchemeName)
        for k in metadata.keys():
            if type(metadata[k]) == type([]) and len(metadata[k]) > 0:
                lines.append('\t\t\t\t\\"%s" : ["%s",\n' % (k, metadata[k][0]))
                lines.extend('\t\t\t\t\\"%s",\n' % l for l in metadata[k][1:])
                lines.append('\t\t\t\t\\],\n')
            else:
                lines.append('\t\t\t\t\\"%s" : "%s",\n' % (k, metadata[k]))
        lines.append('\t\t\t\t\\}\nendif\n"}}}\n')   

        #print modeline
        lines.append('" vim:set foldmethod=marker expandtab filetype=vim:\n')

        #write lines out to disk
        file = open(self.colorSchemeFile, 'w')
        file.writelines(lines)
        file.close()

        #reload the colorscheme
        self.VimRemoteExec("CSE_DoColorscheme('%s')" % self.colorSchemeFile)

        #update the Colorsname statusbar
        self.colorSchemeName    = self.GetColorSchemeName()
        if self.colorSchemeName == 'Unnamed':
            self.sbColorsname.push(self.sbColorsnameCtx, "Editing unnamed color scheme")
        else:
            self.sbColorsname.push(self.sbColorsnameCtx, "Editing color scheme '%s'" % self.colorSchemeName)

        #reset dirty bit
        self.dirty = False

    def GetColorSchemeName(self):
        colorsname = '0'
        try:
            for line in self.VimRemoteExec("CSE_GetColorSchemeName()"):
                if not line.isspace(): 
                    colorsname = line.strip()
        except VimRemoteException, vre:
            self.Disconnect()
        if colorsname == '0':
            return 'Unnamed'
        else:
            return colorsname

    def GetBackground(self):
        """Query Vim for the value of &background setting.  If in doubt, guess dark"""
        background = ''
        try:
            for line in self.VimRemoteExec("CSE_GetBackground()"):
                if not line.isspace(): 
                    background = line.strip()
                    break
        except VimRemoteException, vre:
            self.Disconnect()
        if background == '0':
            background = 'dark'
        return background

    def GetMetadata(self):
        metadata = {}
        try:
            for line in self.VimRemoteExec("CSE_GetMetadata()"):
                if not line.isspace(): 
                    metadata = eval(line.strip())
                    break
        except VimRemoteException, vre:
            self.Disconnect()

        #set color selection palette
        if metadata.has_key('Palette'):
            self.set.set_string_property("gtk-color-palette", metadata['Palette'], "")

        #set the metadata fields accordingly
        self.entColorSchemeName.set_text(metadata.get('Name', self.colorSchemeName))
        self.entMaintainer.set_text(metadata.get('Maintainer', ''))
        self.entEmail.set_text(metadata.get('Email', ''))
        self.entVersion.set_text(metadata.get('Version', ''))
        self.entURL.set_text(metadata.get('URL', ''))
        self.texLicense.set_text("\n".join(metadata.get('License', [])))
        self.texNotes.set_text("\n".join(metadata.get('Notes', [])))

    def GetDebugLevel(self):
        ret = False
        try:
            for line in self.VimRemoteExec("CSE_GetDebugMode()"):
                if line.isspace(): 
                    continue
                if 1 == int(line):
                    ret = True
                    break
                elif 0 == int(line):
                    ret = False
                    break
        except VimRemoteException:
            self.Disconnect()
            return ret
        #finally:  #no such thing in Python 2.4
        return ret

    def MakeDirty(self, widget, value=True):
        if not self.locked:
            self.dirty = value

    def Refresh(self):
        self.vimTreeStoreDict.clear()
        self.PopulateHighlightTree()
        self.lockControls()
        self.GetMetadata()
        self.unlockControls()

    def Disconnect(self):
        """Freeze the GUI when connection to Vim server is lost"""
        logging.info('Entered Disconnect()')
        if self.serverName == '':
            return

        self.colorSchemeName = ''
        self.serverName = ''

        #set statusbars to appropriate messages
        self.sbConnection.pop(self.sbConnectionCtx)
        self.sbConnection.push(self.sbConnectionCtx, "Disconnected")

        self.sbColorsname.pop(self.sbColorsnameCtx)
        self.sbColorsname.push(self.sbColorsnameCtx, "")

        #clear treeview
        self.vimTreeStoreDict.clear()

        #freeze undo/redo lists
        self.undoStack.disable()
        self.redoStack.disable()

        #make controls insensitive
        for w in self.colorButtons:
            w.set_sensitive(False)

        for w in [ 'btFgNone', 'btBgNone', 'tbRefresh' ]:
            self.wTree.get_widget(w).set_sensitive(False)

        for w in [ self.cbBold, self.cbUnderline, self.cbUndercurl, self.cbReverse, self.cbItalic,
                self.cbStandout, self.cbNone, self.csForeground, self.csBackground,
                self.rbDark, self.rbLight]:
            w.set_sensitive(False)
        logging.info('Returned from Disconnect()')

    def ParseVimHighlight(self, lines):
        """read the output of Vim's :highlight command and return a list:
            [hilight name, fg color, bg color, attributes]"""
        hl, firsttime = {}, True

        for line in lines:
            logging.debug("&&& ParseVimHighlight() line='%s'" % line)
            if line.isspace():
                continue

            guifg = self.re_guifg.search(line)
            guibg = self.re_guibg.search(line)
            gui   = self.re_gui.search(line)

            if not line.startswith(' '):
                hl['hlName'] = line.split()[0]

            #skip irrelevant lines
            if guifg == None and guibg == None and gui == None:
                continue

            if guifg != None:
                hl['fgcolor'] = guifg.group(1)
            else:
                hl['fgcolor'] = 'NONE'
            if guibg != None:
                hl['bgcolor'] = guibg.group(1)
            else:
                hl['bgcolor'] = 'NONE'
            if gui != None:
                hl['guiattr'] = gui.group(1)
            else:
                hl['guiattr'] = 'NONE'

        logging.debug('&&&ParseVimHighlight() returning:\n\thlName=%s guifg=%s guibg=%s gui=%s' % ( hl.get('hlName', ''), hl.get('fgcolor', ''), hl.get('bgcolor', ''), hl.get('guiattr', '') ))
        return hl.get('hlName', None), hl.get('fgcolor', 'NONE'), hl.get('bgcolor', 'NONE'), hl.get('guiattr', 'NONE')

    def PushChange(self, hlName, cmd, iter):
        """common code for all changes to go through:
            helps with undo/redo
            hlName - name of element we're fixing to change
            newVal - new value we want to assign
            iter   - iterator to currently selected item (push to undo stack)
            """
        logging.info("----------------------------------------")
        logging.info(traceback.format_stack())
        logging.info("----------------------------------------")
        #if we have a valid hlName and cmd
        if '' != cmd and '' != hlName: #treeview.has_key(hlName)
            #query Vim/treeview for current state
            try:
                hlName, fgcolor, bgcolor, guiattr = self.ParseVimHighlight(
                        self.VimRemoteExec( "CSE_GetHighlight('" + hlName + "')" ) )
            except VimRemoteException, rve:
                self.Disconnect()
                return
            #store current state on undoStack
            save = 'guifg=%s guibg=%s gui=%s' % (fgcolor, bgcolor, guiattr)
            #push the change over to Vim
            logging.debug( "PushChange() cmd='%s'" % cmd )
            try:
                self.VimRemoteExec(cmd)
            except VimRemoteException, rve:
                self.Disconnect()
                return
            #push old value onto the undo stack
            self.undoStack.push([hlName, save, iter])
            #clear the redo stack, since it's a stack, not a tree
            self.redoStack.clear()
            logging.debug( "%s\n%s\n" % (self.undoStack, self.redoStack) )
            #set the dirty flag
            self.dirty = True

    def InsertEditorGroups(self):
        for i in [ 'Cursor', 'CursorIM', 'CursorColumn', 'CursorLine',
                'DiffAdd', 'DiffChange', 'DiffDelete', 'DiffText', 'Directory',
                'ErrorMsg', 'FoldColumn', 'Folded', 'IncSearch', 'LineNr',
                'MatchParen', 'ModeMsg', 'MoreMsg', 'NonText', 'Normal',
                'Pmenu', 'PmenuSbar', 'PmenuSel', 'PmenuThumb', 'Question',
                'Search', 'SignColumn', 'SpecialKey', 'SpellBad', 'SpellCap',
                'SpellLocal', 'SpellRare', 'StatusLine', 'StatusLineNC',
                'TabLine', 'TabLineFill', 'TabLineSel', 'Title', 'VertSplit',
                'Visual', 'VisualNOS', 'WarningMsg', 'WildMenu', 
                'Boolean', 'Character', 'Comment', 'Conditional', 'Constant',
                'Debug', 'Define', 'Delimiter', 'Error', 'Exception', 'Float',
                'Function', 'Identifier', 'Ignore', 'Include', 'Keyword',
                'Label', 'Macro', 'Number', 'Operator', 'PreCondit', 'PreProc',
                'Repeat', 'Special', 'SpecialChar', 'SpecialComment',
                'Statement', 'StorageClass', 'String', 'Structure', 'Tag',
                'Todo', 'Type', 'Typedef', 'Underlined' ]:
            logging.error("\tinserting editor group %s" % i)
            self.vimTreeStoreDict.append(None, (i, '', '', ''))

    def lockControls(self):
        logging.debug( "LOCKING controls " )
        for w in [ self.cbBold, self.cbUnderline, self.cbUndercurl, self.cbReverse, self.cbItalic,
                self.cbStandout, self.cbNone, self.csForeground, self.csBackground, 
                self.entColorSchemeName, self.entMaintainer, self.entEmail,
               self.entVersion, self.entURL, self.texLicense, self.texNotes,
                self.rbLight, self.rbDark]:
            w.handler_block( w.handlerID )
        for w in self.colorButtons:
            w.handler_block( w.handlerID )
        self.locked = True
        logging.debug( "DONE LOCKING" )

    def unlockControls(self):
        logging.debug( "UNLOCKING controls ", )
        for w in [ self.cbBold, self.cbUnderline, self.cbUndercurl, self.cbReverse, self.cbItalic,
                self.cbStandout, self.cbNone, self.csForeground, self.csBackground, 
                self.entColorSchemeName, self.entMaintainer, self.entEmail,
               self.entVersion, self.entURL, self.texLicense, self.texNotes,
                self.rbLight, self.rbDark]:
            w.handler_unblock( w.handlerID )
        for w in self.colorButtons:
            w.handler_unblock( w.handlerID )
        self.locked = False
        logging.debug( "DONE UNLOCKING" )

    ###########################
    # EVENT HANDLER CALLBACKS #
    ###########################

    def OnRbBgToggled(self, widget):
        """Send the value of the active radiobutton to Vim"""
        if widget.get_active():
            if widget.name == 'rbLight':
                cmd = "CSE_SetBackground('light')"
            else:
                cmd = "CSE_SetBackground('dark')"
            try:
                #TODO: make this undoable
                #self.PushChange(hlName, cmd, iter)
                self.VimRemoteExec(cmd)
                self.Refresh()
            except VimRemoteException, rve:
                self.Disconnect()
                return
            #set the dirty flag
            self.dirty = True

    def OnBtColorClicked(self, widget):
        (model, iter) = self.tvVimHighlights.get_selection().get_selected()
        if iter == None:
            return

        update = None
        hlName = self.vimTreeStoreDict.get_value(iter, self.colElement)
        if 'btBgNone' == widget.name:
            self.vimTreeStoreDict.set_value(iter, self.colBG, 'NONE')
            cmd = "CSE_SetHighlight('" + hlName + "', 'guibg=NONE')"
        elif 'btFgNone' == widget.name:
            self.vimTreeStoreDict.set_value(iter, self.colFG, 'NONE')
            cmd =  "CSE_SetHighlight('" + hlName + "', 'guifg=NONE')"
        elif 'btFgFg' == widget.name and hlName != 'Normal':
            update = (self.csForeground, 1)
            self.vimTreeStoreDict.set_value(iter, self.colFG, 'fg')
            cmd =  "CSE_SetHighlight('" + hlName + "', 'guifg=fg')"
        elif 'btFgBg' == widget.name and hlName != 'Normal':
            update = (self.csForeground, 2)
            self.vimTreeStoreDict.set_value(iter, self.colFG, 'bg')
            cmd =  "CSE_SetHighlight('" + hlName + "', 'guifg=bg')"
        elif 'btBgFg' == widget.name and hlName != 'Normal':
            update = (self.csBackground, 1)
            self.vimTreeStoreDict.set_value(iter, self.colBG, 'fg')
            cmd =  "CSE_SetHighlight('" + hlName + "', 'guibg=fg')"
        elif 'btBgBg' == widget.name and hlName != 'Normal':
            update = (self.csBackground, 2)
            self.vimTreeStoreDict.set_value(iter, self.colBG, 'bg')
            cmd =  "CSE_SetHighlight('" + hlName + "', 'guibg=bg')"
        else:
            cmd = ''

        if '' != cmd:
            self.PushChange(hlName, cmd, iter)

        #update the color selector
        if None == update:
            return
        try:
            color = gtk.gdk.color_parse(
                    (self.ParseVimHighlight( self.VimRemoteExec( "CSE_GetHighlight('Normal')" ) ))[update[1]])
            logging.debug("gonna set %s to color %s" % update)
            self.lockControls()
            update[0].set_current_color(color)
            self.unlockControls()
        except VimRemoteException, vre:
                self.Disconnect()
        except ValueError, ve:
            pass

    def OnHighlightRowActivated(self, treeview, path, view_column):
        logging.debug( "ENTER OnHighlightRowActivated()" )
        (modl, iter) = treeview.get_selection().get_selected()
        #try:
        if None != iter:
            self.undoStack.lock()
            hlName = modl.get_value(iter, self.colElement)
            fgStr  = modl.get_value(iter, self.colFG)
            bgStr  = modl.get_value(iter, self.colBG) 
            attrs  = modl.get_value(iter, self.colAttr).split(',')

            self.lockControls()
            #set the current color for the ColorSelection widgets
            #print "FG is %s, BG is %s" % (fgStr, bgStr)
            if fgStr != '' and fgStr != 'bg' and fgStr != 'fg':
                foreground = gtk.gdk.color_parse(fgStr)
                self.csForeground.set_current_color(foreground)
            if bgStr != '' and bgStr != 'bg' and bgStr != 'fg':
                background = gtk.gdk.color_parse(bgStr)
                self.csBackground.set_current_color(background)

            #set checkboxes
            self.SetCheckboxes(attrs)
            self.unlockControls()

            #disble foreground/background buttons if user is editing Normal
            if hlName == 'Normal':
                for button in self.colorButtons:
                    button.set_sensitive(False)
            #this check is needed because of the way the exceptions are handled
            #with regard to the number of events fired
            #else
            elif self.serverName != '':
                for button in self.colorButtons:
                    button.set_sensitive(True)
            self.undoStack.unlock()

        else:
            logging.debug( "Odd, I couldn't get a selection" )
            return
        #except: pass
        logging.debug( "EXIT OnHighlightRowActivated()" )

    def OnColorChange(self, cs):
        """callback used when one of the color selectors is adjusted"""
        if cs.is_adjusting() or self.serverName == '':
            return
        else:
            (model, iter) = self.tvVimHighlights.get_selection().get_selected()
            if iter == None:
                return

            hlName = self.vimTreeStoreDict.get_value(iter, self.colElement)
            cmd = ''

            if cs.get_name().startswith('csFore'):
                colr = cs.get_current_color()
                colrs = self.ColorToString(colr)

                logging.debug( "r=%.4x g=%.4x b=%.4x" % (colr.red, colr.green, colr.blue) )
                colr24 = self.colormap.alloc_color(colr.red, colr.green, colr.blue, writeable=False, best_match=True)
                colr24s = self.ColorToString(colr24)

                logging.debug( "colrs='%s' colr24s='%s' colr24.pixel='%X'" % (colrs, colr24s, colr24.pixel) )
                if colrs != colr24s:
                    logging.warning( "the two colors' string representations differ!!")

                self.vimTreeStoreDict.set_value(iter, self.colFG, colr24s)
                cmd = "CSE_SetHighlight('%s', 'guifg=%s')" % (hlName, colr24s)
            else:
                colr = self.ColorToString(cs.get_current_color())
                logging.debug( "background color name is %s" % colr)
                self.vimTreeStoreDict.set_value(iter, self.colBG, self.ColorToString(cs.get_current_color()))
                cmd = "CSE_SetHighlight('%s', 'guibg=%s')" % (hlName, colr)
            self.PushChange(hlName, cmd, iter)

    def OnSave(self, widget):
        """Save current color scheme
        save to file if filename is known,
        open Save As... dialog if filename is unknown """
        if self.colorSchemeFile == '':
            self.OnSaveAs(widget)
        else:
            self.WriteColorScheme()
            self.dirty = False

    def OnSaveAs(self, widget):
        """display filechooser dialog, and load selected file"""
        dirs = []
        try:
            lines = self.VimRemoteExec('CSE_GetColorsDirs()')
            for l in lines:
                if l.isspace():
                    continue
                dirs.append(l.strip())
        except VimRemoteException, vre:
            pass

        #select the file name
        if len(dirs) > 0:
            #use the value in the metadata entry first
            if 0 < len(self.entColorSchemeName.get_text()):
                defaultName = self.colorSchemeName
            else:
                defaultName = self.colorSchemeName
            defPath = dirs[0] + os.path.sep + defaultName + '.vim'
            if not os.access(defPath, os.F_OK):
                defPath = ''
        else:
            defPath = ''
        saveAsDlg = FileChooser("Save As", dirs=dirs, defaultFile=defPath)
        #-5 == OK
        #-6 == Cancel
        result, filename = saveAsDlg.run()

        if (result == gtk.RESPONSE_OK):
            #the user clicked OK, so load the file
            logging.debug( "saving %s" % filename )
            self.colorSchemeFile = filename
            self.WriteColorScheme()
    
    def OnDeleteEvent(self, widget, event):
        logging.debug( "OnDeleteEvent() entered" )
        if not self.dirty:
            return False

        #gtk.RESPONSE_OK == -5
        #gtk.RESPONSE_CANCEL = -6

        dTree = gtk.glade.XML(gladefile, "dlgUnsavedChanges") 
        dlg = dTree.get_widget("dlgUnsavedChanges")
        result = dlg.run()
        dlg.destroy()
        if (result == gtk.RESPONSE_OK):
            logging.debug( "OnDeleteEvent() returning False" )
            self.dirty = False
            return False
        else:
            logging.debug( "OnDeleteEvent() returning True" )
            return True

    def OnQuit(self, widget):
        """Callback when user tries to exit program"""
        logging.debug( "OnQuit() entered" )
        if self.dirty:
            dTree = gtk.glade.XML(gladefile, "dlgUnsavedChanges") 
            dlg = dTree.get_widget("dlgUnsavedChanges")
            result = dlg.run()
            dlg.destroy()
            if (result == gtk.RESPONSE_OK):
                logging.debug( "OnQuit() calling gtk.main_quit()" )
                gtk.main_quit()
            else:
                logging.debug( "OnQuit() canceling quit" )
                return
        else:
            logging.debug( "OnQuit() calling gtk.main_quit()" )
            gtk.main_quit()

    def OnCheckboxToggle(self, widget):
        """callback upon toggling any one of the attribute checkboxes"""
        logging.debug( "***ENTER OnCheckboxToggle(%s)" % widget.name )
        (model, iter) = self.tvVimHighlights.get_selection().get_selected()
        if None == iter:
            logging.debug( "***EXIT EARLY OnCheckboxToggle(%s)" % widget.name )
            return
        attrStr = ''
        if 'cbNone' == widget.name:
            #if NONE is selected, remove all other attributes
            if widget.get_active():
                self.ResetCheckboxes()
                widget.set_active(True)
                attrStr = 'NONE'
                self.vimTreeStoreDict.set_value(iter, self.colAttr, attrStr)
        else:
            logging.debug( "\t===CHECK cbNone===" )
            self.cbNone.set_active(False) #reset NONE checkbox
            save = self.vimTreeStoreDict.get_value(iter, self.colAttr)
            attrs = save.split(',')
            attribute = widget.get_name().lstrip('cb').lower()
            if widget.get_active():
                if 'NONE' in attrs:
                    attrs.remove('NONE')
                if attribute not in attrs:
                    attrs.append(attribute)
            else:
                if attribute in attrs:
                    attrs.remove(attribute)

            #update the list
            attrStr = ','.join(attrs).lstrip(',')
            if attrStr == '':
                attrStr = 'NONE'
            self.vimTreeStoreDict.set_value(iter, self.colAttr, attrStr)
            #send the changes to vim
            hlName = self.vimTreeStoreDict.get_value(iter, self.colElement)
            cmd = "CSE_SetHighlight('%s', 'gui=%s')" % (hlName, attrStr)
            self.PushChange(hlName, cmd, iter)
        logging.debug( "***EXIT OnCheckboxToggle(%s)" % widget.name )

    def OnRefresh(self, widget):
        """callback when user refreshes the colorscheme from Vim """
        logging.debug( "Entered OnRefresh()" )
        try:
            self.Refresh()
            self.undoStack.clear()
            self.redoStack.clear()
            self.colorSchemeName = self.GetColorSchemeName()
            if self.GetBackground() == 'dark':
                self.rbDark.set_active(True)
            else:
                self.rbLight.set_active(True)
            self.sbColorsname.push(self.sbColorsnameCtx, "Editing color scheme '%s'" % self.colorSchemeName)
        except VimRemoteException, vre:
            self.Disconnect(), 
        logging.debug( "Left OnRefresh()" )

    def OnUndo(self, widget):
        """handle Undo/Redo action"""
        #decide whether we're doing the work of Undo or Redo
        action = ''
        if widget.name == 'tbUndo':
            undo = self.undoStack
            redo = self.redoStack
            act = "UNDOING"
        else:
            undo = self.redoStack
            redo = self.undoStack
            act = "REDOING"

        logging.debug( "=====================" )
        logging.debug( "Before %s:\n%s\n%s\n" % (act, self.undoStack, self.redoStack) )
        logging.debug( "gonna pop..." )
        action = undo.pop()
        if None == action:
            logging.debug( "no action to take, returning" )
            return
        undo.lock()
        hlName, arg, iter = action

        logging.debug( "|CURRENT ACTION|hlName='%s' arg='%s'" % (hlName, arg) )

        logging.debug( "\nSaving current state of %s for redo buffer" % hlName )
        #put the current state onto the redo stack
        try:
            lines = self.VimRemoteExec( "CSE_GetHighlight('" + hlName + "')" )
        except VimRemoteException, vre:
            self.Disconnect()
        redohlName, redofgcolor, redobgcolor, redoguiattr = self.ParseVimHighlight(lines)
        redoArg = "guifg=%s guibg=%s gui=%s" % (redofgcolor, redobgcolor, redoguiattr)
        logging.debug( "|REDO ACTION|hlName='%s' arg='%s'" % (hlName, redoArg) )
        redo.push([hlName, redoArg, iter])

        #perform the undo/redo on Vim
        logging.debug( "Calling Vimfunc SetHighlight()" )
        try:
            lines = self.VimRemoteExec( "CSE_SetHighlight('" + hlName + "', '" + arg + "')")
            hlName, fgcolor, bgcolor, guiattr = self.ParseVimHighlight(lines)

            logging.debug("OnUndo(): back from ParseVimHighlight()")
            #set listview's representation of this item according to what Vim sent back to us
            self.vimTreeStoreDict.set(hlName, self.colElement, hlName,
                    self.colFG, fgcolor,
                    self.colBG, bgcolor,
                    self.colAttr, guiattr)
        except VimRemoteException, vre:
            self.Disconnect()

        #if the item we just undid is the currently selected item, we should
        #update the controls
        selection = self.tvVimHighlights.get_selection()
        if selection.count_selected_rows() > 0 and selection.iter_is_selected(iter):
            logging.debug("OnUndo(); %s is the selected iter" % str(iter))
            redo.lock()
            self.lockControls()
            try:
                self.csForeground.set_current_color(gtk.gdk.color_parse(fgcolor))
            except ValueError, ve: pass
            try:
                self.csBackground.set_current_color(gtk.gdk.color_parse(bgcolor))
            except ValueError, ve: pass
            self.SetCheckboxes(guiattr.split(','))
            self.unlockControls()
            redo.unlock()
        undo.unlock()
        logging.debug( "After %s:\n%s\n%s\n" % (act, self.undoStack, self.redoStack) )
        logging.debug( "=====================" )

    def OnAbout(self, w):
        """Displays the About window"""
        wTree = gtk.glade.XML(gladefile, "aboutdialog")
        dialog = wTree.get_widget("aboutdialog")
        dialog.run()
        dialog.destroy()

    def OnHelp(self, w):
        try:
            self.VimRemoteExec('CSE_ShowHelp()')
        except VimRemoteException, vre:
            self.Disconnect()

    def OnConnect(self, widget):
        """ask user which Vim instance they wish to edit, and connect to it"""
        logging.debug( "OnConnect() entered" )
        if self.dirty:
            dTree = gtk.glade.XML(gladefile, "dlgUnsavedChanges") 
            dlg = dTree.get_widget("dlgUnsavedChanges")
            button = dTree.get_widget("btnQuit")
            button.set_use_stock(True)
            button.set_label("gtk-connect")

            result = dlg.run()
            dlg.destroy()
            if (result == gtk.RESPONSE_OK):
                logging.debug( "OnConnect() discarding changes" )
                cd = ConnectDialog()
                result, server = cd.run()
            else:
                logging.debug( "OnConnect() canceling" )
                return
        else:
            logging.debug( "OnConnect() discarding changes" )
            cd = ConnectDialog()
            result, server = cd.run()

        if (result == gtk.RESPONSE_OK):
            """the user clicked OK, try to connect to new instance"""
            oldServerName = self.serverName
            #see if instance exists
            try:
                #update value of self.serverName, test to see if server is available
                self.serverName = server
                self.VimRemoteExec("string('Hello World')")

            except VimRemoteException, vre:
                #display an error message
                self.serverName = oldServerName
                self.sbConnection.push(self.sbConnectionCtx, "Vim instance %s unavailable" % server)
                return

            #get colorSchemeName
            self.colorSchemeName = self.GetColorSchemeName()

            #reset statusbars
            self.sbConnection.push(self.sbConnectionCtx, "Connected to Vim instance %s" % self.serverName)
            if self.colorSchemeName == 'Unnamed':
                self.sbColorsname.push(self.sbColorsnameCtx, "Editing unnamed color scheme")
            else:
                self.sbColorsname.push(self.sbColorsnameCtx, "Editing color scheme '%s'" % self.colorSchemeName)

            #refresh treeview
            self.Refresh()

            #enable undo/redo buttons
            self.undoStack.enable()
            self.redoStack.enable()

            #clean out stacks
            self.undoStack.clear()
            self.redoStack.clear()

            #reset dirty flag
            self.dirty = False

            #make controls sensitive
            for w in self.colorButtons:
                w.set_sensitive(True)

            for w in [ 'btFgNone', 'btBgNone', 'tbRefresh' ]:
                self.wTree.get_widget(w).set_sensitive(True)

            for w in [ self.cbBold, self.cbUnderline, self.cbUndercurl, self.cbReverse, self.cbItalic,
                    self.cbStandout, self.cbNone, self.csForeground, self.csBackground, 
                    self.rbDark, self.rbLight]:
                w.set_sensitive(True)

            #set background radio buttons
            if self.GetBackground() == 'dark':
                self.rbDark.set_active(True)
            else:
                self.rbLight.set_active(True)

    def OnAdd(self, w):
        """Action to add element to treeview"""
        ad = AddDialog()
        result, hlName = ad.run()

        if (result == gtk.RESPONSE_OK):
            """the user clicked OK, so change the list"""
            self.vimTreeStoreDict.append(None, (hlName, '', '', ''))

    def OnRemove(self, w):
        """remove highlighted item from treeview"""
        (modl, iter) = self.tvVimHighlights.get_selection().get_selected()
        if None != iter:
            self.vimTreeStoreDict.remove(
                    self.vimTreeStoreDict.get_value(iter, self.colElement))

    def OnExpand(self, widget):
        self.tvVimHighlights.expand_all()

    def OnCollapse(self, widget):
        self.tvVimHighlights.collapse_all()

class FileChooser:
    def __init__(self, winTitle="Choose a file", dirs=[], defaultFile=''):
        self.winTitle = winTitle
        self.dirs = dirs
        self.defaultFile = defaultFile

    def OnKeypress(self, widget, event):
        if gtk.gdk.keyval_name(event.keyval) == 'Return':
            self.okButton.clicked()

    def run(self):
        """this function will show the FileChooser dialog"""
    
        #load teh dialog from teh glade
        self.wTree = gtk.glade.XML(gladefile, "filechooserdialog") 

        #get the actual dialog object
        self.dlg = self.wTree.get_widget("filechooserdialog")
        self.dlg.set_title(self.winTitle)
        if self.defaultFile != '':
            self.dlg.set_filename(self.defaultFile)
        self.dlg.set_do_overwrite_confirmation(True)
        self.dlg.connect('key_press_event', self.OnKeypress)
        self.okButton = self.wTree.get_widget('filechooserOK')

        if len(self.dirs) == 0:
            self.dlg.set_current_folder(os.getcwd())
        else:
            self.dlg.set_current_folder(self.dirs[0])
            for f in self.dirs:
                self.dlg.add_shortcut_folder(f)

        #run teh dialog and store teh response
        self.result = self.dlg.run()
        file = self.dlg.get_filename()

        #done with teh dialog, destroy
        self.dlg.destroy()

        return self.result, file

class AddDialog:
    def __init__(self):
        pass

    def run(self):
        """this function will show the Add Highlight dialog"""
    
        #load teh dialog from teh glade
        self.wTree = gtk.glade.XML(gladefile, "addHighlightDlg") 

        #get the actual dialog object
        self.dlg = self.wTree.get_widget("addHighlightDlg")
        self.entry = self.wTree.get_widget("entNameEdit")

        #run the dialog and store teh response
        self.result = self.dlg.run()
        hlName = self.entry.get_text()

        #done with teh dialog, destroy
        self.dlg.destroy()

        return self.result, hlName

class ConnectDialog:
    def __init__(self):
        pass

    def OnKeypress(self, widget, event):
        if gtk.gdk.keyval_name(event.keyval) == 'Return':
            self.okButton.clicked()

    def run(self):
        """this function will show the Connect to Vim Server dialog"""
    
        #load teh dialog from teh glade
        wTree = gtk.glade.XML(gladefile, "dlgConnect") 

        #get the actual dialog object
        dlg = wTree.get_widget("dlgConnect")
        dlg.connect('key_press_event', self.OnKeypress)
        self.okButton = wTree.get_widget("btConnectOK")

        #populate the drop-down box with names of available servers
        entry = wTree.get_widget("entServerName")
        cmd = ['vim', '--serverlist']
        p = Popen(cmd, stdout=PIPE, stderr=STDOUT)
        potentialServers = []
        for line in p.stdout:
            if line.isspace():
                continue
            else:
                server = line.strip()
                hasGuiCmd = ['vim', '--servername', server, '--remote-expr',  "has('gui')"]
                p2 = Popen(hasGuiCmd, stdout=PIPE, stderr=STDOUT)
                for line2 in p2.stdout:
                    if line2.isspace():
                        continue
                    else:
                        if 1 == int(line2):
                            entry.append_text(server)
        entry.set_active(0)

        #run the dialog and store the response
        result = dlg.run()
        server = entry.get_active_text()
        dlg.destroy()
        return result, server

class UndoStackButton:
    """Implements the undo/redo stack, and disables the button when no action can be taken"""

    def __init__(self, button):
        self.locked = False
        self.stack = []
        self.button = button
        self.button.set_sensitive(False)

    def __len__(self):
        return len(self.stack)

    def __str__(self):
        string = "%s(%d) " % (self.button.name, len(self.stack))
        if self.locked:
            string += "Locked"
        else:
            string += "Unlocked"

        for l in self.stack:
            string += "\n\t%s" % l
        return string

    def lock(self):
        self.locked = True

    def unlock(self):
        self.locked = False

    def push(self, action):
        if self.locked:
            return
        self.stack.append(action)
        if len(self.stack) == 1:
            self.button.set_sensitive(True)

    def pop(self):
        if self.locked:
            return None
        if len(self.stack) == 0:
            return None
        if len(self.stack) == 1:
            self.button.set_sensitive(False)
        return self.stack.pop()

    def clear(self):
        logging.debug( "clearing undo stack for %s" % self.button.name )
        if self.locked:
            return
        self.stack = []
        self.button.set_sensitive(False)

    def disable(self):
        self.stack = []
        self.button.set_sensitive(False)
        self.lock()

    def enable(self):
        self.button.set_sensitive(True)
        self.unlock()

class VimRemoteException(Exception):
    """Communication with Vim failed, or Vim threw an error"""
    def __init__(self, value):
        self.value = value

    def __str__(self):
        return repr(self.value)

class TreeStoreDict(gtk.TreeStore):
    """ It's a treestore, but has it's own dict 
        this helps it keep track of which elements have been added, so that only one of each item is present"""

    def __init__(self, *args):
        """ initialze the TreeStore object, and add a dict"""
        self.dict = {}
        gtk.TreeStore.__init__(self, *args)

    def __getitem__(self, key):
        """ method for dictionary lookup"""
        return self.dict.__getitem__(key)

    def __setitem__(self, key, value):
        """ method for dictionary assignment
        in this case, key is the Name of a highlight,
        its value is an iterator pointing to it """
        self.dict.__setitem__(key, value)

    def __delitem__(self, key):
        self.dict.__delitem__(key)

    def __len__(self):
        return len(self.dict)

    def keys(self):
        for key in self.dict.keys():
            yield key

    def clear(self):
        self.dict.clear()
        gtk.TreeStore.clear(self)

    def append(self, parent, value):
        """wraps treestore's append method
            parent is string name of parent of value we will append
            value is the list or tuple to append to tree
            
            New behavior is that if you try to append a node which already exists,
            the set() operation is used instead, so as to enforce the property that
            each Highlight Element is only in the tree once"""

        if value != None and value != []:
            name = value[0]
        else:
            name = ''

        #if the element is already in the tree
        if name in self.dict:
            iter = self.dict[name]
            parentIter = self.dict.get(parent, None)

            #if current node's parent is the same as the parameter parent, update values
            if self.iter_parent(iter) == parentIter:
                gtk.TreeStore.set(self, iter, 0, value[0], 
                        1, value[1],
                        2, value[2],
                        3, value[3])

            elif parentIter != iter:
                #remove it from it's old position
                gtk.TreeStore.remove(self, iter)
                #add updated node at root level
                iter = gtk.TreeStore.append(self, parentIter, value)
                self.dict[name] = iter

            else: 
                pass
                ##remove it from it's old position
                #gtk.TreeStore.remove(self, iter)
                ##add updated node under parent
                #print "name='%s' parent='%s'" % (name, parent)
                #iter = gtk.TreeStore.append(self, None, value)
                #self.dict[name] = iter


        #appending a brand-new node
        else:
            if parent == None:
                #TODO: make sure element isn't already in the tree; maybe it needs to be
                #TODO: moved under an existing node
                #add to treeview, make entry for this element in dict, return iterator
                iter = gtk.TreeStore.append(self, None, value)
                self.dict[name] = iter
            else:
                #look up iterator for "parent"
                if not self.dict.has_key(parent):
                    #if parent isn't in the dictionary, make an entry
                    logging.debug("Getting ahead of ourselves with %s=>%s" % (value[0], parent))
                    parentIter = gtk.TreeStore.append(self, None, (parent, '', '', ''))
                    self.dict[parent] = parentIter
                else:
                    parentIter = self.dict[parent]

                if value != None and value != []:
                    name = value[0]
                else:
                    name = ''
                iter = gtk.TreeStore.append(self, parentIter, value)
                self.dict[name] = iter
        return iter

    def remove(self, name):
        logging.debug("TreeStoreDict.remove(%s)" % name )
        iter = self.dict.__getitem__(name)
        self.dict.__delitem__(name)
        assert(name not in self.dict)
        gtk.TreeStore.remove(self, iter)

    def set(self, name, *values):
        """wraps TreeStore's set method"""
        logging.debug("TreeStoreDict.set(%s)" % name )
        iter = self.dict.get(name, False)
        logging.debug("iter = %s" % str(iter))
        if iter != False:
            logging.debug("again, iter = %s" % str(iter))
            gtk.TreeStore.set(self, iter, *values)
        else:
            logging.debug("what?  I thought that iter = %s" % str(iter))


    def __contains__(self, key):
        """ k in d """
        return self.dict.__contains__(key)

    def get(self, key, default):
        """d.get('key', 'defaultvalue')"""
        return self.dict.get(key, default)

if __name__ == "__main__":
    cse = ColorSchemeEditor()
    gtk.main()

# vim:set expandtab nosmartindent fileformat=unix:
