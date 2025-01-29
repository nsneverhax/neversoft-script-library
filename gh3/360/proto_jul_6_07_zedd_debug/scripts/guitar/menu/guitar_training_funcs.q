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

script training_create_and_hide_headers 
	training_create_lesson_and_task_headers
	training_hide_lesson_and_task_headers
endscript

script training_create_lesson_and_task_headers 
	if screenelementexists id = training_container
		return
	endif
	z = 5
	createscreenelement {
		type = containerelement
		id = training_container
		parent = root_window
		pos = (0.0, 0.0)
	}
	lesson_header_rect_pos = (230.0, 55.0)
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
		text = "LESSON 0: DEFAULT"
		scale = <scale>
		rgba = ($training_header_color)
		z_priority = <z>
	}
	getscreenelementdims id = lesson_header_rect
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
		text = "1. Don't suck you bastard\\n2. I mean it!!!"
		scale = <scale>
		rgba = ($training_text_color)
		z_priority = <z>
	}
	getscreenelementdims id = lesson_header_body
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
	getscreenelementdims id = task_header_rect
	scale_mult = (1.0 / <scale>)
	dims = ((1.0, 0.0) * <scale_mult> * <width> + (0.0, 1.0) * <scale_mult> * <height> + (-10.0, -10.0))
	createscreenelement {
		type = textelement
		parent = training_container
		id = task_header_text
		just = [left top]
		pos = (<task_header_rect_pos> - (1.0, 0.0) * <width> + (10.0, 10.0))
		font = ($training_font)
		text = "TASK: "
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
		text = " "
		scale = <scale>
		rgba = ($training_text_color)
		z_priority = <z>
	}
	getscreenelementdims id = lesson_header_body
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
		text = "Temporary voice over substitute."
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

script training_set_lesson_header_text \{text = ""}
	setscreenelementprops id = lesson_header_text text = <text>
endscript

script training_set_lesson_header_body \{text = ""}
	setscreenelementprops id = lesson_header_body text = <text>
endscript

script training_set_task_header_body \{text = ""}
	setscreenelementprops id = task_header_body text = <text>
endscript

script training_hide_vo_sub 
	doscreenelementmorph \{id = temp_vo_sub_rect
		alpha = 0}
	doscreenelementmorph \{id = temp_vo_sub_body
		alpha = 0}
	temp_vo_sub_rect
endscript

script training_show_vo_sub 
	doscreenelementmorph \{id = temp_vo_sub_rect
		alpha = 1}
	doscreenelementmorph \{id = temp_vo_sub_body
		alpha = 1}
endscript

script training_add_arrow pos = (640.0, 360.0) rot = 0 z = 5 scale = 1.0
	if NOT gotparam life
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
		scale = <scale>
		rgba = [255 255 255 255]
		z_priority = <z>
	}
	arrow_id = <id>
	setsearchallassetcontexts off
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
	if NOT gotparam id
		scriptassert "Need id!"
	endif
	begin
	getdeltatime ignore_slomo
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
	wait 1 gameframe
	repeat
	destroyscreenelement id = <id>
endscript

script set_vo_sub_text 
	setscreenelementprops id = temp_vo_sub_body text = <text>
endscript

script training_init_session 
	change game_mode = tutorial
	menu_music_off
	destroy_bg_viewport
	setup_bg_viewport
	getpakmancurrentname map = zones
	if gotparam pakname
		if NOT (<pakname> = "z_soundcheck")
			resetwaypoints
			setpakmancurrentblock map = zones pak = z_soundcheck block_scripts = 1
		endif
	else
		resetwaypoints
		setpakmancurrentblock map = zones pak = z_soundcheck block_scripts = 1
	endif
	unpausegame
	training_create_and_hide_headers
	training_hide_vo_sub
	playigccam {
		id = cs_view_cam_id
		name = ch_view_cam
		viewport = bg_viewport
		lockto = world
		pos = (-0.068807, 1.5990009, 5.7975965)
		quat = (0.000506, 0.99942994, -0.017537998)
		fov = 72.0
		play_hold = 1
		interrupt_current
	}
	hide_band
endscript

script training_kill_session 
	pausegame
	killcamanim \{name = ch_view_cam}
	destroy_bg_viewport
	training_destroy_lesson_and_task_headers
	if NOT gotparam \{shutdown}
		spawnscriptnow \{menu_music_on}
	endif
	unpausespawnedscript \{training_script_update}
endscript

script 0x6ac774c7 
	if gameispaused
		return
	endif
	pausegame
	pausegh3sounds
	training_create_pause_backdrop
endscript

script create_training_pause_handler 
	event_handlers = [{pad_start 0x6ac774c7}]
	new_menu {
		scrollid = menu_tutorial
		vmenuid = vmenu_tutorial
		menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
	}
endscript

script training_create_pause_backdrop 
	if NOT screenelementexists id = training_backdrop_container
		change tutorial_pause_current_item = 1
		create_pause_menu_frame z = 10
		createscreenelement {
			type = containerelement
			parent = root_window
			id = training_backdrop_container
			pos = (0.0, 0.0)
			just = [left top]
		}
		createscreenelement {
			type = textelement
			parent = training_backdrop_container
			id = lesson_continue_text
			just = [center center]
			pos = (640.0, 290.0)
			font = fontgrid_title_gh3
			text = "Continue"
			scale = 1.0
			rgba = ($training_text_color)
			z_priority = 15
		}
		createscreenelement {
			type = textelement
			parent = training_backdrop_container
			id = lesson_restart_text
			just = [center center]
			pos = (640.0, 365.0)
			font = fontgrid_title_gh3
			text = "Restart"
			scale = 1.0
			rgba = ($training_text_color)
			z_priority = 15
		}
		createscreenelement {
			type = textelement
			parent = training_backdrop_container
			id = lesson_quit_text
			just = [center center]
			pos = (640.0, 440.0)
			font = fontgrid_title_gh3
			text = "Quit"
			scale = 1.0
			rgba = ($training_text_color)
			z_priority = 15
		}
		if screenelementexists id = menu_tutorial
			launchevent type = unfocus target = menu_tutorial
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
		if screenelementexists id = menu_tutorial
			launchevent type = unfocus target = menu_tutorial
		endif
		launchevent type = focus target = menu_tutorial_pause
		change tutorial_pause_current_item = 1
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
		setscreenelementprops id = lesson_continue_text rgba = [232 232 232 232]
		case 2
		setscreenelementprops id = lesson_restart_text rgba = [232 232 232 232]
		case 3
		setscreenelementprops id = lesson_quit_text rgba = [232 232 232 232]
	endswitch
endscript

script tutorial_pause_choose 
	switch ($tutorial_pause_current_item)
		case 1
		tutorial_resume
		case 2
		tutorial_restart
		case 3
		tutorial_quit
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
	run_training_script
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

script training_play_sound 
	if NOT gotparam \{sound}
		printf \{"training_play_sound called without sound param"}
		return
	endif
	playsound <sound>
	if gotparam \{wait}
		begin
		if NOT issoundplaying <sound>
			break
		endif
		wait \{1
			gameframe}
		repeat
	endif
endscript

script training_wait_for_sound 
	begin
	if NOT issoundplaying <sound>
		break
	endif
	wait \{1
		gameframe}
	repeat
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
