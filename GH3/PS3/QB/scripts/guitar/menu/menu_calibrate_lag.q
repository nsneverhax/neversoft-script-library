calibrate_lag_menu_font = fontgrid_title_gh3
calibrate_lag_menu_line_pos = (420.0, 360.0)
calibrate_lag_menu_circle_dims = (96.0, 96.0)
calibrate_lag_menu_circle_velocity = 300
calibrate_lag_menu_circle_inital_pos = (420.0, -146.0)
calibrate_lag_menu_circle_separation = 320
calibrate_lag_menu_num_circles = 15
calibrate_lag_hilite_pos0 = (678.0, 445.0)
calibrate_lag_hilite_dims0 = (430.0, 50.0)
calibrate_lag_hilite_pos1 = (678.0, 503.0)
calibrate_lag_hilite_dims1 = (430.0, 50.0)
calibrate_lag_hilite_pos2 = (678.0, 559.0)
calibrate_lag_hilite_dims2 = (430.0, 50.0)
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
calibrate_lag_early_window = -100
calibrate_lag_late_window = 400
cl_ready_for_input = 0
calibrate_lag_most_recent_in_game_setting = 0

script create_calibrate_lag_menu \{from_in_game = 1}
	Change calibrate_lag_most_recent_in_game_setting = <from_in_game>
	kill_start_key_binding
	Menu_Music_Off
	if ViewportExists \{Id = Bg_Viewport}
		disable_bg_viewport
	endif
	Change \{calibrate_lag_end_checks = 0}
	Change \{calibrate_lag_started_finish = 0}
	set_focus_color \{rgba = [
			230
			230
			230
			255
		]}
	set_unfocus_color \{rgba = $calibrate_lag_hilite_unselected}
	Z = 100
	CreateScreenElement \{Type = ContainerElement
		PARENT = root_window
		Id = cl_container
		Pos = (0.0, 0.0)}
	create_menu_backdrop \{texture = Venue_BG}
	displaySprite {
		PARENT = cl_container
		tex = Venue_BG
		Pos = (640.0, 360.0)
		Dims = (1280.0, 720.0)
		just = [Center Center]
		Z = (<Z> - 4)
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = cl_container
		Id = as_light_overlay
		texture = Venue_Overlay
		Pos = (640.0, 360.0)
		Dims = (1280.0, 720.0)
		just = [Center Center]
		z_priority = (<Z> - 1)
	}
	displaySprite {
		PARENT = cl_container
		tex = Options_Calibrate_Poster
		Pos = (250.0, 0.0)
		Dims = (432.0, 954.0)
		Z = <Z>
	}
	displaySprite {
		PARENT = cl_container
		tex = Options_Calibrate_Paper
		Pos = (600.0, -100.0)
		Dims = (610.0, 892.0)
		Z = (<Z> -2)
	}
	displaySprite {
		PARENT = cl_container
		tex = Toprockers_Tape_2
		Pos = (720.0, -100.0)
		Dims = (180.0, 80.0)
		Z = (<Z> + 2)
		Rot_Angle = 93
	}
	displaySprite {
		PARENT = cl_container
		tex = Toprockers_Tape_2
		rgba = [0 0 0 128]
		Pos = (725.0, -102.0)
		Dims = (180.0, 80.0)
		Z = (<Z> + 2)
		Rot_Angle = 93
	}
	<tape_offset> = (90.0, 325.0)
	displaySprite {
		PARENT = cl_container
		tex = Tape_V_01
		Pos = ((970.0, 106.0) + <tape_offset>)
		Dims = (96.0, 192.0)
		Z = (<Z> + 2)
		flip_v
		Rot_Angle = -6
	}
	displaySprite {
		PARENT = cl_container
		tex = Tape_V_01
		rgba = [0 0 0 128]
		Pos = ((975.0, 104.0) + <tape_offset>)
		Dims = (96.0, 192.0)
		Z = (<Z> + 2)
		flip_v
		Rot_Angle = -6
	}
	displaySprite {
		PARENT = cl_container
		tex = Tape_H_02
		Pos = (220.0, 566.0)
		Dims = (132.0, 64.0)
		Z = (<Z> + 2)
		Rot_Angle = 8
	}
	displaySprite {
		PARENT = cl_container
		tex = Tape_H_02
		rgba = [0 0 0 128]
		Pos = (212.0, 572.0)
		Dims = (132.0, 64.0)
		Z = (<Z> + 2)
		Rot_Angle = 8
	}
	displayText \{PARENT = cl_container
		Text = "HDTV LAG"
		Pos = (770.0, 80.0)
		font = fontgrid_title_gh3
		rgba = [
			0
			0
			0
			255
		]
		noshadow}
	upper_helper = "Some HDTVs have an audio/video delay that makes playing difficult. If you're ready to blame your TV, try calibrating."
	lower_helper = "Strum your guitar to the beat of the notes crossing the target."
	CreateScreenElement {
		Type = TextBlockElement
		PARENT = cl_container
		Pos = (700.0, 80.0)
		Text = <upper_helper>
		font = text_a6
		Dims = (575.0, 0.0)
		allow_expansion
		rgba = [60 40 115 255]
		Scale = 0.56
		just = [LEFT Top]
		internal_just = [LEFT Top]
		z_priority = <Z>
	}
	GetScreenElementDims Id = <Id>
	GetScreenElementPosition Id = <Id>
	CreateScreenElement {
		Type = TextBlockElement
		PARENT = cl_container
		Pos = (<ScreenELementPos> + (<Height> * (0.0, 1.0)) + (0.0, 24.0))
		Text = <lower_helper>
		font = text_a6
		Dims = (575.0, 0.0)
		allow_expansion
		rgba = [60 40 115 255]
		Scale = 0.56
		just = [LEFT Top]
		internal_just = [LEFT Top]
		z_priority = <Z>
	}
	calibrate_lag_fill_options Z = <Z> from_in_game = <from_in_game>
	displaySprite {
		PARENT = cl_container
		Id = calibrate_lag_target
		tex = Options_Calibrate_Target
		Pos = ($calibrate_lag_menu_line_pos + ($calibrate_lag_menu_circle_dims * 0.5))
		just = [Center Center]
		Dims = (96.0, 96.0)
		Z = (<Z> + 50)
		Alpha = 0.75
	}
	displaySprite \{PARENT = cl_container
		Id = cl_ping_ID
		tex = Options_Audio_Ping
		Alpha = 0
		Scale = 5
		Z = 180
		just = [
			Center
			Center
		]
		Pos = (468.0, 406.0)}
	cl_ping_ID :DoMorph \{Alpha = 0}
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
	add_user_control_helper \{Text = "SELECT"
		button = Green
		Z = 100}
	add_user_control_helper \{Text = "BACK"
		button = RED
		Z = 100}
	add_user_control_helper \{Text = "UP/DOWN"
		button = Strumbar
		Z = 100}
endscript

script calibrate_lag_fill_options \{Z = 100}
	if (<from_in_game>)
		<controller> = ($last_start_pressed_device)
	else
		<controller> = ($primary_controller)
	endif
	displaySprite PARENT = cl_container Id = calibrate_lag_hilite tex = Options_Calibrate_Hilite Pos = $calibrate_lag_hilite_pos0 rgba = $calibrate_lag_hilite_unselected Z = <Z>
	calib_eh = [
		{pad_back menu_calibrate_go_back}
	]
	new_menu scrollid = cl_scroll vmenuid = cl_vmenu Menu_pos = (700.0, 435.0) event_handlers = <calib_eh> exclusive_device = <controller> text_left default_colors = 0
	text_params = {PARENT = cl_vmenu Type = TextElement font = ($calibrate_lag_menu_font) rgba = ($menu_unfocus_color) Scale = 0.9}
	CreateScreenElement {
		<text_params>
		Id = calibrate_calibrate_option
		Text = "CALIBRATE"
		event_handlers = [
			{Focus menu_calibrate_focus Params = {Index = 0}}
			{unfocus menu_calibrate_unfocus Params = {Index = 0}}
			{pad_choose menu_calibrate_lag_create_circles Params = {Z = <Z>}}
		]
		z_priority = (<Z> + 1)
		Pos = (0.0, 14.0)
	}
	GetScreenElementDims Id = <Id>
	fit_text_in_rectangle Id = <Id> Dims = ((340.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1
	CreateScreenElement {
		<text_params>
		Id = calibrate_reset_option
		Text = "RESET"
		event_handlers = [
			{Focus menu_calibrate_focus Params = {Index = 1}}
			{unfocus menu_calibrate_unfocus Params = {Index = 1}}
			{pad_choose menu_calibrate_lag_reset_lag Params = {Z = <Z>}}
		]
		z_priority = (<Z> + 1)
	}
	GetScreenElementDims Id = <Id>
	fit_text_in_rectangle Id = <Id> Dims = ((340.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1
	CreateScreenElement \{Type = ContainerElement
		PARENT = cl_vmenu
		Id = calibrate_manual_option
		event_handlers = [
			{
				Focus
				menu_calibrate_focus
				Params = {
					Index = 2
				}
			}
			{
				unfocus
				menu_calibrate_unfocus
				Params = {
					Index = 2
				}
			}
			{
				pad_choose
				menu_calibrate_lag_manual_choose
			}
		]}
	<container_id> = <Id>
	CreateScreenElement {
		<text_params>
		PARENT = <container_id>
		Id = lag_offset_text
		Text = " "
		just = [LEFT Top]
		z_priority = (<Z> + 1)
		Pos = (40.0, 0.0)
	}
	calibrate_lag_update_text
	CreateScreenElement {
		Type = SpriteElement
		Id = cl_manual_adjust_up_arrow
		PARENT = <container_id>
		texture = Online_Arrow
		just = [Center Bottom]
		Pos = (16.0, 16.0)
		rgba = ($calibrate_lag_hilite_unselected)
		Alpha = 1
		Scale = 0.65000004
		z_priority = (<Z> + 1)
		flip_h
	}
	CreateScreenElement {
		Type = SpriteElement
		Id = cl_manual_adjust_down_arrow
		PARENT = <container_id>
		texture = Online_Arrow
		just = [Center Top]
		Pos = (16.0, 20.0)
		rgba = ($calibrate_lag_hilite_unselected)
		Alpha = 1
		Scale = 0.65000004
		z_priority = (<Z> + 1)
	}
	SetScreenElementLock \{Id = cl_vmenu
		ON}
	LaunchEvent \{Type = Focus
		Target = cl_vmenu}
endscript

script calibrate_lag_update_text 
	GetGlobalTags \{user_options}
	CastToInteger \{lag_calibration}
	FormatText TextName = lag_value_text "%d ms" D = <lag_calibration>
	lag_offset_text :SetProps Text = <lag_value_text>
endscript

script destroy_calibrate_lag_menu 
	restore_start_key_binding
	SpawnScriptNow \{Menu_Music_On}
	if ViewportExists \{Id = Bg_Viewport}
		enable_bg_viewport
	endif
	Change \{calibrate_lag_dirty = 0}
	destroy_menu_backdrop
	clean_up_user_control_helpers
	KillSpawnedScript \{Name = do_calibration_update}
	destroy_menu \{menu_id = cl_scroll}
	destroy_menu \{menu_id = cl_container}
	if ScreenElementExists \{idcl_manual_adjust_handler}
		DestroyScreenElement \{Id = cl_manual_adjust_handler}
	endif
	LaunchEvent \{Type = Focus
		Target = root_window}
endscript

script menu_calibrate_focus 
	generic_menu_up_or_down_sound
	Wait \{1
		GameFrames}
	if (<Index> = 0)
		retail_menu_focus
		SetScreenElementProps \{Id = calibrate_lag_hilite
			Pos = $calibrate_lag_hilite_pos0
			Dims = $calibrate_lag_hilite_dims0}
	elseif (<Index> = 1)
		retail_menu_focus
		SetScreenElementProps \{Id = calibrate_lag_hilite
			Pos = $calibrate_lag_hilite_pos1
			Dims = $calibrate_lag_hilite_dims1}
	else
		Obj_GetID
		retail_menu_focus Id = {<ObjID> child = 0}
		SetScreenElementProps \{Id = calibrate_lag_hilite
			Pos = $calibrate_lag_hilite_pos2
			Dims = $calibrate_lag_hilite_dims2}
		DoScreenElementMorph \{Id = cl_manual_adjust_up_arrow
			rgba = $menu_focus_color}
		DoScreenElementMorph \{Id = cl_manual_adjust_down_arrow
			rgba = $menu_focus_color}
	endif
endscript

script menu_calibrate_unfocus 
	if (<Index> = 0)
		retail_menu_unfocus
	elseif (<Index> = 1)
		retail_menu_unfocus
	else
		Obj_GetID
		retail_menu_unfocus Id = {<ObjID> child = 0}
		DoScreenElementMorph Id = cl_manual_adjust_up_arrow rgba = ($calibrate_lag_hilite_unselected)
		DoScreenElementMorph Id = cl_manual_adjust_down_arrow rgba = ($calibrate_lag_hilite_unselected)
	endif
endscript

script menu_calibrate_lag_create_circles 
	if ($transitions_locked = 1 || $menu_flow_locked = 1)
		return
	endif
	CreateScreenElement {
		PARENT = cl_container Type = TextElement font = ($calibrate_lag_menu_font) rgba = ($menu_unfocus_color)
		Id = clm_dummy_event_handler
		Text = ""
		z_priority = <Z>
	}
	LaunchEvent \{Type = Focus
		Target = clm_dummy_event_handler}
	LaunchEvent \{Type = unfocus
		Target = cl_vmenu}
	clean_up_user_control_helpers
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
	add_user_control_helper \{Text = "STRUM"
		button = Strumbar
		Z = 100}
	destroy_menu \{menu_id = cl_scroll}
	destroy_menu \{menu_id = calibrate_lag_hilite}
	kill_debug_elements
	init_play_log
	generic_menu_pad_choose_sound
	displaySprite {
		Id = cl_countdown_circle
		PARENT = cl_container
		tex = Song_Summary_Circle_2p
		Pos = ($calibrate_lag_menu_line_pos + (13.0, 14.0))
		rgba = [220 220 220 208]
		Dims = (72.0, 72.0)
		Z = 199
	}
	CreateScreenElement {
		Type = TextElement
		Id = cl_countdown_text
		PARENT = cl_container
		Pos = ($calibrate_lag_menu_line_pos + (47.0, 58.0))
		Scale = (1.0, 1.0)
		Text = ""
		font = ($calibrate_lag_menu_font)
		rgba = [0 0 0 255]
		z_priority = 200
	}
	<sep> = ($calibrate_lag_menu_circle_separation * 1.0)
	<vel> = ($calibrate_lag_menu_circle_velocity * 1.0)
	<seconds_between_circles> = (<sep> / <vel>)
	<I> = 0
	begin
	SpawnScriptNow \{cl_do_ping
		Params = {
			Time = 0.6
		}}
	Wait \{0.6
		Seconds}
	FormatText TextName = tex "%t" T = (3 - <I>)
	SetScreenElementProps Id = cl_countdown_text Text = <tex>
	SoundEvent \{Event = GH_SFX_HitNoteSoundEvent}
	Wait (<seconds_between_circles> - 0.6) Seconds
	<I> = (<I> + 1)
	repeat 3
	Change \{calibrate_lag_circle_index = 0}
	half_circle_width = 0
	circle_index = 0
	begin
	FormatText ChecksumName = circle_id 'circle%d' D = <circle_index>
	circle_pos = (($calibrate_lag_menu_circle_inital_pos) - ((0.0, 1.0) * <circle_index> * ($calibrate_lag_menu_circle_separation)))
	<one_frame> = ((1.0 / 60.0) * $calibrate_lag_menu_circle_velocity)
	CastToInteger \{one_frame}
	<y_off> = ($calibrate_lag_menu_line_pos.(0.0, 1.0) - <circle_pos>.(0.0, 1.0))
	<Steps> = (<y_off> / <one_frame>)
	CastToInteger \{Steps}
	<new_y_off> = ($calibrate_lag_menu_line_pos.(0.0, 1.0) - (<Steps> * <one_frame>))
	<circle_pos> = ((<circle_pos>.(1.0, 0.0) * (1.0, 0.0)) + (<new_y_off> * (0.0, 1.0)))
	CreateScreenElement {
		Type = SpriteElement
		PARENT = cl_container
		texture = Options_Calibrate_Note
		Id = <circle_id>
		Pos = <circle_pos>
		Dims = ($calibrate_lag_menu_circle_dims)
		just = [LEFT Top]
		rgba = [255 255 255 255]
		z_priority = (<Z> + 51)
		Alpha = 0.5
	}
	<circle_id> :SetTags existence = 0 hit = 0 check = 1
	<circle_id> :SetTags initial_position = <circle_pos>
	<circle_id> :SetTags time_requirement = (<Steps> * (1.0 / 60.0))
	<circle_index> = (<circle_index> + 1)
	repeat ($calibrate_lag_menu_num_circles)
	LaunchEvent \{Type = unfocus
		Target = root_window}
	Wait \{1
		GameFrame}
	Change \{cl_ready_for_input = 0}
	SpawnScriptNow \{cl_do_ping
		Params = {
			Time = 0.6
		}}
	SpawnScriptNow do_calibration_update Params = {device_num = <device_num>}
	Wait \{0.6
		Seconds}
	SetScreenElementProps \{Id = cl_countdown_text
		Text = "GO!"
		Scale = 0.7}
	SoundEvent \{Event = GH_SFX_HitNoteSoundEvent}
	cl_ping_ID :DoMorph \{Alpha = 0}
	Wait \{0.4
		Seconds}
	SetScreenElementProps \{Id = cl_countdown_circle
		Alpha = 0}
	Change \{cl_ready_for_input = 1}
	DoScreenElementMorph \{Id = calibrate_lag_target
		Alpha = 1}
	Wait \{1
		GameFrame}
	SetScreenElementProps \{Id = cl_countdown_text
		Alpha = 0}
endscript

script menu_calibrate_go_back 
	if ScreenElementExists \{Id = cl_scroll}
		LaunchEvent \{Type = unfocus
			Target = cl_scroll}
	endif
	if ScreenElementExists \{Id = cl_vmenu}
		LaunchEvent \{Type = unfocus
			Target = cl_vmenu}
	endif
	if ($calibrate_lag_dirty = 1)
		ui_flow_manager_respond_to_action \{action = Continue}
	else
		ui_flow_manager_respond_to_action \{action = go_back}
	endif
endscript

script menu_calibrate_lag_destroy_circles 
	circle_index = 0
	begin
	FormatText ChecksumName = circle_id 'circle%d' D = <circle_index>
	destroy_menu menu_id = <circle_id>
	<circle_index> = (<circle_index> + 1)
	repeat ($calibrate_lag_menu_num_circles)
	destroy_menu \{menu_id = clm_dummy_event_handler}
endscript

script do_calibration_update 
	<circle_index> = 0
	begin
	FormatText ChecksumName = circle_id 'circle%d' D = <circle_index>
	<circle_id> :SetTags sounded = 0 pinged = 0
	<circle_index> = (<circle_index> + 1)
	repeat ($calibrate_lag_menu_num_circles)
	begin
	circle_index = 0
	num_circles_gone = 0
	delta_time = (1.0 / 60.0)
	begin
	FormatText ChecksumName = circle_id 'circle%d' D = <circle_index>
	<circle_id> :GetTags
	<existence> = (<existence> + <delta_time>)
	update_difference = (<delta_time>)
	position_change = (<update_difference> * ($calibrate_lag_menu_circle_velocity))
	CastToInteger \{position_change}
	GetScreenElementPosition Id = <circle_id>
	<ScreenELementPos> = (<ScreenELementPos> + (0.0, 1.0) * <position_change>)
	<target_pos> = ($calibrate_lag_menu_line_pos)
	diff = ((<ScreenELementPos>.(0.0, 1.0)) - (<target_pos>.(0.0, 1.0)))
	if (<diff> < 0)
		<diff> = (0 - <diff>)
	endif
	<cl_tweak> = ($calibrate_lag_tick_ms_offset / 1000.0)
	if ((($calibrate_lag_menu_circle_velocity) * <cl_tweak>) >= <diff>)
		if (<sounded> = 0)
			SoundEvent \{Event = GH_SFX_HitNoteSoundEvent}
			<circle_id> :SetTags sounded = 1
		endif
	endif
	if (<diff> < <position_change>)
		SetScreenElementProps Id = <circle_id> rgba = [135 0 180 255] Alpha = 1.0
	endif
	if ((<ScreenELementPos>.(0.0, 1.0)) > ($calibrate_lag_menu_line_pos.(0.0, 1.0) + ($calibrate_lag_menu_circle_dims.(0.0, 1.0))))
		if (<hit> = 0 && <check> = 1)
			Change calibrate_lag_circle_index = (($calibrate_lag_circle_index) + 1)
			<circle_id> :SetTags check = 0
		endif
		<num_circles_gone> = (<num_circles_gone> + 1)
		<circle_id> :Obj_SpawnScriptNow cl_fade_circle Params = {Id = <circle_id>}
	endif
	<circle_id> :SetProps Pos = (<ScreenELementPos>)
	<circle_id> :SetTags existence = <existence>
	<circle_index> = (<circle_index> + 1)
	repeat ($calibrate_lag_menu_num_circles)
	if (<num_circles_gone> = $calibrate_lag_menu_num_circles)
		SpawnScriptLater \{kill_off_and_finish_calibration}
	endif
	if (($calibrate_lag_end_checks = 0) && $cl_ready_for_input)
		if ControllerMake UP <device_num>
			SpawnScriptNow menu_calibrate_lag_do_guitar_check_up_down Params = {device_num = <device_num>}
		endif
		if ControllerMake DOWN <device_num>
			SpawnScriptNow menu_calibrate_lag_do_guitar_check_up_down Params = {device_num = <device_num>}
		endif
		if ControllerMake X <device_num>
			SpawnScriptNow menu_calibrate_lag_do_guitar_check_choose Params = {device_num = <device_num>}
		endif
	endif
	Wait \{1
		GameFrame}
	repeat
endscript

script cl_fade_circle 
	<Id> :DoMorph rgba = [0 0 0 255] Alpha = 0.5 Time = 0.009
endscript

script cl_do_ping \{Time = 0.066}
	cl_ping_ID :DoMorph \{Scale = 10
		Alpha = 0}
	cl_ping_ID :DoMorph Scale = 1 Alpha = 1 Motion = ease_in Time = <Time>
	cl_ping_ID :DoMorph \{Alpha = 0
		Motion = ease_in
		Time = 0.1}
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
	FormatText ChecksumName = circle_id 'circle%d' D = ($calibrate_lag_circle_index)
	if NOT ScreenElementExists Id = <circle_id>
		return
	endif
	if NOT ScreenElementExists \{Id = calibrate_lag_target}
		return
	endif
	<circle_id> :GetTags
	GetScreenElementPosition Id = <circle_id>
	GetScreenElementDims Id = <circle_id>
	input_difference = (<time_requirement> - <existence>)
	new_input_diff = (<input_difference> * 1000)
	<new_input_diff> = (0 - <new_input_diff>)
	if (<new_input_diff> < $calibrate_lag_early_window)
		return
	endif
	if (<new_input_diff> > $calibrate_lag_late_window)
		return
	endif
	SetArrayElement ArrayName = calibrate_lag_results GlobalArray Index = ($calibrate_lag_circle_index) NewValue = <new_input_diff>
	output_log_text "Calibrate: %o" O = <new_input_diff> Color = White
	get_closest_circle_above_line
	<circle_id> :SetTags hit = 1
	Change calibrate_lag_circle_index = (($calibrate_lag_circle_index) + 1)
	<closest_id> :SetProps Hide
	calibrate_lag_target :DoMorph \{Scale = 1.5
		relative_scale
		Time = 0.05}
	calibrate_lag_target :DoMorph \{Scale = 1.0
		relative_scale
		Time = 0.05}
	if (($calibrate_lag_circle_index) = ($calibrate_lag_menu_num_circles))
		Change \{calibrate_lag_end_checks = 1}
		kill_off_and_finish_calibration
	endif
endscript

script kill_off_and_finish_calibration 
	LaunchEvent \{Type = unfocus
		Target = clm_dummy_event_handler}
	KillSpawnedScript \{Name = do_calibration_update}
	menu_calibrate_lag_finish_up_calibration
	menu_calibrate_lag_destroy_circles
endscript

script get_closest_circle_above_line 
	if ($calibrate_lag_end_checks = 1)
		return
	endif
	I = 0
	begin
	FormatText ChecksumName = circle_id 'circle%d' D = <I>
	GetScreenElementPosition Id = <circle_id>
	if ((<ScreenELementPos>.(0.0, 1.0)) < ($calibrate_lag_menu_line_pos.(0.0, 1.0) + ($calibrate_lag_menu_circle_dims.(0.0, 1.25))))
		<circle_id> :GetTags
		if NOT (<hit>)
			return closest_id = <circle_id> hit = 1
		endif
	endif
	<I> = (<I> + 1)
	repeat $calibrate_lag_menu_num_circles hit = 0
	return closest_id = <circle_id>
endscript

script menu_calibrate_lag_finish_up_calibration 
	if ($calibrate_lag_started_finish = 1)
		return
	endif
	Change \{calibrate_lag_started_finish = 1}
	Min = 50000.0
	MAX = -50000.0
	Index = 0
	num_hit = 0
	total_val = 0.0
	begin
	FormatText ChecksumName = circle_id 'circle%d' D = <Index>
	if NOT ScreenElementExists Id = <circle_id>
		return
	endif
	<circle_id> :GetTags
	if (<hit>)
		<num_hit> = (<num_hit> + 1)
		val = ($calibrate_lag_results [<Index>])
		if (<val> < <Min>)
			<Min> = (<val>)
		endif
		if (<val> > <MAX>)
			<MAX> = (<val>)
		endif
		<total_val> = (<total_val> + <val>)
	endif
	<Index> = (<Index> + 1)
	repeat ($calibrate_lag_menu_num_circles)
	if (<num_hit> > 2)
		<total_val> = (<total_val> - <Min>)
		<total_val> = (<total_val> - <MAX>)
		avg = (<total_val> / (<num_hit> - 2))
		if (<avg> < 0)
			<avg> = 0
		elseif (<avg> > $calibrate_lag_cap)
			<avg> = $calibrate_lag_cap
		endif
		GetGlobalTags \{user_options}
		old_lag = <lag_calibration>
		SetGlobalTags user_options Params = {lag_calibration = <avg>}
	endif
	LaunchEvent \{Type = Focus
		Target = root_window}
	Wait \{30
		GameFrames}
	destroy_calibrate_lag_menu
	create_calibrate_lag_menu from_in_game = ($calibrate_lag_most_recent_in_game_setting)
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
	if (<lag_calibration> = 0.0)
		return
	endif
	SetGlobalTags \{user_options
		Params = {
			lag_calibration = 0.0
		}}
	calibrate_lag_update_text
	Change \{calibrate_lag_dirty = 1}
endscript

script menu_calibrate_lag_manual_choose 
	SetScreenElementProps \{Id = calibrate_lag_hilite
		rgba = $calibrate_lag_hilite_selected}
	SetScreenElementProps \{Id = cl_vmenu
		block_events}
	CreateScreenElement \{Type = ContainerElement
		PARENT = cl_container
		Id = cl_manual_adjust_handler
		event_handlers = [
			{
				pad_up
				menu_calibrate_lag_manual_up
			}
			{
				pad_down
				menu_calibrate_lag_manual_down
			}
			{
				pad_choose
				menu_calibrate_lag_manual_back
			}
			{
				pad_back
				menu_calibrate_lag_manual_back
			}
		]}
	LaunchEvent \{Type = Focus
		Target = cl_manual_adjust_handler}
	generic_menu_pad_choose_sound
endscript

script menu_calibrate_lag_manual_back 
	SetScreenElementProps \{Id = calibrate_lag_hilite
		rgba = $calibrate_lag_hilite_unselected}
	SetScreenElementProps \{Id = cl_vmenu
		unblock_events}
	DestroyScreenElement \{Id = cl_manual_adjust_handler}
	generic_menu_pad_choose_sound
endscript

script menu_calibrate_lag_manual_up 
	if menu_calibrate_lag_adjust \{Value = 1}
		DoScreenElementMorph \{Id = cl_manual_adjust_up_arrow
			Scale = 1.5
			relative_scale}
		DoScreenElementMorph \{Id = cl_manual_adjust_up_arrow
			Scale = 1.0
			relative_scale
			Time = 0.15}
	endif
	generic_menu_up_or_down_sound
endscript

script menu_calibrate_lag_manual_down 
	if menu_calibrate_lag_adjust \{Value = -1}
		DoScreenElementMorph \{Id = cl_manual_adjust_down_arrow
			Scale = 1.5
			relative_scale}
		DoScreenElementMorph \{Id = cl_manual_adjust_down_arrow
			Scale = 1.0
			relative_scale
			Time = 0.15}
	endif
	generic_menu_up_or_down_sound
endscript

script menu_calibrate_lag_adjust \{Value = 1}
	GetGlobalTags \{user_options}
	<new_lag_calibration> = (<lag_calibration> + <Value>)
	if (<new_lag_calibration> > $calibrate_lag_cap)
		return \{FALSE}
	elseif (<new_lag_calibration> < 0)
		return \{FALSE}
	endif
	Change \{calibrate_lag_dirty = 1}
	SetGlobalTags user_options Params = {lag_calibration = <new_lag_calibration>}
	calibrate_lag_update_text
	return \{TRUE}
endscript
