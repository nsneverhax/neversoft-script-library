diagnostics_menu_font = text_a5
g_diagnostics_start_pos = (460.0, 100.0)
diagnostics_version_loc_root = (25.0, 50.0)

script create_diagnostics_menu 
	SpawnScriptNow \{menu_music_on}
	temp_primary_controller = 2
	disable_props = {rgba = [255 128 128 255] tag_disabled}
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
		id = dm_container
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
	displaySprite parent = dm_container tex = options_main_poster Pos = (640.0, 340.0) dims = (600.0, 600.0) just = [center center] rot_angle = <rot>
	displaySprite parent = dm_container id = dm_black_bg tex = options_main_highlight Pos = (500.0, 210.0) dims = (180.0, 30.0) rgba = [50 0 0 255] z = 9 just = [center center] rot_angle = <rot>
	titleScale = 1.7
	if ((German) || (Spanish))
		titleScale = 1.5
	endif
	text_diagnostics_desc_root_loc = (746.0, 110.0)
	displayText parent = dm_container text = "DIAGNOSTICS" Pos = (<text_diagnostics_desc_root_loc> + (40.0, 190.0)) Scale = <titleScale> just = [center center] rgba = [50 0 0 255] font = text_a11_Large z = 10 rot = (<rot> -90) noshadow
	displayText parent = dm_container text = "DIAGNOSTICS" Pos = (<text_diagnostics_desc_root_loc> + (45.0, 195.0)) Scale = <titleScale> just = [center center] rgba = [160 130 105 255] font = text_a11_Large z = 9 rot = (<rot> -89) noshadow
	displaySprite parent = dm_container id = diagnostics_monster tex = Options_Calibrate_Starpower_BG3 Pos = (735.0, 180.0) dims = (256.0, 256.0) z = 15 just = [center center] rot_angle = <rot>
	RunScriptOnScreenElement \{id = diagnostics_monster
		diag_anim_float}
	text_params = {parent = dm_container Type = TextElement font = ($diagnostics_menu_font) rgba = ($menu_unfocus_color) Scale = <font_size> rot_angle = <rot> z_priority = 10}
	CreateScreenElement {
		<text_params>
		id = dm_text_1
		text = "SWITCH TEST"
		Pos = (506.0, 100.0)
		Scale = 0.75
		Enabled = 0
		event_handlers = [
			{focus diagnostics_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_switch_test}}
			{pad_up diagnostics_change_index params = {move = up}}
			{pad_down diagnostics_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
	}
	<id> :SetTags bg_pos = (512.0, 93.0) bg_dims = (190.0, 53.0)
	GetScreenElementDims id = <id>
	if (<width> > 190)
		SetScreenElementProps id = <id> Scale = 1
		fit_text_in_rectangle id = <id> dims = (175.0, 35.0) Pos = (506.0, 100.0)
	endif
	CreateScreenElement {
		<text_params>
		id = dm_text_2
		text = "AUDIO TEST"
		Pos = (501.0, 140.0)
		Scale = 0.65000004
		event_handlers = [
			{focus diagnostics_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_audio_test}}
			{pad_up diagnostics_change_index params = {move = up}}
			{pad_down diagnostics_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
	}
	<id> :SetTags bg_pos = (510.0, 135.0) bg_dims = (190.0, 39.0)
	GetScreenElementDims id = <id>
	if (<width> > 190)
		SetScreenElementProps id = <id> Scale = 1
		fit_text_in_rectangle id = <id> dims = (175.0, 35.0) Pos = (501.0, 140.0)
	endif
	CreateScreenElement {
		<text_params>
		id = dm_text_3
		text = "MONITOR TEST"
		Pos = (507.0, 184.0)
		Scale = 0.7
		event_handlers = [
			{focus diagnostics_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_monitor_test}}
			{pad_up diagnostics_change_index params = {move = up}}
			{pad_down diagnostics_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
	}
	<id> :SetTags bg_pos = (508.0, 178.0) bg_dims = (192.0, 52.0)
	GetScreenElementDims id = <id>
	if (<width> > 190)
		SetScreenElementProps id = <id> Scale = 1
		fit_text_in_rectangle id = <id> dims = (175.0, 40.0) Pos = (507.0, 184.0)
	endif
	CreateScreenElement {
		<text_params>
		id = dm_text_4
		text = "LAMP TEST"
		Pos = (503.0, 225.0)
		Scale = 0.55
		event_handlers = [
			{focus diagnostics_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_lamp_test}}
			{pad_up diagnostics_change_index params = {move = up}}
			{pad_down diagnostics_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
	}
	<id> :SetTags bg_pos = (505.0, 221.0) bg_dims = (192.0, 38.0)
	GetScreenElementDims id = <id>
	if (<width> > 190)
		SetScreenElementProps id = <id> Scale = 1
		fit_text_in_rectangle id = <id> dims = (175.0, 40.0) Pos = (503.0, 225.0)
	endif
	CreateScreenElement {
		<text_params>
		id = dm_text_5
		text = "WATCHDOG TEST"
		Pos = (497.0, 263.0)
		Scale = 0.6
		event_handlers = [
			{focus diagnostics_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_watchdog_test}}
			{pad_up diagnostics_change_index params = {move = up}}
			{pad_down diagnostics_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
	}
	<id> :SetTags bg_pos = (500.0, 258.0) bg_dims = (186.0, 38.0)
	GetScreenElementDims id = <id>
	if (<width> > 180)
		SetScreenElementProps id = <id> Scale = 1
		fit_text_in_rectangle id = <id> dims = (165.0, 33.0) Pos = (497.0, 266.0)
	endif
	CreateScreenElement {
		<text_params>
		id = dm_text_6
		text = "COIN METER TEST"
		Pos = (500.0, 307.0)
		Scale = 0.65000004
		Enabled = 0
		event_handlers = [
			{focus diagnostics_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_coin_meter_test}}
			{pad_up diagnostics_change_index params = {move = up}}
			{pad_down diagnostics_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
	}
	<id> :SetTags bg_pos = (502.0, 302.0) bg_dims = (190.0, 55.0)
	GetScreenElementDims id = <id>
	if (<width> > 185)
		SetScreenElementProps id = <id> Scale = 1
		fit_text_in_rectangle id = <id> dims = (170.0, 45.0) Pos = (498.0, 307.0)
	endif
	CreateScreenElement {
		<text_params>
		id = dm_text_7
		text = "DIP SWITCH TEST"
		Pos = (500.0, 354.0)
		Scale = 0.65000004
		event_handlers = [
			{focus diagnostics_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_dip_switch_test}}
			{pad_up diagnostics_change_index params = {move = up}}
			{pad_down diagnostics_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
	}
	<id> :SetTags bg_pos = (500.0, 348.0) bg_dims = (190.0, 50.0)
	GetScreenElementDims id = <id>
	if (<width> > 190)
		SetScreenElementProps id = <id> Scale = 1
		fit_text_in_rectangle id = <id> dims = (175.0, 45.0) Pos = (500.0, 354.0)
	endif
	CreateScreenElement {
		<text_params>
		id = dm_text_8
		text = "VOLUME TEST"
		Pos = (499.0, 398.0)
		Scale = 0.65000004
		event_handlers = [
			{focus diagnostics_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_volume_adjustment_test}}
			{pad_up diagnostics_change_index params = {move = up}}
			{pad_down diagnostics_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
	}
	<id> :SetTags bg_pos = (496.0, 392.0) bg_dims = (190.0, 50.0)
	displaySprite \{parent = dm_container
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
	displaySprite \{parent = dm_container
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
	displaySprite \{parent = dm_container
		tex = tape_V_02
		Pos = (855.0, 360.0)
		Scale = 0.5
		z = 20}
	displaySprite {
		parent = <id>
		tex = tape_V_02
		Pos = (5.0, 5.0)
		rgba = [0 0 0 128]
		z = 19
	}
	displaySprite \{parent = dm_container
		tex = Venue_Overlay
		Pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		z = 50}
	Change \{menu_diagnostics_current_index = 1}
	LaunchEvent \{Type = focus
		target = dm_text_1}
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

script diag_anim_float 
	if NOT ScreenElementExists \{id = diagnostics_monster}
		return
	endif
	GetScreenElementProps \{id = diagnostics_monster}
	base_pos = <Pos>
	diagnostics_monster :DoMorph \{Pos = {
			(0.0, 20.0)
			relative
		}
		time = 1.0
		motion = smooth}
	begin
	diagnostics_monster :DoMorph \{Pos = {
			(0.0, -40.0)
			relative
		}
		time = 1.0
		motion = smooth}
	diagnostics_monster :DoMorph \{Pos = {
			(0.0, 40.0)
			relative
		}
		time = 1.0
		motion = smooth}
	repeat
endscript

script destroy_diagnostics_menu 
	clean_up_user_control_helpers
	destroy_menu_backdrop
	destroy_menu \{menu_id = dm_container}
	destroy_menu \{menu_id = dm_scroll}
endscript
menu_diagnostics_current_index = 0

script diagnostics_change_index \{move = up}
	formatText checksumName = last_text_id 'dm_text_%d' d = ($menu_diagnostics_current_index)
	if (<move> = up)
		if ($menu_diagnostics_current_index = 1)
			Change \{menu_diagnostics_current_index = 8}
		else
			Change menu_diagnostics_current_index = ($menu_diagnostics_current_index - 1)
		endif
	else
		if ($menu_diagnostics_current_index = 8)
			Change \{menu_diagnostics_current_index = 1}
		else
			Change menu_diagnostics_current_index = ($menu_diagnostics_current_index + 1)
		endif
	endif
	index = ($menu_diagnostics_current_index)
	if NOT diag_is_disabled id = <last_text_id>
		LaunchEvent Type = unfocus target = <id>
	endif
	formatText checksumName = text_id 'dm_text_%d' d = <index>
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

script diag_is_disabled 
	<id> :GetTags
	if (GotParam tag_disabled)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script diagnostics_menu_hilight 
	index = ($menu_diagnostics_current_index)
	GetTags
	printf "diagnostics_menu_hilight: getting elements for %s" s = <id>
	GetScreenElementProps id = <id>
	SetScreenElementProps id = dm_black_bg Pos = <bg_pos> dims = <bg_dims>
	retail_menu_focus
endscript
diagnostics_audio_test_fs = {
	create = create_audio_test_menu
	Destroy = destroy_audio_test_menu
	actions = [
		{
			action = go_back
			flow_state = options_diagnostics_fs
			transition_left
		}
	]
}
diagnostics_monitor_test_fs = {
	create = create_color_bar_test
	Destroy = destroy_color_bar_test
	actions = [
		{
			action = next_monitor_test
			flow_state = diagnostics_white_test_fs
			transition_right
		}
		{
			action = go_back
			flow_state = options_diagnostics_fs
			transition_left
		}
	]
}
diagnostics_white_test_fs = {
	create = create_white_test
	Destroy = destroy_white_test
	actions = [
		{
			action = next_monitor_test
			flow_state = diagnostics_red_test_fs
			transition_right
		}
		{
			action = go_back
			flow_state = options_diagnostics_fs
			transition_left
		}
	]
}
diagnostics_red_test_fs = {
	create = create_red_test
	Destroy = destroy_red_test
	actions = [
		{
			action = next_monitor_test
			flow_state = diagnostics_green_test_fs
			transition_right
		}
		{
			action = go_back
			flow_state = options_diagnostics_fs
			transition_left
		}
	]
}
diagnostics_green_test_fs = {
	create = create_green_test
	Destroy = destroy_green_test
	actions = [
		{
			action = next_monitor_test
			flow_state = diagnostics_blue_test_fs
			transition_right
		}
		{
			action = go_back
			flow_state = options_diagnostics_fs
			transition_left
		}
	]
}
diagnostics_blue_test_fs = {
	create = create_blue_test
	Destroy = destroy_blue_test
	actions = [
		{
			action = next_monitor_test
			flow_state = diagnostics_convergence_test_fs
			transition_right
		}
		{
			action = go_back
			flow_state = options_diagnostics_fs
			transition_left
		}
	]
}
diagnostics_convergence_test_fs = {
	create = create_convergence_test
	Destroy = destroy_convergence_test
	actions = [
		{
			action = next_monitor_test
			flow_state = options_diagnostics_fs
			transition_right
		}
		{
			action = go_back
			flow_state = options_diagnostics_fs
			transition_left
		}
	]
}
diagnostics_lamp_test_fs = {
	create = create_lamp_test_menu
	Destroy = destroy_lamp_test_menu
	actions = [
		{
			action = go_back
			flow_state = options_diagnostics_fs
			transition_left
		}
	]
}
diagnostics_dip_switch_test_fs = {
	create = create_dip_switch_test_menu
	Destroy = destroy_dip_switch_test_menu
	actions = [
		{
			action = go_back
			flow_state = options_diagnostics_fs
			transition_left
		}
	]
}
diagnostics_watchdog_test_fs = {
	create = create_watchdog_test_menu
	Destroy = destroy_watchdog_test_menu
	actions = [
		{
			action = go_back
			flow_state = options_diagnostics_fs
			transition_left
		}
	]
}
diagnostics_coin_meter_test_fs = {
	create = create_coin_meter_test_menu
	Destroy = destroy_coin_meter_test_menu
	actions = [
		{
			action = go_back
			flow_state = options_diagnostics_fs
			transition_left
		}
	]
}
diagnostics_switch_test_fs = {
	create = create_switch_test_menu
	Destroy = destroy_switch_test_menu
	actions = [
		{
			action = continue
			flow_state = options_diagnostics_fs
			transition_left
		}
	]
}
diagnostics_volume_adjustment_test_fs = {
	create = create_volume_adjustment_test_menu
	Destroy = destroy_volume_adjustment_test_menu
	actions = [
		{
			action = go_back
			flow_state = options_diagnostics_fs
			transition_left
		}
	]
}

script create_color_bar_test 
	event_handlers = [
		{pad_choose ui_flow_manager_respond_to_action params = {action = next_monitor_test}}
		{pad_back ui_flow_manager_respond_to_action params = {action = go_back}}
	]
	new_menu {
		scrollid = menu_color_bar_test
		vmenuid = vmenu_color_bar_test
		menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
		exclusive_device = None
	}
	LaunchEvent \{Type = focus
		target = menu_color_bar_test}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = color_bar_container
		Pos = (0.0, 0.0)}
	displaySprite \{parent = color_bar_container
		tex = color_bars
		Pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [
			center
			center
		]}
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
	add_user_control_helper \{text = "NEXT"
		button = green
		z = 100}
	add_user_control_helper \{text = "QUIT"
		button = red
		z = 100}
endscript

script destroy_color_bar_test 
	clean_up_user_control_helpers
	destroy_menu \{menu_id = color_bar_container}
	destroy_menu \{menu_id = menu_color_bar_test}
endscript

script create_white_test 
	event_handlers = [
		{pad_choose ui_flow_manager_respond_to_action params = {action = next_monitor_test}}
		{pad_back ui_flow_manager_respond_to_action params = {action = go_back}}
	]
	new_menu {
		scrollid = menu_white_test
		vmenuid = vmenu_white_test
		menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
		exclusive_device = None
	}
	LaunchEvent \{Type = focus
		target = menu_white_test}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = white_container
		Pos = (0.0, 0.0)}
	CreateScreenElement \{Type = SpriteElement
		parent = white_container
		id = white_rect
		just = [
			center
			center
		]
		Pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		rgba = [
			255
			255
			255
			255
		]}
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
	add_user_control_helper \{text = "NEXT"
		button = green
		z = 100}
	add_user_control_helper \{text = "QUIT"
		button = red
		z = 100}
endscript

script destroy_white_test 
	clean_up_user_control_helpers
	destroy_menu \{menu_id = white_container}
	destroy_menu \{menu_id = menu_white_test}
endscript

script create_red_test 
	event_handlers = [
		{pad_choose ui_flow_manager_respond_to_action params = {action = next_monitor_test}}
		{pad_back ui_flow_manager_respond_to_action params = {action = go_back}}
	]
	new_menu {
		scrollid = menu_red_test
		vmenuid = vmenu_red_test
		menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
		exclusive_device = None
	}
	LaunchEvent \{Type = focus
		target = menu_red_test}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = red_container
		Pos = (0.0, 0.0)}
	CreateScreenElement \{Type = SpriteElement
		parent = red_container
		id = red_rect
		just = [
			center
			center
		]
		Pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		rgba = [
			255
			0
			0
			255
		]}
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
	add_user_control_helper \{text = "NEXT"
		button = green
		z = 100}
	add_user_control_helper \{text = "QUIT"
		button = red
		z = 100}
endscript

script destroy_red_test 
	clean_up_user_control_helpers
	destroy_menu \{menu_id = red_container}
	destroy_menu \{menu_id = menu_red_test}
endscript

script create_green_test 
	event_handlers = [
		{pad_choose ui_flow_manager_respond_to_action params = {action = next_monitor_test}}
		{pad_back ui_flow_manager_respond_to_action params = {action = go_back}}
	]
	new_menu {
		scrollid = menu_green_test
		vmenuid = vmenu_green_test
		menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
		exclusive_device = None
	}
	LaunchEvent \{Type = focus
		target = menu_green_test}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = green_container
		Pos = (0.0, 0.0)}
	CreateScreenElement \{Type = SpriteElement
		parent = green_container
		id = green_rect
		just = [
			center
			center
		]
		Pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		rgba = [
			0
			255
			0
			255
		]}
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
	add_user_control_helper \{text = "NEXT"
		button = green
		z = 100}
	add_user_control_helper \{text = "QUIT"
		button = red
		z = 100}
endscript

script destroy_green_test 
	clean_up_user_control_helpers
	destroy_menu \{menu_id = green_container}
	destroy_menu \{menu_id = menu_green_test}
endscript

script create_blue_test 
	event_handlers = [
		{pad_choose ui_flow_manager_respond_to_action params = {action = next_monitor_test}}
		{pad_back ui_flow_manager_respond_to_action params = {action = go_back}}
	]
	new_menu {
		scrollid = menu_blue_test
		vmenuid = vmenu_blue_test
		menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
		exclusive_device = None
	}
	LaunchEvent \{Type = focus
		target = menu_blue_test}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = blue_container
		Pos = (0.0, 0.0)}
	CreateScreenElement \{Type = SpriteElement
		parent = blue_container
		id = blue_rect
		just = [
			center
			center
		]
		Pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		rgba = [
			0
			0
			255
			255
		]}
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
	add_user_control_helper \{text = "NEXT"
		button = green
		z = 100}
	add_user_control_helper \{text = "QUIT"
		button = red
		z = 100}
endscript

script destroy_blue_test 
	clean_up_user_control_helpers
	destroy_menu \{menu_id = blue_container}
	destroy_menu \{menu_id = menu_blue_test}
endscript

script create_convergence_test 
	event_handlers = [
		{pad_choose ui_flow_manager_respond_to_action params = {action = next_monitor_test}}
		{pad_back ui_flow_manager_respond_to_action params = {action = go_back}}
	]
	new_menu {
		scrollid = menu_convergence_test
		vmenuid = vmenu_convergence_test
		menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
		exclusive_device = None
	}
	LaunchEvent \{Type = focus
		target = menu_convergence_test}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = convergence_container
		Pos = (0.0, 0.0)}
	displaySprite \{parent = convergence_container
		tex = convergence
		Pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [
			center
			center
		]}
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
	add_user_control_helper \{text = "NEXT"
		button = green
		z = 100}
	add_user_control_helper \{text = "QUIT"
		button = red
		z = 100}
endscript

script destroy_convergence_test 
	clean_up_user_control_helpers
	destroy_menu \{menu_id = convergence_container}
	destroy_menu \{menu_id = menu_convergence_test}
endscript
