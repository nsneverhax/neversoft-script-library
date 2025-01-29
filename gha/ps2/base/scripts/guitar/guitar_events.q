guitar_events = [
	{
		event = missed_note
		Scr = GuitarEvent_MissedNote
	}
	{
		event = unnecessary_note
		Scr = GuitarEvent_UnnecessaryNote
	}
	{
		event = hit_notes
		Scr = GuitarEvent_HitNotes
	}
	{
		event = hit_note
		Scr = GuitarEvent_HitNote
	}
	{
		event = star_power_on
		Scr = GuitarEvent_StarPowerOn
	}
	{
		event = star_power_off
		Scr = GuitarEvent_StarPowerOff
	}
	{
		event = song_failed
		Scr = GuitarEvent_SongFailed
	}
	{
		event = song_won
		Scr = GuitarEvent_SongWon
	}
	{
		event = star_hit_note
		Scr = GuitarEvent_StarHitNote
	}
	{
		event = star_sequence_bonus
		Scr = GuitarEvent_StarSequenceBonus
	}
	{
		event = star_miss_note
		Scr = GuitarEvent_StarMissNote
	}
	{
		event = whammy_on
		Scr = GuitarEvent_WhammyOn
	}
	{
		event = whammy_off
		Scr = GuitarEvent_WhammyOff
	}
	{
		event = star_whammy_on
		Scr = GuitarEvent_StarWhammyOn
	}
	{
		event = star_whammy_off
		Scr = GuitarEvent_StarWhammyOff
	}
	{
		event = note_window_open
		Scr = GuitarEvent_Note_Window_Open
	}
	{
		event = note_window_close
		Scr = GuitarEvent_Note_Window_Close
	}
	{
		event = crowd_poor_medium
		Scr = GuitarEvent_crowd_poor_medium
	}
	{
		event = crowd_medium_good
		Scr = GuitarEvent_crowd_medium_good
	}
	{
		event = crowd_medium_poor
		Scr = GuitarEvent_crowd_medium_poor
	}
	{
		event = crowd_good_medium
		Scr = GuitarEvent_crowd_good_medium
	}
	{
		event = first_gem
		Scr = GuitarEvent_CreateFirstGem
	}
	{
		event = firstnote_window_open
		Scr = GuitarEvent_FirstNote_Window_Open
	}
]

script create_guitar_events 

	GetArraySize \{$guitar_events}
	array_entry = 0
	begin

	event = ($guitar_events [<array_entry>].event)
	ExtendCrc <event> <player_text> out = event
	SetEventHandler response = 0x84fd71d0 event = <event> Scr = 0x45ccb98d params = {event_spawned = <array_entry>}
	array_entry = (<array_entry> + 1)
	repeat <array_Size>
	Block
endscript

script event_iterator 

	get_song_prefix song = <song_name>
	formatText checksumName = song '%s_%e' s = <song_prefix> e = <event_string> AddToStringLookup
	array_entry = 0
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
	if ScriptExists <scriptname>
		SpawnScriptNow <scriptname> params = {time = <time> ($<song> [<array_entry>].params)} id = song_event_scripts
	elseif SymbolIsCFunc <scriptname>
		<scriptname> {time = <time> ($<song> [<array_entry>].params)}
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
	if ($game_mode = training)
		return
	endif
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

script GuitarEvent_MissedNote 
	0xdc30ffce
	begin
	if 0xd652c570
		break
	endif
	WaitOneGameFrame
	repeat
	0xaea40874
endscript

script highway_pulse_black 
	<half_time> = ($highway_pulse_time / 2.0)
	formatText checksumName = highway 'Highway_2D%p' p = <player_text> AddToStringLookup = true
	DoScreenElementMorph id = <highway> rgba = ($highway_pulse) time = <half_time>
	Wait <half_time> Seconds
	DoScreenElementMorph id = <highway> rgba = ($highway_normal) time = <half_time>
endscript

script GuitarEvent_UnnecessaryNote 
	0xc620303c
	begin
	if 0x906175c3
		break
	endif
	WaitOneGameFrame
	repeat
	0x83f54e7a
endscript

script GuitarEvent_HitNotes 
	wait_for_correct_frame Player = ($<player_status>.Player)
	if GuitarEvent_HitNotes_CFunc
		0x92996416
	endif
	if ($Debug_Audible_HitNote = 1)
		SoundEvent \{event = GH_SFX_HitNoteSoundEvent}
	endif
endscript

script GuitarEvent_HitNote 
	wait_for_correct_frame Player = <Player>
	if ($game_mode = p2_battle || $boss_battle = 1)
		Change structurename = <player_status> last_hit_note = <Color>
	endif
	WaitOneGameFrame
	hit_note_fx Name = <fx_id> Pos = <Pos> player_text = <player_text> star = ($<player_status>.star_power_used) Player = <Player>
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

script hit_note_fx 
	NoteFX
	Wait \{15
		gameframes}
	if ScreenElementExists id = <fx_id>
		DestroyScreenElement id = <fx_id>
	endif
endscript

script GuitarEvent_StarPowerOn 
	wait_for_correct_frame Player = <Player>
	GH_Star_Power_Verb_On
	StarPowerOn Player = <Player>
endscript

script GuitarEvent_StarPowerOff 
	wait_for_correct_frame Player = ($<player_status>.Player)
	GH_Star_Power_Verb_Off
	SpawnScriptNow rock_meter_star_power_off params = {player_text = <player_text>}
	SpawnScriptLater Kill_StarPower_StageFX params = {<...>}
	formatText checksumName = cont 'starpower_container_left%p' p = <player_text> AddToStringLookup = true
	if ScreenElementExists id = <cont>
		DoScreenElementMorph id = <cont> alpha = 0
	endif
	formatText checksumName = cont 'starpower_container_right%p' p = <player_text> AddToStringLookup = true
	if ScreenElementExists id = <cont>
		DoScreenElementMorph id = <cont> alpha = 0
	endif
	formatText checksumName = highway 'Highway_2D%p' p = <player_text> AddToStringLookup = true
	if ScreenElementExists id = <highway>
		SetScreenElementProps id = <highway> rgba = ($highway_normal)
	endif
	SpawnScriptNow \{Kill_StarPower_Camera}
endscript

script GuitarEvent_PreFretbar 
	waitTime = 0.18
	Wait <waitTime> Seconds
	if ($<player_status>.star_power_used = 1)
		if ($game_mode != tutorial)
			SoundEvent \{event = Crowd_Individual_Clap_To_Beat}
		endif
	else
		if ($CrowdListenerStateClapOn1234 = 1)
			SoundEvent \{event = Crowd_Individual_Clap_To_Beat}
		endif
	endif
endscript
beat_flip = 0

script GuitarEvent_Fretbar 
	if ($current_num_players = 2)
		if ($game_mode = p2_battle || $boss_battle)
			<dying> = 0
			if (($player1_status.current_health) <= $crowd_poor_medium * $highway_flash_dying)
				<dying> = 1
			endif
			set_sidebar_flash dying = <dying> player_status = player1_status
			<dying> = 0
			if (($player2_status.current_health) <= $crowd_poor_medium * $highway_flash_dying)
				<dying> = 1
			endif
			if NOT ($player1_status.highway_layout = solo_highway)
				set_sidebar_flash dying = <dying> player_status = player2_status
			endif
		else
			<dying> = 0
			if ($current_crowd <= $crowd_poor_medium * $highway_flash_dying)
				<dying> = 1
			endif
			if ($game_mode = p2_faceoff)
				<dying> = 0
			endif
			if ($game_mode = p2_pro_faceoff)
				<dying> = 0
			endif
			set_sidebar_flash dying = <dying> player_status = player1_status
			if NOT ($player1_status.highway_layout = solo_highway)
				set_sidebar_flash dying = <dying> player_status = player2_status
			endif
		endif
	else
		<dying> = 0
		if ($current_crowd <= $crowd_poor_medium * $highway_flash_dying)
			<dying> = 1
		endif
		set_sidebar_flash dying = <dying> player_status = player1_status
	endif
	Change beat_flip = (1 - $beat_flip)
endscript

script set_sidebar_flash 
	formatText checksumName = left 'sidebar_left%p' p = ($<player_status>.text) AddToStringLookup = true
	formatText checksumName = right 'sidebar_right%p' p = ($<player_status>.text) AddToStringLookup = true
	if ($<player_status>.star_power_used = 1)
		if ($beat_flip = 0)
			SetScreenElementProps id = <left> rgba = ($sidebar_starpower0)
			SetScreenElementProps id = <right> rgba = ($sidebar_starpower0)
		else
			SetScreenElementProps id = <left> rgba = ($sidebar_starpower1)
			SetScreenElementProps id = <right> rgba = ($sidebar_starpower1)
		endif
	else
		if (<dying> = 1)
			if ($beat_flip = 0)
				SetScreenElementProps id = <left> rgba = ($sidebar_dying0)
				SetScreenElementProps id = <right> rgba = ($sidebar_dying0)
			else
				SetScreenElementProps id = <left> rgba = ($sidebar_dying1)
				SetScreenElementProps id = <right> rgba = ($sidebar_dying1)
			endif
		else
			if ($<player_status>.star_power_amount >= 50.0)
				if ($beat_flip = 0)
					SetScreenElementProps id = <left> rgba = ($sidebar_starready0)
					SetScreenElementProps id = <right> rgba = ($sidebar_starready0)
				else
					SetScreenElementProps id = <left> rgba = ($sidebar_starready1)
					SetScreenElementProps id = <right> rgba = ($sidebar_starready1)
				endif
			else
				if ($beat_flip = 0)
					SetScreenElementProps id = <left> rgba = ($sidebar_normal0)
					SetScreenElementProps id = <right> rgba = ($sidebar_normal0)
				else
					SetScreenElementProps id = <left> rgba = ($sidebar_normal1)
					SetScreenElementProps id = <right> rgba = ($sidebar_normal1)
				endif
			endif
		endif
	endif
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
	GetHeldPattern controller = ($<player_status>.controller) player_status = <player_status>
	if (<strum> = <hold_pattern>)
		Change structurename = <player_status> guitar_volume = 100
		0x92996416
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
		Change structurename = <player_status> guitar_volume = 100
		0x92996416
	endif
endscript

script GuitarEvent_Note_Window_Open 
	0x61d5c03d
	begin
	if 0xa986e49a
		break
	endif
	WaitOneGameFrame
	repeat
	0x27532ad2
endscript

script GuitarEvent_Note_Window_Close 
	if ($Debug_Audible_Close = 1)
		SoundEvent \{event = GH_SFX_BeatWindowCloseSoundEvent}
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

script GuitarEvent_StarWhammyOn 
endscript

script GuitarEvent_StarWhammyOff 
endscript

script GuitarEvent_SongFailed 
	Change \{playing_song_for_real = 0}
	if ($game_mode = training || $game_mode = tutorial)
		return
	endif
	if ($is_network_game)
		SpawnScriptNow \{online_fail_song}
		return
	endif
	if ($game_mode = p2_battle)
		GuitarEvent_SongWon \{battle_win = 1}
	else
		KillSpawnedScript \{Name = GuitarEvent_SongWon_Spawned}
		SpawnScriptNow \{GuitarEvent_SongFailed_Spawned}
	endif
endscript

script GuitarEvent_SongFailed_Spawned 
	if NOT ($boss_battle = 1)
		disable_highway_prepass
		disable_bg_viewport
	endif
	if ($is_network_game)
		KillSpawnedScript \{Name = dispatch_player_state}
		kill_start_key_binding
		if ($ui_flow_manager_state [0] = online_pause_fs)
			net_unpausegh3
		endif
		mark_unsafe_for_shutdown
	endif
	GetSongTimeMs
	Change failed_song_time = <time>
	Achievements_SongFailed
	PauseGame
	Progression_SongFailed
	if ($boss_battle = 1)
		kill_start_key_binding
		if ($current_song = bossdevil)
			preload_movie = 'Satan-Battle_LOSS'
		else
			preload_movie = 'Player2_wins'
		endif
		killallmovies
		formatText checksumName = 0xfe864fb1 '%s' s = <preload_movie>
		Change g_you_rock_movie = <0xfe864fb1>
		formatText TextName = winner_text '%s Rocks!' s = ($current_boss.character_name)
		winner_space_between = (50.0, 0.0)
		winner_scale = 1.0
		if ($current_boss.character_profile = Morello)
			<winner_space_between> = (40.0, 0.0)
			<winner_scale> = 1.0
		endif
		if ($current_boss.character_profile = slash)
			<winner_space_between> = (40.0, 0.0)
			<winner_scale> = 1.0
			<winner_space_between> = (<winner_space_between> * 1.3)
			<winner_scale> = (<winner_scale> * 1.6)
		endif
		if ($current_boss.character_profile = Satan)
			<winner_space_between> = (40.0, 0.0)
			<winner_scale> = 1.0
			<winner_space_between> = (<winner_space_between> * 1.8)
			<winner_scale> = (<winner_scale> * 1.7)
		endif
		SpawnScriptNow \{wait_and_play_you_rock_movie}
		Wait \{0.2
			Seconds}
		SpawnScriptNow \{waitandkillhighway}
		SpawnScriptNow create_exploding_text params = {parent = 'you_rock_physics' text = <winner_text>}
	endif
	if ($is_network_game = 0)
		xenon_singleplayer_session_begin_uninit
		SpawnScriptNow \{xenon_singleplayer_session_complete_uninit
			params = {
				song_failed
			}}
	endif
	UnPauseGame
	SoundEvent \{event = Crowd_Fail_Song_SFX}
	SoundEvent \{event = GH_SFX_You_Lose_Single_Player}
	Transition_Play \{Type = songlost}
	Transition_Wait
	Change \{current_transition = None}
	PauseGame
	restore_start_key_binding
	SpawnScriptNow \{ui_flow_manager_respond_to_action
		params = {
			action = fail_song
		}}
	if ($current_num_players = 1)
		SoundEvent \{event = Crowd_Fail_Song_SFX}
	else
		SoundEvent \{event = Crowd_Med_To_Good_SFX}
	endif
	if ($is_network_game)
		mark_safe_for_shutdown
	endif
	KillSpawnedScript \{Name = create_exploding_text}
	destroy_exploding_text \{parent = 'you_rock_physics'}
endscript

script 0xa9c096c7 
	CreateScreenElement \{Type = SpriteElement
		id = gh3c_fade_box
		parent = root_window
		Pos = (640.0, 360.0)
		just = [
			center
			center
		]
		rgba = [
			0
			0
			0
			255
		]
		alpha = 0
		dims = (1280.0, 720.0)
		z_priority = 50}
	DoScreenElementMorph \{id = gh3c_fade_box
		alpha = 1.0
		time = 7}
endscript
gpulog_outputfilename = 'none'

script GuitarEvent_SongWon \{battle_win = 0}
	Change \{playing_song_for_real = 0}
	if NotCD
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
			TextOutput \{text = 'Player 1'}
			formatText TextName = text 'Score: %s' s = ($player1_status.score) DontAssertForChecksums
			TextOutput text = <text>
			formatText TextName = text 'Notes Hit: %n of %t' n = ($player1_status.notes_hit) t = ($player1_status.total_notes) DontAssertForChecksums
			TextOutput text = <text>
			formatText TextName = text 'Best Run: %r' r = ($player1_status.best_run) DontAssertForChecksums
			TextOutput text = <text>
			formatText TextName = text 'Max Notes: %m' m = ($player1_status.max_notes) DontAssertForChecksums
			TextOutput text = <text>
			formatText TextName = text 'Base score: %b' b = ($player1_status.base_score) DontAssertForChecksums
			TextOutput text = <text>
			if (($player1_status.base_score) = 0)
				formatText \{TextName = text
					'Score Scale: n/a'}
			else
				formatText TextName = text 'Score Scale: %s' s = (($player1_status.score) / ($player1_status.base_score)) DontAssertForChecksums
			endif
			TextOutput text = <text>
			if (($player1_status.total_notes) = 0)
				formatText \{TextName = text
					'Notes Hit Percentage: n/a'}
			else
				formatText TextName = text 'Notes Hit Percentage: %s' s = ((($player1_status.notes_hit) / ($player1_status.total_notes)) * 100.0) DontAssertForChecksums
			endif
			TextOutput text = <text>
			TextOutputEnd output_text FileName = <FileName>
		endif
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
	if ($game_mode = p2_battle)
		if NOT (<battle_win> = 1)
			Change \{save_current_powerups_p1 = $current_powerups_p1}
			Change \{save_current_powerups_p2 = $current_powerups_p2}
			Change \{current_powerups_p1 = [
					0
					0
					0
				]}
			Change \{current_powerups_p2 = [
					0
					0
					0
				]}
			Change structurename = player1_status save_num_powerups = ($player1_status.current_num_powerups)
			Change structurename = player2_status save_num_powerups = ($player2_status.current_num_powerups)
			Change \{structurename = player1_status
				current_num_powerups = 0}
			Change \{structurename = player2_status
				current_num_powerups = 0}
			p1_health = ($player1_status.current_health)
			p2_health = ($player2_status.current_health)
			Change structurename = player1_status save_health = <p1_health>
			Change structurename = player2_status save_health = <p2_health>
			battlemode_killspawnedscripts
			if ScreenElementExists \{id = battlemode_container}
				DestroyScreenElement \{id = battlemode_container}
			endif
			Change \{battle_sudden_death = 1}
		else
			battlemode_killspawnedscripts
			Change \{battle_sudden_death = 0}
		endif
	endif
	KillSpawnedScript \{Name = GuitarEvent_SongFailed_Spawned}
	SpawnScriptNow \{GuitarEvent_SongWon_Spawned}
endscript

script GuitarEvent_SongWon_Spawned 
	if NOT ($game_mode = p2_battle)
		if ($game_mode = p2_career)
			Change structurename = player1_status total_notes = ($player1_status.max_notes + $player2_status.max_notes)
			Change structurename = player2_status total_notes = ($player1_status.max_notes + $player2_status.max_notes)
		else
			Change structurename = player1_status total_notes = ($player1_status.max_notes)
			Change structurename = player2_status total_notes = ($player2_status.max_notes)
		endif
	endif
	if ($is_network_game)
		mark_unsafe_for_shutdown
		if ($shutdown_game_for_signin_change_flag = 1)
			return
		endif
		if ($ui_flow_manager_state [0] = online_pause_fs)
			net_unpausegh3
		endif
		KillSpawnedScript \{Name = dispatch_player_state}
		if ($player2_present)
			SendNetMessage {
				Type = net_win_song
				note_streak = ($player1_status.best_run)
				notes_hit = ($player1_status.notes_hit)
				total_notes = ($player1_status.total_notes)
			}
		endif
		if NOT ($game_mode = p2_battle || $game_mode = p2_faceoff || $Cheat_NoFail = 1)
			online_song_end_write_stats
		endif
	endif
	if ($is_attract_mode = 1)
		SpawnScriptNow \{ui_flow_manager_respond_to_action
			params = {
				action = exit_attract_mode
				play_sound = 0
			}}
		return
	endif
	if ($game_mode = training || $game_mode = tutorial)
		return
	endif
	if ($current_song = bossdevil && $devil_finish = 0)
		Change \{devil_finish = 1}
	else
		Change \{devil_finish = 0}
	endif
	Progression_EndCredits_Done
	if NOT ($devil_finish = 1)
		if NOT ($battle_sudden_death = 1)
			Progression_SongWon
		endif
	endif
	if ($devil_finish = 0 && $battle_sudden_death = 0 && $current_transition != preencore && $current_transition != preaerosmith)
		0xa9c096c7
	endif
	PauseGame
	kill_start_key_binding
	if ($battle_sudden_death = 1)
		SoundEvent \{event = GH_SFX_BattleMode_Sudden_Death}
	else
		if ($game_mode = p1_career || $game_mode = p2_coop || $game_mode = p1_quickplay || $game_mode = p2_quickplay)
			SoundEvent \{event = You_Rock_End_SFX}
		endif
	endif
	SpawnScriptNow \{You_Rock_Waiting_Crowd_SFX}
	if ($game_mode = p2_battle || $boss_battle = 1)
		if ($player1_status.current_health >= $player2_status.current_health)
			if ($current_song = bossdevil)
				preload_movie = 'Satan-Battle_WIN'
			else
				preload_movie = 'Player1_wins'
			endif
		else
			if ($current_song = bossdevil)
				preload_movie = 'Satan-Battle_LOSS'
			else
				preload_movie = 'Player2_wins'
			endif
		endif
		if ($current_song = bossdevil && $devil_finish = 0)
			preload_movie = 'Golden_Guitar'
		endif
		if ($battle_sudden_death = 1)
			preload_movie = 'Fret_Flames'
		endif
		killallmovies
		formatText checksumName = 0xfe864fb1 '%s' s = <preload_movie>
		Change g_you_rock_movie = <0xfe864fb1>
	endif
	if NOT ($devil_finish = 1 || $battle_sudden_death = 1)
		SpawnScriptNow \{wait_and_play_you_rock_movie}
	endif
	tie = FALSE
	text_pos = (640.0, 360.0)
	rock_legend = 0
	fit_dims = (350.0, 0.0)
	if ($battle_sudden_death = 1)
		winner_text = 'Sudden Death!'
		winner_space_between = (30.0, 0.0)
		winner_scale = 1.3
	else
		if ($game_mode = p2_battle)
			p1_health = ($player1_status.current_health)
			p2_health = ($player2_status.current_health)
			if (<p2_health> > <p1_health>)
				winner = 'Two'
				SoundEvent \{event = UI_2ndPlayerWins_SFX}
			else
				winner = 'One'
				SoundEvent \{event = UI_1stPlayerWins_SFX}
			endif
			if ($is_network_game)
				if (<p2_health> > <p1_health>)
					Name = ($opponent_gamertag)
				else
					if (NetSessionFunc Obj = match func = get_gamertag)
						Name = <Name>
					endif
				endif
				formatText TextName = winner_text <Name>
				<text_pos> = (640.0, 240.0)
			else
				formatText TextName = winner_text 'Player %s Rocks!' s = <winner>
			endif
			winner_space_between = (25.0, 0.0)
			winner_scale = 1.0
		elseif ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff)
			p1_score = ($player1_status.score)
			p2_score = ($player2_status.score)
			if (<p2_score> > <p1_score>)
				winner = 'Two'
				SoundEvent \{event = UI_2ndPlayerWins_SFX}
			elseif (<p1_score> > <p2_score>)
				winner = 'One'
				SoundEvent \{event = UI_1stPlayerWins_SFX}
			else
				<tie> = true
				SoundEvent \{event = You_Rock_End_SFX}
			endif
			if (<tie> = true)
				winner_text = 'TIE!'
				winner_space_between = (40.0, 0.0)
				winner_scale = 2.0
			else
				if ($is_network_game)
					if (<p2_score> > <p1_score>)
						Name = ($opponent_gamertag)
					else
						if (NetSessionFunc Obj = match func = get_gamertag)
							Name = <Name>
						endif
					endif
					formatText TextName = winner_text <Name>
					<text_pos> = (640.0, 240.0)
				else
					formatText TextName = winner_text 'Player %s Rocks!' s = <winner>
				endif
				winner_space_between = (25.0, 0.0)
				winner_scale = 1.0
			endif
		else
			winner_text = 'You Rock!'
			winner_space_between = (45.0, 0.0)
			fit_dims = (350.0, 0.0)
			winner_scale = 3.5
		endif
		if ($devil_finish = 1)
			winner_text = 'Now Finish Him!'
			winner_space_between = (55.0, 0.0)
			winner_scale = 1.0
			winner_space_between = (<winner_space_between> * 0.5)
		endif
		if ($current_song = bossdevil && $devil_finish = 0)
			<rock_legend> = 1
			winner_text = 'YOU\'RE A'
			winner_space_between = (40.0, 0.0)
			winner_scale = 1.1
		endif
	endif
	StringLength string = <winner_text>
	<fit_dims> = (<str_len> * (23.0, 0.0))
	if (<fit_dims>.(1.0, 0.0) >= 350)
		<fit_dims> = (350.0, 0.0)
	endif
	if NOT English
		winner_space_between = (45.0, 0.0)
		winner_scale = 2.5
		if (<str_len> > 24)
			winner_space_between = (15.0, 0.0)
			winner_scale = 0.7
		elseif (<str_len> > 19)
			winner_space_between = (20.0, 0.0)
			winner_scale = 1.1
		elseif (<str_len> > 12)
			winner_space_between = (25.0, 0.0)
			winner_scale = 1.3
		elseif (<str_len> > 10)
			winner_space_between = (36.0, 0.0)
			winner_scale = 2.2
		endif
	endif
	<yourock_text> = <winner_text>
	if (<rock_legend> = 1)
		if NOT English
			temp_string = 'ROCK LEGEND!'
			StringLength string = <temp_string>
			winner_space_between = (47.0, 0.0)
			winner_scale = 2.6
			if (<str_len> > 24)
				winner_space_between = (15.0, 0.0)
				winner_scale = 0.7
			elseif (<str_len> > 19)
				winner_space_between = (20.0, 0.0)
				winner_scale = 1.1
			elseif (<str_len> > 12)
				winner_space_between = (25.0, 0.0)
				winner_scale = 1.3
			elseif (<str_len> > 10)
				winner_space_between = (36.0, 0.0)
				winner_scale = 2.2
			endif
		endif
	endif
	if (($is_network_game) && ($battle_sudden_death = 0) && (<tie> = FALSE))
		if NOT ($game_mode = p2_coop)
			<yourock_text_2> = 'Rocks!'
		endif
	endif
	if NOT ($devil_finish = 1 || $battle_sudden_death = 1)
		KillSpawnedScript \{Name = jiggle_text_array_elements}
		SpawnScriptNow create_exploding_text params = {parent = 'you_rock_physics' text = <yourock_text> placement = top}
		if (<rock_legend> = 1)
			SpawnScriptNow create_exploding_text params = {parent = 'you_rock_legend_physics' text = <yourock_text_legend> placement = bottom}
		endif
		if ($is_network_game)
			if NOT ($game_mode = p2_coop)
				SpawnScriptNow create_exploding_text params = {parent = 'you_rock_2_physics' text = <yourock_text_2> placement = bottom}
			endif
		endif
		if ($game_mode = p1_career)
			if ($current_song = bossjoe || $current_song = walkthiswayrundmc)
				if ($current_song = bossjoe)
					find_secret_character_index \{info_name = joep}
					<boss_character> = <index>
				elseif ($current_song = walkthiswayrundmc)
					find_secret_character_index \{info_name = dmc}
					<boss_character> = <index>
				endif
				if (<boss_character> >= 0)
					unlocked_for_purchase = 1
					GetGlobalTags ($Secret_Characters [<boss_character>].id)
					if (<unlocked_for_purchase> = 0)
						KillSpawnedScript \{Name = Boss_Unlocked_Text}
						if ScreenElementExists \{id = boss_unlocked_text_container}
							DestroyScreenElement \{id = boss_unlocked_text_container}
						endif
						SpawnScriptNow \{Boss_Unlocked_Text}
						SetGlobalTags ($Secret_Characters [<boss_character>].id) params = {unlocked_for_purchase = 1}
					endif
				endif
			endif
		endif
	endif
	Change \{old_song = None}
	if NOT ($devil_finish = 1)
		if NOT ($battle_sudden_death = 1)
			if ($game_mode = p1_career)
				menu_top_rockers_check_for_new_top_score \{use_band_name}
			endif
			if ($current_transition = preencore)
				end_song
				UnPauseGame
				Transition_Play \{Type = preencore}
				Transition_Wait
				Change \{current_transition = None}
				PauseGame
				pauseallsounds \{Pause = 0}
				ui_flow_manager_respond_to_action \{action = preencore_win_song}
				ENCORE_TRANSITION = 1
			elseif ($current_transition = preaerosmith)

				end_song
				UnPauseGame
				Transition_Play \{Type = preaerosmith}
				Transition_Wait
				Change \{current_transition = None}
				PauseGame
				pauseallsounds \{Pause = 0}
				ui_flow_manager_respond_to_action \{action = preaerosmith_win_song}
				ENCORE_TRANSITION = 1
			elseif ($current_transition = preboss)
				end_song
				UnPauseGame
				Transition_Play \{Type = preboss}
				Transition_Wait
				Change \{current_transition = None}
				PauseGame
				pauseallsounds \{Pause = 0}
				Change \{use_last_player_scores = 1}
				Change old_song = ($current_song)
				Change \{show_boss_helper_screen = 1}
				ui_flow_manager_respond_to_action \{action = preboss_win_song}
				return
			else
				UnPauseGame
				Transition_Play \{Type = songwon}
				Transition_Wait
				Change \{current_transition = None}
				PauseGame
			endif
		else
			UnPauseGame
			Transition_Play \{Type = songwon}
			SpawnScriptNow \{wait_and_play_you_rock_movie}
			SpawnScriptNow create_exploding_text params = {parent = 'you_rock_physics' text = <yourock_text>}
			KillSpawnedScript \{Name = Sudden_Death_Helper_Text}
			if ScreenElementExists \{id = sudden_death_helper_container}
				DestroyScreenElement \{id = sudden_death_helper_container}
			endif
			SpawnScriptNow \{Sudden_Death_Helper_Text}
			Wait \{0.1
				Seconds}
			SpawnScriptNow \{waitandkillhighway}
			Wait \{6
				Seconds}
			Change \{current_transition = None}
			PauseGame
		endif
	else
		UnPauseGame
		Transition_Play \{Type = songwon}
		SpawnScriptNow \{wait_and_play_you_rock_movie}
		KillSpawnedScript \{Name = jiggle_text_array_elements}
		SpawnScriptNow create_exploding_text params = {parent = 'you_rock_physics' text = <yourock_text>}
		devil_finish_anim
		Wait \{0.15
			Seconds}
		SpawnScriptNow \{waitandkillhighway}
		Wait \{2.5
			Seconds}
		Wait \{0.5
			Seconds}
		Change \{current_transition = None}
		create_loading_screen
		PauseGame
	endif
	if ($battle_sudden_death = 1)
		StopSoundEvent \{GH_SFX_BattleMode_Sudden_Death}

		Change \{battle_sudden_death = 1}
		if ($is_network_game)
			ui_flow_manager_respond_to_action \{action = sudden_death_begin}
			SpawnScriptLater \{load_and_sync_timing
				params = {
					start_delay = 4000
					player_status = player1_status
				}}
		else
			ui_flow_manager_respond_to_action \{action = select_retry}
			SpawnScriptNow \{restart_song
				params = {
					sudden_death = 1
				}}
		endif
		KillSpawnedScript \{Name = create_exploding_text}
		destroy_exploding_text \{parent = 'you_rock_physics'}
	elseif ($end_credits = 1 && $current_song = kingsandqueenscredits)
		KillSpawnedScript \{Name = create_exploding_text}
		destroy_exploding_text \{parent = 'you_rock_physics'}
		destroy_exploding_text \{parent = 'you_rock_2_physics'}
		Change \{end_credits = 0}
		career_song_ended_select_quit
		start_flow_manager \{flow_state = career_credits_autosave_fs}
	elseif ($devil_finish = 1)
		start_devil_finish
	else
		KillSpawnedScript \{Name = create_exploding_text}
		destroy_all_exploding_text
		ui_flow_manager_respond_to_action \{action = win_song}
	endif
	SoundEvent \{event = Crowd_Med_To_Good_SFX}
	if ($is_network_game)
		mark_safe_for_shutdown
	endif
endscript

script Sudden_Death_Helper_Text 
	CreateScreenElement \{Type = ContainerElement
		id = sudden_death_helper_container
		parent = root_window
		Pos = (0.0, 0.0)}
	formatText \{checksumName = text_checksum
		'sudden_death_helper'}
	CreateScreenElement {
		Type = TextElement
		id = <text_checksum>
		parent = sudden_death_helper_container
		Pos = (640.0, 500.0)
		text = 'All powerups are death drain attacks!'
		font = text_a4
		Scale = 0.8
		rgba = [255 255 255 255]
		just = [center bottom]
		z_priority = 500
	}
	formatText \{checksumName = text_checksum2
		'sudden_death_helper2'}
	CreateScreenElement {
		Type = TextElement
		id = <text_checksum2>
		parent = sudden_death_helper_container
		Pos = (640.0, 540.0)
		text = 'Launch a devastating DEATH DRAIN!'
		font = text_a4
		Scale = 0.8
		rgba = [255 255 255 255]
		just = [center bottom]
		z_priority = 500
	}
	Wait \{5
		Seconds}
	DoScreenElementMorph {
		id = <text_checksum>
		alpha = 0
		time = 1
	}
	DoScreenElementMorph {
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
	if ($current_song = bossjoe)
		formatText \{TextName = boss
			'Joe Perry'}
		Pos = (634.0, 580.0)
	elseif ($current_song = walkthiswayrundmc)
		Pos = (634.0, 580.0)
		formatText \{TextName = boss
			'DMC'}
	endif
	formatText \{TextName = unlocked
		'unlocked'}
	formatText \{TextName = visit_store
		'VISIT THE VAULT'}
	formatText TextName = text '%s %b, %v' s = <boss> b = <unlocked> v = <visit_store>
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
		font = text_a11
		Scale = 1.1
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
		DoScreenElementMorph {
			id = <boss_unlocked>
			alpha = 0
			time = 1
		}
	endif
	Wait \{1
		Second}
	if ($current_song = bossjoe)
		formatText \{TextName = boss
			'Joe Perry Guitar Battle'}
		Pos = (634.0, 580.0)
		formatText \{TextName = unlocked
			'unlocked'}
		formatText TextName = text '%s %b %v' s = <boss> b = <unlocked> v = <visit_store>
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
			font = text_a11
			Scale = 0.8
			rgba = [255 255 255 255]
			just = [center bottom]
			z_priority = 500
			Shadow
			shadow_offs = (1.0, 1.0)
			shadow_rgba = [0 0 0 255]
			alpha = 0
		}
		if ScreenElementExists id = <boss_unlocked>
			DoScreenElementMorph {
				id = <boss_unlocked>
				alpha = 1
				time = 1
			}
		endif
		Wait \{3
			Seconds}
		if ScreenElementExists id = <boss_unlocked>
			DoScreenElementMorph {
				id = <boss_unlocked>
				alpha = 0
				time = 1
			}
		endif
	endif
endscript
0xe22ef7b4 = NULL

script start_devil_finish 
	Change \{end_credits = 0}
	marker_count = 37
	get_song_prefix song = ($current_song)
	formatText checksumName = marker_array '%s_markers' s = <song_prefix>
	starttime = ($<marker_array> [<marker_count>].time)
	startmarker = <marker_count>
	Change \{CameraCuts_ForceTime = 0}
	StopRendering
	restart_gem_scroller song_name = ($current_song) difficulty = ($current_difficulty) difficulty2 = ($current_difficulty2) starttime = <starttime> startmarker = <startmarker> no_render = 1 devil_finish_restart = 1
	destroy_loading_screen
	0x810401fe \{FileName = 'OTHER\\WLA\\DEVILDIE'
		0x3dd98e8d = 33075
		stereo = true}
	Change 0xe22ef7b4 = <unique_id>
	waitforpreload_stream \{Stream = 0xe22ef7b4}
	StartPreLoadedStream \{$0xe22ef7b4
		buss = Crowd_PreSong_Intro}
	devil_lose_anim
	Wait \{20
		frames}
	StartRendering
	KillSpawnedScript \{Name = create_exploding_text}
	destroy_exploding_text \{parent = 'you_rock_physics'}
	destroy_exploding_text \{parent = 'you_rock_legend_physics'}
endscript

script devil_finish_anim 
	WaitOneGameFrame
	BASSIST :Obj_SwitchScript \{Transition_PlayAnim_Spawned
		params = {
			anim = GH3_Guit_Satn_A_Lose02
		}}
	Change \{CameraCuts_AllowNoteScripts = FALSE}
	Change \{CameraCuts_ForceTime = 3.2}
	CameraCuts_SetArrayPrefix \{prefix = 'cameras_boss_finish'
		length = 0
		changenow}
	SpawnScriptNow \{devil_camera_flash}
endscript

script devil_camera_flash 
	Wait \{2.7
		Seconds}
	fadetoblack \{On
		time = 0.03
		alpha = 1.0
		z_priority = 1000
		texture = white
		rgba = [
			255
			255
			255
			255
		]}
	Wait \{0.04
		Seconds}
	SoundEvent \{event = Song_Intro_Kick_SFX}
	SoundEvent \{event = Practice_Mode_Crash2}
	fadetoblack \{OFF}
endscript

script devil_lose_anim 
	Change \{CameraCuts_AllowNoteScripts = FALSE}
	CameraCuts_SetArrayPrefix \{prefix = 'cameras_boss_dead'
		length = 0
		changenow}
	BASSIST :Obj_SwitchScript \{Transition_PlayAnim_Spawned
		params = {
			cycle = 1
			stance = lose
			anim = GH3_Guit_Satn_A_Lose03
		}}
endscript
g_you_rock_movie = None

script create_you_rock_effect \{player_status = player1_status}
	CreateScreenElement \{Type = ContainerElement
		id = 0x28b7e339
		parent = root_window
		Pos = (0.0, 0.0)}
	0xc32fe099 = 0.8
	htx = (640.0 - ($highway_top_width / 2.0))
	gts = ($highway_top_width / 5.0)
	gsx = (<htx> + (<gts> / 2.0) + (<gts> * 0.0))
	rsx = (<htx> + (<gts> / 2.0) + (<gts> * 1.0))
	ysx = (<htx> + (<gts> / 2.0) + (<gts> * 2.0))
	bsx = (<htx> + (<gts> / 2.0) + (<gts> * 3.0))
	osx = (<htx> + (<gts> / 2.0) + (<gts> * 4.0))
	hbw = ($highway_top_width + ($highway_top_width * $widthOffsetFactor))
	hbx = (640.0 - (<hbw> / 2.0))
	gbs = (<hbw> / 5.0)
	gex = (<hbx> + (<gbs> / 2.0) + (<gbs> * 0.0))
	rex = (<hbx> + (<gbs> / 2.0) + (<gbs> * 1.0))
	yex = (<hbx> + (<gbs> / 2.0) + (<gbs> * 2.0))
	bex = (<hbx> + (<gbs> / 2.0) + (<gbs> * 3.0))
	oex = (<hbx> + (<gbs> / 2.0) + (<gbs> * 4.0))
	0xaff72fb8 = [0.0 0.0 0.0 0.0 0.0]
	0xa21e37cd = [0.0 0.0 0.0 0.0 0.0]
	SetArrayElement ArrayName = 0xaff72fb8 index = 0 NewValue = <gsx>
	SetArrayElement ArrayName = 0xaff72fb8 index = 1 NewValue = <rsx>
	SetArrayElement ArrayName = 0xaff72fb8 index = 2 NewValue = <ysx>
	SetArrayElement ArrayName = 0xaff72fb8 index = 3 NewValue = <bsx>
	SetArrayElement ArrayName = 0xaff72fb8 index = 4 NewValue = <osx>
	SetArrayElement ArrayName = 0xa21e37cd index = 0 NewValue = <gex>
	SetArrayElement ArrayName = 0xa21e37cd index = 1 NewValue = <rex>
	SetArrayElement ArrayName = 0xa21e37cd index = 2 NewValue = <yex>
	SetArrayElement ArrayName = 0xa21e37cd index = 3 NewValue = <bex>
	SetArrayElement ArrayName = 0xa21e37cd index = 4 NewValue = <oex>
	0xb468a887 = [[255 255 255 255] [255 64 64 255] [255 156 93 255] [180 100 30 255] [170 26 26 255]]
	0x97327036 = [0.25 0.1 0.15 0.3 0.05]
	0x87e1a50f = [(1.2, 0.8) (1.8, 1.2) (0.8, 0.4) (1.0, 0.9) (0.7, 0.7)]
	0x875b3b17 = [9.1 9.2 9.3 9.4 9.5]
	0xf1036f5e = [flames flames]
	p1_score = ($player1_status.score)
	p2_score = ($player2_status.score)
	0x18b82ad1 = 0
	if ($game_mode = p2_battle)
		if ($player1_status.current_health <= 0.0)
			<0x18b82ad1> = 1
		endif
		if ($player2_status.current_health <= 0.0)
			<0x18b82ad1> = 1
		endif
	endif
	if ($current_num_players = 2)
		if NOT ($battle_sudden_death = 1)
			if ($game_mode != p2_quickplay)
				if (<0x18b82ad1>)
					if ($player1_status.current_health <= 0.0)
						SetArrayElement \{ArrayName = 0xf1036f5e
							index = 0
							NewValue = Lightning}
					endif
					if ($player2_status.current_health <= 0.0)
						SetArrayElement \{ArrayName = 0xf1036f5e
							index = 1
							NewValue = Lightning}
					endif
				else
					if (<p1_score> < <p2_score>)
						SetArrayElement \{ArrayName = 0xf1036f5e
							index = 0
							NewValue = Lightning}
					endif
					if (<p2_score> < <p1_score>)
						SetArrayElement \{ArrayName = 0xf1036f5e
							index = 1
							NewValue = Lightning}
					endif
				endif
			endif
		endif
	endif
	SpawnScriptNow 0xccc9cfe1 params = {wait_time = <0xc32fe099>}
	Player = 0
	player_count = ($current_num_players)
	begin
	if ($current_num_players = 1)
		0xeaf2fe00 = 0
	else
		if (<Player> = 0)
			0xeaf2fe00 = (0 - $x_offset_p2)
		else
			0xeaf2fe00 = ($x_offset_p2)
		endif
	endif
	if (<0xf1036f5e> [<Player>] = flames)
		index = 0
		count = 5
		begin
		0xa34438ed = ((1.0, 0.0) * (<0xaff72fb8> [<index>] + <0xeaf2fe00>) + (0.0, 1.0) * ($highway_playline - $highway_height))
		0x37408261 = ((1.0, 0.0) * (<0xa21e37cd> [<index>] + <0xeaf2fe00>) + (0.0, 1.0) * (720))
		GetRandomValue \{Name = 0x579a5435
			a = 1
			b = 4
			integer}
		flame_scale = (1.8, 1.2)
		CreateScreenElement {
			Type = SpriteElement
			parent = 0x28b7e339
			use_animated_uvs = true
			top_down_v
			frame_length = (<0x97327036> [<0x579a5435>])
			num_uv_frames = (2.0, 2.0)
			dims = (96.0, 192.0)
			just = [center bottom]
			Pos = <0xa34438ed>
			Scale = (<flame_scale> * 0.25)
			z_priority = (<0x875b3b17> [0])
			rgba = (<0xb468a887> [<0x579a5435>])
			texture = 0x834b46ad
		}
		RunScriptOnScreenElement id = <id> 0x0c92f658 params = {time = <0xc32fe099> Pos = <0x37408261> Scale = (<flame_scale> * 4.2 * 0.25)}
		flame_index = 1
		0x8099bc04 = 4
		begin
		GetRandomValue \{Name = 0x579a5435
			a = 0
			b = 4
			integer}
		flame_scale = (<0x87e1a50f> [<flame_index>])
		CreateScreenElement {
			Type = SpriteElement
			parent = 0x28b7e339
			blend = add
			use_animated_uvs = true
			top_down_v
			frame_length = (<0x97327036> [<0x579a5435>])
			num_uv_frames = (2.0, 2.0)
			dims = (96.0, 192.0)
			just = [center bottom]
			Pos = <0xa34438ed>
			Scale = (<flame_scale> * 0.25)
			z_priority = (<0x875b3b17> [<flame_index>])
			rgba = (<0xb468a887> [<0x579a5435>])
			texture = 0x834b46ad
		}
		RunScriptOnScreenElement id = <id> 0x0c92f658 params = {time = <0xc32fe099> Pos = <0x37408261> Scale = (<flame_scale> * 3.8 * 0.25)}
		flame_index = (<flame_index> + 1)
		repeat <0x8099bc04>
		index = (<index> + 1)
		repeat <count>
	else
		SpawnScriptNow 0x9748671f params = {<...>}
	endif
	Player = (<Player> + 1)
	repeat <player_count>
	Wait (<0xc32fe099> + 0.6) Seconds
	KillSpawnedScript \{Name = 0x9748671f}
	DestroyScreenElement \{id = 0x28b7e339}
endscript

script 0x9748671f 
	if (<Player> = 0)
		highway_container = gem_containerp1
	else
		highway_container = gem_containerp2
	endif
	GetScreenElementPosition id = <highway_container>
	0xd4258082 = ((0.0, 1.0).<screenelementpos>)
	SpawnScriptNow 0x016eec1e params = {highway_id = <highway_container> time = <0xc32fe099>}
	0x23b7898d = 0.02
	0xa4fa443d = (<0xc32fe099> / <0x23b7898d>)
	CastToInteger \{0xa4fa443d}
	y_diff = (720 - ($highway_playline - $highway_height))
	begin
	GetRandomValue \{Name = 0x5727892d
		a = 0
		b = 4
		integer}
	GetRandomValue \{Name = 0x8d435de7
		a = 0
		b = 1}
	x_diff = (<0xa21e37cd> [<0x5727892d>] - <0xaff72fb8> [<0x5727892d>])
	x_pos = (<0xaff72fb8> [<0x5727892d>] + <0x8d435de7> * <x_diff>)
	x_pos = (<x_pos> + <0xeaf2fe00>)
	y_pos = (($highway_playline - $highway_height) + <0x8d435de7> * <y_diff>)
	GetScreenElementPosition id = <highway_container>
	0xae46e4d6 = (<0xd4258082> - <screenelementpos>.(0.0, 1.0))
	y_pos = (<y_pos> + <0xae46e4d6>)
	CreateScreenElement {
		Type = SpriteElement
		parent = 0x28b7e339
		use_animated_uvs = true
		blend = add
		top_down_v
		frame_length = 0.005
		num_uv_frames = (8.0, 1.0)
		just = [center bottom]
		Pos = ((1.0, 0.0) * <x_pos> + (0.0, 1.0) * <y_pos>)
		z_priority = 10
		texture = sys_Big_Bolt01_sys_Big_Bolt01
	}
	Wait (<0x23b7898d>) Seconds
	if ScreenElementExists id = <id>
		DestroyScreenElement id = <id>
	endif
	repeat <0xa4fa443d>
endscript

script 0xccc9cfe1 \{wait_time = 0.0}
	if NOT ($devil_finish = 1 || $battle_sudden_death = 1)
		KillSpawnedScript \{Name = jiggle_text_array_elements}
		SpawnScriptLater \{jiggle_text_array_elements
			params = {
				id = yourock_text
				time = 1.0
				wait_time = 3000
				explode = 1
			}}
		if ($current_song = bossdevil && $devil_finish = 0)
			SpawnScriptLater \{jiggle_text_array_elements
				params = {
					id = yourock_text_legend
					time = 1.0
					wait_time = 3000
					explode = 1
				}}
		endif
		if ($is_network_game)
			SpawnScriptLater \{jiggle_text_array_elements
				params = {
					id = yourock_text_2
					time = 1.0
					wait_time = 3000
					explode = 1
				}}
		endif
		Wait (<wait_time>) Seconds
		SpawnScriptNow \{0x285fc901}
	endif
endscript

script 0x0c92f658 
	DoMorph time = <time> Pos = <Pos> Scale = <Scale>
	Wait \{0.4
		Seconds}
	DoMorph \{time = 0.2
		alpha = 0
		Scale = 0.001}
endscript

script 0x016eec1e 
	SpawnScriptNow 0xbaad94ac params = {highway_id = <highway_id>}
	Wait <time> Seconds
	KillSpawnedScript \{Name = 0xbaad94ac}
endscript

script 0xbaad94ac 
	begin
	GetScreenElementPosition id = <highway_id>
	GetRandomValue \{Name = x_offset
		a = -10
		b = 10}
	GetRandomValue \{Name = y_offset
		a = 0
		b = 10}
	<screenelementpos> = (<screenelementpos> + (1.0, 0.0) * <x_offset> + (0.0, 1.0) * (<y_offset>))
	DoScreenElementMorph time = 0 id = <highway_id> Pos = <screenelementpos>
	Wait \{0.05
		Seconds}
	repeat
endscript

script wait_and_play_you_rock_movie 
	create_you_rock_effect
endscript

script waitandkillhighway \{wait_time = 0.5}
	Wait (<wait_time>) Seconds
	SoundEvent \{event = Crowd_Fast_Surge_Cheer}
	Player = 1
	begin
	formatText checksumName = player_status 'player%i_status' i = <Player> AddToStringLookup
	formatText TextName = player_text 'p%i' i = <Player> AddToStringLookup
	0xdb27dc8e <...> time = ($current_intro.highway_move_time / 1000.0)
	Player = (<Player> + 1)
	repeat $current_num_players
endscript

script 0x285fc901 
	SoundEvent \{event = Crowd_Fast_Surge_Cheer}
	Player = 1
	begin
	formatText checksumName = player_status 'player%i_status' i = <Player> AddToStringLookup
	formatText TextName = player_text 'p%i' i = <Player> AddToStringLookup
	0xdb27dc8e <...> time = 0.005
	Player = (<Player> + 1)
	repeat $current_num_players
endscript
current_song_time = -1
time_to_next_beat = -1
next_beat_time = -1
tempo_iterator_offset = 0

script tempo_matching_iterator 

	get_song_prefix song = <song_name>
	formatText checksumName = timesig '%s_timesig' s = <song_prefix> AddToStringLookup
	GetArraySize $<timesig>
	timesig_entry = 0
	timesig_size = <array_Size>
	timesig_num = 0
	measure_count = 0
	song = ($<player_status>.current_song_fretbar_array)
	array_entry = 0
	fretbar_count = 0
	Change tempo_iterator_offset = <time_offset>
	GetArraySize $<song>
	get_song_end_time song = ($current_song)
	begin
	<entry> = (<array_Size> -2)
	<fret_time> = ($<song> [<entry>])
	if (<total_end_time> > <fret_time>)
		break
	endif
	<array_Size> = (<array_Size> - 1)
	repeat
	GetSongTimeMs time_offset = <time_offset>
	if NOT (<array_Size> = 0)
		begin
		if (<timesig_entry> < <timesig_size>)
			if ($<timesig> [<timesig_entry>] [0] <= $<song> [<array_entry>])
				<timesig_num> = ($<timesig> [<timesig_entry>] [1])
				<timesig_den> = ($<timesig> [<timesig_entry>] [2])
				fretbar_count = 0
				timesig_entry = (<timesig_entry> + 1)
			endif
		endif
		if ((<time> - <skipleadin>) < $<song> [<array_entry>])
			break
		endif
		array_entry = (<array_entry> + 1)
		fretbar_count = (<fretbar_count> + 1)
		if (<fretbar_count> = <timesig_num>)
			measure_count = (<measure_count> + 1)
			fretbar_count = 0
		endif
		repeat <array_Size>
		final_array_entry = (<array_Size> - 1)
		array_Size = (<array_Size> - <array_entry>)
		begin
		TimeMarkerReached_SetParams time_offset = <time_offset> array = <song> array_entry = <array_entry>
		begin
		if TimeMarkerReached
			GetSongTimeMs time_offset = <time_offset>
			if (<timesig_entry> < <timesig_size>)
				if ($<timesig> [<timesig_entry>] [0] <= $<song> [<array_entry>])
					<timesig_num> = ($<timesig> [<timesig_entry>] [1])
					<timesig_den> = ($<timesig> [<timesig_entry>] [2])
					fretbar_count = 0
					timesig_entry = (<timesig_entry> + 1)
				endif
			endif
			break
		endif
		Wait \{1
			gameframe}
		repeat
		TimeMarkerReached_ClearParams
		marker = ($<song> [<array_entry>])
		<array_entry> = (<array_entry> + 1)
		fretbar_count = (<fretbar_count> + 1)
		if (<fretbar_count> = <timesig_num>)
			measure_count = (<measure_count> + 1)
			fretbar_count = 0
			spawn_measure_callbacks
		endif
		if (<array_entry> < <final_array_entry>)
			Change next_beat_time = ($<song> [<array_entry>])
			Change time_to_next_beat = ($next_beat_time - <marker>)
			spawn_beat_callbacks \{time_to_next_beat = $time_to_next_beat}
		else
			Change \{next_beat_time = -1}
			Change \{time_to_next_beat = -1}
		endif
		repeat <array_Size>
	endif
endscript
measure_callback = nullscript
beat_callback = nullscript

script setmeasurecallback 
	if GotParam \{callback}
		Change measure_callback = <callback>
	endif
endscript

script clearmeasurecallbacks 
	Change \{measure_callback = nullscript}
endscript

script setbeatcallback 
	if GotParam \{callback}
		Change beat_callback = <callback>
	endif
endscript

script clearbeatcallbacks 
	Change \{beat_callback = nullscript}
endscript

script gettimetonextbeat 
	GetSongTimeMs \{time_offset = $tempo_iterator_offset}
	return time_to_next_beat = ($next_beat_time - <time>)
endscript

script spawn_measure_callbacks 
	SpawnScriptNow \{$measure_callback}
endscript

script spawn_beat_callbacks 
	SpawnScriptNow $beat_callback params = {time_to_next_beat = <time_to_next_beat>}
endscript

script GuitarEvent_crowd_poor_medium 
endscript

script GuitarEvent_crowd_medium_good 
endscript

script GuitarEvent_crowd_medium_poor 
endscript

script GuitarEvent_crowd_good_medium 
endscript

script GuitarEvent_StarHitNote 
endscript

script GuitarEvent_StarSequenceBonus 
	wait_for_correct_frame Player = ($<player_status>.Player)
	if ($is_attract_mode = 1)
		return
	endif
	Change structurename = <player_status> sp_phrases_hit = ($<player_status>.sp_phrases_hit + 1)
	if isSinglePlayerGame
		SoundEvent \{event = Star_Power_Awarded_SFX}
	else
		SpawnScriptNow star_power_awarded_sfx_multiplayer params = {Player = ($<player_status>.Player)}
	endif
	formatText checksumName = container_id 'gem_container%p' p = ($<player_status>.text) AddToStringLookup = true
	GetArraySize \{$gem_colors}
	gem_count = 0
	begin
	<note> = ($<song> [<array_entry>] [(<gem_count> + 1)])
	if (<note> > 0)
		Color = ($gem_colors [<gem_count>])
		if ($<player_status>.lefthanded_button_ups = 1)
			<pos2d> = ($button_up_models.<Color>.left_pos_2d)
			<angle> = ($button_models.<Color>.angle)
		else
			<pos2d> = ($button_up_models.<Color>.pos_2d)
			<angle> = ($button_models.<Color>.left_angle)
		endif
		formatText checksumName = Name 'big_bolt%p%e' p = ($<player_status>.text) e = <gem_count> AddToStringLookup = true
		CreateScreenElement {
			Type = SpriteElement
			id = <Name>
			parent = <container_id>
			material = sys_Big_Bolt01_sys_Big_Bolt01
			blend = add
			use_animated_uvs = true
			top_down_v
			frame_length = 0.005
			num_uv_frames = (8.0, 1.0)
			rgba = [255 255 255 255]
			Pos = <pos2d>
			rot_angle = <angle>
			Scale = (0.5 * $star_power_bolt_scale)
			just = [center bottom]
			z_priority = 6
		}
	endif
	gem_count = (<gem_count> + 1)
	repeat <array_Size>
	Wait \{$star_power_bolt_time
		Seconds}
	gem_count = 0
	begin
	<note> = ($<song> [<array_entry>] [(<gem_count> + 1)])
	if (<note> > 0)
		formatText checksumName = Name 'big_bolt%p%e' p = ($<player_status>.text) e = <gem_count> AddToStringLookup = true
		DestroyScreenElement id = <Name>
		WaitOneGameFrame
	endif
	gem_count = (<gem_count> + 1)
	repeat <array_Size>
endscript

script GuitarEvent_StarMissNote 
endscript

script GuitarEvent_Multiplier4xOn 
endscript

script GuitarEvent_Multiplier4xOn_Spawned 
endscript

script GuitarEvent_Multiplier3xOn 
endscript

script GuitarEvent_Multiplier2xOn 
endscript

script kill_4x_fx 
endscript

script GuitarEvent_Multiplier4xOff 
	SoundEvent \{event = UI_SFX_Lose_Multiplier_4X}
	SoundEvent \{event = Lose_Multiplier_Crowd}
	SpawnScriptNow highway_pulse_multiplier_loss params = {player_text = ($<player_status>.text) multiplier = 4}
	kill_4x_fx <...>
endscript

script GuitarEvent_Multiplier3xOff 
	SoundEvent \{event = UI_SFX_Lose_Multiplier_3X}
	SpawnScriptNow highway_pulse_multiplier_loss params = {player_text = ($<player_status>.text) multiplier = 3}
endscript

script GuitarEvent_Multiplier2xOff 
	SoundEvent \{event = UI_SFX_Lose_Multiplier_2X}
	SpawnScriptNow highway_pulse_multiplier_loss params = {player_text = ($<player_status>.text) multiplier = 2}
endscript

script GuitarEvent_KillSong 
	GH3_SFX_Stop_Sounds_For_KillSong
	GH_Star_Power_Verb_Off
	formatText \{checksumName = player_status
		'player1_status'}
	kill_4x_fx player_status = <player_status>
	formatText \{checksumName = player_status
		'player2_status'}
	kill_4x_fx player_status = <player_status>
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
	setsoundbusseffects effect = $<echo_params>
	setsoundbusseffects effect = $<reverb_params>
endscript

script GuitarEvent_ExitVenue 
	setsoundbusseffects \{effect = $Echo_Crowd_Buss}
	setsoundbusseffects \{effect = $Reverb_Crowd_Buss}
endscript

script GuitarEvent_CreateFirstGem 
endscript

script first_gem_fx 
endscript

script destroy_first_gem_fx 
endscript

script GuitarEvent_GemStarPowerOn 
endscript

script GuitarEvent_BattleAttackFinished 
	GH3_Battle_Attack_Finished_SFX <...>
	Reset_Battle_DSP_Effects <...>
endscript

script GuitarEvent_TransitionIntro 
endscript

script GuitarEvent_TransitionFastIntro 
endscript

script GuitarEvent_TransitionPreEncore 
endscript

script guitarevent_transitionpreaerosmith 
endscript

script GuitarEvent_TransitionEncore 
endscript

script GuitarEvent_TransitionPreBoss 
endscript

script GuitarEvent_TransitionBoss 
endscript
