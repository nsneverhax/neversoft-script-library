
script menu_soundevent_in 
	if NOT gotparam \{base_name}
		return
	endif
	switch <base_name>
		case 'game_mode'
		if gotparam \{no_camera}
			return
		else
			if NOT gotparam \{old_base_name}
				soundevent \{event = menu_career_zoomin}
			elseif gotparam \{old_base_name}
				switch <old_base_name>
					case 'select_practice_mode'
					spawnscriptnow \{menu_music_on}
					skate8_sfx_backgrounds_new_area \{bg_sfx_area = frontend_menu_music}
				endswitch
			endif
		endif
		printf \{channel = sfx
			qs(0x809ac889)}
		case 'mainmenu'
		spawnscriptnow \{menu_music_panning_vol
			params = {
				reset
			}}
		skate8_sfx_backgrounds_new_area \{bg_sfx_area = frontend_menu_music}
		if gotparam \{no_camera}
			return
		else
			if gotparam \{back}
				if gotparam \{old_base_name}
					switch <old_base_name>
						case 'select_controller'
						soundevent \{event = menu_headtohead_zoomout}
						case 'band_choose'
						soundevent \{event = menu_career_zoomout}
						case 'game_mode'
						soundevent \{event = menu_career_zoomout}
						case 'options'
						soundevent \{event = menu_options_zoomout}
						case 'band_name_enter'
						soundevent \{event = menu_career_zoomout}
						case 'downloads'
						soundevent \{event = menu_headtohead_zoomout}
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
		if gotparam \{no_camera}
			return
		else
			if NOT gotparam \{old_base_name}
				soundevent \{event = menu_options_zoomin}
			endif
		endif
		case 'select_controller'
		if gotparam \{no_camera}
			return
		elseif gotparam \{old_base_name}
			if (<old_base_name> = 'signin_warning')
				nullsound
			endif
		else
			soundevent \{event = menu_headtohead_zoomin}
		endif
		case 'motd'
		if gotparam \{no_camera}
			return
		endif
		case 'downloads'
		if gotparam \{no_camera}
			return
		else
			soundevent \{event = menu_headtohead_zoomin}
		endif
		case 'select_instrument'
		if gotparam \{old_base_name}
			switch <old_base_name>
				case 'setlist_quit_warning'
				case 'setlist'
				spawnscriptnow \{menu_music_on}
			endswitch
		endif
		printf \{channel = sfx
			qs(0x904de698)}
		case 'select_difficulty'
		if gotparam \{old_base_name}
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
		case 'customize_character_instrument'
		printf \{channel = sfx
			qs(0x997014f4)}
		case 'cag_main'
		if gotparam \{back}
			return
		endif
		printf \{channel = sfx
			qs(0x842de458)}
		case 'cadrm_main'
		if gotparam \{back}
			return
		endif
		case 'customize_character_mic'
		if gotparam \{back}
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
		if gotparam \{old_base_name}
			switch <old_base_name>
				case 'setlist'
				spawnscriptnow \{menu_music_on}
			endswitch
		endif
		case 'character_hub'
		if gotparam \{old_base_name}
			switch <old_base_name>
				case 'setlist'
				spawnscriptnow \{menu_music_on}
			endswitch
		endif
		case 'online'
		if gotparam \{old_base_name}
			switch <old_base_name>
				case 'online_quit_warning'
				spawnscriptnow \{menu_music_on}
			endswitch
		endif
		case 'play_song'
		if NOT ($game_mode = training || $game_mode = tutorial || $game_mode = practice)
			spawnscriptnow \{loading_screen_crowd_swell}
		endif
		case 'leaderboard_instrument'
		if gotparam \{old_base_name}
			switch <old_base_name>
				case 'setlist'
				spawnscriptnow \{menu_music_on}
			endswitch
		endif
		default
	endswitch
endscript

script menu_soundevent_out 
	if NOT gotparam \{base_name}
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
		if gotparam \{back}
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
		printf \{channel = sfx
			qs(0x5946adc6)}
		case 'singleplayer_character_hub'
		printf \{channel = sfx
			qs(0x4c77c3ef)}
		case 'customize_character'
		printf \{channel = sfx
			qs(0xcf3c4078)}
		case 'customize_character_instrument'
		printf \{channel = sfx
			qs(0x7018e6c5)}
		case 'cag_main'
		if gotparam \{back}
			if (<back> = 1)
				if ((<instrument_info>.desc_id) = guitar)
					soundevent \{event = guitar_affirmation}
				elseif ((<instrument_info>.desc_id) = bass)
					soundevent \{event = bass_affirmation}
				else
					printf \{qs(0xf12ce5bb)}
				endif
			endif
		endif
		case 'setlist'
		printf \{channel = sfx
			'setlist'}
		case 'gig_posters'
		if gotparam \{back}
			return
		endif
		menu_music_off
		case 'cadrm_main'
		if gotparam \{back}
			if (<back> = 1)
				soundevent \{event = drum_affirmation}
			endif
		endif
		case 'customize_character_mic'
		if gotparam \{back}
			if (<back> = 1)
				soundevent \{event = mic_affirmation}
			endif
		endif
		case 'options_audio'
		menu_music_fade \{in
			time = 1.5}
		default
	endswitch
endscript
