skip_async_load = 0

script musicstudio_ambience_init 
	if ScriptExists \{crowd_swells_during_stats_screen}
		KillSpawnedScript \{Name = crowd_swells_during_stats_screen}
	endif
	if IsSoundEventPlaying \{surge_during_stats_screen}
		StopSoundEvent \{surge_during_stats_screen
			fade_time = 1.5
			fade_type = linear}
	endif
	Change \{skip_async_load = 1}
	musicstudio_mainobj :musicstudio_setupstylefromstruct style = ($musicstudio_ambience_style_settings)
	Change \{skip_async_load = 0}
	musicstudio_init_volumes
endscript

script musicstudio_ambience_deinit 
endscript

script musicstudio_set_ambience 
	if GotParam \{update_extra_info}
		menu_jam_extra_info_focus ambience = <ambience>
	endif
	curr_ambience = ($<ambience>)
	visualizer_name = (<curr_ambience>.visualizer)
	musicstudio_mainobj :musicstudio_destroyvisualizer
	musicstudio_mainobj :musicstudio_createvisualizer primitives = ($<visualizer_name>)
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

script musicstudio_scroll_ambience 
	curr_ambience = ($<ambience>)
	button = 0
	if StructureContains structure = ($<ambience>) random_note
		begin
		<button> = RandomInteger (0.0, 5.0)
		if NOT (<button> = ($musicstudio_ambience_last_button))
			break
		endif
		repeat
	else
		if GotParam \{up}
			<button> = (($musicstudio_ambience_last_button) + 1)
			if (<button> > 5)
				<button> = 0
			endif
		else
			<button> = (($musicstudio_ambience_last_button) - 1)
			if (<button> < 0)
				<button> = 5
			endif
		endif
	endif
	Change musicstudio_ambience_last_button = <button>
	jam_get_sample jam_instrument = (<curr_ambience>.instrument) button = <button> tilt = 0 chord_dir = 0
	musicstudio_play_sound {
		instrument = 4
		final_note_sample = <final_note_sample>
		pitch_shift = <pitch_shift>
		note_type = 0
		note_velocity = (<curr_ambience>.velocity)
		note_string = <note_string>
		note_fret = <note_fret>
		curr_bend = (<curr_ambience>.bend)
	}
	KillSpawnedScript \{Name = musicstudio_ambience_stop_sound}
	SpawnScriptNow musicstudio_ambience_stop_sound params = {instrument = (<curr_ambience>.instrument)}
endscript

script musicstudio_ambience_stop_sound 
	Wait \{1
		Second}
	jam_stop_sound jam_instrument = <instrument>
endscript
jam_room_focus_ambience = {
	visualizer = jow_musicstudio_menu_c
}
ghmix_focus_ambience = {
	visualizer = jow_musicstudio_menu_b
}
notetracker_focus_ambience = {
	visualizer = og_frequency_clouds_electric_ba
}
ghtunes_focus_ambience = {
	visualizer = jow_musicstudio_menu_a
}
jam_room_choose_ambience = {
	visualizer = jow_musicstudio_menu_ca
}
ghmix_choose_ambience = {
	visualizer = jow_musicstudio_menu_ba
}
notetracker_choose_ambience = {
	visualizer = og_heart_of_the_sun
}
ghtunes_choose_ambience = {
	visualizer = jow_musicstudio_menu_aa
}
create_new_jam_room_choose_ambience = {
	visualizer = jow_musicstudio_menu_cb
}
create_new_ghmix_choose_ambience = {
	visualizer = jow_musicstudio_menu_bb
}
create_new_notetracker_choose_ambience = {
	visualizer = og_heart_of_the_sun
}
song_focus_ambience = {
	visualizer = jow_musicstudio_menu_ab
}
ghmix_ambience = {
	visualizer = jow_musicstudio_ghmix_b
}
jam_room_ambience = {
	visualizer = og_jam_4player_colorhorizon
}
