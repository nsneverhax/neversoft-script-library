training_font = text_a4
training_text_scale = 0.6
training_header_color = [
	110
	190
	190
	255
]
training_text_color = [
	165
	165
	165
	255
]
training_rect_color = [
	0
	0
	0
	80
]
training_arrow_life = 5
training_arrow_movement_distance = 30
training_arrow_movement_speed = 2.75
training_last_lesson = 1

script training_create_and_hide_headers 
	training_create_lesson_and_task_headers
	training_hide_lesson_and_task_headers
endscript

script training_create_lesson_and_task_headers 
	if screenelementexists \{id = training_container}
		return
	endif
	z = 5
	createscreenelement \{type = containerelement
		id = training_container
		parent = root_window
		pos = (0.0, 0.0)}
	lesson_header_rect_pos = (350.0, 55.0)
	createscreenelement {
		type = spriteelement
		parent = training_container
		id = lesson_header_rect
		just = [left top]
		pos = <lesson_header_rect_pos>
		dims = (320.0, 200.0)
		rgba = ($training_rect_color)
		z_priority = (<z> - 0.1)
	}
	scale = ($training_text_scale)
	createscreenelement {
		type = textelement
		parent = training_container
		id = lesson_header_text
		just = [left top]
		pos = (<lesson_header_rect_pos> + (10.0, 10.0))
		font = ($training_font)
		text = 'LESSON 0: DEFAULT'
		scale = <scale>
		rgba = ($training_header_color)
		z_priority = <z>
	}
	getscreenelementdims \{id = lesson_header_rect}
	scale_mult = (1.0 / <scale>)
	dims = ((1.0, 0.0) * <scale_mult> * <width> + (0.0, 1.0) * <scale_mult> * <height> + (-10.0, -10.0))
	createscreenelement {
		type = textblockelement
		font = ($training_font)
		parent = training_container
		id = lesson_header_body
		just = [left top]
		internal_just = [left top]
		pos = (<lesson_header_rect_pos> + (10.0, 40.0))
		dims = <dims>
		text = '1. Don\'t suck you bastard\\n2. I mean it!!!'
		scale = <scale>
		rgba = ($training_text_color)
		z_priority = <z>
	}
	getscreenelementdims \{id = lesson_header_body}
	task_header_rect_pos = (1050.0, 55.0)
	createscreenelement {
		type = spriteelement
		parent = training_container
		id = task_header_rect
		just = [right top]
		pos = <task_header_rect_pos>
		dims = (250.0, 200.0)
		rgba = ($training_rect_color)
		z_priority = (<z> - 0.1)
	}
	getscreenelementdims \{id = task_header_rect}
	scale_mult = (1.0 / <scale>)
	dims = ((1.0, 0.0) * <scale_mult> * <width> + (0.0, 1.0) * <scale_mult> * <height> + (-10.0, -10.0))
	createscreenelement {
		type = textelement
		parent = training_container
		id = task_header_text
		just = [left top]
		pos = (<task_header_rect_pos> - (1.0, 0.0) * <width> + (10.0, 10.0))
		font = ($training_font)
		text = 'TASK: '
		scale = <scale>
		rgba = ($training_header_color)
		z_priority = <z>
	}
	createscreenelement {
		type = textblockelement
		font = ($training_font)
		parent = training_container
		id = task_header_body
		just = [left top]
		internal_just = [left top]
		pos = (<task_header_rect_pos> - (1.0, 0.0) * <width> + (10.0, 40.0))
		dims = <dims>
		text = ' '
		scale = <scale>
		rgba = ($training_text_color)
		z_priority = <z>
	}
	getscreenelementdims \{id = lesson_header_body}
	createscreenelement {
		type = spriteelement
		parent = training_container
		id = temp_vo_sub_rect
		just = [center top]
		pos = (640.0, 460.0)
		dims = (600.0, 175.0)
		rgba = ($training_rect_color)
	}
	getscreenelementdims id = <id>
	text_block_pos = ((640.0, 460.0) - (1.0, 0.0) * 0.5 * <width> + (10.0, 10.0))
	dims = ((1.0, 0.0) * <scale_mult> * <width> + (0.0, 1.0) * <scale_mult> * <height> + (-10.0, -10.0))
	createscreenelement {
		type = textblockelement
		parent = training_container
		id = temp_vo_sub_body
		just = [left top]
		internal_just = [left top]
		pos = <text_block_pos>
		dims = <dims>
		font = ($training_font)
		text = 'Temporary voice over substitute.'
		scale = <scale>
		rgba = ($training_text_color)
	}
endscript

script training_destroy_lesson_and_task_headers 
	destroy_menu \{menu_id = training_container}
endscript

script training_hide_lesson_and_task_headers 
	training_hide_lesson_header
	training_hide_task_header
endscript

script training_show_lesson_and_task_headers 
	training_show_lesson_header
	training_show_task_header
endscript

script training_hide_lesson_header 
	doscreenelementmorph \{id = lesson_header_rect
		alpha = 0}
	doscreenelementmorph \{id = lesson_header_text
		alpha = 0}
	doscreenelementmorph \{id = lesson_header_body
		alpha = 0}
endscript

script training_show_lesson_header 
	doscreenelementmorph \{id = lesson_header_rect
		alpha = 1}
	doscreenelementmorph \{id = lesson_header_text
		alpha = 1}
	doscreenelementmorph \{id = lesson_header_body
		alpha = 1}
endscript

script training_hide_task_header 
	doscreenelementmorph \{id = task_header_rect
		alpha = 0}
	doscreenelementmorph \{id = task_header_text
		alpha = 0}
	doscreenelementmorph \{id = task_header_body
		alpha = 0}
endscript

script training_show_task_header 
	doscreenelementmorph \{id = task_header_rect
		alpha = 1}
	doscreenelementmorph \{id = task_header_text
		alpha = 1}
	doscreenelementmorph \{id = task_header_body
		alpha = 1}
endscript

script training_set_lesson_header_text \{text = ''}
	setscreenelementprops id = lesson_header_text text = <text>
endscript

script training_set_lesson_header_body \{text = ''}
	setscreenelementprops id = lesson_header_body text = <text>
endscript

script training_set_task_header_body \{text = ''}
	setscreenelementprops id = task_header_body text = <text>
endscript

script training_hide_vo_sub 
	doscreenelementmorph \{id = temp_vo_sub_rect
		alpha = 0}
	doscreenelementmorph \{id = temp_vo_sub_body
		alpha = 0}
endscript

script training_show_vo_sub 
	doscreenelementmorph \{id = temp_vo_sub_rect
		alpha = 1}
	doscreenelementmorph \{id = temp_vo_sub_body
		alpha = 1}
endscript

script training_add_arrow \{pos = (640.0, 360.0)
		rot = 0
		z = 5
		scale = 1.0}
	if NOT gotparam \{life}
		life = ($training_arrow_life)
	endif
	setsearchallassetcontexts
	createscreenelement {
		parent = training_container
		type = spriteelement
		just = [center bottom]
		texture = training_arrow_blue
		pos = <pos>
		rot_angle = <rot>
		dims = ((128.0, 256.0) * <scale>)
		rgba = [255 255 255 255]
		z_priority = <z>
	}
	arrow_id = <id>
	setsearchallassetcontexts \{off}
	<arrow_id> :settags phase = 0.0
	<arrow_id> :settags phase_change = 1
	cos <rot>
	sin <rot>
	<arrow_id> :settags phase_direction = ((1.0, 0.0) * <sin> + (0.0, -1.0) * <cos>)
	<arrow_id> :settags alive = 0.0
	<arrow_id> :settags initial_pos = <pos>
	spawnscriptnow training_make_pointer_point_now params = {id = <arrow_id> life = <life>} id = training_spawned_script
endscript

script training_make_pointer_point_now 
	if NOT gotparam \{id}
		scriptassert \{'Need id!'}
	endif
	begin
	getdeltatime \{ignore_slomo}
	<id> :gettags
	arrow_age = (<alive> + <delta_time>)
	if (<arrow_age> > <life>)
		break
	endif
	<phase> = (<phase> + <delta_time> * <phase_change> * ($training_arrow_movement_speed))
	if (<phase> > 1)
		<phase> = 1
		<phase_change> = -1
	elseif (<phase> < 0)
		<phase> = 0
		<phase_change> = 1
	endif
	new_pos = (<initial_pos> + <phase_direction> * ($training_arrow_movement_distance) * <phase>)
	setscreenelementprops id = <id> pos = (<new_pos>)
	<id> :settags alive = (<arrow_age>)
	<id> :settags phase = (<phase>)
	<id> :settags phase_change = (<phase_change>)
	waitonegameframe
	repeat
	destroyscreenelement id = <id>
endscript

script set_vo_sub_text 
	setscreenelementprops id = temp_vo_sub_body text = <text>
endscript

script training_init_session 
	change \{game_mode = tutorial}
	menu_music_off \{setflag = 1}
	destroy_bg_viewport
	setup_bg_viewport
	destroy_crowd_models
	getpakmancurrentname \{map = zones}
	if gotparam \{pakname}
		if NOT (<pakname> = 'z_soundcheck')
			resetwaypoints
			setpakmancurrentblock \{map = zones
				pak = z_soundcheck
				block_scripts = 1}
		endif
	else
		resetwaypoints
		setpakmancurrentblock \{map = zones
			pak = z_soundcheck
			block_scripts = 1}
	endif
	safekill \{nodename = z_soundcheck_gfx_trg_lh_hotspot_p2}
	unpausegame
	training_create_and_hide_headers
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
	hide_band
endscript

script training_kill_session 
	pausegame
	killcamanim \{name = ch_view_cam}
	destroy_bg_viewport
	training_destroy_lesson_and_task_headers
	if NOT gotparam \{shutdown}
		spawnscriptnow \{menu_music_on
			params = {
				setflag = 1
			}}
	endif
	change \{disable_note_input = 0}
	change \{tutorial_disable_hud = 0}
	unpausespawnedscript \{training_script_update}
endscript

script training_are_notes_flipped 
	getglobaltags \{user_options
		params = {
			lefty_flip_p1
		}}
	if (<lefty_flip_p1> = 1)
		return \{true}
	endif
	return \{false}
endscript

script show_training_pause_screen 
	if gameispaused
		return
	endif
	pausegame
	pausegh3sounds
	training_create_pause_backdrop <...>
endscript

script create_training_pause_handler 
	event_handlers = [{pad_start show_training_pause_screen}]
	new_menu {
		scrollid = menu_tutorial
		vmenuid = vmenu_tutorial
		menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
	}
endscript
tutorial_okay_to_create_pause_handler = 1

script enable_tutorial_pause 
	change \{tutorial_okay_to_create_pause_handler = 1}
endscript
training_pause_z = 100
training_prev_paused_title = none

script training_create_pause_backdrop 
	if NOT screenelementexists \{id = training_backdrop_container}
		change \{tutorial_pause_current_item = 1}
		create_pause_menu_frame \{z = $training_pause_z}
		createscreenelement \{type = containerelement
			parent = root_window
			id = training_backdrop_container
			pos = (0.0, 0.0)
			just = [
				left
				top
			]}
		displaysprite parent = training_backdrop_container tex = dialog_title_bg flip_v pos = (416.0, 100.0) scale = (1.75, 1.75) z = ($training_pause_z + 10)
		displaysprite parent = training_backdrop_container tex = dialog_title_bg pos = (640.0, 100.0) scale = (1.75, 1.75) z = ($training_pause_z + 10)
		if gotparam \{uselasttitle}
			if ($training_prev_paused_title = failed)
				title = 'SONG FAILED'
			else
				title = 'PAUSED'
			endif
		else
			if gotparam \{songfailed}
				title = 'SONG FAILED'
				training_prev_paused_title = failed
			else
				title = 'PAUSED'
				training_prev_paused_title = paused
			endif
		endif
		createscreenelement {
			type = textelement
			parent = training_backdrop_container
			id = lesson_song_failed_text
			font = ($training_font)
			text = <title>
			just = [center center]
			pos = {(640.0, 200.0) relative}
			rgba = [223 223 223 255]
			scale = 1.3
			z_priority = ($training_pause_z + 12)
			shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [0 0 0 255]
		}
		getscreenelementdims id = <id>
		fit_text_in_rectangle id = <id> dims = (<height> * (0.0, 1.0) + (300.0, 0.0)) only_if_larger_x = 1 start_x_scale = 1.2 start_y_scale = 1.2
		createscreenelement {
			type = textelement
			parent = training_backdrop_container
			id = lesson_continue_text
			just = [center center]
			pos = (640.0, 330.0)
			font = ($training_font)
			text = 'CONTINUE'
			scale = 1.1333001
			rgba = ($training_text_color)
			z_priority = ($training_pause_z + 2)
		}
		createscreenelement {
			type = textelement
			parent = training_backdrop_container
			id = lesson_restart_text
			just = [center center]
			pos = (640.0, 385.0)
			font = ($training_font)
			text = 'RESTART'
			scale = 1.1333001
			rgba = ($training_text_color)
			z_priority = ($training_pause_z + 2)
		}
		createscreenelement {
			type = textelement
			parent = training_backdrop_container
			id = lesson_quit_text
			just = [center center]
			pos = (640.0, 440.0)
			font = ($training_font)
			text = 'QUIT'
			scale = 1.1333001
			rgba = ($training_text_color)
			z_priority = ($training_pause_z + 2)
		}
		if screenelementexists \{id = menu_tutorial}
			launchevent \{type = unfocus
				target = menu_tutorial}
		endif
		event_handlers = [
			{pad_up tutorial_pause_selection_up}
			{pad_down tutorial_pause_selection_down}
			{pad_start tutorial_resume}
			{pad_choose tutorial_pause_choose}
			{pad_back tutorial_resume}
		]
		new_menu {
			scrollid = menu_tutorial_pause
			vmenuid = vmenu_tutorial_pause
			menu_pos = (120.0, 190.0)
			use_backdrop = 0
			event_handlers = <event_handlers>
		}
		if screenelementexists \{id = menu_tutorial}
			launchevent \{type = unfocus
				target = menu_tutorial}
		endif
		launchevent \{type = focus
			target = menu_tutorial_pause}
		change \{tutorial_pause_current_item = 1}
		tutorial_pause_set_highlight selection = ($tutorial_pause_current_item)
	endif
endscript
tutorial_pause_current_item = 1

script tutorial_pause_selection_up 
	change tutorial_pause_current_item = ($tutorial_pause_current_item - 1)
	if ($tutorial_pause_current_item <= 0)
		change \{tutorial_pause_current_item = 3}
	endif
	generic_menu_up_or_down_sound \{up}
	tutorial_pause_set_highlight selection = ($tutorial_pause_current_item)
endscript

script tutorial_pause_selection_down 
	change tutorial_pause_current_item = ($tutorial_pause_current_item + 1)
	if ($tutorial_pause_current_item > 3)
		change \{tutorial_pause_current_item = 1}
	endif
	generic_menu_up_or_down_sound \{down}
	tutorial_pause_set_highlight selection = ($tutorial_pause_current_item)
endscript

script tutorial_pause_set_highlight 
	setscreenelementprops id = lesson_continue_text rgba = ($training_text_color)
	setscreenelementprops id = lesson_restart_text rgba = ($training_text_color)
	setscreenelementprops id = lesson_quit_text rgba = ($training_text_color)
	switch (<selection>)
		case 1
		setscreenelementprops \{id = lesson_continue_text
			rgba = [
				232
				232
				232
				232
			]}
		case 2
		setscreenelementprops \{id = lesson_restart_text
			rgba = [
				232
				232
				232
				232
			]}
		case 3
		setscreenelementprops \{id = lesson_quit_text
			rgba = [
				232
				232
				232
				232
			]}
	endswitch
endscript

script tutorial_pause_choose 
	switch ($tutorial_pause_current_item)
		case 1
		tutorial_resume
		case 2
		tutorial_restart
		case 3
		tutorial_quit_warning
	endswitch
endscript

script tutorial_resume 
	tutorial_close_pause_window
endscript

script tutorial_restart 
	tutorial_close_pause_window
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	training_destroy_gem_scroller \{delay = 0.0}
	training_kill_session
	kill_training_script_system
	stopallsounds
	unpausegame
	unpausegh3sounds
	setslomo \{1.0}
	setslomo_song \{slomo = 1.0}
	enable_pause
	generic_menu_pad_choose_sound
	run_training_script \{restart_lesson}
endscript

script tutorial_shutdown 
	tutorial_close_pause_window
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	training_destroy_gem_scroller \{delay = 0.0}
	training_kill_session \{shutdown}
	kill_training_script_system
	stopallsounds
	change \{disable_note_input = 0}
	change \{tutorial_disable_hud = 0}
	setslomo \{1.0}
	setslomo_song \{slomo = 1.0}
endscript

script tutorial_quit 
	tutorial_shutdown
	generic_menu_pad_choose_sound
	unpausegame
	unpausegh3sounds
	enable_pause
	setscreenelementprops \{id = root_window
		event_handlers = [
			{
				pad_start
				gh3_start_pressed
			}
		]
		replace_handlers}
	ui_flow_manager_respond_to_action \{action = quit_tutorial}
endscript

script tutorial_quit_warning 
	tutorial_close_pause_window
	pausegame
	pausegh3sounds
	training_create_quit_warning_backdrop
endscript

script training_destroy_pause_backdrop 
	safe_destroy \{id = training_backdrop_container}
	safe_destroy \{id = ts_controller}
endscript

script tutorial_close_pause_window 
	if screenelementexists \{id = menu_tutorial_pause}
		launchevent \{type = unfocus
			target = menu_tutorial_pause}
	else
		return
	endif
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = focus
			target = menu_tutorial}
	endif
	training_destroy_pause_backdrop
	destroy_pause_menu_frame
	destroy_menu \{menu_id = menu_tutorial_pause}
	unpausegame
	unpausegh3sounds
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

script training_play_sound 
	if NOT gotparam \{sound}

		return
	endif
	training_get_language_prefix
	formattext checksumname = sound_id '%a_%b' a = <language_prefix> b = <sound>
	playsound <sound_id> buss = training_vo
	if gotparam \{wait}
		begin
		if NOT issoundplaying <sound_id>
			break
		endif
		waitonegameframe
		repeat
	endif
endscript

script training_wait_for_sound 
	if NOT gotparam \{sound}

		return
	endif
	training_get_language_prefix
	formattext checksumname = sound_id '%a_%b' a = <language_prefix> b = <sound>
	begin
	if NOT issoundplaying <sound_id>
		break
	endif
	waitonegameframe
	repeat
endscript

script training_is_sound_playing 
	if NOT gotparam \{sound}

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

script safe_show 
	if screenelementexists id = <id>
		doscreenelementmorph id = <id> alpha = 1
	endif
endscript

script safe_hide 
	if screenelementexists id = <id>
		doscreenelementmorph id = <id> alpha = 0
	endif
endscript

script safe_destroy 
	if screenelementexists id = <id>
		destroyscreenelement id = <id>
	endif
endscript

script training_display_notes_hit 
	formattext textname = hit_text 'Notes Hit %a / 8' a = <notes_hit>
	if screenelementexists \{id = notes_hit_text}
		destroyscreenelement \{id = notes_hit_text}
	endif
	createscreenelement {
		type = textelement
		parent = training_container
		id = notes_hit_text
		just = [center center]
		pos = (920.0, 225.0)
		font = ($training_font)
		text = <hit_text>
		scale = 0.7
		rgba = ($training_text_color)
		z_priority = 50
	}
endscript

script training_start_gem_scroller 
	if NOT compositeobjectexists \{name = guitarist}
		change \{structurename = player1_status
			character_id = axel}
		create_guitarist
	endif
	if NOT compositeobjectexists \{name = bassist}
		change \{structurename = player2_status
			character_id = axel}
		create_guitarist \{name = bassist}
	endif
	hide_band
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	disable_pause
	change \{tutorial_okay_to_create_pause_handler = 0}
	change \{current_transition = fastintro}
	start_gem_scroller song_name = <song> difficulty = easy difficulty2 = easy starttime = 0 device_num = ($player1_status.controller) training_mode = 1 <...>
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

script training_pause_gem_scroller 
	setslomo \{0.0}
	setslomo_song \{slomo = 0.0}
endscript

script training_resume_gem_scroller 
	setslomo \{1.0}
	setslomo_song \{slomo = 1.0}
	change \{disable_note_input = 0}
endscript

script training_show_title 
	createscreenelement {
		type = textelement
		parent = training_container
		id = lesson_title_text
		just = [center center]
		pos = (640.0, 350.0)
		font = ($training_font)
		text = <title>
		scale = 1.333
		rgba = ($training_text_color)
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
endscript

script training_destroy_title 
	safe_destroy \{id = lesson_title_text}
endscript

script training_wait_for_gem_scroller_time 
	begin
	getsongtime
	if (<songtime> >= <time>)
		return
	endif
	waitonegameframe
	repeat
endscript

script training_create_quit_warning_backdrop 
	if NOT screenelementexists \{id = training_backdrop_container}
		change \{tutorial_verify_quit_current_item = 1}
		create_pause_menu_frame \{z = $training_pause_z}
		createscreenelement \{type = containerelement
			parent = root_window
			id = training_backdrop_container
			pos = (0.0, 0.0)
			just = [
				left
				top
			]}
		displaysprite parent = training_backdrop_container tex = dialog_title_bg flip_v pos = (416.0, 100.0) scale = (1.75, 1.75) z = ($training_pause_z + 10)
		displaysprite parent = training_backdrop_container tex = dialog_title_bg pos = (640.0, 100.0) scale = (1.75, 1.75) z = ($training_pause_z + 10)
		displaysprite parent = training_backdrop_container tex = dialog_frame_joiner pos = (490.0, 515.0) rot_angle = 5 scale = (1.575, 1.5) z = ($training_pause_z + 13)
		displaysprite parent = training_backdrop_container tex = dialog_frame_joiner pos = (740.0, 520.0) flip_v rot_angle = -5 scale = (1.575, 1.5) z = ($training_pause_z + 13)
		title = 'WARNING'
		createscreenelement {
			type = textelement
			parent = training_backdrop_container
			id = lesson_song_failed_text
			font = ($training_font)
			text = <title>
			just = [center center]
			pos = {(640.0, 200.0) relative}
			rgba = [223 223 223 255]
			scale = 1.5
			z_priority = ($training_pause_z + 12)
			shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [0 0 0 255]
		}
		textblock = {
			text = 'You will lose all unsaved progress if you quit. Are you sure you want to quit this song?'
			dims = (500.0, 400.0)
			scale = 0.85
		}
		createscreenelement {
			type = textblockelement
			font = ($popup_warning_menu_font)
			just = [center center]
			pos = (640.0, 375.0)
			dims = (700.0, 400.0)
			scale = 0.6
			parent = training_backdrop_container
			rgba = [210 130 0 250]
			shadow
			shadow_offs = (5.0, 5.0)
			shadow_rgba = [0 0 0 255]
			z_priority = ($training_pause_z + 2)
			<textblock>
		}
		<menu_pos> = (640.0, 510.0)
		<menu_bg_offset> = (0.0, -28.0)
		createscreenelement {
			type = vmenu
			parent = training_backdrop_container
			id = options_bg_id
			pos = (<menu_pos> + <menu_bg_offset>)
			just = [center top]
			internal_just = [center center]
		}
		displaysprite parent = options_bg_id tex = dialog_bg dims = (300.0, 60.0) z = ($training_pause_z + 12)
		displaysprite parent = options_bg_id tex = dialog_bg dims = (300.0, 60.0) flip_h z = ($training_pause_z + 12)
		createscreenelement {
			type = textelement
			font = ($popup_warning_menu_font)
			parent = training_backdrop_container
			text = 'CANCEL'
			id = tutorial_quit_warning_cancel
			pos = (<menu_pos> + (0.0, 5.0))
			scale = 1.2
			rgba = [0 0 0 255]
			font_spacing = 0
			just = [center center]
			z_priority = ($training_pause_z + 13)
		}
		createscreenelement {
			type = textelement
			font = ($popup_warning_menu_font)
			parent = training_backdrop_container
			text = 'QUIT'
			id = tutorial_quit_warning_quit
			scale = 1.2
			pos = (<menu_pos> + (0.0, 52.0))
			rgba = [0 0 0 255]
			font_spacing = 0
			just = [center center]
			z_priority = ($training_pause_z + 13)
		}
		if screenelementexists \{id = menu_tutorial}
			launchevent \{type = unfocus
				target = menu_tutorial}
		endif
		event_handlers = [
			{pad_up tutorial_quit_warning_selection_up}
			{pad_down tutorial_quit_warning_selection_down}
			{pad_start tutorial_quit_warning_resume}
			{pad_choose tutorial_quit_warning_choose}
			{pad_back tutorial_quit_warning_resume}
		]
		new_menu {
			scrollid = menu_tutorial_pause
			vmenuid = vmenu_tutorial_pause
			menu_pos = (120.0, 190.0)
			use_backdrop = 0
			event_handlers = <event_handlers>
		}
		if screenelementexists \{id = menu_tutorial}
			launchevent \{type = unfocus
				target = menu_tutorial}
		endif
		launchevent \{type = focus
			target = menu_tutorial_pause}
		change \{tutorial_pause_current_item = 1}
		tutorial_quit_warning_set_highlight selection = ($tutorial_pause_current_item)
	endif
endscript

script tutorial_quit_warning_set_highlight 
	menu_focus_color = [180 50 50 255]
	menu_unfocus_color = [0 0 0 255]
	if ($tutorial_verify_quit_current_item = 1)
		doscreenelementmorph id = tutorial_quit_warning_cancel rgba = <menu_focus_color>
		doscreenelementmorph id = tutorial_quit_warning_quit rgba = <menu_unfocus_color>
	else
		doscreenelementmorph id = tutorial_quit_warning_cancel rgba = <menu_unfocus_color>
		doscreenelementmorph id = tutorial_quit_warning_quit rgba = <menu_focus_color>
	endif
endscript
tutorial_verify_quit_current_item = 1

script tutorial_quit_warning_selection_up 
	change tutorial_verify_quit_current_item = ($tutorial_verify_quit_current_item - 1)
	if ($tutorial_verify_quit_current_item <= 0)
		change \{tutorial_verify_quit_current_item = 2}
	endif
	generic_menu_up_or_down_sound \{up}
	tutorial_quit_warning_set_highlight selection = ($tutorial_verify_quit_current_item)
endscript

script tutorial_quit_warning_selection_down 
	change tutorial_verify_quit_current_item = ($tutorial_verify_quit_current_item + 1)
	if ($tutorial_verify_quit_current_item > 2)
		change \{tutorial_verify_quit_current_item = 1}
	endif
	generic_menu_up_or_down_sound \{down}
	tutorial_quit_warning_set_highlight selection = ($tutorial_verify_quit_current_item)
endscript

script tutorial_quit_warning_resume 
	tutorial_close_quit_warning_screen
	training_create_pause_backdrop \{uselasttitle}
endscript

script tutorial_quit_warning_choose 
	tutorial_close_quit_warning_screen
	if ($tutorial_verify_quit_current_item = 1)
		training_create_pause_backdrop \{uselasttitle}
	else
		tutorial_quit
	endif
endscript

script tutorial_close_quit_warning_screen 
	if screenelementexists \{id = menu_tutorial_pause}
		launchevent \{type = unfocus
			target = menu_tutorial_pause}
	else
		return
	endif
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = focus
			target = menu_tutorial}
	endif
	training_destroy_pause_backdrop
	destroy_pause_menu_frame
	destroy_menu \{menu_id = menu_tutorial_pause}
endscript
