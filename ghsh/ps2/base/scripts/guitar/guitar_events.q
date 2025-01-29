0xdbe52d7a = 0
0x0e01819e = 600
guitar_events = [
	{
		Type = call
		event = missed_note
		Scr = GuitarEvent_MissedNote
	}
	{
		Type = call
		event = unnecessary_note
		Scr = GuitarEvent_UnnecessaryNote
	}
	{
		Type = call
		event = hit_notes
		Scr = GuitarEvent_HitNotes
	}
	{
		Type = call
		event = hit_note
		Scr = GuitarEvent_HitNote
	}
	{
		Type = call
		event = drumfill_hit
		Scr = guitarevent_drumfillhit
	}
	{
		Type = call
		event = hit_mine
		Scr = guitarevent_hitmine
	}
	{
		Type = call
		event = star_power_on
		Scr = GuitarEvent_StarPowerOn
	}
	{
		Type = call
		event = star_power_off
		Scr = GuitarEvent_StarPowerOff
	}
	{
		Type = spawn
		event = song_failed
		Scr = GuitarEvent_SongFailed
	}
	{
		Type = spawn
		event = song_won
		Scr = GuitarEvent_SongWon
	}
	{
		Type = spawn
		event = star_sequence_bonus
		Scr = GuitarEvent_StarSequenceBonus
	}
	{
		Type = call
		event = whammy_on
		Scr = GuitarEvent_WhammyOn
	}
	{
		Type = call
		event = whammy_off
		Scr = GuitarEvent_WhammyOff
	}
	{
		Type = call
		event = ext_whammy_off
		Scr = GuitarEvent_WhammyOff
	}
	{
		Type = call
		event = firstnote_window_open
		Scr = GuitarEvent_FirstNote_Window_Open
	}
]
total_open_notes_hit = 0

script create_guitar_events 

	GetArraySize \{$guitar_events}
	array_entry = 0
	begin

	event = ($guitar_events [<array_entry>].event)
	Type = ($guitar_events [<array_entry>].Type)
	ExtendCrc <event> <player_text> out = event
	SetEventHandler response = call_script event = <event> Scr = event_spawner params = {event_spawned = <array_entry>}
	array_entry = (<array_entry> + 1)
	repeat <array_Size>
	Block
endscript

script event_spawner 
	SpawnScriptNow ($guitar_events [<event_spawned>].Scr) params = {<...>} id = song_event_scripts
endscript

script event_iterator 

	get_song_prefix song = <song_name>
	formatText checksumName = song '%s_%e' s = <song_prefix> e = <event_string> AddToStringLookup
	array_entry = 0
	if NOT GlobalExists Name = <song> Type = array
		return
	endif
	GetArraySize $<song>
	if (<array_Size> = 0)
		return
	endif
	GetSongTimeMs time_offset = <time_offset>
	begin
	if ((<time> - <skipleadin>) < (($<song> [<array_entry>]).time))
		break
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_Size>
	array_Size = (<array_Size> - <array_entry>)
	if (<array_Size> = 0)
		return
	endif
	begin
	TimeMarkerReached_SetParams time_offset = <time_offset> array = <song> array_entry = <array_entry> ArrayOfStructures
	begin
	if TimeMarkerReached
		GetSongTimeMs time_offset = <time_offset>
		break
	endif
	WaitOneGameFrame
	repeat
	TimeMarkerReached_ClearParams
	scriptname = ($<song> [<array_entry>].Scr)
	if 0x33c564f7
		if ScriptExists <scriptname>
			SpawnScriptNow <scriptname> params = {time = <time> event_time = (($<song> [<array_entry>]).time) ($<song> [<array_entry>].params)} id = song_event_scripts
		elseif SymbolIsCFunc <scriptname>
			<scriptname> {time = <time> event_time = (($<song> [<array_entry>]).time) ($<song> [<array_entry>].params)}
		endif
	else
		if (<scriptname> = band_playclip)
			nullscript
		elseif (<scriptname> = Band_PlayIdle)
			0x3fac2d4f index = <array_entry>
		elseif (<scriptname> = band_forcealltoidle)
			nullscript
		elseif (<scriptname> = band_movetonode)
			nullscript
		elseif ScriptExists <scriptname>
			SpawnScriptNow <scriptname> params = {time = <time> event_time = (($<song> [<array_entry>]).time) ($<song> [<array_entry>].params)} id = song_event_scripts
		elseif SymbolIsCFunc <scriptname>
			<scriptname> {time = <time> event_time = (($<song> [<array_entry>]).time) ($<song> [<array_entry>].params)}
		endif
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_Size>
endscript

script wait_for_correct_frame 
	if NOT ($playing_song_for_real = 1)
		return
	endif
	if wait_for_correct_frame_cfunc
		WaitOneGameFrame
	endif
endscript

script 0x0666218b 
	if NOT ($playing_song_for_real = 1)
		return
	endif
	if (<id> = vocalist || <id> = drummer)
		return
	endif
	if (<id> = GUITARIST)
		if ($current_frame_toggle = 1)
			Wait \{1
				gameframe}
		endif
	else
		if ($current_frame_toggle = 0)
			Wait \{1
				gameframe}
		endif
	endif
endscript

script GuitarEvent_MissedNote \{extended_miss = 0}
	0x8a941e36 = 0
	wait_for_correct_frame Player = ($<player_status>.Player)
	if (<bum_note> = 1)
		Guitar_Wrong_Note_Sound_Logic <...>
	endif
	if ($is_network_game && ($<player_status>.is_local_client = 0))
		if (<silent_miss> = 1)
			SpawnScriptNow highway_pulse_black params = {player_text = ($<player_status>.text) player_status = <player_status>}
		endif
	else
		if NOT (($<player_status>.part) = drum)
			playergetvolume player_status = <player_status>
			if NOT (<Volume> = 0)
				if (<silent_miss> = 1)
					SpawnScriptNow highway_pulse_black params = {player_text = ($<player_status>.text) player_status = <player_status>}
				else
					if NOT (<extended_miss> = 1)
						playersetvolume player_status = <player_status> Volume = 0
						UpdateGuitarVolume
						jam_update_volume Volume = 0 Player = ($<player_status>.Player)
					endif
				endif
			endif
		endif
	endif
	if ($always_strum = FALSE)
		if ($disable_band = 0)
			if CompositeObjectExists Name = ($<player_status>.band_member)
				if ($<player_status>.part = guitar || $<player_status>.part = bass)
					bandmanager_missednote Name = ($<player_status>.band_member)
				endif
			endif
		endif
	endif
	inputarraygetelement Name = <song> index = <array_entry>
	if ($show_play_log = 1)
		output_log_text qs(0xbfe03a95) t = (<gem_array> [0]) Color = orange
	endif
	if (($<player_status>.part) = drum)
		if ($practice_enabled = 1)

			Change \{0xdbe52d7a = 1}
		endif
	endif
endscript

script 0x7656c669 
	begin
	if (<note> = <array_Size>)
		break
	endif
	updatestructelement struct = (($0xd6bfdbc3) [<note>]) element = Pos value = -1
	updatestructelement struct = (($0xd6bfdbc3) [<note>]) element = status value = empty
	i = (<note> + 1)
	repeat
endscript

script highway_pulse_black 
	<half_time> = ($highway_pulse_time / 2.0)
	formatText checksumName = highway 'Highway_2D%p' p = <player_text> AddToStringLookup = true
	legacydoscreenelementmorph id = <highway> rgba = ($highway_pulse) time = <half_time>
	Wait <half_time> Seconds
	if ($<player_status>.star_power_used = 1)
		legacydoscreenelementmorph id = <highway> rgba = ($highway_starpower) time = <half_time>
	else
		legacydoscreenelementmorph id = <highway> rgba = ($highway_normal) time = <half_time>
	endif
endscript

script GuitarEvent_UnnecessaryNote 
	wait_for_correct_frame Player = ($<player_status>.Player)
	Guitar_Wrong_Note_Sound_Logic <...>
	if NOT ($is_network_game && ($<player_status>.is_local_client = 0))
		playersetvolume player_status = <player_status> Volume = 0
		UpdateGuitarVolume
		jam_update_volume Volume = 0 Player = ($<player_status>.Player)
	endif
	if ($always_strum = FALSE)
		if ($disable_band = 0)
			if CompositeObjectExists Name = ($<player_status>.band_member)
				if ($<player_status>.part = guitar || $<player_status>.part = bass)
					LaunchEvent Type = Anim_MissedNote target = ($<player_status>.band_member)
				endif
			endif
		endif
	endif
	if ($show_play_log = 1)
		if (<array_entry> > 0)
			<songtime> = (<songtime> - ($check_time_early * 1000.0))
			inputarraygetelement Name = <song> index = <array_entry>
			next_note = (<gem_array> [0])
			inputarraygetelement Name = <song> index = (<array_entry> -1)
			prev_note = (<gem_array> [0])
			next_time = (<next_note> - <songtime>)
			prev_time = (<songtime> - <prev_note>)
			if (<prev_time> < ($check_time_late * 1000.0))
				<prev_time> = 1000000.0
			endif
			if (<next_time> < <prev_time>)
				<next_time> = (0 - <next_time>)
				output_log_text qs(0x9648a941) n = <next_time> t = <next_note> Color = red
			else
				output_log_text qs(0x6ef444b5) n = <prev_time> t = <prev_note> Color = darkred
			endif
		endif
	endif
endscript

script GuitarEvent_HitNotes 
	if ($Debug_Audible_HitNote = 1)
		SoundEvent \{event = GH_SFX_HitNoteSoundEvent}
	endif
	if ($show_play_log = 1)
		GetGlobalTags \{user_options}
		CastToInteger \{lag_calibration}
		Mod a = <lag_calibration> b = 1000
		<video_offset> = <Mod>
		<audio_offset> = ((<lag_calibration> / 1000) - 1)
		<off_note> = (0 - (<off_note> - ($time_input_offset + <audio_offset> + <video_offset>)))
		CastToInteger \{off_note}
		inputarraygetelement Name = <song> index = <array_entry>
		note_time = (<gem_array> [0])
		if (<off_note> < 0)
			output_log_text qs(0xddc15e81) n = <off_note> t = <note_time> Color = green
		else
			output_log_text qs(0x257db375) n = <off_note> t = <note_time> Color = darkgreen
		endif
	endif
	wait_for_correct_frame Player = ($<player_status>.Player)
	if (<updatevolume> = true)
		UpdateGuitarVolume
		jam_update_volume Volume = 100 Player = ($<player_status>.Player)
	endif
	Change \{0xdbe52d7a = 0}
endscript

script GuitarEvent_HitNote 
	SpawnScriptNow GuitarEvent_HitNote_Spawned params = {<...>}
endscript

script GuitarEvent_HitNote_Spawned 
	Change \{0xdbe52d7a = 0}
	wait_for_correct_frame Player = <Player>
	if GotParam \{kick}
		guitarevent_kick_drum_hit_note Player = <Player> player_text = <player_text>
	elseif GotParam \{open_note}
		guitarevent_hit_open_note Player = <Player> player_text = <player_text>
	elseif GotParam \{easy_rhythm_note}
		guitarevent_hit_easy_rhythm_note player_text = <player_text>
	else
		if ($game_mode = p2_battle || $boss_battle = 1)
			Change structurename = <player_status> last_hit_note = <Color>
		endif
		WaitOneGameFrame
		Scale = (2.0, 2.0)
		<Scale> = (1.0, 1.0)
		if GotParam \{kick}
			<Scale> = (7.0, 0.5)
		elseif GotParam \{open_note}
			<Scale> = (7.0, 0.5)
		elseif GotParam \{easy_rhythm_note}
			<Scale> = (7.0, 0.5)
		endif
		star = ($<player_status>.star_power_used)
		Name = <fx_id>
		NoteFX Scale = <Scale>
		Wait \{6
			gameframes}
		Wait \{10
			gameframes}
		if ScreenElementExists id = <fx_id>
			DestroyScreenElement id = <fx_id>
		endif
	endif
endscript

script guitarevent_drumfillhit 
	if GotParam \{kick}
		GuitarEvent_HitNote <...>
	endif
endscript
hit_particle_params = {
	z_priority = 8.0
	material = sys_Particle_Spark01_sys_Particle_Spark01
	start_color = [
		255
		128
		0
		255
	]
	end_color = [
		255
		0
		0
		0
	]
	start_scale = (2.0, 2.0)
	end_scale = (1.0, 1.0)
	start_angle_spread = 0.0
	min_rotation = 0.0
	max_rotation = 0.0
	emit_start_radius = 0.0
	emit_radius = 1.0
	Emit_Rate = 0.02
	emit_dir = 0.0
	emit_spread = 160.0
	velocity = 10.0
	friction = (0.0, 50.0)
	time = 0.25
}
star_hit_particle_params = {
	z_priority = 8.0
	material = sys_Particle_Spark01_sys_Particle_Spark01
	start_color = [
		0
		255
		255
		255
	]
	end_color = [
		0
		255
		255
		0
	]
	start_scale = (2.0, 2.0)
	end_scale = (1.0, 1.0)
	start_angle_spread = 0.0
	min_rotation = 0.0
	max_rotation = 0.0
	emit_start_radius = 0.0
	emit_radius = 1.0
	Emit_Rate = 0.02
	emit_dir = 0.0
	emit_spread = 160.0
	velocity = 10.0
	friction = (0.0, 50.0)
	time = 0.25
}
whammy_particle_params = {
	z_priority = 8.0
	material = sys_Particle_Spark01_sys_Particle_Spark01
	start_color = [
		255
		128
		0
		255
	]
	end_color = [
		255
		0
		0
		0
	]
	start_scale = (1.0, 1.0)
	end_scale = (0.5, 0.5)
	start_angle_spread = 0.0
	min_rotation = 0.0
	max_rotation = 0.0
	emit_start_radius = 0.0
	emit_radius = 1.0
	Emit_Rate = 0.02
	emit_dir = 0.0
	emit_spread = 160.0
	velocity = 10.0
	friction = (0.0, 50.0)
	time = 0.5
}

script guitarevent_hitmine 
	SpawnScriptNow guitarevent_hitmine_spawned params = {<...>}
endscript

script guitarevent_hitmine_spawned 
	if ($<player_status>.highway_position = left)
		SoundEvent \{event = gh_sfx_battlemode_mine_explode_p1}
	else
		SoundEvent \{event = gh_sfx_battlemode_mine_explode_p2}
	endif
	SpawnScriptNow hammer_highway params = {other_player_text = <player_text>}
	<crowd_decrease_count> = $battle_mine_health_decrease_count
	<wait_time> = 0.15
	<wait_time_slice> = (<wait_time> / <crowd_decrease_count>)
	if ($<player_status>.current_num_powerups > 0)
		remove_battle_card player_status = <player_status>
		update_battlecards_remove player_status = <player_status>
	endif
	CastToInteger \{crowd_decrease_count}
	begin
	CrowdDecrease player_status = <player_status>
	Wait <wait_time_slice> Seconds
	repeat <crowd_decrease_count>
endscript

script killminefx 
	KillSpawnedScript \{Name = guitarevent_hitmine_spawned}
	get_highway_pos_and_scale \{num_non_vocals_players = 2
		non_vocalist_player = 1
		Player = 1}
	<container_pos> = (<Pos> + (0.0, 720.0))
	legacydoscreenelementmorph id = gem_containerp1 Pos = <container_pos>
	get_highway_pos_and_scale \{num_non_vocals_players = 2
		non_vocalist_player = 2
		Player = 2}
	<container_pos> = (<Pos> + (0.0, 720.0))
	legacydoscreenelementmorph id = gem_containerp2 Pos = <container_pos>
endscript

script GuitarEvent_StarPowerOn 
	wait_for_correct_frame Player = <Player>
	KillSpawnedScript \{Name = highway_pulse_black}
	if ($drum_solo_songtime_paused = 0)
		GH_Star_Power_Verb_On Player = <Player>
	endif
	StarPowerOn Player = <Player>
	if ($current_num_players = 4)
		if (all_players_using_starpower)
			SpawnScriptNow \{play_group_star_power_animation}
		endif
	endif
	hud_meter_glow_blue
endscript

script GuitarEvent_StarPowerOff 
	wait_for_correct_frame Player = ($<player_status>.Player)
	KillSpawnedScript \{Name = highway_pulse_black}
	if isSinglePlayerGame
		SoundEvent \{event = star_power_release_center_gh4}
		SoundEvent \{event = star_power_release_front_gh4}
	else
		SpawnScriptNow star_power_release_sfx_multiplayer params = {Player = ($<player_status>.Player)}
	endif
	GH_Star_Power_Verb_Off Player = ($<player_status>.Player)
	SpawnScriptNow rock_meter_star_power_off params = {player_text = <player_text>}
	SpawnScriptLater Kill_StarPower_StageFX params = {<...>}
	formatText checksumName = cont 'starpower_container_left%p' p = <player_text> AddToStringLookup = true
	if ScreenElementExists id = <cont>
		legacydoscreenelementmorph id = <cont> alpha = 0
	endif
	formatText checksumName = cont 'starpower_container_right%p' p = <player_text> AddToStringLookup = true
	if ScreenElementExists id = <cont>
		legacydoscreenelementmorph id = <cont> alpha = 0
	endif
	formatText checksumName = highway 'Highway_2D%p' p = <player_text> AddToStringLookup = true
	if ScreenElementExists id = <highway>
		SetScreenElementProps id = <highway> rgba = ($0x57e04d77)
	endif
	SpawnScriptNow \{Kill_StarPower_Camera}
	hud_meter_glow_hide_blue
endscript

script 0x9c2773ec 
	GetPakManCurrentName \{map = zones}
	if ((<pakname> = 'z_tool'))
		return
	endif
	volL = 0.0
	volR = 0.0
	if (($star_clap_normal = 1) || ($star_clap_leftcenterright = 1) || ($star_clap_middle = 1) || ($star_clap_left) || ($star_clap_left_middle))
		volL = 118
	endif
	if (($star_clap_normal = 1) || ($star_clap_leftcenterright = 1) || ($star_clap_middle = 1) || ($star_clap_right) || ($star_clap_right_middle))
		volR = 118
	endif
	GetRandomValue \{a = 0
		b = 2
		Name = 0x1e1afcc0
		integer}
	sample = Crowd_Group_Clap_01
	switch <0x1e1afcc0>
		case 0
		sample = Crowd_Group_Clap_01
		case 1
		sample = Crowd_Group_Clap_02
		case 2
		sample = Crowd_Group_Clap_03
	endswitch

	PlaySound <sample> voll_percent = (<volL> * $0x389366b2) volr_percent = (<volR> * $0x389366b2) buss = Crowd_Star_Power
endscript

script GuitarEvent_PreFretbar 
	SpawnScriptNow \{gh_audible_metronome}
	SpawnScriptNow clapping_logic params = {<...>}
endscript

script gh_audible_metronome 
	if ($debug_audible_metronome = 1)
		Wait ((0.25 + (($default_lag_settings.Xenon.input_lag_ms) * 0.001)) - 0.008333) Seconds
		SoundEvent \{event = GH_SFX_BeatSoundEvent}
	endif
endscript

script GuitarEvent_Fretbar 
	guitarevent_fretbar_cfunc
endscript

script GuitarEvent_Fretbar_Early 
endscript

script GuitarEvent_Fretbar_Late 
endscript

script check_first_note_formed 
	GetSongTime
	<starttime> = (<songtime> - 0.0167)
	Duration = ($<player_status>.check_time_early + $<player_status>.check_time_late)
	begin
	GetHeldPattern controller = ($<player_status>.controller) Player = ($<player_status>.Player) player_status = <player_status>
	if (<strum> = <hold_pattern>)
		playersetvolume player_status = <player_status> Volume = 100
		UpdateGuitarVolume
		jam_update_volume Volume = 100 Player = ($<player_status>.Player)
	endif
	WaitOneGameFrame
	GetSongTime
	if ((<songtime> - <starttime>) >= <Duration>)
		break
	endif
	repeat
endscript

script GuitarEvent_FirstNote_Window_Open 
	if IsGuitarController controller = ($<player_status>.controller)
		GetStrumPattern entry = 0 song = <song>
		SpawnScriptNow check_first_note_formed params = {strum = <strum> player_status = <player_status>}
	else
		playersetvolume player_status = <player_status> Volume = 100
		UpdateGuitarVolume
		jam_update_volume Volume = 100 Player = ($<player_status>.Player)
	endif
endscript
blueWhammyFXID01p1 = JOW_NIL
blueWhammyFXID02p1 = JOW_NIL
greenWhammyFXID01p1 = JOW_NIL
greenWhammyFXID02p1 = JOW_NIL
orangeWhammyFXID01p1 = JOW_NIL
orangeWhammyFXID02p1 = JOW_NIL
redWhammyFXID01p1 = JOW_NIL
redWhammyFXID02p1 = JOW_NIL
yellowWhammyFXID01p1 = JOW_NIL
yellowWhammyFXID02p1 = JOW_NIL
blueWhammyFXID01p2 = JOW_NIL
blueWhammyFXID02p2 = JOW_NIL
greenWhammyFXID01p2 = JOW_NIL
greenWhammyFXID02p2 = JOW_NIL
orangeWhammyFXID01p2 = JOW_NIL
orangeWhammyFXID02p2 = JOW_NIL
redWhammyFXID01p2 = JOW_NIL
redWhammyFXID02p2 = JOW_NIL
yellowWhammyFXID01p2 = JOW_NIL
yellowWhammyFXID02p2 = JOW_NIL

script Destroy_AllWhammyFX 
	WhammyFXOffAll \{player_status = player1_status}
	WhammyFXOffAll \{player_status = player2_status}
endscript

script GuitarEvent_WhammyOn 
	if (<Player> = 1)
		lock = whammyon_lockp1
	else
		lock = whammyon_lockp2
	endif
	Change GlobalName = <lock> NewValue = 1
	wait_for_correct_frame Player = <Player>
	WhammyFXOn <...>
	Change GlobalName = <lock> NewValue = 0
endscript

script GuitarEvent_WhammyOff 
	if (<Player> = 1)
		lock = whammyon_lockp1
	else
		lock = whammyon_lockp2
	endif
	begin
	if NOT ($<lock>)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	wait_for_correct_frame Player = <Player>
	WhammyFXOff <...>
endscript

script GuitarEvent_SongFailed 
	if ($failed_song = 1)
		return
	endif
	Change \{playing_song_for_real = 0}
	if ($game_mode = training || $game_mode = tutorial)
		return
	endif
	if ($is_network_game)
		online_fail_song
	elseif ($game_mode = p2_battle)
		GuitarEvent_SongWon \{battle_win = 1}
	else
		KillSpawnedScript \{Name = guitar_jam_playback_recording}
		KillSpawnedScript \{Name = guitar_jam_drum_playback}
		KillSpawnedScript \{Name = jam_input_whammy_spawned}
		jam_stop_all_samples
		jam_deinit_reverb
		KillSpawnedScript \{Name = GuitarEvent_SongWon_Spawned}
		if NOT ScriptIsRunning \{GuitarEvent_SongFailed_Spawned}
			SpawnScriptNow \{GuitarEvent_SongFailed_Spawned}
		endif
	endif
endscript

script GuitarEvent_SongFailed_Spawned 
	hide_glitch \{num_frames = 3}
	if ($is_attract_mode = 1)

		return
	endif
	if NOT ($boss_battle = 1)
		disable_highway_prepass
		disable_bg_viewport
	endif
	lightshow_songfailed
	GetSongTimeMs
	Change failed_song_time = <time>
	PauseGame
	Progression_SongFailed
	if ($boss_battle = 1)
		disable_pause
		preload_movie = 'Player2_wins'
		KillMovie \{textureSlot = 1}
		formatText checksumName = 0xfe864fb1 '%s' s = <preload_movie>
		Change g_you_rock_movie = <0xfe864fb1>
		formatText TextName = winner_text qs(0x237c4f68) s = ($current_boss.character_name)
		winner_space_between = (50.0, 0.0)
		winner_scale = 1.0
		if ($current_boss.character_profile = Morello)
			<winner_space_between> = (40.0, 0.0)
			<winner_scale> = 1.0
		endif
		if ($current_boss.character_profile = slash)
			<winner_space_between> = (40.0, 0.0)
			<winner_scale> = 1.0
		endif
		if ($current_boss.character_profile = Satan)
			<winner_space_between> = (40.0, 0.0)
			<winner_scale> = 1.0
		endif
		SpawnScriptNow \{wait_and_play_you_rock_movie}
		Wait \{0.2
			Seconds}
		SpawnScriptNow \{waitandkillhighway}
		SpawnScriptNow create_exploding_text params = {parent = 'you_rock_physics' text = <winner_text>}
	endif
	UnPauseGame
	SoundEvent \{event = Crowd_Fail_Song_SFX}
	SoundEvent \{event = GH_SFX_You_Lose_Single_Player}
	disable_pause
	song_failed_show_highways
	playlossvideo
	Transition_Play \{Type = songlost}
	Transition_Wait
	Change \{current_transition = None}
	ui_event_wait_for_safe
	ui_event_get_top
	if NOT (<base_name> = 'gameplay')
		ui_event_block \{event = menu_back
			data = {
				state = Uistate_gameplay
			}}
	endif
	PauseGame
	show_calibration = 0
	GetGlobalTags \{user_options
		param = has_calibrated}
	if (<has_calibrated> = 0)
	endif
	if ($special_event_stage != 0)
		<show_calibration> = 0
	endif
	gamemode_gettype
	if ($is_network_game = 0)
		ui_event_wait_for_safe
		Wait \{1
			gameframe}
		if ui_event_exists_in_stack \{Name = 'pausemenu'
				above = 'gameplay'}
			ui_event_block \{event = menu_back
				data = {
					state = Uistate_gameplay
				}}
		elseif ui_event_exists_in_stack \{Name = 'song_unpause'
				above = 'gameplay'}
			ui_event_block \{event = menu_back
				data = {
					state = Uistate_gameplay
				}}
		endif
		if (<show_calibration> = 1)
			SetGlobalTags \{user_options
				params = {
					has_calibrated = 1
				}}
			Body = qs(0x24b45119)
			SpawnScriptNow {
				ui_event {
					params = {
						event = menu_change
						data = {
							state = uistate_options_calibrate_lag_warning
							Body = <Body>
							cancel_script = menu_replace_to_fail_song
							yes_func_params = {go_back_script = menu_replace_to_fail_song}
						}
					}
				}
			}
		else
			SpawnScriptNow \{ui_event
				params = {
					event = menu_change
					data = {
						state = uistate_fail_song
					}
				}}
		endif
	endif
	if ($current_num_players = 1)
		SoundEvent \{event = Crowd_Fail_Song_SFX}
		BG_Crowd_Front_End_Silence \{immediate = 1}
	else
	endif
	KillSpawnedScript \{Name = create_exploding_text}
	destroy_exploding_text \{parent = 'you_rock_physics'}
endscript
song_failed_x = 1

script song_failed_show_highways 
	if ($song_failed_x = 0)
		return
	endif
	if ($current_num_players = 1)
		return
	endif
	if ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff)
		return
	endif
	if ($game_mode = p2_battle || $boss_battle = 1)
		return
	endif
	StopRendering
	songunload
	PauseGame
	StartRendering
	Wait \{0.5
		Second}
	Player = 1
	begin
	getplayerinfo <Player> current_health
	if (<current_health> < $health_poor_medium)
		song_failed_highway_x {Player = <Player>}
	endif
	Player = (<Player> + 1)
	repeat $current_num_players
	SoundEvent \{event = band_failed_x_sfx}
	if NOT ($band1_status.star_power_active)
		if ($band1_status.star_power_amount > (100.0 / 6.0))
			Wait \{0.3
				Seconds}
			hud_create_message \{Band
				text = qs(0xdb96ac31)
				Priority = 100
				rgba = [
					0
					200
					200
					255
				]}
		endif
	endif
	Wait \{2.2
		Seconds}
	UnPauseGame
endscript

script song_failed_highway_x 
	getplayerinfo <Player> hud_parent
	getplayerinfo <Player> part
	Pos = (80.0, 40.0)
	Scale = 2.0
	switch <part>
		case vocals
		icon = band_hud_microphone2
		Scale = 1.75
		if ($current_num_players = 2)
			Pos = (530.0, 20.0)
		else
			Pos = (500.0, 80.0)
		endif
		case guitar
		icon = band_hud_guitar2
		case bass
		icon = band_hud_bass2
		case drum
		icon = band_hud_drums2
	endswitch
	if hud_root :desc_resolvealias Name = <hud_parent> param = parent_id
		if ScreenElementExists id = <parent_id>
			CreateScreenElement {
				Type = SpriteElement
				parent = <parent_id>
				texture = <icon>
				just = [center center]
				z_priority = 400
				Scale = <Scale>
				Pos = <Pos>
				rgba = [255 0 0 255]
			}
		endif
	endif
endscript
gpulog_outputfilename = 'none'

script GuitarEvent_SongWon \{battle_win = 0}
	KillSpawnedScript \{Name = star_power_activate_and_drain}
	GetSongTimeMs
	0x87dbf57a = (<time> - ($0x0e01819e))
	Change \{playing_song_for_real = 0}
	if ($current_num_players = 2)
		GetSongTimeMs
		if ($last_time_in_lead_player = 0)
			Change structurename = player1_status time_in_lead = ($player1_status.time_in_lead + <time> - $last_time_in_lead)
		elseif ($last_time_in_lead_player = 1)
			Change structurename = player2_status time_in_lead = ($player2_status.time_in_lead + <time> - $last_time_in_lead)
		endif
		Change \{last_time_in_lead_player = -1}
	endif
	if ($game_mode = p2_battle)
		if NOT (<battle_win> = 1)
			Change \{save_current_powerups_p1 = $current_powerups_p1}
			Change \{save_current_powerups_p2 = $current_powerups_p2}
			Change structurename = player1_status save_num_powerups = ($player1_status.current_num_powerups)
			Change structurename = player2_status save_num_powerups = ($player2_status.current_num_powerups)
			p1_health = ($player1_status.current_health)
			p2_health = ($player2_status.current_health)
			Change structurename = player1_status save_health = <p1_health>
			Change structurename = player2_status save_health = <p2_health>
			battlemode_killspawnedscripts
			if ScreenElementExists \{id = battlemode_container}
				DestroyScreenElement \{id = battlemode_container}
			endif
			Change \{battle_do_or_die = 1}
			Change battle_do_or_die_speed_scale = ($battle_do_or_die_speed_scale + $battle_do_or_die_speed_scale_increase)
			if ($battle_do_or_die_speed_scale < $hyperspeed_fastest)
				Change \{battle_do_or_die_speed_scale = $hyperspeed_fastest}
			endif
			Change battle_do_or_die_attack_scale = ($battle_do_or_die_attack_scale + $battle_do_or_die_attack_scale_increase)
			if ($battle_do_or_die_attack_scale > $battle_do_or_die_attack_scale_max)
				Change \{battle_do_or_die_attack_scale = $battle_do_or_die_attack_scale_max}
			endif
		else
			battlemode_killspawnedscripts
			Change \{battle_do_or_die = 0}
			Change \{battle_do_or_die_speed_scale = 1.0}
			Change \{battle_do_or_die_attack_scale = 1.0}
		endif
	endif
	KillSpawnedScript \{Name = guitar_jam_playback_recording}
	KillSpawnedScript \{Name = guitar_jam_drum_playback}
	KillSpawnedScript \{Name = jam_input_whammy_spawned}
	jam_stop_all_samples
	jam_deinit_reverb
	KillSpawnedScript \{Name = GuitarEvent_SongFailed_Spawned}
	if NOT ScriptIsRunning \{GuitarEvent_SongWon_Spawned}
		SpawnScriptNow GuitarEvent_SongWon_Spawned params = {0xc3fdcba8 = <0x87dbf57a>}
	endif
	do_gh3_unpause
endscript

script 0xeb1416d8 
endscript

script GuitarEvent_SongWon_Spawned \{0xc3fdcba8 = -1}
	if ($is_attract_mode = 1)
		ui_event \{event = menu_back}
		return
	endif
	if ($autotest_on = 1 && $autotest_turbo_mode = 1)
		setslomo \{10.0}
	endif
	if NOT ($game_mode = p2_battle)
	endif
	Change track_last_song = ($current_song)
	Change \{calibrate_lag_failed_num = 0}
	Change \{last_song_failed = None}
	Change \{current_song_failed_num = 0}
	if ($game_mode = training)
		return
	elseif ($game_mode = tutorial)
		return
	endif
	Progression_EndCredits_Done
	PauseGame
	disable_pause
	ui_event_wait_for_safe
	ui_event_get_top
	if NOT (<base_name> = 'gameplay')
		ui_event_block \{event = menu_back
			data = {
				state = Uistate_gameplay
			}}
	endif
	if ($battle_do_or_die = 0)
		if ($game_mode = p1_career || $game_mode = p2_career || $game_mode = p2_coop || $game_mode = p1_quickplay || $game_mode = p2_quickplay || $game_mode = p3_career || $game_mode = p4_career || $game_mode = p3_quickplay || $game_mode = p4_quickplay)
			SpawnScriptNow \{cheer_before_explosion}
		endif
	endif

	Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $current_crowd_looping_bg_area_good}
	crowd_surge_and_sustain_at_end_of_song
	SpawnScriptNow \{You_Rock_Waiting_Crowd_SFX}
	tie = FALSE
	if ($battle_do_or_die = 1)
		SoundEvent \{event = do_or_die_sfx}
		winner_text = qs(0xd29a9f4b)
		winner_space_between = (65.0, 0.0)
		winner_scale = 1.8
	else
		if ($game_mode = p2_battle)
			p1_health = ($player1_status.current_health)
			p2_health = ($player2_status.current_health)
			if (<p2_health> > <p1_health>)
				winner = qs(0xcdaffbf0)
			else
				winner = qs(0x7340f937)
			endif
			formatText TextName = winner_text qs(0x2a5dfa92) s = <winner>
			if (<p2_health> = <p1_health>)
				winner_text = qs(0x43b33be2)
			endif
			winner_space_between = (50.0, 0.0)
			winner_scale = 1.5
		elseif ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff)
			p1_score = ($player1_status.score)
			p2_score = ($player2_status.score)
			if (<p2_score> > <p1_score>)
				winner = qs(0xcdaffbf0)
			elseif (<p1_score> > <p2_score>)
				winner = qs(0x7340f937)
			else
				<tie> = true
			endif
			if (<tie> = true)
				winner_text = qs(0x43b33be2)
				winner_space_between = (15.0, 0.0)
				winner_scale = 0.5
				fit_dims = (100.0, 0.0)
			else
				formatText TextName = winner_text qs(0x2a5dfa92) s = <winner>
				winner_space_between = (50.0, 0.0)
				winner_scale = 1.5
			endif
		else
			winner_text = qs(0x6f6d143d)
			winner_space_between = (45.0, 0.0)
			fit_dims = (350.0, 0.0)
			winner_scale = 1.0
		endif
	endif
	SpawnScriptNow \{waitandkillhighway}
	KillSpawnedScript \{Name = jiggle_text_array_elements}
	create_yourock text = <winner_text>
	SpawnScriptNow \{you_rock_sfx_end}
	SpawnScriptNow \{kill_gem_scroller
		params = {
			Type = outro
			kill_cameracuts_iterator
		}}
	Change \{old_song = None}

	if ($battle_do_or_die = 0)
		Progression_SongWon
		if ($current_transition = preencore)
			end_song
			UnPauseGame
			Transition_Play Type = preencore time_offset = <0xc3fdcba8>
			Transition_Wait
			Change \{current_transition = None}
			PauseGame
			ui_event_get_top
			if (<base_name> = 'controller_disconnect' || <base_name> = 'pausemenu_quit_warning')
				ui_event \{event = menu_replace
					data = {
						state = uistate_song_breakdown
						for_encore = 1
						no_sound
					}}
			else
				generic_event_choose \{no_sound
					state = uistate_song_breakdown
					data = {
						for_encore = 1
					}}
			endif
			ENCORE_TRANSITION = 1
		elseif ($current_transition = preboss)
			end_song
			UnPauseGame \{Type = songlost}
			Transition_Play Type = preboss time_offset = <0xc3fdcba8>
			Transition_Wait
			Change \{current_transition = None}
			PauseGame
			Change \{use_last_player_scores = 1}
			Change old_song = ($current_song)
			Change \{show_boss_helper_screen = 1}
			Change \{net_ready_to_start = 0}
			SpawnScriptNow \{start_boss}
			generic_event_back \{nosound
				state = Uistate_gameplay}
			return
		else
			UnPauseGame Type = songlost time_offset = <0xc3fdcba8>
			if ($end_credits = 1 && $current_level = load_z_quebec)
				Transition_Play Type = finalbandoutro time_offset = <0xc3fdcba8>
			else
				if ($is_network_game = 0)
					Transition_Play Type = songwon time_offset = <0xc3fdcba8>
				else
					if ($game_mode = p4_pro_faceoff || $game_mode = p8_pro_faceoff)
						opponent_score = ($band2_status.score)
						our_score = ($band1_status.score)
						if (<opponent_score> > <our_score>)
							Transition_Play Type = songlost time_offset = <0xc3fdcba8>
						else
							Transition_Play Type = songwon time_offset = <0xc3fdcba8>
						endif
					else
						Transition_Play Type = songwon time_offset = <0xc3fdcba8>
					endif
				endif
			endif
			Transition_Wait
			Change \{current_transition = None}
			PauseGame
		endif
	else
		UnPauseGame
		Transition_Play Type = songwon time_offset = <0xc3fdcba8>
		KillSpawnedScript \{Name = do_or_die_helper_text}
		if ScreenElementExists \{id = do_or_die_helper_container}
			DestroyScreenElement \{id = do_or_die_helper_container}
		endif
		SpawnScriptNow \{do_or_die_helper_text
			params = {
				parent_id = yourock_text
			}}
		Wait \{0.1
			Seconds}
		SpawnScriptNow \{waitandkillhighway}
		Wait \{6
			Seconds}
		Change \{current_transition = None}
		PauseGame
	endif
	if ($battle_do_or_die = 1)

		KillSpawnedScript \{Name = create_exploding_text}
		destroy_exploding_text \{parent = 'you_rock_physics'}
		if ScreenElementExists \{id = You_Rock}
			DestroyScreenElement \{id = You_Rock}
		endif
		if ($is_network_game)
			if NOT (ScriptIsRunning sysnotify_handle_connection_loss)
				generic_event_choose \{state = uistate_play_song}
			endif
		else
			SpawnScriptNow \{fail_song_menu_select_retry_song
				params = {
					do_or_die = 1
				}}
		endif
		KillSpawnedScript \{Name = create_exploding_text}
		destroy_exploding_text \{parent = 'you_rock_physics'}
	else
		KillSpawnedScript \{Name = create_exploding_text}
		destroy_all_exploding_text
		if ($autotest_on = 1)
			ui_event \{event = menu_change
				data = {
					state = uistate_autotest_next_test
				}}
		endif
		if NOT GotParam \{ENCORE_TRANSITION}
			if ($progression_beat_game_last_song = 1)
				ui_event \{event = menu_change
					data = {
						state = uistate_beat_game
					}}
			else
				loading_transition = 0
				gamemode_gettype
				if (<Type> = career)
					stats_song_checksum = ($current_song)
					if progression_set_new_song_in_gig_list
						loading_transition = 1
					endif
				elseif (<Type> = quickplay)
					stats_song_checksum = ($current_song)
					if quickplay_set_new_song_in_gig_list
						loading_transition = 1
						if ($current_song = jamsession && $track_last_song = jamsession)
							loading_transition = 0
						endif
					endif
				endif
				if (<loading_transition> = 1)
					Change \{gameplay_loading_transition = 1}
					Change \{gameplay_restart_song = 1}
					Change \{net_ready_to_start = 0}
					if (<Type> = quickplay)
						hide_glitch \{num_frames = 10}
					endif
					generic_event_back \{nosound
						state = Uistate_gameplay}
				else
					if ($is_network_game = 1 && <Type> != career)
						UnPauseGame
						ui_event_get_top
						if (<base_name> = 'controller_disconnect' || <base_name> = 'pausemenu_quit_warning')
							ui_event \{event = menu_replace
								data = {
									state = uistate_online_post_game_lobby
								}}
						else
							ui_event \{event = menu_change
								data = {
									state = uistate_online_post_game_lobby
								}}
						endif
					else
						ui_event_get_top
						if (<base_name> = 'controller_disconnect' || <base_name> = 'pausemenu_quit_warning')
							ui_event \{event = menu_replace
								data = {
									state = uistate_song_breakdown
									gig_complete = 1
								}}
						else
							ui_event \{event = menu_change
								data = {
									state = uistate_song_breakdown
									gig_complete = 1
								}}
						endif
					endif
				endif
			endif
		endif
	endif
	if ScreenElementExists \{id = wings_yourock}
		DestroyScreenElement \{id = wings_yourock}
	endif
endscript

script kill_you_rock_movie 
	KillMovie \{textureSlot = 1}
endscript

script do_or_die_helper_text 
	Wait \{1
		Seconds}
	CreateScreenElement \{Type = ContainerElement
		id = do_or_die_helper_container
		parent = root_window
		Pos = (0.0, 0.0)}
	formatText \{checksumName = text_checksum
		'do_or_die_helper'}
	percent = ((((1.0 - $battle_do_or_die_speed_scale) * 100.0) * ($battle_do_or_die_speed_scale_percent / ((0.0 - $battle_do_or_die_speed_scale_increase) * 100.0))) + 100.0)
	percent = (<percent> + 0.5)
	CastToInteger \{percent}
	formatText TextName = text qs(0xeb050f05) d = <percent>
	CreateScreenElement {
		Type = TextElement
		id = <text_checksum>
		parent = do_or_die_helper_container
		Pos = (640.0, 650.0)
		text = <text>
		font = fontgrid_bordello
		Scale = 0.8
		rgba = [255 255 255 255]
		just = [center bottom]
		z_priority = 0
		Shadow
		shadow_rgba = [30 30 30 255]
		shadow_offs = (3.0, 3.0)
	}
	formatText \{checksumName = text_checksum2
		'do_or_die_helper2'}
	percent = ($battle_do_or_die_attack_scale * 100.0)
	CastToInteger \{percent}
	formatText TextName = text qs(0x4dbb2c86) d = <percent>
	CreateScreenElement {
		Type = TextElement
		id = <text_checksum2>
		parent = do_or_die_helper_container
		Pos = (640.0, 695.0)
		text = <text>
		font = fontgrid_bordello
		Scale = 0.8
		rgba = [255 255 255 255]
		just = [center bottom]
		z_priority = 0
		Shadow
		shadow_rgba = [30 30 30 255]
		shadow_offs = (3.0, 3.0)
	}
	Wait \{5
		Seconds}
	legacydoscreenelementmorph {
		id = <text_checksum>
		alpha = 0
		time = 1
	}
	legacydoscreenelementmorph {
		id = <text_checksum2>
		alpha = 0
		time = 1
	}
endscript

script Boss_Unlocked_Text 
	CreateScreenElement \{Type = ContainerElement
		id = boss_unlocked_text_container
		parent = root_window
		Pos = (0.0, 0.0)}
	if ($current_song = bosstom)
		formatText \{TextName = boss
			qs(0x99bce787)}
		Pos = (634.0, 580.0)
	elseif ($current_song = bossslash)
		Pos = (634.0, 580.0)
		formatText \{TextName = boss
			qs(0xd4b29c64)}
	elseif ($current_song = bossdevil)
		Pos = (800.0, 580.0)
		formatText \{TextName = boss
			qs(0x88f8861c)}
	endif
	formatText \{TextName = unlocked
		qs(0xcdb78f2b)}
	formatText \{TextName = visit_store
		qs(0xb1aaa21c)}
	formatText TextName = text qs(0xa7492276) s = <boss> b = <unlocked> v = <visit_store>
	formatText \{checksumName = boss_unlocked
		'boss_unlocked'}
	if ScreenElementExists id = <boss_unlocked>
		DestroyScreenElement id = <boss_unlocked>
	endif
	CreateScreenElement {
		Type = TextElement
		id = <boss_unlocked>
		parent = boss_unlocked_text_container
		Pos = <Pos>
		text = <text>
		font = fontgrid_denim_title
		Scale = 0.8
		rgba = [255 255 255 255]
		just = [center bottom]
		z_priority = 500
		Shadow
		shadow_offs = (1.0, 1.0)
		shadow_rgba = [0 0 0 255]
	}
	Wait \{3
		Seconds}
	if ScreenElementExists id = <boss_unlocked>
		legacydoscreenelementmorph {
			id = <boss_unlocked>
			alpha = 0
			time = 1
		}
	endif
endscript
g_you_rock_movie = None

script create_you_rock_effect \{player_status = player1_status}

	switch ($g_you_rock_movie)
		case player1_wins
		case player2_wins
		case fret_flames
		case 0xeed48f7d
		case 0x9baf39b8
		case golden_guitar
		default
	endswitch
endscript

script wait_and_play_you_rock_movie 
	create_you_rock_effect
endscript

script waitandkillhighway 
	Wait \{0.5
		Seconds}
	disable_bg_viewport
endscript
current_song_time = -1
time_to_next_beat = -1
next_beat_time = -1
time_to_next_beat2 = -1
next_beat_time2 = -1
tempo_iterator_offset = 0
time_offset = 0

script tempo_matching_iterator 

	Change time_offset = <time_offset>
	band_enabletempoiterator
endscript
measure_callback = nullscript
beat_callback = nullscript

script setmeasurecallback 
	if GotParam \{callback}
		Change measure_callback = <callback>
	else
	endif
endscript

script clearmeasurecallbacks 
	Change \{measure_callback = nullscript}
endscript

script setbeatcallback 
	if GotParam \{callback}
		Change beat_callback = <callback>
	else
	endif
endscript

script gettimetonextbeat 
	GetSongTimeMs \{time_offset = $tempo_iterator_offset}
	return time_to_next_beat = ($next_beat_time - <time>)
endscript

script clearbeatcallbacks 
	Change \{beat_callback = nullscript}
endscript

script spawn_measure_callbacks 
	SpawnScriptNow \{$measure_callback}
endscript

script spawn_beat_callbacks 
	SpawnScriptNow $beat_callback params = {time_to_next_beat = <time_to_next_beat>}
endscript

script measure_test_script 

endscript

script beat_test_script 

endscript
0x0c3d9dcf = {
	id = Blank
	parent = Blank
	Pos = (0.0, 0.0)
	rot_angle = 0.0
	Type = SpriteElement
	material = sys_Big_Bolt01_sys_Big_Bolt01
	rgba = [
		255
		255
		255
		255
	]
	Scale = $star_power_bolt_scale
	just = [
		center
		bottom
	]
	z_priority = 6
	blend = add
	use_animated_uvs = true
	top_down_v
	frame_length = 0.005
	num_uv_frames = (8.0, 1.0)
}

script GuitarEvent_StarSequenceBonus 
	wait_for_correct_frame Player = ($<player_status>.Player)
	if 0x964e4eb6
		return
	endif
	0x1f1f4e73
	begin
	if 0x2dbc17fa
		break
	endif
	WaitOneGameFrame
	repeat
	0x43a998b4
	0x0f471f0c
	Wait \{$star_power_bolt_time
		Seconds}
	0x1f1f4e73
	begin
	if 0x2dbc17fa
		break
	endif
	WaitOneGameFrame
	repeat
	0x43a998b4
endscript

script destroy_big_bolt 
	gem_count = 0
	GetArraySize \{$gem_colors}
	begin
	<note> = (<gem_array> [(<gem_count> + 1)])
	if (<note> > 0)
		formatText checksumName = Name 'big_bolt%p%e' p = ($<player_status>.text) e = <gem_count> AddToStringLookup = true
		DestroyScreenElement id = <Name>
	endif
	gem_count = (<gem_count> + 1)
	repeat <array_Size>
endscript

script GuitarEvent_Multiplier4xOff 
	SoundEvent \{event = UI_SFX_Lose_Multiplier_4X}
	SoundEvent \{event = Lose_Multiplier_Crowd}
	SpawnScriptNow highway_pulse_multiplier_loss params = {Player = ($<player_status>.Player) player_text = ($<player_status>.text) multiplier = 4}
endscript

script GuitarEvent_Multiplier3xOff 
	SoundEvent \{event = UI_SFX_Lose_Multiplier_3X}
	SpawnScriptNow highway_pulse_multiplier_loss params = {Player = ($<player_status>.Player) player_text = ($<player_status>.text) multiplier = 3}
endscript

script GuitarEvent_Multiplier2xOff 
	SoundEvent \{event = UI_SFX_Lose_Multiplier_2X}
	SpawnScriptNow highway_pulse_multiplier_loss params = {Player = ($<player_status>.Player) player_text = ($<player_status>.text) multiplier = 2}
endscript

script GuitarEvent_KillSong \{loadingtransition = 0}
	GH3_SFX_Stop_Sounds_For_KillSong <...> loading_transition = <loading_transition>
endscript

script GuitarEvent_EnterVenue 
	GetPakManCurrentName \{map = zones}
	formatText checksumName = echo_params 'Echo_Crowd_Buss_%s' s = <pakname>
	formatText checksumName = reverb_params 'Reverb_Crowd_Buss_%s' s = <pakname>
	if NOT GlobalExists Name = <echo_params>
		echo_params = Echo_Crowd_Buss_Default
	endif
	if NOT GlobalExists Name = <reverb_params>
		reverb_params = Reverb_Crowd_Buss_Default
	endif
	setsoundbusseffects effects = [{$<echo_params>}]
	setsoundbusseffects effects = [{$<reverb_params>}]
endscript

script GuitarEvent_ExitVenue 
	setsoundbusseffects \{effects = [
			{
				$Echo_Crowd_Buss
			}
		]}
	setsoundbusseffects \{effects = [
			{
				$Reverb_Crowd_Buss
			}
		]}
endscript

script GuitarEvent_GemStarPowerOn 
endscript

script GuitarEvent_BattleAttackFinished 
	GH3_Battle_Attack_Finished_SFX <...>
endscript

script GuitarEvent_TransitionIntro 
endscript

script GuitarEvent_TransitionFastIntro 
endscript

script GuitarEvent_TransitionPreEncore 
endscript

script GuitarEvent_TransitionEncore 
endscript

script GuitarEvent_TransitionPreBoss 
endscript

script GuitarEvent_TransitionBoss 
endscript

script kick_fade_effect 
	Obj_GetID
	<objID> :se_setprops alpha = 0 time = <t2> anim = fast_out rgba = [200 , 70 , 255 , 255]
	<objID> :se_waitprops
	DestroyScreenElement id = <objID>
endscript

script kick_grow_effect 
	Obj_GetID
	<objID> :se_setprops Scale = <Scale> time = 0.25 anim = fast_out
endscript
kick_index = 0
kick_fx_index = 0
kick_fx_scale = 1.0
kick_fx_scale_3p = 1.2
kick_fx_scale_end = (1.25, 0.0)

script guitarevent_kick_drum_hit_note \{Player = 1}
	formatText checksumName = container_id 'gem_container%p' p = <player_text> AddToStringLookup = true
	Change kick_index = ($kick_index + 1)
	if ($kick_index > 1024)
		Change \{kick_index = 0}
	endif
	<highway_info> = ($highway_pos_table [<Player> -1])
	if (<highway_info>.nowbar_scale_x < 1.3)
		<x_scale> = (<highway_info>.nowbar_scale_x * ($kick_fx_scale_3p))
	else
		<x_scale> = (<highway_info>.nowbar_scale_x * ($kick_fx_scale))
	endif
	<particle_pos> = (640.0, 640.0)
	formatText checksumName = fx_id 'kick_fx_%p_i%d' p = <Player> d = ($kick_fx_index)
	DestroyScreenElement id = <fx_id>
	CreateScreenElement {
		Type = ContainerElement
		id = <fx_id>
		parent = <container_id>
		Pos = <particle_pos>
		z_priority = 8.0
		just = [center center]
		pos_anchor = [center center]
		alpha = 1.0
	}
	CreateScreenElement {
		Type = ContainerElement
		local_id = grow_container
		parent = <fx_id>
		Pos = (0.0, 0.0)
		just = [center center]
		pos_anchor = [center center]
	}
	<grow_id> = <id>
	<start_scale> = (<x_scale> * (1.0, 0.0) + (0.0, 1.0))
	<end_scale> = (<x_scale> * ($kick_fx_scale_end) + (0.0, 2.5))
	CreateScreenElement {
		Type = SpriteElement
		local_id = top_wave
		Pos = (0.0, 0.0)
		texture = 0x06c143ed
		parent = <grow_id>
		rgba = [255 255 255 255]
		blend = add
		Scale = <start_scale>
		alpha = 1.0
	}
	RunScriptOnScreenElement id = <fx_id> kick_fade_effect params = {t1 = 0.15 t2 = 0.25}
	RunScriptOnScreenElement id = <grow_id> kick_grow_effect params = {Scale = <end_scale>}
	Change kick_fx_index = (($kick_fx_index) + 1)
	if (($kick_fx_index) = 10)
		Change \{kick_fx_index = 0}
	endif
endscript

script guitarevent_hit_open_note 
	guitarevent_kick_drum_hit_note Player = <Player> player_text = <player_text>
endscript

script guitarevent_hit_easy_rhythm_note 
	guitarevent_kick_drum_hit_note player_text = <player_text>
endscript

script playersetvolume 
	if GotParam \{Volume}
		if (($<player_status>.part) = drum)
			if GotParam \{drum}
				switch <drum>
					case 1
					Change structurename = <player_status> drum_volume1 = <Volume>
					case 2
					Change structurename = <player_status> drum_volume2 = <Volume>
					case 3
					Change structurename = <player_status> drum_volume3 = <Volume>
					case 4
					Change structurename = <player_status> drum_volume4 = <Volume>
				endswitch
				return
			endif
		endif
		Change structurename = <player_status> guitar_volume = <Volume>
	endif
endscript

script playergetvolume 
	if (($<player_status>.part) = drum)
		if GotParam \{drum}
			switch <drum>
				case 1
				return Volume = ($<player_status>.drum_volume1)
				case 2
				return Volume = ($<player_status>.drum_volume2)
				case 3
				return Volume = ($<player_status>.drum_volume3)
				case 4
				return Volume = ($<player_status>.drum_volume4)
			endswitch
		endif
	endif
	return Volume = ($<player_status>.guitar_volume)
endscript

script create_yourock \{text = qs(0x6f6d143d)}
	if ScreenElementExists \{id = wings_yourock}
		DestroyScreenElement \{id = wings_yourock}
	endif
	if ScreenElementExists \{id = yourock}
		DestroyScreenElement \{id = yourock}
	endif
	CreateScreenElement \{parent = root_window
		id = yourock
		Type = descinterface
		desc = 'you_rock'
		z_priority = 475
		Pos = (0.0, 0.0)
		pos_anchor = [
			center
			center
		]
		just = [
			center
			center
		]}
	yourock :Obj_SpawnScriptNow anim_yourock params = {text = <text>}
endscript

script destroy_yourock 
	if ScriptIsRunning \{anim_yourock}
		KillSpawnedScript \{Name = anim_yourock}
	endif
	if ScreenElementExists \{id = wings_yourock}
		DestroyScreenElement \{id = wings_yourock}
	endif
	if ScreenElementExists \{id = yourock}
		DestroyScreenElement \{id = yourock}
	endif
	if ScriptIsRunning \{anim_yourock}
		KillSpawnedScript \{Name = anim_yourock}
	endif
endscript

script bx_yourock_lightning 
	if ($game_mode = tutorial || $game_mode = training)
		return
	endif
	Obj_SpawnScriptNow \{bx_yourock_shake}
	handofgod_fx_01
endscript

script bx_yourock_shake 
	Wait \{0.35000002
		Second}
	begin
	newpos = (((1.0, 0.0) * RandomInteger (-12.0, 12.0)) + ((0.0, 1.0) * RandomInteger (-12.0, 12.0)))
	se_setprops {
		rot_angle = RandomInteger (-2.0, 2.0)
		Pos = <newpos>
	}
	Wait \{2
		gameframe}
	repeat
endscript

script bx_yourock_flash 
	SpawnScriptNow \{handofgod_electriccenter_flare_02}
	if ScriptIsRunning \{bx_yourock_shake}
		KillSpawnedScript \{Name = bx_yourock_shake}
	endif
	Wait \{0.3
		Second}
	bx_yourock_batscript {angle_start = 0 angle_end = (Random (@ 270 @ -270 )) motion = ease_in time = 0.5}
endscript

script bx_yourock_batscript 
	se_setprops rot_angle = <angle_start>
	Wait \{1
		gameframe}
	se_setprops rot_angle = <angle_end> motion = <motion> time = <time>
endscript

script bx_lerpcolor 
	newcolor = [0 0 0 0]
	i = 0
	begin
	val = (((((<p2> [<i>]) - (<p1> [<i>])) * <factor>) / 100) + (<p1> [<i>]))
	SetArrayElement ArrayName = newcolor index = <i> NewValue = <val>
	<i> = (<i> + 1)
	repeat 4
	return newcolor = <newcolor>
endscript

script anim_yourock 
	yourock_text_max_width = 940
	yourock_text_max_height = 250
	yourock :se_setprops {
		wings_yourock_scale = 0
		wings_yourock_alpha = 0
		yourock_text = <text>
	}
	yourock :se_getprops
	currenttextwidth = ((<yourock_dims> [0]) * (<yourock_scale> [0]))
	if (<currenttextwidth> > <yourock_text_max_width>)
		textwidthscale = (<yourock_text_max_width> / (<yourock_dims> [0]))
		yourock :se_setprops {
			yourock_scale = (<textwidthscale> * (1.0, 1.0))
			yourock_line_scale = 0.8
		}
	elseif ((<yourock_dims> [1]) > <yourock_text_max_height>)
		yourock :se_setprops \{yourock_scale = (0.8, 0.8)
			yourock_line_scale = 0.8}
	endif
	fps = 12.0
	original_size = 300
	anim_params = [
		{Scale = 69.3 alpha = 0.0 motion = ease_in blast_factor = 0 time = 0 spawn = bx_yourock_batscript spawn_params = {angle_start = (Random (@ 1440 @ -1440 )) angle_end = 0 motion = ease_out time = 0.6666}}
		{Scale = 413.0 alpha = 0.8 motion = ease_out blast_factor = 0 time = 8}
		{Scale = 420.0 alpha = 1.0 motion = ease_out blast_factor = 0 time = 1}
		{Scale = 374.1 alpha = 1.0 motion = ease_in blast_factor = 0 time = 3 spawn = bx_yourock_lightning}
		{Scale = 384.1 alpha = 1.0 motion = ease_in blast_factor = 0 time = 3}
		{Scale = 364.1 alpha = 1.0 motion = ease_out blast_factor = 0 time = 4}
		{Scale = 375.1 alpha = 1.0 motion = ease_in blast_factor = 0 time = 4}
		{Scale = 358.1 alpha = 1.0 motion = ease_out blast_factor = 12 time = 5}
		{Scale = 388.1 alpha = 1.0 motion = ease_in blast_factor = 24 time = 5}
		{Scale = 345.1 alpha = 1.0 motion = ease_in blast_factor = 64 time = 5}
		{Scale = 700.0 alpha = 0.8 motion = ease_in blast_factor = 100 time = 2 spawn = bx_yourock_flash}
		{Scale = 74.6 alpha = 0.0 motion = ease_out blast_factor = 100 time = 7}
	]
	GetArraySize <anim_params>
	iter = 0
	begin
	if StructureContains structure = (<anim_params> [<iter>]) spawn
		if StructureContains structure = (<anim_params> [<iter>]) spawn_params
			yourock :Obj_SpawnScriptNow ((<anim_params> [<iter>]).spawn) params = ((<anim_params> [<iter>]).spawn_params)
		else
			yourock :Obj_SpawnScriptNow ((<anim_params> [<iter>]).spawn)
		endif
	endif
	bx_lerpcolor p1 = [255 255 255 255] p2 = [210 235 255 255] factor = ((<anim_params> [<iter>]).blast_factor)
	wings_yourock_rgba = <newcolor>
	bx_lerpcolor p1 = [203 151 51 255] p2 = [210 235 255 255] factor = ((<anim_params> [<iter>]).blast_factor)
	yourock_rgba = <newcolor>
	yourock :se_setprops {
		wings_yourock_scale = (((<anim_params> [<iter>]).Scale) / <original_size>)
		wings_yourock_alpha = ((<anim_params> [<iter>]).alpha)
		blastedwings_alpha = (((<anim_params> [<iter>]).blast_factor) / 100.0)
		yourock_rgba = <yourock_rgba>
		wings_yourock_rgba = <wings_yourock_rgba>
		motion = ((<anim_params> [<iter>]).motion)
		time = (((<anim_params> [<iter>]).time) / <fps>)
	}
	Wait (((<anim_params> [<iter>]).time) / <fps>) Second
	<iter> = (<iter> + 1)
	repeat <array_Size>
	Wait \{0.5
		Second}
	yourock :Die
endscript

script hot_start_achieved \{Band = 0
		combo = 0}
	gamemode_gettype
	if (<Type> = training)
		return
	endif
	if ($is_attract_mode = 1)
		return
	endif
	if (<Player> = 1)

		if isSinglePlayerGame
			Pos = (640.0, 211.0)
			<base_scale> = 1.0
			SpawnScriptNow gh_sfx_hotstart_singleplayer params = {combo = <combo>}
		elseif ($game_mode = p2_career || $game_mode = p2_quickplay)
			Pos = (640.0, 170.0)
			<base_scale> = 1.0
			SpawnScriptNow gh_sfx_hotstart_p1 params = {combo = <combo>}
		elseif ($is_network_game && $game_mode = p2_coop)
			Pos = (640.0, 170.0)
			<base_scale> = 1.0
			SpawnScriptNow gh_sfx_hotstart_p1 params = {combo = <combo>}
		else
			<s> = 0.35000002
			Pos = (415.0, 170.0)
			SpawnScriptNow GH_SFX_Note_Streak_P1 params = {combo = <combo>}
		endif
	else

		if ($game_mode = p2_career || $game_mode = p2_quickplay)
			Pos = (640.0, 170.0)
			<base_scale> = 1.0
			SpawnScriptNow GH_SFX_Note_Streak_P2 params = {combo = <combo>}
		elseif ($is_network_game && $game_mode = p2_coop)
			Pos = (640.0, 170.0)
			<base_scale> = 1.0
			SpawnScriptNow GH_SFX_Note_Streak_P2 params = {combo = <combo>}
		else
			<s> = 0.35000002
			Pos = (865.0, 170.0)
			SpawnScriptNow GH_SFX_Note_Streak_P2 params = {combo = <combo>}
		endif
	endif
	if NOT gamemode_isbandscoring
		getplayerinfo <Player> part
		if (<part> = vocals)
			vocals_message_delayed {Player = <Player> text = qs(0x09a07a71) rgba = [255 172 64 255]}
		else
			hud_create_message Player = <Player> text = qs(0x09a07a71)
		endif
	elseif (<Band> = 1)
		if GotParam \{players}
			hud_create_message Band text = qs(0x09a07a71) style_script = hud_message_band_streak_style style_script_params = {players = <players>}
		else
			hud_create_message \{Band
				text = qs(0x09a07a71)
				style_script = hud_message_band_streak_style
				style_script_params = {
					players = [
						1
						1
						1
						1
					]
				}}
		endif
	endif
endscript
