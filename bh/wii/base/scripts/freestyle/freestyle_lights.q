freestyle_lights = {
	red = [
		red_01
		red_02
		red_03
	]
	orange = [
		orange_01
		orange_02
		orange_03
	]
	yellow = [
		yellow_01
		yellow_02
		yellow_03
	]
	green = [
		green_01
		green_02
		green_03
	]
	blue = [
		blue_01
		blue_02
		blue_03
	]
	Purple = [
		purple_01
		purple_02
		purple_03
	]
	Intro = [
		Intro
	]
	outro = [
		outro
	]
	blackout = [
		blackout
	]
	pyro = [
		pyro
	]
	flare = [
		whiteout
	]
	strobe = [
		strobe_placeholder
	]
	tutorial = [
		tutorial
	]
}
freestyle_light_colors = [
	red
	orange
	yellow
	green
	blue
	Purple
]
freestyle_mood_prefixes = {
	rockandroll = 'RockAndRoll'
	metal = 'Metal'
	funk = 'Funk'
	rock = 'Rock'
	blues = 'Blues'
	tutorial = 'Tutorial'
}
freestyle_mood_postfixes = {
	red = 'red'
	orange = 'orange'
	yellow = 'yellow'
	green = 'green'
	blue = 'blue'
	Purple = 'purple'
	Intro = 'intro'
	outro = 'outro'
	blackout = 'blackout'
	pyro = 'pyro'
	flare = 'whiteout'
	strobe = 'strobe'
	tutorial = 'tutorial'
}
freestyle_strobe_snapshots = [
	strobe01
	strobe02
	strobe03
	strobe04
	strobe05
	strobe06
	strobe07
	strobe08
]
freestyle_light_change_beats = 16
freestyle_light_change_notes = 12
freestyle_light_beats_change_mini_min = 1
freestyle_light_beats_change_mini_max = 1
freestyle_light_strobe_length_secs = 0.120000005
freestyle_light_beats_last_change = 0
freestyle_light_beats_last_change_mini = 0
freestyle_light_note_count_last_change = 0
freestyle_lock_auto_lights = FALSE
freestyle_light_snapshot_color_idx = 0
freestyle_light_snapshot_inner_idx = 0
freestyle_light_change_beats_mini = 0
freestyle_light_current_type = None

script freestyle_init_lights 
	LightShow_SetActive \{Active = FALSE}
	if NOT CD
		DestroyScreenElement \{id = lightshow_debuganchor}
	endif
	LightShow_InitEventMappings
	freestyle_reset_light_globals
	freestyle_lights_choose_mini_change_interval
endscript

script freestyle_deinit_lights 
	KillSpawnedScript \{Name = freestyle_play_timed_lights_wait}
	KillSpawnedScript \{Name = freestyle_light_strobe}
	KillSpawnedScript \{Name = freestyle_end_timed_lights}
endscript

script freestyle_reset_light_globals 
	Change \{freestyle_light_beats_last_change = 0}
	Change \{freestyle_light_beats_last_change_mini = 0}
	Change \{freestyle_light_note_count_last_change = 0}
	Change \{freestyle_light_snapshot_color_idx = -1}
	Change \{freestyle_light_snapshot_inner_idx = -1}
	Change \{freestyle_lock_auto_lights = FALSE}
	Change \{freestyle_light_current_type = None}
endscript

script freestyle_play_snapshot 
	RequireParams \{[
			snapshot
		]
		all}
	LightShow_SetTime \{time = 0.25}
	LightShow_PlaySnapshot Name = <snapshot> UseSnapshotPositions = true save = FALSE
endscript

script freestyle_play_specific_light 
	RequireParams \{[
			light_type
			light_index
		]
		all}
	if ($lightshow_enabled = 0)
		return
	endif
	if (($freestyle_light_current_type = <light_type>) && ($freestyle_light_snapshot_inner_idx = <light_index>))
		return
	endif
	if (<light_type> = strobe)
		if ($freestyle_light_current_type != strobe)
			SpawnScriptNow \{freestyle_light_strobe}
		endif
	else
		if ($freestyle_light_current_type = strobe)
			KillSpawnedScript \{Name = freestyle_light_strobe}
		endif
	endif
	if (<light_type> = pyro)
		if ($freestyle_light_current_type != pyro)
			freestyle_start_pyro
		endif
	else
		if ($freestyle_light_current_type = pyro)
			freestyle_stop_pyro
		endif
	endif
	if (<light_type> != strobe)
		freestyle_play_snapshot snapshot = ($freestyle_lights.<light_type> [<light_index>])
	endif
	if ((<light_type> = Intro) || ($freestyle_in_menus = true) || ($freestyle_game_mode = tutorial))
		<moodname> = Intro
	else
		mood_light = <light_type>
		if ((<light_type> = outro) || (<light_type> = strobe))
			mood_light = Purple
		else
			mood_light = <light_type>
		endif
		formatText checksumName = moodname '%p_%s' p = ($freestyle_mood_prefixes.($freestyle_current_style_settings.id)) s = ($freestyle_mood_postfixes.<mood_light>)
	endif
	LightShow_SetParams mood = <moodname>
	freestyle_find_light_type_index light_type = <light_type>
	freestylerecordlightevent light_type_index = <light_type_index> light_index = <light_index>
	KillSpawnedScript \{Name = freestyle_play_timed_lights_wait}
	Change freestyle_light_current_type = <light_type>
	Change freestyle_light_snapshot_inner_idx = <light_index>
endscript

script freestyle_choose_next_light_index 
	RequireParams \{[
			light_type
		]
		all}
	GetArraySize ($freestyle_lights.<light_type>)
	GetRandomValue Name = rand integer a = 0 b = (<array_Size> - 1)
	if (<rand> = $freestyle_light_snapshot_inner_idx)
		<rand> = (<rand> + 1)
		if (<rand> >= <array_Size>)
			<rand> = 0
		endif
	endif
	return next_light_index = <rand>
endscript

script freestyle_play_auto_lights \{new_color = FALSE}
	light_type = ($freestyle_light_current_type)
	if (<new_color> = true)
		GetArraySize ($freestyle_light_colors)
		GetRandomValue Name = chosen_color integer a = 0 b = (<array_Size> - 1)
		if (<chosen_color> = $freestyle_light_snapshot_color_idx)
			<chosen_color> = (<chosen_color> + 1)
			if (<chosen_color> >= <array_Size>)
				<chosen_color> = 0
			endif
		endif
		Change freestyle_light_snapshot_color_idx = <chosen_color>
		<light_type> = ($freestyle_light_colors [<chosen_color>])
	endif
	freestyle_choose_next_light_index light_type = <light_type>
	freestyle_play_specific_light {
		light_type = <light_type>
		light_index = <next_light_index>
	}
	if (<new_color> = true)
		Change freestyle_light_beats_last_change = ($freestyle_last_nowbar_beat_number)
		Change freestyle_light_note_count_last_change = ($freestyle_total_notes_played)
	endif
	Change freestyle_light_beats_last_change_mini = ($freestyle_last_nowbar_beat_number)
endscript

script freestyle_update_auto_lights 
	if freestyleisplayback \{track = stage_show}
		return
	endif
	changing = FALSE
	new_color = FALSE
	if ($freestyle_auto_stage_show = true)
		if (($freestyle_last_nowbar_beat_number >= 0) && ($freestyle_lock_auto_lights = FALSE) && ($freestyle_transition_state = gameplay))
			if ($freestyle_last_nowbar_beat_number >= ($freestyle_light_beats_last_change + $freestyle_light_change_beats))
				<changing> = true
				<new_color> = true
			elseif ($freestyle_last_nowbar_beat_number >= ($freestyle_light_beats_last_change_mini + $freestyle_light_change_beats_mini))
				<changing> = true
				freestyle_lights_choose_mini_change_interval
			elseif ($freestyle_total_notes_played >= ($freestyle_light_note_count_last_change + $freestyle_light_change_notes))
				<changing> = true
				<new_color> = true
			endif
		endif
	else
		if ($freestyle_last_nowbar_beat_number >= ($freestyle_light_beats_last_change_mini + $freestyle_light_change_beats_mini))
			<changing> = true
			freestyle_lights_choose_mini_change_interval
		endif
	endif
	if (<changing> = true)
		freestyle_play_auto_lights new_color = <new_color>
	endif
endscript

script freestyle_play_intro_lights 
	if ($freestyle_auto_stage_show = FALSE)
		return
	endif
	freestyle_choose_next_light_index \{light_type = Intro}
	freestyle_play_specific_light light_type = Intro light_index = <next_light_index>
	Change \{freestyle_lock_auto_lights = true}
endscript

script freestyle_play_outro_lights 
	if (($freestyle_auto_stage_show = FALSE) && ($freestyle_forced_outro = 0))
		return
	endif
	freestyle_choose_next_light_index \{light_type = outro}
	freestyle_play_specific_light light_type = outro light_index = <next_light_index>
	Change \{freestyle_lock_auto_lights = true}
endscript

script freestyle_play_solo_lights 
	if ($freestyle_auto_stage_show = FALSE)
		return
	endif
	getmetronomelengthofbeat
	freestyle_play_timed_lights light_type = pyro time = (<length_of_beat> / 1000.0)
endscript

script freestyle_play_band_lights 
	if ($freestyle_auto_stage_show = FALSE)
		return
	endif
	getmetronomelengthofbeat
	freestyle_play_timed_lights light_type = strobe time = (($freestyle_beats_per_measure * <length_of_beat>) / 1000.0)
endscript

script freestyle_play_final_beat_lights 
	if ($freestyle_auto_stage_show = FALSE)
		return
	endif
	getmetronomelengthofbeat
	freestyle_play_timed_lights light_type = pyro time = (<length_of_beat> / 1000)
endscript

script freestyle_play_timed_lights 
	RequireParams \{[
			light_type
			time
		]
		all}
	if ($freestyle_auto_stage_show = FALSE)
		return
	endif
	freestyle_choose_next_light_index light_type = <light_type>
	freestyle_play_specific_light light_type = <light_type> light_index = <next_light_index>
	Change \{freestyle_lock_auto_lights = true}
	SpawnScriptNow freestyle_play_timed_lights_wait params = <...>
endscript

script freestyle_play_timed_lights_wait 
	Wait <time> Seconds
	SpawnScriptNow \{freestyle_end_timed_lights}
endscript

script freestyle_end_timed_lights 
	Change \{freestyle_lock_auto_lights = FALSE}
	freestyle_play_auto_lights \{new_color = true}
endscript

script freestyle_light_strobe 
	GetArraySize \{$freestyle_strobe_snapshots}
	current_snapshot = 0
	LightShow_SetParams \{mood = Intro}
	begin
	LightShow_SetTime time = ($freestyle_light_strobe_length_secs)
	LightShow_PlaySnapshot Name = ($freestyle_strobe_snapshots [<current_snapshot>]) UseSnapshotPositions = true save = FALSE
	Wait ($freestyle_light_strobe_length_secs) Seconds
	<current_snapshot> = (<current_snapshot> + 1)
	if (<current_snapshot> >= <array_Size>)
		<current_snapshot> = 0
	endif
	repeat
endscript

script freestyle_lights_choose_mini_change_interval 
	GetRandomValue Name = rand integer a = ($freestyle_light_beats_change_mini_min) b = ($freestyle_light_beats_change_mini_max)
	Change freestyle_light_change_beats_mini = <rand>
endscript
