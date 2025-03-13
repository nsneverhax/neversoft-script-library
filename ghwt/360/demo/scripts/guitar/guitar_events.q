guitar_events = [
	{
		type = call
		event = missed_note
		scr = guitarevent_missednote
	}
	{
		type = call
		event = unnecessary_note
		scr = guitarevent_unnecessarynote
	}
	{
		type = call
		event = hit_notes
		scr = guitarevent_hitnotes
	}
	{
		type = call
		event = hit_note
		scr = guitarevent_hitnote
	}
	{
		type = call
		event = drumfill_hit
		scr = guitarevent_drumfillhit
	}
	{
		type = call
		event = hit_mine
		scr = guitarevent_hitmine
	}
	{
		type = call
		event = star_power_on
		scr = guitarevent_starpoweron
	}
	{
		type = call
		event = star_power_off
		scr = guitarevent_starpoweroff
	}
	{
		type = spawn
		event = song_failed
		scr = guitarevent_songfailed
	}
	{
		type = spawn
		event = song_won
		scr = guitarevent_songwon
	}
	{
		type = spawn
		event = star_sequence_bonus
		scr = guitarevent_starsequencebonus
	}
	{
		type = call
		event = whammy_on
		scr = guitarevent_whammyon
	}
	{
		type = call
		event = whammy_off
		scr = guitarevent_whammyoff
	}
	{
		type = call
		event = ext_whammy_off
		scr = guitarevent_whammyoff
	}
	{
		type = spawn
		event = note_window_open
		scr = guitarevent_note_window_open
	}
	{
		type = spawn
		event = note_window_close
		scr = guitarevent_note_window_close
	}
	{
		type = call
		event = first_gem
		scr = guitarevent_createfirstgem
	}
	{
		type = call
		event = firstnote_window_open
		scr = guitarevent_firstnote_window_open
	}
	{
		type = spawn
		event = explode_gem
		scr = guitarevent_explodegem
	}
]

script create_guitar_events 
	printf qs(0x0f26afab) a = <player_text>
	getarraysize \{$guitar_events}
	array_entry = 0
	begin
	printf \{qs(0x916cce78)}
	event = ($guitar_events [<array_entry>].event)
	type = ($guitar_events [<array_entry>].type)
	extendcrc <event> <player_text> out = event
	if (<type> = spawn)
		seteventhandler response = call_script event = <event> scr = event_spawner params = {event_spawned = <array_entry>}
	else
		scr = ($guitar_events [<array_entry>].scr)
		seteventhandler response = call_script event = <event> scr = <scr>
	endif
	array_entry = (<array_entry> + 1)
	repeat <array_size>
	block
endscript

script event_spawner 
	spawnscriptnow ($guitar_events [<event_spawned>].scr) params = {<...>} id = song_event_scripts
endscript

script event_iterator 
	printf qs(0x5fa77966) d = <time_offset> e = <event_string>
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
		spawnscriptnow <scriptname> params = {time = <time> event_time = (($<song> [<array_entry>]).time) ($<song> [<array_entry>].params)} id = song_event_scripts
	elseif symboliscfunc <scriptname>
		<scriptname> {time = <time> event_time = (($<song> [<array_entry>]).time) ($<song> [<array_entry>].params)}
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_size>
endscript

script guitarevent_explodegem \{mine = 0}
	formattext checksumname = container_id 'gem_container%p' p = ($<player_status>.text) addtostringlookup = true
	formattext checksumname = fx2_id '%x%y' x = <x> y = <y>
	pos = ((<x> * (1.0, 0.0)) + (<y> * (0.0, 1.0)))
	destroy2dparticlesystem id = <fx2_id>
	if NOT objectexists id = <fx2_id>
		create2dparticlesystem {
			id = <fx2_id>
			pos = <pos>
			z_priority = 8.0
			material = mat_particle_smoke01
			parent = <container_id>
			start_color = [66 66 66 255]
			end_color = [123 123 128 0]
			start_scale = (0.1, 0.1)
			end_scale = (1.0, 1.0)
			start_angle_spread = 0.0
			min_rotation = 90.0
			max_rotation = 90.0
			emit_start_radius = 0.0
			emit_radius = 0.0
			emit_rate = 0.05
			emit_dir = 0.0
			emit_spread = 180.0
			velocity = 1.0
			friction = (0.0, 30.0)
			time = 0.25
		}
	endif
	formattext checksumname = fx3_id '%x%y' x = <x> y = <y>
	destroy2dparticlesystem id = <fx3_id>
	if NOT objectexists id = <fx3_id>
		create2dparticlesystem {
			id = <fx3_id>
			pos = <pos>
			z_priority = 10.0
			material = sys_particle_spark01_sys_particle_spark01
			parent = <container_id>
			start_color = [255 128 0 255]
			end_color = [255 255 255 0]
			start_scale = (5.0, 5.0)
			end_scale = (2.0, 2.0)
			start_angle_spread = 12.0
			min_rotation = 90.0
			max_rotation = 90.0
			emit_start_radius = 0.0
			emit_radius = 0.0
			emit_rate = 0.002
			emit_dir = 0.0
			emit_spread = 180.0
			velocity = 4.0
			friction = (0.0, 0.0)
			time = 0.25
		}
	endif
	wait \{3
		frames}
	destroy2dparticlesystem id = <fx2_id> kill_when_empty
	destroy2dparticlesystem id = <fx3_id> kill_when_empty
endscript

script guitarevent_missednote \{extended_miss = 0}
	if (<bum_note> = 1)
		guitar_wrong_note_sound_logic <...>
	endif
	if ($is_network_game && ($<player_status>.is_local_client = 0))
		if (<silent_miss> = 1)
			spawnscriptnow highway_pulse_black params = {player_text = ($<player_status>.text) player_status = <player_status>}
		endif
	else
		if NOT (($<player_status>.part) = drum)
			playergetvolume player_status = <player_status>
			if NOT (<volume> = 0)
				if (<silent_miss> = 1)
					spawnscriptnow highway_pulse_black params = {player_text = ($<player_status>.text) player_status = <player_status>}
				else
					if NOT (<extended_miss> = 1)
						playersetvolume player_status = <player_status> volume = 0
						updateguitarvolume
						jam_update_volume volume = 0 player = ($<player_status>.player)
					endif
				endif
			endif
		endif
	endif
	if ($always_strum = false)
		if ($disable_band = 0)
			if compositeobjectexists name = ($<player_status>.band_member)
				if ($<player_status>.part = guitar || $<player_status>.part = bass)
					bandmanager_missednote name = ($<player_status>.band_member)
				endif
			endif
		endif
	endif
	inputarraygetelement name = <song> index = <array_entry>
	if ($show_play_log = 1)
		output_log_text qs(0xbfe03a95) t = (<gem_array> [0]) color = orange
	endif
endscript

script highway_pulse_black 
	<half_time> = ($highway_pulse_time / 2.0)
	formattext checksumname = highway 'Highway_2D%p' p = <player_text> addtostringlookup = true
	legacydoscreenelementmorph id = <highway> rgba = ($highway_pulse) time = <half_time>
	wait <half_time> seconds
	if ($<player_status>.star_power_used = 1)
		legacydoscreenelementmorph id = <highway> rgba = ($highway_starpower) time = <half_time>
	else
		legacydoscreenelementmorph id = <highway> rgba = ($highway_normal) time = <half_time>
	endif
endscript

script guitarevent_unnecessarynote 
	guitar_wrong_note_sound_logic <...>
	if NOT ($is_network_game && ($<player_status>.is_local_client = 0))
		playersetvolume player_status = <player_status> volume = 0
		updateguitarvolume
		jam_update_volume volume = 0 player = ($<player_status>.player)
	endif
	if ($always_strum = false)
		if ($disable_band = 0)
			if compositeobjectexists name = ($<player_status>.band_member)
				if ($<player_status>.part = guitar || $<player_status>.part = bass)
					launchevent type = anim_missednote target = ($<player_status>.band_member)
				endif
			endif
		endif
	endif
	if ($show_play_log = 1)
		if (<array_entry> > 0)
			<songtime> = (<songtime> - ($check_time_early * 1000.0))
			inputarraygetelement name = <song> index = <array_entry>
			next_note = (<gem_array> [0])
			inputarraygetelement name = <song> index = (<array_entry> -1)
			prev_note = (<gem_array> [0])
			next_time = (<next_note> - <songtime>)
			prev_time = (<songtime> - <prev_note>)
			if (<prev_time> < ($check_time_late * 1000.0))
				<prev_time> = 1000000.0
			endif
			if (<next_time> < <prev_time>)
				<next_time> = (0 - <next_time>)
				output_log_text qs(0x9648a941) n = <next_time> t = <next_note> color = red
			else
				output_log_text qs(0x6ef444b5) n = <prev_time> t = <prev_note> color = darkred
			endif
		endif
	endif
endscript

script guitarevent_hitnotes 
	if ($debug_audible_hitnote = 1)
		soundevent \{event = gh_sfx_hitnotesoundevent}
	endif
	if ($show_play_log = 1)
		getglobaltags \{user_options}
		casttointeger \{lag_calibration}
		mod a = <lag_calibration> b = 1000
		<video_offset> = <mod>
		<audio_offset> = ((<lag_calibration> / 1000) - 1)
		<off_note> = (0 - (<off_note> - ($time_input_offset + <audio_offset> + <video_offset>)))
		casttointeger \{off_note}
		inputarraygetelement name = <song> index = <array_entry>
		note_time = (<gem_array> [0])
		if (<off_note> < 0)
			output_log_text qs(0xddc15e81) n = <off_note> t = <note_time> color = green
		else
			output_log_text qs(0x257db375) n = <off_note> t = <note_time> color = darkgreen
		endif
	endif
	if (<updatevolume> = true)
		updateguitarvolume
		jam_update_volume volume = 100 player = ($<player_status>.player)
	endif
endscript

script guitarevent_hitnote 
	spawnscriptnow guitarevent_hitnote_spawned params = {<...>}
endscript

script guitarevent_hitnote_spawned 
	if gotparam \{kick}
		guitarevent_kick_drum_hit_note player = <player> player_text = <player_text>
	elseif gotparam \{open_note}
		guitarevent_hit_open_note player = <player> player_text = <player_text>
	elseif gotparam \{easy_rhythm_note}
		guitarevent_hit_easy_rhythm_note player_text = <player_text>
	else
		if ($game_mode = p2_battle || $boss_battle = 1)
			change structurename = <player_status> last_hit_note = <color>
		endif
		wait \{1
			gameframe}
		if gotparam \{drum_accent}
			spawnscriptnow drum_accent_hit_particle_fx params = {fx_id = <fx_id> pos = <pos> player_text = <player_text> player = <player>}
		endif
		scale = (2.0, 2.0)
		notefx <...> star = ($<player_status>.star_power_used) name = <fx_id>
		wait \{6
			gameframes}
		destroy2dparticlesystem id = <particle_id> kill_when_empty
		wait \{10
			gameframes}
		if screenelementexists id = <fx_id>
			destroyscreenelement id = <fx_id>
		endif
	endif
	achievements_checkfor50noteposse
	achievements_checkforsupergroupunite
endscript

script guitarevent_drumfillhit 
	if gotparam \{kick}
		guitarevent_hitnote <...>
	endif
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

script guitarevent_hitmine 
	spawnscriptnow guitarevent_hitmine_spawned params = {<...>}
endscript

script guitarevent_hitmine_spawned 
	if ($<player_status>.highway_position = left)
		soundevent \{event = gh_sfx_battlemode_mine_explode_p1}
	else
		soundevent \{event = gh_sfx_battlemode_mine_explode_p2}
	endif
	spawnscriptnow hammer_highway params = {other_player_text = <player_text>}
	formattext checksumname = container_id 'gem_container%p' p = <player_text> addtostringlookup = true
	<particle_pos> = (<pos> - (0.0, 20.0))
	extendcrc <mine_fx_id> '_hit_particle' out = particle_id
	destroy2dparticlesystem id = <particle_id>
	create2dparticlesystem {
		id = <particle_id>
		pos = <particle_pos>
		z_priority = 11.0
		material = sys_particle_spark01_sys_particle_spark01
		parent = <container_id>
		start_color = [255 128 0 255]
		end_color = [255 255 255 0]
		start_scale = (1.0, 1.0)
		end_scale = (1.0, 1.0)
		start_angle_spread = 12.0
		min_rotation = 90.0
		max_rotation = -90.0
		emit_start_radius = 0.0
		emit_radius = 0.0
		emit_rate = 0.002
		emit_dir = 0.0
		emit_spread = 180.0
		velocity = 22.0
		friction = (0.0, 44.0)
		time = 0.5
	}
	wait \{1
		frame}
	extendcrc <mine_fx_id> '_hit_particle1' out = particle1_id
	destroy2dparticlesystem id = <particle1_id>
	create2dparticlesystem {
		id = <particle1_id>
		pos = <particle_pos>
		z_priority = 10.0
		material = sys_particle_spark01_sys_particle_spark01
		parent = <container_id>
		start_color = [255 128 0 255]
		end_color = [255 255 255 0]
		start_scale = (5.0, 5.0)
		end_scale = (2.0, 2.0)
		start_angle_spread = 12.0
		min_rotation = 90.0
		max_rotation = 90.0
		emit_start_radius = 0.0
		emit_radius = 0.0
		emit_rate = 0.002
		emit_dir = 0.0
		emit_spread = 180.0
		velocity = 4.0
		friction = (0.0, 0.0)
		time = 0.5
	}
	wait \{1
		frame}
	extendcrc <mine_fx_id> '_hit_particle2' out = particle2_id
	destroy2dparticlesystem id = <particle2_id>
	create2dparticlesystem {
		id = <particle2_id>
		pos = <particle_pos>
		z_priority = 8.0
		material = mat_particle_smoke01
		parent = <container_id>
		start_color = [66 66 66 255]
		end_color = [123 123 128 0]
		start_scale = (0.1, 0.1)
		end_scale = (2.0, 2.0)
		start_angle_spread = 0.0
		min_rotation = 90.0
		max_rotation = 90.0
		emit_start_radius = 0.0
		emit_radius = 0.0
		emit_rate = 0.05
		emit_dir = 0.0
		emit_spread = 180.0
		velocity = 1.0
		friction = (0.0, 30.0)
		time = 0.5
	}
	<crowd_decrease_count> = $battle_mine_health_decrease_count
	<wait_time> = 0.15
	<wait_time_slice> = (<wait_time> / <crowd_decrease_count>)
	if ($<player_status>.current_num_powerups > 0)
		remove_battle_card player_status = <player_status>
		update_battlecards_remove player_status = <player_status>
	endif
	casttointeger \{crowd_decrease_count}
	begin
	crowddecrease player_status = <player_status>
	wait <wait_time_slice> seconds
	repeat <crowd_decrease_count>
	destroy2dparticlesystem id = <particle_id> kill_when_empty
	destroy2dparticlesystem id = <particle1_id> kill_when_empty
	destroy2dparticlesystem id = <particle2_id> kill_when_empty
endscript

script killminefx 
	destroy2dparticlesystem \{id = all}
	killspawnedscript \{name = guitarevent_hitmine_spawned}
	get_highway_pos_and_scale \{num_non_vocals_players = 2
		non_vocalist_player = 1
		player = 1}
	<container_pos> = (<pos> + (0.0, 720.0))
	legacydoscreenelementmorph id = gem_containerp1 pos = <container_pos>
	get_highway_pos_and_scale \{num_non_vocals_players = 2
		non_vocalist_player = 2
		player = 2}
	<container_pos> = (<pos> + (0.0, 720.0))
	legacydoscreenelementmorph id = gem_containerp2 pos = <container_pos>
endscript

script drum_accent_hit_particle_fx 
	formattext checksumname = container_id 'gem_container%p' p = <player_text> addtostringlookup = true
	extendcrc <fx_id> '_hit_particle_accent' out = particle_id
	create2dparticlesystem {
		id = <particle_id>
		pos = <pos>
		z_priority = 5
		material = sys_particle_drumhit1_sys_particle_drumhit1
		parent = <container_id>
		start_color = [255 255 255 255]
		end_color = [255 255 255 0]
		start_scale = (1.0, 1.0)
		end_scale = (12.0, 24.0)
		start_angle_spread = 0.0
		min_rotation = 0
		max_rotation = 0
		emit_start_radius = 2.0
		emit_radius = 0.2
		emit_rate = 0.120000005
		emit_dir = 0.0
		emit_spread = 0.0
		velocity = 0.0
		friction = (0.0, 0.0)
		time = 0.2
	}
	wait \{0.2
		seconds}
	destroy2dparticlesystem id = <particle_id> <kill_when_empty>
endscript

script guitarevent_starpoweron 
	killspawnedscript \{name = highway_pulse_black}
	if ($drum_solo_songtime_paused = 0)
		gh_star_power_verb_on player = <player>
	endif
	formattext checksumname = scriptid '%p_StarPower_StageFX' p = <player_text>
	spawnscriptlater do_starpower_stagefx id = <scriptid> params = {<...>}
	starpoweron player = <player>
	if ($current_num_players = 4)
		if (all_players_using_starpower)
			spawnscriptnow \{play_group_star_power_animation}
			change \{achievements_121_jigowatts_flag = 1}
		endif
	endif
endscript

script guitarevent_starpoweroff 
	killspawnedscript \{name = highway_pulse_black}
	if issingleplayergame
		soundevent \{event = star_power_release_center_gh4}
		soundevent \{event = star_power_release_front_gh4}
	else
		spawnscriptnow star_power_release_sfx_multiplayer params = {player = ($<player_status>.player)}
	endif
	gh_star_power_verb_off player = ($<player_status>.player)
	spawnscriptnow rock_meter_star_power_off params = {player_text = <player_text>}
	spawnscriptlater kill_starpower_stagefx params = {<...>}
	formattext checksumname = cont 'starpower_container_left%p' p = <player_text> addtostringlookup = true
	if screenelementexists id = <cont>
		legacydoscreenelementmorph id = <cont> alpha = 0
	endif
	formattext checksumname = cont 'starpower_container_right%p' p = <player_text> addtostringlookup = true
	if screenelementexists id = <cont>
		legacydoscreenelementmorph id = <cont> alpha = 0
	endif
	formattext checksumname = highway 'Highway_2D%p' p = <player_text> addtostringlookup = true
	if screenelementexists id = <highway>
		setscreenelementprops id = <highway> rgba = ($highway_normal)
	endif
	spawnscriptnow \{kill_starpower_camera}
endscript

script guitarevent_prefretbar 
	spawnscriptnow \{gh_audible_metronome}
	waittime = 0.18
	wait <waittime> seconds
	if (($player1_status.star_power_used = 1) || ($player2_status.star_power_used = 1) || ($player3_status.star_power_used = 1) || ($player4_status.star_power_used = 1))
		if ($clap_fade = 1)
			printf \{channel = sfx
				qs(0x784a1ce5)}
			change \{clap_fade = 0}
			spawnscriptnow \{clap_fade_kill}
		endif
		if ($game_mode != tutorial)
			if (($star_clap_normal = 1) || ($star_clap_leftcenterright = 1))
				printf \{qs(0xfe00cc6d)}
				soundevent \{event = $current_crowd_clap_normal_soundevent}
			elseif ($star_clap_middle = 1)
				printf \{qs(0x3af3642a)}
				soundevent \{event = $current_crowd_clap_middle_soundevent}
			elseif ($star_clap_left = 1)
				printf \{qs(0x4ac89455)}
				soundevent \{event = $current_crowd_clap_left_soundevent}
			elseif ($star_clap_right = 1)
				printf \{qs(0x8bfb9430)}
				soundevent \{event = $current_crowd_clap_right_soundevent}
			elseif ($star_clap_right_middle = 1)
				printf \{qs(0xbc1479cf)}
				soundevent \{event = $current_crowd_clap_right_middle_soundevent}
			elseif ($star_clap_left_middle = 1)
				printf \{qs(0x492c71b5)}
				soundevent \{event = $current_crowd_clap_left_middle_soundevent}
			endif
		endif
	elseif ($clap_fade = 1)
		printf \{channel = sfx
			qs(0xe4391755)}
		if ($star_clap_normal = 1)
			printf \{qs(0xfe00cc6d)}
			soundevent \{event = $current_crowd_clap_normal_soundevent}
		elseif ($star_clap_middle = 1)
			printf \{qs(0x3af3642a)}
			soundevent \{event = $current_crowd_clap_middle_soundevent}
		elseif ($star_clap_left = 1)
			printf \{qs(0x4ac89455)}
			soundevent \{event = $current_crowd_clap_left_soundevent}
		elseif ($star_clap_right = 1)
			printf \{qs(0xc4a697e0)}
			soundevent \{event = $current_crowd_clap_right_soundevent}
		elseif ($star_clap_right_middle = 1)
			printf \{qs(0xbc1479cf)}
			soundevent \{event = $current_crowd_clap_right_middle_soundevent}
		elseif ($star_clap_left_middle = 1)
			printf \{qs(0x492c71b5)}
			soundevent \{event = $current_crowd_clap_left_middle_soundevent}
		endif
	else
		if ($crowdlistenerstateclapon1234 = 1)
			if ($star_clap_normal = 1)
				printf \{qs(0xfe00cc6d)}
				soundevent \{event = $current_crowd_clap_normal_soundevent}
			elseif ($star_clap_middle = 1)
				printf \{qs(0x3af3642a)}
				soundevent \{event = $current_crowd_clap_middle_soundevent}
			elseif ($star_clap_left = 1)
				printf \{qs(0x4ac89455)}
				soundevent \{event = $current_crowd_clap_left_soundevent}
			elseif ($star_clap_right = 1)
				printf \{qs(0xc4a697e0)}
				soundevent \{event = $current_crowd_clap_right_soundevent}
			elseif ($star_clap_right_middle = 1)
				printf \{qs(0xbc1479cf)}
				soundevent \{event = $current_crowd_clap_right_middle_soundevent}
			elseif ($star_clap_left_middle = 1)
				printf \{qs(0x492c71b5)}
				soundevent \{event = $current_crowd_clap_left_middle_soundevent}
			endif
		endif
	endif
	spawnscriptnow \{crowd_anticipation}
endscript

script gh_audible_metronome 
	if ($debug_audible_metronome = 1)
		wait ((0.25 + (($default_lag_settings.xenon.input_lag_ms) * 0.001)) - 0.008333) seconds
		soundevent \{event = gh_sfx_beatsoundevent}
	endif
endscript

script guitarevent_fretbar 
	guitarevent_fretbar_cfunc
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
	getheldpattern controller = ($<player_status>.controller) player = ($<player_status>.player) player_status = <player_status>
	if (<strum> = <hold_pattern>)
		playersetvolume player_status = <player_status> volume = 100
		updateguitarvolume
		jam_update_volume volume = 100 player = ($<player_status>.player)
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
		playersetvolume player_status = <player_status> volume = 100
		updateguitarvolume
		jam_update_volume volume = 100 player = ($<player_status>.player)
	endif
endscript

script guitarevent_note_window_open 
	if ($debug_audible_open = 1)
		value = (($check_time_early + (($default_lag_settings.xenon.input_lag_ms) * 0.001)) + 0.008333)
		printf channel = sfx qs(0x73307931) s = <value>
		wait (($check_time_early + (($default_lag_settings.xenon.input_lag_ms) * 0.001)) + 0.008333) seconds
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

script guitarevent_songfailed 
	if ($failed_song = 1)
		return
	endif
	change \{failed_song = 1}
	change \{achievements_songwonflag = 0}
	if ($game_mode = training || $game_mode = tutorial)
		return
	endif
	if ($is_network_game)
		online_fail_song
	elseif ($game_mode = p2_battle)
		guitarevent_songwon \{battle_win = 1}
	else
		killspawnedscript \{name = guitar_jam_playback_recording}
		killspawnedscript \{name = guitar_jam_drum_playback}
		killspawnedscript \{name = jam_input_whammy_spawned}
		jam_stop_all_samples
		jam_deinit_reverb
		killspawnedscript \{name = guitarevent_songwon_spawned}
		spawnscriptnow \{guitarevent_songfailed_spawned}
	endif
endscript

script guitarevent_songfailed_spawned 
	if ($is_attract_mode = 1)
		scriptassert \{'Song failure in attract mode, this is bad'}
		return
	endif
	if NOT ($boss_battle = 1)
		disable_highway_prepass
		disable_bg_viewport
	endif
	lightshow_songfailed
	if ($is_network_game)
		killspawnedscript \{name = dispatch_player_state}
		disable_pause
		if ($net_pause = 1)
			net_unpausegh
		endif
		mark_unsafe_for_shutdown
	endif
	getsongtimems
	change failed_song_time = <time>
	pausegame
	progression_songfailed
	if ($boss_battle = 1)
		disable_pause
		preload_movie = 'Player2_wins'
		killmovie \{textureslot = 1}
		preloadmovie {
			movie = <preload_movie>
			textureslot = 1
			texturepri = 70
			no_looping
			no_hold
			nowait
		}
		formattext textname = winner_text qs(0x237c4f68) s = ($current_boss.character_name)
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
		end_singleplayer_game
		xenon_singleplayer_session_begin_uninit
		spawnscriptnow \{xenon_singleplayer_session_complete_uninit
			params = {
				song_failed
			}}
	else
		if netsessionfunc \{obj = session
				func = has_active_session}
			netsessionfunc \{obj = session
				func = end_active_session}
		endif
	endif
	unpausegame
	if ($is_network_game)
		ui_event_wait_for_safe
		disable_pause
	endif
	soundevent \{event = crowd_fail_song_sfx}
	soundevent \{event = $current_crowd_transition_neutral_to_bad_l}
	soundevent \{event = $current_crowd_transition_neutral_to_bad_r}
	soundevent \{event = gh_sfx_you_lose_single_player}
	transition_play \{type = songlost}
	transition_wait
	change \{current_transition = none}
	disable_pause
	pausegame
	show_calibration = 0
	getglobaltags \{user_options
		param = has_calibrated}
	if (<has_calibrated> = 0)
		<show_calibration> = 1
	endif
	if ($special_event_stage != 0)
		<show_calibration> = 0
	endif
	gamemode_gettype
	if ($is_network_game = 0)
		ui_event_wait_for_safe
		wait \{1
			gameframe}
		if ui_event_exists_in_stack \{name = 'pausemenu'
				above = 'gameplay'}
			ui_event_block \{event = menu_back
				data = {
					state = uistate_gameplay
				}}
		elseif ui_event_exists_in_stack \{name = 'song_unpause'
				above = 'gameplay'}
			ui_event_block \{event = menu_back
				data = {
					state = uistate_gameplay
				}}
		endif
		if (<show_calibration> = 1)
			setglobaltags \{user_options
				params = {
					has_calibrated = 1
				}}
			body = qs(0x24b45119)
			spawnscriptnow {
				ui_event {
					params = {
						event = menu_change
						data = {
							state = uistate_options_calibrate_lag_warning
							body = <body>
							cancel_script = menu_replace_to_fail_song
							yes_func_params = {go_back_script = menu_replace_to_fail_song}
						}
					}
				}
			}
		else
			spawnscriptnow \{ui_event
				params = {
					event = menu_change
					data = {
						state = uistate_fail_song
					}
				}}
		endif
	elseif (<type> = career)
		if NOT scriptisrunning \{handle_signin_changed}
			ui_event_get_top
			if (<base_name> = 'controller_disconnect' || <base_name> = 'pausemenu_quit_warning')
				spawnscriptnow \{ui_event
					params = {
						event = menu_replace
						data = {
							state = uistate_fail_song
						}
					}}
			else
				spawnscriptnow \{ui_event
					params = {
						event = menu_change
						data = {
							state = uistate_fail_song
						}
					}}
			endif
		endif
	else
		if NOT scriptisrunning \{handle_signin_changed}
			ui_event_get_top
			if (<base_name> = 'controller_disconnect' || <base_name> = 'pausemenu_quit_warning')
				spawnscriptnow \{ui_event
					params = {
						event = menu_replace
						data = {
							state = uistate_online_post_game_lobby
						}
					}}
			else
				spawnscriptnow \{ui_event
					params = {
						event = menu_change
						data = {
							state = uistate_online_post_game_lobby
						}
					}}
			endif
		endif
	endif
	if ($current_num_players = 1)
		soundevent \{event = crowd_fail_song_sfx}
		soundevent \{event = $current_crowd_transition_neutral_to_bad_l}
		soundevent \{event = $current_crowd_transition_neutral_to_bad_r}
		bg_crowd_front_end_silence \{immediate = 1}
	else
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
			textoutput \{text = qs(0x3f02a90c)}
			formattext textname = text qs(0xfccb1331) s = ($player1_status.score) dontassertforchecksums
			textoutput text = <text>
			formattext textname = text qs(0x26c27108) n = ($player1_status.notes_hit) t = ($player1_status.total_notes) dontassertforchecksums
			textoutput text = <text>
			formattext textname = text qs(0xd67d4308) r = ($player1_status.best_run) dontassertforchecksums
			textoutput text = <text>
			formattext textname = text qs(0x6bb1c560) m = ($player1_status.max_notes) dontassertforchecksums
			textoutput text = <text>
			formattext textname = text qs(0x26a9ba16) b = ($player1_status.base_score) dontassertforchecksums
			textoutput text = <text>
			if (($player1_status.base_score) = 0)
				formattext \{textname = text
					qs(0x30357c57)}
			else
				formattext textname = text qs(0xbcc2e990) s = (($player1_status.score) / ($player1_status.base_score)) dontassertforchecksums
			endif
			textoutput text = <text>
			if (($player1_status.total_notes) = 0)
				formattext \{textname = text
					qs(0xc8e34ec5)}
			else
				formattext textname = text qs(0x2b87036c) s = ((($player1_status.notes_hit) / ($player1_status.total_notes)) * 100.0) dontassertforchecksums
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
			change structurename = player1_status save_num_powerups = ($player1_status.current_num_powerups)
			change structurename = player2_status save_num_powerups = ($player2_status.current_num_powerups)
			p1_health = ($player1_status.current_health)
			p2_health = ($player2_status.current_health)
			change structurename = player1_status save_health = <p1_health>
			change structurename = player2_status save_health = <p2_health>
			battlemode_killspawnedscripts
			if screenelementexists \{id = battlemode_container}
				destroyscreenelement \{id = battlemode_container}
			endif
			change \{battle_do_or_die = 1}
			change battle_do_or_die_speed_scale = ($battle_do_or_die_speed_scale + $battle_do_or_die_speed_scale_increase)
			if ($battle_do_or_die_speed_scale < $hyperspeed_fastest)
				change \{battle_do_or_die_speed_scale = $hyperspeed_fastest}
			endif
			change battle_do_or_die_attack_scale = ($battle_do_or_die_attack_scale + $battle_do_or_die_attack_scale_increase)
			if ($battle_do_or_die_attack_scale > $battle_do_or_die_attack_scale_max)
				change \{battle_do_or_die_attack_scale = $battle_do_or_die_attack_scale_max}
			endif
		else
			battlemode_killspawnedscripts
			change \{battle_do_or_die = 0}
			change \{battle_do_or_die_speed_scale = 1.0}
			change \{battle_do_or_die_attack_scale = 1.0}
		endif
	endif
	killspawnedscript \{name = guitar_jam_playback_recording}
	killspawnedscript \{name = guitar_jam_drum_playback}
	killspawnedscript \{name = jam_input_whammy_spawned}
	jam_stop_all_samples
	jam_deinit_reverb
	killspawnedscript \{name = guitarevent_songfailed_spawned}
	spawnscriptnow \{guitarevent_songwon_spawned}
	if NOT ($is_attract_mode = 1)
		change \{achievements_songwonflag = 1}
		achievements_update
		change \{achievements_songwonflag = 0}
	endif
endscript

script guitarevent_songwon_spawned 
	if ($is_attract_mode = 1)
		ui_event \{event = menu_back}
		return
	endif
	if ($autotest_on = 1 && $autotest_turbo_mode = 1)
		setslomo \{10.0}
	endif
	if NOT ($game_mode = p2_battle)
	endif
	change track_last_song = ($current_song)
	change \{calibrate_lag_failed_num = 0}
	gamemode_gettype
	<end_session> = 0
	if (<type> = career)
		if progression_check_for_gig_end
			<end_session> = 1
		endif
	elseif (<type> = quickplay)
		if quickplay_end_of_gig_list
			<end_session> = 1
		endif
	endif
	if ($is_network_game)
		mark_unsafe_for_shutdown
		if ($shutdown_game_for_signin_change_flag = 1)
			return
		endif
		if ($net_pause = 1)
			net_unpausegh
		endif
		if ($player2_present)
			sendnetmessage {
				type = net_win_song
				note_streak = ($player1_status.best_run)
				notes_hit = ($player1_status.notes_hit)
				total_notes = ($player1_status.total_notes)
			}
		endif
	endif
	if ($game_mode = training)
		if ($special_event_stage = 0)
			generic_event_choose \{state = uistate_song_breakdown
				data = {
					for_practice = 1
				}}
		endif
		return
	elseif ($game_mode = tutorial)
		return
	endif
	progression_endcredits_done
	pausegame
	disable_pause
	if ($battle_do_or_die = 0)
		if ($game_mode = p1_career || $game_mode = p2_career || $game_mode = p2_coop || $game_mode = p1_quickplay || $game_mode = p2_quickplay || $game_mode = p3_career || $game_mode = p4_career || $game_mode = p3_quickplay || $game_mode = p4_quickplay)
			spawnscriptnow \{cheer_before_explosion}
		endif
	endif
	printf \{channel = sfx
		qs(0x86224445)
		s = $current_crowd_looping_bg_area_good}
	skate8_sfx_backgrounds_new_area \{bg_sfx_area = $current_crowd_looping_bg_area_good}
	crowd_surge_and_sustain_at_end_of_song
	spawnscriptnow \{you_rock_waiting_crowd_sfx}
	tie = false
	if ($battle_do_or_die = 1)
		soundevent \{event = do_or_die_sfx}
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
			if ($is_network_game)
				if (<p2_health> > <p1_health>)
					name = ($gamertag_1)
				else
					name = ($gamertag_0)
				endif
				setplayerinfo 1 save_health = <p1_health>
				setplayerinfo 2 save_health = <p2_health>
				formattext textname = winner_text <name>
				<text_pos> = (640.0, 240.0)
			else
				formattext textname = winner_text qs(0xe3029fec) s = <winner>
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
				if ($is_network_game)
					if (<p2_score> > <p1_score>)
						name = ($gamertag_1)
					else
						name = ($gamertag_0)
					endif
					formattext textname = winner_text <name>
					<text_pos> = (640.0, 240.0)
				else
					formattext textname = winner_text qs(0xe3029fec) s = <winner>
				endif
				winner_space_between = (50.0, 0.0)
				winner_scale = 1.5
			endif
		else
			if ($is_network_game = 1)
				opponent_score = ($band2_status.score)
				our_score = ($band1_status.score)
				if (<opponent_score> > <our_score>)
					winner_text = qs(0x2e820c65)
					winner_space_between = (40.0, 0.0)
					fit_dims = (350.0, 0.0)
					winner_scale = 1.0
				else
					winner_text = qs(0x6f6d143d)
					winner_space_between = (40.0, 0.0)
					fit_dims = (350.0, 0.0)
					winner_scale = 1.0
				endif
			else
				winner_text = qs(0x6f6d143d)
				winner_space_between = (40.0, 0.0)
				fit_dims = (350.0, 0.0)
				winner_scale = 1.0
			endif
		endif
	endif
	spawnscriptnow \{waitandkillhighway}
	killspawnedscript \{name = jiggle_text_array_elements}
	spawnscriptnow \{wait_and_play_you_rock_movie}
	create_handsofgod text = <winner_text>
	soundevent \{event = you_rock_end_sfx}
	text_pos = (640.0, 360.0)
	rock_legend = 0
	fit_dims = (350.0, 0.0)
	if ($is_network_game = 1)
		if NOT gamemode_iscooperative
			if (<tie> = false && $battle_do_or_die = 0)
				gamemode_getnumplayers
				if (<num_players> > 2)
					opponent_score = ($band2_status.score)
					our_score = ($band1_status.score)
					if (<opponent_score> > <our_score>)
						<yourock_text_2> = qs(0x655492b1)
						spawnscriptnow create_exploding_text params = {parent = 'you_rock_2_physics' text = <yourock_text_2> placement = bottom}
					endif
				else
					<yourock_text_2> = qs(0xbdc4e0ae)
					spawnscriptnow create_exploding_text params = {parent = 'you_rock_2_physics' text = <yourock_text_2> placement = bottom}
				endif
			endif
		endif
	endif
	change \{old_song = none}
	if ($battle_do_or_die = 0)
		progression_songwon
		if ($current_transition = preencore)
			end_song
			unpausegame
			transition_play \{type = preencore}
			transition_wait
			change \{current_transition = none}
			pausegame
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
			change \{net_ready_to_start = 0}
			spawnscriptnow \{start_boss}
			generic_event_back \{nosound
				state = uistate_gameplay}
			return
		else
			unpausegame
			if ($end_credits = 1 && $current_level = load_z_newyork)
				transition_play \{type = finalbandoutro}
			else
				transition_play \{type = songwon}
			endif
			transition_wait
			change \{current_transition = none}
			pausegame
		endif
	else
		unpausegame
		transition_play \{type = songwon}
		killspawnedscript \{name = do_or_die_helper_text}
		if screenelementexists \{id = do_or_die_helper_container}
			destroyscreenelement \{id = do_or_die_helper_container}
		endif
		spawnscriptnow \{do_or_die_helper_text
			params = {
				parent_id = yourock_text
			}}
		wait \{0.1
			seconds}
		spawnscriptnow \{waitandkillhighway}
		wait \{6
			seconds}
		change \{current_transition = none}
		pausegame
	endif
	if ($battle_do_or_die = 1)
		printf \{qs(0x338c6d2b)}
		if ($is_network_game)
			if NOT (scriptisrunning sysnotify_handle_connection_loss)
				generic_event_choose \{state = uistate_play_song}
			endif
		else
			spawnscriptnow \{fail_song_menu_select_retry_song
				params = {
					do_or_die = 1
				}}
		endif
		killspawnedscript \{name = create_exploding_text}
		destroy_exploding_text \{parent = 'you_rock_physics'}
	elseif ($end_credits = 1 && $current_song = $final_credits_song)
		killspawnedscript \{name = create_exploding_text}
		destroy_exploding_text \{parent = 'you_rock_physics'}
		destroy_exploding_text \{parent = 'you_rock_2_physics'}
		change \{end_credits = 0}
		career_song_ended_select_quit \{for_credits_venue = 1}
		get_progression_globals ($current_progression_flag)
		playmovieandwait movie = ($<tier_global>.end_movie)
		ui_memcard_autosave \{event = menu_back
			state = uistate_gig_posters
			data = {
				all_active_players = true
			}}
	else
		killspawnedscript \{name = create_exploding_text}
		destroy_all_exploding_text
		if ($autotest_on = 1)
			ui_event \{event = menu_change
				data = {
					state = uistate_autotest_next_test
				}}
		endif
		if NOT gotparam \{encore_transition}
			if ($progression_beat_game_last_song = 1)
				ui_event \{event = menu_change
					data = {
						state = uistate_beat_game
					}}
			else
				loading_transition = 0
				gamemode_gettype
				if (<type> = career)
					stats_song_checksum = ($current_song)
					if progression_set_new_song_in_gig_list
						loading_transition = 1
					endif
				elseif (<type> = quickplay)
					stats_song_checksum = ($current_song)
					if quickplay_set_new_song_in_gig_list
						loading_transition = 1
					endif
				endif
				if (<loading_transition> = 1)
					change \{gameplay_loading_transition = 1}
					change \{gameplay_restart_song = 1}
					change \{net_ready_to_start = 0}
					generic_event_back \{nosound
						state = uistate_gameplay}
				else
					if ($is_network_game = 1 && <type> != career)
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
	soundevent \{event = $current_crowd_swell_short_soundevent_l}
	soundevent \{event = $current_crowd_swell_short_soundevent_r}
	if ($is_network_game)
		if (gotparam loading_transition)
			if (<loading_transition> = 0)
				mark_safe_for_shutdown
			endif
		else
			mark_safe_for_shutdown
		endif
	endif
endscript

script songwon_writeleaderboardstats 
	requireparams \{[
			song_checksum
			end_session
		]
		all}
	printf \{qs(0x68e97bc9)}
	printstruct <...>
	if ($is_network_game = 1)
		if achievements_ischeatingautokick
			autokick_cheating = 1
		else
			autokick_cheating = 0
		endif
		if NOT ($cheat_alwaysslide = 1 || (<autokick_cheating> = 1))
			if ($game_mode = p2_career || $game_mode = p3_career || $game_mode = p4_career)
				if (<end_credits> = 1)
					netsessionfunc \{obj = session
						func = end_active_session}
				else
					net_write_single_player_stats song_checksum = <song_checksum> end_session = <end_session>
				endif
			else
				online_song_end_write_stats song_checksum = <song_checksum>
			endif
		else
			netsessionfunc \{obj = session
				func = end_active_session}
		endif
	else
		if ($game_mode = p2_battle || $is_attract_mode = 1 || $boss_battle = 1 || <end_credits> = 1)
			end_singleplayer_game
			if ($game_mode = p2_battle)
				spawnscriptnow \{xenon_singleplayer_session_complete_uninit
					params = {
						song_failed
					}}
			else
				spawnscriptnow \{xenon_singleplayer_session_complete_uninit}
			endif
		else
			if (<song_checksum> != jamsession)
				net_write_single_player_stats song_checksum = <song_checksum> end_session = <end_session>
			elseif (<song_checksum> = jamsession && <end_session> = 1)
				end_singleplayer_game
			endif
		endif
	endif
	gamemode_gettype
	if (<type> = career)
		if ($is_network_game = 1)
			if ishost
				agora_update
			endif
		else
			agora_update
		endif
	endif
	if ($is_network_game = 1)
		if ishost
			agora_write_stats song_checksum = <song_checksum>
		endif
	elseif NOT ($boss_battle = 1)
		if NOT ($devil_finish)
			agora_write_stats song_checksum = <song_checksum>
		endif
	endif
endscript

script kill_you_rock_movie 
	killmovie \{textureslot = 1}
endscript

script do_or_die_helper_text 
	createscreenelement \{type = containerelement
		id = do_or_die_helper_container
		parent = root_window
		pos = (0.0, 0.0)}
	formattext \{checksumname = text_checksum
		'do_or_die_helper'}
	percent = ((((1.0 - $battle_do_or_die_speed_scale) * 100.0) * ($battle_do_or_die_speed_scale_percent / ((0.0 - $battle_do_or_die_speed_scale_increase) * 100.0))) + 100.0)
	percent = (<percent> + 0.5)
	casttointeger \{percent}
	formattext textname = text qs(0xeb050f05) d = <percent>
	createscreenelement {
		type = textelement
		id = <text_checksum>
		parent = do_or_die_helper_container
		pos = (640.0, 500.0)
		text = <text>
		font = fontgrid_text_a8
		scale = 0.8
		rgba = [255 255 255 255]
		just = [center bottom]
		z_priority = 500
	}
	formattext \{checksumname = text_checksum2
		'do_or_die_helper2'}
	percent = ($battle_do_or_die_attack_scale * 100.0)
	casttointeger \{percent}
	formattext textname = text qs(0x4dbb2c86) d = <percent>
	createscreenelement {
		type = textelement
		id = <text_checksum2>
		parent = do_or_die_helper_container
		pos = (640.0, 540.0)
		text = <text>
		font = fontgrid_text_a8
		scale = 0.8
		rgba = [255 255 255 255]
		just = [center bottom]
		z_priority = 500
	}
	wait \{5
		seconds}
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

script boss_unlocked_text 
	createscreenelement \{type = containerelement
		id = boss_unlocked_text_container
		parent = root_window
		pos = (0.0, 0.0)}
	if ($current_song = bosstom)
		formattext \{textname = boss
			qs(0x99bce787)}
		pos = (634.0, 580.0)
	elseif ($current_song = bossslash)
		pos = (634.0, 580.0)
		formattext \{textname = boss
			qs(0xd4b29c64)}
	elseif ($current_song = bossdevil)
		pos = (800.0, 580.0)
		formattext \{textname = boss
			qs(0x88f8861c)}
	endif
	formattext \{textname = unlocked
		qs(0xcdb78f2b)}
	formattext \{textname = visit_store
		qs(0xb1aaa21c)}
	formattext textname = text qs(0xa7492276) s = <boss> b = <unlocked> v = <visit_store>
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
		font = fontgrid_text_a11
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
		legacydoscreenelementmorph {
			id = <boss_unlocked>
			alpha = 0
			time = 1
		}
	endif
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
	disable_bg_viewport
endscript
current_song_time = -1
time_to_next_beat = -1
next_beat_time = -1
time_to_next_beat2 = -1
next_beat_time2 = -1
tempo_iterator_offset = 0

script tempo_matching_iterator 
	printf qs(0x267f53bc) d = <time_offset>
	get_song_prefix song = <song_name>
	formattext checksumname = timesig '%s_timesig' s = <song_prefix> addtostringlookup
	getarraysize $<timesig>
	timesig_entry = 0
	timesig_size = <array_size>
	timesig_num = 0
	measure_count = 0
	even = 1
	song = ($<player_status>.current_song_fretbar_array)
	array_entry = 0
	array_entry2 = 0
	fretbar_count = 0
	change \{next_beat_time = -1}
	change \{time_to_next_beat = -1}
	change \{next_beat_time2 = -1}
	change \{time_to_next_beat2 = -1}
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
			if (<array_entry> < <final_array_entry>)
				change structurename = <player_status> current_song_beat_time = ($<song> [(<array_entry> + 1)] - $<song> [<array_entry>])
				change structurename = <player_status> current_song_measure_time = (<timesig_num> * $<player_status>.current_song_beat_time)
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
		if (<even> = 1)
			<next_array_entry> = (<array_entry> + 1)
			if (<next_array_entry> < <final_array_entry>)
				change next_beat_time2 = ($<song> [<next_array_entry>])
				change time_to_next_beat2 = ($next_beat_time2 - <marker>)
			else
				change \{next_beat_time2 = -1}
				change \{time_to_next_beat2 = -1}
			endif
			even = 0
		else
			even = 1
		endif
		repeat <array_size>
	endif
endscript
measure_callback = nullscript
beat_callback = nullscript

script setmeasurecallback 
	if gotparam \{callback}
		change measure_callback = <callback>
	else
	endif
endscript

script clearmeasurecallbacks 
	change \{measure_callback = nullscript}
endscript

script setbeatcallback 
	if gotparam \{callback}
		change beat_callback = <callback>
	else
	endif
endscript

script gettimetonextbeat 
	getsongtimems \{time_offset = $tempo_iterator_offset}
	return time_to_next_beat = ($next_beat_time - <time>)
endscript

script clearbeatcallbacks 
	change \{beat_callback = nullscript}
endscript

script spawn_measure_callbacks 
	spawnscriptnow \{$measure_callback}
endscript

script spawn_beat_callbacks 
	spawnscriptnow $beat_callback params = {time_to_next_beat = <time_to_next_beat>}
endscript

script measure_test_script 
	printf \{channel = tempo
		qs(0x579a2ed4)}
endscript

script beat_test_script 
	printf channel = tempo qs(0x96bdbc92) a = <time_to_next_beat>
endscript

script guitarevent_starsequencebonus 
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
	player = ($<player_status>.player)
	player = (<player> - 1)
	getarraysize \{$gem_colors}
	inputarraygetelement name = <song> index = <array_entry>
	destroy_big_bolt {player_status = <player_status> gem_array = <gem_array>}
	gem_count = 0
	begin
	<note> = (<gem_array> [(<gem_count> + 1)])
	if (<note> > 0)
		if (<gem_count> = (<array_size> -1))
			if gotparam \{got_one}
				break
			endif
		else
			got_one = 1
		endif
		color = ($gem_colors [<gem_count>])
		if ($<player_status>.lefthanded_button_ups = 1)
			<pos2d> = (($button_up_models [<player>]).<color>.left_pos_2d)
			<angle> = (($button_models [<player>]).<color>.angle)
		else
			<pos2d> = (($button_up_models [<player>]).<color>.pos_2d)
			<angle> = (($button_models [<player>]).<color>.left_angle)
		endif
		formattext checksumname = name 'big_bolt%p%e' p = ($<player_status>.text) e = <gem_count> addtostringlookup = true
		if NOT screenelementexists id = <name>
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
		endif
		formattext checksumname = fx_id 'big_bolt_particle%p%e' p = ($<player_status>.text) e = <gem_count> addtostringlookup = true
		destroy2dparticlesystem id = <fx_id>
		<particle_pos> = (<pos2d> - (0.0, 0.0))
		if NOT objectexists id = <fx_id>
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
		endif
		formattext checksumname = fx2_id 'big_bolt_particle2%p%e' p = ($<player_status>.text) e = <gem_count> addtostringlookup = true
		<particle_pos> = (<pos2d> - (0.0, 0.0))
		if NOT objectexists id = <fx2_id>
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
		endif
		formattext checksumname = fx3_id 'big_bolt_particle3%p%e' p = ($<player_status>.text) e = <gem_count> addtostringlookup = true
		<particle_pos> = (<pos2d> - (0.0, 15.0))
		if NOT objectexists id = <fx3_id>
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
	endif
	gem_count = (<gem_count> + 1)
	repeat <array_size>
	wait \{$star_power_bolt_time
		seconds}
	destroy_big_bolt {player_status = <player_status> gem_array = <gem_array> kill_when_empty = kill_when_empty}
endscript

script destroy_big_bolt 
	gem_count = 0
	getarraysize \{$gem_colors}
	begin
	<note> = (<gem_array> [(<gem_count> + 1)])
	if (<note> > 0)
		formattext checksumname = name 'big_bolt%p%e' p = ($<player_status>.text) e = <gem_count> addtostringlookup = true
		destroyscreenelement id = <name>
		formattext checksumname = fx_id 'big_bolt_particle%p%e' p = ($<player_status>.text) e = <gem_count> addtostringlookup = true
		formattext checksumname = fx2_id 'big_bolt_particle2%p%e' p = ($<player_status>.text) e = <gem_count> addtostringlookup = true
		formattext checksumname = fx3_id 'big_bolt_particle3%p%e' p = ($<player_status>.text) e = <gem_count> addtostringlookup = true
		destroy2dparticlesystem id = <fx_id> <kill_when_empty>
		destroy2dparticlesystem id = <fx2_id> <kill_when_empty>
		destroy2dparticlesystem id = <fx3_id> <kill_when_empty>
	endif
	gem_count = (<gem_count> + 1)
	repeat <array_size>
endscript

script guitarevent_multiplier4xoff 
	soundevent \{event = ui_sfx_lose_multiplier_4x}
	soundevent \{event = lose_multiplier_crowd}
	spawnscriptnow highway_pulse_multiplier_loss params = {player_text = ($<player_status>.text) multiplier = 4}
endscript

script guitarevent_multiplier3xoff 
	soundevent \{event = ui_sfx_lose_multiplier_3x}
	spawnscriptnow highway_pulse_multiplier_loss params = {player_text = ($<player_status>.text) multiplier = 3}
endscript

script guitarevent_multiplier2xoff 
	soundevent \{event = ui_sfx_lose_multiplier_2x}
	spawnscriptnow highway_pulse_multiplier_loss params = {player_text = ($<player_status>.text) multiplier = 2}
endscript

script guitarevent_killsong \{loadingtransition = 0}
	gh3_sfx_stop_sounds_for_killsong <...> loading_transition = <loading_transition>
endscript

script guitarevent_entervenue 
	getpakmancurrentname \{map = zones}
	formattext checksumname = echo_params 'Echo_Crowd_Buss_%s' s = <pakname>
	formattext checksumname = reverb_params 'Reverb_Crowd_Buss_%s' s = <pakname>
	if NOT globalexists name = <echo_params>
		echo_params = echo_crowd_buss_default_semiwet
	endif
	if NOT globalexists name = <reverb_params>
		reverb_params = reverb_crowd_buss_default_semiwet
	endif
	setsoundbusseffects effects = [{$<echo_params> name = crowd_w_reverb_buss_echo}]
	setsoundbusseffects effects = [{$<reverb_params> name = crowd_w_reverb_buss_reverb}]
endscript

script guitarevent_exitvenue 
	setsoundbusseffects \{effects = [
			{
				$echo_dry
				name = crowd_w_reverb_buss_echo
			}
		]}
	setsoundbusseffects \{effects = [
			{
				$reverb_dry
				name = crowd_w_reverb_buss_reverb
			}
		]}
endscript

script guitarevent_createfirstgem 
	spawnscriptnow first_gem_fx params = {<...>}
endscript

script first_gem_fx 
	if gotparam \{is_white_gem}
		return
	endif
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
		start_color = [255 255 255 0]
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
		time = 0.25
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
kick_index = 0

script guitarevent_kick_drum_hit_note \{player = 1}
	change kick_index = ($kick_index + 1)
	if ($kick_index > 1024)
		change \{kick_index = 0}
	endif
	<highway_info> = ($highway_pos_table [<player> -1])
	<x_scale> = ((<highway_info>.highway_top_width + (<highway_info>.highway_top_width * <highway_info>.widthoffsetfactor)) / 32.0)
	formattext checksumname = container_id 'gem_container%p' p = <player_text> addtostringlookup = true
	wait \{1
		frame}
	<particle_pos> = (640.0, 630.0)
	formattext checksumname = fx_id 'Kick_Particle%p%i' p = <player_text> i = $kick_index addtostringlookup = true
	<start_scale> = (<x_scale> * (1.0, 0.0) + (0.0, 0.25))
	<end_scale> = (<x_scale> * (1.875, 0.0) + (0.0, 0.5))
	create2dparticlesystem {
		id = <fx_id>
		pos = <particle_pos>
		z_priority = 7.9
		material = sys_particle_elipse01_sys_particle_elipse01
		parent = <container_id>
		start_color = [200 0 255 255]
		end_color = [0 0 0 0]
		start_scale = <start_scale>
		end_scale = <end_scale>
		start_angle_spread = 0
		min_rotation = 0
		max_rotation = 0
		emit_start_radius = 0.0
		emit_radius = 1.0
		emit_rate = 0.1
		emit_dir = 0.0
		emit_spread = 0
		velocity = 0.25
		friction = (0.0, 10.0)
		time = 0.2
	}
	getplayerinfo <player> part
	if (<part> = drum)
		getplayerinfo <player> four_lane_highway
	else
		four_lane_highway = 0
	endif
	if (<four_lane_highway> = 0)
		formattext checksumname = fx2_id 'Kick_Particle2%p%i' p = <player_text> i = $kick_index addtostringlookup = true
		<start_scale> = (<x_scale> * (0.5, 0.0) + (0.0, 0.15))
		<end_scale> = (<x_scale> * (0.5, 0.0) + (0.0, 0.5))
		create2dparticlesystem {
			id = <fx2_id>
			pos = <particle_pos>
			z_priority = 8.0
			material = sys_particle_kickhit01_sys_particle_kickhit01
			parent = <container_id>
			start_color = [255 255 255 255]
			end_color = [0 0 0 0]
			start_scale = <start_scale>
			end_scale = <end_scale>
			start_angle_spread = 0
			min_rotation = 0
			max_rotation = 0
			emit_start_radius = 0.0
			emit_radius = 1.0
			emit_rate = 0.1
			emit_dir = 0.0
			emit_spread = 0
			velocity = 0.25
			friction = (0.0, 0.0)
			time = 0.2
		}
		wait \{11
			frames}
		destroy2dparticlesystem id = <fx_id> <kill_when_empty>
		destroy2dparticlesystem id = <fx2_id> <kill_when_empty>
	else
		formattext checksumname = fx2_id 'Kick_Particle2%p%i' p = <player_text> i = $kick_index addtostringlookup = true
		<start_scale> = (<x_scale> * (0.5, 0.0) + (0.0, 0.15))
		<end_scale> = (<x_scale> * (0.5, 0.0) + (0.0, 0.5))
		create2dparticlesystem {
			id = <fx2_id>
			pos = <particle_pos>
			z_priority = 8.0
			material = mat_particle_kickhit01_noroland
			parent = <container_id>
			start_color = [255 255 255 255]
			end_color = [0 0 0 0]
			start_scale = <start_scale>
			end_scale = <end_scale>
			start_angle_spread = 0
			min_rotation = 0
			max_rotation = 0
			emit_start_radius = 0.0
			emit_radius = 1.0
			emit_rate = 0.1
			emit_dir = 0.0
			emit_spread = 0
			velocity = 0.25
			friction = (0.0, 0.0)
			time = 0.2
		}
		wait \{11
			frames}
		destroy2dparticlesystem id = <fx_id> <kill_when_empty>
		destroy2dparticlesystem id = <fx2_id> <kill_when_empty>
	endif
endscript

script guitarevent_hit_open_note 
	guitarevent_kick_drum_hit_note player = <player> player_text = <player_text>
endscript

script guitarevent_hit_easy_rhythm_note 
	guitarevent_kick_drum_hit_note player_text = <player_text>
endscript

script playersetvolume 
	if gotparam \{volume}
		if (($<player_status>.part) = drum)
			if gotparam \{drum}
				switch <drum>
					case 1
					change structurename = <player_status> drum_volume1 = <volume>
					case 2
					change structurename = <player_status> drum_volume2 = <volume>
					case 3
					change structurename = <player_status> drum_volume3 = <volume>
					case 4
					change structurename = <player_status> drum_volume4 = <volume>
				endswitch
				return
			endif
		endif
		change structurename = <player_status> guitar_volume = <volume>
	endif
endscript

script playergetvolume 
	if (($<player_status>.part) = drum)
		if gotparam \{drum}
			switch <drum>
				case 1
				return volume = ($<player_status>.drum_volume1)
				case 2
				return volume = ($<player_status>.drum_volume2)
				case 3
				return volume = ($<player_status>.drum_volume3)
				case 4
				return volume = ($<player_status>.drum_volume4)
			endswitch
		endif
	endif
	return volume = ($<player_status>.guitar_volume)
endscript

script create_handsofgod \{text = qs(0x6f6d143d)}
	destroy_all_exploding_text
	spawnscriptnow create_exploding_text params = {text = <text>}
	if screenelementexists \{id = handsofgod}
		destroyscreenelement \{id = handsofgod}
	endif
	createscreenelement \{parent = root_window
		id = handsofgod
		type = descinterface
		desc = 'you_rock'
		z_priority = 0}
	handsofgod :obj_spawnscriptnow \{anim_handsofgod}
endscript

script anim_handsofgod 
	handsofgod :obj_spawnscriptlater \{rotate_highlight_sparkle_glow
		params = {
			id = handsofgod
			time = 1.25
		}}
	handsofgod :se_setprops \{hand_of_god_1_pos = (630.0, -550.0)
		hand_of_god_1_rot_angle = 40
		hand_of_god_1_alpha = 0
		hand_of_god_2_pos = (-685.0, 373.0)
		hand_of_god_2_rot_angle = 40
		hand_of_god_2_alpha = 0
		time = 0}
	wait \{1.2
		seconds}
	handsofgod :se_setprops \{hand_of_god_1_rot_angle = 0
		hand_of_god_1_alpha = 1
		hand_of_god_2_rot_angle = 0
		hand_of_god_2_alpha = 1
		time = 0.2
		motion = ease_in}
	handsofgod :se_waitprops
	spawnscriptnow \{handofgod_fx_01}
	handsofgod :se_setprops \{hand_of_god_1_rot_angle = 5
		hand_of_god_2_rot_angle = 5
		time = 0.1
		motion = ease_out}
	handsofgod :se_waitprops
	handsofgod :se_setprops \{hand_of_god_1_rot_angle = 0
		hand_of_god_2_rot_angle = 0
		time = 0.2
		motion = ease_in}
	handsofgod :se_waitprops
	handsofgod :se_setprops \{hand_of_god_1_rot_angle = 0
		hand_of_god_1_alpha = 1
		hand_of_god_2_rot_angle = 0
		hand_of_god_2_alpha = 1
		time = 0.7
		motion = ease_in}
	handsofgod :se_waitprops
	spawnscriptnow \{handofgod_fx_02}
	begin
	handsofgod :se_setprops hand_of_god_1_rot_angle = Random (@ 2 @ -2 @ 4 @ -4 @ 0 )hand_of_god_2_rot_angle = Random (@ 2 @ -1 @ 4 @ -4 @ 0 )time = 0.1 motion = Random (@ ease_in @ ease_out )
	handsofgod :se_waitprops
	repeat 12
	handsofgod :se_setprops \{hand_of_god_1_rot_angle = 360
		hand_of_god_2_rot_angle = 360
		hand_of_god_1_alpha = 0
		hand_of_god_2_alpha = 0
		time = 1.5
		motion = ease_out}
	handsofgod :se_waitprops
	die
endscript

script hot_start_achieved \{band = 0}
	gamemode_gettype
	if (<type> = training)
		return
	endif
	if (<player> = 1)
		printf \{channel = sfx
			qs(0x3f8e0b79)}
		if issingleplayergame
			pos = (640.0, 211.0)
			<base_scale> = 1.0
			spawnscriptnow gh_sfx_note_streak_singleplayer params = {combo = <combo>}
		elseif ($game_mode = p2_career || $game_mode = p2_quickplay)
			pos = (640.0, 170.0)
			<base_scale> = 1.0
			spawnscriptnow gh_sfx_note_streak_p1 params = {combo = <combo>}
		elseif ($is_network_game && $game_mode = p2_coop)
			pos = (640.0, 170.0)
			<base_scale> = 1.0
			spawnscriptnow gh_sfx_note_streak_p1 params = {combo = <combo>}
		else
			<s> = 0.35000002
			pos = (415.0, 170.0)
			spawnscriptnow gh_sfx_note_streak_p1 params = {combo = <combo>}
		endif
	else
		printf \{channel = sfx
			qs(0xa30807c8)}
		if ($game_mode = p2_career || $game_mode = p2_quickplay)
			pos = (640.0, 170.0)
			<base_scale> = 1.0
			spawnscriptnow gh_sfx_note_streak_p2 params = {combo = <combo>}
		elseif ($is_network_game && $game_mode = p2_coop)
			pos = (640.0, 170.0)
			<base_scale> = 1.0
			spawnscriptnow gh_sfx_note_streak_p2 params = {combo = <combo>}
		else
			<s> = 0.35000002
			pos = (865.0, 170.0)
			spawnscriptnow gh_sfx_note_streak_p2 params = {combo = <combo>}
		endif
	endif
	if NOT gamemode_isbandscoring
		hud_create_message player = <player> text = qs(0x09a07a71)
	elseif (<band> = 1)
		hud_create_message \{band
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
endscript
