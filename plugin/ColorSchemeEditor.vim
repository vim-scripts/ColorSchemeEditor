PK     [Je8����Vf Vf    plugin/ColorSchemeEditor.glade<?xml version="1.0" standalone="no"?> <!--*- mode: xml -*-->
<!DOCTYPE glade-interface SYSTEM "http://glade.gnome.org/glade-2.0.dtd">

<glade-interface>

<widget class="GtkWindow" id="toplevel">
  <property name="visible">True</property>
  <property name="title" translatable="yes">GVim ColorSchemeEditor</property>
  <property name="type">GTK_WINDOW_TOPLEVEL</property>
  <property name="window_position">GTK_WIN_POS_NONE</property>
  <property name="modal">False</property>
  <property name="resizable">True</property>
  <property name="destroy_with_parent">False</property>
  <property name="decorated">True</property>
  <property name="skip_taskbar_hint">False</property>
  <property name="skip_pager_hint">False</property>
  <property name="type_hint">GDK_WINDOW_TYPE_HINT_NORMAL</property>
  <property name="gravity">GDK_GRAVITY_NORTH_WEST</property>
  <property name="focus_on_map">True</property>
  <property name="urgency_hint">False</property>
  <signal name="destroy" handler="on_toplevel_destroy"/>

  <child>
    <widget class="GtkVBox" id="vbox2">
      <property name="visible">True</property>
      <property name="homogeneous">False</property>
      <property name="spacing">0</property>

      <child>
	<widget class="GtkMenuBar" id="menubar1">
	  <property name="visible">True</property>
	  <property name="pack_direction">GTK_PACK_DIRECTION_LTR</property>
	  <property name="child_pack_direction">GTK_PACK_DIRECTION_LTR</property>

	  <child>
	    <widget class="GtkMenuItem" id="menuitem1">
	      <property name="visible">True</property>
	      <property name="label" translatable="yes">_File</property>
	      <property name="use_underline">True</property>

	      <child>
		<widget class="GtkMenu" id="menuitem1_menu">

		  <child>
		    <widget class="GtkImageMenuItem" id="connect1">
		      <property name="visible">True</property>
		      <property name="label">gtk-connect</property>
		      <property name="use_stock">True</property>
		      <signal name="activate" handler="on_menuConnect_activate"/>
		    </widget>
		  </child>

		  <child>
		    <widget class="GtkImageMenuItem" id="refresh">
		      <property name="visible">True</property>
		      <property name="label">gtk-refresh</property>
		      <property name="use_stock">True</property>
		      <signal name="activate" handler="on_refresh_activate"/>
		    </widget>
		  </child>

		  <child>
		    <widget class="GtkImageMenuItem" id="save1">
		      <property name="visible">True</property>
		      <property name="label">gtk-save</property>
		      <property name="use_stock">True</property>
		      <signal name="activate" handler="on_menuSave_activate"/>
		    </widget>
		  </child>

		  <child>
		    <widget class="GtkImageMenuItem" id="save_as1">
		      <property name="visible">True</property>
		      <property name="label">gtk-save-as</property>
		      <property name="use_stock">True</property>
		      <signal name="activate" handler="on_menuSaveAs_activate"/>
		    </widget>
		  </child>

		  <child>
		    <widget class="GtkSeparatorMenuItem" id="separatormenuitem1">
		      <property name="visible">True</property>
		    </widget>
		  </child>

		  <child>
		    <widget class="GtkImageMenuItem" id="quit1">
		      <property name="visible">True</property>
		      <property name="label">gtk-quit</property>
		      <property name="use_stock">True</property>
		      <signal name="activate" handler="on_menuQuit_activate"/>
		    </widget>
		  </child>
		</widget>
	      </child>
	    </widget>
	  </child>

	  <child>
	    <widget class="GtkMenuItem" id="menuitem2">
	      <property name="visible">True</property>
	      <property name="label" translatable="yes">_Edit</property>
	      <property name="use_underline">True</property>

	      <child>
		<widget class="GtkMenu" id="menuitem2_menu">

		  <child>
		    <widget class="GtkImageMenuItem" id="cut1">
		      <property name="visible">True</property>
		      <property name="sensitive">False</property>
		      <property name="label">gtk-cut</property>
		      <property name="use_stock">True</property>
		      <signal name="activate" handler="on_cut1_activate"/>
		    </widget>
		  </child>

		  <child>
		    <widget class="GtkImageMenuItem" id="copy1">
		      <property name="visible">True</property>
		      <property name="sensitive">False</property>
		      <property name="label">gtk-copy</property>
		      <property name="use_stock">True</property>
		      <signal name="activate" handler="on_copy1_activate"/>
		    </widget>
		  </child>

		  <child>
		    <widget class="GtkImageMenuItem" id="paste1">
		      <property name="visible">True</property>
		      <property name="sensitive">False</property>
		      <property name="label">gtk-paste</property>
		      <property name="use_stock">True</property>
		      <signal name="activate" handler="on_paste1_activate"/>
		    </widget>
		  </child>

		  <child>
		    <widget class="GtkImageMenuItem" id="delete1">
		      <property name="visible">True</property>
		      <property name="sensitive">False</property>
		      <property name="label">gtk-delete</property>
		      <property name="use_stock">True</property>
		      <signal name="activate" handler="on_delete1_activate"/>
		    </widget>
		  </child>
		</widget>
	      </child>
	    </widget>
	  </child>

	  <child>
	    <widget class="GtkMenuItem" id="menuitem4">
	      <property name="visible">True</property>
	      <property name="label" translatable="yes">_Help</property>
	      <property name="use_underline">True</property>

	      <child>
		<widget class="GtkMenu" id="menuitem4_menu">

		  <child>
		    <widget class="GtkMenuItem" id="help1">
		      <property name="visible">True</property>
		      <property name="tooltip" translatable="yes">Help file will appear in Vim</property>
		      <property name="label" translatable="yes">_Help</property>
		      <property name="use_underline">True</property>
		      <signal name="activate" handler="on_help1_activate"/>
		    </widget>
		  </child>

		  <child>
		    <widget class="GtkMenuItem" id="about1">
		      <property name="visible">True</property>
		      <property name="tooltip" translatable="yes">Information about this program</property>
		      <property name="label" translatable="yes">_About</property>
		      <property name="use_underline">True</property>
		      <signal name="activate" handler="on_about1_activate"/>
		    </widget>
		  </child>
		</widget>
	      </child>
	    </widget>
	  </child>
	</widget>
	<packing>
	  <property name="padding">0</property>
	  <property name="expand">False</property>
	  <property name="fill">False</property>
	</packing>
      </child>

      <child>
	<widget class="GtkToolbar" id="toolbar1">
	  <property name="visible">True</property>
	  <property name="orientation">GTK_ORIENTATION_HORIZONTAL</property>
	  <property name="toolbar_style">GTK_TOOLBAR_BOTH</property>
	  <property name="tooltips">True</property>
	  <property name="show_arrow">True</property>

	  <child>
	    <widget class="GtkToolButton" id="tbConnect">
	      <property name="visible">True</property>
	      <property name="stock_id">gtk-connect</property>
	      <property name="visible_horizontal">True</property>
	      <property name="visible_vertical">True</property>
	      <property name="is_important">False</property>
	      <signal name="clicked" handler="on_tbConnect_clicked"/>
	    </widget>
	    <packing>
	      <property name="expand">False</property>
	      <property name="homogeneous">True</property>
	    </packing>
	  </child>

	  <child>
	    <widget class="GtkToolButton" id="tbRefresh">
	      <property name="visible">True</property>
	      <property name="stock_id">gtk-refresh</property>
	      <property name="visible_horizontal">True</property>
	      <property name="visible_vertical">True</property>
	      <property name="is_important">False</property>
	      <signal name="clicked" handler="on_tbRefresh_clicked"/>
	    </widget>
	    <packing>
	      <property name="expand">False</property>
	      <property name="homogeneous">True</property>
	    </packing>
	  </child>

	  <child>
	    <widget class="GtkToolButton" id="tbSave">
	      <property name="visible">True</property>
	      <property name="stock_id">gtk-save</property>
	      <property name="visible_horizontal">True</property>
	      <property name="visible_vertical">True</property>
	      <property name="is_important">False</property>
	      <signal name="clicked" handler="on_tbSave_clicked"/>
	    </widget>
	    <packing>
	      <property name="expand">False</property>
	      <property name="homogeneous">True</property>
	    </packing>
	  </child>

	  <child>
	    <widget class="GtkToolButton" id="tbUndo">
	      <property name="visible">True</property>
	      <property name="stock_id">gtk-undo</property>
	      <property name="visible_horizontal">True</property>
	      <property name="visible_vertical">True</property>
	      <property name="is_important">False</property>
	      <signal name="clicked" handler="on_tbUndo_clicked"/>
	    </widget>
	    <packing>
	      <property name="expand">False</property>
	      <property name="homogeneous">True</property>
	    </packing>
	  </child>

	  <child>
	    <widget class="GtkToolButton" id="tbRedo">
	      <property name="visible">True</property>
	      <property name="stock_id">gtk-redo</property>
	      <property name="visible_horizontal">True</property>
	      <property name="visible_vertical">True</property>
	      <property name="is_important">False</property>
	      <signal name="clicked" handler="on_tbRedo_clicked"/>
	    </widget>
	    <packing>
	      <property name="expand">False</property>
	      <property name="homogeneous">True</property>
	    </packing>
	  </child>
	</widget>
	<packing>
	  <property name="padding">0</property>
	  <property name="expand">False</property>
	  <property name="fill">False</property>
	</packing>
      </child>

      <child>
	<widget class="GtkNotebook" id="notebook1">
	  <property name="visible">True</property>
	  <property name="can_focus">True</property>
	  <property name="show_tabs">True</property>
	  <property name="show_border">True</property>
	  <property name="tab_pos">GTK_POS_TOP</property>
	  <property name="scrollable">False</property>
	  <property name="enable_popup">False</property>

	  <child>
	    <widget class="GtkHBox" id="hbox1">
	      <property name="visible">True</property>
	      <property name="homogeneous">False</property>
	      <property name="spacing">0</property>

	      <child>
		<widget class="GtkVBox" id="vbox1">
		  <property name="visible">True</property>
		  <property name="homogeneous">False</property>
		  <property name="spacing">0</property>

		  <child>
		    <widget class="GtkScrolledWindow" id="scrolledwindow1">
		      <property name="width_request">340</property>
		      <property name="visible">True</property>
		      <property name="can_focus">True</property>
		      <property name="hscrollbar_policy">GTK_POLICY_AUTOMATIC</property>
		      <property name="vscrollbar_policy">GTK_POLICY_AUTOMATIC</property>
		      <property name="shadow_type">GTK_SHADOW_IN</property>
		      <property name="window_placement">GTK_CORNER_TOP_LEFT</property>

		      <child>
			<widget class="GtkTreeView" id="tvVimHighlights">
			  <property name="border_width">2</property>
			  <property name="visible">True</property>
			  <property name="can_focus">True</property>
			  <property name="headers_visible">True</property>
			  <property name="rules_hint">True</property>
			  <property name="reorderable">False</property>
			  <property name="enable_search">True</property>
			  <property name="fixed_height_mode">False</property>
			  <property name="hover_selection">False</property>
			  <property name="hover_expand">False</property>
			  <signal name="row_activated" handler="on_tvVimHighlights_row_activated"/>
			</widget>
		      </child>
		    </widget>
		    <packing>
		      <property name="padding">5</property>
		      <property name="expand">True</property>
		      <property name="fill">True</property>
		    </packing>
		  </child>

		  <child>
		    <widget class="GtkHBox" id="hbox2">
		      <property name="visible">True</property>
		      <property name="homogeneous">False</property>
		      <property name="spacing">0</property>

		      <child>
			<widget class="GtkButton" id="btExpand">
			  <property name="visible">True</property>
			  <property name="can_focus">True</property>
			  <property name="label" translatable="yes">Expand All</property>
			  <property name="use_underline">True</property>
			  <property name="relief">GTK_RELIEF_NORMAL</property>
			  <property name="focus_on_click">True</property>
			  <signal name="clicked" handler="on_btExpand_clicked"/>
			</widget>
			<packing>
			  <property name="padding">0</property>
			  <property name="expand">True</property>
			  <property name="fill">True</property>
			</packing>
		      </child>

		      <child>
			<widget class="GtkButton" id="btCollapse">
			  <property name="visible">True</property>
			  <property name="can_focus">True</property>
			  <property name="label" translatable="yes">Collapse All</property>
			  <property name="use_underline">True</property>
			  <property name="relief">GTK_RELIEF_NORMAL</property>
			  <property name="focus_on_click">True</property>
			  <signal name="clicked" handler="on_btCollapse_clicked"/>
			</widget>
			<packing>
			  <property name="padding">0</property>
			  <property name="expand">True</property>
			  <property name="fill">False</property>
			</packing>
		      </child>

		      <child>
			<widget class="GtkButton" id="btAdd">
			  <property name="visible">True</property>
			  <property name="can_focus">True</property>
			  <property name="label">gtk-add</property>
			  <property name="use_stock">True</property>
			  <property name="relief">GTK_RELIEF_NORMAL</property>
			  <property name="focus_on_click">True</property>
			  <signal name="clicked" handler="on_btAdd_clicked"/>
			</widget>
			<packing>
			  <property name="padding">0</property>
			  <property name="expand">True</property>
			  <property name="fill">False</property>
			</packing>
		      </child>

		      <child>
			<widget class="GtkButton" id="btRemove">
			  <property name="visible">True</property>
			  <property name="can_focus">True</property>
			  <property name="label">gtk-remove</property>
			  <property name="use_stock">True</property>
			  <property name="relief">GTK_RELIEF_NORMAL</property>
			  <property name="focus_on_click">True</property>
			  <signal name="clicked" handler="on_btRemove_clicked"/>
			</widget>
			<packing>
			  <property name="padding">0</property>
			  <property name="expand">True</property>
			  <property name="fill">False</property>
			</packing>
		      </child>
		    </widget>
		    <packing>
		      <property name="padding">0</property>
		      <property name="expand">False</property>
		      <property name="fill">False</property>
		    </packing>
		  </child>
		</widget>
		<packing>
		  <property name="padding">0</property>
		  <property name="expand">True</property>
		  <property name="fill">True</property>
		</packing>
	      </child>

	      <child>
		<widget class="GtkVBox" id="vbox5">
		  <property name="visible">True</property>
		  <property name="homogeneous">False</property>
		  <property name="spacing">0</property>

		  <child>
		    <widget class="GtkFrame" id="frame5">
		      <property name="border_width">1</property>
		      <property name="visible">True</property>
		      <property name="label_xalign">0</property>
		      <property name="label_yalign">0.5</property>
		      <property name="shadow_type">GTK_SHADOW_ETCHED_IN</property>

		      <child>
			<widget class="GtkAlignment" id="alignment5">
			  <property name="visible">True</property>
			  <property name="xalign">0.5</property>
			  <property name="yalign">0.5</property>
			  <property name="xscale">1</property>
			  <property name="yscale">1</property>
			  <property name="top_padding">0</property>
			  <property name="bottom_padding">0</property>
			  <property name="left_padding">12</property>
			  <property name="right_padding">0</property>

			  <child>
			    <widget class="GtkVBox" id="vbox6">
			      <property name="visible">True</property>
			      <property name="homogeneous">False</property>
			      <property name="spacing">0</property>

			      <child>
				<widget class="GtkColorSelection" id="csForeground">
				  <property name="border_width">2</property>
				  <property name="visible">True</property>
				  <property name="has_opacity_control">False</property>
				  <property name="has_palette">True</property>
				  <signal name="color_changed" handler="on_csForeground_color_changed"/>
				</widget>
				<packing>
				  <property name="padding">0</property>
				  <property name="expand">True</property>
				  <property name="fill">True</property>
				</packing>
			      </child>

			      <child>
				<widget class="GtkHBox" id="hbox7">
				  <property name="visible">True</property>
				  <property name="homogeneous">False</property>
				  <property name="spacing">0</property>

				  <child>
				    <widget class="GtkButton" id="btFgFg">
				      <property name="visible">True</property>
				      <property name="can_focus">True</property>
				      <property name="label" translatable="yes">Foreground</property>
				      <property name="use_underline">True</property>
				      <property name="relief">GTK_RELIEF_NORMAL</property>
				      <property name="focus_on_click">True</property>
				      <signal name="clicked" handler="on_btColor_clicked"/>
				    </widget>
				    <packing>
				      <property name="padding">0</property>
				      <property name="expand">True</property>
				      <property name="fill">False</property>
				    </packing>
				  </child>

				  <child>
				    <widget class="GtkButton" id="btFgBg">
				      <property name="visible">True</property>
				      <property name="can_focus">True</property>
				      <property name="label" translatable="yes">Background</property>
				      <property name="use_underline">True</property>
				      <property name="relief">GTK_RELIEF_NORMAL</property>
				      <property name="focus_on_click">True</property>
				      <signal name="clicked" handler="on_btColor_clicked"/>
				    </widget>
				    <packing>
				      <property name="padding">0</property>
				      <property name="expand">True</property>
				      <property name="fill">False</property>
				    </packing>
				  </child>

				  <child>
				    <widget class="GtkButton" id="btFgNone">
				      <property name="width_request">78</property>
				      <property name="height_request">32</property>
				      <property name="visible">True</property>
				      <property name="can_focus">True</property>
				      <property name="relief">GTK_RELIEF_NORMAL</property>
				      <property name="focus_on_click">False</property>
				      <signal name="clicked" handler="on_btColor_clicked"/>

				      <child>
					<widget class="GtkAlignment" id="alignment9">
					  <property name="visible">True</property>
					  <property name="xalign">0.5</property>
					  <property name="yalign">0.5</property>
					  <property name="xscale">0</property>
					  <property name="yscale">0</property>
					  <property name="top_padding">0</property>
					  <property name="bottom_padding">0</property>
					  <property name="left_padding">0</property>
					  <property name="right_padding">0</property>

					  <child>
					    <widget class="GtkHBox" id="hbox5">
					      <property name="visible">True</property>
					      <property name="homogeneous">False</property>
					      <property name="spacing">2</property>

					      <child>
						<widget class="GtkImage" id="image1">
						  <property name="visible">True</property>
						  <property name="stock">gtk-delete</property>
						  <property name="icon_size">4</property>
						  <property name="xalign">0.5</property>
						  <property name="yalign">0.5</property>
						  <property name="xpad">0</property>
						  <property name="ypad">0</property>
						</widget>
						<packing>
						  <property name="padding">0</property>
						  <property name="expand">False</property>
						  <property name="fill">False</property>
						</packing>
					      </child>

					      <child>
						<widget class="GtkLabel" id="label10">
						  <property name="visible">True</property>
						  <property name="label" translatable="yes">NONE</property>
						  <property name="use_underline">True</property>
						  <property name="use_markup">False</property>
						  <property name="justify">GTK_JUSTIFY_LEFT</property>
						  <property name="wrap">False</property>
						  <property name="selectable">False</property>
						  <property name="xalign">0.5</property>
						  <property name="yalign">0.5</property>
						  <property name="xpad">0</property>
						  <property name="ypad">0</property>
						  <property name="ellipsize">PANGO_ELLIPSIZE_NONE</property>
						  <property name="width_chars">-1</property>
						  <property name="single_line_mode">False</property>
						  <property name="angle">0</property>
						</widget>
						<packing>
						  <property name="padding">0</property>
						  <property name="expand">False</property>
						  <property name="fill">False</property>
						</packing>
					      </child>
					    </widget>
					  </child>
					</widget>
				      </child>
				    </widget>
				    <packing>
				      <property name="padding">0</property>
				      <property name="expand">True</property>
				      <property name="fill">False</property>
				    </packing>
				  </child>
				</widget>
				<packing>
				  <property name="padding">0</property>
				  <property name="expand">False</property>
				  <property name="fill">True</property>
				  <property name="pack_type">GTK_PACK_END</property>
				</packing>
			      </child>
			    </widget>
			  </child>
			</widget>
		      </child>

		      <child>
			<widget class="GtkLabel" id="label5">
			  <property name="visible">True</property>
			  <property name="label" translatable="yes">&lt;b&gt;Foreground Color&lt;/b&gt;</property>
			  <property name="use_underline">False</property>
			  <property name="use_markup">True</property>
			  <property name="justify">GTK_JUSTIFY_LEFT</property>
			  <property name="wrap">False</property>
			  <property name="selectable">False</property>
			  <property name="xalign">0.5</property>
			  <property name="yalign">0.5</property>
			  <property name="xpad">0</property>
			  <property name="ypad">0</property>
			  <property name="ellipsize">PANGO_ELLIPSIZE_NONE</property>
			  <property name="width_chars">-1</property>
			  <property name="single_line_mode">False</property>
			  <property name="angle">0</property>
			</widget>
			<packing>
			  <property name="type">label_item</property>
			</packing>
		      </child>
		    </widget>
		    <packing>
		      <property name="padding">5</property>
		      <property name="expand">True</property>
		      <property name="fill">True</property>
		    </packing>
		  </child>

		  <child>
		    <widget class="GtkFrame" id="frame6">
		      <property name="border_width">1</property>
		      <property name="visible">True</property>
		      <property name="label_xalign">0</property>
		      <property name="label_yalign">0.5</property>
		      <property name="shadow_type">GTK_SHADOW_ETCHED_IN</property>

		      <child>
			<widget class="GtkAlignment" id="alignment6">
			  <property name="visible">True</property>
			  <property name="xalign">0.5</property>
			  <property name="yalign">0.5</property>
			  <property name="xscale">1</property>
			  <property name="yscale">1</property>
			  <property name="top_padding">0</property>
			  <property name="bottom_padding">0</property>
			  <property name="left_padding">12</property>
			  <property name="right_padding">0</property>

			  <child>
			    <widget class="GtkVBox" id="vbox7">
			      <property name="visible">True</property>
			      <property name="homogeneous">False</property>
			      <property name="spacing">0</property>

			      <child>
				<widget class="GtkColorSelection" id="csBackground">
				  <property name="border_width">2</property>
				  <property name="visible">True</property>
				  <property name="has_opacity_control">False</property>
				  <property name="has_palette">True</property>
				  <signal name="color_changed" handler="on_csBackground_color_changed"/>
				</widget>
				<packing>
				  <property name="padding">0</property>
				  <property name="expand">True</property>
				  <property name="fill">True</property>
				</packing>
			      </child>

			      <child>
				<widget class="GtkHBox" id="hbox8">
				  <property name="visible">True</property>
				  <property name="homogeneous">False</property>
				  <property name="spacing">0</property>

				  <child>
				    <widget class="GtkButton" id="btBgFg">
				      <property name="visible">True</property>
				      <property name="can_focus">True</property>
				      <property name="label" translatable="yes">Foreground</property>
				      <property name="use_underline">True</property>
				      <property name="relief">GTK_RELIEF_NORMAL</property>
				      <property name="focus_on_click">True</property>
				      <signal name="clicked" handler="on_btColor_clicked"/>
				    </widget>
				    <packing>
				      <property name="padding">0</property>
				      <property name="expand">True</property>
				      <property name="fill">False</property>
				    </packing>
				  </child>

				  <child>
				    <widget class="GtkButton" id="btBgBg">
				      <property name="visible">True</property>
				      <property name="can_focus">True</property>
				      <property name="label" translatable="yes">Background</property>
				      <property name="use_underline">True</property>
				      <property name="relief">GTK_RELIEF_NORMAL</property>
				      <property name="focus_on_click">True</property>
				      <signal name="clicked" handler="on_btColor_clicked"/>
				    </widget>
				    <packing>
				      <property name="padding">0</property>
				      <property name="expand">True</property>
				      <property name="fill">False</property>
				    </packing>
				  </child>

				  <child>
				    <widget class="GtkButton" id="btBgNone">
				      <property name="width_request">78</property>
				      <property name="height_request">32</property>
				      <property name="visible">True</property>
				      <property name="can_focus">True</property>
				      <property name="relief">GTK_RELIEF_NORMAL</property>
				      <property name="focus_on_click">True</property>
				      <signal name="clicked" handler="on_btColor_clicked"/>

				      <child>
					<widget class="GtkAlignment" id="alignment10">
					  <property name="visible">True</property>
					  <property name="xalign">0.5</property>
					  <property name="yalign">0.5</property>
					  <property name="xscale">0</property>
					  <property name="yscale">0</property>
					  <property name="top_padding">0</property>
					  <property name="bottom_padding">0</property>
					  <property name="left_padding">0</property>
					  <property name="right_padding">0</property>

					  <child>
					    <widget class="GtkHBox" id="hbox6">
					      <property name="visible">True</property>
					      <property name="homogeneous">False</property>
					      <property name="spacing">2</property>

					      <child>
						<widget class="GtkImage" id="image2">
						  <property name="visible">True</property>
						  <property name="stock">gtk-delete</property>
						  <property name="icon_size">4</property>
						  <property name="xalign">0.5</property>
						  <property name="yalign">0.5</property>
						  <property name="xpad">0</property>
						  <property name="ypad">0</property>
						</widget>
						<packing>
						  <property name="padding">0</property>
						  <property name="expand">False</property>
						  <property name="fill">False</property>
						</packing>
					      </child>

					      <child>
						<widget class="GtkLabel" id="label11">
						  <property name="visible">True</property>
						  <property name="label" translatable="yes">NONE</property>
						  <property name="use_underline">True</property>
						  <property name="use_markup">False</property>
						  <property name="justify">GTK_JUSTIFY_LEFT</property>
						  <property name="wrap">False</property>
						  <property name="selectable">False</property>
						  <property name="xalign">0.5</property>
						  <property name="yalign">0.5</property>
						  <property name="xpad">0</property>
						  <property name="ypad">0</property>
						  <property name="ellipsize">PANGO_ELLIPSIZE_NONE</property>
						  <property name="width_chars">-1</property>
						  <property name="single_line_mode">False</property>
						  <property name="angle">0</property>
						</widget>
						<packing>
						  <property name="padding">0</property>
						  <property name="expand">False</property>
						  <property name="fill">False</property>
						</packing>
					      </child>
					    </widget>
					  </child>
					</widget>
				      </child>
				    </widget>
				    <packing>
				      <property name="padding">0</property>
				      <property name="expand">True</property>
				      <property name="fill">False</property>
				    </packing>
				  </child>
				</widget>
				<packing>
				  <property name="padding">0</property>
				  <property name="expand">False</property>
				  <property name="fill">False</property>
				</packing>
			      </child>
			    </widget>
			  </child>
			</widget>
		      </child>

		      <child>
			<widget class="GtkLabel" id="label9">
			  <property name="visible">True</property>
			  <property name="label" translatable="yes">&lt;b&gt;Background Color&lt;/b&gt;</property>
			  <property name="use_underline">False</property>
			  <property name="use_markup">True</property>
			  <property name="justify">GTK_JUSTIFY_LEFT</property>
			  <property name="wrap">False</property>
			  <property name="selectable">False</property>
			  <property name="xalign">0.5</property>
			  <property name="yalign">0.5</property>
			  <property name="xpad">0</property>
			  <property name="ypad">0</property>
			  <property name="ellipsize">PANGO_ELLIPSIZE_NONE</property>
			  <property name="width_chars">-1</property>
			  <property name="single_line_mode">False</property>
			  <property name="angle">0</property>
			</widget>
			<packing>
			  <property name="type">label_item</property>
			</packing>
		      </child>
		    </widget>
		    <packing>
		      <property name="padding">5</property>
		      <property name="expand">True</property>
		      <property name="fill">True</property>
		    </packing>
		  </child>

		  <child>
		    <widget class="GtkFrame" id="frame7">
		      <property name="border_width">1</property>
		      <property name="visible">True</property>
		      <property name="label_xalign">0</property>
		      <property name="label_yalign">0.5</property>
		      <property name="shadow_type">GTK_SHADOW_ETCHED_IN</property>

		      <child>
			<widget class="GtkAlignment" id="alignment7">
			  <property name="visible">True</property>
			  <property name="xalign">0.5</property>
			  <property name="yalign">0.5</property>
			  <property name="xscale">1</property>
			  <property name="yscale">1</property>
			  <property name="top_padding">0</property>
			  <property name="bottom_padding">0</property>
			  <property name="left_padding">12</property>
			  <property name="right_padding">0</property>

			  <child>
			    <widget class="GtkHBox" id="hbox3">
			      <property name="visible">True</property>
			      <property name="homogeneous">False</property>
			      <property name="spacing">0</property>

			      <child>
				<widget class="GtkCheckButton" id="cbBold">
				  <property name="visible">True</property>
				  <property name="can_focus">True</property>
				  <property name="label" translatable="yes">Bold</property>
				  <property name="use_underline">True</property>
				  <property name="relief">GTK_RELIEF_NORMAL</property>
				  <property name="focus_on_click">True</property>
				  <property name="active">False</property>
				  <property name="inconsistent">False</property>
				  <property name="draw_indicator">True</property>
				  <signal name="toggled" handler="on_cbattr_toggled"/>
				</widget>
				<packing>
				  <property name="padding">0</property>
				  <property name="expand">False</property>
				  <property name="fill">False</property>
				</packing>
			      </child>

			      <child>
				<widget class="GtkCheckButton" id="cbUnderline">
				  <property name="visible">True</property>
				  <property name="can_focus">True</property>
				  <property name="label" translatable="yes">Underline</property>
				  <property name="use_underline">True</property>
				  <property name="relief">GTK_RELIEF_NORMAL</property>
				  <property name="focus_on_click">True</property>
				  <property name="active">False</property>
				  <property name="inconsistent">False</property>
				  <property name="draw_indicator">True</property>
				  <signal name="toggled" handler="on_cbattr_toggled"/>
				</widget>
				<packing>
				  <property name="padding">0</property>
				  <property name="expand">False</property>
				  <property name="fill">False</property>
				</packing>
			      </child>

			      <child>
				<widget class="GtkCheckButton" id="cbUndercurl">
				  <property name="visible">True</property>
				  <property name="can_focus">True</property>
				  <property name="label" translatable="yes">Undercurl</property>
				  <property name="use_underline">True</property>
				  <property name="relief">GTK_RELIEF_NORMAL</property>
				  <property name="focus_on_click">True</property>
				  <property name="active">False</property>
				  <property name="inconsistent">False</property>
				  <property name="draw_indicator">True</property>
				  <signal name="toggled" handler="on_cbattr_toggled"/>
				</widget>
				<packing>
				  <property name="padding">0</property>
				  <property name="expand">False</property>
				  <property name="fill">False</property>
				</packing>
			      </child>

			      <child>
				<widget class="GtkCheckButton" id="cbReverse">
				  <property name="visible">True</property>
				  <property name="can_focus">True</property>
				  <property name="label" translatable="yes">Reverse</property>
				  <property name="use_underline">True</property>
				  <property name="relief">GTK_RELIEF_NORMAL</property>
				  <property name="focus_on_click">True</property>
				  <property name="active">False</property>
				  <property name="inconsistent">False</property>
				  <property name="draw_indicator">True</property>
				  <signal name="toggled" handler="on_cbattr_toggled"/>
				</widget>
				<packing>
				  <property name="padding">0</property>
				  <property name="expand">False</property>
				  <property name="fill">False</property>
				</packing>
			      </child>

			      <child>
				<widget class="GtkCheckButton" id="cbItalic">
				  <property name="visible">True</property>
				  <property name="can_focus">True</property>
				  <property name="label" translatable="yes">Italic</property>
				  <property name="use_underline">True</property>
				  <property name="relief">GTK_RELIEF_NORMAL</property>
				  <property name="focus_on_click">True</property>
				  <property name="active">False</property>
				  <property name="inconsistent">False</property>
				  <property name="draw_indicator">True</property>
				  <signal name="toggled" handler="on_cbattr_toggled"/>
				</widget>
				<packing>
				  <property name="padding">0</property>
				  <property name="expand">False</property>
				  <property name="fill">False</property>
				</packing>
			      </child>

			      <child>
				<widget class="GtkCheckButton" id="cbStandout">
				  <property name="visible">True</property>
				  <property name="can_focus">True</property>
				  <property name="label" translatable="yes">Standout</property>
				  <property name="use_underline">True</property>
				  <property name="relief">GTK_RELIEF_NORMAL</property>
				  <property name="focus_on_click">True</property>
				  <property name="active">False</property>
				  <property name="inconsistent">False</property>
				  <property name="draw_indicator">True</property>
				  <signal name="toggled" handler="on_cbattr_toggled"/>
				</widget>
				<packing>
				  <property name="padding">0</property>
				  <property name="expand">False</property>
				  <property name="fill">False</property>
				</packing>
			      </child>

			      <child>
				<widget class="GtkCheckButton" id="cbNone">
				  <property name="visible">True</property>
				  <property name="can_focus">True</property>
				  <property name="label" translatable="yes">NONE</property>
				  <property name="use_underline">True</property>
				  <property name="relief">GTK_RELIEF_NORMAL</property>
				  <property name="focus_on_click">True</property>
				  <property name="active">False</property>
				  <property name="inconsistent">False</property>
				  <property name="draw_indicator">True</property>
				  <signal name="toggled" handler="on_cbattr_toggled"/>
				</widget>
				<packing>
				  <property name="padding">0</property>
				  <property name="expand">False</property>
				  <property name="fill">False</property>
				</packing>
			      </child>
			    </widget>
			  </child>
			</widget>
		      </child>

		      <child>
			<widget class="GtkLabel" id="label7">
			  <property name="visible">True</property>
			  <property name="label" translatable="yes">&lt;b&gt;Attributes&lt;/b&gt;</property>
			  <property name="use_underline">False</property>
			  <property name="use_markup">True</property>
			  <property name="justify">GTK_JUSTIFY_LEFT</property>
			  <property name="wrap">False</property>
			  <property name="selectable">False</property>
			  <property name="xalign">0.5</property>
			  <property name="yalign">0.5</property>
			  <property name="xpad">0</property>
			  <property name="ypad">0</property>
			  <property name="ellipsize">PANGO_ELLIPSIZE_NONE</property>
			  <property name="width_chars">-1</property>
			  <property name="single_line_mode">False</property>
			  <property name="angle">0</property>
			</widget>
			<packing>
			  <property name="type">label_item</property>
			</packing>
		      </child>
		    </widget>
		    <packing>
		      <property name="padding">5</property>
		      <property name="expand">True</property>
		      <property name="fill">True</property>
		    </packing>
		  </child>

		  <child>
		    <widget class="GtkFrame" id="frame9">
		      <property name="visible">True</property>
		      <property name="label_xalign">0</property>
		      <property name="label_yalign">0.5</property>
		      <property name="shadow_type">GTK_SHADOW_ETCHED_IN</property>

		      <child>
			<widget class="GtkAlignment" id="alignment11">
			  <property name="visible">True</property>
			  <property name="xalign">0.5</property>
			  <property name="yalign">0.5</property>
			  <property name="xscale">1</property>
			  <property name="yscale">1</property>
			  <property name="top_padding">0</property>
			  <property name="bottom_padding">0</property>
			  <property name="left_padding">12</property>
			  <property name="right_padding">0</property>

			  <child>
			    <widget class="GtkHBox" id="hbox11">
			      <property name="visible">True</property>
			      <property name="homogeneous">False</property>
			      <property name="spacing">0</property>

			      <child>
				<widget class="GtkRadioButton" id="rbLight">
				  <property name="visible">True</property>
				  <property name="can_focus">True</property>
				  <property name="label" translatable="yes">light</property>
				  <property name="use_underline">True</property>
				  <property name="relief">GTK_RELIEF_NORMAL</property>
				  <property name="focus_on_click">True</property>
				  <property name="active">True</property>
				  <property name="inconsistent">False</property>
				  <property name="draw_indicator">True</property>
				  <signal name="toggled" handler="on_rbBg_toggled"/>
				</widget>
				<packing>
				  <property name="padding">10</property>
				  <property name="expand">False</property>
				  <property name="fill">False</property>
				</packing>
			      </child>

			      <child>
				<widget class="GtkRadioButton" id="rbDark">
				  <property name="visible">True</property>
				  <property name="can_focus">True</property>
				  <property name="label" translatable="yes">dark</property>
				  <property name="use_underline">True</property>
				  <property name="relief">GTK_RELIEF_NORMAL</property>
				  <property name="focus_on_click">True</property>
				  <property name="active">False</property>
				  <property name="inconsistent">False</property>
				  <property name="draw_indicator">True</property>
				  <property name="group">rbLight</property>
				  <signal name="toggled" handler="on_rbBg_toggled"/>
				</widget>
				<packing>
				  <property name="padding">10</property>
				  <property name="expand">False</property>
				  <property name="fill">False</property>
				</packing>
			      </child>
			    </widget>
			  </child>
			</widget>
		      </child>

		      <child>
			<widget class="GtkLabel" id="label23">
			  <property name="visible">True</property>
			  <property name="label" translatable="yes">&lt;b&gt;:set background=&lt;/b&gt;</property>
			  <property name="use_underline">False</property>
			  <property name="use_markup">True</property>
			  <property name="justify">GTK_JUSTIFY_LEFT</property>
			  <property name="wrap">False</property>
			  <property name="selectable">False</property>
			  <property name="xalign">0.5</property>
			  <property name="yalign">0.5</property>
			  <property name="xpad">0</property>
			  <property name="ypad">0</property>
			  <property name="ellipsize">PANGO_ELLIPSIZE_NONE</property>
			  <property name="width_chars">-1</property>
			  <property name="single_line_mode">False</property>
			  <property name="angle">0</property>
			</widget>
			<packing>
			  <property name="type">label_item</property>
			</packing>
		      </child>
		    </widget>
		    <packing>
		      <property name="padding">0</property>
		      <property name="expand">True</property>
		      <property name="fill">True</property>
		    </packing>
		  </child>

		  <child>
		    <widget class="GtkFrame" id="frame8">
		      <property name="border_width">1</property>
		      <property name="label_xalign">0</property>
		      <property name="label_yalign">0.5</property>
		      <property name="shadow_type">GTK_SHADOW_ETCHED_IN</property>

		      <child>
			<widget class="GtkAlignment" id="alignment8">
			  <property name="visible">True</property>
			  <property name="xalign">0.5</property>
			  <property name="yalign">0.5</property>
			  <property name="xscale">1</property>
			  <property name="yscale">1</property>
			  <property name="top_padding">0</property>
			  <property name="bottom_padding">0</property>
			  <property name="left_padding">12</property>
			  <property name="right_padding">0</property>

			  <child>
			    <widget class="GtkScrolledWindow" id="scrolledwindow4">
			      <property name="visible">True</property>
			      <property name="can_focus">True</property>
			      <property name="hscrollbar_policy">GTK_POLICY_ALWAYS</property>
			      <property name="vscrollbar_policy">GTK_POLICY_ALWAYS</property>
			      <property name="shadow_type">GTK_SHADOW_IN</property>
			      <property name="window_placement">GTK_CORNER_TOP_LEFT</property>

			      <child>
				<widget class="GtkTreeView" id="treeview2">
				  <property name="visible">True</property>
				  <property name="can_focus">True</property>
				  <property name="headers_visible">True</property>
				  <property name="rules_hint">False</property>
				  <property name="reorderable">False</property>
				  <property name="enable_search">True</property>
				  <property name="fixed_height_mode">False</property>
				  <property name="hover_selection">False</property>
				  <property name="hover_expand">False</property>
				</widget>
			      </child>
			    </widget>
			  </child>
			</widget>
		      </child>

		      <child>
			<widget class="GtkLabel" id="label8">
			  <property name="visible">True</property>
			  <property name="label" translatable="yes">&lt;b&gt;Named Colors&lt;/b&gt;</property>
			  <property name="use_underline">False</property>
			  <property name="use_markup">True</property>
			  <property name="justify">GTK_JUSTIFY_LEFT</property>
			  <property name="wrap">False</property>
			  <property name="selectable">False</property>
			  <property name="xalign">0.5</property>
			  <property name="yalign">0.5</property>
			  <property name="xpad">0</property>
			  <property name="ypad">0</property>
			  <property name="ellipsize">PANGO_ELLIPSIZE_NONE</property>
			  <property name="width_chars">-1</property>
			  <property name="single_line_mode">False</property>
			  <property name="angle">0</property>
			</widget>
			<packing>
			  <property name="type">label_item</property>
			</packing>
		      </child>
		    </widget>
		    <packing>
		      <property name="padding">0</property>
		      <property name="expand">True</property>
		      <property name="fill">True</property>
		    </packing>
		  </child>
		</widget>
		<packing>
		  <property name="padding">0</property>
		  <property name="expand">True</property>
		  <property name="fill">True</property>
		</packing>
	      </child>
	    </widget>
	    <packing>
	      <property name="tab_expand">False</property>
	      <property name="tab_fill">True</property>
	    </packing>
	  </child>

	  <child>
	    <widget class="GtkLabel" id="label13">
	      <property name="visible">True</property>
	      <property name="label" translatable="yes">GUI Highlight Elements</property>
	      <property name="use_underline">False</property>
	      <property name="use_markup">False</property>
	      <property name="justify">GTK_JUSTIFY_LEFT</property>
	      <property name="wrap">False</property>
	      <property name="selectable">False</property>
	      <property name="xalign">0.5</property>
	      <property name="yalign">0.5</property>
	      <property name="xpad">0</property>
	      <property name="ypad">0</property>
	      <property name="ellipsize">PANGO_ELLIPSIZE_NONE</property>
	      <property name="width_chars">-1</property>
	      <property name="single_line_mode">False</property>
	      <property name="angle">0</property>
	    </widget>
	    <packing>
	      <property name="type">tab</property>
	    </packing>
	  </child>

	  <child>
	    <widget class="GtkTable" id="table6">
	      <property name="border_width">4</property>
	      <property name="visible">True</property>
	      <property name="n_rows">7</property>
	      <property name="n_columns">2</property>
	      <property name="homogeneous">False</property>
	      <property name="row_spacing">2</property>
	      <property name="column_spacing">20</property>

	      <child>
		<widget class="GtkLabel" id="label20">
		  <property name="visible">True</property>
		  <property name="label" translatable="yes">License</property>
		  <property name="use_underline">False</property>
		  <property name="use_markup">False</property>
		  <property name="justify">GTK_JUSTIFY_LEFT</property>
		  <property name="wrap">False</property>
		  <property name="selectable">False</property>
		  <property name="xalign">0</property>
		  <property name="yalign">0</property>
		  <property name="xpad">0</property>
		  <property name="ypad">0</property>
		  <property name="ellipsize">PANGO_ELLIPSIZE_NONE</property>
		  <property name="width_chars">-1</property>
		  <property name="single_line_mode">False</property>
		  <property name="angle">0</property>
		</widget>
		<packing>
		  <property name="left_attach">0</property>
		  <property name="right_attach">1</property>
		  <property name="top_attach">5</property>
		  <property name="bottom_attach">6</property>
		  <property name="x_options"></property>
		  <property name="y_options"></property>
		</packing>
	      </child>

	      <child>
		<widget class="GtkLabel" id="label21">
		  <property name="visible">True</property>
		  <property name="label" translatable="yes">Notes</property>
		  <property name="use_underline">False</property>
		  <property name="use_markup">False</property>
		  <property name="justify">GTK_JUSTIFY_LEFT</property>
		  <property name="wrap">False</property>
		  <property name="selectable">False</property>
		  <property name="xalign">0</property>
		  <property name="yalign">0</property>
		  <property name="xpad">0</property>
		  <property name="ypad">0</property>
		  <property name="ellipsize">PANGO_ELLIPSIZE_NONE</property>
		  <property name="width_chars">-1</property>
		  <property name="single_line_mode">False</property>
		  <property name="angle">0</property>
		</widget>
		<packing>
		  <property name="left_attach">0</property>
		  <property name="right_attach">1</property>
		  <property name="top_attach">6</property>
		  <property name="bottom_attach">7</property>
		  <property name="x_options"></property>
		  <property name="y_options"></property>
		</packing>
	      </child>

	      <child>
		<widget class="GtkEntry" id="entMaintainer">
		  <property name="visible">True</property>
		  <property name="can_focus">True</property>
		  <property name="editable">True</property>
		  <property name="visibility">True</property>
		  <property name="max_length">0</property>
		  <property name="text" translatable="yes"></property>
		  <property name="has_frame">True</property>
		  <property name="invisible_char">*</property>
		  <property name="activates_default">False</property>
		  <signal name="changed" handler="on_text_changed"/>
		</widget>
		<packing>
		  <property name="left_attach">1</property>
		  <property name="right_attach">2</property>
		  <property name="top_attach">1</property>
		  <property name="bottom_attach">2</property>
		  <property name="y_options"></property>
		</packing>
	      </child>

	      <child>
		<widget class="GtkEntry" id="entEmail">
		  <property name="visible">True</property>
		  <property name="can_focus">True</property>
		  <property name="editable">True</property>
		  <property name="visibility">True</property>
		  <property name="max_length">0</property>
		  <property name="text" translatable="yes"></property>
		  <property name="has_frame">True</property>
		  <property name="invisible_char">*</property>
		  <property name="activates_default">False</property>
		  <signal name="changed" handler="on_text_changed"/>
		</widget>
		<packing>
		  <property name="left_attach">1</property>
		  <property name="right_attach">2</property>
		  <property name="top_attach">2</property>
		  <property name="bottom_attach">3</property>
		  <property name="y_options"></property>
		</packing>
	      </child>

	      <child>
		<widget class="GtkEntry" id="entVersion">
		  <property name="visible">True</property>
		  <property name="can_focus">True</property>
		  <property name="editable">True</property>
		  <property name="visibility">True</property>
		  <property name="max_length">0</property>
		  <property name="text" translatable="yes"></property>
		  <property name="has_frame">True</property>
		  <property name="invisible_char">*</property>
		  <property name="activates_default">False</property>
		  <signal name="changed" handler="on_text_changed"/>
		</widget>
		<packing>
		  <property name="left_attach">1</property>
		  <property name="right_attach">2</property>
		  <property name="top_attach">3</property>
		  <property name="bottom_attach">4</property>
		  <property name="y_options"></property>
		</packing>
	      </child>

	      <child>
		<widget class="GtkEntry" id="entURL">
		  <property name="visible">True</property>
		  <property name="can_focus">True</property>
		  <property name="editable">True</property>
		  <property name="visibility">True</property>
		  <property name="max_length">0</property>
		  <property name="text" translatable="yes"></property>
		  <property name="has_frame">True</property>
		  <property name="invisible_char">*</property>
		  <property name="activates_default">False</property>
		  <signal name="changed" handler="on_text_changed"/>
		</widget>
		<packing>
		  <property name="left_attach">1</property>
		  <property name="right_attach">2</property>
		  <property name="top_attach">4</property>
		  <property name="bottom_attach">5</property>
		  <property name="y_options"></property>
		</packing>
	      </child>

	      <child>
		<widget class="GtkLabel" id="label19">
		  <property name="visible">True</property>
		  <property name="label" translatable="yes">URL</property>
		  <property name="use_underline">False</property>
		  <property name="use_markup">False</property>
		  <property name="justify">GTK_JUSTIFY_LEFT</property>
		  <property name="wrap">False</property>
		  <property name="selectable">False</property>
		  <property name="xalign">0</property>
		  <property name="yalign">0.5</property>
		  <property name="xpad">0</property>
		  <property name="ypad">0</property>
		  <property name="ellipsize">PANGO_ELLIPSIZE_NONE</property>
		  <property name="width_chars">-1</property>
		  <property name="single_line_mode">False</property>
		  <property name="angle">0</property>
		</widget>
		<packing>
		  <property name="left_attach">0</property>
		  <property name="right_attach">1</property>
		  <property name="top_attach">4</property>
		  <property name="bottom_attach">5</property>
		  <property name="x_options"></property>
		  <property name="y_options"></property>
		</packing>
	      </child>

	      <child>
		<widget class="GtkLabel" id="label18">
		  <property name="visible">True</property>
		  <property name="label" translatable="yes">Version</property>
		  <property name="use_underline">False</property>
		  <property name="use_markup">False</property>
		  <property name="justify">GTK_JUSTIFY_LEFT</property>
		  <property name="wrap">False</property>
		  <property name="selectable">False</property>
		  <property name="xalign">0</property>
		  <property name="yalign">0.5</property>
		  <property name="xpad">0</property>
		  <property name="ypad">0</property>
		  <property name="ellipsize">PANGO_ELLIPSIZE_NONE</property>
		  <property name="width_chars">-1</property>
		  <property name="single_line_mode">False</property>
		  <property name="angle">0</property>
		</widget>
		<packing>
		  <property name="left_attach">0</property>
		  <property name="right_attach">1</property>
		  <property name="top_attach">3</property>
		  <property name="bottom_attach">4</property>
		  <property name="x_options"></property>
		  <property name="y_options"></property>
		</packing>
	      </child>

	      <child>
		<widget class="GtkLabel" id="label17">
		  <property name="visible">True</property>
		  <property name="label" translatable="yes">Email Address</property>
		  <property name="use_underline">False</property>
		  <property name="use_markup">False</property>
		  <property name="justify">GTK_JUSTIFY_LEFT</property>
		  <property name="wrap">False</property>
		  <property name="selectable">False</property>
		  <property name="xalign">0</property>
		  <property name="yalign">0.5</property>
		  <property name="xpad">0</property>
		  <property name="ypad">0</property>
		  <property name="ellipsize">PANGO_ELLIPSIZE_NONE</property>
		  <property name="width_chars">-1</property>
		  <property name="single_line_mode">False</property>
		  <property name="angle">0</property>
		</widget>
		<packing>
		  <property name="left_attach">0</property>
		  <property name="right_attach">1</property>
		  <property name="top_attach">2</property>
		  <property name="bottom_attach">3</property>
		  <property name="x_options"></property>
		  <property name="y_options"></property>
		</packing>
	      </child>

	      <child>
		<widget class="GtkLabel" id="label16">
		  <property name="visible">True</property>
		  <property name="label" translatable="yes">Maintainer</property>
		  <property name="use_underline">False</property>
		  <property name="use_markup">False</property>
		  <property name="justify">GTK_JUSTIFY_LEFT</property>
		  <property name="wrap">False</property>
		  <property name="selectable">False</property>
		  <property name="xalign">0</property>
		  <property name="yalign">0.5</property>
		  <property name="xpad">0</property>
		  <property name="ypad">0</property>
		  <property name="ellipsize">PANGO_ELLIPSIZE_NONE</property>
		  <property name="width_chars">-1</property>
		  <property name="single_line_mode">False</property>
		  <property name="angle">0</property>
		</widget>
		<packing>
		  <property name="left_attach">0</property>
		  <property name="right_attach">1</property>
		  <property name="top_attach">1</property>
		  <property name="bottom_attach">2</property>
		  <property name="x_options"></property>
		  <property name="y_options"></property>
		</packing>
	      </child>

	      <child>
		<widget class="GtkEntry" id="entColorSchemeName">
		  <property name="visible">True</property>
		  <property name="can_focus">True</property>
		  <property name="editable">True</property>
		  <property name="visibility">True</property>
		  <property name="max_length">0</property>
		  <property name="text" translatable="yes"></property>
		  <property name="has_frame">True</property>
		  <property name="invisible_char">*</property>
		  <property name="activates_default">False</property>
		  <signal name="changed" handler="on_text_changed"/>
		</widget>
		<packing>
		  <property name="left_attach">1</property>
		  <property name="right_attach">2</property>
		  <property name="top_attach">0</property>
		  <property name="bottom_attach">1</property>
		  <property name="y_options"></property>
		</packing>
	      </child>

	      <child>
		<widget class="GtkLabel" id="label15">
		  <property name="visible">True</property>
		  <property name="label" translatable="yes">Color scheme name</property>
		  <property name="use_underline">False</property>
		  <property name="use_markup">False</property>
		  <property name="justify">GTK_JUSTIFY_LEFT</property>
		  <property name="wrap">False</property>
		  <property name="selectable">False</property>
		  <property name="xalign">0</property>
		  <property name="yalign">0.5</property>
		  <property name="xpad">0</property>
		  <property name="ypad">0</property>
		  <property name="ellipsize">PANGO_ELLIPSIZE_NONE</property>
		  <property name="width_chars">-1</property>
		  <property name="single_line_mode">False</property>
		  <property name="angle">0</property>
		</widget>
		<packing>
		  <property name="left_attach">0</property>
		  <property name="right_attach">1</property>
		  <property name="top_attach">0</property>
		  <property name="bottom_attach">1</property>
		  <property name="x_options"></property>
		  <property name="y_options"></property>
		</packing>
	      </child>

	      <child>
		<widget class="GtkScrolledWindow" id="scrolledwindow6">
		  <property name="visible">True</property>
		  <property name="can_focus">True</property>
		  <property name="hscrollbar_policy">GTK_POLICY_ALWAYS</property>
		  <property name="vscrollbar_policy">GTK_POLICY_ALWAYS</property>
		  <property name="shadow_type">GTK_SHADOW_IN</property>
		  <property name="window_placement">GTK_CORNER_TOP_LEFT</property>

		  <child>
		    <widget class="GtkTextView" id="texLicense">
		      <property name="height_request">100</property>
		      <property name="visible">True</property>
		      <property name="can_focus">True</property>
		      <property name="editable">True</property>
		      <property name="overwrite">False</property>
		      <property name="accepts_tab">True</property>
		      <property name="justification">GTK_JUSTIFY_LEFT</property>
		      <property name="wrap_mode">GTK_WRAP_NONE</property>
		      <property name="cursor_visible">True</property>
		      <property name="pixels_above_lines">0</property>
		      <property name="pixels_below_lines">0</property>
		      <property name="pixels_inside_wrap">0</property>
		      <property name="left_margin">0</property>
		      <property name="right_margin">0</property>
		      <property name="indent">0</property>
		      <property name="text" translatable="yes"></property>
		    </widget>
		  </child>
		</widget>
		<packing>
		  <property name="left_attach">1</property>
		  <property name="right_attach">2</property>
		  <property name="top_attach">5</property>
		  <property name="bottom_attach">6</property>
		  <property name="x_options">fill</property>
		  <property name="y_options"></property>
		</packing>
	      </child>

	      <child>
		<widget class="GtkScrolledWindow" id="scrolledwindow5">
		  <property name="visible">True</property>
		  <property name="can_focus">True</property>
		  <property name="hscrollbar_policy">GTK_POLICY_ALWAYS</property>
		  <property name="vscrollbar_policy">GTK_POLICY_ALWAYS</property>
		  <property name="shadow_type">GTK_SHADOW_IN</property>
		  <property name="window_placement">GTK_CORNER_TOP_LEFT</property>

		  <child>
		    <widget class="GtkTextView" id="texNotes">
		      <property name="height_request">100</property>
		      <property name="visible">True</property>
		      <property name="can_focus">True</property>
		      <property name="editable">True</property>
		      <property name="overwrite">False</property>
		      <property name="accepts_tab">True</property>
		      <property name="justification">GTK_JUSTIFY_LEFT</property>
		      <property name="wrap_mode">GTK_WRAP_NONE</property>
		      <property name="cursor_visible">True</property>
		      <property name="pixels_above_lines">0</property>
		      <property name="pixels_below_lines">0</property>
		      <property name="pixels_inside_wrap">0</property>
		      <property name="left_margin">0</property>
		      <property name="right_margin">0</property>
		      <property name="indent">0</property>
		      <property name="text" translatable="yes"></property>
		    </widget>
		  </child>
		</widget>
		<packing>
		  <property name="left_attach">1</property>
		  <property name="right_attach">2</property>
		  <property name="top_attach">6</property>
		  <property name="bottom_attach">7</property>
		  <property name="x_options">fill</property>
		  <property name="y_options"></property>
		</packing>
	      </child>
	    </widget>
	    <packing>
	      <property name="tab_expand">False</property>
	      <property name="tab_fill">True</property>
	    </packing>
	  </child>

	  <child>
	    <widget class="GtkLabel" id="label14">
	      <property name="visible">True</property>
	      <property name="label" translatable="yes">Metadata</property>
	      <property name="use_underline">False</property>
	      <property name="use_markup">False</property>
	      <property name="justify">GTK_JUSTIFY_LEFT</property>
	      <property name="wrap">False</property>
	      <property name="selectable">False</property>
	      <property name="xalign">0.5</property>
	      <property name="yalign">0.5</property>
	      <property name="xpad">0</property>
	      <property name="ypad">0</property>
	      <property name="ellipsize">PANGO_ELLIPSIZE_NONE</property>
	      <property name="width_chars">-1</property>
	      <property name="single_line_mode">False</property>
	      <property name="angle">0</property>
	    </widget>
	    <packing>
	      <property name="type">tab</property>
	    </packing>
	  </child>
	</widget>
	<packing>
	  <property name="padding">0</property>
	  <property name="expand">True</property>
	  <property name="fill">True</property>
	</packing>
      </child>

      <child>
	<widget class="GtkHBox" id="hbox4">
	  <property name="visible">True</property>
	  <property name="homogeneous">False</property>
	  <property name="spacing">0</property>

	  <child>
	    <widget class="GtkStatusbar" id="sbColorsname">
	      <property name="visible">True</property>
	      <property name="has_resize_grip">False</property>
	    </widget>
	    <packing>
	      <property name="padding">0</property>
	      <property name="expand">True</property>
	      <property name="fill">True</property>
	    </packing>
	  </child>

	  <child>
	    <widget class="GtkStatusbar" id="sbConnection">
	      <property name="visible">True</property>
	      <property name="has_resize_grip">True</property>
	    </widget>
	    <packing>
	      <property name="padding">0</property>
	      <property name="expand">True</property>
	      <property name="fill">True</property>
	    </packing>
	  </child>
	</widget>
	<packing>
	  <property name="padding">0</property>
	  <property name="expand">False</property>
	  <property name="fill">False</property>
	</packing>
      </child>
    </widget>
  </child>
</widget>

<widget class="GtkFileChooserDialog" id="filechooserdialog">
  <property name="border_width">5</property>
  <property name="events">GDK_POINTER_MOTION_MASK | GDK_POINTER_MOTION_HINT_MASK | GDK_BUTTON_PRESS_MASK | GDK_BUTTON_RELEASE_MASK</property>
  <property name="action">GTK_FILE_CHOOSER_ACTION_OPEN</property>
  <property name="local_only">True</property>
  <property name="select_multiple">False</property>
  <property name="show_hidden">False</property>
  <property name="do_overwrite_confirmation">False</property>
  <property name="type">GTK_WINDOW_TOPLEVEL</property>
  <property name="window_position">GTK_WIN_POS_CENTER_ON_PARENT</property>
  <property name="modal">False</property>
  <property name="resizable">True</property>
  <property name="destroy_with_parent">False</property>
  <property name="decorated">True</property>
  <property name="skip_taskbar_hint">False</property>
  <property name="skip_pager_hint">False</property>
  <property name="type_hint">GDK_WINDOW_TYPE_HINT_DIALOG</property>
  <property name="gravity">GDK_GRAVITY_NORTH_WEST</property>
  <property name="focus_on_map">True</property>
  <property name="urgency_hint">False</property>
  <signal name="close" handler="on_filechooserdialog_close"/>

  <child internal-child="vbox">
    <widget class="GtkVBox" id="dialog-vbox1">
      <property name="visible">True</property>
      <property name="homogeneous">False</property>
      <property name="spacing">2</property>

      <child internal-child="action_area">
	<widget class="GtkHButtonBox" id="dialog-action_area1">
	  <property name="visible">True</property>
	  <property name="layout_style">GTK_BUTTONBOX_END</property>

	  <child>
	    <widget class="GtkButton" id="filechooserCxl">
	      <property name="visible">True</property>
	      <property name="can_focus">True</property>
	      <property name="label">gtk-cancel</property>
	      <property name="use_stock">True</property>
	      <property name="relief">GTK_RELIEF_NORMAL</property>
	      <property name="focus_on_click">True</property>
	      <property name="response_id">-6</property>
	    </widget>
	  </child>

	  <child>
	    <widget class="GtkButton" id="filechooserOK">
	      <property name="visible">True</property>
	      <property name="can_focus">True</property>
	      <property name="label">gtk-ok</property>
	      <property name="use_stock">True</property>
	      <property name="relief">GTK_RELIEF_NORMAL</property>
	      <property name="focus_on_click">True</property>
	      <property name="response_id">-5</property>
	    </widget>
	  </child>
	</widget>
	<packing>
	  <property name="padding">0</property>
	  <property name="expand">False</property>
	  <property name="fill">True</property>
	  <property name="pack_type">GTK_PACK_END</property>
	</packing>
      </child>

      <child>
	<widget class="GtkComboBox" id="combobox1">
	  <property name="visible">True</property>
	  <property name="items" translatable="yes">Vim Color Schemes
All Files</property>
	  <property name="add_tearoffs">False</property>
	  <property name="focus_on_click">True</property>
	</widget>
	<packing>
	  <property name="padding">0</property>
	  <property name="expand">False</property>
	  <property name="fill">True</property>
	</packing>
      </child>
    </widget>
  </child>
</widget>

<widget class="GtkAboutDialog" id="aboutdialog">
  <property name="border_width">5</property>
  <property name="events">GDK_POINTER_MOTION_MASK | GDK_POINTER_MOTION_HINT_MASK | GDK_BUTTON_PRESS_MASK | GDK_BUTTON_RELEASE_MASK</property>
  <property name="destroy_with_parent">False</property>
  <property name="name" translatable="yes">ColorSchemeEditor</property>
  <property name="copyright" translatable="yes">(c) 2008 Erik Falor
Distributable under the same terms as Vim itself.
http://iccf-holland.org/
http://www.vim.org/iccf/
http://www.iccf.nl/
</property>
  <property name="license" translatable="yes"> VIM LICENSE

I)  There are no restrictions on distributing unmodified copies of Vim except
    that they must include this license text.  You can also distribute
    unmodified parts of Vim, likewise unrestricted except that they must
    include this license text.  You are also allowed to include executables
    that you made from the unmodified Vim sources, plus your own usage
    examples and Vim scripts.

II) It is allowed to distribute a modified (or extended) version of Vim,
    including executables and/or source code, when the following four
    conditions are met:
    1) This license text must be included unmodified.
    2) The modified Vim must be distributed in one of the following five ways:
       a) If you make changes to Vim yourself, you must clearly describe in
	  the distribution how to contact you.  When the maintainer asks you
	  (in any way) for a copy of the modified Vim you distributed, you
	  must make your changes, including source code, available to the
	  maintainer without fee.  The maintainer reserves the right to
	  include your changes in the official version of Vim.  What the
	  maintainer will do with your changes and under what license they
	  will be distributed is negotiable.  If there has been no negotiation
	  then this license, or a later version, also applies to your changes.
	  The current maintainer is Bram Moolenaar [Bram@vim.org].  If this
	  changes it will be announced in appropriate places (most likely
	  vim.sf.net, www.vim.org and/or comp.editors).  When it is completely
	  impossible to contact the maintainer, the obligation to send him
	  your changes ceases.  Once the maintainer has confirmed that he has
	  received your changes they will not have to be sent again.
       b) If you have received a modified Vim that was distributed as
	  mentioned under a) you are allowed to further distribute it
	  unmodified, as mentioned at I).  If you make additional changes the
	  text under a) applies to those changes.
       c) Provide all the changes, including source code, with every copy of
	  the modified Vim you distribute.  This may be done in the form of a
	  context diff.  You can choose what license to use for new code you
	  add.  The changes and their license must not restrict others from
	  making their own changes to the official version of Vim.
       d) When you have a modified Vim which includes changes as mentioned
	  under c), you can distribute it without the source code for the
	  changes if the following three conditions are met:
	  - The license that applies to the changes permits you to distribute
	    the changes to the Vim maintainer without fee or restriction, and
	    permits the Vim maintainer to include the changes in the official
	    version of Vim without fee or restriction.
	  - You keep the changes for at least three years after last
	    distributing the corresponding modified Vim.  When the maintainer
	    or someone who you distributed the modified Vim to asks you (in
	    any way) for the changes within this period, you must make them
	    available to him.
	  - You clearly describe in the distribution how to contact you.  This
	    contact information must remain valid for at least three years
	    after last distributing the corresponding modified Vim, or as long
	    as possible.
       e) When the GNU General Public License (GPL) applies to the changes,
	  you can distribute the modified Vim under the GNU GPL version 2 or
	  any later version.
    3) A message must be added, at least in the output of the &quot;:version&quot;
       command and in the intro screen, such that the user of the modified Vim
       is able to see that it was modified.  When distributing as mentioned
       under 2)e) adding the message is only required for as far as this does
       not conflict with the license used for the changes.
    4) The contact information as required under 2)a) and 2)d) must not be
       removed or changed, except that the person himself can make
       corrections.

III) If you distribute a modified version of Vim, you are encouraged to use
     the Vim license for your changes and make them available to the
     maintainer, including the source code.  The preferred way to do this is
     by e-mail or by uploading the files to a server and e-mailing the URL.
     If the number of changes is small (e.g., a modified Makefile) e-mailing a
     context diff will do.  The e-mail address to be used is
     [maintainer@vim.org]

IV)  It is not allowed to remove this license from the distribution of the Vim
     sources, parts of it or from a modified version.  You may use this
     license for previous Vim releases instead of the license that they came
     with, at your option.</property>
  <property name="wrap_license">False</property>
  <property name="website">http://www.vim.org/scripts/script.php?script_id=2180</property>
  <property name="authors">Erik Falor</property>
  <property name="documenters">Erik Falor</property>
  <property name="translator_credits" translatable="yes" comments="TRANSLATORS: Replace this string with your names, one name per line.">translator-credits</property>

  <child internal-child="vbox">
    <widget class="GtkVBox" id="dialog-vbox2">
      <property name="visible">True</property>
      <property name="homogeneous">False</property>
      <property name="spacing">2</property>

      <child>
	<placeholder/>
      </child>

      <child internal-child="action_area">
	<widget class="GtkHButtonBox" id="dialog-action_area2">
	  <property name="visible">True</property>
	  <property name="layout_style">GTK_BUTTONBOX_END</property>
	</widget>
	<packing>
	  <property name="padding">0</property>
	  <property name="expand">False</property>
	  <property name="fill">True</property>
	  <property name="pack_type">GTK_PACK_END</property>
	</packing>
      </child>
    </widget>
  </child>
</widget>

<widget class="GtkDialog" id="addHighlightDlg">
  <property name="border_width">5</property>
  <property name="events">GDK_POINTER_MOTION_MASK | GDK_POINTER_MOTION_HINT_MASK | GDK_BUTTON_PRESS_MASK | GDK_BUTTON_RELEASE_MASK</property>
  <property name="title" translatable="yes">Add New Highlight</property>
  <property name="type">GTK_WINDOW_TOPLEVEL</property>
  <property name="window_position">GTK_WIN_POS_MOUSE</property>
  <property name="modal">True</property>
  <property name="resizable">True</property>
  <property name="destroy_with_parent">True</property>
  <property name="decorated">True</property>
  <property name="skip_taskbar_hint">False</property>
  <property name="skip_pager_hint">False</property>
  <property name="type_hint">GDK_WINDOW_TYPE_HINT_NORMAL</property>
  <property name="gravity">GDK_GRAVITY_NORTH_WEST</property>
  <property name="focus_on_map">True</property>
  <property name="urgency_hint">False</property>
  <property name="has_separator">False</property>

  <child internal-child="vbox">
    <widget class="GtkVBox" id="dialog-vbox5">
      <property name="visible">True</property>
      <property name="homogeneous">False</property>
      <property name="spacing">2</property>

      <child internal-child="action_area">
	<widget class="GtkHButtonBox" id="dialog-action_area5">
	  <property name="visible">True</property>
	  <property name="layout_style">GTK_BUTTONBOX_END</property>

	  <child>
	    <widget class="GtkButton" id="btnCancel3">
	      <property name="visible">True</property>
	      <property name="can_focus">True</property>
	      <property name="label">gtk-cancel</property>
	      <property name="use_stock">True</property>
	      <property name="relief">GTK_RELIEF_NORMAL</property>
	      <property name="focus_on_click">True</property>
	      <property name="response_id">-6</property>
	    </widget>
	  </child>

	  <child>
	    <widget class="GtkButton" id="btnOk3">
	      <property name="visible">True</property>
	      <property name="can_focus">True</property>
	      <property name="label">gtk-ok</property>
	      <property name="use_stock">True</property>
	      <property name="relief">GTK_RELIEF_NORMAL</property>
	      <property name="focus_on_click">True</property>
	      <property name="response_id">-5</property>
	    </widget>
	  </child>
	</widget>
	<packing>
	  <property name="padding">0</property>
	  <property name="expand">False</property>
	  <property name="fill">True</property>
	  <property name="pack_type">GTK_PACK_END</property>
	</packing>
      </child>

      <child>
	<widget class="GtkTable" id="table4">
	  <property name="visible">True</property>
	  <property name="n_rows">1</property>
	  <property name="n_columns">2</property>
	  <property name="homogeneous">False</property>
	  <property name="row_spacing">3</property>
	  <property name="column_spacing">3</property>

	  <child>
	    <widget class="GtkEntry" id="entNameEdit">
	      <property name="visible">True</property>
	      <property name="tooltip" translatable="yes">Enter Player's Name Here</property>
	      <property name="can_default">True</property>
	      <property name="has_default">True</property>
	      <property name="can_focus">True</property>
	      <property name="events">GDK_POINTER_MOTION_MASK | GDK_POINTER_MOTION_HINT_MASK | GDK_BUTTON_PRESS_MASK | GDK_BUTTON_RELEASE_MASK</property>
	      <property name="editable">True</property>
	      <property name="visibility">True</property>
	      <property name="max_length">0</property>
	      <property name="text" translatable="yes">Enter Name Here</property>
	      <property name="has_frame">True</property>
	      <property name="invisible_char">*</property>
	      <property name="activates_default">False</property>
	    </widget>
	    <packing>
	      <property name="left_attach">1</property>
	      <property name="right_attach">2</property>
	      <property name="top_attach">0</property>
	      <property name="bottom_attach">1</property>
	    </packing>
	  </child>

	  <child>
	    <widget class="GtkLabel" id="label10">
	      <property name="visible">True</property>
	      <property name="label" translatable="yes">Highlight</property>
	      <property name="use_underline">False</property>
	      <property name="use_markup">False</property>
	      <property name="justify">GTK_JUSTIFY_LEFT</property>
	      <property name="wrap">False</property>
	      <property name="selectable">False</property>
	      <property name="xalign">0.5</property>
	      <property name="yalign">0.5</property>
	      <property name="xpad">0</property>
	      <property name="ypad">0</property>
	      <property name="ellipsize">PANGO_ELLIPSIZE_NONE</property>
	      <property name="width_chars">-1</property>
	      <property name="single_line_mode">False</property>
	      <property name="angle">0</property>
	    </widget>
	    <packing>
	      <property name="left_attach">0</property>
	      <property name="right_attach">1</property>
	      <property name="top_attach">0</property>
	      <property name="bottom_attach">1</property>
	    </packing>
	  </child>
	</widget>
	<packing>
	  <property name="padding">0</property>
	  <property name="expand">True</property>
	  <property name="fill">True</property>
	</packing>
      </child>
    </widget>
  </child>
</widget>

<widget class="GtkDialog" id="dlgUnsavedChanges">
  <property name="border_width">5</property>
  <property name="events">GDK_POINTER_MOTION_MASK | GDK_POINTER_MOTION_HINT_MASK | GDK_BUTTON_PRESS_MASK | GDK_BUTTON_RELEASE_MASK</property>
  <property name="title" translatable="yes">Are you sure you want to quit?</property>
  <property name="type">GTK_WINDOW_TOPLEVEL</property>
  <property name="window_position">GTK_WIN_POS_CENTER_ON_PARENT</property>
  <property name="modal">False</property>
  <property name="resizable">True</property>
  <property name="destroy_with_parent">False</property>
  <property name="decorated">True</property>
  <property name="skip_taskbar_hint">False</property>
  <property name="skip_pager_hint">False</property>
  <property name="type_hint">GDK_WINDOW_TYPE_HINT_DIALOG</property>
  <property name="gravity">GDK_GRAVITY_NORTH_WEST</property>
  <property name="focus_on_map">True</property>
  <property name="urgency_hint">False</property>
  <property name="has_separator">False</property>

  <child internal-child="vbox">
    <widget class="GtkVBox" id="dialog-vbox6">
      <property name="visible">True</property>
      <property name="homogeneous">False</property>
      <property name="spacing">2</property>

      <child internal-child="action_area">
	<widget class="GtkHButtonBox" id="dialog-action_area6">
	  <property name="visible">True</property>
	  <property name="layout_style">GTK_BUTTONBOX_END</property>

	  <child>
	    <widget class="GtkButton" id="btnCancel">
	      <property name="visible">True</property>
	      <property name="can_focus">True</property>
	      <property name="label">gtk-cancel</property>
	      <property name="use_stock">True</property>
	      <property name="relief">GTK_RELIEF_NORMAL</property>
	      <property name="focus_on_click">True</property>
	      <property name="response_id">-6</property>
	    </widget>
	  </child>

	  <child>
	    <widget class="GtkButton" id="btnQuit">
	      <property name="visible">True</property>
	      <property name="can_focus">True</property>
	      <property name="label">gtk-quit</property>
	      <property name="use_stock">True</property>
	      <property name="relief">GTK_RELIEF_NORMAL</property>
	      <property name="focus_on_click">True</property>
	      <property name="response_id">-5</property>
	    </widget>
	  </child>
	</widget>
	<packing>
	  <property name="padding">0</property>
	  <property name="expand">False</property>
	  <property name="fill">True</property>
	  <property name="pack_type">GTK_PACK_END</property>
	</packing>
      </child>

      <child>
	<widget class="GtkHBox" id="hbox9">
	  <property name="visible">True</property>
	  <property name="homogeneous">False</property>
	  <property name="spacing">0</property>

	  <child>
	    <widget class="GtkImage" id="image3">
	      <property name="visible">True</property>
	      <property name="stock">gtk-dialog-warning</property>
	      <property name="icon_size">6</property>
	      <property name="xalign">0.5</property>
	      <property name="yalign">0.5</property>
	      <property name="xpad">0</property>
	      <property name="ypad">0</property>
	    </widget>
	    <packing>
	      <property name="padding">0</property>
	      <property name="expand">False</property>
	      <property name="fill">False</property>
	    </packing>
	  </child>

	  <child>
	    <widget class="GtkVBox" id="vbox3">
	      <property name="visible">True</property>
	      <property name="homogeneous">False</property>
	      <property name="spacing">0</property>

	      <child>
		<widget class="GtkLabel" id="label1">
		  <property name="visible">True</property>
		  <property name="label" translatable="yes">&lt;b&gt;You have unsaved changes&lt;/b&gt;</property>
		  <property name="use_underline">False</property>
		  <property name="use_markup">True</property>
		  <property name="justify">GTK_JUSTIFY_LEFT</property>
		  <property name="wrap">False</property>
		  <property name="selectable">False</property>
		  <property name="xalign">0.5</property>
		  <property name="yalign">0.5</property>
		  <property name="xpad">0</property>
		  <property name="ypad">0</property>
		  <property name="ellipsize">PANGO_ELLIPSIZE_NONE</property>
		  <property name="width_chars">-1</property>
		  <property name="single_line_mode">False</property>
		  <property name="angle">0</property>
		</widget>
		<packing>
		  <property name="padding">0</property>
		  <property name="expand">False</property>
		  <property name="fill">False</property>
		</packing>
	      </child>

	      <child>
		<widget class="GtkLabel" id="label2">
		  <property name="visible">True</property>
		  <property name="label" translatable="yes">This instance of Vim will keep your changes, but you will not be able to load them into another Vim instance unless you save your changes into a color scheme file.</property>
		  <property name="use_underline">False</property>
		  <property name="use_markup">False</property>
		  <property name="justify">GTK_JUSTIFY_LEFT</property>
		  <property name="wrap">True</property>
		  <property name="selectable">False</property>
		  <property name="xalign">0.5</property>
		  <property name="yalign">0.5</property>
		  <property name="xpad">0</property>
		  <property name="ypad">0</property>
		  <property name="ellipsize">PANGO_ELLIPSIZE_NONE</property>
		  <property name="width_chars">-1</property>
		  <property name="single_line_mode">False</property>
		  <property name="angle">0</property>
		</widget>
		<packing>
		  <property name="padding">0</property>
		  <property name="expand">False</property>
		  <property name="fill">False</property>
		</packing>
	      </child>
	    </widget>
	    <packing>
	      <property name="padding">0</property>
	      <property name="expand">True</property>
	      <property name="fill">True</property>
	    </packing>
	  </child>
	</widget>
	<packing>
	  <property name="padding">0</property>
	  <property name="expand">True</property>
	  <property name="fill">True</property>
	</packing>
      </child>
    </widget>
  </child>
</widget>

<widget class="GtkDialog" id="dlgConnect">
  <property name="border_width">5</property>
  <property name="events">GDK_POINTER_MOTION_MASK | GDK_POINTER_MOTION_HINT_MASK | GDK_BUTTON_PRESS_MASK | GDK_BUTTON_RELEASE_MASK</property>
  <property name="title" translatable="yes">Connect to Vim Instance</property>
  <property name="type">GTK_WINDOW_TOPLEVEL</property>
  <property name="window_position">GTK_WIN_POS_MOUSE</property>
  <property name="modal">True</property>
  <property name="resizable">True</property>
  <property name="destroy_with_parent">True</property>
  <property name="decorated">True</property>
  <property name="skip_taskbar_hint">False</property>
  <property name="skip_pager_hint">False</property>
  <property name="type_hint">GDK_WINDOW_TYPE_HINT_NORMAL</property>
  <property name="gravity">GDK_GRAVITY_NORTH_WEST</property>
  <property name="focus_on_map">True</property>
  <property name="urgency_hint">False</property>
  <property name="has_separator">False</property>

  <child internal-child="vbox">
    <widget class="GtkVBox" id="vbox8">
      <property name="visible">True</property>
      <property name="homogeneous">False</property>
      <property name="spacing">2</property>

      <child internal-child="action_area">
	<widget class="GtkHButtonBox" id="hbuttonbox1">
	  <property name="visible">True</property>
	  <property name="layout_style">GTK_BUTTONBOX_END</property>

	  <child>
	    <widget class="GtkButton" id="button1">
	      <property name="visible">True</property>
	      <property name="can_focus">True</property>
	      <property name="label">gtk-cancel</property>
	      <property name="use_stock">True</property>
	      <property name="relief">GTK_RELIEF_NORMAL</property>
	      <property name="focus_on_click">True</property>
	      <property name="response_id">-6</property>
	    </widget>
	  </child>

	  <child>
	    <widget class="GtkButton" id="btConnectOK">
	      <property name="visible">True</property>
	      <property name="can_focus">True</property>
	      <property name="label">gtk-ok</property>
	      <property name="use_stock">True</property>
	      <property name="relief">GTK_RELIEF_NORMAL</property>
	      <property name="focus_on_click">True</property>
	      <property name="response_id">-5</property>
	    </widget>
	  </child>
	</widget>
	<packing>
	  <property name="padding">0</property>
	  <property name="expand">False</property>
	  <property name="fill">True</property>
	  <property name="pack_type">GTK_PACK_END</property>
	</packing>
      </child>

      <child>
	<widget class="GtkTable" id="table5">
	  <property name="visible">True</property>
	  <property name="n_rows">1</property>
	  <property name="n_columns">2</property>
	  <property name="homogeneous">False</property>
	  <property name="row_spacing">3</property>
	  <property name="column_spacing">3</property>

	  <child>
	    <widget class="GtkLabel" id="label12">
	      <property name="visible">True</property>
	      <property name="label" translatable="yes">Vim Instance</property>
	      <property name="use_underline">False</property>
	      <property name="use_markup">False</property>
	      <property name="justify">GTK_JUSTIFY_LEFT</property>
	      <property name="wrap">False</property>
	      <property name="selectable">False</property>
	      <property name="xalign">0.5</property>
	      <property name="yalign">0.5</property>
	      <property name="xpad">0</property>
	      <property name="ypad">0</property>
	      <property name="ellipsize">PANGO_ELLIPSIZE_NONE</property>
	      <property name="width_chars">-1</property>
	      <property name="single_line_mode">False</property>
	      <property name="angle">0</property>
	    </widget>
	    <packing>
	      <property name="left_attach">0</property>
	      <property name="right_attach">1</property>
	      <property name="top_attach">0</property>
	      <property name="bottom_attach">1</property>
	    </packing>
	  </child>

	  <child>
	    <widget class="GtkComboBoxEntry" id="entServerName">
	      <property name="visible">True</property>
	      <property name="items" translatable="yes"></property>
	      <property name="add_tearoffs">False</property>
	      <property name="has_frame">True</property>
	      <property name="focus_on_click">True</property>

	      <child internal-child="entry">
		<widget class="GtkEntry" id="comboboxentry-entry1">
		  <property name="visible">True</property>
		  <property name="can_focus">True</property>
		  <property name="events">GDK_POINTER_MOTION_MASK | GDK_POINTER_MOTION_HINT_MASK | GDK_BUTTON_PRESS_MASK | GDK_BUTTON_RELEASE_MASK</property>
		  <property name="editable">True</property>
		  <property name="visibility">True</property>
		  <property name="max_length">0</property>
		  <property name="text" translatable="yes"></property>
		  <property name="has_frame">True</property>
		  <property name="invisible_char">*</property>
		  <property name="activates_default">False</property>
		</widget>
	      </child>
	    </widget>
	    <packing>
	      <property name="left_attach">1</property>
	      <property name="right_attach">2</property>
	      <property name="top_attach">0</property>
	      <property name="bottom_attach">1</property>
	      <property name="y_options"></property>
	    </packing>
	  </child>
	</widget>
	<packing>
	  <property name="padding">0</property>
	  <property name="expand">True</property>
	  <property name="fill">True</property>
	</packing>
      </child>
    </widget>
  </child>
</widget>

</glade-interface>
PK     �Je8�2��  ��     plugin/ColorSchemeEditor.py#!/usr/bin/python
# ColorSchemeEditor.vim: Provides a GUI to facilitate creating/editing a Vim colorscheme
# Maintainer:       Erik Falor <ewfalor@gmail.com>
# Date:             Mar 05, 2008
# Version:          1.0.1 beta
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
#3. X   When selecting a color in the editor, don't change it if it has a name
#   X   In other words, differentiate between the user changing the color on the
#   X   selector and the program changing it - FIXED BY BLOCKING SIGNALS
#4. X   Store the highlight attributes in the treeview somehow
#5. X   Separators between color selectors
#6. X   Menu at top of screen
#7.     Vim helpfile - clicking &Help opens the Vim help page in Vim.
#8.     Color-code the values in the listview
#9. X   Display name of current colorscheme as found in g:colors_name
#10.X   Refresh button to re-load scheme from Vim in case it was changed outside of the GUI
#11.X   Undo
#12.X   Save/Save As button/dialogs
#13.X   Let user set a color to NONE
#14.    Integrate rgb.txt
#15.X   Store a custom-pallette in the colorscheme file
#16.X   Metadata for colorscheme: set the name, author, comments, g:colors_name, &background, etc.
#17.X   Save As dialog begins in first colors directory of the &rtp
#18.X   put other colors/ directories in the Save As dialog's "Places"
#19.    Add a tooltip to explain what the different highlight elements are in the TreeView
#20.X   Undo button only enabled when the undo stack isn't empty
#21.X   Space out color selectors and button frames on the GUI
#22.X   Handle case where Vim instance goes away and no server is found 
#23.X   If screen isn't wide enough to display a line of :highlight's output, it is broken.
#   X   We need to put it back together before attempting to put it into the listview
#24.X   Use TreeModel instead of ListModel to store colors - for one thing, we could put linked
#   X   highlights in the tree as children of highlights with definitions.
#25.X   Re-connect to an instance of Vim
#26.X   Prompt user to save unsaved changes upon exit
#27.X   Add '+' and '-' buttons under the tree to allow the user to add/remove syntax elements
#28.X   Make sure that all of the "preferred" highlight groups are put into the tree, regardless
#   X   of whether they are defined.
#29.X   When setting a color to NONE, undo/redo don't quite work right. - re-work undo
#30.X   Subclass the TreeModel such that it has properties of both Trees and dicts; in particular,
#   X   I'd like it to ensure that each Element shows up only once; and by adding an element to the
#   X   dict, it gets put in to its own row by default.
#31.X   When you press the Foreground or Background buttons, update the colorselector to use whatever
#   X   color Normal is using
#32.X   Some preferred syntax items show up twice in the treeview - once because of
#   X   ColorSchemeEditor.InsertEditorGroups(), and again because they are linked
#33.    Make adding and removing highlight groups undoable
#34.X   Save to a file
#35.    Setting NONE attribute checkbox does not result in an atomic undo.
#36.    Removing highlight groups from list:
#       If it is a preferred/default highlight group, remove from tree and send a "hi <group> clear"
#       Otherwise, just remove it from the tree
#37.    Using the eye-dropper causes a crash in Win32; PyGTK tries to bail out, but fails to secure enough
#       resources for the "unsaved changes" nag screen 
#38.X   Gussy up the 'About' dialog.
#39.    If you change the Name in the metadata, should that sent to Vim?
#40.X   Pressing <enter> on save dialog hits the OK button for you.
#41.X   Rename Vim functions to have CSE_ prefix
#42.X   Writing out License and Metadata - order of lines is not preserved; buggy if only have one line.

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
        self.vimHighlightList   = TreeStoreDict(str, str, str, str)
        #attach model to treeview
        self.tvVimHighlights.set_model(self.vimHighlightList)
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
                    self.vimHighlightList.append('cleared',
                        [hl['hlName'], '', '', ''])
                elif hl.has_key('link'):
                    parentName = hl['link']
                    self.vimHighlightList.append(parentName,
                        [hl['hlName'], '', '', ''])
                elif hl['hlName'] not in self.vimHighlightList:
                    self.vimHighlightList.append(None, [hl.get('hlName', ''),
                        hl.get('fgcolor', ''),
                        hl.get('bgcolor', ''),
                        hl.get('guiattr', '')])
                else:
                    self.vimHighlightList.set(hl.get('hlName', ''), self.colElement, hl.get('hlName', ''),
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
            iter = self.vimHighlightList.get(item, None)
            if iter == None:
                return "highlight clear %s\n" % item
            parIter = self.vimHighlightList.iter_parent(iter) 
            if parIter == None:
                hlName = self.vimHighlightList.get_value(iter, self.colElement)
                if hlName == None:
                    hlName = ''
                fgStr  = self.vimHighlightList.get_value(iter, self.colFG)
                if fgStr == None:
                    fgStr = ''
                bgStr  = self.vimHighlightList.get_value(iter, self.colBG) 
                if bgStr == None:
                    bgStr = ''
                attrs  = self.vimHighlightList.get_value(iter, self.colAttr)
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
                parName = self.vimHighlightList.get_value(parIter, self.colElement)
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
        except VimRemoteException, vre:
            self.Disconnect()
        finally:
            return ret

    def MakeDirty(self, widget, value=True):
        if not self.locked:
            self.dirty = value

    def Refresh(self):
        self.vimHighlightList.clear()
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
        self.vimHighlightList.clear()

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
            self.vimHighlightList.append(None, (i, '', '', ''))

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
        hlName = self.vimHighlightList.get_value(iter, self.colElement)
        if 'btBgNone' == widget.name:
            self.vimHighlightList.set_value(iter, self.colBG, 'NONE')
            cmd = "CSE_SetHighlight('" + hlName + "', 'guibg=NONE')"
        elif 'btFgNone' == widget.name:
            self.vimHighlightList.set_value(iter, self.colFG, 'NONE')
            cmd =  "CSE_SetHighlight('" + hlName + "', 'guifg=NONE')"
        elif 'btFgFg' == widget.name and hlName != 'Normal':
            update = (self.csForeground, 1)
            self.vimHighlightList.set_value(iter, self.colFG, 'fg')
            cmd =  "CSE_SetHighlight('" + hlName + "', 'guifg=fg')"
        elif 'btFgBg' == widget.name and hlName != 'Normal':
            update = (self.csForeground, 2)
            self.vimHighlightList.set_value(iter, self.colFG, 'bg')
            cmd =  "CSE_SetHighlight('" + hlName + "', 'guifg=bg')"
        elif 'btBgFg' == widget.name and hlName != 'Normal':
            update = (self.csBackground, 1)
            self.vimHighlightList.set_value(iter, self.colBG, 'fg')
            cmd =  "CSE_SetHighlight('" + hlName + "', 'guibg=fg')"
        elif 'btBgBg' == widget.name and hlName != 'Normal':
            update = (self.csBackground, 2)
            self.vimHighlightList.set_value(iter, self.colBG, 'bg')
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

            hlName = self.vimHighlightList.get_value(iter, self.colElement)
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

                self.vimHighlightList.set_value(iter, self.colFG, colr24s)
                cmd = "CSE_SetHighlight('%s', 'guifg=%s')" % (hlName, colr24s)
            else:
                colr = self.ColorToString(cs.get_current_color())
                logging.debug( "background color name is %s" % colr)
                self.vimHighlightList.set_value(iter, self.colBG, self.ColorToString(cs.get_current_color()))
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
                self.vimHighlightList.set_value(iter, self.colAttr, attrStr)
        else:
            logging.debug( "\t===CHECK cbNone===" )
            self.cbNone.set_active(False) #reset NONE checkbox
            save = self.vimHighlightList.get_value(iter, self.colAttr)
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
            self.vimHighlightList.set_value(iter, self.colAttr, attrStr)
            #send the changes to vim
            hlName = self.vimHighlightList.get_value(iter, self.colElement)
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

            #set listview's representation of this item according to what Vim sent back to us
            self.vimHighlightList.set(hlName, self.colElement, hlName,
                    self.colFG, fgcolor,
                    self.colBG, bgcolor,
                    self.colAttr, guiattr)
        except VimRemoteException, vre:
            self.Disconnect()

        #if the item we just undid is the currently selected item, we should
        #update the controls
        if self.tvVimHighlights.get_selection().iter_is_selected(iter):
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
            self.vimHighlightList.append(None, (hlName, '', '', ''))

    def OnRemove(self, w):
        """remove highlighted item from treeview"""
        (modl, iter) = self.tvVimHighlights.get_selection().get_selected()
        if None != iter:
            self.vimHighlightList.remove(iter)

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

    def set(self, name, *values):
        """wraps TreeStore's set method"""
        iter = self.dict.get(name, None)
        gtk.TreeStore.set(self, iter, *values)

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
PK     *Ge8c�f8�  �     plugin/ColorSchemeEditor.vim" ColorSchemeEditor.vim: Provides a GUI to facilitate creating/editing a Vim colorscheme
" Maintainer:       Erik Falor <ewfalor@gmail.com>
" Date:             Feb 11, 2008
" Version:          1.0.1 beta
" License:          Vim license
"
" History:
"
"   Version 0.1:    Initial upload
"
" Usage Notes:

" Initialization: {{{
if exists("g:loaded_colorschemeeditor")
    finish
endif
if !has('gui_running') || !has('clientserver') || v:version < 700
    finish
endif

let g:loaded_colorschemeeditor = "0.1"
let s:keepcpo      = &cpo
set cpo&vim
"}}}

" Script Variables: {{{
let s:CSE_Path = globpath(&runtimepath, 'plugin/ColorSchemeEditor.py')

" for debugging purposes
let s:redrawCount = 0
"}}}

" Library Functions {{{

"External Interface {{{
function! CSE_GetAllHighlights() "{{{
    "print out all defined highlights
    redir => hi
    silent highlight
    "added so the final line isn't thrown away
    silent echo "END OF LINE"
    redir END
    return hi
endfunction "}}}

function! CSE_GetHighlight(hl) "{{{
    "print out single highlight
    redir => hi
    exe "silent highlight " . a:hl
    redir END
    return hi
endfunction "}}}

function! CSE_GetColorSchemeName() "{{{
    "called when refreshing or connecting to a new Vim instance
    let s:redrawCount = 0
    if exists("g:colors_name")
        return g:colors_name
    endif
    return
endfunction "}}}

function! CSE_GetMetadata() "{{{
    if exists("g:colors_name")
        let metadataDict = "g:" . g:colors_name . "_Metadata"
        if exists(metadataDict)
            return string(eval(metadataDict))
        endif
    endif
    return '{}'
endfunction "}}}

function! CSE_GetBackground() "{{{
    return &background
endfunction "}}}

function! CSE_SetBackground(value) "{{{
    "entered when the light or dark radio buttons are clicked
    if a:value == 'dark'
        set background=dark
    elseif a:value == 'light'
        set background=light
    endif
    redraw
endfunction "}}}

function! CSE_DoColorscheme(cs) "{{{
    "source the color scheme after saving the file
    "used to reset the metadata dict in Vim so that the
    "changes to the metadata stick
    execute "colorscheme " . fnamemodify(a:cs, ":t:r")
    redraw
endfunction "}}}

function! CSE_GetColorsDirs() "{{{
    "returns directories where colorschemes may be saved
    "used by the SaveAs dialog
    return globpath(&rtp, 'colors')
endfunction "}}}

function! CSE_SetHighlight(group, ...) "{{{
    "set highlight 'group' with arguments
    let cmd = ''
    for arg in a:000
        let cmd = cmd . ' ' . arg
    endfor

    exe 'highlight ' a:group . ' ' . cmd
    if exists("g:CSE_DebugMode")
        echom "redraw " . s:redrawCount
        let s:redrawCount += 1
    endif
    redraw

    redir => hi
    exe "silent highlight " . a:group
    redir END
    return hi
endfunction "}}}

function! CSE_GetDebugMode() "{{{
    if exists("g:CSE_DebugMode")
        return 1
    else
        return 0
    endif
endfunction "}}}

function! CSE_ShowHelp() "{{{
    help ColorSchemeEditor
endfunction"}}}
"}}}

function! <SID>ColorSchemeEditor () "{{{
    if has('gui_running') && has('clientserver')
        if has('gui_win32') 
            "if the editor is launched with the following command, it cannot
            "print any output, or else Vim will close it down
            if exists("g:CSE_DebugMode")
                exe 'silent !start python "' . s:CSE_Path . '" ' . v:servername .
                            \' "' . fnamemodify( s:CSE_Path, ':h') . '"'
            else
                exe 'silent !start python "' . s:CSE_Path . '" '. v:servername .
                            \' "' . fnamemodify( s:CSE_Path, ':h') . '"'
            endif
        elseif has('unix')
            if exists("g:CSE_DebugMode")
                exe 'silent !xterm -e python "' . s:CSE_Path . '" '. v:servername .
                            \' "' . fnamemodify( s:CSE_Path, ':h') . '" &'
            else
                exe 'silent !python "' . s:CSE_Path . '" '. v:servername .
                            \' "' . fnamemodify( s:CSE_Path, ':h') . '" "&"'
            endif
        endif
    endif
endfunction "}}}


"}}}

" Setup menu and custom Vim command {{{
command! -nargs=0   ColorSchemeEditor call <SID>ColorSchemeEditor ()
amenu 9000.9000 &ColorSchemes.-EditorSep- :
amenu 9000.9000 &ColorSchemes.&Color\ Scheme\ Editor   :ColorSchemeEditor<CR>
"}}}

" Restore &cpo: {{{
let &cpo= s:keepcpo
unlet s:keepcpo
"}}}

"  vim: tabstop=4 shiftwidth=4 foldmethod=marker expandtab fileformat=unix:
PK     �Je8�#+  +     doc/ColorSchemeEditor.txt*ColorSchemeEditor.txt* PyGTK interface to :highlight commands

Last changed:   2008-03-04
Maintainer:     Erik Falor <ewfalor@gmail.com>
Version:        1.0.1 beta
License:        Licensed under the same terms as Vim


==============================================================================
1. Contents                                                *ColorSchemeEditor*
                                                  *ColorSchemeEditor-contents*

    1. Contents                        : |ColorSchemeEditor-contents|
    2. QuickStart                      : |ColorSchemeEditor-quickstart|
    3. Installation                    : |ColorSchemeEditor-install|
      3.1 Requirements                 : |ColorSchemeEditor-requirements|
      3.2 Instructions                 : |ColorSchemeEditor-instructions|
    4. Manual                          : |ColorSchemeEditor-manual|
      4.1 Explanation of the controls  : |ColorSchemeEditor-controls|
      4.2 Commands                     : |ColorSchemeEditor-commands|
      4.3 Variables                    : |ColorSchemeEditor-variables|
      4.4 Common Questions             : |ColorSchemeEditor-questions|
    5. Todo                            : |ColorSchemeEditor-todo|
      5.1 Bugs                         : |ColorSchemeEditor-bugs|


==============================================================================
2. QuickStart                                   *ColorSchemeEditor-quickstart*

This plugin provides a GUI tool which simplifies creating/editing Vim
colorscheme files.  It consists of a Vim plugin as well as a Python program,
and utilizes Vim's command server interface |clientserver| for communications.

The goals that I hope to achieve through this plugin are to improve the
quality of existing colorschemes by allowing the authors the freedom to create
colorschemes in a natural WYSIWYG fashion.  Immediate visual feedback lets the
author quickly assess the effects of their changes, and allows them to easily
choose just the right color for a highlight element.  By displaying all of the
"preferred" highlight groups in a treeview, colorscheme authors can ensure
that all of the important highlights have been changed to fit in with the
overall scheme.  Users of colorschemes can use this plugin to tweak their
favorite colorschemes more to their liking.

Colorschemes generated with this plugin are backwards-compatible with earlier
versions of Gvim that do not use such highlight groups as CursorLine or Pmenu.

Your palette of custom colors is saved in the colorscheme file, so that your
choices persist between editing sessions.  This helps you maintain
a consistent look-and-feel while you are in the process of creating the
colorscheme.  Other metadata related to the colorscheme, such as licensing
information and your contact information are accessible from within the editor
as well.

This plugin makes a nice compliment to my earlier work, ColorSchemeMenuMaker.
    http://www.vim.org/scripts/script.php?script_id=2004

If you have already installed ColorSchemeMenuMaker, the menu entry for
ColorSchemeEditor will appear at the bottom of the "ColorSchemes" menu item.
Additionally, you may invoke it via the :ColorSchemeEditor command.

Each instance of the editor is connected to at most one running instance of
Gvim.


==============================================================================
3. Installation                                    *ColorSchemeEditor-install*

------------------------------------------------------------------------------
3.1 Requirements                              *ColorSchemeEditor-requirements*

ColorSchemeEditor requires that your version of Vim is compiled with the |gui|
and |clientserver| features.

The GUI editor is written with Python, with PyGTK and Glade comprising the
graphical interface.

If you want to use this on Un*x systems, make sure you have those three
packages and their dependencies installed.

More specifically, Gentoo users will need at least the following packages:
dev-lang/python x11-libs/gtk+ gnome-base/libglade dev-python/pygtk

Windows users will need at least the following software packages:
Python       http://www.python.org/download/
PyGTK        http://www.pygtk.org/downloads.html
Pygobject    See above
Pycairo      See above
gladewin32   http://gladewin32.sourceforge.net/modules/news/

------------------------------------------------------------------------------
3.2 Install Instructions                      *ColorSchemeEditor-instructions*

Once the requisite software packages are installed, simply unzip the plugin
package into your ~/.vim (or ~/vimfiles) directory.  The
ColorSchemeEditor.{py,vim,glade} files should all wind up in the plugin
directory.

Any new instances of Gvim will now show the 'ColorSchemes' menu, and are ready
to go.  Within already running instances of Gvim, you may execute
>
    :runtime plugin/ColorSchemeEditor.vim 
<
to load the plugin.

Also, you should run helptags: 
>
    :helptags $HOME/.vim/doc

<
==============================================================================
4. Manual                                           *ColorSchemeEditor-manual*

------------------------------------------------------------------------------
4.1 Explanation of the controls                   *ColorSchemeEditor-controls*

4.1.1 Treeview                                    *ColorSchemeEditor-treeview*
The TreeView displays all highlight groups defined at the time the editor was
launched.  Linked groups are the child nodes.  In a future version
parent/child relationships will be modifiable by dragging a group and dropping
it upon the parent.  You may edit child nodes; they will still appear as
children of their parent until the TreeView is refreshed.

Double-clicking a row selects it, and sets the ColorSelection and checkboxes
to take on the gui attributes for that group.  

When the TreeView is has focus, typing the name of a visible highlight
group will search for it.  This is helpful when you want to find out which
group a linked highlight group inherits from.  Click 'Expand All' before
searching for a child group.

Click the column headings to sort the list. 

4.1.2 ColorSelection                        *ColorSchemeEditor-colorselection*
The top one changes the foreground color of a highlight group, the bottom one
works on the background color.  If you don't want a color, click the 'NONE'
button to reset it to its pristine condition.

The ColorSelections can parse the names of colors known to rgb.txt; you can
type it in to the Color name text entry.  It will be translated to its #RRGGBB
name for the TreeView.  If you need to save it, drag it to the palette.

4.1.3 Connect toolbar button                       *ColorSchemeEditor-connect*
Displays a list of available Gvim instances.  You will be nagged if you
haven't saved your changes, but you can always re-connect to the previous
instance and save it later.

Use this button when you close Vim and leave a ColorSchemeEditor in
a "disconnected" state.

4.1.4 Refresh toolbar button                       *ColorSchemeEditor-refresh*
If you make a change in Vim, the GUI editor won't know about it unless you do
a refresh.  This will blow away your Undo/Redo history.

4.1.5 Background radio buttons                  *ColorSchemeEditor-background*
If you're going to tinker with this control, do it before you change anything
else in the colorscheme.  It's helpful when you're starting from scratch, and
all you know is that you want a colorscheme with a black background.

------------------------------------------------------------------------------
4.2 Commands                                      *ColorSchemeEditor-commands*

                                                          *:ColorSchemeEditor*
:ColorSchemeEditor      Opens a new instance of the editor connected to the
                        current instance of Gvim.

------------------------------------------------------------------------------
4.3 Variables                                    *ColorSchemeEditor-variables*

The following variable affect the behavior of this plugin:

                                                               *CSE_DebugMode*
g:CSE_DebugMode
        Launches the GUI editor in debug mode.  This opens a terminal to which
        verbose logging information is redirected.  This only effects editors
        launched afterwards.

------------------------------------------------------------------------------
4.4 Common Questions                             *ColorSchemeEditor-questions*

Oh, I don't know.  If you are having any trouble at all, email me.  If you
people ask the same question enough times, I'll put it in here.


==============================================================================
5. Todo                                               *ColorSchemeEditor-todo*

 1.     Put the communication with Vim into a thread && handle asynchronously
 2.     Color-code the values in the listview
 3      Integrate rgb.txt so users can browse a list of named colors.
 4.     Add a tooltip to explain what the different highlight elements are in the TreeView
 5.     Make adding and removing highlight groups undoable
 6.     Setting NONE attribute checkbox does not result in an atomic undo.
 7.     Removing highlight groups from list:
        If it is a preferred/default highlight group, remove from tree and
        send a "hi <group> clear" Otherwise, just remove it from the tree
 8.     Add support for editing cterm highlight groups.

------------------------------------------------------------------------------
5.1 Bugs                                              *ColorSchemeEditor-bugs*

 1.     Using the eye-dropper causes a crash in Win32; PyGTK tries to bail
        out, but fails to secure enough resources for the "unsaved changes"
        nag screen 

 2.     The Gtk ColorSelection widget stores colors as Gtk.Color objects; this
        means that the RGB components are stored in 16 bits.  Even though the
        ColorSelection widget displays colors in 8-bit terms, there doesn't
        seem to be a way for me to get that info out of it.  Since Gvim uses
        8 bits per component, I divide the components by 256 to get them back
        down to 8 bits.  This isn't the same method the widget uses
        internally, and sometimes the color displayed in the widget's "Color
        Name" text box is different from the color sent over to Vim.

 3.     If the undercurl attribute is used on any highlight groups available
        in Vim 6.3 or earlier, you'll get error messages when sourcing the
        colorscheme.  This isn't usually a problem because undercurl is mostly
        used for the spellchecking |spell| highlight groups, which aren't
        sourced if the |v:version| is less than 700.

Please let me know of any problems you experience, or share any suggestions:
Erik Falor <ewfalor@gmail.com>

 vim:set tw=78 ft=help expandtab nofoldenable:
PK      [Je8����Vf Vf            ��    plugin/ColorSchemeEditor.gladePK      �Je8�2��  ��             ���f plugin/ColorSchemeEditor.pyPK      *Ge8c�f8�  �             ���c plugin/ColorSchemeEditor.vimPK      �Je8�#+  +             ���u doc/ColorSchemeEditor.txtPK      &  ��   