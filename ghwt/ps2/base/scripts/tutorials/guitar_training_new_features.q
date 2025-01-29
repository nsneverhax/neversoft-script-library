training_new_features_tutorial_script = [
	{
		call = training_new_features_tutorial_startup
	}
	{
		lesson = 1
		call = training_5_1_show_title
	}
	{
		call = training_5_1_start_gem_scroller
	}
	{
		call = training_5_1_explain
	}
	{
		call = training_5_1_wait_for_extended_sustains
	}
	{
		call = training_5_1_complete_message
	}
	{
		lesson = 2
		call = training_5_2_start_gem_scroller
	}
	{
		call = training_5_2_explain
	}
	{
		call = training_5_2_wait_for_slider_tapping
	}
	{
		call = training_5_2_complete_message
	}
	{
		lesson = 3
		call = training_5_3_start_gem_scroller
	}
	{
		call = training_5_3_explain
	}
	{
		call = training_5_3_wait_for_slider_strumming
	}
	{
		call = training_5_3_complete_message
	}
	{
		lesson = 4
		call = training_5_4_start_gem_scroller
	}
	{
		call = training_5_4_explain
	}
	{
		call = training_5_4_wait_for_slider_wah
	}
	{
		call = training_5_4_complete_message
	}
	{
		call = training_new_features_tutorial_1_end
	}
]
training_using_slider = 0

script training_new_features_tutorial_startup 
	training_init_session
	0xc1c4e84c \{mode = tutorials
		tutorial = 0x0756afc0}
	LaunchEvent \{Type = unfocus
		target = root_window}
	create_training_pause_handler
	training_create_narrator_icons
	if isguitartouchcontroller controller = ($player1_status.controller)
		Change \{training_using_slider = 1}
	else
		Change \{training_using_slider = 0}
	endif
endscript

script training_5_1_show_title 
	Change \{g_training_lessons_completed = 0}
	training_show_title \{title = qs(0x2e341e7e)}
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

script training_5_1_start_gem_scroller 
	training_start_gem_scroller \{bot_array = [
			0
			0
			0
			0
		]
		song = tut_gtr_extsus
		disable_hud}
	KillSpawnedScript \{Name = update_score_fast}
	training_wait_for_gem_scroller_startup
endscript

script training_5_1_explain 
	Wait \{3.5
		Seconds
		ignoreslomo}
	training_set_lesson_header_text \{number = qs(0x22ee76e7)
		text = qs(0x3e3b12b6)}
	training_add_lesson_body_text \{number = 1
		text = qs(0xd99e5c44)}
	training_add_lesson_body_text \{number = 2
		text = qs(0x4be951b1)}
	training_show_lesson_header
	training_show_narrator \{narrator = 'guitarist'}
	training_pause_gem_scroller
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{hit_notesp1 lesson5_extended_sustain_note}
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
	0x4de05aff \{mode = 0x5612d804}
	training_play_sound \{Sound = 'Tut_Gtr_Sustains_01_GTR'
		Wait}
	Wait \{0.5
		Seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Gtr_Sustains_02_GTR'
		Wait}
	Wait \{0.5
		Seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Gtr_Sustains_03_GTR'
		Wait}
	Wait \{0.5
		Seconds
		ignoreslomo}
	training_set_task_header_body \{text = qs(0xba01bd96)}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0
		notes_required = 6}
	training_play_sound \{Sound = 'Tut_Gtr_Sustains_04_GTR'
		Wait}
	Wait \{1
		Seconds
		ignoreslomo}
	training_resume_gem_scroller
endscript

script lesson5_extended_sustain_note 
	Wait \{1
		gameframe}
	getplayerinfo \{1
		extended_sustain_percent_hold}
	if NOT (<extended_sustain_percent_hold> < 1.0)
		Change training_extended_sustains_played = ($training_extended_sustains_played + 1)
	endif
	if ScreenElementExists \{id = lessonheader}
		training_display_notes_hit notes_hit = ($training_extended_sustains_played) notes_required = 6
	endif
endscript
training_extended_sustains_played = 0

script training_5_1_wait_for_extended_sustains 
	Change \{training_extended_sustains_played = 0}
	begin
	if ($training_song_over = 1)
		break
	endif
	if ($training_extended_sustains_played >= 6)
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

script training_5_1_complete_message 
	if ScreenElementExists \{id = notes_hit_text}
		DestroyScreenElement \{id = notes_hit_text}
	endif
	Wait \{0.75
		Seconds
		ignoreslomo}
	training_hide_lesson_header
	training_destroy_gem_scroller
	SoundEvent \{event = Tutorial_Mode_Finish_Chord}
	training_hide_narrator
	SpawnScriptNow \{create_exploding_text
		id = training_spawned_script
		params = {
			parent = 'lesson_complete'
			text = qs(0xd50843f0)
			text_physics = 0
		}}
	training_play_sound \{Sound = 'Tut_Gtr_Sustains_13_GTR'
		Wait}
	Wait \{5
		Seconds
		ignoreslomo}
	KillSpawnedScript \{Name = create_exploding_text}
	destroy_exploding_text \{parent = 'lesson_complete'}
	training_play_sound \{Sound = 'Tut_Gtr_SliderTap_01_GTR'
		Wait}
	Wait \{1
		Seconds
		ignoreslomo}
	Change g_training_lessons_completed = ($g_training_lessons_completed + 1)
endscript

script training_5_2_start_gem_scroller 
	training_set_lesson_header_text \{number = qs(0x09c32524)
		text = qs(0xc1be6d8a)}
	training_clear_lesson_body_text
	training_show_lesson_header
	training_show_narrator \{narrator = 'guitarist'}
	0x4de05aff \{mode = 0xef6f6ccd}
	training_start_gem_scroller \{bot_array = [
			0
			0
			0
			0
		]
		song = tut_gtr_slide
		disable_hud}
	KillSpawnedScript \{Name = update_score_fast}
	Change \{training_slider_notes_played = 0}
	training_wait_for_gem_scroller_startup
endscript
training_slider_notes_played = 0

script training_5_2_explain 
	Wait \{3
		Seconds
		ignoreslomo}
	training_pause_gem_scroller
	training_add_lesson_body_text \{number = 1
		text = qs(0xa2b3e3de)}
	training_add_lesson_body_text \{number = 2
		text = qs(0x5bf0a85e)}
	training_add_lesson_body_text \{number = 3
		text = qs(0xab7a9154)}
	training_show_lesson_header
	training_play_sound \{Sound = 'Tut_Gtr_SliderTap_02_GTR'
		Wait}
	Wait \{0.5
		Seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Gtr_SliderTap_03_GTR'
		Wait}
	Wait \{0.5
		Seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Gtr_SliderTap_04_GTR'
		Wait}
	Wait \{0.5
		Seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Gtr_SliderTap_05_GTR'
		Wait}
	Wait \{0.5
		Seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Gtr_SliderTap_06_GTR'
		Wait}
	Wait \{0.5
		Seconds
		ignoreslomo}
	training_set_task_header_body \{text = qs(0x58f9c563)}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0}
	training_play_sound \{Sound = 'Tut_Gtr_SliderTap_07_GTR'
		Wait}
	Wait \{1
		Seconds
		ignoreslomo}
	training_resume_gem_scroller
endscript

script training_5_2_wait_for_slider_tapping 
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{hit_notesp1 lesson5_slider_note}
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
	Change \{training_slider_notes_played = 0}
	Change \{training_song_over = 0}
	begin
	if ($training_song_over = 1)
		break
	endif
	if ($training_slider_notes_played >= 8)
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

script lesson5_slider_note 
	Change training_slider_notes_played = ($training_slider_notes_played + 1)
	training_display_notes_hit notes_hit = ($training_slider_notes_played)
endscript

script training_5_2_complete_message 
	if ScreenElementExists \{id = notes_hit_text}
		DestroyScreenElement \{id = notes_hit_text}
	endif
	Wait \{0.75
		Seconds
		ignoreslomo}
	training_hide_lesson_header
	training_destroy_gem_scroller
	if isguitartouchcontroller controller = ($player1_status.controller)
		Change \{training_using_slider = 1}
	else
		Change \{training_using_slider = 0}
	endif
	if ($training_using_slider = 0)
		training_show_narrator \{narrator = 'guitarist'}
		training_play_sound \{Sound = 'Tut_Gtr_SliderTap_14_GTR'
			Wait}
		Wait \{0.5
			Seconds
			ignoreslomo}
		training_play_sound \{Sound = 'Tut_Gtr_SliderTap_17_GTR'
			Wait}
		Wait \{0.5
			Seconds
			ignoreslomo}
		training_play_sound \{Sound = 'Tut_Gtr_SliderTap_18_GTR'
			Wait}
		training_hide_narrator \{narrator = 'guitarist'}
		Wait \{0.5
			Seconds
			ignoreslomo}
		SoundEvent \{event = Tutorial_Mode_Finish_Chord}
		SpawnScriptNow \{create_exploding_text
			id = training_spawned_script
			params = {
				parent = 'lesson_complete'
				text = qs(0x2e341e7e)
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
	else
		SoundEvent \{event = Tutorial_Mode_Finish_Chord}
		SpawnScriptNow \{create_exploding_text
			id = training_spawned_script
			params = {
				parent = 'lesson_complete'
				text = qs(0xd50843f0)
				text_physics = 0
			}}
	endif
	training_hide_narrator \{narrator = 'guitarist'}
	Wait \{7
		Seconds
		ignoreslomo}
	KillSpawnedScript \{Name = create_exploding_text}
	destroy_all_exploding_text
	Change g_training_lessons_completed = ($g_training_lessons_completed + 1)
endscript

script training_5_3_start_gem_scroller 
	if ($training_using_slider = 0)
		return
	endif
	training_set_lesson_header_text \{number = qs(0x10d81465)
		text = qs(0x00304991)}
	training_clear_lesson_body_text
	training_show_lesson_header
	training_show_narrator \{narrator = 'guitarist'}
	training_start_gem_scroller \{bot_array = [
			0
			0
			0
			0
		]
		song = tut_gtr_diffnotes
		disable_hud}
	KillSpawnedScript \{Name = update_score_fast}
	Change \{training_slider_notes_played = 0}
	training_wait_for_gem_scroller_startup
endscript

script training_5_3_explain 
	if ($training_using_slider = 0)
		return
	endif
	Wait \{3
		Seconds
		ignoreslomo}
	training_pause_gem_scroller
	training_add_lesson_body_text \{number = 1
		text = qs(0xa9b65c41)}
	training_add_lesson_body_text \{number = 2
		text = qs(0x5eec2760)}
	training_show_lesson_header
	training_play_sound \{Sound = 'Tut_Gtr_SliderTap_14_GTR'
		Wait}
	Wait \{0.5
		Seconds
		ignoreslomo}
	training_set_task_header_body \{text = qs(0xe8266e5a)}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0}
	training_play_sound \{Sound = 'Tut_Gtr_SliderTap_15_GTR'
		Wait}
	Wait \{1
		Seconds
		ignoreslomo}
	training_resume_gem_scroller
endscript

script training_5_3_wait_for_slider_strumming 
	if ($training_using_slider = 0)
		return
	endif
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{hit_notesp1 lesson5_slider_strum}
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
	Change \{training_slider_notes_played = 0}
	Change \{training_song_over = 0}
	begin
	if ($training_song_over = 1)
		break
	endif
	if ($training_slider_notes_played >= 8)
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

script lesson5_slider_strum 
	if (<hit_note_touch> = 1)
		Change training_slider_notes_played = ($training_slider_notes_played + 1)
		training_display_notes_hit notes_hit = ($training_slider_notes_played)
	endif
endscript

script training_5_3_complete_message 
	if ($training_using_slider = 0)
		return
	endif
	if ScreenElementExists \{id = notes_hit_text}
		DestroyScreenElement \{id = notes_hit_text}
	endif
	Wait \{0.75
		Seconds
		ignoreslomo}
	training_hide_lesson_header
	training_destroy_gem_scroller
	SoundEvent \{event = Tutorial_Mode_Finish_Chord}
	SpawnScriptNow \{create_exploding_text
		id = training_spawned_script
		params = {
			parent = 'lesson_complete'
			text = qs(0xd50843f0)
			text_physics = 0
		}}
	training_hide_narrator \{narrator = 'guitarist'}
	Wait \{7
		Seconds
		ignoreslomo}
	KillSpawnedScript \{Name = create_exploding_text}
	destroy_all_exploding_text
endscript

script training_5_4_start_gem_scroller 
	if ($training_using_slider = 0)
		return
	endif
	training_set_lesson_header_text \{number = qs(0x5f9982a2)
		text = qs(0x610d9df6)}
	training_clear_lesson_body_text
	training_show_lesson_header
	training_show_narrator \{narrator = 'guitarist'}
	training_start_gem_scroller \{bot_array = [
			0
			0
			0
			0
		]
		song = tut_gtr_longnotes
		disable_hud}
	KillSpawnedScript \{Name = update_score_fast}
	Change \{training_slider_notes_played = 0}
	training_wait_for_gem_scroller_startup
endscript

script training_5_4_explain 
	if ($training_using_slider = 0)
		return
	endif
	Wait \{3
		Seconds
		ignoreslomo}
	training_pause_gem_scroller
	training_add_lesson_body_text \{number = 1
		text = qs(0xe6ce9e4b)}
	training_add_lesson_body_text \{number = 2
		text = qs(0xd5ea06d3)}
	training_show_lesson_header
	training_play_sound \{Sound = 'Tut_Gtr_SliderTap_17_GTR'
		Wait}
	Wait \{0.5
		Seconds
		ignoreslomo}
	training_set_task_header_body \{text = qs(0xfbf25629)}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0}
	training_play_sound \{Sound = 'Tut_Gtr_SliderTap_07_GTR'
		Wait}
	Wait \{1
		Seconds
		ignoreslomo}
	training_resume_gem_scroller
endscript

script training_5_4_wait_for_slider_wah 
	if ($training_using_slider = 0)
		return
	endif
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{whammy_offp1 lesson5_slider_wah}
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
	Change \{training_slider_notes_played = 0}
	Change \{training_song_over = 0}
	begin
	if ($training_song_over = 1)
		break
	endif
	if ($training_slider_notes_played >= 8)
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

script lesson5_slider_wah 
	if (<touch_wah> = 1)
		Change training_slider_notes_played = ($training_slider_notes_played + 1)
		training_display_notes_hit notes_hit = ($training_slider_notes_played)
	endif
endscript

script training_5_4_complete_message 
	if ($training_using_slider = 0)
		return
	endif
	if ScreenElementExists \{id = notes_hit_text}
		DestroyScreenElement \{id = notes_hit_text}
	endif
	Wait \{0.75
		Seconds
		ignoreslomo}
	training_hide_lesson_header
	training_destroy_gem_scroller
	SoundEvent \{event = Tutorial_Mode_Finish_Chord}
	SpawnScriptNow \{create_exploding_text
		id = training_spawned_script
		params = {
			parent = 'lesson_complete'
			text = qs(0x2e341e7e)
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
	training_hide_narrator \{narrator = 'guitarist'}
	training_play_sound \{Sound = 'Tut_Gtr_SliderTap_18_GTR'}
	Wait \{7
		Seconds
		ignoreslomo}
	training_wait_for_sound \{Sound = 'Tut_Gtr_SliderTap_18_GTR'}
	KillSpawnedScript \{Name = create_exploding_text}
	destroy_all_exploding_text
endscript

script training_new_features_tutorial_1_end 
	training_container :GetTags
	if ($g_training_lessons_completed = 2)
		SetGlobalTags \{training
			params = {
				new_features_lesson = complete
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

script training_check_for_all_tutorials_finished 
	if NOT ($is_attract_mode = 1)
	endif
	GetGlobalTags \{training}
	if (<basic_lesson> != complete)
		return
	endif
	if (<star_power_lesson> != complete)
		return
	endif
	if (<advanced_techniques_lesson> != complete)
		return
	endif
	if (<new_features_lesson> != complete)
		return
	endif
	if (<drum_basic_lesson> != complete)
		return
	endif
	if (<drum_int_lesson> != complete)
		return
	endif
endscript
