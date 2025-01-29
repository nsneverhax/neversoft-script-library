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
	printf \{"Playing Intro"}
	printstruct <...>
	if ($show_boss_helper_screen = 1)
		return
	endif
	if ($is_attract_mode = 1)
		disable_bg_viewport
		return
	endif
	killspawnedscript \{name = guitarevent_songfailed_spawned}
	if gotparam \{fast}
		change \{current_intro = fastintro_sequence_props}
	elseif gotparam \{practice}
		change \{current_intro = practice_sequence_props}
	else
		change \{current_intro = intro_sequence_props}
	endif
	if ($game_mode != tutorial)
		spawnscriptnow \{intro_song_info
			id = intro_scripts}
	endif
	if NOT ($cheat_performancemode = 1 && $is_network_game = 0)
		spawnscriptnow \{intro_highway_move
			id = intro_scripts}
	endif
	player = 1
	begin
	formattext checksumname = player_status 'player%i_status' i = <player>
	formattext textname = player_text 'p%i' i = <player>
	spawnscriptnow intro_buttonup_ripple params = <...> id = intro_scripts
	player = (<player> + 1)
	repeat $current_num_players
	if ($tutorial_disable_hud = 0)
		spawnscriptnow \{intro_hud_move
			id = intro_scripts}
	endif
endscript

script destroy_intro 
	killspawnedscript \{id = intro_scripts}
	killspawnedscript \{name = song_intro_kick_sfx_waiting}
	killspawnedscript \{name = song_intro_highway_up_sfx_waiting}
	killspawnedscript \{name = move_highway_2d}
	killspawnedscript \{name = intro_buttonup_ripple}
	killspawnedscript \{name = intro_hud_move}
	doscreenelementmorph \{id = intro_song_info_text
		alpha = 0}
	doscreenelementmorph \{id = intro_artist_info_text
		alpha = 0}
	doscreenelementmorph \{id = intro_performed_by_text
		alpha = 0}
	doscreenelementmorph \{id = intro_covered_by_text
		alpha = 0}
	doscreenelementmorph \{id = intro_covered_by
		alpha = 0}
	player = 1
	begin
	formattext checksumname = player_status 'player%i_status' i = <player> addtostringlookup
	enableinput controller = ($<player_status>.controller)
	player = (<player> + 1)
	repeat $current_num_players
endscript

script intro_buttonup_ripple 
	enableinput off controller = ($<player_status>.controller)
	begin
	getsongtimems
	if ($current_intro.button_ripple_start_time + $current_starttime < <time>)
		break
	endif
	wait \{1
		gameframe}
	repeat
	if ($current_intro.button_ripple_per_button_time = 0)
		return
	endif
	getarraysize \{$gem_colors}
	soundevent \{event = notes_ripple_up_sfx}
	extendcrc button_up_pixel_array ($<player_status>.text) out = pixel_array
	buttonup_count = 0
	begin
	wait ($current_intro.button_ripple_per_button_time / 1000.0) seconds
	array_count = 0
	begin
	color = ($gem_colors [<array_count>])
	if (<array_count> = <buttonup_count>)
		setarrayelement arrayname = <pixel_array> globalarray index = <array_count> newvalue = $button_up_pixels
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
	buttonup_count = (<buttonup_count> + 1)
	repeat (<array_size> + 1)
	enableinput controller = ($<player_status>.controller)
endscript

script intro_song_info 
	begin
	getsongtimems
	if ($current_intro.song_title_start_time + $current_starttime < <time>)
		break
	endif
	wait \{1
		gameframe}
	repeat
	if ($current_intro.song_title_on_time = 0)
		return
	endif
	get_song_title song = ($current_song)
	getuppercasestring <song_title>
	intro_song_info_text :setprops text = <uppercasestring>
	intro_song_info_text :domorph pos = ($current_intro.song_title_pos)
	get_song_artist song = ($current_song)
	getuppercasestring <song_artist>
	intro_artist_info_text :setprops text = <uppercasestring>
	intro_artist_info_text :domorph pos = ($current_intro.song_artist_pos)
	get_song_artist_text song = ($current_song)
	getuppercasestring <song_artist_text>
	intro_performed_by_text :setprops text = <uppercasestring>
	intro_performed_by_text :domorph pos = ($current_intro.performed_by_pos)
	get_song_covered_by song = ($current_song)
	if gotparam \{covered_by}
		getuppercasestring <covered_by>
		intro_covered_by_text :domorph pos = ($current_intro.covered_by_text_pos)
		intro_covered_by :setprops text = <uppercasestring>
		intro_covered_by :domorph pos = ($current_intro.covered_by_pos)
	endif
	intro_song_info_text :setprops \{z_priority = 5.0}
	intro_artist_info_text :setprops \{z_priority = 5.0}
	intro_performed_by_text :setprops \{z_priority = 5.0}
	doscreenelementmorph id = intro_song_info_text alpha = 1 time = ($current_intro.song_title_fade_time / 1000.0)
	doscreenelementmorph id = intro_performed_by_text alpha = 1 time = ($current_intro.song_title_fade_time / 1000.0)
	doscreenelementmorph id = intro_artist_info_text alpha = 1 time = ($current_intro.song_title_fade_time / 1000.0)
	if gotparam \{covered_by}
		doscreenelementmorph id = intro_covered_by_text alpha = 1 time = ($current_intro.song_title_fade_time / 1000.0)
		doscreenelementmorph id = intro_covered_by alpha = 1 time = ($current_intro.song_title_fade_time / 1000.0)
	endif
	wait ($current_intro.song_title_on_time / 1000.0) seconds
	doscreenelementmorph id = intro_song_info_text alpha = 0 time = ($current_intro.song_title_fade_time / 1000.0)
	doscreenelementmorph id = intro_artist_info_text alpha = 0 time = ($current_intro.song_title_fade_time / 1000.0)
	doscreenelementmorph id = intro_performed_by_text alpha = 0 time = ($current_intro.song_title_fade_time / 1000.0)
	if gotparam \{covered_by}
		doscreenelementmorph id = intro_covered_by_text alpha = 0 time = ($current_intro.song_title_fade_time / 1000.0)
		doscreenelementmorph id = intro_covered_by alpha = 0 time = ($current_intro.song_title_fade_time / 1000.0)
	endif
endscript

script intro_highway_move 
	begin
	getsongtimems
	if ($current_intro.highway_start_time + $current_starttime < <time>)
		break
	endif
	wait \{1
		gameframe}
	repeat
	spawnscriptnow \{song_intro_highway_up_sfx_waiting}
	player = 1
	begin
	formattext checksumname = player_status 'player%i_status' i = <player> addtostringlookup
	formattext textname = player_text 'p%i' i = <player> addtostringlookup
	move_highway_camera_to_default <...> time = ($current_intro.highway_move_time / 1000.0)
	player = (<player> + 1)
	repeat $current_num_players
endscript

script intro_hud_move 
	begin
	getsongtimems
	if ($current_intro.hud_start_time + $current_starttime < <time>)
		break
	endif
	wait \{1
		gameframe}
	repeat
	get_num_players_by_gamemode
	player = 1
	begin
	formattext checksumname = player_status 'player%i_status' i = <player> addtostringlookup
	formattext textname = player_text 'p%i' i = <player> addtostringlookup
	move_hud_to_default <...> time = ($current_intro.hud_move_time / 1000.0)
	player = (<player> + 1)
	repeat <num_players>
	if ($game_mode = p2_battle && $battle_sudden_death = 1)
		restore_saved_powerups
	endif
	spawnscriptnow \{song_intro_kick_sfx_waiting}
endscript

script play_outro 
	songunloadfsbifdownloaded
	kill_starpower_camera \{changecamera = 0}
	kill_walk_camera \{changecamera = 0}
	change \{structurename = player1_status
		star_power_amount = 0}
	change \{structurename = player2_status
		star_power_amount = 0}
	kill_starpower_stagefx player_text = ($player1_status.text) player_status = $player1_status ifempty = 0
	kill_starpower_stagefx player_text = ($player2_status.text) player_status = $player2_status ifempty = 0
	change \{showing_raise_axe = 0}
	destroy2dparticlesystem \{id = all}
	launchgemevent \{event = kill_objects}
	player = 1
	begin
	formattext checksumname = player_status 'player%i_status' i = <player> addtostringlookup
	formattext textname = player_text 'p%i' i = <player> addtostringlookup
	guitarevent_killsong <...>
	destroy_hud <...>
	battlemode_deinit <...>
	bossbattle_deinit <...>
	faceoff_deinit <...>
	faceoff_volumes_deinit <...>
	player = (<player> + 1)
	repeat $max_num_players
	practicemode_deinit
	notemap_deinit
	kill_startup_script <...>
	killspawnedscript \{name = guitarevent_missednote}
	killspawnedscript \{name = guitarevent_unnecessarynote}
	killspawnedscript \{name = guitarevent_hitnotes}
	killspawnedscript \{name = guitarevent_hitnote}
	killspawnedscript \{name = guitarevent_starpoweron}
	killspawnedscript \{name = guitarevent_starpoweroff}
	killspawnedscript \{name = guitarevent_starhitnote}
	killspawnedscript \{name = guitarevent_starsequencebonus}
	killspawnedscript \{name = guitarevent_starmissnote}
	killspawnedscript \{name = guitarevent_whammyon}
	killspawnedscript \{name = guitarevent_whammyoff}
	killspawnedscript \{name = guitarevent_starwhammyon}
	killspawnedscript \{name = guitarevent_starwhammyoff}
	killspawnedscript \{name = guitarevent_note_window_open}
	killspawnedscript \{name = guitarevent_note_window_close}
	killspawnedscript \{name = guitarevent_crowd_poor_medium}
	killspawnedscript \{name = guitarevent_crowd_medium_good}
	killspawnedscript \{name = guitarevent_crowd_medium_poor}
	killspawnedscript \{name = guitarevent_crowd_good_medium}
	killspawnedscript \{name = guitarevent_createfirstgem}
	killspawnedscript \{name = highway_pulse_black}
	killspawnedscript \{name = guitarevent_hitnote_spawned}
	killspawnedscript \{name = hit_note_fx}
	killspawnedscript \{name = do_starpower_stagefx}
	killspawnedscript \{name = do_starpower_camera}
	killspawnedscript \{name = first_gem_fx}
	killspawnedscript \{name = gem_iterator}
	killspawnedscript \{name = gem_array_stepper}
	killspawnedscript \{name = gem_array_events}
	killspawnedscript \{name = gem_step}
	killspawnedscript \{name = gem_step_end}
	killspawnedscript \{name = fretbar_iterator}
	killspawnedscript \{name = strum_iterator}
	killspawnedscript \{name = fretpos_iterator}
	killspawnedscript \{name = fretfingers_iterator}
	killspawnedscript \{name = drum_iterator}
	killspawnedscript \{name = drum_cymbal_iterator}
	killspawnedscript \{name = drum_countoff_iterator}
	killspawnedscript \{name = watchforstartplaying_iterator}
	killspawnedscript \{name = tempo_matching_iterator}
	killspawnedscript \{name = faceoff_anim_iterator}
	killspawnedscript \{name = gem_scroller}
	killspawnedscript \{name = button_checker}
	killspawnedscript \{name = check_buttons}
	killspawnedscript \{name = check_buttons_fast}
	killspawnedscript \{name = fretbar_update_tempo}
	killspawnedscript \{name = fretbar_update_hammer_on_tolerance}
	killspawnedscript \{name = move_whammy}
	killspawnedscript \{name = create_fretbar}
	killspawnedscript \{name = move_highway_2d}
	killspawnedscript \{name = update_score_fast}
	killspawnedscript \{name = check_for_star_power}
	killspawnedscript \{name = wait_for_inactive}
	killspawnedscript \{name = guitarevent_prefretbar}
	killspawnedscript \{name = guitarevent_fretbar}
	killspawnedscript \{name = check_note_hold}
	killspawnedscript \{name = star_power_whammy}
	killspawnedscript \{name = show_star_power_ready}
	killspawnedscript \{name = hud_glowburst_alert}
	change \{star_power_ready_on_p1 = 0}
	change \{star_power_ready_on_p2 = 0}
	killspawnedscript \{name = event_iterator}
	killspawnedscript \{name = win_song}
	killspawnedscript \{name = hand_note_iterator}
	killspawnedscript \{name = kill_object_later}
	killspawnedscript \{name = show_coop_raise_axe_for_starpower}
	killspawnedscript \{name = net_whammy_pitch_shift}
	killspawnedscript \{name = crowd_allplayanim}
	killspawnedscript \{name = hud_activated_star_power_spawned}
	killspawnedscript \{name = pulsate_all_star_power_bulbs}
	killspawnedscript \{name = pulsate_star_power_bulb}
	killspawnedscript \{name = rock_meter_star_power_on}
	killspawnedscript \{name = rock_meter_star_power_off}
	killspawnedscript \{name = hud_activated_star_power}
	killspawnedscript \{name = hud_move_note_scorebar}
	killspawnedscript \{name = hud_flash_red_bg_p1}
	killspawnedscript \{name = hud_flash_red_bg_p2}
	killspawnedscript \{name = hud_flash_red_bg_kill}
	killspawnedscript \{name = hud_lightning_alert}
	killspawnedscript \{name = hud_show_note_streak_combo}
	killspawnedscript \{name = play_intro}
	killspawnedscript \{name = begin_song_after_intro}
	if gotparam \{kill_cameracuts_iterator}
		killspawnedscript \{name = cameracuts_iterator}
	endif
	printf \{"kill_gem_scroller - Killing Event Scripts"}
	killspawnedscript \{id = song_event_scripts}
	printf \{"kill_gem_scroller - Killing Event Scripts Finished"}
	destroy_allwhammyfx
	destroy_intro
	end_song <...>
endscript
