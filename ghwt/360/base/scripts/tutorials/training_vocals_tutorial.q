g_training_verifying_track_style_done = 0
vocal_notes_hit = 0
vocal_notes_missed = 0
training_vocals_tutorial_script = [
	{
		call = training_vocals_tutorial_startup
	}
	{
		time = 1000
		call = training_vocals_tutorial_show_title
	}
	{
		lesson = 1
		call = training_8_1_show_lesson_header
	}
	{
		call = training_8_1_show_microphone_image
	}
	{
		call = training_8_1_complete_message
	}
	{
		lesson = 2
		call = training_8_2_show_lesson_header
	}
	{
		call = training_8_2_show_static_highway
	}
	{
		call = training_8_2_show_items_on_highway
	}
	{
		call = training_8_2_show_static_vs_scrolling
	}
	{
		call = training_8_2_prompt_for_layout
	}
	{
		call = training_8_2_complete_message
	}
	{
		lesson = 3
		call = training_8_3_show_lesson_header
	}
	{
		call = training_8_3_show_highway
	}
	{
		call = training_8_3_show_items_on_highway
	}
	{
		call = training_8_3_start_singing_task
	}
	{
		call = training_8_3_complete_message
	}
	{
		lesson = 4
		call = training_8_4_show_lesson_header
	}
	{
		call = training_8_4_show_highway
	}
	{
		call = training_8_4_show_rock_meter_and_demo
	}
	{
		call = training_8_4_complete_message
	}
	{
		lesson = 5
		call = training_8_5_show_lesson_header
	}
	{
		call = training_8_5_show_highway
	}
	{
		call = training_8_5_show_items_on_highway
	}
	{
		call = training_8_5_start_spoken_task
	}
	{
		call = training_8_5_complete_message
	}
	{
		lesson = 6
		call = training_8_6_show_lesson_header
	}
	{
		call = training_8_6_show_highway
	}
	{
		call = training_8_6_show_items_on_highway
	}
	{
		call = training_8_6_start_freeform_task
	}
	{
		call = training_8_6_show_hype_section
	}
	{
		call = training_8_6_complete_message
	}
	{
		lesson = 7
		call = training_8_7_show_lesson_header
	}
	{
		call = training_8_7_show_highway
	}
	{
		call = training_8_7_start_star_power_task
	}
	{
		call = training_8_7_complete_message
	}
	{
		lesson = 8
		call = training_8_8_show_lesson_header
	}
	{
		call = training_8_8_show_highway
	}
	{
		call = training_8_8_start_activate_star_power_task
	}
	{
		call = training_8_8_complete_message
	}
	{
		call = training_vocals_tutorial_end
	}
]

script training_vocals_tutorial_startup 
	training_init_session
	LaunchEvent \{Type = unfocus
		target = root_window}
	create_training_pause_handler
	training_create_narrator_icons
endscript

script training_vocals_tutorial_show_title 
	Change \{g_training_lessons_completed = 0}
	printf \{qs(0x02e82b17)}
	training_show_title \{title = qs(0xc8c38f21)}
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

script training_8_1_show_lesson_header 
	printf \{qs(0x721b3f3f)}
	training_set_lesson_header_text \{number = qs(0x22ee76e7)
		text = qs(0xdaa47a7a)}
	training_show_lesson_header
	create_training_pause_handler
endscript

script training_8_1_show_microphone_image 
	printf \{qs(0xbef00e59)}
	training_show_narrator \{narrator = 'vocalist'}
	training_play_sound \{Sound = 'Tut_Vox_Intro_01_VOX'
		Wait}
	training_hide_narrator
	Wait \{1.0
		Seconds
		ignoreslomo}
	CreateScreenElement \{parent = training_container
		Type = SpriteElement
		id = microphone_sprite
		just = [
			center
			center
		]
		texture = tutorial_mic_full
		Pos = (640.0, 490.0)
		Scale = (1.0, 1.0)
		z_priority = 4}
	training_show_narrator \{narrator = 'vocalist'}
	training_play_sound \{Sound = 'Tut_Vox_Intro_02_VOX'
		Wait}
	training_play_sound \{Sound = 'Tut_Vox_Intro_03_VOX'
		Wait}
	training_hide_narrator
	safe_destroy \{id = microphone_sprite}
endscript

script training_8_1_complete_message 
	printf \{qs(0xffc52efa)}
	training_generic_lesson_complete
endscript

script training_8_2_show_lesson_header 
	printf \{qs(0x58a78fb7)}
	training_set_lesson_header_text \{number = qs(0x09c32524)
		text = qs(0x472ec377)}
	training_show_lesson_header
	create_training_pause_handler
endscript

script training_8_2_show_static_highway 
	printf \{qs(0x90c0a776)}
	vocals_set_highway_view \{Player = 1
		view = static
		controller = 1}
	training_show_narrator \{narrator = 'vocalist'}
	training_play_sound \{Sound = 'Tut_Vox_Highway_01_VOX'
		Wait}
	training_hide_narrator
	vocals_distribute_mics
	Change \{tutorial_disable_hud = 1}
	training_start_gem_scroller \{song = tut_demo
		part = vocals
		disable_hud
		no_score_update
		starttime = 4000}
	KillSpawnedScript \{Name = update_score_fast}
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
	Change \{vocal_tut_no_star_power = 1}
	training_wait_for_gem_scroller_startup \{disable_mic}
endscript

script training_8_2_show_scrolling_highway 
	printf \{qs(0x40eb5c17)}
	training_resume_gem_scroller
	training_destroy_gem_scroller
	vocals_set_highway_view \{Player = 1
		view = scrolling
		controller = 1}
	vocals_distribute_mics
	Change \{tutorial_disable_hud = 1}
	training_start_gem_scroller \{song = tut_demo
		part = vocals
		disable_hud
		no_score_update
		starttime = 6000}
	KillSpawnedScript \{Name = update_score_fast}
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
	training_wait_for_gem_scroller_startup \{disable_mic
		disable_star_power}
endscript

script training_8_2_point_out_comet_and_tunnel 
	printf \{qs(0x45e4bc24)}
	Wait \{3.0
		Seconds
		ignoreslomo}
	training_add_arrow \{id = training_arrow
		life = 2.0
		Pos = (425.0, 500.0)
		Scale = 0.7}
	Wait \{4.0
		Seconds
		ignoreslomo}
	training_add_arrow \{id = training_arrow
		life = 2.0
		Pos = (590.0, 500.0)
		Scale = 0.7}
endscript

script training_8_2_show_items_on_highway 
	printf \{qs(0x250a5b71)}
	Wait \{3.0
		Seconds}
	training_pause_gem_scroller
	Wait \{1.0
		Seconds
		ignoreslomo}
	training_add_arrow \{id = training_arrow
		life = 2.0
		Pos = (545.0, 430.0)
		Scale = 0.7}
	SpawnScriptNow \{training_8_2_point_out_comet_and_tunnel
		id = training_spawned_script}
	training_show_narrator \{narrator = 'vocalist'}
	training_play_sound \{Sound = 'Tut_Vox_Highway_02_VOX'
		Wait}
	training_hide_narrator
	training_destroy_all_arrows
endscript

script training_8_2_show_static_vs_scrolling 
	printf \{qs(0x2017cc73)}
	training_show_narrator \{narrator = 'vocalist'}
	training_play_sound \{Sound = 'Tut_Vox_Highway_03_VOX'
		Wait}
	training_hide_narrator
	training_8_2_show_scrolling_highway \{id = training_spawned_script}
	Wait \{2.0
		Seconds}
	training_pause_gem_scroller
	training_show_narrator \{narrator = 'vocalist'}
	training_play_sound \{Sound = 'Tut_Vox_Highway_05_VOX'
		Wait}
	training_hide_narrator
	training_destroy_gem_scroller
	training_hide_lesson_header
endscript

script training_8_2_prompt_for_layout 
	printf \{qs(0xcbe64ff3)}
	Change \{g_training_verifying_track_style_done = 0}
	training_8_2_prompt_function
	begin
	if ($g_training_verifying_track_style_done)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	create_training_pause_handler
	training_show_lesson_header
	training_show_narrator \{narrator = 'vocalist'}
	training_play_sound \{Sound = 'Tut_Vox_Highway_06_VOX'
		Wait}
	training_play_sound \{Sound = 'Tut_Vox_Highway_07_VOX'
		Wait}
	training_hide_narrator
	training_resume_gem_scroller
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	training_destroy_gem_scroller
endscript

script training_8_2_prompt_function 
	printf \{qs(0x5ab58ef5)}
	if ScreenElementExists \{id = popup_warning_container}
		destroy_popup_warning_menu
	endif
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	create_popup_warning_menu \{title = qs(0x9a78cfba)
		textblock = {
			text = qs(0x5c28a878)
		}
		no_background
		options = [
			{
				func = training_8_2_choose_static_or_scrolling
				func_params = {
					chose = static
				}
				text = qs(0xb461fb91)
			}
			{
				func = training_8_2_choose_static_or_scrolling
				func_params = {
					chose = scrolling
				}
				text = qs(0x35230e84)
			}
		]}
endscript

script training_8_2_choose_static_or_scrolling 
	printf \{qs(0xd3e912f8)}
	if GotParam \{chose}
		if (<chose> = static)
			printf \{qs(0xfc96d7a3)}
			vocals_set_highway_view \{Player = 1
				view = static
				controller = 1}
		else
			printf \{qs(0x53b35867)}
			vocals_set_highway_view \{Player = 1
				view = scrolling
				controller = 1}
		endif
	endif
	destroy_popup_warning_menu
	Change \{g_training_verifying_track_style_done = 1}
endscript

script training_8_2_complete_message 
	printf \{qs(0x9b255504)}
	training_generic_lesson_complete
endscript

script training_8_3_show_lesson_header 
	printf \{qs(0xf7e31df0)}
	training_set_lesson_header_text \{number = qs(0x10d81465)
		text = qs(0x5bc3554a)}
	training_show_lesson_header
	create_training_pause_handler
endscript

script training_8_3_hit_note 
	printf \{qs(0x33f02156)}
	Change vocal_notes_hit = ($vocal_notes_hit + 1)
	training_display_notes_hit \{notes_hit = $vocal_notes_hit
		notes_required = 3}
	if ($vocal_notes_hit = 1)
		Random (
			@ training_play_sound \{Sound = 'Tut_Vox_HitNotes_09_VOX'
				Volume = 2.5
				Wait}
			@ training_play_sound \{Sound = 'Tut_Vox_HitNotes_10_VOX'
				Volume = 2.5
				Wait}
			@ training_play_sound \{Sound = 'Tut_Vox_HitNotes_11_VOX'
				Volume = 2.5
				Wait}
			)
	endif
endscript

script training_8_3_missed_note 
	printf \{qs(0x4d8f9b15)}
	Change vocal_notes_missed = ($vocal_notes_missed + 1)
	if (($vocal_notes_missed = 1) || ($vocal_notes_missed = 2))
		Random (
			@ training_play_sound \{Sound = 'Tut_Vox_HitNotes_06_VOX'
				Volume = 2.5
				Wait}
			@ training_play_sound \{Sound = 'Tut_Vox_HitNotes_07_VOX'
				Volume = 2.5
				Wait}
			@ training_play_sound \{Sound = 'Tut_Vox_HitNotes_08_VOX'
				Volume = 2.5
				Wait}
			)
	endif
endscript

script training_8_3_wait_for_hit_notes 
	printf \{qs(0x85968275)}
	begin
	if ($training_song_over = 1)
		return
	endif
	if ($vocal_notes_hit >= 3)
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script training_8_3_show_highway 
	printf \{qs(0xb7d22d1f)}
	training_show_narrator \{narrator = 'vocalist'}
	training_play_sound \{Sound = 'Tut_Vox_HitNotes_01_VOX'
		Wait}
	training_hide_narrator
	Change \{tutorial_disable_hud = 1}
	training_start_gem_scroller \{song = tut_vox_hitnotes
		part = vocals
		disable_hud
		no_score_update}
	KillSpawnedScript \{Name = update_score_fast}
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{vocals_hit_phrase training_8_3_hit_note}
		{vocals_miss_phrase training_8_3_missed_note}
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
	training_wait_for_gem_scroller_startup \{disable_mic
		disable_star_power}
endscript

script training_8_3_point_out_tunnel 
	printf \{qs(0x0bb744e2)}
	vocals_get_highway_view \{Player = 1}
	Wait \{3.0
		Seconds
		ignoreslomo}
	if (<highway_view> = static)
		training_add_arrow \{id = training_arrow
			life = 2.0
			Pos = (410.0, 490.0)
			Scale = 0.7}
	else
		training_add_arrow \{id = training_arrow
			life = 2.0
			Pos = (410.0, 490.0)
			Scale = 0.7}
	endif
	Wait \{1.0
		Seconds
		ignoreslomo}
	if (<highway_view> = static)
		training_add_arrow \{id = training_arrow
			life = 2.0
			Pos = (750.0, 475.0)
			Scale = 0.7}
	else
		training_add_arrow \{id = training_arrow
			life = 2.0
			Pos = (800.0, 500.0)
			Scale = 0.7}
	endif
endscript

script training_8_3_point_out_lyrics 
	printf \{qs(0xc5bf7af0)}
	Wait \{10.0
		Seconds
		ignoreslomo}
	training_add_arrow \{id = training_arrow
		life = 7.0
		Pos = (410.0, 585.0)
		Scale = 0.7
		rot = -90}
endscript

script training_8_3_show_items_on_highway 
	printf \{qs(0x5ac3c0e2)}
	vocals_get_highway_view \{Player = 1}
	if (<highway_view> = static)
		Wait \{3.5
			Seconds}
	else
		Wait \{3.0
			Seconds}
	endif
	training_pause_gem_scroller
	training_add_lesson_body_text \{number = qs(0x22ee76e7)
		text = qs(0x792ecdef)}
	training_add_lesson_body_text \{number = qs(0x09c32524)
		text = qs(0x2325bdf5)}
	training_show_lesson_header
	SpawnScriptNow \{training_8_3_point_out_tunnel
		id = training_spawned_script}
	training_show_narrator \{narrator = 'vocalist'}
	training_play_sound \{Sound = 'Tut_Vox_HitNotes_02_VOX'
		Wait}
	training_hide_narrator
	training_destroy_all_arrows
	SpawnScriptNow \{training_8_3_point_out_lyrics
		id = training_spawned_script}
	training_show_narrator \{narrator = 'vocalist'}
	training_play_sound \{Sound = 'Tut_Vox_HitNotes_03_VOX'
		Wait}
	training_hide_narrator
	training_destroy_all_arrows
endscript

script training_8_3_start_singing_task 
	printf \{qs(0xca6c9ddf)}
	training_show_narrator \{narrator = 'vocalist'}
	training_play_sound \{Sound = 'Tut_Vox_HitNotes_04_VOX'
		Wait}
	training_hide_narrator
	training_set_task_header_body \{text = qs(0x900a8ba1)}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0
		notes_required = 3}
	Change \{vocal_notes_hit = 0}
	Change \{vocal_notes_missed = 0}
	training_destroy_all_arrows
	training_resume_gem_scroller \{enable_mic}
	training_8_3_wait_for_hit_notes
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	training_destroy_gem_scroller
	training_hide_lesson_header
	training_show_narrator \{narrator = 'vocalist'}
	training_play_sound \{Sound = 'Tut_Vox_HitNotes_05_VOX'
		Wait}
	training_hide_narrator
endscript

script training_8_3_complete_message 
	printf \{qs(0x0e558191)}
	training_generic_lesson_complete
endscript

script training_8_4_show_lesson_header 
	printf \{qs(0x0ddeeea7)}
	training_set_lesson_header_text \{number = qs(0x5f9982a2)
		text = qs(0x473e52e1)}
	training_show_lesson_header
	create_training_pause_handler
endscript

script training_8_4_show_highway 
	printf \{qs(0xb3dbde4c)}
	training_hide_placeholder
	training_play_sound \{Sound = 'Tut_Vox_Meter_01_VOX'
		Wait}
	Change \{tutorial_disable_hud = 0}
	training_start_gem_scroller \{song = tut_demo
		part = vocals}
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
	training_set_score \{score = 3141975}
	training_wait_for_gem_scroller_startup \{disable_mic
		disable_star_power}
endscript

script training_8_4_make_rock_meter_changes 
	printf \{qs(0xc48d9eab)}
	training_add_arrow \{id = training_arrow2
		life = 2
		Pos = (275.0, 325.0)
		Scale = 0.7
		rot = 90}
	SpawnScriptNow \{training_set_health
		params = {
			health = 1.6
		}
		id = training_spawned_script}
	training_add_lesson_body_text \{number = 1
		text = qs(0x3b4b0d81)}
	Wait \{3.0
		Seconds
		ignoreslomo}
	KillSpawnedScript \{Name = training_set_health}
	SpawnScriptNow \{training_set_health
		params = {
			health = 1.0
		}
		id = training_spawned_script}
	training_add_lesson_body_text \{number = 2
		text = qs(0x8ab3f5ed)}
	Wait \{3.0
		Seconds
		ignoreslomo}
	KillSpawnedScript \{Name = training_set_health}
	SpawnScriptNow \{training_set_health
		params = {
			health = 0.4
		}
		id = training_spawned_script}
	training_add_lesson_body_text \{number = 3
		text = qs(0xec12d4ac)}
	Wait \{4
		Seconds
		ignoreslomo}
	training_start_hud_flashing_red
	training_add_lesson_body_text \{number = 4
		text = qs(0x19160b97)}
endscript

script training_8_4_make_additional_rock_meter_changes 
	printf \{qs(0xed3dcd0c)}
	KillSpawnedScript \{Name = training_set_health}
	SpawnScriptNow \{training_set_health
		params = {
			health = 1.0
		}
		id = training_spawned_script}
	Wait \{8.0
		Seconds
		ignoreslomo}
	KillSpawnedScript \{Name = training_set_health}
	SpawnScriptNow \{training_set_health
		params = {
			health = 1.6
		}
		id = training_spawned_script}
	Wait \{7.0
		Seconds
		ignoreslomo}
	KillSpawnedScript \{Name = training_set_health}
	SpawnScriptNow \{training_set_health
		params = {
			health = 0.4
		}
		id = training_spawned_script}
endscript

script training_8_4_show_rock_meter_and_demo 
	printf \{qs(0x25cdb8d1)}
	Wait \{3.0
		Second}
	training_pause_gem_scroller
	SpawnScriptNow \{training_8_4_make_rock_meter_changes
		id = training_spawned_script}
	training_play_sound \{Sound = 'Tut_Vox_Meter_02_VOX'
		Wait}
	training_stop_hud_flashing_red
	Wait \{0.5
		Seconds
		ignoreslomo}
	SpawnScriptNow \{training_8_4_make_additional_rock_meter_changes
		id = training_spawned_script}
	training_play_sound \{Sound = 'Tut_Vox_Meter_03_VOX'
		Wait}
	training_destroy_all_arrows
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	training_destroy_gem_scroller
	training_hide_lesson_header
	training_resume_gem_scroller
endscript

script training_8_4_complete_message 
	printf \{qs(0x52e5a2f8)}
	training_show_narrator \{narrator = 'vocalist'}
	training_play_sound \{Sound = 'Tut_Vox_Meter_04_VOX'
		Wait}
	training_hide_narrator
	training_generic_lesson_complete
endscript

script training_8_5_show_lesson_header 
	printf \{qs(0xa29a7ce0)}
	training_set_lesson_header_text \{number = qs(0x4682b3e3)
		text = qs(0xec3c6d7a)}
	training_show_lesson_header
	create_training_pause_handler
endscript

script training_8_5_hit_note 
	printf \{qs(0xb7d3bc83)}
	Change vocal_notes_hit = ($vocal_notes_hit + 1)
	training_display_notes_hit \{notes_hit = $vocal_notes_hit
		notes_required = 4}
	if (($vocal_notes_hit = 1) || ($vocal_notes_hit = 2))
		Random (
			@ training_play_sound \{Sound = 'Tut_Vox_Words_08_VOX'
				Volume = 2.5
				Wait}
			@ training_play_sound \{Sound = 'Tut_Vox_Words_09_VOX'
				Volume = 2.5
				Wait}
			@ training_play_sound \{Sound = 'Tut_Vox_Words_10_VOX'
				Volume = 2.5
				Wait}
			@ training_play_sound \{Sound = 'Tut_Vox_Words_11_VOX'
				Volume = 2.5
				Wait}
			)
	endif
endscript

script training_8_5_missed_note 
	printf \{qs(0x725146a4)}
	Change vocal_notes_missed = ($vocal_notes_missed + 1)
	if (($vocal_notes_missed = 1) || ($vocal_notes_missed = 3))
		Random (
			@ training_play_sound \{Sound = 'Tut_Vox_Words_05_VOX'
				Volume = 3
				Wait}
			@ training_play_sound \{Sound = 'Tut_Vox_Words_06_VOX'
				Volume = 3
				Wait}
			@ training_play_sound \{Sound = 'Tut_Vox_Words_07_VOX'
				Volume = 3
				Wait}
			)
	endif
endscript

script training_8_5_wait_for_hit_notes 
	printf \{qs(0xd0efe365)}
	begin
	if ($training_song_over = 1)
		return
	endif
	if ($vocal_notes_hit >= 4)
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script training_8_5_show_highway 
	printf \{qs(0xb26e2351)}
	training_show_narrator \{narrator = 'vocalist'}
	training_play_sound \{Sound = 'Tut_Vox_Words_01_VOX'
		Wait}
	training_hide_narrator
	Change \{tutorial_disable_hud = 1}
	training_start_gem_scroller \{song = tut_vox_spoken
		part = vocals
		disable_hud
		no_score_update
		starttime = 6000}
	setsoundbussparams \{band_Balance = {
			vol = -100
		}}
	KillSpawnedScript \{Name = update_score_fast}
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{vocals_hit_phrase training_8_5_hit_note}
		{vocals_miss_phrase training_8_5_missed_note}
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
	training_wait_for_gem_scroller_startup \{disable_mic
		disable_star_power}
endscript

script training_8_5_show_items_on_highway 
	printf \{qs(0x81079fc9)}
	Wait \{3.0
		Seconds}
	training_pause_gem_scroller
	setsoundbussparams {band_Balance = {vol = ($default_BussSet.band_Balance.vol)}}
	training_add_lesson_body_text \{number = qs(0x22ee76e7)
		text = qs(0x6a8c0984)}
	training_add_lesson_body_text \{number = qs(0x09c32524)
		text = qs(0xa416fdf2)}
	training_show_lesson_header
	training_add_arrow \{id = training_arrow
		life = 7.0
		Pos = (800.0, 485.0)
		Scale = 0.7}
	training_show_narrator \{narrator = 'vocalist'}
	training_play_sound \{Sound = 'Tut_Vox_Words_02_VOX'
		Wait}
	training_hide_narrator
	training_add_arrow \{id = training_arrow
		life = 7.0
		Pos = (410.0, 585.0)
		Scale = 0.7
		rot = -90}
	training_show_narrator \{narrator = 'vocalist'}
	training_play_sound \{Sound = 'Tut_Vox_Words_03_VOX'
		Wait}
	training_hide_narrator
endscript

script training_8_5_start_spoken_task 
	printf \{qs(0x9cf18379)}
	training_set_task_header_body \{text = qs(0x9359ae59)}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0
		notes_required = 4}
	Change \{vocal_notes_hit = 0}
	Change \{vocal_notes_missed = 0}
	training_destroy_all_arrows
	training_resume_gem_scroller \{enable_mic}
	training_8_5_wait_for_hit_notes
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	training_destroy_gem_scroller
	training_hide_lesson_header
	training_show_narrator \{narrator = 'vocalist'}
	training_play_sound \{Sound = 'Tut_Vox_Words_04_VOX'
		Wait}
	training_hide_narrator
	training_resume_gem_scroller
endscript

script training_8_5_complete_message 
	printf \{qs(0xc795766d)}
	training_generic_lesson_complete
endscript

script training_8_6_show_lesson_header 
	printf \{qs(0x8826cc68)}
	training_set_lesson_header_text \{number = qs(0x6dafe020)
		text = qs(0xd2cf3018)}
	training_show_lesson_header
	create_training_pause_handler
endscript

script training_8_6_hit_note 
	printf \{qs(0x187af149)}
	Change vocal_notes_hit = ($vocal_notes_hit + 1)
	training_display_notes_hit \{notes_hit = $vocal_notes_hit
		notes_required = 4}
	if (($vocal_notes_hit = 3) || ($vocal_notes_hit = 6))
		Random (
			@ training_play_sound \{Sound = 'Tut_Vox_Freeform_09_VOX'
				Volume = 2.5
				Wait}
			@ training_play_sound \{Sound = 'Tut_Vox_Freeform_10_VOX'
				Volume = 2.5
				Wait}
			)
	endif
endscript

script training_8_6_missed_note 
	printf \{qs(0x8006ab5c)}
	Change vocal_notes_missed = ($vocal_notes_missed + 1)
	if (($vocal_notes_missed = 3) || ($vocal_notes_missed = 6))
		Random (
			@ training_play_sound \{Sound = 'Tut_Vox_Freeform_06_VOX'
				Volume = 2.5
				Wait}
			@ training_play_sound \{Sound = 'Tut_Vox_Freeform_07_VOX'
				Volume = 2.5
				Wait}
			@ training_play_sound \{Sound = 'Tut_Vox_Freeform_08_VOX'
				Volume = 2.5
				Wait}
			)
	endif
endscript

script training_8_6_wait_for_hit_notes 
	printf \{qs(0xfa5353ed)}
	begin
	if ($training_song_over = 1)
		return
	endif
	if ($vocal_notes_hit >= 4)
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script training_8_6_show_highway 
	printf \{qs(0xb0b02476)}
	training_show_narrator \{narrator = 'vocalist'}
	training_play_sound \{Sound = 'Tut_Vox_Freeform_01_VOX'
		Wait}
	training_hide_narrator
	Change \{tutorial_disable_hud = 1}
	training_start_gem_scroller \{song = tut_vox_freeform
		part = vocals
		disable_hud
		no_score_update
		starttime = 6000}
	KillSpawnedScript \{Name = update_score_fast}
	setsoundbussparams \{band_Balance = {
			vol = -100
		}}
	setsoundbussparams \{leadvox_balance = {
			vol = -100
		}}
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{vocals_hit_freeform training_8_6_hit_note}
		{vocals_miss_freeform training_8_6_missed_note}
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
	training_wait_for_gem_scroller_startup \{disable_mic
		disable_star_power}
endscript

script training_8_6_show_items_on_highway 
	printf \{qs(0x015d337c)}
	vocals_get_highway_view \{Player = 1}
	if (<highway_view> = static)
		if isps3
			Wait \{3.56
				Seconds}
		else
			Wait \{3.5
				Seconds}
		endif
	else
		Wait \{2.5
			Seconds}
	endif
	training_pause_gem_scroller
	training_add_lesson_body_text \{number = qs(0x22ee76e7)
		text = qs(0x27819751)}
	training_show_lesson_header
	setsoundbussparams {band_Balance = {vol = ($default_BussSet.band_Balance.vol)}}
	setsoundbussparams {leadvox_balance = {vol = ($default_BussSet.leadvox_balance.vol)}}
	if (<highway_view> = static)
		training_add_arrow \{id = training_arrow
			life = 9.0
			Pos = (640.0, 430.0)
			Scale = 0.7}
	else
		training_add_arrow \{id = training_arrow
			life = 9.0
			Pos = (800.0, 430.0)
			Scale = 0.7}
	endif
	training_show_narrator \{narrator = 'vocalist'}
	training_play_sound \{Sound = 'Tut_Vox_Freeform_02_VOX'
		Wait}
	training_hide_narrator
	training_destroy_all_arrows
endscript

script training_8_6_start_freeform_task 
	printf \{qs(0x844c7b01)}
	training_show_narrator \{narrator = 'vocalist'}
	training_play_sound \{Sound = 'Tut_Vox_Freeform_04_VOX'
		Wait}
	training_hide_narrator
	training_set_task_header_body \{text = qs(0x1649c5db)}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0
		notes_required = 4}
	Change \{vocal_notes_hit = 0}
	Change \{vocal_notes_missed = 0}
	training_destroy_all_arrows
	training_resume_gem_scroller \{enable_mic}
	training_8_6_wait_for_hit_notes
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	training_destroy_gem_scroller
	training_hide_lesson_header
	training_resume_gem_scroller
endscript

script training_8_6_show_hype_section 
	printf \{qs(0xc6ff5412)}
	Wait \{1.0
		Seconds}
	Change \{tutorial_disable_hud = 1}
	training_start_gem_scroller \{song = tut_vox_hype
		part = vocals
		disable_hud
		no_score_update
		starttime = 2000}
	KillSpawnedScript \{Name = update_score_fast}
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
	training_wait_for_gem_scroller_startup \{disable_mic
		disable_star_power}
	vocals_get_highway_view \{Player = 1}
	if (<highway_view> = static)
		Wait \{4.2
			Seconds}
	else
		Wait \{4.0
			Seconds}
	endif
	training_pause_gem_scroller
	if (<highway_view> = static)
		training_add_arrow \{id = training_arrow
			life = 9.0
			Pos = (640.0, 430.0)
			Scale = 0.7}
	else
		training_add_arrow \{id = training_arrow
			life = 9.0
			Pos = (700.0, 430.0)
			Scale = 0.7}
	endif
	training_show_narrator \{narrator = 'vocalist'}
	training_play_sound \{Sound = 'Tut_Vox_Freeform_05_VOX'
		Wait}
	training_hide_narrator
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	training_destroy_gem_scroller
	training_hide_lesson_header
	training_resume_gem_scroller
endscript

script training_8_6_complete_message 
	printf \{qs(0xa3750d93)}
	training_generic_lesson_complete
endscript

script training_8_7_show_lesson_header 
	printf \{qs(0x27625e2f)}
	training_set_lesson_header_text \{number = qs(0x74b4d161)
		text = qs(0xed63746a)}
	training_show_lesson_header
	create_training_pause_handler
	training_hide_placeholder
endscript

script training_8_7_hit_note 
	printf \{qs(0x7d1dca0f)}
	Change vocal_notes_hit = ($vocal_notes_hit + 1)
	if (($vocal_notes_hit = 3) || ($vocal_notes_hit = 6))
		Random (
			@ training_play_sound \{Sound = 'Tut_Vox_StarPower_09_VOX'
				Volume = 2.5
				Wait}
			@ training_play_sound \{Sound = 'Tut_Vox_StarPower_10_VOX'
				Volume = 2.5
				Wait}
			)
	endif
endscript

script training_8_7_missed_note 
	printf \{qs(0x671b0dcb)}
	Change vocal_notes_missed = ($vocal_notes_missed + 1)
	if (($vocal_notes_missed = 3) || ($vocal_notes_missed = 6))
		Random (
			@ training_play_sound \{Sound = 'Tut_Vox_StarPower_06_VOX'
				Volume = 2.5
				Wait}
			@ training_play_sound \{Sound = 'Tut_Vox_StarPower_07_VOX'
				Volume = 2.5
				Wait}
			@ training_play_sound \{Sound = 'Tut_Vox_StarPower_08_VOX'
				Volume = 2.5
				Wait}
			)
	endif
endscript

script training_8_7_wait_for_hit_notes 
	printf \{qs(0x5517c1aa)}
	begin
	if ($training_song_over = 1)
		return
	endif
	if ($player1_status.star_power_amount >= 50)
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script training_8_7_show_highway 
	printf \{qs(0xb105d96b)}
	Change \{tutorial_disable_hud = 0}
	training_start_gem_scroller \{song = tut_vox_combos
		part = vocals
		starttime = 2000}
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{vocals_hit_phrase training_8_7_hit_note}
		{vocals_miss_phrase training_8_7_missed_note}
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
	training_wait_for_gem_scroller_startup \{disable_mic}
endscript

script training_8_7_start_star_power_task 
	printf \{qs(0x9d61f7a5)}
	vocals_get_highway_view \{Player = 1}
	if (<highway_view> = static)
		Wait \{3.5
			Seconds}
	else
		Wait \{3.0
			Seconds}
	endif
	training_pause_gem_scroller
	Wait \{0.5
		Seconds
		ignoreslomo}
	training_add_lesson_body_text \{number = qs(0x22ee76e7)
		text = qs(0xfa97c7a6)}
	training_add_lesson_body_text \{number = qs(0x09c32524)
		text = qs(0x5852268a)}
	training_show_lesson_header
	training_play_sound \{Sound = 'Tut_Vox_StarPower_02_VOX'
		Wait}
	training_set_task_header_body \{text = qs(0x171f6063)}
	training_show_task_header
	Change \{vocal_notes_hit = 0}
	Change \{vocal_notes_missed = 0}
	training_destroy_all_arrows
	training_resume_gem_scroller \{enable_mic
		enable_star_power}
	training_8_7_wait_for_hit_notes
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	training_destroy_gem_scroller
	training_hide_lesson_header
endscript

script training_8_7_complete_message 
	printf \{qs(0x3605d906)}
	training_generic_lesson_complete
endscript

script training_8_8_show_lesson_header 
	printf \{qs(0xa72c2c87)}
	training_set_lesson_header_text \{number = qs(0xf32ccdae)
		text = qs(0xd81b6f2a)}
	training_show_lesson_header
	create_training_pause_handler
	training_hide_placeholder
endscript

script training_8_8_hit_note 
	printf \{qs(0x0182ba2e)}
	if ($player1_status.star_power_used = 1)
		Change vocal_notes_hit = ($vocal_notes_hit + 1)
		training_display_notes_hit \{notes_hit = $vocal_notes_hit
			notes_required = 4}
		if (($vocal_notes_hit = 1) || ($vocal_notes_hit = 2))
			Random (
				@ training_play_sound \{Sound = 'Tut_Vox_StarPower_09_VOX'
					Volume = 2.5
					Wait}
				@ training_play_sound \{Sound = 'Tut_Vox_StarPower_10_VOX'
					Volume = 2.5
					Wait}
				)
		endif
	endif
endscript

script training_8_8_missed_note 
	printf \{qs(0xeaf15b51)}
	Change vocal_notes_missed = ($vocal_notes_missed + 1)
	if (($vocal_notes_missed = 1) || ($vocal_notes_missed = 3))
		Random (
			@ training_play_sound \{Sound = 'Tut_Vox_StarPower_06_VOX'
				Volume = 2.5
				Wait}
			@ training_play_sound \{Sound = 'Tut_Vox_StarPower_07_VOX'
				Volume = 2.5
				Wait}
			@ training_play_sound \{Sound = 'Tut_Vox_StarPower_08_VOX'
				Volume = 2.5
				Wait}
			)
	endif
endscript

script training_8_8_wait_for_hit_notes 
	printf \{qs(0xd559b302)}
	begin
	if ($training_song_over = 1)
		return
	endif
	if ($vocal_notes_hit >= 4)
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script training_8_8_show_highway 
	printf \{qs(0xb8a3c2d0)}
	Change \{tutorial_disable_hud = 0}
	training_start_gem_scroller \{song = tut_vox_activ
		part = vocals
		starttime = 2000}
	KillSpawnedScript \{Name = update_score_fast}
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{vocals_hit_phrase training_8_8_hit_note}
		{vocals_miss_phrase training_8_8_missed_note}
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
	training_wait_for_gem_scroller_startup \{disable_mic}
endscript

script training_8_8_start_activate_star_power_task 
	printf \{qs(0x2b86c2e6)}
	vocals_get_highway_view \{Player = 1}
	if (<highway_view> = static)
		Wait \{3.5
			Seconds}
	else
		Wait \{3.0
			Seconds}
	endif
	training_pause_gem_scroller
	training_add_lesson_body_text \{number = qs(0x22ee76e7)
		text = qs(0x6c733344)}
	training_show_lesson_header
	training_play_sound \{Sound = 'Tut_Vox_StarPower_03_VOX'
		Wait}
	training_set_task_header_body \{text = qs(0xae613a06)}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0
		notes_required = 4}
	Change \{vocal_notes_hit = 0}
	Change \{vocal_notes_missed = 0}
	training_destroy_all_arrows
	training_resume_gem_scroller \{enable_mic
		enable_star_power}
	training_8_8_wait_for_hit_notes
	training_pause_gem_scroller
	training_add_arrow \{id = training_arrow2
		life = 2
		Pos = (275.0, 325.0)
		Scale = 0.7
		rot = 90}
	training_show_narrator \{narrator = 'vocalist'}
	training_play_sound \{Sound = 'Tut_Vox_StarPower_04_VOX'
		Wait}
	training_hide_narrator
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	training_destroy_gem_scroller
	training_hide_lesson_header
	training_show_narrator \{narrator = 'vocalist'}
	training_play_sound \{Sound = 'Tut_Vox_StarPower_05_VOX'
		Wait}
	training_hide_narrator
	training_resume_gem_scroller
endscript

script training_8_8_complete_message 
	printf \{qs(0x1a154b41)}
	training_destroy_title
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
		create_training_pause_handler
	endif
	SoundEvent \{event = Tutorial_Mode_Finish_Chord}
	training_hide_lesson_header
	training_destroy_gem_scroller
	SpawnScriptNow \{create_exploding_text
		id = training_spawned_script
		params = {
			parent = 'lesson_complete'
			text = qs(0xfe9dcb72)
			text_physics = 0
			placement = top
		}}
	SpawnScriptNow \{create_exploding_text
		id = training_spawned_script
		params = {
			parent = 'complete_text'
			text = qs(0x232d1eaf)
			text_physics = 0
			placement = bottom
		}}
	Wait \{7
		Seconds
		ignoreslomo}
	KillSpawnedScript \{Name = create_exploding_text}
	destroy_all_exploding_text
	Change g_training_lessons_completed = ($g_training_lessons_completed + 1)
endscript

script training_vocals_tutorial_end 
	printf \{qs(0xcaf50abd)}
	training_container :GetTags
	if ($g_training_lessons_completed = 8)
		SetGlobalTags \{training
			params = {
				vocals_lesson = complete
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
