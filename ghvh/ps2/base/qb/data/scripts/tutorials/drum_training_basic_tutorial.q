training_drums_hit = [
	0
	0
	0
	0
	0
]
total_drums_hit = 0
total_drums_complete = 0
drum_notes_hit = 0
drum_notes_missed = 0
training_kick_drum_hit = 0
training_drum_basic_tutorial_script = [
	{
		call = training_drum_basic_tutorial_startup
	}
	{
		time = 1000
		call = training_drum_basic_tutorial_show_title
	}
	{
		lesson = 1
		call = drum_training_1_1_show_lesson_header
	}
	{
		call = drum_training_1_1_show_holding_sticks_image
	}
	{
		call = drum_training_1_1_complete_message
	}
	{
		lesson = 2
		call = drum_training_1_2_show_lesson_header
	}
	{
		call = drum_training_1_2_show_drum_image
	}
	{
		call = drum_training_1_2_add_play_each_note_task
	}
	{
		call = drum_training_1_2_complete_message
	}
	{
		lesson = 3
		call = drum_training_1_3_show_lesson_header
	}
	{
		call = drum_training_1_3_show_highway
	}
	{
		call = drum_training_1_3_show_items_on_highway
	}
	{
		call = drum_training_1_3_add_play_each_note_task
	}
	{
		call = drum_training_1_3_complete_message
	}
	{
		lesson = 4
		call = drum_training_1_4_show_lesson_header
	}
	{
		call = drum_training_1_4_show_highway
	}
	{
		call = drum_training_1_4_show_items_on_highway
	}
	{
		call = drum_training_1_4_add_play_each_note_task
	}
	{
		call = drum_training_1_4_complete_message
	}
	{
		lesson = 5
		call = drum_training_1_5_show_lesson_header
	}
	{
		call = drum_training_1_5_show_drum_image
	}
	{
		call = drum_training_1_5_add_play_each_note_task
	}
	{
		call = drum_training_1_5_complete_message
	}
	{
		lesson = 6
		call = drum_training_1_6_show_lesson_header
	}
	{
		call = drum_training_1_6_show_highway
	}
	{
		call = drum_training_1_6_add_play_each_note_task
	}
	{
		call = drum_training_1_6_point_out_freeform_section
	}
	{
		call = drum_training_1_6_complete_message
	}
	{
		lesson = 7
		call = drum_training_1_7_show_lesson_header
	}
	{
		call = drum_training_1_7_show_highway
	}
	{
		call = drum_training_1_7_show_rock_meter
	}
	{
		call = drum_training_1_7_point_out_score
	}
	{
		call = drum_training_1_7_complete_message
	}
	{
		lesson = 8
		call = drum_training_1_8_show_lesson_header
	}
	{
		call = drum_training_1_8_show_highway
	}
	{
		call = drum_training_1_8_show_items_on_highway
	}
	{
		call = drum_training_1_8_add_play_each_note_task
	}
	{
		call = drum_training_1_8_complete_message
	}
	{
		call = drum_training_basic_tutorial_end
	}
]

script training_drum_basic_tutorial_startup 

	training_init_session
	0xc1c4e84c \{mode = tutorials
		tutorial = 0xbf7e526d}
	setplayerinfo \{1
		four_lane_highway = 0}
	LaunchEvent \{Type = unfocus
		target = root_window}
	create_training_pause_handler
	training_create_narrator_icons
endscript

script training_drum_basic_tutorial_show_title 
	if 0x8658e568
		destroy_loading_screen
	endif
	Change \{g_training_lessons_completed = 0}

	training_show_title \{title = qs(0x71d9ad3c)}
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

script drum_training_1_1_show_lesson_header 

	training_set_lesson_header_text \{number = qs(0x22ee76e7)
		text = qs(0x2b55e6e2)}
	training_show_lesson_header
	create_training_pause_handler
endscript

script drum_training_1_1_create_sticks 

	CreateScreenElement \{parent = training_container
		Type = SpriteElement
		id = stick_sprite_up
		just = [
			center
			center
		]
		texture = tutorial_drum_hand_up
		Pos = (630.0, 460.0)
		Scale = (3.0, 3.0)
		z_priority = 4}
	safe_hide id = <id>
	CreateScreenElement \{parent = training_container
		Type = SpriteElement
		id = stick_sprite_down
		just = [
			center
			center
		]
		texture = tutorial_drum_hand_down
		Pos = (630.0, 460.0)
		Scale = (3.0, 3.0)
		z_priority = 4}
	safe_hide id = <id>
	CreateScreenElement \{parent = training_container
		Type = SpriteElement
		id = two_hand_stick_sprite
		just = [
			center
			center
		]
		texture = tutorial_drum_2hands
		Pos = (630.0, 460.0)
		Scale = (4.0, 4.0)
		z_priority = 4}
endscript

script drum_training_1_1_animate_sticks 

	safe_hide \{id = two_hand_stick_sprite}
	begin
	safe_hide \{id = stick_sprite_down}
	safe_show \{id = stick_sprite_up}
	Wait \{1
		Seconds}
	safe_hide \{id = stick_sprite_up}
	safe_show \{id = stick_sprite_down}
	play_drum_sample \{pad = snare
		velocity = 70}
	Wait \{1
		Seconds}
	repeat 6
	safe_hide \{id = stick_sprite_down}
	safe_show \{id = stick_sprite_up}
endscript

script drum_training_1_1_show_holding_sticks_image 

	SpawnScriptNow \{drum_training_1_1_create_sticks
		id = training_spawned_script}
	training_show_narrator \{narrator = 'drummer'}
	0x4de05aff \{mode = 0x78072e40}
	training_play_sound \{Sound = 'Tut_Dru_HoldSticks_01_DRM'
		Wait}
	training_hide_narrator
	SpawnScriptNow \{drum_training_1_1_animate_sticks
		id = training_spawned_script}
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_HoldSticks_02_DRM'
		Wait}
	training_play_sound \{Sound = 'Tut_Dru_HoldSticks_03_DRM'
		Wait}
	training_hide_narrator
	safe_destroy \{id = two_hand_stick_sprite}
	safe_destroy \{id = stick_sprite_up}
	safe_destroy \{id = stick_sprite_down}
endscript

script drum_training_1_1_complete_message 

	training_generic_lesson_complete
endscript

script drum_training_1_2_show_lesson_header 

	training_set_lesson_header_text \{number = qs(0x09c32524)
		text = qs(0x5de762e5)}
	training_show_lesson_header
	create_training_pause_handler
endscript

script drum_training_1_2_create_drum_hit_sprites 

	CreateScreenElement \{parent = drumkit_sprite
		Type = SpriteElement
		id = drum_hit_0
		just = [
			center
			center
		]
		texture = tutorial_drum_hit
		rgba = [
			0
			107
			51
			255
		]
		Pos = (167.0, 88.0)
		Scale = (0.9, 0.9)
		z_priority = 5
		alpha = 0.0}
	CreateScreenElement \{parent = drumkit_sprite
		Type = SpriteElement
		id = drum_hit_1
		just = [
			center
			center
		]
		texture = tutorial_drum_hit
		rgba = [
			0
			160
			198
			255
		]
		Pos = (123.0, 84.0)
		Scale = (0.9, 0.9)
		z_priority = 5
		alpha = 0.0}
	CreateScreenElement \{parent = drumkit_sprite
		Type = SpriteElement
		id = drum_hit_2
		just = [
			center
			center
		]
		texture = tutorial_drum_hit
		rgba = [
			255
			191
			0
			255
		]
		Pos = (98.0, 53.0)
		Scale = (0.9, 0.9)
		z_priority = 5
		alpha = 0.0}
	CreateScreenElement \{parent = drumkit_sprite
		Type = SpriteElement
		id = drum_hit_3
		just = [
			center
			center
		]
		texture = tutorial_drum_hit
		rgba = [
			191
			0
			0
			255
		]
		Pos = (72.0, 87.0)
		Scale = (0.9, 0.9)
		z_priority = 5
		alpha = 0.0}
	CreateScreenElement \{parent = drumkit_sprite
		Type = SpriteElement
		id = drum_hit_4
		just = [
			center
			center
		]
		texture = tutorial_drum_hit
		rgba = [
			1
			83
			83
			255
		]
		Pos = (174.0, 46.0)
		Scale = (0.9, 0.9)
		z_priority = 5
		alpha = 0.0}
endscript

script drum_training_1_2_wait_for_drum_test_complete 

	training_show_task_header
	Change \{training_drums_hit = [
			0
			0
			0
			0
			0
		]}
	Change \{total_drums_hit = 0}
	Change \{total_drums_complete = 0}
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{pad_btn_bottom training_hit_drum params = {index = 0}}
		{pad_btn_left training_hit_drum params = {index = 1}}
		{pad_btn_top training_hit_drum params = {index = 2}}
		{pad_btn_right training_hit_drum params = {index = 3}}
		{pad_R1 training_hit_drum params = {index = 4}}
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
	SetMenuAutoRepeatTimes \{(0.3, 0.05)}
endscript

script training_hit_drum \{velocity = 127}

	formatText checksumName = drum_hit 'drum_hit_%i' i = <index>
	if ($training_drums_hit [<index>] < 4)
		SetArrayElement ArrayName = training_drums_hit globalarray index = <index> NewValue = ($training_drums_hit [<index>] + 1)
		Change total_drums_hit = ($total_drums_hit + 1)
		<drum_hit> :se_setprops {
			Scale = (0.0)
			alpha = 1.0
		}
		<drum_hit> :se_setprops {
			Scale = (1.5)
			alpha = 0.0
			time = 0.25
		}
		getdrumhitvelocity \{Player = 1}
		switch <drum_hit>
			case drum_hit_0

			play_drum_sample pad = tom2 velocity = <velocity>
			case drum_hit_1

			play_drum_sample pad = tom1 velocity = <velocity>
			case drum_hit_2

			play_drum_sample pad = hihat velocity = <velocity>
			case drum_hit_3

			play_drum_sample pad = snare velocity = <velocity>
			case drum_hit_4

			play_drum_sample pad = cymbal velocity = <velocity>
		endswitch
		if ($training_drums_hit [<index>] = 4)
			Change total_drums_complete = ($total_drums_complete + 1)
			GetScreenElementPosition id = <drum_hit>
			<checkmark_offset> = (50.0, 45.0)
			CreateScreenElement {
				parent = drumkit_sprite
				Type = SpriteElement
				just = [center center]
				texture = tutorial_checkmark
				Pos = (<screenelementpos> + <checkmark_offset>)
				Scale = (0.6, 0.6)
				z_priority = 7
			}
			if (($total_drums_complete = 1) || ($total_drums_complete = 3))
				GetRandomValue \{Name = random_value
					a = 0
					b = 10}
				if (<random_value> < 5)
					training_play_sound \{Sound = 'Tut_Dru_Positive_01_DRM'}
				else
					training_play_sound \{Sound = 'Tut_Dru_Positive_02_DRM'}
				endif
			endif
		endif
		if ($total_drums_hit >= 20)
			Change \{lesson_complete = 1}
		endif
	endif
endscript

script drum_training_1_2_show_drum_image 

	training_show_narrator \{narrator = 'drummer'}
	0x4de05aff \{mode = 0x2c406cea}
	training_play_sound \{Sound = 'Tut_Dru_DrumTest_01_DRM'
		Wait}
	training_hide_narrator
	<drum_kit_texture> = tutorial_drumkit
	CreateScreenElement {
		parent = training_container
		Type = SpriteElement
		id = drumkit_sprite
		just = [center center]
		texture = <drum_kit_texture>
		Pos = (640.0, 490.0)
		Scale = (1.8, 1.8)
		z_priority = 4
	}
	drum_training_1_2_create_drum_hit_sprites
endscript

script drum_training_1_2_add_play_each_note_task 

	training_add_lesson_body_text \{number = qs(0x22ee76e7)
		text = qs(0xb20e9844)}
	training_add_lesson_body_text \{number = qs(0x09c32524)
		text = qs(0x6cff1051)}
	training_show_lesson_header
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_DrumTest_02_DRM'
		Wait}
	Wait \{0.5
		Seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Dru_DrumTest_03_DRM'
		Wait}
	Wait \{0.5
		Seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Dru_DrumTest_04_DRM'
		Wait}
	training_hide_narrator
	training_set_task_header_body \{text = qs(0xf96eea14)}
	training_show_task_header
	drum_training_1_2_wait_for_drum_test_complete
	training_hide_lesson_header
	Wait \{0.25
		Seconds
		ignoreslomo}
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_DrumTest_05_DRM'
		Wait}
	training_hide_narrator
	safe_destroy \{id = drumkit_sprite}
endscript

script drum_training_1_2_complete_message 

	training_generic_lesson_complete
endscript

script drum_training_1_3_show_lesson_header 

	training_set_lesson_header_text \{number = qs(0x10d81465)
		text = qs(0xe882cc3f)}
	training_show_lesson_header
	create_training_pause_handler
endscript

script drum_training_1_3_show_highway 

	training_show_narrator \{narrator = 'drummer'}
	0x4de05aff \{mode = 0xc215adf7}
	training_play_sound \{Sound = 'Tut_Dru_OneHand_01_DRM'
		Wait}
	training_hide_narrator
	setplayerinfo \{1
		four_lane_highway = 0}
	Change \{tutorial_disable_hud = 1}
	training_start_gem_scroller \{song = tut_drum_onehand
		part = drum
		disable_hud
		no_score_update}
	KillSpawnedScript \{Name = update_score_fast}
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{hit_notesp1 drum_training_1_3_hit_note}
		{missed_notep1 drum_training_1_3_missed_note}
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
	training_wait_for_gem_scroller_startup
endscript

script drum_training_1_3_hit_note 

	Change drum_notes_hit = ($drum_notes_hit + 1)
	if (($drum_notes_hit = 1) || ($drum_notes_hit = 4))
		Random (
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_01_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_02_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_03_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_04_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_05_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_06_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_07_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_08_DRM'}
			)
	endif
	training_display_notes_hit \{notes_hit = $drum_notes_hit}
endscript

script drum_training_1_3_missed_note 

	Change drum_notes_missed = ($drum_notes_missed + 1)
	if (($drum_notes_missed = 3) || ($drum_notes_missed = 6))
		Random (
			@ training_play_sound \{Sound = 'Tut_Dru_OneHand_07_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_OneHand_08_DRM'}
			)
	endif
endscript

script drum_training_1_3_wait_for_hit_notes 

	begin
	if ($training_song_over = 1)
		return
	endif
	if ($drum_notes_hit >= 8)
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script drum_training_1_3_show_items_on_highway 

	Wait \{3.6
		Seconds}
	training_pause_gem_scroller
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_OneHand_02_DRM'
		Wait}
	training_add_lesson_body_text \{number = qs(0x22ee76e7)
		text = qs(0xbe25479c)}
	training_show_lesson_header
	training_play_sound \{Sound = 'Tut_Dru_OneHand_03_DRM'
		Wait}
	training_hide_narrator
	if training_are_notes_flipped
		training_add_arrow \{id = training_arrow
			life = 3.0
			Pos = (735.0, 360.0)
			Scale = 2.3}
	else
		training_add_arrow \{id = training_arrow
			life = 3.0
			Pos = (545.0, 360.0)
			Scale = 2.3}
	endif
	Wait \{0.5
		Seconds
		ignoreslomo}
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_OneHand_04_DRM'
		Wait}
	training_hide_narrator
	if training_are_notes_flipped
		training_add_arrow \{id = training_arrow2
			life = 3
			Pos = (900.0, 635.0)
			Scale = 2.3
			rot = 90}
	else
		training_add_arrow \{id = training_arrow2
			life = 3
			Pos = (380.0, 635.0)
			Scale = 2.3
			rot = -90}
	endif
	Wait \{2
		Seconds
		ignoreslomo}
endscript

script drum_training_1_3_add_play_each_note_task 

	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_OneHand_05_DRM'
		Wait}
	training_hide_narrator
	training_set_task_header_body \{text = qs(0x34724d03)}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0}
	Change \{drum_notes_hit = 0}
	Change \{drum_notes_missed = 0}
	training_destroy_all_arrows
	training_resume_gem_scroller
	drum_training_1_3_wait_for_hit_notes
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	training_destroy_gem_scroller
	training_hide_lesson_header
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_OneHand_06_DRM'
		Wait}
	training_hide_narrator
endscript

script drum_training_1_3_complete_message 

	safe_destroy \{id = notes_hit_text}
	training_generic_lesson_complete
endscript

script drum_training_1_4_show_lesson_header 

	training_set_lesson_header_text \{number = qs(0x5f9982a2)
		text = qs(0xf401a3bd)}
	training_show_lesson_header
	create_training_pause_handler
endscript

script drum_training_1_4_hit_note 

	Change drum_notes_hit = ($drum_notes_hit + 1)
	if (($drum_notes_hit = 1) || ($drum_notes_hit = 4))
		Random (
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_01_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_02_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_03_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_04_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_05_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_06_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_07_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_08_DRM'}
			)
	endif
	training_display_notes_hit \{notes_hit = $drum_notes_hit}
endscript

script drum_training_1_4_missed_note 

	Change drum_notes_missed = ($drum_notes_missed + 1)
	if (($drum_notes_missed = 3) || ($drum_notes_missed = 6))
	endif
endscript

script drum_training_1_4_wait_for_hit_notes 

	begin
	if ($training_song_over = 1)
		return
	endif
	if ($drum_notes_hit >= 8)
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script drum_training_1_4_show_highway 

	training_show_narrator \{narrator = 'drummer'}
	0x4de05aff \{mode = 0x981b8592}
	training_play_sound \{Sound = 'Tut_Dru_TwoHands_01_DRM'
		Wait}
	training_hide_narrator
	setplayerinfo \{1
		four_lane_highway = 0}
	setplayerinfo \{1
		highway_texture = highway_axel}
	Change \{tutorial_disable_hud = 1}
	training_start_gem_scroller \{song = tut_drum_twohands
		part = drum
		disable_hud
		no_score_update}
	KillSpawnedScript \{Name = update_score_fast}
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{drum_multi_hitp1 drum_training_1_4_hit_note}
		{missed_notep1 drum_training_1_4_missed_note}
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
	training_wait_for_gem_scroller_startup
endscript

script drum_training_1_4_show_items_on_highway 

	Wait \{3.6
		Seconds}
	training_pause_gem_scroller
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_TwoHands_02_DRM'
		Wait}
	training_hide_narrator
	training_add_lesson_body_text \{number = qs(0x22ee76e7)
		text = qs(0x3b014d52)}
	training_show_lesson_header
	if training_are_notes_flipped
		training_add_arrow \{id = training_arrow
			life = 7.0
			Pos = (735.0, 360.0)
			Scale = 2.3}
		training_add_arrow \{id = training_arrow
			life = 7.0
			Pos = (685.0, 360.0)
			Scale = 2.3}
	else
		training_add_arrow \{id = training_arrow
			life = 3.0
			Pos = (545.0, 360.0)
			Scale = 2.3}
		training_add_arrow \{id = training_arrow
			life = 3.0
			Pos = (595.0, 360.0)
			Scale = 2.3}
	endif
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_TwoHands_03_DRM'
		Wait}
	training_hide_narrator
endscript

script drum_training_1_4_add_play_each_note_task 

	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_TwoHands_04_DRM'
		Wait}
	training_hide_narrator
	training_set_task_header_body \{text = qs(0x42f095cc)}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0}
	Change \{drum_notes_hit = 0}
	Change \{drum_notes_missed = 0}
	training_destroy_all_arrows
	training_resume_gem_scroller
	drum_training_1_4_wait_for_hit_notes
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	training_destroy_gem_scroller
	training_hide_lesson_header
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_TwoHands_06_DRM'
		Wait}
	training_hide_narrator
endscript

script drum_training_1_4_complete_message 

	safe_destroy \{id = notes_hit_text}
	training_generic_lesson_complete
endscript

script drum_training_1_5_show_lesson_header 

	training_set_lesson_header_text \{number = qs(0x4682b3e3)
		text = qs(0xdb9d08fe)}
	training_show_lesson_header
	create_training_pause_handler
endscript

script drum_training_1_5_create_kick_sprites 

	<0xf907476f> = (3.0, 3.0)
	CreateScreenElement {
		parent = training_container
		Type = SpriteElement
		id = kick_foot_sprite_up
		just = [center center]
		texture = tutorial_kickpedal_foot
		Pos = (630.0, 450.0)
		Scale = <0xf907476f>
		z_priority = 4
	}
	safe_hide id = <id>
	CreateScreenElement {
		parent = training_container
		Type = SpriteElement
		id = kick_sprite_up
		just = [center center]
		texture = tutorial_kickpedal_up
		Pos = (630.0, 450.0)
		Scale = <0xf907476f>
		z_priority = 4
	}
	safe_hide id = <id>
	CreateScreenElement {
		parent = training_container
		Type = SpriteElement
		id = kick_foot_sprite_down
		just = [center center]
		texture = tutorial_kickpedal_foot
		Pos = (630.0, 470.0)
		Scale = <0xf907476f>
		z_priority = 4
		rot_angle = -10
	}
	CreateScreenElement {
		parent = training_container
		Type = SpriteElement
		id = kick_sprite_down
		just = [center center]
		texture = tutorial_kickpedal_down
		Pos = (630.0, 450.0)
		Scale = <0xf907476f>
		z_priority = 4
	}
endscript

script drum_training_1_5_create_kick_with_no_foot_sprites 

	<0xf907476f> = (3.0, 3.0)
	CreateScreenElement {
		parent = training_container
		Type = SpriteElement
		id = kick_nofoot_sprite_down
		just = [center center]
		texture = tutorial_kickpedal_down
		Pos = (630.0, 450.0)
		Scale = <0xf907476f>
		z_priority = 4
	}
	safe_hide id = <id>
	CreateScreenElement {
		parent = training_container
		Type = SpriteElement
		id = kick_nofoot_sprite_up
		just = [center center]
		texture = tutorial_kickpedal_up
		Pos = (630.0, 450.0)
		Scale = <0xf907476f>
		z_priority = 4
	}
endscript

script drum_training_1_5_animate_kicks 

	Wait \{1.5
		Seconds}
	begin
	safe_hide \{id = kick_sprite_down}
	safe_hide \{id = kick_foot_sprite_down}
	safe_show \{id = kick_sprite_up}
	safe_show \{id = kick_foot_sprite_up}
	Wait \{0.5
		Seconds}
	safe_hide \{id = kick_sprite_up}
	safe_hide \{id = kick_foot_sprite_up}
	safe_show \{id = kick_sprite_down}
	safe_show \{id = kick_foot_sprite_down}
	Wait \{0.5
		Seconds}
	repeat 3
endscript

script drum_training_1_5_show_drum_image 

	SpawnScriptNow \{drum_training_1_5_create_kick_sprites
		id = training_spawned_script}
	training_show_narrator \{narrator = 'drummer'}
	0x4de05aff \{mode = 0xf3943b1d}
	training_play_sound \{Sound = 'Tut_Dru_KickPedal_01_DRM'
		Wait}
	Wait \{0.5
		Seconds}
	training_play_sound \{Sound = 'Tut_Dru_KickPedal_02_DRM'
		Wait}
	Wait \{0.5
		Seconds}
	training_play_sound \{Sound = 'Tut_Dru_KickPedal_03_DRM'
		Wait}
	Wait \{0.5
		Seconds}
	SpawnScriptNow \{drum_training_1_5_animate_kicks
		id = training_spawned_script}
	training_play_sound \{Sound = 'Tut_Dru_KickPedal_04_DRM'
		Wait}
	training_hide_narrator
	KillSpawnedScript \{Name = drum_training_1_5_animate_kicks}
	safe_hide \{id = kick_sprite_up}
	safe_hide \{id = kick_sprite_down}
	safe_hide \{id = kick_foot_sprite_down}
	safe_hide \{id = kick_foot_sprite_up}
endscript

script drum_training_1_5_create_kick_drum_hit_sprites 

	CreateScreenElement \{parent = kick_nofoot_sprite_down
		Type = SpriteElement
		id = kick_drum_hit
		just = [
			center
			center
		]
		texture = tutorial_drum_hit
		rgba = [
			80
			0
			80
			255
		]
		Pos = (30.0, 83.0)
		Scale = (2.0, 2.0)
		z_priority = 5
		alpha = 0.0}
endscript

script drum_training_1_5_wait_for_drum_test_complete 

	training_show_task_header
	Change \{training_kick_drum_hit = 0}
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{pad_L1 training_hit_kick_drum}
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
	SetMenuAutoRepeatTimes \{(0.3, 0.05)}
endscript

script training_hit_kick_drum \{velocity = 127}

	Change training_kick_drum_hit = ($training_kick_drum_hit + 1)
	training_display_notes_hit notes_hit = ($training_kick_drum_hit) notes_required = 4
	safe_hide \{id = kick_nofoot_sprite_up}
	safe_show \{id = kick_nofoot_sprite_down}
	play_drum_sample pad = kick velocity = <velocity>
	kick_drum_hit :se_setprops {
		Scale = (0.0)
		alpha = 1.0
	}
	kick_drum_hit :se_setprops {
		Scale = (4.0)
		alpha = 0.0
		time = 0.25
	}
	if (($training_kick_drum_hit = 1) || ($training_kick_drum_hit = 3))
		Random (
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_01_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_02_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_03_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_04_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_05_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_06_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_07_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_08_DRM'}
			)
	endif
	Wait \{0.5
		Seconds}
	safe_show \{id = kick_nofoot_sprite_up}
	safe_hide \{id = kick_nofoot_sprite_down}
	if ($training_kick_drum_hit >= 4)
		Change \{lesson_complete = 1}
	endif
endscript

script drum_training_1_5_add_play_each_note_task 

	SpawnScriptNow \{drum_training_1_5_create_kick_with_no_foot_sprites
		id = training_spawned_script}
	SpawnScriptNow \{drum_training_1_5_create_kick_drum_hit_sprites
		id = training_spawned_script}
	training_add_lesson_body_text \{number = qs(0x22ee76e7)
		text = qs(0x6cc22c8c)}
	training_show_lesson_header
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_KickPedal_05_DRM'
		Wait}
	training_hide_narrator
	training_set_task_header_body \{text = qs(0x93509ecb)}
	training_display_notes_hit \{notes_hit = 0
		notes_required = 4}
	training_show_task_header
	drum_training_1_5_wait_for_drum_test_complete
	training_hide_lesson_header
	safe_hide \{id = kick_nofoot_sprite_up}
	safe_hide \{id = kick_nofoot_sprite_down}
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_KickPedal_06_DRM'
		Wait}
	training_hide_narrator
	safe_destroy \{id = kick_drum_hit}
endscript

script drum_training_1_5_complete_message 

	training_generic_lesson_complete
endscript

script drum_training_1_6_show_lesson_header 

	training_set_lesson_header_text \{number = qs(0x6dafe020)
		text = qs(0x58337f8c)}
	training_show_lesson_header
	create_training_pause_handler
endscript

script drum_training_1_6_show_highway 

	setplayerinfo \{1
		four_lane_highway = 0}
	Change \{tutorial_disable_hud = 1}
	training_start_gem_scroller \{song = tut_drum_kick
		part = drum
		disable_hud
		no_score_update}
	KillSpawnedScript \{Name = update_score_fast}
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{hit_notesp1 drum_training_1_6_hit_note}
		{missed_notep1 drum_training_1_6_missed_note}
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
	training_wait_for_gem_scroller_startup
endscript

script drum_training_1_6_hit_note 

	Change drum_notes_hit = ($drum_notes_hit + 1)
	if (($drum_notes_hit = 1) || ($drum_notes_hit = 4))
		Random (
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_01_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_02_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_03_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_04_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_05_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_06_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_07_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_08_DRM'}
			)
	endif
	training_display_notes_hit \{notes_hit = $drum_notes_hit}
endscript

script drum_training_1_6_missed_note 

	Change drum_notes_missed = ($drum_notes_missed + 1)
	if (($drum_notes_missed = 3) || ($drum_notes_missed = 6))
		Random (
			@ training_play_sound \{Sound = 'Tut_Dru_AddKick_05_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_AddKick_06_DRM'}
			)
	endif
endscript

script drum_training_1_6_wait_for_hit_notes 

	begin
	if ($training_song_over = 1)
		return
	endif
	if ($drum_notes_hit >= 8)
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script drum_training_1_6_spawn_delayed_strike_line_arrow 

	Wait \{2.5
		Seconds
		ignoreslomo}
	if training_are_notes_flipped
		training_add_arrow \{id = training_arrow2
			life = 3
			Pos = (900.0, 635.0)
			Scale = 2.3
			rot = 90}
	else
		training_add_arrow \{id = training_arrow2
			life = 3
			Pos = (380.0, 635.0)
			Scale = 2.3
			rot = -90}
	endif
endscript

script drum_training_1_6_add_play_each_note_task 

	Wait \{3.6
		Seconds}
	training_pause_gem_scroller
	if training_are_notes_flipped
		training_add_arrow \{id = training_arrow2
			life = 3
			Pos = (780.0, 380.0)
			Scale = 2.3
			rot = 90}
	else
		training_add_arrow \{id = training_arrow2
			life = 3
			Pos = (500.0, 400.0)
			Scale = 2.3
			rot = -90}
	endif
	SpawnScriptNow \{drum_training_1_6_spawn_delayed_strike_line_arrow
		id = training_spawned_script}
	training_show_narrator \{narrator = 'drummer'}
	0x4de05aff \{mode = 0x21e432f9}
	training_play_sound \{Sound = 'Tut_Dru_KickSong_01_DRM'
		Wait}
	training_add_lesson_body_text \{number = qs(0x22ee76e7)
		text = qs(0xeedc0e5a)}
	training_show_lesson_header
	training_play_sound \{Sound = 'Tut_Dru_KickSong_02_DRM'
		Wait}
	training_hide_narrator
	training_destroy_all_arrows
	training_set_task_header_body \{text = qs(0x34724d03)}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0}
	Change \{drum_notes_hit = 0}
	Change \{drum_notes_missed = 0}
	training_resume_gem_scroller
	drum_training_1_6_wait_for_hit_notes
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	training_destroy_gem_scroller
	training_hide_lesson_header
endscript

script drum_training_1_6_spawn_freeform_highway 

	setplayerinfo \{1
		four_lane_highway = 0}
	Change \{tutorial_disable_hud = 1}
	training_start_gem_scroller \{song = tut_drum_free
		part = drum
		disable_hud
		no_score_update}
	KillSpawnedScript \{Name = update_score_fast}
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{drumfill_hitp1 drum_training_1_6_b_hit_note}
		{missed_notep1 drum_training_1_6_b_missed_note}
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
	training_wait_for_gem_scroller_startup
	Wait \{4.0
		Seconds
		ignoreslomo}
	training_pause_gem_scroller
endscript

script drum_training_1_6_b_hit_note 

	Change drum_notes_hit = ($drum_notes_hit + 1)
	if (($drum_notes_hit = 12) || ($drum_notes_hit = 24))
		Random (
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_01_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_02_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_03_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_04_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_05_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_06_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_07_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_08_DRM'}
			)
	endif
	training_display_notes_hit \{notes_hit = $drum_notes_hit
		notes_required = 32}
endscript

script drum_training_1_6_b_missed_note 

	Change drum_notes_missed = ($drum_notes_missed + 1)
	if (($drum_notes_missed = 3) || ($drum_notes_missed = 6))
		Random (
			@ training_play_sound \{Sound = 'Tut_Dru_AddKick_05_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_AddKick_06_DRM'}
			)
	endif
endscript

script drum_training_1_6_b_wait_for_hit_notes 

	begin
	if ($training_song_over = 1)
		return
	endif
	if ($drum_notes_hit >= 32)
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script drum_training_1_6_point_out_freeform_section 

	drum_training_1_6_spawn_freeform_highway
	training_show_narrator \{narrator = 'drummer'}
	0x4de05aff \{mode = 0x552293db}
	training_play_sound \{Sound = 'Tut_Dru_Impro_01_DRM'
		Wait}
	Wait \{1
		Seconds
		ignoreslomo}
	training_add_arrow \{id = training_arrow2
		life = 3
		Pos = (500.0, 375.0)
		Scale = 2.3
		rot = -90}
	training_play_sound \{Sound = 'Tut_Dru_Impro_02_DRM'
		Wait}
	training_hide_narrator
	training_clear_lesson_body_text
	training_add_lesson_body_text \{number = qs(0x22ee76e7)
		text = qs(0x09037c01)}
	training_show_lesson_header
	training_play_sound \{Sound = 'Tut_Dru_TwoHands_05_DRM'
		Wait}
	training_hide_narrator
	training_destroy_all_arrows
	training_set_task_header_body \{text = qs(0x4ce28461)}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0
		notes_required = 32}
	Change \{drum_notes_hit = 0}
	Change \{drum_notes_missed = 0}
	training_resume_gem_scroller
	drum_training_1_6_b_wait_for_hit_notes
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	training_destroy_gem_scroller
	training_hide_lesson_header
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_KickSong_03_DRM'
		Wait}
	training_hide_narrator
endscript

script drum_training_1_6_complete_message 

	training_generic_lesson_complete
endscript

script drum_training_1_7_show_lesson_header 

	training_set_lesson_header_text \{number = qs(0x74b4d161)
		text = qs(0x9612e33c)}
	training_show_lesson_header
	create_training_pause_handler
endscript

script drum_training_1_7_show_highway 

	setplayerinfo \{1
		four_lane_highway = 0}
	Change \{tutorial_disable_hud = 0}
	training_start_gem_scroller \{song = tut_demo
		part = drum}
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
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
	training_set_score \{score = 100805}
	training_wait_for_gem_scroller_startup
endscript

script drum_training_1_7_show_rock_meter 

	Wait \{3.6
		Second}
	training_pause_gem_scroller
	training_show_narrator \{narrator = 'drummer'}
	0x4de05aff \{mode = 0xe934a14a}
	training_play_sound \{Sound = 'Tut_Dru_UI_01_DRM'
		Wait}
	training_hide_narrator
	Change \{current_num_players = 1}
	training_add_arrow \{id = training_arrow2
		life = 2
		Pos = (375.0, 560.0)
		Scale = 2.3
		rot = 90}
	KillSpawnedScript \{Name = training_set_health}
	SpawnScriptNow \{training_set_health
		params = {
			health = 1.0
		}
		id = training_spawned_script}
	training_add_lesson_body_text \{number = 1
		text = qs(0x8ab3f5ed)}
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_UI_02_DRM'
		Wait}
	training_hide_narrator
	KillSpawnedScript \{Name = training_set_health}
	SpawnScriptNow \{training_set_health
		params = {
			health = 1.6
		}
		id = training_spawned_script}
	training_add_lesson_body_text \{number = 2
		text = qs(0x3b4b0d81)}
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_UI_03_DRM'
		Wait}
	training_hide_narrator
	KillSpawnedScript \{Name = training_set_health}
	SpawnScriptNow \{training_set_health
		params = {
			health = 0.4
		}
		id = training_spawned_script}
	training_add_lesson_body_text \{number = 3
		text = qs(0xec12d4ac)}
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_UI_04_DRM'
		Wait}
	training_hide_narrator
	training_start_hud_flashing_red
	training_add_lesson_body_text \{number = 4
		text = qs(0x19160b97)}
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_UI_05_DRM'
		Wait}
	Wait \{0.5
		Seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Dru_UI_06_DRM'
		Wait}
	training_hide_narrator
	training_stop_hud_flashing_red
endscript

script drum_training_1_7_point_out_score 

	KillSpawnedScript \{Name = training_set_health}
	SpawnScriptNow \{training_set_health
		params = {
			health = 1.0
		}
		id = training_spawned_script}
	training_add_arrow \{id = training_arrow2
		life = 2
		Pos = (930.0, 580.0)
		Scale = 2.3
		rot = -90}
	training_add_lesson_body_text \{number = 5
		text = qs(0xe9857154)}
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_UI_07_DRM'
		Wait}
	training_hide_narrator
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	training_destroy_gem_scroller
	training_resume_gem_scroller
endscript

script drum_training_1_7_complete_message 

	training_generic_lesson_complete
endscript

script drum_training_1_8_show_lesson_header 

	training_set_lesson_header_text \{number = qs(0xf32ccdae)
		text = qs(0xdd544c3f)}
	training_show_lesson_header
	create_training_pause_handler
endscript

script drum_training_1_8_show_highway 

	setplayerinfo \{1
		four_lane_highway = 0}
	Change \{tutorial_disable_hud = 1}
	training_start_gem_scroller \{song = tut_drum_break
		difficulty = medium
		part = drum
		disable_hud
		no_score_update}
	KillSpawnedScript \{Name = update_score_fast}
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{hit_notep1 drum_training_1_8_hit_note params = {<...>}}
		{missed_notep1 drum_training_1_8_missed_note}
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
	training_wait_for_gem_scroller_startup
endscript

script drum_training_1_8_hit_note 


	if GotParam \{drum_accent}
		Change drum_notes_hit = ($drum_notes_hit + 1)
		if (($drum_notes_hit = 1) || ($drum_notes_hit = 4))
			Random (
				@ training_play_sound \{Sound = 'Tut_Dru_Positive_01_DRM'}
				@ training_play_sound \{Sound = 'Tut_Dru_Positive_02_DRM'}
				@ training_play_sound \{Sound = 'Tut_Dru_Positive_03_DRM'}
				@ training_play_sound \{Sound = 'Tut_Dru_Positive_04_DRM'}
				@ training_play_sound \{Sound = 'Tut_Dru_Positive_05_DRM'}
				@ training_play_sound \{Sound = 'Tut_Dru_Positive_06_DRM'}
				@ training_play_sound \{Sound = 'Tut_Dru_Positive_07_DRM'}
				@ training_play_sound \{Sound = 'Tut_Dru_Positive_08_DRM'}
				)
		endif
		training_display_notes_hit \{notes_hit = $drum_notes_hit
			notes_required = 4}
	endif
endscript

script drum_training_1_8_missed_note 

	Change drum_notes_missed = ($drum_notes_missed + 1)
	if (($drum_notes_missed = 3) || ($drum_notes_missed = 6))
		Random (
			@ training_play_sound \{Sound = 'Tut_Dru_Accents_05_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Accents_06_DRM'}
			)
	endif
endscript

script drum_training_1_8_wait_for_hit_notes 

	begin
	if ($training_song_over = 1)
		return
	endif
	if ($drum_notes_hit >= 4)
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script drum_training_1_8_show_items_on_highway 

	Wait \{3.6
		Seconds}
	training_pause_gem_scroller
	if training_are_notes_flipped
		training_add_arrow \{id = training_arrow
			life = 3.0
			Pos = (735.0, 360.0)
			Scale = 2.3}
	else
		training_add_arrow \{id = training_arrow
			life = 3.0
			Pos = (545.0, 360.0)
			Scale = 2.3}
	endif
	training_show_narrator \{narrator = 'drummer'}
	0x4de05aff \{mode = 0x6b3cd028}
	training_play_sound \{Sound = 'Tut_Dru_Accents_01_DRM'
		Wait}
	training_play_sound \{Sound = 'Tut_Dru_Accents_02_DRM'
		Wait}
	training_hide_narrator
endscript

script drum_training_1_8_add_play_each_note_task 

	training_add_lesson_body_text \{number = qs(0x22ee76e7)
		text = qs(0x858b2246)}
	training_show_lesson_header
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_Accents_03_DRM'
		Wait}
	training_hide_narrator
	training_set_task_header_body \{text = qs(0x5553a14e)}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0
		notes_required = 4}
	training_destroy_all_arrows
	Change \{drum_notes_hit = 0}
	Change \{drum_notes_missed = 0}
	training_resume_gem_scroller
	drum_training_1_8_wait_for_hit_notes
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	training_destroy_gem_scroller \{still_in_training = 0}
	training_hide_lesson_header
	Wait \{2
		Seconds}
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_Accents_04_DRM'
		Wait}
	training_hide_narrator
endscript

script drum_training_1_8_complete_message 

	training_destroy_title
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
		create_training_pause_handler
	endif
	training_hide_lesson_header
	training_destroy_gem_scroller
	SoundEvent \{event = Tutorial_Mode_Finish_Chord}
	SpawnScriptNow \{create_exploding_text
		id = training_spawned_script
		params = {
			parent = 'lesson_complete'
			text = qs(0x6ae69bf8)
			text_physics = 0
			placement = ps2_tut_top
		}}
	SpawnScriptNow \{create_exploding_text
		id = training_spawned_script
		params = {
			parent = 'complete_text'
			text = qs(0x232d1eaf)
			text_physics = 0
			placement = ps2_tut_bottom
		}}
	Wait \{7
		Seconds
		ignoreslomo}
	KillSpawnedScript \{Name = create_exploding_text}
	destroy_all_exploding_text
	Change g_training_lessons_completed = ($g_training_lessons_completed + 1)
endscript

script drum_training_basic_tutorial_end 

	if ($g_training_lessons_completed = 8)
		SetGlobalTags \{training
			params = {
				drum_basic_lesson = complete
			}}
	endif
	training_kill_session
	safe_destroy \{id = training_container}
	safe_destroy \{id = training_arrow}
	safe_destroy \{id = training_strum_arrow}
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
	Change \{tutorial_disable_hud = 0}
	training_check_for_all_tutorials_finished
	decide_tutorial_back_destination
endscript
