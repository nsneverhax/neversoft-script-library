training_battle_tutorial_script = [
	{
		call = training_battle_tutorial_startup
	}
	{
		time = 100
		call = training_3_show_title
	}
	{
		call = training_3_1_start_gem_scroller
	}
	{
		rel_time = 3300
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
		call = training_3_3_start_gem_scroller
	}
	{
		rel_time = 3300
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
		call = training_3_4_start_gem_scroller
	}
	{
		rel_time = 3300
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
endscript

script training_3_show_title 
	disable_pause
	createscreenelement {
		type = textelement
		parent = training_container
		id = lesson_title_text
		just = [center center]
		pos = (640.0, 350.0)
		font = fontgrid_title_gh3
		text = "Guitar Hero Battle Tutorial"
		scale = 1.0
		rgba = ($training_text_color)
	}
	training_play_sound \{sound = 0x11a45b93
		wait}
	destroyscreenelement \{id = lesson_title_text}
endscript

script training_3_1_start_gem_scroller 
	destroy_band
	change \{game_mode = tutorial}
	change \{boss_battle = 1}
	change \{structurename = player1_status
		current_health = 1.0}
	start_gem_scroller song_name = tutorial_3a difficulty = easy difficulty2 = easy starttime = 0 device_num = ($player1_status.controller) training_mode = 1 disable_hud
	killspawnedscript \{name = update_score_fast}
	disable_pause
	change \{notes_hit = 0}
	change \{training_song_over = 0}
	change \{structurename = player1_status
		current_num_powerups = 0}
endscript

script training_3_1_show_lesson 
	setslomo 0.0
	setslomo_song slomo = 0.0
	training_set_lesson_header_text text = "LESSON 1: ACQUIRING POWERUPS"
	training_set_lesson_header_body text = "1. Complete a Star Power sequence to recieve a battle mode powerup"
	training_show_lesson_header
	training_play_sound sound = 0x27b52a33 wait
	training_set_task_header_body text = "Hit star sequence to continue"
	training_show_task_header
	wait 2 seconds ignoreslomo
	setslomo 1.0
	setslomo_song slomo = 1.0
endscript

script training_3_1_wait_for_star_power 
	if screenelementexists id = menu_tutorial
		launchevent type = unfocus target = menu_tutorial
		destroy_menu menu_id = menu_tutorial
	endif
	event_handlers = [
		{song_wonp1 training_song_won}
		{pad_start 0x6ac774c7}
	]
	new_menu {
		scrollid = menu_tutorial
		vmenuid = vmenu_tutorial
		menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
	}
	change training_received_star_power = 0
	begin
	if ($training_song_over = 1)
		return
	endif
	current_num_powerups = ($player1_status.current_num_powerups)
	if (<current_num_powerups> > 0)
		break
	endif
	wait 1 gameframe
	repeat
	wait 1.0 seconds ignoreslomo
endscript

script training_3_1_show_complete_message 
	safe_destroy id = notes_hit_text
	training_hide_lesson_header
	training_hide_task_header
	createscreenelement {
		type = textelement
		parent = training_container
		id = tuning_complete_text
		just = [center center]
		pos = (640.0, 200.0)
		font = ($training_font)
		text = "Lesson Complete"
		scale = 1.0
		rgba = ($training_text_color)
	}
	wait 2 seconds ignoreslomo
	safe_destroy id = tuning_complete_text
endscript

script training_3_2_show_lesson 
	enableinput off controller = ($player1_status.controller)
	setslomo 0.0
	setslomo_song slomo = 0.0
	training_set_lesson_header_text text = "LESSON 2: USING POWERUPS"
	training_set_lesson_header_body text = ""
	training_show_lesson_header
	training_hide_task_header
	change structurename = player1_status last_selected_attack = -1
	training_play_sound sound = 0xcfdfe2c3 wait
	training_set_task_header_body text = "Tilt guitar upward to unleash attack"
	training_show_task_header
	wait 2 seconds ignoreslomo
	setslomo 1.0
	setslomo_song slomo = 1.0
	enableinput controller = ($player1_status.controller)
endscript

script training_3_2_wait_for_attack 
	begin
	printf channel = training "shake %a ........" a = ($player2_status.shake_notes)
	if ($player2_status.shake_notes != -1)
		break
	endif
	wait \{1
		gameframe}
	repeat
	wait \{1.5
		seconds
		ignoreslomo}
endscript

script training_3_2_show_complete_message 
	if screenelementexists id = menu_tutorial
		destroy_menu menu_id = menu_tutorial
	endif
	create_training_pause_handler
	safe_destroy id = notes_hit_text
	training_hide_lesson_header
	training_hide_task_header
	pausegame
	pausegh3sounds
	wait 0.5 seconds ignoreslomo
	killcamanim name = ch_view_cam
	kill_gem_scroller
	destroy_bg_viewport
	setup_bg_viewport
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
	unpausegh3sounds
	unpausegame
	createscreenelement {
		type = textelement
		parent = training_container
		id = tuning_complete_text
		just = [center center]
		pos = (640.0, 200.0)
		font = ($training_font)
		text = "Lesson Complete"
		scale = 1.0
		rgba = ($training_text_color)
	}
	wait 2 seconds ignoreslomo
	safe_destroy id = tuning_complete_text
endscript

script training_3_3_start_gem_scroller 
	destroy_band
	change \{game_mode = tutorial}
	change \{boss_battle = 1}
	change \{structurename = player1_status
		current_health = 1.0}
	start_gem_scroller song_name = tutorial_3c difficulty = easy difficulty2 = easy starttime = 0 device_num = ($player1_status.controller) training_mode = 1 disable_hud
	killspawnedscript \{name = update_score_fast}
	disable_pause
	change \{notes_hit = 0}
	change \{training_song_over = 0}
	change \{structurename = player1_status
		current_num_powerups = 0}
endscript

script training_3_3_show_lesson 
	change structurename = player1_status current_num_powerups = 0
	bossbattle_ready battle_gem = 5 player_status = player2_status
	wait 1.0 seconds ignoreslomo
	setslomo 0.0
	setslomo_song slomo = 0.0
	training_set_lesson_header_text text = "LESSON 3: DIFFERENT ATTACKS"
	training_set_lesson_header_body text = ""
	training_show_lesson_header
	training_hide_task_header
	training_play_sound sound = 0x65902d4e wait
	training_set_task_header_body text = "Quickly tap the button of the broken string"
	training_show_task_header
	wait 1 seconds ignoreslomo
	setslomo 1.0
	setslomo_song slomo = 1.0
	wait 1 seconds ignoreslomo
	bossbattle_trigger_on player_status = player2_status
	wait 1 seconds ignoreslomo
endscript

script training_3_3_wait_for_attack 
	begin
	if ($player1_status.broken_string_mask = 0)
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script training_3_3_show_complete_message 
	if screenelementexists id = menu_tutorial
		destroy_menu menu_id = menu_tutorial
	endif
	create_training_pause_handler
	safe_destroy id = notes_hit_text
	training_hide_lesson_header
	training_hide_task_header
	pausegame
	pausegh3sounds
	stopallsounds
	wait 0.5 seconds ignoreslomo
	killcamanim name = ch_view_cam
	kill_gem_scroller
	destroy_bg_viewport
	setup_bg_viewport
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
	unpausegh3sounds
	unpausegame
	createscreenelement {
		type = textelement
		parent = training_container
		id = tuning_complete_text
		just = [center center]
		pos = (640.0, 200.0)
		font = ($training_font)
		text = "Different Attacks Lesson Complete"
		scale = 1.0
		rgba = ($training_text_color)
	}
	wait 2.0 seconds ignoreslomo
	safe_destroy id = tuning_complete_text
endscript

script training_3_4_start_gem_scroller 
	destroy_band
	change \{game_mode = tutorial}
	change \{boss_battle = 1}
	change \{structurename = player1_status
		current_health = 1.0}
	start_gem_scroller song_name = tutorial_3d difficulty = easy difficulty2 = easy starttime = 0 device_num = ($player1_status.controller) training_mode = 1 disable_hud
	killspawnedscript \{name = update_score_fast}
	disable_pause
	change \{notes_hit = 0}
	change \{training_song_over = 0}
	change \{structurename = player1_status
		current_num_powerups = 0}
endscript

script training_3_4_show_lesson 
	setslomo 0.0
	setslomo_song slomo = 0.0
	training_set_lesson_header_text text = "LESSON 4: MULTIPLE ATTACKS"
	training_set_lesson_header_body text = ""
	training_show_lesson_header
	training_hide_task_header
	change structurename = player1_status last_selected_attack = -1
	training_play_sound sound = 0x09b0eb44 wait
	training_set_task_header_body text = "Use both attacks to damage opponent"
	training_show_task_header
	change structurename = player1_status current_num_powerups = 0
	bossbattle_ready battle_gem = 0 player_status = player1_status
	bossbattle_ready battle_gem = 0 player_status = player1_status
	wait 2 seconds ignoreslomo
	setslomo 1.0
	setslomo_song slomo = 1.0
endscript

script training_3_4_wait_for_attack 
	old_num_attacks = ($player1_status.current_num_powerups)
	begin
	num_attacks = ($player1_status.current_num_powerups)
	if (<num_attacks> < <old_num_attacks>)
		break
	endif
	if (<num_attacks> > <old_num_attacks>)
		old_num_attacks = <num_attacks>
	endif
	wait \{1
		gameframe}
	repeat
	wait \{1
		seconds
		ignoreslomo}
endscript

script training_3_4_show_complete_message 
	if screenelementexists id = menu_tutorial
		destroy_menu menu_id = menu_tutorial
	endif
	create_training_pause_handler
	safe_destroy id = notes_hit_text
	training_hide_lesson_header
	training_hide_task_header
	pausegame
	pausegh3sounds
	stopallsounds
	wait 0.5 seconds ignoreslomo
	killcamanim name = ch_view_cam
	kill_gem_scroller
	destroy_bg_viewport
	setup_bg_viewport
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
	unpausegh3sounds
	unpausegame
	createscreenelement {
		type = textelement
		parent = training_container
		id = tuning_complete_text
		just = [center center]
		pos = (640.0, 200.0)
		font = ($training_font)
		text = "Guitar Battle Tutorial Complete"
		scale = 1.0
		rgba = ($training_text_color)
	}
	wait 0.5 seconds ignoreslomo
	training_play_sound sound = 0xbdfec5b3 wait
	safe_destroy id = tuning_complete_text
endscript

script training_basic_tutorial_3_end 
	training_kill_session
	if screenelementexists \{id = training_container}
		destroyscreenelement \{id = training_container}
	endif
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	enable_pause
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
			advanced_techniques_lesson = unlocked
		}}
	ui_flow_manager_respond_to_action \{action = complete_tutorial}
endscript
