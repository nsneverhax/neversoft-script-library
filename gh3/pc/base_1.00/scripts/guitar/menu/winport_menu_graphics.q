winport_gfx_device_num = 0
winport_gfx_text_color = [
	255
	255
	255
	255
]
winport_gfx_text_dropshadow_color = [
	0
	0
	0
	255
]
winport_gfx_text_highlight_color = [
	230
	171
	60
	255
]
winport_gfx_menuitems = [
	{
		text = "Resolution"
		handler = winport_gfx_option_handler
		option = 0
		needrestart = 1
	}
	{
		text = "Graphics Detail"
		handler = winport_gfx_option_handler
		option = 1
		needrestart = 1
		choices = [
			"Low"
			"High"
		]
	}
	{
		text = "Crowd"
		handler = winport_gfx_option_handler
		option = 2
		needrestart = 0
		choices = [
			"Off"
			"On"
		]
	}
	{
		text = "Physics"
		handler = winport_gfx_option_handler
		option = 3
		needrestart = 0
		choices = [
			"Off"
			"On"
		]
	}
	{
	}
	{
		text = "Reset to Defaults"
		handler = winport_gfx_reset_handler
	}
]
winport_gfx_values_old = [
	0
	0
	0
	0
]
winport_gfx_values_new = [
]
winport_gfx_need_restart = 0

script winport_gfx_get_choices 
	if structurecontains structure = ($winport_gfx_menuitems [<i>]) name = choices
		return choices = (($winport_gfx_menuitems [<i>]).choices)
	else
		winportgfxgetoptionchoices option = (($winport_gfx_menuitems [<i>]).option)
		return choices = <choices>
	endif
endscript

script winport_gfx_set_value 
	setarrayelement arrayname = winport_gfx_values_new globalarray index = <i> newvalue = <v>
endscript

script winport_gfx_load_values 
	getarraysize \{$winport_gfx_values_old}
	valuecount = <array_size>
	i = 0
	begin
	if structurecontains structure = ($winport_gfx_menuitems [<i>]) name = option
		winportgfxgetoptionvalue option = (($winport_gfx_menuitems [<i>]).option)
		setarrayelement arrayname = winport_gfx_values_old globalarray index = <i> newvalue = <value>
	endif
	i = (<i> + 1)
	repeat <valuecount>
	change \{winport_gfx_values_new = $winport_gfx_values_old}
	change \{winport_gfx_need_restart = 0}
endscript

script winport_gfx_save_values 
	getarraysize \{$winport_gfx_values_new}
	valuecount = <array_size>
	i = 0
	begin
	if structurecontains structure = ($winport_gfx_menuitems [<i>]) name = option
		winportgfxsetoptionvalue option = (($winport_gfx_menuitems [<i>]).option) value = ($winport_gfx_values_new [<i>])
	endif
	if ((($winport_gfx_menuitems [<i>]).needrestart) = 1)
		if NOT (($winport_gfx_values_new [<i>]) = ($winport_gfx_values_old [<i>]))
			change \{winport_gfx_need_restart = 1}
		endif
	endif
	i = (<i> + 1)
	repeat <valuecount>
	change \{winport_gfx_values_old = $winport_gfx_values_new}
	winportgfxapplyoptions
	destroy_bg_viewport
endscript

script winport_gfx_reset_values 
	getarraysize \{$winport_gfx_values_new}
	valuecount = <array_size>
	i = 0
	begin
	if structurecontains structure = ($winport_gfx_menuitems [<i>]) name = option
		winportgfxgetdefaultoptionvalue option = (($winport_gfx_menuitems [<i>]).option)
		setarrayelement arrayname = winport_gfx_values_new globalarray index = <i> newvalue = <value>
	endif
	i = (<i> + 1)
	repeat <valuecount>
endscript

script winport_create_gfx_settings_menu 
	menudim = (600.0, 500.0)
	menupos = (640.0, 350.0)
	menuitemdim = (600.0, 40.0)
	menuitemoptiondim = (250.0, 40.0)
	menuitemoptionpos = (0.0, 20.0)
	menuitemoptionjust = [left center]
	menuitemvaluedim = (250.0, 40.0)
	menuitemvaluepos = (600.0, 20.0)
	menuitemvaluejust = [right center]
	menuitemhilitedim = (650.0, 60.0)
	menuitemhilitepos = (-25.0, 34.0)
	menuitemhilitejust = [left center]
	menuitemhiliterot = -0.5
	createscreenelement \{type = containerelement
		parent = root_window
		id = screen_container
		pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	create_menu_backdrop \{texture = venue_bg}
	createscreenelement \{type = spriteelement
		id = light_overlay
		parent = screen_container
		texture = venue_overlay
		pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [
			center
			center
		]
		z_priority = 100}
	displaysprite \{parent = screen_container
		tex = graphics_options_poster_part1
		pos = (640.0, 360.0)
		scale = (1.6, 1.7)
		just = [
			center
			center
		]
		z = 1
		rot_angle = 2}
	displaysprite \{parent = screen_container
		tex = graphics_options_poster_part2
		pos = (640.0, 360.0)
		scale = (1.6, 1.7)
		just = [
			center
			center
		]
		z = 2
		rot_angle = 2}
	displaysprite \{parent = screen_container
		tex = graphics_options_poster_part3
		pos = (640.0, 360.0)
		scale = (1.6, 1.7)
		just = [
			center
			center
		]
		z = 3
		rot_angle = 2}
	createscreenelement \{type = textelement
		parent = screen_container
		text = "GRAPHICS"
		pos = (837.0, 180.0)
		scale = (1.8, 1.6800001)
		just = [
			center
			center
		]
		rgba = [
			50
			0
			0
			255
		]
		font = text_a5
		z_priority = 10
		rot_angle = 6
		shadow
		shadow_rgba = [
			160
			130
			105
			255
		]
		shadow_offs = (-3.0, 3.0)}
	displaysprite \{parent = screen_container
		tex = tape_v_01
		pos = (1070.0, 330.0)
		dims = (96.0, 192.0)
		z = 5
		rot_angle = 190}
	displaysprite \{parent = screen_container
		tex = tape_v_01
		rgba = [
			0
			0
			0
			128
		]
		pos = (1067.0, 333.0)
		dims = (96.0, 192.0)
		z = 5
		rot_angle = 190}
	displaysprite \{parent = screen_container
		tex = tape_h_02
		pos = (190.0, 475.0)
		dims = (127.0, 64.0)
		z = 5
		rot_angle = -4}
	displaysprite \{parent = screen_container
		tex = tape_h_02
		rgba = [
			0
			0
			0
			128
		]
		pos = (187.0, 478.0)
		dims = (127.0, 64.0)
		z = 5
		rot_angle = -4}
	createscreenelement {
		type = vmenu
		id = menu
		parent = screen_container
		pos = <menupos>
		dims = <menudim>
		just = [center center]
		rot_angle = 2
		exclusive_device = ($primary_controller)
		event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_back winport_gfx_back_handler}
		]
	}
	menutextprops = {
		type = textelement
		font = text_a4
		scale = 0.7
		rgba = $winport_gfx_text_color
		z_priority = 20
		shadow
		shadow_rgba = $winport_gfx_text_dropshadow_color
		shadow_offs = (-1.5, 1.5)
	}
	getarraysize \{$winport_gfx_menuitems}
	menuitemcount = <array_size>
	i = 0
	begin
	formattext checksumname = itemid 'item%i' i = <i>
	formattext checksumname = optionid 'option%i' i = <i>
	formattext checksumname = valueid 'value%i' i = <i>
	formattext checksumname = hiliteid 'hilite%i' i = <i>
	createscreenelement {
		type = containerelement
		id = <itemid>
		parent = menu
		dims = <menuitemdim>
	}
	if structurecontains structure = ($winport_gfx_menuitems [<i>]) name = text
		setscreenelementprops {
			id = <itemid>
			event_handlers = [
				{pad_choose (($winport_gfx_menuitems [<i>]).handler) params = {i = <i>}}
				{focus winport_gfx_focus_handler params = {i = <i>}}
				{unfocus winport_gfx_unfocus_handler params = {i = <i>}}
			]
		}
		createscreenelement {
			type = spriteelement
			id = <hiliteid>
			parent = <itemid>
			texture = graphics_options_highlight
			pos = <menuitemhilitepos>
			dims = <menuitemhilitedim>
			rot_angle = <menuitemhiliterot>
			just = <menuitemhilitejust>
			alpha = 0
			z_priority = 1.5
			<mode_disable>
		}
		createscreenelement {
			<menutextprops>
			id = <optionid>
			text = (($winport_gfx_menuitems [<i>]).text)
			parent = <itemid>
			dims = <menuitemoptiondim>
			pos = <menuitemoptionpos>
			just = <menuitemoptionjust>
			<mode_disable>
		}
		if structurecontains structure = ($winport_gfx_menuitems [<i>]) name = option
			createscreenelement {
				<menutextprops>
				id = <valueid>
				text = "Value"
				parent = <itemid>
				dims = <menuitemvaluedim>
				pos = <menuitemvaluepos>
				just = <menuitemvaluejust>
				<mode_disable>
			}
			if (<i> = 1)
				if (winportissm2card)
					setscreenelementprops id = <itemid> not_focusable
					setscreenelementprops id = <optionid> rgba = [80 80 80 255]
					setscreenelementprops id = <valueid> rgba = [80 80 80 255]
				endif
			endif
			formattext checksumname = choicemenuid 'choiceMenu%i' i = <i>
			createscreenelement {
				type = vmenu
				id = <choicemenuid>
				parent = <itemid>
				event_handlers = [
					{pad_up generic_menu_up_or_down_sound params = {up}}
					{pad_down generic_menu_up_or_down_sound params = {down}}
					{pad_back winport_gfx_choice_end_handler params = {i = <i>}}
					{pad_choose winport_gfx_choice_end_handler params = {i = <i>}}
				]
			}
			winport_gfx_get_choices i = <i>
			getarraysize <choices>
			choicecount = <array_size>
			c = 0
			begin
			formattext checksumname = choiceitemid 'choiceItem%i_%c' i = <i> c = <c>
			createscreenelement {
				<menutextprops>
				id = <choiceitemid>
				parent = <choicemenuid>
				event_handlers = [
					{focus winport_gfx_choice_focus_handler params = {i = <i> c = <c>}}
				]
				<mode_disable>
			}
			c = (<c> + 1)
			repeat <choicecount>
		endif
	else
		setscreenelementprops id = <itemid> not_focusable
	endif
	i = (<i> + 1)
	repeat <menuitemcount>
	winport_gfx_load_values
	winport_gfx_update_value_items
	launchevent \{type = focus
		target = menu}
	change \{user_control_pill_text_color = [
			0
			0
			0
			255
		]}
	change \{user_control_pill_color = [
			180
			180
			180
			255
		]}
	add_user_control_helper \{text = "SELECT"
		button = green
		z = 100}
	add_user_control_helper \{text = "BACK"
		button = red
		z = 100}
	add_user_control_helper \{text = "UP/DOWN"
		button = strumbar
		z = 100}
endscript

script winport_destroy_gfx_settings_menu 
	destroyscreenelement \{id = screen_container}
	clean_up_user_control_helpers
endscript

script winport_gfx_back_handler 
	winport_gfx_save_values
	if ($winport_gfx_need_restart = 1)
		ui_flow_manager_respond_to_action \{action = need_restart}
	else
		ui_flow_manager_respond_to_action \{action = go_back}
	endif
endscript

script winport_gfx_update_value_items 
	getarraysize \{$winport_gfx_menuitems}
	menuitemcount = <array_size>
	i = 0
	begin
	if structurecontains structure = ($winport_gfx_menuitems [<i>]) name = option
		winport_gfx_get_choices i = <i>
		formattext checksumname = valueid 'value%i' i = <i>
		setscreenelementprops id = <valueid> text = (<choices> [($winport_gfx_values_new [<i>])])
	endif
	i = (<i> + 1)
	repeat <menuitemcount>
endscript

script winport_gfx_reset_handler 
	winport_gfx_reset_values
	winport_gfx_update_value_items
endscript

script winport_gfx_choice_focus_handler 
	winport_gfx_set_value i = <i> v = <c>
	winport_gfx_update_value_items
endscript

script winport_gfx_focus_handler 
	formattext checksumname = hiliteid 'hilite%i' i = <i>
	setscreenelementprops id = <hiliteid> alpha = 1
endscript

script winport_gfx_unfocus_handler 
	formattext checksumname = hiliteid 'hilite%i' i = <i>
	setscreenelementprops id = <hiliteid> alpha = 0
endscript

script winport_gfx_option_handler 
	formattext checksumname = valueid 'value%i' i = <i>
	setscreenelementprops id = <valueid> rgba = $winport_gfx_text_highlight_color
	formattext checksumname = choicemenuid 'choiceMenu%i' i = <i>
	formattext checksumname = choiceitemid 'choiceItem%i_%c' i = <i> c = ($winport_gfx_values_new [<i>])
	launchevent \{type = unfocus
		target = menu}
	launchevent type = focus target = <choicemenuid> data = {child_id = <choiceitemid>}
	winport_gfx_focus_handler i = <i>
endscript

script winport_gfx_choice_end_handler 
	formattext checksumname = valueid 'value%i' i = <i>
	setscreenelementprops id = <valueid> rgba = $winport_gfx_text_color
	formattext checksumname = choicemenuid 'choiceMenu%i' i = <i>
	launchevent type = unfocus target = <choicemenuid>
	launchevent \{type = focus
		target = menu}
endscript

script winport_create_gfx_settings_restart_popup_menu 
	create_popup_warning_menu \{textblock = {
			text = "Graphics option changes will not take effect until the game is restarted."
		}
		menu_pos = (640.0, 490.0)
		dialog_dims = (288.0, 64.0)
		options = [
			{
				func = {
					ui_flow_manager_respond_to_action
					params = {
						action = continue
					}
				}
				text = "CONTINUE"
				scale = (1.0, 1.0)
			}
		]}
endscript

script winport_destroy_gfx_settings_restart_popup_menu 
	destroy_popup_warning_menu
endscript
