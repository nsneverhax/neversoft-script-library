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

script create_guitar_events 
	printf qs(0xf3da5047) a = <Player>
	GetArraySize \{$guitar_events}
	array_entry = 0
	begin
	event = ($guitar_events [<array_entry>].event)
	Type = ($guitar_events [<array_entry>].Type)
	extendcrcplayer <event> <Player> out = event
	if (<Type> = spawn)
		SetEventHandler response = call_script event = <event> Scr = event_spawner params = {event_spawned = <array_entry>}
	else
		Scr = ($guitar_events [<array_entry>].Scr)
		SetEventHandler response = call_script event = <event> Scr = <Scr>
	endif
	array_entry = (<array_entry> + 1)
	repeat <array_Size>
	Block
endscript
g_valid_script_events = [
	ae_disableautochords
	ae_enableautochords
	band_changefacialanims
	band_clearanimtempo
	band_disableautochords
	band_disableautofret
	band_disableautostrums
	band_enableautochords
	band_enableautofret
	band_enableautostrums
	band_forcealltoidle
	band_hidemic
	band_hidemic_microphone
	band_hidemic_stand
	band_movetonode
	band_playclip
	Band_PlayFacialAnim
	Band_PlayIdle
	band_playloop
	band_playrockinfacialanim
	Band_PlaySimpleAnim
	band_setanimtempo
	band_setikchain
	band_setikchaintarget
	band_showmic
	band_showmic_microphone
	band_showmic_stand
	bandforcealltoidle
	cameracutseffect_fovpulse
	LightShow_SetTime
	setsonghandcamparams
	spit_vocalist_small
	Audio_Sync_Test_Disable_Highway
	Audio_Sync_Test_Enable_Highway
	band_lookat_off
	band_lookat_on
	bandmanager_hideinstrument
	bandmanager_unhideinstrument
	bandmember_sillhouette
	bandmember_sillhouette_turnoffflare
	CameraCuts_ApplyDOF
	change_crowd_state
	crowdspots
	crowdspots_off
	fadeoutandin
	fadetoblack
	lightshow_cinematic_blackout_end
	lightshow_cinematic_blackout_start
	preload_rush_career_vo_stream
	preload_fb_scene_2_stream
	preload_fb_scene_3_stream
	scene_swap
	start_preloaded_rush_career_vo_stream
	testtoneenterscript
	testtonesoundevent
	band_hide
	band_unhide
	bandmanager_setikchainstrength
	z_finalbattle_hw_attack_guitarist
	z_finalbattle_hw_attack_vocalist
	z_finalbattle_hw_attack_drummer
	z_finalbattle_ampzilla_fx_attack_shot
	z_finalbattle_ampzilla_fx_hit_slam
	gh6intro_fx_dg_slide
	gh6intro_fx_dg_groundslam
	gh6intro_fx_dg_hita
	gh6intro_fx_dg_wallslam
	gh6intro_fx_dg_attacka
	gh6intro_fx_ampzilla_extradamage
	gh6intro_fx_dg_attackf
	gh6intro_fx_dg_attackf_cleanup
	gh6intro_fx_cleanup
	gh6intro_fx_dg_attackrush
	gh6intro_fx_ampzilla_grounddust
	gh6intro_fx_dg_attackkick
	gh6intro_fx_dg_attackpunch
	gh6intro_fx_dg_attackkick_cleanup
	z_finalbattle_hw_hita
	z_finalbattle_dg_swordhit
	z_finalbattle_success_part3
	enable_tempo
	disable_tempo
	display_highway
	hide_highway
	dummy_scriptevent
	dummy_function
]

script dummy_scriptevent 
endscript

script event_spawner 
	SpawnScriptNow ($guitar_events [<event_spawned>].Scr) params = {<...>} id = song_event_scripts
endscript

script event_iterator 
	printf qs(0x5fa77966) d = <time_offset> e = <event_string> channel = events
	get_song_prefix song = <song_name>
	formatText checksumName = song '%s_%e' s = <song_prefix> e = <event_string> AddToStringLookup = true
	array_entry = 0
	if NOT songglobalexists Name = <song> Type = array
		if (<event_string> != 'scriptevents')
			ScriptAssert 'Array %s does not exist' s = <song>
		endif
		return
	endif
	getsongarraysize <song>
	if (<array_Size> = 0)
		return
	endif
	checkvalidscriptevents Name = <song> song_name = <song_name>
	GetSongTimeMs time_offset = <time_offset>
	begin
	getsongglobal Name = <song> index = <array_entry>
	if ((<time> - <skipleadin>) < (<element>.time))
		break
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_Size>
	array_Size = (<array_Size> - <array_entry>)
	if (<array_Size> = 0)
		return
	endif
	begin
	getsongglobal Name = <song> index = <array_entry>
	TimeMarkerReached_SetParams time_offset = <time_offset> time = (<element>.time)
	begin
	if TimeMarkerReached
		GetSongTimeMs time_offset = <time_offset>
		break
	endif
	Wait \{1
		gameframe}
	repeat
	TimeMarkerReached_ClearParams
	scriptname = (<element>.Scr)
	if ScriptExists <scriptname>
		SpawnScriptNow <scriptname> params = {time = <time> event_time = (<element>.time) (<element>.params)} id = song_event_scripts
	elseif SymbolIsCFunc <scriptname>
		<scriptname> {time = <time> event_time = (<element>.time) (<element>.params)}
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_Size>
endscript

script scriptevents_iterator 
	<intro_script_events> = unknown
	if ($current_transition = ENCORE)
		get_rocker_transformation_name
		<intro_script_events> = <Name>
	elseif ($current_transition = celebintro)
		get_rocker_intro_name
		<intro_script_events> = <Name>
	elseif ($current_transition = finalbattleintro)
		<current_song> = None
		playlist_getcurrentsong
		get_finalbattle_song_number song = <current_song>
		GetArraySize \{$g_finalbattle_performance_names}
		if (<song_number> > <array_Size>)
			ScriptAssert \{'array g_finalbattle_performance_names does not contain enough songs'}
		else
			intro_script_events = ($g_finalbattle_performance_names [<song_number>])
		endif
	endif
	ExtendCrc <intro_script_events> '_scriptevents' out = intro_script_events
	if GlobalExists Name = <intro_script_events> Type = array
		GetArraySize $<intro_script_events>
		<array_entry> = 0
		begin
		TimeMarkerReached_SetParams time_offset = <time_offset> array = <intro_script_events> array_entry = <array_entry> ArrayOfStructures fixtimerounding
		begin
		if TimeMarkerReached
			GetSongTimeMs time_offset = <time_offset>
			break
		endif
		Wait \{1
			gameframe}
		repeat
		TimeMarkerReached_ClearParams
		scriptname = ($<intro_script_events> [<array_entry>].Scr)
		if ScriptExists <scriptname>
			SpawnScriptNow <scriptname> params = {time = <time> event_time = (($<intro_script_events> [<array_entry>]).time) ($<intro_script_events> [<array_entry>].params) from_scriptevent = 1 intro_event = 1} id = song_event_scripts
		elseif SymbolIsCFunc <scriptname>
			<scriptname> {time = <time> event_time = (($<intro_script_events> [<array_entry>]).time) ($<intro_script_events> [<array_entry>].params) intro_event = 1}
		else
			ScriptAssert \{qs(0x9c0f1457)}
		endif
		<array_entry> = (<array_entry> + 1)
		repeat <array_Size>
	else
	endif
	if ($current_transition = ENCORE)
		return
	endif
	get_song_prefix song = <song_name>
	formatText checksumName = song '%s_scriptevents' s = <song_prefix> AddToStringLookup = true
	array_entry = 0
	if NOT songglobalexists Name = <song> Type = array
		return
	endif
	getsongarraysize <song>
	if (<array_Size> = 0)
		return
	endif
	checkvalidscriptevents Name = <song> song_name = <song_name>
	GetSongTimeMs time_offset = <time_offset>
	if (<time> > 1000)
		begin
		getsongglobal Name = <song> index = <array_entry>
		if ((<time> - <skipleadin>) <= (<element>.time))
			break
		endif
		<array_entry> = (<array_entry> + 1)
		repeat <array_Size>
		array_Size = (<array_Size> - <array_entry>)
	endif
	if (<array_Size> = 0)
		return
	endif
	begin
	getsongglobal Name = <song> index = <array_entry>
	TimeMarkerReached_SetParams time_offset = <time_offset> time = (<element>.time) fixtimerounding
	begin
	if TimeMarkerReached
		GetSongTimeMs time_offset = <time_offset>
		break
	endif
	Wait \{1
		gameframe}
	repeat
	TimeMarkerReached_ClearParams
	scriptname = (<element>.Scr)
	if ScriptExists <scriptname>
		SpawnScriptNow <scriptname> params = {time = <time> event_time = (<element>.time) (<element>.params) from_scriptevent = 1} id = song_event_scripts
	elseif SymbolIsCFunc <scriptname>
		<scriptname> {time = <time> event_time = (<element>.time) (<element>.params)}
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_Size>
endscript
single_stream_enabled = 0

script GuitarEvent_MissedNote \{extended_miss = 0}
	if ($calibrate_lag_enabled = 1)
		SpawnScriptNow \{calibration_highway_miss_note}
	endif
	if (<bum_note> = 1)
		audio_gameplay_guitar_wrong_note_sound_logic <...>
	endif
	getplayerinfo <Player> is_local_client
	getplayerinfo <Player> part
	processevent_note_miss <...>
	if ($is_network_game && <is_local_client> = 0)
		if (<silent_miss> = 1)
		endif
	else
		if NOT (<part> = drum)
			playergetvolume Player = <Player>
			if NOT (<Volume> = 0)
				if (<silent_miss> = 1)
				else
					if NOT (<extended_miss> = 1)
						playersetvolume Player = <Player> Volume = 0
						UpdateGuitarVolume
					endif
				endif
			endif
		endif
		playlist_getcurrentsong
		if (<current_song> = jamsession)
			musicstudio_update_volume_for_playback OFF Player = <Player>
		endif
	endif
	if ($always_strum = FALSE)
		if ($disable_band = 0)
			getplayerinfo <Player> band_member
			if CompositeObjectExists Name = <band_member>
				if (<part> = guitar || <part> = bass)
					bandmanager_missednote Name = <band_member>
				endif
			endif
		endif
	endif
	inputarraygetelement Name = <song> index = <array_entry>
	if ($show_play_log = 1)
		output_log_text qs(0xbfe03a95) t = (<gem_array> [0]) Color = orange
	endif
endscript

script highway_pulse_black 
	<half_time> = ($highway_pulse_time / 2.0)
	extendcrcplayer out = highway highway_2d <Player>
	legacydoscreenelementmorph id = <highway> rgba = ($highway_pulse) time = <half_time>
	Wait <half_time> Seconds
	if playerinfoequals <Player> star_power_used = 1
		legacydoscreenelementmorph id = <highway> rgba = ($highway_starpower) time = <half_time>
	else
		legacydoscreenelementmorph id = <highway> rgba = ($highway_normal) time = <half_time>
	endif
endscript

script GuitarEvent_UnnecessaryNote 
	if ($calibrate_lag_enabled = 1)
		return
	endif
	audio_gameplay_guitar_wrong_note_sound_logic <...>
	getplayerinfo <Player> is_local_client
	if NOT ($is_network_game && (<is_local_client> = 0))
		playersetvolume Player = <Player> Volume = 0
		UpdateGuitarVolume
		musicstudio_update_volume_for_playback OFF Player = <Player> unnecessarynote = 1
	endif
	if ($always_strum = FALSE)
		if ($disable_band = 0)
			getplayerinfo <Player> band_member
			if CompositeObjectExists Name = <band_member>
				getplayerinfo <Player> part
				if (<part> = guitar || <part> = bass)
					LaunchEvent Type = Anim_MissedNote target = (<band_member>)
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
	if ($g_debug_audible_hitnote = 1)
		SoundEvent \{event = audio_debug_hit_note}
	endif
	getplayerinfo <Player> part
	processevent_note_hit <...>
	if ($show_play_log = 1 || $calibrate_lag_enabled = 1)
		get_lag_values
		<off_note> = (0 - (<off_note> - ($time_input_offset - <audio_offset> + <video_offset>)))
		CastToInteger \{off_note}
		if ($calibrate_lag_enabled = 1)
			AddArrayElement array = $calibrate_history_times element = <off_note>
			Change calibrate_history_times = <array>
		endif
		if ($show_play_log = 1)
			inputarraygetelement Name = <song> index = <array_entry>
			note_time = (<gem_array> [0])
			if (<off_note> < 0)
				output_log_text qs(0xddc15e81) n = <off_note> t = <note_time> Color = green
			else
				output_log_text qs(0x257db375) n = <off_note> t = <note_time> Color = darkgreen
			endif
		endif
	endif
	if (<updatevolume> = true)
		playersetvolume Player = <Player> Volume = 100
		UpdateGuitarVolume
		musicstudio_update_volume_for_playback On Player = <Player>
	endif
endscript

script GuitarEvent_HitNote 
	if (($g_debug_highway_visible) = 1)
		if ($highway_displayed = 1)
			SpawnScriptNow GuitarEvent_HitNote_Spawned params = {<...>}
		endif
	endif
endscript

script GuitarEvent_HitNote_Spawned 
	getnowbarscale Player = <Player>
	if ($calibrate_lag_enabled = 1)
		SpawnScriptNow \{calibration_highway_hit_note}
	endif
	if GotParam \{kick}
		guitarevent_kick_drum_hit_note Player = <Player>
	elseif GotParam \{open_note}
		guitarevent_hit_open_note Player = <Player>
	elseif GotParam \{beginner_note}
		guitarevent_hit_beginner_note Player = <Player>
	else
		Wait \{1
			gameframe}
		gamemode_gettype
		if NOT (<Type> = freeplay)
			pos_table = ($highway_pos_table [(<Player> -1)])
			nowbar_scale_ratio = ((<pos_table>.nowbar_scale_x) / 1.6)
			Scale = ((<nowbar_scale_ratio> * (1.5, 0.0)) + (<nowbar_scale_ratio> * (0.0, 0.75)))
		else
			Scale = (1.5, 0.75)
		endif
		if GotParam \{drum_accent}
			drum_accent = 1
		else
			drum_accent = 0
		endif
		star_power_used = 0
		if playerinfoequals Player = <Player> star_power_used = 1
			<star_power_used> = 1
		endif
		NoteFX star = <star_power_used> Name = <fx_id> drum_accent = <drum_accent> Player = <Player> Pos = <Pos> Scale = <Scale>
	endif
endscript

script guitarevent_hitnote_kill_spawned 
	RequireParams \{[
			fx_id
		]
		all}
	Wait \{14
		gameframes}
	if ScreenElementExists id = <fx_id>
		DestroyScreenElement id = <fx_id>
	endif
endscript

script guitarevent_drumfillhit 
	GuitarEvent_HitNote <...>
endscript
hit_particle_params = {
	z_priority = 8.0
	material = sys_Particle_Spark01_sys_Particle_Spark01
	texture = highway_lil_spark
	blend = add
	start_color = [
		255
		128
		64
		200
	]
	end_color = [
		255
		128
		0
		0
	]
	start_scale = (1.0, 1.5)
	end_scale = (0.015, 0.03)
	start_angle_spread = 0.0
	min_rotation = 0.0
	max_rotation = 0.0
	emit_start_radius = 30.0
	emit_radius = 12.0
	Emit_Rate = 0.025
	emit_dir = 0.0
	emit_spread = 40.0
	velocity = 12.0
	friction = (0.0, 100.0)
	time = 0.5
}
star_hit_particle_params = {
	z_priority = 8.0
	material = sys_Particle_Spark01_sys_Particle_Spark01
	texture = highway_lil_spark
	blend = add
	start_color = [
		128
		255
		255
		200
	]
	end_color = [
		128
		255
		255
		0
	]
	start_scale = (1.0, 1.5)
	end_scale = (0.015, 0.03)
	start_angle_spread = 0.0
	min_rotation = 0.0
	max_rotation = 0.0
	emit_start_radius = 30.0
	emit_radius = 12.0
	Emit_Rate = 0.025
	emit_dir = 0.0
	emit_spread = 40.0
	velocity = 12.0
	friction = (0.0, 100.0)
	time = 0.5
}
whammy_particle_params = {
	z_priority = 8.0
	material = sys_Particle_Spark01_sys_Particle_Spark01
	texture = highway_lil_spark
	blend = add
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
	SoundEvent \{event = rb_mineexplode}
	getplayerinfo <Player> controller
	activatestarpowerpulse Player = <controller> num = 1 length = 15 Strength = 15 Priority = 100
	roadie_battle_shake_highway Player = <Player>
	extendcrcplayer gem_container <Player> out = container_id
	DestroyScreenElement id = <mine_fx_id>
	<Pos> = (<Pos> - (0.0, 100.0))
	CreateScreenElement {
		Type = SpriteElement
		id = <mine_fx_id>
		parent = <container_id>
		texture = rb_highway_overloadedgemplayed
		Pos = <Pos>
		just = [center , center]
		pos_anchor = [center , center]
		use_animated_uvs = true
		frame_length = 0.05
		num_uv_frames = (4.0, 4.0)
		blend = add
		Scale = 1.0
		z_priority = 8.0
		top_down_v
		loop_animated_uvs = FALSE
	}
endscript

script GuitarEvent_StarPowerOn 
	KillSpawnedScript \{Name = highway_pulse_black}
	if ($drum_solo_songtime_paused = 0)
		audio_gameplay_star_power_verb_on Player = <Player>
	endif
	StarPowerOn Player = <Player>
	gamemode_gettype
	<enable_starpower_lightshow> = 1
	if (<Type> = career)
		current_zone = (($LevelZones.$current_level).zone)
		if quest_progression_check_domination_unlocked savegame = ($primary_controller)
			<enable_starpower_lightshow> = 0
		elseif (<current_zone> = z_modular)
			<enable_starpower_lightshow> = 0
		endif
	endif
	if (<enable_starpower_lightshow> = 1)
		LightShow_SetParams \{mood = starpower}
		Change \{lightshow_allow_mood_changes = FALSE}
	endif
endscript

script GuitarEvent_StarPowerOff \{no_sound = FALSE}
	KillSpawnedScript \{Name = highway_pulse_black}
	if (<no_sound> = FALSE)
		if isps3
			if NOT ($current_song = jamsession)
				if isSinglePlayerGame
					SoundEvent \{event = audio_star_power_release_front}
				else
					SpawnScriptNow audio_gameplay_star_power_release_logic params = {Player = <Player>}
				endif
			endif
		else
			if isSinglePlayerGame
				SoundEvent \{event = audio_star_power_release_front}
			else
				SpawnScriptNow audio_gameplay_star_power_release_logic params = {Player = <Player>}
			endif
		endif
	endif
	audio_gameplay_star_power_verb_off Player = <Player>
	SpawnScriptLater Kill_StarPower_StageFX params = {<...>}
	formatText checksumName = cont 'starpower_container_leftp%p' p = <Player> AddToStringLookup = true
	if ScreenElementExists id = <cont>
		legacydoscreenelementmorph id = <cont> alpha = 0
	endif
	formatText checksumName = cont 'starpower_container_rightp%p' p = <Player> AddToStringLookup = true
	if ScreenElementExists id = <cont>
		legacydoscreenelementmorph id = <cont> alpha = 0
	endif
	formatText checksumName = highway 'Highway_2Dp%p' p = <Player> AddToStringLookup = true
	if ScreenElementExists id = <highway>
		SetScreenElementProps id = <highway> rgba = ($highway_normal)
	endif
	SpawnScriptNow \{Kill_StarPower_Camera}
	Change \{lightshow_allow_mood_changes = true}
	if ($lightshow_last_mood_requested != None)
		LightShow_SetParams \{mood = $lightshow_last_mood_requested}
	endif
endscript

script GuitarEvent_PreFretbar 
	SpawnScriptNow \{updatevocalecho}
	SpawnScriptNow \{gh_audible_metronome}
	waitTime = 0.25
	Wait <waitTime> Seconds
	getplayerinfo \{1
		star_power_used
		out = star_power_used1}
	getplayerinfo \{2
		star_power_used
		out = star_power_used2}
	getplayerinfo \{3
		star_power_used
		out = star_power_used3}
	getplayerinfo \{4
		star_power_used
		out = star_power_used4}
	getplayerinfo \{1
		star_power_usable
		out = star_power_usable1}
	getplayerinfo \{2
		star_power_usable
		out = star_power_usable2}
	getplayerinfo \{3
		star_power_usable
		out = star_power_usable3}
	getplayerinfo \{4
		star_power_usable
		out = star_power_usable4}
	getplayerinfo \{1
		part
		out = part1}
	getplayerinfo \{2
		part
		out = part2}
	getplayerinfo \{3
		part
		out = part3}
	getplayerinfo \{4
		part
		out = part4}
	if ((<star_power_usable1> != 0) && (<star_power_used1> = 1) && ((<part1> = bass) || (<part1> = guitar)))
		getplayerinfo \{1
			controller}
		activatestarpowerpulse Player = (<controller>) num = 1 length = 10 Strength = 11 Priority = 1
	endif
	if ((<star_power_usable2> != 0) && (<star_power_used2> = 1) && ((<part2> = bass) || (<part2> = guitar)))
		getplayerinfo \{2
			controller}
		activatestarpowerpulse Player = (<controller>) num = 1 length = 10 Strength = 11 Priority = 1
	endif
	if ((<star_power_usable3> != 0) && (<star_power_used3> = 1) && ((<part3> = bass) || (<part3> = guitar)))
		getplayerinfo \{3
			controller}
		activatestarpowerpulse Player = (<controller>) num = 1 length = 10 Strength = 11 Priority = 1
	endif
	if ((<star_power_usable4> != 0) && (<star_power_used4> = 1) && ((<part4> = bass) || (<part4> = guitar)))
		getplayerinfo \{4
			controller}
		activatestarpowerpulse Player = (<controller>) num = 1 length = 10 Strength = 11 Priority = 1
	endif
	if ((<star_power_used1> = 1) || (<star_power_used2> = 1) || (<star_power_used3> = 1) || (<star_power_used4> = 1))
		GetPakManCurrentName \{map = zones}
		if NOT ((<pakname> = 'z_mansionstudio') || (<pakname> = 'z_modular') || (<pakname> = 'z_credits') || (<pakname> = 'z_visualizer') || (<pakname> = 'z_finalbattle') || (<pakname> = 'z_cube'))
			if ($g_clap_fade = 1)
				printf \{channel = sfx
					qs(0x784a1ce5)}
				Change \{g_clap_fade = 0}
				SpawnScriptNow \{audio_crowd_kill_clap_fade}
			endif
			if ($game_mode != tutorial)
				if (($g_star_clap_normal = 1) || ($g_star_clap_leftcenterright = 1))
					printf \{qs(0xfe00cc6d)}
					SoundEvent \{event = $g_current_crowd_clap_normal_soundevent}
				elseif ($g_star_clap_middle = 1)
					printf \{qs(0x3af3642a)}
					SoundEvent \{event = $g_current_crowd_clap_middle_soundevent}
				elseif ($g_star_clap_left = 1)
					printf \{qs(0x4ac89455)}
					SoundEvent \{event = $g_current_crowd_clap_left_soundevent}
				elseif ($g_star_clap_right = 1)
					printf \{qs(0x8bfb9430)}
					SoundEvent \{event = $g_current_crowd_clap_right_soundevent}
				elseif ($g_star_clap_right_middle = 1)
					printf \{qs(0xbc1479cf)}
					SoundEvent \{event = $g_current_crowd_clap_right_middle_soundevent}
				elseif ($g_star_clap_left_middle = 1)
					printf \{qs(0x492c71b5)}
					SoundEvent \{event = $g_current_crowd_clap_left_middle_soundevent}
				endif
			endif
		elseif ($g_clap_fade = 1)
			printf \{channel = sfx
				qs(0x32a4d147)}
			if ($g_star_clap_normal = 1)
				printf \{qs(0xfe00cc6d)}
				SoundEvent \{event = $g_current_crowd_clap_normal_soundevent}
			elseif ($g_star_clap_middle = 1)
				printf \{qs(0x3af3642a)}
				SoundEvent \{event = $g_current_crowd_clap_middle_soundevent}
			elseif ($g_star_clap_left = 1)
				printf \{qs(0x4ac89455)}
				SoundEvent \{event = $g_current_crowd_clap_left_soundevent}
			elseif ($g_star_clap_right = 1)
				printf \{qs(0xc4a697e0)}
				SoundEvent \{event = $g_current_crowd_clap_right_soundevent}
			elseif ($g_star_clap_right_middle = 1)
				printf \{qs(0xbc1479cf)}
				SoundEvent \{event = $g_current_crowd_clap_right_middle_soundevent}
			elseif ($g_star_clap_left_middle = 1)
				printf \{qs(0x492c71b5)}
				SoundEvent \{event = $g_current_crowd_clap_left_middle_soundevent}
			endif
		else
			if ($g_crowd_listener_state_clap_on_1234 = 1)
				if ($g_star_clap_normal = 1)
					printf \{qs(0xfe00cc6d)}
					SoundEvent \{event = $g_current_crowd_clap_normal_soundevent}
				elseif ($g_star_clap_middle = 1)
					printf \{qs(0x3af3642a)}
					SoundEvent \{event = $g_current_crowd_clap_middle_soundevent}
				elseif ($g_star_clap_left = 1)
					printf \{qs(0x4ac89455)}
					SoundEvent \{event = $g_current_crowd_clap_left_soundevent}
				elseif ($g_star_clap_right = 1)
					printf \{qs(0xc4a697e0)}
					SoundEvent \{event = $g_current_crowd_clap_right_soundevent}
				elseif ($g_star_clap_right_middle = 1)
					printf \{qs(0xbc1479cf)}
					SoundEvent \{event = $g_current_crowd_clap_right_middle_soundevent}
				elseif ($g_star_clap_left_middle = 1)
					printf \{qs(0x492c71b5)}
					SoundEvent \{event = $g_current_crowd_clap_left_middle_soundevent}
				endif
			endif
		endif
	endif
	SpawnScriptNow \{audio_crowd_anticipation_logic}
endscript

script gh_audible_metronome 
	if ($g_debug_audible_metronome = 1)
		Wait ((0.25 + (($default_lag_settings.Xenon.input_lag_ms) * 0.001)) - 0.008333) Seconds
		SoundEvent \{event = audio_calibrate_beat_sfx}
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
	getplayerinfo <Player> check_time_early
	getplayerinfo <Player> check_time_late
	Duration = (<check_time_early> + <check_time_late>)
	begin
	getplayerinfo <Player> controller
	GetHeldPattern controller = <controller> Player = <Player>
	if (<strum> = <hold_pattern>)
		playersetvolume Player = <Player> Volume = 100
		UpdateGuitarVolume
		musicstudio_update_volume_for_playback On Player = <Player>
	endif
	Wait \{1
		gameframe}
	GetSongTime
	if ((<songtime> - <starttime>) >= <Duration>)
		break
	endif
	repeat
endscript

script GuitarEvent_FirstNote_Window_Open 
	getplayerinfo <Player> controller
	if IsGuitarController controller = <controller>
		GetStrumPattern entry = 0 song = <song>
		SpawnScriptNow check_first_note_formed params = {strum = <strum> Player = <Player>}
	else
		playersetvolume Player = <Player> Volume = 100
		UpdateGuitarVolume
		musicstudio_update_volume_for_playback On Player = <Player>
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
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		WhammyFXOffAll Player = <Player>
		getnextplayer on_screen Player = <Player>
		repeat <num_players_shown>
	endif
endscript

script GuitarEvent_WhammyOn 
	getplayerinfo <Player> part
	open_note_pattern = 1048576
	if (<part> = bass && <pattern> = <open_note_pattern>)
		guitarevent_open_note_sustain Player = <Player>
	elseif (($g_debug_highway_visible) = 1)
		WhammyFXOn <...>
	endif
endscript

script GuitarEvent_WhammyOff 
	getplayerinfo <Player> part
	open_note_pattern = 1048576
	if (<part> = bass && <pattern> = <open_note_pattern>)
		cleanup_open_note_sustain_fx Player = <Player>
	endif
	WhammyFXOff <...>
endscript

script GuitarEvent_SongFailed 
	gamemode_gettype
	if (<Type> = freeplay || <Type> = practice || <Type> = tutorial)
		return
	endif
	if ($calibrate_lag_enabled = 1)
		return
	endif
	if ($failed_song = 1)
		return
	endif
	if (($cheat_invincible = 1) && ($is_network_game != 1))
		return
	endif
	Change \{failed_song = 1}
	roadie_battle_stop_game \{showresults = 1}
	gameevent_songfailed
	StopSoundsByBuss \{Encore_Events}
	Change \{playing_song_for_real = 0}
	restore_player_part_settings
	freeplay_end_of_song
	if ($is_network_game)
		online_fail_song
	else
		stop_custom_song
		KillSpawnedScript \{Name = guitar_jam_drum_playback}
		KillSpawnedScript \{Name = jam_input_whammy_spawned}
		jam_stop_all_samples
		jam_deinit_reverb
		KillSpawnedScript \{Name = GuitarEvent_SongWon_Spawned}
		if NOT ScriptIsRunning \{GuitarEvent_SongFailed_Spawned}
			SpawnScriptNow GuitarEvent_SongFailed_Spawned params = {Player = <Player>}
		endif
	endif
endscript

script GuitarEvent_SongFailed_Spawned 
	disable_highway_prepass
	disable_bg_viewport
	gman_sendcallbacktoallgoals \{suffix = 'song_complete'
		callback_data = {
			event = song_failed
		}}
	lightshow_songfailed
	playlist_getcurrentsong
	Change last_song_played = <current_song>
	if is_current_song_a_jam_session
		<last_song_props> = {}
		get_jam_filename \{Type = current}
		AddParam structure_name = last_song_props Name = FileName value = <FileName>
		AddParam structure_name = last_song_props Name = example_song value = <example_song>
		AddParam structure_name = last_song_props Name = jam_display_name value = <jam_display_name>
		get_song_artist song = <current_song> with_year = 0
		AddParam structure_name = last_song_props Name = jam_artist_name value = <song_artist>
		Change last_jam_song_props = <last_song_props>
	endif
	Change \{g_dont_play_win_anim_sfx = 0}
	if ($is_network_game)
		ui_event_get_top
		if (<base_name> = 'controller_disconnect')
			generic_event_back
		endif
		Change \{g_net_quickplay_show_unlock_screen = 0}
		KillSpawnedScript \{Name = dispatch_player_state}
		sfx_backgrounds_new_area \{BG_SFX_Area = FrontEnd
			fadeintime = 5
			fadeintype = linear
			fadeouttime = 5
			fadeouttype = linear}
		disable_pause
		if ($net_pause = 1)
			net_unpausegh
		endif
		pushunsafeforshutdown \{context = net_gameplay}
		OnExitRun \{guitar_event_song_exit_pop_unsafe}
	endif
	GetSongTimeMs
	Change failed_song_time = <time>
	playlist_getcurrentsong
	PauseGame
	Progression_SongFailed
	UnPauseGame
	ui_event_wait_for_safe
	disable_pause
	SoundEvent \{event = audio_crowd_fail}
	gamemode_gettype
	if (<Type> = career)
		if quest_progression_is_chapter_finale
			finalbattle_fail_audio
		endif
	endif
	PlaySound \{$g_current_crowd_transition_neutral_to_negative
		buss = Crowd_Transitions}
	SoundEvent \{event = GH_SFX_You_Lose_Single_Player}
	Transition_Play \{Type = songlost}
	Transition_Wait
	Change \{current_transition = None}
	PauseGame
	show_calibration = 0
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
		playlist_getcurrentsong
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
	elseif (<Type> = career)
		if NOT ScriptIsRunning \{handle_signin_changed}
			ui_event_get_top
			if (<base_name> = 'controller_disconnect' || <base_name> = 'pausemenu_quit_warning' || <base_name> = 'online_quit_warning')
				SpawnScriptNow \{ui_event
					params = {
						event = menu_replace
						data = {
							state = uistate_fail_song
						}
					}}
			else
				SpawnScriptNow \{ui_event
					params = {
						event = menu_change
						data = {
							state = uistate_fail_song
						}
					}}
			endif
			if ScriptIsRunning \{sysnotify_handle_connection_loss}
				ui_event_wait_for_safe
				UnPauseGame
			endif
		endif
	else
		if NOT ScriptIsRunning \{handle_signin_changed}
			ui_event_get_top
			if (<base_name> = 'controller_disconnect' || <base_name> = 'pausemenu_quit_warning' || <base_name> = 'online_quit_warning')
				progression_updatedetailedstatsforgig \{failed_or_practice}
				if (<Type> = quickplay)
					if quickplay_set_new_song_in_gig_list
						Change \{gameplay_loading_transition = 1}
						Change \{gameplay_restart_song = 1}
						Change \{net_ready_to_start = 0}
						generic_event_back \{nosound
							state = Uistate_gameplay}
					else
						sfx_backgrounds_new_area \{BG_SFX_Area = FrontEnd
							fadeintime = 5
							fadeintype = linear
							fadeouttime = 5
							fadeouttype = linear}
						SpawnScriptNow \{ui_event
							params = {
								event = menu_replace
								data = {
									state = uistate_song_breakdown
									net_transition_not_career
								}
							}}
					endif
				else
					SpawnScriptNow \{ui_event
						params = {
							event = menu_replace
							data = {
								state = uistate_song_breakdown_competitive
								net_transition
							}
						}}
				endif
			else
				progression_updatedetailedstatsforgig \{failed_or_practice}
				if (<Type> = quickplay)
					if quickplay_set_new_song_in_gig_list
						Change \{gameplay_loading_transition = 1}
						Change \{gameplay_restart_song = 1}
						Change \{net_ready_to_start = 0}
						generic_event_back \{nosound
							state = Uistate_gameplay}
					else
						SpawnScriptNow \{ui_event
							params = {
								event = menu_change
								data = {
									state = uistate_song_breakdown
									net_transition_not_career
								}
							}}
					endif
				else
					SpawnScriptNow \{ui_event
						params = {
							event = menu_change
							data = {
								state = uistate_song_breakdown_competitive
								net_transition
							}
						}}
				endif
			endif
		endif
	endif
	getnumplayersingame
	if (<num_players> = 1)
		SoundEvent \{event = audio_crowd_fail}
		SpawnScriptNow \{audio_crowd_fail_song_logic}
		One_Shot_SoundEvent \{SoundEvent = audio_crowd_oneshots_do_nothing}
	else
	endif
	if ($is_network_game)
		SpawnScriptNow \{sfx_backgrounds_new_area
			params = {
				BG_SFX_Area = FrontEnd
				fadeintime = 5
				fadeintype = linear
				fadeouttime = 5
				fadeouttype = linear
			}}
	endif
	kill_all_achievement_scripts
	KillSpawnedScript \{Name = create_exploding_text}
	destroy_exploding_text \{parent = 'you_rock_physics'}
	destroy_exploding_text \{parent = 'you_rock_2_physics'}
endscript

script guitar_event_song_exit_pop_unsafe 
	popunsafeforshutdown \{context = net_gameplay}
endscript
gpulog_outputfilename = 'none'

script GuitarEvent_SongWon 
	roadie_battle_stop_game \{showresults = 1}
	audience_party_set_holding_mode \{is_popup = true}
	audience_party_pause_game
	audience_party_song_won
	Change \{finished_gig_band_rebuild = 0}
	Change \{playing_song_for_real = 0}
	if ($output_gpu_log = 1)
		if isps3
			formatText \{TextName = FileName
				'%s_gpu_ps3'
				s = $current_level
				DontAssertForChecksums}
		else
			formatText \{TextName = FileName
				'%s_gpu.txt'
				s = $current_level
				DontAssertForChecksums}
		endif
		if NOT stringequals \{a = $gpulog_outputfilename
				b = 'none'}
			<FileName> = $gpulog_outputfilename
		endif
		TextOutputEnd output_text FileName = <FileName>
	endif
	if NotCD
		if ($output_song_stats = 1)
			playlist_getcurrentsong
			formatText TextName = FileName '%s_stats.txt' s = <current_song> DontAssertForChecksums
			TextOutputStart
			TextOutput \{text = qs(0x3f02a90c)}
			getplayerinfo \{1
				score}
			formatText TextName = text qs(0xfccb1331) s = <score> DontAssertForChecksums
			TextOutput text = <text>
			getplayerinfo \{1
				notes_hit}
			getplayerinfo \{1
				total_notes}
			formatText TextName = text qs(0x26c27108) n = <notes_hit> t = <total_notes> DontAssertForChecksums
			TextOutput text = <text>
			getplayerinfo \{1
				best_run}
			formatText TextName = text qs(0xd67d4308) r = <best_run> DontAssertForChecksums
			TextOutput text = <text>
			getplayerinfo \{1
				max_notes}
			formatText TextName = text qs(0x6bb1c560) m = <max_notes> DontAssertForChecksums
			TextOutput text = <text>
			getplayerinfo \{1
				base_score}
			formatText TextName = text qs(0x26a9ba16) b = <base_score> DontAssertForChecksums
			TextOutput text = <text>
			if (<base_score> = 0)
				formatText \{TextName = text
					qs(0x30357c57)}
			else
				formatText TextName = text qs(0xbcc2e990) s = (<score> / <base_score>) DontAssertForChecksums
			endif
			TextOutput text = <text>
			if (<total_notes> = 0)
				formatText \{TextName = text
					qs(0xc8e34ec5)}
			else
				formatText TextName = text qs(0x2b87036c) s = ((<notes_hit> / <total_notes>) * 100.0) DontAssertForChecksums
			endif
			TextOutput text = <text>
			TextOutputEnd output_text FileName = <FileName>
		endif
	endif
	stopsongstarcalculation
	stop_custom_song
	KillSpawnedScript \{Name = guitar_jam_drum_playback}
	KillSpawnedScript \{Name = jam_input_whammy_spawned}
	jam_stop_all_samples
	jam_deinit_reverb
	restore_player_part_settings
	audience_party_maybe_halt_loading
	freeplay_end_of_song
	if ($in_sing_a_long = true)
		if ScreenElementExists \{id = sing_a_long_container}
			sing_a_long_container :obj_spawnscript \{ui_sing_a_long_back}
			printscriptinfo \{'GuitarEvent_SongWon'
				channel = what}
			return
		else
			ScriptAssert \{qs(0x61af0381)}
		endif
	endif
	KillSpawnedScript \{Name = GuitarEvent_SongFailed_Spawned}
	if NOT ScriptIsRunning \{GuitarEvent_SongWon_Spawned}
		SpawnScriptNow GuitarEvent_SongWon_Spawned params = {quit_network_game_early = <quit_network_game_early>}
	endif
endscript
g_just_completed_chapter = 0

script GuitarEvent_SongWon_Spawned 
	Wait \{1
		gameframe}
	gameevent_songwon
	Wait \{1
		gameframe}
	gamemode_gettype
	Change \{g_dont_play_win_anim_sfx = 1}
	playlist_getcurrentsong
	Change last_song_played = <current_song>
	if is_current_song_a_jam_session
		<last_song_props> = {}
		get_jam_filename \{Type = current}
		AddParam structure_name = last_song_props Name = FileName value = <FileName>
		AddParam structure_name = last_song_props Name = example_song value = <example_song>
		AddParam structure_name = last_song_props Name = jam_display_name value = <jam_display_name>
		get_song_artist song = <current_song> with_year = 0
		AddParam structure_name = last_song_props Name = jam_artist_name value = <song_artist>
		Change last_jam_song_props = <last_song_props>
	endif
	Change \{calibrate_lag_failed_num = 0}
	Change \{last_song_failed = None}
	Change \{current_song_failed_num = 0}
	songlist_remove_first_song_in_playlist
	<end_session> = 0
	if (<Type> = career)
		if playlist_isfinished
			<end_session> = 1
		endif
	elseif (<Type> = quickplay)
		if playlist_isfinished
			<end_session> = 1
		endif
	endif
	<career_transformation_encore> = 0
	if (<Type> = career)
		if quest_progression_check_for_transformation_encore
			<career_transformation_encore> = 1
		endif
	endif
	if (<current_song> = jamsession)
		getsonginfo
		if NOT (<file_id>.file_id [0] = 0 && <file_id>.file_id [1] = 0)
			jam_info = {
				file_id = (<file_id>.file_id)
			}
		endif
	endif
	if ($game_mode = practice)
		ui_sfx \{menustate = Generic
			uitype = select}
		generic_event_choose \{state = uistate_song_breakdown
			data = {
				for_practice = 1
			}}
		return
	elseif ($game_mode = tutorial)
		if GameIsPaused
			ScriptAssert \{'Game paused in tutorial win song script'}
		endif
		if ui_event_exists_in_stack \{Name = 'pausemenu'
				above = 'gameplay'}
			ScriptAssert \{'pausemenu exists in tutorial win song script'}
		endif
		disable_pause
		fadetoblack \{On
			z_priority = 1
			alpha = 1.0
			time = 0.0
			no_wait}
		generic_event_back \{state = uistate_tutorial_gameplay
			data = {
				return_from_gameplay = 1
				gameplay_complete = 1
			}}
		if should_update_achievements
			Change \{g_just_completed_chapter = 0}
			song_won_update_achievements
		endif
		return
	elseif ($calibrate_lag_enabled = 1)
		return
	endif
	if ininternetmode
		ui_event_get_top
		if (<base_name> = 'controller_disconnect')
			generic_event_back
		endif
		Change \{g_net_quickplay_show_unlock_screen = 0}
		if ($shutdown_game_for_signin_change_flag = 1)
			return
		endif
		pushunsafeforshutdown \{context = net_gameplay}
		OnExitRun \{guitar_event_song_exit_pop_unsafe}
		if ($net_pause = 1)
			net_unpausegh
		endif
	endif
	Progression_EndCredits_Done
	PauseGame
	disable_pause
	<special_rush_logic> = 0
	<final_battle> = 0
	<final_battle_change_level> = 0
	if (<Type> = career)
		playlist_getcurrentsong
		if StructureContains structure = $g_rush_data <current_song>
			<special_rush_logic> = 1
		elseif quest_progression_is_chapter_finale
			<final_battle> = 1
		endif
	endif
	should_cheer = FALSE
	if ($game_mode = career || $game_mode = quickplay)
		should_cheer = true
	endif
	if ($game_mode = freeplay)
		SpawnScriptNow \{audio_crowd_surge_and_sustain_at_end_of_song}
		SpawnScriptNow \{audio_crowd_play_short_swell_for_this_venue}
		if freeplay_has_players
			should_cheer = true
		endif
	endif
	if (<should_cheer> = true)
		SpawnScriptNow \{audio_crowd_play_cheer_before_explosion}
	endif
	sfx_backgrounds_new_area \{BG_SFX_Area = $g_current_crowd_looping_bg_area_good}
	audio_crowd_surge_and_sustain_at_end_of_song
	SpawnScriptNow \{audio_gameplay_you_rock_crowd_waiting}
	if (<career_transformation_encore> = 1)
		Change \{debug_career_transformations = 0}
	else
		Progression_SongWon \{async = 1}
		Wait \{1
			gameframe}
		if should_update_achievements
			Change g_just_completed_chapter = <just_completed>
			song_won_update_achievements
		endif
	endif
	if ($autotest_on = 0)
		if GotParam \{jam_info}
			songwon_writeleaderboardstats song_checksum = <current_song> end_credits = ($end_credits) end_session = <end_session> jam_info = <jam_info>
		else
			songwon_writeleaderboardstats song_checksum = <current_song> end_credits = ($end_credits) end_session = <end_session>
		endif
		Wait \{1
			gameframe}
	endif
	friend_update_check_if_cheating
	if (<special_rush_logic> = 0 && <final_battle> = 0)
		should_save = 0
		if (<career_transformation_encore> = 0)
			if (<Type> = competitive)
				song_breakdown_shreddfest_determine_order
				GetArraySize <order>
				if (<array_Size> > 0)
					<index> = 0
					<max_score> = -1
					<num_winners> = 0
					<winner_index> = 0
					begin
					if (<max_score> = -1)
						<max_score> = (<order> [<index>].band_result)
					endif
					if ((<order> [<index>].band_result) != <max_score>)
						break
					endif
					<winner_index> = (<order> [<index>].band_num)
					<index> = (<index> + 1)
					repeat <array_Size>
					<num_winners> = <index>
					if (<num_winners> > 1)
						winner_text = qs(0x82663fd9)
					else
						if teammodeequals \{team_mode = two_teams}
							getbandinfo <winner_index> Name
							<winner_text> = ($<Name>)
							<winner2_text> = qs(0xac712b20)
						else
							<winner_text> = qs(0xebdedfc6)
							getnumplayersingame
							if (<num_players> > 0)
								getfirstplayer
								begin
								if playerinfoequals <Player> Band = <winner_index>
									break
								endif
								getnextplayer Player = <Player>
								repeat
								getmaxplayers
								if (<Player> > 0 && <Player> <= <max_players>)
									if ($is_network_game = 1)
										getplayerinfo <Player> gamertag
										<winner_text> = ($<gamertag>)
									else
										ui_song_breakdown_get_player_display_name player_index = <Player>
										<winner_text> = <player_name_text>
									endif
									<winner2_text> = qs(0xac712b20)
								endif
							endif
						endif
					endif
				else
					winner_text = qs(0xebdedfc6)
				endif
			else
				winner_text = qs(0xebdedfc6)
			endif
			quickplay_targeting_player_get_result
			if NOT (<Result> = not_targeting_player)
				quickplay_targeting_player_get_opponent_gamertag
				switch <Result>
					case success
					<winner_text> = qs(0x56e81a52)
					formatText TextName = gamertag_text qs(0x12dc5a0d) g = <gamertag> e = qs(0x32b9f8e3)
					<winner2_text> = <gamertag_text>
					case fail
					formatText TextName = gamertag_text qs(0x6d229984) g = <gamertag> e = qs(0x00000000)
					<winner_text> = <gamertag_text>
					<winner2_text> = qs(0x0affe28f)
					case tie
					winner_text = qs(0x82663fd9)
					RemoveParameter \{winner2_text}
				endswitch
			endif
			if (<Type> != freeplay)
				SpawnScriptNow \{waitandkillhighway}
				create_mushroomcloudhand text = <winner_text>
				SpawnScriptNow \{audio_ui_gameplay_play_you_rock_sfx}
				if ($game_mode = career || $game_mode = quickplay || $game_mode = competitive)
					if NOT musicstudio_mainobj :musicstudio_isinmusicstudio
						<should_save> = 1
						if InNetGame
							if sessionisover
								<should_save> = 0
							endif
						endif
						if (<should_save> = 1)
							hide_entire_hud
						endif
					endif
				endif
			else
				set_all_highway_prepass_props \{alpha = 0}
				set_all_highway_props \{alpha = 0
					time = 0.66}
			endif
		endif
		if GotParam \{winner2_text}
			SpawnScriptNow create_exploding_text params = {parent = 'you_rock_2_physics' text = <winner2_text> placement = bottom}
		endif
		if ($current_transition = preencore)
			songaudiostop
			UnPauseGame
			Transition_Play \{Type = preencore}
			songwon_autosave should_save = <should_save>
			songwon_autosave_wait should_save = <should_save>
			Transition_Wait
			Change \{current_transition = None}
			PauseGame
			ui_event_get_top
			if (<base_name> = 'controller_disconnect' || <base_name> = 'pausemenu_quit_warning')
				ui_event \{event = menu_replace
					data = {
						state = uistate_song_breakdown
						ENCORE_TRANSITION = 1
						no_sound
					}}
			else
				generic_event_choose \{no_sound
					state = uistate_song_breakdown
					data = {
						ENCORE_TRANSITION = 1
					}}
			endif
			ENCORE_TRANSITION = 1
		else
			played_song_outro = FALSE
			UnPauseGame
			if ($end_credits = 1)
				Transition_Play \{Type = finalbandoutro}
				songwon_autosave should_save = <should_save>
				songwon_autosave_wait should_save = <should_save>
			else
				gamemode_gettype
				<transition> = songwon
				if (<Type> = freeplay)
					if NOT freeplay_has_players
						<transition> = songdoneattract
					else
						<transition> = songwonfreeplay
					endif
				endif
				if (<career_transformation_encore> = 1)
					<transition> = transformationencore
				endif
				Transition_Play Type = <transition>
				songwon_autosave should_save = <should_save>
				get_band_configuration song = <current_song>
				if (<Band> = default_band)
					celeb_band = FALSE
				else
					celeb_band = true
				endif
				if (((<Type> = career) && (<celeb_band> = FALSE)) || (<Type> = quickplay))
					if NOT ui_event_exists_in_stack \{Name = 'jam'}
						if (<career_transformation_encore> = 0)
							Transition_Wait
							Transition_Play \{Type = songoutro}
							played_song_outro = true
						endif
					endif
				endif
				songwon_autosave_wait should_save = <should_save>
			endif
			Transition_Wait
			Change \{current_transition = None}
			if (<played_song_outro> = FALSE)
				CameraCuts_SetArrayPrefix \{prefix = 'cameras_no_band'
					changenow
					transition_time = 5
					extra_params = {
						force_time = 5
					}}
			endif
			PauseGame
		endif
	elseif (<special_rush_logic> = 1)
		if playlist_isfinished
			songaudiostop
			UnPauseGame
			SpawnScriptNow \{waitandkillhighway
				params = {
					fade_out
				}}
			Wait \{0.5
				Seconds}
			songwon_autosave \{should_save = 1}
			songwon_autosave_wait should_save = <should_save>
			use_rush_outro
			Transition_Play \{Type = rushoutro
				use_song_time = 0}
			Transition_Wait
		else
			UnPauseGame
			SpawnScriptNow \{waitandkillhighway
				params = {
					fade_out
				}}
			Wait \{0.5
				Seconds}
			PauseGame
		endif
		Change \{current_transition = None}
		kill_gem_scroller \{Type = outro
			kill_cameracuts_iterator}
		if NOT playlist_isfinished
			PauseGame
		endif
	else
		if playlist_isfinished
			songaudiostop
			UnPauseGame
			SpawnScriptNow \{waitandkillhighway
				params = {
					fade_out
				}}
			<final_battle_change_level> = 1
		else
			UnPauseGame
			SpawnScriptNow \{waitandkillhighway
				params = {
					fade_out
				}}
			Wait \{0.5
				Seconds}
			PauseGame
			Change \{current_transition = None}
			kill_gem_scroller \{Type = outro
				kill_cameracuts_iterator}
			PauseGame
		endif
	endif
	if (<Type> = freeplay)
		if freeplay_should_change_venues
			<previous_venue> = ($current_level)
			quickplay_choose_random_venue \{all
				allow_current_venue = FALSE
				keep_current_if_none_available = true}
			if (<previous_venue> != $current_level)
				freeplay :freeplayuistack_clearnumsongssincevenuechange
				create_loading_screen
			endif
		endif
	endif
	KillSpawnedScript \{Name = create_exploding_text}
	if ($end_credits = 1)
		Change \{end_credits = 2}
	endif
	destroy_all_exploding_text
	if ($autolaunch_startnow = 1)
		prepare_for_pending_animpaks
		playlist_switchtonextsong \{populate_list = 1}
		Change \{gameplay_loading_transition = 1}
		Change \{gameplay_restart_song = 1}
		Change \{net_ready_to_start = 0}
		generic_event_back \{nosound
			state = Uistate_gameplay}
	else
		loading_transition = 0
		gamemode_gettype
		if (<Type> = career)
			if NOT playlist_isfinished
				playlist_switchtonextsong
				loading_transition = 1
			endif
		elseif (<Type> = quickplay)
			stats_song_checksum = <current_song>
			if NOT is_roadie_battle_coop
				if quickplay_set_new_song_in_gig_list
					loading_transition = 1
				endif
			endif
		elseif ((<Type> = pro_faceoff) || (<Type> = competitive))
			if quickplay_set_new_song_in_gig_list
				loading_transition = 1
			endif
		elseif (<Type> = freeplay)
			freeplay_next_song
			loading_transition = 1
		endif
		if (<final_battle_change_level> = 1)
			ui_event \{event = menu_replace
				data = {
					state = uistate_quest_breakdown
					starttime = 0
					restart = 0
				}}
			SpawnScriptLater \{final_battle_change_level}
		elseif (<loading_transition> = 1)
			if (<Type> = career)
				if ScriptIsRunning \{gameplay_end_game_spawned}
					return
				endif
			endif
			Change \{gameplay_loading_transition = 1}
			Change \{gameplay_restart_song = 1}
			Change \{net_ready_to_start = 0}
			generic_event_back \{nosound
				state = Uistate_gameplay}
		else
			if ($is_network_game = 1 && <Type> != career)
				ui_event_get_top
				if (<base_name> = 'controller_disconnect' || <base_name> = 'pausemenu_quit_warning' || <base_name> = 'online_quit_warning')
					if (<Type> = quickplay)
						ui_event \{event = menu_replace
							data = {
								state = uistate_song_breakdown
								net_transition_not_career
							}}
					else
						ui_event \{event = menu_replace
							data = {
								state = uistate_song_breakdown_competitive
								net_transition
							}}
					endif
				else
					if (<Type> = quickplay)
						ui_event \{event = menu_change
							data = {
								state = uistate_song_breakdown
								net_transition_not_career
							}}
					else
						ngc_clean_up_exploding_text
						ui_event \{event = menu_change
							data = {
								state = uistate_song_breakdown_competitive
								net_transition
							}}
					endif
				endif
			else
				ui_event_get_top
				if (<base_name> = 'controller_disconnect' || <base_name> = 'pausemenu_quit_warning' || <base_name> = 'online_quit_warning')
					if ((<Type> = pro_faceoff) || (<Type> = competitive))
						ui_event \{event = menu_replace
							data = {
								state = uistate_song_breakdown_competitive
								end_of_setlist_transition
							}}
					else
						ui_event \{event = menu_replace
							data = {
								state = uistate_song_breakdown
								end_of_setlist_transition
							}}
					endif
				else
					if ui_event_exists_in_stack \{Name = 'debug'}
						ui_sfx \{menustate = Generic
							uitype = back}
						gman_shutdowngamemodegoal
						generic_event_back \{state = uistate_mainmenu}
					elseif ($game_mode = career)
						if playlist_isfinished
							if ($end_credits = 2)
								progression_getcreditsvenue
								ui_memcard_autosave {
									event = menu_back
									state = uistate_quest_map
									data = {
										load_venue_checksum = <credits_venue>
									}
								}
							else
								if quest_progression_is_chapter_rush
									ui_win_song_continue_next_menu
								else
									ui_event \{event = menu_change
										data = {
											state = uistate_song_breakdown
											end_of_setlist_transition
										}}
								endif
							endif
						else
							ui_event \{event = menu_change
								data = {
									state = uistate_song_breakdown
									add_setlist_continue_handlers
								}}
						endif
					elseif ((<Type> = pro_faceoff) || (<Type> = competitive))
						ui_event \{event = menu_change
							data = {
								state = uistate_song_breakdown_competitive
								end_of_setlist_transition
							}}
					else
						ui_event \{event = menu_change
							data = {
								state = uistate_song_breakdown
								end_of_setlist_transition
							}}
					endif
				endif
			endif
		endif
	endif
	kill_all_achievement_scripts
endscript

script songwon_autosave 
	<event> = menu_replace
	if ininternetmode
		<should_save> = 0
		band_lobby_career_mark_save_local_players
	endif
	if ui_event_exists_in_stack \{Name = 'gameplay'}
		<event> = menu_back
	endif
	if (<should_save> = 1)
		ui_memcard_autosave_all_players {
			event = <event>
			state = Uistate_gameplay
		}
	endif
	return should_save = <should_save>
endscript

script songwon_autosave_wait 
	if (<should_save> = 1)
		old_transition = ($transition_playing)
		begin
		if NOT ui_event_exists_in_stack \{Name = 'memcard'}
			if ($g_memcard_ingame_is_paused = 0)
				break
			endif
		endif
		Wait \{1
			gameframe}
		printf \{'waiting for autosave to finish'}
		if (<old_transition> = true && $transition_playing = FALSE)
			old_transition = ($transition_playing)
		endif
		repeat
	endif
endscript

script songwon_writeleaderboardstats 
	RequireParams \{[
			song_checksum
			end_session
		]
		all}
	if demobuild
		return
	endif
	if ($invite_controller = -1)
		check_score_leap_event
		check_for_leaderboard_write song_checksum = <song_checksum> end_session = <end_session> end_credits = <end_credits>
		getnumplayersingame \{local
			out = temp_num_players_in_game}
		if (<temp_num_players_in_game> > 0)
			if (<end_credits> = 0)
				gamemode_gettype
				if (<Type> = career)
					if ($is_network_game = 1)
						if IsHost
							agora_update
						endif
					else
						agora_update
					endif
				endif
				if ($is_network_game = 1)
					if IsHost
						if GotParam \{jam_info}
							agora_write_stats song_checksum = <song_checksum> jam_info = <jam_info>
						else
							agora_write_stats song_checksum = <song_checksum>
						endif
					endif
				else
					if GotParam \{jam_info}
						agora_write_stats song_checksum = <song_checksum> jam_info = <jam_info>
					else
						agora_write_stats song_checksum = <song_checksum>
					endif
				endif
			endif
		endif
	endif
endscript

script waitandkillhighway 
	if GotParam \{fade_out}
		hide_highway \{fadetime = 1.0
			endofsong}
		Wait \{0.5
			Seconds}
	endif
	Wait \{0.5
		Seconds}
	disable_bg_viewport \{no_cameras}
endscript
current_song_time = -1
time_to_next_beat = -1
next_beat_time = -1
time_to_next_beat2 = -1
next_beat_time2 = -1
tempo_iterator_offset = 0

script tempo_matching_iterator 
	printf qs(0x267f53bc) d = <time_offset> channel = events
	songfilemanager func = get_num_timesig_notes song_name = <song_name>
	timesig_entry = 0
	timesig_size = <num_timesig_notes>
	timesig_num_val = 0
	timesig_den_val = 0
	measure_count = 0
	even = 1
	songfilemanager func = get_num_fretbar_notes song_name = <song_name>
	array_Size = <num_fretbar_notes>
	array_entry = 0
	array_entry2 = 0
	fretbar_count = 0
	Change \{next_beat_time = -1}
	Change \{time_to_next_beat = -1}
	Change \{next_beat_time2 = -1}
	Change \{time_to_next_beat2 = -1}
	Change tempo_iterator_offset = <time_offset>
	songfilemanager func = get_song_end_time song_name = <song_name>
	begin
	if (<array_Size> < 2)
		break
	endif
	<entry> = (<array_Size> -2)
	songfilemanager func = get_fretbar_note song_name = <song_name> index = <entry>
	if (<total_end_time> > <fretbar_time>)
		break
	endif
	<array_Size> = (<array_Size> - 1)
	repeat
	GetSongTimeMs time_offset = <time_offset>
	if NOT (<array_Size> = 0)
		begin
		if (<timesig_entry> < <timesig_size>)
			songfilemanager func = get_timesig_note song_name = <song_name> index = <timesig_entry>
			songfilemanager func = get_fretbar_note song_name = <song_name> index = <array_entry>
			if (<timesig_time> <= <fretbar_time>)
				timesig_num_val = <timesig_num>
				timesig_den_val = <timesig_den>
				fretbar_count = 0
				timesig_entry = (<timesig_entry> + 1)
			endif
		endif
		songfilemanager func = get_fretbar_note song_name = <song_name> index = <array_entry>
		if ((<time> - <skipleadin>) < <fretbar_time>)
			break
		endif
		array_entry = (<array_entry> + 1)
		fretbar_count = (<fretbar_count> + 1)
		if (<fretbar_count> = <timesig_num_val>)
			measure_count = (<measure_count> + 1)
			fretbar_count = 0
		endif
		repeat <array_Size>
		final_array_entry = (<array_Size> - 1)
		array_Size = (<array_Size> - <array_entry>)
		if (<array_Size> > 0)
			begin
			begin
			songfilemanager func = get_fretbar_note song_name = <song_name> index = <array_entry>
			GetSongTimeMs
			if (<time> >= <fretbar_time>)
				GetSongTimeMs time_offset = <time_offset>
				if (<timesig_entry> < <timesig_size>)
					songfilemanager func = get_timesig_note song_name = <song_name> index = <timesig_entry>
					songfilemanager func = get_fretbar_note song_name = <song_name> index = <array_entry>
					if (<timesig_time> <= <fretbar_time>)
						timesig_num_val = <timesig_num>
						timesig_den_val = <timesig_den>
						fretbar_count = 0
						timesig_entry = (<timesig_entry> + 1)
					endif
				endif
				if (<array_entry> < <final_array_entry>)
					songfilemanager func = get_beat_time song_name = <song_name> index = <array_entry>
					current_song_beat_time = <beat_time>
					setplayerinfo <Player> current_song_beat_time = <current_song_beat_time>
					setplayerinfo <Player> current_song_measure_time = (<timesig_num_val> * <current_song_beat_time>)
				endif
				break
			endif
			Wait \{1
				gameframe}
			repeat
			songfilemanager func = get_fretbar_note song_name = <song_name> index = <array_entry>
			marker = <fretbar_time>
			<array_entry> = (<array_entry> + 1)
			fretbar_count = (<fretbar_count> + 1)
			if (<fretbar_count> = <timesig_num_val>)
				measure_count = (<measure_count> + 1)
				fretbar_count = 0
				spawn_measure_callbacks
			endif
			if (<array_entry> < <final_array_entry>)
				songfilemanager func = get_fretbar_note song_name = <song_name> index = <array_entry>
				Change next_beat_time = <fretbar_time>
				Change time_to_next_beat = ($next_beat_time - <marker>)
				spawn_beat_callbacks \{time_to_next_beat = $time_to_next_beat}
			else
				Change \{next_beat_time = -1}
				Change \{time_to_next_beat = -1}
			endif
			if (<even> = 1)
				<next_array_entry> = (<array_entry> + 1)
				if (<next_array_entry> < <final_array_entry>)
					songfilemanager func = get_fretbar_note song_name = <song_name> index = <array_entry>
					Change next_beat_time2 = <fretbar_time>
					Change time_to_next_beat2 = ($next_beat_time2 - <marker>)
				else
					Change \{next_beat_time2 = -1}
					Change \{time_to_next_beat2 = -1}
				endif
				even = 0
			else
				even = 1
			endif
			repeat <array_Size>
		endif
	endif
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
	printf \{channel = tempo
		qs(0x579a2ed4)}
endscript

script beat_test_script 
	printf channel = tempo qs(0x96bdbc92) a = <time_to_next_beat>
endscript

script GuitarEvent_StarSequenceBonus \{Player = !i1768515945}
	addtoplayerinfo <Player> sp_phrases_hit = 1
	if (($g_debug_highway_visible) = 0)
		return
	endif
	if isps3
		if NOT ($current_song = jamsession)
			if isSinglePlayerGame
				SoundEvent \{event = audio_star_power_awarded}
			else
				fastspawnscriptnow script_name = audio_gameplay_star_power_awarded_logic params = {Player = <Player>}
			endif
		endif
	else
		if isSinglePlayerGame
			SoundEvent \{event = audio_star_power_awarded}
		else
			fastspawnscriptnow script_name = audio_gameplay_star_power_awarded_logic params = {Player = <Player>}
		endif
	endif
	formatchecksum format_string = 'nowbar_container_p%p' format_params = {p = <Player>}
	container_id = <checksum>
	getnowbarscale Player = <Player>
	player_index = (<Player> - 1)
	fastgetarraysize \{array = $gem_colors}
	inputarraygetelement Name = <song> index = <array_entry>
	OnExitRun guitarevent_starsequencebonus_exit params = {Player = <Player> gem_array = <gem_array>}
	destroy_big_bolt {Player = <Player> gem_array = <gem_array>}
	gem_count = 0
	getnumplayersingame
	if (<num_players> = 1)
		Scale = (0.375, 3.0)
		scale2 = (0.375, 4.0)
	endif
	if (<num_players> = 2)
		Scale = (0.45000002, 3.0)
		scale2 = (0.45000002, 4.0)
	endif
	if (<num_players> = 3)
		Scale = (0.5625, 3.0)
		scale2 = (0.5625, 4.0)
	endif
	if (<num_players> = 4)
		Scale = (0.68750006, 3.0)
		scale2 = (0.68750006, 4.0)
	endif
	getplayerfloat Player = <Player> checksum = star_power_gain_multiplier
	star_power_gain_multiplier = <float_value>
	if (<star_power_gain_multiplier> >= 4)
		default_lightning_alpha = 0
		rp_alphalvl1 = 1
		rp_alphalvl2 = 1
		fastspawnscriptnow script_name = newmale_rp_fx params = {Player = <Player> Scale = (2.0, 1.0) Pos = (-91.0, -102.0)}
	elseif (<star_power_gain_multiplier> >= 2)
		default_lightning_alpha = 0
		rp_alphalvl1 = 1
		rp_alphalvl2 = 0
		fastspawnscriptnow script_name = newmale_rp_fx params = {Player = <Player> Scale = (1.0, 1.0) Pos = (-30.0, -102.0)}
	else
		default_lightning_alpha = 1
		rp_alphalvl1 = 0
		rp_alphalvl2 = 0
	endif
	got_one = 0
	begin
	<note_value> = (<gem_array> [(<gem_count> + 1)])
	if (<note_value> > 0)
		if (<gem_count> = (<array_Size> -1))
			if (<got_one> = 1)
				break
			endif
		else
			got_one = 1
		endif
		Color = ($gem_colors [<gem_count>])
		lightning_rgba_01 = [200 255 255 255]
		lightning_rgba_02 = [0 255 255 128]
		lightning_rp_rgba_01 = [200 200 255 255]
		lightning_rp_rgba_02 = [0 128 255 255]
		bolt_dims = (128.0, 48.0)
		if playerinfointegerequals Player = <Player> checksum = lefthanded_button_ups value = 1
			<pos2d> = (($button_up_models [<player_index>]).<Color>.left_pos_2d)
			<angle> = ((($button_models [<player_index>]).<Color>.angle) + 90)
			<angle2> = ((($button_models [<player_index>]).<Color>.angle) + 80)
		else
			<pos2d> = (($button_up_models [<player_index>]).<Color>.pos_2d)
			<angle> = ((($button_models [<player_index>]).<Color>.left_angle) + 90)
			<angle2> = ((($button_models [<player_index>]).<Color>.left_angle) + 80)
		endif
		formatchecksum format_string = 'big_boltp%p%e' format_params = {p = <Player> e = <gem_count>} add_to_string_lookup = 1
		bolt_cont = <checksum>
		if NOT screenelementexistssimpleid id = <bolt_cont>
			fastcreatescreenelement params = {
				Type = ContainerElement
				id = <bolt_cont>
				parent = <container_id>
				Pos = <pos2d>
				rot_angle = <angle>
				alpha = 1
				Scale = (1.0, 1.0)
				just = [center bottom]
				z_priority = 16
				dims = (32.0, 32.0)
			}
			fastcreatescreenelement params = {
				Type = SpriteElement
				parent = <bolt_cont>
				material = mat_lightning_arc_anim01
				use_animated_uvs = true
				frame_length = 0.05
				num_uv_frames = (1.0, 16.0)
				blend = add
				top_down_v
				loop_animated_uvs = true
				rgba = <lightning_rgba_01>
				rot_angle = 0
				Scale = <Scale>
				just = [right center]
				z_priority = 16
				alpha = <default_lightning_alpha>
				dims = <bolt_dims>
			}
			bolt1 = <id>
			fastcreatescreenelement params = {
				Type = SpriteElement
				parent = <bolt_cont>
				texture = mat_lightning_arc_anim01
				use_animated_uvs = true
				frame_length = 0.05
				num_uv_frames = (1.0, 16.0)
				current_frames = (0.0, 1.0)
				blend = add
				top_down_v
				loop_animated_uvs = true
				rgba = <lightning_rgba_02>
				Pos = (0.0, 0.0)
				rot_angle = 0
				Scale = <Scale>
				just = [right center]
				z_priority = 16
				alpha = <default_lightning_alpha>
				dims = <bolt_dims>
			}
			bolt2 = <id>
			fastcreatescreenelement params = {
				Type = SpriteElement
				parent = <bolt_cont>
				material = mat_lightning_arc_anim01
				use_animated_uvs = true
				frame_length = 0.05
				num_uv_frames = (1.0, 16.0)
				blend = add
				top_down_v
				loop_animated_uvs = true
				rgba = <lightning_rp_rgba_01>
				rot_angle = 0
				Scale = <scale2>
				just = [1.0 , 0.3]
				z_priority = 16
				alpha = <rp_alphalvl1>
				dims = <bolt_dims>
			}
			bolt3 = <id>
			fastcreatescreenelement params = {
				Type = SpriteElement
				parent = <bolt_cont>
				texture = mat_lightning_arc_anim01
				use_animated_uvs = true
				frame_length = 0.05
				num_uv_frames = (1.0, 16.0)
				current_frames = (0.0, 1.0)
				blend = add
				top_down_v
				loop_animated_uvs = true
				rgba = <lightning_rp_rgba_02>
				Pos = (0.0, 0.0)
				rot_angle = 0
				Scale = <scale2>
				just = [1.0 , 0.3]
				z_priority = 16
				alpha = <rp_alphalvl1>
				dims = <bolt_dims>
			}
			bolt4 = <id>
			fastcreatescreenelement params = {
				Type = SpriteElement
				parent = <bolt_cont>
				texture = mat_lightning_arc_anim01
				use_animated_uvs = true
				frame_length = 0.05
				num_uv_frames = (1.0, 16.0)
				current_frames = (0.0, 3.0)
				blend = add
				top_down_v
				loop_animated_uvs = true
				rgba = <lightning_rp_rgba_01>
				rot_angle = 180
				Scale = <Scale>
				just = [left bottom]
				z_priority = 16
				alpha = <rp_alphalvl2>
				dims = <bolt_dims>
			}
			bolt5 = <id>
			fastcreatescreenelement params = {
				Type = SpriteElement
				parent = <bolt_cont>
				texture = mat_lightning_arc_anim01
				use_animated_uvs = true
				frame_length = 0.05
				num_uv_frames = (1.0, 16.0)
				current_frames = (0.0, 4.0)
				blend = add
				top_down_v
				loop_animated_uvs = true
				rgba = <lightning_rp_rgba_02>
				Pos = (0.0, 0.0)
				rot_angle = 180
				Scale = <Scale>
				just = [left bottom]
				z_priority = 16
				alpha = <rp_alphalvl2>
				dims = <bolt_dims>
			}
			bolt6 = <id>
		endif
		formatchecksum format_string = 'big_bolt_hitp%p%e' format_params = {p = <Player> e = <gem_count>} add_to_string_lookup = 1
		nameh = <checksum>
		if NOT screenelementexistssimpleid id = <nameh>
			fastcreatescreenelement params = {
				Type = SpriteElement
				id = <nameh>
				parent = <container_id>
				material = mat_sp_xplosion1
				blend = add
				use_animated_uvs = true
				frame_length = 0.03333
				num_uv_frames = (4.0, 4.0)
				rgba = [255 255 255 255]
				Pos = <pos2d>
				rot_angle = 0
				Scale = (2.0, 2.0)
				just = [center bottom]
				z_priority = 16
			}
		endif
	endif
	gem_count = (<gem_count> + 1)
	repeat <array_Size>
	waitseconds \{num_seconds = $star_power_bolt_time}
	destroy_big_bolt {Player = <Player> gem_array = <gem_array> kill_when_empty = kill_when_empty}
	OnExitRun \{nullscript}
	return
	song = None
	array_entry = 0
	angle = 0.0
	angle2 = 0.0
	gem_array = []
	pos2d = (0.0, 0.0)
	particle_pos = (0.0, 0.0)
endscript

script guitarevent_starsequencebonus_exit 
	printf \{'GuitarEvent_StarSequenceBonus_Exit'}
	destroy_big_bolt {Player = <Player> gem_array = <gem_array> kill_when_empty = kill_when_empty}
endscript

script destroy_big_bolt \{Player = !i1768515945
		gem_array = !a1768515945
		kill_when_empty = kill_when_empty}
	gem_count = 0
	fastgetarraysize \{array = $gem_colors}
	begin
	<note_value> = (<gem_array> [(<gem_count> + 1)])
	if (<note_value> > 0)
		formatchecksum format_string = 'big_boltp%p%e' format_params = {p = <Player> e = <gem_count>} add_to_string_lookup = 1
		DestroyScreenElement id = <checksum>
		formatchecksum format_string = 'big_bolt_hitp%p%e' format_params = {p = <Player> e = <gem_count>} add_to_string_lookup = 1
		DestroyScreenElement id = <checksum>
	endif
	gem_count = (<gem_count> + 1)
	repeat <array_Size>
endscript

script destroy_all_big_bolts 
	GetArraySize \{$gem_colors}
	Player = 0
	begin
	gem_count = 0
	begin
	formatText checksumName = Name 'big_boltp%p%e' p = <Player> e = <gem_count> AddToStringLookup = true
	DestroyScreenElement id = <Name>
	formatText checksumName = fx_id 'big_bolt_particlep%p%e' p = <Player> e = <gem_count> AddToStringLookup = true
	formatText checksumName = fx2_id 'big_bolt_particle2p%p%e' p = <Player> e = <gem_count> AddToStringLookup = true
	formatText checksumName = fx3_id 'big_bolt_particle3p%p%e' p = <Player> e = <gem_count> AddToStringLookup = true
	Destroy2DParticleSystem id = <fx_id>
	Destroy2DParticleSystem id = <fx2_id>
	Destroy2DParticleSystem id = <fx3_id>
	formatText checksumName = nameh 'big_bolt_hitp%p%e' p = <Player> e = <gem_count> AddToStringLookup = true
	DestroyScreenElement id = <nameh>
	gem_count = (<gem_count> + 1)
	repeat <array_Size>
	Player = (<Player> + 1)
	repeat 4
endscript

script GuitarEvent_Multiplier4xOff 
	SoundEvent \{event = audio_ui_gameplay_lose_multiplier_4x}
	SpawnScriptNow highway_pulse_multiplier_loss params = {Player = <Player> multiplier = 4}
endscript

script GuitarEvent_Multiplier3xOff 
	SoundEvent \{event = audio_ui_gameplay_lose_multiplier_3x}
	SpawnScriptNow highway_pulse_multiplier_loss params = {Player = <Player> multiplier = 3}
endscript

script GuitarEvent_Multiplier2xOff 
	SoundEvent \{event = audio_ui_gameplay_lose_multiplier_2x}
	SpawnScriptNow highway_pulse_multiplier_loss params = {Player = <Player> multiplier = 2}
endscript

script GuitarEvent_KillSong \{loadingtransition = 0}
	audio_gameplay_stop_sounds_for_killsong <...> loading_transition = <loading_transition>
endscript

script guitarevent_venueenter 
	GetPakManCurrentName \{map = zones}
	formatText checksumName = echo_params 'Echo_Crowd_Buss_%s' s = <pakname>
	formatText checksumName = reverb_params 'Reverb_Crowd_Buss_%s' s = <pakname>
	if NOT GlobalExists Name = <echo_params>
		echo_params = echo_crowd_buss_default_semiwet
	endif
	if NOT GlobalExists Name = <reverb_params>
		reverb_params = reverb_crowd_buss_default_semiwet
	endif
	setsoundbusseffects effects = [{$<echo_params> Name = crowd_w_reverb_buss_echo}]
	setsoundbusseffects effects = [{$<reverb_params> Name = crowd_w_reverb_buss_reverb}]
endscript

script guitarevent_venueexit 
	setsoundbusseffects \{effects = [
			{
				$echo_dry
				Name = crowd_w_reverb_buss_echo
			}
		]}
	setsoundbusseffects \{effects = [
			{
				$reverb_dry
				Name = crowd_w_reverb_buss_reverb
			}
		]}
endscript

script GuitarEvent_CreateFirstGem 
	SpawnScriptNow first_gem_fx params = {<...>}
endscript

script GuitarEvent_GemStarPowerOn 
endscript

script GuitarEvent_TransitionIntro 
endscript

script GuitarEvent_TransitionFastIntro 
endscript

script GuitarEvent_TransitionPreEncore 
endscript

script GuitarEvent_TransitionEncore 
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

script kick_up_effect 
	Obj_GetID
	<objID> :se_setprops Pos = <Pos> time = 0.25 anim = fast_out
endscript
open_sustain_index = 0
kick_fx_index = 0
kick_index = 0
kick_fx_scale = 1.0
kick_flame_scale = 1.25
kick_fx_scale_3p = 1.2
kick_fx_scale_end = (1.25, 0.0)

script guitarevent_open_note_sustain \{Player = 1}
	formatText checksumName = container_id 'nowbar_container_p%p' p = <Player> AddToStringLookup = true
	<highway_info> = ($highway_pos_table [<Player> -1])
	<x_scale> = (<highway_info>.nowbar_scale_x * ($kick_flame_scale))
	<Scale> = (<x_scale> * (1.0, 0.0) + (0.0, 1.0))
	<particle_pos> = (0.0, 620.0)
	formatText checksumName = fx_id 'Sustain_Particlep%p' p = <Player> AddToStringLookup = true
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
	CreateScreenElement {
		Type = ContainerElement
		local_id = up_container
		parent = <fx_id>
		Pos = (0.0, 0.0)
		just = [center center]
		pos_anchor = [center center]
	}
	<up_id> = <id>
	getplayerinfo <Player> star_power_used
	if (<star_power_used> = 1)
		<rgba> = [200 255 255 255]
	else
		<rgba> = [255 128 255 255]
	endif
	CreateScreenElement {
		Type = SpriteElement
		local_id = splash_spikes
		Pos = (0.0, 0.0)
		texture = kick_hit_particle04
		parent = <up_id>
		rgba = <rgba>
		blend = add
		Scale = <Scale>
		alpha = 1.0
	}
	<id> :obj_spawnscript kick_lick_effect params = {width_scale = <Scale>}
endscript

script kick_lick_effect 
	begin
	alpha = Random (@ (1) @ (0.9) @ (0.8) @ (0.7) @ (0.6) )
	Scale = Random (@ (1.0, 2.0) @ (1.0, 2.2) @ (1.0, 2.4) @ (1.0, 1.6) @ (1.0, 1.8) )
	x_scale = ((<Scale> [0]) * (<width_scale> [0]))
	y_scale = (<Scale> [1])
	<Scale> = ((<x_scale> * (1.0, 0.0)) + (<y_scale> * (0.0, 1.0)))
	se_setprops alpha = <alpha> Scale = <Scale> time = 0.1
	se_waitprops
	repeat
endscript

script cleanup_open_note_sustain_fx \{Player = 1}
	formatText checksumName = fx_id 'Sustain_Particlep%p' p = <Player> AddToStringLookup = true
	DestroyScreenElement id = <fx_id>
endscript

script guitarevent_kick_drum_hit_note \{Player = 1
		kill_when_empty = 0}
	formatText checksumName = container_id 'nowbar_container_p%p' p = <Player> AddToStringLookup = true
	extended_checksum = NULL
	getplayerchecksum Player = <Player> checksum = part
	<part> = <checksum_value>
	if (<part> = bass)
		<start_color1> = [255 128 255 255]
		<end_color1> = [128 0 128 0]
		<start_color2> = [255 128 255 255]
		<end_color2> = [128 0 128 0]
	else
		<start_color1> = [255 128 0 255]
		<end_color1> = [0 0 0 0]
		<start_color2> = [255 200 128 255]
		<end_color2> = [255 100 0 0]
	endif
	getplayerinfo <Player> star_power_used
	if (<star_power_used> = 1)
		<start_color1> = [200 255 255 255]
		<end_color1> = [0 128 128 0]
		<start_color2> = [200 255 255 255]
		<end_color2> = [0 128 128 0]
	endif
	<highway_info> = ($highway_pos_table [<Player> -1])
	if (<highway_info>.nowbar_scale_x < 1.3)
		<x_scale> = (<highway_info>.nowbar_scale_x * ($kick_fx_scale_3p))
	else
		<x_scale> = (<highway_info>.nowbar_scale_x * ($kick_fx_scale))
	endif
	<flame_scale> = (<highway_info>.nowbar_scale_x * ($kick_flame_scale))
	<particle_pos> = (0.0, 620.0)
	formatText checksumName = fx_id 'Kick_Particlep%p%i' p = <Player> i = ($kick_index) AddToStringLookup = true
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
	<end_scale> = (<x_scale> * ($kick_fx_scale_end) + (0.0, 2.75))
	CreateScreenElement {
		Type = SpriteElement
		local_id = top_wave
		Pos = (0.0, 0.0)
		texture = kick_hit_particle01
		parent = <grow_id>
		rgba = <start_color1>
		blend = add
		Scale = <start_scale>
		alpha = 1.0
	}
	CreateScreenElement {
		Type = ContainerElement
		local_id = up_container
		parent = <fx_id>
		Pos = (0.0, 0.0)
		just = [center center]
		pos_anchor = [center center]
	}
	<up_id> = <id>
	<end_pos> = (0.0, -20.0)
	getplayerinfo <Player> part
	if (<part> = drum)
		getplayerinfo <Player> four_lane_highway
	else
		four_lane_highway = 0
	endif
	if (<four_lane_highway> = 0)
		CreateScreenElement {
			Type = SpriteElement
			local_id = splash_spikes
			Pos = (0.0, 0.0)
			texture = kick_hit_particle04
			parent = <up_id>
			rgba = <start_color2>
			blend = add
			Scale = <flame_scale>
			alpha = 1.0
		}
	else
		CreateScreenElement {
			Type = SpriteElement
			local_id = splash_spikes
			Pos = (0.0, 0.0)
			texture = kick_hit_particle04_rb
			parent = <up_id>
			rgba = <start_color2>
			blend = add
			Scale = <flame_scale>
			alpha = 1.0
		}
	endif
	RunScriptOnScreenElement id = <fx_id> kick_fade_effect params = {t1 = 0.15 t2 = 0.25}
	RunScriptOnScreenElement id = <grow_id> kick_grow_effect params = {Scale = <end_scale>}
	RunScriptOnScreenElement id = <up_id> kick_up_effect params = {Pos = <end_pos>}
	Change kick_fx_index = (($kick_fx_index) + 1)
	if (($kick_fx_index) = 10)
		Change \{kick_fx_index = 0}
	endif
endscript

script guitarevent_hit_open_note 
	guitarevent_kick_drum_hit_note Player = <Player>
endscript

script guitarevent_hit_beginner_note 
	guitarevent_kick_drum_hit_note Player = <Player>
endscript

script guitarevent_gigstarted 
endscript

script guitarevent_gigfailed 
endscript

script guitarevent_gigwon 
endscript

script guitarevent_gigquit 
endscript

script playersetvolume 
	if GotParam \{Volume}
		if playerinfoequals <Player> part = drum
			if GotParam \{drum}
				switch <drum>
					case 1
					setplayerinfo <Player> drum_volume1 = <Volume>
					case 2
					setplayerinfo <Player> drum_volume2 = <Volume>
					case 3
					setplayerinfo <Player> drum_volume1 = <Volume>
					case 4
					setplayerinfo <Player> drum_volume4 = <Volume>
				endswitch
				return
			endif
		endif
		setplayerinfo <Player> guitar_volume = <Volume>
	endif
endscript

script playergetvolume 
	if playerinfoequals <Player> part = drum
		if GotParam \{drum}
			switch <drum>
				case 1
				getplayerinfo <Player> drum_volume1
				return Volume = <drum_volume1>
				case 2
				getplayerinfo <Player> drum_volume2
				return Volume = <drum_volume2>
				case 3
				getplayerinfo <Player> drum_volume1
				return Volume = <drum_volume1>
				case 4
				getplayerinfo <Player> drum_volume4
				return Volume = <drum_volume4>
			endswitch
		endif
	endif
	getplayerinfo <Player> guitar_volume
	return Volume = <guitar_volume>
endscript

script ngc_clean_up_exploding_text 
	destroy_all_exploding_text
	DestroyScreenElement \{id = et_white_frame}
	if ScreenElementExists \{id = mushroomcloudhand}
		DestroyScreenElement \{id = mushroomcloudhand}
	endif
	handofgod_fx_cleanup
endscript

script create_mushroomcloudhand \{text = qs(0x6f6d143d)}
	KillSpawnedScript \{Name = create_exploding_text}
	destroy_all_exploding_text
	SpawnScriptNow create_exploding_text params = {text = <text>}
endscript

script hot_start_achieved \{Band = 0}
	return
	gamemode_gettype
	if (<Type> = practice)
		return
	endif
	getnumplayersingame
	if (<Player> = 1)
		printf \{channel = sfx
			qs(0x3f8e0b79)}
		if isSinglePlayerGame
			Pos = (640.0, 211.0)
			<base_scale> = 1.0
		elseif ($game_mode = career || ($game_mode = quickplay && <num_players> = 2))
			Pos = (640.0, 170.0)
			<base_scale> = 1.0
		else
			<s> = 0.35000002
			Pos = (415.0, 170.0)
		endif
	else
		printf \{channel = sfx
			qs(0xa30807c8)}
		if ($game_mode = career || ($game_mode = quickplay && <num_players> = 2))
			Pos = (640.0, 170.0)
			<base_scale> = 1.0
		else
			<s> = 0.35000002
			Pos = (865.0, 170.0)
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
		array = []
		getnumplayersingame
		if (<num_players> > 0)
			getfirstplayer
			begin
			AddArrayElement array = <array> element = <Player>
			getnextplayer Player = <Player>
			repeat <num_players>
		endif
		GetArraySize array = <array>
		if (<array_Size> > 0)
			hud_create_message Band text = qs(0x09a07a71) style_script = hud_message_band_streak_style style_script_params = {players = <array>}
		endif
	endif
endscript

script hud_animate_star_meter_flames 
	SpawnScriptNow \{son_of_hud_animate_star_meter_flames}
endscript

script son_of_hud_animate_star_meter_flames 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	Wait \{0.3
		Seconds}
	if NOT ScreenElementExists \{id = hud_star_meter_id}
		return
	endif
	id = hud_star_meter_id
	if NOT <id> :desc_resolvealias Name = alias_star_earn_fx param = parent_cont
		return
	endif
	colorin = [255 200 0 255]
	colorout = [0 0 0 255]
	DestroyScreenElement \{id = star_meter_counter_glow01}
	DestroyScreenElement \{id = star_meter_counter_glow02}
	if NOT ScreenElementExists id = <parent_cont>
		return
	endif
	CreateScreenElement {
		Type = SpriteElement
		id = star_meter_counter_glow01
		parent = <parent_cont>
		material = mat_meter_wibble_glow
		blend = add
		rgba = [255 200 64 255]
		alpha = 0
		dims = (228.0, 228.0)
		Pos = (0.0, 0.0)
		Scale = (1.0, 1.0)
		rot_angle = 0
		just = [center center]
		pos_anchor = [center center]
		z_priority = 12
	}
	CreateScreenElement {
		Type = SpriteElement
		id = star_meter_counter_glow02
		parent = <parent_cont>
		material = mat_meter_wibble_glow
		rgba = [255 200 64 255]
		alpha = 0
		dims = (128.0, 128.0)
		Pos = (0.0, 0.0)
		Scale = (1.0, 1.0)
		rot_angle = 0
		just = [center center]
		pos_anchor = [center center]
		z_priority = 13
	}
	Create2DParticleSystem {
		Pos = (0.0, 0.0)
		z_priority = 12
		material = sys_Particle_lnzflare02_sys_Particle_lnzflare02
		parent = <parent_cont>
		start_color = [255 255 128 255]
		end_color = [255 128 0 0]
		start_scale = (0.25, 0.25)
		end_scale = (1.0, 1.0)
		start_angle_spread = 0.0
		min_rotation = -180
		max_rotation = 360
		emit_start_radius = 6
		emit_radius = 6
		Emit_Rate = 0.00151
		emit_dir = 0.0
		emit_spread = 360.0
		velocity = 12.1
		friction = (0.0, 24.0)
		time = 0.1
	}
	<rp_fx01> = <id>
	Create2DParticleSystem {
		parent = <parent_cont>
		Pos = (0.0, 0.0)
		z_priority = 11.0
		material = sys_Particle_Spark01_sys_Particle_Spark01
		start_color = <colorin>
		end_color = [255 255 255 0]
		start_scale = (0.5, 0.5)
		end_scale = (1.5, 1.5)
		start_angle_spread = 360.0
		min_rotation = 0
		max_rotation = 360
		emit_start_radius = 10
		emit_radius = 0.5
		Emit_Rate = 0.005
		emit_dir = 0.0
		emit_spread = 360.0
		velocity = 4
		friction = (-3.01, 12.0)
		time = 0.25
	}
	<rp_fx02> = <id>
	Create2DParticleSystem {
		parent = <parent_cont>
		Pos = (0.0, 0.0)
		z_priority = -1.0
		material = sys_Particle_Spark01_sys_Particle_Spark01
		start_color = [255 255 255 255]
		end_color = <colorout>
		start_scale = (1.5, 1.5)
		end_scale = (5.5, 0.15)
		start_angle_spread = 360.0
		min_rotation = 0
		max_rotation = 360
		emit_start_radius = 10
		emit_radius = 0.5
		Emit_Rate = 0.01
		emit_dir = 0.0
		emit_spread = 360.0
		velocity = 4
		friction = (0.0, 0.0)
		time = 0.15
	}
	<rp_fx03> = <id>
	Wait \{0.1
		Second}
	if NOT ($calibrate_lag_enabled = 1)
		SoundEvent \{event = audio_powers_star_acquire}
	endif
	Destroy2DParticleSystem kill_when_empty id = <rp_fx01>
	if ScreenElementExists \{id = star_meter_counter_glow01}
		star_meter_counter_glow01 :se_setprops \{alpha = 1
			time = 0.1}
		star_meter_counter_glow02 :se_setprops \{alpha = 1
			time = 0.1}
	endif
	Wait \{0.1
		Second}
	if ScreenElementExists \{id = star_meter_counter_glow01}
		star_meter_counter_glow01 :se_setprops \{alpha = 0
			time = 0.3}
		star_meter_counter_glow02 :se_setprops \{alpha = 0
			time = 0.3}
	endif
	Wait \{0.3
		Seconds}
	DestroyScreenElement \{id = star_meter_counter_glow01}
	Destroy2DParticleSystem id = <rp_fx02> kill_when_empty
	Destroy2DParticleSystem id = <rp_fx03> kill_when_empty
endscript
