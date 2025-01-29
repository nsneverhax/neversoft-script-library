
script menu_soundevent_in 
	if NOT GotParam \{base_name}
		return
	endif
	switch <base_name>
		case 'game_mode'
		if GotParam \{no_camera}
			return
		else
			if NOT GotParam \{old_base_name}
				SoundEvent \{event = menu_career_zoomin}
			elseif GotParam \{old_base_name}
				switch <old_base_name>
					case 'select_practice_mode'
					SpawnScriptNow \{audio_ui_menu_music_on}
					sfx_backgrounds_new_area \{BG_SFX_Area = FrontEnd}
				endswitch
			endif
		endif
		printf \{channel = sfx
			qs(0x809ac889)}
		case 'mainmenu'
		if ScriptExists \{audio_crowd_play_swells_during_stats_screen}
			KillSpawnedScript \{Name = audio_crowd_play_swells_during_stats_screen}
		endif
		if IsSoundEventPlaying \{surge_during_stats_screen}
			StopSoundEvent \{surge_during_stats_screen
				fade_time = 1.5
				fade_type = linear}
		endif
		SpawnScriptNow \{audio_ui_menu_music_change_pan_and_vol
			params = {
				reset
			}}
		sfx_backgrounds_new_area \{BG_SFX_Area = FrontEnd}
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
						audio_ui_fade_menu_music \{in
							time = 1.01}
						case 'memcard'
						audio_ui_fade_menu_music \{in
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
				audio_null_sound
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
				case 'songlist'
				SpawnScriptNow \{audio_ui_menu_music_on}
			endswitch
		endif
		printf \{channel = sfx
			qs(0x904de698)}
		case 'select_difficulty'
		if GotParam \{old_base_name}
			switch <old_base_name>
				case 'character_selection'
				audio_ui_menu_music_change_pan_and_vol \{reset}
			endswitch
		endif
		printf \{channel = sfx
			qs(0xf48ac805)}
		case 'character_selection'
		audio_ui_menu_music_change_pan_and_vol \{panandlowervol}
		printf \{channel = sfx
			qs(0x1348bf65)}
		case 'customize_character'
		printf \{channel = sfx
			qs(0x8a6e76e2)}
		case 'customize_character_instrument'
		printf \{channel = sfx
			qs(0x997014f4)}
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
		case 'options_audio'
		if GameIsPaused
			printf \{channel = sfx
				qs(0xa1c0a842)}
		else
			audio_ui_fade_menu_music \{out
				Volume = 10
				time = 0.5}
		endif
		case 'band_mode'
		if GotParam \{old_base_name}
			switch <old_base_name>
				case 'songlist'
				SpawnScriptNow \{audio_ui_menu_music_on}
			endswitch
		endif
		case 'online'
		if GotParam \{old_base_name}
			switch <old_base_name>
				case 'online_quit_warning'
				SpawnScriptNow \{audio_ui_menu_music_on}
			endswitch
		endif
		case 'play_song'
		if NOT ($game_mode = tutorial || $game_mode = practice)
			SpawnScriptNow \{audio_crowd_play_loading_screen_swell}
		endif
		case 'leaderboard_instrument'
		if GotParam \{old_base_name}
			switch <old_base_name>
				case 'songlist'
				SpawnScriptNow \{audio_ui_menu_music_on}
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
		case 'main_menu'
		printf \{channel = sfx
			qs(0x54f2bbd2)}
		case 'game_mode'
		printf \{channel = sfx
			qs(0x65ec666b)}
		case 'select_controller'
		printf \{qs(0x03ac90f0)}
		case 'options'
		printf \{qs(0x03ac90f0)}
		case 'band_name_enter'
		printf \{channel = sfx
			qs(0x57104d21)}
		case 'select_instrument'
		printf \{channel = sfx
			qs(0xeae35863)}
		case 'select_difficulty'
		printf \{channel = sfx
			qs(0xf2dac53c)}
		if GotParam \{back}
			return
		endif
		ui_event_get_stack
		i = 0
		begin
		if ((<stack> [<i>].base_name) = 'songlist')
			audio_ui_menu_music_off
			return
		endif
		i = (<i> + 1)
		repeat <stack_size>
		case 'character_selection'
		printf \{channel = sfx
			qs(0x5946adc6)}
		case 'customize_character'
		printf \{channel = sfx
			qs(0xcf3c4078)}
		case 'customize_character_instrument'
		printf \{channel = sfx
			qs(0x7018e6c5)}
		case 'cag_main'
		if GotParam \{back}
			if (<back> = 1)
				if ((<instrument_info>.desc_id) = guitar)
					SoundEvent \{event = 0x1f709a70}
				elseif ((<instrument_info>.desc_id) = bass)
					SoundEvent \{event = 0xb658b4de}
				else
					printf \{qs(0xf12ce5bb)}
				endif
			endif
		endif
		case 'songlist'
		printf \{channel = sfx
			'songlist'}
		case 'cadrm_main'
		if GotParam \{back}
			if (<back> = 1)
				SoundEvent \{event = 0x06f5c9d0}
			endif
		endif
		case 'customize_character_mic'
		if GotParam \{back}
			if (<back> = 1)
				SoundEvent \{event = 0xb159f273}
			endif
		endif
		case 'options_audio'
		if GameIsPaused
			printf \{channel = sfx
				qs(0x6dfca383)}
		else
			audio_ui_fade_menu_music \{in
				time = 1.5}
		endif
		default
	endswitch
endscript
