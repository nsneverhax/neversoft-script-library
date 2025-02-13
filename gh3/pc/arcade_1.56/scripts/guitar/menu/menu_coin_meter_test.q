menu_coin_meter_test_current_index = 0
menu_coin_meter_test_total_menu_items = 0
menu_coin_meter_test_element_info = [
	{
		text = "ADVANCE COIN METER"
		handler = coin_meter_advance
		Pos = (650.0, 275.0)
	}
]
menu_coin_meter_test_root_pos = (506.0, 100.0)
menu_coin_meter_test_offset = (0.0, 60.0)

script create_coin_meter_test_menu 
	Change \{menu_coin_meter_test_current_index = 0}
	create_menu_backdrop \{texture = Venue_BG}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = coin_meter_test_container}
	displaySprite \{parent = coin_meter_test_container
		tex = controller_config_poster
		Pos = (640.0, 360.0)
		dims = (700.0, 700.0)
		just = [
			center
			center
		]
		rot_angle = -3}
	displaySprite \{parent = coin_meter_test_container
		tex = Tape_V_01
		Pos = (1000.0, 310.0)
		dims = (96.0, 192.0)
		z = 5
		rot_angle = 170}
	displaySprite \{parent = coin_meter_test_container
		tex = Tape_V_01
		rgba = [
			0
			0
			0
			128
		]
		Pos = (997.0, 313.0)
		dims = (96.0, 192.0)
		z = 5
		rot_angle = 170}
	displaySprite \{parent = coin_meter_test_container
		tex = tape_H_02
		Pos = (270.0, 485.0)
		dims = (127.0, 64.0)
		z = 5
		rot_angle = -4}
	displaySprite \{parent = coin_meter_test_container
		tex = tape_H_02
		rgba = [
			0
			0
			0
			128
		]
		Pos = (267.0, 488.0)
		dims = (127.0, 64.0)
		z = 5
		rot_angle = -4}
	text_coin_meter_test_desc_root_loc = (650.0, 165.0)
	displayText parent = coin_meter_test_container text = "COIN METER TEST" Pos = <text_coin_meter_test_desc_root_loc> Scale = 1 just = [center center] rgba = [250 250 250 255] font = text_a11_Large z = 10 rot_angle = -1
	GetArraySize \{$menu_coin_meter_test_element_info}
	Change menu_coin_meter_test_total_menu_items = <array_Size>
	set_focus_color \{rgba = [
			230
			171
			60
			255
		]}
	set_unfocus_color \{rgba = [
			255
			255
			255
			255
		]}
	text_params = {parent = coin_meter_test_container
		Type = TextElement
		font = text_a5
		rgba = ($menu_unfocus_color)
		Scale = 1.0
		rot_angle = -1
		z_priority = 10
		Shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (-1.5, 1.5)
	}
	index = 0
	cur_menu_pos = <menu_coin_meter_test_root_pos>
	begin
	formatText checksumName = coin_meter_test_text_name 'coin_meter_test_text_%i' i = <index>
	CreateScreenElement {
		<text_params>
		id = <coin_meter_test_text_name>
		text = ($menu_coin_meter_test_element_info [<index>].text)
		Pos = ($menu_coin_meter_test_element_info [<index>].Pos)
		Scale = 1
		Enabled = 1
		event_handlers = [
			{focus coin_meter_test_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ($menu_coin_meter_test_element_info [<index>].handler)}
			{pad_up coin_meter_test_change_index params = {move = up}}
			{pad_down coin_meter_test_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
	}
	<cur_menu_pos> = (<cur_menu_pos> + <menu_coin_meter_test_offset>)
	<index> = (<index> + 1)
	repeat $menu_coin_meter_test_total_menu_items
	LaunchEvent \{Type = focus
		target = coin_meter_test_text_0}
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

script destroy_coin_meter_test_menu 
	clean_up_user_control_helpers
	destroy_menu_backdrop
	destroy_menu \{menu_id = coin_meter_test_container}
	destroy_menu \{menu_id = coin_meter_test_scroll}
endscript

script coin_meter_test_change_index \{move = up}
	formatText checksumName = last_text_id 'coin_meter_test_text_%d' d = ($menu_coin_meter_test_current_index)
	if (<move> = up)
		if ($menu_coin_meter_test_current_index = 0)
			Change menu_coin_meter_test_current_index = ($menu_coin_meter_test_total_menu_items - 1)
		else
			Change menu_coin_meter_test_current_index = ($menu_coin_meter_test_current_index - 1)
		endif
	else
		if ($menu_coin_meter_test_current_index = ($menu_coin_meter_test_total_menu_items - 1))
			Change \{menu_coin_meter_test_current_index = 0}
		else
			Change menu_coin_meter_test_current_index = ($menu_coin_meter_test_current_index + 1)
		endif
	endif
	index = ($menu_coin_meter_test_current_index)
	printf "coin_meter_test_change_index: index now %d" d = <index>
	if NOT is_disabled id = <last_text_id>
		LaunchEvent Type = unfocus target = <id>
	endif
	formatText checksumName = text_id 'coin_meter_test_text_%d' d = <index>
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

script coin_meter_test_menu_hilight 
	index = ($menu_coin_meter_test_current_index)
	GetTags
	printf "coin_meter_test_menu_hilight: getting elements for %s" s = <id>
	GetScreenElementProps id = <id>
	retail_menu_focus
endscript

script coin_meter_advance 
	CoinMeterInc \{meter = 0
		clicks = 1}
	printf \{"coin_meter_advance: meter 0 clicks 1"}
endscript
