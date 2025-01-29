
script freestyle_tutorial_bass_play_informative_init 
	freestyle_tutorial_default_informative_init
	freestyle_tutorial_switch_to_auto_play
endscript

script freestyle_tutorial_bass_play_informative_deinit 
	freestyle_tutorial_default_informative_deinit
	freestyle_tutorial_switch_to_controller_play
endscript

script freestyle_tutorial_bass_play_notes_init 
	freestyle_tutorial_spawn_goal_counter \{goal_total = 5}
endscript

script freestyle_tutorial_bass_play_notes_deinit 
	freestyle_tutorial_goal_counter_kill
	freestyle_tutorial_spawn_complete_notification
endscript

script freestyle_tutorial_bass_play_notes_strum_handler 
	if (<event_data>.noteclass_triggered = single)
		freestyle_tutorial_goal_counter_increment
	endif
endscript

script freestyle_tutorial_bass_play_riffs_init 
	freestyle_tutorial_spawn_goal_counter \{goal_total = 5}
	SpawnScriptNow \{freestyle_tutorial_spawn_let_go_detector
		id = detector}
endscript

script freestyle_tutorial_bass_play_riffs_deinit 
	freestyle_tutorial_goal_counter_kill
	KillSpawnedScript \{id = detector}
	freestyle_tutorial_spawn_complete_notification
endscript

script freestyle_tutorial_bass_play_riffs_let_go_handler 
	0x5ac2d36c
endscript

script freestyle_tutorial_bass_play_riffs_strum_handler 
	if (<event_data>.noteclass_triggered = riff)
		freestyle_tutorial_spawn_hold_timer \{time = 5}
	endif
endscript

script freestyle_tutorial_bass_play_interactive_init 
	freestyle_tutorial_spawn_goal_counter \{goal_total = 5}
endscript

script freestyle_tutorial_bass_play_interactive_deinit 
	freestyle_tutorial_goal_counter_kill
	freestyle_tutorial_spawn_complete_notification
endscript

script freestyle_tutorial_bass_play_interactive_strum_handler 
	freestyle_tutorial_goal_counter_increment
	printf 'pattern = %i' i = <pattern>
endscript

script freestyle_tutorial_bass_tiltmeter_informative_init 
	freestyle_tutorial_default_informative_init
	freestyle_tutorial_switch_to_auto_play
endscript

script freestyle_tutorial_bass_tiltmeter_informative_deinit 
	freestyle_tutorial_default_informative_deinit
	freestyle_tutorial_switch_to_controller_play
endscript

script freestyle_tutorial_bass_greentilt_interactive_init 
	freestyle_tutorial_spawn_goal_counter \{goal_total = 5}
endscript

script freestyle_tutorial_bass_greentilt_interactive_deinit 
	freestyle_tutorial_goal_counter_kill
	freestyle_tutorial_spawn_complete_notification
endscript

script freestyle_tutorial_bass_greentilt_interactive_strum_handler 
	if ScreenElementExists \{id = goal_counter}
		getguitaractivetilt \{Player = 0}
		if (<active_tilt> = 2)
			if (<event_data>.noteclass_triggered = single)
				freestyle_tutorial_goal_counter_increment
			endif
		endif
	endif
endscript

script freestyle_tutorial_bass_bluetilt_interactive_init 
	freestyle_tutorial_spawn_goal_counter \{goal_total = 5}
endscript

script freestyle_tutorial_bass_bluetilt_interactive_deinit 
	freestyle_tutorial_goal_counter_kill
	freestyle_tutorial_spawn_complete_notification
endscript

script freestyle_tutorial_bass_bluetilt_interactive_strum_handler 
	if ScreenElementExists \{id = goal_counter}
		getguitaractivetilt \{Player = 0}
		if (<active_tilt> = 1)
			if (<event_data>.noteclass_triggered = single)
				freestyle_tutorial_goal_counter_increment
			endif
		endif
	endif
endscript

script freestyle_tutorial_bass_orangetilt_interactive_init 
	freestyle_tutorial_spawn_goal_counter \{goal_total = 5}
endscript

script freestyle_tutorial_bass_orangetilt_interactive_deinit 
	freestyle_tutorial_goal_counter_kill
	freestyle_tutorial_spawn_complete_notification
endscript

script freestyle_tutorial_bass_orangetilt_interactive_strum_handler 
	if ScreenElementExists \{id = goal_counter}
		getguitaractivetilt \{Player = 0}
		if (<active_tilt> = 0)
			if (<event_data>.noteclass_triggered = single)
				freestyle_tutorial_goal_counter_increment
			endif
		endif
	endif
endscript

script freestyle_tutorial_bass_card_system_interactive_init 
	SpawnScriptNow \{freestyle_tutorial_spawn_timer}
	freestyle_tutorial_spawn_card \{card = bass_play_informative}
	freestyle_tutorial_switch_to_controller_play
endscript

script freestyle_tutorial_bass_card_system_interactive_deinit 
	freestyle_tutorial_spawn_complete_notification
endscript

script freestyle_tutorial_bass_solo_section_interactive_init 
	freestyle_spawn_solo_section_now \{Player = 0
		length_in_beats = 51}
	getmetronomelengthofbeat
	length_ms = (51 * <length_of_beat>)
	length_s = (<length_ms> / 1000)
	SpawnScriptNow freestyle_tutorial_spawn_timer params = {time = <length_s>}
	freestyle_tutorial_switch_to_controller_play
endscript

script freestyle_tutorial_bass_solo_section_interactive_deinit 
	freestyle_tutorial_spawn_complete_notification
endscript

script freestyle_tutorial_bass_solo_section_interactive_strum_handler 
	if ScreenElementExists \{id = goal_counter}
		freestyle_tutorial_goal_counter_increment
	endif
endscript
