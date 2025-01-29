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
	formatText checksumName = song '%s_%e' s = <song_prefix> e = <event_string> AddToStringLookup = true
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
	scriptname = ($<song> [<array_entry>].Scr)
	if (<scriptname> = band_playloop || <scriptname> = Band_PlayIdle)
		TimeMarkerReached_SetParams time_offset = (<time_offset> -2 * 16.667) array = <song> array_entry = <array_entry> ArrayOfStructures
	else
		TimeMarkerReached_SetParams time_offset = <time_offset> array = <song> array_entry = <array_entry> ArrayOfStructures
	endif
	begin
	if TimeMarkerReached
		GetSongTimeMs time_offset = <time_offset>
		break
	endif
	WaitOneGameFrame
	repeat
	TimeMarkerReached_ClearParams
	scriptname = ($<song> [<array_entry>].Scr)
	if (<scriptname> = band_playclip)
		nullscript
	elseif (<scriptname> = band_playloop)
		0x3fac2d4f index = <array_entry>
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
	<array_entry> = (<array_entry> + 1)
	repeat <array_Size>
endscript

script GuitarEvent_MissedNote \{extended_miss = 0}
	0x8a941e36 = 0
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
endscript

script GuitarEvent_HitNotes 
	if (<updatevolume> = true)
		UpdateGuitarVolume
	endif
endscript

script GuitarEvent_HitNote 
	SpawnScriptNow GuitarEvent_HitNote_Spawned params = {<...>}
endscript

script GuitarEvent_HitNote_Spawned 
	if GotParam \{kick}
		guitarevent_kick_drum_hit_note Player = <Player> player_text = <player_text>
	elseif GotParam \{open_note}
		guitarevent_hit_open_note Player = <Player> player_text = <player_text>
	elseif GotParam \{beginner_note}
		guitarevent_hit_beginner_note player_text = <player_text>
	else
		WaitOneGameFrame
		Scale = (2.0, 2.0)
		<Scale> = (1.0, 1.0)
		if GotParam \{kick}
			<Scale> = (7.0, 0.5)
		elseif GotParam \{open_note}
			<Scale> = (7.0, 0.5)
		elseif GotParam \{beginner_note}
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

script GuitarEvent_StarPowerOn 
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
	waitTime = 0.18
	Wait <waitTime> Seconds
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
	WhammyFXOff <...>
endscript

script GuitarEvent_SongFailed 
	setscriptcannotpause
	0x79db87d7
	OnExitRun \{0xf00f29a9}
	ui_event_wait_for_safe
	ui_event_get_top
	if NOT (<base_name> = 'gameplay')
		if ui_event_exists_in_stack \{Name = 'gameplay'}
			ui_event_block \{event = menu_back
				data = {
					state = Uistate_gameplay
				}}
		endif
	endif
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if ($failed_song = 1)
		return
	endif
	if ($cheat_invincible = 1)
		return
	endif
	if ($playing_song_for_real = 0)
		return
	endif
	Change \{playing_song_for_real = 0}
	if ($game_mode = practice || $game_mode = tutorial)
		return
	endif
	restore_player_part_settings
	if ($is_network_game)
		online_fail_song
	else
		KillSpawnedScript \{Name = guitar_jam_playback_recording}
		KillSpawnedScript \{Name = guitar_jam_drum_playback}
		KillSpawnedScript \{Name = jam_input_whammy_spawned}
		jam_stop_all_samples
		jam_deinit_reverb
		SpawnScriptNow \{GuitarEvent_SongFailed_Spawned}
	endif
endscript

script GuitarEvent_SongFailed_Spawned 
	if ($is_attract_mode = 1)

		return
	endif
	disable_highway_prepass
	disable_bg_viewport
	lightshow_songfailed
	GetSongTimeMs
	Change failed_song_time = <time>
	PauseGame
	Progression_SongFailed
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
	if ($game_mode = p2_pro_faceoff)
		return
	endif
	songunload
	PauseGame
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
			CreateScreenElement \{Type = TextBlockElement
				id = 0x567f64ac
				parent = hud_root
				text = qs(0xdb96ac31)
				font = fontgrid_text_a8
				just = [
					center
					center
				]
				internal_just = [
					center
					center
				]
				z_priority = 400
				Scale = 0.7
				Pos = (600.0, 360.0)
				rgba = [
					0
					200
					200
					255
				]
				dims = (1280.0, 720.0)}
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
	switch <part>
		case vocals
		icon = band_hud_microphone2
		Pos = (550.0, 80.0)
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
				Scale = 2
				Pos = <Pos>
				rgba = [255 0 0 255]
			}
		endif
	endif
endscript
gpulog_outputfilename = 'none'

script GuitarEvent_SongWon 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	setscriptcannotpause
	0x79db87d7
	OnExitRun \{0xf00f29a9}
	ui_event_wait_for_safe
	ui_event_get_top
	if NOT (<base_name> = 'gameplay')
		if ui_event_exists_in_stack \{Name = 'gameplay'}
			ui_event_block \{event = menu_back
				data = {
					state = Uistate_gameplay
				}}
		endif
	endif
	Change \{playing_song_for_real = 0}
	if ($output_gpu_log = 1)
		if isps3
			formatText \{TextName = FileName
				'%s_gpu_ps3'
				s = $current_level
				DontAssertForChecksums}
		else
			formatText \{TextName = FileName
				'%s_gpu'
				s = $current_level
				DontAssertForChecksums}
		endif
		if NOT stringequals \{a = $gpulog_outputfilename
				b = 'none'}
			<FileName> = $gpulog_outputfilename
		endif
		TextOutputEnd output_text FileName = <FileName>
	endif
	if ($output_song_stats = 1)
		formatText \{TextName = FileName
			'%s_stats'
			s = $current_song
			DontAssertForChecksums}
		TextOutputStart
		TextOutput \{text = qs(0x3f02a90c)}
		formatText TextName = text qs(0xfccb1331) s = ($player1_status.score) DontAssertForChecksums
		TextOutput text = <text>
		formatText TextName = text qs(0x26c27108) n = ($player1_status.notes_hit) t = ($player1_status.total_notes) DontAssertForChecksums
		TextOutput text = <text>
		formatText TextName = text qs(0xd67d4308) r = ($player1_status.best_run) DontAssertForChecksums
		TextOutput text = <text>
		formatText TextName = text qs(0x6bb1c560) m = ($player1_status.max_notes) DontAssertForChecksums
		TextOutput text = <text>
		formatText TextName = text qs(0x26a9ba16) b = ($player1_status.base_score) DontAssertForChecksums
		TextOutput text = <text>
		if (($player1_status.base_score) = 0)
			formatText \{TextName = text
				qs(0x30357c57)}
		else
			formatText TextName = text qs(0xbcc2e990) s = (($player1_status.score) / ($player1_status.base_score)) DontAssertForChecksums
		endif
		TextOutput text = <text>
		if (($player1_status.total_notes) = 0)
			formatText \{TextName = text
				qs(0xc8e34ec5)}
		else
			formatText TextName = text qs(0x2b87036c) s = ((($player1_status.notes_hit) / ($player1_status.total_notes)) * 100.0) DontAssertForChecksums
		endif
		TextOutput text = <text>
		TextOutputEnd output_text FileName = <FileName>
	endif
	if ($current_num_players = 2)
		GetSongTimeMs
		if ($last_time_in_lead_player = 0)
			Change structurename = player1_status time_in_lead = ($player1_status.time_in_lead + <time> - $last_time_in_lead)
		elseif ($last_time_in_lead_player = 1)
			Change structurename = player2_status time_in_lead = ($player2_status.time_in_lead + <time> - $last_time_in_lead)
		endif
		Change \{last_time_in_lead_player = -1}
	endif
	restore_player_part_settings
	KillSpawnedScript \{Name = guitar_jam_playback_recording}
	KillSpawnedScript \{Name = guitar_jam_drum_playback}
	KillSpawnedScript \{Name = jam_input_whammy_spawned}
	jam_stop_all_samples
	jam_deinit_reverb
	SpawnScriptNow \{GuitarEvent_SongWon_Spawned}
endscript

script GuitarEvent_SongWon_Spawned 
	if ($is_attract_mode = 1)
		ui_event \{event = menu_back}
		return
	endif
	if ($autotest_on = 1 && $autotest_turbo_mode = 1)
		setslomo \{10.0}
	endif
	Change track_last_song = ($current_song)
	Change \{calibrate_lag_failed_num = 0}
	Change \{last_song_failed = None}
	Change \{current_song_failed_num = 0}
	if ($game_mode = practice)
		return
	elseif ($game_mode = tutorial)
		return
	elseif ($0xc7e670d7 = 1 || $0x9b2cba3f = 1)
		quickplay_skip_song
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
	if ($game_mode = gh4_p1_career || $game_mode = gh4_p2_career || $game_mode = p2_coop || $game_mode = p1_quickplay || $game_mode = p2_quickplay || $game_mode = gh4_p3_career || $game_mode = gh4_p4_career || $game_mode = p3_quickplay || $game_mode = p4_quickplay)
		SpawnScriptNow \{cheer_before_explosion}
	endif

	Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $current_crowd_looping_bg_area_good}
	crowd_surge_and_sustain_at_end_of_song
	SpawnScriptNow \{You_Rock_Waiting_Crowd_SFX}
	tie = FALSE
	if ($game_mode = p2_pro_faceoff)
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
			formatText TextName = winner_text qs(0xe3029fec) s = <winner>
			winner_space_between = (50.0, 0.0)
			winner_scale = 1.5
		endif
	else
		winner_text = Random (@ qs(0xebdedfc6) @ qs(0xebdedfc6) )
		winner_space_between = (45.0, 0.0)
		fit_dims = (350.0, 0.0)
		winner_scale = 1.0
	endif
	SpawnScriptNow \{waitandkillhighway}
	KillSpawnedScript \{Name = jiggle_text_array_elements}
	SpawnScriptNow \{wait_and_play_you_rock_movie}
	create_mushroomcloudhand text = <winner_text>
	SpawnScriptNow \{you_rock_sfx_end}
	Change \{old_song = None}
	Progression_SongWon
	if ($current_transition = preencore)
		end_song
		UnPauseGame
		Transition_Play \{Type = preencore}
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
		UnPauseGame
		if ($is_network_game = 0)
			Transition_Play \{Type = songwon}
		else
			if ($game_mode = p4_pro_faceoff || $game_mode = p8_pro_faceoff)
				opponent_score = ($band2_status.score)
				our_score = ($band1_status.score)
				if (<opponent_score> > <our_score>)
					Transition_Play \{Type = songlost}
				else
					Transition_Play \{Type = songwon}
				endif
			else
				Transition_Play \{Type = songwon}
			endif
		endif
		Transition_Wait
		Change \{current_transition = None}
		PauseGame
	endif
	KillSpawnedScript \{Name = create_exploding_text}
	if ($end_credits = 1 && $current_song = $final_credits_song)
		destroy_exploding_text \{parent = 'you_rock_physics'}
		destroy_exploding_text \{parent = 'you_rock_2_physics'}
		Change \{end_credits = 0}
		career_song_ended_select_quit \{for_credits_venue = 1}
		get_progression_globals ($current_progression_flag)
		ui_memcard_autosave \{event = menu_back
			state = uistate_gig_posters
			data = {
				all_active_players = true
				0x6d221ff1
			}}
	else
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
					if (<Type> = quickplay)
						data = {state = uistate_song_breakdown 0xaabed717}
					else
						data = {state = uistate_song_breakdown ENCORE_TRANSITION}
					endif
					ui_event_get_top
					if (<base_name> = 'controller_disconnect' || <base_name> = 'pausemenu_quit_warning')
						ui_event event = menu_replace data = {<data> no_sound}
					else
						generic_event_choose no_sound data = <data>
					endif
				else
					if ($is_network_game = 1 && <Type> != career)
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
									end_of_setlist_transition
								}}
						else
							ui_event \{event = menu_change
								data = {
									state = uistate_song_breakdown
									gig_complete = 1
									end_of_setlist_transition
								}}
						endif
					endif
				endif
			endif
		endif
	endif
endscript

script kill_you_rock_movie 
	KillMovie \{textureSlot = 1}
endscript
g_you_rock_movie = None

script create_you_rock_effect \{player_status = player1_status}

	switch ($g_you_rock_movie)
		case player1_wins
		case player2_wins
		case fret_flames
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

script beat_test_script 

endscript
0x0c3d9dcf = {
	id = Blank
	parent = Blank
	Pos = (0.0, 0.0)
	rot_angle = 0.0
	Type = SpriteElement
	material = 0xabd58364
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

script guitarevent_hit_beginner_note 
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

script create_mushroomcloudhand \{text = qs(0x6f6d143d)}
	destroy_all_exploding_text
	SpawnScriptNow create_exploding_text params = {text = <text>}
	if ScreenElementExists \{id = mushroomcloudhand}
		DestroyScreenElement \{id = mushroomcloudhand}
	endif
	CreateScreenElement \{parent = root_window
		id = mushroomcloudhand
		Type = descinterface
		desc = 'you_rock_gh5'
		z_priority = 0}
	SpawnScriptNow \{handofgod_fx_01}
	SpawnScriptNow \{handofgod_fx_02}
	DestroyScreenElement \{id = mushroomcloudhand}
endscript

script hot_start_achieved \{Band = 0
		combo = 0}
	gamemode_gettype
	if (<Type> = practice)
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
		elseif ($game_mode = gh4_p2_career || $game_mode = p2_quickplay)
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

		if ($game_mode = gh4_p2_career || $game_mode = p2_quickplay)
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
