skip_async_load = 0

script musicstudio_ambience_init 
	if ScriptExists \{audio_crowd_play_swells_during_stats_screen}
		KillSpawnedScript \{Name = audio_crowd_play_swells_during_stats_screen}
	endif
	if IsSoundEventPlaying \{surge_during_stats_screen}
		StopSoundEvent \{surge_during_stats_screen
			fade_time = 1.5
			fade_type = linear}
	endif
	Change \{skip_async_load = 1}
	Change \{skip_async_load = 0}
	musicstudio_init_volumes
endscript

script musicstudio_ambience_deinit 
endscript

script musicstudio_set_ambience_and_rich_presence \{rich_presence = !q1768515945}
	Change rich_presence_context = <rich_presence>
	musicstudio_set_ambience <...>
endscript

script musicstudio_set_ambience 
	if (<ambience> = ghtunes_choose_ambience)
		get_random_spicey_preset
		update_fullscreen_visualizer preset = <preset>
	else
		if GotParam \{update_extra_info}
			menu_jam_extra_info_focus ambience = <ambience>
		endif
		curr_ambience = ($<ambience>)
		visualizer_name = (<curr_ambience>.visualizer)
		musicstudio_mainobj :musicstudio_destroyvisualizer
		musicstudio_mainobj :musicstudio_createvisualizer primitives = $<visualizer_name> viewport = bg_viewport
	endif
endscript
musicstudio_menu_sound_scripts = {
	pad_up_script = musicstudio_menu_music_scroll
	pad_down_script = musicstudio_menu_music_scroll
	pad_back_sound = musicstudio_menu_music_back
	no_up_down_sound_handlers
}

script musicstudio_start_menu_music 
	SoundEvent \{event = jm_menu_loop}
endscript

script musicstudio_stop_menu_music \{FAST = 0}
	if (<FAST> = 1)
		StopSoundEvent \{jm_menu_loop
			fade_time = 0.9
			fade_type = linear}
	else
		StopSoundEvent \{jm_menu_loop
			fade_time = 2
			fade_type = linear}
	endif
endscript

script musicstudio_menu_music_scroll 
	SoundEvent \{event = jm_menu_scroll}
endscript

script musicstudio_menu_music_select 
	SoundEvent \{event = jm_menu_select}
endscript

script musicstudio_menu_music_final_select 
	StopSoundEvent \{audio_ui_generic_select}
	StopSoundEvent \{jm_menu_select
		fade_time = 0.05
		fade_type = linear}
	SoundEvent \{event = jm_menu_finalselect}
endscript

script musicstudio_menu_music_back 
	SoundEvent \{event = jm_menu_back}
endscript

script musicstudio_menu_music_check 
	SoundEvent \{event = jm_menu_check}
endscript

script musicstudio_menu_music_uncheck 
	SoundEvent \{event = jm_menu_uncheck}
endscript
musicstudio_ambience_last_button = 0
jam_room_focus_ambience = {
	visualizer = og_enerdonut_b
}
ghmix_focus_ambience = {
	visualizer = og_enerdonut_c
}
ghtunes_focus_ambience = {
	visualizer = og_enerdonut_d
}
jam_room_choose_ambience = {
	visualizer = og_enerdonut_b
}
ghmix_choose_ambience = {
	visualizer = og_enerdonut_c
}
ghtunes_choose_ambience = {
	visualizer = jow_viz_pinktunnel
}
create_new_jam_room_choose_ambience = {
	visualizer = og_enerdonut_climax
}
create_new_ghmix_choose_ambience = {
	visualizer = og_enerdonut_climax
}
song_focus_ambience = {
	visualizer = og_enerdonut
}
ghmix_ambience = {
	visualizer = jow_musicstudio_ghmix_b
}
jam_room_ambience = {
	visualizer = og_jam_4player_colorhorizon
}
