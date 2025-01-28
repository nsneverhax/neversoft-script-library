training_battle_tutorial_script = [
	{
		call = training_battle_tutorial_startup
	}
	{
		Time = 100
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
	LaunchEvent \{Type = unfocus
		Target = root_window}
	Change \{StructureName = player2_status
		character_id = Axel}
	create_guitarist \{Name = BASSIST}
	BASSIST :Hide
	training_create_narrator_icons
endscript

script training_3_show_title 
	training_show_title \{Title = "Guitar Hero Battle Tutorial"}
	begin
	if ($transitions_locked = 0)
		break
	endif
	Wait \{1
		GameFrame}
	repeat
	create_training_pause_handler
	safe_show \{Id = god_icon}
	training_play_sound \{Sound = 'Tutorial_3_Intro_01_God'
		Wait}
	training_destroy_title
endscript

script training_3_1_start_gem_scroller 
	destroy_band
	Change \{game_mode = Tutorial}
	Change \{boss_battle = 1}
	Change \{tutorial_disable_hud = 1}
	training_start_gem_scroller \{Song = Tutorial_3A
		no_score_update}
	KillSpawnedScript \{Name = update_score_fast}
	training_wait_for_gem_scroller_startup
endscript

script training_3_1_show_lesson 
	Wait \{1
		Seconds
		IgnoreSlomo}
	training_pause_gem_scroller
	training_set_lesson_header_text \{Text = "LESSON 1: ACQUIRING POWERUPS"}
	training_set_lesson_header_body \{Text = "1. Complete a Battle Power sequence to receive a Guitar Battle power-up"}
	training_show_lesson_header
	safe_show \{Id = god_icon}
	training_play_sound \{Sound = 'Tutorial_3A_01_God'
		Wait}
	training_set_task_header_body \{Text = "Hit star sequence to continue"}
	training_show_task_header
	Wait \{2
		Seconds
		IgnoreSlomo}
	training_resume_gem_scroller
endscript

script training_3_1_wait_for_star_power 
	if ScreenElementExists \{Id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			Target = menu_tutorial}
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
		Menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
	}
	Change \{training_received_star_power = 0}
	begin
	if ($training_song_over = 1)
		return
	endif
	current_num_powerups = ($player1_status.current_num_powerups)
	if (<current_num_powerups> > 0)
		break
	endif
	Wait \{1
		GameFrame}
	repeat
	EnableInput OFF controller = ($player1_status.controller)
	Change \{StructureName = player1_status
		star_power_usable = 0}
	Wait \{1.0
		Seconds
		IgnoreSlomo}
endscript

script training_3_1_show_complete_message 
	SoundEvent \{Event = Tutorial_Mode_Finish_Chord}
	Safe_Destroy \{Id = notes_hit_text}
	training_hide_lesson_header
	training_hide_task_header
	CreateScreenElement {
		Type = TextElement
		PARENT = training_container
		Id = tuning_complete_text
		just = [Center Center]
		Pos = (640.0, 350.0)
		font = ($training_font)
		Text = "Lesson Complete"
		Scale = 1.0
		rgba = ($training_text_color)
	}
	Wait \{2
		Seconds
		IgnoreSlomo}
	Safe_Destroy \{Id = tuning_complete_text}
endscript

script training_3_2_show_lesson 
	EnableInput OFF controller = ($player1_status.controller)
	training_pause_gem_scroller
	if ($player1_status.current_num_powerups = 0)
		bossbattle_ready \{battle_gem = 0
			player_status = player1_status}
	endif
	EnableInput OFF controller = ($player1_status.controller)
	Change \{StructureName = player1_status
		star_power_usable = 0}
	training_set_lesson_header_text \{Text = "LESSON 2: USING POWERUPS"}
	training_set_lesson_header_body \{Text = ""}
	training_show_lesson_header
	training_hide_task_header
	safe_hide \{Id = god_icon}
	safe_show \{Id = lou_icon}
	Change \{StructureName = player1_status
		last_selected_attack = -1}
	training_play_sound \{Sound = 'Tutorial_3B_01_Lou'}
	Wait \{25.5
		Seconds
		IgnoreSlomo}
	CreateScreenElement \{PARENT = training_container
		Type = SpriteElement
		Id = guitar_sprite
		just = [
			Center
			Center
		]
		texture = training_guitar_small
		Pos = (400.0, 400.0)
		Rot_Angle = 45
		rgba = [
			255
			255
			255
			255
		]
		Scale = (0.8, 0.8)
		z_priority = 50}
	Wait \{2.5
		Seconds
		IgnoreSlomo}
	DoScreenElementMorph \{Id = guitar_sprite
		Rot_Angle = 0
		Time = 1.0}
	Wait \{3.5
		Seconds
		IgnoreSlomo}
	safe_hide \{Id = guitar_sprite}
	DoScreenElementMorph \{Id = guitar_sprite
		Rot_Angle = 45
		Time = 0.0}
	training_wait_for_sound \{Sound = 'Tutorial_3B_01_Lou'}
	training_set_task_header_body \{Text = "Tilt guitar upward to unleash attack"}
	training_show_task_header
	Wait \{2
		Seconds
		IgnoreSlomo}
	training_resume_gem_scroller
	EnableInput controller = ($player1_status.controller)
	Change \{StructureName = player1_status
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
	Wait \{1
		GameFrame}
	repeat
	Wait \{1.5
		Seconds
		IgnoreSlomo}
endscript

script training_3_2_show_complete_message 
	SoundEvent \{Event = Tutorial_Mode_Finish_Chord}
	if ScreenElementExists \{Id = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	create_training_pause_handler
	Safe_Destroy \{Id = notes_hit_text}
	training_hide_lesson_header
	training_hide_task_header
	PauseGame
	PauseGH3Sounds
	Wait \{0.5
		Seconds
		IgnoreSlomo}
	KillCamAnim \{Name = ch_view_cam}
	kill_gem_scroller
	destroy_bg_viewport
	setup_bg_viewport
	PlayIGCCam \{Id = cs_view_cam_id
		Name = ch_view_cam
		viewport = Bg_Viewport
		LockTo = World
		Pos = (-0.068807, 1.5990009, 5.7975965)
		Quat = (0.000506, 0.99942994, -0.017537998)
		FOV = 72.0
		Play_hold = 1
		interrupt_current}
	UnPauseGH3Sounds
	UnPauseGame
	CreateScreenElement {
		Type = TextElement
		PARENT = training_container
		Id = tuning_complete_text
		just = [Center Center]
		Pos = (640.0, 350.0)
		font = ($training_font)
		Text = "Lesson Complete"
		Scale = 1.0
		rgba = ($training_text_color)
	}
	Wait \{2
		Seconds
		IgnoreSlomo}
	safe_hide \{Id = lou_icon}
	Safe_Destroy \{Id = tuning_complete_text}
endscript

script training_3_3_start_gem_scroller 
	destroy_band
	Change \{game_mode = Tutorial}
	Change \{boss_battle = 1}
	Change \{tutorial_disable_hud = 1}
	training_start_gem_scroller \{Song = Tutorial_3C
		disable_hud
		no_score_update}
	KillSpawnedScript \{Name = update_score_fast}
	training_wait_for_gem_scroller_startup
endscript

script training_3_3_show_lesson 
	Wait \{1
		Seconds
		IgnoreSlomo}
	Change \{StructureName = player1_status
		current_num_powerups = 0}
	bossbattle_ready \{battle_gem = 5
		player_status = player2_status}
	Wait \{1.0
		Seconds
		IgnoreSlomo}
	training_pause_gem_scroller
	training_set_lesson_header_text \{Text = "LESSON 3: DIFFERENT ATTACKS"}
	training_set_lesson_header_body \{Text = ""}
	training_show_lesson_header
	training_hide_task_header
	safe_show \{Id = god_icon}
	training_play_sound \{Sound = 'Tutorial_3C_01_God'
		Wait}
	training_set_task_header_body \{Text = "Quickly tap the button of the broken string"}
	training_show_task_header
	Wait \{1
		Seconds
		IgnoreSlomo}
	training_resume_gem_scroller
	Wait \{1
		Seconds
		IgnoreSlomo}
	bossbattle_trigger_on \{player_status = player2_status}
	Wait \{1
		Seconds
		IgnoreSlomo}
	if ScreenElementExists \{Id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			Target = menu_tutorial}
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
		Menu_pos = (120.0, 190.0)
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
	Wait \{1
		GameFrame}
	repeat
endscript

script training_3_3_show_complete_message 
	if ScreenElementExists \{Id = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	create_training_pause_handler
	Wait \{0.75
		Seconds
		IgnoreSlomo}
	SoundEvent \{Event = Tutorial_Mode_Finish_Chord_03}
	Safe_Destroy \{Id = notes_hit_text}
	training_hide_lesson_header
	training_hide_task_header
	PauseGame
	PauseGH3Sounds
	StopAllSounds
	Wait \{0.5
		Seconds
		IgnoreSlomo}
	KillCamAnim \{Name = ch_view_cam}
	kill_gem_scroller
	destroy_bg_viewport
	setup_bg_viewport
	PlayIGCCam \{Id = cs_view_cam_id
		Name = ch_view_cam
		viewport = Bg_Viewport
		LockTo = World
		Pos = (-0.068807, 1.5990009, 5.7975965)
		Quat = (0.000506, 0.99942994, -0.017537998)
		FOV = 72.0
		Play_hold = 1
		interrupt_current}
	UnPauseGH3Sounds
	UnPauseGame
	CreateScreenElement {
		Type = TextElement
		PARENT = training_container
		Id = tuning_complete_text
		just = [Center Center]
		Pos = (640.0, 350.0)
		font = ($training_font)
		Text = "Lesson Complete"
		Scale = 1.0
		rgba = ($training_text_color)
	}
	Wait \{2.0
		Seconds
		IgnoreSlomo}
	safe_hide \{Id = god_icon}
	Safe_Destroy \{Id = tuning_complete_text}
endscript

script training_3_4_start_gem_scroller 
	destroy_band
	Change \{game_mode = Tutorial}
	Change \{boss_battle = 1}
	Change \{tutorial_disable_hud = 1}
	training_start_gem_scroller \{Song = Tutorial_3D
		disable_hud
		no_score_update}
	KillSpawnedScript \{Name = update_score_fast}
	training_wait_for_gem_scroller_startup
endscript

script training_3_4_show_lesson 
	Wait \{1
		Seconds
		IgnoreSlomo}
	training_pause_gem_scroller
	training_set_lesson_header_text \{Text = "LESSON 4: MULTIPLE ATTACKS"}
	training_set_lesson_header_body \{Text = ""}
	training_show_lesson_header
	training_hide_task_header
	safe_show \{Id = lou_icon}
	Change \{StructureName = player1_status
		last_selected_attack = -1}
	training_play_sound \{Sound = 'Tutorial_3D_01_Lou'
		Wait}
	training_set_task_header_body \{Text = "Use both attacks to damage opponent"}
	training_show_task_header
	Change \{StructureName = player1_status
		current_num_powerups = 0}
	bossbattle_ready \{battle_gem = 0
		player_status = player1_status}
	bossbattle_ready \{battle_gem = 2
		player_status = player1_status}
	EnableInput OFF controller = ($player1_status.controller)
	Change \{StructureName = player1_status
		star_power_usable = 0}
	Wait \{2
		Seconds
		IgnoreSlomo}
	training_resume_gem_scroller
	if ScreenElementExists \{Id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			Target = menu_tutorial}
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
		Menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
	}
	EnableInput controller = ($player1_status.controller)
	Change \{StructureName = player1_status
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
	Wait \{1
		GameFrame}
	repeat
endscript

script training_3_4_show_complete_message 
	if ScreenElementExists \{Id = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	create_training_pause_handler
	Wait \{0.75
		Seconds
		IgnoreSlomo}
	SoundEvent \{Event = Tutorial_Mode_Finish_Chord_03}
	Safe_Destroy \{Id = notes_hit_text}
	training_hide_lesson_header
	training_hide_task_header
	PauseGame
	PauseGH3Sounds
	StopAllSounds
	Wait \{0.5
		Seconds
		IgnoreSlomo}
	KillCamAnim \{Name = ch_view_cam}
	kill_gem_scroller
	destroy_bg_viewport
	setup_bg_viewport
	PlayIGCCam \{Id = cs_view_cam_id
		Name = ch_view_cam
		viewport = Bg_Viewport
		LockTo = World
		Pos = (-0.068807, 1.5990009, 5.7975965)
		Quat = (0.000506, 0.99942994, -0.017537998)
		FOV = 72.0
		Play_hold = 1
		interrupt_current}
	UnPauseGH3Sounds
	UnPauseGame
	CreateScreenElement {
		Type = TextElement
		PARENT = training_container
		Id = tuning_complete_text
		just = [Center Center]
		Pos = (640.0, 350.0)
		font = ($training_font)
		Text = "Guitar Battle Tutorial Complete"
		Scale = 1.0
		rgba = ($training_text_color)
	}
	Wait \{0.5
		Seconds
		IgnoreSlomo}
	training_play_sound \{Sound = 'Tutorial_3_outro'
		Wait}
	safe_hide \{Id = lou_icon}
	Safe_Destroy \{Id = tuning_complete_text}
endscript

script training_basic_tutorial_3_end 
	training_kill_session
	Change \{tutorial_disable_hud = 0}
	if ScreenElementExists \{Id = training_container}
		DestroyScreenElement \{Id = training_container}
	endif
	if ScreenElementExists \{Id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			Target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	training_destroy_narrator_icons
	SetScreenElementProps \{Id = root_window
		event_handlers = [
			{
				pad_start
				gh3_start_pressed
			}
		]
		Replace_Handlers}
	SetGlobalTags \{training
		Params = {
			guitar_battle_lesson = Complete
		}}
	training_check_for_all_tutorials_finished
	ui_flow_manager_respond_to_action \{action = complete_tutorial}
endscript
