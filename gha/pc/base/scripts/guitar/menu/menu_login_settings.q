login_settings_menu_font = text_a10

script create_login_settings_menu 
	create_menu_backdrop \{texture = venue_bg}
	createscreenelement \{type = containerelement
		parent = root_window
		id = login_settings_container}
	rot = -3
	displaysprite parent = login_settings_container tex = data_settings_poster pos = (640.0, 360.0) dims = (384.0, 768.0) just = [center center] rot_angle = <rot>
	change \{menu_unfocus_color = [
			60
			60
			30
			255
		]}
	change \{menu_focus_color = [
			235
			240
			200
			255
		]}
	text_params = {
		type = textelement
		font = $login_settings_menu_font
		rgba = $menu_unfocus_color
		rot_angle = <rot>
		z_priority = 5
	}
	new_menu \{scrollid = cds_scroll
		vmenuid = cds_vmenu
		menu_pos = (830.0, 105.0)
		spacing = -10
		default_colors = 0
		just = [
			center
			top
		]}
	createscreenelement \{type = containerelement
		parent = cds_vmenu
		dims = (200.0, 52.0)
		event_handlers = [
			{
				focus
				menu_login_settings_on_focus
			}
			{
				unfocus
				menu_login_settings_on_unfocus
			}
			{
				pad_choose
				menu_login_settings_on_select
			}
		]}
	createscreenelement {
		<text_params>
		parent = <id>
		text = "AUTO LOGIN ON"
		id = login_on_id
		rot_angle = -3
	}
	createscreenelement \{type = containerelement
		parent = cds_vmenu
		dims = (200.0, 52.0)
		event_handlers = [
			{
				focus
				menu_login_settings_off_focus
			}
			{
				unfocus
				menu_login_settings_off_unfocus
			}
			{
				pad_choose
				menu_login_settings_off_select
			}
		]}
	createscreenelement {
		<text_params>
		parent = <id>
		text = "AUTO LOGIN OFF"
		id = login_off_id
		rot_angle = -1
		shadow
		shadow_rgba = [175 175 150 255]
		shadow_offs = (5.0, 5.0)
	}
	createscreenelement \{type = containerelement
		parent = cds_vmenu
		dims = (200.0, 52.0)
		event_handlers = [
			{
				focus
				menu_login_settings_prompt_focus
			}
			{
				unfocus
				menu_login_settings_prompt_unfocus
			}
			{
				pad_choose
				menu_login_settings_prompt_select
			}
		]}
	createscreenelement {
		<text_params>
		parent = <id>
		text = "ALWAYS PROMPT"
		id = login_prompt_id
		shadow
		shadow_rgba = [175 175 150 255]
		shadow_offs = (5.0, 5.0)
	}
	setscreenelementlock \{id = login_prompt_id
		off}
	setscreenelementlock \{id = login_prompt_id
		on}
	getscreenelementdims \{id = login_prompt_id}
	fit_text_in_rectangle id = login_prompt_id dims = ((140.0, 0.0) + (0.0, 1.0) * <height>) only_if_larger_x = 1
	<checkmark_tex> = data_settings_checkmark
	createscreenelement {
		type = spriteelement
		parent = login_settings_container
		id = login_checkmark_id
		pos = ($login_settings_hilite_pos.loginprompt + (100.0, -10.0))
		just = [center center]
		texture = <checkmark_tex>
		z_priority = 5
		rot_angle = <rot>
	}
	createscreenelement {
		type = spriteelement
		parent = login_settings_container
		pos = ($login_settings_hilite_pos.loginon)
		id = ds_hilite
		just = [center center]
		texture = data_settings_hilite
		z_priority = 4
		rgba = [180 55 25 255]
		rot_angle = <rot>
	}
	createscreenelement {
		type = textelement
		parent = login_settings_container
		text = "AUTO LOGIN SETTING"
		font = text_a10
		pos = (650.0, 600.0)
		just = [center center]
		z_priority = 5
		rgba = [223 223 223 255]
		rot_angle = <rot>
	}
	getscreenelementdims id = <id>
	fit_text_in_rectangle id = <id> dims = ((240.0, 0.0) + (0.0, 1.0) * <height>) pos = (650.0, 600.0) only_if_larger_x = 1
	createscreenelement \{type = spriteelement
		parent = login_settings_container
		texture = tape_h_02
		pos = (480.0, 90.0)
		z_priority = 20
		dims = (128.0, 64.0)
		flip_h
		flip_v}
	createscreenelement {
		type = spriteelement
		parent = <id>
		texture = tape_h_02
		pos = (10.0, 10.0)
		rgba = [0 0 0 128]
		just = [left top]
		z_priority = 19
	}
	createscreenelement \{type = spriteelement
		parent = login_settings_container
		texture = tape_h_02
		pos = (800.0, 630.0)
		z_priority = 20
		dims = (128.0, 64.0)
		rot_angle = -25}
	createscreenelement {
		type = spriteelement
		parent = <id>
		texture = tape_h_02
		pos = (10.0, 10.0)
		rgba = [0 0 0 128]
		just = [left top]
		z_priority = 19
	}
	createscreenelement \{type = spriteelement
		parent = login_settings_container
		texture = tape_v_02
		pos = (820.0, 260.0)
		z_priority = 20
		dims = (64.0, 128.0)
		rot_angle = -25
		flip_v}
	createscreenelement {
		type = spriteelement
		parent = <id>
		texture = tape_v_02
		pos = (-20.0, 20.0)
		rgba = [0 0 0 128]
		just = [left top]
		z_priority = 19
	}
	createscreenelement \{type = spriteelement
		parent = login_settings_container
		texture = venue_overlay
		pos = (640.0, 360.0)
		just = [
			center
			center
		]
		dims = (1280.0, 720.0)
		z_priority = 99
		rgba = [
			255
			255
			255
			255
		]}
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
	netsessionfunc \{func = getautologinsetting}
	switch <autologinsetting>
		case autologinoff
		menu_login_settings_place_checkmark pos = ($login_settings_hilite_pos.loginoff + (135.0, -10.0)) time = 0
		case autologinon
		menu_login_settings_place_checkmark pos = ($login_settings_hilite_pos.loginon + (135.0, -10.0)) time = 0
		case autologinunknown
		case autologinprompt
		menu_login_settings_place_checkmark pos = ($login_settings_hilite_pos.loginprompt + (135.0, -10.0)) time = 0
	endswitch
endscript

script destroy_login_settings_menu \{destroy = 1}
	if (<destroy>)
		clean_up_user_control_helpers
		destroy_menu \{menu_id = login_settings_container}
		destroy_menu \{menu_id = cds_scroll}
	endif
endscript
login_settings_hilite_pos = {
	loginon = (630.0, 141.0)
	loginoff = (630.0, 180.0)
	loginprompt = (630.0, 225.0)
}

script menu_login_settings_on_focus 
	retail_menu_focus \{id = login_on_id}
	if screenelementexists \{id = login_on_id}
		login_on_id :setprops \{no_shadow}
	endif
	if screenelementexists \{id = ds_hilite}
		ds_hilite :domorph pos = ($login_settings_hilite_pos.loginon) time = 0.05
	endif
endscript

script menu_login_settings_on_unfocus 
	retail_menu_unfocus \{id = login_on_id}
	if screenelementexists \{id = login_on_id}
		login_on_id :setprops \{shadow
			shadow_rgba = [
				175
				175
				150
				255
			]
			shadow_offs = (5.0, 5.0)}
	endif
endscript

script menu_login_settings_off_focus 
	retail_menu_focus \{id = login_off_id}
	if screenelementexists \{id = login_off_id}
		login_off_id :setprops \{no_shadow}
	endif
	if screenelementexists \{id = ds_hilite}
		ds_hilite :domorph pos = ($login_settings_hilite_pos.loginoff) time = 0.05
	endif
endscript

script menu_login_settings_off_unfocus 
	retail_menu_unfocus \{id = login_off_id}
	if screenelementexists \{id = login_off_id}
		login_off_id :setprops \{shadow
			shadow_rgba = [
				175
				175
				150
				255
			]
			shadow_offs = (5.0, 5.0)}
	endif
endscript

script menu_login_settings_prompt_focus 
	retail_menu_focus \{id = login_prompt_id}
	if screenelementexists \{id = login_prompt_id}
		login_prompt_id :setprops \{no_shadow}
	endif
	if screenelementexists \{id = ds_hilite}
		ds_hilite :domorph pos = ($login_settings_hilite_pos.loginprompt) time = 0.05
	endif
endscript

script menu_login_settings_prompt_unfocus 
	retail_menu_unfocus \{id = login_prompt_id}
	if screenelementexists \{id = login_prompt_id}
		login_prompt_id :setprops \{shadow
			shadow_rgba = [
				175
				175
				150
				255
			]
			shadow_offs = (5.0, 5.0)}
	endif
endscript

script menu_login_settings_on_select 
	menu_login_settings_place_checkmark pos = ($login_settings_hilite_pos.loginon + (135.0, -10.0)) time = 0.25
	netsessionfunc \{func = setautologinsetting
		params = {
			autologinsetting = autologinon
		}}
endscript

script menu_login_settings_off_select 
	menu_login_settings_place_checkmark pos = ($login_settings_hilite_pos.loginoff + (135.0, -10.0)) time = 0.25
	netsessionfunc \{func = setautologinsetting
		params = {
			autologinsetting = autologinoff
		}}
endscript

script menu_login_settings_prompt_select 
	menu_login_settings_place_checkmark pos = ($login_settings_hilite_pos.loginprompt + (135.0, -10.0)) time = 0.25
	netsessionfunc \{func = setautologinsetting
		params = {
			autologinsetting = autologinprompt
		}}
endscript

script menu_login_settings_place_checkmark 
	soundevent \{event = generic_menu_back_sfx}
	if screenelementexists \{id = login_checkmark_id}
		login_checkmark_id :domorph pos = <pos> time = <time>
	endif
endscript
