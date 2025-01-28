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
		scr = guitarevent_starpoweron
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

	getarraysize \{$guitar_events}
	array_entry = 0
	begin

	event = ($guitar_events [<array_entry>].event)
	extendcrc <event> <player_text> out = event
	seteventhandler response = 0x84fd71d0 event = <event> scr = 0x45ccb98d params = {event_spawned = <array_entry>}
	array_entry = (<array_entry> + 1)
	repeat <array_size>
	block
endscript

script event_iterator 

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
	waitonegameframe
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

script wait_for_correct_frame 
	if NOT ($playing_song_for_real = 1)
		return
	endif
	if wait_for_correct_frame_cfunc
		waitonegameframe
	endif
endscript

script 0x0666218b 
	if NOT ($playing_song_for_real = 1)
		return
	endif
	if (<id> = vocalist || <id> = drummer)
		return
	endif
	if (<id> = guitarist)
		if ($current_frame_toggle = 1)
			wait \{1
				gameframe}
		endif
	else
		if ($current_frame_toggle = 0)
			wait \{1
				gameframe}
		endif
	endif
endscript

script guitarevent_missednote 
	0xdc30ffce
	begin
	if 0xd652c570
		break
	endif
	waitonegameframe
	repeat
	0xaea40874
endscript

script highway_pulse_black 
	<half_time> = ($highway_pulse_time / 2.0)
	formattext checksumname = highway 'Highway_2D%p' p = <player_text> addtostringlookup = true
	doscreenelementmorph id = <highway> rgba = ($highway_pulse) time = <half_time>
	wait <half_time> seconds
	doscreenelementmorph id = <highway> rgba = ($highway_normal) time = <half_time>
endscript

script guitarevent_unnecessarynote 
	0xc620303c
	begin
	if 0x906175c3
		break
	endif
	waitonegameframe
	repeat
	0x83f54e7a
endscript

script guitarevent_hitnotes 
	wait_for_correct_frame player = ($<player_status>.player)
	if guitarevent_hitnotes_cfunc
		0x92996416
	endif
endscript

script guitarevent_hitnote 
	wait_for_correct_frame player = <player>
	if ($game_mode = p2_battle || $boss_battle = 1)
		change structurename = <player_status> last_hit_note = <color>
	endif
	waitonegameframe
	hit_note_fx name = <fx_id> pos = <pos> player_text = <player_text> star = ($<player_status>.star_power_used) player = <player>
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
	start_scale = (2.0, 2.0)
	end_scale = (1.0, 1.0)
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
	start_scale = (2.0, 2.0)
	end_scale = (1.0, 1.0)
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

script hit_note_fx 
	notefx
	wait \{15
		gameframes}
	if screenelementexists id = <fx_id>
		destroyscreenelement id = <fx_id>
	endif
endscript

script guitarevent_starpoweron 
	wait_for_correct_frame player = <player>
	gh_star_power_verb_on
	starpoweron player = <player>
endscript

script guitarevent_starpoweroff 
	wait_for_correct_frame player = ($<player_status>.player)
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

script guitarevent_prefretbar 
	waittime = 0.18
	wait <waittime> seconds
	if isngc
		if ($player1_status.star_power_used = 1)
			activatestarpowerpulse player = ($player1_status.controller) num = 1 length = 10 strength = 11 priority = 1
		endif
		if ($player2_status.star_power_used = 1)
			activatestarpowerpulse player = ($player2_status.controller) num = 1 length = 10 strength = 11 priority = 1
		endif
	endif
	if ($<player_status>.star_power_used = 1)
		if ($game_mode != tutorial)
			soundevent \{event = crowd_individual_clap_to_beat}
		endif
	else
		if ($crowdlistenerstateclapon1234 = 1)
			soundevent \{event = crowd_individual_clap_to_beat}
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
		0x92996416
	endif
	waitonegameframe
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
		0x92996416
	endif
endscript

script guitarevent_note_window_open 
	0x61d5c03d
	begin
	if 0xa986e49a
		break
	endif
	waitonegameframe
	repeat
	0x27532ad2
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
	if (<player> = 1)
		lock = whammyon_lockp1
	else
		lock = whammyon_lockp2
	endif
	change globalname = <lock> newvalue = 1
	wait_for_correct_frame player = <player>
	whammyfxon <...>
	change globalname = <lock> newvalue = 0
endscript

script guitarevent_whammyoff 
	if (<player> = 1)
		lock = whammyon_lockp1
	else
		lock = whammyon_lockp2
	endif
	begin
	if NOT ($<lock>)
		break
	endif
	wait \{1
		gameframe}
	repeat
	wait_for_correct_frame player = <player>
	whammyfxoff <...>
endscript

script guitarevent_starwhammyon 
endscript

script guitarevent_starwhammyoff 
endscript

script guitarevent_songfailed 
	change \{check_for_unplugged_controllers = 0}
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
	if NOT ($boss_battle = 1)
		disable_highway_prepass
		disable_bg_viewport
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
		killmovie \{textureslot = 1}
		formattext checksumname = 0xfe864fb1 '%s' s = <preload_movie>
		change g_you_rock_movie = <0xfe864fb1>
		formattext textname = winner_text '%s Rocks!' s = ($current_boss.character_name)
		winner_space_between = (50.0, 0.0)
		winner_scale = 1.0
		if ($current_boss.character_profile = morello)
			<winner_space_between> = (40.0, 0.0)
			<winner_scale> = 1.0
		endif
		if ($current_boss.character_profile = slash)
			<winner_space_between> = (40.0, 0.0)
			<winner_scale> = 1.0
			<winner_space_between> = (<winner_space_between> * 1.3)
			<winner_scale> = (<winner_scale> * 1.6)
		endif
		if ($current_boss.character_profile = satan)
			<winner_space_between> = (40.0, 0.0)
			<winner_scale> = 1.0
			<winner_space_between> = (<winner_space_between> * 1.8)
			<winner_scale> = (<winner_scale> * 1.7)
		endif
		spawnscriptnow \{wait_and_play_you_rock_movie}
		wait \{0.2
			seconds}
		destroy_menu \{menu_id = yourock_text}
		destroy_menu \{menu_id = yourock_text_2}
		stringlength string = <winner_text>
		<fit_dims> = (<str_len> * (23.0, 0.0))
		if (<fit_dims>.(1.0, 0.0) >= 350)
			<fit_dims> = (350.0, 0.0)
		endif
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
		split_text_into_array_elements {
			id = yourock_text
			text = <winner_text>
			text_pos = (640.0, 360.0)
			space_between = (<winner_space_between> * 2.0)
			just = [center center]
			flags = {
				rgba = [255 255 255 255]
				scale = (<winner_scale> * 2.0)
				z_priority = 95
				font = text_a10_large
				rgba = [223 223 223 255]
				just = [center center]
				alpha = 1
			}
			centered
		}
		spawnscriptnow \{waitandkillhighway}
		killspawnedscript \{name = jiggle_text_array_elements}
		spawnscriptnow \{jiggle_text_array_elements
			params = {
				id = yourock_text
				time = 1.0
				wait_time = 3000
				explode = 1
			}}
	endif
	if ($is_network_game = 0)
		xenon_singleplayer_session_begin_uninit
		spawnscriptnow \{xenon_singleplayer_session_complete_uninit}
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
endscript

script guitarevent_songwon \{battle_win = 0}
	change \{check_for_unplugged_controllers = 0}
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
			textoutputend output_text filename = <filename>
		endif
		if ($output_song_stats = 1)
			formattext \{textname = filename
				'%s_stats'
				s = $current_song
				dontassertforchecksums}
			textoutputstart
			textoutput \{text = 'Player 1'}
			formattext textname = text 'Score: %s' s = ($player1_status.score) dontassertforchecksums
			textoutput text = <text>
			formattext textname = text 'Notes Hit: %n of %t' n = ($player1_status.notes_hit) t = ($player1_status.total_notes) dontassertforchecksums
			textoutput text = <text>
			formattext textname = text 'Best Run: %r' r = ($player1_status.best_run) dontassertforchecksums
			textoutput text = <text>
			formattext textname = text 'Max Notes: %m' m = ($player1_status.max_notes) dontassertforchecksums
			textoutput text = <text>
			formattext textname = text 'Base score: %b' b = ($player1_status.base_score) dontassertforchecksums
			textoutput text = <text>
			if (($player1_status.base_score) = 0)
				formattext \{textname = text
					'Score Scale: n/a'}
			else
				formattext textname = text 'Score Scale: %s' s = (($player1_status.score) / ($player1_status.base_score)) dontassertforchecksums
			endif
			textoutput text = <text>
			if (($player1_status.total_notes) = 0)
				formattext \{textname = text
					'Notes Hit Percentage: n/a'}
			else
				formattext textname = text 'Notes Hit Percentage: %s' s = ((($player1_status.notes_hit) / ($player1_status.total_notes)) * 100.0) dontassertforchecksums
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
	if ($is_network_game)
		mark_unsafe_for_shutdown
		if ($shutdown_game_for_signin_change_flag = 1)
			return
		endif
		if ($ui_flow_manager_state [0] = online_pause_fs)
			net_unpausegh3
		endif
		killspawnedscript \{name = dispatch_player_state}
		if ($player2_present)
			sendnetmessage {
				type = net_win_song
				stars = ($player1_status.stars)
				note_streak = ($player1_status.best_run)
				notes_hit = ($player1_status.notes_hit)
				total_notes = ($player1_status.total_notes)
			}
		endif
		if NOT ($game_mode = p2_battle || $cheat_nofail = 1 || $cheat_easyexpert = 1)
			if ($game_mode = p2_coop)
				online_song_end_write_stats \{song_type = coop}
			else
				online_song_end_write_stats \{song_type = single}
			endif
		endif
	endif
	if ($is_attract_mode = 1)
		0x3e5d7af6
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
		if ($game_mode = p1_career || $game_mode = p2_career || $game_mode = p2_coop || $game_mode = p1_quickplay)
			soundevent \{event = you_rock_end_sfx}
		endif
	endif
	spawnscriptnow \{you_rock_waiting_crowd_sfx}
	if ($game_mode = p2_battle || $boss_battle = 1)
		if ($player1_status.current_health >= $player2_status.current_health)
			if ($current_song = bossdevil)
				preload_movie = 'Satan-Battle_WIN'
			else
				soundevent \{event = gh_sfx_battlemode_deathof_p2}
				preload_movie = 'Player1_wins'
			endif
		else
			if ($current_song = bossdevil)
				preload_movie = 'Satan-Battle_LOSS'
			else
				soundevent \{event = gh_sfx_battlemode_deathof_p1}
				preload_movie = 'Player2_wins'
			endif
		endif
		if ($current_song = bossdevil && $devil_finish = 0)
			preload_movie = 'Golden_Guitar'
		endif
		if ($battle_sudden_death = 1)
			preload_movie = 'Fret_Flames'
		endif
		killmovie \{textureslot = 1}
		formattext checksumname = 0xfe864fb1 '%s' s = <preload_movie>
		change g_you_rock_movie = <0xfe864fb1>
	endif
	if NOT ($devil_finish = 1 || $battle_sudden_death = 1)
		spawnscriptnow \{wait_and_play_you_rock_movie}
	endif
	destroy_menu \{menu_id = yourock_text}
	destroy_menu \{menu_id = yourock_text_2}
	tie = false
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
				soundevent \{event = ui_2ndplayerwins_sfx}
			else
				winner = 'One'
				soundevent \{event = ui_1stplayerwins_sfx}
			endif
			if ($is_network_game)
				if (<p2_health> > <p1_health>)
					name = ($opponent_gamertag)
				else
					netsessionfunc \{obj = match
						func = get_gamertag}
				endif
				formattext textname = winner_text <name>
				<text_pos> = (640.0, 240.0)
			else
				formattext textname = winner_text 'Player %s Rocks!' s = <winner>
			endif
			winner_space_between = (25.0, 0.0)
			winner_scale = 1.0
		elseif ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff)
			p1_score = ($player1_status.score)
			p2_score = ($player2_status.score)
			if (<p2_score> > <p1_score>)
				winner = 'Two'
				soundevent \{event = ui_2ndplayerwins_sfx}
			elseif (<p1_score> > <p2_score>)
				winner = 'One'
				soundevent \{event = ui_1stplayerwins_sfx}
			else
				<tie> = true
				soundevent \{event = you_rock_end_sfx}
			endif
			if (<tie> = true)
				winner_text = 'TIE!'
				winner_space_between = (40.0, 0.0)
				winner_scale = 2.0
			else
				if ($is_network_game)
					if (<p2_score> > <p1_score>)
						name = ($opponent_gamertag)
					else
						netsessionfunc \{obj = match
							func = get_gamertag}
					endif
					formattext textname = winner_text <name>
					<text_pos> = (640.0, 240.0)
				else
					formattext textname = winner_text 'Player %s Rocks!' s = <winner>
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
	stringlength string = <winner_text>
	<fit_dims> = (<str_len> * (23.0, 0.0))
	if (<fit_dims>.(1.0, 0.0) >= 350)
		<fit_dims> = (350.0, 0.0)
	endif
	if NOT english
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
	split_text_into_array_elements {
		id = yourock_text
		text = <winner_text>
		text_pos = <text_pos>
		space_between = (<winner_space_between> * 2.0)
		flags = {
			rgba = [255 255 255 255]
			scale = (<winner_scale> * 2.0)
			z_priority = 95
			font = text_a10_large
			rgba = [223 223 223 255]
			just = [center center]
			alpha = 1
		}
		centered
	}
	if (<rock_legend> = 1)
		if NOT english
			temp_string = 'ROCK LEGEND!'
			stringlength string = <temp_string>
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
		split_text_into_array_elements {
			id = yourock_text_legend
			text = 'ROCK LEGEND!'
			text_pos = (<text_pos> + (0.0, 120.0))
			space_between = (<winner_space_between> * 1.7)
			flags = {
				rgba = [255 255 255 255]
				scale = (<winner_scale> * 1.7)
				z_priority = 95
				font = text_a10_large
				rgba = [223 223 223 255]
				just = [center center]
				alpha = 1
			}
			centered
		}
	endif
	if (($is_network_game) && ($battle_sudden_death = 0) && (<tie> = false))
		if NOT ($game_mode = p2_coop)
			split_text_into_array_elements {
				id = yourock_text_2
				text = 'Rocks!'
				text_pos = (640.0, 380.0)
				fit_dims = <fit_dims>
				space_between = <winner_space_between>
				flags = {
					rgba = [255 255 255 255]
					scale = <winner_scale>
					z_priority = 95
					font = text_a10_large
					rgba = [223 223 223 255]
					just = [center center]
					alpha = 1
				}
				centered
			}
		endif
	endif
	if NOT ($devil_finish = 1 || $battle_sudden_death = 1)
		if ($current_song = bossslash || $current_song = bosstom || $current_song = bossdevil)
			boss_character = -1
			if ($current_song = bossslash)
				<boss_character> = 0
			elseif ($current_song = bosstom)
				<boss_character> = 1
			elseif ($current_song = bossdevil)
				<boss_character> = 2
			endif
			if (<boss_character> >= 0)
				unlocked_for_purchase = 1
				getglobaltags ($secret_characters [<boss_character>].id)
				if (<unlocked_for_purchase> = 0)
					spawnscriptnow \{boss_unlocked_text
						params = {
							parent_id = yourock_text
						}}
					setglobaltags ($secret_characters [<boss_character>].id) params = {unlocked_for_purchase = 1}
				endif
			endif
		endif
	endif
	0x7227fca9 = (($levelzones.$current_level).name)
	0xe96b280f = ($current_song)
	change \{old_song = none}
	if NOT ($devil_finish = 1)
		if NOT ($battle_sudden_death = 1)
			progression_songwon
			if ($current_transition = preencore)
				end_song
				unpausegame
				transition_play \{type = preencore}
				transition_wait
				change \{current_transition = none}
				pausegame
				ui_flow_manager_respond_to_action \{action = preencore_win_song}
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
			killspawnedscript \{name = jiggle_text_array_elements}
			spawnscriptnow \{jiggle_text_array_elements
				params = {
					id = yourock_text
					time = 1.0
					wait_time = 3000
					explode = 1
				}}
			spawnscriptnow \{sudden_death_helper_text
				params = {
					parent_id = yourock_text
				}}
			wait \{0.1
				seconds}
			spawnscriptnow \{waitandkillhighway}
			wait \{4
				seconds}
			change \{current_transition = none}
			pausegame
		endif
	else
		unpausegame
		transition_play \{type = songwon}
		spawnscriptnow \{wait_and_play_you_rock_movie}
		killspawnedscript \{name = jiggle_text_array_elements}
		spawnscriptnow \{jiggle_text_array_elements
			params = {
				id = yourock_text
				time = 1.0
				wait_time = 2000
				explode = 1
			}}
		devil_finish_anim
		wait \{0.15
			seconds}
		spawnscriptnow \{waitandkillhighway}
		wait \{2.5
			seconds}
		wait \{0.5
			seconds}
		change \{current_transition = none}
		create_loading_screen
		pausegame
	endif
	if ($end_credits = 1 && $current_song = bossdevil)
		menu_music_off \{setflag = 1}
		get_movie_id_by_name \{movie = 'singleplayer_end'}
		setglobaltags <id> params = {unlocked = 1}
	endif
	if ($battle_sudden_death = 1)
		stopsoundevent \{gh_sfx_battlemode_sudden_death}

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
		if screenelementexists \{id = yourock_text}
			destroyscreenelement \{id = yourock_text}
		endif
	elseif ($end_credits = 1 && $current_song = thrufireandflames)
		destroy_menu \{menu_id = yourock_text}
		destroy_menu \{menu_id = yourock_text_2}
		change \{end_credits = 0}
		career_song_ended_select_quit
		start_flow_manager \{flow_state = career_credits_autosave_fs}
	elseif ($devil_finish = 1)
		start_devil_finish
	else
		destroy_menu \{menu_id = yourock_text}
		destroy_menu \{menu_id = yourock_text_2}
		destroy_menu \{menu_id = yourock_text_legend}
		0x3e5d7af6
		ui_flow_manager_respond_to_action \{action = win_song}
	endif
	if ($is_network_game)

		writeachievements \{achievement = 0xbcefdfc0}
	endif
	if isngc
		if (($game_mode = p1_career) || ($game_mode = p2_career))
			agora_update
		endif
		if ($is_network_game && ($ranked_match = ranked))
			if ishost
				agora_write_stats venue = <0x7227fca9> song = <0xe96b280f>
			endif
		elseif NOT ($boss_battle = 1)
			if NOT ($devil_finish)
				agora_write_stats venue = <0x7227fca9> song = <0xe96b280f>
			endif
		endif
		if ($is_network_game = 0)
			net_write_single_player_stats
		endif
	endif
	if (isngc)
		if ($is_network_game = 0)
			if NOT ($devil_finish = 1)
				if NOT ($battle_sudden_death = 1)
					if NOT gotparam \{encore_transition}
						spawnscriptnow \{xenon_singleplayer_session_complete_uninit}
					endif
				endif
			endif
		endif
	endif
	soundevent \{event = crowd_med_to_good_sfx}
	if ($is_network_game)
		mark_safe_for_shutdown
	endif
endscript

script sudden_death_helper_text 
	formattext \{checksumname = text_checksum
		'sudden_death_helper'}
	createscreenelement {
		type = textelement
		id = <text_checksum>
		parent = <parent_id>
		pos = (640.0, 500.0)
		text = 'All powerups are death drain attacks!'
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
		parent = <parent_id>
		pos = (640.0, 540.0)
		text = 'Launch a devastating DEATH DRAIN!'
		font = text_a4
		scale = 0.8
		rgba = [255 255 255 255]
		just = [center bottom]
		z_priority = 500
	}
	wait \{3
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
	if ($current_song = bosstom)
		formattext \{textname = boss
			'Tom Morello'}
		pos = (634.0, 580.0)
	elseif ($current_song = bossslash)
		pos = (634.0, 580.0)
		formattext \{textname = boss
			'Slash'}
	elseif ($current_song = bossdevil)
		pos = (800.0, 580.0)
		formattext \{textname = boss
			'Lou'}
	endif
	formattext \{textname = unlocked
		'unlocked'}
	formattext \{textname = visit_store
		'VISIT STORE'}
	formattext textname = text '%s %b, %v' s = <boss> b = <unlocked> v = <visit_store>
	formattext \{checksumname = boss_unlocked
		'boss_unlocked'}
	if screenelementexists id = <boss_unlocked>
		destroyscreenelement id = <boss_unlocked>
	endif
	createscreenelement {
		type = textelement
		id = <boss_unlocked>
		parent = <parent_id>
		pos = <pos>
		text = <text>
		font = text_a11
		scale = 1.1
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
endscript
0xe22ef7b4 = null

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
	destroy_loading_screen
	0x810401fe \{filename = 'OTHER\\WLA\\DEVILDIE'
		0x3dd98e8d = 33075
		stereo = true}
	change 0xe22ef7b4 = <unique_id>
	waitforpreload_stream \{stream = 0xe22ef7b4}
	startpreloadedstream \{$0xe22ef7b4}
	devil_lose_anim
	wait \{20
		frames}
	startrendering
	if screenelementexists \{id = yourock_text}
		destroyscreenelement \{id = yourock_text}
	endif
	if screenelementexists \{id = yourock_text_legend}
		destroyscreenelement \{id = yourock_text_legend}
	endif
endscript

script devil_finish_anim 
	waitonegameframe
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
g_you_rock_movie = none

script create_you_rock_effect \{player_status = player1_status}
	createscreenelement \{type = containerelement
		id = 0x28b7e339
		parent = root_window
		pos = (0.0, 0.0)}
	0xc32fe099 = 0.8
	htx = (640.0 - ($highway_top_width / 2.0))
	gts = ($highway_top_width / 5.0)
	gsx = (<htx> + (<gts> / 2.0) + (<gts> * 0.0))
	rsx = (<htx> + (<gts> / 2.0) + (<gts> * 1.0))
	ysx = (<htx> + (<gts> / 2.0) + (<gts> * 2.0))
	bsx = (<htx> + (<gts> / 2.0) + (<gts> * 3.0))
	osx = (<htx> + (<gts> / 2.0) + (<gts> * 4.0))
	hbw = ($highway_top_width + ($highway_top_width * $widthoffsetfactor))
	hbx = (640.0 - (<hbw> / 2.0))
	gbs = (<hbw> / 5.0)
	gex = (<hbx> + (<gbs> / 2.0) + (<gbs> * 0.0))
	rex = (<hbx> + (<gbs> / 2.0) + (<gbs> * 1.0))
	yex = (<hbx> + (<gbs> / 2.0) + (<gbs> * 2.0))
	bex = (<hbx> + (<gbs> / 2.0) + (<gbs> * 3.0))
	oex = (<hbx> + (<gbs> / 2.0) + (<gbs> * 4.0))
	0xaff72fb8 = [0.0 0.0 0.0 0.0 0.0]
	0xa21e37cd = [0.0 0.0 0.0 0.0 0.0]
	setarrayelement arrayname = 0xaff72fb8 index = 0 newvalue = <gsx>
	setarrayelement arrayname = 0xaff72fb8 index = 1 newvalue = <rsx>
	setarrayelement arrayname = 0xaff72fb8 index = 2 newvalue = <ysx>
	setarrayelement arrayname = 0xaff72fb8 index = 3 newvalue = <bsx>
	setarrayelement arrayname = 0xaff72fb8 index = 4 newvalue = <osx>
	setarrayelement arrayname = 0xa21e37cd index = 0 newvalue = <gex>
	setarrayelement arrayname = 0xa21e37cd index = 1 newvalue = <rex>
	setarrayelement arrayname = 0xa21e37cd index = 2 newvalue = <yex>
	setarrayelement arrayname = 0xa21e37cd index = 3 newvalue = <bex>
	setarrayelement arrayname = 0xa21e37cd index = 4 newvalue = <oex>
	0xb468a887 = [[255 255 255 255] [255 64 64 255] [255 156 93 255] [180 100 30 255] [170 26 26 255]]
	0x97327036 = [0.25 0.1 0.15 0.3 0.05]
	0x87e1a50f = [(1.2, 0.8) (1.8, 1.2) (0.8, 0.4) (1.0, 0.9) (0.7, 0.7)]
	0x875b3b17 = [9.1 9.2 9.3 9.4 9.5]
	0xf1036f5e = [flames flames]
	p1_score = ($player1_status.score)
	p2_score = ($player2_status.score)
	if ($current_num_players = 2)
		if NOT (($game_mode = p2_career) || ($battle_sudden_death = 1))
			if (<p1_score> < <p2_score>)
				setarrayelement \{arrayname = 0xf1036f5e
					index = 0
					newvalue = lightning}
			endif
			if (<p2_score> < <p1_score>)
				setarrayelement \{arrayname = 0xf1036f5e
					index = 1
					newvalue = lightning}
			endif
		endif
	endif
	spawnscriptnow 0xccc9cfe1 params = {wait_time = <0xc32fe099>}
	player = 0
	player_count = ($current_num_players)
	begin
	if ($current_num_players = 1)
		0xeaf2fe00 = 0
	else
		if (<player> = 0)
			0xeaf2fe00 = (0 - $x_offset_p2)
		else
			0xeaf2fe00 = ($x_offset_p2)
		endif
	endif
	if (<0xf1036f5e> [<player>] = flames)
		index = 0
		count = 5
		begin
		0xa34438ed = ((1.0, 0.0) * (<0xaff72fb8> [<index>] + <0xeaf2fe00>) + (0.0, 1.0) * ($highway_playline - $highway_height))
		0x37408261 = ((1.0, 0.0) * (<0xa21e37cd> [<index>] + <0xeaf2fe00>) + (0.0, 1.0) * (720))
		getrandomvalue \{name = 0x579a5435
			a = 1
			b = 4
			integer}
		flame_scale = (1.8, 1.2)
		createscreenelement {
			type = spriteelement
			parent = 0x28b7e339
			use_animated_uvs = true
			top_down_v
			frame_length = (<0x97327036> [<0x579a5435>])
			num_uv_frames = (2.0, 2.0)
			dims = (96.0, 192.0)
			just = [center bottom]
			pos = <0xa34438ed>
			scale = (<flame_scale> * 0.25)
			z_priority = (<0x875b3b17> [0])
			rgba = (<0xb468a887> [<0x579a5435>])
			texture = 0x834b46ad
		}
		runscriptonscreenelement id = <id> 0x0c92f658 params = {time = <0xc32fe099> pos = <0x37408261> scale = (<flame_scale> * 4.2 * 0.25)}
		flame_index = 1
		0x8099bc04 = 4
		begin
		getrandomvalue \{name = 0x579a5435
			a = 0
			b = 4
			integer}
		flame_scale = (<0x87e1a50f> [<flame_index>])
		createscreenelement {
			type = spriteelement
			parent = 0x28b7e339
			blend = add
			use_animated_uvs = true
			top_down_v
			frame_length = (<0x97327036> [<0x579a5435>])
			num_uv_frames = (2.0, 2.0)
			dims = (96.0, 192.0)
			just = [center bottom]
			pos = <0xa34438ed>
			scale = (<flame_scale> * 0.25)
			z_priority = (<0x875b3b17> [<flame_index>])
			rgba = (<0xb468a887> [<0x579a5435>])
			texture = 0x834b46ad
		}
		runscriptonscreenelement id = <id> 0x0c92f658 params = {time = <0xc32fe099> pos = <0x37408261> scale = (<flame_scale> * 3.8 * 0.25)}
		flame_index = (<flame_index> + 1)
		repeat <0x8099bc04>
		index = (<index> + 1)
		repeat <count>
	else
		spawnscriptnow 0x9748671f params = {<...>}
	endif
	player = (<player> + 1)
	repeat <player_count>
	wait (<0xc32fe099> + 0.6) seconds
	killspawnedscript \{name = 0x9748671f}
	destroyscreenelement \{id = 0x28b7e339}
endscript

script 0x9748671f 
	if (<player> = 0)
		highway_container = gem_containerp1
	else
		highway_container = gem_containerp2
	endif
	getscreenelementposition id = <highway_container>
	0xd4258082 = ((0.0, 1.0).<screenelementpos>)
	spawnscriptnow 0x016eec1e params = {highway_id = <highway_container> time = <0xc32fe099>}
	0x23b7898d = 0.02
	0xa4fa443d = (<0xc32fe099> / <0x23b7898d>)
	casttointeger \{0xa4fa443d}
	y_diff = (720 - ($highway_playline - $highway_height))
	begin
	getrandomvalue \{name = 0x5727892d
		a = 0
		b = 4
		integer}
	getrandomvalue \{name = 0x8d435de7
		a = 0
		b = 1}
	x_diff = (<0xa21e37cd> [<0x5727892d>] - <0xaff72fb8> [<0x5727892d>])
	x_pos = (<0xaff72fb8> [<0x5727892d>] + <0x8d435de7> * <x_diff>)
	x_pos = (<x_pos> + <0xeaf2fe00>)
	y_pos = (($highway_playline - $highway_height) + <0x8d435de7> * <y_diff>)
	getscreenelementposition id = <highway_container>
	0xae46e4d6 = (<0xd4258082> - <screenelementpos>.(0.0, 1.0))
	y_pos = (<y_pos> + <0xae46e4d6>)
	createscreenelement {
		type = spriteelement
		parent = 0x28b7e339
		use_animated_uvs = true
		blend = add
		top_down_v
		frame_length = 0.005
		num_uv_frames = (8.0, 1.0)
		just = [center bottom]
		pos = ((1.0, 0.0) * <x_pos> + (0.0, 1.0) * <y_pos>)
		z_priority = 10
		texture = sys_big_bolt01_sys_big_bolt01
	}
	wait (<0x23b7898d>) seconds
	if screenelementexists id = <id>
		destroyscreenelement id = <id>
	endif
	repeat <0xa4fa443d>
endscript

script 0xccc9cfe1 \{wait_time = 0.0}
	if NOT ($devil_finish = 1 || $battle_sudden_death = 1)
		killspawnedscript \{name = jiggle_text_array_elements}
		spawnscriptlater \{jiggle_text_array_elements
			params = {
				id = yourock_text
				time = 1.0
				wait_time = 3000
				explode = 1
			}}
		if ($current_song = bossdevil && $devil_finish = 0)
			spawnscriptlater \{jiggle_text_array_elements
				params = {
					id = yourock_text_legend
					time = 1.0
					wait_time = 3000
					explode = 1
				}}
		endif
		if ($is_network_game)
			spawnscriptlater \{jiggle_text_array_elements
				params = {
					id = yourock_text_2
					time = 1.0
					wait_time = 3000
					explode = 1
				}}
		endif
		wait (<wait_time>) seconds
		spawnscriptnow \{0x285fc901}
	endif
endscript

script 0x0c92f658 
	domorph time = <time> pos = <pos> scale = <scale>
	wait \{0.4
		seconds}
	domorph \{time = 0.2
		alpha = 0
		scale = 0.001}
endscript

script 0x016eec1e 
	spawnscriptnow 0xbaad94ac params = {highway_id = <highway_id>}
	wait <time> seconds
	killspawnedscript \{name = 0xbaad94ac}
endscript

script 0xbaad94ac 
	begin
	getscreenelementposition id = <highway_id>
	getrandomvalue \{name = x_offset
		a = -10
		b = 10}
	getrandomvalue \{name = y_offset
		a = 0
		b = 10}
	<screenelementpos> = (<screenelementpos> + (1.0, 0.0) * <x_offset> + (0.0, 1.0) * (<y_offset>))
	doscreenelementmorph time = 0 id = <highway_id> pos = <screenelementpos>
	wait \{0.05
		seconds}
	repeat
endscript

script wait_and_play_you_rock_movie 
	if ($is_network_game = 1)
		if ($player2_present = 1)
			create_you_rock_effect
		endif
	else
		create_you_rock_effect
	endif
endscript

script waitandkillhighway \{wait_time = 0.5}
	wait (<wait_time>) seconds
	soundevent \{event = crowd_fast_surge_cheer}
	player = 1
	begin
	formattext checksumname = player_status 'player%i_status' i = <player> addtostringlookup
	formattext textname = player_text 'p%i' i = <player> addtostringlookup
	0xdb27dc8e <...> time = ($current_intro.highway_move_time / 1000.0)
	player = (<player> + 1)
	repeat $current_num_players
endscript

script 0x285fc901 
	soundevent \{event = crowd_fast_surge_cheer}
	player = 1
	begin
	formattext checksumname = player_status 'player%i_status' i = <player> addtostringlookup
	formattext textname = player_text 'p%i' i = <player> addtostringlookup
	0xdb27dc8e <...> time = 0.005
	player = (<player> + 1)
	repeat $current_num_players
endscript

script guitarevent_crowd_poor_medium 
endscript

script guitarevent_crowd_medium_good 
endscript

script guitarevent_crowd_medium_poor 
endscript

script guitarevent_crowd_good_medium 
endscript

script guitarevent_starhitnote 
endscript

script guitarevent_starsequencebonus 
	wait_for_correct_frame player = ($<player_status>.player)
	if ($is_attract_mode = 1)
		return
	endif
	change structurename = <player_status> sp_phrases_hit = ($<player_status>.sp_phrases_hit + 1)
	soundevent \{event = star_power_awarded_sfx}
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
			blend = add
			use_animated_uvs = true
			top_down_v
			frame_length = 0.005
			num_uv_frames = (8.0, 1.0)
			rgba = [255 255 255 255]
			pos = <pos2d>
			rot_angle = <angle>
			scale = (0.5 * $star_power_bolt_scale)
			just = [center bottom]
			z_priority = 6
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
		waitonegameframe
	endif
	gem_count = (<gem_count> + 1)
	repeat <array_size>
endscript

script guitarevent_starmissnote 
endscript

script guitarevent_multiplier4xon 
endscript

script guitarevent_multiplier4xon_spawned 
endscript

script guitarevent_multiplier3xon 
endscript

script guitarevent_multiplier2xon 
endscript

script kill_4x_fx 
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
endscript

script destroy_first_gem_fx 
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

script guitarevent_transitionencore 
endscript

script guitarevent_transitionpreboss 
endscript

script guitarevent_transitionboss 
endscript
