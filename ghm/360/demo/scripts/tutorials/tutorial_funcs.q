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
	formattext checksumname = narrator_texture 'tutorial_narrator_%n_%e' n = <narrator_text> e = <expression>
	destroyscreenelement id = <narrator_texture>
	createscreenelement {
		parent = <parent>
		type = spriteelement
		id = <narrator_texture>
		just = [center center]
		texture = <narrator_texture>
		dims = (200.0, 200.0)
		pos = (213.0, 182.0)
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
	if NOT gotparam \{expression}
		<expression> = Random (@ 0 @ 1 @ 2 )
	else
		if (<expression> < 0 || <expression> > 2)
			scriptassert \{qs(0x647b1690)}
		endif
	endif
	formattext checksumname = narrator_texture 'tutorial_narrator_%n_%e' n = <narrator> e = <expression>
	if (<new_pos> = (213.0, 182.0))
		training_container :gettags
		if ((<type> = studio) || (<type> = ghmix))
			<hflip> = 1
		endif
		if screenelementexists \{id = lessonheader}
			lessonheader :se_getprops
			if gotparam \{tutorial_narrator_placeholder_pos}
				<new_pos> = (<tutorial_narrator_placeholder_pos> + (188.0, 132.0))
			endif
		endif
	endif
	<narrator_texture> :se_getprops pos
	if NOT (<new_pos> = <pos>)
		<narrator_texture> :se_setprops pos = <new_pos>
	endif
	if screenelementexists \{id = lessonheader}
		lessonheader :se_setprops \{tutorial_narrator_placeholder_alpha = 0
			time = 0.1}
	endif
	if gotparam \{hflip}
		<scale> = (-1.0, 1.0)
	else
		<scale> = (1.0, 1.0)
	endif
	<narrator_texture> :se_setprops scale = <scale>
	safe_show id = <narrator_texture> time = 0.1
	if screenelementexists \{id = tutorial_lesson_container}
		tutorial_lesson_container :gettags
		tutorial_lesson_container :se_getprops \{pos}
		if (<pos> = <pos2>)
			tutorial_lesson_container :se_setprops pos = <pos1>
		endif
	endif
endscript

script training_hide_narrator 
	if gotparam \{narrator}
		<expression> = 0
		begin
		formattext checksumname = narrator_texture 'tutorial_narrator_%n_%e' n = <narrator> e = <expression>
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
		formattext checksumname = narrator_texture 'tutorial_narrator_%n_%e' n = <narrator_text> e = <expression>
		if screenelementexists id = <narrator_texture>
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
	if NOT gotparam \{no_placeholder}
		if screenelementexists \{id = lessonheader}
			training_header_container :se_getprops
			if (<alpha> != 0)
				lessonheader :se_setprops \{tutorial_narrator_placeholder_alpha = 1
					time = 0.1}
			endif
		endif
	else
		if screenelementexists \{id = tutorial_lesson_container}
			training_container :gettags
			if (<type> = standard)
				tutorial_lesson_container :gettags
				tutorial_lesson_container :se_getprops \{pos}
				if (<pos> = <pos1>)
					tutorial_lesson_container :se_setprops pos = <pos2>
				endif
			endif
		endif
	endif
endscript

script training_hide_placeholder 
	if screenelementexists \{id = lessonheader}
		training_header_container :se_getprops
		if (<alpha> != 0)
			lessonheader :se_setprops \{tutorial_narrator_placeholder_alpha = 0
				time = 0.1}
		endif
		training_container :gettags
		if (<type> = standard)
			tutorial_lesson_container :gettags
			tutorial_lesson_container :se_getprops \{pos}
			if (<pos> = <pos1>)
				tutorial_lesson_container :se_setprops pos = <pos2>
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
	formattext checksumname = narrator_texture 'tutorial_narrator_%n_%e' n = <narrator_text> e = <expression>
	destroyscreenelement id = <narrator_texture>
	<expression> = (<expression> + 1)
	repeat 3
	<narrator> = (<narrator> + 1)
	repeat 4
endscript

script training_create_and_hide_headers \{type = standard}
	training_create_lesson_and_task_headers type = <type>
	training_hide_lesson_header
endscript

script training_create_lesson_and_task_headers \{type = standard}
	if NOT screenelementexists \{id = training_container}
		createscreenelement \{type = containerelement
			id = training_container
			parent = root_window
			pos = (0.0, 0.0)}
	endif
	if screenelementexists \{id = training_header_container}
		return
	endif
	z = 80
	training_container :settags type = <type>
	createscreenelement {
		type = containerelement
		id = training_header_container
		parent = training_container
		pos = (0.0, 0.0)
		z_priority = <z>
	}
	switch <type>
		case standard
		createscreenelement \{parent = training_header_container
			id = lessonheader
			type = descinterface
			desc = 'tutorial_header_2'}
		lesson_header_frame_width = 586
		lesson_header_frame_height = 220
		center_pos = (630.0, 180.0)
		case battle
		createscreenelement \{parent = training_header_container
			id = lessonheader
			type = descinterface
			desc = 'tutorial_header_battle'}
		lesson_header_frame_width = 486
		lesson_header_frame_height = 220
		center_pos = (648.0, 200.0)
		case ghmix
		createscreenelement \{parent = training_header_container
			id = lessonheader
			type = descinterface
			desc = 'tutorial_header_ghmix'}
		lesson_header_frame_width = 436
		lesson_header_frame_height = 320
		center_pos = (883.0, 265.0)
		case studio
		createscreenelement \{parent = training_header_container
			id = lessonheader
			type = descinterface
			desc = 'tutorial_header_studio'}
		lesson_header_frame_width = 386
		lesson_header_frame_height = 420
		center_pos = (677.0, 280.0)
		default
		createscreenelement \{parent = training_header_container
			id = lessonheader
			type = descinterface
			desc = 'tutorial_header_2'}
		lesson_header_frame_width = 586
		lesson_header_frame_height = 220
		center_pos = (630.0, 180.0)
	endswitch
	if lessonheader :desc_resolvealias \{name = alias_tutorial_lesson_container}
		assignalias id = <resolved_id> alias = tutorial_lesson_container
		tutorial_lesson_container :se_getprops \{pos}
		tutorial_lesson_container :settags {pos1 = <pos> pos2 = (<pos> + (194.0, 0.0))}
	endif
	lesson_header_frame_dims = (<lesson_header_frame_width> * (1.0, 0.0) + <lesson_header_frame_height> * (0.0, 1.0))
	create_ui_frame {
		frame_dims = <lesson_header_frame_dims>
		center_pos = <center_pos>
		parent = training_header_container
		frame_rgba = [50 30 30 150]
		fill_rgba = [0 0 0 150]
		z_priority = (<z> - 0.1)
		offset_top = 32
		offset_side = 32
		min_fill_pad_width = 73
		min_fill_pad_height = 129
		tex_param = 'simple'
		suffix = 0
	}
	assignalias id = <id> alias = lesson_header_frame
	if screenelementexists \{id = lesson_header_frame}
		lesson_header_frame :se_setprops \{alpha = 0}
	endif
endscript

script training_change_header_type \{type = standard}
	destroyscreenelement \{id = training_header_container}
	training_create_lesson_and_task_headers type = <type>
	training_hide_lesson_header
endscript

script training_destroy_lesson_and_task_headers 
	destroy_menu \{menu_id = training_container}
endscript

script training_hide_lesson_header 
	if screenelementexists \{id = training_header_container}
		training_header_container :se_setprops \{alpha = 0}
	endif
	training_clear_lesson_body_text
	training_hide_task_header
endscript

script training_show_lesson_header 
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
	lessonheader :obj_killspawnedscript \{name = training_blink_task}
	lessonheader :obj_spawnscriptlater \{training_blink_task}
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
		type = standard}
	if lessonheader :desc_resolvealias \{name = alias_tutorial_body_vmenu}
		assignalias id = <resolved_id> alias = tutorial_body_vmenu
		formattext textname = lesson_body_num qs(0x8c5c152d) n = <number>
		training_container :gettags
		switch <type>
			case standard
			createscreenelement {
				parent = tutorial_body_vmenu
				type = descinterface
				desc = 'tutorial_body_info'
				tutorial_body_info_num_text = <lesson_body_num>
				tutorial_body_info_text_text = <text>
				autosizedims = true
			}
			case battle
			createscreenelement {
				parent = tutorial_body_vmenu
				type = descinterface
				desc = 'tutorial_body_info_battle'
				tutorial_body_info_num_text = <lesson_body_num>
				tutorial_body_info_text_text = <text>
				just = [top left]
				autosizedims = true
			}
			case ghmix
			createscreenelement {
				parent = tutorial_body_vmenu
				type = descinterface
				desc = 'tutorial_body_info_ghmix'
				tutorial_body_info_num_text = <lesson_body_num>
				tutorial_body_info_text_text = <text>
				autosizedims = true
			}
			case studio
			createscreenelement {
				parent = tutorial_body_vmenu
				type = descinterface
				desc = 'tutorial_body_info_studio'
				tutorial_body_info_num_text = <lesson_body_num>
				tutorial_body_info_text_text = <text>
				autosizedims = true
			}
			default
			createscreenelement {
				parent = tutorial_body_vmenu
				type = descinterface
				desc = 'tutorial_body_info'
				tutorial_body_info_num_text = <lesson_body_num>
				tutorial_body_info_text_text = <text>
				autosizedims = true
			}
		endswitch
		if screenelementexists \{id = lesson_header_frame}
			lesson_header_frame :se_setprops \{alpha = 1}
		endif
		<id> :desc_refreshcontentdims
	endif
endscript

script training_clear_lesson_body_text 
	if screenelementexists \{id = tutorial_body_vmenu}
		if getscreenelementchildren \{id = tutorial_body_vmenu}
			getarraysize <children>
			if NOT (<array_size> = 0)
				<i> = 0
				begin
				destroyscreenelement id = (<children> [<i>])
				i = (<i> + 1)
				repeat <array_size>
			endif
		endif
	endif
	if screenelementexists \{id = lesson_header_frame}
		lesson_header_frame :se_setprops \{alpha = 0}
	endif
endscript

script training_set_task_header_body \{text = qs(0x00000000)}
	lessonheader :se_setprops {
		task_text_text = <text>
	}
endscript

script training_hide_vo_sub 
endscript

script training_show_vo_sub 
endscript

script training_add_arrow \{pos = (640.0, 360.0)
		rot = 0
		z = 99
		scale = 1.0}
	if NOT gotparam \{life}
		life = ($g_training_arrow_life)
	endif
	setsearchallassetcontexts
	if NOT screenelementexists \{id = training_arrow_container}
		createscreenelement \{type = containerelement
			id = training_arrow_container
			parent = training_container
			pos = (0.0, 0.0)}
	endif
	createscreenelement {
		parent = training_arrow_container
		type = spriteelement
		just = [center bottom]
		texture = tutorial_arrow
		pos = <pos>
		rot_angle = <rot>
		scale = <scale>
		rgba = [255 255 255 255]
		z_priority = <z>
		alpha = 0
	}
	arrow_id = <id>
	setsearchallassetcontexts \{off}
	<arrow_id> :settags phase_change = 1
	cos <rot>
	sin <rot>
	<arrow_id> :settags phase_direction = ((1.0, 0.0) * <sin> + (0.0, -1.0) * <cos>)
	<arrow_id> :settags alive = 0.0
	<arrow_id> :settags initial_pos = <pos>
	<arrow_id> :settags motion = ease_in
	<arrow_id> :settags initial_fade = 0
	<arrow_id> :settags final_fade = 0
	spawnscriptnow training_make_pointer_point_now params = {id = <arrow_id> life = <life>} id = training_spawned_script
endscript

script training_make_pointer_point_now 
	if NOT gotparam \{id}
		scriptassert \{qs(0x12e9163e)}
	endif
	<fade_time> = 0.5
	begin
	getdeltatime \{ignore_slomo}
	<id> :gettags
	arrow_age = (<alive> + <delta_time>)
	if (<arrow_age> > <life>)
		break
	endif
	if (<motion> = ease_out)
		<motion> = ease_in
		<id> :settags motion = ease_in
	else
		<motion> = ease_out
		<id> :settags motion = ease_out
	endif
	<new_pos> = (<initial_pos> + <phase_direction> * ($g_training_arrow_movement_distance) * <phase_change>)
	if (<initial_fade> = 0)
		<id> :se_setprops pos = <new_pos> alpha = 1 time = ($g_training_arrow_bounce_time) motion = <motion>
		<id> :settags initial_fade = 1
	elseif (<arrow_age> > <life> - <fade_time>)
		if (<final_fade> = 0)
			<id> :se_setprops pos = <new_pos> alpha = 0 time = ($g_training_arrow_bounce_time) motion = <motion>
			<id> :settags final_fade = 1
		endif
	else
		<id> :se_setprops pos = <new_pos> time = ($g_training_arrow_bounce_time) motion = <motion>
	endif
	wait ($g_training_arrow_bounce_time) seconds ignoreslomo
	<phase_change> = (<phase_change> * -1)
	<arrow_age> = (<arrow_age> + ($g_training_arrow_bounce_time))
	<id> :settags alive = (<arrow_age>)
	<id> :settags phase_change = (<phase_change>)
	wait \{1
		gameframe}
	repeat
	destroyscreenelement id = <id>
endscript

script training_destroy_all_arrows 
	killspawnedscript \{name = training_make_pointer_point_now}
	if screenelementexists \{id = training_arrow_container}
		training_arrow_container :se_setprops alpha = 0 time = ($g_training_arrow_bounce_time)
		if screenelementexists \{id = training_arrow_container}
			destroyscreenelement \{id = training_arrow_container}
		endif
	endif
endscript

script set_vo_sub_text 
	setscreenelementprops id = temp_vo_sub_body text = <text>
endscript

script training_init_session \{header_type = standard}
	change \{game_mode = tutorial}
	change \{g_in_tutorial = 1}
	spawnscriptnow \{skate8_sfx_backgrounds_new_area
		params = {
			bg_sfx_area = frontend
		}}
	menu_music_off
	destroy_bg_viewport
	setup_bg_viewport
	destroy_crowd_models
	safekill \{nodename = z_soundcheck_gfx_trg_lh_hotspot_p2}
	unpausegame
	change \{current_num_players = 1}
	gamemode_updatenumplayers \{num_players = 1}
	resumecontrollerchecking
	change \{sysnotify_paused_controllers = [
		]}
	change \{unknown_drum_type = 0}
	change \{check_for_unplugged_controllers = 1}
	training_create_and_hide_headers type = <header_type>
	training_hide_vo_sub
	playigccam \{id = cs_view_cam_id
		name = ch_view_cam
		viewport = bg_viewport
		lockto = world
		pos = (-0.068807, 1.5990009, 5.7975965)
		quat = (0.000506, 0.99942994, -0.017537998)
		fov = 72.0
		play_hold = 1
		interrupt_current}
	change \{current_crowd = 1.0}
	change \{structurename = player1_status
		current_health = 1.0}
	setplayerinfo 1 controller = ($primary_controller)
	tutorial_setup_band
	hide_band
endscript

script training_kill_session 
	if NOT gotparam \{from_restart}
		change \{g_in_tutorial = 0}
		training_stop_hud_flashing_red
		change \{vocal_tut_no_star_power = 0}
		change \{vocal_tut_mute = 0}
	endif
	tutorial_disable_botplay
	stoprendering
	training_clear_out_star_power
	pausegame
	killspawnedscript \{name = create_exploding_text}
	destroy_all_exploding_text
	killcamanim \{name = ch_view_cam}
	destroy_bg_viewport
	training_destroy_lesson_and_task_headers
	setsoundbussparams {band_balance = {vol = ($default_bussset.band_balance.vol)}}
	change \{disable_note_input = 0}
	change \{tutorial_disable_hud = 0}
	change \{g_revert_p2_bot_to_off = 0}
	killspawnedscript \{name = update_score_fast}
	unpausespawnedscript \{training_script_update}
	band_unload_anim_paks
	unpausegame
endscript

script training_clear_out_star_power 
	printf \{qs(0xfbe6fa97)}
	<i> = 1
	begin
	getplayerinfo <i> checksum
	getplayerinfo <i> player
	getplayerinfo <i> text
	change structurename = <checksum> star_power_amount = 0
	kill_starpower_stagefx player_text = <text> player_status = <checksum> ifempty = 0
	<i> = (<i> + 1)
	repeat $current_num_players
endscript

script training_are_notes_flipped 
	if ($player1_status.lefty_flip = 1)
		return \{true}
	endif
	return \{false}
endscript

script show_training_pause_screen 
	setscriptcannotpause
	if ($g_tutorial_pause_is_up)
		return
	endif
	pausegame
	pausegh3sounds
	training_create_pause_menu <...>
endscript

script create_training_pause_handler 
	event_handlers = [{pad_start show_training_pause_screen}]
	if NOT screenelementexists \{id = menu_tutorial}
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
	launchevent \{type = focus
		target = menu_tutorial}
endscript
tutorial_okay_to_create_pause_handler = 1

script enable_tutorial_pause 
	change \{tutorial_okay_to_create_pause_handler = 1}
endscript
training_prev_paused_title = none

script training_create_pause_menu 
	if NOT screenelementexists \{id = pausemenu_bg}
		if screenelementexists \{id = menu_tutorial}
			launchevent \{type = unfocus
				target = menu_tutorial}
		endif
		if gotparam \{uselasttitle}
			if ($training_prev_paused_title = failed)
				<tutorial_pause_title> = qs(0x5c9b76c1)
				<tutorial_failed> = 1
			else
				<tutorial_pause_title> = qs(0x662aaaf7)
				<tutorial_failed> = 0
			endif
		else
			if gotparam \{songfailed}
				<tutorial_pause_title> = qs(0x5c9b76c1)
				change \{training_prev_paused_title = failed}
				<tutorial_failed> = 1
			else
				<tutorial_pause_title> = qs(0x662aaaf7)
				change \{training_prev_paused_title = paused}
				<tutorial_failed> = 0
			endif
		endif
		change last_start_pressed_device = ($primary_controller)
		ui_create_pausemenu tutorial_pause_title = <tutorial_pause_title> tutorial_failed = <tutorial_failed> extra_z = 1000
		launchevent \{type = focus
			target = current_menu}
	endif
	change \{g_tutorial_pause_is_up = 1}
endscript

script tutorial_resume 
	tutorial_close_pause_window
endscript

script tutorial_cheat_skip \{lesson = 1}
	change g_training_last_lesson = <lesson>
	tutorial_restart
endscript

script tutorial_skip_lesson 
	change g_training_last_lesson = ($g_training_last_lesson + 1)
	tutorial_restart
endscript

script tutorial_restart 
	stopsoundsbybuss \{training_vo}
	tutorial_close_pause_window
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	training_destroy_gem_scroller \{delay = 0.0}
	training_kill_session \{from_restart}
	kill_training_script_system
	unpausegame
	unpausegh3sounds
	setslomo \{1.0}
	setslomo_song \{slomo = 1.0}
	enable_pause
	run_training_script \{restart_lesson}
	startrendering
endscript

script tutorial_shutdown 
	stopsoundsbybuss \{training_vo}
	tutorial_close_pause_window
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	training_destroy_gem_scroller \{delay = 0.0}
	training_kill_session \{shutdown}
	kill_training_script_system
	change \{tutorial_battle = 0}
	change \{disable_note_input = 0}
	change \{tutorial_disable_hud = 0}
	change \{g_revert_p2_bot_to_off = 0}
	change \{g_in_tutorial = 0}
	change \{vocal_tut_no_star_power = 0}
	change \{vocal_tut_mute = 0}
	training_stop_hud_flashing_red
	setsoundbussparams {band_balance = {vol = ($default_bussset.band_balance.vol)}}
	setsoundbussparams {leadvox_balance = {vol = ($default_bussset.leadvox_balance.vol)}}
	killspawnedscript \{name = update_score_fast}
	setslomo \{1.0}
	setslomo_song \{slomo = 1.0}
	band_unload_anim_paks
endscript

script tutorial_setup_band \{players = 1}
	if NOT gotparam \{part}
		part = guitar
		if NOT isguitarcontroller controller = ($primary_controller)
			part = drum
			if NOT isdrumcontroller controller = ($primary_controller)
				part = vocals
			endif
		endif
	endif
	change current_num_players = <players>
	gamemode_updatenumplayers num_players = <players>
	change structurename = player1_status part = <part>
	change \{structurename = player1_status
		character_id = emptyguy}
	<instrument_array> = [guitar bass drum vocals]
	<band_member_array> = [guitarist bassist drummer vocalist]
	<i> = 0
	begin
	if (<part> = (<instrument_array> [<i>]))
		change structurename = player1_status band_member = (<band_member_array> [<i>])
		removearrayelement array = <instrument_array> index = <i>
		<instrument_array> = <array>
		removearrayelement array = <band_member_array> index = <i>
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
		<player> = 2
		<inst> = 0
		begin
		formattext checksumname = player_status 'player%i_status' i = <player>
		change structurename = <player_status> character_id = emptyguy
		change structurename = <player_status> part = (<instrument_array> [<inst>])
		change structurename = <player_status> band_member = (<band_member_array> [<inst>])
		<player> = (<player> + 1)
		<inst> = (<inst> + 1)
		repeat <loop_cnt>
	endif
	if ($current_num_players = 4 || $current_num_players = 8)
		<i> = 1
		begin
		formattext checksumname = player_status 'player%i_status' i = <i>
		if ($<player_status>.part = drum)
			change structurename = <player_status> four_lane_highway = 0
		endif
		change structurename = <player_status> highway_texture = `tex\models\highway\highway_axel_fm_01.dds`
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
	tutorial_shutdown
	unpausegame
	enable_pause
	setscreenelementprops \{id = root_window
		event_handlers = [
			{
				pad_start
				gh3_start_pressed
			}
		]
		replace_handlers}
	change \{game_mode = training}
	change \{check_for_unplugged_controllers = 0}
	if gotparam \{state}
		generic_event_back state = <state>
	else
		generic_event_back
	endif
	unpausegh3sounds
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
	if screenelementexists \{id = pausemenu_bg}
		launchevent \{type = unfocus
			target = current_menu}
	else
		return
	endif
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = focus
			target = menu_tutorial}
	endif
	ui_destroy_pausemenu
	if NOT gotparam \{dont_unpause}
		unpausegame
		unpausegh3sounds
	endif
	change \{g_tutorial_pause_is_up = 0}
endscript

script training_get_language_prefix 
	if english
		return \{language_prefix = 'EN'}
	elseif german
		return \{language_prefix = 'GR'}
	elseif french
		return \{language_prefix = 'FR'}
	elseif italian
		return \{language_prefix = 'IT'}
	elseif spanish
		return \{language_prefix = 'SP'}
	endif
	return \{language_prefix = 'EN'}
endscript

script training_play_sound \{volume = 0}
	if NOT gotparam \{sound}
		printf \{qs(0x2c772a7c)}
		return
	endif
	training_get_language_prefix
	formattext checksumname = sound_id '%a_%b' a = <language_prefix> b = <sound>
	playsound <sound_id> vol = <volume> buss = training_vo
	if gotparam \{wait}
		begin
		if NOT issoundplaying <sound_id>
			break
		endif
		wait \{1
			gameframe}
		repeat
	endif
endscript

script training_wait_for_sound 
	if NOT gotparam \{sound}
		printf \{qs(0xfa4e0d75)}
		return
	endif
	training_get_language_prefix
	formattext checksumname = sound_id '%a_%b' a = <language_prefix> b = <sound>
	begin
	if NOT issoundplaying <sound_id>
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script training_is_sound_playing 
	if NOT gotparam \{sound}
		printf \{qs(0x368f2a1c)}
		return
	endif
	training_get_language_prefix
	formattext checksumname = sound_id '%a_%b' a = <language_prefix> b = <sound>
	if issoundplaying <sound_id>
		return \{true}
	else
		return \{false}
	endif
endscript

script training_play_positive \{who = god}
	if (<who> = god)
		RandomNoRepeat (
			@ training_play_sound \{sound = 'Tutorial_God_Positive_01'}
			@ training_play_sound \{sound = 'Tutorial_God_Positive_02'}
			@ training_play_sound \{sound = 'Tutorial_God_Positive_03'}
			@ training_play_sound \{sound = 'Tutorial_God_Positive_05'}
			@ training_play_sound \{sound = 'Tutorial_God_Positive_06'}
			@ training_play_sound \{sound = 'Tutorial_God_Positive_07'}
			)
	elseif (<who> = guitarist)
		RandomNoRepeat (
			@ training_play_sound \{sound = 'Tut_Gtr_Positive_01_GTR'}
			@ training_play_sound \{sound = 'Tut_Gtr_Positive_02_GTR'}
			@ training_play_sound \{sound = 'Tut_Gtr_Positive_03_GTR'}
			@ training_play_sound \{sound = 'Tut_Gtr_Positive_04_GTR'}
			@ training_play_sound \{sound = 'Tut_Gtr_Positive_05_GTR'}
			@ training_play_sound \{sound = 'Tut_Gtr_Positive_06_GTR'}
			@ training_play_sound \{sound = 'Tut_Gtr_Positive_07_GTR'}
			@ training_play_sound \{sound = 'Tut_Gtr_Positive_08_GTR'}
			)
	elseif (<who> = vocalist)
		RandomNoRepeat (
			@ training_play_sound \{sound = 'Tut_Vox_HitNotes_09_VOX'}
			@ training_play_sound \{sound = 'Tut_Vox_Words_08_VOX'}
			@ training_play_sound \{sound = 'Tut_Vox_Words_09_VOX'}
			@ training_play_sound \{sound = 'Tut_Vox_Words_10_VOX'}
			@ training_play_sound \{sound = 'Tut_Vox_Words_11_VOX'}
			@ training_play_sound \{sound = 'Tut_Vox_Freeform_09_VOX'}
			@ training_play_sound \{sound = 'Tut_Vox_Freeform_10_VOX'}
			@ training_play_sound \{sound = 'Tut_Vox_StarPower_09_VOX'}
			@ training_play_sound \{sound = 'Tut_Vox_StarPower_10_VOX'}
			)
	elseif (<who> = bassist)
		RandomNoRepeat (
			@ training_play_sound \{sound = 'Tut_Gtr_OpenNotes_06_BAS'}
			@ training_play_sound \{sound = 'Tut_Gtr_OpenNotes_07_BAS'}
			@ training_play_sound \{sound = 'Tut_Gtr_OpenNotes_08_BAS'}
			@ training_play_sound \{sound = 'Tut_Gtr_OpenNotes_09_BAS'}
			@ training_play_sound \{sound = 'Tut_Vs_Battle_03_BAS'}
			@ training_play_sound \{sound = 'Tut_RS_AdvGtr_10_BAS'}
			@ training_play_sound \{sound = 'Tut_RS_StepRec_05_BAS'}
			)
	elseif (<who> = drummer)
		RandomNoRepeat (
			@ training_play_sound \{sound = 'Tut_Dru_Positive_01_DRM'}
			@ training_play_sound \{sound = 'Tut_Dru_Positive_02_DRM'}
			@ training_play_sound \{sound = 'Tut_Dru_Positive_03_DRM'}
			@ training_play_sound \{sound = 'Tut_Dru_Positive_04_DRM'}
			@ training_play_sound \{sound = 'Tut_Dru_Positive_05_DRM'}
			@ training_play_sound \{sound = 'Tut_Dru_Positive_06_DRM'}
			@ training_play_sound \{sound = 'Tut_Dru_Positive_07_DRM'}
			@ training_play_sound \{sound = 'Tut_Dru_Positive_08_DRM'}
			)
	elseif (<who> = lou)
		RandomNoRepeat (
			@ training_play_sound \{sound = 'Tutorial_Lou_Positive_01'}
			@ training_play_sound \{sound = 'Tutorial_Lou_Positive_02'}
			@ training_play_sound \{sound = 'Tutorial_Lou_Positive_03'}
			@ training_play_sound \{sound = 'Tutorial_Lou_Positive_04'}
			@ training_play_sound \{sound = 'Tutorial_Lou_Positive_05'}
			@ training_play_sound \{sound = 'Tutorial_Lou_Positive_06'}
			@ training_play_sound \{sound = 'Tutorial_Lou_Positive_07'}
			)
	endif
endscript

script training_play_negative \{who = god}
	if (<who> = god)
		RandomNoRepeat (
			@ training_play_sound \{sound = 'Tutorial_God_Negative_01'}
			@ training_play_sound \{sound = 'Tutorial_God_Negative_02'}
			@ training_play_sound \{sound = 'Tutorial_God_Negative_03'}
			@ training_play_sound \{sound = 'Tutorial_God_Negative_04'}
			@ training_play_sound \{sound = 'Tutorial_God_Negative_05'}
			@ training_play_sound \{sound = 'Tutorial_God_Negative_06'}
			)
	elseif (<who> = lou)
		RandomNoRepeat (
			@ training_play_sound \{sound = 'Tutorial_Lou_Negative_01'}
			@ training_play_sound \{sound = 'Tutorial_Lou_Negative_02'}
			)
	endif
endscript

script safe_show \{time = 0.0}
	if screenelementexists id = <id>
		<id> :se_setprops alpha = 1 time = <time>
	endif
endscript

script safe_hide \{time = 0.0}
	if screenelementexists id = <id>
		<id> :se_setprops alpha = 0 time = <time>
	endif
endscript

script safe_destroy 
	if screenelementexists id = <id>
		destroyscreenelement id = <id>
	endif
endscript

script training_display_notes_hit \{notes_required = 8}
	if (<notes_hit> < <notes_required>)
		formattext textname = hit_text qs(0xe4739e40) h = (<notes_required> - <notes_hit>)
	else
		<hit_text> = qs(0x6e9e36e2)
	endif
	lessonheader :se_setprops {
		task_notes_remaining_text = <hit_text>
	}
endscript

script training_start_gem_scroller \{players = 1
		bot_array = [
			0
			1
			0
			0
		]
		difficulty = easy}
	printf 'training_start_gem_scroller %d' d = <players>
	tutorial_setup_band <...>
	vocals_distribute_mics
	tutorial_enable_botplay <...>
	setplayerinfo 1 controller = ($primary_controller)
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	disable_pause
	change \{tutorial_okay_to_create_pause_handler = 0}
	change \{current_transition = fastintrotutorial}
	killspawnedscript \{name = training_set_health}
	spawnscriptnow \{training_set_health
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
	wait \{1
		gameframe}
	repeat
	create_training_pause_handler
	change \{structurename = player1_status
		current_health = 1.0}
	change \{structurename = player2_status
		current_health = 1.0}
	change \{structurename = player1_status
		star_power_amount = 0.0}
	change \{structurename = player1_status
		star_power_used = 0}
	change \{structurename = player1_status
		current_num_powerups = 0}
	change \{current_crowd = 1.0}
	change \{training_song_over = 0}
	change \{notes_hit = 0}
	change \{notes_missed = 0}
	change \{disable_note_input = 1}
endscript

script training_setup_camera \{name = ch_view_cam}
	playigccam {
		id = cs_view_cam_id
		name = <name>
		viewport = bg_viewport
		lockto = world
		pos = (-0.068807, 1.5990009, 5.7975965)
		quat = (0.000506, 0.99942994, -0.017537998)
		fov = 72.0
		play_hold = 1
		interrupt_current
	}
endscript

script training_destroy_gem_scroller \{delay = 0.5}
	stoprendering
	pausegame
	if (<delay> > 0)
		wait <delay> seconds ignoreslomo
	endif
	killcamanim \{name = ch_view_cam}
	kill_gem_scroller \{training_mode = 1
		no_render = 1}
	change \{check_for_unplugged_controllers = 1}
	destroy_bg_viewport
	setup_bg_viewport
	training_setup_camera
	unpausegh3sounds
	unpausegame
	startrendering
endscript

script training_pause_gem_scroller 
	songsetmastervolume \{vol = -100
		time = 0.2}
	wait \{0.25
		seconds}
	setslomo \{0.0}
	setslomo_song \{slomo = 0.0}
endscript

script training_resume_gem_scroller 
	songsetmastervolume \{vol = 0
		time = 0.2}
	wait \{0.25
		seconds
		ignoreslomo}
	setslomo \{1.0}
	setslomo_song \{slomo = 1.0}
	change \{disable_note_input = 0}
	if gotparam \{enable_mic}
		change \{vocal_tut_mute = 0}
		vocals_mute_all_mics \{mute = false}
	endif
	if gotparam \{enable_star_power}
		change \{vocal_tut_no_star_power = 0}
	endif
endscript

script training_set_health \{player_status = player1_status}
	inc = 0.03
	begin
	if gotparam \{band}
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
	if gotparam \{band}
		change structurename = band1_status current_health = <new_health>
	else
		change structurename = <player_status> current_health = <new_health>
		if NOT gotparam \{ignore_band_members}
			if ($current_num_players = 4)
				change structurename = player2_status current_health = <new_health>
				change structurename = player3_status current_health = <new_health>
				change structurename = player4_status current_health = <new_health>
			endif
		endif
	endif
	wait \{1
		gameframe}
	repeat
endscript

script training_show_title 
	if screenelementexists \{id = tutorial_title}
		destroyscreenelement \{id = tutorial_title}
	endif
	createscreenelement \{parent = training_container
		id = tutorial_title
		type = descinterface
		desc = 'tutorial_title'}
	tutorial_title :se_setprops {
		tutorial_title_container_alpha = 0
		tutorial_title_text_text = <title>
	}
	tutorial_title :se_setprops \{tutorial_title_container_alpha = 1
		time = 0.75}
	tutorial_title :se_waitprops
endscript

script training_destroy_title 
	if screenelementexists \{id = tutorial_title}
		tutorial_title :se_setprops \{tutorial_title_container_alpha = 0
			time = 0.75}
		tutorial_title :se_waitprops
		if gotparam \{ignoreslomo}
			wait \{0.75
				seconds
				ignoreslomo}
		else
			wait \{0.75
				seconds}
		endif
		destroyscreenelement \{id = tutorial_title}
	endif
endscript

script training_wait_for_gem_scroller_time 
	begin
	getsongtime
	if (<songtime> >= <time>)
		return
	endif
	wait \{1
		gameframe}
	repeat
endscript

script training_create_quit_warning_popup 
	if NOT screenelementexists \{id = popup_warning_container}
		create_popup_warning_menu \{title = qs(0xaa163738)
			textblock = {
				text = qs(0x41d4743f)
			}
			no_background
			options = [
				{
					func = tutorial_quit_warning_resume
					text = qs(0xf7723015)
				}
				{
					func = tutorial_quit_warning_choose
					text = qs(0x67d9c56d)
				}
			]}
		if screenelementexists \{id = menu_tutorial}
			launchevent \{type = unfocus
				target = menu_tutorial}
		endif
	endif
endscript

script training_create_restart_warning_popup 
	if NOT screenelementexists \{id = popup_warning_container}
		create_popup_warning_menu \{title = qs(0xaa163738)
			textblock = {
				text = qs(0x09ce2827)
			}
			no_background
			options = [
				{
					func = tutorial_restart_warning_resume
					text = qs(0xf7723015)
				}
				{
					func = tutorial_restart_warning_choose
					text = qs(0xb8790f2f)
				}
			]}
		if screenelementexists \{id = menu_tutorial}
			launchevent \{type = unfocus
				target = menu_tutorial}
		endif
	endif
endscript

script training_create_skip_warning_popup 
	if NOT screenelementexists \{id = popup_warning_container}
		create_popup_warning_menu \{title = qs(0xaa163738)
			textblock = {
				text = qs(0x90b2a648)
			}
			no_background
			options = [
				{
					func = tutorial_skip_warning_resume
					text = qs(0xf7723015)
				}
				{
					func = tutorial_skip_warning_choose
					text = qs(0x784c64ff)
				}
			]}
		if screenelementexists \{id = menu_tutorial}
			launchevent \{type = unfocus
				target = menu_tutorial}
		endif
	endif
endscript

script tutorial_quit_warning_resume 
	tutorial_close_quit_warning_screen
	training_create_pause_menu \{uselasttitle}
endscript

script tutorial_quit_warning_choose 
	tutorial_close_quit_warning_screen
	tutorial_quit
endscript

script tutorial_restart_warning_resume 
	tutorial_close_restart_warning_screen
	training_create_pause_menu \{uselasttitle}
endscript

script tutorial_restart_warning_choose 
	tutorial_close_restart_warning_screen
	tutorial_restart
endscript

script tutorial_skip_warning_resume 
	tutorial_close_quit_warning_screen
	training_create_pause_menu \{uselasttitle}
endscript

script tutorial_skip_warning_choose 
	tutorial_close_quit_warning_screen
	tutorial_skip_lesson
endscript

script tutorial_close_quit_warning_screen 
	if screenelementexists \{id = popup_warning_container}
		launchevent \{type = unfocus
			target = pu_warning_vmenu}
	else
		return
	endif
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = focus
			target = menu_tutorial}
	endif
	destroy_popup_warning_menu
endscript

script tutorial_close_restart_warning_screen 
	tutorial_close_quit_warning_screen
endscript

script rotate_highlight_sparkle_glow \{time = 3}
	printf \{qs(0x34133ac6)}
	<rot1> = 360
	<rot2> = 180
	<alpha1> = 0.6
	<alpha2> = 0.4
	if <id> :desc_resolvealias name = alias_highlight_sparkle_glow
		assignalias id = <resolved_id> alias = highlight_sparkle_glow
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
	wait <time> seconds ignoreslomo
	repeat
endscript

script training_set_score \{score = 10000
		player_status = player1_status}
	change structurename = <player_status> score = <score>
	spawnscriptlater update_score_fast params = {<...>} id = training_spawned_script
	wait \{1
		frames
		ignoreslomo}
	killspawnedscript \{name = update_score_fast}
endscript

script training_start_hud_flashing_red 
	setslomo \{1.0}
	setslomo_song \{slomo = 1.0}
	killspawnedscript \{name = training_set_health}
	spawnscriptnow \{training_set_health
		params = {
			health = 0.0
		}
		id = training_spawned_script}
	change \{current_crowd = 0.0}
	if ($current_num_players = 1)
	else
		band_failing_vingette_on
	endif
endscript

script training_stop_hud_flashing_red \{reset_crowd = 1
		pause_highway = 1}
	if ($current_num_players = 1)
		getplayerinfo \{1
			part}
		if (<part> = vocals)
			vocalshighway_getid \{player = 1}
			if screenelementexists id = <vocals_highway_id>
				<vocals_highway_id> :se_setprops bg_alpha = 0
			endif
		endif
	else
		band_failing_vingette_off
	endif
	if (<reset_crowd>)
		change \{current_crowd = 1.0}
	endif
	if (<pause_highway>)
		setslomo \{0.0}
		setslomo_song \{slomo = 0.0}
	endif
endscript

script training_generic_lesson_complete 
	printf \{qs(0x170bb208)}
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	wait \{0.75
		seconds
		ignoreslomo}
	training_hide_lesson_header
	training_resume_gem_scroller
	training_destroy_gem_scroller
	soundevent \{event = tutorial_mode_finish_chord}
	spawnscriptnow \{create_exploding_text
		id = training_spawned_script
		params = {
			parent = 'lesson_complete'
			text = qs(0xd50843f0)
			text_physics = 0
		}}
	change \{check_for_unplugged_controllers = 1}
	wait \{7
		seconds
		ignoreslomo}
	killspawnedscript \{name = create_exploding_text}
	destroy_exploding_text \{parent = 'lesson_complete'}
	change g_training_lessons_completed = ($g_training_lessons_completed + 1)
endscript
