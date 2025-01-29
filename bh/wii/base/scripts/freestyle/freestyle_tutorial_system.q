
script freestyle_tutorial_init 
	freestyle_get_player_param \{Player = $freestyle_tutorial_player
		param = controller}
	CreateScreenElement \{parent = freestyle_root
		id = freestyle_tutorial_info_pane
		Type = descinterface
		desc = 'freestyle_tutorial_info_pane_v2'}
	freestyle_tutorial_info_pane :desc_resolvealias \{Name = alias_info_card_event_handler}
	<resolved_id> :se_setprops {exclusive_device = <controller>}
	LaunchEvent Type = focus target = <resolved_id>
	instrument = ($freestyle_player_data [0].instrument)
	instrument_handler = ($freestyle_player_data [0].instrument_handler)
	controller = ($freestyle_player_data [0].controller)
	if (<instrument> = drums)
		if (<instrument_handler> = drums_nunchuk)
			instrument = nunchuk
		else
			instrument = drumkit
		endif
	endif
	freestyle_tutorial_info_pane :SetTags controller_type = <instrument>
	default_state_info = {
		header_text = qs(0x77878e81)
		info_text = qs(0x77878e81)
		event_handlers = []
		state_init_script = NULL
		state_deinit_script = NULL
	}
	freestyle_tutorial_info_pane :SetTags state_info = <default_state_info>
	freestyle_tutorial_change_state \{state = main_informative}
endscript

script freestyle_tutorial_deinit 
	freestyle_tutorial_info_pane :GetTags \{state_info}
	(<state_info>.state_deinit_script)
	KillSpawnedScript \{id = animate_script}
	KillSpawnedScript \{id = detector}
	DestroyScreenElement \{id = freestyle_tutorial_info_pane}
	if ScreenElementExists \{id = goal_counter}
		DestroyScreenElement \{id = goal_counter}
	endif
	if ScreenElementExists \{id = complete_notification}
		DestroyScreenElement \{id = complete_notification}
	endif
	0x5ac2d36c
endscript

script freestyle_tutorial_change_state \{state = main_informative}
	freestyle_tutorial_info_pane :GetTags \{controller_type}
	difficulty = ($freestyle_player_data [0].difficulty)
	instrument = ($freestyle_player_data [0].instrument)
	SoundEvent \{event = gigboard_select}
	switch <instrument>
		case guitar
		freestyle_tutorial_get_guitar_card_info state = <state> bank = <difficulty>
		case bass
		freestyle_tutorial_get_bass_card_info state = <state>
		case drums
		switch <controller_type>
			case drumkit
			if NOT GotParam \{Type}
				freestyle_tutorial_get_drums_card_info state = <state>
			else
				if (<Type> = shared)
					freestyle_tutorial_get_drums_card_info state = <state>
				elseif (<Type> = handedness)
					if (($freestyle_player_data [0].lefty) = true)
						freestyle_tutorial_get_drums_lefty_card_info state = <state>
					else
						freestyle_tutorial_get_drums_righty_card_info state = <state>
					endif
				endif
			endif
			case nunchuk
			if NOT GotParam \{Type}
				freestyle_tutorial_get_nunchuk_card_info state = <state>
			else
				if (<Type> = shared)
					freestyle_tutorial_get_nunchuk_card_info state = <state>
				elseif (<Type> = handedness)
					if (($freestyle_player_data [0].lefty) = true)
						freestyle_tutorial_get_nunchuk_lefty_card_info state = <state>
					else
						freestyle_tutorial_get_nunchuk_righty_card_info state = <state>
					endif
				endif
			endif
		endswitch
	endswitch
	freestyle_tutorial_info_pane :GetTags \{state_info}
	(<state_info>.state_deinit_script)
	freestyle_tutorial_clear_cards
	freestyle_tutorial_info_pane :SetTags state_info = <info>
	(<info>.state_init_script)
	freestyle_tutorial_info_pane :se_setprops {
		header_text = (<info>.header_text)
		info_text = (<info>.info_text)
	}
	freestyle_tutorial_info_pane :desc_resolvealias \{Name = alias_info_card_event_handler}
	<resolved_id> :se_setprops {
		event_handlers = (<info>.event_handlers)
		replace_handlers
	}
endscript

script freestyle_tutorial_get_guitar_card_info \{state = main_informative
		bank = beginner}
	card_info_struct = {}
	freestyle_tutorial_info_pane :desc_resolvealias \{Name = alias_info_card_event_handler}
	AssignAlias id = <resolved_id> alias = input_handler
	if (<bank> = beginner)
		switch <state>
			case main_informative
			card_info_struct = {
				header_text = qs(0x9368c759)
				info_text = qs(0xdab204a4)
				event_handlers = [
					{pad_choose LaunchEvent params = {Type = step_complete target = input_handler}}
					{step_complete freestyle_tutorial_change_state params = {state = guitar_play_informative}}
				]
				state_init_script = freestyle_tutorial_default_informative_init
				state_deinit_script = freestyle_tutorial_default_informative_deinit
			}
			case guitar_play_informative
			card_info_struct = {
				header_text = qs(0xf9168c7c)
				info_text = qs(0xecc9aa6b)
				event_handlers = [
					{pad_choose LaunchEvent params = {Type = step_complete target = input_handler}}
					{step_complete freestyle_tutorial_change_state params = {state = guitar_play_interactive}}
				]
				state_init_script = freestyle_tutorial_guitar_play_informative_init
				state_deinit_script = freestyle_tutorial_guitar_play_informative_deinit
			}
			case guitar_play_interactive
			card_info_struct = {
				header_text = qs(0x0d94705e)
				info_text = qs(0xb52c8c70)
				event_handlers = [
					{pad_choose NULL}
					{guitar_strum freestyle_tutorial_guitar_play_notes_strum_handler}
					{step_complete freestyle_tutorial_change_state params = {state = guitar_chords_interactive}}
				]
				state_init_script = freestyle_tutorial_guitar_play_notes_init
				state_deinit_script = freestyle_tutorial_guitar_play_notes_deinit
			}
			case guitar_chords_interactive
			card_info_struct = {
				header_text = qs(0xfe904ca8)
				info_text = qs(0x07e5c594)
				event_handlers = [
					{pad_choose NULL}
					{guitar_strum freestyle_tutorial_guitar_play_chords_strum_handler}
					{step_complete freestyle_tutorial_change_state params = {state = tiltmeter_informative}}
				]
				state_init_script = freestyle_tutorial_guitar_play_chords_init
				state_deinit_script = freestyle_tutorial_guitar_play_chords_deinit
			}
			case tiltmeter_informative
			card_info_struct = {
				header_text = qs(0x7a84cf75)
				info_text = qs(0x2d0a4c50)
				event_handlers = [
					{guitar_strum NULL}
					{pad_choose LaunchEvent params = {Type = step_complete target = input_handler}}
					{step_complete freestyle_tutorial_change_state params = {state = tiltmeter_interactive01}}
				]
				state_init_script = freestyle_tutorial_tiltmeter_informative_init
				state_deinit_script = freestyle_tutorial_tiltmeter_informative_deinit
			}
			case tiltmeter_interactive01
			card_info_struct = {
				header_text = qs(0x0f49f6cf)
				info_text = qs(0x4242d0d2)
				event_handlers = [
					{guitar_strum freestyle_tutorial_greentilt_interactive_strum_handler}
					{pad_choose NULL}
					{step_complete freestyle_tutorial_change_state params = {state = tiltmeter_interactive02}}
				]
				state_init_script = freestyle_tutorial_greentilt_interactive_init
				state_deinit_script = freestyle_tutorial_greentilt_interactive_deinit
			}
			case tiltmeter_interactive02
			card_info_struct = {
				header_text = qs(0x352d1aa9)
				info_text = qs(0xd173d9e7)
				event_handlers = [
					{guitar_strum freestyle_tutorial_bluetilt_interactive_strum_handler}
					{pad_choose NULL}
					{step_complete freestyle_tutorial_change_state params = {state = tiltmeter_interactive03}}
				]
				state_init_script = freestyle_tutorial_bluetilt_interactive_init
				state_deinit_script = freestyle_tutorial_bluetilt_interactive_deinit
			}
			case tiltmeter_interactive03
			card_info_struct = {
				header_text = qs(0x705ba415)
				info_text = qs(0xefdc24cc)
				event_handlers = [
					{pad_choose LaunchEvent params = {Type = step_complete target = input_handler}}
					{step_complete freestyle_tutorial_change_state params = {state = tiltmeter_interactive04}}
				]
				state_init_script = freestyle_tutorial_tiltmeter_informative_init
				state_deinit_script = freestyle_tutorial_tiltmeter_informative_deinit
			}
			case tiltmeter_interactive04
			card_info_struct = {
				header_text = qs(0x705ba415)
				info_text = qs(0x7160cb0c)
				event_handlers = [
					{guitar_strum freestyle_tutorial_orangetilt_interactive_strum_handler}
					{guitar_let_go freestyle_tutorial_orangetilt_interactive_let_go_handler}
					{pad_choose NULL}
					{step_complete freestyle_tutorial_change_state params = {state = card_system_informative}}
				]
				state_init_script = freestyle_tutorial_orangetilt_interactive_init
				state_deinit_script = freestyle_tutorial_orangetilt_interactive_deinit
			}
			case card_system_informative
			card_info_struct = {
				header_text = qs(0xd524f7f8)
				info_text = qs(0x4d682d27)
				event_handlers = [
					{guitar_let_go NULL}
					{guitar_strum NULL}
					{pad_choose LaunchEvent params = {Type = step_complete target = input_handler}}
					{step_complete freestyle_tutorial_change_state params = {state = card_system_interactive}}
				]
				state_init_script = freestyle_tutorial_default_informative_init
				state_deinit_script = freestyle_tutorial_default_informative_deinit
			}
			case card_system_interactive
			card_info_struct = {
				header_text = qs(0xd524f7f8)
				info_text = qs(0x683766ed)
				event_handlers = [
					{pad_choose NULL}
					{step_complete freestyle_tutorial_change_state params = {state = solo_section_informative}}
				]
				state_init_script = freestyle_tutorial_guitar_card_system_interactive_init
				state_deinit_script = freestyle_tutorial_guitar_card_system_interactive_deinit
			}
			case solo_section_informative
			card_info_struct = {
				header_text = qs(0x23b09f2c)
				info_text = qs(0xe0171a00)
				event_handlers = [
					{pad_choose LaunchEvent params = {Type = step_complete target = input_handler}}
					{step_complete freestyle_tutorial_change_state params = {state = solo_section_interactive}}
				]
				state_init_script = freestyle_tutorial_default_informative_init
				state_deinit_script = freestyle_tutorial_default_informative_deinit
			}
			case solo_section_interactive
			card_info_struct = {
				header_text = qs(0x32abebe5)
				info_text = qs(0x65233b70)
				event_handlers = [
					{guitar_strum freestyle_tutorial_solo_section_interactive_strum_handler}
					{pad_choose NULL}
					{step_complete freestyle_tutorial_change_state params = {state = closing_informative}}
				]
				state_init_script = freestyle_tutorial_solo_section_interactive_init
				state_deinit_script = freestyle_tutorial_solo_section_interactive_deinit
			}
			case closing_informative
			card_info_struct = {
				header_text = qs(0xc3e7dfff)
				info_text = qs(0xee06c79f)
				event_handlers = [
					{pad_choose LaunchEvent params = {Type = step_complete target = input_handler}}
					{step_complete generic_event_replace params = {state = uistate_freestyle_tutorial_setup}}
				]
				state_init_script = freestyle_tutorial_closing_informative_init
				state_deinit_script = freestyle_tutorial_closing_informative_deinit
			}
		endswitch
	elseif (<bank> = advanced)
		switch <state>
			case main_informative
			card_info_struct = {
				header_text = qs(0xc6629da7)
				info_text = qs(0x182ee96c)
				event_handlers = [
					{pad_choose LaunchEvent params = {Type = step_complete target = input_handler}}
					{step_complete freestyle_tutorial_change_state params = {state = hammeron_informative}}
				]
				state_init_script = freestyle_tutorial_difference_informative_init
				state_deinit_script = freestyle_tutorial_difference_informative_deinit
			}
			case hammeron_informative
			card_info_struct = {
				header_text = qs(0x254859bc)
				info_text = qs(0xb3d36e7d)
				event_handlers = [
					{pad_choose LaunchEvent params = {Type = step_complete target = input_handler}}
					{step_complete freestyle_tutorial_change_state params = {state = hammeron_interactive}}
				]
				state_init_script = freestyle_tutorial_hammeron_informative_init
				state_deinit_script = freestyle_tutorial_hammeron_informative_deinit
			}
			case hammeron_interactive
			card_info_struct = {
				header_text = qs(0x254859bc)
				info_text = qs(0x723a63fb)
				event_handlers = [
					{pad_choose NULL}
					{guitar_strum freestyle_tutorial_hammeron_interactive_strum_handler params = {<...>}}
					{step_complete freestyle_tutorial_change_state params = {state = accent_interactive}}
				]
				state_init_script = freestyle_tutorial_hammeron_interactive_init
				state_deinit_script = freestyle_tutorial_hammeron_interactive_deinit
			}
			case accent_interactive
			card_info_struct = {
				header_text = qs(0xe022d934)
				info_text = qs(0x8b6c5c07)
				event_handlers = [
					{pad_choose NULL}
					{guitar_strum freestyle_tutorial_accent_interactive_strum_handler params = {<...>}}
					{step_complete freestyle_tutorial_change_state params = {state = effects_informative}}
				]
				state_init_script = freestyle_tutorial_accent_interactive_init
				state_deinit_script = freestyle_tutorial_accent_interactive_deinit
			}
			case effects_informative
			card_info_struct = {
				header_text = qs(0xdb7dc2cd)
				info_text = qs(0x82281909)
				event_handlers = [
					{guitar_strum NULL}
					{pad_choose LaunchEvent params = {Type = step_complete target = input_handler}}
					{step_complete freestyle_tutorial_change_state params = {state = wah_interactive}}
				]
				state_init_script = freestyle_tutorial_effects_informative_init
				state_deinit_script = freestyle_tutorial_effects_informative_deinit
			}
			case wah_interactive
			card_info_struct = {
				header_text = qs(0x327739be)
				info_text = qs(0x3e42045f)
				event_handlers = [
					{pad_choose NULL}
					{guitar_strum freestyle_tutorial_wah_interactive_strum_handler params = {<...>}}
					{step_complete freestyle_tutorial_change_state params = {state = echo_interactive}}
				]
				state_init_script = freestyle_tutorial_wah_interactive_init
				state_deinit_script = freestyle_tutorial_wah_interactive_deinit
			}
			case echo_interactive
			card_info_struct = {
				header_text = qs(0x84adb4eb)
				info_text = qs(0x1e3e1c36)
				event_handlers = [
					{pad_choose NULL}
					{guitar_strum freestyle_tutorial_echo_interactive_strum_handler params = {<...>}}
					{step_complete freestyle_tutorial_change_state params = {state = flange_interactive}}
				]
				state_init_script = freestyle_tutorial_echo_interactive_init
				state_deinit_script = freestyle_tutorial_echo_interactive_deinit
			}
			case flange_interactive
			card_info_struct = {
				header_text = qs(0x7bcebeaf)
				info_text = qs(0xdd8354e2)
				event_handlers = [
					{pad_choose NULL}
					{guitar_strum freestyle_tutorial_flange_interactive_strum_handler params = {<...>}}
					{step_complete freestyle_tutorial_change_state params = {state = no_effect_interactive}}
				]
				state_init_script = freestyle_tutorial_flange_interactive_init
				state_deinit_script = freestyle_tutorial_flange_interactive_deinit
			}
			case no_effect_interactive
			card_info_struct = {
				header_text = qs(0xf20972d0)
				info_text = qs(0x428bb183)
				event_handlers = [
					{guitar_strum NULL}
					{pad_choose LaunchEvent params = {Type = step_complete target = input_handler}}
					{step_complete freestyle_tutorial_change_state params = {state = similarity_informative}}
				]
				state_init_script = freestyle_tutorial_similarity_informative_init
				state_deinit_script = freestyle_tutorial_similarity_informative_deinit
			}
			case similarity_informative
			card_info_struct = {
				header_text = qs(0xeb25ff1f)
				info_text = qs(0xa1b2e379)
				event_handlers = [
					{guitar_strum NULL}
					{pad_choose LaunchEvent params = {Type = step_complete target = input_handler}}
					{step_complete freestyle_tutorial_change_state params = {state = whammy_informative}}
				]
				state_init_script = freestyle_tutorial_similarity_informative_init
				state_deinit_script = freestyle_tutorial_similarity_informative_deinit
			}
			case whammy_informative
			card_info_struct = {
				header_text = qs(0x3c3e3570)
				info_text = qs(0xae36e105)
				event_handlers = [
					{pad_choose LaunchEvent params = {Type = step_complete target = input_handler}}
					{step_complete freestyle_tutorial_change_state params = {state = velocity_informative}}
				]
				state_init_script = freestyle_tutorial_whammy_informative_init
				state_deinit_script = freestyle_tutorial_whammy_informative_deinit
			}
			case velocity_informative
			card_info_struct = {
				header_text = qs(0x5d498285)
				info_text = qs(0xc3f275f1)
				event_handlers = [
					{pad_choose LaunchEvent params = {Type = step_complete target = input_handler}}
					{step_complete freestyle_tutorial_change_state params = {state = advanced_informative}}
				]
				state_init_script = freestyle_tutorial_velocity_informative_init
				state_deinit_script = freestyle_tutorial_velocity_informative_deinit
			}
			case advanced_informative
			card_info_struct = {
				header_text = qs(0xecd75f69)
				info_text = qs(0xd8178b86)
				event_handlers = [
					{pad_choose LaunchEvent params = {Type = step_complete target = input_handler}}
					{step_complete freestyle_tutorial_change_state params = {state = ds_informative}}
				]
				state_init_script = freestyle_tutorial_advanced_informative_init
				state_deinit_script = freestyle_tutorial_advanced_informative_deinit
			}
			case ds_informative
			card_info_struct = {
				header_text = qs(0x1fc734cf)
				info_text = qs(0x5b0760d9)
				event_handlers = [
					{pad_choose LaunchEvent params = {Type = step_complete target = input_handler}}
					{step_complete freestyle_tutorial_change_state params = {state = save_informative}}
				]
				state_init_script = freestyle_tutorial_ds_informative_init
				state_deinit_script = freestyle_tutorial_ds_informative_deinit
			}
			case save_informative
			card_info_struct = {
				header_text = qs(0x74b824d1)
				info_text = qs(0x52881def)
				event_handlers = [
					{pad_choose LaunchEvent params = {Type = step_complete target = input_handler}}
					{step_complete freestyle_tutorial_change_state params = {state = rerecording_informative}}
				]
				state_init_script = freestyle_tutorial_save_informative_init
				state_deinit_script = freestyle_tutorial_save_informative_deinit
			}
			case rerecording_informative
			card_info_struct = {
				header_text = qs(0x243a42cd)
				info_text = qs(0xde936e04)
				event_handlers = [
					{pad_choose LaunchEvent params = {Type = step_complete target = input_handler}}
					{step_complete freestyle_tutorial_change_state params = {state = closing_informative}}
				]
				state_init_script = freestyle_tutorial_ds_informative_init
				state_deinit_script = freestyle_tutorial_ds_informative_deinit
			}
			case closing_informative
			card_info_struct = {
				header_text = qs(0xc3e7dfff)
				info_text = qs(0x4663c76e)
				event_handlers = [
					{pad_choose LaunchEvent params = {Type = step_complete target = input_handler}}
					{step_complete generic_event_replace params = {state = uistate_freestyle_tutorial_setup}}
				]
				state_init_script = freestyle_tutorial_closing_informative_init
				state_deinit_script = freestyle_tutorial_closing_informative_deinit
			}
		endswitch
	endif
	return info = <card_info_struct>
endscript

script freestyle_tutorial_get_bass_card_info \{state = main_informative}
	card_info_struct = {}
	freestyle_tutorial_info_pane :desc_resolvealias \{Name = alias_info_card_event_handler}
	AssignAlias id = <resolved_id> alias = input_handler
	switch <state>
		case main_informative
		card_info_struct = {
			header_text = qs(0x9368c759)
			info_text = qs(0x60dfb589)
			event_handlers = [
				{pad_choose LaunchEvent params = {Type = step_complete target = input_handler}}
				{step_complete freestyle_tutorial_change_state params = {state = bass_play_informative}}
			]
			state_init_script = freestyle_tutorial_default_informative_init
			state_deinit_script = freestyle_tutorial_default_informative_deinit
		}
		case bass_play_informative
		card_info_struct = {
			header_text = qs(0xf9168c7c)
			info_text = qs(0x947ed098)
			event_handlers = [
				{pad_choose LaunchEvent params = {Type = step_complete target = input_handler}}
				{step_complete freestyle_tutorial_change_state params = {state = bass_play_interactive}}
			]
			state_init_script = freestyle_tutorial_bass_play_informative_init
			state_deinit_script = freestyle_tutorial_bass_play_informative_deinit
		}
		case bass_play_interactive
		card_info_struct = {
			header_text = qs(0x0d94705e)
			info_text = qs(0xb52c8c70)
			event_handlers = [
				{pad_choose NULL}
				{guitar_strum freestyle_tutorial_bass_play_notes_strum_handler}
				{step_complete freestyle_tutorial_change_state params = {state = bass_riffs_interactive}}
			]
			state_init_script = freestyle_tutorial_bass_play_notes_init
			state_deinit_script = freestyle_tutorial_bass_play_notes_deinit
		}
		case bass_riffs_interactive
		card_info_struct = {
			header_text = qs(0xaac214c1)
			info_text = qs(0x5caf4733)
			event_handlers = [
				{pad_choose LaunchEvent params = {Type = step_complete target = input_handler}}
				{step_complete freestyle_tutorial_change_state params = {state = bass_riffs_interactive01}}
			]
			state_init_script = freestyle_tutorial_bass_play_informative_init
			state_deinit_script = freestyle_tutorial_bass_play_informative_deinit
		}
		case bass_riffs_interactive01
		card_info_struct = {
			header_text = qs(0xaac214c1)
			info_text = qs(0x8c1219b2)
			event_handlers = [
				{pad_choose NULL}
				{guitar_strum freestyle_tutorial_bass_play_riffs_strum_handler}
				{guitar_let_go freestyle_tutorial_bass_play_riffs_let_go_handler}
				{step_complete freestyle_tutorial_change_state params = {state = bass_tiltmeter_informative}}
			]
			state_init_script = freestyle_tutorial_bass_play_riffs_init
			state_deinit_script = freestyle_tutorial_bass_play_riffs_deinit
		}
		case bass_tiltmeter_informative
		card_info_struct = {
			header_text = qs(0x7a84cf75)
			info_text = qs(0x68352193)
			event_handlers = [
				{guitar_let_go NULL}
				{guitar_strum NULL}
				{pad_choose LaunchEvent params = {Type = step_complete target = input_handler}}
				{step_complete freestyle_tutorial_change_state params = {state = bass_tiltmeter_interactive01}}
			]
			state_init_script = freestyle_tutorial_bass_tiltmeter_informative_init
			state_deinit_script = freestyle_tutorial_bass_tiltmeter_informative_deinit
		}
		case bass_tiltmeter_interactive01
		card_info_struct = {
			header_text = qs(0x0f49f6cf)
			info_text = qs(0x4242d0d2)
			event_handlers = [
				{guitar_strum freestyle_tutorial_bass_greentilt_interactive_strum_handler}
				{pad_choose NULL}
				{step_complete freestyle_tutorial_change_state params = {state = bass_tiltmeter_interactive02}}
			]
			state_init_script = freestyle_tutorial_bass_greentilt_interactive_init
			state_deinit_script = freestyle_tutorial_bass_greentilt_interactive_deinit
		}
		case bass_tiltmeter_interactive02
		card_info_struct = {
			header_text = qs(0xa07d28c3)
			info_text = qs(0x8eb6b30a)
			event_handlers = [
				{guitar_strum freestyle_tutorial_bass_bluetilt_interactive_strum_handler}
				{pad_choose NULL}
				{step_complete freestyle_tutorial_change_state params = {state = bass_tiltmeter_interactive03}}
			]
			state_init_script = freestyle_tutorial_bass_bluetilt_interactive_init
			state_deinit_script = freestyle_tutorial_bass_bluetilt_interactive_deinit
		}
		case bass_tiltmeter_interactive03
		card_info_struct = {
			header_text = qs(0x352d1aa9)
			info_text = qs(0x9b469b7f)
			event_handlers = [
				{guitar_strum freestyle_tutorial_bass_orangetilt_interactive_strum_handler}
				{pad_choose NULL}
				{step_complete freestyle_tutorial_change_state params = {state = bass_card_system_informative}}
			]
			state_init_script = freestyle_tutorial_bass_orangetilt_interactive_init
			state_deinit_script = freestyle_tutorial_bass_orangetilt_interactive_deinit
		}
		case bass_card_system_informative
		card_info_struct = {
			header_text = qs(0xd524f7f8)
			info_text = qs(0x4d682d27)
			event_handlers = [
				{guitar_strum NULL}
				{pad_choose LaunchEvent params = {Type = step_complete target = input_handler}}
				{step_complete freestyle_tutorial_change_state params = {state = bass_card_system_interactive}}
			]
			state_init_script = freestyle_tutorial_default_informative_init
			state_deinit_script = freestyle_tutorial_default_informative_deinit
		}
		case bass_card_system_interactive
		card_info_struct = {
			header_text = qs(0xd524f7f8)
			info_text = qs(0x683766ed)
			event_handlers = [
				{pad_choose NULL}
				{step_complete freestyle_tutorial_change_state params = {state = bass_solo_section_informative}}
			]
			state_init_script = freestyle_tutorial_bass_card_system_interactive_init
			state_deinit_script = freestyle_tutorial_bass_card_system_interactive_deinit
		}
		case bass_solo_section_informative
		card_info_struct = {
			header_text = qs(0x23b09f2c)
			info_text = qs(0xe0171a00)
			event_handlers = [
				{pad_choose LaunchEvent params = {Type = step_complete target = input_handler}}
				{step_complete freestyle_tutorial_change_state params = {state = bass_solo_section_interactive}}
			]
			state_init_script = freestyle_tutorial_default_informative_init
			state_deinit_script = freestyle_tutorial_default_informative_deinit
		}
		case bass_solo_section_interactive
		card_info_struct = {
			header_text = qs(0x32abebe5)
			info_text = qs(0x25b6a7cd)
			event_handlers = [
				{guitar_strum freestyle_tutorial_bass_solo_section_interactive_strum_handler}
				{pad_choose NULL}
				{step_complete freestyle_tutorial_change_state params = {state = closing_informative}}
			]
			state_init_script = freestyle_tutorial_bass_solo_section_interactive_init
			state_deinit_script = freestyle_tutorial_bass_solo_section_interactive_deinit
		}
		case closing_informative
		card_info_struct = {
			header_text = qs(0xc3e7dfff)
			info_text = qs(0xee06c79f)
			event_handlers = [
				{pad_choose LaunchEvent params = {Type = step_complete target = input_handler}}
				{step_complete generic_event_replace params = {state = uistate_freestyle_tutorial_setup}}
			]
			state_init_script = freestyle_tutorial_closing_informative_init
			state_deinit_script = freestyle_tutorial_closing_informative_deinit
		}
	endswitch
	return info = <card_info_struct>
endscript

script freestyle_tutorial_get_drums_card_info \{state = main_informative}
	card_info_struct = {}
	freestyle_tutorial_info_pane :desc_resolvealias \{Name = alias_info_card_event_handler}
	AssignAlias id = <resolved_id> alias = input_handler
	switch <state>
		case main_informative
		card_info_struct = {
			header_text = qs(0x55864fe0)
			info_text = qs(0xd744fbc5)
			event_handlers = [
				{pad_choose LaunchEvent params = {Type = step_complete target = input_handler}}
				{step_complete freestyle_tutorial_change_state params = {state = drum_informative}}
			]
			state_init_script = freestyle_tutorial_default_informative_init
			state_deinit_script = freestyle_tutorial_default_informative_deinit
		}
		case drum_informative
		card_info_struct = {
			header_text = qs(0xf9168c7c)
			info_text = qs(0x8586f4af)
			event_handlers = [
				{pad_choose LaunchEvent params = {Type = step_complete target = input_handler}}
				{step_complete freestyle_tutorial_change_state params = {state = snare_interactive Type = handedness}}
			]
			state_init_script = freestyle_tutorial_default_informative_init
			state_deinit_script = freestyle_tutorial_default_informative_deinit
		}
		case hightom_interactive
		card_info_struct = {
			header_text = qs(0x2f27b67d)
			info_text = qs(0xe19bb07a)
			event_handlers = [
				{pad_choose NULL}
				{drum_hit freestyle_tutorial_hightom_interactive_hit_handler}
				{step_complete freestyle_tutorial_change_state params = {state = lowtom_interactive Type = handedness}}
			]
			state_init_script = freestyle_tutorial_hightom_interactive_init
			state_deinit_script = freestyle_tutorial_hightom_interactive_deinit
		}
		case bassdrum_interactive
		card_info_struct = {
			header_text = qs(0x5d9cd494)
			info_text = qs(0x5ff2403f)
			event_handlers = [
				{pad_choose NULL}
				{drum_hit freestyle_tutorial_bassdrum_interactive_hit_handler}
				{step_complete freestyle_tutorial_change_state params = {state = card_system_informative}}
			]
			state_init_script = freestyle_tutorial_bassdrum_interactive_init
			state_deinit_script = freestyle_tutorial_bassdrum_interactive_deinit
		}
		case card_system_informative
		card_info_struct = {
			header_text = qs(0xd524f7f8)
			info_text = qs(0x4d682d27)
			event_handlers = [
				{drum_hit NULL}
				{pad_choose LaunchEvent params = {Type = step_complete target = input_handler}}
				{step_complete freestyle_tutorial_change_state params = {state = card_system_interactive}}
			]
			state_init_script = freestyle_tutorial_default_informative_init
			state_deinit_script = freestyle_tutorial_default_informative_deinit
		}
		case card_system_interactive
		card_info_struct = {
			header_text = qs(0xd524f7f8)
			info_text = qs(0x683766ed)
			event_handlers = [
				{pad_choose NULL}
				{step_complete freestyle_tutorial_change_state params = {state = drum_helper_informative}}
			]
			state_init_script = freestyle_tutorial_drum_card_system_interactive_init
			state_deinit_script = freestyle_tutorial_drum_card_system_interactive_deinit
		}
		case drum_helper_informative
		card_info_struct = {
			header_text = qs(0x9d8d2fa0)
			info_text = qs(0x4a3c3cdf)
			event_handlers = [
				{pad_choose LaunchEvent params = {Type = step_complete target = input_handler}}
				{step_complete freestyle_tutorial_change_state params = {state = drum_helper_interactive}}
			]
			state_init_script = freestyle_tutorial_default_informative_init
			state_deinit_script = freestyle_tutorial_default_informative_deinit
		}
		case drum_helper_interactive
		card_info_struct = {
			header_text = qs(0x9d8d2fa0)
			info_text = qs(0x06c2ce3b)
			event_handlers = [
				{pad_choose NULL}
				{drum_helper_toggle freestyle_tutorial_drum_helper_interactive_toggle}
				{step_complete freestyle_tutorial_change_state params = {state = solo_section_informative}}
			]
			state_init_script = freestyle_tutorial_drum_helper_interactive_init
			state_deinit_script = freestyle_tutorial_drum_helper_interactive_deinit
		}
		case solo_section_informative
		card_info_struct = {
			header_text = qs(0x23b09f2c)
			info_text = qs(0x7a603b9c)
			event_handlers = [
				{pad_choose LaunchEvent params = {Type = step_complete target = input_handler}}
				{step_complete freestyle_tutorial_change_state params = {state = solo_section_interactive}}
			]
			state_init_script = freestyle_tutorial_default_informative_init
			state_deinit_script = freestyle_tutorial_default_informative_deinit
		}
		case solo_section_interactive
		card_info_struct = {
			header_text = qs(0x911f9ce8)
			info_text = qs(0xadcee475)
			event_handlers = [
				{pad_choose NULL}
				{drum_hit freestyle_tutorial_drum_solo_interactive_hit_handler}
				{step_complete freestyle_tutorial_change_state params = {state = closing_informative}}
			]
			state_init_script = freestyle_tutorial_drum_solo_interactive_init
			state_deinit_script = freestyle_tutorial_drum_solo_interactive_deinit
		}
		case closing_informative
		card_info_struct = {
			header_text = qs(0xc3e7dfff)
			info_text = qs(0x7c007f5f)
			event_handlers = [
				{pad_choose LaunchEvent params = {Type = step_complete target = input_handler}}
				{step_complete generic_event_replace params = {state = uistate_freestyle_tutorial_setup}}
			]
			state_init_script = freestyle_tutorial_closing_informative_init
			state_deinit_script = freestyle_tutorial_closing_informative_deinit
		}
	endswitch
	return info = <card_info_struct>
endscript

script freestyle_tutorial_get_drums_lefty_card_info 
	card_info_struct = {}
	freestyle_tutorial_info_pane :desc_resolvealias \{Name = alias_info_card_event_handler}
	AssignAlias id = <resolved_id> alias = input_handler
	switch <state>
		case snare_interactive
		card_info_struct = {
			header_text = qs(0x7050aefd)
			info_text = qs(0xeab01135)
			event_handlers = [
				{pad_choose NULL}
				{drum_hit freestyle_tutorial_snare_interactive_hit_handler}
				{step_complete freestyle_tutorial_change_state params = {state = hightom_interactive Type = shared}}
			]
			state_init_script = freestyle_tutorial_snare_interactive_init
			state_deinit_script = freestyle_tutorial_snare_interactive_deinit
		}
		case lowtom_interactive
		card_info_struct = {
			header_text = qs(0xd6245774)
			info_text = qs(0x80cfd432)
			event_handlers = [
				{pad_choose NULL}
				{drum_hit freestyle_tutorial_lowtom_interactive_hit_handler}
				{step_complete freestyle_tutorial_change_state params = {state = hihat_interactive Type = handedness}}
			]
			state_init_script = freestyle_tutorial_lowtom_interactive_init
			state_deinit_script = freestyle_tutorial_lowtom_interactive_deinit
		}
		case hihat_interactive
		card_info_struct = {
			header_text = qs(0xd6060436)
			info_text = qs(0xff301dca)
			event_handlers = [
				{pad_choose NULL}
				{drum_hit freestyle_tutorial_hihat_interactive_hit_handler}
				{step_complete freestyle_tutorial_change_state params = {state = crash_interactive Type = handedness}}
			]
			state_init_script = freestyle_tutorial_hihat_interactive_init
			state_deinit_script = freestyle_tutorial_hihat_interactive_deinit
		}
		case crash_interactive
		card_info_struct = {
			header_text = qs(0x0090d842)
			info_text = qs(0xf73014ab)
			event_handlers = [
				{pad_choose NULL}
				{drum_hit freestyle_tutorial_crash_interactive_hit_handler}
				{step_complete freestyle_tutorial_change_state params = {state = bassdrum_interactive Type = shared}}
			]
			state_init_script = freestyle_tutorial_crash_interactive_init
			state_deinit_script = freestyle_tutorial_crash_interactive_deinit
		}
	endswitch
	return info = <card_info_struct>
endscript

script freestyle_tutorial_get_drums_righty_card_info 
	card_info_struct = {}
	freestyle_tutorial_info_pane :desc_resolvealias \{Name = alias_info_card_event_handler}
	AssignAlias id = <resolved_id> alias = input_handler
	switch <state>
		case snare_interactive
		card_info_struct = {
			header_text = qs(0x7050aefd)
			info_text = qs(0x5c10dbee)
			event_handlers = [
				{pad_choose NULL}
				{drum_hit freestyle_tutorial_snare_interactive_hit_handler}
				{step_complete freestyle_tutorial_change_state params = {state = hightom_interactive Type = shared}}
			]
			state_init_script = freestyle_tutorial_snare_interactive_init
			state_deinit_script = freestyle_tutorial_snare_interactive_deinit
		}
		case lowtom_interactive
		card_info_struct = {
			header_text = qs(0xd6245774)
			info_text = qs(0xe5b3c9f7)
			event_handlers = [
				{pad_choose NULL}
				{drum_hit freestyle_tutorial_lowtom_interactive_hit_handler}
				{step_complete freestyle_tutorial_change_state params = {state = hihat_interactive Type = handedness}}
			]
			state_init_script = freestyle_tutorial_lowtom_interactive_init
			state_deinit_script = freestyle_tutorial_lowtom_interactive_deinit
		}
		case hihat_interactive
		card_info_struct = {
			header_text = qs(0xd6060436)
			info_text = qs(0x18e62b8d)
			event_handlers = [
				{pad_choose NULL}
				{drum_hit freestyle_tutorial_hihat_interactive_hit_handler}
				{step_complete freestyle_tutorial_change_state params = {state = crash_interactive Type = handedness}}
			]
			state_init_script = freestyle_tutorial_hihat_interactive_init
			state_deinit_script = freestyle_tutorial_hihat_interactive_deinit
		}
		case crash_interactive
		card_info_struct = {
			header_text = qs(0x0090d842)
			info_text = qs(0x7f4cd8a7)
			event_handlers = [
				{pad_choose NULL}
				{drum_hit freestyle_tutorial_crash_interactive_hit_handler}
				{step_complete freestyle_tutorial_change_state params = {state = bassdrum_interactive Type = shared}}
			]
			state_init_script = freestyle_tutorial_crash_interactive_init
			state_deinit_script = freestyle_tutorial_crash_interactive_deinit
		}
	endswitch
	return info = <card_info_struct>
endscript

script freestyle_tutorial_get_nunchuk_card_info \{state = main_informative}
	card_info_struct = {}
	freestyle_tutorial_info_pane :desc_resolvealias \{Name = alias_info_card_event_handler}
	AssignAlias id = <resolved_id> alias = input_handler
	switch <state>
		case main_informative
		card_info_struct = {
			header_text = qs(0x55864fe0)
			info_text = qs(0xb650d053)
			event_handlers = [
				{pad_choose LaunchEvent params = {Type = step_complete target = input_handler}}
				{step_complete freestyle_tutorial_change_state params = {state = air_drum_informative Type = shared}}
			]
			state_init_script = freestyle_tutorial_default_informative_init
			state_deinit_script = freestyle_tutorial_default_informative_deinit
		}
		case air_drum_informative
		card_info_struct = {
			header_text = qs(0xf9168c7c)
			info_text = qs(0x34f92c72)
			event_handlers = [
				{pad_choose LaunchEvent params = {Type = step_complete target = input_handler}}
				{step_complete freestyle_tutorial_change_state params = {state = snare_interactive Type = shared}}
			]
			state_init_script = freestyle_tutorial_default_informative_init
			state_deinit_script = freestyle_tutorial_default_informative_deinit
		}
		case snare_interactive
		card_info_struct = {
			header_text = qs(0x7050aefd)
			info_text = qs(0xece6002c)
			event_handlers = [
				{pad_choose NULL}
				{drum_hit freestyle_tutorial_snare_interactive_hit_handler}
				{step_complete freestyle_tutorial_change_state params = {state = hihat_interactive Type = shared}}
			]
			state_init_script = freestyle_tutorial_snare_interactive_init
			state_deinit_script = freestyle_tutorial_snare_interactive_deinit
		}
		case hihat_interactive
		card_info_struct = {
			header_text = qs(0xd6060436)
			info_text = qs(0xdd303c27)
			event_handlers = [
				{pad_choose NULL}
				{drum_hit freestyle_tutorial_hihat_interactive_hit_handler}
				{step_complete freestyle_tutorial_change_state params = {state = crash_interactive Type = shared}}
			]
			state_init_script = freestyle_tutorial_hihat_interactive_init
			state_deinit_script = freestyle_tutorial_hihat_interactive_deinit
		}
		case crash_interactive
		card_info_struct = {
			header_text = qs(0x0090d842)
			info_text = qs(0xea22690d)
			event_handlers = [
				{pad_choose NULL}
				{drum_hit freestyle_tutorial_crash_interactive_hit_handler}
				{step_complete freestyle_tutorial_change_state params = {state = bassdrum_interactive Type = shared}}
			]
			state_init_script = freestyle_tutorial_crash_interactive_init
			state_deinit_script = freestyle_tutorial_crash_interactive_deinit
		}
		case bassdrum_interactive
		card_info_struct = {
			header_text = qs(0x5d9cd494)
			info_text = qs(0xdb7f7e3f)
			event_handlers = [
				{pad_choose NULL}
				{drum_hit freestyle_tutorial_bassdrum_interactive_hit_handler}
				{step_complete freestyle_tutorial_change_state params = {state = z_button_informative Type = shared}}
			]
			state_init_script = freestyle_tutorial_bassdrum_interactive_init
			state_deinit_script = freestyle_tutorial_bassdrum_interactive_deinit
		}
		case z_button_informative
		card_info_struct = {
			header_text = qs(0x2a77dbd5)
			info_text = qs(0xe7bb5784)
			event_handlers = [
				{drum_hit NULL}
				{pad_choose LaunchEvent params = {Type = step_complete target = input_handler}}
				{step_complete freestyle_tutorial_change_state params = {state = hightom_interactive Type = shared}}
			]
			state_init_script = freestyle_tutorial_default_informative_init
			state_deinit_script = freestyle_tutorial_default_informative_deinit
		}
		case hightom_interactive
		card_info_struct = {
			header_text = qs(0x2f27b67d)
			info_text = qs(0x121fe3c4)
			event_handlers = [
				{pad_choose NULL}
				{drum_hit freestyle_tutorial_hightom_interactive_hit_handler}
				{step_complete freestyle_tutorial_change_state params = {state = lowtom_interactive Type = shared}}
			]
			state_init_script = freestyle_tutorial_hightom_interactive_init
			state_deinit_script = freestyle_tutorial_hightom_interactive_deinit
		}
		case lowtom_interactive
		card_info_struct = {
			header_text = qs(0xd6245774)
			info_text = qs(0xd7841dab)
			event_handlers = [
				{pad_choose NULL}
				{drum_hit freestyle_tutorial_lowtom_interactive_hit_handler}
				{step_complete freestyle_tutorial_change_state params = {state = crash_interactive2 Type = shared}}
			]
			state_init_script = freestyle_tutorial_lowtom_interactive_init
			state_deinit_script = freestyle_tutorial_lowtom_interactive_deinit
		}
		case crash_interactive2
		card_info_struct = {
			header_text = qs(0xc354b962)
			info_text = qs(0xfb358f96)
			event_handlers = [
				{drum_hit NULL}
				{pad_choose LaunchEvent params = {Type = step_complete target = input_handler}}
				{step_complete freestyle_tutorial_change_state params = {state = card_system_informative Type = shared}}
			]
			state_init_script = freestyle_tutorial_default_informative_init
			state_deinit_script = freestyle_tutorial_default_informative_deinit
		}
		case card_system_informative
		card_info_struct = {
			header_text = qs(0xd524f7f8)
			info_text = qs(0x4d682d27)
			event_handlers = [
				{drum_hit NULL}
				{pad_choose LaunchEvent params = {Type = step_complete target = input_handler}}
				{step_complete freestyle_tutorial_change_state params = {state = card_system_interactive Type = shared}}
			]
			state_init_script = freestyle_tutorial_default_informative_init
			state_deinit_script = freestyle_tutorial_default_informative_deinit
		}
		case card_system_interactive
		card_info_struct = {
			header_text = qs(0xd524f7f8)
			info_text = qs(0x683766ed)
			event_handlers = [
				{pad_choose NULL}
				{step_complete freestyle_tutorial_change_state params = {state = drum_helper_informative Type = shared}}
			]
			state_init_script = freestyle_tutorial_drum_card_system_interactive_init
			state_deinit_script = freestyle_tutorial_drum_card_system_interactive_deinit
		}
		case drum_helper_informative
		card_info_struct = {
			header_text = qs(0x9d8d2fa0)
			info_text = qs(0x5d9f6d9c)
			event_handlers = [
				{pad_choose LaunchEvent params = {Type = step_complete target = input_handler}}
				{step_complete freestyle_tutorial_change_state params = {state = drum_helper_interactive Type = shared}}
			]
			state_init_script = freestyle_tutorial_default_informative_init
			state_deinit_script = freestyle_tutorial_default_informative_deinit
		}
		case drum_helper_interactive
		card_info_struct = {
			header_text = qs(0x9d8d2fa0)
			info_text = qs(0x351e0de6)
			event_handlers = [
				{pad_choose NULL}
				{drum_helper_toggle freestyle_tutorial_drum_helper_interactive_toggle}
				{step_complete freestyle_tutorial_change_state params = {state = drum_roll_informative Type = shared}}
			]
			state_init_script = freestyle_tutorial_drum_helper_interactive_init
			state_deinit_script = freestyle_tutorial_drum_helper_interactive_deinit
		}
		case drum_roll_informative
		card_info_struct = {
			header_text = qs(0xe367ccfc)
			info_text = qs(0xc3bf8ba9)
			event_handlers = [
				{pad_choose LaunchEvent params = {Type = step_complete target = input_handler}}
				{drum_helper_toggle NULL}
				{step_complete freestyle_tutorial_change_state params = {state = snare_roll_interactive Type = handedness}}
			]
			state_init_script = freestyle_tutorial_default_informative_init
			state_deinit_script = freestyle_tutorial_default_informative_deinit
		}
		case snare_roll_interactive
		card_info_struct = {
			header_text = qs(0x69de5b4e)
			info_text = qs(0x9213b6f9)
			event_handlers = [
				{pad_choose NULL}
				{drum_hit freestyle_tutorial_snare_roll_interactive_hit_handler}
				{step_complete freestyle_tutorial_change_state params = {state = hightom_roll_interactive Type = shared}}
			]
			state_init_script = freestyle_tutorial_snare_roll_interactive_init
			state_deinit_script = freestyle_tutorial_snare_roll_interactive_deinit
		}
		case hightom_roll_interactive
		card_info_struct = {
			header_text = qs(0x2dbb879e)
			info_text = qs(0xe86fbf26)
			event_handlers = [
				{pad_choose NULL}
				{drum_hit freestyle_tutorial_hightom_roll_interactive_hit_handler}
				{step_complete freestyle_tutorial_change_state params = {state = lowtom_roll_interactive Type = handedness}}
			]
			state_init_script = freestyle_tutorial_hightom_roll_interactive_init
			state_deinit_script = freestyle_tutorial_hightom_roll_interactive_deinit
		}
		case lowtom_roll_interactive
		card_info_struct = {
			header_text = qs(0xa670f47a)
			info_text = qs(0xfaf5808a)
			event_handlers = [
				{pad_choose NULL}
				{drum_hit freestyle_tutorial_lowtom_roll_interactive_hit_handler}
				{step_complete freestyle_tutorial_change_state params = {state = bass_roll_interactive Type = shared}}
			]
			state_init_script = freestyle_tutorial_lowtom_roll_interactive_init
			state_deinit_script = freestyle_tutorial_lowtom_roll_interactive_deinit
		}
		case bass_roll_interactive
		card_info_struct = {
			header_text = qs(0xa2c2379b)
			info_text = qs(0xb8cf64a7)
			event_handlers = [
				{pad_choose NULL}
				{drum_hit freestyle_tutorial_bass_roll_interactive_hit_handler}
				{step_complete freestyle_tutorial_change_state params = {state = solo_section_informative Type = shared}}
			]
			state_init_script = freestyle_tutorial_bass_roll_interactive_init
			state_deinit_script = freestyle_tutorial_bass_roll_interactive_deinit
		}
		case solo_section_informative
		card_info_struct = {
			header_text = qs(0x23b09f2c)
			info_text = qs(0x0e2f57e8)
			event_handlers = [
				{pad_choose LaunchEvent params = {Type = step_complete target = input_handler}}
				{step_complete freestyle_tutorial_change_state params = {state = solo_section_interactive Type = shared}}
			]
			state_init_script = freestyle_tutorial_default_informative_init
			state_deinit_script = freestyle_tutorial_default_informative_deinit
		}
		case solo_section_interactive
		card_info_struct = {
			header_text = qs(0x911f9ce8)
			info_text = qs(0xe276f483)
			event_handlers = [
				{pad_choose NULL}
				{drum_hit freestyle_tutorial_drum_solo_interactive_hit_handler}
				{step_complete freestyle_tutorial_change_state params = {state = closing_informative Type = shared}}
			]
			state_init_script = freestyle_tutorial_drum_solo_interactive_init
			state_deinit_script = freestyle_tutorial_drum_solo_interactive_deinit
		}
		case closing_informative
		card_info_struct = {
			header_text = qs(0xc3e7dfff)
			info_text = qs(0xee06c79f)
			event_handlers = [
				{pad_choose LaunchEvent params = {Type = step_complete target = input_handler}}
				{step_complete generic_event_replace params = {state = uistate_freestyle_tutorial_setup}}
			]
			state_init_script = freestyle_tutorial_closing_informative_init
			state_deinit_script = freestyle_tutorial_closing_informative_deinit
		}
	endswitch
	return info = <card_info_struct>
endscript

script freestyle_tutorial_get_nunchuk_righty_card_info 
	card_info_struct = {}
	freestyle_tutorial_info_pane :desc_resolvealias \{Name = alias_info_card_event_handler}
	AssignAlias id = <resolved_id> alias = input_handler
	switch <state>
		case snare_roll_interactive
		card_info_struct = {
			header_text = qs(0x69de5b4e)
			info_text = qs(0x9213b6f9)
			event_handlers = [
				{pad_choose NULL}
				{drum_hit freestyle_tutorial_snare_roll_interactive_hit_handler}
				{step_complete freestyle_tutorial_change_state params = {state = hightom_roll_interactive Type = shared}}
			]
			state_init_script = freestyle_tutorial_snare_roll_interactive_init
			state_deinit_script = freestyle_tutorial_snare_roll_interactive_deinit
		}
		case lowtom_roll_interactive
		card_info_struct = {
			header_text = qs(0xa670f47a)
			info_text = qs(0xfaf5808a)
			event_handlers = [
				{pad_choose NULL}
				{drum_hit freestyle_tutorial_lowtom_roll_interactive_hit_handler}
				{step_complete freestyle_tutorial_change_state params = {state = bass_roll_interactive Type = shared}}
			]
			state_init_script = freestyle_tutorial_lowtom_roll_interactive_init
			state_deinit_script = freestyle_tutorial_lowtom_roll_interactive_deinit
		}
	endswitch
	return info = <card_info_struct>
endscript

script freestyle_tutorial_get_nunchuk_lefty_card_info 
	card_info_struct = {}
	freestyle_tutorial_info_pane :desc_resolvealias \{Name = alias_info_card_event_handler}
	AssignAlias id = <resolved_id> alias = input_handler
	switch <state>
		case snare_roll_interactive
		card_info_struct = {
			header_text = qs(0x69de5b4e)
			info_text = qs(0x9160e1bd)
			event_handlers = [
				{pad_choose NULL}
				{drum_hit freestyle_tutorial_snare_roll_interactive_hit_handler}
				{step_complete freestyle_tutorial_change_state params = {state = hightom_roll_interactive Type = shared}}
			]
			state_init_script = freestyle_tutorial_snare_roll_interactive_init
			state_deinit_script = freestyle_tutorial_snare_roll_interactive_deinit
		}
		case lowtom_roll_interactive
		card_info_struct = {
			header_text = qs(0xa670f47a)
			info_text = qs(0xbf254d5f)
			event_handlers = [
				{pad_choose NULL}
				{drum_hit freestyle_tutorial_lowtom_roll_interactive_hit_handler}
				{step_complete freestyle_tutorial_change_state params = {state = bass_roll_interactive Type = shared}}
			]
			state_init_script = freestyle_tutorial_lowtom_roll_interactive_init
			state_deinit_script = freestyle_tutorial_lowtom_roll_interactive_deinit
		}
	endswitch
	return info = <card_info_struct>
endscript

script freestyle_tutorial_default_informative_init 
	instrument = ($freestyle_player_data [0].instrument)
	instrument_handler = ($freestyle_player_data [0].instrument_handler)
	if (<instrument> = drums)
		if (<instrument_handler> = drums_nunchuk)
			button = qs(0x7b189fab)
			text = qs(0x182f0173)
		else
			button = qs(0x8b61d0ae)
			text = qs(0x182f0173)
		endif
	elseif ((<instrument> = guitar) || (<instrument> = bass))
		button = qs(0x1f745aaf)
		text = qs(0x182f0173)
	endif
	freestyle_tutorial_info_pane :se_setprops {
		prompt_button = <button>
		prompt_text = <text>
	}
	instrumentsetenabled Player = ($freestyle_tutorial_player) enable = FALSE
endscript

script freestyle_tutorial_default_informative_deinit 
	freestyle_tutorial_info_pane :se_setprops \{prompt_text = qs(0x03ac90f0)
		prompt_button = qs(0x03ac90f0)}
endscript
