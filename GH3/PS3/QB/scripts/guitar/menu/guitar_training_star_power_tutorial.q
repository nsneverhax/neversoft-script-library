training_star_power_tutorial_script = [
	{
		call = training_star_power_tutorial_startup
	}
	{
		Time = 100
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
	LaunchEvent \{Type = unfocus
		Target = root_window}
	training_create_narrator_icons
endscript

script training_2_1_show_title 
	training_show_title \{Title = "Star Power Tutorial"}
	begin
	if ($transitions_locked = 0)
		break
	endif
	Wait \{1
		GameFrame}
	repeat
	create_training_pause_handler
	Wait \{3
		Seconds
		IgnoreSlomo}
	training_destroy_title
endscript
LESSON_COMPLETE = 0

script training_2_1_start_gem_scroller 
	destroy_band
	training_start_gem_scroller \{Song = Tutorial_2B}
	if ScreenElementExists \{Id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			Target = menu_tutorial}
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
		Menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
	}
	training_set_lesson_header_text \{Text = "LESSON 1: STAR COMBOS"}
	training_set_lesson_header_body \{Text = "Hit every note in a Star Combo for a Star Power Boost"}
	training_show_lesson_header
	safe_show \{Id = lou_icon}
	Change \{LESSON_COMPLETE = 0}
	Change \{training_received_star_power = 0}
	Change \{NOTES_HIT = 0}
	training_wait_for_gem_scroller_startup
endscript

script training_2_1_explain 
	Wait \{3.5
		Seconds
		IgnoreSlomo}
	training_pause_gem_scroller
	training_play_sound \{Sound = 'Tutorial_2A_01_lou'}
	Wait \{3
		Seconds
		IgnoreSlomo}
	if training_are_notes_flipped
		training_add_arrow \{Id = training_arrow2
			life = 10
			Pos = (735.0, 360.0)
			Scale = 0.7}
	else
		training_add_arrow \{Id = training_arrow2
			life = 10
			Pos = (532.0, 360.0)
			Scale = 0.7}
	endif
	training_wait_for_sound \{Sound = 'Tutorial_2A_01_lou'
		Wait}
	training_set_task_header_body \{Text = "Nail the Star Combo to continue"}
	training_show_task_header
	Wait \{2
		Seconds
		IgnoreSlomo}
	training_resume_gem_scroller
endscript
training_received_star_power = 0

script hit_star_power_sequence 
	Printf \{Channel = training
		"hit_star_power_sequence............."}
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
		GameFrame}
	repeat
endscript

script training_2_1_lesson_complete 
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	Wait \{0.75
		Seconds
		IgnoreSlomo}
	StopAllSounds
	PauseGame
	PauseGH3Sounds
	training_hide_lesson_header
	training_hide_task_header
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
	UnPauseGH3Sounds
	UnPauseGame
	SoundEvent \{Event = Tutorial_Mode_Finish_Chord_02}
	Wait \{2
		Seconds
		IgnoreSlomo}
	Safe_Destroy \{Id = tuning_complete_text}
endscript

script training_2_2_start_gem_scroller 
	destroy_band
	training_start_gem_scroller \{Song = Tutorial_2B}
	if ScreenElementExists \{Id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			Target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{song_wonp1 training_song_won}
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
	training_wait_for_gem_scroller_startup
endscript

script training_create_whammy_sprites 
	whammy_pos = (666.0, 416.0)
	whammy_scale = (0.7, 0.7)
	Z = 21
	CreateScreenElement {
		PARENT = training_container
		Type = SpriteElement
		Id = guitar_whammy_up
		just = [Center Center]
		texture = training_whammy_up
		Pos = <whammy_pos>
		Rot_Angle = 0
		rgba = [255 255 255 255]
		Scale = <whammy_scale>
		z_priority = <Z>
	}
	CreateScreenElement {
		PARENT = training_container
		Type = SpriteElement
		Id = guitar_whammy_down
		just = [Center Center]
		texture = training_whammy_down
		Pos = <whammy_pos>
		Rot_Angle = 0
		rgba = [255 255 255 255]
		Scale = <whammy_scale>
		z_priority = <Z>
	}
	CreateScreenElement {
		PARENT = training_container
		Type = SpriteElement
		Id = guitar_whammy_turn1
		just = [Center Center]
		texture = training_whammy_turn1
		Pos = <whammy_pos>
		Rot_Angle = 0
		rgba = [255 255 255 255]
		Scale = <whammy_scale>
		z_priority = <Z>
	}
	CreateScreenElement {
		PARENT = training_container
		Type = SpriteElement
		Id = guitar_whammy_turn2
		just = [Center Center]
		texture = training_whammy_turn2
		Pos = <whammy_pos>
		Rot_Angle = 0
		rgba = [255 255 255 255]
		Scale = <whammy_scale>
		z_priority = <Z>
	}
	safe_hide \{Id = guitar_whammy_down}
	safe_hide \{Id = guitar_whammy_turn1}
	safe_hide \{Id = guitar_whammy_turn2}
endscript

script training_create_whammy_arrows 
	whammy_pos = (616.0, 356.0)
	whammy_scale = (0.7, 0.7)
	Z = 21
	CreateScreenElement {
		PARENT = training_container
		Type = SpriteElement
		Id = guitar_whammy_up_arrow
		just = [Center Center]
		texture = training_arrow_green_wham_start
		Pos = <whammy_pos>
		Rot_Angle = 0
		rgba = [255 255 255 255]
		Scale = <whammy_scale>
		z_priority = <Z>
	}
	CreateScreenElement {
		PARENT = training_container
		Type = SpriteElement
		Id = guitar_whammy_down_arrow
		just = [Center Center]
		texture = training_arrow_green_wham_end
		Pos = <whammy_pos>
		Rot_Angle = 0
		rgba = [255 255 255 255]
		Scale = <whammy_scale>
		z_priority = <Z>
	}
	whammy_pos = (671.0, 366.0)
	CreateScreenElement {
		PARENT = training_container
		Type = SpriteElement
		Id = training_arrow_red_start
		just = [Center Center]
		texture = training_arrow_red_wham_start
		Pos = <whammy_pos>
		Rot_Angle = 0
		rgba = [255 255 255 255]
		Scale = <whammy_scale>
		z_priority = <Z>
	}
	CreateScreenElement {
		PARENT = training_container
		Type = SpriteElement
		Id = training_arrow_red_middle
		just = [Center Center]
		texture = training_arrow_red_wham_middle
		Pos = <whammy_pos>
		Rot_Angle = 0
		rgba = [255 255 255 255]
		Scale = <whammy_scale>
		z_priority = <Z>
	}
	CreateScreenElement {
		PARENT = training_container
		Type = SpriteElement
		Id = training_arrow_red_end
		just = [Center Center]
		texture = training_arrow_red_wham_end
		Pos = <whammy_pos>
		Rot_Angle = 0
		rgba = [255 255 255 255]
		Scale = <whammy_scale>
		z_priority = <Z>
	}
	safe_hide \{Id = guitar_whammy_up_arrow}
	safe_hide \{Id = guitar_whammy_down_arrow}
	safe_hide \{Id = training_arrow_red_start}
	safe_hide \{Id = training_arrow_red_middle}
	safe_hide \{Id = training_arrow_red_end}
endscript

script training_2_2_show_whammy 
	Wait \{1
		Seconds
		IgnoreSlomo}
	training_pause_gem_scroller
	training_set_lesson_header_text \{Text = "LESSON 2: WHAMMY BAR"}
	training_set_lesson_header_body \{Text = ""}
	training_show_lesson_header
	safe_show \{Id = lou_icon}
	CreateScreenElement \{PARENT = training_container
		Type = SpriteElement
		Id = guitar_sprite
		just = [
			Center
			Center
		]
		texture = training_guitar_angle
		Pos = (300.0, 350.0)
		Rot_Angle = 0
		rgba = [
			255
			255
			255
			255
		]
		Scale = (0.6, 0.6)
		z_priority = 20}
	training_create_whammy_sprites
	training_create_whammy_arrows
	training_add_arrow \{Id = training_whammy_indicator
		life = 7
		Pos = (685.0, 350.0)
		Scale = 0.7
		Z = 60}
	training_play_sound \{Sound = 'Tutorial_2B_01_lou'}
	Wait \{7
		Seconds
		IgnoreSlomo}
	training_2_2_animate_whammy_turn
	Wait \{10
		Seconds
		IgnoreSlomo}
	training_2_2_animate_whammy_up_down
	Wait \{2
		Seconds
		IgnoreSlomo}
	training_wait_for_sound \{Sound = 'Tutorial_2B_01_lou'}
	training_2_2_destroy_sprites
	training_set_lesson_header_body \{Text = "After playing a note, move the whammy bar in and out to extract Star Power"}
	training_show_lesson_header
	training_set_task_header_body \{Text = "Boost the Star Power meter to continue"}
	training_show_task_header
	training_play_sound \{Sound = 'Tutorial_2B_02_lou'
		Wait}
	training_resume_gem_scroller
endscript

script training_2_2_animate_whammy_up_down 
	safe_show \{Id = guitar_whammy_up_arrow}
	Wait \{0.75
		Seconds
		IgnoreSlomo}
	safe_hide \{Id = guitar_whammy_up_arrow}
	begin
	safe_show \{Id = guitar_whammy_down_arrow}
	safe_hide \{Id = guitar_whammy_up}
	safe_show \{Id = guitar_whammy_down}
	Wait \{0.75
		Seconds
		IgnoreSlomo}
	safe_hide \{Id = guitar_whammy_down_arrow}
	safe_show \{Id = guitar_whammy_up_arrow}
	safe_hide \{Id = guitar_whammy_down}
	safe_show \{Id = guitar_whammy_up}
	Wait \{0.75
		Seconds
		IgnoreSlomo}
	safe_hide \{Id = guitar_whammy_up_arrow}
	repeat 2
endscript

script training_2_2_animate_whammy_turn 
	safe_show \{Id = training_arrow_red_start}
	Wait \{0.75
		Seconds
		IgnoreSlomo}
	safe_hide \{Id = training_arrow_red_start}
	begin
	safe_show \{Id = training_arrow_red_middle}
	safe_hide \{Id = guitar_whammy_up}
	safe_show \{Id = guitar_whammy_turn1}
	Wait \{0.75
		Seconds
		IgnoreSlomo}
	safe_hide \{Id = training_arrow_red_middle}
	safe_show \{Id = training_arrow_red_end}
	safe_hide \{Id = guitar_whammy_turn1}
	safe_show \{Id = guitar_whammy_turn2}
	Wait \{0.75
		Seconds
		IgnoreSlomo}
	safe_hide \{Id = training_arrow_red_end}
	safe_show \{Id = training_arrow_red_middle}
	safe_hide \{Id = guitar_whammy_turn2}
	safe_show \{Id = guitar_whammy_turn1}
	Wait \{0.75
		Seconds
		IgnoreSlomo}
	safe_hide \{Id = training_arrow_red_middle}
	safe_show \{Id = training_arrow_red_start}
	safe_hide \{Id = guitar_whammy_turn1}
	safe_show \{Id = guitar_whammy_up}
	Wait \{0.75
		Seconds
		IgnoreSlomo}
	safe_hide \{Id = training_arrow_red_start}
	repeat 2
endscript

script training_2_2_destroy_sprites 
	Safe_Destroy \{Id = guitar_sprite}
	Safe_Destroy \{Id = guitar_whammy_up}
	Safe_Destroy \{Id = guitar_whammy_down}
	Safe_Destroy \{Id = guitar_whammy_turn1}
	Safe_Destroy \{Id = guitar_whammy_turn2}
	Safe_Destroy \{Id = guitar_whammy_up_arrow}
	Safe_Destroy \{Id = guitar_whammy_down_arrow}
	Safe_Destroy \{Id = training_arrow_red_start}
	Safe_Destroy \{Id = training_arrow_red_middle}
	Safe_Destroy \{Id = training_arrow_red_end}
endscript

script training_2_2_watch_for_star_power 
	Change \{LESSON_COMPLETE = 0}
	elapsed_time = 0
	sound_played = FALSE
	begin
	if (<sound_played> = FALSE)
		GetDeltaTime
		elapsed_time = (<elapsed_time> + <delta_time>)
		if (<elapsed_time> > 20.0 && ($player1_status.star_power_amount < 25))
			training_play_sound \{Sound = 'Tutorial_2B_03_lou'}
			sound_played = TRUE
			Printf \{Channel = training
				"playing help sound....."}
		endif
	endif
	if ($player1_status.star_power_amount >= 50.0)
		Printf \{Channel = training
			"star power ready !!!!!!!!!!!!!!"}
		break
	endif
	if ($training_song_over = 1)
		Printf \{Channel = training
			"Song Over! "}
		return
	endif
	Wait \{1
		GameFrame}
	repeat
endscript

script training_2_2_lesson_complete 
	SoundEvent \{Event = Tutorial_Mode_Finish_Chord_02}
	EnableInput OFF controller = ($player1_status.controller)
	Change \{StructureName = player1_status
		star_power_usable = 0}
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	Wait \{0.75
		Seconds}
	StopAllSounds
	PauseGame
	PauseGH3Sounds
	training_hide_lesson_header
	training_hide_task_header
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
	UnPauseGH3Sounds
	UnPauseGame
	Wait \{0.5
		Seconds}
	training_play_sound \{Sound = 'Tutorial_2B_04_Lou'
		Wait}
	Safe_Destroy \{Id = tuning_complete_text}
	Wait \{1
		Seconds}
endscript

script training_2_3_start_gem_scroller 
	destroy_band
	training_start_gem_scroller \{Song = Tutorial_2C}
	if ScreenElementExists \{Id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			Target = menu_tutorial}
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
		Menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
	}
	training_set_lesson_header_text \{Text = "LESSON 3: TILT FOR STAR POWER"}
	training_set_lesson_header_body \{Text = ""}
	training_show_lesson_header
	safe_show \{Id = lou_icon}
	Change \{training_received_star_power = 0}
	Change \{NOTES_HIT = 0}
	Change \{StructureName = player1_status
		star_power_amount = 0}
	Change \{LESSON_COMPLETE = 0}
	training_wait_for_gem_scroller_startup
endscript

script training_2_3_explain 
	Wait \{2.0
		Seconds
		IgnoreSlomo}
	training_pause_gem_scroller
	training_play_sound \{Sound = 'Tutorial_2C_01_lou'}
	training_add_arrow \{Id = training_arrow2
		life = 6
		Pos = (970.0, 430.0)
		Scale = 0.7
		rot = 0}
	Wait \{7.0
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
		Pos = (630.0, 400.0)
		Rot_Angle = 45
		rgba = [
			255
			255
			255
			255
		]
		Scale = (0.8, 0.8)
		z_priority = 4}
	Wait \{0.5
		Seconds
		IgnoreSlomo}
	DoScreenElementMorph \{Id = guitar_sprite
		Rot_Angle = 0
		Time = 1.0}
	Wait \{3.75
		Seconds
		IgnoreSlomo}
	safe_hide \{Id = guitar_sprite}
	DoScreenElementMorph \{Id = guitar_sprite
		Rot_Angle = 45
		Time = 0.0}
	Wait \{10.0
		Seconds
		IgnoreSlomo}
	safe_show \{Id = guitar_sprite}
	Wait \{1.5
		Seconds
		IgnoreSlomo}
	DoScreenElementMorph \{Id = guitar_sprite
		Rot_Angle = 0
		Time = 1.0}
	training_wait_for_sound \{Sound = 'Tutorial_2C_01_lou'}
	training_set_lesson_header_body \{Text = "Tilt the guitar upright to activate star power.\\nOnce it is activated, you can drop it back down"}
	training_show_lesson_header
	training_set_task_header_body \{Text = "Tilt for Star Power and hit 8 notes to continue"}
	training_show_task_header
	training_2_3_destroy_sprites
	training_resume_gem_scroller
endscript
training_star_power_active = 0

script training_set_star_power_active 
	Change \{training_star_power_active = 1}
endscript

script training_2_3_wait_for_star_power 
	Change \{training_star_power_active = 0}
	Change \{LESSON_COMPLETE = 0}
	Change \{training_song_over = 0}
	EnableInput controller = ($player1_status.controller)
	Change \{StructureName = player1_status
		star_power_usable = 1}
	increase_star_power \{Amount = 100}
	begin
	if ($training_song_over = 1)
		return
	endif
	if ($training_star_power_active = 1 || $player1_status.star_power_used = 1)
		break
	endif
	Wait \{1
		GameFrame}
	repeat
endscript

script training_2_3_watch_for_notes_hit 
	Change \{NOTES_HIT = 0}
	if ScreenElementExists \{Id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			Target = menu_tutorial}
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
		Menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
	}
	begin
	Printf \{Channel = training
		"notes hit %a "
		A = $NOTES_HIT}
	Change \{StructureName = player1_status
		star_power_amount = 100}
	if ($training_song_over = 1)
		Printf \{Channel = training
			"done! "}
		return
	endif
	if ($NOTES_HIT >= 8)
		Printf \{Channel = training
			"done! "}
		return
	endif
	Wait \{1
		GameFrame}
	repeat
endscript

script training_set_lesson_complete 
	Printf \{Channel = training
		"setting lesson complete................."}
	Change \{LESSON_COMPLETE = 1}
endscript

script training_2_tutorial_complete_message 
	SoundEvent \{Event = Tutorial_Mode_Finish_Chord}
	training_hide_lesson_header
	training_hide_task_header
	safe_hide \{Id = lou_icon}
	CreateScreenElement {
		Type = TextElement
		PARENT = training_container
		Id = lesson_complete_text
		just = [Center Center]
		Pos = (640.0, 350.0)
		font = ($training_font)
		Text = "Star Power Tutorial Complete!"
		Scale = 1.0
		rgba = ($training_text_color)
	}
	safe_show \{Id = god_icon}
	training_play_sound \{Sound = 'Tutorial_2C_02_god'
		Wait}
	safe_hide \{Id = god_icon}
	DestroyScreenElement \{Id = lesson_complete_text}
endscript

script training_2_3_destroy_sprites 
	Safe_Destroy \{Id = guitar_sprite}
endscript

script training_2_3_end 
	Printf \{Channel = training
		"training_2_3_end........."}
	Wait \{1
		Seconds
		IgnoreSlomo}
	training_2_3_destroy_sprites
	if ScreenElementExists \{Id = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
		create_training_pause_handler
	endif
	if ScreenElementExists \{Id = notes_hit_text}
		DestroyScreenElement \{Id = notes_hit_text}
	endif
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
endscript

script training_2_end 
	training_kill_session
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
			star_power_lesson = Complete
		}}
	training_check_for_all_tutorials_finished
	ui_flow_manager_respond_to_action \{action = complete_tutorial}
endscript

script lesson2_hit_note 
	Change NOTES_HIT = ($NOTES_HIT + 1)
	if (($NOTES_HIT = 1) || ($NOTES_HIT = 4))
		GetRandomValue \{Name = random_value
			A = 0
			B = 10}
		if (<random_value> < 5)
			training_play_sound \{Sound = 'Tutorial_God_Positive_01'}
		elseif (<random_value> < 10)
			training_play_sound \{Sound = 'Tutorial_God_Positive_02'}
		endif
	endif
	training_display_notes_hit \{NOTES_HIT = $NOTES_HIT}
endscript
