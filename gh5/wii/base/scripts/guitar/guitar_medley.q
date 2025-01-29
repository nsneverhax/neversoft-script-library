
script iterator_override_params 
	if GotParam \{medley_index}
		get_medley_song index = <medley_index>
		return song_name = <medley_song>
	endif
endscript

script get_medley_song 
	GetArraySize \{$current_medley_info}
	if (<index> >= 0 && <index> < <array_Size>)
		return medley_song = ($current_medley_info [<index>].song)
	endif
	return \{medley_song = uninitialized_song_value}
endscript

script load_medley_anim 
	band_stop_anims
endscript

script get_and_load_medley_song 
	RequireParams \{[
			medley_index
			next_medley_index
			medley_time
		]
		all}
	get_medley_song index = <medley_index>
	current_song = <medley_song>
	get_medley_song index = <next_medley_index>
	next_song = <medley_song>
	SpawnScriptNow load_medley_anim params = {current_song = <current_song>}
	Wait \{1
		Second}
	if (<next_song> != uninitialized_song_value)
		medley_in_song_loading current_song = <current_song> next_song = <next_song>
		Wait \{1
			Second}
		getmedleyaudiostarttime medley_index = <next_medley_index>
		seek_start_time = <medley_audio_start_time>
		RemoveParameter \{medley_audio_start_time}
		medley_load_song_audio <...> next_song = <next_song> index = <medley_index>
	endif
endscript

script get_medley_index 
	GetArraySize \{$current_medley_info}
	if (<index> < <array_Size>)
		return medley_index = ($current_medley_info [<index>].index)
	else
		return \{medley_index = None}
	endif
endscript

script get_medley_size 
	GetArraySize \{$current_medley_info}
	return medley_size = <array_Size>
endscript

script get_medley_start_time 
	ScriptAssert \{'get_medley_start_time: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script get_medley_end_time 
	ScriptAssert \{'get_medley_end_time: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script medley_in_song_loading \{next_song = unknown}
	Change \{in_song_loading_active = 1}
	get_song_performance song = <current_song>
	unload_songqpak songpak = <current_song> songpak_performance = <song_performance>
	Wait \{1
		Second}
	load_songqpak song_name = <next_song> async = 1
	Change \{in_song_loading_active = 0}
endscript

script medley_start 
	Change \{game_mode = p1_quickplay}
	setplayerinfo \{1
		in_game = 1}
	gman_songfunc \{func = clear_play_list}
	gman_songfunc \{func = set_current_song
		params = {
			song = medley
		}}
	gman_songfunc \{func = start_song
		params = {
			data = {
				starttime = $medley_intro_start_time
			}
		}}
endscript

script medley_reset 
	unload_all_song_paks
	if NOT GotParam \{restarting}
		Change \{medley_mode_on = 0}
	endif
	Change \{medley_song_won = 0}
	Change \{medley_last_start_time = 0}
	Change \{medley_last_seek_time = 0}
	Change \{medley_song_slot0 = uninitialized_song_value}
	Change \{medley_song_slot1 = uninitialized_song_value}
	Change \{medley_slot0_used = 0}
	Change \{medley_slot1_used = 0}
	Change \{medley_last_slot_used = 0}
	Change \{medley_current_index_loaded = -777}
	Change \{medley_last_index_loaded = -777}
	Change \{medley_song_arrays_modified = 0}
endscript

script medley_clear_song_in_slot 
	if ($medley_song_slot0 = $medley_song_slot1)
		slot = ($medley_last_slot_used)
		formatText checksumName = medley_song_slot 'medley_song_slot%d' d = <slot>
		formatText checksumName = medley_slot_used 'medley_slot%d_used' d = <slot>
		Change GlobalName = <medley_song_slot> NewValue = uninitialized_song_value
		Change GlobalName = <medley_slot_used> NewValue = 0
		return slot = <slot>
	else
		if ($medley_slot0_used = 1)
			if ($medley_song_slot0 = <song>)
				Change \{medley_song_slot0 = uninitialized_song_value}
				Change \{medley_slot0_used = 0}
				return \{slot = 0}
			endif
		endif
		if ($medley_slot1_used = 1)
			if ($medley_song_slot1 = <song>)
				Change \{medley_song_slot1 = uninitialized_song_value}
				Change \{medley_slot1_used = 0}
				return \{slot = 1}
			endif
		endif
	endif
	print_medley_slot_info
	ScriptAssert qs(0x7397a1ee) s = <song>
endscript

script print_medley_slot_info 
	printf \{channel = medley
		'medley_slot0_used = %d'
		d = $medley_slot0_used}
	printf \{channel = medley
		'medley_slot1_used = %d'
		d = $medley_slot1_used}
	printf \{channel = medley
		'medley_song_slot0 = %d'
		d = $medley_song_slot0}
	printf \{channel = medley
		'medley_song_slot1 = %d'
		d = $medley_song_slot1}
	printf \{channel = medley
		'medley_last_slot_used = %d'
		d = $medley_last_slot_used}
endscript

script medley_set_song_in_slot 
	if ($medley_slot0_used = 0)
		Change medley_song_slot0 = <song>
		Change \{medley_slot0_used = 1}
		return \{slot = 0}
	elseif ($medley_slot1_used = 0)
		Change medley_song_slot1 = <song>
		Change \{medley_slot1_used = 1}
		return \{slot = 1}
	endif
	print_medley_slot_info
	ScriptAssert \{qs(0x0ed6e181)}
endscript

script medley_find_song_in_slot 
	if ($medley_song_slot0 = <song>)
		return \{slot = 0}
	elseif ($medley_song_slot1 = <song>)
		return \{slot = 1}
	endif
	print_medley_slot_info
	ScriptAssert qs(0x7397a1ee) s = <song>
endscript

script medley_load_song_audio 
	medley_set_song_in_slot song = <next_song>
	songunload slot = <slot>
	Wait \{1
		Second}
	preload_song song_name = <next_song> slot = <slot>
	Change \{song_is_waiting_to_start = 0}
	SpawnScriptNow medley_begin_song_after_intro params = {<...>}
endscript

script medley_begin_song_after_intro {
		medley_time = 0
		medley_end_time = 0
		seek_start_time = 0
		fade_in_time = ($medley_fade_in_time)
		pre_unmute_time = 0
		check_beat_time_length = 1
	}
	if (<seek_start_time> - <fade_in_time> < 0)
		fade_in_time = 0
	endif
	if GotParam \{first_section}
		seek_start_time = (<seek_start_time> + 250)
	endif
	seek_start_time = (<seek_start_time> - <pre_unmute_time> - <fade_in_time>)
	songseek slot = <slot> time = <seek_start_time>
	Change medley_last_seek_time = <seek_start_time>
	Change \{song_is_waiting_to_start = 0}
endscript

script medley_restart 
	medley_reset <...>
	get_medley_song \{index = 0}
endscript

script kill_medley_spawned_scripts 
	KillSpawnedScript \{Name = medley_begin_song_after_intro}
	KillSpawnedScript \{Name = medley_in_song_loading}
	KillSpawnedScript \{Name = get_and_load_medley_song}
	KillSpawnedScript \{Name = load_medley_anim}
	KillSpawnedScript \{Name = medley_startiterator}
endscript

script medley_gem_step_begin 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if GotParam \{wait_time}
		Wait <wait_time> Seconds
	endif
	if (<next_medley_index> = $medley_last_index_loaded)
		return
	endif
	Change medley_current_index_loaded = <medley_index>
	gman_songtool_setcurrentsong song = <song>
	Wait \{1
		Second}
	get_and_load_medley_song <...>
	Change medley_last_index_loaded = <next_medley_index>
endscript

script medley_song_play 
	medley_find_song_in_slot song = <song>
	songplay slot = <slot>
	Change medley_last_start_time = <song_start_audio>
	Change medley_last_slot_used = <slot>
endscript

script medley_start_event 
	medley_unmute_all_streams
	if GotParam \{song_start_audio}
		medley_song_play song = <song> song_start_audio = <song_start_audio>
	endif
	if (<medley_index> > 0)
		medley_end_deadspace
	endif
endscript

script medley_end_event 
	if GotParam \{muted_instrument_bits}
		if GotParam \{guitar}
			medley_mute_stream instrument_streamname = guitar vol = ($default_BussSet.guitar_stream.vol)
		endif
		if GotParam \{bass}
			medley_mute_stream instrument_streamname = bass vol = ($default_BussSet.bass_stream.vol)
		endif
		if GotParam \{drumkick}
			medley_mute_stream instrument_streamname = drumkick vol = ($default_BussSet.drumkick_stream.vol)
		endif
		if GotParam \{drumsnare}
			medley_mute_stream instrument_streamname = drumsnare vol = ($default_BussSet.drumsnare_stream.vol)
		endif
		if GotParam \{drumtom}
			medley_mute_stream instrument_streamname = drumtom vol = ($default_BussSet.drumtom_stream.vol)
		endif
		if GotParam \{drumcymbal}
			medley_mute_stream instrument_streamname = drumcymbal vol = ($default_BussSet.drumcymbal_stream.vol)
		endif
		if GotParam \{vocals}
			medley_mute_stream instrument_streamname = vocals vol = ($default_BussSet.vocals_stream.vol)
		endif
	else
		medley_mute_all_streams
	endif
	if GotParam \{song_stop_audio}
		medley_clear_song_in_slot song = <song>
		songstop slot = <slot>
	endif
	get_medley_size
	if (<medley_index> + 1 < <medley_size> && $medley_looping = 0)
		medley_start_deadspace
	endif
endscript

script medley_mute_stream 
	medley_setsoundbuss instrument_streamname = <instrument_streamname> vol = -100 time = 0.05
endscript

script medley_unmute_stream 
	medley_setsoundbuss instrument_streamname = <instrument_streamname> vol = <vol> time = 0.025
endscript

script medley_mute_all_streams 
	medley_mute_stream \{instrument_streamname = guitar}
	medley_mute_stream \{instrument_streamname = bass}
	medley_mute_stream \{instrument_streamname = drumkick}
	medley_mute_stream \{instrument_streamname = drumsnare}
	medley_mute_stream \{instrument_streamname = drumtom}
	medley_mute_stream \{instrument_streamname = drumcymbal}
	medley_mute_stream \{instrument_streamname = vocals}
endscript

script medley_unmute_all_streams 
	medley_unmute_stream instrument_streamname = guitar vol = ($default_BussSet.guitar_stream.vol)
	medley_unmute_stream instrument_streamname = bass vol = ($default_BussSet.bass_stream.vol)
	medley_unmute_stream instrument_streamname = drumkick vol = ($default_BussSet.drumkick_stream.vol)
	medley_unmute_stream instrument_streamname = drumsnare vol = ($default_BussSet.drumsnare_stream.vol)
	medley_unmute_stream instrument_streamname = drumtom vol = ($default_BussSet.drumtom_stream.vol)
	medley_unmute_stream instrument_streamname = drumcymbal vol = ($default_BussSet.drumcymbal_stream.vol)
	medley_unmute_stream instrument_streamname = vocals vol = ($default_BussSet.vocals_stream.vol)
endscript

script medley_mute_event 
	if GotParam \{guitar}
		instrument_streamname = guitar
		medley_mute_stream instrument_streamname = <instrument_streamname>
	endif
	if GotParam \{bass}
		instrument_streamname = bass
		medley_mute_stream instrument_streamname = <instrument_streamname>
	endif
	if GotParam \{drumkick}
		instrument_streamname = drumkick
		medley_mute_stream instrument_streamname = <instrument_streamname>
	endif
	if GotParam \{drumsnare}
		instrument_streamname = drumsnare
		medley_mute_stream instrument_streamname = <instrument_streamname>
	endif
	if GotParam \{drumtom}
		instrument_streamname = drumtom
		medley_mute_stream instrument_streamname = <instrument_streamname>
	endif
	if GotParam \{drumcymbal}
		instrument_streamname = drumcymbal
		medley_mute_stream instrument_streamname = <instrument_streamname>
	endif
	if GotParam \{vocals}
		instrument_streamname = vocals
		medley_mute_stream instrument_streamname = <instrument_streamname>
	endif
	if GotParam \{song_stop_audio}
		medley_clear_song_in_slot song = <song>
		songstop slot = <slot>
	endif
endscript

script medley_unmute_event 
	if GotParam \{song_start_audio}
		medley_mute_all_streams
	endif
	if GotParam \{guitar}
		instrument_streamname = guitar
		vol = ($default_BussSet.guitar_stream.vol)
		SpawnScriptLater medley_unmute_stream params = {instrument_streamname = <instrument_streamname> vol = <vol>}
	endif
	if GotParam \{bass}
		instrument_streamname = bass
		vol = ($default_BussSet.bass_stream.vol)
		SpawnScriptLater medley_unmute_stream params = {instrument_streamname = <instrument_streamname> vol = <vol>}
	endif
	if GotParam \{drumkick}
		instrument_streamname = drumkick
		vol = ($default_BussSet.drumkick_stream.vol)
		SpawnScriptLater medley_unmute_stream params = {instrument_streamname = <instrument_streamname> vol = <vol>}
	endif
	if GotParam \{drumsnare}
		instrument_streamname = drumsnare
		vol = ($default_BussSet.drumsnare_stream.vol)
		SpawnScriptLater medley_unmute_stream params = {instrument_streamname = <instrument_streamname> vol = <vol>}
	endif
	if GotParam \{drumtom}
		instrument_streamname = drumtom
		vol = ($default_BussSet.drumtom_stream.vol)
		SpawnScriptLater medley_unmute_stream params = {instrument_streamname = <instrument_streamname> vol = <vol>}
	endif
	if GotParam \{drumcymbal}
		instrument_streamname = drumcymbal
		vol = ($default_BussSet.drumcymbal_stream.vol)
		SpawnScriptLater medley_unmute_stream params = {instrument_streamname = <instrument_streamname> vol = <vol>}
	endif
	if GotParam \{vocals}
		instrument_streamname = vocals
		vol = ($default_BussSet.vocals_stream.vol)
		SpawnScriptLater medley_unmute_stream params = {instrument_streamname = <instrument_streamname> vol = <vol>}
	endif
	if GotParam \{song_start_audio}
		medley_song_play song = <song> song_start_audio = <song_start_audio>
	endif
endscript

script medley_setsoundbuss 
	switch (<instrument_streamname>)
		case guitar
		setsoundbussparams {guitar_stream = {vol = <vol>} time = <time>}
		case bass
		setsoundbussparams {bass_stream = {vol = <vol>} time = <time>}
		case drumkick
		setsoundbussparams {drumkick_stream = {vol = <vol>} time = <time>}
		case drumsnare
		setsoundbussparams {drumsnare_stream = {vol = <vol>} time = <time>}
		case drumtom
		setsoundbussparams {drumtom_stream = {vol = <vol>} time = <time>}
		case drumcymbal
		setsoundbussparams {drumcymbal_stream = {vol = <vol>} time = <time>}
		case vocals
		setsoundbussparams {vocals_stream = {vol = <vol>} time = <time>}
		case Crowd
		setsoundbussparams {crowdsingalong_stream = {vol = <vol>} time = <time>}
		default
		ScriptAssert 'Unknown instrument streamname - %s' s = <instrument_streamname>
	endswitch
endscript

script medley_start_deadspace 
	song_quiet_adjust_all_sfx_down \{sfxbalancetime = 1
		crowdbalancetime = 1
		sfxvolsub = 100.0
		crowdvolsub = 100.0}
endscript

script medley_end_deadspace 
	song_quiet_over_adjust_all_sfx_to_normal \{sfxbalancetime = 1
		crowdbalancetime = 1}
	Change \{medley_song_arrays_modified = 0}
endscript

script setup_for_medley 
	medley_reset
	get_medley_song \{index = 0}
	medley_set_song_in_slot song = <medley_song>
	Change \{medley_mode_on = 1}
	medley_mute_stream \{instrument_streamname = Crowd}
	return medley_song = <medley_song> medley_start_time = ($medley_intro_start_time)
endscript

script shutdown_for_medley 
	band_stop_anims
	band_unload_anim_paks
	medley_reset <...>
	medley_unmute_stream \{instrument_streamname = Crowd}
endscript
