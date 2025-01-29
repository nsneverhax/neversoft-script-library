jamroom_wizard_main_state = {
	name_text = qs(0xdfa432ba)
	tool_tip = qs(0xc8329408)
	init_script = jamroom_wizard_generic_back_control_helpers
	deinit_script = clean_up_user_control_helpers
	num_tabs = 1
	green = {
		name_text_script = jamroom_wizard_get_style_name
		tool_tip = qs(0x231bbef8)
		musicstudio_scrolling_state = jamroom_wizard_scrolling_select_style_state
	}
	red = {
		name_text = qs(0xd92b3af5)
		tool_tip = qs(0x6f36adc2)
		musicstudio_state = jamroom_wizard_autoplay_state
	}
	yellow = {
	}
	blue = {
	}
	orange = {
	}
	left = {
	}
	right = {
	}
	up = {
	}
	down = {
	}
	back = {
		choose_script = ui_event
		choose_params = {
			event = menu_back
			data = {
				state = uistate_jam_select_song
			}
		}
	}
	start = {
		name_text = qs(0xb73cb78f)
		tool_tip = qs(0x2f813db2)
		choose_script = new_song_create_choose
		choose_params = {
			new_jamroom
		}
	}
	whammy = {
	}
}
jamroom_wizard_autoplay_state = {
	name_text = qs(0xd92b3af5)
	tool_tip = qs(0x6f36adc2)
	init_script = jamroom_wizard_generic_back_control_helpers
	deinit_script = clean_up_user_control_helpers
	num_tabs = 2
	green = {
		name_text_script = jamroom_wizard_get_toggled_autoplay_name
		name_text_script_params = {
			instrument = rhythm
			text = qs(0x9b37b6ed)
		}
		tool_tip = qs(0x00000000)
		choose_script = jamroom_wizard_toggle_autoplay
		choose_params = {
			instrument = rhythm
		}
	}
	red = {
		name_text_script = jamroom_wizard_get_toggled_autoplay_name
		name_text_script_params = {
			instrument = lead
			text = qs(0x3edd5718)
		}
		tool_tip = qs(0x00000000)
		choose_script = jamroom_wizard_toggle_autoplay
		choose_params = {
			instrument = lead
		}
	}
	yellow = {
		name_text_script = jamroom_wizard_get_toggled_autoplay_name
		name_text_script_params = {
			instrument = bass
			text = qs(0x4f551cbe)
		}
		tool_tip = qs(0x00000000)
		choose_script = jamroom_wizard_toggle_autoplay
		choose_params = {
			instrument = bass
		}
	}
	blue = {
		name_text_script = jamroom_wizard_get_toggled_autoplay_name
		name_text_script_params = {
			instrument = drum
			text = qs(0xf3e03f27)
		}
		tool_tip = qs(0x00000000)
		choose_script = jamroom_wizard_toggle_autoplay
		choose_params = {
			instrument = drum
		}
	}
	orange = {
		name_text_script = jamroom_wizard_get_toggled_autoplay_name
		name_text_script_params = {
			instrument = melody
			text = qs(0x09aa4fdd)
		}
		tool_tip = qs(0x00000000)
		choose_script = jamroom_wizard_toggle_autoplay
		choose_params = {
			instrument = melody
		}
	}
	left = {
	}
	right = {
	}
	up = {
	}
	down = {
	}
	back = {
	}
	start = {
		musicstudio_state = jamroom_wizard_main_state
	}
	whammy = {
	}
}
jamroom_wizard_scrolling_select_style_state = {
	name_text = qs(0x69b6d62f)
	tool_tip = qs(0x60935d50)
	num_tabs = 2
	choose_script = jamroom_wizard_set_style
	get_list_checksum_script = jamroom_wizard_get_list_checksum_styles
}
