
script menu_soundevent_in 
	if NOT GotParam \{base_name}
		return
	endif
	switch <base_name>
		case 'setlist'
		change \{crowd_in_Front_End_state = 1}
		case 'gig_posters'
		change \{crowd_in_Front_End_state = 1}
		case 'game_mode'
		if GotParam \{no_camera}
			return
		else
			if NOT GotParam \{old_base_name}
				SoundEvent \{event = Menu_Career_ZoomIn}
			elseif GotParam \{old_base_name}
				switch <old_base_name>
					case 'select_practice_mode'
					spawnscriptnow \{menu_music_on}
					Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = FrontEnd_Menu_Music}
				endswitch
			endif
		endif
		printf \{channel = sfx
			qs("\LGame Mode In")}
		case 'mainmenu'
		change \{crowd_in_Front_End_state = 1}
		spawnscriptnow \{Menu_Music_Panning_Vol
			params = {
				reset
			}}
		Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = FrontEnd_Menu_Music}
		if GotParam \{no_camera}
			return
		else
			if GotParam \{back}
				if GotParam \{old_base_name}
					switch <old_base_name>
						case 'select_controller'
						SoundEvent \{event = Menu_HeadToHead_ZoomOut}
						case 'band_choose'
						SoundEvent \{event = Menu_Career_ZoomOut}
						case 'game_mode'
						SoundEvent \{event = Menu_Career_ZoomOut}
						case 'options'
						SoundEvent \{event = Menu_Options_ZoomOut}
						case 'band_name_enter'
						SoundEvent \{event = Menu_Career_ZoomOut}
						case 'downloads'
						SoundEvent \{event = Menu_HeadToHead_ZoomOut}
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
			qs("\LMain Menu In")}
		case 'options'
		if GotParam \{no_camera}
			return
		else
			if NOT GotParam \{old_base_name}
				SoundEvent \{event = Menu_Options_ZoomIn}
			endif
		endif
		case 'select_controller'
		if GotParam \{no_camera}
			return
		elseif GotParam \{old_base_name}
			if (<old_base_name> = 'signin_warning')
				NullSound
			endif
		else
			SoundEvent \{event = Menu_HeadToHead_ZoomIn}
		endif
		case 'motd'
		if GotParam \{no_camera}
			return
		endif
		case 'downloads'
		if GotParam \{no_camera}
			return
		else
			SoundEvent \{event = Menu_HeadToHead_ZoomIn}
		endif
		case 'select_instrument'
		if GotParam \{old_base_name}
			switch <old_base_name>
				case 'setlist_quit_warning'
				case 'setlist'
				spawnscriptnow \{menu_music_on}
			endswitch
		endif
		printf \{channel = sfx
			qs("\LSelect Instrument In")}
		case 'select_difficulty'
		if GotParam \{old_base_name}
			switch <old_base_name>
				case 'character_selection'
				Menu_Music_Panning_Vol \{reset}
				case 'singleplayer_character_hub'
				Menu_Music_Panning_Vol \{reset}
			endswitch
		endif
		printf \{channel = sfx
			qs("\LSelect Difficulty In")}
		case 'character_selection'
		Menu_Music_Panning_Vol \{panandlowervol}
		printf \{channel = sfx
			qs("\LCharacter Selection In")}
		case 'singleplayer_character_hub'
		Menu_Music_Panning_Vol \{panandlowervol}
		printf \{channel = sfx
			qs("\LSingle Player Character Hub In")}
		case 'customize_character'
		printf \{channel = sfx
			qs("\LCustomize character In")}
		case 'customize_character_instrument'
		printf \{channel = sfx
			qs("\LCustomize Character Instrument In")}
		case 'cag_main'
		if GotParam \{back}
			return
		endif
		printf \{channel = sfx
			qs("\LCAG Main In")}
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
		menu_music_fade \{out
			volume = 10
			time = 0.5}
		case 'band_mode'
		if GotParam \{old_base_name}
			switch <old_base_name>
				case 'setlist'
				spawnscriptnow \{menu_music_on}
			endswitch
		endif
		case 'character_hub'
		if GotParam \{old_base_name}
			switch <old_base_name>
				case 'setlist'
				spawnscriptnow \{menu_music_on}
			endswitch
		endif
		case 'online'
		if GotParam \{old_base_name}
			switch <old_base_name>
				case 'online_quit_warning'
				spawnscriptnow \{menu_music_on}
			endswitch
		endif
		case 'play_song'
		if NOT ($game_mode = training || $game_mode = tutorial || $game_mode = practice)
			spawnscriptnow \{Loading_Screen_Crowd_Swell}
		endif
		case 'leaderboard_instrument'
		if GotParam \{old_base_name}
			switch <old_base_name>
				case 'setlist'
				spawnscriptnow \{menu_music_on}
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
			qs("\LBand Choose Out")}
		case 'main_menu'
		printf \{channel = sfx
			qs("\LMain Menu Out")}
		case 'game_mode'
		printf \{channel = sfx
			qs("\LGame Mode Out")}
		case 'select_controller'
		printf \{qs("\L")}
		case 'options'
		printf \{qs("\L")}
		case 'band_name_enter'
		printf \{channel = sfx
			qs("\LBand Name Enter Out")}
		case 'select_instrument'
		printf \{channel = sfx
			qs("\LSelect Instrument Out")}
		case 'select_difficulty'
		printf \{channel = sfx
			qs("\LSelect Difficulty Out")}
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
				Menu_Music_Off
				return
			endif
		endif
		i = (<i> + 1)
		repeat <stack_size>
		case 'character_selection'
		printf \{channel = sfx
			qs("\LCharacter Selection Out")}
		case 'singleplayer_character_hub'
		printf \{channel = sfx
			qs("\LSingle Player Character Hub Out")}
		case 'customize_character'
		printf \{channel = sfx
			qs("\LCustomize character Out")}
		case 'customize_character_instrument'
		printf \{channel = sfx
			qs("\LCustomize Character Instrument Out")}
		case 'cag_main'
		if GotParam \{back}
			if (<back> = 1)
				if ((<instrument_info>.desc_id) = guitar)
					SoundEvent \{event = Guitar_Affirmation}
				elseif ((<instrument_info>.desc_id) = Bass)
					SoundEvent \{event = Bass_Affirmation}
				else
					printf \{qs("\L################### UNKNOWN INSTRUMENT SOUND ###################")}
				endif
			endif
		endif
		case 'setlist'
		printf \{channel = sfx
			'setlist'}
		case 'gig_posters'
		if GotParam \{back}
			return
		endif
		Menu_Music_Off
		case 'cadrm_main'
		if GotParam \{back}
			if (<back> = 1)
				SoundEvent \{event = Drum_Affirmation}
			endif
		endif
		case 'customize_character_mic'
		if GotParam \{back}
			if (<back> = 1)
				SoundEvent \{event = Mic_Affirmation}
			endif
		endif
		case 'options_audio'
		menu_music_fade \{in
			options_audio
			time = 1.5}
		default
	endswitch
endscript
