network_menu_font = text_a5
network_start_pos = (460.0, 100.0)
menu_network_current_index = 0
network_connection_string_scale = 0.45000002
network_connection_loc_root = (25.0, 50.0)
network_connection_loc_text_off = (15.0, 10.0)
network_registration_string_scale = 0.45000002
network_registration_loc_root = (825.0, 295.0)
network_registration_loc_text_off = (15.0, 10.0)
coinup_registered = 0

script create_network_menu 
	SpawnScriptNow \{menu_music_on}
	temp_primary_controller = 2
	disable_props = {rgba = [255 128 128 255] tag_disabled}
	Change \{network_connection_loc_root = (25.0, 50.0)}
	Change \{network_registration_loc_root = (825.0, 295.0)}
	font_size = 0.95
	bluish = [130 160 175 255]
	set_focus_color \{rgba = [
			223
			223
			223
			255
		]}
	set_unfocus_color rgba = <red>
	create_menu_backdrop \{texture = Venue_BG}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = nm_container
		Scale = 1.1
		Pos = (-20.0, -20.0)}
	set_focus_color \{rgba = [
			220
			220
			220
			255
		]}
	set_unfocus_color \{rgba = [
			0
			0
			0
			255
		]}
	rot = 3
	displaySprite parent = nm_container tex = options_main_poster Pos = (640.0, 340.0) dims = (600.0, 600.0) just = [center center] rot_angle = <rot>
	displaySprite parent = nm_container id = nm_black_bg tex = options_main_highlight Pos = (500.0, 210.0) dims = (180.0, 30.0) rgba = [50 0 0 255] z = 9 just = [center center] rot_angle = <rot>
	titleScale = 1.7
	if ((German) || (Spanish))
		titleScale = 1.5
	endif
	text_network_desc_root_loc = (746.0, 50.0)
	displayText parent = nm_container text = "NETWORK" Pos = (<text_network_desc_root_loc> + (40.0, 190.0)) Scale = <titleScale> just = [center center] rgba = [50 0 0 255] font = text_a11_Large z = 10 rot = (<rot> -90) noshadow
	displayText parent = nm_container text = "NETWORK" Pos = (<text_network_desc_root_loc> + (45.0, 195.0)) Scale = <titleScale> just = [center center] rgba = [160 130 105 255] font = text_a11_Large z = 9 rot = (<rot> -89) noshadow
	displaySprite parent = nm_container id = network_monster tex = GH3_Pause_Bunny Pos = (735.0, 180.0) dims = (256.0, 256.0) z = 15 just = [center center] rot_angle = <rot>
	RunScriptOnScreenElement \{id = network_monster
		net_anim_float}
	text_params = {parent = nm_container Type = TextElement font = ($network_menu_font) rgba = ($menu_unfocus_color) Scale = <font_size> rot_angle = <rot> z_priority = 10}
	CreateScreenElement {
		<text_params>
		id = nm_text_1
		text = "REGISTER"
		Pos = (514.0, 98.0)
		Scale = 0.7
		event_handlers = [
			{focus network_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_register}}
			{pad_up network_change_index params = {move = up}}
			{pad_down network_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
	}
	<id> :SetTags bg_pos = (512.0, 93.0) bg_dims = (190.0, 53.0)
	CreateScreenElement {
		<text_params>
		id = nm_text_2
		text = "CHANGE LOCATION"
		Pos = (509.0, 140.0)
		Scale = 0.6
		event_handlers = [
			{focus network_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_change_location}}
			{pad_up network_change_index params = {move = up}}
			{pad_down network_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
	}
	<id> :SetTags bg_pos = (510.0, 135.0) bg_dims = (190.0, 39.0)
	CreateScreenElement {
		<text_params>
		id = nm_text_3
		text = "UNREGISTER"
		Pos = (507.0, 184.0)
		Scale = 0.65000004
		event_handlers = [
			{focus network_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_unregister}}
			{pad_up network_change_index params = {move = up}}
			{pad_down network_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
	}
	<id> :SetTags bg_pos = (507.0, 178.0) bg_dims = (190.0, 50.0)
	CreateScreenElement {
		<text_params>
		id = nm_text_4
		text = "CONNECTION TEST"
		Pos = (505.0, 227.0)
		Scale = 0.6
		event_handlers = [
			{focus network_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_connection_test}}
			{pad_up network_change_index params = {move = up}}
			{pad_down network_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
	}
	<id> :SetTags bg_pos = (505.0, 223.0) bg_dims = (190.0, 39.0)
	CreateScreenElement {
		<text_params>
		id = nm_text_5
		text = "UPDATES"
		Pos = (502.0, 264.0)
		Scale = 0.6
		event_handlers = [
			{focus network_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_updates}}
			{pad_up network_change_index params = {move = up}}
			{pad_down network_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
	}
	<id> :SetTags bg_pos = (502.0, 259.0) bg_dims = (190.0, 39.0)
	displaySprite \{parent = nm_container
		tex = tape_H_03
		Pos = (620.0, 600.0)
		Scale = 0.5
		z = 20}
	displaySprite {
		parent = <id>
		tex = tape_H_03
		Pos = (5.0, 5.0)
		rgba = [0 0 0 128]
		z = 19
	}
	displaySprite \{parent = nm_container
		tex = tape_H_04
		Pos = (310.0, 55.0)
		Scale = 0.5
		z = 20
		rot_angle = -20}
	displaySprite {
		parent = <id>
		tex = tape_H_04
		Pos = (5.0, 5.0)
		rgba = [0 0 0 128]
		z = 19
	}
	displaySprite \{parent = nm_container
		tex = tape_V_02
		Pos = (860.0, 160.0)
		Scale = 0.5
		z = 20}
	displaySprite {
		parent = <id>
		tex = tape_V_02
		Pos = (5.0, 5.0)
		rgba = [0 0 0 128]
		z = 19
	}
	displaySprite parent = nm_container tex = Options_Calibrate_Paper Pos = ($network_connection_loc_root - (0.0, 30.0)) noshadow Scale = 1.4
	Change network_connection_loc_root = ($network_connection_loc_root + $network_connection_loc_text_off)
	displayText parent = nm_container text = "Connection Info" Pos = ($network_connection_loc_root + (120.0, -8.0)) Scale = 0.8 just = [center center] rgba = [0 0 0 255] rot = -5 font = text_a8 z = 10 noshadow
	Change network_connection_loc_root = ($network_connection_loc_root + (0.0, 20.0))
	Change network_connection_loc_root = ($network_connection_loc_root + (0.0, 22.0))
	formatText \{TextName = np_mac_text
		"MAC: N/A"}
	displayText parent = nm_container id = nm_mac_text text = <np_mac_text> Pos = ($network_connection_loc_root) Scale = $network_connection_string_scale just = [left bottom] rgba = [0 0 0 255] font = text_a4 z = 10 noshadow
	getmacaddress
	formatText TextName = new_mac_address "MAC: %a" a = <mac_address>
	nm_mac_text :SetProps text = <new_mac_address>
	Change network_connection_loc_root = ($network_connection_loc_root + (0.0, 22.0))
	formatText \{TextName = np_ip_text
		"IP: N/A"}
	displayText parent = nm_container id = nm_ip_text text = <np_ip_text> Pos = ($network_connection_loc_root) Scale = $network_connection_string_scale just = [left bottom] rgba = [0 0 0 255] font = text_a4 z = 10 noshadow
	getipaddress
	formatText TextName = new_ip_address "IP: %a" a = <ip_address>
	nm_ip_text :SetProps text = <new_ip_address>
	Change network_connection_loc_root = ($network_connection_loc_root + (0.0, 44.0))
	formatText \{TextName = np_sessions_text
		"DB SESSIONS: N/A"}
	displayText parent = nm_container id = nm_sessions_text text = <np_sessions_text> Pos = ($network_connection_loc_root) Scale = $network_connection_string_scale just = [left bottom] rgba = [0 0 0 255] font = text_a4 z = 10 noshadow
	Change network_connection_loc_root = ($network_connection_loc_root + (0.0, 22.0))
	formatText \{TextName = np_messages_text
		"QUEUED MSGS: N/A"}
	displayText parent = nm_container id = nm_messages_text text = <np_messages_text> Pos = ($network_connection_loc_root) Scale = $network_connection_string_scale just = [left bottom] rgba = [0 0 0 255] font = text_a4 z = 10 noshadow
	displaySprite parent = nm_container tex = Options_Calibrate_Paper Pos = ($network_registration_loc_root - (0.0, 30.0)) flip_v noshadow Scale = 1.4
	Change network_registration_loc_root = ($network_registration_loc_root + $network_registration_loc_text_off)
	displayText parent = nm_container text = "Registration Info" Pos = ($network_registration_loc_root + (200.0, -8.0)) Scale = 0.8 just = [center center] rgba = [0 0 0 255] rot = 3 font = text_a8 z = 10 noshadow
	Change network_registration_loc_root = ($network_registration_loc_root + (65.0, 20.0))
	Change network_registration_loc_root = ($network_registration_loc_root + (0.0, 22.0))
	formatText \{TextName = np_unit_text
		"UNIT: N/A"}
	displayText parent = nm_container id = nm_unit_text text = <np_unit_text> Pos = ($network_registration_loc_root) Scale = $network_registration_string_scale just = [left bottom] rgba = [0 0 0 255] font = text_a4 z = 10 noshadow
	SpawnScriptLater \{network_seed_read}
	Change network_registration_loc_root = ($network_registration_loc_root + (0.0, 22.0))
	formatText \{TextName = np_operator_text
		"OPERATOR: N/A"}
	displayText parent = nm_container id = nm_operator_text text = <np_operator_text> Pos = ($network_registration_loc_root) Scale = $network_registration_string_scale just = [left bottom] rgba = [0 0 0 255] font = text_a4 z = 10 noshadow
	Change network_registration_loc_root = ($network_registration_loc_root + (0.0, 22.0))
	formatText \{TextName = np_location_text
		"LOCATION: %a"
		a = $local_register_name}
	displayText parent = nm_container id = nm_location_text text = <np_location_text> Pos = ($network_registration_loc_root) Scale = $network_registration_string_scale just = [left bottom] rgba = [0 0 0 255] font = text_a4 z = 10 noshadow
	Change network_registration_loc_root = ($network_registration_loc_root + (0.0, 22.0))
	formatText \{TextName = np_address1_text
		"ADDRESS1: %a"
		a = $local_register_address1}
	displayText parent = nm_container id = nm_address1_text text = <np_address1_text> Pos = ($network_registration_loc_root) Scale = $network_registration_string_scale just = [left bottom] rgba = [0 0 0 255] font = text_a4 z = 10 noshadow
	Change network_registration_loc_root = ($network_registration_loc_root + (0.0, 22.0))
	formatText \{TextName = np_address2_text
		"ADDRESS2: %a"
		a = $local_register_address2}
	displayText parent = nm_container id = nm_address2_text text = <np_address2_text> Pos = ($network_registration_loc_root) Scale = $network_registration_string_scale just = [left bottom] rgba = [0 0 0 255] font = text_a4 z = 10 noshadow
	Change network_registration_loc_root = ($network_registration_loc_root + (0.0, 22.0))
	formatText \{TextName = np_city_text
		"CITY: %a"
		a = $local_register_city}
	displayText parent = nm_container id = nm_city_text text = <np_city_text> Pos = ($network_registration_loc_root) Scale = $network_registration_string_scale just = [left bottom] rgba = [0 0 0 255] font = text_a4 z = 10 noshadow
	Change network_registration_loc_root = ($network_registration_loc_root + (0.0, 22.0))
	formatText \{TextName = np_state_text
		"STATE: %a"
		a = $local_register_state}
	displayText parent = nm_container id = nm_state_text text = <np_state_text> Pos = ($network_registration_loc_root) Scale = $network_registration_string_scale just = [left bottom] rgba = [0 0 0 255] font = text_a4 z = 10 noshadow
	Change network_registration_loc_root = ($network_registration_loc_root + (0.0, 22.0))
	formatText \{TextName = np_zip_text
		"ZIP: %a"
		a = $local_register_zip}
	displayText parent = nm_container id = nm_zip_text text = <np_zip_text> Pos = ($network_registration_loc_root) Scale = $network_registration_string_scale just = [left bottom] rgba = [0 0 0 255] font = text_a4 z = 10 noshadow
	Change network_registration_loc_root = ($network_registration_loc_root + (0.0, 22.0))
	formatText \{TextName = np_timezone_text
		"TIME ZONE: %a"
		a = $local_register_zone}
	displayText parent = nm_container id = nm_timezone_text text = <np_timezone_text> Pos = ($network_registration_loc_root) Scale = $network_registration_string_scale just = [left bottom] rgba = [0 0 0 255] font = text_a4 z = 10 noshadow
	Change network_registration_loc_root = ($network_registration_loc_root + (0.0, 22.0))
	formatText \{TextName = np_phone_text
		"PHONE: %a"
		a = $local_register_phone}
	displayText parent = nm_container id = nm_phone_text text = <np_phone_text> Pos = ($network_registration_loc_root) Scale = $network_registration_string_scale just = [left bottom] rgba = [0 0 0 255] font = text_a4 z = 10 noshadow
	displaySprite \{parent = nm_container
		tex = Venue_Overlay
		Pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		z = 50}
	if ($coinup_registered = 1)
		nm_text_1 :SetProps <disable_props>
		nm_text_1 :SetTags <disable_props>
		Change \{menu_network_current_index = 2}
		LaunchEvent \{Type = focus
			target = nm_text_2}
	else
		Change \{menu_network_current_index = 1}
		LaunchEvent \{Type = focus
			target = nm_text_1}
	endif
	Change \{user_control_pill_text_color = [
			0
			0
			0
			255
		]}
	Change \{user_control_pill_color = [
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

script destroy_network_menu 
	clean_up_user_control_helpers
	destroy_menu_backdrop
	destroy_menu \{menu_id = nm_container}
	destroy_menu \{menu_id = nm_scroll}
endscript

script net_anim_float 
	if NOT ScreenElementExists \{id = network_monster}
		return
	endif
	GetScreenElementProps \{id = network_monster}
	base_pos = <Pos>
	network_monster :DoMorph \{Pos = {
			(0.0, 20.0)
			relative
		}
		time = 1.0
		motion = smooth}
	begin
	network_monster :DoMorph \{Pos = {
			(0.0, -40.0)
			relative
		}
		time = 1.0
		motion = smooth}
	network_monster :DoMorph \{Pos = {
			(0.0, 40.0)
			relative
		}
		time = 1.0
		motion = smooth}
	repeat
endscript

script network_menu_hilight 
	index = ($menu_network_current_index)
	GetTags
	printf "network_menu_hilight: getting elements for %s" s = <id>
	GetScreenElementProps id = <id>
	SetScreenElementProps id = nm_black_bg Pos = <bg_pos> dims = <bg_dims>
	retail_menu_focus
endscript

script network_change_index \{move = up}
	formatText checksumName = last_text_id 'nm_text_%d' d = ($menu_network_current_index)
	if (<move> = up)
		if ($menu_network_current_index = 1)
			Change \{menu_network_current_index = 5}
		else
			Change menu_network_current_index = ($menu_network_current_index - 1)
		endif
	else
		if ($menu_network_current_index = 5)
			Change \{menu_network_current_index = 1}
		else
			Change menu_network_current_index = ($menu_network_current_index + 1)
		endif
	endif
	index = ($menu_network_current_index)
	if NOT net_is_disabled id = <last_text_id>
		LaunchEvent Type = unfocus target = <id>
	endif
	formatText checksumName = text_id 'nm_text_%d' d = <index>
	<text_id> :GetTags
	if (GotParam tag_disabled)
		if (<move> = up)
			LaunchEvent Type = pad_up target = <text_id>
		else
			LaunchEvent Type = pad_down target = <text_id>
		endif
		return
	endif
	LaunchEvent Type = focus target = <text_id>
	generic_menu_up_or_down_sound
endscript

script net_is_disabled 
	<id> :GetTags
	if (GotParam tag_disabled)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script network_seed_read 
	Wait \{5
		gameframes}
	if ScreenElementExists \{id = nm_unit_text}
		dongleseedread
		if (<dongle_success> = 1)
			formatText TextName = np_seed_text "ID: %a-GHA" a = <seed_value>
		elseif (<dongle_success> = -1)
			formatText \{TextName = np_seed_text
				"ID: Session Error"}
		elseif (<dongle_success> = -2)
			formatText \{TextName = np_seed_text
				"ID: Parse Error"}
		elseif (<dongle_success> = -3)
			formatText \{TextName = np_seed_text
				"ID: Extents Error"}
		else
			formatText \{TextName = np_seed_text
				"ID: M0HKERZ  "}
		endif
		if ScreenElementExists \{id = nm_unit_text}
			nm_unit_text :SetProps text = <np_seed_text>
		endif
	endif
endscript
network_operator_id_fs = {
	create = create_operator_id_menu
	Destroy = destroy_operator_id_menu
	actions = [
		{
			action = select_accept
			flow_state = network_operator_pin_fs
		}
	]
}
network_operator_pin_fs = {
	create = create_operator_pin_menu
	Destroy = destroy_operator_pin_menu
	actions = [
		{
			action = select_accept
			flow_state = network_operator_load_fs
		}
		{
			action = select_unregister
			flow_state = network_operator_unregister_fs
		}
	]
}
network_operator_load_fs = {
	create = create_operator_load_menu
	Destroy = destroy_operator_load_menu
	actions = [
		{
			action = load_success
			flow_state = network_operator_location_hub_fs
		}
		{
			action = load_failure
			flow_state = options_network_fs
			transition_left
		}
	]
}
network_operator_location_hub_fs = {
	create = create_operator_location_hub_menu
	Destroy = destroy_operator_location_hub_menu
	actions = [
		{
			action = select_add
			flow_state = network_operator_location_name_fs
		}
		{
			action = select_use
			flow_state = network_operator_location_confirm_fs
		}
		{
			action = go_back
			flow_state = options_network_fs
			transition_left
		}
	]
}
network_operator_location_name_fs = {
	create = create_operator_location_name_menu
	Destroy = destroy_operator_location_name_menu
	actions = [
		{
			action = select_accept
			flow_state = network_operator_location_address1_fs
		}
		{
			action = select_cancel
			flow_state = network_operator_location_hub_fs
		}
	]
}
network_operator_location_address1_fs = {
	create = create_operator_location_address1_menu
	Destroy = destroy_operator_location_address1_menu
	actions = [
		{
			action = select_accept
			flow_state = network_operator_location_address2_fs
		}
		{
			action = select_cancel
			flow_state = network_operator_location_name_fs
		}
	]
}
network_operator_location_address2_fs = {
	create = create_operator_location_address2_menu
	Destroy = destroy_operator_location_address2_menu
	actions = [
		{
			action = select_accept
			flow_state = network_operator_location_city_fs
		}
		{
			action = select_cancel
			flow_state = network_operator_location_address1_fs
		}
	]
}
network_operator_location_city_fs = {
	create = create_operator_location_city_menu
	Destroy = destroy_operator_location_city_menu
	actions = [
		{
			action = select_accept
			flow_state = network_operator_location_state_fs
		}
		{
			action = select_cancel
			flow_state = network_operator_location_address2_fs
		}
	]
}
network_operator_location_state_fs = {
	create = create_operator_location_state_menu
	Destroy = destroy_operator_location_state_menu
	actions = [
		{
			action = select_accept
			flow_state = network_operator_location_zip_fs
		}
		{
			action = select_cancel
			flow_state = network_operator_location_city_fs
		}
	]
}
network_operator_location_zip_fs = {
	create = create_operator_location_zip_menu
	Destroy = destroy_operator_location_zip_menu
	actions = [
		{
			action = select_accept
			flow_state = network_operator_location_zone_fs
		}
		{
			action = select_cancel
			flow_state = network_operator_location_state_fs
		}
	]
}
network_operator_location_zone_fs = {
	create = create_operator_location_zone_menu
	Destroy = destroy_operator_location_zone_menu
	actions = [
		{
			action = select_accept
			flow_state = network_operator_location_phone_fs
		}
		{
			action = select_cancel
			flow_state = network_operator_location_zip_fs
		}
	]
}
network_operator_location_phone_fs = {
	create = create_operator_location_phone_menu
	Destroy = destroy_operator_location_phone_menu
	actions = [
		{
			action = select_accept
			flow_state = network_operator_upload_fs
		}
		{
			action = select_cancel
			flow_state = network_operator_location_zone_fs
		}
	]
}
network_operator_upload_fs = {
	create = create_operator_upload_menu
	Destroy = destroy_operator_upload_menu
	actions = [
		{
			action = upload_success
			flow_state = network_operator_load_fs
		}
		{
			action = upload_failure
			flow_state = network_operator_location_hub_fs
		}
	]
}
network_operator_location_confirm_fs = {
	create = create_operator_location_confirm_menu
	Destroy = destroy_operator_location_confirm_menu
	actions = [
		{
			action = select_accept
			flow_state = options_network_fs
			transition_left
		}
		{
			action = go_back
			flow_state = network_operator_location_hub_fs
		}
	]
}
network_operator_unregister_fs = {
	create = create_operator_unregister_menu
	Destroy = destroy_operator_unregister_menu
	actions = [
		{
			action = select_accept
			flow_state = options_network_fs
			transition_left
		}
		{
			action = go_back
			flow_state = options_network_fs
			transition_left
		}
	]
}
network_connection_test_fs = {
	create = create_connection_test_menu
	Destroy = destroy_connection_test_menu
	actions = [
		{
			action = go_back
			flow_state = options_network_fs
			transition_left
		}
	]
}
