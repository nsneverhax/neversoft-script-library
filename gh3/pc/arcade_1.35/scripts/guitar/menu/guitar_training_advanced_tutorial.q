training_advanced_techniques_tutorial_script = [
	{
		call = training_advanced_techniques_tutorial_startup
	}
	{
		lesson = 1
		call = training_4_1_show_title
	}
	{
		call = training_4_1_explain
	}
	{
		lesson = 2
		call = training_4_2_explain
	}
	{
		call = training_4_2_show_guitar
	}
	{
		call = training_4_2_zoom_guitar
	}
	{
		call = training_4_2_wait_for_hammeron_complete
	}
	{
		call = training_4_2_complete_message
	}
	{
		call = training_4_2_end
	}
	{
		lesson = 3
		call = training_4_3_start_gem_scroller
	}
	{
		call = training_4_3_explain
	}
	{
		call = training_4_3_wait_for_hammerons
	}
	{
		call = training_4_3_complete_message
	}
	{
		lesson = 4
		call = training_4_4_explain
	}
	{
		call = training_4_4_show_guitar
	}
	{
		call = training_4_4_zoom_guitar
	}
	{
		call = training_4_4_wait_for_pulloff_complete
	}
	{
		call = training_4_4_complete_message
	}
	{
		call = training_4_4_end
	}
	{
		lesson = 5
		call = training_4_5_start_gem_scroller
	}
	{
		call = training_4_5_explain
	}
	{
		call = training_4_5_wait_for_hammerons
	}
	{
		call = training_4_5_complete_message
	}
	{
		call = training_advanced_techniques_tutorial_1_end
	}
]

script training_advanced_techniques_tutorial_startup 
	training_init_session
	LaunchEvent \{Type = unfocus
		target = root_window}
	training_create_narrator_icons
endscript

script training_4_1_show_title 
	training_show_title \{title = "Hammer-On and Pull-Off Tutorial"}
	begin
	if ($transitions_locked = 0)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	create_training_pause_handler
	Wait \{3
		Seconds}
	training_destroy_title
endscript

script training_4_1_explain 
	training_set_lesson_header_text \{text = "LESSON 1: STRING BASICS"}
	training_set_lesson_header_body \{text = ""}
	training_show_lesson_header
	safe_show \{id = god_icon}
	training_play_sound \{Sound = 'Tutorial_4A_01_God'
		Wait}
endscript

script training_4_2_explain 
	training_set_lesson_header_text \{text = "LESSON 2: HAMMER-ON FINGERING"}
	training_set_lesson_header_body \{text = ""}
	training_show_lesson_header
endscript

script training_4_2_show_guitar 
	CreateScreenElement \{parent = training_container
		Type = SpriteElement
		id = guitar_sprite
		just = [
			center
			center
		]
		texture = training_guitar
		Pos = (630.0, 400.0)
		rot_angle = 0
		rgba = [
			255
			255
			255
			255
		]
		Scale = (0.4, 0.4)
		z_priority = 4}
	training_create_fret_finger_sprites
	pose_fret_fingers \{Color = None}
	training_create_strum_sprites
	pose_strum_fingers \{Pos = middle}
	training_play_sound \{Sound = 'Tutorial_4B_01_God'}
	Wait \{20
		Seconds
		ignoreslomo}
	training_add_arrow \{id = training_arrow
		life = 6.15
		Pos = (360.0, 360.0)
		Scale = 0.7}
	training_add_arrow \{id = training_strum_arrow
		life = 4.0
		Pos = (850.0, 360.0)
		Scale = 0.7}
	pose_fret_fingers \{Color = green}
	Wait \{1.0
		Seconds
		ignoreslomo}
	pose_strum_fingers \{Pos = down}
	Wait \{1.0
		Seconds
		ignoreslomo}
	pose_strum_fingers \{Pos = middle}
	Wait \{4.2
		Seconds
		ignoreslomo}
	training_add_arrow \{id = training_arrow
		life = 5.0
		Pos = (385.0, 360.0)
		Scale = 0.7}
	pose_fret_fingers \{Color = green_red}
	Wait \{5
		Seconds
		ignoreslomo}
	training_add_arrow \{id = training_arrow
		life = 5.0
		Pos = (420.0, 360.0)
		Scale = 0.7}
	pose_fret_fingers \{Color = green_red_yellow}
	training_wait_for_sound \{Sound = 'Tutorial_4B_01_God'}
endscript

script training_4_2_zoom_guitar 
	training_set_lesson_header_body \{text = "1. Play Green normally (strum)\\n2. Hammer-on Red (no strum)\\n3. Hammer-on Yellow (no strum)"}
	training_show_lesson_header
	training_set_task_header_body \{text = "Hit 3 hammer-on sequences to continue"}
	training_show_task_header
	hide_strum_fingers
	hide_fret_fingers
	if ScreenElementExists \{id = guitar_sprite}
		guitar_sprite :DoMorph \{Scale = (1.0, 1.0)
			Pos = (1100.0, 400.0)
			time = 0.75}
	endif
	training_play_sound \{Sound = 'Tutorial_4B_02_God'}
	Wait \{1
		Seconds
		ignoreslomo}
	SetMenuAutoRepeatTimes \{(60.0, 60.0)}
endscript

script training_4_2_wait_for_hammeron_complete 
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{pad_up training_hammeron_strummed_guitar}
		{pad_down training_hammeron_strummed_guitar}
		{pad_start show_training_pause_screen}
	]
	new_menu {
		scrollid = menu_tutorial
		vmenuid = vmenu_tutorial
		menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
	}
	Change \{lesson_complete = 0}
	Change \{training_hammerons_played = 0}
	SpawnScriptNow \{training_watch_buttons
		id = training_spawned_script}
	begin
	if ($lesson_complete = 1)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
		create_training_pause_handler
	endif
	KillSpawnedScript \{Name = training_watch_buttons}
	hide_pressed_notes
	SetMenuAutoRepeatTimes \{(0.3, 0.05)}
	Wait \{1
		Seconds
		ignoreslomo}
endscript

script training_hammeron_strummed_guitar 
	if ($lesson_complete = 1)
		return
	endif
	printf \{channel = hammeron
		"Strummed guitar........."}
	KillSpawnedScript \{Name = training_watch_for_hammeron}
	SpawnScriptNow \{training_watch_for_hammeron
		id = training_spawned_script}
endscript

script training_count_buttons_pressed 
	GetHeldPattern controller = ($player1_status.controller) nobrokenstring
	check_button = 65536
	array_count = 0
	note_played = 0
	notes_played = 0
	begin
	if (<hold_pattern> && <check_button>)
		note_played = <array_count>
		notes_played = (<notes_played> + 1)
	endif
	<check_button> = (<check_button> / 16)
	array_count = (<array_count> + 1)
	repeat 5
	return notes_played = <notes_played>
endscript
training_hammerons_played = 0
notes_played = 0

script training_watch_for_hammeron 
	printf \{channel = hammeron
		"training_watch_for_hammeron......"}
	training_clear_notes_pressed
	training_count_buttons_pressed
	if IsSoundEventPlaying \{Tutorial_String_2_HOPO_Free}
		SoundEvent \{event = Tutorial_Missed_HOPO_Free}
		SoundEvent \{event = StopNotes_02}
		SoundEvent \{event = StopNotes_03}
	elseif IsSoundEventPlaying \{Tutorial_String_3_HOPO_Free}
		SoundEvent \{event = Tutorial_Missed_HOPO_Free}
		SoundEvent \{event = StopNotes_03}
		SoundEvent \{event = StopNotes_02}
	endif
	if (<notes_played> != 1)
		if IsSoundEventPlaying \{Tutorial_String_1_Strum_Free}
			SoundEvent \{event = Tutorial_Missed_HOPO_Free}
			SoundEvent \{event = StopNotes_01}
			SoundEvent \{event = StopNotes_03}
			SoundEvent \{event = StopNotes_02}
		endif
		return
	endif
	GetHeldPattern controller = ($player1_status.controller) nobrokenstring
	check_button = 65536
	if (<hold_pattern> && <check_button>)
		training_press_note \{note = 0}
		training_hit_note \{note = 0}
		SoundEvent \{event = Tutorial_String_1_Strum_Free}
		wait_time = 0
		begin
		GetHeldPattern controller = ($player1_status.controller) nobrokenstring
		check_button = 273
		if (<hold_pattern> && <check_button>)
			training_clear_notes_pressed
			printf \{channel = hammeron
				"failed..."}
			SoundEvent \{event = Tutorial_Missed_HOPO_Free}
			SoundEvent \{event = StopNotes_01}
			return
		endif
		check_button = 4096
		if (<hold_pattern> && <check_button>)
			printf \{channel = hammeron
				"red pressed..."}
			break
		endif
		wait_time = (<wait_time> + 1)
		if (<wait_time> >= 60)
			printf \{channel = hammeron
				"times up..."}
			training_clear_notes_pressed
			SoundEvent \{event = Tutorial_Missed_HOPO_Free}
			SoundEvent \{event = StopNotes_01}
			return
		endif
		Wait \{1
			gameframe}
		repeat
		training_press_note \{note = 1}
		training_hit_note \{note = 1}
		SoundEvent \{event = Tutorial_String_2_HOPO_Free}
		SoundEvent \{event = StopNotes_01}
		wait_time = 0
		begin
		GetHeldPattern controller = ($player1_status.controller) nobrokenstring
		check_button = 17
		if (<hold_pattern> && <check_button>)
			training_clear_notes_pressed
			printf \{channel = hammeron
				"failed..."}
			SoundEvent \{event = Tutorial_Missed_HOPO_Free}
			SoundEvent \{event = StopNotes_02}
			return
		endif
		check_button = 256
		if (<hold_pattern> && <check_button>)
			break
		endif
		wait_time = (<wait_time> + 1)
		if (<wait_time> >= 60)
			training_clear_notes_pressed
			SoundEvent \{event = Tutorial_Missed_HOPO_Free}
			SoundEvent \{event = StopNotes_02}
			return
		endif
		Wait \{1
			gameframe}
		repeat
		SoundEvent \{event = Tutorial_String_3_HOPO_Free}
		SoundEvent \{event = StopNotes_02}
		training_press_note \{note = 2}
		training_hit_note \{note = 0}
		training_hit_note \{note = 1}
		training_hit_note \{note = 2}
		Change training_hammerons_played = ($training_hammerons_played + 1)
		if NOT ($training_hammerons_played = 3)
			RandomNoRepeat (
				@ training_play_sound \{Sound = 'Tutorial_God_Positive_02'}
				@ training_play_sound \{Sound = 'Tutorial_God_Positive_04'}
				@ training_play_sound \{Sound = 'Tutorial_God_Positive_05'}
				@ training_play_sound \{Sound = 'Tutorial_God_Positive_06'}
				@ training_play_sound \{Sound = 'Tutorial_God_Positive_09'}
				)
		endif
		if ($training_hammerons_played >= 3)
			Change \{lesson_complete = 1}
		endif
		Wait \{2
			Seconds
			ignoreslomo}
		training_clear_notes_pressed
	endif
endscript

script training_press_note 
	formatText checksumName = note_tuned 'note_tuned_%a' a = <note>
	CreateScreenElement {
		parent = training_container
		Type = SpriteElement
		id = <note_tuned>
		just = [center center]
		texture = training_guitar_button_tuned
		Pos = ((442.0, 396.0) + (1.0, 0.0) * (<note> * 67))
		rot_angle = 0
		rgba = [255 255 255 255]
		Scale = (0.36, 0.36)
		z_priority = 7
	}
endscript

script training_clear_notes_pressed 
	printf \{channel = hammeron
		"training_clear_notes_pressed...."}
	safe_destroy \{id = note_tuned_0}
	safe_destroy \{id = note_tuned_1}
	safe_destroy \{id = note_tuned_2}
endscript

script training_4_2_complete_message 
	SoundEvent \{event = StopNotes_03}
	SoundEvent \{event = Tutorial_Mode_Finish_Chord}
	safe_destroy \{id = guitar_sprite}
	training_destroy_fret_finger_sprites
	training_destory_strum_sprites
	training_hide_lesson_header
	training_hide_task_header
	training_clear_notes_pressed
	training_destroy_pressed_notes
	CreateScreenElement {
		Type = TextElement
		parent = training_container
		id = lesson_title_text
		just = [center center]
		Pos = (640.0, 350.0)
		font = ($training_font)
		text = "Lesson Complete"
		Scale = 1.0
		rgba = ($training_text_color)
	}
	training_play_sound \{Sound = 'Tutorial_4B_03_God'
		Wait}
	DestroyScreenElement \{id = lesson_title_text}
endscript

script training_4_2_end 
	KillSpawnedScript \{Name = training_watch_buttons}
	destroy_menu \{menu_id = menu_tutorial_4_2}
	training_destroy_pressed_notes
	safe_destroy \{id = guitar_sprite}
	training_destroy_fret_finger_sprites
	training_destory_strum_sprites
endscript

script training_4_3_start_gem_scroller 
	destroy_band
	training_set_lesson_header_text \{text = "LESSON 3: HAMMER-ONS"}
	training_set_lesson_header_body \{text = "1.  Practice hammer-ons"}
	training_show_lesson_header
	safe_show \{id = god_icon}
	training_start_gem_scroller \{song = Tutorial_4C}
	KillSpawnedScript \{Name = update_score_fast}
	training_wait_for_gem_scroller_startup
endscript

script training_4_3_explain 
	Wait \{1
		Seconds
		ignoreslomo}
	training_pause_gem_scroller
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{hit_notesp1 lesson4_hammeron_note}
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
	training_play_sound \{Sound = 'Tutorial_4c_01_God'
		Wait}
	training_set_task_header_body \{text = "Hit 8 notes using the hammer-on technique"}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0}
	Wait \{1
		Seconds
		ignoreslomo}
	training_resume_gem_scroller
endscript

script training_4_3_wait_for_hammerons 
	Change \{training_hammerons_played = 0}
	begin
	if ($training_song_over = 1)
		break
	endif
	if ($training_hammerons_played >= 8)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
		create_training_pause_handler
	endif
	Wait \{1
		Seconds
		ignoreslomo}
endscript

script lesson4_hammeron_note 
	if (<hammer_strum> = 1)
		Change training_hammerons_played = ($training_hammerons_played + 1)
		training_display_notes_hit \{notes_hit = $training_hammerons_played}
		if ($training_hammerons_played = 1)
			training_play_sound \{Sound = 'Tutorial_God_Positive_07'}
		endif
	endif
endscript

script training_4_3_complete_message 
	if ScreenElementExists \{id = notes_hit_text}
		DestroyScreenElement \{id = notes_hit_text}
	endif
	Wait \{0.75
		Seconds
		ignoreslomo}
	SoundEvent \{event = Tutorial_Mode_Finish_Chord}
	training_hide_lesson_header
	training_hide_task_header
	PauseGame
	PauseGh3Sounds
	KillCamAnim \{Name = ch_view_cam}
	kill_gem_scroller
	destroy_bg_viewport
	setup_bg_viewport
	PlayIGCCam \{id = cs_view_cam_id
		Name = ch_view_cam
		viewport = bg_viewport
		LockTo = World
		Pos = (-0.068807, 1.5990009, 5.7975965)
		Quat = (0.000506, 0.99942994, -0.017537998)
		FOV = 72.0
		play_hold = 1
		interrupt_current}
	CreateScreenElement {
		Type = TextElement
		parent = training_container
		id = lesson_title_text
		just = [center center]
		Pos = (640.0, 350.0)
		font = ($training_font)
		text = "Lesson Complete"
		Scale = 1.0
		rgba = ($training_text_color)
	}
	UnPauseGame
	UnPauseGh3Sounds
	training_play_sound \{Sound = 'Tutorial_4B_03_God'
		Wait}
	safe_hide \{id = god_icon}
	safe_destroy \{id = lesson_title_text}
endscript

script training_4_4_explain 
	training_set_lesson_header_text \{text = "LESSON 4: PULL-OFF FINGERING"}
	training_set_lesson_header_body \{text = ""}
	training_show_lesson_header
	safe_show \{id = lou_icon}
endscript

script training_4_4_show_guitar 
	CreateScreenElement \{parent = training_container
		Type = SpriteElement
		id = guitar_sprite
		just = [
			center
			center
		]
		texture = training_guitar
		Pos = (630.0, 400.0)
		rot_angle = 0
		rgba = [
			255
			255
			255
			255
		]
		Scale = (0.4, 0.4)
		z_priority = 4}
	training_create_fret_finger_sprites
	pose_fret_fingers \{Color = None}
	training_create_strum_sprites
	pose_strum_fingers \{Pos = middle}
	training_play_sound \{Sound = 'Tutorial_4d_01_Lou'}
	Wait \{15
		Seconds
		ignoreslomo}
	training_add_arrow \{id = training_arrow
		life = 4.9500003
		Pos = (420.0, 360.0)
		Scale = 0.7}
	training_add_arrow \{id = training_strum_arrow
		life = 3.5
		Pos = (850.0, 360.0)
		Scale = 0.7}
	pose_fret_fingers \{Color = yellow}
	Wait \{1.0
		Seconds
		ignoreslomo}
	pose_strum_fingers \{Pos = down}
	Wait \{1.0
		Seconds
		ignoreslomo}
	pose_strum_fingers \{Pos = middle}
	Wait \{3
		Seconds
		ignoreslomo}
	training_add_arrow \{id = training_arrow
		life = 6.0
		Pos = (385.0, 360.0)
		Scale = 0.7}
	pose_fret_fingers \{Color = red}
	Wait \{6
		Seconds
		ignoreslomo}
	training_add_arrow \{id = training_arrow
		life = 4.0
		Pos = (360.0, 360.0)
		Scale = 0.7}
	pose_fret_fingers \{Color = green}
	Wait \{7
		Seconds
		ignoreslomo}
	training_add_arrow \{id = training_arrow
		life = 4.9500003
		Pos = (420.0, 360.0)
		Scale = 0.7}
	training_add_arrow \{id = training_strum_arrow
		life = 4.5
		Pos = (850.0, 360.0)
		Scale = 0.7}
	pose_fret_fingers \{Color = green_red_yellow}
	Wait \{3.0
		Seconds
		ignoreslomo}
	pose_strum_fingers \{Pos = down}
	Wait \{1.0
		Seconds
		ignoreslomo}
	pose_strum_fingers \{Pos = middle}
	Wait \{1
		Seconds
		ignoreslomo}
	training_add_arrow \{id = training_arrow
		life = 2.0
		Pos = (385.0, 360.0)
		Scale = 0.7}
	pose_fret_fingers \{Color = green_red}
	Wait \{2
		Seconds
		ignoreslomo}
	training_add_arrow \{id = training_arrow
		life = 3.0
		Pos = (360.0, 360.0)
		Scale = 0.7}
	pose_fret_fingers \{Color = green}
	Wait \{3
		Seconds
		ignoreslomo}
	training_wait_for_sound \{Sound = 'Tutorial_4d_01_Lou'}
endscript

script training_4_4_zoom_guitar 
	training_set_lesson_header_body \{text = "1. Play Yellow normally (strum)\\n2. Pull-off Red (no strum)\\n3. Pull-off Green (no strum)"}
	training_show_lesson_header
	training_set_task_header_body \{text = "Hit 3 pull-off sequences to continue"}
	training_show_task_header
	hide_strum_fingers
	hide_fret_fingers
	if ScreenElementExists \{id = guitar_sprite}
		guitar_sprite :DoMorph \{Scale = (1.0, 1.0)
			Pos = (1100.0, 400.0)
			time = 0.75}
	endif
	Wait \{1
		Seconds
		ignoreslomo}
endscript
training_pulloffs_played = 0

script training_4_4_wait_for_pulloff_complete 
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	printf \{channel = hammeron
		"training_4_2_wait_for_pullofff_complete..."}
	event_handlers = [
		{pad_up training_pulloff_strummed_guitar}
		{pad_down training_pulloff_strummed_guitar}
		{pad_start show_training_pause_screen}
	]
	new_menu {
		scrollid = menu_tutorial
		vmenuid = vmenu_tutorial
		menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
	}
	Change \{lesson_complete = 0}
	Change \{training_pulloffs_played = 0}
	Change \{notes_played = 0}
	SetMenuAutoRepeatTimes \{(60.0, 60.0)}
	SpawnScriptNow \{training_watch_buttons
		id = training_spawned_script}
	begin
	if ($lesson_complete = 1)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	LaunchEvent \{Type = unfocus
		target = menu_tutorial}
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	KillSpawnedScript \{Name = training_watch_buttons}
	hide_pressed_notes
	SetMenuAutoRepeatTimes \{(0.3, 0.05)}
	Wait \{1
		Seconds
		ignoreslomo}
	safe_destroy \{id = guitar_sprite}
	training_destroy_fret_finger_sprites
	training_destory_strum_sprites
endscript

script training_pulloff_strummed_guitar 
	if ($lesson_complete = 1)
		return
	endif
	KillSpawnedScript \{Name = training_watch_for_pulloff}
	SpawnScriptNow \{training_watch_for_pulloff
		id = training_spawned_script}
endscript

script training_watch_for_pulloff 
	printf \{channel = hammeron
		"training_watch_for_pulloff......"}
	training_clear_notes_pressed
	training_count_buttons_pressed
	if IsSoundEventPlaying \{Tutorial_String_2_HOPO_Free}
		SoundEvent \{event = Tutorial_Missed_HOPO_Free}
		SoundEvent \{event = StopNotes_05}
		SoundEvent \{event = StopNotes_06}
	elseif IsSoundEventPlaying \{Tutorial_String_3_HOPO_Free}
		SoundEvent \{event = Tutorial_Missed_HOPO_Free}
		SoundEvent \{event = StopNotes_06}
		SoundEvent \{event = StopNotes_05}
	endif
	if NOT training_wait_for_pulloff_color \{Color = yellow
			immediate}
		if IsSoundEventPlaying \{Tutorial_String_3_Strum_Free}
			SoundEvent \{event = Tutorial_Missed_HOPO_Free}
			SoundEvent \{event = StopNotes_04}
			SoundEvent \{event = StopNotes_05}
			SoundEvent \{event = StopNotes_06}
		endif
		return
	endif
	training_press_note \{note = 2}
	training_hit_note \{note = 2}
	SoundEvent \{event = Tutorial_String_3_Strum_Free}
	if NOT training_wait_for_pulloff_color \{Color = yellow
			Released}
		SoundEvent \{event = Tutorial_Missed_HOPO_Free}
		SoundEvent \{event = StopNotes_04}
		training_clear_notes_pressed
		return
	endif
	if NOT training_wait_for_pulloff_color \{Color = red}
		SoundEvent \{event = Tutorial_Missed_HOPO_Free}
		SoundEvent \{event = StopNotes_04}
		training_clear_notes_pressed
		return
	endif
	training_press_note \{note = 1}
	training_hit_note \{note = 1}
	SoundEvent \{event = Tutorial_String_2_HOPO_Free}
	SoundEvent \{event = StopNotes_04}
	if NOT training_wait_for_pulloff_color \{Color = red
			Released}
		SoundEvent \{event = Tutorial_Missed_HOPO_Free}
		SoundEvent \{event = StopNotes_05}
		training_clear_notes_pressed
		return
	endif
	if NOT training_wait_for_pulloff_color \{Color = green}
		SoundEvent \{event = Tutorial_Missed_HOPO_Free}
		SoundEvent \{event = StopNotes_05}
		training_clear_notes_pressed
		return
	endif
	training_press_note \{note = 0}
	training_hit_note \{note = 0}
	training_hit_note \{note = 1}
	training_hit_note \{note = 2}
	SoundEvent \{event = Tutorial_String_1_HOPO_Free}
	SoundEvent \{event = StopNotes_05}
	Change training_pulloffs_played = ($training_pulloffs_played + 1)
	if NOT ($training_pulloffs_played = 3)
		RandomNoRepeat (
			@ training_play_sound \{Sound = 'Tutorial_Lou_Positive_02'}
			@ training_play_sound \{Sound = 'Tutorial_Lou_Positive_03'}
			@ training_play_sound \{Sound = 'Tutorial_Lou_Positive_04'}
			@ training_play_sound \{Sound = 'Tutorial_Lou_Positive_06'}
			@ training_play_sound \{Sound = 'Tutorial_Lou_Positive_07'}
			)
	endif
	if ($training_pulloffs_played >= 3)
		Change \{lesson_complete = 1}
	endif
	Wait \{2
		Seconds
		ignoreslomo}
	training_clear_notes_pressed
endscript

script training_wait_for_pulloff_color 
	switch (<Color>)
		case yellow
		button_mask = 256
		maybe_dont_allow = 69632
		dont_allow_mask = 17
		case red
		button_mask = 4096
		maybe_dont_allow = 65536
		dont_allow_mask = 273
		case green
		button_mask = 65536
		maybe_dont_allow = 0
		dont_allow_mask = 4369
	endswitch
	if GotParam \{release}
		max_time = 30
	else
		max_time = 60
	endif
	wait_time = 0
	begin
	GetHeldPattern controller = ($player1_status.controller) nobrokenstring
	if (<hold_pattern> && <dont_allow_mask>)
		return \{FALSE}
	endif
	if GotParam \{Released}
		if NOT (<hold_pattern> && <button_mask>)
			break
		endif
	else
		if (<hold_pattern> && <button_mask>)
			break
		else
			if (<hold_pattern> && <maybe_dont_allow>)
				return \{FALSE}
			endif
			if GotParam \{immediate}
				return \{FALSE}
			endif
		endif
	endif
	wait_time = (<wait_time> + 1)
	if (<wait_time> >= <max_time>)
		return \{FALSE}
	endif
	Wait \{1
		gameframe}
	repeat
	return \{true}
endscript

script training_4_4_complete_message 
	SoundEvent \{event = Tutorial_Mode_Finish_Chord}
	SoundEvent \{event = StopNotes_06}
	safe_destroy \{id = guitar_sprite}
	training_hide_lesson_header
	training_hide_task_header
	training_clear_notes_pressed
	training_destroy_pressed_notes
	CreateScreenElement {
		Type = TextElement
		parent = training_container
		id = lesson_title_text
		just = [center center]
		Pos = (640.0, 350.0)
		font = ($training_font)
		text = "Lesson Complete"
		Scale = 1.0
		rgba = ($training_text_color)
	}
	training_play_sound \{Sound = 'Tutorial_4D_02_Lou'
		Wait}
	DestroyScreenElement \{id = lesson_title_text}
endscript

script training_4_4_end 
	KillSpawnedScript \{Name = training_watch_buttons}
	safe_destroy \{id = guitar_sprite}
	training_destroy_pressed_notes
	training_destroy_fret_finger_sprites
	training_destory_strum_sprites
endscript

script training_4_5_start_gem_scroller 
	destroy_band
	training_set_lesson_header_text \{text = "LESSON 5: PULL-OFFS"}
	training_set_lesson_header_body \{text = ""}
	training_show_lesson_header
	safe_show \{id = lou_icon}
	training_start_gem_scroller \{song = Tutorial_4E}
	KillSpawnedScript \{Name = update_score_fast}
	Change \{training_pulloffs_played = 0}
	training_wait_for_gem_scroller_startup
endscript

script training_4_5_explain 
	Wait \{1
		Seconds
		ignoreslomo}
	training_pause_gem_scroller
	training_set_lesson_header_body \{text = "1. Practice pull-offs"}
	training_show_lesson_header
	training_set_task_header_body \{text = "Hit 8 notes using pull-offs to continue"}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0}
	training_play_sound \{Sound = 'Tutorial_4e_01_Lou'
		Wait}
	training_resume_gem_scroller
endscript

script training_4_5_wait_for_hammerons 
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{hit_notesp1 lesson5_pulloff_note}
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
	Change \{training_pulloffs_played = 0}
	Change \{training_song_over = 0}
	begin
	if ($training_song_over = 1)
		break
	endif
	if ($training_pulloffs_played >= 8)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
		create_training_pause_handler
	endif
	Wait \{1
		Seconds
		ignoreslomo}
endscript

script lesson5_pulloff_note 
	if (<hammer_strum> = 1)
		Change training_pulloffs_played = ($training_pulloffs_played + 1)
		training_display_notes_hit \{notes_hit = $training_pulloffs_played}
		if ($training_pulloffs_played = 1)
			training_play_sound \{Sound = 'Tutorial_Lou_Positive_05'}
		endif
	endif
endscript

script training_4_5_complete_message 
	if ScreenElementExists \{id = notes_hit_text}
		DestroyScreenElement \{id = notes_hit_text}
	endif
	Wait \{0.75
		Seconds
		ignoreslomo}
	SoundEvent \{event = Tutorial_Mode_Finish_Chord}
	training_hide_lesson_header
	training_hide_task_header
	PauseGame
	PauseGh3Sounds
	KillCamAnim \{Name = ch_view_cam}
	kill_gem_scroller
	destroy_bg_viewport
	setup_bg_viewport
	PlayIGCCam \{id = cs_view_cam_id
		Name = ch_view_cam
		viewport = bg_viewport
		LockTo = World
		Pos = (-0.068807, 1.5990009, 5.7975965)
		Quat = (0.000506, 0.99942994, -0.017537998)
		FOV = 72.0
		play_hold = 1
		interrupt_current}
	CreateScreenElement {
		Type = TextElement
		parent = training_container
		id = lesson_title_text
		just = [center center]
		Pos = (640.0, 350.0)
		font = ($training_font)
		text = "Lesson Complete"
		Scale = 1.0
		rgba = ($training_text_color)
	}
	UnPauseGh3Sounds
	UnPauseGame
	training_play_sound \{Sound = 'Tutorial_4e_02_Lou'
		Wait}
	DestroyScreenElement \{id = lesson_title_text}
	CreateScreenElement {
		Type = TextElement
		parent = training_container
		id = lesson_title_text
		just = [center center]
		Pos = (640.0, 350.0)
		font = ($training_font)
		text = "Advanced Techniques Tutorial Complete!"
		Scale = 1.0
		rgba = ($training_text_color)
	}
	safe_hide \{id = lou_icon}
	training_play_sound \{Sound = 'Tutorial_4_Outro'
		Wait}
	DestroyScreenElement \{id = lesson_title_text}
endscript
training_song_over = 0

script training_song_won 
	Change \{training_song_over = 1}
	show_training_pause_screen \{songfailed}
endscript

script training_advanced_techniques_tutorial_1_end 
	training_kill_session
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
	SetGlobalTags \{training
		params = {
			advanced_techniques_lesson = complete
		}}
	training_check_for_all_tutorials_finished
	ui_flow_manager_respond_to_action \{action = complete_tutorial}
endscript

script training_check_for_all_tutorials_finished 
	GetGlobalTags \{training}
	if (<basic_lesson> != complete)
		return
	endif
	if (<star_power_lesson> != complete)
		return
	endif
	if (<guitar_battle_lesson> != complete)
		return
	endif
	if (<advanced_techniques_lesson> != complete)
		return
	endif
	WriteAchievements \{achievement = READY_TO_ROCK}
endscript
