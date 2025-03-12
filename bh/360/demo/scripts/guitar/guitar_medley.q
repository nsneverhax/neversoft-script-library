
script iterator_override_params 
	if gotparam \{medley_index}
		get_medley_song index = <medley_index>
		return song_name = <medley_song>
	endif
endscript

script get_medley_song 
	getarraysize \{$current_medley_info}
	if (<index> >= 0 && <index> < <array_size>)
		return medley_song = ($current_medley_info [<index>].song)
	endif
	return \{medley_song = uninitialized_song_value}
endscript

script load_medley_anim 
	destroy_band
	band_unload_anim_paks
endscript

script get_and_load_medley_song 
	requireparams \{[
			medley_index
			next_medley_index
			medley_time
		]
		all}
	get_medley_song index = <medley_index>
	current_song = <medley_song>
	get_medley_song index = <next_medley_index>
	next_song = <medley_song>
	spawnscriptnow load_medley_anim params = {current_song = <current_song>}
	wait \{1
		second}
	if (<next_song> != uninitialized_song_value)
		medley_in_song_loading current_song = <current_song> next_song = <next_song>
		wait \{1
			second}
		getmedleyaudiostarttime medley_index = <next_medley_index>
		seek_start_time = <medley_audio_start_time>
		removeparameter \{medley_audio_start_time}
		medley_load_song_audio <...> next_song = <next_song> index = <medley_index>
	endif
endscript

script get_medley_index 
	getarraysize \{$current_medley_info}
	if (<index> < <array_size>)
		return medley_index = ($current_medley_info [<index>].index)
	else
		return \{medley_index = none}
	endif
endscript

script get_medley_size 
	getarraysize \{$current_medley_info}
	return medley_size = <array_size>
endscript

script get_medley_start_time 
	get_medley_song index = <index>
	get_medley_index index = <index>
	get_song_prefix song = <medley_song>
	formattext checksumname = song '%a_medley_markers' a = <song_prefix>
	return medley_start_time = ($<song> [<medley_index>])
endscript

script get_medley_end_time 
	get_medley_song index = <index>
	get_song_prefix song = <medley_song>
	formattext checksumname = song '%a_medley_markers' a = <song_prefix>
	medley_find_end_marker_index index = <index>
	return medley_end_time = ($<song> [<end_merker_index>])
endscript

script medley_in_song_loading \{next_song = unknown}
	change \{in_song_loading_active = 1}
	get_song_performance song = <current_song>
	unload_songqpak songpak = <current_song> songpak_performance = <song_performance>
	wait \{1
		second}
	load_songqpak song_name = <next_song> async = 1
	change \{in_song_loading_active = 0}
endscript

script medley_start 
	setplayerinfo \{1
		bot_play = 1}
	setplayerinfo \{2
		bot_play = 1}
	setplayerinfo \{3
		bot_play = 1}
	setplayerinfo \{4
		bot_play = 1}
	change \{game_mode = p1_quickplay}
	setplayerinfo \{1
		part = vocals}
	setplayerinfo \{2
		part = guitar}
	setplayerinfo \{3
		part = bass}
	setplayerinfo \{4
		part = drum}
	setplayerinfo \{1
		difficulty = expert}
	setplayerinfo \{2
		difficulty = expert}
	setplayerinfo \{3
		difficulty = expert}
	setplayerinfo \{4
		difficulty = expert}
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
	if NOT gotparam \{restarting}
		change \{medley_mode_on = 0}
	endif
	change \{medley_song_won = 0}
	change \{medley_last_start_time = 0}
	change \{medley_last_seek_time = 0}
	change \{medley_song_slot0 = uninitialized_song_value}
	change \{medley_song_slot1 = uninitialized_song_value}
	change \{medley_slot0_used = 0}
	change \{medley_slot1_used = 0}
	change \{medley_last_slot_used = 0}
	change \{medley_current_index_loaded = 0}
	change \{medley_last_index_loaded = -777}
	change \{medley_song_arrays_modified = 0}
	change \{medley_last_time = 0}
endscript

script medley_clear_song_in_slot 
	if ($medley_song_slot0 = $medley_song_slot1)
		slot = ($medley_last_slot_used)
		formattext checksumname = medley_song_slot 'medley_song_slot%d' d = <slot>
		formattext checksumname = medley_slot_used 'medley_slot%d_used' d = <slot>
		change globalname = <medley_song_slot> newvalue = uninitialized_song_value
		change globalname = <medley_slot_used> newvalue = 0
		return slot = <slot>
	else
		if ($medley_slot0_used = 1)
			if ($medley_song_slot0 = <song>)
				change \{medley_song_slot0 = uninitialized_song_value}
				change \{medley_slot0_used = 0}
				return \{slot = 0}
			endif
		endif
		if ($medley_slot1_used = 1)
			if ($medley_song_slot1 = <song>)
				change \{medley_song_slot1 = uninitialized_song_value}
				change \{medley_slot1_used = 0}
				return \{slot = 1}
			endif
		endif
	endif
	print_medley_slot_info
	scriptassert qs(0x7397a1ee) s = <song>
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
		change medley_song_slot0 = <song>
		change \{medley_slot0_used = 1}
		return \{slot = 0}
	elseif ($medley_slot1_used = 0)
		change medley_song_slot1 = <song>
		change \{medley_slot1_used = 1}
		return \{slot = 1}
	endif
	print_medley_slot_info
	scriptassert \{qs(0x0ed6e181)}
endscript

script medley_find_song_in_slot 
	if ($medley_song_slot0 = <song>)
		return \{slot = 0}
	elseif ($medley_song_slot1 = <song>)
		return \{slot = 1}
	endif
	print_medley_slot_info
	scriptassert qs(0x7397a1ee) s = <song>
endscript

script medley_load_song_audio 
	medley_set_song_in_slot song = <next_song>
	songunload slot = <slot>
	wait \{1
		second}
	preload_song song_name = <next_song> slot = <slot>
	change \{song_is_waiting_to_start = 0}
	spawnscriptnow medley_begin_song_after_intro params = {<...>}
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
	seek_start_time = (<seek_start_time> - <pre_unmute_time> - <fade_in_time>)
	songseek slot = <slot> time = <seek_start_time>
	change medley_last_seek_time = <seek_start_time>
	change \{song_is_waiting_to_start = 0}
endscript

script medley_restart 
	medley_reset <...>
	get_medley_song \{index = 0}
endscript

script kill_medley_spawned_scripts 
	killspawnedscript \{name = medley_begin_song_after_intro}
	killspawnedscript \{name = medley_in_song_loading}
	killspawnedscript \{name = get_and_load_medley_song}
	killspawnedscript \{name = load_medley_anim}
	killspawnedscript \{name = medley_startiterator}
endscript

script medley_gem_step_begin 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	change medley_current_index_loaded = <medley_index>
	change medley_last_time = <medley_time>
	spawnscriptnow medley_show_song params = {medley_index = <medley_index> song = <song>}
	if gotparam \{wait_time}
		wait <wait_time> seconds
	endif
	if (<next_medley_index> = $medley_last_index_loaded)
		return
	endif
	gman_songtool_setcurrentsong song = <song>
	wait \{1
		second}
	get_and_load_medley_song <...>
	change medley_last_index_loaded = <next_medley_index>
endscript

script medley_song_play 
	medley_find_song_in_slot song = <song>
	songplay slot = <slot>
	change medley_last_start_time = <song_start_audio>
	change medley_last_slot_used = <slot>
endscript

script medley_start_event 
	medley_unmute_all_streams
	if gotparam \{song_start_audio}
		medley_song_play song = <song> song_start_audio = <song_start_audio>
	endif
	if (<medley_index> > 0)
		medley_end_deadspace
	endif
endscript

script medley_end_event 
	if gotparam \{muted_instrument_bits}
		if gotparam \{guitar}
			medley_mute_stream instrument_streamname = guitar vol = ($default_bussset.guitar_stream.vol)
		endif
		if gotparam \{bass}
			medley_mute_stream instrument_streamname = bass vol = ($default_bussset.bass_stream.vol)
		endif
		if gotparam \{drumkick}
			medley_mute_stream instrument_streamname = drumkick vol = ($default_bussset.drumkick_stream.vol)
		endif
		if gotparam \{drumsnare}
			medley_mute_stream instrument_streamname = drumsnare vol = ($default_bussset.drumsnare_stream.vol)
		endif
		if gotparam \{drumtom}
			medley_mute_stream instrument_streamname = drumtom vol = ($default_bussset.drumtom_stream.vol)
		endif
		if gotparam \{drumcymbal}
			medley_mute_stream instrument_streamname = drumcymbal vol = ($default_bussset.drumcymbal_stream.vol)
		endif
		if gotparam \{vocals}
			medley_mute_stream instrument_streamname = vocals vol = ($default_bussset.vocals_stream.vol)
		endif
	else
		medley_mute_all_streams
	endif
	if gotparam \{song_stop_audio}
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
	medley_unmute_stream instrument_streamname = guitar vol = ($default_bussset.guitar_stream.vol)
	medley_unmute_stream instrument_streamname = bass vol = ($default_bussset.bass_stream.vol)
	medley_unmute_stream instrument_streamname = drumkick vol = ($default_bussset.drumkick_stream.vol)
	medley_unmute_stream instrument_streamname = drumsnare vol = ($default_bussset.drumsnare_stream.vol)
	medley_unmute_stream instrument_streamname = drumtom vol = ($default_bussset.drumtom_stream.vol)
	medley_unmute_stream instrument_streamname = drumcymbal vol = ($default_bussset.drumcymbal_stream.vol)
	medley_unmute_stream instrument_streamname = vocals vol = ($default_bussset.vocals_stream.vol)
endscript

script medley_mute_event 
	if gotparam \{guitar}
		instrument_streamname = guitar
		medley_mute_stream instrument_streamname = <instrument_streamname>
	endif
	if gotparam \{bass}
		instrument_streamname = bass
		medley_mute_stream instrument_streamname = <instrument_streamname>
	endif
	if gotparam \{drumkick}
		instrument_streamname = drumkick
		medley_mute_stream instrument_streamname = <instrument_streamname>
	endif
	if gotparam \{drumsnare}
		instrument_streamname = drumsnare
		medley_mute_stream instrument_streamname = <instrument_streamname>
	endif
	if gotparam \{drumtom}
		instrument_streamname = drumtom
		medley_mute_stream instrument_streamname = <instrument_streamname>
	endif
	if gotparam \{drumcymbal}
		instrument_streamname = drumcymbal
		medley_mute_stream instrument_streamname = <instrument_streamname>
	endif
	if gotparam \{vocals}
		instrument_streamname = vocals
		medley_mute_stream instrument_streamname = <instrument_streamname>
	endif
	if gotparam \{song_stop_audio}
		medley_clear_song_in_slot song = <song>
		songstop slot = <slot>
	endif
endscript

script medley_unmute_event 
	if gotparam \{song_start_audio}
		medley_mute_all_streams
	endif
	if gotparam \{guitar}
		instrument_streamname = guitar
		vol = ($default_bussset.guitar_stream.vol)
		spawnscriptlater medley_unmute_stream params = {instrument_streamname = <instrument_streamname> vol = <vol>}
	endif
	if gotparam \{bass}
		instrument_streamname = bass
		vol = ($default_bussset.bass_stream.vol)
		spawnscriptlater medley_unmute_stream params = {instrument_streamname = <instrument_streamname> vol = <vol>}
	endif
	if gotparam \{drumkick}
		instrument_streamname = drumkick
		vol = ($default_bussset.drumkick_stream.vol)
		spawnscriptlater medley_unmute_stream params = {instrument_streamname = <instrument_streamname> vol = <vol>}
	endif
	if gotparam \{drumsnare}
		instrument_streamname = drumsnare
		vol = ($default_bussset.drumsnare_stream.vol)
		spawnscriptlater medley_unmute_stream params = {instrument_streamname = <instrument_streamname> vol = <vol>}
	endif
	if gotparam \{drumtom}
		instrument_streamname = drumtom
		vol = ($default_bussset.drumtom_stream.vol)
		spawnscriptlater medley_unmute_stream params = {instrument_streamname = <instrument_streamname> vol = <vol>}
	endif
	if gotparam \{drumcymbal}
		instrument_streamname = drumcymbal
		vol = ($default_bussset.drumcymbal_stream.vol)
		spawnscriptlater medley_unmute_stream params = {instrument_streamname = <instrument_streamname> vol = <vol>}
	endif
	if gotparam \{vocals}
		instrument_streamname = vocals
		vol = ($default_bussset.vocals_stream.vol)
		spawnscriptlater medley_unmute_stream params = {instrument_streamname = <instrument_streamname> vol = <vol>}
	endif
	if gotparam \{song_start_audio}
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
		case crowd
		setsoundbussparams {crowdsingalong_stream = {vol = <vol>} time = <time>}
		default
		scriptassert 'Unknown instrument streamname - %s' s = <instrument_streamname>
	endswitch
endscript

script medley_start_deadspace 
	song_quiet_adjust_all_sfx_down \{sfxbalancetime = 1
		crowdbalancetime = 1
		sfxvolsub = 100.0
		crowdvolsub = 100.0}
	medley_fade_in_song_text
endscript

script medley_end_deadspace 
	song_quiet_over_adjust_all_sfx_to_normal \{sfxbalancetime = 1
		crowdbalancetime = 1}
	change \{medley_song_arrays_modified = 0}
	medley_fade_out_song_text
endscript

script setup_for_medley 
	medley_reset
	get_medley_song \{index = 0}
	medley_set_song_in_slot song = <medley_song>
	change \{medley_mode_on = 1}
	medley_mute_stream \{instrument_streamname = crowd}
	create_medley_song_text
	return medley_song = <medley_song> medley_start_time = ($medley_intro_start_time)
endscript

script shutdown_for_medley 
	destroy_medley_song_text
	band_stop_anims
	band_unload_anim_paks
	medley_reset <...>
	medley_unmute_stream \{instrument_streamname = crowd}
endscript

script can_medley_unpause 
	if ($medley_mode_on = 0)
		return \{true}
	endif
	getsongtimems
	casttointeger \{time}
	if (<time> > 0)
		return \{true}
	endif
	return \{false}
endscript

script construct_random_medley 
	unload_all_song_paks
	getarraysize \{$current_playlist}
	playlist_size = <array_size>
	if NOT (<array_size> > 0)
		return
	endif
	array = []
	intro_bit = 1
	outro_bit = 16
	start_bit = 64
	playlist_index = 0
	begin
	song_name = ($current_playlist [<playlist_index>])
	get_song_prefix song = <song_name>
	formattext checksumname = markers '%s_medley_markers_dupe' s = <song_prefix>
	loaded_songqpak = 0
	if NOT globalexists name = <markers> type = array
		load_songqpak song_name = <song_name>
		formattext checksumname = markers '%s_medley_markers' s = <song_prefix>
		loaded_songqpak = 1
	endif
	getarraysize ($<markers>)
	if (<array_size> > 0)
		addarrayelement array = <array> element = <song_name>
	endif
	if (<loaded_songqpak> = 1)
		unload_songqpak
	endif
	playlist_index = (<playlist_index> + 1)
	repeat <playlist_size>
	new_current_playlist = <array>
	getarraysize <new_current_playlist>
	playlist_size = <array_size>
	middle_songs_to_add = <playlist_size>
	total_num_songs_to_add = <playlist_size>
	if NOT (<playlist_size> >= 3)
		return \{false}
	endif
	intro_song = {song = none index = 0}
	outro_song = {song = none index = 0}
	playlist_intro_index = -1
	playlist_outro_index = -1
	playlist_index = 0
	intro_found = 0
	begin
	song_name = (<current_playlist> [<playlist_index>])
	get_song_prefix song = <song_name>
	formattext checksumname = markers '%s_medley_markers_dupe' s = <song_prefix>
	loaded_songqpak = 0
	if NOT globalexists name = <markers> type = array
		load_songqpak song_name = <song_name>
		formattext checksumname = markers '%s_medley_markers' s = <song_prefix>
		loaded_songqpak = 1
	endif
	getarraysize ($<markers>)
	marker_index = 0
	begin
	if (<intro_found> = 0 && $<markers> [(<marker_index> + 1)] && <intro_bit>)
		intro_song = {song = <song_name> index = <marker_index>}
		playlist_intro_index = <playlist_index>
		intro_found = 1
		break
	endif
	if ($<markers> [(<marker_index> + 1)] && <outro_bit>)
		outro_song = {song = <song_name> index = <marker_index>}
		playlist_outro_index = <playlist_index>
		break
	endif
	marker_index = (<marker_index> + 2)
	repeat (<array_size> / 2)
	if (<loaded_songqpak> = 1)
		unload_songqpak
	endif
	playlist_index = (<playlist_index> + 1)
	repeat <playlist_size>
	final_array = []
	middle_sections = [
		2
		4
		8
		32
	]
	getarraysize <middle_sections>
	middle_sections_size = <array_size>
	added_elements = 0
	if (<intro_song>.song != none)
		addarrayelement array = <final_array> element = <intro_song>
		final_array = <array>
		added_elements = (<added_elements> + 1)
		removearrayelement array = <new_current_playlist> index = <playlist_intro_index>
		new_current_playlist = <array>
		getarraysize <new_current_playlist>
		playlist_size = <array_size>
		middle_songs_to_add = (<middle_songs_to_add> - 1)
	endif
	if (<outro_song>.song != none)
		removearrayelement array = <new_current_playlist> index = <playlist_outro_index>
		new_current_playlist = <array>
		getarraysize <new_current_playlist>
		playlist_size = <array_size>
		middle_songs_to_add = (<middle_songs_to_add> - 1)
	endif
	playlist_index = 0
	begin
	song_name = (<new_current_playlist> [<playlist_index>])
	get_song_prefix song = <song_name>
	formattext checksumname = markers '%s_medley_markers_dupe' s = <song_prefix>
	loaded_songqpak = 0
	if NOT globalexists name = <markers> type = array
		load_songqpak song_name = <song_name>
		formattext checksumname = markers '%s_medley_markers' s = <song_prefix>
		loaded_songqpak = 1
	endif
	getarraysize ($<markers>)
	marker_size = (<array_size> / 2)
	getrandomvalue name = middle_sections_index a = 0 b = (<middle_sections_size> - 1) integer
	look_for_bit = (<middle_sections> [<middle_sections_index>])
	marker_index = 0
	begin
	my_marker = ($<markers> [((<marker_index> * 2) + 1)])
	if (<my_marker> && <look_for_bit>)
		break
	endif
	marker_index = (<marker_index> + 1)
	repeat <marker_size>
	if (<marker_index> < <marker_size>)
		addarrayelement array = <final_array> element = {song = <song_name> index = (<marker_index> * 2)}
		final_array = <array>
		added_elements = (<added_elements> + 1)
		removearrayelement array = <new_current_playlist> index = <playlist_index>
		new_current_playlist = <array>
		playlist_index = 0
		getarraysize <new_current_playlist>
		playlist_size = <array_size>
	else
		playlist_index = (<playlist_index> + 1)
		if (<playlist_index> >= <playlist_size>)
			playlist_index = 0
		endif
	endif
	if (<loaded_songqpak> = 1)
		unload_songqpak
	endif
	if (<added_elements> = <middle_songs_to_add> + <intro_found>)
		break
	endif
	repeat
	if (<outro_song>.song != none)
		addarrayelement array = <final_array> element = <outro_song>
		final_array = <array>
		added_elements = (<added_elements> + 1)
	endif
	if (<added_elements> = <total_num_songs_to_add>)
		change current_medley_info = <final_array>
		return \{true}
	endif
	return \{false}
endscript

script medley_show_song 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	requireparams \{[
			medley_index
			song
		]
		all}
	if screenelementexists \{id = medley_song_text}
		get_song_title song = <song>
		get_song_artist song = <song> with_year = 0
		getscreenelementchildren \{id = medley_song_text}
		(<children> [0]) :se_setprops text = (<song_artist> + qs(0x8e4d082b) + <song_title>)
		(<children> [1]) :se_setprops text = (<song_artist> + qs(0x8e4d082b) + <song_title>)
	endif
	if (<medley_index> = 0)
		wait \{2.0
			seconds}
		medley_fade_in_song_text
		wait \{5.0
			seconds}
		medley_fade_out_song_text
	endif
endscript

script medley_fade_in_song_text 
	if screenelementexists \{id = medley_song_text}
		legacydoscreenelementmorph \{id = medley_song_text
			alpha = 1
			time = 0.3}
	endif
endscript

script medley_fade_out_song_text 
	if screenelementexists \{id = medley_song_text}
		legacydoscreenelementmorph \{id = medley_song_text
			alpha = 0
			time = 0.3}
	endif
endscript

script create_medley_song_text 
	destroy_medley_song_text
	createscreenelement \{type = containerelement
		parent = root_window
		id = medley_song_text
		pos = (640.0, 300.0)
		just = [
			center
			center
		]
		alpha = 0}
	createscreenelement \{type = textelement
		parent = medley_song_text
		font = fontgrid_text_a1
		scale = 0.6
		just = [
			center
			center
		]
		rgba = [
			20
			20
			20
			255
		]
		z_priority = 1}
	createscreenelement \{type = textelement
		parent = medley_song_text
		font = fontgrid_text_a1
		scale = 0.58
		just = [
			center
			center
		]
		rgba = [
			200
			200
			200
			255
		]
		z_priority = 2}
endscript

script destroy_medley_song_text 
	if screenelementexists \{id = medley_song_text}
		destroyscreenelement \{id = medley_song_text}
	endif
endscript
