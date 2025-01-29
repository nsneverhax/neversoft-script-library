g_training_arrow_life = 5
g_training_arrow_movement_distance = 30
g_training_arrow_bounce_time = 0.5
g_training_last_lesson = 1
g_tutorial_pause_is_up = 0
g_in_tutorial = 0
g_training_lessons_completed = 0

script training_create_narrator_icons \{parent = training_container}
	<narrator> = 0
	begin
	<expression> = 0
	begin
	switch <narrator>
		case 0
		<narrator_text> = 'guitarist'
		case 1
		<narrator_text> = 'bassist'
		case 2
		<narrator_text> = 'drummer'
		case 3
		<narrator_text> = 'vocalist'
		default
		<narrator_text> = 'drummer'
	endswitch
	formatText checksumName = narrator_texture 'tutorial_narrator_%n_%e' n = <narrator_text> e = <expression>
	DestroyScreenElement id = <narrator_texture>
	CreateScreenElement {
		parent = <parent>
		Type = SpriteElement
		id = <narrator_texture>
		just = [center center]
		texture = <narrator_texture>
		dims = (200.0, 200.0)
		Pos = (213.0, 182.0)
		z_priority = 79
	}
	safe_hide id = <id>
	<expression> = (<expression> + 1)
	repeat 3
	<narrator> = (<narrator> + 1)
	repeat 4
endscript

script training_show_narrator \{narrator = 'drummer'
		new_pos = (213.0, 182.0)}
	training_hide_narrator \{no_placeholder}
	if NOT GotParam \{expression}
		<expression> = Random (@ 0 @ 1 @ 2 )
	else
		if (<expression> < 0 || <expression> > 2)

		endif
	endif
	formatText checksumName = narrator_texture 'tutorial_narrator_%n_%e' n = <narrator> e = <expression>
	if (<new_pos> = (213.0, 182.0))
		training_container :GetTags
		if ((<Type> = studio) || (<Type> = ghmix))
			<hflip> = 1
		endif
		if ScreenElementExists \{id = lessonheader}
			lessonheader :se_getprops
			if GotParam \{tutorial_narrator_placeholder_pos}
				<new_pos> = (<tutorial_narrator_placeholder_pos> + (188.0, 132.0))
			endif
		endif
	endif
	<narrator_texture> :se_getprops Pos
	if NOT (<new_pos> = <Pos>)
		<narrator_texture> :se_setprops Pos = <new_pos>
	endif
	if ScreenElementExists \{id = lessonheader}
		lessonheader :se_setprops \{tutorial_narrator_placeholder_alpha = 0
			time = 0.1}
	endif
	if GotParam \{hflip}
		<Scale> = (-1.0, 1.0)
	else
		<Scale> = (1.0, 1.0)
	endif
	<narrator_texture> :se_setprops Scale = <Scale>
	safe_show id = <narrator_texture> time = 0.1
	if ScreenElementExists \{id = tutorial_lesson_container}
		tutorial_lesson_container :GetTags
		tutorial_lesson_container :se_getprops \{Pos}
		if (<Pos> = <pos2>)
			tutorial_lesson_container :se_setprops Pos = <pos1>
		endif
	endif
endscript

script training_hide_narrator 
	if GotParam \{narrator}
		<expression> = 0
		begin
		formatText checksumName = narrator_texture 'tutorial_narrator_%n_%e' n = <narrator> e = <expression>
		safe_hide id = <narrator_texture> time = 0.1
		<expression> = (<expression> + 1)
		repeat 3
	else
		<narrator> = 0
		begin
		<expression> = 0
		begin
		switch <narrator>
			case 0
			<narrator_text> = 'guitarist'
			case 1
			<narrator_text> = 'bassist'
			case 2
			<narrator_text> = 'drummer'
			case 3
			<narrator_text> = 'vocalist'
			default
			<narrator_text> = 'drummer'
		endswitch
		formatText checksumName = narrator_texture 'tutorial_narrator_%n_%e' n = <narrator_text> e = <expression>
		if ScreenElementExists id = <narrator_texture>
			<narrator_texture> :se_getprops
			if (<alpha> != 0)
				safe_hide id = <narrator_texture> time = 0.1
			endif
		endif
		<expression> = (<expression> + 1)
		repeat 3
		<narrator> = (<narrator> + 1)
		repeat 4
	endif
	if NOT GotParam \{no_placeholder}
		if ScreenElementExists \{id = lessonheader}
			training_header_container :se_getprops
			if (<alpha> != 0)
				lessonheader :se_setprops \{tutorial_narrator_placeholder_alpha = 1
					time = 0.1}
			endif
		endif
	else
		if ScreenElementExists \{id = tutorial_lesson_container}
			training_container :GetTags
			if (<Type> = standard)
				tutorial_lesson_container :GetTags
				tutorial_lesson_container :se_getprops \{Pos}
				if (<Pos> = <pos1>)
					tutorial_lesson_container :se_setprops Pos = <pos2>
				endif
			endif
		endif
	endif
endscript

script training_hide_placeholder 
	if ScreenElementExists \{id = lessonheader}
		training_header_container :se_getprops
		if (<alpha> != 0)
			lessonheader :se_setprops \{tutorial_narrator_placeholder_alpha = 0
				time = 0.1}
		endif
		training_container :GetTags
		if (<Type> = standard)
			tutorial_lesson_container :GetTags
			tutorial_lesson_container :se_getprops \{Pos}
			if (<Pos> = <pos1>)
				tutorial_lesson_container :se_setprops Pos = <pos2>
			endif
		endif
	endif
endscript

script training_destroy_narrator_icons 
	<narrator> = 0
	begin
	<expression> = 0
	begin
	switch <narrator>
		case 0
		<narrator_text> = 'guitarist'
		case 1
		<narrator_text> = 'bassist'
		case 2
		<narrator_text> = 'drummer'
		case 3
		<narrator_text> = 'vocalist'
		default
		<narrator_text> = 'drummer'
	endswitch
	formatText checksumName = narrator_texture 'tutorial_narrator_%n_%e' n = <narrator_text> e = <expression>
	DestroyScreenElement id = <narrator_texture>
	<expression> = (<expression> + 1)
	repeat 3
	<narrator> = (<narrator> + 1)
	repeat 4
endscript

script training_create_and_hide_headers \{Type = standard}
	training_create_lesson_and_task_headers Type = <Type>
	training_hide_lesson_header
endscript

script training_create_lesson_and_task_headers \{Type = standard}
	if NOT ScreenElementExists \{id = training_container}
		CreateScreenElement \{Type = ContainerElement
			id = training_container
			parent = root_window
			Pos = (0.0, 0.0)}
	endif
	if ScreenElementExists \{id = training_header_container}
		return
	endif
	z = 80
	training_container :SetTags Type = <Type>
	CreateScreenElement {
		Type = ContainerElement
		id = training_header_container
		parent = training_container
		Pos = (0.0, 0.0)
		z_priority = <z>
	}
	switch <Type>
		case standard
		CreateScreenElement \{parent = training_header_container
			id = lessonheader
			Type = descinterface
			desc = 'tutorial_header_2'}
		lesson_header_frame_width = 630
		lesson_header_frame_height = 250
		center_pos = (645.0, 190.0)
		case battle
		CreateScreenElement \{parent = training_header_container
			id = lessonheader
			Type = descinterface
			desc = 'tutorial_header_battle'}
		lesson_header_frame_width = 486
		lesson_header_frame_height = 220
		center_pos = (648.0, 200.0)
		case ghmix
		CreateScreenElement \{parent = training_header_container
			id = lessonheader
			Type = descinterface
			desc = 'tutorial_header_ghmix'}
		lesson_header_frame_width = 436
		lesson_header_frame_height = 320
		center_pos = (883.0, 265.0)
		case studio
		CreateScreenElement \{parent = training_header_container
			id = lessonheader
			Type = descinterface
			desc = 'tutorial_header_studio'}
		lesson_header_frame_width = 386
		lesson_header_frame_height = 420
		center_pos = (677.0, 280.0)
		default
		CreateScreenElement \{parent = training_header_container
			id = lessonheader
			Type = descinterface
			desc = 'tutorial_header_2'}
		lesson_header_frame_width = 586
		lesson_header_frame_height = 220
		center_pos = (630.0, 180.0)
	endswitch
	if lessonheader :desc_resolvealias \{Name = alias_tutorial_lesson_container}
		AssignAlias id = <resolved_id> alias = tutorial_lesson_container
		tutorial_lesson_container :se_getprops \{Pos}
		tutorial_lesson_container :SetTags {pos1 = <Pos> pos2 = (<Pos> + (194.0, 0.0))}
	endif
	lesson_header_frame_dims = (<lesson_header_frame_width> * (1.0, 0.0) + <lesson_header_frame_height> * (0.0, 1.0))
	create_ui_frame {
		frame_dims = <lesson_header_frame_dims>
		center_pos = <center_pos>
		parent = training_header_container
		frame_rgba = [50 30 30 150]
		fill_rgba = [0 0 0 150]
		z_priority = (<z> - 0.1)
		offset_top = 16
		offset_side = 16
		min_fill_pad_width = 73
		min_fill_pad_height = 129
		tex_param = 'simple'
		suffix = 0
	}
	AssignAlias id = <id> alias = lesson_header_frame
	if ScreenElementExists \{id = lesson_header_frame}
		lesson_header_frame :se_setprops \{alpha = 0}
	endif
endscript

script training_change_header_type \{Type = standard}
	DestroyScreenElement \{id = training_header_container}
	training_create_lesson_and_task_headers Type = <Type>
	training_hide_lesson_header
endscript

script training_destroy_lesson_and_task_headers 
	destroy_menu \{menu_id = training_container}
endscript

script training_hide_lesson_header 
	if ScreenElementExists \{id = training_header_container}
		training_header_container :se_setprops \{alpha = 0}
	endif
	training_clear_lesson_body_text
	training_hide_task_header
endscript

script training_show_lesson_header 
	0x928a98c9
	training_header_container :se_setprops \{alpha = 1}
	training_hide_task_header \{clear_text = 0}
endscript

script training_hide_task_header \{clear_text = 1}
	lessonheader :se_setprops \{task_container_alpha = 0
		task_notes_remaining_text = qs(0x03ac90f0)}
	if (<clear_text> = 1)
		lessonheader :se_setprops \{task_text_text = qs(0x03ac90f0)}
	endif
endscript

script training_show_task_header 
	lessonheader :se_setprops \{task_container_alpha = 1.0
		time = 0.25}
	lessonheader :se_waitprops
	lessonheader :Obj_KillSpawnedScript \{Name = training_blink_task}
	lessonheader :Obj_SpawnScriptLater \{training_blink_task}
endscript

script training_blink_task 
	lessonheader :se_setprops \{task_word_alpha = 0.0
		time = 0.2}
	lessonheader :se_waitprops
	lessonheader :se_setprops \{task_word_alpha = 1.0
		time = 0.2}
	lessonheader :se_waitprops
	lessonheader :se_setprops \{task_word_alpha = 0.0
		time = 0.2}
	lessonheader :se_waitprops
	lessonheader :se_setprops \{task_word_alpha = 1.0
		time = 0.2}
	lessonheader :se_waitprops
	lessonheader :se_setprops \{task_word_alpha = 0.0
		time = 0.2}
	lessonheader :se_waitprops
	lessonheader :se_setprops \{task_word_alpha = 1.0
		time = 0.2}
endscript

script training_set_lesson_header_text \{number = qs(0x03ac90f0)
		text = qs(0x03ac90f0)}
	lessonheader :se_setprops {
		lesson_number_text = <number>
		lesson_text_text = <text>
	}
endscript

script training_add_lesson_body_text \{number = 0
		text = qs(0x03ac90f0)
		Type = standard}
	if lessonheader :desc_resolvealias \{Name = alias_tutorial_body_vmenu}
		AssignAlias id = <resolved_id> alias = tutorial_body_vmenu
		formatText TextName = lesson_body_num qs(0x8c5c152d) n = <number>
		training_container :GetTags
		switch <Type>
			case standard
			CreateScreenElement {
				parent = tutorial_body_vmenu
				Type = descinterface
				desc = 'tutorial_body_info'
				tutorial_body_info_num_text = <lesson_body_num>
				tutorial_body_info_text_text = <text>
				autosizedims = true
			}
			case battle
			CreateScreenElement {
				parent = tutorial_body_vmenu
				Type = descinterface
				desc = 'tutorial_body_info_battle'
				tutorial_body_info_num_text = <lesson_body_num>
				tutorial_body_info_text_text = <text>
				just = [top left]
				autosizedims = true
			}
			case ghmix
			CreateScreenElement {
				parent = tutorial_body_vmenu
				Type = descinterface
				desc = 'tutorial_body_info_ghmix'
				tutorial_body_info_num_text = <lesson_body_num>
				tutorial_body_info_text_text = <text>
				autosizedims = true
			}
			case studio
			CreateScreenElement {
				parent = tutorial_body_vmenu
				Type = descinterface
				desc = 'tutorial_body_info_studio'
				tutorial_body_info_num_text = <lesson_body_num>
				tutorial_body_info_text_text = <text>
				autosizedims = true
			}
			default
			CreateScreenElement {
				parent = tutorial_body_vmenu
				Type = descinterface
				desc = 'tutorial_body_info'
				tutorial_body_info_num_text = <lesson_body_num>
				tutorial_body_info_text_text = <text>
				autosizedims = true
			}
		endswitch
		if ScreenElementExists \{id = lesson_header_frame}
			lesson_header_frame :se_setprops \{alpha = 1}
		endif
		<id> :desc_refreshcontentdims
		return id = <id>
	endif
endscript

script training_clear_lesson_body_text 
	if ScreenElementExists \{id = tutorial_body_vmenu}
		if GetScreenElementChildren \{id = tutorial_body_vmenu}
			GetArraySize <children>
			if NOT (<array_Size> = 0)
				<i> = 0
				begin
				DestroyScreenElement id = (<children> [<i>])
				i = (<i> + 1)
				repeat <array_Size>
			endif
		endif
	endif
	if ScreenElementExists \{id = lesson_header_frame}
		lesson_header_frame :se_setprops \{alpha = 0}
	endif
endscript

script training_set_task_header_body \{text = qs(0x00000000)}
	lessonheader :se_setprops {
		task_text_text = <text>
	}
	0x229a47a9 \{Color = [
			255
			168
			40
			255
		]
		Scale = (1.1, 1.1)}
endscript

script training_hide_vo_sub 
endscript

script training_show_vo_sub 
endscript

script training_add_arrow \{Pos = (640.0, 360.0)
		rot = 0
		z = 99
		Scale = 1.0}
	if NOT GotParam \{life}
		life = ($g_training_arrow_life)
	endif
	SetSearchAllAssetContexts
	if NOT ScreenElementExists \{id = training_arrow_container}
		CreateScreenElement \{Type = ContainerElement
			id = training_arrow_container
			parent = training_container
			Pos = (0.0, 0.0)}
	endif
	CreateScreenElement {
		parent = training_arrow_container
		Type = SpriteElement
		just = [center bottom]
		texture = tutorial_arrow
		Pos = <Pos>
		rot_angle = <rot>
		Scale = <Scale>
		rgba = [255 255 255 255]
		z_priority = <z>
		alpha = 0
	}
	arrow_id = <id>
	SetSearchAllAssetContexts \{OFF}
	<arrow_id> :SetTags phase_change = 1
	cos <rot>
	sin <rot>
	<arrow_id> :SetTags phase_direction = ((1.0, 0.0) * <sin> + (0.0, -1.0) * <cos>)
	<arrow_id> :SetTags alive = 0.0
	<arrow_id> :SetTags initial_pos = <Pos>
	<arrow_id> :SetTags motion = ease_in
	<arrow_id> :SetTags initial_fade = 0
	<arrow_id> :SetTags final_fade = 0
	SpawnScriptNow training_make_pointer_point_now params = {id = <arrow_id> life = <life>} id = training_spawned_script
endscript

script training_make_pointer_point_now 
	if NOT GotParam \{id}

	endif
	<fade_time> = 0.5
	begin
	GetDeltaTime \{ignore_slomo}
	<id> :GetTags
	arrow_age = (<alive> + <delta_time>)
	if (<arrow_age> > <life>)
		break
	endif
	if (<motion> = ease_out)
		<motion> = ease_in
		<id> :SetTags motion = ease_in
	else
		<motion> = ease_out
		<id> :SetTags motion = ease_out
	endif
	<new_pos> = (<initial_pos> + <phase_direction> * ($g_training_arrow_movement_distance) * <phase_change>)
	if (<initial_fade> = 0)
		<id> :se_setprops Pos = <new_pos> alpha = 1 time = ($g_training_arrow_bounce_time) motion = <motion>
		<id> :SetTags initial_fade = 1
	elseif (<arrow_age> > <life> - <fade_time>)
		if (<final_fade> = 0)
			<id> :se_setprops Pos = <new_pos> alpha = 0 time = ($g_training_arrow_bounce_time) motion = <motion>
			<id> :SetTags final_fade = 1
		endif
	else
		<id> :se_setprops Pos = <new_pos> time = ($g_training_arrow_bounce_time) motion = <motion>
	endif
	Wait ($g_training_arrow_bounce_time) Seconds ignoreslomo
	<phase_change> = (<phase_change> * -1)
	<arrow_age> = (<arrow_age> + ($g_training_arrow_bounce_time))
	<id> :SetTags alive = (<arrow_age>)
	<id> :SetTags phase_change = (<phase_change>)
	Wait \{1
		gameframe}
	repeat
	DestroyScreenElement id = <id>
endscript

script training_destroy_all_arrows 
	KillSpawnedScript \{Name = training_make_pointer_point_now}
	if ScreenElementExists \{id = training_arrow_container}
		training_arrow_container :se_setprops alpha = 0 time = ($g_training_arrow_bounce_time)
		if ScreenElementExists \{id = training_arrow_container}
			DestroyScreenElement \{id = training_arrow_container}
		endif
	endif
endscript

script set_vo_sub_text 
	SetScreenElementProps id = temp_vo_sub_body text = <text>
endscript

script training_init_session \{header_type = standard}

	Change \{game_mode = tutorial}
	Change \{g_in_tutorial = 1}
	Change \{rocking_out_too_hard = 1}
	SpawnScriptNow \{Skate8_SFX_Backgrounds_New_Area
		params = {
			BG_SFX_Area = FrontEnd
		}}
	menu_music_off
	destroy_bg_viewport
	setup_bg_viewport
	destroy_crowd_models
	SafeKill \{nodeName = Z_SoundCheck_GFX_TRG_LH_HotSpot_P2}
	UnPauseGame
	Change \{current_num_players = 1}
	gamemode_updatenumplayers \{num_players = 1}
	ResumeControllerChecking
	Change \{sysnotify_paused_controllers = [
		]}
	Change \{unknown_drum_type = 0}
	Change \{check_for_unplugged_controllers = 1}
	training_create_and_hide_headers Type = <header_type>
	training_hide_vo_sub
	PlayIGCCam \{id = cs_view_cam_id
		Name = ch_view_cam
		viewport = bg_viewport
		LockTo = World
		Pos = (-0.068807, 1.5990009, 5.7975965)
		Quat = (0.000506, 0.99942994, -0.017537998)
		FOV = 72.0
		play_hold = 1
		interrupt_current}
	Change \{current_crowd = 1.0}
	Change \{structurename = player1_status
		current_health = 1.0}
	setplayerinfo 1 controller = ($primary_controller)
	tutorial_setup_band
	Hide_Band
endscript

script training_kill_session 

	0xbea8f580
	SetButtonEventMappings \{unblock_menu_input}
	do_gh3_unpause
	if NOT GotParam \{from_restart}
		Change \{g_in_tutorial = 0}
		training_stop_hud_flashing_red
		Change \{vocal_tut_no_star_power = 0}
		Change \{vocal_tut_mute = 0}
		Change \{rocking_out_too_hard = 0}
	endif
	tutorial_disable_botplay
	training_clear_out_star_power
	PauseGame
	KillSpawnedScript \{Name = create_exploding_text}
	destroy_all_exploding_text
	KillCamAnim \{Name = ch_view_cam}
	destroy_bg_viewport
	training_destroy_lesson_and_task_headers
	setsoundbussparams {band_Balance = {vol = ($default_BussSet.band_Balance.vol)}}
	Change \{disable_note_input = 0}
	Change \{tutorial_disable_hud = 0}
	Change \{g_revert_p2_bot_to_off = 0}
	KillSpawnedScript \{Name = update_score_fast}
	unpausespawnedscript \{training_script_update}
	band_unload_anim_paks
	UnPauseGame
endscript

script training_clear_out_star_power 

	<i> = 1
	begin
	getplayerinfo <i> checksum
	getplayerinfo <i> Player
	getplayerinfo <i> text
	Change structurename = <checksum> star_power_amount = 0
	Kill_StarPower_StageFX player_text = <text> player_status = <checksum> ifEmpty = 0
	<i> = (<i> + 1)
	repeat $current_num_players
endscript

script training_are_notes_flipped 
	if ($player1_status.lefty_flip = 1)
		return \{true}
	endif
	return \{FALSE}
endscript

script show_training_pause_screen 
	setscriptcannotpause
	if ($g_tutorial_pause_is_up)
		return
	endif
	PauseGame
	PauseGh3Sounds
	training_create_pause_menu <...>
endscript

script create_training_pause_handler 
	event_handlers = [{pad_start show_training_pause_screen}]
	if NOT ScreenElementExists \{id = menu_tutorial}
		new_menu {
			scrollid = menu_tutorial
			vmenuid = vmenu_tutorial
			menu_pos = (120.0, 190.0)
			use_backdrop = 0
			event_handlers = <event_handlers>
		}
	else
		menu_tutorial :se_setprops event_handlers = <event_handlers> replace_handers
	endif
	LaunchEvent \{Type = focus
		target = menu_tutorial}
endscript
tutorial_okay_to_create_pause_handler = 1

script enable_tutorial_pause 
	Change \{tutorial_okay_to_create_pause_handler = 1}
endscript
training_prev_paused_title = None

script training_create_pause_menu 
	if NOT ScreenElementExists \{id = pausemenu_bg}
		if ScreenElementExists \{id = menu_tutorial}
			LaunchEvent \{Type = unfocus
				target = menu_tutorial}
		endif
		if GotParam \{UseLastTitle}
			if ($training_prev_paused_title = failed)
				<tutorial_pause_title> = qs(0x5c9b76c1)
				<tutorial_failed> = 1
			else
				<tutorial_pause_title> = qs(0x662aaaf7)
				<tutorial_failed> = 0
			endif
		else
			if GotParam \{songfailed}
				<tutorial_pause_title> = qs(0x5c9b76c1)
				Change \{training_prev_paused_title = failed}
				<tutorial_failed> = 1
			else
				<tutorial_pause_title> = qs(0x662aaaf7)
				Change \{training_prev_paused_title = paused}
				<tutorial_failed> = 0
			endif
		endif
		Change last_start_pressed_device = ($primary_controller)
		ui_create_pausemenu tutorial_pause_title = <tutorial_pause_title> tutorial_failed = <tutorial_failed> extra_z = 1000
		LaunchEvent \{Type = focus
			target = generic_barrel_vmenu}
	endif
	Change \{g_tutorial_pause_is_up = 1}
endscript

script tutorial_resume 
	tutorial_close_pause_window
endscript

script tutorial_cheat_skip \{lesson = 1}
	Change g_training_last_lesson = <lesson>
	tutorial_restart
endscript

script tutorial_skip_lesson 
	Change g_training_last_lesson = ($g_training_last_lesson + 1)
	tutorial_restart
endscript

script tutorial_restart 

	0xe9384b7a \{full}
	StopAllSounds
	0x5e591606
	tutorial_close_pause_window \{dont_unpause}
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	kill_training_script_system
	training_destroy_gem_scroller \{delay = 0.0}
	training_kill_session \{from_restart}
	StopSoundsByBuss \{Training_VO}
	StopAllSounds
	0x5e591606
	UnPauseGame
	UnPauseGh3Sounds
	setslomo \{1.0}
	setslomo_song \{slomo = 1.0}
	enable_pause
	run_training_script \{Restart_Lesson}
	StartRendering
endscript

script tutorial_shutdown 

	tutorial_close_pause_window
	StopSoundsByBuss \{Training_VO}
	StopAllSounds
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	kill_training_script_system
	training_destroy_gem_scroller \{delay = 0.0}
	training_kill_session \{shutdown}
	Change \{disable_note_input = 0}
	Change \{tutorial_disable_hud = 0}
	Change \{g_revert_p2_bot_to_off = 0}
	Change \{g_in_tutorial = 0}
	Change \{vocal_tut_no_star_power = 0}
	Change \{vocal_tut_mute = 0}
	training_stop_hud_flashing_red
	setsoundbussparams {band_Balance = {vol = ($default_BussSet.band_Balance.vol)}}
	setsoundbussparams {leadvox_balance = {vol = ($default_BussSet.leadvox_balance.vol)}}
	KillSpawnedScript \{Name = update_score_fast}
	setslomo \{1.0}
	setslomo_song \{slomo = 1.0}
	band_unload_anim_paks
endscript

script tutorial_setup_band \{players = 1}
	if NOT GotParam \{part}
		part = guitar
		if NOT IsGuitarController controller = ($primary_controller)
			part = drum
			if NOT isdrumcontroller controller = ($primary_controller)
				part = vocals
			endif
		endif
	endif
	Change current_num_players = <players>
	gamemode_updatenumplayers num_players = <players>
	Change structurename = player1_status part = <part>
	Change \{structurename = player1_status
		character_id = emptyguy}
	<instrument_array> = [guitar bass drum vocals]
	<band_member_array> = [GUITARIST BASSIST drummer vocalist]
	<i> = 0
	begin
	if (<part> = (<instrument_array> [<i>]))
		Change structurename = player1_status band_member = (<band_member_array> [<i>])
		RemoveArrayElement array = <instrument_array> index = <i>
		<instrument_array> = <array>
		RemoveArrayElement array = <band_member_array> index = <i>
		<band_member_array> = <array>
		break
	endif
	<i> = (<i> + 1)
	repeat 4
	<loop_cnt> = 0
	if (($current_num_players = 4) || ($current_num_players = 8))
		<loop_cnt> = 3
	elseif ($current_num_players = 2)
		<loop_cnt> = 1
	endif
	if (<loop_cnt> > 0)
		<Player> = 2
		<inst> = 0
		begin
		<player_status> = ($0x2994109a [<Player>])
		Change structurename = <player_status> character_id = emptyguy
		Change structurename = <player_status> part = (<instrument_array> [<inst>])
		Change structurename = <player_status> band_member = (<band_member_array> [<inst>])
		<Player> = (<Player> + 1)
		<inst> = (<inst> + 1)
		repeat <loop_cnt>
	endif
	if ($current_num_players = 4 || $current_num_players = 8)
		<i> = 1
		begin
		<player_status> = ($0x2994109a [<i>])
		if ($<player_status>.part = drum)
			Change structurename = <player_status> four_lane_highway = 0
		endif
		<i> = (<i> + 1)
		repeat 4
	endif
endscript

script tutorial_enable_botplay \{bot_array = [
			1
			1
			1
			1
		]}
	tutorial_disable_botplay
	<i> = 1
	begin
	if (<bot_array> [(<i> - 1)] = 1)
		setplayerinfo <i> bot_play = 1
	endif
	<i> = (<i> + 1)
	repeat 4
endscript

script tutorial_disable_botplay 
	setplayerinfo \{1
		bot_play = 0}
	setplayerinfo \{2
		bot_play = 0}
	setplayerinfo \{3
		bot_play = 0}
	setplayerinfo \{4
		bot_play = 0}
endscript

script tutorial_quit 

	0xe9384b7a \{full}
	tutorial_shutdown
	UnPauseGame
	UnPauseGh3Sounds
	enable_pause
	SetScreenElementProps \{id = root_window
		event_handlers = [
			{
				pad_start
				gh3_start_pressed
			}
		]
		replace_handlers}
	Change \{game_mode = practice}
	Change \{check_for_unplugged_controllers = 0}
	if GotParam \{state}
		generic_event_back state = <state>
	else
		generic_event_back
	endif
endscript

script tutorial_quit_warning 
	tutorial_close_pause_window \{dont_unpause}
	training_create_quit_warning_popup
endscript

script tutorial_restart_warning 
	tutorial_close_pause_window \{dont_unpause}
	training_create_restart_warning_popup
endscript

script tutorial_skip_warning 
	tutorial_close_pause_window \{dont_unpause}
	training_create_skip_warning_popup
endscript

script tutorial_close_pause_window 
	if ScreenElementExists \{id = pausemenu_bg}
		LaunchEvent \{Type = unfocus
			target = generic_barrel_vmenu}
	else
		return
	endif
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{Type = focus
			target = menu_tutorial}
	endif
	ui_destroy_pausemenu
	if NOT GotParam \{dont_unpause}
		UnPauseGame
		UnPauseGh3Sounds
	endif
	Change \{g_tutorial_pause_is_up = 0}
endscript

script training_get_language_prefix 
	if English
		return \{language_prefix = 'EN'}
	elseif German
		return \{language_prefix = 'GR'}
	elseif French
		return \{language_prefix = 'FR'}
	elseif Italian
		return \{language_prefix = 'IT'}
	elseif Spanish
		return \{language_prefix = 'SP'}
	endif
	return \{language_prefix = 'EN'}
endscript

script training_play_sound \{Volume = 0}
	if NOT GotParam \{Sound}

		return
	endif
	training_get_language_prefix
	formatText TextName = 0xaa5c3627 '_%a' a = <language_prefix>
	formatText checksumName = 0x2942a766 '%a' a = <Sound>
	ExtendCrc <0x2942a766> <0xaa5c3627> out = sound_id
	PlaySound <sound_id> vol = <Volume> buss = Training_VO slot = 3
	if GotParam \{Wait}
		begin
		if NOT issoundplaying <sound_id>
			break
		endif
		Wait \{1
			gameframe}
		repeat
	endif
endscript

script training_wait_for_sound 
	if NOT GotParam \{Sound}

		return
	endif
	training_get_language_prefix
	formatText TextName = 0xaa5c3627 '_%a' a = <language_prefix>
	formatText checksumName = 0x2942a766 '%a' a = <Sound>
	ExtendCrc <0x2942a766> <0xaa5c3627> out = sound_id
	begin
	if NOT issoundplaying <sound_id>
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script training_is_sound_playing 
	if NOT GotParam \{Sound}

		return
	endif
	training_get_language_prefix
	formatText TextName = 0xaa5c3627 '_%a' a = <language_prefix>
	formatText checksumName = 0x2942a766 '%a' a = <Sound>
	ExtendCrc <0x2942a766> <0xaa5c3627> out = sound_id
	if issoundplaying <sound_id>
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script training_play_positive \{who = god}
	if (<who> = god)
		RandomNoRepeat (
			@ training_play_sound \{Sound = 'Tutorial_God_Positive_01'}
			@ training_play_sound \{Sound = 'Tutorial_God_Positive_02'}
			@ training_play_sound \{Sound = 'Tutorial_God_Positive_03'}
			@ training_play_sound \{Sound = 'Tutorial_God_Positive_05'}
			@ training_play_sound \{Sound = 'Tutorial_God_Positive_06'}
			@ training_play_sound \{Sound = 'Tutorial_God_Positive_07'}
			)
	elseif (<who> = GUITARIST)
		RandomNoRepeat (
			@ training_play_sound \{Sound = 'Tut_Gtr_Positive_01_GTR'}
			@ training_play_sound \{Sound = 'Tut_Gtr_Positive_02_GTR'}
			@ training_play_sound \{Sound = 'Tut_Gtr_Positive_03_GTR'}
			@ training_play_sound \{Sound = 'Tut_Gtr_Positive_04_GTR'}
			@ training_play_sound \{Sound = 'Tut_Gtr_Positive_05_GTR'}
			@ training_play_sound \{Sound = 'Tut_Gtr_Positive_06_GTR'}
			@ training_play_sound \{Sound = 'Tut_Gtr_Positive_07_GTR'}
			@ training_play_sound \{Sound = 'Tut_Gtr_Positive_08_GTR'}
			)
	elseif (<who> = vocalist)
		RandomNoRepeat (
			@ training_play_sound \{Sound = 'Tut_Vox_HitNotes_09_VOX'}
			@ training_play_sound \{Sound = 'Tut_Vox_Words_08_VOX'}
			@ training_play_sound \{Sound = 'Tut_Vox_Words_09_VOX'}
			@ training_play_sound \{Sound = 'Tut_Vox_Words_10_VOX'}
			@ training_play_sound \{Sound = 'Tut_Vox_Words_11_VOX'}
			@ training_play_sound \{Sound = 'Tut_Vox_Freeform_09_VOX'}
			@ training_play_sound \{Sound = 'Tut_Vox_Freeform_10_VOX'}
			@ training_play_sound \{Sound = 'Tut_Vox_StarPower_09_VOX'}
			@ training_play_sound \{Sound = 'Tut_Vox_StarPower_10_VOX'}
			)
	elseif (<who> = BASSIST)
		RandomNoRepeat (
			@ training_play_sound \{Sound = 'Tut_Gtr_OpenNotes_06_BAS'}
			@ training_play_sound \{Sound = 'Tut_Gtr_OpenNotes_07_BAS'}
			@ training_play_sound \{Sound = 'Tut_Gtr_OpenNotes_08_BAS'}
			@ training_play_sound \{Sound = 'Tut_Gtr_OpenNotes_09_BAS'}
			@ training_play_sound \{Sound = 'Tut_Vs_Battle_03_BAS'}
			@ training_play_sound \{Sound = 'Tut_RS_AdvGtr_10_BAS'}
			@ training_play_sound \{Sound = 'Tut_RS_StepRec_05_BAS'}
			)
	elseif (<who> = drummer)
		RandomNoRepeat (
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_01_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_02_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_03_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_04_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_05_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_06_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_07_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_08_DRM'}
			)
	elseif (<who> = lou)
		RandomNoRepeat (
			@ training_play_sound \{Sound = 'Tutorial_Lou_Positive_01'}
			@ training_play_sound \{Sound = 'Tutorial_Lou_Positive_02'}
			@ training_play_sound \{Sound = 'Tutorial_Lou_Positive_03'}
			@ training_play_sound \{Sound = 'Tutorial_Lou_Positive_04'}
			@ training_play_sound \{Sound = 'Tutorial_Lou_Positive_05'}
			@ training_play_sound \{Sound = 'Tutorial_Lou_Positive_06'}
			@ training_play_sound \{Sound = 'Tutorial_Lou_Positive_07'}
			)
	endif
endscript

script training_play_negative \{who = god}
	if (<who> = god)
		RandomNoRepeat (
			@ training_play_sound \{Sound = 'Tutorial_God_Negative_01'}
			@ training_play_sound \{Sound = 'Tutorial_God_Negative_02'}
			@ training_play_sound \{Sound = 'Tutorial_God_Negative_03'}
			@ training_play_sound \{Sound = 'Tutorial_God_Negative_04'}
			@ training_play_sound \{Sound = 'Tutorial_God_Negative_05'}
			@ training_play_sound \{Sound = 'Tutorial_God_Negative_06'}
			)
	elseif (<who> = lou)
		RandomNoRepeat (
			@ training_play_sound \{Sound = 'Tutorial_Lou_Negative_01'}
			@ training_play_sound \{Sound = 'Tutorial_Lou_Negative_02'}
			)
	endif
endscript

script safe_show \{time = 0.0}
	if ScreenElementExists id = <id>
		<id> :se_setprops alpha = 1 time = <time>
	endif
endscript

script safe_hide \{time = 0.0}
	if ScreenElementExists id = <id>
		<id> :se_setprops alpha = 0 time = <time>
	endif
endscript

script safe_destroy 
	if ScreenElementExists id = <id>
		DestroyScreenElement id = <id>
	endif
endscript

script training_display_notes_hit \{notes_required = 8}
	if (<notes_hit> < <notes_required>)
		formatText TextName = hit_text qs(0xe4739e40) h = (<notes_required> - <notes_hit>)
	else
		<hit_text> = qs(0x6e9e36e2)
	endif
	lessonheader :se_setprops {
		task_notes_remaining_text = <hit_text>
	}
endscript

script training_start_gem_scroller \{players = 1
		part = guitar
		bot_array = [
			0
			1
			0
			0
		]
		difficulty = easy}
	0xd3f993c8 \{0x9fe16047}
	OnExitRun \{0xe5a305c6}

	tutorial_setup_band players = <players> part = <part>
	vocals_distribute_mics
	if ((<players> = 4) || (<players> = 8))
		tutorial_enable_botplay \{bot_array = [
				1
				1
				1
				1
			]}
	else
		tutorial_enable_botplay <...>
	endif
	setplayerinfo 1 controller = ($primary_controller)
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	disable_pause
	Change \{tutorial_okay_to_create_pause_handler = 0}
	Change \{current_transition = fastintrotutorial}
	KillSpawnedScript \{Name = training_set_health}
	SpawnScriptNow \{training_set_health
		params = {
			health = 1.0
		}
		id = training_spawned_script}
	training_set_score \{score = 0
		player_status = player1_status}
	training_set_score \{score = 0
		player_status = player2_status}
	training_set_score \{score = 0
		player_status = player3_status}
	training_set_score \{score = 0
		player_status = player4_status}
	if (<players> = 1)
		start_gem_scroller song_name = <song> difficulty = <difficulty> difficulty2 = easy starttime = 0 device_num = ($player1_status.controller) training_mode = 1 <...>
	elseif (<players> = 2)
		start_gem_scroller song_name = <song> difficulty = hard difficulty2 = hard starttime = 0 training_mode = 1 <...>
	elseif ((<players> = 4) || (<players> = 8))
		start_gem_scroller song_name = <song> difficulty = <difficulty> difficulty2 = <difficulty> difficulty3 = <difficulty> difficulty4 = <difficulty> starttime = 0 training_mode = 1 <...>
	endif
	begin
	if ($tutorial_okay_to_create_pause_handler = 1)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	create_training_pause_handler
	Change \{structurename = player1_status
		current_health = 1.0}
	Change \{structurename = player2_status
		current_health = 1.0}
	Change \{structurename = player1_status
		star_power_amount = 0.0}
	Change \{structurename = player1_status
		star_power_used = 0}
	Change \{current_crowd = 1.0}
	Change \{training_song_over = 0}
	Change \{notes_hit = 0}
	Change \{notes_missed = 0}
	Change \{disable_note_input = 1}
	0xdf9f604d
endscript

script training_setup_camera \{Name = ch_view_cam}
	PlayIGCCam {
		id = cs_view_cam_id
		Name = <Name>
		viewport = bg_viewport
		LockTo = World
		Pos = (-0.068807, 1.5990009, 5.7975965)
		Quat = (0.000506, 0.99942994, -0.017537998)
		FOV = 72.0
		play_hold = 1
		interrupt_current
	}
endscript

script training_destroy_gem_scroller \{delay = 0.0}
	0xd3f993c8 \{freeze}
	StopRendering
	PauseGame
	if (<delay> > 0)
		Wait <delay> Seconds ignoreslomo
	endif
	KillCamAnim \{Name = ch_view_cam}
	kill_gem_scroller \{training_mode = 1
		no_render = 1}
	Change \{check_for_unplugged_controllers = 1}
	destroy_bg_viewport
	setup_bg_viewport
	training_setup_camera
	UnPauseGh3Sounds
	UnPauseGame
	StartRendering
	0xe5a305c6
endscript
0xd441408d = 0

script training_pause_gem_scroller 
	Change \{0xd441408d = 1}
	songsetmastervolume \{vol = -100
		time = 0.2}
	Wait \{0.25
		Seconds}
	songpause
	setslomo \{0.0}
	setslomo_song \{slomo = 0.0}
endscript

script training_resume_gem_scroller 
	Change \{0xd441408d = 0}
	songsetmastervolume \{vol = 0
		time = 0.2}
	Wait \{0.25
		Seconds
		ignoreslomo}
	setslomo \{1.0}
	setslomo_song \{slomo = 1.0}
	songunpause
	Change \{disable_note_input = 0}
	if GotParam \{enable_mic}
		Change \{vocal_tut_mute = 0}
		vocals_mute_all_mics \{mute = FALSE}
	endif
	if GotParam \{enable_star_power}
		Change \{vocal_tut_no_star_power = 0}
	endif
endscript

script training_set_health \{player_status = player1_status}
	inc = 0.03
	begin
	if GotParam \{Band}
		current_health = ($band1_status.current_health)
	else
		current_health = ($<player_status>.current_health)
	endif
	if (<current_health> < <health>)
		if ((<health> - <current_health>) < <inc>)
			<new_health> = <health>
		else
			<new_health> = (<current_health> + <inc>)
		endif
	else
		if ((<current_health> - <health>) < <inc>)
			<new_health> = <health>
		else
			<new_health> = (<current_health> - <inc>)
		endif
	endif
	if GotParam \{Band}
		Change structurename = band1_status current_health = <new_health>
	else
		Change structurename = <player_status> current_health = <new_health>
		if NOT GotParam \{ignore_band_members}
			if ($current_num_players = 4)
				Change structurename = player2_status current_health = <new_health>
				Change structurename = player3_status current_health = <new_health>
				Change structurename = player4_status current_health = <new_health>
			endif
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script training_show_title 
	if ScreenElementExists \{id = tutorial_title}
		DestroyScreenElement \{id = tutorial_title}
	endif
	CreateScreenElement \{parent = training_container
		id = tutorial_title
		Type = descinterface
		desc = 'tutorial_title'}
	if GotParam \{dims}
		tutorial_title :0x8e6af868 child = tutorial_title_text dims = <dims>
	endif
	tutorial_title :se_setprops {
		tutorial_title_container_alpha = 0
		tutorial_title_text_text = <title>
	}
	tutorial_title :se_setprops \{tutorial_title_container_alpha = 1
		time = 0.75}
	tutorial_title :se_waitprops
endscript

script training_destroy_title 
	if ScreenElementExists \{id = tutorial_title}
		tutorial_title :se_setprops \{tutorial_title_container_alpha = 0
			time = 0.75}
		tutorial_title :se_waitprops
		if GotParam \{ignoreslomo}
			Wait \{0.75
				Seconds
				ignoreslomo}
		else
			Wait \{0.75
				Seconds}
		endif
		DestroyScreenElement \{id = tutorial_title}
	endif
endscript

script training_wait_for_gem_scroller_time 
	begin
	GetSongTime
	if (<songtime> >= <time>)
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script training_create_quit_warning_popup 
	if NOT ScreenElementExists \{id = dialog_box_container}
		create_dialog_box \{heading_text = qs(0xaa163738)
			body_text = qs(0x41d4743f)
			options = [
				{
					func = tutorial_quit_warning_resume
					text = qs(0xf7723015)
				}
				{
					func = tutorial_quit_warning_choose
					text = qs(0x67d9c56d)
				}
			]
			back_button_script = tutorial_quit_warning_resume}
		if ScreenElementExists \{id = menu_tutorial}
			LaunchEvent \{Type = unfocus
				target = menu_tutorial}
		endif
	endif
endscript

script training_create_restart_warning_popup 
	if NOT ScreenElementExists \{id = dialog_box_container}
		create_dialog_box \{heading_text = qs(0xaa163738)
			body_text = qs(0x05261ea3)
			options = [
				{
					func = tutorial_restart_warning_resume
					text = qs(0xf7723015)
				}
				{
					func = tutorial_restart_warning_choose
					text = qs(0xb8790f2f)
				}
			]
			back_button_script = tutorial_restart_warning_resume}
		if ScreenElementExists \{id = menu_tutorial}
			LaunchEvent \{Type = unfocus
				target = menu_tutorial}
		endif
	endif
endscript

script training_create_skip_warning_popup 
	if NOT ScreenElementExists \{id = dialog_box_container}
		create_dialog_box \{heading_text = qs(0xaa163738)
			body_text = qs(0x90b2a648)
			options = [
				{
					func = tutorial_skip_warning_resume
					text = qs(0xf7723015)
				}
				{
					func = tutorial_skip_warning_choose
					text = qs(0x784c64ff)
				}
			]
			back_button_script = tutorial_skip_warning_resume}
		if ScreenElementExists \{id = menu_tutorial}
			LaunchEvent \{Type = unfocus
				target = menu_tutorial}
		endif
	endif
endscript

script tutorial_quit_warning_resume 
	tutorial_close_quit_warning_screen
	training_create_pause_menu \{UseLastTitle}
endscript

script tutorial_quit_warning_choose 
	tutorial_close_quit_warning_screen
	tutorial_quit
endscript

script tutorial_restart_warning_resume 
	tutorial_close_restart_warning_screen
	training_create_pause_menu \{UseLastTitle}
endscript

script tutorial_restart_warning_choose 
	tutorial_close_restart_warning_screen
	tutorial_restart
endscript

script tutorial_skip_warning_resume 
	tutorial_close_quit_warning_screen
	training_create_pause_menu \{UseLastTitle}
endscript

script tutorial_skip_warning_choose 
	tutorial_close_quit_warning_screen
	tutorial_skip_lesson
endscript

script tutorial_close_quit_warning_screen 
	if ScreenElementExists \{id = dialog_box_container}
		LaunchEvent \{Type = unfocus
			target = dialog_box_vmenu}
	else
		return
	endif
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{Type = focus
			target = menu_tutorial}
	endif
	destroy_dialog_box
endscript

script tutorial_close_restart_warning_screen 
	tutorial_close_quit_warning_screen
endscript

script rotate_highlight_sparkle_glow \{time = 3}

	<rot1> = 360
	<rot2> = 180
	<alpha1> = 0.6
	<alpha2> = 0.4
	if <id> :desc_resolvealias Name = alias_highlight_sparkle_glow
		AssignAlias id = <resolved_id> alias = highlight_sparkle_glow
		<id> = highlight_sparkle_glow
	endif
	begin
	<id> :se_setprops {
		highlight_glow_rot_angle = <rot1>
		highlight_glow_alpha = <alpha1>
		highlight_sparkle_rot_angle = <rot2>
		highlight_sparkle_alpha = <alpha2>
		time = <time>
	}
	<rot1> = (<rot1> + 360)
	<rot2> = (<rot2> + 180)
	if NOT (<alpha1> = 0)
		<alpha1> = 0
	else
		<alpha1> = 0.6
	endif
	if NOT (<alpha2> = 0)
		<alpha2> = 0
	else
		<alpha2> = 0.4
	endif
	Wait <time> Seconds ignoreslomo
	repeat
endscript

script training_set_score \{score = 10000
		player_status = player1_status}
	Change structurename = <player_status> score = <score>
	SpawnScriptLater update_score_fast params = {<...>} id = training_spawned_script
	Wait \{1
		frames
		ignoreslomo}
	KillSpawnedScript \{Name = update_score_fast}
endscript

script training_start_hud_flashing_red 
	setslomo \{1.0}
	setslomo_song \{slomo = 1.0}
	KillSpawnedScript \{Name = training_set_health}
	SpawnScriptNow \{training_set_health
		params = {
			health = 0.0
		}
		id = training_spawned_script}
	Change \{current_crowd = 0.0}
	if ($current_num_players = 1)
	else
		band_failing_vignette_on
	endif
endscript

script training_stop_hud_flashing_red \{reset_crowd = 1
		pause_highway = 1}
	if ($current_num_players = 1)
		getplayerinfo \{1
			part}
		if (<part> = vocals)
			vocalshighway_getid \{Player = 1}
			if ScreenElementExists id = <vocals_highway_id>
				<vocals_highway_id> :se_setprops bg_alpha = 0
			endif
		endif
	else
		band_failing_vignette_off
	endif
	if (<reset_crowd>)
		Change \{current_crowd = 1.0}
	endif
	if (<pause_highway>)
		setslomo \{0.0}
		setslomo_song \{slomo = 0.0}
	endif
endscript

script training_generic_lesson_complete 

	ui_event_wait_for_safe
	destroy_dialog_box
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	Wait \{0.75
		Seconds
		ignoreslomo}
	training_hide_lesson_header
	training_resume_gem_scroller
	training_destroy_gem_scroller
	SoundEvent \{event = Tutorial_Mode_Finish_Chord}
	SpawnScriptNow \{create_exploding_text
		id = training_spawned_script
		params = {
			parent = 'lesson_complete'
			text = qs(0xd50843f0)
			text_physics = 0
		}}
	Change \{check_for_unplugged_controllers = 1}
	Wait \{7
		Seconds
		ignoreslomo}
	KillSpawnedScript \{Name = create_exploding_text}
	destroy_exploding_text \{parent = 'lesson_complete'}
	Change g_training_lessons_completed = ($g_training_lessons_completed + 1)
endscript

script 0x229a47a9 \{Color = [
			255
			255
			255
			255
		]
		Scale = (0.9, 0.9)}
	lessonheader :0x8e6af868 child = task_text {
		rgba = (<Color>)
		Scale = (<Scale>)
	}
endscript
