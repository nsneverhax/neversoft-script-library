training_drum_int_tutorial_script = [
	{
		call = training_drum_int_tutorial_startup
	}
	{
		time = 1000
		call = training_drum_int_tutorial_show_title
	}
	{
		lesson = 1
		call = drum_training_2_1_show_lesson_header
	}
	{
		call = drum_training_2_1_show_highway
	}
	{
		call = drum_training_2_1_add_play_each_note_task
	}
	{
		call = drum_training_2_1_complete_message
	}
	{
		lesson = 2
		call = drum_training_2_2_show_lesson_header
	}
	{
		call = drum_training_2_2_show_highway
	}
	{
		call = drum_training_2_2_add_play_each_note_task
	}
	{
		call = drum_training_2_2_complete_message
	}
	{
		lesson = 3
		call = drum_training_2_3_show_lesson_header
	}
	{
		call = drum_training_2_3_show_highway
	}
	{
		call = drum_training_2_3_add_play_each_note_task
	}
	{
		call = drum_training_2_3_complete_message
	}
	{
		lesson = 4
		call = drum_training_2_4_show_lesson_header
	}
	{
		call = drum_training_2_4_show_highway
	}
	{
		call = drum_training_2_4_show_items_on_highway
	}
	{
		call = drum_training_2_4_add_play_each_note_task
	}
	{
		call = drum_training_2_4_complete_message
	}
	{
		lesson = 5
		call = drum_training_2_5_show_lesson_header
	}
	{
		call = drum_training_2_5_show_highway
	}
	{
		call = drum_training_2_5_add_play_each_note_task
	}
	{
		call = drum_training_2_5_complete_message
	}
	{
		call = drum_training_int_tutorial_end
	}
]

script drum_training_int_generic_hit_note \{notes_required = 8}
	printf \{qs(0x972af5bc)}
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
	training_display_notes_hit notes_hit = $drum_notes_hit notes_required = <notes_required>
endscript

script training_drum_int_tutorial_startup 
	printf \{qs(0x9072d5d6)}
	training_init_session
	0xc1c4e84c \{mode = tutorials
		tutorial = 0xf7b87c0c}
	LaunchEvent \{Type = unfocus
		target = root_window}
	create_training_pause_handler
	training_create_narrator_icons
endscript

script training_drum_int_tutorial_show_title 
	Change \{g_training_lessons_completed = 0}
	printf \{qs(0x3370c46e)}
	training_show_title \{title = qs(0x169eb59c)}
	begin
	if ($transitions_locked = 0)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	create_training_pause_handler
	Wait \{5
		Seconds}
	training_destroy_title
endscript

script drum_training_2_1_show_lesson_header 
	printf \{qs(0x87d71307)}
	training_set_lesson_header_text \{number = qs(0x22ee76e7)
		text = qs(0xb060d74f)}
	training_show_lesson_header
	create_training_pause_handler
endscript

script drum_training_2_1_hit_note 
	printf \{qs(0xd070f05c)}
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
		notes_required = 16}
endscript

script drum_training_2_1_missed_note 
	printf \{qs(0x1e7c3658)}
	Change drum_notes_missed = ($drum_notes_missed + 1)
	if (($drum_notes_missed = 6) || ($drum_notes_missed = 12))
		Random (
			@ training_play_sound \{Sound = 'Tut_Dru_FirstDrum_06_DRM'
				Wait}
			@ training_play_sound \{Sound = 'Tut_Dru_FirstDrum_07_DRM'
				Wait}
			)
	endif
endscript

script drum_training_2_1_wait_for_hit_notes 
	printf \{qs(0xf5a28c82)}
	begin
	if ($training_song_over = 1)
		return
	endif
	if ($drum_notes_hit >= 16)
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script drum_training_2_1_show_highway 
	printf \{qs(0x5a6290f1)}
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_FirstDrum_01_DRM'
		Wait}
	training_hide_narrator
	Change \{tutorial_disable_hud = 1}
	setplayerinfo \{1
		four_lane_highway = 0}
	training_start_gem_scroller \{song = tut_drum_beat1
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
		{hit_notesp1 drum_training_2_1_hit_note}
		{missed_notep1 drum_training_2_1_missed_note}
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

script drum_training_2_1_add_play_each_note_task 
	printf \{qs(0x14127b68)}
	Wait \{4.6
		Seconds}
	training_pause_gem_scroller
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_FirstDrum_02_DRM'
		Wait}
	training_play_sound \{Sound = 'Tut_Dru_FirstDrum_03_DRM'
		Wait}
	training_add_lesson_body_text \{number = qs(0x22ee76e7)
		text = qs(0x74c7da4c)}
	training_show_lesson_header
	training_play_sound \{Sound = 'Tut_Dru_FirstDrum_04_DRM'
		Wait}
	training_hide_narrator
	Change \{drum_notes_hit = 0}
	Change \{drum_notes_missed = 0}
	training_set_task_header_body \{text = qs(0xf7c28f6a)}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0
		notes_required = 16}
	training_resume_gem_scroller
	drum_training_2_1_wait_for_hit_notes
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	training_destroy_gem_scroller
	training_hide_lesson_header
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_FirstDrum_05_DRM'
		Wait}
	training_hide_narrator
endscript

script drum_training_2_1_complete_message 
	printf \{qs(0x132388b9)}
	training_generic_lesson_complete
endscript

script drum_training_2_2_show_lesson_header 
	printf \{qs(0xad6ba38f)}
	training_set_lesson_header_text \{number = qs(0x09c32524)
		text = qs(0xd449216b)}
	training_show_lesson_header
	create_training_pause_handler
endscript

script drum_training_2_2_hit_note 
	printf \{qs(0x7fd9bd96)}
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
		notes_required = 20}
endscript

script drum_training_2_2_missed_note 
	printf \{qs(0xec2bdba0)}
	Change drum_notes_missed = ($drum_notes_missed + 1)
	if (($drum_notes_missed = 8) || ($drum_notes_missed = 16))
		Random (
			@ training_play_sound \{Sound = 'Tut_Dru_AddDrum_03_DRM'
				Wait}
			@ training_play_sound \{Sound = 'Tut_Dru_AddDrum_04_DRM'
				Wait}
			)
	endif
endscript

script drum_training_2_2_wait_for_hit_notes 
	printf \{qs(0xdf1e3c0a)}
	begin
	if ($training_song_over = 1)
		return
	endif
	if ($drum_notes_hit >= 20)
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script drum_training_2_2_show_highway 
	printf \{qs(0x58bc97d6)}
	Change \{tutorial_disable_hud = 1}
	setplayerinfo \{1
		four_lane_highway = 0}
	training_start_gem_scroller \{song = tut_drum_beat2
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
		{hit_notesp1 drum_training_2_2_hit_note}
		{missed_notep1 drum_training_2_2_missed_note}
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

script drum_training_2_2_add_play_each_note_task 
	printf \{qs(0x4330573a)}
	Wait \{4.6
		Seconds}
	training_pause_gem_scroller
	training_add_lesson_body_text \{number = qs(0x22ee76e7)
		text = qs(0x74c7da4c)}
	training_show_lesson_header
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_AddDrum_01_DRM'
		Wait}
	training_hide_narrator
	training_set_task_header_body \{text = qs(0x4ed53bec)}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0
		notes_required = 20}
	Change \{drum_notes_hit = 0}
	Change \{drum_notes_missed = 0}
	training_resume_gem_scroller
	drum_training_2_2_wait_for_hit_notes
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	training_destroy_gem_scroller
	training_hide_lesson_header
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_AddDrum_02_DRM'
		Wait}
	training_hide_narrator
endscript

script drum_training_2_2_complete_message 
	printf \{qs(0x77c3f347)}
	training_generic_lesson_complete
endscript

script drum_training_2_3_show_lesson_header 
	printf \{qs(0x022f31c8)}
	0x928a98c9
	training_set_lesson_header_text \{number = qs(0x10d81465)
		text = qs(0xb911bea0)}
	training_show_lesson_header
	create_training_pause_handler
endscript

script drum_training_2_3_hit_note 
	printf \{qs(0x1abe86d0)}
	Change drum_notes_hit = ($drum_notes_hit + 1)
	if (($drum_notes_hit = 9) || ($drum_notes_hit = 18))
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
		notes_required = 24}
endscript

script drum_training_2_3_missed_note 
	printf \{qs(0x0b367d37)}
	Change drum_notes_missed = ($drum_notes_missed + 1)
	if (($drum_notes_missed = 10) || ($drum_notes_missed = 20))
		Random (
			@ training_play_sound \{Sound = 'Tut_Dru_AddKick_05_DRM'
				Wait}
			@ training_play_sound \{Sound = 'Tut_Dru_AddKick_06_DRM'
				Wait}
			)
	endif
endscript

script drum_training_2_3_wait_for_hit_notes 
	printf \{qs(0x705aae4d)}
	begin
	if ($training_song_over = 1)
		return
	endif
	if ($drum_notes_hit >= 24)
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script drum_training_2_3_show_highway 
	printf \{qs(0x59096acb)}
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_AddKick_01_DRM'
		Wait}
	training_hide_narrator
	Change \{tutorial_disable_hud = 1}
	setplayerinfo \{1
		four_lane_highway = 0}
	training_start_gem_scroller \{song = tut_drum_beat3
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
		{hit_notesp1 drum_training_2_3_hit_note}
		{missed_notep1 drum_training_2_3_missed_note}
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

script drum_training_2_3_add_play_each_note_task 
	printf \{qs(0xc7014ecb)}
	Wait \{4.6
		Seconds}
	training_pause_gem_scroller
	training_add_lesson_body_text \{number = qs(0x22ee76e7)
		text = qs(0x74c7da4c)}
	training_show_lesson_header
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_AddKick_02_DRM'
		Wait}
	training_play_sound \{Sound = 'Tut_Dru_AddKick_03_DRM'
		Wait}
	training_hide_narrator
	training_set_task_header_body \{text = qs(0x9ae4776b)}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0
		notes_required = 24}
	Change \{drum_notes_hit = 0}
	Change \{drum_notes_missed = 0}
	training_resume_gem_scroller
	drum_training_2_3_wait_for_hit_notes
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	training_destroy_gem_scroller
	training_hide_lesson_header
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_AddKick_04_DRM'
		Wait}
	training_hide_narrator
endscript

script drum_training_2_3_complete_message 
	printf \{qs(0xe2b327d2)}
	training_generic_lesson_complete
endscript

script drum_training_2_4_show_lesson_header 
	printf \{qs(0xf812c29f)}
	training_set_lesson_header_text \{number = qs(0x5f9982a2)
		text = qs(0x1f97460d)}
	training_show_lesson_header
	create_training_pause_handler
endscript

script drum_training_2_4_hit_note 
	printf \{qs(0xfbfa2043)}
	Change drum_notes_hit = ($drum_notes_hit + 1)
	if (($drum_notes_hit = 9) || ($drum_notes_hit = 18))
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
endscript

script drum_training_2_4_missed_note 
	printf \{qs(0xd3f50611)}
	Change drum_notes_missed = ($drum_notes_missed + 1)
	if (($drum_notes_missed = 5) || ($drum_notes_missed = 5))
		Random (
			@ training_play_sound \{Sound = 'Tut_Dru_StarCombo_08_DRM'
				Wait}
			@ training_play_sound \{Sound = 'Tut_Dru_StarCombo_09_DRM'
				Wait}
			)
	endif
endscript

script drum_training_2_4_wait_for_hit_notes 
	printf \{qs(0x8a675d1a)}
	begin
	if ($training_song_over = 1)
		return
	endif
	if ($player1_status.star_power_amount = 50)
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script drum_training_2_4_show_highway 
	printf \{qs(0x5d009998)}
	Change \{tutorial_disable_hud = 0}
	training_start_gem_scroller \{song = tut_drum_combos
		part = drum}
	KillSpawnedScript \{Name = update_score_fast}
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{hit_notesp1 drum_training_2_4_hit_note}
		{missed_notep1 drum_training_2_4_missed_note}
		{star_sequence_bonusp1 hit_star_power_sequence}
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

script drum_training_2_4_show_items_on_highway 
	printf \{qs(0x9d42a31a)}
	Wait \{3.6
		Seconds}
	training_pause_gem_scroller
	if training_are_notes_flipped
		training_add_arrow \{id = training_arrow
			life = 3.0
			Pos = (685.0, 360.0)
			Scale = 2.3}
	else
		training_add_arrow \{id = training_arrow
			life = 3.0
			Pos = (595.0, 360.0)
			Scale = 2.3}
	endif
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_StarCombo_01_DRM'
		Wait}
	training_hide_narrator
	training_add_lesson_body_text \{number = qs(0x22ee76e7)
		text = qs(0x4bbe07af)}
	training_show_lesson_header
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_StarCombo_02_DRM'
		Wait}
	training_play_sound \{Sound = 'Tut_Dru_StarCombo_03_DRM'
		Wait}
	training_play_sound \{Sound = 'Tut_Dru_StarCombo_04_DRM'
		Wait}
	training_hide_narrator
endscript

script drum_training_2_4_add_play_each_note_task 
	printf \{qs(0xed740f9e)}
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_StarCombo_05_DRM'
		Wait}
	training_hide_narrator
	training_set_task_header_body \{text = qs(0x557a11e2)}
	training_show_task_header
	Change \{drum_notes_hit = 0}
	Change \{drum_notes_missed = 0}
	training_resume_gem_scroller
	drum_training_2_4_wait_for_hit_notes
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	training_destroy_gem_scroller
	training_hide_lesson_header
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_StarCombo_06_DRM'
		Wait}
	training_hide_narrator
endscript

script drum_training_2_4_complete_message 
	printf \{qs(0xbe0304bb)}
	training_generic_lesson_complete
endscript

script drum_training_2_5_show_lesson_header 
	printf \{qs(0x575650d8)}
	training_set_lesson_header_text \{number = qs(0x4682b3e3)
		text = qs(0x8aca0b05)}
	training_show_lesson_header
	create_training_pause_handler
endscript

script drum_training_2_5_hit_note 
	printf \{qs(0x9e9d1b05)}
	if ($player1_status.star_power_used = 1)
		Change drum_notes_hit = ($drum_notes_hit + 1)
		if (($drum_notes_hit = 8) || ($drum_notes_hit = 12))
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
			notes_required = 16}
	endif
endscript

script drum_training_2_5_missed_note 
	printf \{qs(0x34e8a086)}
	Change drum_notes_missed = ($drum_notes_missed + 1)
	if (($drum_notes_missed = 5) || ($drum_notes_missed = 5))
		Random (
			@ training_play_sound )\{Sound = 'Tut_Dru_ActStarPow_09_DRM'
			Wait}

	endif
endscript

script drum_training_2_5_wait_for_hit_notes 
	printf \{qs(0x2523cf5d)}
	begin
	if ($training_song_over = 1)
		return
	endif
	if ($drum_notes_hit >= 16)
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script drum_training_2_5_show_highway 
	printf \{qs(0x5cb56485)}
	Change \{tutorial_disable_hud = 0}
	setplayerinfo \{1
		four_lane_highway = 0}
	training_start_gem_scroller \{song = tut_drum_activ
		part = drum
		no_score_update}
	KillSpawnedScript \{Name = update_score_fast}
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{hit_notesp1 drum_training_2_5_hit_note}
		{missed_notep1 drum_training_2_5_missed_note}
		{star_power_onp1 training_set_star_power_active}
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
	Change \{structurename = player1_status
		star_power_amount = 100}
	training_wait_for_gem_scroller_startup
endscript

script drum_training_2_5_add_play_each_note_task 
	printf \{qs(0x6945166f)}
	Wait \{3.6
		Seconds}
	training_pause_gem_scroller
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_ActStarPow_01_DRM'
		Wait}
	training_add_lesson_body_text \{number = qs(0x22ee76e7)
		text = qs(0x1733a043)}
	training_show_lesson_header
	training_play_sound \{Sound = 'Tut_Dru_ActStarPow_02_DRM'
		Wait}
	training_play_sound \{Sound = 'Tut_Dru_ActStarPow_03_DRM'
		Wait}
	training_play_sound \{Sound = 'Tut_Dru_ActStarPow_04_DRM'
		Wait}
	training_hide_narrator
	training_set_task_header_body \{text = qs(0x504d6d7f)}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0
		notes_required = 16}
	Change \{drum_notes_hit = 0}
	Change \{drum_notes_missed = 0}
	training_resume_gem_scroller
	drum_training_2_5_wait_for_hit_notes
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	training_destroy_gem_scroller \{still_in_training = 0}
	training_hide_lesson_header
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_ActStarPow_05_DRM'
		Wait}
	Wait \{0.5
		Seconds}
	training_play_sound \{Sound = 'Tut_Dru_ActStarPow_06_DRM'
		Wait}
	Wait \{0.5
		Seconds}
	training_play_sound \{Sound = 'Tut_Dru_ActStarPow_07_DRM'
		Wait}
	training_hide_narrator
endscript

script drum_training_2_5_complete_message 
	printf \{qs(0x2b73d02e)}
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
			text = qs(0x190dd763)
			text_physics = 0
			placement = ps2_tut_top
			fit_dims
		}}
	SpawnScriptNow \{create_exploding_text
		id = training_spawned_script
		params = {
			parent = 'complete_text'
			text = qs(0x232d1eaf)
			text_physics = 0
			placement = ps2_tut_bottom
			fit_dims
		}}
	Wait \{7
		Seconds
		ignoreslomo}
	KillSpawnedScript \{Name = create_exploding_text}
	destroy_all_exploding_text
	Change g_training_lessons_completed = ($g_training_lessons_completed + 1)
endscript

script drum_training_int_tutorial_end 
	training_container :GetTags
	if ($g_training_lessons_completed = 5)
		SetGlobalTags \{training
			params = {
				drum_int_lesson = complete
			}}
	endif
	training_kill_session
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
