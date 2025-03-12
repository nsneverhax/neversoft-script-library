training_star_power_tutorial_script = [
	{
		call = training_star_power_tutorial_startup
	}
	{
		time = 100
		call = training_2_1_show_title
	}
	{
		lesson = 1
		call = training_2_1_start_gem_scroller
	}
	{
		call = training_2_1_explain
	}
	{
		call = training_2_1_wait_for_star_power
	}
	{
		call = training_2_1_lesson_complete
	}
	{
		lesson = 2
		call = training_2_2_start_gem_scroller
	}
	{
		call = training_2_2_show_whammy
	}
	{
		call = training_2_2_watch_for_star_power
	}
	{
		call = training_2_2_lesson_complete
	}
	{
		lesson = 3
		call = training_2_3_start_gem_scroller
	}
	{
		call = training_2_3_explain
	}
	{
		call = training_2_3_wait_for_star_power
	}
	{
		call = training_2_3_watch_for_notes_hit
	}
	{
		call = training_2_3_end
	}
	{
		call = training_2_tutorial_complete_message
	}
	{
		call = training_2_end
	}
]

script training_star_power_tutorial_startup 
	training_init_session
	launchevent \{type = unfocus
		target = root_window}
	create_training_pause_handler
	training_create_narrator_icons
endscript

script training_2_1_show_title 
	change \{g_training_lessons_completed = 0}
	training_show_title \{title = qs(0x2c521cd1)}
	begin
	if ($transitions_locked = 0)
		break
	endif
	wait \{1
		gameframe}
	repeat
	create_training_pause_handler
	training_play_sound \{sound = 'Tut_Gtr_StarPower_01_GTR'
		wait}
	wait \{3
		seconds
		ignoreslomo}
	training_destroy_title
endscript
lesson_complete = 0

script training_2_1_start_gem_scroller 
	training_start_gem_scroller \{part = guitar
		song = tut_gtr_combos
		bot_array = [
			0
			0
			0
			0
		]}
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{song_wonp1 training_song_won}
		{star_sequence_bonusp1 hit_star_power_sequence}
		{pad_start show_training_pause_screen}
	]
	new_menu {
		scrollid = menu_tutorial
		vmenuid = vmenu_tutorial
		menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
	}
	launchevent \{type = focus
		target = menu_tutorial}
	training_set_lesson_header_text \{number = qs(0x22ee76e7)
		text = qs(0xcb233a67)}
	training_add_lesson_body_text \{number = 1
		text = qs(0x2bc0c46b)}
	training_show_lesson_header
	training_show_narrator \{narrator = 'guitarist'}
	change \{lesson_complete = 0}
	change \{training_received_star_power = 0}
	change \{notes_hit = 0}
	training_wait_for_gem_scroller_startup
endscript

script training_2_1_explain 
	wait \{3.25
		seconds
		ignoreslomo}
	training_pause_gem_scroller
	wait \{0.5
		seconds
		ignoreslomo}
	if training_are_notes_flipped
		training_add_arrow \{id = training_arrow2
			life = 10
			pos = (735.0, 360.0)
			scale = 0.7}
	else
		training_add_arrow \{id = training_arrow2
			life = 10
			pos = (532.0, 360.0)
			scale = 0.7}
	endif
	training_play_sound \{sound = 'Tut_Gtr_StarPower_02_GTR'
		wait}
	wait \{0.5
		seconds
		ignoreslomo}
	training_play_sound \{sound = 'Tut_Gtr_StarPower_03_GTR'
		wait}
	wait \{0.5
		seconds
		ignoreslomo}
	training_play_sound \{sound = 'Tut_Gtr_StarPower_04_GTR'
		wait}
	wait \{0.5
		seconds
		ignoreslomo}
	training_play_sound \{sound = 'Tut_Gtr_StarPower_05_GTR'
		wait}
	wait \{0.5
		seconds
		ignoreslomo}
	training_play_sound \{sound = 'Tut_Gtr_StarPower_06_GTR'
		wait}
	wait \{0.5
		seconds
		ignoreslomo}
	training_play_sound \{sound = 'Tut_Gtr_StarPower_07_GTR'
		wait}
	training_set_task_header_body \{text = qs(0x0cc38a33)}
	training_show_task_header
	wait \{2
		seconds
		ignoreslomo}
	training_resume_gem_scroller
endscript
training_received_star_power = 0

script hit_star_power_sequence 
	printf \{channel = training
		qs(0x4e7e8d0a)}
	change \{training_received_star_power = 1}
endscript

script training_2_1_wait_for_star_power 
	change \{training_received_star_power = 0}
	begin
	if ($training_song_over = 1)
		return
	endif
	if ($training_received_star_power = 1)
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script training_2_1_lesson_complete 
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	wait \{0.75
		seconds
		ignoreslomo}
	training_hide_lesson_header
	training_hide_narrator \{narrator = 'guitarist'}
	training_destroy_gem_scroller
	soundevent \{event = tutorial_mode_finish_chord}
	spawnscriptnow \{create_exploding_text
		id = training_spawned_script
		params = {
			parent = 'lesson_complete'
			text = qs(0xd50843f0)
			text_physics = 0
		}}
	wait \{7
		seconds
		ignoreslomo}
	killspawnedscript \{name = create_exploding_text}
	destroy_exploding_text \{parent = 'lesson_complete'}
	change g_training_lessons_completed = ($g_training_lessons_completed + 1)
endscript

script training_2_2_start_gem_scroller 
	training_start_gem_scroller \{part = guitar
		song = tut_gtr_wham
		bot_array = [
			0
			0
			0
			0
		]}
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{song_wonp1 training_song_won}
		{pad_start show_training_pause_screen}
	]
	new_menu {
		scrollid = menu_tutorial
		vmenuid = vmenu_tutorial
		menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
	}
	launchevent \{type = focus
		target = menu_tutorial}
	change \{training_received_star_power = 0}
	training_wait_for_gem_scroller_startup
endscript

script training_create_whammy_sprites 
	whammy_pos = (666.0, 416.0)
	whammy_scale = (0.7, 0.7)
	z = 21
	createscreenelement {
		parent = training_container
		type = spriteelement
		id = guitar_whammy_up
		just = [center center]
		texture = tutorial_whammy_up
		pos = <whammy_pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		scale = <whammy_scale>
		z_priority = <z>
	}
	createscreenelement {
		parent = training_container
		type = spriteelement
		id = guitar_whammy_down
		just = [center center]
		texture = tutorial_whammy_dn
		pos = <whammy_pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		scale = <whammy_scale>
		z_priority = <z>
	}
	createscreenelement {
		parent = training_container
		type = spriteelement
		id = guitar_whammy_turn1
		just = [center center]
		texture = tutorial_whammy_turn_1
		pos = <whammy_pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		scale = <whammy_scale>
		z_priority = <z>
	}
	createscreenelement {
		parent = training_container
		type = spriteelement
		id = guitar_whammy_turn2
		just = [center center]
		texture = tutorial_whammy_turn_2
		pos = <whammy_pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		scale = <whammy_scale>
		z_priority = <z>
	}
	safe_hide \{id = guitar_whammy_down}
	safe_hide \{id = guitar_whammy_turn1}
	safe_hide \{id = guitar_whammy_turn2}
endscript

script training_create_whammy_arrows 
	whammy_pos = (616.0, 356.0)
	whammy_scale = (0.7, 0.7)
	z = 21
	createscreenelement {
		parent = training_container
		type = spriteelement
		id = guitar_whammy_up_arrow
		just = [center center]
		texture = tutorial_arrow_green_wham_start
		pos = <whammy_pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		scale = <whammy_scale>
		z_priority = <z>
	}
	createscreenelement {
		parent = training_container
		type = spriteelement
		id = guitar_whammy_down_arrow
		just = [center center]
		texture = tutorial_arrow_green_wham_end
		pos = <whammy_pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		scale = <whammy_scale>
		z_priority = <z>
	}
	whammy_pos = (671.0, 366.0)
	createscreenelement {
		parent = training_container
		type = spriteelement
		id = training_arrow_red_start
		just = [center center]
		texture = tutorial_arrow_red_wham_start
		pos = <whammy_pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		scale = <whammy_scale>
		z_priority = <z>
	}
	createscreenelement {
		parent = training_container
		type = spriteelement
		id = training_arrow_red_middle
		just = [center center]
		texture = tutorial_arrow_red_wham_middle
		pos = <whammy_pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		scale = <whammy_scale>
		z_priority = <z>
	}
	createscreenelement {
		parent = training_container
		type = spriteelement
		id = training_arrow_red_end
		just = [center center]
		texture = tutorial_arrow_red_wham_end
		pos = <whammy_pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		scale = <whammy_scale>
		z_priority = <z>
	}
	safe_hide \{id = guitar_whammy_up_arrow}
	safe_hide \{id = guitar_whammy_down_arrow}
	safe_hide \{id = training_arrow_red_start}
	safe_hide \{id = training_arrow_red_middle}
	safe_hide \{id = training_arrow_red_end}
endscript

script training_2_2_show_whammy 
	wait \{1
		seconds
		ignoreslomo}
	training_pause_gem_scroller
	training_set_lesson_header_text \{number = qs(0x09c32524)
		text = qs(0xe4d7255c)}
	training_clear_lesson_body_text
	training_show_narrator \{narrator = 'guitarist'}
	training_play_sound \{sound = 'Tut_Gtr_Whammy_01_GTR'
		wait}
	wait \{0.5
		seconds
		ignoreslomo}
	<guitar_angle_tex> = tutorial_guitar_angle
	createscreenelement {
		parent = training_container
		type = spriteelement
		id = guitar_sprite
		just = [center center]
		texture = <guitar_angle_tex>
		pos = (300.0, 350.0)
		rot_angle = 0
		rgba = [255 255 255 255]
		scale = (0.6, 0.6)
		z_priority = 20
	}
	training_create_whammy_sprites
	training_create_whammy_arrows
	training_play_sound \{sound = 'Tut_Gtr_Whammy_02_GTR'
		wait}
	wait \{0.5
		seconds
		ignoreslomo}
	training_add_arrow \{id = training_whammy_indicator
		life = 3
		pos = (685.0, 350.0)
		scale = 0.7
		z = 60}
	training_play_sound \{sound = 'Tut_Gtr_Whammy_03_GTR'
		wait}
	wait \{0.5
		seconds
		ignoreslomo}
	training_play_sound \{sound = 'Tut_Gtr_Whammy_04_GTR'
		wait}
	wait \{0.5
		seconds
		ignoreslomo}
	killspawnedscript \{name = training_2_2_animate_whammy_up_down}
	spawnscript \{training_2_2_animate_whammy_up_down}
	training_play_sound \{sound = 'Tut_Gtr_Whammy_05_GTR'
		wait}
	wait \{0.5
		seconds
		ignoreslomo}
	training_2_2_destroy_sprites
	training_add_lesson_body_text \{number = 1
		text = qs(0xe9199dce)}
	training_show_lesson_header
	training_play_sound \{sound = 'Tut_Gtr_Whammy_06_GTR'
		wait}
	wait \{0.5
		seconds
		ignoreslomo}
	training_set_task_header_body \{text = qs(0x749d3e96)}
	training_show_task_header
	training_play_sound \{sound = 'Tut_Gtr_Whammy_07_GTR'
		wait}
	wait \{1
		seconds
		ignoreslomo}
	training_resume_gem_scroller
endscript

script training_2_2_animate_whammy_up_down 
	safe_show \{id = guitar_whammy_up_arrow}
	wait \{0.75
		seconds
		ignoreslomo}
	safe_hide \{id = guitar_whammy_up_arrow}
	begin
	safe_show \{id = guitar_whammy_down_arrow}
	safe_hide \{id = guitar_whammy_up}
	safe_show \{id = guitar_whammy_down}
	wait \{0.75
		seconds
		ignoreslomo}
	safe_hide \{id = guitar_whammy_down_arrow}
	safe_show \{id = guitar_whammy_up_arrow}
	safe_hide \{id = guitar_whammy_down}
	safe_show \{id = guitar_whammy_up}
	wait \{0.75
		seconds
		ignoreslomo}
	safe_hide \{id = guitar_whammy_up_arrow}
	repeat 2
endscript

script training_2_2_animate_whammy_turn 
	safe_show \{id = training_arrow_red_start}
	wait \{0.75
		seconds
		ignoreslomo}
	safe_hide \{id = training_arrow_red_start}
	begin
	safe_show \{id = training_arrow_red_middle}
	safe_hide \{id = guitar_whammy_up}
	safe_show \{id = guitar_whammy_turn1}
	wait \{0.75
		seconds
		ignoreslomo}
	safe_hide \{id = training_arrow_red_middle}
	safe_show \{id = training_arrow_red_end}
	safe_hide \{id = guitar_whammy_turn1}
	safe_show \{id = guitar_whammy_turn2}
	wait \{0.75
		seconds
		ignoreslomo}
	safe_hide \{id = training_arrow_red_end}
	safe_show \{id = training_arrow_red_middle}
	safe_hide \{id = guitar_whammy_turn2}
	safe_show \{id = guitar_whammy_turn1}
	wait \{0.75
		seconds
		ignoreslomo}
	safe_hide \{id = training_arrow_red_middle}
	safe_show \{id = training_arrow_red_start}
	safe_hide \{id = guitar_whammy_turn1}
	safe_show \{id = guitar_whammy_up}
	wait \{0.75
		seconds
		ignoreslomo}
	safe_hide \{id = training_arrow_red_start}
	repeat 2
endscript

script training_2_2_destroy_sprites 
	safe_destroy \{id = guitar_sprite}
	safe_destroy \{id = guitar_whammy_up}
	safe_destroy \{id = guitar_whammy_down}
	safe_destroy \{id = guitar_whammy_turn1}
	safe_destroy \{id = guitar_whammy_turn2}
	safe_destroy \{id = guitar_whammy_up_arrow}
	safe_destroy \{id = guitar_whammy_down_arrow}
	safe_destroy \{id = training_arrow_red_start}
	safe_destroy \{id = training_arrow_red_middle}
	safe_destroy \{id = training_arrow_red_end}
endscript

script training_2_2_watch_for_star_power 
	change \{lesson_complete = 0}
	elapsed_time = 0
	sound_played = false
	begin
	if (<sound_played> = false)
		getdeltatime
		elapsed_time = (<elapsed_time> + <delta_time>)
		if (<elapsed_time> > 20.0 && ($player1_status.star_power_amount < 25))
			training_play_sound \{sound = 'Tutorial_2B_03_lou'}
			sound_played = true
			printf \{channel = training
				qs(0x02249fa8)}
		endif
	endif
	if ($player1_status.star_power_amount >= 50.0)
		printf \{channel = training
			qs(0xb3f196ab)}
		break
	endif
	if ($training_song_over = 1)
		printf \{channel = training
			qs(0xc8da3e1b)}
		return
	endif
	wait \{1
		gameframe}
	repeat
endscript

script training_2_2_lesson_complete 
	enableinput off controller = ($player1_status.controller)
	change \{structurename = player1_status
		star_power_usable = 0}
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	wait \{0.75
		seconds}
	training_hide_lesson_header
	training_destroy_gem_scroller
	training_hide_narrator \{narrator = 'guitarist'}
	soundevent \{event = tutorial_mode_finish_chord}
	spawnscriptnow \{create_exploding_text
		id = training_spawned_script
		params = {
			parent = 'lesson_complete'
			text = qs(0xd50843f0)
			text_physics = 0
		}}
	wait \{0.5
		seconds}
	training_play_sound \{sound = 'Tut_Gtr_Whammy_15_GTR'
		wait}
	wait \{4
		seconds}
	killspawnedscript \{name = create_exploding_text}
	destroy_exploding_text \{parent = 'lesson_complete'}
	wait \{1
		seconds}
	change g_training_lessons_completed = ($g_training_lessons_completed + 1)
endscript

script training_2_3_start_gem_scroller 
	training_start_gem_scroller \{part = guitar
		song = tut_gtr_tilt
		bot_array = [
			0
			0
			0
			0
		]}
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{song_wonp1 training_song_won}
		{star_power_onp1 training_set_star_power_active}
		{pad_start show_training_pause_screen}
	]
	new_menu {
		scrollid = menu_tutorial
		vmenuid = vmenu_tutorial
		menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
	}
	launchevent \{type = focus
		target = menu_tutorial}
	training_set_lesson_header_text \{number = qs(0x10d81465)
		text = qs(0xd8886067)}
	training_clear_lesson_body_text
	training_show_lesson_header
	training_show_narrator \{narrator = 'guitarist'}
	change \{training_received_star_power = 0}
	change \{notes_hit = 0}
	change \{structurename = player1_status
		star_power_amount = 0}
	change \{lesson_complete = 0}
	training_wait_for_gem_scroller_startup
endscript

script training_2_3_explain 
	wait \{2.0
		seconds
		ignoreslomo}
	training_pause_gem_scroller
	training_play_sound \{sound = 'Tut_Gtr_ActivatingSP_01_GTR'
		wait}
	wait \{0.5
		seconds
		ignoreslomo}
	training_add_lesson_body_text \{number = 1
		text = qs(0xcf15902d)}
	training_show_lesson_header
	training_play_sound \{sound = 'Tut_Gtr_ActivatingSP_02_GTR'
		wait}
	wait \{0.5
		seconds
		ignoreslomo}
	training_play_sound \{sound = 'Tut_Gtr_ActivatingSP_03_GTR'
		wait}
	wait \{0.5
		seconds
		ignoreslomo}
	training_play_sound \{sound = 'Tut_Gtr_ActivatingSP_04_GTR'
		wait}
	wait \{1
		seconds
		ignoreslomo}
	training_set_task_header_body \{text = qs(0xddb56de6)}
	training_show_task_header
	training_2_3_destroy_sprites
	training_resume_gem_scroller
endscript

script training_guitar_starpower_activate_anim 
	createscreenelement \{parent = training_container
		type = spriteelement
		id = guitar_sprite
		just = [
			center
			center
		]
		texture = tutorial_guitar
		pos = (630.0, 400.0)
		scale = (0.2, 0.2)
		z_priority = 8}
	wait \{0.5
		seconds
		ignoreslomo}
	guitar_sprite :se_setprops \{rot_angle = 45
		time = 1.0}
	wait \{3.75
		seconds
		ignoreslomo}
	safe_hide \{id = guitar_sprite}
	guitar_sprite :se_setprops \{rot_angle = 0
		time = 0.0}
	wait \{10.0
		seconds
		ignoreslomo}
	safe_show \{id = guitar_sprite}
	wait \{1.5
		seconds
		ignoreslomo}
	guitar_sprite :se_setprops \{rot_angle = 45
		time = 1.0}
endscript
training_star_power_active = 0

script training_set_star_power_active 
	change \{training_star_power_active = 1}
endscript

script training_2_3_wait_for_star_power 
	change \{training_star_power_active = 0}
	change \{lesson_complete = 0}
	change \{training_song_over = 0}
	enableinput controller = ($player1_status.controller)
	change \{structurename = player1_status
		star_power_usable = 1}
	increase_star_power \{amount = 100}
	begin
	if ($training_song_over = 1)
		return
	endif
	if ($training_star_power_active = 1 || $player1_status.star_power_used = 1)
		training_display_notes_hit \{notes_hit = 0}
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script training_2_3_watch_for_notes_hit 
	change \{notes_hit = 0}
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{song_wonp1 training_song_won}
		{hit_notesp1 lesson2_hit_note}
		{pad_start show_training_pause_screen}
	]
	new_menu {
		scrollid = menu_tutorial
		vmenuid = vmenu_tutorial
		menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
	}
	launchevent \{type = focus
		target = menu_tutorial}
	begin
	printf \{channel = training
		qs(0xe8cf3006)
		a = $notes_hit}
	change \{structurename = player1_status
		star_power_amount = 100}
	if ($training_song_over = 1)
		printf \{channel = training
			qs(0x0c9901c9)}
		return
	endif
	if ($notes_hit >= 8)
		printf \{channel = training
			qs(0x0c9901c9)}
		return
	endif
	wait \{1
		gameframe}
	repeat
endscript

script training_set_lesson_complete 
	printf \{channel = training
		qs(0x77246935)}
	change \{lesson_complete = 1}
endscript

script training_2_tutorial_complete_message 
	soundevent \{event = tutorial_mode_finish_chord}
	training_hide_lesson_header
	training_hide_narrator \{narrator = 'guitarist'}
	spawnscriptnow \{create_exploding_text
		id = training_spawned_script
		params = {
			parent = 'lesson_complete'
			text = qs(0x2c521cd1)
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
	training_play_sound \{sound = 'Tut_Gtr_ActivatingSP_08_GTR'
		wait}
	wait \{0.5
		seconds
		ignoreslomo}
	training_play_sound \{sound = 'Tut_Gtr_ActivatingSP_09_GTR'
		wait}
	training_hide_narrator
	killspawnedscript \{name = create_exploding_text}
	destroy_all_exploding_text
	change g_training_lessons_completed = ($g_training_lessons_completed + 1)
endscript

script training_2_3_destroy_sprites 
	safe_destroy \{id = guitar_sprite}
endscript

script training_2_3_end 
	printf \{channel = training
		qs(0x9a50313d)}
	wait \{1
		seconds
		ignoreslomo}
	training_2_3_destroy_sprites
	if screenelementexists \{id = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
		create_training_pause_handler
	endif
	if screenelementexists \{id = notes_hit_text}
		destroyscreenelement \{id = notes_hit_text}
	endif
	wait \{0.5
		seconds
		ignoreslomo}
	training_destroy_gem_scroller
endscript

script training_2_end 
	training_container :gettags
	if ($g_training_lessons_completed = 3)
		setglobaltags \{training
			params = {
				star_power_lesson = complete
			}}
	endif
	training_kill_session
	killspawnedscript \{name = training_2_2_animate_whammy_up_down}
	killspawnedscript \{name = training_guitar_starpower_activate_anim}
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
	training_check_for_all_tutorials_finished
	decide_tutorial_back_destination
endscript

script lesson2_hit_note 
	change notes_hit = ($notes_hit + 1)
	if (($notes_hit = 1) || ($notes_hit = 4))
		training_play_positive \{who = guitarist}
	endif
	training_display_notes_hit \{notes_hit = $notes_hit}
endscript
