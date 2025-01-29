calibrate_lag_menu_font = text_a4
calibrate_lag_menu_line_pos = (420.0, 360.0)
calibrate_lag_menu_circle_dims = (96.0, 96.0)
calibrate_lag_menu_circle_velocity = 300
calibrate_lag_menu_circle_inital_pos = (420.0, -146.0)
calibrate_lag_menu_circle_separation = 320
calibrate_lag_menu_num_circles = 10
calibrate_lag_hilite_pos0 = (678.0, 438.0)
calibrate_lag_hilite_dims0 = (430.0, 50.0)
calibrate_lag_hilite_pos1 = (678.0, 477.0)
calibrate_lag_hilite_dims1 = (430.0, 50.0)
calibrate_lag_hilite_pos2 = (678.0, 525.0)
calibrate_lag_hilite_dims2 = (430.0, 50.0)
calibrate_lag_hilite_pos3 = (678.0, 570.0)
calibrate_lag_hilite_dims3 = (430.0, 50.0)
calibrate_lag_hilite_unselected = [
	40
	100
	165
	255
]
calibrate_lag_hilite_selected = [
	165
	95
	50
	255
]
calibrate_lag_results = [
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
]
calibrate_lag_circle_index = 0
calibrate_lag_real_time_requirement = 0
calibrate_lag_dirty = 0
calibrate_lag_end_checks = 0
calibrate_lag_started_finish = 0
calibrate_lag_cap = 200
calibrate_lag_early_window = -150
calibrate_lag_late_window = 400
cl_ready_for_input = 0
calibrate_lag_most_recent_in_game_setting = 0
calibrate_lag_section = None

script create_calibrate_lag_dialog_menu 
	if GotParam \{dialog_1}
		setup_calibration_lag_dialog_1
	elseif GotParam \{dialog_2}
		setup_calibration_lag_dialog_2
	endif
	if ($calibrate_lag_most_recent_in_game_setting = 1)
		<controller> = ($last_start_pressed_device)
	else
		<controller> = ($primary_controller)
	endif
	create_calibrate_background \{z = 80}
	memcard_cleanup_messages
	create_popup_warning_menu {
		player_device = <controller>
		no_background
		title = <title_text>
		textblock = {
			text = <body_text>
			dims = (600.0, 400.0)
			Scale = 0.85
		}
		menu_pos = (640.0, 490.0)
		dialog_dims = (288.0, 64.0)
		helper_pills = [select]
		options = [
			{
				func = {ui_flow_manager_respond_to_action params = {action = continue}}
				text = 'CONTINUE'
				Scale = (1.0, 1.0)
			}
		]
	}
endscript

script destroy_calibrate_lag_dialog_menu 
	destroy_menu \{menu_id = cl_container}
	memcard_cleanup_messages
	destroy_popup_warning_menu
endscript

script create_calibrate_lag_menu \{from_in_game = 1}
	Change calibrate_lag_most_recent_in_game_setting = <from_in_game>
	kill_start_key_binding
	menu_music_off \{setflag = 1}
	if ViewportExists \{id = bg_viewport}
		disable_bg_viewport
	endif
	Change \{calibrate_lag_end_checks = 0}
	Change \{calibrate_lag_started_finish = 0}
	set_focus_color \{Color = white230}
	set_unfocus_color \{rgba = $calibrate_lag_hilite_unselected}
	z = 100
	create_calibrate_background <...>
	calibrate_lag_fill_options z = <z> from_in_game = <from_in_game>
	if NOT ScreenElementExists \{id = cl_container}
		return
	endif
	displaySprite {
		parent = cl_container
		id = calibrate_lag_target
		tex = Options_Calibrate_Target
		Pos = ($calibrate_lag_menu_line_pos + ($calibrate_lag_menu_circle_dims * 0.5))
		just = [center center]
		dims = (96.0, 96.0)
		z = (<z> + 50)
		alpha = 0.75
	}
	displaySprite \{parent = cl_container
		id = cl_ping_ID
		tex = Options_Audio_Ping
		alpha = 0
		Scale = 5
		z = 180
		just = [
			center
			center
		]
		Pos = (468.0, 406.0)}
	cl_ping_ID :DoMorph \{alpha = 0}
	Change \{user_control_pill_text_color = [
			240
			240
			240
			255
		]}
	Change \{user_control_pill_color = [
			180
			180
			180
			255
		]}
	add_user_control_helper \{text = 'SELECT'
		button = green
		z = 100}
	add_user_control_helper \{text = 'BACK'
		button = red
		z = 100}
	add_user_control_helper \{text = 'UP/DOWN'
		button = strumbar
		z = 100}
	if ($calibrate_lag_section = None)
		LaunchEvent \{Type = focus
			target = cl_vmenu}
	endif
	if ($calibrate_lag_section = video)
		LaunchEvent \{Type = pad_choose
			target = calibrate_calibrate_option}
	elseif ($calibrate_lag_section = audio)
		LaunchEvent \{Type = pad_choose
			target = calibrate_calibrate_option}
	endif
endscript

script create_calibrate_background 
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = cl_container
		Pos = (0.0, 0.0)}
	create_menu_backdrop \{texture = Venue_BG}
	displaySprite {
		parent = cl_container
		tex = Venue_BG
		Pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [center center]
		z = (<z> - 4)
	}
	displaySprite {
		parent = cl_container
		tex = Options_Calibrate_Poster
		Pos = (250.0, 0.0)
		dims = (432.0, 954.0)
		z = <z>
	}
	displaySprite {
		parent = cl_container
		tex = Options_Calibrate_Paper
		Pos = (600.0, -100.0)
		dims = (610.0, 892.0)
		z = (<z> -2)
	}
	displaySprite {
		parent = cl_container
		tex = Toprockers_Tape_2
		Pos = (720.0, -100.0)
		dims = (180.0, 80.0)
		z = (<z> + 2)
		rot_angle = 93
	}
	displaySprite {
		parent = cl_container
		tex = Toprockers_Tape_2
		rgba = [0 0 0 128]
		Pos = (725.0, -102.0)
		dims = (180.0, 80.0)
		z = (<z> + 2)
		rot_angle = 93
	}
	<tape_offset> = (90.0, 325.0)
	displaySprite {
		parent = cl_container
		tex = Tape_V_01
		Pos = ((970.0, 106.0) + <tape_offset>)
		dims = (96.0, 192.0)
		z = (<z> + 2)
		flip_v
		rot_angle = -6
	}
	displaySprite {
		parent = cl_container
		tex = Tape_V_01
		rgba = [0 0 0 128]
		Pos = ((975.0, 104.0) + <tape_offset>)
		dims = (96.0, 192.0)
		z = (<z> + 2)
		flip_v
		rot_angle = -6
	}
	displaySprite {
		parent = cl_container
		tex = tape_H_02
		Pos = (220.0, 566.0)
		dims = (132.0, 64.0)
		z = (<z> + 2)
		rot_angle = 8
	}
	displaySprite {
		parent = cl_container
		tex = tape_H_02
		rgba = [0 0 0 128]
		Pos = (212.0, 572.0)
		dims = (132.0, 64.0)
		z = (<z> + 2)
		rot_angle = 8
	}
	displayText \{parent = cl_container
		text = 'HDTV LAG'
		Pos = (770.0, 80.0)
		font = fontgrid_title_gh3
		rgba = [
			0
			0
			0
			255
		]
		noshadow}
	upper_helper = 'Some HDTVs have an audio/video delay that makes playing difficult. If you\'re ready to blame your TV, try calibrating.'
	CreateScreenElement {
		Type = TextBlockElement
		parent = cl_container
		Pos = (695.0, 85.0)
		text = <upper_helper>
		font = text_a6
		dims = (575.0, 0.0)
		allow_expansion
		rgba = [60 40 115 255]
		Scale = 0.65000004
		just = [left top]
		internal_just = [left top]
		z_priority = <z>
	}
	GetScreenElementDims id = <id>
	GetScreenElementPosition id = <id>
endscript

script calibrate_lag_fill_options \{z = 100}
	if (<from_in_game>)
		<controller> = ($last_start_pressed_device)
	else
		<controller> = ($primary_controller)
	endif
	displaySprite parent = cl_container id = calibrate_lag_hilite tex = Options_Calibrate_Hilite Pos = $calibrate_lag_hilite_pos0 rgba = $calibrate_lag_hilite_unselected z = <z>
	calib_eh = [
		{pad_back menu_calibrate_go_back}
	]
	new_menu {
		scrollid = cl_scroll
		vmenuid = cl_vmenu
		menu_pos = (700.0, 435.0)
		event_handlers = <calib_eh>
		exclusive_device = <controller>
		text_left
		default_colors = 0
		spacing = -5
		no_focus = 1
	}
	Wait \{2
		gameframes}
	text_params = {parent = cl_vmenu Type = TextElement font = ($calibrate_lag_menu_font) rgba = ($menu_unfocus_color) Scale = 1.2}
	CreateScreenElement {
		<text_params>
		id = calibrate_calibrate_option
		text = 'CALIBRATE'
		event_handlers = [
			{focus menu_calibrate_focus params = {index = 0}}
			{unfocus menu_calibrate_unfocus params = {index = 0}}
			{pad_choose menu_calibrate_lag_create_circles params = {z = <z> device_num = <controller>}}
		]
		z_priority = (<z> + 1)
		Pos = (0.0, 26.0)
	}
	GetScreenElementDims id = <id>
	fit_text_in_rectangle id = <id> dims = ((340.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1
	CreateScreenElement {
		<text_params>
		id = calibrate_reset_option
		text = 'RESET'
		event_handlers = [
			{focus menu_calibrate_focus params = {index = 1}}
			{unfocus menu_calibrate_unfocus params = {index = 1}}
			{pad_choose menu_calibrate_lag_reset_lag params = {z = <z>}}
		]
		z_priority = (<z> + 1)
	}
	GetScreenElementDims id = <id>
	fit_text_in_rectangle id = <id> dims = ((340.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1
	CreateScreenElement \{Type = ContainerElement
		parent = cl_vmenu
		id = calibrate_manual_option_audio
		event_handlers = [
			{
				focus
				menu_calibrate_focus
				params = {
					index = 2
				}
			}
			{
				unfocus
				menu_calibrate_unfocus
				params = {
					index = 2
				}
			}
			{
				pad_choose
				menu_calibrate_lag_manual_choose
				params = {
					audio
				}
			}
		]}
	<container_id> = <id>
	CreateScreenElement {
		<text_params>
		parent = <container_id>
		id = lag_offset_text_audio
		text = ' '
		just = [left top]
		z_priority = (<z> + 1)
		Pos = (40.0, 0.0)
	}
	getlanguage
	if (<language> = language_french)
		GetScreenElementDims \{id = lag_offset_text_audio}
		fit_text_in_rectangle id = lag_offset_text_audio dims = ((12.0, 0.0) + (<height> * (0.0, 1.1)))
	endif
	CreateScreenElement {
		Type = SpriteElement
		id = cl_manual_adjust_up_arrow_audio
		parent = <container_id>
		texture = Online_Arrow
		just = [center bottom]
		Pos = (16.0, 25.0)
		rgba = ($calibrate_lag_hilite_unselected)
		alpha = 1
		Scale = 0.75
		z_priority = (<z> + 1)
		flip_h
	}
	CreateScreenElement {
		Type = SpriteElement
		id = cl_manual_adjust_down_arrow_audio
		parent = <container_id>
		texture = Online_Arrow
		just = [center top]
		Pos = (16.0, 28.0)
		rgba = ($calibrate_lag_hilite_unselected)
		alpha = 1
		Scale = 0.75
		z_priority = (<z> + 1)
	}
	CreateScreenElement \{Type = ContainerElement
		parent = cl_vmenu
		id = calibrate_manual_option
		event_handlers = [
			{
				focus
				menu_calibrate_focus
				params = {
					index = 3
				}
			}
			{
				unfocus
				menu_calibrate_unfocus
				params = {
					index = 3
				}
			}
			{
				pad_choose
				menu_calibrate_lag_manual_choose
			}
		]}
	<container_id> = <id>
	CreateScreenElement {
		<text_params>
		parent = <container_id>
		id = lag_offset_text
		text = ' '
		just = [left top]
		z_priority = (<z> + 1)
		Pos = (40.0, 52.0)
	}
	calibrate_lag_update_text
	CreateScreenElement {
		Type = SpriteElement
		id = cl_manual_adjust_up_arrow
		parent = <container_id>
		texture = Online_Arrow
		just = [center bottom]
		Pos = (16.0, 75.0)
		rgba = ($calibrate_lag_hilite_unselected)
		alpha = 1
		Scale = 0.75
		z_priority = (<z> + 1)
		flip_h
	}
	CreateScreenElement {
		Type = SpriteElement
		id = cl_manual_adjust_down_arrow
		parent = <container_id>
		texture = Online_Arrow
		just = [center top]
		Pos = (16.0, 79.0)
		rgba = ($calibrate_lag_hilite_unselected)
		alpha = 1
		Scale = 0.75
		z_priority = (<z> + 1)
	}
	SetScreenElementLock \{id = cl_vmenu
		On}
endscript

script calibrate_lag_update_text 
	GetGlobalTags \{user_options}
	CastToInteger \{lag_calibration}
	if (<lag_calibration> < 1000)
		<lag_calibration> = (<lag_calibration> + 1000)
	endif
	audio_lag = ((<lag_calibration> / 1000) - 1)
	CastToInteger \{audio_lag}
	formatText TextName = lag_value_text 'Audio: %d ms' d = <audio_lag>
	lag_offset_text_audio :SetProps text = <lag_value_text>
	Mod a = <lag_calibration> b = 1000
	formatText TextName = lag_value_text 'Video: %d ms' d = <Mod>
	lag_offset_text :SetProps text = <lag_value_text>
endscript

script destroy_calibrate_lag_menu 
	SpawnScriptNow \{menu_music_on
		params = {
			setflag = 1
		}}
	if ViewportExists \{id = bg_viewport}
		enable_bg_viewport
	endif
	Change \{calibrate_lag_dirty = 0}
	destroy_menu_backdrop
	clean_up_user_control_helpers
	KillSpawnedScript \{Name = do_calibration_update}
	destroy_menu \{menu_id = cl_scroll}
	destroy_menu \{menu_id = cl_container}
	if ScreenElementExists \{idcl_manual_adjust_handler}
		DestroyScreenElement \{id = cl_manual_adjust_handler}
	endif
	LaunchEvent \{Type = focus
		target = root_window}
endscript

script menu_calibrate_focus 
	generic_menu_up_or_down_sound
	WaitOneGameFrame
	if (<index> = 0)
		retail_menu_focus
		SetScreenElementProps \{id = calibrate_lag_hilite
			Pos = $calibrate_lag_hilite_pos0
			dims = $calibrate_lag_hilite_dims0}
	elseif (<index> = 1)
		retail_menu_focus
		SetScreenElementProps \{id = calibrate_lag_hilite
			Pos = $calibrate_lag_hilite_pos1
			dims = $calibrate_lag_hilite_dims1}
	elseif (<index> = 2)
		Obj_GetID
		retail_menu_focus id = {<objID> child = 0}
		SetScreenElementProps \{id = calibrate_lag_hilite
			Pos = $calibrate_lag_hilite_pos2
			dims = $calibrate_lag_hilite_dims2}
		DoScreenElementMorph \{id = cl_manual_adjust_up_arrow_audio
			rgba = $menu_focus_color}
		DoScreenElementMorph \{id = cl_manual_adjust_down_arrow_audio
			rgba = $menu_focus_color}
	else
		Obj_GetID
		retail_menu_focus id = {<objID> child = 0}
		SetScreenElementProps \{id = calibrate_lag_hilite
			Pos = $calibrate_lag_hilite_pos3
			dims = $calibrate_lag_hilite_dims3}
		DoScreenElementMorph \{id = cl_manual_adjust_up_arrow
			rgba = $menu_focus_color}
		DoScreenElementMorph \{id = cl_manual_adjust_down_arrow
			rgba = $menu_focus_color}
	endif
endscript

script menu_calibrate_unfocus 
	if (<index> = 0)
		retail_menu_unfocus
	elseif (<index> = 1)
		retail_menu_unfocus
	elseif (<index> = 2)
		Obj_GetID
		retail_menu_unfocus id = {<objID> child = 0}
		DoScreenElementMorph id = cl_manual_adjust_up_arrow_audio rgba = ($calibrate_lag_hilite_unselected)
		DoScreenElementMorph id = cl_manual_adjust_down_arrow_audio rgba = ($calibrate_lag_hilite_unselected)
	else
		Obj_GetID
		retail_menu_unfocus id = {<objID> child = 0}
		DoScreenElementMorph id = cl_manual_adjust_up_arrow rgba = ($calibrate_lag_hilite_unselected)
		DoScreenElementMorph id = cl_manual_adjust_down_arrow rgba = ($calibrate_lag_hilite_unselected)
	endif
endscript

script play_calibrate_click 
	Wait \{0.583
		Seconds}
	formatText TextName = tex '%t' t = (3 - <i>)
	SetScreenElementProps id = cl_countdown_text text = <tex>
	if ($calibrate_lag_section = audio)
		SoundEvent \{event = GH_SFX_HitNoteSoundEvent}
	endif
endscript

script menu_calibrate_lag_create_circles 
	PlaySound \{Heavy_Crowd_Loop_Good_01
		buss = Default
		vol = 1
		num_loops = -1}
	if ($transitions_locked = 1 || $menu_flow_locked = 1)
		return
	endif
	if ($calibrate_lag_section = None)
		ui_flow_manager_respond_to_action \{action = show_dialog_1}
		return
	endif
	CreateScreenElement {
		parent = cl_container Type = TextElement font = ($calibrate_lag_menu_font) rgba = ($menu_unfocus_color)
		id = clm_dummy_event_handler
		text = ''
		z_priority = <z>
	}
	LaunchEvent \{Type = focus
		target = clm_dummy_event_handler}
	LaunchEvent \{Type = unfocus
		target = cl_vmenu}
	clean_up_user_control_helpers
	add_user_control_helper \{text = 'STRUM'
		button = strumbar
		z = 100}
	destroy_menu \{menu_id = cl_scroll}
	destroy_menu \{menu_id = calibrate_lag_hilite}
	kill_debug_elements
	init_play_log
	generic_menu_pad_choose_sound
	displaySprite {
		id = cl_countdown_circle
		parent = cl_container
		tex = Song_Summary_Circle_2p
		Pos = ($calibrate_lag_menu_line_pos + (13.0, 14.0))
		rgba = [220 220 220 208]
		dims = (72.0, 72.0)
		z = 199
	}
	CreateScreenElement {
		Type = TextElement
		id = cl_countdown_text
		parent = cl_container
		Pos = ($calibrate_lag_menu_line_pos + (49.0, 45.0))
		Scale = (1.333, 1.333)
		text = ''
		font = ($calibrate_lag_menu_font)
		rgba = [0 0 0 255]
		z_priority = 200
	}
	<sep> = ($calibrate_lag_menu_circle_separation * 1.0)
	<vel> = ($calibrate_lag_menu_circle_velocity * 1.0)
	<seconds_between_circles> = (<sep> / <vel>)
	<i> = 0
	begin
	SpawnScriptNow \{cl_do_ping
		params = {
			time = 0.6
		}}
	SpawnScriptNow play_calibrate_click params = {<...>}
	Wait (<seconds_between_circles> + 0.01) Seconds
	<i> = (<i> + 1)
	repeat 3
	Change \{calibrate_lag_circle_index = 0}
	half_circle_width = 0
	circle_index = 0
	begin
	formatText checksumName = circle_id 'circle%d' d = <circle_index>
	circle_pos = (($calibrate_lag_menu_circle_inital_pos) - ((0.0, 1.0) * <circle_index> * ($calibrate_lag_menu_circle_separation)))
	if pal
		0x637cf000 = (1.0 / 50.0)
	else
		0x637cf000 = (1.0 / 60.0)
	endif
	<one_frame> = (<0x637cf000> * $calibrate_lag_menu_circle_velocity)
	CastToInteger \{one_frame}
	<y_off> = ($calibrate_lag_menu_line_pos.(0.0, 1.0) - <circle_pos>.(0.0, 1.0))
	<steps> = (<y_off> / <one_frame>)
	CastToInteger \{steps}
	<new_y_off> = ($calibrate_lag_menu_line_pos.(0.0, 1.0) - (<steps> * <one_frame>))
	<circle_pos> = ((<circle_pos>.(1.0, 0.0) * (1.0, 0.0)) + (<new_y_off> * (0.0, 1.0)))
	circle_alpha = 0.5
	if ($calibrate_lag_section = audio)
		<circle_alpha> = 0
	endif
	CreateScreenElement {
		Type = SpriteElement
		parent = cl_container
		texture = Options_Calibrate_Note
		id = <circle_id>
		Pos = <circle_pos>
		dims = ($calibrate_lag_menu_circle_dims)
		just = [left top]
		rgba = [255 255 255 255]
		z_priority = (<z> + 51)
		alpha = <circle_alpha>
	}
	<circle_id> :SetTags existence = 0 hit = 0 check = 1
	<circle_id> :SetTags initial_position = <circle_pos>
	<circle_id> :SetTags time_requirement = (<steps> * <0x637cf000>)
	<circle_index> = (<circle_index> + 1)
	repeat ($calibrate_lag_menu_num_circles)
	LaunchEvent \{Type = unfocus
		target = root_window}
	WaitOneGameFrame
	Change \{cl_ready_for_input = 0}
	SpawnScriptNow \{cl_do_ping
		params = {
			time = 0.6
		}}
	SpawnScriptNow do_calibration_update params = {device_num = <device_num>}
	Wait \{0.563
		Seconds}
	SetScreenElementProps \{id = cl_countdown_text
		text = 'GO!'
		Scale = 0.9}
	if ($calibrate_lag_section = audio)
		SoundEvent \{event = GH_SFX_HitNoteSoundEvent}
	endif
	cl_ping_ID :DoMorph \{alpha = 0}
	Wait \{0.4
		Seconds}
	SetScreenElementProps \{id = cl_countdown_circle
		alpha = 0}
	Change \{cl_ready_for_input = 1}
	DoScreenElementMorph \{id = calibrate_lag_target
		alpha = 1}
	WaitOneGameFrame
	SetScreenElementProps \{id = cl_countdown_text
		alpha = 0}
endscript

script menu_calibrate_go_back 
	if ($transitions_locked = 1 || $menu_flow_locked = 1)
		return
	endif
	if ScreenElementExists \{id = cl_scroll}
		LaunchEvent \{Type = unfocus
			target = cl_scroll}
	endif
	if ScreenElementExists \{id = cl_vmenu}
		LaunchEvent \{Type = unfocus
			target = cl_vmenu}
	endif
	skiprenderframes \{10}
	if ($calibrate_lag_dirty = 1)
		ui_flow_manager_respond_to_action \{action = continue}
	else
		ui_flow_manager_respond_to_action \{action = go_back}
	endif
endscript

script menu_calibrate_lag_destroy_circles 
	circle_index = 0
	begin
	formatText checksumName = circle_id 'circle%d' d = <circle_index>
	destroy_menu menu_id = <circle_id>
	<circle_index> = (<circle_index> + 1)
	repeat ($calibrate_lag_menu_num_circles)
	destroy_menu \{menu_id = clm_dummy_event_handler}
endscript

script do_calibration_update 
	<circle_index> = 0
	begin
	formatText checksumName = circle_id 'circle%d' d = <circle_index>
	<circle_id> :SetTags sounded = 0 pinged = 0
	<circle_index> = (<circle_index> + 1)
	repeat ($calibrate_lag_menu_num_circles)
	begin
	circle_index = 0
	num_circles_gone = 0
	if pal
		0x637cf000 = (1.0 / 50.0)
	else
		0x637cf000 = (1.0 / 60.0)
	endif
	delta_time = <0x637cf000>
	if (($calibrate_lag_end_checks = 0) && $cl_ready_for_input)
		if ControllerMake up <device_num>
			SpawnScriptNow menu_calibrate_lag_do_guitar_check_up_down params = {device_num = <device_num>}
		endif
		if ControllerMake down <device_num>
			SpawnScriptNow menu_calibrate_lag_do_guitar_check_up_down params = {device_num = <device_num>}
		endif
		if ControllerMake X <device_num>
			SpawnScriptNow menu_calibrate_lag_do_guitar_check_choose params = {device_num = <device_num>}
		endif
	endif
	begin
	formatText checksumName = circle_id 'circle%d' d = <circle_index>
	<circle_id> :GetTags
	<existence> = (<existence> + <delta_time>)
	update_difference = (<delta_time>)
	position_change = (<update_difference> * ($calibrate_lag_menu_circle_velocity))
	CastToInteger \{position_change}
	GetScreenElementPosition id = <circle_id>
	<screenelementpos> = (<screenelementpos> + (0.0, 1.0) * <position_change>)
	<target_pos> = ($calibrate_lag_menu_line_pos)
	diff = ((<screenelementpos>.(0.0, 1.0)) - (<target_pos>.(0.0, 1.0)))
	if (<diff> < 0)
		<diff> = (0 - <diff>)
	endif
	<cl_tweak> = ($0x77783bfc / 1000.0)
	if ((($calibrate_lag_menu_circle_velocity) * <cl_tweak>) >= <diff>)
		if (<sounded> = 0)
			if ($calibrate_lag_section = audio)
				SoundEvent \{event = GH_SFX_HitNoteSoundEvent}
			endif
			<circle_id> :SetTags sounded = 1
		endif
	endif
	if (<diff> < <position_change>)
		circle_alpha = 1
		if ($calibrate_lag_section = audio)
			<circle_alpha> = 0
		endif
		SetScreenElementProps id = <circle_id> rgba = [135 0 180 255] alpha = <circle_alpha>
	endif
	if ((<screenelementpos>.(0.0, 1.0)) > ($calibrate_lag_menu_line_pos.(0.0, 1.0) + ($calibrate_lag_menu_circle_dims.(0.0, 1.0))))
		if (<hit> = 0 && <check> = 1)
			Change calibrate_lag_circle_index = (($calibrate_lag_circle_index) + 1)
			<circle_id> :SetTags check = 0
		endif
		<num_circles_gone> = (<num_circles_gone> + 1)
		<circle_id> :Obj_SpawnScriptNow cl_fade_circle params = {id = <circle_id>}
	endif
	<circle_id> :SetProps Pos = (<screenelementpos>)
	<circle_id> :SetTags existence = <existence>
	<circle_index> = (<circle_index> + 1)
	repeat ($calibrate_lag_menu_num_circles)
	if (<num_circles_gone> = $calibrate_lag_menu_num_circles)
		SpawnScriptLater \{kill_off_and_finish_calibration}
	endif
	WaitOneGameFrame
	repeat
endscript

script cl_fade_circle 
	if ($calibrate_lag_section = video)
		<id> :DoMorph rgba = [0 0 0 255] alpha = 0.5 time = 0.009
	endif
endscript

script cl_do_ping \{time = 0.066}
	cl_ping_ID :DoMorph \{Scale = 10
		alpha = 0}
	cl_ping_ID :DoMorph Scale = 1 alpha = 1 motion = ease_in time = <time>
	cl_ping_ID :DoMorph \{alpha = 0
		motion = ease_in
		time = 0.1}
endscript

script menu_calibrate_lag_do_guitar_check_choose 
	if ($calibrate_lag_end_checks = 0)
		if NOT IsGuitarController controller = <device_num>
			menu_calibrate_lag_say_lines_are_even
		endif
	endif
endscript

script menu_calibrate_lag_do_guitar_check_up_down 
	if ($calibrate_lag_end_checks = 0)
		if IsGuitarController controller = <device_num>
			menu_calibrate_lag_say_lines_are_even
		endif
	endif
endscript

script menu_calibrate_lag_say_lines_are_even 
	if ($calibrate_lag_end_checks = 1)
		return
	endif
	formatText checksumName = circle_id 'circle%d' d = ($calibrate_lag_circle_index)
	if NOT ScreenElementExists id = <circle_id>
		return
	endif
	if NOT ScreenElementExists \{id = calibrate_lag_target}
		return
	endif
	<circle_id> :GetTags
	GetScreenElementPosition id = <circle_id>
	GetScreenElementDims id = <circle_id>
	input_difference = (<time_requirement> - <existence>)
	new_input_diff = (<input_difference> * 1000)
	<new_input_diff> = (0 - <new_input_diff>)
	if (<new_input_diff> < $calibrate_lag_early_window)
		return
	endif
	if (<new_input_diff> > $calibrate_lag_late_window)
		return
	endif
	SetArrayElement ArrayName = calibrate_lag_results globalarray index = ($calibrate_lag_circle_index) NewValue = <new_input_diff>
	output_log_text 'Calibrate: %o' o = <new_input_diff> Color = white
	get_closest_circle_above_line
	<circle_id> :SetTags hit = 1
	Change calibrate_lag_circle_index = (($calibrate_lag_circle_index) + 1)
	<closest_id> :SetProps Hide
	calibrate_lag_target :DoMorph \{Scale = 1.5
		relative_scale
		time = 0.05}
	calibrate_lag_target :DoMorph \{Scale = 1.0
		relative_scale
		time = 0.05}
	if (($calibrate_lag_circle_index) = ($calibrate_lag_menu_num_circles))
		Change \{calibrate_lag_end_checks = 1}
		kill_off_and_finish_calibration
	endif
endscript

script kill_off_and_finish_calibration 
	if ScreenElementExists \{id = clm_dummy_event_handler}
		LaunchEvent \{Type = unfocus
			target = clm_dummy_event_handler}
	endif
	KillSpawnedScript \{Name = do_calibration_update}
	menu_calibrate_lag_finish_up_calibration
	menu_calibrate_lag_destroy_circles
	if ($calibrate_lag_section = dialog_2)
		ui_flow_manager_respond_to_action \{action = show_dialog_2}
	endif
endscript

script get_closest_circle_above_line 
	if ($calibrate_lag_end_checks = 1)
		return
	endif
	i = 0
	begin
	formatText checksumName = circle_id 'circle%d' d = <i>
	GetScreenElementPosition id = <circle_id>
	if ((<screenelementpos>.(0.0, 1.0)) < ($calibrate_lag_menu_line_pos.(0.0, 1.0) + ($calibrate_lag_menu_circle_dims.(0.0, 1.25))))
		<circle_id> :GetTags
		if NOT (<hit>)
			return closest_id = <circle_id> hit = 1
		endif
	endif
	<i> = (<i> + 1)
	repeat $calibrate_lag_menu_num_circles hit = 0
	return closest_id = <circle_id>
endscript

script menu_calibrate_lag_finish_up_calibration 
	if ($calibrate_lag_started_finish = 1)
		return
	endif
	Change \{calibrate_lag_started_finish = 1}
	min = 50000.0
	Max = -50000.0
	index = 0
	num_hit = 0
	total_val = 0.0
	begin
	formatText checksumName = circle_id 'circle%d' d = <index>
	if NOT ScreenElementExists id = <circle_id>
		return
	endif
	<circle_id> :GetTags
	if (<hit>)
		<num_hit> = (<num_hit> + 1)
		val = ($calibrate_lag_results [<index>])
		if (<val> < <min>)
			<min> = (<val>)
		endif
		if (<val> > <Max>)
			<Max> = (<val>)
		endif
		<total_val> = (<total_val> + <val>)
	endif
	<index> = (<index> + 1)
	repeat ($calibrate_lag_menu_num_circles)
	if (<num_hit> > 2)
		<total_val> = (<total_val> - <min>)
		<total_val> = (<total_val> - <Max>)
		avg = (<total_val> / (<num_hit> - 2))
		if (<avg> < 0)
			<avg> = 0
		elseif (<avg> > $calibrate_lag_cap)
			<avg> = $calibrate_lag_cap
		endif
		CastToInteger \{avg}
		GetGlobalTags \{user_options}
		if ($calibrate_lag_section = audio)
			old_lag = <lag_calibration>
			SetGlobalTags user_options params = {lag_calibration = ((<avg> * 1000) + 1000)}
		elseif ($calibrate_lag_section = video)
			stopsound \{Heavy_Crowd_Loop_Good_01}
			old_lag = <lag_calibration>
			<old_lag> = ((<old_lag> / 1000) - 1)
			CastToInteger \{old_lag}
			<old_lag> = ((<old_lag> * 1000) + 1000)
			SetGlobalTags user_options params = {lag_calibration = (<old_lag> + <avg>)}
		endif
	endif
	if ($calibrate_lag_section = audio)
		Change \{calibrate_lag_section = dialog_2}
	elseif ($calibrate_lag_section = video)
		Change \{calibrate_lag_section = None}
	endif
	LaunchEvent \{Type = focus
		target = root_window}
	Wait \{30
		gameframes}
	if ($calibrate_lag_section = None)
		destroy_calibrate_lag_menu
		create_calibrate_lag_menu from_in_game = ($calibrate_lag_most_recent_in_game_setting)
	endif
	if GotParam \{avg}
		if GotParam \{old_lag}
			CastToInteger \{avg}
			if NOT (<old_lag> = <avg>)
				Change \{calibrate_lag_dirty = 1}
			endif
		endif
	endif
endscript

script menu_calibrate_lag_reset_lag 
	generic_menu_up_or_down_sound
	GetGlobalTags \{user_options}
	if (<lag_calibration> = 1000)
		return
	endif
	SetGlobalTags \{user_options
		params = {
			lag_calibration = 1000
		}}
	calibrate_lag_update_text
	Change \{calibrate_lag_dirty = 1}
endscript

script menu_calibrate_lag_manual_choose 
	SetScreenElementProps \{id = calibrate_lag_hilite
		rgba = $calibrate_lag_hilite_selected}
	SetScreenElementProps \{id = cl_vmenu
		block_events}
	CreateScreenElement {
		Type = ContainerElement
		parent = cl_container
		id = cl_manual_adjust_handler
		event_handlers = [
			{pad_up menu_calibrate_lag_manual_up params = {<...>}}
			{pad_down menu_calibrate_lag_manual_down params = {<...>}}
			{pad_choose menu_calibrate_lag_manual_back}
			{pad_back menu_calibrate_lag_manual_back}
		]
	}
	LaunchEvent \{Type = focus
		target = cl_manual_adjust_handler}
	generic_menu_pad_choose_sound
endscript

script menu_calibrate_lag_manual_back 
	SetScreenElementProps \{id = calibrate_lag_hilite
		rgba = $calibrate_lag_hilite_unselected}
	SetScreenElementProps \{id = cl_vmenu
		unblock_events}
	DestroyScreenElement \{id = cl_manual_adjust_handler}
	generic_menu_pad_choose_sound
endscript

script menu_calibrate_lag_manual_up 
	do_morph = 0
	if GotParam \{audio}
		arrow_id = cl_manual_adjust_up_arrow_audio
		if menu_calibrate_lag_adjust \{value = 1
				for_audio = 1}
			do_morph = 1
		endif
	else
		arrow_id = cl_manual_adjust_up_arrow
		if menu_calibrate_lag_adjust \{value = 1}
			do_morph = 1
		endif
	endif
	if (<do_morph> = 1)
		DoScreenElementMorph id = <arrow_id> Scale = 1.5 relative_scale
		DoScreenElementMorph id = <arrow_id> Scale = 1.0 relative_scale time = 0.15
	endif
	generic_menu_up_or_down_sound
endscript

script menu_calibrate_lag_manual_down 
	do_morph = 0
	if GotParam \{audio}
		arrow_id = cl_manual_adjust_down_arrow_audio
		if menu_calibrate_lag_adjust \{value = -1
				for_audio = 1}
			do_morph = 1
		endif
	else
		arrow_id = cl_manual_adjust_down_arrow
		if menu_calibrate_lag_adjust \{value = -1}
			do_morph = 1
		endif
	endif
	if (<do_morph> = 1)
		DoScreenElementMorph id = <arrow_id> Scale = 1.5 relative_scale
		DoScreenElementMorph id = <arrow_id> Scale = 1.0 relative_scale time = 0.15
	endif
	generic_menu_up_or_down_sound
endscript

script menu_calibrate_lag_adjust \{value = 1
		for_audio = 0}
	GetGlobalTags \{user_options}
	<audio_calibration> = ((<lag_calibration> / 1000) - 1)
	CastToInteger \{audio_calibration}
	<video_calibration> = <lag_calibration>
	CastToInteger \{video_calibration}
	Mod a = <video_calibration> b = 1000
	<video_calibration> = <Mod>
	if (<for_audio> = 1)
		<audio_calibration> = (<audio_calibration> + <value>)
		if (<audio_calibration> > $calibrate_lag_cap)
			return \{FALSE}
		elseif (<audio_calibration> < 0)
			return \{FALSE}
		endif
	else
		<video_calibration> = (<video_calibration> + <value>)
		if (<video_calibration> > $calibrate_lag_cap)
			return \{FALSE}
		elseif (<video_calibration> < 0)
			return \{FALSE}
		endif
	endif
	<new_lag_calibration> = ((<audio_calibration> * 1000) + 1000)
	<new_lag_calibration> = (<new_lag_calibration> + <video_calibration>)
	Change \{calibrate_lag_dirty = 1}
	SetGlobalTags user_options params = {lag_calibration = <new_lag_calibration>}
	calibrate_lag_update_text
	return \{true}
endscript
