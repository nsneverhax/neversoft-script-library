winport_bb_device_num = 0
winport_bb_text_color = [
	202
	243
	113
	255
]
winport_bb_text_dropshadow_color = [
	0
	0
	0
	255
]
winport_bb_text_highlight_color = [
	64
	184
	246
	255
]
winport_bb_text_disable_color = [
	139
	198
	17
	255
]
winport_bb_kb_menuitems = [
	{
		text = "Green Fret / Confirm"
		handler = winport_bb_choose_control
		actionnum = 0
	}
	{
		text = "Red Fret / Cancel"
		handler = winport_bb_choose_control
		actionnum = 1
	}
	{
		text = "Yellow Fret"
		handler = winport_bb_choose_control
		actionnum = 2
	}
	{
		text = "Blue Fret"
		handler = winport_bb_choose_control
		actionnum = 3
	}
	{
		text = "Orange Fret"
		handler = winport_bb_choose_control
		actionnum = 4
	}
	{
		text = "Star Power"
		handler = winport_bb_choose_control
		actionnum = 5
	}
	{
		text = "Whammy"
		handler = winport_bb_choose_control
		actionnum = 12
	}
	{
		text = "Mouse Whammy"
		controlname = "X-Axis"
		handler = winport_null_script
		disable
	}
	{
		text = "Strum Up / Menu Up"
		handler = winport_bb_choose_control
		actionnum = 10
	}
	{
		text = "Strum Down / Menu Down"
		handler = winport_bb_choose_control
		actionnum = 9
	}
	{
		text = ""
		handler = winport_null_script
		disable
	}
	{
		text = "Reset to Default Keyboard/Mouse"
		handler = winport_bb_reset_to_config1
	}
	{
		text = "Reset to Default Keyboard"
		handler = winport_bb_reset_to_config2
	}
]
winport_bb_menuitems = [
]

script winport_null_script 
endscript

script winport_create_bind_buttons 
	change \{winport_bb_menuitems = $winport_bb_kb_menuitems}
	menudim = (600.0, 500.0)
	menupos = (640.0, 370.0)
	menuitemdim = (600.0, 32.0)
	menuitemoptiondim = (250.0, 32.0)
	menuitemoptionpos = (0.0, 16.0)
	menuitemoptionjust = [left center]
	menuitemvaluedim = (300.0, 32.0)
	menuitemvaluepos = (630.0, 16.0)
	menuitemvaluejust = [right center]
	menuitemhilitedim = (665.0, 50.0)
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
		tex = controller_config_poster
		pos = (640.0, 360.0)
		scale = (1.5, 1.7)
		just = [
			center
			center
		]
		z = 1
		rot_angle = -2}
	createscreenelement \{type = textelement
		parent = screen_container
		text = "KEYBOARD"
		pos = (830.0, 100.0)
		scale = (1.51, 1.3)
		just = [
			center
			center
		]
		rgba = [
			202
			243
			113
			255
		]
		font = text_a5
		z_priority = 10
		rot_angle = -2.8
		shadow
		shadow_rgba = [
			0
			0
			0
			255
		]
		shadow_offs = (-3.0, 3.0)}
	displaysprite \{parent = screen_container
		tex = tape_v_01
		pos = (205.0, 65.0)
		dims = (96.0, 192.0)
		z = 5
		rot_angle = -1}
	displaysprite \{parent = screen_container
		tex = tape_v_01
		rgba = [
			0
			0
			0
			128
		]
		pos = (202.0, 68.0)
		dims = (96.0, 192.0)
		z = 4
		rot_angle = -1}
	displaysprite \{parent = screen_container
		tex = tape_h_02
		pos = (945.0, 550.0)
		dims = (132.0, 64.0)
		z = 5
		rot_angle = 8}
	displaysprite \{parent = screen_container
		tex = tape_h_02
		rgba = [
			0
			0
			0
			128
		]
		pos = (942.0, 553.0)
		dims = (132.0, 64.0)
		z = 4
		rot_angle = 8}
	createscreenelement {
		type = vmenu
		id = menu
		parent = screen_container
		pos = <menupos>
		dims = <menudim>
		rot_angle = -2
		just = [center center]
		event_handlers = $default_event_handlers
	}
	menutextprops = {
		type = textelement
		font = text_a11
		scale = (0.7, 0.5)
		rgba = $winport_bb_text_color
		z_priority = 20
		shadow
		shadow_rgba = $winport_bb_text_dropshadow_color
		shadow_offs = (-1.5, 1.5)
	}
	getarraysize \{$winport_bb_menuitems}
	i = 0
	begin
	formattext checksumname = itemid 'item%d' d = <i>
	formattext checksumname = actionid 'action%d' d = <i>
	formattext checksumname = controlid 'control%d' d = <i>
	formattext checksumname = hiliteid 'hilite%d' d = <i>
	createscreenelement {
		type = containerelement
		id = <itemid>
		parent = menu
		dims = <menuitemdim>
	}
	setscreenelementprops {
		id = <itemid>
		event_handlers = [
			{pad_choose (($winport_bb_menuitems [<i>]).handler) params = {index = <i> menuitem = ($winport_bb_menuitems [<i>])}}
			{focus winport_bb_focus params = {index = <i>}}
			{unfocus winport_bb_unfocus params = {index = <i>}}
		]
	}
	createscreenelement {
		type = spriteelement
		id = <hiliteid>
		parent = <itemid>
		texture = controller_config_highlight
		pos = <menuitemhilitepos>
		dims = <menuitemhilitedim>
		just = <menuitemhilitejust>
		rot_angle = <menuitemhiliterot>
		alpha = 0
		z_priority = 3
	}
	createscreenelement {
		<menutextprops>
		id = <actionid>
		text = (($winport_bb_menuitems [<i>]).text)
		parent = <itemid>
		dims = <menuitemoptiondim>
		pos = <menuitemoptionpos>
		just = <menuitemoptionjust>
	}
	createscreenelement {
		<menutextprops>
		id = <controlid>
		text = ""
		parent = <itemid>
		dims = <menuitemvaluedim>
		pos = <menuitemvaluepos>
		just = <menuitemvaluejust>
	}
	if structurecontains structure = ($winport_bb_menuitems [<i>]) name = disable
		setscreenelementprops id = <itemid> not_focusable
		setscreenelementprops id = <actionid> rgba = $winport_bb_text_disable_color
		setscreenelementprops id = <controlid> rgba = $winport_bb_text_disable_color
	endif
	i = (<i> + 1)
	repeat <array_size>
	winport_bb_update_option_values
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

script winport_destroy_bind_buttons 
	destroyscreenelement \{id = screen_container}
	clean_up_user_control_helpers
endscript

script winport_bb_update_option_values 
	getarraysize \{$winport_bb_menuitems}
	i = 0
	begin
	formattext checksumname = controlid 'control%d' d = <i>
	if structurecontains structure = ($winport_bb_menuitems [<i>]) name = actionnum
		winportsiogetcontrolbinding devicenum = $winport_bb_device_num actionnum = (($winport_bb_menuitems [<i>]).actionnum)
		winportsiogetcontrolname devicenum = $winport_bb_device_num controlnum = <controlnum>
		setscreenelementprops id = <controlid> text = <controlname>
	elseif structurecontains structure = ($winport_bb_menuitems [<i>]) name = controlname
		setscreenelementprops id = <controlid> text = (($winport_bb_menuitems [<i>]).controlname)
	endif
	i = (<i> + 1)
	repeat <array_size>
endscript

script winport_bb_choose_control 
	launchevent \{type = unfocus
		target = menu}
	winport_bb_focus index = <index>
	formattext checksumname = controlid 'control%d' d = <index>
	setscreenelementprops id = <controlid> rgba = $winport_bb_text_highlight_color
	winport_wait_for_no_control_press devicenum = $winport_bb_device_num actionnum = (<menuitem>.actionnum)
	winport_wait_for_control_press devicenum = $winport_bb_device_num actionnum = (<menuitem>.actionnum)
	winport_wait_for_no_control_press devicenum = $winport_bb_device_num actionnum = (<menuitem>.actionnum)
	winportsiosetcontrolbinding devicenum = $winport_bb_device_num actionnum = (<menuitem>.actionnum) controlnum = <controlnum>
	setscreenelementprops id = <controlid> rgba = $winport_bb_text_color
	winport_bb_update_option_values
	launchevent \{type = focus
		target = menu}
endscript

script winport_bb_reset_to_config1 
	getarraysize \{$winport_bb_menuitems}
	i = 0
	begin
	if structurecontains structure = ($winport_bb_menuitems [<i>]) name = actionnum
		winportsiosetcontrolbinding devicenum = $winport_bb_device_num actionnum = (($winport_bb_menuitems [<i>]).actionnum) controlnum = -1
	endif
	i = (<i> + 1)
	repeat <array_size>
	winport_bb_update_option_values
endscript

script winport_bb_reset_to_config2 
	getarraysize \{$winport_bb_menuitems}
	i = 0
	begin
	if structurecontains structure = ($winport_bb_menuitems [<i>]) name = actionnum
		winportsiosetcontrolbinding devicenum = $winport_bb_device_num actionnum = (($winport_bb_menuitems [<i>]).actionnum) controlnum = -2
	endif
	i = (<i> + 1)
	repeat <array_size>
	winport_bb_update_option_values
endscript

script winport_bb_focus 
	formattext checksumname = hiliteid 'hilite%d' d = <index>
	setscreenelementprops id = <hiliteid> alpha = 1
endscript

script winport_bb_unfocus 
	formattext checksumname = hiliteid 'hilite%d' d = <index>
	setscreenelementprops id = <hiliteid> alpha = 0
endscript

script winport_wait_for_no_control_press 
	begin
	if NOT winportsiogetcontrolpress devicenum = <devicenum> actionnum = <actionnum>
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script winport_wait_for_control_press 
	begin
	if winportsiogetcontrolpress devicenum = <devicenum> actionnum = <actionnum>
		break
	endif
	wait \{1
		gameframe}
	repeat
	return controlnum = <controlnum>
endscript
