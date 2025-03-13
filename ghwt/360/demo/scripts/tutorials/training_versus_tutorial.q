training_versus_tutorial_script = [
	{
		call = training_versus_tutorial_startup
	}
	{
		time = 1000
		call = training_versus_tutorial_show_title
	}
	{
		lesson = 1
		call = training_7_1_show_lesson_header
	}
	{
		call = training_7_1_show_different_gametypes
	}
	{
		call = training_7_1_complete_message
	}
	{
		lesson = 2
		call = training_7_2_show_lesson_header
	}
	{
		call = training_7_2_show_lead_indicator
	}
	{
		call = training_7_2_complete_message
	}
	{
		lesson = 3
		call = training_7_3_show_lesson_header
	}
	{
		call = training_7_3_show_battle_highways
	}
	{
		call = training_7_3_start_hit_notes_task
	}
	{
		call = training_7_3_complete_message
	}
	{
		lesson = 4
		call = training_7_4_show_lesson_header
	}
	{
		call = training_7_4_show_battle_highways
	}
	{
		call = training_7_4_start_tilt_task
	}
	{
		call = training_7_4_complete_message
	}
	{
		lesson = 5
		call = training_7_5_show_lesson_header
	}
	{
		call = training_7_5_show_battle_highways
	}
	{
		call = training_7_5_start_fix_broken_string_task
	}
	{
		call = training_7_5_complete_message
	}
	{
		lesson = 6
		call = training_7_6_show_lesson_header
	}
	{
		call = training_7_6_show_battle_highways
	}
	{
		call = training_7_6_start_multiple_attacks_task
	}
	{
		call = training_7_6_complete_message
	}
	{
		lesson = 7
		call = training_7_7_show_lesson_header
	}
	{
		call = training_7_7_explain_do_or_die
	}
	{
		call = training_7_7_complete_message
	}
	{
		call = training_versus_tutorial_end
	}
]

script training_7_generic_placeholder_alert \{text_to_show = qs(0xd1bb5beb)}
	training_show_title title = <text_to_show>
	wait \{3
		seconds
		ignoreslomo}
	training_destroy_title \{ignoreslomo}
endscript

script training_versus_tutorial_startup 
	training_init_session
	launchevent \{type = unfocus
		target = root_window}
	create_training_pause_handler
	training_create_narrator_icons
endscript

script training_versus_tutorial_show_title 
	change \{g_training_lessons_completed = 0}
	training_show_title \{title = qs(0x2a84dbaf)}
	begin
	if ($transitions_locked = 0)
		break
	endif
	wait \{1
		gameframe
		ignoreslomo}
	repeat
	create_training_pause_handler
	wait \{3
		seconds}
	training_destroy_title
endscript

script training_7_1_show_lesson_header 
	training_set_lesson_header_text \{number = qs(0x22ee76e7)
		text = qs(0x1c559b95)}
	if screenelementexists \{id = lesson_header_frame}
		lesson_header_frame :se_setprops \{alpha = 0}
	endif
endscript

script training_7_1_show_different_gametypes 
	createscreenelement \{parent = training_container
		type = spriteelement
		id = tutorial_versus_menu_sprite
		just = [
			center
			center
		]
		texture = tutorial_versus_menu
		pos = (610.0, 120.0)
		scale = (2.7, 2.7)
		z_priority = 4}
	createscreenelement \{type = containerelement
		id = versus_fake_menu_cont
		parent = training_container
		pos = (-80.0, 80.0)
		z_priority = 5}
	createscreenelement \{parent = versus_fake_menu_cont
		id = versus_fake_menu
		type = descinterface
		desc = 'fake_menu'}
	if versus_fake_menu :desc_resolvealias \{name = alias_fake_menu_vmenu}
		assignalias id = <resolved_id> alias = fake_menu_vmenu
		training_7_highlight_fake_menu_item \{index = 0}
	endif
	training_show_narrator \{narrator = 'bassist'}
	training_show_lesson_header
	training_play_sound \{sound = 'Tut_Vs_Modes_01_BAS'}
	wait \{4.75
		second}
	training_7_highlight_fake_menu_item \{index = 1}
	wait \{1
		second}
	training_7_highlight_fake_menu_item \{index = 2}
	wait \{1
		second}
	training_wait_for_sound \{sound = 'Tut_Vs_Modes_01_BAS'}
	destroyscreenelement \{id = versus_fake_menu}
	training_hide_narrator
endscript

script training_7_highlight_fake_menu_item \{index = 0}
	getscreenelementchildren \{id = fake_menu_vmenu}
	getarraysize <children>
	<i> = 0
	begin
	if (<i> = <index>)
		retail_menu_focus id = (<children> [<i>])
	else
		retail_menu_unfocus id = (<children> [<i>])
	endif
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script training_7_1_complete_message 
	safe_destroy \{id = sm_faceofftext_id}
	safe_destroy \{id = sm_profaceofftext_id}
	safe_destroy \{id = tutorial_versus_menu_sprite}
	training_generic_lesson_complete
endscript

script training_7_2_show_lesson_header 
	create_training_pause_handler
	launchevent \{type = focus
		target = menu_tutorial}
	training_set_lesson_header_text \{number = qs(0x09c32524)
		text = qs(0xa6ec9fe7)}
	if screenelementexists \{id = lesson_header_frame}
		lesson_header_frame :se_setprops \{alpha = 0}
	endif
endscript

script training_7_2_show_lead_indicator 
	training_7_2_start_gem_scrollers
	create_training_pause_handler
	launchevent \{type = focus
		target = menu_tutorial}
	change \{game_mode = tutorial}
	wait \{1
		second
		ignoreslomo}
	create_training_pause_handler
	training_pause_gem_scroller
	training_show_lesson_header
	training_show_narrator \{narrator = 'bassist'}
	training_play_sound \{sound = 'Tut_Vs_FaceOff_01_BAS'
		wait}
	wait \{0.5
		seconds
		ignoreslomo}
	training_play_sound \{sound = 'Tut_Vs_FaceOff_02_BAS'
		wait}
	wait \{0.5
		seconds
		ignoreslomo}
	training_play_sound \{sound = 'Tut_Vs_FaceOff_03_BAS'
		wait}
	wait \{0.5
		seconds
		ignoreslomo}
endscript

script training_7_2_complete_message 
	training_play_sound \{sound = 'Tut_Vs_FaceOff_04_BAS'}
	wait \{4
		seconds
		ignoreslomo}
	training_add_arrow \{id = training_arrow
		life = 4.0
		pos = (635.0, 250.0)
		scale = 0.7}
	wait \{4
		seconds
		ignoreslomo}
	training_hide_narrator
	training_generic_lesson_complete
endscript

script training_7_3_show_lesson_header 
	training_set_lesson_header_text \{number = qs(0x10d81465)
		text = qs(0x8cea541e)}
	if screenelementexists \{id = lesson_header_frame}
		lesson_header_frame :se_setprops \{alpha = 0}
	endif
endscript

script training_7_3_show_battle_highways 
	training_show_narrator \{narrator = 'bassist'}
	training_show_lesson_header
	training_play_sound \{sound = 'Tut_Vs_Battle_01_BAS'
		wait}
	training_hide_lesson_header
	training_hide_narrator
	training_7_3_start_gem_scrollers
	killspawnedscript \{name = update_score_fast}
	wait \{1
		second
		ignoreslomo}
	change \{game_mode = tutorial}
	change \{tutorial_battle = 1}
	wait \{2.5
		second
		ignoreslomo}
	create_training_pause_handler
	training_pause_gem_scroller
	training_play_sound \{sound = 'Tut_Vs_Battle_02_BAS'
		wait}
endscript

script training_7_3_start_hit_notes_task 
	training_change_header_type \{type = battle}
	training_hide_lesson_header
	if screenelementexists \{id = lesson_header_frame}
		lesson_header_frame :se_setprops \{alpha = 1}
	endif
	training_set_lesson_header_text \{number = qs(0x10d81465)
		text = qs(0x8cea541e)}
	training_add_lesson_body_text \{number = qs(0x22ee76e7)
		text = qs(0x1fcef202)}
	training_show_lesson_header
	training_set_task_header_body \{text = qs(0x7a0f407e)}
	training_show_task_header
	training_resume_gem_scroller
	training_7_wait_for_obtain_1_attack
endscript

script training_7_3_complete_message 
	training_generic_lesson_complete
endscript

script training_7_4_show_lesson_header 
	training_change_header_type \{type = battle}
	training_hide_lesson_header
	training_set_lesson_header_text \{number = qs(0x5f9982a2)
		text = qs(0x1259c350)}
	if screenelementexists \{id = lesson_header_frame}
		lesson_header_frame :se_setprops \{alpha = 1}
	endif
endscript

script training_7_4_show_battle_highways 
	training_7_4_start_gem_scrollers
endscript

script training_7_4_start_tilt_task 
	wait \{1
		second
		ignoreslomo}
	change \{game_mode = tutorial}
	change \{tutorial_battle = 1}
	wait \{2.5
		second
		ignoreslomo}
	enableinput off controller = ($player1_status.controller)
	battlemode_ready \{battle_gem = 0
		player_status = player1_status}
	change \{structurename = player1_status
		current_num_powerups = 0}
	create_training_pause_handler
	training_pause_gem_scroller
	enableinput off controller = ($player1_status.controller)
	change \{structurename = player1_status
		star_power_usable = 0}
	change \{structurename = player1_status
		last_selected_attack = -1}
	training_play_sound \{sound = 'Tut_Vs_BattleTilt_01_BAS'}
	wait \{4
		seconds
		ignoreslomo}
	training_add_arrow \{id = training_attack_indicator
		life = 3
		pos = (350.0, 220.0)
		rot = 90
		scale = 0.7
		z = 60}
	training_wait_for_sound \{sound = 'Tut_Vs_BattleTilt_01_BAS'}
	training_add_lesson_body_text \{number = qs(0x22ee76e7)
		text = qs(0x413e9e92)}
	training_show_lesson_header
	training_set_task_header_body \{text = qs(0xa45d825c)}
	training_show_task_header
	wait \{2
		seconds
		ignoreslomo}
	training_resume_gem_scroller
	enableinput controller = ($player1_status.controller)
	change \{structurename = player1_status
		star_power_usable = 1}
	change \{structurename = player1_status
		current_num_powerups = 1}
	training_7_4_wait_for_attack
endscript

script training_7_4_complete_message 
	training_play_sound \{sound = 'Tut_Vs_BattleTilt_02_BAS'
		wait}
	training_generic_lesson_complete
endscript

script training_7_5_show_lesson_header 
	training_change_header_type \{type = battle}
	training_hide_lesson_header
	training_set_lesson_header_text \{number = qs(0x4682b3e3)
		text = qs(0xa5aa5379)}
	if screenelementexists \{id = lesson_header_frame}
		lesson_header_frame :se_setprops \{alpha = 1}
	endif
endscript

script training_7_5_show_battle_highways 
	training_7_5_start_gem_scrollers
endscript

script training_7_5_start_fix_broken_string_task 
	wait \{1
		second
		ignoreslomo}
	change \{game_mode = tutorial}
	change \{tutorial_battle = 1}
	wait \{2.5
		second
		ignoreslomo}
	battlemode_ready \{battle_gem = 5
		player_status = player2_status}
	create_training_pause_handler
	training_pause_gem_scroller
	training_play_sound \{sound = 'Tut_Vs_DiffAttacks_01_BAS'}
	wait \{9
		seconds
		ignoreslomo}
	training_add_arrow \{id = training_attack_indicator
		life = 3
		pos = (925.0, 220.0)
		rot = -90
		scale = 0.7
		z = 60}
	training_wait_for_sound \{sound = 'Tut_Vs_DiffAttacks_01_BAS'}
	training_add_lesson_body_text \{number = qs(0x22ee76e7)
		text = qs(0x9271641b)}
	training_add_lesson_body_text \{number = qs(0x09c32524)
		text = qs(0x1a03876e)}
	training_add_lesson_body_text \{number = qs(0x10d81465)
		text = qs(0xeb8d2055)}
	training_show_lesson_header
	training_set_task_header_body \{text = qs(0x38b89696)}
	training_show_task_header
	training_resume_gem_scroller
	wait \{1
		seconds
		ignoreslomo}
	battle_trigger_on \{player_status = player2_status}
	training_7_5_wait_for_attack
endscript

script training_7_5_wait_for_attack 
	begin
	if ($training_song_over = 1)
		return
	endif
	if ($player1_status.broken_string_mask = 0)
		break
	endif
	wait \{1
		gameframe}
	repeat
	wait \{1
		second
		ignoreslomo}
endscript

script training_7_5_complete_message 
	training_pause_gem_scroller
	enableinput off controller = ($player1_status.controller)
	training_play_sound \{sound = 'Tut_Vs_DiffAttacks_02_BAS'
		wait}
	enableinput controller = ($player1_status.controller)
	training_generic_lesson_complete
endscript

script training_7_6_show_lesson_header 
	training_change_header_type \{type = battle}
	training_hide_lesson_header
	training_set_lesson_header_text \{number = qs(0x6dafe020)
		text = qs(0xd9c7b22a)}
	if screenelementexists \{id = lesson_header_frame}
		lesson_header_frame :se_setprops \{alpha = 1}
	endif
endscript

script training_7_6_show_battle_highways 
	training_7_6_start_gem_scrollers
endscript

script training_7_6_start_multiple_attacks_task 
	wait \{1
		second
		ignoreslomo}
	change \{game_mode = tutorial}
	change \{tutorial_battle = 1}
	wait \{2.5
		second
		ignoreslomo}
	enableinput off controller = ($player1_status.controller)
	create_training_pause_handler
	battlemode_ready \{battle_gem = 0
		player_status = player1_status}
	battlemode_ready \{battle_gem = 2
		player_status = player1_status}
	change \{structurename = player1_status
		current_num_powerups = 0}
	training_pause_gem_scroller
	enableinput off controller = ($player1_status.controller)
	change \{structurename = player1_status
		star_power_usable = 0}
	change \{structurename = player1_status
		last_selected_attack = -1}
	training_play_sound \{sound = 'Tut_Vs_Multiples_01_BAS'
		wait}
	training_add_lesson_body_text \{number = qs(0x22ee76e7)
		text = qs(0x4b38101e)}
	training_add_lesson_body_text \{number = qs(0x09c32524)
		text = qs(0xb963b325)}
	training_add_lesson_body_text \{number = qs(0x10d81465)
		text = qs(0x85081f1f)}
	training_show_lesson_header
	training_set_task_header_body \{text = qs(0xb9000698)}
	training_show_task_header
	training_resume_gem_scroller
	enableinput controller = ($player1_status.controller)
	change \{structurename = player1_status
		star_power_usable = 1}
	change \{training_star_power_active = 0}
	change \{lesson_complete = 0}
	change \{training_song_over = 0}
	change \{structurename = player1_status
		current_num_powerups = 2}
	training_7_6_wait_for_attack
	training_7_6_wait_for_attack
endscript

script training_7_6_wait_for_attack 
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
	wait \{1
		gameframe}
	repeat
endscript

script training_7_6_complete_message 
	wait \{1
		second
		ignoreslomo}
	training_hide_lesson_header
	training_destroy_gem_scroller
	training_show_narrator \{narrator = 'bassist'}
	training_play_sound \{sound = 'Tut_Vs_Multiples_02_BAS'
		wait}
	training_hide_narrator \{narrator = 'bassist'}
	training_generic_lesson_complete
endscript

script training_7_7_show_lesson_header 
	training_change_header_type \{type = standard}
	training_hide_lesson_header
	training_set_lesson_header_text \{number = qs(0x74b4d161)
		text = qs(0xe490cba0)}
	if screenelementexists \{id = lesson_header_frame}
		lesson_header_frame :se_setprops \{alpha = 0}
	endif
endscript

script training_7_7_explain_do_or_die 
	training_show_narrator \{narrator = 'bassist'}
	training_show_lesson_header
	create_training_pause_handler
	training_play_sound \{sound = 'Tut_Vs_DoOrDie_01_BAS'
		wait}
	training_play_sound \{sound = 'Tut_Vs_DoOrDie_02_BAS'
		wait}
	wait \{1
		seconds
		ignoreslomo}
	training_play_sound \{sound = 'Tut_Vs_DoOrDie_03_BAS'
		wait}
	training_hide_narrator
endscript

script training_7_7_show_powerups 
	createscreenelement \{parent = training_container
		id = tutorial_battle_header
		type = descinterface
		desc = 'tutorial_battle_attacks'}
	tutorial_battle_header :se_setprops {
		tutorial_battle_attack_cont_alpha = 0
		tutorial_battle_attack_icon_texture = ($battlemode_powerups [0].card_texture)
		tutorial_battle_attack_text_text = ($battlemode_powerups [0].name_text)
	}
	tutorial_battle_header :se_setprops \{tutorial_battle_attack_cont_alpha = 1
		time = 1.0}
	tutorial_battle_header :obj_spawnscriptlater \{rotate_highlight_sparkle_glow
		params = {
			id = tutorial_battle_header
			time = 2.5
		}}
	wait \{4
		seconds
		ignoreslomo}
	getarraysize \{$battlemode_powerups}
	<i> = 1
	begin
	tutorial_battle_header :se_setprops \{tutorial_battle_attack_icon_alpha = 0
		tutorial_battle_attack_text_alpha = 0
		time = 1.0}
	wait \{1.0
		seconds
		ignoreslomo}
	<icon> = ($battlemode_powerups [<i>].card_texture)
	<text> = ($battlemode_powerups [<i>].name_text)
	tutorial_battle_header :se_setprops {
		tutorial_battle_attack_icon_texture = <icon>
		tutorial_battle_attack_text_text = <text>
	}
	tutorial_battle_header :se_setprops \{tutorial_battle_attack_icon_alpha = 1
		tutorial_battle_attack_text_alpha = 1
		time = 1.0}
	wait \{4.0
		seconds
		ignoreslomo}
	<i> = (<i> + 1)
	repeat (<array_size> - 1)
	tutorial_battle_header :se_setprops \{tutorial_battle_attack_cont_alpha = 0
		time = 1.0}
	wait \{1.0
		seconds
		ignoreslomo}
	destroyscreenelement \{id = tutorial_battle_header}
endscript

script training_7_7_complete_message 
	training_destroy_title
	training_hide_lesson_header
	training_destroy_gem_scroller
	soundevent \{event = tutorial_mode_finish_chord}
	spawnscriptnow \{create_exploding_text
		id = training_spawned_script
		params = {
			parent = 'lesson_complete'
			text = qs(0xb7dc8c1e)
			text_physics = 0
			placement = top
		}}
	spawnscriptnow \{create_exploding_text
		id = training_spawned_script
		params = {
			parent = 'complete_text'
			text = qs(0x232d1eaf)
			text_physics = 0
			placement = bottom
		}}
	wait \{7
		seconds
		ignoreslomo}
	killspawnedscript \{name = create_exploding_text}
	destroy_all_exploding_text
	change g_training_lessons_completed = ($g_training_lessons_completed + 1)
endscript

script training_versus_tutorial_end 
	if ($g_training_lessons_completed = 7)
		setglobaltags \{training
			params = {
				versus_lesson = complete
			}}
	endif
	change \{tutorial_battle = 0}
	training_kill_session
	tutorial_disable_botplay
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
	training_check_for_all_tutorials_finished
	decide_tutorial_back_destination
endscript

script training_7_2_start_gem_scrollers 
	change \{game_mode = p2_faceoff}
	training_start_gem_scroller \{players = 2
		bot_array = [
			0
			1
			0
			0
		]
		song = tut_demo
		no_score_update
		disable_hud}
	killspawnedscript \{name = update_score_fast}
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	training_wait_for_gem_scroller_startup
endscript

script training_7_3_start_gem_scrollers 
	change \{game_mode = p2_battle}
	training_start_gem_scroller \{players = 2
		bot_array = [
			0
			1
			0
			0
		]
		song = tut_vs_battpow
		no_score_update
		disable_hud}
	player_text = 'p1'
	player_status = player1_status
	player = 1
	change \{structurename = player1_status
		current_health = 1.0}
	spawnscriptlater update_score_fast params = {<...>} id = training_spawned_script
	player_text = 'p2'
	player_status = player2_status
	player = 2
	change \{structurename = player2_status
		current_health = 1.0}
	spawnscriptlater update_score_fast params = {<...>} id = training_spawned_script
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
	training_wait_for_gem_scroller_startup
endscript

script training_7_4_start_gem_scrollers 
	change \{game_mode = p2_battle}
	training_start_gem_scroller \{players = 2
		bot_array = [
			0
			1
			0
			0
		]
		song = tut_vs_tilt
		no_score_update
		disable_hud}
	killspawnedscript \{name = update_score_fast}
	player_text = 'p1'
	player_status = player1_status
	player = 1
	change \{structurename = player1_status
		current_health = 1.0}
	spawnscriptlater update_score_fast params = {<...>} id = training_spawned_script
	player_text = 'p2'
	player_status = player2_status
	player = 2
	change \{structurename = player2_status
		current_health = 1.0}
	spawnscriptlater update_score_fast params = {<...>} id = training_spawned_script
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
	training_wait_for_gem_scroller_startup
endscript

script training_7_4_wait_for_attack 
	change \{training_star_power_active = 0}
	change \{lesson_complete = 0}
	change \{training_song_over = 0}
	begin
	if ($training_song_over = 1)
		return
	endif
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

script training_7_5_start_gem_scrollers 
	change \{game_mode = p2_battle}
	training_start_gem_scroller \{players = 2
		bot_array = [
			0
			1
			0
			0
		]
		song = tut_vs_recov
		no_score_update
		disable_hud}
	killspawnedscript \{name = update_score_fast}
	player_text = 'p1'
	player_status = player1_status
	player = 1
	change \{structurename = player1_status
		current_health = 1.0}
	spawnscriptlater update_score_fast params = {<...>} id = training_spawned_script
	player_text = 'p2'
	player_status = player2_status
	player = 2
	change \{structurename = player2_status
		current_health = 1.0}
	spawnscriptlater update_score_fast params = {<...>} id = training_spawned_script
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
	training_wait_for_gem_scroller_startup
endscript

script training_7_6_start_gem_scrollers 
	change \{game_mode = p2_battle}
	training_start_gem_scroller \{players = 2
		bot_array = [
			0
			1
			0
			0
		]
		song = tut_vs_multattck
		no_score_update
		disable_hud}
	killspawnedscript \{name = update_score_fast}
	player_text = 'p1'
	player_status = player1_status
	player = 1
	change \{structurename = player1_status
		current_health = 1.0}
	spawnscriptlater update_score_fast params = {<...>} id = training_spawned_script
	player_text = 'p2'
	player_status = player2_status
	player = 2
	change \{structurename = player2_status
		current_health = 1.0}
	spawnscriptlater update_score_fast params = {<...>} id = training_spawned_script
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
	training_wait_for_gem_scroller_startup
endscript

script training_7_wait_for_obtain_1_attack 
	begin
	if ($training_song_over = 1)
		return
	endif
	if ($player1_status.current_num_powerups = 1)
		return
	endif
	wait \{1
		gameframe}
	repeat
endscript

script training_7_wait_for_obtain_3_attacks 
	begin
	if ($training_song_over = 1)
		return
	endif
	if ($player1_status.current_num_powerups = 3)
		return
	endif
	wait \{1
		gameframe}
	repeat
endscript
