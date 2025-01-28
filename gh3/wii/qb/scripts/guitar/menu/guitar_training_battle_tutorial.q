training_battle_tutorial_script = [
	{
		call = training_battle_tutorial_startup
	}
	{
		time = 100
		call = training_3_show_title
	}
	{
		lesson = 1
		call = training_3_1_start_gem_scroller
	}
	{
		call = training_3_1_show_lesson
	}
	{
		call = training_3_1_wait_for_star_power
	}
	{
		call = training_3_2_show_lesson
	}
	{
		call = training_3_2_wait_for_attack
	}
	{
		call = training_3_2_show_complete_message
	}
	{
		lesson = 3
		call = training_3_3_start_gem_scroller
	}
	{
		call = training_3_3_show_lesson
	}
	{
		call = training_3_3_wait_for_attack
	}
	{
		call = training_3_3_wait_for_attack
	}
	{
		call = training_3_3_show_complete_message
	}
	{
		lesson = 4
		call = training_3_4_start_gem_scroller
	}
	{
		call = training_3_4_show_lesson
	}
	{
		call = training_3_4_wait_for_attack
	}
	{
		call = training_3_4_wait_for_attack
	}
	{
		call = training_3_4_show_complete_message
	}
	{
		call = training_basic_tutorial_3_end
	}
]

script training_battle_tutorial_startup 
	training_init_session
	launchevent \{type = unfocus
		target = root_window}
	create_training_pause_handler
	change \{structurename = player2_status
		character_id = axel}
	create_guitarist \{name = bassist}
	bassist :hide
	training_create_narrator_icons
endscript

script training_3_show_title 
	training_create_narrator_icons
	training_show_title \{title = 'Guitar Hero Battle Tutorial'}
	0xc1c4e84c \{mode = 0xd246b8bd
		0xd607e2e6 = 1}
	safe_show \{id = god_icon}
	wait \{2
		gameframes}
	training_play_sound \{sound = 'Tutorial_3_Intro_01_God'
		wait}
	training_destroy_title
endscript

script training_3_1_start_gem_scroller 
	destroy_band
	change \{game_mode = tutorial}
	change \{boss_battle = 1}
	change \{tutorial_disable_hud = 1}
	training_start_gem_scroller \{song = tutorial_3a
		no_score_update}
	killspawnedscript \{name = update_score_fast}
	training_wait_for_gem_scroller_startup
endscript

script training_3_1_show_lesson 
	wait \{1
		seconds
		ignoreslomo}
	training_pause_gem_scroller
	training_set_lesson_header_text \{text = 'LESSON 1: ACQUIRING POWERUPS'}
	training_set_lesson_header_body \{text = '1. Complete a Battle Power sequence to receive a Guitar Battle power-up'}
	training_show_lesson_header
	safe_show \{id = god_icon}
	training_play_sound \{sound = 'Tutorial_3A_01_God'
		wait}
	training_set_task_header_body \{text = 'Hit star sequence to continue'}
	training_show_task_header
	wait \{2
		seconds
		ignoreslomo}
	training_resume_gem_scroller
endscript

script training_3_1_wait_for_star_power 
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{song_wonp1 training_song_won}
		{song_wonp2 training_song_won}
		{pad_start show_training_pause_screen}
	]
	new_menu {
		scrollid = menu_tutorial
		vmenuid = vmenu_tutorial
		menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
	}
	change \{training_received_star_power = 0}
	begin
	if ($training_song_over = 1)
		return
	endif
	current_num_powerups = ($player1_status.current_num_powerups)
	if (<current_num_powerups> > 0)
		break
	endif
	waitonegameframe
	repeat
	enableinput off controller = ($player1_status.controller)
	change \{structurename = player1_status
		star_power_usable = 0}
	wait \{1.0
		seconds
		ignoreslomo}
endscript

script training_3_1_show_complete_message 
	soundevent \{event = tutorial_mode_finish_chord}
	safe_destroy \{id = notes_hit_text}
	training_hide_lesson_header
	training_hide_task_header
	createscreenelement {
		type = textelement
		parent = training_container
		id = tuning_complete_text
		just = [center center]
		pos = (640.0, 350.0)
		font = ($training_font)
		text = 'Lesson Complete'
		scale = 1.0
		rgba = ($training_text_color)
	}
	wait \{2
		seconds
		ignoreslomo}
	safe_destroy \{id = tuning_complete_text}
endscript

script training_3_2_show_lesson 
	enableinput off controller = ($player1_status.controller)
	training_pause_gem_scroller
	if ($player1_status.current_num_powerups = 0)
		bossbattle_ready \{battle_gem = 0
			player_status = player1_status}
	endif
	enableinput off controller = ($player1_status.controller)
	change \{structurename = player1_status
		star_power_usable = 0}
	training_set_lesson_header_text \{text = 'LESSON 2: USING POWERUPS'}
	training_set_lesson_header_body \{text = ''}
	training_show_lesson_header
	training_hide_task_header
	safe_hide \{id = god_icon}
	safe_show \{id = lou_icon}
	change \{structurename = player1_status
		last_selected_attack = -1}
	training_play_sound \{sound = 'Tutorial_3B_01_Lou'}
	wait \{25.5
		seconds
		ignoreslomo}
	createscreenelement \{parent = training_container
		type = spriteelement
		id = guitar_sprite
		just = [
			center
			center
		]
		texture = training_guitar_small
		pos = (400.0, 400.0)
		rot_angle = 45
		rgba = [
			255
			255
			255
			255
		]
		scale = (1.6, 1.6)
		z_priority = 50}
	wait \{2.5
		seconds
		ignoreslomo}
	doscreenelementmorph \{id = guitar_sprite
		rot_angle = 0
		time = 1.0}
	wait \{3.5
		seconds
		ignoreslomo}
	safe_hide \{id = guitar_sprite}
	doscreenelementmorph \{id = guitar_sprite
		rot_angle = 45
		time = 0.0}
	training_wait_for_sound \{sound = 'Tutorial_3B_01_Lou'}
	training_set_task_header_body \{text = 'Tilt guitar upward to unleash attack'}
	training_show_task_header
	wait \{2
		seconds
		ignoreslomo}
	training_resume_gem_scroller
	enableinput controller = ($player1_status.controller)
	change \{structurename = player1_status
		star_power_usable = 1}
endscript

script training_3_2_wait_for_attack 
	begin
	if ($training_song_over = 1)
		return
	endif
	if ($player2_status.shake_notes != -1)
		break
	endif
	waitonegameframe
	repeat
	wait \{1.5
		seconds
		ignoreslomo}
endscript

script training_3_2_show_complete_message 
	soundevent \{event = tutorial_mode_finish_chord}
	if screenelementexists \{id = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	create_training_pause_handler
	safe_destroy \{id = notes_hit_text}
	training_hide_lesson_header
	training_hide_task_header
	pausegame
	pausegh3sounds
	wait \{0.5
		seconds
		ignoreslomo}
	killcamanim \{name = ch_view_cam}
	kill_gem_scroller
	destroy_bg_viewport
	setup_bg_viewport
	playigccam \{id = cs_view_cam_id
		name = ch_view_cam
		viewport = bg_viewport
		lockto = world
		pos = (-0.068807, 1.5990009, 5.7975965)
		quat = (0.000506, 0.99942994, -0.017537998)
		fov = 72.0
		play_hold = 1
		interrupt_current}
	unpausegh3sounds
	unpausegame
	createscreenelement {
		type = textelement
		parent = training_container
		id = tuning_complete_text
		just = [center center]
		pos = (640.0, 350.0)
		font = ($training_font)
		text = 'Lesson Complete'
		scale = 1.0
		rgba = ($training_text_color)
	}
	wait \{2
		seconds
		ignoreslomo}
	safe_hide \{id = lou_icon}
	safe_destroy \{id = tuning_complete_text}
endscript

script training_3_3_start_gem_scroller 
	destroy_band
	change \{game_mode = tutorial}
	change \{boss_battle = 1}
	change \{tutorial_disable_hud = 1}
	training_start_gem_scroller \{song = tutorial_3c
		disable_hud
		no_score_update}
	killspawnedscript \{name = update_score_fast}
	training_wait_for_gem_scroller_startup
endscript

script training_3_3_show_lesson 
	wait \{1
		seconds
		ignoreslomo}
	change \{structurename = player1_status
		current_num_powerups = 0}
	bossbattle_ready \{battle_gem = 5
		player_status = player2_status}
	wait \{1.0
		seconds
		ignoreslomo}
	training_pause_gem_scroller
	0xc1c4e84c \{mode = 0x3c48d991
		0xd607e2e6 = 1}
	training_set_lesson_header_text \{text = 'LESSON 3: DIFFERENT ATTACKS'}
	training_set_lesson_header_body \{text = ''}
	training_show_lesson_header
	training_hide_task_header
	safe_show \{id = god_icon}
	training_play_sound \{sound = 'Tutorial_3C_01_God'
		wait}
	training_set_task_header_body \{text = 'Quickly tap the button of the broken string'}
	training_show_task_header
	wait \{1
		seconds
		ignoreslomo}
	training_resume_gem_scroller
	wait \{1
		seconds
		ignoreslomo}
	bossbattle_trigger_on \{player_status = player2_status}
	wait \{1
		seconds
		ignoreslomo}
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{song_wonp1 training_song_won}
		{song_wonp2 training_song_won}
		{pad_start show_training_pause_screen}
	]
	new_menu {
		scrollid = menu_tutorial
		vmenuid = vmenu_tutorial
		menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
	}
endscript

script training_3_3_wait_for_attack 
	begin
	if ($training_song_over = 1)
		return
	endif
	if ($player1_status.broken_string_mask = 0)
		break
	endif
	waitonegameframe
	repeat
endscript

script training_3_3_show_complete_message 
	if screenelementexists \{id = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	create_training_pause_handler
	wait \{0.75
		seconds
		ignoreslomo}
	soundevent \{event = tutorial_mode_finish_chord_03}
	safe_destroy \{id = notes_hit_text}
	training_hide_lesson_header
	training_hide_task_header
	pausegame
	pausegh3sounds
	stopallsounds
	wait \{0.5
		seconds
		ignoreslomo}
	killcamanim \{name = ch_view_cam}
	kill_gem_scroller
	destroy_bg_viewport
	setup_bg_viewport
	playigccam \{id = cs_view_cam_id
		name = ch_view_cam
		viewport = bg_viewport
		lockto = world
		pos = (-0.068807, 1.5990009, 5.7975965)
		quat = (0.000506, 0.99942994, -0.017537998)
		fov = 72.0
		play_hold = 1
		interrupt_current}
	unpausegh3sounds
	unpausegame
	createscreenelement {
		type = textelement
		parent = training_container
		id = tuning_complete_text
		just = [center center]
		pos = (640.0, 350.0)
		font = ($training_font)
		text = 'Lesson Complete'
		scale = 1.0
		rgba = ($training_text_color)
	}
	wait \{2.0
		seconds
		ignoreslomo}
	safe_hide \{id = god_icon}
	safe_destroy \{id = tuning_complete_text}
endscript

script training_3_4_start_gem_scroller 
	destroy_band
	change \{game_mode = tutorial}
	change \{boss_battle = 1}
	change \{tutorial_disable_hud = 1}
	training_start_gem_scroller \{song = tutorial_3d
		disable_hud
		no_score_update}
	killspawnedscript \{name = update_score_fast}
	training_wait_for_gem_scroller_startup
endscript

script training_3_4_show_lesson 
	wait \{1
		seconds
		ignoreslomo}
	training_pause_gem_scroller
	0xc1c4e84c \{mode = 0xa22c4c32
		0xd607e2e6 = 1}
	training_set_lesson_header_text \{text = 'LESSON 4: MULTIPLE ATTACKS'}
	training_set_lesson_header_body \{text = ''}
	training_show_lesson_header
	training_hide_task_header
	safe_show \{id = lou_icon}
	change \{structurename = player1_status
		last_selected_attack = -1}
	training_play_sound \{sound = 'Tutorial_3D_01_Lou'
		wait}
	training_set_task_header_body \{text = 'Use both attacks to damage opponent'}
	training_show_task_header
	change \{structurename = player1_status
		current_num_powerups = 0}
	bossbattle_ready \{battle_gem = 0
		player_status = player1_status}
	bossbattle_ready \{battle_gem = 2
		player_status = player1_status}
	enableinput off controller = ($player1_status.controller)
	change \{structurename = player1_status
		star_power_usable = 0}
	wait \{2
		seconds
		ignoreslomo}
	training_resume_gem_scroller
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{song_wonp1 training_song_won}
		{song_wonp2 training_song_won}
		{pad_start show_training_pause_screen}
	]
	new_menu {
		scrollid = menu_tutorial
		vmenuid = vmenu_tutorial
		menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
	}
	enableinput controller = ($player1_status.controller)
	change \{structurename = player1_status
		star_power_usable = 1}
endscript

script training_3_4_wait_for_attack 
	old_num_attacks = ($player1_status.current_num_powerups)
	begin
	if ($training_song_over = 1)
		return
	endif
	num_attacks = ($player1_status.current_num_powerups)
	if (<num_attacks> < <old_num_attacks>)
		break
	endif
	if (<num_attacks> > <old_num_attacks>)
		old_num_attacks = <num_attacks>
	endif
	waitonegameframe
	repeat
endscript

script training_3_4_show_complete_message 
	if screenelementexists \{id = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	create_training_pause_handler
	wait \{0.75
		seconds
		ignoreslomo}
	soundevent \{event = tutorial_mode_finish_chord_03}
	safe_destroy \{id = notes_hit_text}
	training_hide_lesson_header
	training_hide_task_header
	pausegame
	pausegh3sounds
	stopallsounds
	wait \{0.5
		seconds
		ignoreslomo}
	killcamanim \{name = ch_view_cam}
	kill_gem_scroller
	destroy_bg_viewport
	setup_bg_viewport
	playigccam \{id = cs_view_cam_id
		name = ch_view_cam
		viewport = bg_viewport
		lockto = world
		pos = (-0.068807, 1.5990009, 5.7975965)
		quat = (0.000506, 0.99942994, -0.017537998)
		fov = 72.0
		play_hold = 1
		interrupt_current}
	unpausegh3sounds
	unpausegame
	createscreenelement {
		type = textelement
		parent = training_container
		id = tuning_complete_text
		just = [center center]
		pos = (640.0, 350.0)
		font = ($training_font)
		text = 'Guitar Battle Tutorial Complete'
		scale = 1.0
		rgba = ($training_text_color)
	}
	wait \{0.5
		seconds
		ignoreslomo}
	training_play_sound \{sound = 'Tutorial_3_outro'
		wait}
	safe_hide \{id = lou_icon}
	safe_destroy \{id = tuning_complete_text}
endscript

script training_basic_tutorial_3_end 
	training_kill_session
	change \{tutorial_disable_hud = 0}
	if screenelementexists \{id = training_container}
		destroyscreenelement \{id = training_container}
	endif
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	training_destroy_narrator_icons
	setscreenelementprops \{id = root_window
		event_handlers = [
			{
				pad_start
				gh3_start_pressed
			}
		]
		replace_handlers}
	setglobaltags \{training
		params = {
			guitar_battle_lesson = complete
		}}
	training_check_for_all_tutorials_finished
	ui_flow_manager_respond_to_action \{action = complete_tutorial}
endscript
