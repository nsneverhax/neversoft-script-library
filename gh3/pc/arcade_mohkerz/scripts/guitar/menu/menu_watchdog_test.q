menu_watchdog_test_current_index = 0
menu_watchdog_test_total_menu_items = 0
menu_watchdog_test_timer = 0
menu_watchdog_test_block = 0
menu_watchdog_test_element_info = [
	{
		text = "START WATCHDOG TEST"
		handler = watchdog_test_start
		Pos = (650.0, 275.0)
	}
	{
		text = "CANCEL WATCHDOG TEST"
		handler = watchdog_test_cancel
		Pos = (650.0, 320.0)
	}
]
menu_watchdog_test_root_pos = (506.0, 100.0)
menu_watchdog_test_offset = (0.0, 60.0)

script create_watchdog_test_menu 
	Change \{menu_watchdog_test_current_index = 0}
	create_menu_backdrop \{texture = Venue_BG}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = watchdog_test_container}
	displaySprite \{parent = watchdog_test_container
		tex = controller_config_poster
		Pos = (640.0, 360.0)
		dims = (700.0, 700.0)
		just = [
			center
			center
		]
		rot_angle = -3}
	displaySprite \{parent = watchdog_test_container
		tex = Tape_V_01
		Pos = (1000.0, 310.0)
		dims = (96.0, 192.0)
		z = 5
		rot_angle = 170}
	displaySprite \{parent = watchdog_test_container
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
	displaySprite \{parent = watchdog_test_container
		tex = tape_H_02
		Pos = (270.0, 485.0)
		dims = (127.0, 64.0)
		z = 5
		rot_angle = -4}
	displaySprite \{parent = watchdog_test_container
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
	text_watchdog_test_desc_root_loc = (650.0, 165.0)
	displayText parent = watchdog_test_container text = "WATCHDOG TEST" Pos = <text_watchdog_test_desc_root_loc> Scale = 1 just = [center center] rgba = [250 250 250 255] font = text_a11_Large z = 10 rot_angle = -1
	text_watchdog_message_root_loc = (650.0, 640.0)
	displayText parent = watchdog_test_container id = watchdog_message_text text = "TEST FAILED" Pos = <text_watchdog_message_root_loc> Scale = 1.3 just = [center center] rgba = [250 250 250 255] font = text_a5 z = 10
	watchdog_message_text :DoMorph \{alpha = 0
		time = 0}
	GetArraySize \{$menu_watchdog_test_element_info}
	Change menu_watchdog_test_total_menu_items = <array_Size>
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
	text_params = {parent = watchdog_test_container
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
	cur_menu_pos = <menu_watchdog_test_root_pos>
	begin
	formatText checksumName = watchdog_test_text_name 'watchdog_test_text_%i' i = <index>
	CreateScreenElement {
		<text_params>
		id = <watchdog_test_text_name>
		text = ($menu_watchdog_test_element_info [<index>].text)
		Pos = ($menu_watchdog_test_element_info [<index>].Pos)
		Scale = 1
		Enabled = 1
		event_handlers = [
			{focus watchdog_test_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ($menu_watchdog_test_element_info [<index>].handler)}
			{pad_up watchdog_test_change_index params = {move = up}}
			{pad_down watchdog_test_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
	}
	<cur_menu_pos> = (<cur_menu_pos> + <menu_watchdog_test_offset>)
	<index> = (<index> + 1)
	repeat $menu_watchdog_test_total_menu_items
	LaunchEvent \{Type = focus
		target = watchdog_test_text_0}
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

script destroy_watchdog_test_menu 
	KillSpawnedScript \{Name = watchdog_timer}
	Change \{menu_watchdog_test_block = 0}
	ThrowWatchdogBone \{Seconds = 60}
	clean_up_user_control_helpers
	destroy_menu_backdrop
	destroy_menu \{menu_id = watchdog_test_container}
	destroy_menu \{menu_id = watchdog_test_scroll}
endscript

script watchdog_test_change_index \{move = up}
	formatText checksumName = last_text_id 'watchdog_test_text_%d' d = ($menu_watchdog_test_current_index)
	if (<move> = up)
		if ($menu_watchdog_test_current_index = 0)
			Change menu_watchdog_test_current_index = ($menu_watchdog_test_total_menu_items - 1)
		else
			Change menu_watchdog_test_current_index = ($menu_watchdog_test_current_index - 1)
		endif
	else
		if ($menu_watchdog_test_current_index = ($menu_watchdog_test_total_menu_items - 1))
			Change \{menu_watchdog_test_current_index = 0}
		else
			Change menu_watchdog_test_current_index = ($menu_watchdog_test_current_index + 1)
		endif
	endif
	index = ($menu_watchdog_test_current_index)
	printf "watchdog_test_change_index: index now %d" d = <index>
	if NOT is_disabled id = <last_text_id>
		LaunchEvent Type = unfocus target = <id>
	endif
	formatText checksumName = text_id 'watchdog_test_text_%d' d = <index>
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

script watchdog_test_menu_hilight 
	index = ($menu_watchdog_test_current_index)
	GetTags
	printf "watchdog_test_menu_hilight: getting elements for %s" s = <id>
	GetScreenElementProps id = <id>
	retail_menu_focus
endscript

script watchdog_test_start 
	if (menu_watchdog_test_block = 0)
		SpawnScriptNow \{watchdog_timer}
	endif
endscript

script watchdog_test_cancel 
	formatText \{TextName = message_text
		"TEST CANCELLED"
		d = $menu_watchdog_test_timer}
	watchdog_message_text :SetProps text = <message_text>
	KillSpawnedScript \{Name = watchdog_timer}
	Change \{menu_watchdog_test_block = 0}
	ThrowWatchdogBone \{Seconds = 60}
endscript

script watchdog_timer 
	Change \{menu_watchdog_test_timer = 10}
	Change \{menu_watchdog_test_block = 1}
	formatText \{TextName = message_text
		"GAME WILL RESET IN %d SECONDS!"
		d = $menu_watchdog_test_timer}
	watchdog_message_text :SetProps text = <message_text>
	watchdog_message_text :DoMorph \{alpha = 1
		time = 0}
	ThrowWatchdogBone \{Seconds = 9}
	begin
	if ($menu_watchdog_test_timer <= 0)
		break
	endif
	Wait \{1
		Second}
	Change menu_watchdog_test_timer = ($menu_watchdog_test_timer - 1)
	formatText \{TextName = message_text
		"GAME WILL RESET IN %d SECONDS!"
		d = $menu_watchdog_test_timer}
	watchdog_message_text :SetProps text = <message_text>
	repeat
	formatText \{TextName = message_text
		"TEST FAILED"
		d = $menu_watchdog_test_timer}
	watchdog_message_text :SetProps text = <message_text>
	Change \{menu_watchdog_test_block = 0}
endscript
