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
	0xc1c4e84c \{mode = tutorials
		tutorial = 2}
	LaunchEvent \{Type = unfocus
		target = root_window}
	create_training_pause_handler
	training_create_narrator_icons
endscript

script training_2_1_show_title 
	Change \{g_training_lessons_completed = 0}
	training_show_title \{title = qs(0x2c521cd1)}
	begin
	if ($transitions_locked = 0)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	create_training_pause_handler
	0x4de05aff \{mode = 0x24066473}
	training_play_sound \{Sound = 'Tut_Gtr_StarPower_01_GTR'
		Wait}
	Wait \{3
		Seconds
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
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{Type = unfocus
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
	LaunchEvent \{Type = focus
		target = menu_tutorial}
	training_set_lesson_header_text \{number = qs(0x22ee76e7)
		text = qs(0xcb233a67)}
	training_add_lesson_body_text \{number = 1
		text = qs(0x2bc0c46b)}
	training_show_lesson_header
	training_show_narrator \{narrator = 'guitarist'}
	Change \{lesson_complete = 0}
	Change \{training_received_star_power = 0}
	Change \{notes_hit = 0}
	training_wait_for_gem_scroller_startup
endscript

script training_2_1_explain 
	Wait \{3.25
		Seconds
		ignoreslomo}
	training_pause_gem_scroller
	Wait \{0.5
		Seconds
		ignoreslomo}
	if training_are_notes_flipped
		training_add_arrow \{id = training_arrow2
			life = 10
			Pos = (735.0, 360.0)
			Scale = 2.3}
	else
		training_add_arrow \{id = training_arrow2
			life = 10
			Pos = (532.0, 360.0)
			Scale = 2.3}
	endif
	training_play_sound \{Sound = 'Tut_Gtr_StarPower_02_GTR'
		Wait}
	Wait \{0.5
		Seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Gtr_StarPower_03_GTR'
		Wait}
	Wait \{0.5
		Seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Gtr_StarPower_04_GTR'
		Wait}
	Wait \{0.5
		Seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Gtr_StarPower_05_GTR'
		Wait}
	Wait \{0.5
		Seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Gtr_StarPower_06_GTR'
		Wait}
	Wait \{0.5
		Seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Gtr_StarPower_07_GTR'
		Wait}
	training_set_task_header_body \{text = qs(0x0cc38a33)}
	training_show_task_header
	Wait \{2
		Seconds
		ignoreslomo}
	training_resume_gem_scroller
endscript
training_received_star_power = 0

script hit_star_power_sequence 

	Change \{training_received_star_power = 1}
endscript

script training_2_1_wait_for_star_power 
	Change \{training_received_star_power = 0}
	begin
	if ($training_song_over = 1)
		return
	endif
	if ($training_received_star_power = 1)
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script training_2_1_lesson_complete 
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	Wait \{0.75
		Seconds
		ignoreslomo}
	training_hide_lesson_header
	training_hide_narrator \{narrator = 'guitarist'}
	training_destroy_gem_scroller
	SoundEvent \{event = Tutorial_Mode_Finish_Chord}
	SpawnScriptNow \{create_yourock
		params = {
			text = qs(0x77f6317c)
		}}
	Wait \{7
		Seconds
		ignoreslomo}
	Change g_training_lessons_completed = ($g_training_lessons_completed + 1)
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
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{Type = unfocus
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
	LaunchEvent \{Type = focus
		target = menu_tutorial}
	Change \{training_received_star_power = 0}
	training_wait_for_gem_scroller_startup
endscript

script training_create_whammy_sprites 
	whammy_pos = (666.0, 416.0)
	0x17b5e1cb = (179.2, 179.2)
	z = 21
	CreateScreenElement {
		parent = training_container
		Type = SpriteElement
		id = guitar_whammy_up
		just = [center center]
		texture = tutorial_whammy_up
		Pos = <whammy_pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		dims = <0x17b5e1cb>
		z_priority = <z>
	}
	CreateScreenElement {
		parent = training_container
		Type = SpriteElement
		id = guitar_whammy_down
		just = [center center]
		texture = tutorial_whammy_dn
		Pos = <whammy_pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		dims = <0x17b5e1cb>
		z_priority = <z>
	}
	CreateScreenElement {
		parent = training_container
		Type = SpriteElement
		id = guitar_whammy_turn1
		just = [center center]
		texture = tutorial_whammy_turn_1
		Pos = <whammy_pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		dims = <0x17b5e1cb>
		z_priority = <z>
	}
	CreateScreenElement {
		parent = training_container
		Type = SpriteElement
		id = guitar_whammy_turn2
		just = [center center]
		texture = tutorial_whammy_turn_2
		Pos = <whammy_pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		dims = <0x17b5e1cb>
		z_priority = <z>
	}
	safe_hide \{id = guitar_whammy_down}
	safe_hide \{id = guitar_whammy_turn1}
	safe_hide \{id = guitar_whammy_turn2}
endscript

script training_create_whammy_arrows 
	whammy_pos = (616.0, 356.0)
	0x17b5e1cb = (179.2, 179.2)
	z = 21
	CreateScreenElement {
		parent = training_container
		Type = SpriteElement
		id = guitar_whammy_up_arrow
		just = [center center]
		texture = tutorial_arrow_green_wham_start
		Pos = <whammy_pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		dims = <0x17b5e1cb>
		z_priority = <z>
	}
	CreateScreenElement {
		parent = training_container
		Type = SpriteElement
		id = guitar_whammy_down_arrow
		just = [center center]
		texture = tutorial_arrow_green_wham_end
		Pos = <whammy_pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		dims = <0x17b5e1cb>
		z_priority = <z>
	}
	whammy_pos = (671.0, 366.0)
	CreateScreenElement {
		parent = training_container
		Type = SpriteElement
		id = training_arrow_red_start
		just = [center center]
		texture = tutorial_arrow_red_wham_start
		Pos = <whammy_pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		dims = <0x17b5e1cb>
		z_priority = <z>
	}
	CreateScreenElement {
		parent = training_container
		Type = SpriteElement
		id = training_arrow_red_middle
		just = [center center]
		texture = tutorial_arrow_red_wham_middle
		Pos = <whammy_pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		dims = <0x17b5e1cb>
		z_priority = <z>
	}
	CreateScreenElement {
		parent = training_container
		Type = SpriteElement
		id = training_arrow_red_end
		just = [center center]
		texture = tutorial_arrow_red_wham_end
		Pos = <whammy_pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		dims = <0x17b5e1cb>
		z_priority = <z>
	}
	safe_hide \{id = guitar_whammy_up_arrow}
	safe_hide \{id = guitar_whammy_down_arrow}
	safe_hide \{id = training_arrow_red_start}
	safe_hide \{id = training_arrow_red_middle}
	safe_hide \{id = training_arrow_red_end}
endscript

script training_2_2_show_whammy 
	Wait \{1
		Seconds
		ignoreslomo}
	training_pause_gem_scroller
	training_set_lesson_header_text \{number = qs(0x09c32524)
		text = qs(0xe4d7255c)}
	training_clear_lesson_body_text
	training_show_narrator \{narrator = 'guitarist'}
	0x4de05aff \{mode = 0x96b07169}
	training_play_sound \{Sound = 'Tut_Gtr_Whammy_01_GTR'
		Wait}
	Wait \{0.5
		Seconds
		ignoreslomo}
	<guitar_angle_tex> = tutorial_guitar_angle
	CreateScreenElement {
		parent = training_container
		Type = SpriteElement
		id = guitar_sprite
		just = [center center]
		texture = <guitar_angle_tex>
		Pos = (300.0, 350.0)
		rot_angle = 0
		rgba = [255 255 255 255]
		Scale = (4.8, 4.8)
		z_priority = 20
	}
	training_create_whammy_sprites
	training_create_whammy_arrows
	training_play_sound \{Sound = 'Tut_Gtr_Whammy_02_GTR'
		Wait}
	Wait \{0.5
		Seconds
		ignoreslomo}
	training_add_arrow \{id = training_whammy_indicator
		life = 3
		Pos = (685.0, 350.0)
		Scale = 2.3
		z = 60}
	training_play_sound \{Sound = 'Tut_Gtr_Whammy_03_GTR'
		Wait}
	Wait \{0.5
		Seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Gtr_Whammy_04_GTR'
		Wait}
	Wait \{0.5
		Seconds
		ignoreslomo}
	KillSpawnedScript \{Name = training_2_2_animate_whammy_up_down}
	spawnscript \{training_2_2_animate_whammy_up_down}
	training_play_sound \{Sound = 'Tut_Gtr_Whammy_05_GTR'
		Wait}
	Wait \{0.5
		Seconds
		ignoreslomo}
	training_2_2_destroy_sprites
	training_add_lesson_body_text \{number = 1
		text = qs(0xe9199dce)}
	training_show_lesson_header
	training_play_sound \{Sound = 'Tut_Gtr_Whammy_06_GTR'
		Wait}
	Wait \{0.5
		Seconds
		ignoreslomo}
	training_set_task_header_body \{text = qs(0x749d3e96)}
	training_show_task_header
	training_play_sound \{Sound = 'Tut_Gtr_Whammy_07_GTR'
		Wait}
	Wait \{1
		Seconds
		ignoreslomo}
	training_resume_gem_scroller
endscript

script training_2_2_animate_whammy_up_down 
	safe_show \{id = guitar_whammy_up_arrow}
	Wait \{0.75
		Seconds
		ignoreslomo}
	safe_hide \{id = guitar_whammy_up_arrow}
	begin
	safe_show \{id = guitar_whammy_down_arrow}
	safe_hide \{id = guitar_whammy_up}
	safe_show \{id = guitar_whammy_down}
	Wait \{0.75
		Seconds
		ignoreslomo}
	safe_hide \{id = guitar_whammy_down_arrow}
	safe_show \{id = guitar_whammy_up_arrow}
	safe_hide \{id = guitar_whammy_down}
	safe_show \{id = guitar_whammy_up}
	Wait \{0.75
		Seconds
		ignoreslomo}
	safe_hide \{id = guitar_whammy_up_arrow}
	repeat 2
endscript

script training_2_2_animate_whammy_turn 
	safe_show \{id = training_arrow_red_start}
	Wait \{0.75
		Seconds
		ignoreslomo}
	safe_hide \{id = training_arrow_red_start}
	begin
	safe_show \{id = training_arrow_red_middle}
	safe_hide \{id = guitar_whammy_up}
	safe_show \{id = guitar_whammy_turn1}
	Wait \{0.75
		Seconds
		ignoreslomo}
	safe_hide \{id = training_arrow_red_middle}
	safe_show \{id = training_arrow_red_end}
	safe_hide \{id = guitar_whammy_turn1}
	safe_show \{id = guitar_whammy_turn2}
	Wait \{0.75
		Seconds
		ignoreslomo}
	safe_hide \{id = training_arrow_red_end}
	safe_show \{id = training_arrow_red_middle}
	safe_hide \{id = guitar_whammy_turn2}
	safe_show \{id = guitar_whammy_turn1}
	Wait \{0.75
		Seconds
		ignoreslomo}
	safe_hide \{id = training_arrow_red_middle}
	safe_show \{id = training_arrow_red_start}
	safe_hide \{id = guitar_whammy_turn1}
	safe_show \{id = guitar_whammy_up}
	Wait \{0.75
		Seconds
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
	Change \{lesson_complete = 0}
	elapsed_time = 0
	sound_played = FALSE
	begin
	if (<sound_played> = FALSE)
		GetDeltaTime
		elapsed_time = (<elapsed_time> + <delta_time>)
		if (<elapsed_time> > 20.0 && ($player1_status.star_power_amount < 25))
			training_play_sound \{Sound = 'Tutorial_2B_03_lou'}
			sound_played = true

		endif
	endif
	if ($player1_status.star_power_amount >= 50.0)

		break
	endif
	if ($training_song_over = 1)

		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script training_2_2_lesson_complete 
	EnableInput OFF controller = ($player1_status.controller)
	Change \{structurename = player1_status
		star_power_usable = 0}
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	Wait \{0.75
		Seconds}
	training_hide_lesson_header
	training_destroy_gem_scroller
	training_hide_narrator \{narrator = 'guitarist'}
	SoundEvent \{event = Tutorial_Mode_Finish_Chord}
	SpawnScriptNow \{create_yourock
		params = {
			text = qs(0x77f6317c)
		}}
	training_play_sound \{Sound = 'Tut_Gtr_Whammy_15_GTR'
		Wait}
	Wait \{7
		Seconds}
	Change g_training_lessons_completed = ($g_training_lessons_completed + 1)
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
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{Type = unfocus
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
	LaunchEvent \{Type = focus
		target = menu_tutorial}
	training_set_lesson_header_text \{number = qs(0x10d81465)
		text = qs(0xd8886067)}
	training_clear_lesson_body_text
	training_show_lesson_header
	training_show_narrator \{narrator = 'guitarist'}
	Change \{training_received_star_power = 0}
	Change \{notes_hit = 0}
	Change \{structurename = player1_status
		star_power_amount = 0}
	Change \{lesson_complete = 0}
	training_wait_for_gem_scroller_startup
endscript

script training_2_3_explain 
	Wait \{2.0
		Seconds
		ignoreslomo}
	training_pause_gem_scroller
	0x4de05aff \{mode = 0xe0cd6a6e}
	training_play_sound \{Sound = 'Tut_Gtr_ActivatingSP_01_GTR'
		Wait}
	Wait \{0.5
		Seconds
		ignoreslomo}
	training_add_lesson_body_text \{number = 1
		text = qs(0xcf15902d)}
	training_show_lesson_header
	training_play_sound \{Sound = 'Tut_Gtr_ActivatingSP_02_GTR'
		Wait}
	Wait \{0.5
		Seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Gtr_ActivatingSP_03_GTR'
		Wait}
	Wait \{0.5
		Seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Gtr_ActivatingSP_04_GTR'
		Wait}
	Wait \{1
		Seconds
		ignoreslomo}
	training_set_task_header_body \{text = qs(0xddb56de6)}
	training_show_task_header
	training_2_3_destroy_sprites
	training_resume_gem_scroller
endscript

script training_guitar_starpower_activate_anim 
	CreateScreenElement \{parent = training_container
		Type = SpriteElement
		id = guitar_sprite
		just = [
			center
			center
		]
		texture = tutorial_guitar
		Pos = (630.0, 400.0)
		Scale = (6.4, 6.4)
		z_priority = 8}
	Wait \{0.5
		Seconds
		ignoreslomo}
	guitar_sprite :se_setprops \{rot_angle = 45
		time = 1.0}
	Wait \{3.75
		Seconds
		ignoreslomo}
	safe_hide \{id = guitar_sprite}
	guitar_sprite :se_setprops \{rot_angle = 0
		time = 0.0}
	Wait \{10.0
		Seconds
		ignoreslomo}
	safe_show \{id = guitar_sprite}
	Wait \{1.5
		Seconds
		ignoreslomo}
	guitar_sprite :se_setprops \{rot_angle = 45
		time = 1.0}
endscript
training_star_power_active = 0

script training_set_star_power_active 
	Change \{training_star_power_active = 1}
endscript

script training_2_3_wait_for_star_power 
	Change \{training_star_power_active = 0}
	Change \{lesson_complete = 0}
	Change \{training_song_over = 0}
	EnableInput controller = ($player1_status.controller)
	Change \{structurename = player1_status
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
	Wait \{1
		gameframe}
	repeat
endscript

script training_2_3_watch_for_notes_hit 
	Change \{notes_hit = 0}
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{Type = unfocus
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
	LaunchEvent \{Type = focus
		target = menu_tutorial}
	begin

	Change \{structurename = player1_status
		star_power_amount = 100}
	if ($training_song_over = 1)

		return
	endif
	if ($notes_hit >= 8)

		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script training_set_lesson_complete 

	Change \{lesson_complete = 1}
endscript

script training_2_tutorial_complete_message 
	SoundEvent \{event = Tutorial_Mode_Finish_Chord}
	training_hide_lesson_header
	training_hide_narrator \{narrator = 'guitarist'}
	SpawnScriptNow \{create_yourock
		params = {
			text = qs(0x8258699c)
		}}
	training_play_sound \{Sound = 'Tut_Gtr_ActivatingSP_08_GTR'
		Wait}
	Wait \{0.5
		Seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Gtr_ActivatingSP_09_GTR'
		Wait}
	training_hide_narrator
	Wait \{6.5
		Seconds
		ignoreslomo}
	Change g_training_lessons_completed = ($g_training_lessons_completed + 1)
endscript

script training_2_3_destroy_sprites 
	safe_destroy \{id = guitar_sprite}
endscript

script training_2_3_end 

	Wait \{1
		Seconds
		ignoreslomo}
	training_2_3_destroy_sprites
	if ScreenElementExists \{id = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
		create_training_pause_handler
	endif
	if ScreenElementExists \{id = notes_hit_text}
		DestroyScreenElement \{id = notes_hit_text}
	endif
	Wait \{0.5
		Seconds
		ignoreslomo}
	training_destroy_gem_scroller \{still_in_training = 0}
endscript

script training_2_end 
	training_container :GetTags
	if ($g_training_lessons_completed = 3)
		SetGlobalTags \{training
			params = {
				star_power_lesson = complete
			}}
	endif
	training_kill_session
	KillSpawnedScript \{Name = training_2_2_animate_whammy_up_down}
	KillSpawnedScript \{Name = training_guitar_starpower_activate_anim}
	if ScreenElementExists \{id = training_container}
		DestroyScreenElement \{id = training_container}
	endif
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	training_destroy_narrator_icons
	SetScreenElementProps \{id = root_window
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
	Change notes_hit = ($notes_hit + 1)
	if (($notes_hit = 1) || ($notes_hit = 4))
		training_play_positive \{who = GUITARIST}
	endif
	training_display_notes_hit \{notes_hit = $notes_hit}
endscript
