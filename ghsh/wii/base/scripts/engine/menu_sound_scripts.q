
script menu_soundevent_in 
	if NOT GotParam \{base_name}
		return
	endif
	switch <base_name>
		case 'setlist'
		Change \{crowd_in_front_end_state = 1}
		case 'gig_posters'
		Change \{crowd_in_front_end_state = 1}
		case 'game_mode'
		if GotParam \{no_camera}
			return
		else
			if NOT GotParam \{old_base_name}
				SoundEvent \{event = menu_career_zoomin}
			elseif GotParam \{old_base_name}
				switch <old_base_name>
					case 'select_practice_mode'
					SpawnScriptNow \{menu_music_on}
					Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = frontend_menu_music}
				endswitch
			endif
		endif
		printf \{channel = sfx
			qs(0x809ac889)}
		case 'mainmenu'
		Change \{crowd_in_front_end_state = 1}
		SpawnScriptNow \{menu_music_panning_vol
			params = {
				reset
			}}
		Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = frontend_menu_music}
		if GotParam \{no_camera}
			return
		else
			if GotParam \{back}
				if GotParam \{old_base_name}
					switch <old_base_name>
						case 'select_controller'
						SoundEvent \{event = menu_headtohead_zoomout}
						case 'band_choose'
						SoundEvent \{event = menu_career_zoomout}
						case 'game_mode'
						SoundEvent \{event = menu_career_zoomout}
						case 'options'
						SoundEvent \{event = menu_options_zoomout}
						case 'band_name_enter'
						SoundEvent \{event = menu_career_zoomout}
						case 'downloads'
						SoundEvent \{event = menu_headtohead_zoomout}
						case 'jam'
						menu_music_fade \{in
							time = 1.01}
						case 'memcard'
						menu_music_fade \{in
							time = 1.01}
					endswitch
				endif
			endif
		endif
		printf \{channel = sfx
			qs(0xb938e98c)}
		case 'options'
		if GotParam \{no_camera}
			return
		else
			if NOT GotParam \{old_base_name}
				SoundEvent \{event = menu_options_zoomin}
			endif
		endif
		case 'select_controller'
		if GotParam \{no_camera}
			return
		elseif GotParam \{old_base_name}
			if (<old_base_name> = 'signin_warning')
				nullsound
			endif
		else
			SoundEvent \{event = menu_headtohead_zoomin}
		endif
		case 'motd'
		if GotParam \{no_camera}
			return
		endif
		case 'downloads'
		if GotParam \{no_camera}
			return
		else
			SoundEvent \{event = menu_headtohead_zoomin}
		endif
		case 'select_instrument'
		if GotParam \{old_base_name}
			switch <old_base_name>
				case 'setlist_quit_warning'
				case 'setlist'
				SpawnScriptNow \{menu_music_on}
			endswitch
		endif
		printf \{channel = sfx
			qs(0x904de698)}
		case 'select_difficulty'
		if GotParam \{old_base_name}
			switch <old_base_name>
				case 'character_selection'
				menu_music_panning_vol \{reset}
				case 'singleplayer_character_hub'
				menu_music_panning_vol \{reset}
			endswitch
		endif
		printf \{channel = sfx
			qs(0xf48ac805)}
		case 'character_selection'
		menu_music_panning_vol \{panandlowervol}
		printf \{channel = sfx
			qs(0x1348bf65)}
		case 'singleplayer_character_hub'
		menu_music_panning_vol \{panandlowervol}
		printf \{channel = sfx
			qs(0x5e1edda0)}
		case 'customize_character'
		printf \{channel = sfx
			qs(0x8a6e76e2)}
		return
		case 'customize_character_instrument'
		printf \{channel = sfx
			qs(0x997014f4)}
		return
		case 'cag_main'
		if GotParam \{back}
			return
		endif
		printf \{channel = sfx
			qs(0x842de458)}
		case 'cadrm_main'
		if GotParam \{back}
			return
		endif
		case 'customize_character_mic'
		if GotParam \{back}
			return
		endif
		case 'create_character_gender'
		printf \{channel = sfx
			'Create Character Gender In'}
		return
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
		if NOT ($game_mode = training || $game_mode = tutorial || $game_mode = practice)
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
		printf \{channel = sfx
			qs(0xd6964400)}
		return
		case 'main_menu'
		printf \{channel = sfx
			qs(0x54f2bbd2)}
		return
		case 'game_mode'
		printf \{channel = sfx
			qs(0x65ec666b)}
		return
		case 'select_controller'
		printf \{qs(0x03ac90f0)}
		return
		case 'options'
		printf \{qs(0x03ac90f0)}
		return
		case 'band_name_enter'
		printf \{channel = sfx
			qs(0x57104d21)}
		return
		case 'select_instrument'
		printf \{channel = sfx
			qs(0xeae35863)}
		return
		case 'select_difficulty'
		printf \{channel = sfx
			qs(0xf2dac53c)}
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
				SpawnScriptNow \{loading_screen_crowd_swell}
				return
			endif
		endif
		i = (<i> + 1)
		repeat <stack_size>
		case 'character_selection'
		printf \{channel = sfx
			qs(0x5946adc6)}
		return
		case 'singleplayer_character_hub'
		printf \{channel = sfx
			qs(0x4c77c3ef)}
		return
		case 'customize_character'
		printf \{channel = sfx
			qs(0xcf3c4078)}
		return
		case 'customize_character_instrument'
		printf \{channel = sfx
			qs(0x7018e6c5)}
		return
		case 'cag_main'
		if GotParam \{back}
			if (<back> = 1)
				if ((<instrument_info>.desc_id) = guitar)
					SoundEvent \{event = guitar_affirmation}
				elseif ((<instrument_info>.desc_id) = bass)
					SoundEvent \{event = bass_affirmation}
				else
					printf \{qs(0xf12ce5bb)}
				endif
			endif
		endif
		case 'setlist'
		printf \{channel = sfx
			'setlist'}
		return
		case 'gig_posters'
		if GotParam \{back}
			return
		endif
		menu_music_off
		SpawnScriptNow \{loading_screen_crowd_swell}
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
