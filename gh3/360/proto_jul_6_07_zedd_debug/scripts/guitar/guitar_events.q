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
]

script create_guitar_events 
	printf "create_guitar_events %a .........." a = <player_text>
	getarraysize $guitar_events
	array_entry = 0
	begin
	printf "adding..."
	event = ($guitar_events [<array_entry>].event)
	extendcrc <event> <player_text> out = event
	seteventhandler response = call_script event = <event> scr = event_spawner params = {event_spawned = <array_entry>}
	array_entry = (<array_entry> + 1)
	repeat <array_size>
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
	begin
	if (<time> >= (($<song> [<array_entry>]).time))
		break
	endif
	wait 1 gameframe
	getsongtimems time_offset = <time_offset>
	repeat
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
		soundevent event = single_player_bad_note_guitar
	endif
	if NOT ($<player_status>.guitar_volume = 0)
		if (<silent_miss> = 1)
			spawnscriptnow highway_pulse_black params = {player_text = ($<player_status>.text)}
		else
			change structurename = <player_status> guitar_volume = 0
			0x1c07e771
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

script guitarevent_unnecessarynote 
	if NOT ($current_song = improv)
		soundevent event = single_player_bad_note_guitar
	endif
	change structurename = <player_status> guitar_volume = 0
	0x1c07e771
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
	if ($show_play_log = 1)
		<off_note> = (0 - (<off_note> - $default_input_offset))
		note_time = ($<song> [<array_entry>] [0])
		if (<off_note> < 0)
			output_log_text "HE: %n (%t)" n = <off_note> t = <note_time> color = green
		else
			output_log_text "HL: %n (%t)" n = <off_note> t = <note_time> color = darkgreen
		endif
	endif
	if ($auto_wah_is_on = 1)
		killspawnedscript name = gh_battlemode_modulate_wah_value
	endif
	if ($debug_audible_hitnote = 1)
		soundevent event = gh_sfx_hitnotesoundevent
	endif
	change structurename = <player_status> guitar_volume = 100
	0x1c07e771
	if NOT (<whammy_length> > 0.0)
		crowdincrease player_status = <player_status>
	endif
	getarraysize $gem_colors
	check_button = 65536
	array_count = 0
	extendcrc button_up_pixel_array ($<player_status>.text) out = pixel_array
	begin
	color = ($gem_colors [<array_count>])
	if (<pattern> && <check_button>)
		setarrayelement arrayname = <pixel_array> globalarray index = <array_count> newvalue = $button_up_pixels
	endif
	<check_button> = (<check_button> / 16)
	array_count = (<array_count> + 1)
	repeat <array_size>
	if ($disable_band = 0)
		if compositeobjectexists name = (<player_status>.band_member)
			launchevent type = anim_hitnote target = (<player_status>.band_member)
		endif
	endif
endscript

script guitarevent_hitnote 
	spawnscriptnow guitarevent_hitnote_spawned params = {<...>}
endscript

script guitarevent_hitnote_spawned 
	wait \{1
		gameframe}
	if ($game_mode = p2_battle || $boss_battle = 1)
		change structurename = <player_status> last_hit_note = <color>
	endif
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
	start_angle_spread = 360.0
	min_rotation = -500.0
	max_rotation = 500.0
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
	start_angle_spread = 360.0
	min_rotation = -500.0
	max_rotation = 500.0
	emit_start_radius = 0.0
	emit_radius = 1.0
	emit_rate = 0.02
	emit_dir = 0.0
	emit_spread = 160.0
	velocity = 10.0
	friction = (0.0, 50.0)
	time = 0.25
}

script hit_note_fx 
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
	gh_star_power_verb_on
	spawnscriptnow 0xd2ffedc8
	formattext checksumname = scriptid '%p_StarPower_StageFX' p = <player_text>
	spawnscriptlater do_starpower_stagefx id = <scriptid> params = {<...>}
	formattext checksumname = cont 'starpower_container_left%p' p = <player_text> addtostringlookup = true
	doscreenelementmorph id = <cont> alpha = 1
	formattext checksumname = cont 'starpower_container_right%p' p = <player_text> addtostringlookup = true
	doscreenelementmorph id = <cont> alpha = 1
	formattext checksumname = highway 'Highway_2D%p' p = <player_text> addtostringlookup = true
	setscreenelementprops id = <highway> rgba = ($highway_starpower)
	if ($current_num_players = 1)
		spawnscriptnow do_starpower_camera
	endif
endscript

script guitarevent_starpoweroff 
	gh_star_power_verb_off
	spawnscriptnow rock_meter_star_power_off params = {player_text = <player_text>}
	spawnscriptlater kill_starpower_stagefx params = {<...>}
	formattext checksumname = cont 'starpower_container_left%p' p = <player_text> addtostringlookup = true
	doscreenelementmorph id = <cont> alpha = 0
	formattext checksumname = cont 'starpower_container_right%p' p = <player_text> addtostringlookup = true
	doscreenelementmorph id = <cont> alpha = 0
	formattext checksumname = highway 'Highway_2D%p' p = <player_text> addtostringlookup = true
	setscreenelementprops id = <highway> rgba = ($highway_normal)
	spawnscriptnow kill_starpower_camera
endscript

script guitarevent_prefretbar 
	waittime = 0.18
	wait <waittime> seconds
	if ($<player_status>.star_power_used = 1)
		printf \{channel = sfx
			"Clap"}
		soundevent \{event = crowd_individual_clap_to_beat}
	else
		if ($crowdlistenerstateclapon1234 = 1)
			soundevent \{event = crowd_individual_clap_to_beat}
		endif
	endif
endscript
beat_flip = 0

script guitarevent_fretbar 
	if ($current_num_players = 2)
		if ($game_mode = p2_battle)
			<dying> = 0
			if (($player1_status.current_health) <= $crowd_poor_medium)
				<dying> = 1
			endif
			set_sidebar_flash <...> player_status = player1_status
			<dying> = 0
			if (($player2_status.current_health) <= $crowd_poor_medium)
				<dying> = 1
			endif
			set_sidebar_flash <...> player_status = player2_status
		else
			<dying> = 0
			if ($current_crowd <= $crowd_poor_medium)
				<dying> = 1
			endif
			if ($game_mode = p2_faceoff)
				<dying> = 0
			endif
			if ($game_mode = p2_pro_faceoff)
				<dying> = 0
			endif
			set_sidebar_flash <...> player_status = player1_status
			set_sidebar_flash <...> player_status = player2_status
		endif
	else
		<dying> = 0
		if ($current_crowd <= $crowd_poor_medium)
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

script 0x47483184 
	if gotparam color
		switch <color>
			case green
			<name> = 0xa43365ca
			case red
			<name> = 0xc9ee8121
			case yellow
			<name> = 0x5e3c58a9
			case blue
			<name> = 0xd4599145
			case orange
			<name> = 0xaae8edf8
			default
			printf "--- Unknown note hit event: %s ---" s = <color>
			<name> = 0xc347fdaf
		endswitch
		extendcrc <name> <player_text> out = fx_id
		if screenelementexists id = <fx_id>
			destroyscreenelement id = <fx_id>
			wait 1 gameframe
		endif
		formattext checksumname = container_id 'gem_container%p' p = <player_text> addtostringlookup = true
		createscreenelement {
			type = spriteelement
			id = <fx_id>
			parent = <container_id>
			clonematerial = sys_whammy_hold01_sys_whammy_hold01
			rgba = [255 255 255 255]
			pos = <pos>
			scale = 1.0
			just = [0.0 1.0]
			z_priority = 10
		}
		<particle_pos> = (<pos> - (0.0, 20.0))
		extendcrc <fx_id> '_particle' out = particle_id
		destroy2dparticlesystem id = <particle_id>
		create2dparticlesystem {
			id = <particle_id>
			pos = <particle_pos>
			z_priority = 8.0
			material = sys_particle_spark01_sys_particle_spark01
			parent = <container_id>
			start_color = [255 128 0 255]
			end_color = [255 0 0 0]
			start_scale = (1.0, 1.0)
			end_scale = (0.5, 0.5)
			start_angle_spread = 360.0
			min_rotation = -500.0
			max_rotation = 500.0
			emit_start_radius = 0.0
			emit_radius = 1.0
			emit_rate = 0.02
			emit_dir = 0.0
			emit_spread = 160.0
			velocity = 10.0
			friction = (0.0, 50.0)
			time = 0.5
		}
	endif
endscript

script 0x8cf7ef08 
	if gotparam color
		switch <color>
			case green
			<name> = 0xa43365ca
			case red
			<name> = 0xc9ee8121
			case yellow
			<name> = 0x5e3c58a9
			case blue
			<name> = 0xd4599145
			case orange
			<name> = 0xaae8edf8
			default
			printf "--- Unknown note hit event: %s ---" s = <color>
			<name> = 0xc347fdaf
		endswitch
		extendcrc <name> <player_text> out = fx_id
		if screenelementexists id = <fx_id>
			destroyscreenelement id = <fx_id>
		endif
		extendcrc <fx_id> '_particle' out = particle_id
		destroy2dparticlesystem id = <particle_id> kill_when_empty
	endif
endscript

script destroy_allwhammyfx 
	getarraysize \{$gem_colors}
	array_count = 0
	begin
	color = ($gem_colors [<array_count>])
	0x8cf7ef08 color = <color> player_status = player1_status player_text = 'p1'
	0x8cf7ef08 color = <color> player_status = player2_status player_text = 'p2'
	array_count = (<array_count> + 1)
	repeat <array_size>
endscript

script guitarevent_whammyon 
	getarraysize $gem_colors
	array_count = 0
	begin
	if ((<pattern> && $button_values [<array_count>]) = $button_values [<array_count>])
		0xdf4ac783 = ($<song> [<array_entry>] [(<array_count> + 1)])
		if (<0xdf4ac783> > 0)
			color = ($gem_colors [<array_count>])
			if ($<player_status>.lefthanded_button_ups = 1)
				pos = ($button_up_models.<color>.left_pos_2d)
			else
				pos = ($button_up_models.<color>.pos_2d)
			endif
			0x8cf7ef08 color = <color> player_status = <player_status> player_text = <player_text>
			0x47483184 color = <color> pos = <pos> player_status = <player_status> player_text = <player_text>
		endif
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
endscript

script guitarevent_whammyoff \{finished = 0}
	getarraysize \{$gem_colors}
	array_count = 0
	begin
	if ((<pattern> && $button_values [<array_count>]) = $button_values [<array_count>])
		0xdf4ac783 = ($<song> [<array_entry>] [(<array_count> + 1)])
		if (<0xdf4ac783> > 0)
			color = ($gem_colors [<array_count>])
			0x8cf7ef08 color = <color> player_status = <player_status> player_text = <player_text>
		endif
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
endscript

script guitarevent_starwhammyon 
endscript

script guitarevent_starwhammyoff 
endscript

script guitarevent_songfailed 
	if ($game_mode = training)
		return
	endif
	if (($is_network_game = 0) && ($game_mode = p2_battle))
		guitarevent_songwon \{battle_win = 1}
	else
		spawnscriptnow \{guitarevent_songfailed_spawned}
	endif
endscript

script guitarevent_songfailed_spawned 
	if NOT ($boss_battle = 1)
		disable_highway_prepass
		disable_bg_viewport
	endif
	getsongtimems
	change failed_song_time = <time>
	if ($is_network_game)
		spawnscriptnow online_fail_song
	endif
	pausegame
	progression_songfailed
	if ($boss_battle = 1)
		kill_start_key_binding
		preload_movie = 'Player2_wins'
		killmovie textureslot = 1
		preloadmovie {
			movie = <preload_movie>
			textureslot = 1
			texturepri = 70
			no_looping
			no_hold
			nowait
		}
		formattext textname = winner_text "%s Rocks!" s = ($current_boss.character_name)
		0xd115b6aa = (250.0, 360.0)
		winner_space_between = (50.0, 0.0)
		winner_scale = 2.6
		if ($current_boss.character_profile = morello)
			<0xd115b6aa> = (265.0, 360.0)
			<winner_space_between> = (45.0, 0.0)
			<winner_scale> = 2.5
		endif
		if ($current_boss.character_profile = slash)
			<0xd115b6aa> = (378.0, 360.0)
			<winner_space_between> = (50.0, 0.0)
			<winner_scale> = 2.6
		endif
		if ($current_boss.character_profile = satan)
			<0xd115b6aa> = (375.0, 360.0)
			<winner_space_between> = (50.0, 0.0)
			<winner_scale> = 2.6
		endif
		spawnscriptnow wait_and_play_you_rock_movie
		wait 0.2 seconds
		destroy_menu menu_id = yourock_text
		split_text_into_array_elements {
			id = yourock_text
			text = <winner_text>
			text_pos = <0xd115b6aa>
			space_between = <winner_space_between>
			just = [center center]
			flags = {
				rgba = [255 255 255 255]
				scale = <winner_scale>
				z_priority = 95
				font = text_a10
				rgba = [223 223 223 255]
				just = [center center]
				alpha = 1
			}
		}
		spawnscriptnow waitandkillhighway
		killspawnedscript name = jiggle_text_array_elements
		spawnscriptnow jiggle_text_array_elements params = {id = yourock_text time = 1.0 wait_time = 3000 explode = 1}
	endif
	if ($is_network_game = 0)
		if NOT (($game_mode = p2_battle) || ($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff))
			xenon_singleplayer_session_begin_uninit
		endif
	endif
	unpausegame
	soundevent event = crowd_fail_song_sfx
	soundevent event = gh_sfx_you_lose_single_player
	transition_play type = songlost
	transition_wait
	change current_transition = none
	pausegame
	restore_start_key_binding
	spawnscriptnow ui_flow_manager_respond_to_action params = {action = fail_song}
	if ($current_num_players = 1)
		soundevent event = crowd_fail_song_sfx
	else
		soundevent event = crowd_med_to_good_sfx
	endif
endscript

script guitarevent_songwon battle_win = 0
	if notcd
		if ($output_gpu_log = 1)
			if isps3
				formattext textname = filename "%s_gpu_ps3" s = $current_level dontassertforchecksums
			else
				formattext textname = filename "%s_gpu" s = $current_level dontassertforchecksums
			endif
			textoutputend output_text filename = <filename>
		endif
		if ($output_song_stats = 1)
			formattext textname = filename "%s_stats" s = $current_song dontassertforchecksums
			textoutputstart
			textoutput text = "Player 1"
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
				formattext textname = text "Score Scale: n/a"
			else
				formattext textname = text "Score Scale: %s" s = (($player1_status.score) / ($player1_status.base_score)) dontassertforchecksums
			endif
			textoutput text = <text>
			if (($player1_status.total_notes) = 0)
				formattext textname = text "Notes Hit Percentage: n/a"
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
		change last_time_in_lead_player = -1
	endif
	if (($game_mode = p2_battle) && ($is_network_game = 0))
		if NOT (<battle_win> = 1)
			change save_current_powerups_p1 = $current_powerups_p1
			change save_current_powerups_p2 = $current_powerups_p2
			change current_powerups_p1 = [0 0 0]
			change current_powerups_p2 = [0 0 0]
			change structurename = player1_status save_num_powerups = ($player1_status.current_num_powerups)
			change structurename = player2_status save_num_powerups = ($player2_status.current_num_powerups)
			change structurename = player1_status current_num_powerups = 0
			change structurename = player2_status current_num_powerups = 0
			p1_health = ($player1_status.current_health)
			p2_health = ($player2_status.current_health)
			change structurename = player1_status save_health = <p1_health>
			change structurename = player2_status save_health = <p2_health>
			battlemode_killspawnedscripts
			if screenelementexists id = battlemode_container
				destroyscreenelement id = battlemode_container
			endif
			change battle_sudden_death = 1
		else
			battlemode_killspawnedscripts
			change battle_sudden_death = 0
		endif
	endif
	spawnscriptnow guitarevent_songwon_spawned
endscript

script guitarevent_songwon_spawned 
	if ($is_network_game)
		sendnetmessage {
			type = net_win_song
			stars = ($player1_status.stars)
			note_streak = ($player1_status.best_run)
			notes_hit = ($player1_status.notes_hit)
			total_notes = ($player1_status.total_notes)
		}
	endif
	if ($is_attract_mode = 1)
		spawnscriptnow ui_flow_manager_respond_to_action params = {action = exit_attract_mode play_sound = 0}
		return
	endif
	if ($game_mode = tutorial)
		return
	endif
	if ($current_song = bossdevil && $devil_finish = 0)
		change devil_finish = 1
	else
		change devil_finish = 0
	endif
	progression_endcredits_done
	pausegame
	kill_start_key_binding
	soundevent event = you_rock_end_sfx
	spawnscriptnow you_rock_waiting_crowd_sfx
	if ($game_mode = p2_battle || $boss_battle = 1)
		if ($player1_status.current_health >= $player2_status.current_health)
			preload_movie = 'Player1_wins'
		else
			preload_movie = 'Player2_wins'
		endif
		if ($current_song = bossdevil && $devil_finish = 0)
			preload_movie = 'Fret_Flames'
		endif
		if ($battle_sudden_death = 1)
			preload_movie = 'Fret_Flames'
		endif
		killmovie textureslot = 1
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
		spawnscriptnow wait_and_play_you_rock_movie
	endif
	destroy_menu menu_id = yourock_text
	if ($battle_sudden_death = 1)
		winner_text = "Sudden Death!"
		0xd115b6aa = (265.0, 220.0)
		winner_space_between = (65.0, 0.0)
		winner_scale = 3.5
	else
		if ($game_mode = p2_battle)
			p1_health = ($player1_status.current_health)
			p2_health = ($player2_status.current_health)
			if (<p2_health> > <p1_health>)
				winner = "Two"
				soundevent event = ui_2ndplayerwins_sfx
			else
				winner = "One"
				soundevent event = ui_1stplayerwins_sfx
			endif
			formattext textname = winner_text "Player %s Rocks!" s = <winner>
			0xd115b6aa = (255.0, 360.0)
			winner_space_between = (50.0, 0.0)
			winner_scale = 2.8
		elseif ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff)
			p1_score = ($player1_status.score)
			p2_score = ($player2_status.score)
			if (<p2_score> > <p1_score>)
				winner = "Two"
				soundevent event = ui_2ndplayerwins_sfx
			else
				winner = "One"
				soundevent event = ui_1stplayerwins_sfx
			endif
			formattext textname = winner_text "Player %s Rocks!" s = <winner>
			0xd115b6aa = (255.0, 360.0)
			winner_space_between = (50.0, 0.0)
			winner_scale = 2.8
		else
			winner_text = "You Rock!"
			0xd115b6aa = (400.0, 360.0)
			winner_space_between = (75.0, 0.0)
			winner_scale = 4.0
		endif
		if ($devil_finish = 1)
			winner_text = "Now Finish Him!"
			0xd115b6aa = (300.0, 320.0)
			winner_space_between = (50.0, 0.0)
			winner_scale = 2.8
		endif
	endif
	split_text_into_array_elements {
		id = yourock_text
		text = <winner_text>
		text_pos = <0xd115b6aa>
		space_between = <winner_space_between>
		flags = {
			rgba = [255 255 255 255]
			scale = <winner_scale>
			z_priority = 95
			font = text_a10
			rgba = [223 223 223 255]
			just = [center center]
			alpha = 1
		}
	}
	if NOT ($devil_finish = 1 || $battle_sudden_death = 1)
		spawnscriptnow waitandkillhighway
		killspawnedscript name = jiggle_text_array_elements
		spawnscriptnow jiggle_text_array_elements params = {id = yourock_text time = 1.0 wait_time = 3000 explode = 1}
	endif
	if NOT ($devil_finish = 1)
		if NOT ($battle_sudden_death = 1)
			progression_songwon
			if ($is_network_game = 0)
				player1_score = ($player1_status.score)
				casttointeger player1_score
				send_leader_board_message score = <player1_score> leaderboard_id = ($current_song) diff = ($current_difficulty)
			endif
			if ($current_transition = preencore)
				end_song
				unpausegame
				transition_play type = preencore
				transition_wait
				change current_transition = none
				pausegame
				ui_flow_manager_respond_to_action action = preencore_win_song
			elseif ($current_transition = preboss)
				end_song
				unpausegame
				transition_play type = preboss
				transition_wait
				change current_transition = none
				pausegame
				ui_flow_manager_respond_to_action action = preboss_win_song
			else
				unpausegame
				transition_play type = songwon
				transition_wait
				change current_transition = none
				pausegame
			endif
		else
			unpausegame
			transition_play type = songwon
			spawnscriptnow wait_and_play_you_rock_movie
			killspawnedscript name = jiggle_text_array_elements
			spawnscriptnow jiggle_text_array_elements params = {id = yourock_text time = 1.0 wait_time = 3000 explode = 1}
			spawnscriptnow sudden_death_helper_text params = {parent_id = yourock_text}
			wait 0.1 seconds
			spawnscriptnow waitandkillhighway
			wait 4 seconds
			change current_transition = none
			pausegame
		endif
	else
		unpausegame
		transition_play type = songwon
		spawnscriptnow wait_and_play_you_rock_movie
		killspawnedscript name = jiggle_text_array_elements
		spawnscriptnow jiggle_text_array_elements params = {id = yourock_text time = 1.0 wait_time = 2000 explode = 1}
		devil_finish_anim
		wait 0.15 seconds
		spawnscriptnow waitandkillhighway
		wait 2.5 seconds
		soundevent event = devil_die_transition_sfx
		wait 0.5 seconds
		change current_transition = none
		pausegame
	endif
	disable_pause
	restore_start_key_binding
	if ($battle_sudden_death = 1)
		printf "BATTLE MODE, Song Won, Begin Sudden Death"
		change battle_sudden_death = 1
		ui_flow_manager_respond_to_action action = select_retry
		spawnscriptnow restart_song params = {sudden_death = 1}
		if screenelementexists id = yourock_text
			destroyscreenelement id = yourock_text
		endif
	elseif ($end_credits = 1 && $current_song = thrufireandflames)
		destroy_menu menu_id = yourock_text
		change end_credits = 0
		career_song_ended_select_quit
		start_flow_manager flow_state = main_menu_fs
	elseif ($devil_finish = 1)
		start_devil_finish
	else
		destroy_menu menu_id = yourock_text
		ui_flow_manager_respond_to_action action = win_song
	endif
	if ($is_network_game)
		printf "writing online achievement"
		writeachievements achievement = 0xbcefdfc0
	endif
	soundevent event = crowd_med_to_good_sfx
endscript

script sudden_death_helper_text 
	formattext checksumname = text_checksum 'sudden_death_helper'
	createscreenelement {
		type = textelement
		id = <text_checksum>
		parent = <parent_id>
		pos = (640.0, 380.0)
		text = "All powerups are death lick attacks!"
		font = text_a4
		scale = 0.8
		rgba = [255 255 255 255]
		just = [center bottom]
		z_priority = 500
	}
	formattext checksumname = text_checksum2 'sudden_death_helper2'
	createscreenelement {
		type = textelement
		id = <text_checksum2>
		parent = <parent_id>
		pos = (640.0, 420.0)
		text = "Launch a devastating POWER DRAIN!"
		font = text_a4
		scale = 0.8
		rgba = [255 255 255 255]
		just = [center bottom]
		z_priority = 500
	}
	wait 3 seconds
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

script start_devil_finish 
	change end_credits = 0
	marker_count = 37
	get_song_prefix song = ($current_song)
	formattext checksumname = marker_array '%s_markers' s = <song_prefix>
	starttime = ($<marker_array> [<marker_count>].time)
	startmarker = <marker_count>
	change cameracuts_forcetime = 0
	stoprendering
	restart_gem_scroller song_name = ($current_song) difficulty = ($current_difficulty) difficulty2 = ($current_difficulty2) starttime = <starttime> startmarker = <startmarker> no_render = 1 devil_finish_restart = 1
	startrendering
	devil_lose_anim
	if screenelementexists id = yourock_text
		destroyscreenelement id = yourock_text
	endif
endscript

script devil_finish_anim 
	wait \{1
		gameframe}
	bassist :obj_switchscript \{transition_playanim_spawned
		params = {
			anim = gh3_guit_satn_a_lose02
		}}
	if ($current_level = load_z_hell)
		change \{cameracuts_allownotescripts = false}
		change \{cameracuts_forcetime = 3.2}
		cameracuts_setarrayprefix \{prefix = 'cameras_boss_finish'
			length = 0
			changenow}
	endif
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

script guitarevent_starsequencebonus 
	if ($is_attract_mode = 1)
		return
	endif
	change structurename = <player_status> sp_phrases_hit = ($<player_status>.sp_phrases_hit + 1)
	soundevent event = star_power_awarded_sfx
	formattext checksumname = container_id 'gem_container%p' p = ($<player_status>.text) addtostringlookup = true
	getarraysize $gem_colors
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
	wait $star_power_bolt_time seconds
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
		wait 1 gameframe
	endif
	gem_count = (<gem_count> + 1)
	repeat <array_size>
endscript

script guitarevent_starmissnote 
endscript

script guitarevent_multiplier4xon 
	if ($disable_band = 0)
		objid = (<player_status>.band_member)
		safegetuniquecompositeobjectid preferredid = fingersparks01 objid = <objid>
		createparticlesystem_fast name = <uniqueid> objid = <objid> bone = bone_hand_middle_mid_l params_script = $gp_4x_fingersparks01
		manglechecksums a = <uniqueid> b = <objid>
		change structurename = <player_status> fourx_fingerfxid01 = <mangled_id>
		safegetuniquecompositeobjectid preferredid = fingerflames01 objid = <objid>
		createparticlesystem_fast name = <uniqueid> objid = <objid> bone = bone_hand_middle_mid_l params_script = $gp_4x_fingerflames01
		manglechecksums a = <uniqueid> b = <objid>
		change structurename = <player_status> fourx_fingerfxid02 = <mangled_id>
		safegetuniquecompositeobjectid preferredid = fingersparks02 objid = <objid>
		createparticlesystem_fast name = <uniqueid> objid = <objid> bone = bone_hand_middle_mid_r params_script = {$gp_4x_fingersparks01 emit_target = (0.0, -1.0, 0.0)}
		manglechecksums a = <uniqueid> b = <objid>
		change structurename = <player_status> fourx_fingerfxid03 = <mangled_id>
		safegetuniquecompositeobjectid preferredid = fingerflames02 objid = <objid>
		createparticlesystem_fast name = <uniqueid> objid = <objid> bone = bone_hand_middle_mid_r params_script = $gp_4x_fingerflames01
		manglechecksums a = <uniqueid> b = <objid>
		change structurename = <player_status> fourx_fingerfxid04 = <mangled_id>
	endif
endscript

script guitarevent_multiplier3xon 
endscript

script guitarevent_multiplier2xon 
endscript

script kill_4x_fx 
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

script guitarevent_multiplier4xoff 
	soundevent \{event = ui_sfx_lose_multiplier_4x}
	soundevent \{event = lose_multiplier_crowd}
	kill_4x_fx <...>
endscript

script guitarevent_multiplier3xoff 
	soundevent \{event = ui_sfx_lose_multiplier_3x}
endscript

script guitarevent_multiplier2xoff 
	soundevent \{event = ui_sfx_lose_multiplier_2x}
endscript

script guitarevent_killsong 
	stopsoundevent crowd_low_to_med_sfx
	stopsoundevent crowd_good_to_med_sfx
	stopsoundevent crowd_med_to_bad_sfx
	stopsoundevent crowd_med_to_good_sfx
	stopsoundevent crowd_oneshots_cheer_close
	stopsoundevent crowd_fast_surge_cheer
	stopsoundevent crowd_oneshots_boo_close
	stopsoundevent medium_crowd_bad_to_med_sfx
	stopsoundevent medium_crowd_med_to_bad_sfx
	stopsoundevent medium_crowd_swell
	stopsoundevent medium_crowd_applause
	stopsoundevent small_crowd_bad_to_med
	stopsoundevent small_crowd_med_to_bad_sfx
	stopsoundevent small_crowd_med_to_good
	stopsoundevent small_crowd_good_to_med_sfx
	stopsoundevent small_crowd_oneshots_boo
	stopsoundevent small_crowd_oneshots_cheer
	stopsoundevent hell_crowd_good_to_med
	stopsoundevent hell_crowd_good_to_med_sfx
	stopsoundevent lose_multiplier_crowd
	if NOT ($current_transition = preencore)
		bg_crowd_front_end_silence immediate = 1
	endif
	formattext checksumname = player_status 'player1_status'
	kill_4x_fx player_status = <player_status>
	formattext checksumname = player_status 'player2_status'
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
		reverb_params = echo_crowd_buss_default
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

script first_gem_fx 
	extendcrc <gem_id> '_particle' out = fx_id
	if gotparam is_star
		<pos> = (255.0, 170.0)
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
	wait 0.8 seconds
	destroy2dparticlesystem id = <fx_id> kill_when_empty
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
