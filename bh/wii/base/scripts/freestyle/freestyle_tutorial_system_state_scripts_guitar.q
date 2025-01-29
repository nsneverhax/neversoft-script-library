
script freestyle_tutorial_guitar_play_informative_init 
	freestyle_tutorial_default_informative_init
endscript

script freestyle_tutorial_guitar_play_informative_deinit 
	freestyle_tutorial_default_informative_deinit
	freestyle_tutorial_switch_to_controller_play
endscript

script freestyle_tutorial_guitar_play_notes_init 
	freestyle_tutorial_spawn_goal_counter \{goal_total = 5}
endscript

script freestyle_tutorial_guitar_play_notes_deinit 
	freestyle_tutorial_goal_counter_kill
	freestyle_tutorial_spawn_complete_notification
endscript

script freestyle_tutorial_guitar_play_notes_strum_handler 
	if ((<event_data>.noteclass_triggered = single) || (<event_data>.noteclass_triggered = lick))
		freestyle_tutorial_goal_counter_increment
	endif
endscript

script freestyle_tutorial_guitar_play_chords_init 
	freestyle_tutorial_spawn_goal_counter \{goal_total = 5}
endscript

script freestyle_tutorial_guitar_play_chords_deinit 
	freestyle_tutorial_goal_counter_kill
	freestyle_tutorial_spawn_complete_notification
endscript

script freestyle_tutorial_guitar_play_chords_strum_handler 
	if ((<event_data>.noteclass_triggered = chord) || (<event_data>.noteclass_triggered = riff))
		freestyle_tutorial_goal_counter_increment
	endif
endscript

script freestyle_tutorial_tiltmeter_informative_init 
	freestyle_tutorial_default_informative_init
	freestyle_tutorial_switch_to_auto_play
endscript

script freestyle_tutorial_tiltmeter_informative_deinit 
	freestyle_tutorial_default_informative_deinit
	freestyle_tutorial_switch_to_controller_play
endscript

script freestyle_tutorial_greentilt_interactive_init 
	freestyle_tutorial_spawn_goal_counter \{goal_total = 5}
endscript

script freestyle_tutorial_greentilt_interactive_deinit 
	freestyle_tutorial_goal_counter_kill
	freestyle_tutorial_spawn_complete_notification
endscript

script freestyle_tutorial_greentilt_interactive_strum_handler 
	if ScreenElementExists \{id = goal_counter}
		getguitaractivetilt \{Player = 0}
		if (<active_tilt> = 2)
			if (<event_data>.noteclass_triggered = single)
				freestyle_tutorial_goal_counter_increment
			endif
		endif
	endif
endscript

script freestyle_tutorial_bluetilt_interactive_init 
	freestyle_tutorial_spawn_goal_counter \{goal_total = 5}
endscript

script freestyle_tutorial_bluetilt_interactive_deinit 
	freestyle_tutorial_goal_counter_kill
	freestyle_tutorial_spawn_complete_notification
endscript

script freestyle_tutorial_bluetilt_interactive_strum_handler 
	if ScreenElementExists \{id = goal_counter}
		getguitaractivetilt \{Player = 0}
		if (<active_tilt> = 1)
			if (<event_data>.noteclass_triggered = single)
				freestyle_tutorial_goal_counter_increment
			endif
		endif
	endif
endscript

script freestyle_tutorial_orangetilt_interactive_init 
	freestyle_tutorial_spawn_goal_counter \{goal_total = 5}
	SpawnScriptNow \{freestyle_tutorial_spawn_let_go_detector
		id = detector}
endscript

script freestyle_tutorial_orangetilt_interactive_deinit 
	freestyle_tutorial_goal_counter_kill
	KillSpawnedScript \{id = detector}
	freestyle_tutorial_spawn_complete_notification
endscript

script freestyle_tutorial_orangetilt_interactive_let_go_handler 
	0x5ac2d36c
endscript

script freestyle_tutorial_orangetilt_interactive_strum_handler 
	0x5ac2d36c
	if ScreenElementExists \{id = goal_counter}
		getguitaractivetilt \{Player = 0}
		if (<active_tilt> = 0)
			if ((<event_data>.noteclass_triggered = riff) || (<event_data>.noteclass_triggered = lick))
				freestyle_tutorial_spawn_hold_timer \{time = 5}
			endif
		endif
	endif
endscript

script freestyle_tutorial_guitar_card_system_interactive_init 
	SpawnScriptNow \{freestyle_tutorial_spawn_timer}
	freestyle_tutorial_spawn_card \{card = guitar_play_informative}
	freestyle_tutorial_switch_to_controller_play
endscript

script freestyle_tutorial_guitar_card_system_interactive_deinit 
	freestyle_tutorial_spawn_complete_notification
endscript

script freestyle_tutorial_solo_section_interactive_init 
	freestyle_spawn_solo_section_now \{Player = 0
		length_in_beats = 51}
	getmetronomelengthofbeat
	length_ms = (51 * <length_of_beat>)
	length_s = (<length_ms> / 1000)
	SpawnScriptNow freestyle_tutorial_spawn_timer params = {time = <length_s>}
	freestyle_tutorial_switch_to_controller_play
endscript

script freestyle_tutorial_solo_section_interactive_deinit 
	freestyle_tutorial_spawn_complete_notification
endscript

script freestyle_tutorial_solo_section_interactive_strum_handler 
	if ScreenElementExists \{id = goal_counter}
		freestyle_tutorial_goal_counter_increment
	endif
endscript

script freestyle_tutorial_difference_informative_init 
	freestyle_tutorial_default_informative_init
endscript

script freestyle_tutorial_difference_informative_deinit 
	freestyle_tutorial_default_informative_deinit
endscript

script freestyle_tutorial_hammeron_informative_init 
	freestyle_tutorial_default_informative_init
endscript

script freestyle_tutorial_hammeron_informative_deinit 
	freestyle_tutorial_default_informative_deinit
endscript

script freestyle_tutorial_hammeron_interactive_init 
	freestyle_tutorial_spawn_goal_counter \{goal_total = 5}
	freestyle_tutorial_switch_to_controller_play
endscript

script freestyle_tutorial_hammeron_interactive_deinit 
	if ScreenElementExists \{id = goal_counter}
		freestyle_tutorial_goal_counter_kill
	endif
	freestyle_tutorial_spawn_complete_notification
endscript

script freestyle_tutorial_hammeron_interactive_strum_handler 
	if freestyle_is_hopo_note note_flags = (<event_data>.noteflags_triggered)
		if ScreenElementExists \{id = goal_counter}
			freestyle_tutorial_goal_counter_increment
		endif
	endif
endscript

script freestyle_tutorial_accent_informative_init 
	freestyle_tutorial_default_informative_init
endscript

script freestyle_tutorial_accent_informative_deinit 
	freestyle_tutorial_default_informative_deinit
endscript

script freestyle_tutorial_accent_interactive_init 
	freestyle_tutorial_spawn_goal_counter \{goal_total = 5}
	freestyle_tutorial_switch_to_controller_play
endscript

script freestyle_tutorial_accent_interactive_deinit 
	if ScreenElementExists \{id = goal_counter}
		freestyle_tutorial_goal_counter_kill
	endif
	freestyle_tutorial_spawn_complete_notification
endscript

script freestyle_tutorial_accent_interactive_strum_handler 
	if StructureContains structure = (<event_data>.noteflags_triggered) accent
		if ScreenElementExists \{id = goal_counter}
			if NOT ((<pattern> = 69904) || (<pattern> = 4369) || (<pattern> = 69649))
				freestyle_tutorial_goal_counter_increment
			endif
		endif
	endif
endscript

script freestyle_tutorial_effects_informative_init 
	freestyle_tutorial_default_informative_init
endscript

script freestyle_tutorial_effects_informative_deinit 
	freestyle_tutorial_default_informative_deinit
endscript

script freestyle_tutorial_wah_interactive_init 
	if NOT ScreenElementExists \{id = goal_counter}
		freestyle_tutorial_spawn_goal_counter \{goal_total = 5}
	endif
	freestyle_tutorial_switch_to_controller_play
endscript

script freestyle_tutorial_wah_interactive_deinit 
	if ScreenElementExists \{id = goal_counter}
		freestyle_tutorial_goal_counter_kill
	endif
	freestyle_tutorial_spawn_complete_notification
endscript

script freestyle_tutorial_wah_interactive_strum_handler 
	effect_played = ($freestyle_player_data [0].synth_effect)
	if ScreenElementExists \{id = goal_counter}
		if (<effect_played> = wah_guitar)
			freestyle_tutorial_goal_counter_increment
		endif
	endif
endscript

script freestyle_tutorial_echo_interactive_init 
	if NOT ScreenElementExists \{id = goal_counter}
		freestyle_tutorial_spawn_goal_counter \{goal_total = 5}
	endif
	freestyle_tutorial_switch_to_controller_play
endscript

script freestyle_tutorial_echo_interactive_deinit 
	if ScreenElementExists \{id = goal_counter}
		freestyle_tutorial_goal_counter_kill
	endif
	freestyle_tutorial_spawn_complete_notification
endscript

script freestyle_tutorial_echo_interactive_strum_handler 
	effect_played = ($freestyle_player_data [0].synth_effect)
	if ScreenElementExists \{id = goal_counter}
		if (<effect_played> = echo)
			freestyle_tutorial_goal_counter_increment
		endif
	endif
endscript

script freestyle_tutorial_flange_interactive_init 
	if NOT ScreenElementExists \{id = goal_counter}
		freestyle_tutorial_spawn_goal_counter \{goal_total = 5}
	endif
	freestyle_tutorial_switch_to_controller_play
endscript

script freestyle_tutorial_flange_interactive_deinit 
	if ScreenElementExists \{id = goal_counter}
		freestyle_tutorial_goal_counter_kill
	endif
	freestyle_tutorial_spawn_complete_notification
endscript

script freestyle_tutorial_flange_interactive_strum_handler 
	effect_played = ($freestyle_player_data [0].synth_effect)
	if ScreenElementExists \{id = goal_counter}
		if (<effect_played> = flange)
			freestyle_tutorial_goal_counter_increment
		endif
	endif
endscript

script freestyle_tutorial_no_effect_interactive_init 
	if NOT ScreenElementExists \{id = goal_counter}
		freestyle_tutorial_spawn_goal_counter \{goal_total = 5}
	endif
	freestyle_tutorial_switch_to_controller_play
endscript

script freestyle_tutorial_no_effect_interactive_deinit 
	if ScreenElementExists \{id = goal_counter}
		freestyle_tutorial_goal_counter_kill
	endif
	freestyle_tutorial_spawn_complete_notification
endscript

script freestyle_tutorial_no_effect_interactive_strum_handler 
	effect_played = ($freestyle_player_data [0].synth_effect)
	if ScreenElementExists \{id = goal_counter}
		if (<effect_played> = None)
			freestyle_tutorial_goal_counter_increment
		endif
	endif
endscript

script freestyle_tutorial_effects_interactive_init 
	if NOT ScreenElementExists \{id = goal_counter}
		freestyle_tutorial_spawn_goal_counter \{goal_total = 4}
		goal_counter :SetTags \{effects_played = [
			]}
	endif
	freestyle_tutorial_switch_to_controller_play
endscript

script freestyle_tutorial_effects_interactive_deinit 
	if ScreenElementExists \{id = goal_counter}
		freestyle_tutorial_goal_counter_kill
	endif
	freestyle_tutorial_spawn_complete_notification
endscript

script freestyle_tutorial_effects_interactive_strum_handler 
	if ScreenElementExists \{id = goal_counter}
		effect_played = ($freestyle_player_data [0].synth_effect)
		goal_counter :GetTags \{effects_played}
		GetArraySize <effects_played>
		is_valid = true
		if NOT (<array_Size> = 0)
			counter = 0
			begin
			if (<effect_played> = (<effects_played> [<counter>]))
				is_valid = FALSE
			endif
			counter = (<counter> + 1)
			repeat <array_Size>
		endif
		if (<is_valid> = true)
			temp = [insert_name_here]
			SetArrayElement {ArrayName = temp index = 0 NewValue = <effect_played>}
			effects_played = (<effects_played> + <temp>)
			goal_counter :SetTags effects_played = <effects_played>
			if ScreenElementExists \{id = goal_counter}
				freestyle_tutorial_goal_counter_increment
			endif
		endif
	endif
endscript

script freestyle_tutorial_similarity_informative_init 
	freestyle_tutorial_default_informative_init
endscript

script freestyle_tutorial_similarity_informative_deinit 
	freestyle_tutorial_default_informative_deinit
endscript

script freestyle_tutorial_whammy_informative_init 
	freestyle_tutorial_default_informative_init
endscript

script freestyle_tutorial_whammy_informative_deinit 
	freestyle_tutorial_default_informative_deinit
endscript

script freestyle_tutorial_slider_informative_init 
	freestyle_tutorial_default_informative_init
endscript

script freestyle_tutorial_slider_informative_deinit 
	freestyle_tutorial_default_informative_deinit
endscript

script freestyle_tutorial_advanced_informative_init 
	freestyle_tutorial_default_informative_init
endscript

script freestyle_tutorial_advanced_informative_deinit 
	freestyle_tutorial_default_informative_deinit
endscript

script freestyle_tutorial_velocity_informative_init 
	freestyle_tutorial_default_informative_init
endscript

script freestyle_tutorial_velocity_informative_deinit 
	freestyle_tutorial_default_informative_deinit
endscript

script freestyle_tutorial_ds_informative_init 
	freestyle_tutorial_default_informative_init
endscript

script freestyle_tutorial_ds_informative_deinit 
	freestyle_tutorial_default_informative_deinit
endscript

script freestyle_tutorial_save_informative_init 
	freestyle_tutorial_default_informative_init
endscript

script freestyle_tutorial_save_informative_deinit 
	freestyle_tutorial_default_informative_deinit
endscript

script freestyle_tutorial_closing_informative_init 
	instrument = ($freestyle_player_data [0].instrument)
	instrument_handler = ($freestyle_player_data [0].instrument_handler)
	if (<instrument> = drums)
		if (<instrument_handler> = drums_nunchuk)
			button = qs(0x7b189fab)
			text = qs(0xe0ca6171)
		else
			button = qs(0x8b61d0ae)
			text = qs(0xe0ca6171)
		endif
	elseif ((<instrument> = guitar) || (<instrument> = bass))
		button = qs(0x1f745aaf)
		text = qs(0xe0ca6171)
	endif
	freestyle_tutorial_info_pane :se_setprops {
		prompt_button = <button>
		prompt_text = <text>
	}
endscript

script freestyle_tutorial_closing_informative_deinit 
	freestyle_tutorial_info_pane :se_setprops \{prompt_text = qs(0x03ac90f0)
		prompt_button = qs(0x03ac90f0)}
endscript
