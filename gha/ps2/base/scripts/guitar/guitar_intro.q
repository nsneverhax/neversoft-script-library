intro_sequence_props = {
	song_title_pos = (255.0, 75.0)
	performed_by_pos = (255.0, 135.0)
	song_artist_pos = (255.0, 150.0)
	covered_by_text_pos = (255.0, 200.0)
	covered_by_pos = (255.0, 215.0)
	song_title_start_time = -6500
	song_title_fade_time = 700
	song_title_on_time = 3000
	highway_start_time = -2000
	highway_move_time = 2000
	button_ripple_start_time = -800
	button_ripple_per_button_time = 100
	hud_start_time = -400
	hud_move_time = 200
}
fastintro_sequence_props = {
	song_title_pos = (255.0, 75.0)
	performed_by_pos = (255.0, 135.0)
	song_artist_pos = (255.0, 150.0)
	covered_by_text_pos = (255.0, 200.0)
	covered_by_pos = (255.0, 215.0)
	song_title_start_time = -6700
	song_title_fade_time = 700
	song_title_on_time = 3000
	highway_start_time = -2000
	highway_move_time = 2000
	button_ripple_start_time = -800
	button_ripple_per_button_time = 100
	hud_start_time = -400
	hud_move_time = 200
}
practice_sequence_props = {
	song_title_pos = (255.0, 75.0)
	performed_by_pos = (255.0, 135.0)
	song_artist_pos = (255.0, 150.0)
	covered_by_text_pos = (255.0, 200.0)
	covered_by_pos = (255.0, 215.0)
	song_title_start_time = -6500
	song_title_fade_time = 700
	song_title_on_time = 3000
	highway_start_time = -3000
	highway_move_time = 2000
	button_ripple_start_time = -1800
	button_ripple_per_button_time = 100
	hud_start_time = -1400
	hud_move_time = 200
}
immediate_sequence_props = {
	song_title_pos = (255.0, 75.0)
	performed_by_pos = (255.0, 135.0)
	song_artist_pos = (255.0, 150.0)
	covered_by_text_pos = (255.0, 200.0)
	covered_by_pos = (255.0, 215.0)
	song_title_start_time = 0
	song_title_fade_time = 700
	song_title_on_time = 0
	highway_start_time = 0
	highway_move_time = 0
	button_ripple_start_time = 0
	button_ripple_per_button_time = 0
	hud_start_time = 0
	hud_move_time = 0
}
current_intro = fast_intro_sequence_props

script play_intro 

	if ($show_boss_helper_screen = 1)
		return
	endif
	if ($is_attract_mode = 1)
		disable_bg_viewport
		return
	endif
	KillSpawnedScript \{Name = GuitarEvent_SongFailed_Spawned}
	if GotParam \{FAST}
		Change \{current_intro = fastintro_sequence_props}
	elseif GotParam \{practice}
		Change \{current_intro = practice_sequence_props}
	else
		Change \{current_intro = intro_sequence_props}
	endif
	if ($game_mode != tutorial)
		SpawnScriptNow \{intro_song_info
			id = intro_scripts}
	endif
	if NOT ($Cheat_PerformanceMode = 1 && $is_network_game = 0)
		SpawnScriptNow \{intro_highway_move
			id = intro_scripts}
	endif
	Player = 1
	begin
	formatText checksumName = player_status 'player%i_status' i = <Player>
	formatText TextName = player_text 'p%i' i = <Player>
	SpawnScriptNow intro_buttonup_ripple params = <...> id = intro_scripts
	Player = (<Player> + 1)
	repeat $current_num_players
	if ($tutorial_disable_hud = 0)
		SpawnScriptNow \{intro_hud_move
			id = intro_scripts}
	endif
endscript

script destroy_intro 
	KillSpawnedScript \{id = intro_scripts}
	KillSpawnedScript \{Name = Song_Intro_Kick_SFX_Waiting}
	KillSpawnedScript \{Name = Song_Intro_Highway_Up_SFX_Waiting}
	KillSpawnedScript \{Name = move_highway_2d}
	KillSpawnedScript \{Name = intro_buttonup_ripple}
	KillSpawnedScript \{Name = intro_hud_move}
	DoScreenElementMorph \{id = intro_song_info_text
		alpha = 0}
	DoScreenElementMorph \{id = intro_artist_info_text
		alpha = 0}
	DoScreenElementMorph \{id = intro_performed_by_text
		alpha = 0}
	DoScreenElementMorph \{id = intro_covered_by_text
		alpha = 0}
	DoScreenElementMorph \{id = intro_covered_by
		alpha = 0}
	Player = 1
	begin
	formatText checksumName = player_status 'player%i_status' i = <Player> AddToStringLookup
	EnableInput controller = ($<player_status>.controller)
	Player = (<Player> + 1)
	repeat $current_num_players
endscript

script intro_buttonup_ripple 
	EnableInput OFF controller = ($<player_status>.controller)
	begin
	GetSongTimeMs
	if ($current_intro.button_ripple_start_time + $current_starttime < <time>)
		break
	endif
	WaitOneGameFrame
	repeat
	if ($current_intro.button_ripple_per_button_time = 0)
		return
	endif
	GetArraySize \{$gem_colors}
	SoundEvent \{event = Notes_Ripple_Up_SFX}
	ExtendCrc button_up_pixel_array ($<player_status>.text) out = pixel_array
	buttonup_count = 0
	begin
	Wait ($current_intro.button_ripple_per_button_time / 1000.0) Seconds
	array_count = 0
	begin
	Color = ($gem_colors [<array_count>])
	if (<array_count> = <buttonup_count>)
		SetArrayElement ArrayName = <pixel_array> globalarray index = <array_count> NewValue = $button_up_pixels
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
	buttonup_count = (<buttonup_count> + 1)
	repeat (<array_Size> + 1)
	EnableInput controller = ($<player_status>.controller)
endscript

script intro_song_info 
	begin
	GetSongTimeMs
	if ($current_intro.song_title_start_time + $current_starttime < <time>)
		break
	endif
	WaitOneGameFrame
	repeat
	if ($current_intro.song_title_on_time = 0)
		return
	endif
	get_song_title song = ($current_song)
	GetUpperCaseString <song_title>
	intro_song_info_text :SetProps text = <UppercaseString>
	GetScreenElementProps \{id = intro_song_info_text}
	GetScreenElementDims \{id = intro_song_info_text}
	x_pos = (<Pos>.(1.0, 0.0))
	0x32f9fe9b = (1280 - 64)
	if ((<x_pos> + <width>) > <0x32f9fe9b>)
		new_width = (<0x32f9fe9b> - <x_pos>)
		x_scale = (<new_width> / <width>)
		new_scale = ((<x_scale> * (1.0, 0.0)) + (<Scale> * (0.0, 1.0)))
		SetScreenElementProps id = intro_song_info_text Scale = <new_scale>
	endif
	intro_song_info_text :DoMorph Pos = ($current_intro.song_title_pos)
	get_song_artist song = ($current_song)
	GetUpperCaseString <song_artist>
	intro_artist_info_text :SetProps text = <UppercaseString>
	intro_artist_info_text :DoMorph Pos = ($current_intro.song_artist_pos)
	get_song_artist_text song = ($current_song)
	GetUpperCaseString <song_artist_text>
	intro_performed_by_text :SetProps text = <UppercaseString>
	intro_performed_by_text :DoMorph Pos = ($current_intro.performed_by_pos)
	get_song_covered_by song = ($current_song)
	if GotParam \{covered_by}
		GetUpperCaseString <covered_by>
		intro_covered_by_text :DoMorph Pos = ($current_intro.covered_by_text_pos)
		intro_covered_by :SetProps text = <UppercaseString>
		intro_covered_by :DoMorph Pos = ($current_intro.covered_by_pos)
	endif
	intro_song_info_text :SetProps \{z_priority = 5.0}
	intro_artist_info_text :SetProps \{z_priority = 5.0}
	intro_performed_by_text :SetProps \{z_priority = 5.0}
	DoScreenElementMorph id = intro_song_info_text alpha = 1 time = ($current_intro.song_title_fade_time / 1000.0)
	DoScreenElementMorph id = intro_performed_by_text alpha = 1 time = ($current_intro.song_title_fade_time / 1000.0)
	DoScreenElementMorph id = intro_artist_info_text alpha = 1 time = ($current_intro.song_title_fade_time / 1000.0)
	if GotParam \{covered_by}
		DoScreenElementMorph id = intro_covered_by_text alpha = 1 time = ($current_intro.song_title_fade_time / 1000.0)
		DoScreenElementMorph id = intro_covered_by alpha = 1 time = ($current_intro.song_title_fade_time / 1000.0)
	endif
	Wait ($current_intro.song_title_on_time / 1000.0) Seconds
	DoScreenElementMorph id = intro_song_info_text alpha = 0 time = ($current_intro.song_title_fade_time / 1000.0)
	DoScreenElementMorph id = intro_artist_info_text alpha = 0 time = ($current_intro.song_title_fade_time / 1000.0)
	DoScreenElementMorph id = intro_performed_by_text alpha = 0 time = ($current_intro.song_title_fade_time / 1000.0)
	if GotParam \{covered_by}
		DoScreenElementMorph id = intro_covered_by_text alpha = 0 time = ($current_intro.song_title_fade_time / 1000.0)
		DoScreenElementMorph id = intro_covered_by alpha = 0 time = ($current_intro.song_title_fade_time / 1000.0)
	endif
endscript

script intro_highway_move 
	begin
	GetSongTimeMs
	if ($current_intro.highway_start_time + $current_starttime < <time>)
		break
	endif
	WaitOneGameFrame
	repeat
	SpawnScriptNow \{Song_Intro_Highway_Up_SFX_Waiting}
	Player = 1
	begin
	formatText checksumName = player_status 'player%i_status' i = <Player> AddToStringLookup
	formatText TextName = player_text 'p%i' i = <Player> AddToStringLookup
	move_highway_camera_to_default <...> time = ($current_intro.highway_move_time / 1000.0)
	Player = (<Player> + 1)
	repeat $current_num_players
endscript

script intro_hud_move 
	begin
	GetSongTimeMs
	if ($current_intro.hud_start_time + $current_starttime < <time>)
		break
	endif
	WaitOneGameFrame
	repeat
	get_num_players_by_gamemode
	Player = 1
	begin
	formatText checksumName = player_status 'player%i_status' i = <Player> AddToStringLookup
	formatText TextName = player_text 'p%i' i = <Player> AddToStringLookup
	move_hud_to_default <...> time = ($current_intro.hud_move_time / 1000.0)
	Player = (<Player> + 1)
	repeat <num_players>
	if ($game_mode = p2_battle && $battle_sudden_death = 1)
		restore_saved_powerups
	endif
	SpawnScriptNow \{Song_Intro_Kick_SFX_Waiting}
endscript

script play_outro 
	SongUnLoadFSBIfDownloaded
	Kill_StarPower_Camera \{changecamera = 0}
	Kill_Walk_Camera \{changecamera = 0}
	Change \{structurename = player1_status
		star_power_amount = 0}
	Change \{structurename = player2_status
		star_power_amount = 0}
	Kill_StarPower_StageFX player_text = ($player1_status.text) player_status = $player1_status ifEmpty = 0
	Kill_StarPower_StageFX player_text = ($player2_status.text) player_status = $player2_status ifEmpty = 0
	Change \{showing_raise_axe = 0}
	LaunchGemEvent \{event = kill_objects}
	Player = 1
	begin
	formatText checksumName = player_status 'player%i_status' i = <Player> AddToStringLookup
	formatText TextName = player_text 'p%i' i = <Player> AddToStringLookup
	GuitarEvent_KillSong <...>
	destroy_hud <...>
	battlemode_deinit <...>
	bossbattle_deinit <...>
	faceoff_deinit <...>
	faceoff_volumes_deinit <...>
	Player = (<Player> + 1)
	repeat $max_num_players
	practicemode_deinit
	notemap_deinit
	kill_startup_script <...>
	KillSpawnedScript \{Name = create_gem}
	KillSpawnedScript \{Name = GuitarEvent_MissedNote}
	KillSpawnedScript \{Name = GuitarEvent_UnnecessaryNote}
	KillSpawnedScript \{Name = GuitarEvent_HitNotes}
	KillSpawnedScript \{Name = GuitarEvent_HitNote}
	KillSpawnedScript \{Name = GuitarEvent_StarPowerOn}
	KillSpawnedScript \{Name = GuitarEvent_StarPowerOff}
	KillSpawnedScript \{Name = GuitarEvent_StarHitNote}
	KillSpawnedScript \{Name = GuitarEvent_StarSequenceBonus}
	KillSpawnedScript \{Name = GuitarEvent_StarMissNote}
	KillSpawnedScript \{Name = GuitarEvent_WhammyOn}
	KillSpawnedScript \{Name = GuitarEvent_WhammyOff}
	KillSpawnedScript \{Name = GuitarEvent_StarWhammyOn}
	KillSpawnedScript \{Name = GuitarEvent_StarWhammyOff}
	KillSpawnedScript \{Name = GuitarEvent_Note_Window_Open}
	KillSpawnedScript \{Name = GuitarEvent_Note_Window_Close}
	KillSpawnedScript \{Name = GuitarEvent_crowd_poor_medium}
	KillSpawnedScript \{Name = GuitarEvent_crowd_medium_good}
	KillSpawnedScript \{Name = GuitarEvent_crowd_medium_poor}
	KillSpawnedScript \{Name = GuitarEvent_crowd_good_medium}
	KillSpawnedScript \{Name = GuitarEvent_CreateFirstGem}
	KillSpawnedScript \{Name = highway_pulse_black}
	KillSpawnedScript \{Name = GuitarEvent_HitNote_Spawned}
	KillSpawnedScript \{Name = GuitarEvent_HitNote}
	KillSpawnedScript \{Name = hit_note_fx}
	KillSpawnedScript \{Name = Do_StarPower_StageFX}
	KillSpawnedScript \{Name = Do_StarPower_Camera}
	KillSpawnedScript \{Name = first_gem_fx}
	KillSpawnedScript \{Name = gem_iterator}
	KillSpawnedScript \{Name = gem_array_stepper}
	KillSpawnedScript \{Name = gem_array_events}
	KillSpawnedScript \{Name = gem_step}
	KillSpawnedScript \{Name = gem_step_end}
	KillSpawnedScript \{Name = fretbar_iterator}
	KillSpawnedScript \{Name = Strum_iterator}
	KillSpawnedScript \{Name = FretPos_iterator}
	KillSpawnedScript \{Name = FretFingers_iterator}
	KillSpawnedScript \{Name = Drum_iterator}
	KillSpawnedScript \{Name = Drum_cymbal_iterator}
	KillSpawnedScript \{Name = WatchForStartPlaying_iterator}
	KillSpawnedScript \{Name = gem_scroller}
	KillSpawnedScript \{Name = button_checker}
	KillSpawnedScript \{Name = check_buttons}
	KillSpawnedScript \{Name = check_buttons_fast}
	KillSpawnedScript \{Name = fretbar_update_tempo}
	KillSpawnedScript \{Name = fretbar_update_hammer_on_tolerance}
	KillSpawnedScript \{Name = move_whammy}
	KillSpawnedScript \{Name = create_fretbar}
	KillSpawnedScript \{Name = move_highway_2d}
	KillSpawnedScript \{Name = update_score_fast}
	KillSpawnedScript \{Name = check_for_star_power}
	KillSpawnedScript \{Name = wait_for_inactive}
	KillSpawnedScript \{Name = GuitarEvent_PreFretbar}
	KillSpawnedScript \{Name = GuitarEvent_Fretbar}
	KillSpawnedScript \{Name = check_note_hold}
	KillSpawnedScript \{Name = star_power_whammy}
	KillSpawnedScript \{Name = show_star_power_ready}
	KillSpawnedScript \{Name = hud_glowburst_alert}
	Change \{star_power_ready_on_p1 = 0}
	Change \{star_power_ready_on_p2 = 0}
	KillSpawnedScript \{Name = event_iterator}
	KillSpawnedScript \{Name = win_song}
	KillSpawnedScript \{Name = hand_note_iterator}
	KillSpawnedScript \{Name = kill_object_later}
	KillSpawnedScript \{Name = show_coop_raise_axe_for_starpower}
	KillSpawnedScript \{Name = net_whammy_pitch_shift}
	KillSpawnedScript \{Name = Crowd_AllPlayAnim}
	KillSpawnedScript \{Name = hud_activated_star_power_spawned}
	KillSpawnedScript \{Name = pulsate_all_star_power_bulbs}
	KillSpawnedScript \{Name = pulsate_star_power_bulb}
	KillSpawnedScript \{Name = rock_meter_star_power_on}
	KillSpawnedScript \{Name = rock_meter_star_power_off}
	KillSpawnedScript \{Name = hud_activated_star_power}
	KillSpawnedScript \{Name = hud_move_note_scorebar}
	KillSpawnedScript \{Name = hud_flash_red_bg_p1}
	KillSpawnedScript \{Name = hud_flash_red_bg_p2}
	KillSpawnedScript \{Name = hud_flash_red_bg_kill}
	KillSpawnedScript \{Name = hud_lightning_alert}
	KillSpawnedScript \{Name = hud_show_note_streak_combo}
	KillSpawnedScript \{Name = play_intro}
	KillSpawnedScript \{Name = begin_song_after_intro}
	if GotParam \{kill_cameracuts_iterator}
		KillSpawnedScript \{Name = cameracuts_iterator}
	endif

	KillSpawnedScript \{id = song_event_scripts}

	Destroy_AllWhammyFX
	destroy_intro
	end_song <...>
endscript
