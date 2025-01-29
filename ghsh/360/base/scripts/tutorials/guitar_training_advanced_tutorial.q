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
		call = training_4_1_end
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
	create_training_pause_handler
	training_create_narrator_icons
endscript

script training_4_1_show_title 
	Change \{g_training_lessons_completed = 0}
	training_show_title \{title = qs(0x891ade11)}
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
	training_set_lesson_header_text \{number = qs(0x22ee76e7)
		text = qs(0x877a61d7)}
	training_add_lesson_body_text \{number = 1
		text = qs(0x980da364)}
	training_show_lesson_header
	training_show_narrator \{narrator = 'guitarist'}
	training_play_sound \{Sound = 'Tut_Gtr_StringBasics_01_GTR'
		Wait}
	Wait \{0.5
		Seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Gtr_StringBasics_02_GTR'
		Wait}
	Wait \{0.5
		Seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Gtr_StringBasics_03_GTR'
		Wait}
	Wait \{0.5
		Seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Gtr_StringBasics_04_GTR'
		Wait}
	Wait \{0.5
		Seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Gtr_StringBasics_05_GTR'
		Wait}
	Wait \{0.5
		Seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Gtr_StringBasics_06_GTR'
		Wait}
	Wait \{1
		Seconds
		ignoreslomo}
endscript

script training_4_1_end 
	training_hide_narrator \{narrator = 'guitarist'}
	training_generic_lesson_complete
endscript

script training_4_2_explain 
	training_set_lesson_header_text \{number = qs(0x09c32524)
		text = qs(0x67759f6e)}
	training_clear_lesson_body_text
	training_show_lesson_header
	training_show_narrator \{narrator = 'guitarist'}
	training_advanced_stop_hopo_sounds
endscript

script training_4_2_show_guitar 
	<guitar_tex> = tutorial_guitar
	CreateScreenElement {
		parent = training_container
		Type = SpriteElement
		id = guitar_sprite
		just = [center center]
		texture = <guitar_tex>
		Pos = (630.0, 400.0)
		rot_angle = 0
		rgba = [255 255 255 255]
		Scale = (0.4, 0.4)
		z_priority = 4
	}
	training_create_fret_finger_sprites
	pose_fret_fingers \{Color = None}
	training_create_strum_sprites
	pose_strum_fingers \{Pos = middle}
	training_play_sound \{Sound = 'Tut_Gtr_HOFinger_01_GTR'
		Wait}
	Wait \{0.5
		Seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Gtr_HOFinger_02_GTR'
		Wait}
	Wait \{0.5
		Seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Gtr_HOFinger_03_GTR'
		Wait}
	Wait \{0.5
		Seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Gtr_HOFinger_04_GTR'
		Wait}
	training_add_arrow \{id = training_arrow
		life = 5.15
		Pos = (360.0, 360.0)
		Scale = 0.7}
	training_add_arrow \{id = training_strum_arrow
		life = 3.0
		Pos = (850.0, 360.0)
		Scale = 0.7}
	pose_fret_fingers \{Color = green}
	Wait \{0.5
		Seconds
		ignoreslomo}
	pose_strum_fingers \{Pos = down}
	Wait \{1.0
		Seconds
		ignoreslomo}
	pose_strum_fingers \{Pos = middle}
	Wait \{0.5
		Seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Gtr_HOFinger_05_GTR'
		Wait}
	training_add_arrow \{id = training_arrow
		life = 3.0
		Pos = (385.0, 360.0)
		Scale = 0.7}
	pose_fret_fingers \{Color = green_red}
	Wait \{0.75
		Seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Gtr_HOFinger_06_GTR'
		Wait}
	training_add_arrow \{id = training_arrow
		life = 3.0
		Pos = (420.0, 360.0)
		Scale = 0.7}
	pose_fret_fingers \{Color = green_red_yellow}
	Wait \{0.75
		Seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Gtr_HOFinger_07_GTR'
		Wait}
	Wait \{1
		Seconds
		ignoreslomo}
endscript

script training_4_2_zoom_guitar 
	training_add_lesson_body_text \{number = 1
		text = qs(0x56c74cb1)}
	training_add_lesson_body_text \{number = 2
		text = qs(0x03944e1a)}
	training_add_lesson_body_text \{number = 3
		text = qs(0x4f95a468)}
	training_show_lesson_header
	training_set_task_header_body \{text = qs(0x82e793d8)}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0
		notes_required = 3}
	hide_strum_fingers
	hide_fret_fingers
	if ScreenElementExists \{id = guitar_sprite}
		guitar_sprite :legacydomorph \{Scale = (1.0, 1.0)
			Pos = (1100.0, 400.0)
			time = 0.75}
	endif
	training_play_sound \{Sound = 'Tut_Gtr_HOFinger_08_GTR'
		Wait}
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
	LaunchEvent \{Type = focus
		target = menu_tutorial}
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
		qs(0xa404bf72)}
	KillSpawnedScript \{Name = training_watch_for_hammeron}
	SpawnScriptNow \{training_watch_for_hammeron
		id = training_spawned_script}
endscript

script training_count_buttons_pressed 
	GetHeldPattern controller = ($player1_status.controller) Player = 1 nobrokenstring
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
		qs(0x3904ef97)}
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
	GetHeldPattern controller = ($player1_status.controller) Player = 1 nobrokenstring
	check_button = 65536
	if (<hold_pattern> && <check_button>)
		training_press_note \{note = 0}
		training_hit_note \{note = 0}
		SoundEvent \{event = Tutorial_String_1_Strum_Free}
		wait_time = 0
		begin
		GetHeldPattern controller = ($player1_status.controller) Player = 1 nobrokenstring
		check_button = 273
		if (<hold_pattern> && <check_button>)
			training_clear_notes_pressed
			printf \{channel = hammeron
				qs(0x532de255)}
			SoundEvent \{event = Tutorial_Missed_HOPO_Free}
			SoundEvent \{event = StopNotes_01}
			return
		endif
		check_button = 4096
		if (<hold_pattern> && <check_button>)
			printf \{channel = hammeron
				qs(0xa11df061)}
			break
		endif
		wait_time = (<wait_time> + 1)
		if (<wait_time> >= 60)
			printf \{channel = hammeron
				qs(0xaff59b6b)}
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
		GetHeldPattern controller = ($player1_status.controller) Player = 1 nobrokenstring
		check_button = 17
		if (<hold_pattern> && <check_button>)
			training_clear_notes_pressed
			printf \{channel = hammeron
				qs(0x532de255)}
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
				@ training_play_sound \{Sound = 'Tut_Gtr_Positive_01_GTR'}
				@ training_play_sound \{Sound = 'Tut_Gtr_Positive_02_GTR'}
				@ training_play_sound \{Sound = 'Tut_Gtr_Positive_03_GTR'}
				@ training_play_sound \{Sound = 'Tut_Gtr_Positive_04_GTR'}
				@ training_play_sound \{Sound = 'Tut_Gtr_Positive_05_GTR'}
				@ training_play_sound \{Sound = 'Tut_Gtr_Positive_06_GTR'}
				@ training_play_sound \{Sound = 'Tut_Gtr_Positive_07_GTR'}
				@ training_play_sound \{Sound = 'Tut_Gtr_Positive_08_GTR'}
				)
		endif
		if ($training_hammerons_played >= 3)
			Change \{lesson_complete = 1}
		endif
		training_display_notes_hit notes_hit = ($training_hammerons_played) notes_required = 3
		Wait \{2
			Seconds
			ignoreslomo}
		training_clear_notes_pressed
	endif
endscript

script training_press_note 
	formatText checksumName = note_tuned 'note_tuned_%a' a = <note>
	<Pos> = (($g_training_green_note_pos) + (1.0, 0.0) * (<note> * $g_training_guitar_note_offset))
	CreateScreenElement {
		parent = training_container
		Type = SpriteElement
		id = <note_tuned>
		just = [center center]
		texture = tutorial_checkmark
		Pos = <Pos>
		rgba = [255 255 255 255]
		Scale = (0.5, 0.5)
		z_priority = 7
	}
endscript

script training_clear_notes_pressed 
	printf \{channel = hammeron
		qs(0x1f828b5d)}
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
	training_clear_notes_pressed
	training_destroy_pressed_notes
	training_hide_narrator \{narrator = 'guitarist'}
	SpawnScriptNow \{create_yourock
		params = {
			text = qs(0x77f6317c)
		}}
	Wait \{7
		Seconds
		ignoreslomo}
endscript

script training_4_2_end 
	KillSpawnedScript \{Name = training_watch_buttons}
	destroy_menu \{menu_id = menu_tutorial_4_2}
	training_destroy_pressed_notes
	safe_destroy \{id = guitar_sprite}
	training_destroy_fret_finger_sprites
	training_destory_strum_sprites
	Change g_training_lessons_completed = ($g_training_lessons_completed + 1)
endscript

script training_4_3_start_gem_scroller 
	training_set_lesson_header_text \{number = qs(0x10d81465)
		text = qs(0xbfa09f6c)}
	training_add_lesson_body_text \{number = 1
		text = qs(0xb5886e39)}
	training_show_lesson_header
	training_show_narrator \{narrator = 'guitarist'}
	training_start_gem_scroller \{part = guitar
		song = tut_gtr_hamon
		bot_array = [
			0
			0
			0
			0
		]
		disable_hud}
	KillSpawnedScript \{Name = update_score_fast}
	training_wait_for_gem_scroller_startup
endscript

script training_4_3_explain 
	Wait \{3.5
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
	LaunchEvent \{Type = focus
		target = menu_tutorial}
	training_play_sound \{Sound = 'Tut_Gtr_HamOns_01_GTR'
		Wait}
	Wait \{0.5
		Seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Gtr_HamOns_02_GTR'
		Wait}
	training_set_task_header_body \{text = qs(0xde5fe553)}
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
			training_play_positive \{who = GUITARIST}
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
	training_hide_lesson_header
	training_destroy_gem_scroller
	SoundEvent \{event = Tutorial_Mode_Finish_Chord}
	training_hide_narrator \{narrator = 'guitarist'}
	SpawnScriptNow \{create_yourock
		params = {
			text = qs(0x77f6317c)
		}}
	Wait \{7
		Seconds
		ignoreslomo}
	Change g_training_lessons_completed = ($g_training_lessons_completed + 1)
endscript

script training_4_4_explain 
	training_set_lesson_header_text \{number = qs(0x5f9982a2)
		text = qs(0x3f3c9e3e)}
	training_clear_lesson_body_text
	training_show_lesson_header
	training_show_narrator \{narrator = 'guitarist'}
	training_advanced_stop_hopo_sounds
endscript

script training_4_4_show_guitar 
	<guitar_tex> = tutorial_guitar
	CreateScreenElement {
		parent = training_container
		Type = SpriteElement
		id = guitar_sprite
		just = [center center]
		texture = <guitar_tex>
		Pos = (630.0, 400.0)
		rot_angle = 0
		rgba = [255 255 255 255]
		Scale = (0.4, 0.4)
		z_priority = 4
	}
	training_create_fret_finger_sprites
	pose_fret_fingers \{Color = None}
	training_create_strum_sprites
	pose_strum_fingers \{Pos = middle}
	training_play_sound \{Sound = 'Tut_Gtr_POFinger_01_GTR'
		Wait}
	Wait \{0.5
		Seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Gtr_POFinger_02_GTR'
		Wait}
	Wait \{0.5
		Seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Gtr_POFinger_03_GTR'
		Wait}
	Wait \{0.5
		Seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Gtr_POFinger_04_GTR'
		Wait}
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
		life = 4.0
		Pos = (385.0, 360.0)
		Scale = 0.7}
	pose_fret_fingers \{Color = red}
	training_play_sound \{Sound = 'Tut_Gtr_POFinger_05_GTR'
		Wait}
	Wait \{0.5
		Seconds
		ignoreslomo}
	training_add_arrow \{id = training_arrow
		life = 3.0
		Pos = (360.0, 360.0)
		Scale = 0.7}
	pose_fret_fingers \{Color = green}
	training_play_sound \{Sound = 'Tut_Gtr_POFinger_06_GTR'
		Wait}
	Wait \{0.5
		Seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Gtr_POFinger_07_GTR'}
	training_add_arrow \{id = training_arrow
		life = 3.95
		Pos = (420.0, 360.0)
		Scale = 0.7}
	training_add_arrow \{id = training_strum_arrow
		life = 3.5
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
		life = 1.0
		Pos = (385.0, 360.0)
		Scale = 0.7}
	pose_fret_fingers \{Color = green_red}
	Wait \{1
		Seconds
		ignoreslomo}
	training_add_arrow \{id = training_arrow
		life = 2.0
		Pos = (360.0, 360.0)
		Scale = 0.7}
	pose_fret_fingers \{Color = green}
	Wait \{2
		Seconds
		ignoreslomo}
endscript

script training_4_4_zoom_guitar 
	training_add_lesson_body_text \{number = 1
		text = qs(0x0688c538)}
	training_add_lesson_body_text \{number = 2
		text = qs(0xdb3ec64c)}
	training_add_lesson_body_text \{number = 3
		text = qs(0xfc1c1503)}
	training_show_lesson_header
	training_set_task_header_body \{text = qs(0x12d7947e)}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0
		notes_required = 3}
	hide_strum_fingers
	hide_fret_fingers
	if ScreenElementExists \{id = guitar_sprite}
		guitar_sprite :legacydomorph \{Scale = (1.0, 1.0)
			Pos = (1100.0, 400.0)
			time = 0.75}
	endif
	training_play_sound \{Sound = 'Tut_Gtr_POFinger_08_GTR'}
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
		qs(0xa3166f46)}
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
	LaunchEvent \{Type = focus
		target = menu_tutorial}
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
		qs(0x146ecd2c)}
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
		training_play_positive \{who = GUITARIST}
	endif
	if ($training_pulloffs_played >= 3)
		Change \{lesson_complete = 1}
	endif
	training_display_notes_hit notes_hit = ($training_pulloffs_played) notes_required = 3
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
	GetHeldPattern controller = ($player1_status.controller) Player = 1 nobrokenstring
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
	training_clear_notes_pressed
	training_destroy_pressed_notes
	training_hide_narrator \{narrator = 'guitarist'}
	SpawnScriptNow \{create_yourock
		params = {
			text = qs(0x77f6317c)
		}}
	Wait \{7
		Seconds
		ignoreslomo}
endscript

script training_4_4_end 
	KillSpawnedScript \{Name = training_watch_buttons}
	safe_destroy \{id = guitar_sprite}
	training_destroy_pressed_notes
	training_destroy_fret_finger_sprites
	training_destory_strum_sprites
	Change g_training_lessons_completed = ($g_training_lessons_completed + 1)
endscript

script training_4_5_start_gem_scroller 
	training_set_lesson_header_text \{number = qs(0x4682b3e3)
		text = qs(0x5c192d33)}
	training_clear_lesson_body_text
	training_show_lesson_header
	training_show_narrator \{narrator = 'guitarist'}
	training_start_gem_scroller \{part = guitar
		song = tut_gtr_pulloff
		bot_array = [
			0
			0
			0
			0
		]
		disable_hud}
	KillSpawnedScript \{Name = update_score_fast}
	Change \{training_pulloffs_played = 0}
	training_wait_for_gem_scroller_startup
endscript

script training_4_5_explain 
	Wait \{3.5
		Seconds
		ignoreslomo}
	training_pause_gem_scroller
	training_add_lesson_body_text \{number = 1
		text = qs(0x49223bcd)}
	training_show_lesson_header
	training_play_sound \{Sound = 'Tut_Gtr_PullOffs_01_GTR'
		Wait}
	Wait \{0.5
		Seconds
		ignoreslomo}
	training_set_task_header_body \{text = qs(0xff794001)}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0}
	training_resume_gem_scroller
endscript

script training_4_5_wait_for_hammerons 
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{hit_notesp1 lesson4_pulloff_note}
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

script lesson4_pulloff_note 
	if (<hammer_strum> = 1)
		Change training_pulloffs_played = ($training_pulloffs_played + 1)
		training_display_notes_hit \{notes_hit = $training_pulloffs_played}
		if ($training_pulloffs_played = 1)
			training_play_positive \{who = GUITARIST}
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
	training_hide_lesson_header
	training_destroy_gem_scroller
	SoundEvent \{event = Tutorial_Mode_Finish_Chord}
	training_hide_narrator \{narrator = 'guitarist'}
	SpawnScriptNow \{create_yourock
		params = {
			text = qs(0x0f518fe1)
		}}
	Wait \{0.5
		Seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Gtr_PullOffs_09_GTR'
		Wait}
	Wait \{6.5
		Seconds
		ignoreslomo}
	Change g_training_lessons_completed = ($g_training_lessons_completed + 1)
endscript
training_song_over = 0

script training_song_won 
	Change \{training_song_over = 1}
	show_training_pause_screen \{songfailed}
endscript

script training_advanced_techniques_tutorial_1_end 
	training_container :GetTags
	if ($g_training_lessons_completed = 5)
		SetGlobalTags \{training
			params = {
				advanced_techniques_lesson = complete
			}}
	endif
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
	training_check_for_all_tutorials_finished
	decide_tutorial_back_destination
endscript

script training_advanced_stop_hopo_sounds 
	SoundEvent \{event = StopNotes_01}
	SoundEvent \{event = StopNotes_02}
	SoundEvent \{event = StopNotes_03}
	SoundEvent \{event = StopNotes_04}
	SoundEvent \{event = StopNotes_05}
	SoundEvent \{event = StopNotes_06}
endscript
