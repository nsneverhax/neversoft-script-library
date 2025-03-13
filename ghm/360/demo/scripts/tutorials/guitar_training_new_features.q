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
	launchevent \{type = unfocus
		target = root_window}
	create_training_pause_handler
	training_create_narrator_icons
	if isguitartouchcontroller controller = ($player1_status.controller)
		change \{training_using_slider = 1}
	else
		change \{training_using_slider = 0}
	endif
endscript

script training_5_1_show_title 
	change \{g_training_lessons_completed = 0}
	training_show_title \{title = qs(0x2e341e7e)}
	begin
	if ($transitions_locked = 0)
		break
	endif
	wait \{1
		gameframe}
	repeat
	create_training_pause_handler
	wait \{3
		seconds}
	training_destroy_title
endscript

script training_5_1_start_gem_scroller 
	training_start_gem_scroller \{part = guitar
		bot_array = [
			0
			0
			0
			0
		]
		song = tut_gtr_extsus
		disable_hud}
	killspawnedscript \{name = update_score_fast}
	training_wait_for_gem_scroller_startup
endscript

script training_5_1_explain 
	wait \{3.5
		seconds
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
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
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
	launchevent \{type = focus
		target = menu_tutorial}
	training_play_sound \{sound = 'Tut_Gtr_Sustains_01_GTR'
		wait}
	wait \{0.5
		seconds
		ignoreslomo}
	training_play_sound \{sound = 'Tut_Gtr_Sustains_02_GTR'
		wait}
	wait \{0.5
		seconds
		ignoreslomo}
	training_play_sound \{sound = 'Tut_Gtr_Sustains_03_GTR'
		wait}
	wait \{0.5
		seconds
		ignoreslomo}
	training_set_task_header_body \{text = qs(0xba01bd96)}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0
		notes_required = 6}
	training_play_sound \{sound = 'Tut_Gtr_Sustains_04_GTR'
		wait}
	wait \{1
		seconds
		ignoreslomo}
	training_resume_gem_scroller
endscript

script lesson5_extended_sustain_note 
	wait \{1
		gameframe}
	getplayerinfo \{1
		extended_sustain_percent_hold}
	if NOT (<extended_sustain_percent_hold> < 1.0)
		change training_extended_sustains_played = ($training_extended_sustains_played + 1)
	endif
	if screenelementexists \{id = lessonheader}
		training_display_notes_hit notes_hit = ($training_extended_sustains_played) notes_required = 6
	endif
endscript
training_extended_sustains_played = 0

script training_5_1_wait_for_extended_sustains 
	change \{training_extended_sustains_played = 0}
	begin
	if ($training_song_over = 1)
		break
	endif
	if ($training_extended_sustains_played >= 6)
		break
	endif
	wait \{1
		gameframe}
	repeat
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
		create_training_pause_handler
	endif
	wait \{1
		seconds
		ignoreslomo}
endscript

script training_5_1_complete_message 
	if screenelementexists \{id = notes_hit_text}
		destroyscreenelement \{id = notes_hit_text}
	endif
	wait \{0.75
		seconds
		ignoreslomo}
	training_hide_lesson_header
	training_destroy_gem_scroller
	soundevent \{event = tutorial_mode_finish_chord}
	training_hide_narrator
	spawnscriptnow \{create_exploding_text
		id = training_spawned_script
		params = {
			parent = 'lesson_complete'
			text = qs(0xd50843f0)
			text_physics = 0
		}}
	training_play_sound \{sound = 'Tut_Gtr_Sustains_13_GTR'
		wait}
	wait \{5
		seconds
		ignoreslomo}
	killspawnedscript \{name = create_exploding_text}
	destroy_exploding_text \{parent = 'lesson_complete'}
	training_play_sound \{sound = 'Tut_Gtr_SliderTap_01_GTR'
		wait}
	wait \{1
		seconds
		ignoreslomo}
	change g_training_lessons_completed = ($g_training_lessons_completed + 1)
endscript

script training_5_2_start_gem_scroller 
	training_set_lesson_header_text \{number = qs(0x09c32524)
		text = qs(0xc1be6d8a)}
	training_clear_lesson_body_text
	training_show_lesson_header
	training_show_narrator \{narrator = 'guitarist'}
	training_start_gem_scroller \{part = guitar
		bot_array = [
			0
			0
			0
			0
		]
		song = tut_gtr_slide
		disable_hud}
	killspawnedscript \{name = update_score_fast}
	change \{training_slider_notes_played = 0}
	training_wait_for_gem_scroller_startup
endscript
training_slider_notes_played = 0

script training_5_2_explain 
	wait \{3
		seconds
		ignoreslomo}
	training_pause_gem_scroller
	training_add_lesson_body_text \{number = 1
		text = qs(0xa2b3e3de)}
	training_add_lesson_body_text \{number = 2
		text = qs(0x5bf0a85e)}
	training_add_lesson_body_text \{number = 3
		text = qs(0xab7a9154)}
	training_show_lesson_header
	training_play_sound \{sound = 'Tut_Gtr_SliderTap_02_GTR'
		wait}
	wait \{0.5
		seconds
		ignoreslomo}
	training_play_sound \{sound = 'Tut_Gtr_SliderTap_03_GTR'
		wait}
	wait \{0.5
		seconds
		ignoreslomo}
	training_play_sound \{sound = 'Tut_Gtr_SliderTap_04_GTR'
		wait}
	wait \{0.5
		seconds
		ignoreslomo}
	training_play_sound \{sound = 'Tut_Gtr_SliderTap_05_GTR'
		wait}
	wait \{0.5
		seconds
		ignoreslomo}
	training_play_sound \{sound = 'Tut_Gtr_SliderTap_06_GTR'
		wait}
	wait \{0.5
		seconds
		ignoreslomo}
	training_set_task_header_body \{text = qs(0x58f9c563)}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0}
	training_play_sound \{sound = 'Tut_Gtr_SliderTap_07_GTR'
		wait}
	wait \{1
		seconds
		ignoreslomo}
	training_resume_gem_scroller
endscript

script training_5_2_wait_for_slider_tapping 
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
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
	launchevent \{type = focus
		target = menu_tutorial}
	change \{training_slider_notes_played = 0}
	change \{training_song_over = 0}
	begin
	if ($training_song_over = 1)
		break
	endif
	if ($training_slider_notes_played >= 8)
		break
	endif
	wait \{1
		gameframe}
	repeat
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
		create_training_pause_handler
	endif
	wait \{1
		seconds
		ignoreslomo}
endscript

script lesson5_slider_note 
	if (<hammer_strum> = 1)
		change training_slider_notes_played = ($training_slider_notes_played + 1)
		training_display_notes_hit notes_hit = ($training_slider_notes_played)
	endif
endscript

script training_5_2_complete_message 
	if screenelementexists \{id = notes_hit_text}
		destroyscreenelement \{id = notes_hit_text}
	endif
	wait \{0.75
		seconds
		ignoreslomo}
	training_hide_lesson_header
	training_destroy_gem_scroller
	if isguitartouchcontroller controller = ($player1_status.controller)
		change \{training_using_slider = 1}
	else
		change \{training_using_slider = 0}
	endif
	if ($training_using_slider = 0)
		training_show_narrator \{narrator = 'guitarist'}
		training_play_sound \{sound = 'Tut_Gtr_SliderTap_14_GTR'
			wait}
		wait \{0.5
			seconds
			ignoreslomo}
		training_play_sound \{sound = 'Tut_Gtr_SliderTap_17_GTR'
			wait}
		wait \{0.5
			seconds
			ignoreslomo}
		training_play_sound \{sound = 'Tut_Gtr_SliderTap_18_GTR'
			wait}
		training_hide_narrator \{narrator = 'guitarist'}
		wait \{0.5
			seconds
			ignoreslomo}
		soundevent \{event = tutorial_mode_finish_chord}
		spawnscriptnow \{create_exploding_text
			id = training_spawned_script
			params = {
				parent = 'lesson_complete'
				text = qs(0x2e341e7e)
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
	else
		soundevent \{event = tutorial_mode_finish_chord}
		spawnscriptnow \{create_exploding_text
			id = training_spawned_script
			params = {
				parent = 'lesson_complete'
				text = qs(0xd50843f0)
				text_physics = 0
			}}
	endif
	training_hide_narrator \{narrator = 'guitarist'}
	wait \{7
		seconds
		ignoreslomo}
	killspawnedscript \{name = create_exploding_text}
	destroy_all_exploding_text
	change g_training_lessons_completed = ($g_training_lessons_completed + 1)
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
	training_start_gem_scroller \{part = guitar
		bot_array = [
			0
			0
			0
			0
		]
		song = tut_gtr_diffnotes
		disable_hud}
	killspawnedscript \{name = update_score_fast}
	change \{training_slider_notes_played = 0}
	training_wait_for_gem_scroller_startup
endscript

script training_5_3_explain 
	if ($training_using_slider = 0)
		return
	endif
	wait \{3
		seconds
		ignoreslomo}
	training_pause_gem_scroller
	training_add_lesson_body_text \{number = 1
		text = qs(0xa9b65c41)}
	training_add_lesson_body_text \{number = 2
		text = qs(0x5eec2760)}
	training_show_lesson_header
	training_play_sound \{sound = 'Tut_Gtr_SliderTap_14_GTR'
		wait}
	wait \{0.5
		seconds
		ignoreslomo}
	training_set_task_header_body \{text = qs(0xe8266e5a)}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0}
	training_play_sound \{sound = 'Tut_Gtr_SliderTap_15_GTR'
		wait}
	wait \{1
		seconds
		ignoreslomo}
	training_resume_gem_scroller
endscript

script training_5_3_wait_for_slider_strumming 
	if ($training_using_slider = 0)
		return
	endif
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
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
	launchevent \{type = focus
		target = menu_tutorial}
	change \{training_slider_notes_played = 0}
	change \{training_song_over = 0}
	begin
	if ($training_song_over = 1)
		break
	endif
	if ($training_slider_notes_played >= 8)
		break
	endif
	wait \{1
		gameframe}
	repeat
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
		create_training_pause_handler
	endif
	wait \{1
		seconds
		ignoreslomo}
endscript

script lesson5_slider_strum 
	if (<hit_note_touch> = 1)
		change training_slider_notes_played = ($training_slider_notes_played + 1)
		training_display_notes_hit notes_hit = ($training_slider_notes_played)
	endif
endscript

script training_5_3_complete_message 
	if ($training_using_slider = 0)
		return
	endif
	if screenelementexists \{id = notes_hit_text}
		destroyscreenelement \{id = notes_hit_text}
	endif
	wait \{0.75
		seconds
		ignoreslomo}
	training_hide_lesson_header
	training_destroy_gem_scroller
	soundevent \{event = tutorial_mode_finish_chord}
	spawnscriptnow \{create_exploding_text
		id = training_spawned_script
		params = {
			parent = 'lesson_complete'
			text = qs(0xd50843f0)
			text_physics = 0
		}}
	training_hide_narrator \{narrator = 'guitarist'}
	wait \{7
		seconds
		ignoreslomo}
	killspawnedscript \{name = create_exploding_text}
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
	training_start_gem_scroller \{part = guitar
		bot_array = [
			0
			0
			0
			0
		]
		song = tut_gtr_longnotes
		disable_hud}
	killspawnedscript \{name = update_score_fast}
	change \{training_slider_notes_played = 0}
	training_wait_for_gem_scroller_startup
endscript

script training_5_4_explain 
	if ($training_using_slider = 0)
		return
	endif
	wait \{3
		seconds
		ignoreslomo}
	training_pause_gem_scroller
	training_add_lesson_body_text \{number = 1
		text = qs(0xe6ce9e4b)}
	training_add_lesson_body_text \{number = 2
		text = qs(0xd5ea06d3)}
	training_show_lesson_header
	training_play_sound \{sound = 'Tut_Gtr_SliderTap_17_GTR'
		wait}
	wait \{0.5
		seconds
		ignoreslomo}
	training_set_task_header_body \{text = qs(0xfbf25629)}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0}
	training_play_sound \{sound = 'Tut_Gtr_SliderTap_07_GTR'
		wait}
	wait \{1
		seconds
		ignoreslomo}
	training_resume_gem_scroller
endscript

script training_5_4_wait_for_slider_wah 
	if ($training_using_slider = 0)
		return
	endif
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
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
	launchevent \{type = focus
		target = menu_tutorial}
	change \{training_slider_notes_played = 0}
	change \{training_song_over = 0}
	begin
	if ($training_song_over = 1)
		break
	endif
	if ($training_slider_notes_played >= 8)
		break
	endif
	wait \{1
		gameframe}
	repeat
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
		create_training_pause_handler
	endif
	wait \{1
		seconds
		ignoreslomo}
endscript

script lesson5_slider_wah 
	if (<touch_wah> = 1)
		change training_slider_notes_played = ($training_slider_notes_played + 1)
		training_display_notes_hit notes_hit = ($training_slider_notes_played)
	endif
endscript

script training_5_4_complete_message 
	if ($training_using_slider = 0)
		return
	endif
	if screenelementexists \{id = notes_hit_text}
		destroyscreenelement \{id = notes_hit_text}
	endif
	wait \{0.75
		seconds
		ignoreslomo}
	training_hide_lesson_header
	training_destroy_gem_scroller
	soundevent \{event = tutorial_mode_finish_chord}
	spawnscriptnow \{create_exploding_text
		id = training_spawned_script
		params = {
			parent = 'lesson_complete'
			text = qs(0x2e341e7e)
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
	training_hide_narrator \{narrator = 'guitarist'}
	training_play_sound \{sound = 'Tut_Gtr_SliderTap_18_GTR'}
	wait \{7
		seconds
		ignoreslomo}
	training_wait_for_sound \{sound = 'Tut_Gtr_SliderTap_18_GTR'}
	killspawnedscript \{name = create_exploding_text}
	destroy_all_exploding_text
endscript

script training_new_features_tutorial_1_end 
	training_container :gettags
	if ($g_training_lessons_completed = 2)
		setglobaltags \{training
			params = {
				new_features_lesson = complete
			}}
	endif
	training_kill_session
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

script training_check_for_all_tutorials_finished 
	if NOT ($is_attract_mode = 1)
		achievements_update
	endif
	getglobaltags \{training}
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
	writeachievements \{achievement = ready_to_rock}
endscript
