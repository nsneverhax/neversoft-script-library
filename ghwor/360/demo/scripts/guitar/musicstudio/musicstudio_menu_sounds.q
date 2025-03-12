
script musicstudio_ghmix_menu_sound_choose 
	soundevent \{event = audio_ui_jam_select}
endscript

script musicstudio_ghmix_menu_sound_back 
	soundevent \{event = audio_ui_jam_back}
endscript

script musicstudio_ghmix_menu_sound_scroll 
	soundevent \{event = audio_ui_jam_scroll}
endscript

script musicstudio_ghmix_menu_sound_up_down 
endscript

script musicstudio_ghmix_menu_sound_left_right 
	soundevent \{event = audio_ui_jam_select}
endscript

script musicstudio_ghmix_menu_sound_play 
	soundevent \{event = audio_ui_jam_start_song}
endscript

script musicstudio_ghmix_menu_sound_stop 
	soundevent \{event = audio_ui_jam_stop_song}
endscript

script musicstudio_ghmix_menu_sound_show_help 
	soundevent \{event = audio_ui_jam_select}
endscript

script musicstudio_ghmix_menu_sound_popup_warning 
	soundevent \{event = audio_ui_jam_select}
endscript

script musicstudio_ghmix_menu_sound_pause 
	soundevent \{event = audio_ui_jam_select}
endscript

script musicstudio_ghmix_menu_sound_unpause 
	soundevent \{event = audio_ui_jam_select}
endscript

script musicstudio_ghmix_menu_sound_pause_updown 
	soundevent \{event = audio_ui_jam_scroll}
endscript
