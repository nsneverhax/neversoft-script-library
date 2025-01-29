freestyle_intro_countdown_beats = 8
freestyle_intro_countdown_start_beat = 0
freestyle_intro_countdown_data = [
	{
		beat = 0
		Sound = freestyle_countdown_1_1
	}
	{
		beat = 2
		Sound = freestyle_countdown_2_1
	}
	{
		beat = 4
		Sound = freestyle_countdown_1_2
	}
	{
		beat = 5
		Sound = freestyle_countdown_2_2
	}
	{
		beat = 6
		Sound = freestyle_countdown_3
	}
	{
		beat = 7
		Sound = freestyle_countdown_4
	}
]
freestyle_end_countdown_length = 10000
freestyle_transition_state = None
freestyle_forced_outro = 0
freestyle_countdown_triggered = FALSE

script freestyle_init_transitions 
	Change \{freestyle_transition_state = None}
	Change \{freestyle_forced_outro = 0}
endscript

script freestyle_start_transitions 
	Change \{freestyle_transition_state = None}
	if ($freestyle_game_mode != tutorial)
		freestyle_start_intro
	endif
endscript

script freestyle_deinit_transitions 
	KillSpawnedScript \{Name = freestyle_song_info_script}
	KillSpawnedScript \{Name = freestyle_outro_script}
	freestyle_game_deinit_player_intros
endscript

script freestyle_update_transitions 
	switch ($freestyle_transition_state)
		case Intro
		freestyle_update_intro
		case intro_countdown
		freestyle_update_intro_countdown
		case gameplay
		freestyle_update_gameplay
		case outro
		freestyle_update_outro
	endswitch
endscript

script freestyle_start_intro 
	Change \{freestyle_transition_state = Intro}
	push_hide_flares
	if (($freestyle_game_mode = watch) && ($freestyle_current_performance_data.is_tagged = true))
		song_name = ($freestyle_current_performance_data.song_name)
		artist_name = ($freestyle_current_performance_data.artist_name)
		year = ($freestyle_current_performance_data.date.year)
		freestyle_display_song_info song_name = <song_name> artist_name = <artist_name> year = <year>
	endif
	if ($freestyle_game_mode != watch)
		freestyle_change_to_intro_camera
		freestyle_play_intro_lights
		freestyle_set_enable_all_instruments \{enable = FALSE}
		freestyle_hud_hide
	endif
	freestyle_play_band_intro_anims
	SoundEvent \{event = freestyle_applause}
	freestyle_game_init_player_intros
	Change \{freestyle_enable_hint_system = FALSE}
endscript

script freestyle_update_intro 
	if metronomebeatthisframe
		transition_beat = (0 - $freestyle_intro_countdown_beats)
		anim_beat = (0 - $freestyle_intro_countdown_beats - 4)
		if ($freestyle_last_nowbar_beat_number >= <anim_beat>)
			SpawnScriptNow \{freestyle_game_player_intro_remove_text}
		endif
		if ($freestyle_last_nowbar_beat_number >= <transition_beat>)
			freestyle_start_intro_countdown
		endif
	endif
endscript

script freestyle_start_intro_countdown 
	Change \{freestyle_transition_state = intro_countdown}
	pop_hide_flares
	if ($freestyle_game_mode != watch)
		freestyle_set_enable_all_instruments \{enable = true}
		SpawnScriptNow \{freestyle_game_player_intro_finish_anim}
		freestyle_highway_move \{pos_from = (0.0, 500.0)
			time = 2.0}
		freestyle_hud_show
		counter = 0
		begin
		formatText checksumName = container_id 'freestyle_intro_player_container_%d' d = <counter>
		if ScreenElementExists id = <container_id>
			<container_id> :se_setprops {
				parent = freestyle_hud
			}
		endif
		counter = (<counter> + 1)
		repeat 3
	endif
	Change freestyle_intro_countdown_start_beat = ($freestyle_last_nowbar_beat_number)
	freestyle_maybe_trigger_intro_countdown_sfx
endscript

script freestyle_update_intro_countdown 
	if metronomebeatthisframe
		freestyle_maybe_trigger_intro_countdown_sfx
		if ($freestyle_last_nowbar_beat_number >= 0)
			freestyle_start_gameplay
		endif
	endif
endscript

script freestyle_start_gameplay 
	Change \{freestyle_transition_state = gameplay}
	Change \{freestyle_countdown_triggered = FALSE}
	if ($freestyle_game_mode = standard)
		Change \{freestyle_is_song_saveable = true}
	endif
	freestyle_reset_hint_system
	Change \{freestyle_enable_hint_system = true}
	StopAllSounds
	freestyle_stats_song_start
	Change \{freestyle_lock_auto_lights = FALSE}
	freestyle_play_auto_lights \{new_color = true}
endscript

script freestyle_update_gameplay 
	if (($freestyle_countdown_triggered = FALSE) && ($freestyle_game_mode = standard) && (($freestyle_endless_song = FALSE) || ($freestyle_recording_mode = overdub)))
		GetSongTimeMs
		time_left = ($freestyle_end_of_song_time - <time> - 1000)
		if (<time_left> <= $freestyle_end_countdown_length)
			freestyle_hud_start_countdown \{length = $freestyle_end_countdown_length}
			Change \{freestyle_countdown_triggered = true}
		endif
	endif
endscript

script freestyle_start_outro 
	Change \{freestyle_transition_state = outro}
	if ($freestyle_recording_mode = record)
		freestylerecordendofsongevent \{forced = 0}
		freestyle_save_song_time
	endif
	freestyle_stats_song_end
	freestyle_set_enable_all_instruments \{enable = FALSE}
	freestyle_highway_move \{pos_to = (0.0, 500.0)
		time = 2.0
		end_func = freestyle_hud_hide}
	freestyle_kill_metronome_spawns
	if (($freestyle_game_mode != watch) || ($freestyle_forced_outro = 1))
		freestyle_change_to_outro_camera
		freestyle_play_outro_lights
	endif
	SoundEvent \{event = freestyle_applause}
	Change \{freestyle_enable_hint_system = FALSE}
	SpawnScriptNow \{freestyle_outro_script}
endscript

script freestyle_outro_script 
	if ($freestyle_game_mode != watch)
		freestyle_play_you_rock_effect
		Wait \{2
			Seconds}
	endif
	freestyle_play_band_outro_anims
	begin
	Wait \{1
		Frame}
	if NOT freestyle_are_outro_anims_playing
		freestyle_end_game
		break
	endif
	repeat
endscript

script freestyle_update_outro 
endscript

script freestyle_display_song_info 
	SpawnScriptNow freestyle_song_info_script params = <...>
endscript

script freestyle_song_info_script 
	RequireParams \{[
			song_name
			artist_name
			year
		]
		all}
	formatText TextName = year_text qs(0x06d54ab3) d = <year>
	artist_plus_year = (<artist_name> + <year_text>)
	CreateScreenElement {
		parent = freestyle_root
		id = intro_container
		Type = descinterface
		desc = 'song_intro'
		alpha = 0
		z_priority = 500
		intro_artist_text = <artist_plus_year>
		intro_title_text = <song_name>
		intro_performed_text = $artist_text_as_made_famous_by
	}
	intro_container :se_setprops \{alpha = 1
		time = 0.7}
	intro_container :se_waitprops
	Wait \{3
		Seconds}
	intro_container :se_setprops \{alpha = 0
		time = 0.7}
	intro_container :se_waitprops
	DestroyScreenElement \{id = intro_container}
endscript

script freestyle_maybe_trigger_intro_countdown_sfx 
	current_beat = ($freestyle_last_nowbar_beat_number - $freestyle_intro_countdown_start_beat)
	GetArraySize \{$freestyle_intro_countdown_data}
	i = 0
	begin
	if ($freestyle_intro_countdown_data [<i>].beat = <current_beat>)
		SoundEvent event = ($freestyle_intro_countdown_data [<i>].Sound)
		break
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
endscript

script freestyle_trigger_end_of_song_event 
	RequireParams \{[
			forced
		]
		all}
	Change freestyle_forced_outro = <forced>
	if ($freestyle_transition_state != outro)
		freestyle_start_outro
	endif
endscript

script freestyle_end_of_song_reached 
	if ($freestyle_loop_gem_tracks = true)
		freestyle_loop_song
	else
		if (($freestyle_transition_state != outro) && ($freestyle_recording_mode != overdub))
			freestyle_start_outro
		endif
	endif
endscript

script freestyle_play_you_rock_effect 
	create_mushroomcloudhand
	SoundEvent \{event = you_rock_front}
	SoundEvent \{event = you_rock_back}
	SoundEvent \{event = you_rock_lfe}
	kill_start_key_binding
endscript

script freestyle_final_beat_reached 
	if ($freestyle_endless_song = FALSE)
		freestyle_play_final_beat_lights
	endif
endscript
