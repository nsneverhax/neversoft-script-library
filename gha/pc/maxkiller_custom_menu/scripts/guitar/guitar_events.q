guitar_events = [
	{
		event = missed_note
		scr = guitarevent_missednote
	}
	{
		event = unnecessary_note
		scr = guitarevent_unnecessarynote
	}
	{
		event = hit_notes
		scr = guitarevent_hitnotes
	}
	{
		event = hit_note
		scr = guitarevent_hitnote
	}
	{
		event = star_power_on
		scr = guitarevent_starpoweroff
	}
	{
		event = star_power_off
		scr = guitarevent_starpoweroff
	}
	{
		event = song_failed
		scr = guitarevent_songfailed
	}
	{
		event = song_won
		scr = guitarevent_songwon
	}
	{
		event = star_hit_note
		scr = guitarevent_starhitnote
	}
	{
		event = star_sequence_bonus
		scr = guitarevent_starsequencebonus
	}
	{
		event = star_miss_note
		scr = guitarevent_starmissnote
	}
	{
		event = whammy_on
		scr = guitarevent_whammyon
	}
	{
		event = whammy_off
		scr = guitarevent_whammyoff
	}
	{
		event = star_whammy_on
		scr = guitarevent_starwhammyon
	}
	{
		event = star_whammy_off
		scr = guitarevent_starwhammyoff
	}
	{
		event = note_window_open
		scr = guitarevent_note_window_open
	}
	{
		event = note_window_close
		scr = guitarevent_note_window_close
	}
	{
		event = crowd_poor_medium
		scr = guitarevent_crowd_poor_medium
	}
	{
		event = crowd_medium_good
		scr = guitarevent_crowd_medium_good
	}
	{
		event = crowd_medium_poor
		scr = guitarevent_crowd_medium_poor
	}
	{
		event = crowd_good_medium
		scr = guitarevent_crowd_good_medium
	}
	{
		event = first_gem
		scr = guitarevent_createfirstgem
	}
	{
		event = firstnote_window_open
		scr = guitarevent_firstnote_window_open
	}
]

script create_guitar_events 
	printf "create_guitar_events %a .........." a = <player_text>
	getarraysize \{$guitar_events}
	array_entry = 0
	begin
	printf \{"adding..."}
	event = ($guitar_events [<array_entry>].event)
	extendcrc <event> <player_text> out = event
	seteventhandler response = call_script event = <event> scr = event_spawner params = {event_spawned = <array_entry>}
	array_entry = (<array_entry> + 1)
	repeat <array_size>
	if iswinport
		winportgetconfignumber \{name = "Sound.ClapDelay"
			defaultvalue = 0}
		change winport_clap_delay = <value>
	endif
	block
endscript

script event_spawner 
	spawnscriptnow ($guitar_events [<event_spawned>].scr) params = {<...>} id = song_event_scripts
endscript

script event_iterator 
	printf "Event Iterator started with time %d" d = <time_offset>
	get_song_prefix song = <song_name>
	formattext checksumname = song '%s_%e' s = <song_prefix> e = <event_string> addtostringlookup
	array_entry = 0
	getarraysize $<song>
	if (<array_size> = 0)
		return
	endif
	getsongtimems time_offset = <time_offset>
	begin
	if ((<time> - <skipleadin>) < (($<song> [<array_entry>]).time))
		break
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_size>
	array_size = (<array_size> - <array_entry>)
	if (<array_size> = 0)
		return
	endif
	begin
	timemarkerreached_setparams time_offset = <time_offset> array = <song> array_entry = <array_entry> arrayofstructures
	begin
	if timemarkerreached
		getsongtimems time_offset = <time_offset>
		break
	endif
	wait \{1
		gameframe}
	repeat
	timemarkerreached_clearparams
	scriptname = ($<song> [<array_entry>].scr)
	if scriptexists <scriptname>
		spawnscriptnow <scriptname> params = {time = <time> ($<song> [<array_entry>].params)} id = song_event_scripts
	elseif symboliscfunc <scriptname>
		<scriptname> {time = <time> ($<song> [<array_entry>].params)}
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_size>
endscript

script guitarevent_missednote 
	if (<bum_note> = 1)
		guitar_wrong_note_sound_logic <...>
	endif
	if ($is_network_game && ($<player_status>.player = 2))
		if (<silent_miss> = 1)
			spawnscriptnow highway_pulse_black params = {player_text = ($<player_status>.text)}
		endif
	else
		if NOT ($<player_status>.guitar_volume = 0)
			if (<silent_miss> = 1)
				spawnscriptnow highway_pulse_black params = {player_text = ($<player_status>.text)}
			else
				change structurename = <player_status> guitar_volume = 0
				updateguitarvolume
			endif
		endif
	endif
	crowddecrease player_status = <player_status>
	if ($always_strum = false)
		if ($disable_band = 0)
			if compositeobjectexists name = (<player_status>.band_member)
				launchevent type = anim_missednote target = (<player_status>.band_member)
			endif
		endif
	endif
	note_time = ($<song> [<array_entry>] [0])
	if ($show_play_log = 1)
		output_log_text "Missed Note (%t)" t = <note_time> color = orange
	endif
endscript

script highway_pulse_black 
	<half_time> = ($highway_pulse_time / 2.0)
	formattext checksumname = highway 'Highway_2D%p' p = <player_text> addtostringlookup = true
	doscreenelementmorph id = <highway> rgba = ($highway_pulse) time = <half_time>
	wait <half_time> seconds
	doscreenelementmorph id = <highway> rgba = ($highway_normal) time = <half_time>
endscript

script guitar_wrong_note_sound_logic 
	if ($current_num_players = 1)
		get_song_rhythm_track song = ($current_song)
		if ($<player_status>.part = rhythm)
			if (<rhythm_track> = 1)
				soundevent \{event = single_player_bad_note_guitar}
			else
				soundevent \{event = single_player_bad_note_bass}
			endif
		else
			soundevent \{event = single_player_bad_note_guitar}
		endif
	else
		if ($<player_status>.player = 1)
			get_song_rhythm_track song = ($current_song)
			if ($<player_status>.part = rhythm)
				if (<rhythm_track> = 1)
					soundevent \{event = first_player_bad_note_guitar}
				else
					soundevent \{event = first_player_bad_note_bass}
				endif
			else
				soundevent \{event = first_player_bad_note_guitar}
			endif
		else
			get_song_rhythm_track song = ($current_song)
			if ($boss_battle = 1)
				soundevent \{event = second_player_bad_note_guitar}
			else
				if ($<player_status>.part = rhythm)
					if (<rhythm_track> = 1)
						soundevent \{event = second_player_bad_note_guitar}
					else
						soundevent \{event = second_player_bad_note_bass}
					endif
				else
					soundevent \{event = second_player_bad_note_guitar}
				endif
			endif
		endif
	endif
endscript

script guitarevent_unnecessarynote 
	if ($transition_playing = true)
		return
	endif
	guitar_wrong_note_sound_logic <...>
	if NOT ($is_network_game && ($<player_status>.player = 2))
		change structurename = <player_status> guitar_volume = 0
		updateguitarvolume
	endif
	crowddecrease player_status = <player_status>
	if ($always_strum = false)
		if ($disable_band = 0)
			if compositeobjectexists name = (<player_status>.band_member)
				launchevent type = anim_missednote target = (<player_status>.band_member)
			endif
		endif
	endif
	if ($show_play_log = 1)
		if (<array_entry> > 0)
			<songtime> = (<songtime> - ($check_time_early * 1000.0))
			next_note = ($<song> [<array_entry>] [0])
			prev_note = ($<song> [(<array_entry> -1)] [0])
			next_time = (<next_note> - <songtime>)
			prev_time = (<songtime> - <prev_note>)
			if (<prev_time> < ($check_time_late * 1000.0))
				<prev_time> = 1000000.0
			endif
			if (<next_time> < <prev_time>)
				<next_time> = (0 - <next_time>)
				output_log_text "ME: %n (%t)" n = <next_time> t = <next_note> color = red
			else
				output_log_text "ML: %n (%t)" n = <prev_time> t = <prev_note> color = darkred
			endif
		endif
	endif
endscript

script guitarevent_hitnotes 
	if guitarevent_hitnotes_cfunc
		updateguitarvolume
	endif
	if ($debug_audible_hitnote = 1)
		soundevent \{event = gh_sfx_hitnotesoundevent}
	endif
endscript

script guitarevent_hitnote 
	spawnscriptnow guitarevent_hitnote_spawned params = {<...>}
endscript

script guitarevent_hitnote_spawned 
	if ($game_mode = p2_battle || $boss_battle = 1)
		change structurename = <player_status> last_hit_note = <color>
	endif
	wait \{1
		gameframe}
	spawnscriptnow hit_note_fx params = {name = <fx_id> pos = <pos> player_text = <player_text> star = ($<player_status>.star_power_used) player = <player>}
endscript
hit_particle_params = {
	z_priority = 8.0
	material = sys_particle_spark01_sys_particle_spark01
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
	emit_rate = 0.02
	emit_dir = 0.0
	emit_spread = 160.0
	velocity = 10.0
	friction = (0.0, 50.0)
	time = 0.25
}
star_hit_particle_params = {
	z_priority = 8.0
	material = sys_particle_spark01_sys_particle_spark01
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
	start_scale = (1.0, 1.0)
	end_scale = (0.5, 0.5)
	start_angle_spread = 0.0
	min_rotation = 0.0
	max_rotation = 0.0
	emit_start_radius = 0.0
	emit_radius = 1.0
	emit_rate = 0.02
	emit_dir = 0.0
	emit_spread = 160.0
	velocity = 10.0
	friction = (0.0, 50.0)
	time = 0.25
}
whammy_particle_params = {
	z_priority = 8.0
	material = sys_particle_spark01_sys_particle_spark01
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
	emit_rate = 0.02
	emit_dir = 0.0
	emit_spread = 160.0
	velocity = 10.0
	friction = (0.0, 50.0)
	time = 0.5
}

script 0xa2ae1c4e 
	notefx <...>
	wait \{6
		gameframes}
	destroy2dparticlesystem id = <particle_id> kill_when_empty
	wait \{10
		gameframes}
	if screenelementexists id = <fx_id>
		destroyscreenelement id = <fx_id>
	endif
endscript

script guitarevent_starpoweron 
	spawnscriptnow gh_star_power_verb_on params = {which_player = <player>}
	formattext checksumname = scriptid '%p_StarPower_StageFX' p = <player_text>
	spawnscriptlater do_starpower_stagefx id = <scriptid> params = {<...>}
	starpoweron player = <player>
endscript

script guitarevent_starpoweroff 
	gh_star_power_verb_off
	spawnscriptnow rock_meter_star_power_off params = {player_text = <player_text>}
	spawnscriptlater kill_starpower_stagefx params = {<...>}
	formattext checksumname = cont 'starpower_container_left%p' p = <player_text> addtostringlookup = true
	if screenelementexists id = <cont>
		doscreenelementmorph id = <cont> alpha = 0
	endif
	formattext checksumname = cont 'starpower_container_right%p' p = <player_text> addtostringlookup = true
	if screenelementexists id = <cont>
		doscreenelementmorph id = <cont> alpha = 0
	endif
	formattext checksumname = highway 'Highway_2D%p' p = <player_text> addtostringlookup = true
	if screenelementexists id = <highway>
		setscreenelementprops id = <highway> rgba = ($highway_normal)
	endif
	spawnscriptnow \{kill_starpower_camera}
endscript
winport_clap_delay = 0.18

script guitarevent_prefretbar 
	if ($winport_clap_delay > 0)
		wait \{$winport_clap_delay
			seconds}
		if ($<player_status>.star_power_used = 1)
			if ($game_mode != tutorial)
				soundevent \{event = crowd_individual_clap_to_beat}
			endif
		else
			if ($crowdlistenerstateclapon1234 = 1)
				soundevent \{event = crowd_individual_clap_to_beat}
			endif
		endif
	endif
endscript
beat_flip = 0

script guitarevent_fretbar 
	if ($current_num_players = 2)
		if ($game_mode = p2_battle || $boss_battle)
			<dying> = 0
			if (($player1_status.current_health) <= $crowd_poor_medium * $highway_flash_dying)
				<dying> = 1
			endif
			set_sidebar_flash <...> player_status = player1_status
			<dying> = 0
			if (($player2_status.current_health) <= $crowd_poor_medium * $highway_flash_dying)
				<dying> = 1
			endif
			if NOT ($player1_status.highway_layout = solo_highway)
				set_sidebar_flash <...> player_status = player2_status
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
			set_sidebar_flash <...> player_status = player1_status
			if NOT ($player1_status.highway_layout = solo_highway)
				set_sidebar_flash <...> player_status = player2_status
			endif
		endif
	else
		<dying> = 0
		if ($current_crowd <= $crowd_poor_medium * $highway_flash_dying)
			<dying> = 1
		endif
		set_sidebar_flash <...> player_status = player1_status
	endif
	change beat_flip = (1 - $beat_flip)
endscript

script set_sidebar_flash 
	formattext checksumname = left 'sidebar_left%p' p = ($<player_status>.text) addtostringlookup = true
	formattext checksumname = right 'sidebar_right%p' p = ($<player_status>.text) addtostringlookup = true
	if ($<player_status>.star_power_used = 1)
		if ($beat_flip = 0)
			setscreenelementprops id = <left> rgba = ($sidebar_starpower0)
			setscreenelementprops id = <right> rgba = ($sidebar_starpower0)
		else
			setscreenelementprops id = <left> rgba = ($sidebar_starpower1)
			setscreenelementprops id = <right> rgba = ($sidebar_starpower1)
		endif
	else
		if (<dying> = 1)
			if ($beat_flip = 0)
				setscreenelementprops id = <left> rgba = ($sidebar_dying0)
				setscreenelementprops id = <right> rgba = ($sidebar_dying0)
			else
				setscreenelementprops id = <left> rgba = ($sidebar_dying1)
				setscreenelementprops id = <right> rgba = ($sidebar_dying1)
			endif
		else
			if ($<player_status>.star_power_amount >= 50.0)
				if ($beat_flip = 0)
					setscreenelementprops id = <left> rgba = ($sidebar_starready0)
					setscreenelementprops id = <right> rgba = ($sidebar_starready0)
				else
					setscreenelementprops id = <left> rgba = ($sidebar_starready1)
					setscreenelementprops id = <right> rgba = ($sidebar_starready1)
				endif
			else
				if ($beat_flip = 0)
					setscreenelementprops id = <left> rgba = ($sidebar_normal0)
					setscreenelementprops id = <right> rgba = ($sidebar_normal0)
				else
					setscreenelementprops id = <left> rgba = ($sidebar_normal1)
					setscreenelementprops id = <right> rgba = ($sidebar_normal1)
				endif
			endif
		endif
	endif
endscript

script guitarevent_fretbar_early 
endscript

script guitarevent_fretbar_late 
endscript

script check_first_note_formed 
	getsongtime
	<starttime> = (<songtime> - 0.0167)
	duration = ($<player_status>.check_time_early + $<player_status>.check_time_late)
	begin
	getheldpattern controller = ($<player_status>.controller) player_status = <player_status>
	if (<strum> = <hold_pattern>)
		change structurename = <player_status> guitar_volume = 100
		updateguitarvolume
	endif
	wait \{1
		gameframe}
	getsongtime
	if ((<songtime> - <starttime>) >= <duration>)
		break
	endif
	repeat
endscript

script guitarevent_firstnote_window_open 
	if isguitarcontroller controller = ($<player_status>.controller)
		getstrumpattern entry = 0 song = <song>
		spawnscriptnow check_first_note_formed params = {strum = <strum> player_status = <player_status>}
	else
		change structurename = <player_status> guitar_volume = 100
		updateguitarvolume
	endif
endscript

script guitarevent_note_window_open 
	if ($debug_audible_open = 1)
		soundevent \{event = gh_sfx_beatwindowopensoundevent}
	endif
	getsongtime
	<starttime> = (<songtime> - 0.0167)
	begin
	wait \{1
		gameframe}
	getsongtime
	if ((<songtime> - <starttime>) >= $check_time_early)
		break
	endif
	repeat
	if ($debug_audible_downbeat = 1)
		soundevent \{event = gh_sfx_beatsoundevent}
	endif
endscript

script guitarevent_note_window_close 
	if ($debug_audible_close = 1)
		soundevent \{event = gh_sfx_beatwindowclosesoundevent}
	endif
endscript
bluewhammyfxid01p1 = jow_nil
bluewhammyfxid02p1 = jow_nil
greenwhammyfxid01p1 = jow_nil
greenwhammyfxid02p1 = jow_nil
orangewhammyfxid01p1 = jow_nil
orangewhammyfxid02p1 = jow_nil
redwhammyfxid01p1 = jow_nil
redwhammyfxid02p1 = jow_nil
yellowwhammyfxid01p1 = jow_nil
yellowwhammyfxid02p1 = jow_nil
bluewhammyfxid01p2 = jow_nil
bluewhammyfxid02p2 = jow_nil
greenwhammyfxid01p2 = jow_nil
greenwhammyfxid02p2 = jow_nil
orangewhammyfxid01p2 = jow_nil
orangewhammyfxid02p2 = jow_nil
redwhammyfxid01p2 = jow_nil
redwhammyfxid02p2 = jow_nil
yellowwhammyfxid01p2 = jow_nil
yellowwhammyfxid02p2 = jow_nil

script destroy_allwhammyfx 
	whammyfxoffall \{player_status = player1_status}
	whammyfxoffall \{player_status = player2_status}
endscript

script guitarevent_whammyon 
	whammyfxon <...>
endscript

script guitarevent_whammyoff 
	whammyfxoff <...>
endscript

script guitarevent_starwhammyon 
endscript

script guitarevent_starwhammyoff 
endscript

script guitarevent_songfailed 
	if ($game_mode = training || $game_mode = tutorial)
		return
	endif
	if ($is_network_game)
		spawnscriptnow \{online_fail_song}
		return
	endif
	if ($game_mode = p2_battle)
		guitarevent_songwon \{battle_win = 1}
	else
		killspawnedscript \{name = guitarevent_songwon_spawned}
		spawnscriptnow \{guitarevent_songfailed_spawned}
	endif
endscript

script guitarevent_songfailed_spawned 
	disable_pause
	if NOT ($boss_battle = 1)
		disable_highway_prepass
		disable_bg_viewport
	endif
	if ($is_network_game)
		change \{gisinnetgame = 0}
	endif
	if ($is_network_game)
		killspawnedscript \{name = dispatch_player_state}
		kill_start_key_binding
		if ($ui_flow_manager_state [0] = online_pause_fs)
			net_unpausegh3
		endif
		mark_unsafe_for_shutdown
	endif
	getsongtimems
	change failed_song_time = <time>
	achievements_songfailed
	pausegame
	progression_songfailed
	if ($boss_battle = 1)
		kill_start_key_binding
		if ($current_song = bossdevil)
			preload_movie = 'Satan-Battle_LOSS'
		else
			preload_movie = 'Player2_wins'
		endif
		killallmovies
		preloadmovie {
			movie = <preload_movie>
			textureslot = 1
			texturepri = 70
			no_looping
			no_hold
			nowait
		}
		formattext textname = winner_text "%s Rocks!" s = ($current_boss.character_name)
		winner_space_between = (50.0, 0.0)
		winner_scale = 1.0
		if ($current_boss.character_profile = morello)
			<winner_space_between> = (40.0, 0.0)
			<winner_scale> = 1.0
		endif
		if ($current_boss.character_profile = slash)
			<winner_space_between> = (40.0, 0.0)
			<winner_scale> = 1.0
		endif
		if ($current_boss.character_profile = satan)
			<winner_space_between> = (40.0, 0.0)
			<winner_scale> = 1.0
		endif
		spawnscriptnow \{wait_and_play_you_rock_movie}
		wait \{0.2
			seconds}
		spawnscriptnow \{waitandkillhighway}
		spawnscriptnow create_exploding_text params = {parent = 'you_rock_physics' text = <winner_text>}
	endif
	if ($is_network_game = 0)
		xenon_singleplayer_session_begin_uninit
		spawnscriptnow \{xenon_singleplayer_session_complete_uninit
			params = {
				song_failed
			}}
	endif
	unpausegame
	soundevent \{event = crowd_fail_song_sfx}
	soundevent \{event = gh_sfx_you_lose_single_player}
	transition_play \{type = songlost}
	transition_wait
	change \{current_transition = none}
	pausegame
	restore_start_key_binding
	spawnscriptnow \{ui_flow_manager_respond_to_action
		params = {
			action = fail_song
		}}
	if ($current_num_players = 1)
		soundevent \{event = crowd_fail_song_sfx}
	else
		soundevent \{event = crowd_med_to_good_sfx}
	endif
	if ($is_network_game)
		mark_safe_for_shutdown
	endif
	killspawnedscript \{name = create_exploding_text}
	destroy_exploding_text \{parent = 'you_rock_physics'}
endscript
gpulog_outputfilename = 'none'

script guitarevent_songwon \{battle_win = 0}
	if notcd
		if ($output_gpu_log = 1)
			if isps3
				formattext \{textname = filename
					'%s_gpu_ps3'
					s = $current_level
					dontassertforchecksums}
			else
				formattext \{textname = filename
					'%s_gpu'
					s = $current_level
					dontassertforchecksums}
			endif
			if NOT stringequals \{a = $gpulog_outputfilename
					b = 'none'}
				<filename> = $gpulog_outputfilename
			endif
			textoutputend output_text filename = <filename>
		endif
		if ($output_song_stats = 1)
			formattext \{textname = filename
				'%s_stats'
				s = $current_song
				dontassertforchecksums}
			textoutputstart
			textoutput \{text = "Player 1"}
			formattext textname = text "Score: %s" s = ($player1_status.score) dontassertforchecksums
			textoutput text = <text>
			formattext textname = text "Notes Hit: %n of %t" n = ($player1_status.notes_hit) t = ($player1_status.total_notes) dontassertforchecksums
			textoutput text = <text>
			formattext textname = text "Best Run: %r" r = ($player1_status.best_run) dontassertforchecksums
			textoutput text = <text>
			formattext textname = text "Max Notes: %m" m = ($player1_status.max_notes) dontassertforchecksums
			textoutput text = <text>
			formattext textname = text "Base score: %b" b = ($player1_status.base_score) dontassertforchecksums
			textoutput text = <text>
			if (($player1_status.base_score) = 0)
				formattext \{textname = text
					"Score Scale: n/a"}
			else
				formattext textname = text "Score Scale: %s" s = (($player1_status.score) / ($player1_status.base_score)) dontassertforchecksums
			endif
			textoutput text = <text>
			if (($player1_status.total_notes) = 0)
				formattext \{textname = text
					"Notes Hit Percentage: n/a"}
			else
				formattext textname = text "Notes Hit Percentage: %s" s = ((($player1_status.notes_hit) / ($player1_status.total_notes)) * 100.0) dontassertforchecksums
			endif
			textoutput text = <text>
			textoutputend output_text filename = <filename>
		endif
	endif
	if ($current_num_players = 2)
		getsongtimems
		if ($last_time_in_lead_player = 0)
			change structurename = player1_status time_in_lead = ($player1_status.time_in_lead + <time> - $last_time_in_lead)
		elseif ($last_time_in_lead_player = 1)
			change structurename = player2_status time_in_lead = ($player2_status.time_in_lead + <time> - $last_time_in_lead)
		endif
		change \{last_time_in_lead_player = -1}
	endif
	if ($game_mode = p2_battle)
		if NOT (<battle_win> = 1)
			change \{save_current_powerups_p1 = $current_powerups_p1}
			change \{save_current_powerups_p2 = $current_powerups_p2}
			change \{current_powerups_p1 = [
					0
					0
					0
				]}
			change \{current_powerups_p2 = [
					0
					0
					0
				]}
			change structurename = player1_status save_num_powerups = ($player1_status.current_num_powerups)
			change structurename = player2_status save_num_powerups = ($player2_status.current_num_powerups)
			change \{structurename = player1_status
				current_num_powerups = 0}
			change \{structurename = player2_status
				current_num_powerups = 0}
			p1_health = ($player1_status.current_health)
			p2_health = ($player2_status.current_health)
			change structurename = player1_status save_health = <p1_health>
			change structurename = player2_status save_health = <p2_health>
			battlemode_killspawnedscripts
			if screenelementexists \{id = battlemode_container}
				destroyscreenelement \{id = battlemode_container}
			endif
			change \{battle_sudden_death = 1}
		else
			battlemode_killspawnedscripts
			change \{battle_sudden_death = 0}
		endif
	endif
	killspawnedscript \{name = guitarevent_songfailed_spawned}
	spawnscriptnow \{guitarevent_songwon_spawned}
endscript

script guitarevent_songwon_spawned 
	disable_pause
	if NOT ($game_mode = p2_battle)
		if ($game_mode = p2_career)
			change structurename = player1_status total_notes = ($player1_status.max_notes + $player2_status.max_notes)
			change structurename = player2_status total_notes = ($player1_status.max_notes + $player2_status.max_notes)
		else
			change structurename = player1_status total_notes = ($player1_status.max_notes)
			change structurename = player2_status total_notes = ($player2_status.max_notes)
		endif
	endif
	mark_unsafe_for_shutdown
	if ($is_network_game)
		change \{gisinnetgame = 0}
	endif
	if ($shutdown_game_for_signin_change_flag = 1)
		return
	endif
	if ($is_network_game)
		if ($ui_flow_manager_state [0] = online_pause_fs)
			net_unpausegh3
		endif
		killspawnedscript \{name = dispatch_player_state}
		if ($player2_present)
			sendnetmessage {
				type = net_win_song
				note_streak = ($player1_status.best_run)
				notes_hit = ($player1_status.notes_hit)
				total_notes = ($player1_status.total_notes)
			}
		endif
		if NOT ($game_mode = p2_battle || $game_mode = p2_faceoff || $cheat_nofail = 1 || ($player1_status.bot_play = 1) || ($player2_status.bot_play = 1))
			online_song_end_write_stats
		endif
	endif
	if ($is_attract_mode = 1)
		spawnscriptnow \{ui_flow_manager_respond_to_action
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
		change \{devil_finish = 1}
	else
		change \{devil_finish = 0}
	endif
	progression_endcredits_done
	pausegame
	kill_start_key_binding
	if ($battle_sudden_death = 1)
		soundevent \{event = gh_sfx_battlemode_sudden_death}
	else
		if ($game_mode = p1_career || $game_mode = p2_coop || $game_mode = p1_quickplay || $game_mode = p2_quickplay)
			soundevent \{event = you_rock_end_sfx}
		endif
	endif
	spawnscriptnow \{you_rock_waiting_crowd_sfx}
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
		preloadmovie {
			movie = <preload_movie>
			textureslot = 1
			texturepri = 70
			no_looping
			no_hold
			nowait
		}
	endif
	if NOT ($devil_finish = 1 || $battle_sudden_death = 1)
		spawnscriptnow \{wait_and_play_you_rock_movie}
	endif
	tie = false
	text_pos = (640.0, 360.0)
	rock_legend = 0
	fit_dims = (350.0, 0.0)
	if ($battle_sudden_death = 1)
		winner_text = "Sudden Death!"
		winner_space_between = (65.0, 0.0)
		winner_scale = 1.8
	else
		if ($game_mode = p2_battle)
			p1_health = ($player1_status.current_health)
			p2_health = ($player2_status.current_health)
			if (<p2_health> > <p1_health>)
				winner = "Two"
				soundevent \{event = ui_2ndplayerwins_sfx}
			else
				winner = "One"
				soundevent \{event = ui_1stplayerwins_sfx}
			endif
			if ($is_network_game)
				if (<p2_health> > <p1_health>)
					name = ($opponent_gamertag)
				else
					if (netsessionfunc obj = match func = get_gamertag)
						name = <name>
					endif
				endif
				formattext textname = winner_text <name>
				<text_pos> = (640.0, 240.0)
			else
				formattext textname = winner_text "Player %s Rocks!" s = <winner>
			endif
			winner_space_between = (50.0, 0.0)
			winner_scale = 1.5
		elseif ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff)
			p1_score = ($player1_status.score)
			p2_score = ($player2_status.score)
			if (<p2_score> > <p1_score>)
				winner = "Two"
				soundevent \{event = ui_2ndplayerwins_sfx}
			elseif (<p1_score> > <p2_score>)
				winner = "One"
				soundevent \{event = ui_1stplayerwins_sfx}
			else
				<tie> = true
				soundevent \{event = you_rock_end_sfx}
			endif
			if (<tie> = true)
				winner_text = "TIE!"
				winner_space_between = (15.0, 0.0)
				winner_scale = 0.5
				fit_dims = (100.0, 0.0)
			else
				if ($is_network_game)
					if (<p2_score> > <p1_score>)
						name = ($opponent_gamertag)
					else
						if (netsessionfunc obj = match func = get_gamertag)
							name = <name>
						endif
					endif
					formattext textname = winner_text <name>
					<text_pos> = (640.0, 240.0)
				else
					formattext textname = winner_text "Player %s Rocks!" s = <winner>
				endif
				winner_space_between = (50.0, 0.0)
				winner_scale = 1.5
			endif
		else
			winner_text = "You Rock!"
			winner_space_between = (40.0, 0.0)
			fit_dims = (350.0, 0.0)
			winner_scale = 1.0
		endif
		if ($devil_finish = 1)
			winner_text = "Now Finish Him!"
			winner_space_between = (55.0, 0.0)
			winner_scale = 1.8
		endif
		if ($current_song = bossdevil && $devil_finish = 0)
			<rock_legend> = 1
			winner_text = "YOU'RE A"
			<text_pos> = (800.0, 300.0)
			winner_space_between = (40.0, 0.0)
			winner_scale = 1.1
			fit_dims = (200.0, 0.0)
		endif
	endif
	stringlength string = <winner_text>
	<fit_dims> = (<str_len> * (23.0, 0.0))
	if (<fit_dims>.(1.0, 0.0) >= 350)
		<fit_dims> = (350.0, 0.0)
	endif
	<yourock_text> = <winner_text>
	if (<rock_legend> = 1)
		<yourock_text_legend> = "ROCK LEGEND!"
	endif
	if (($is_network_game) && ($battle_sudden_death = 0) && (<tie> = false))
		if NOT ($game_mode = p2_coop)
			<yourock_text_2> = "Rocks!"
		endif
	endif
	if NOT ($devil_finish = 1 || $battle_sudden_death = 1)
		spawnscriptnow \{waitandkillhighway}
		killspawnedscript \{name = jiggle_text_array_elements}
		spawnscriptnow create_exploding_text params = {parent = 'you_rock_physics' text = <yourock_text> placement = top}
		if (<rock_legend> = 1)
			spawnscriptnow create_exploding_text params = {parent = 'you_rock_legend_physics' text = <yourock_text_legend> placement = bottom}
		endif
		if ($is_network_game)
			if NOT ($game_mode = p2_coop)
				spawnscriptnow create_exploding_text params = {parent = 'you_rock_2_physics' text = <yourock_text_2> placement = bottom}
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
					getglobaltags ($secret_characters [<boss_character>].id)
					if (<unlocked_for_purchase> = 0)
						killspawnedscript \{name = boss_unlocked_text}
						if screenelementexists \{id = boss_unlocked_text_container}
							destroyscreenelement \{id = boss_unlocked_text_container}
						endif
						spawnscriptnow \{boss_unlocked_text}
						setglobaltags ($secret_characters [<boss_character>].id) params = {unlocked_for_purchase = 1}
					endif
				endif
			endif
		endif
	endif
	change \{old_song = none}
	if NOT ($devil_finish = 1)
		if NOT ($battle_sudden_death = 1)
			progression_songwon
			if ($game_mode = p1_career)
				menu_top_rockers_check_for_new_top_score \{use_band_name}
			endif
			if ($current_transition = preencore)
				end_song
				menu_top_rockers_check_for_new_top_score \{use_band_name}
				unpausegame
				transition_play \{type = preencore}
				transition_wait
				change \{current_transition = none}
				pausegame
				ui_flow_manager_respond_to_action \{action = preencore_win_song}
				encore_transition = 1
			elseif ($current_transition = preaerosmith)
				printf \{"Got PreAerosmith transition"}
				end_song
				menu_top_rockers_check_for_new_top_score \{use_band_name}
				unpausegame
				transition_play \{type = preaerosmith}
				transition_wait
				change \{current_transition = none}
				pausegame
				ui_flow_manager_respond_to_action \{action = preaerosmith_win_song}
				encore_transition = 1
			elseif ($current_transition = preboss)
				end_song
				unpausegame
				transition_play \{type = preboss}
				transition_wait
				change \{current_transition = none}
				pausegame
				change \{use_last_player_scores = 1}
				change old_song = ($current_song)
				change \{show_boss_helper_screen = 1}
				ui_flow_manager_respond_to_action \{action = preboss_win_song}
				if ($is_network_game = 0)
					if NOT ($boss_battle = 1)
						if NOT ($devil_finish)
							agora_write_stats
						endif
					endif
					net_write_single_player_stats
					spawnscriptlater \{xenon_singleplayer_session_complete_uninit}
				endif
				return
			else
				unpausegame
				transition_play \{type = songwon}
				transition_wait
				change \{current_transition = none}
				pausegame
			endif
		else
			unpausegame
			transition_play \{type = songwon}
			spawnscriptnow \{wait_and_play_you_rock_movie}
			spawnscriptnow create_exploding_text params = {parent = 'you_rock_physics' text = <yourock_text>}
			killspawnedscript \{name = sudden_death_helper_text}
			if screenelementexists \{id = sudden_death_helper_container}
				destroyscreenelement \{id = sudden_death_helper_container}
			endif
			spawnscriptnow \{sudden_death_helper_text}
			wait \{0.1
				seconds}
			spawnscriptnow \{waitandkillhighway}
			wait \{6
				seconds}
			change \{current_transition = none}
			pausegame
		endif
	else
		unpausegame
		transition_play \{type = songwon}
		spawnscriptnow \{wait_and_play_you_rock_movie}
		killspawnedscript \{name = jiggle_text_array_elements}
		spawnscriptnow create_exploding_text params = {parent = 'you_rock_physics' text = <yourock_text>}
		devil_finish_anim
		wait \{0.15
			seconds}
		spawnscriptnow \{waitandkillhighway}
		wait \{2.5
			seconds}
		soundevent \{event = devil_die_transition_sfx}
		wait \{0.5
			seconds}
		change \{current_transition = none}
		pausegame
	endif
	if ($battle_sudden_death = 1)
		stopsoundevent \{gh_sfx_battlemode_sudden_death}
		printf \{"BATTLE MODE, Song Won, Begin Sudden Death"}
		change \{battle_sudden_death = 1}
		if ($is_network_game)
			ui_flow_manager_respond_to_action \{action = sudden_death_begin}
			spawnscriptlater \{load_and_sync_timing
				params = {
					start_delay = 4000
					player_status = player1_status
				}}
		else
			ui_flow_manager_respond_to_action \{action = select_retry}
			spawnscriptnow \{restart_song
				params = {
					sudden_death = 1
				}}
		endif
		killspawnedscript \{name = create_exploding_text}
		destroy_exploding_text \{parent = 'you_rock_physics'}
	elseif ($end_credits = 1 && $current_song = kingsandqueenscredits)
		killspawnedscript \{name = create_exploding_text}
		destroy_exploding_text \{parent = 'you_rock_physics'}
		destroy_exploding_text \{parent = 'you_rock_2_physics'}
		change \{end_credits = 0}
		career_song_ended_select_quit
		start_flow_manager \{flow_state = career_credits_autosave_fs}
	elseif ($devil_finish = 1)
		start_devil_finish
	else
		killspawnedscript \{name = create_exploding_text}
		destroy_all_exploding_text
		ui_flow_manager_respond_to_action \{action = win_song}
	endif
	if ($is_network_game = 1)
		if ishost
			agora_write_stats
		endif
	elseif NOT ($boss_battle = 1)
		if NOT ($devil_finish)
			agora_write_stats
		endif
	endif
	if ($is_network_game = 0)
		net_write_single_player_stats
	endif
	if ($game_mode = p1_career)
		agora_update
	endif
	restore_player_selected_character_info \{player_status = player1_status}
	restore_player_selected_character_info \{player_status = player2_status}
	if ($is_network_game = 0)
		if NOT ($devil_finish = 1)
			if NOT ($battle_sudden_death = 1)
				if NOT gotparam \{encore_transition}
					spawnscriptnow \{xenon_singleplayer_session_complete_uninit}
				endif
			endif
		endif
	endif
	soundevent \{event = crowd_med_to_good_sfx}
	mark_safe_for_shutdown
	change \{check_for_unplugged_controllers = 1}
endscript

script sudden_death_helper_text 
	createscreenelement \{type = containerelement
		id = sudden_death_helper_container
		parent = root_window
		pos = (0.0, 0.0)}
	formattext \{checksumname = text_checksum
		'sudden_death_helper'}
	createscreenelement {
		type = textelement
		id = <text_checksum>
		parent = sudden_death_helper_container
		pos = (640.0, 500.0)
		text = "All powerups are death drain attacks!"
		font = text_a4
		scale = 0.8
		rgba = [255 255 255 255]
		just = [center bottom]
		z_priority = 500
	}
	formattext \{checksumname = text_checksum2
		'sudden_death_helper2'}
	createscreenelement {
		type = textelement
		id = <text_checksum2>
		parent = sudden_death_helper_container
		pos = (640.0, 540.0)
		text = "Launch a devastating DEATH DRAIN!"
		font = text_a4
		scale = 0.8
		rgba = [255 255 255 255]
		just = [center bottom]
		z_priority = 500
	}
	wait \{5
		seconds}
	doscreenelementmorph {
		id = <text_checksum>
		alpha = 0
		time = 1
	}
	doscreenelementmorph {
		id = <text_checksum2>
		alpha = 0
		time = 1
	}
endscript

script boss_unlocked_text 
	disable_pause
	createscreenelement \{type = containerelement
		id = boss_unlocked_text_container
		parent = root_window
		pos = (0.0, 0.0)}
	if ($current_song = bossjoe)
		formattext \{textname = boss
			"Joe Perry"}
		pos = (634.0, 580.0)
	elseif ($current_song = walkthiswayrundmc)
		pos = (634.0, 580.0)
		formattext \{textname = boss
			"DMC"}
	elseif ($current_song = dreamon)
		pos = (634.0, 580.0)
		formattext \{textname = boss
			"Just Push Play Girl"}
	endif
	formattext \{textname = unlocked
		"unlocked"}
	formattext \{textname = visit_store
		"VISIT THE VAULT"}
	formattext textname = text "%s %b, %v" s = <boss> b = <unlocked> v = <visit_store>
	formattext \{checksumname = boss_unlocked
		'boss_unlocked'}
	if screenelementexists id = <boss_unlocked>
		destroyscreenelement id = <boss_unlocked>
	endif
	createscreenelement {
		type = textelement
		id = <boss_unlocked>
		parent = boss_unlocked_text_container
		pos = <pos>
		text = <text>
		font = text_a11
		scale = 0.8
		rgba = [255 255 255 255]
		just = [center bottom]
		z_priority = 500
		shadow
		shadow_offs = (1.0, 1.0)
		shadow_rgba = [0 0 0 255]
	}
	wait \{3
		seconds}
	if screenelementexists id = <boss_unlocked>
		doscreenelementmorph {
			id = <boss_unlocked>
			alpha = 0
			time = 1
		}
	endif
	wait \{1
		second}
	if ($current_song = bossjoe)
		formattext \{textname = boss
			"Joe Perry Guitar Battle"}
		pos = (634.0, 580.0)
		formattext \{textname = unlocked
			"unlocked"}
		formattext textname = text "%s %b, %v" s = <boss> b = <unlocked> v = <visit_store>
		formattext \{checksumname = boss_unlocked
			'boss_unlocked'}
		if screenelementexists id = <boss_unlocked>
			destroyscreenelement id = <boss_unlocked>
		endif
		createscreenelement {
			type = textelement
			id = <boss_unlocked>
			parent = boss_unlocked_text_container
			pos = <pos>
			text = <text>
			font = text_a11
			scale = 0.8
			rgba = [255 255 255 255]
			just = [center bottom]
			z_priority = 500
			shadow
			shadow_offs = (1.0, 1.0)
			shadow_rgba = [0 0 0 255]
			alpha = 0
		}
		if screenelementexists id = <boss_unlocked>
			doscreenelementmorph {
				id = <boss_unlocked>
				alpha = 1
				time = 1
			}
		endif
		wait \{3
			seconds}
		if screenelementexists id = <boss_unlocked>
			doscreenelementmorph {
				id = <boss_unlocked>
				alpha = 0
				time = 1
			}
		endif
	endif
endscript

script start_devil_finish 
	change \{end_credits = 0}
	marker_count = 37
	get_song_prefix song = ($current_song)
	formattext checksumname = marker_array '%s_markers' s = <song_prefix>
	starttime = ($<marker_array> [<marker_count>].time)
	startmarker = <marker_count>
	change \{cameracuts_forcetime = 0}
	stoprendering
	restart_gem_scroller song_name = ($current_song) difficulty = ($current_difficulty) difficulty2 = ($current_difficulty2) starttime = <starttime> startmarker = <startmarker> no_render = 1 devil_finish_restart = 1
	devil_lose_anim
	wait \{20
		frames}
	startrendering
	killspawnedscript \{name = create_exploding_text}
	destroy_exploding_text \{parent = 'you_rock_physics'}
	destroy_exploding_text \{parent = 'you_rock_legend_physics'}
endscript

script devil_finish_anim 
	wait \{1
		gameframe}
	bassist :obj_switchscript \{transition_playanim_spawned
		params = {
			anim = gh3_guit_satn_a_lose02
		}}
	change \{cameracuts_allownotescripts = false}
	change \{cameracuts_forcetime = 3.2}
	cameracuts_setarrayprefix \{prefix = 'cameras_boss_finish'
		length = 0
		changenow}
	spawnscriptnow \{devil_camera_flash}
endscript

script devil_camera_flash 
	wait \{2.7
		seconds}
	fadetoblack \{on
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
	wait \{0.04
		seconds}
	soundevent \{event = song_intro_kick_sfx}
	soundevent \{event = practice_mode_crash2}
	fadetoblack \{off}
endscript

script devil_lose_anim 
	change \{cameracuts_allownotescripts = false}
	cameracuts_setarrayprefix \{prefix = 'cameras_boss_dead'
		length = 0
		changenow}
	bassist :obj_switchscript \{transition_playanim_spawned
		params = {
			cycle = 1
			stance = lose
			anim = gh3_guit_satn_a_lose03
		}}
endscript

script wait_and_play_you_rock_movie 
	begin
	if (ismoviepreloaded textureslot = 1)
		startpreloadedmovie \{textureslot = 1}
		return
	endif
	wait \{1
		gameframe}
	repeat
endscript

script waitandkillhighway 
	wait \{0.5
		seconds}
	soundevent \{event = crowd_fast_surge_cheer}
	disable_bg_viewport
endscript
current_song_time = -1
time_to_next_beat = -1
next_beat_time = -1
tempo_iterator_offset = 0

script tempo_matching_iterator 
	printf "tempo_matching_iterator started with time %d" d = <time_offset>
	get_song_prefix song = <song_name>
	formattext checksumname = timesig '%s_timesig' s = <song_prefix> addtostringlookup
	getarraysize $<timesig>
	timesig_entry = 0
	timesig_size = <array_size>
	timesig_num = 0
	measure_count = 0
	song = ($<player_status>.current_song_fretbar_array)
	array_entry = 0
	fretbar_count = 0
	change tempo_iterator_offset = <time_offset>
	getarraysize $<song>
	get_song_end_time song = ($current_song)
	begin
	<entry> = (<array_size> -2)
	<fret_time> = ($<song> [<entry>])
	if (<total_end_time> > <fret_time>)
		break
	endif
	<array_size> = (<array_size> - 1)
	repeat
	getsongtimems time_offset = <time_offset>
	if NOT (<array_size> = 0)
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
		repeat <array_size>
		final_array_entry = (<array_size> - 1)
		array_size = (<array_size> - <array_entry>)
		begin
		timemarkerreached_setparams time_offset = <time_offset> array = <song> array_entry = <array_entry>
		begin
		if timemarkerreached
			getsongtimems time_offset = <time_offset>
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
		wait \{1
			gameframe}
		repeat
		timemarkerreached_clearparams
		marker = ($<song> [<array_entry>])
		<array_entry> = (<array_entry> + 1)
		fretbar_count = (<fretbar_count> + 1)
		if (<fretbar_count> = <timesig_num>)
			measure_count = (<measure_count> + 1)
			fretbar_count = 0
			spawn_measure_callbacks
		endif
		if (<array_entry> < <final_array_entry>)
			change next_beat_time = ($<song> [<array_entry>])
			change time_to_next_beat = ($next_beat_time - <marker>)
			spawn_beat_callbacks \{time_to_next_beat = $time_to_next_beat}
		else
			change \{next_beat_time = -1}
			change \{time_to_next_beat = -1}
		endif
		repeat <array_size>
	endif
endscript
measure_callback = nullscript
beat_callback = nullscript

script setmeasurecallback 
	if gotparam \{callback}
		change measure_callback = <callback>
	endif
endscript

script clearmeasurecallbacks 
	change \{measure_callback = nullscript}
endscript

script setbeatcallback 
	if gotparam \{callback}
		change beat_callback = <callback>
	endif
endscript

script clearbeatcallbacks 
	change \{beat_callback = nullscript}
endscript

script gettimetonextbeat 
	getsongtimems \{time_offset = $tempo_iterator_offset}
	return time_to_next_beat = ($next_beat_time - <time>)
endscript

script spawn_measure_callbacks 
	spawnscriptnow \{$measure_callback}
endscript

script spawn_beat_callbacks 
	spawnscriptnow $beat_callback params = {time_to_next_beat = <time_to_next_beat>}
endscript

script guitarevent_crowd_poor_medium 
	printf \{"Crowd went from poor to medium"}
endscript

script guitarevent_crowd_medium_good 
	printf \{"Crowd went from medium to good"}
endscript

script guitarevent_crowd_medium_poor 
	printf \{"Crowd went from medium to poor"}
endscript

script guitarevent_crowd_good_medium 
	printf \{"Crowd went from good to medium"}
endscript

script guitarevent_starhitnote 
endscript

script 0x91be1744 
	if ($is_attract_mode = 1)
		return
	endif
	change structurename = <player_status> sp_phrases_hit = ($<player_status>.sp_phrases_hit + 1)
	if issingleplayergame
		soundevent \{event = star_power_awarded_sfx}
	else
		spawnscriptnow star_power_awarded_sfx_multiplayer params = {player = ($<player_status>.player)}
	endif
	formattext checksumname = container_id 'gem_container%p' p = ($<player_status>.text) addtostringlookup = true
	getarraysize \{$gem_colors}
	gem_count = 0
	begin
	<note> = ($<song> [<array_entry>] [(<gem_count> + 1)])
	if (<note> > 0)
		color = ($gem_colors [<gem_count>])
		if ($<player_status>.lefthanded_button_ups = 1)
			<pos2d> = ($button_up_models.<color>.left_pos_2d)
			<angle> = ($button_models.<color>.angle)
		else
			<pos2d> = ($button_up_models.<color>.pos_2d)
			<angle> = ($button_models.<color>.left_angle)
		endif
		formattext checksumname = name 'big_bolt%p%e' p = ($<player_status>.text) e = <gem_count> addtostringlookup = true
		createscreenelement {
			type = spriteelement
			id = <name>
			parent = <container_id>
			material = sys_big_bolt01_sys_big_bolt01
			rgba = [255 255 255 255]
			pos = <pos2d>
			rot_angle = <angle>
			scale = $star_power_bolt_scale
			just = [center bottom]
			z_priority = 6
		}
		formattext checksumname = fx_id 'big_bolt_particle%p%e' p = ($<player_status>.text) e = <gem_count> addtostringlookup = true
		destroy2dparticlesystem id = <fx_id>
		<particle_pos> = (<pos2d> - (0.0, 0.0))
		create2dparticlesystem {
			id = <fx_id>
			pos = <particle_pos>
			z_priority = 8.0
			material = sys_particle_star01_sys_particle_star01
			parent = <container_id>
			start_color = [0 128 255 255]
			end_color = [0 128 128 0]
			start_scale = (0.55, 0.55)
			end_scale = (0.25, 0.25)
			start_angle_spread = 360.0
			min_rotation = -120.0
			max_rotation = 240.0
			emit_start_radius = 0.0
			emit_radius = 2.0
			emit_rate = 0.04
			emit_dir = 0.0
			emit_spread = 44.0
			velocity = 24.0
			friction = (0.0, 66.0)
			time = 2.0
		}
		formattext checksumname = fx2_id 'big_bolt_particle2%p%e' p = ($<player_status>.text) e = <gem_count> addtostringlookup = true
		<particle_pos> = (<pos2d> - (0.0, 0.0))
		create2dparticlesystem {
			id = <fx2_id>
			pos = <particle_pos>
			z_priority = 8.0
			material = sys_particle_star02_sys_particle_star02
			parent = <container_id>
			start_color = [255 255 255 255]
			end_color = [128 128 128 0]
			start_scale = (0.5, 0.5)
			end_scale = (0.25, 0.25)
			start_angle_spread = 360.0
			min_rotation = -120.0
			max_rotation = 508.0
			emit_start_radius = 0.0
			emit_radius = 2.0
			emit_rate = 0.04
			emit_dir = 0.0
			emit_spread = 28.0
			velocity = 22.0
			friction = (0.0, 55.0)
			time = 2.0
		}
		formattext checksumname = fx3_id 'big_bolt_particle3%p%e' p = ($<player_status>.text) e = <gem_count> addtostringlookup = true
		<particle_pos> = (<pos2d> - (0.0, 15.0))
		create2dparticlesystem {
			id = <fx3_id>
			pos = <particle_pos>
			z_priority = 8.0
			material = sys_particle_spark01_sys_particle_spark01
			parent = <container_id>
			start_color = [0 255 255 255]
			end_color = [0 255 255 0]
			start_scale = (1.5, 1.5)
			end_scale = (0.25, 0.25)
			start_angle_spread = 360.0
			min_rotation = -500.0
			max_rotation = 500.0
			emit_start_radius = 0.0
			emit_radius = 2.0
			emit_rate = 0.04
			emit_dir = 0.0
			emit_spread = 180.0
			velocity = 12.0
			friction = (0.0, 0.0)
			time = 1.0
		}
	endif
	gem_count = (<gem_count> + 1)
	repeat <array_size>
	wait \{$star_power_bolt_time
		seconds}
	gem_count = 0
	begin
	<note> = ($<song> [<array_entry>] [(<gem_count> + 1)])
	if (<note> > 0)
		formattext checksumname = name 'big_bolt%p%e' p = ($<player_status>.text) e = <gem_count> addtostringlookup = true
		destroyscreenelement id = <name>
		formattext checksumname = fx_id 'big_bolt_particle%p%e' p = ($<player_status>.text) e = <gem_count> addtostringlookup = true
		destroy2dparticlesystem id = <fx_id> kill_when_empty
		formattext checksumname = fx2_id 'big_bolt_particle2%p%e' p = ($<player_status>.text) e = <gem_count> addtostringlookup = true
		destroy2dparticlesystem id = <fx2_id> kill_when_empty
		formattext checksumname = fx3_id 'big_bolt_particle3%p%e' p = ($<player_status>.text) e = <gem_count> addtostringlookup = true
		destroy2dparticlesystem id = <fx3_id> kill_when_empty
		wait \{1
			gameframe}
	endif
	gem_count = (<gem_count> + 1)
	repeat <array_size>
endscript

script guitarevent_starmissnote 
endscript

script guitarevent_multiplier4xon 
	spawnscriptnow guitarevent_multiplier4xon_spawned params = {<...>}
endscript

script 0x1d1a4f61 
	if ($disable_band = 0)
		objid = (<player_status>.band_member)
		getpakmancurrent \{map = zones}
		if NOT (<pak> = z_soundcheck)
			wait \{1
				gameframe}
			safegetuniquecompositeobjectid preferredid = fingersparks01 objid = <objid>
			createparticlesystem_fast name = <uniqueid> objid = <objid> groupid = zoneparticles bone = bone_hand_middle_mid_l params_script = $gp_4x_fingersparks01
			manglechecksums a = <uniqueid> b = <objid>
			change structurename = <player_status> fourx_fingerfxid01 = <mangled_id>
			wait \{1
				gameframe}
			safegetuniquecompositeobjectid preferredid = fingerflames01 objid = <objid>
			createparticlesystem_fast name = <uniqueid> objid = <objid> groupid = zoneparticles bone = bone_hand_middle_mid_l params_script = $gp_4x_fingerflames01
			manglechecksums a = <uniqueid> b = <objid>
			change structurename = <player_status> fourx_fingerfxid02 = <mangled_id>
			wait \{1
				gameframe}
			safegetuniquecompositeobjectid preferredid = fingersparks02 objid = <objid>
			createparticlesystem_fast name = <uniqueid> objid = <objid> groupid = zoneparticles bone = bone_hand_middle_mid_r params_script = {$gp_4x_fingersparks01 emit_target = (0.0, -1.0, 0.0)}
			manglechecksums a = <uniqueid> b = <objid>
			change structurename = <player_status> fourx_fingerfxid03 = <mangled_id>
			wait \{1
				gameframe}
			safegetuniquecompositeobjectid preferredid = fingerflames02 objid = <objid>
			createparticlesystem_fast name = <uniqueid> objid = <objid> groupid = zoneparticles bone = bone_hand_middle_mid_r params_script = $gp_4x_fingerflames01
			manglechecksums a = <uniqueid> b = <objid>
			change structurename = <player_status> fourx_fingerfxid04 = <mangled_id>
		endif
	endif
	if ($allow_4x_effect = false)
		hide_fourx_effect
	endif
endscript

script guitarevent_multiplier3xon 
endscript

script guitarevent_multiplier2xon 
endscript

script kill_4x_fx 
	killspawnedscript \{name = guitarevent_multiplier4xon_spawned}
	if iscreated ($<player_status>.fourx_fingerfxid01)
		($<player_status>.fourx_fingerfxid01) :emitrate rate = 0
		($<player_status>.fourx_fingerfxid01) :destroy ifempty = 1
	endif
	if iscreated ($<player_status>.fourx_fingerfxid02)
		($<player_status>.fourx_fingerfxid02) :emitrate rate = 0
		($<player_status>.fourx_fingerfxid02) :destroy ifempty = 1
	endif
	if iscreated ($<player_status>.fourx_fingerfxid03)
		($<player_status>.fourx_fingerfxid03) :emitrate rate = 0
		($<player_status>.fourx_fingerfxid03) :destroy ifempty = 1
	endif
	if iscreated ($<player_status>.fourx_fingerfxid04)
		($<player_status>.fourx_fingerfxid04) :emitrate rate = 0
		($<player_status>.fourx_fingerfxid04) :destroy ifempty = 1
	endif
	change structurename = <player_status> fourx_fingerfxid01 = jow_nil
	change structurename = <player_status> fourx_fingerfxid02 = jow_nil
	change structurename = <player_status> fourx_fingerfxid03 = jow_nil
	change structurename = <player_status> fourx_fingerfxid04 = jow_nil
endscript

script hide_fourx_effect 
	if iscreated ($player1_status.fourx_fingerfxid01)
		($player1_status.fourx_fingerfxid01) :emitrate rate = 0
	endif
	if iscreated ($player1_status.fourx_fingerfxid02)
		($player1_status.fourx_fingerfxid02) :emitrate rate = 0
	endif
	if iscreated ($player1_status.fourx_fingerfxid03)
		($player1_status.fourx_fingerfxid03) :emitrate rate = 0
	endif
	if iscreated ($player1_status.fourx_fingerfxid04)
		($player1_status.fourx_fingerfxid04) :emitrate rate = 0
	endif
	if iscreated ($player2_status.fourx_fingerfxid01)
		($player2_status.fourx_fingerfxid01) :emitrate rate = 0
	endif
	if iscreated ($player2_status.fourx_fingerfxid02)
		($player2_status.fourx_fingerfxid02) :emitrate rate = 0
	endif
	if iscreated ($player2_status.fourx_fingerfxid03)
		($player2_status.fourx_fingerfxid03) :emitrate rate = 0
	endif
	if iscreated ($player2_status.fourx_fingerfxid04)
		($player2_status.fourx_fingerfxid04) :emitrate rate = 0
	endif
endscript

script show_fourx_effect 
	if iscreated ($player1_status.fourx_fingerfxid01)
		($player1_status.fourx_fingerfxid01) :emitrate rate = 64
	endif
	if iscreated ($player1_status.fourx_fingerfxid02)
		($player1_status.fourx_fingerfxid02) :emitrate rate = 24
	endif
	if iscreated ($player1_status.fourx_fingerfxid03)
		($player1_status.fourx_fingerfxid03) :emitrate rate = 64
	endif
	if iscreated ($player1_status.fourx_fingerfxid04)
		($player1_status.fourx_fingerfxid04) :emitrate rate = 24
	endif
	if iscreated ($player2_status.fourx_fingerfxid01)
		($player2_status.fourx_fingerfxid01) :emitrate rate = 64
	endif
	if iscreated ($player2_status.fourx_fingerfxid02)
		($player2_status.fourx_fingerfxid02) :emitrate rate = 24
	endif
	if iscreated ($player2_status.fourx_fingerfxid03)
		($player2_status.fourx_fingerfxid03) :emitrate rate = 64
	endif
	if iscreated ($player2_status.fourx_fingerfxid04)
		($player2_status.fourx_fingerfxid04) :emitrate rate = 24
	endif
endscript

script guitarevent_multiplier4xoff 
	soundevent \{event = ui_sfx_lose_multiplier_4x}
	soundevent \{event = lose_multiplier_crowd}
	spawnscriptnow highway_pulse_multiplier_loss params = {player_text = ($<player_status>.text) multiplier = 4}
	kill_4x_fx <...>
endscript

script guitarevent_multiplier3xoff 
	soundevent \{event = ui_sfx_lose_multiplier_3x}
	spawnscriptnow highway_pulse_multiplier_loss params = {player_text = ($<player_status>.text) multiplier = 3}
endscript

script guitarevent_multiplier2xoff 
	soundevent \{event = ui_sfx_lose_multiplier_2x}
	spawnscriptnow highway_pulse_multiplier_loss params = {player_text = ($<player_status>.text) multiplier = 2}
endscript

script guitarevent_killsong 
	gh3_sfx_stop_sounds_for_killsong
	gh_star_power_verb_off
	formattext \{checksumname = player_status
		'player1_status'}
	kill_4x_fx player_status = <player_status>
	formattext \{checksumname = player_status
		'player2_status'}
	kill_4x_fx player_status = <player_status>
endscript

script guitarevent_entervenue 
	getpakmancurrentname \{map = zones}
	formattext checksumname = echo_params 'Echo_Crowd_Buss_%s' s = <pakname>
	formattext checksumname = reverb_params 'Reverb_Crowd_Buss_%s' s = <pakname>
	if NOT globalexists name = <echo_params>
		echo_params = echo_crowd_buss_default
	endif
	if NOT globalexists name = <reverb_params>
		reverb_params = reverb_crowd_buss_default
	endif
	setsoundbusseffects effect = $<echo_params>
	setsoundbusseffects effect = $<reverb_params>
endscript

script guitarevent_exitvenue 
	setsoundbusseffects \{effect = $echo_crowd_buss}
	setsoundbusseffects \{effect = $reverb_crowd_buss}
endscript

script guitarevent_createfirstgem 
	spawnscriptnow first_gem_fx params = {<...>}
endscript

script 0xeef98ec1 
	extendcrc <gem_id> '_particle' out = fx_id
	if gotparam \{is_star}
		if ($game_mode = p2_battle || $boss_battle = 1)
			<pos> = (125.0, 170.0)
		else
			<pos> = (255.0, 170.0)
		endif
	else
		<pos> = (66.0, 20.0)
	endif
	destroy2dparticlesystem id = <fx_id>
	create2dparticlesystem {
		id = <fx_id>
		pos = <pos>
		z_priority = 8.0
		material = sys_particle_lnzflare02_sys_particle_lnzflare02
		parent = <gem_id>
		start_color = [255 255 255 255]
		end_color = [255 255 255 0]
		start_scale = (1.0, 1.0)
		end_scale = (2.0, 2.0)
		start_angle_spread = 360.0
		min_rotation = -500.0
		max_rotation = 500.0
		emit_start_radius = 0.0
		emit_radius = 0.0
		emit_rate = 0.3
		emit_dir = 0.0
		emit_spread = 160.0
		velocity = 0.01
		friction = (0.0, 0.0)
		time = 1.25
	}
	spawnscriptnow destroy_first_gem_fx params = {gem_id = <gem_id> fx_id = <fx_id>}
	wait \{0.8
		seconds}
	destroy2dparticlesystem id = <fx_id> kill_when_empty
endscript

script destroy_first_gem_fx 
	begin
	if NOT screenelementexists id = <gem_id>
		destroy2dparticlesystem id = <fx_id>
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script guitarevent_gemstarpoweron 
endscript

script guitarevent_battleattackfinished 
	gh3_battle_attack_finished_sfx <...>
	reset_battle_dsp_effects <...>
endscript

script guitarevent_transitionintro 
endscript

script guitarevent_transitionfastintro 
endscript

script guitarevent_transitionpreencore 
endscript

script guitarevent_transitionpreaerosmith 
endscript

script guitarevent_transitionencore 
endscript

script guitarevent_transitionpreboss 
endscript

script guitarevent_transitionboss 
endscript

script hit_note_fx 
endscript

script guitarevent_starsequencebonus 
endscript

script guitarevent_multiplier4xon_spawned 
endscript

script first_gem_fx 
endscript
