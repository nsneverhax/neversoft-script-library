skip_async_load = 0

script musicstudio_ambience_init 
	if ScriptExists \{Crowd_Swells_During_Stats_Screen}
		killspawnedscript \{name = Crowd_Swells_During_Stats_Screen}
	endif
	if IsSoundEventPlaying \{Surge_During_Stats_Screen}
		StopSoundEvent \{Surge_During_Stats_Screen
			fade_time = 1.5
			fade_type = linear}
	endif
	Change \{skip_async_load = 1}
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
	musicstudio_mainobj :MusicStudio_DestroyVisualizer
	musicstudio_mainobj :MusicStudio_CreateVisualizer primitives = ($<visualizer_name>)
endscript
musicstudio_menu_sound_scripts = {
	pad_up_script = musicstudio_menu_music_scroll
	pad_down_script = musicstudio_menu_music_scroll
	pad_back_sound = musicstudio_menu_music_back
	no_up_down_sound_handlers
}

script musicstudio_start_menu_music 
	SoundEvent \{event = JM_Menu_Loop}
endscript

script musicstudio_stop_menu_music \{FAST = 0}
	if (<FAST> = 1)
		StopSoundEvent \{JM_Menu_Loop
			fade_time = 0.9
			fade_type = linear}
	else
		StopSoundEvent \{JM_Menu_Loop
			fade_time = 2
			fade_type = linear}
	endif
endscript

script musicstudio_menu_music_scroll 
	SoundEvent \{event = JM_Menu_scroll}
endscript

script musicstudio_menu_music_select 
	SoundEvent \{event = JM_Menu_Select}
endscript

script musicstudio_menu_music_final_select 
	StopSoundEvent \{JM_Menu_Select
		fade_time = 0.05
		fade_type = linear}
	SoundEvent \{event = JM_Menu_FinalSelect}
endscript

script musicstudio_menu_music_back 
	SoundEvent \{event = JM_Menu_Back}
endscript

script musicstudio_menu_music_check 
	SoundEvent \{event = JM_Menu_Check}
endscript

script musicstudio_menu_music_uncheck 
	SoundEvent \{event = JM_Menu_UnCheck}
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
	killspawnedscript \{name = musicstudio_ambience_stop_sound}
	spawnscriptnow musicstudio_ambience_stop_sound params = {instrument = (<curr_ambience>.instrument)}
endscript

script musicstudio_ambience_stop_sound 
	wait \{1
		second}
	jam_stop_sound jam_instrument = <instrument>
endscript
jam_room_focus_ambience = {
	visualizer = JOW_MusicStudio_Menu_C
}
ghmix_focus_ambience = {
	visualizer = JOW_MusicStudio_Menu_B
}
notetracker_focus_ambience = {
	visualizer = OG_Frequency_Clouds_Electric_BA
}
ghtunes_focus_ambience = {
	visualizer = JOW_MusicStudio_Menu_A
}
jam_room_choose_ambience = {
	visualizer = JOW_MusicStudio_Menu_CA
}
ghmix_choose_ambience = {
	visualizer = JOW_MusicStudio_Menu_BA
}
notetracker_choose_ambience = {
	visualizer = og_heart_of_the_sun
}
ghtunes_choose_ambience = {
	visualizer = JOW_MusicStudio_Menu_AA
}
create_new_jam_room_choose_ambience = {
	visualizer = JOW_MusicStudio_Menu_CB
}
create_new_ghmix_choose_ambience = {
	visualizer = JOW_MusicStudio_Menu_BB
}
create_new_notetracker_choose_ambience = {
	visualizer = og_heart_of_the_sun
}
song_focus_ambience = {
	visualizer = JOW_MusicStudio_Menu_AB
}
ghmix_ambience = {
	visualizer = JOW_MusicStudio_GHMix_B
}
jam_room_ambience = {
	visualizer = OG_Jam_4Player_ColorHorizon
}
