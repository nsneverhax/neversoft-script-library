
script menu_soundevent_in 
	if NOT GotParam \{base_name}
		return
	endif
	switch <base_name>
		case 'setlist'
		Change \{crowd_in_front_end_state = 1}
		case 'gig_posters'
		Change \{crowd_in_front_end_state = 1}
		case 'select_instrument'
		if GotParam \{old_base_name}
			switch <old_base_name>
				case 'setlist_quit_warning'
				case 'setlist'
				SpawnScriptNow \{menu_music_on}
			endswitch
		endif
		case 'select_difficulty'
		if GotParam \{old_base_name}
			switch <old_base_name>
				case 'character_selection'
				menu_music_panning_vol \{reset}
				case 'singleplayer_character_hub'
				menu_music_panning_vol \{reset}
			endswitch
		endif
		case 'character_selection'
		menu_music_panning_vol \{panandlowervol}
		case 'singleplayer_character_hub'
		menu_music_panning_vol \{panandlowervol}
		case 'options_audio'
		menu_music_fade \{out
			Volume = 10
			time = 0.5}
		case 'band_mode'
		if GotParam \{old_base_name}
			switch <old_base_name>
				case 'setlist'
				SpawnScriptNow \{menu_music_on}
			endswitch
		endif
		case 'character_hub'
		if GotParam \{old_base_name}
			switch <old_base_name>
				case 'setlist'
				SpawnScriptNow \{menu_music_on}
			endswitch
		endif
		case 'online'
		if GotParam \{old_base_name}
			switch <old_base_name>
				case 'online_quit_warning'
				SpawnScriptNow \{menu_music_on}
			endswitch
		endif
		case 'play_song'
		if NOT ($game_mode = practice || $game_mode = tutorial || $game_mode = practice)
			SpawnScriptNow \{loading_screen_crowd_swell}
		endif
		case 'leaderboard_instrument'
		if GotParam \{old_base_name}
			switch <old_base_name>
				case 'setlist'
				SpawnScriptNow \{menu_music_on}
			endswitch
		endif
		default
	endswitch
endscript

script menu_soundevent_out 
	if NOT GotParam \{base_name}
		return
	endif
	switch (<base_name>)
		case 'band_choose'

		return
		case 'main_menu'

		return
		case 'game_mode'

		return
		case 'select_controller'

		return
		case 'options'

		return
		case 'band_name_enter'

		return
		case 'select_instrument'

		return
		case 'select_difficulty'

		if GotParam \{back}
			return
		endif
		ui_event_get_stack
		i = 0
		begin
		if ((<stack> [<i>].base_name) = 'setlist')
			if ($top_rockers_enabled)
				if ($top_rockers_which_mode = p1_quickplay)
					generic_menu_pad_choose_sound
					return
				elseif ($top_rockers_which_mode = p2_quickplay)
					generic_menu_pad_choose_sound
					return
				endif
			else
				menu_music_off
				return
			endif
		endif
		i = (<i> + 1)
		repeat <stack_size>
		case 'character_selection'

		return
		case 'singleplayer_character_hub'

		return
		case 'customize_character'

		return
		case 'customize_character_instrument'

		return
		case 'cag_main'
		if GotParam \{back}
			if (<back> = 1)
				if ((<instrument_info>.desc_id) = guitar)
					SoundEvent \{event = guitar_affirmation}
				elseif ((<instrument_info>.desc_id) = bass)
					SoundEvent \{event = bass_affirmation}
				else

				endif
			endif
		endif
		case 'setlist'

		return
		case 'gig_posters'
		if GotParam \{back}
			return
		endif
		menu_music_off
		case 'cadrm_main'
		if GotParam \{back}
			if (<back> = 1)
				SoundEvent \{event = drum_affirmation}
			endif
		endif
		case 'customize_character_mic'
		if GotParam \{back}
			if (<back> = 1)
				SoundEvent \{event = mic_affirmation}
			endif
		endif
		case 'options_audio'
		menu_music_fade \{in
			options_audio
			time = 1.5}
		default
	endswitch
endscript
