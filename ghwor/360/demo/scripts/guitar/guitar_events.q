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
		event = firstnote_window_open
		scr = guitarevent_firstnote_window_open
	}
]

script create_guitar_events 
	printf qs(0xf3da5047) a = <player>
	getarraysize \{$guitar_events}
	array_entry = 0
	begin
	event = ($guitar_events [<array_entry>].event)
	type = ($guitar_events [<array_entry>].type)
	extendcrcplayer <event> <player> out = event
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
	band_playfacialanim
	band_playidle
	band_playloop
	band_playrockinfacialanim
	band_playsimpleanim
	band_setanimtempo
	band_setikchain
	band_setikchaintarget
	band_showmic
	band_showmic_microphone
	band_showmic_stand
	bandforcealltoidle
	cameracutseffect_fovpulse
	lightshow_settime
	setsonghandcamparams
	spit_vocalist_small
	audio_sync_test_disable_highway
	audio_sync_test_enable_highway
	band_lookat_off
	band_lookat_on
	bandmanager_hideinstrument
	bandmanager_unhideinstrument
	bandmember_sillhouette
	bandmember_sillhouette_turnoffflare
	cameracuts_applydof
	change_crowd_state
	crowdspots
	crowdspots_off
	fadeoutandin
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
	scream_sfx_between_song_1_and_2
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
	spawnscriptnow ($guitar_events [<event_spawned>].scr) params = {<...>} id = song_event_scripts
endscript

script event_iterator 
	printf qs(0x5fa77966) d = <time_offset> e = <event_string> channel = events
	get_song_prefix song = <song_name>
	formattext checksumname = song '%s_%e' s = <song_prefix> e = <event_string> addtostringlookup = true
	array_entry = 0
	if NOT songglobalexists name = <song> type = array
		if (<event_string> != 'scriptevents')
			scriptassert 'Array %s does not exist' s = <song>
		endif
		return
	endif
	getsongarraysize <song>
	if (<array_size> = 0)
		return
	endif
	checkvalidscriptevents name = <song> song_name = <song_name>
	getsongtimems time_offset = <time_offset>
	begin
	getsongglobal name = <song> index = <array_entry>
	if ((<time> - <skipleadin>) < (<element>.time))
		break
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_size>
	array_size = (<array_size> - <array_entry>)
	if (<array_size> = 0)
		return
	endif
	begin
	getsongglobal name = <song> index = <array_entry>
	timemarkerreached_setparams time_offset = <time_offset> time = (<element>.time)
	begin
	if timemarkerreached
		getsongtimems time_offset = <time_offset>
		break
	endif
	wait \{1
		gameframe}
	repeat
	timemarkerreached_clearparams
	scriptname = (<element>.scr)
	if scriptexists <scriptname>
		spawnscriptnow <scriptname> params = {time = <time> event_time = (<element>.time) (<element>.params)} id = song_event_scripts
	elseif symboliscfunc <scriptname>
		<scriptname> {time = <time> event_time = (<element>.time) (<element>.params)}
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_size>
endscript

script scriptevents_iterator 
	<intro_script_events> = unknown
	if ($current_transition = encore)
		get_rocker_transformation_name
		<intro_script_events> = <name>
	elseif ($current_transition = celebintro)
		get_rocker_intro_name
		<intro_script_events> = <name>
	elseif ($current_transition = finalbattleintro)
		<current_song> = none
		playlist_getcurrentsong
		get_finalbattle_song_number song = <current_song>
		getarraysize \{$g_finalbattle_performance_names}
		if (<song_number> > <array_size>)
			scriptassert \{'array g_finalbattle_performance_names does not contain enough songs'}
		else
			intro_script_events = ($g_finalbattle_performance_names [<song_number>])
		endif
	endif
	extendcrc <intro_script_events> '_scriptevents' out = intro_script_events
	if globalexists name = <intro_script_events> type = array
		getarraysize $<intro_script_events>
		<array_entry> = 0
		begin
		timemarkerreached_setparams time_offset = <time_offset> array = <intro_script_events> array_entry = <array_entry> arrayofstructures fixtimerounding
		begin
		if timemarkerreached
			getsongtimems time_offset = <time_offset>
			break
		endif
		wait \{1
			gameframe}
		repeat
		timemarkerreached_clearparams
		scriptname = ($<intro_script_events> [<array_entry>].scr)
		if scriptexists <scriptname>
			spawnscriptnow <scriptname> params = {time = <time> event_time = (($<intro_script_events> [<array_entry>]).time) ($<intro_script_events> [<array_entry>].params) from_scriptevent = 1 intro_event = 1} id = song_event_scripts
		elseif symboliscfunc <scriptname>
			<scriptname> {time = <time> event_time = (($<intro_script_events> [<array_entry>]).time) ($<intro_script_events> [<array_entry>].params) intro_event = 1}
		else
			scriptassert \{qs(0x9c0f1457)}
		endif
		<array_entry> = (<array_entry> + 1)
		repeat <array_size>
	else
	endif
	if ($current_transition = encore)
		return
	endif
	get_song_prefix song = <song_name>
	formattext checksumname = song '%s_scriptevents' s = <song_prefix> addtostringlookup = true
	array_entry = 0
	if NOT songglobalexists name = <song> type = array
		return
	endif
	getsongarraysize <song>
	if (<array_size> = 0)
		return
	endif
	checkvalidscriptevents name = <song> song_name = <song_name>
	getsongtimems time_offset = <time_offset>
	if (<time> > 1000)
		begin
		getsongglobal name = <song> index = <array_entry>
		if ((<time> - <skipleadin>) <= (<element>.time))
			break
		endif
		<array_entry> = (<array_entry> + 1)
		repeat <array_size>
		array_size = (<array_size> - <array_entry>)
	endif
	if (<array_size> = 0)
		return
	endif
	begin
	getsongglobal name = <song> index = <array_entry>
	timemarkerreached_setparams time_offset = <time_offset> time = (<element>.time) fixtimerounding
	begin
	if timemarkerreached
		getsongtimems time_offset = <time_offset>
		break
	endif
	wait \{1
		gameframe}
	repeat
	timemarkerreached_clearparams
	scriptname = (<element>.scr)
	if scriptexists <scriptname>
		spawnscriptnow <scriptname> params = {time = <time> event_time = (<element>.time) (<element>.params) from_scriptevent = 1} id = song_event_scripts
	elseif symboliscfunc <scriptname>
		<scriptname> {time = <time> event_time = (<element>.time) (<element>.params)}
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_size>
endscript

script guitarevent_missednote \{extended_miss = 0}
	if ($calibrate_lag_enabled = 1)
		spawnscriptnow \{calibration_highway_miss_note}
	endif
	if (<bum_note> = 1)
		audio_gameplay_guitar_wrong_note_sound_logic <...>
	endif
	getplayerinfo <player> is_local_client
	getplayerinfo <player> part
	processevent_note_miss <...>
	if ($is_network_game && <is_local_client> = 0)
		if (<silent_miss> = 1)
			spawnscriptnow highway_pulse_black params = {player = <player>}
		endif
	else
		if NOT (<part> = drum)
			playergetvolume player = <player>
			if NOT (<volume> = 0)
				if (<silent_miss> = 1)
					spawnscriptnow highway_pulse_black params = {player = <player>}
				else
					if NOT (<extended_miss> = 1)
						playersetvolume player = <player> volume = 0
						updateguitarvolume
					endif
				endif
			endif
		endif
		playlist_getcurrentsong
		if (<current_song> = jamsession)
			musicstudio_update_volume_for_playback off player = <player>
		endif
	endif
	if ($always_strum = false)
		if ($disable_band = 0)
			getplayerinfo <player> band_member
			if compositeobjectexists name = <band_member>
				if (<part> = guitar || <part> = bass)
					bandmanager_missednote name = <band_member>
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
	extendcrcplayer out = highway highway_2d <player>
	legacydoscreenelementmorph id = <highway> rgba = ($highway_pulse) time = <half_time>
	wait <half_time> seconds
	if playerinfoequals <player> star_power_used = 1
		legacydoscreenelementmorph id = <highway> rgba = ($highway_starpower) time = <half_time>
	else
		legacydoscreenelementmorph id = <highway> rgba = ($highway_normal) time = <half_time>
	endif
endscript

script guitarevent_unnecessarynote 
	if ($calibrate_lag_enabled = 1)
		return
	endif
	audio_gameplay_guitar_wrong_note_sound_logic <...>
	getplayerinfo <player> is_local_client
	if NOT ($is_network_game && (<is_local_client> = 0))
		playersetvolume player = <player> volume = 0
		updateguitarvolume
		musicstudio_update_volume_for_playback off player = <player> unnecessarynote = 1
	endif
	if ($always_strum = false)
		if ($disable_band = 0)
			getplayerinfo <player> band_member
			if compositeobjectexists name = <band_member>
				getplayerinfo <player> part
				if (<part> = guitar || <part> = bass)
					launchevent type = anim_missednote target = (<band_member>)
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
	if ($g_debug_audible_hitnote = 1)
		soundevent \{event = audio_debug_hit_note}
	endif
	getplayerinfo <player> part
	processevent_note_hit <...>
	if ($show_play_log = 1 || $calibrate_lag_enabled = 1)
		get_lag_values
		<off_note> = (0 - (<off_note> - ($time_input_offset - <audio_offset> + <video_offset>)))
		casttointeger \{off_note}
		if ($calibrate_lag_enabled = 1)
			addarrayelement array = $calibrate_history_times element = <off_note>
			change calibrate_history_times = <array>
		endif
		if ($show_play_log = 1)
			inputarraygetelement name = <song> index = <array_entry>
			note_time = (<gem_array> [0])
			if (<off_note> < 0)
				output_log_text qs(0xddc15e81) n = <off_note> t = <note_time> color = green
			else
				output_log_text qs(0x257db375) n = <off_note> t = <note_time> color = darkgreen
			endif
		endif
	endif
	if (<updatevolume> = true)
		updateguitarvolume
		musicstudio_update_volume_for_playback on player = <player>
	endif
endscript

script guitarevent_hitnote 
	if (($g_debug_highway_visible) = 1)
		if ($highway_displayed = 1)
			spawnscriptnow guitarevent_hitnote_spawned params = {<...>}
		endif
	endif
endscript

script guitarevent_hitnote_spawned 
	getnowbarscale player = <player>
	if ($calibrate_lag_enabled = 1)
		spawnscriptnow \{calibration_highway_hit_note}
	endif
	if gotparam \{kick}
		guitarevent_kick_drum_hit_note player = <player>
	elseif gotparam \{open_note}
		guitarevent_hit_open_note player = <player>
	elseif gotparam \{beginner_note}
		guitarevent_hit_beginner_note player = <player>
	else
		wait \{1
			gameframe}
		scale = (3.0, 3.0)
		star_power_used = 0
		if playerinfoequals player = <player> star_power_used = 1
			<star_power_used> = 1
		endif
		<pos> = ((<pos>.(1.0, 0.0) * (1.0, 0.0)) + ((<pos>.(0.0, 1.0) + 25) * (0.0, 1.0)))
		<particle_pos> = (((<nowbar_x_scale> * (<pos> [0])) * (1.0, 0.0)) + ((<nowbar_y_scale> * (<pos> [1]) + 30) * (0.0, 1.0)))
		notefx <...> star = <star_power_used> name = <fx_id>
	endif
endscript

script guitarevent_hitnote_kill_spawned 
	if gotparam \{particle_id2}
		wait \{0.1
			seconds}
		destroy2dparticlesystem id = <particle_id> kill_when_empty
		destroy2dparticlesystem id = <particle_id2> kill_when_empty
		destroy2dparticlesystem id = <particle_id3> kill_when_empty
		wait \{1.15
			seconds}
		destroygemelement id = <fx_id>
	else
		wait \{4
			gameframes}
		destroy2dparticlesystem id = <particle_id> kill_when_empty
		wait \{10
			gameframes}
		destroygemelement id = <fx_id>
	endif
endscript

script guitarevent_drumfillhit 
	guitarevent_hitnote <...>
endscript
hit_particle_params = {
	z_priority = 8.0
	material = sys_particle_spark01_sys_particle_spark01
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
	emit_rate = 0.025
	emit_dir = 0.0
	emit_spread = 40.0
	velocity = 12.0
	friction = (0.0, 100.0)
	time = 0.5
}
star_hit_particle_params = {
	z_priority = 8.0
	material = sys_particle_spark01_sys_particle_spark01
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
	emit_rate = 0.025
	emit_dir = 0.0
	emit_spread = 40.0
	velocity = 12.0
	friction = (0.0, 100.0)
	time = 0.5
}
drum_accent1_hit_particle_params = {
	z_priority = 4.5
	material = mat_velocity_shatter_fx
	start_color = [
		255
		255
		255
		255
	]
	end_color = [
		255
		255
		255
		255
	]
	start_scale = (0.5, 0.5)
	end_scale = (0.3, 0.3)
	start_angle_spread = 360.0
	min_rotation = 360
	max_rotation = 0
	emit_start_radius = 0.0
	emit_radius = 0.0
	emit_rate = 0.05
	emit_dir = 0.0
	emit_spread = 120.0
	velocity = 33.0
	friction = (0.0, 88.0)
	time = 2.1
}
drum_accent2_hit_particle_params = {
	z_priority = 4.5
	material = mat_velocity_shatter_fx1
	start_color = [
		255
		255
		255
		255
	]
	end_color = [
		255
		255
		255
		255
	]
	start_scale = (-0.3, -0.3)
	end_scale = (-0.5, -0.5)
	start_angle_spread = 360.0
	min_rotation = 0
	max_rotation = 360
	emit_start_radius = 1
	emit_radius = 1
	emit_rate = 0.06
	emit_dir = 0.0
	emit_spread = 44.0
	velocity = 24
	friction = (0.0, 88.0)
	time = 2.1
}
drum_accent3_hit_particle_params = {
	z_priority = 4.5
	material = mat_velocity_shatter_fx2
	start_color = [
		122
		122
		122
		128
	]
	end_color = [
		123
		123
		123
		0
	]
	start_scale = (0.04, 0.04)
	end_scale = (0.1, 0.1)
	start_angle_spread = 360.0
	min_rotation = 0
	max_rotation = 0
	emit_start_radius = 1
	emit_radius = 25.0
	emit_rate = 0.0055
	emit_dir = 0.0
	emit_spread = 44.0
	velocity = 22.0
	friction = (0.0, 0.0)
	time = 0.1
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

script drum_accent_hit_particle_fx 
	formattext checksumname = container_id 'nowbar_container_p%p' p = <player>
	getnowbarscale player = <player>
	<particle_pos> = (((<nowbar_x_scale> * (<pos> [0])) * (1.0, 0.0)) + ((<nowbar_y_scale> * (<pos> [1])) * (0.0, 1.0)))
	getplayerinfo player = <player> star_power_used
	formattext checksumname = name 'hit_accent%p' p = <player> addtostringlookup = true
	if (<star_power_used> = 0)
		if screenelementexists id = <name>
			destroyscreenelement id = <name>
		endif
		createscreenelement {
			type = spriteelement
			id = <name>
			parent = <container_id>
			material = mat_note_hit_xplosion1
			rgba = [255 255 255 255]
			pos = <pos>
			rot_angle = (0)
			scale = (2.0, 2.0)
			just = [center bottom]
			z_priority = 6
		}
	else
		if screenelementexists id = <name>
			destroyscreenelement id = <name>
		endif
		createscreenelement {
			type = spriteelement
			id = <name>
			parent = <container_id>
			material = mat_note_hit_xplosion1
			rgba = [0 128 255 255]
			pos = <pos>
			rot_angle = (0)
			scale = (2.0, 2.0)
			just = [center bottom]
			z_priority = 6
		}
	endif
	pos = <particle_pos>
	extendcrc <fx_id> '_hit1_particle_accent' out = particle1_id
	destroy2dparticlesystem id = <particle1_id>
	create2dparticlesystem {
		id = <particle1_id>
		pos = <pos>
		z_priority = 4.5
		material = mat_velocity_shatter_fx
		parent = <container_id>
		start_color = [255 255 255 255]
		end_color = [255 255 255 255]
		start_scale = (0.5, 0.5)
		end_scale = (0.3, 0.3)
		start_angle_spread = 360.0
		min_rotation = 360
		max_rotation = 0
		emit_start_radius = 0.0
		emit_radius = 0.0
		emit_rate = 0.05
		emit_dir = 0.0
		emit_spread = 120.0
		velocity = 33.0
		friction = (0.0, 88.0)
		time = 2.1
	}
	extendcrc <fx_id> '_hit2_particle_accent' out = particle2_id
	destroy2dparticlesystem id = <particle2_id>
	create2dparticlesystem {
		id = <particle2_id>
		pos = <pos>
		z_priority = 4.5
		material = mat_velocity_shatter_fx1
		parent = <container_id>
		start_color = [255 255 255 255]
		end_color = [255 255 255 255]
		start_scale = (-0.3, -0.3)
		end_scale = (-0.5, -0.5)
		start_angle_spread = 360.0
		min_rotation = 0
		max_rotation = 360
		emit_start_radius = 1
		emit_radius = 1
		emit_rate = 0.06
		emit_dir = 0.0
		emit_spread = 44.0
		velocity = 24
		friction = (0.0, 88.0)
		time = 2.1
	}
	extendcrc <fx_id> '_hit3_particle_accent' out = particle3_id
	destroy2dparticlesystem id = <particle3_id>
	create2dparticlesystem {
		id = <particle3_id>
		pos = <pos>
		z_priority = 4.5
		material = mat_velocity_shatter_fx2
		parent = <container_id>
		start_color = [122 122 122 128]
		end_color = [123 123 123 0]
		start_scale = (0.04, 0.04)
		end_scale = (0.1, 0.1)
		start_angle_spread = 360.0
		min_rotation = 0
		max_rotation = 0
		emit_start_radius = 1
		emit_radius = 25.0
		emit_rate = 0.0055
		emit_dir = 0.0
		emit_spread = 44.0
		velocity = 22.0
		friction = (0.0, 0.0)
		time = 0.1
	}
	wait \{0.1
		seconds}
	destroy2dparticlesystem id = <particle1_id> kill_when_empty
	destroy2dparticlesystem id = <particle2_id> kill_when_empty
	destroy2dparticlesystem id = <particle3_id> kill_when_empty
	wait \{1.15
		seconds}
	destroyscreenelement id = <name>
endscript

script shake_highway2 
	printf \{channel = zdebug
		qs(0x87e07a9f)}
	formattext checksumname = container_id 'highway_containerp%p' p = <player> addtostringlookup = true
	if NOT screenelementexists id = <container_id>
		return
	endif
	getscreenelementposition id = <container_id>
	original_position = <screenelementpos>
	shake_frequency = 0.05
	pulse_on = 0
	begin
	if NOT screenelementexists id = <container_id>
		return
	endif
	if (<pulse_on> = 0)
		legacydoscreenelementmorph {
			id = <container_id>
			pos = (<original_position> + (0.0, 10.0))
			just = [center bottom]
			time = <shake_frequency>
		}
		wait <shake_frequency> seconds
		<pulse_on> = 1
	else
		legacydoscreenelementmorph {
			id = <container_id>
			pos = <original_position>
			just = [center bottom]
			time = <shake_frequency>
		}
		wait <shake_frequency> seconds
		<pulse_on> = 0
	endif
	wait \{1
		gameframes}
	repeat 2
endscript

script shake_highway3 
	printf \{channel = zdebug
		qs(0x9efb4bde)}
	formattext checksumname = container_id 'highway_containerp%p' p = <player> addtostringlookup = true
	getscreenelementposition id = <container_id>
	original_position = <screenelementpos>
	shake_frequency = 0.05
	pulse_on = 0
	begin
	if (<pulse_on> = 0)
		legacydoscreenelementmorph {
			id = <container_id>
			pos = (<original_position> + (0.0, 1.0))
			just = [center bottom]
			time = <shake_frequency>
		}
		wait <shake_frequency> seconds
		<pulse_on> = 1
	else
		legacydoscreenelementmorph {
			id = <container_id>
			pos = <original_position>
			just = [center bottom]
			time = <shake_frequency>
		}
		wait <shake_frequency> seconds
		<pulse_on> = 0
	endif
	wait \{1
		gameframes}
	repeat 2
endscript

script guitarevent_starpoweron 
	killspawnedscript \{name = highway_pulse_black}
	if ($drum_solo_songtime_paused = 0)
		audio_gameplay_star_power_verb_on player = <player>
	endif
	starpoweron player = <player>
	lightshow_add_mood_override_reason \{reason = starpower}
endscript

script guitarevent_starpoweroff \{no_sound = false}
	killspawnedscript \{name = highway_pulse_black}
	if (<no_sound> = false)
		if isps3
			if NOT ($current_song = jamsession)
				if issingleplayergame
					soundevent \{event = audio_star_power_release_front}
				else
					spawnscriptnow audio_gameplay_star_power_release_logic params = {player = <player>}
				endif
			endif
		else
			if issingleplayergame
				soundevent \{event = audio_star_power_release_front}
			else
				spawnscriptnow audio_gameplay_star_power_release_logic params = {player = <player>}
			endif
		endif
	endif
	audio_gameplay_star_power_verb_off player = <player>
	spawnscriptlater kill_starpower_stagefx params = {<...>}
	formattext checksumname = cont 'starpower_container_leftp%p' p = <player> addtostringlookup = true
	if screenelementexists id = <cont>
		legacydoscreenelementmorph id = <cont> alpha = 0
	endif
	formattext checksumname = cont 'starpower_container_rightp%p' p = <player> addtostringlookup = true
	if screenelementexists id = <cont>
		legacydoscreenelementmorph id = <cont> alpha = 0
	endif
	formattext checksumname = highway 'Highway_2Dp%p' p = <player> addtostringlookup = true
	if screenelementexists id = <highway>
		setscreenelementprops id = <highway> rgba = ($highway_normal)
	endif
	spawnscriptnow \{kill_starpower_camera}
	lightshow_remove_mood_override_reason \{reason = starpower}
endscript

script guitarevent_prefretbar 
	spawnscriptnow \{audio_gameplay_effects_update_vocal_echo}
	spawnscriptnow \{gh_audible_metronome}
	waittime = 0.25
	wait <waittime> seconds
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
	if ((<star_power_used1> = 1) || (<star_power_used2> = 1) || (<star_power_used3> = 1) || (<star_power_used4> = 1))
		getpakmancurrentname \{map = zones}
		if NOT ((<pakname> = 'z_mansionstudio') || (<pakname> = 'z_modular') || (<pakname> = 'z_credits') || (<pakname> = 'z_visualizer') || (<pakname> = 'z_finalbattle') || (<pakname> = 'z_cube'))
			if ($g_clap_fade = 1)
				printf \{channel = sfx
					qs(0x784a1ce5)}
				change \{g_clap_fade = 0}
				spawnscriptnow \{audio_crowd_kill_clap_fade}
			endif
			if ($game_mode != tutorial)
				if (($g_star_clap_normal = 1) || ($g_star_clap_leftcenterright = 1))
					printf \{qs(0xfe00cc6d)}
					soundevent \{event = $g_current_crowd_clap_normal_soundevent}
				elseif ($g_star_clap_middle = 1)
					printf \{qs(0x3af3642a)}
					soundevent \{event = $g_current_crowd_clap_middle_soundevent}
				elseif ($g_star_clap_left = 1)
					printf \{qs(0x4ac89455)}
					soundevent \{event = $g_current_crowd_clap_left_soundevent}
				elseif ($g_star_clap_right = 1)
					printf \{qs(0x8bfb9430)}
					soundevent \{event = $g_current_crowd_clap_right_soundevent}
				elseif ($g_star_clap_right_middle = 1)
					printf \{qs(0xbc1479cf)}
					soundevent \{event = $g_current_crowd_clap_right_middle_soundevent}
				elseif ($g_star_clap_left_middle = 1)
					printf \{qs(0x492c71b5)}
					soundevent \{event = $g_current_crowd_clap_left_middle_soundevent}
				endif
			endif
		elseif ($g_clap_fade = 1)
			printf \{channel = sfx
				qs(0x32a4d147)}
			if ($g_star_clap_normal = 1)
				printf \{qs(0xfe00cc6d)}
				soundevent \{event = $g_current_crowd_clap_normal_soundevent}
			elseif ($g_star_clap_middle = 1)
				printf \{qs(0x3af3642a)}
				soundevent \{event = $g_current_crowd_clap_middle_soundevent}
			elseif ($g_star_clap_left = 1)
				printf \{qs(0x4ac89455)}
				soundevent \{event = $g_current_crowd_clap_left_soundevent}
			elseif ($g_star_clap_right = 1)
				printf \{qs(0xc4a697e0)}
				soundevent \{event = $g_current_crowd_clap_right_soundevent}
			elseif ($g_star_clap_right_middle = 1)
				printf \{qs(0xbc1479cf)}
				soundevent \{event = $g_current_crowd_clap_right_middle_soundevent}
			elseif ($g_star_clap_left_middle = 1)
				printf \{qs(0x492c71b5)}
				soundevent \{event = $g_current_crowd_clap_left_middle_soundevent}
			endif
		else
			if ($g_crowd_listener_state_clap_on_1234 = 1)
				if ($g_star_clap_normal = 1)
					printf \{qs(0xfe00cc6d)}
					soundevent \{event = $g_current_crowd_clap_normal_soundevent}
				elseif ($g_star_clap_middle = 1)
					printf \{qs(0x3af3642a)}
					soundevent \{event = $g_current_crowd_clap_middle_soundevent}
				elseif ($g_star_clap_left = 1)
					printf \{qs(0x4ac89455)}
					soundevent \{event = $g_current_crowd_clap_left_soundevent}
				elseif ($g_star_clap_right = 1)
					printf \{qs(0xc4a697e0)}
					soundevent \{event = $g_current_crowd_clap_right_soundevent}
				elseif ($g_star_clap_right_middle = 1)
					printf \{qs(0xbc1479cf)}
					soundevent \{event = $g_current_crowd_clap_right_middle_soundevent}
				elseif ($g_star_clap_left_middle = 1)
					printf \{qs(0x492c71b5)}
					soundevent \{event = $g_current_crowd_clap_left_middle_soundevent}
				endif
			endif
		endif
	endif
	spawnscriptnow \{audio_crowd_anticipation_logic}
endscript

script gh_audible_metronome 
	if ($g_debug_audible_metronome = 1)
		wait ((0.25 + (($default_lag_settings.xenon.input_lag_ms) * 0.001)) - 0.008333) seconds
		soundevent \{event = audio_calibrate_beat_sfx}
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
	getplayerinfo <player> check_time_early
	getplayerinfo <player> check_time_late
	duration = (<check_time_early> + <check_time_late>)
	begin
	getplayerinfo <player> controller
	getheldpattern controller = <controller> player = <player>
	if (<strum> = <hold_pattern>)
		playersetvolume player = <player> volume = 100
		updateguitarvolume
		musicstudio_update_volume_for_playback on player = <player>
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
	getplayerinfo <player> controller
	if isguitarcontroller controller = <controller>
		getstrumpattern entry = 0 song = <song>
		spawnscriptnow check_first_note_formed params = {strum = <strum> player = <player>}
	else
		playersetvolume player = <player> volume = 100
		updateguitarvolume
		musicstudio_update_volume_for_playback on player = <player>
	endif
endscript

script guitarevent_note_window_open 
	if ($g_debug_audible_open = 1)
		value = (($check_time_early + (($default_lag_settings.xenon.input_lag_ms) * 0.001)) + 0.008333)
		printf channel = sfx qs(0x73307931) s = <value>
		wait (($check_time_early + (($default_lag_settings.xenon.input_lag_ms) * 0.001)) + 0.008333) seconds
		soundevent \{event = audio_calibrate_beat_sfx}
	endif
endscript

script guitarevent_note_window_close 
	if ($g_debug_audible_close = 1)
		soundevent \{event = audio_calibrate_beat_close_sfx}
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
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		whammyfxoffall player = <player>
		getnextplayer on_screen player = <player>
		repeat <num_players_shown>
	endif
endscript

script guitarevent_whammyon 
	getplayerinfo <player> part
	open_note_pattern = 1048576
	if (<part> = bass && <pattern> = <open_note_pattern>)
		guitarevent_open_note_sustain player = <player>
	elseif (($g_debug_highway_visible) = 1)
		whammyfxon <...>
	endif
endscript

script guitarevent_whammyoff 
	getplayerinfo <player> part
	open_note_pattern = 1048576
	if (<part> = bass && <pattern> = <open_note_pattern>)
		cleanup_open_note_sustain_fx player = <player>
	endif
	whammyfxoff <...>
endscript

script guitarevent_songfailed 
	gamemode_gettype
	if (<type> = freeplay || <type> = practice || <type> = tutorial)
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
	change \{failed_song = 1}
	gameevent_songfailed
	stopsoundsbybuss \{encore_events}
	restore_player_part_settings
	dynamicadmanagercommand \{func = issuecue
		cue = commitimpressions}
	if ($is_network_game)
		online_fail_song
	else
		stop_custom_song
		killspawnedscript \{name = guitar_jam_drum_playback}
		killspawnedscript \{name = jam_input_whammy_spawned}
		jam_stop_all_samples
		jam_deinit_reverb
		killspawnedscript \{name = guitarevent_songwon_spawned}
		spawnscriptnow guitarevent_songfailed_spawned params = {player = <player>}
	endif
endscript

script guitarevent_songfailed_spawned 
	disable_highway_prepass
	disable_bg_viewport
	gman_sendcallbacktoallgoals \{suffix = 'song_complete'
		callback_data = {
			event = song_failed
		}}
	lightshow_songfailed
	playlist_getcurrentsong
	change last_song_played = <current_song>
	if is_current_song_a_jam_session
		<last_song_props> = {}
		get_jam_filename \{type = current}
		addparam structure_name = last_song_props name = filename value = <filename>
		addparam structure_name = last_song_props name = example_song value = <example_song>
		addparam structure_name = last_song_props name = jam_display_name value = <jam_display_name>
		get_song_artist song = <current_song> with_year = 0
		addparam structure_name = last_song_props name = jam_artist_name value = <song_artist>
		change last_jam_song_props = <last_song_props>
	endif
	change \{g_dont_play_win_anim_sfx = 0}
	if ($is_network_game)
		ui_event_get_top
		if (<base_name> = 'controller_disconnect')
			generic_event_back
		endif
		change \{g_net_quickplay_show_unlock_screen = 0}
		killspawnedscript \{name = dispatch_player_state}
		sfx_backgrounds_new_area \{bg_sfx_area = frontend
			fadeintime = 5
			fadeintype = linear
			fadeouttime = 5
			fadeouttype = linear}
		disable_pause
		if ($net_pause = 1)
			net_unpausegh
		endif
		pushunsafeforshutdown \{context = net_gameplay}
		onexitrun \{guitar_event_song_exit_pop_unsafe}
	endif
	getsongtimems
	change failed_song_time = <time>
	playlist_getcurrentsong
	pausegame
	progression_songfailed
	end_singleplayer_game
	if ($is_network_game = 0)
		xenon_singleplayer_session_begin_uninit
		spawnscriptnow \{xenon_singleplayer_session_complete_uninit
			params = {
				song_failed
			}}
	endif
	unpausegame
	ui_event_wait_for_safe
	disable_pause
	soundevent \{event = audio_crowd_fail}
	gamemode_gettype
	if (<type> = career)
		if quest_progression_is_chapter_finale
			finalbattle_fail_audio
		endif
	endif
	playsound \{$g_current_crowd_transition_neutral_to_negative
		buss = crowd_transitions}
	soundevent \{event = gh_sfx_you_lose_single_player}
	transition_play \{type = songlost}
	transition_wait
	change \{current_transition = none}
	pausegame
	show_calibration = 0
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
		playlist_getcurrentsong
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
			if (<base_name> = 'controller_disconnect' || <base_name> = 'pausemenu_quit_warning' || <base_name> = 'online_quit_warning')
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
			if scriptisrunning \{sysnotify_handle_connection_loss}
				ui_event_wait_for_safe
				unpausegame
			endif
		endif
	else
		if NOT scriptisrunning \{handle_signin_changed}
			ui_event_get_top
			if (<base_name> = 'controller_disconnect' || <base_name> = 'pausemenu_quit_warning' || <base_name> = 'online_quit_warning')
				progression_updatedetailedstatsforgig \{failed_or_practice}
				if (<type> = quickplay)
					if quickplay_set_new_song_in_gig_list
						change \{gameplay_loading_transition = 1}
						change \{gameplay_restart_song = 1}
						change \{net_ready_to_start = 0}
						generic_event_back \{nosound
							state = uistate_gameplay}
					else
						sfx_backgrounds_new_area \{bg_sfx_area = frontend
							fadeintime = 5
							fadeintype = linear
							fadeouttime = 5
							fadeouttype = linear}
						spawnscriptnow \{ui_event
							params = {
								event = menu_replace
								data = {
									state = uistate_song_breakdown
									net_transition_not_career
								}
							}}
					endif
				else
					spawnscriptnow \{ui_event
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
				if (<type> = quickplay)
					if quickplay_set_new_song_in_gig_list
						change \{gameplay_loading_transition = 1}
						change \{gameplay_restart_song = 1}
						change \{net_ready_to_start = 0}
						generic_event_back \{nosound
							state = uistate_gameplay}
					else
						spawnscriptnow \{ui_event
							params = {
								event = menu_change
								data = {
									state = uistate_song_breakdown
									net_transition_not_career
								}
							}}
					endif
				else
					spawnscriptnow \{ui_event
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
		soundevent \{event = audio_crowd_fail}
		spawnscriptnow \{audio_crowd_fail_song_logic}
		one_shot_soundevent \{soundevent = audio_crowd_oneshots_do_nothing}
	else
	endif
	if ($is_network_game)
		spawnscriptnow \{sfx_backgrounds_new_area
			params = {
				bg_sfx_area = frontend
				fadeintime = 5
				fadeintype = linear
				fadeouttime = 5
				fadeouttype = linear
			}}
	endif
	kill_all_achievement_scripts
	killspawnedscript \{name = create_exploding_text}
	destroy_exploding_text \{parent = 'you_rock_physics'}
endscript

script guitar_event_song_exit_pop_unsafe 
	popunsafeforshutdown \{context = net_gameplay}
endscript
gpulog_outputfilename = 'none'

script guitarevent_songwon 
	change \{finished_gig_band_rebuild = 0}
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
			textoutputstart \{filename = 'gpu_complete'}
			textoutputend \{filename = 'gpu_complete'}
		endif
		if ($output_song_stats = 1)
			playlist_getcurrentsong
			formattext textname = filename '%s_stats' s = <current_song> dontassertforchecksums
			textoutputstart filename = <filename>
			textoutput \{text = qs(0x3f02a90c)}
			getplayerinfo \{1
				score}
			formattext textname = text qs(0xfccb1331) s = <score> dontassertforchecksums
			textoutput text = <text>
			getplayerinfo \{1
				notes_hit}
			getplayerinfo \{1
				total_notes}
			formattext textname = text qs(0x26c27108) n = <notes_hit> t = <total_notes> dontassertforchecksums
			textoutput text = <text>
			getplayerinfo \{1
				best_run}
			formattext textname = text qs(0xd67d4308) r = <best_run> dontassertforchecksums
			textoutput text = <text>
			getplayerinfo \{1
				max_notes}
			formattext textname = text qs(0x6bb1c560) m = <max_notes> dontassertforchecksums
			textoutput text = <text>
			getplayerinfo \{1
				base_score}
			formattext textname = text qs(0x26a9ba16) b = <base_score> dontassertforchecksums
			textoutput text = <text>
			if (<base_score> = 0)
				formattext \{textname = text
					qs(0x30357c57)}
			else
				formattext textname = text qs(0xbcc2e990) s = (<score> / <base_score>) dontassertforchecksums
			endif
			textoutput text = <text>
			if (<total_notes> = 0)
				formattext \{textname = text
					qs(0xc8e34ec5)}
			else
				formattext textname = text qs(0x2b87036c) s = ((<notes_hit> / <total_notes>) * 100.0) dontassertforchecksums
			endif
			textoutput text = <text>
			textoutputend output_text filename = <filename>
		endif
	endif
	stopsongstarcalculation
	stop_custom_song
	killspawnedscript \{name = guitar_jam_drum_playback}
	killspawnedscript \{name = jam_input_whammy_spawned}
	jam_stop_all_samples
	jam_deinit_reverb
	restore_player_part_settings
	freeplay_end_of_song
	dynamicadmanagercommand \{func = issuecue
		cue = commitimpressions}
	if ($in_sing_a_long = true)
		if screenelementexists \{id = sing_a_long_container}
			sing_a_long_container :obj_spawnscript \{ui_sing_a_long_back}
			printscriptinfo \{'GuitarEvent_SongWon'
				channel = what}
			return
		else
			scriptassert \{qs(0x61af0381)}
		endif
	endif
	killspawnedscript \{name = guitarevent_songfailed_spawned}
	spawnscriptnow \{guitarevent_songwon_spawned}
endscript
g_just_completed_chapter = 0

script guitarevent_songwon_spawned 
	wait \{1
		gameframe}
	gameevent_songwon
	wait \{1
		gameframe}
	gamemode_gettype
	change \{g_dont_play_win_anim_sfx = 1}
	if ($autotest_on = 1 && $autotest_turbo_mode = 1)
		setslomo \{10.0}
	endif
	playlist_getcurrentsong
	change last_song_played = <current_song>
	if is_current_song_a_jam_session
		<last_song_props> = {}
		get_jam_filename \{type = current}
		addparam structure_name = last_song_props name = filename value = <filename>
		addparam structure_name = last_song_props name = example_song value = <example_song>
		addparam structure_name = last_song_props name = jam_display_name value = <jam_display_name>
		get_song_artist song = <current_song> with_year = 0
		addparam structure_name = last_song_props name = jam_artist_name value = <song_artist>
		change last_jam_song_props = <last_song_props>
	endif
	change \{calibrate_lag_failed_num = 0}
	change \{last_song_failed = none}
	change \{current_song_failed_num = 0}
	songlist_remove_first_song_in_playlist
	<end_session> = 0
	if (<type> = career)
		if playlist_isfinished
			<end_session> = 1
		endif
	elseif (<type> = quickplay)
		if playlist_isfinished
			<end_session> = 1
		endif
	endif
	<career_transformation_encore> = 0
	if (<type> = career)
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
		ui_sfx \{menustate = generic
			uitype = select}
		generic_event_choose \{state = uistate_song_breakdown
			data = {
				for_practice = 1
			}}
		return
	elseif ($game_mode = tutorial)
		if gameispaused
			scriptassert \{'Game paused in tutorial win song script'}
		endif
		if ui_event_exists_in_stack \{name = 'pausemenu'
				above = 'gameplay'}
			scriptassert \{'pausemenu exists in tutorial win song script'}
		endif
		disable_pause
		fadetoblack \{on
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
			change \{g_just_completed_chapter = 0}
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
		change \{g_net_quickplay_show_unlock_screen = 0}
		if ($shutdown_game_for_signin_change_flag = 1)
			return
		endif
		pushunsafeforshutdown \{context = net_gameplay}
		onexitrun \{guitar_event_song_exit_pop_unsafe}
		if ($net_pause = 1)
			net_unpausegh
		endif
	endif
	progression_endcredits_done
	pausegame
	disable_pause
	<special_rush_logic> = 0
	<final_battle> = 0
	<final_battle_change_level> = 0
	if (<type> = career)
		playlist_getcurrentsong
		if structurecontains structure = $g_rush_data <current_song>
			<special_rush_logic> = 1
		elseif quest_progression_is_chapter_finale
			<final_battle> = 1
		endif
	endif
	should_cheer = false
	if ($game_mode = career || $game_mode = quickplay)
		should_cheer = true
	endif
	if ($game_mode = freeplay)
		spawnscriptnow \{audio_crowd_surge_and_sustain_at_end_of_song}
		spawnscriptnow \{audio_crowd_play_short_swell_for_this_venue}
		if freeplay_has_players
			should_cheer = true
		endif
	endif
	if (<should_cheer> = true)
		spawnscriptnow \{audio_crowd_play_cheer_before_explosion}
	endif
	sfx_backgrounds_new_area \{bg_sfx_area = $g_current_crowd_looping_bg_area_good}
	audio_crowd_surge_and_sustain_at_end_of_song
	spawnscriptnow \{audio_gameplay_you_rock_crowd_waiting}
	if (<career_transformation_encore> = 1)
		change \{debug_career_transformations = 0}
	else
		progression_songwon \{async = 1}
		wait \{1
			gameframe}
		if should_update_achievements
			change g_just_completed_chapter = <just_completed>
			song_won_update_achievements
		endif
	endif
	if ($autotest_on = 0)
		if gotparam \{jam_info}
			songwon_writeleaderboardstats song_checksum = <current_song> end_credits = ($end_credits) end_session = <end_session> jam_info = <jam_info>
		else
			songwon_writeleaderboardstats song_checksum = <current_song> end_credits = ($end_credits) end_session = <end_session>
		endif
		wait \{1
			gameframe}
	endif
	friend_update_check_if_cheating
	if (<special_rush_logic> = 0 && <final_battle> = 0)
		should_save = 0
		if (<career_transformation_encore> = 0)
			if (<type> = competitive)
				song_breakdown_shreddfest_determine_order
				getarraysize <order>
				if (<array_size> > 0)
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
					repeat <array_size>
					<num_winners> = <index>
					if (<num_winners> > 1)
						winner_text = qs(0x82663fd9)
					else
						if teammodeequals \{team_mode = two_teams}
							getbandinfo <winner_index> name
							<winner_text> = ($<name>)
							<winner2_text> = qs(0xac712b20)
						else
							<winner_text> = qs(0xebdedfc6)
							getnumplayersingame
							if (<num_players> > 0)
								getfirstplayer
								begin
								if playerinfoequals <player> band = <winner_index>
									break
								endif
								getnextplayer player = <player>
								repeat
								getmaxplayers
								if (<player> > 0 && <player> <= <max_players>)
									if ($is_network_game = 1)
										getplayerinfo <player> gamertag
										<winner_text> = ($<gamertag>)
									else
										ui_song_breakdown_get_player_display_name player_index = <player>
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
			if NOT (<result> = not_targeting_player)
				quickplay_targeting_player_get_opponent_gamertag
				switch <result>
					case success
					<winner_text> = qs(0xab9dbe06)
					formattext textname = gamertag_text qs(0x12dc5a0d) g = <gamertag> e = qs(0x32b9f8e3)
					<winner2_text> = <gamertag_text>
					case fail
					formattext textname = gamertag_text qs(0x6d229984) g = <gamertag> e = qs(0x00000000)
					<winner_text> = <gamertag_text>
					<winner2_text> = qs(0x0affe28f)
					case tie
					winner_text = qs(0x82663fd9)
					removeparameter \{winner2_text}
				endswitch
			endif
			if (<type> != freeplay)
				spawnscriptnow \{waitandkillhighway
					params = {
						fade_out
					}}
				spawnscriptnow \{wait_and_play_you_rock_movie}
				create_mushroomcloudhand text = <winner_text>
				spawnscriptnow \{audio_ui_gameplay_play_you_rock_sfx}
				if ($game_mode = career || $game_mode = quickplay || $game_mode = competitive)
					if NOT musicstudio_mainobj :musicstudio_isinmusicstudio
						<should_save> = 1
						if innetgame
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
		if gotparam \{winner2_text}
			spawnscriptnow create_exploding_text params = {parent = 'you_rock_2_physics' text = <winner2_text> placement = bottom}
		endif
		if ($current_transition = preencore)
			songaudiostop
			unpausegame
			transition_play \{type = preencore}
			songwon_autosave should_save = <should_save>
			songwon_autosave_wait should_save = <should_save>
			transition_wait
			change \{current_transition = none}
			pausegame
			ui_event_get_top
			if (<base_name> = 'controller_disconnect' || <base_name> = 'pausemenu_quit_warning')
				ui_event \{event = menu_replace
					data = {
						state = uistate_song_breakdown
						encore_transition = 1
						no_sound
					}}
			else
				generic_event_choose \{no_sound
					state = uistate_song_breakdown
					data = {
						encore_transition = 1
					}}
			endif
			encore_transition = 1
		else
			played_song_outro = false
			unpausegame
			if ($end_credits = 1)
				transition_play \{type = finalbandoutro}
				songwon_autosave should_save = <should_save>
				songwon_autosave_wait should_save = <should_save>
			else
				gamemode_gettype
				<transition> = songwon
				if (<type> = freeplay)
					if NOT freeplay_has_players
						<transition> = songdoneattract
					else
						<transition> = songwonfreeplay
					endif
				endif
				if (<career_transformation_encore> = 1)
					<transition> = transformationencore
				endif
				transition_play type = <transition>
				songwon_autosave should_save = <should_save>
				get_band_configuration song = <current_song>
				if (<band> = default_band)
					celeb_band = false
				else
					celeb_band = true
				endif
				if (((<type> = career) && (<celeb_band> = false)) || (<type> = quickplay))
					if NOT ui_event_exists_in_stack \{name = 'jam'}
						if (<career_transformation_encore> = 0)
							transition_wait
							transition_play \{type = songoutro}
							played_song_outro = true
						endif
					endif
				endif
				songwon_autosave_wait should_save = <should_save>
			endif
			transition_wait
			change \{current_transition = none}
			if (<played_song_outro> = false)
				cameracuts_setarrayprefix \{prefix = 'cameras_no_band'
					changenow
					transition_time = 5
					extra_params = {
						force_time = 5
					}}
			endif
			pausegame
		endif
	elseif (<special_rush_logic> = 1)
		if playlist_isfinished
			songaudiostop
			unpausegame
			spawnscriptnow \{waitandkillhighway
				params = {
					fade_out
				}}
			wait \{0.5
				seconds}
			songwon_autosave \{should_save = 1}
			songwon_autosave_wait should_save = <should_save>
			use_rush_outro
			transition_play \{type = rushoutro
				use_song_time = 0}
			transition_wait
		else
			unpausegame
			spawnscriptnow \{waitandkillhighway
				params = {
					fade_out
				}}
			wait \{0.5
				seconds}
			pausegame
		endif
		change \{current_transition = none}
		kill_gem_scroller \{type = outro
			kill_cameracuts_iterator}
		if NOT playlist_isfinished
			pausegame
		endif
	else
		if playlist_isfinished
			songaudiostop
			unpausegame
			spawnscriptnow \{waitandkillhighway
				params = {
					fade_out
				}}
			<final_battle_change_level> = 1
		else
			unpausegame
			spawnscriptnow \{waitandkillhighway
				params = {
					fade_out
				}}
			wait \{0.5
				seconds}
			pausegame
			change \{current_transition = none}
			kill_gem_scroller \{type = outro
				kill_cameracuts_iterator}
			pausegame
		endif
	endif
	if (<type> = freeplay)
		if freeplay_should_change_venues
			<previous_venue> = ($current_level)
			quickplay_choose_random_venue \{allow_current_venue = false
				keep_current_if_none_available = true}
			if (<previous_venue> != $current_level)
				freeplay :freeplayuistack_clearnumsongssincevenuechange
				create_loading_screen
			endif
		endif
	endif
	killspawnedscript \{name = create_exploding_text}
	if ($end_credits = 1)
		change \{end_credits = 2}
	endif
	destroy_all_exploding_text
	if ($autotest_on = 1)
		ui_event \{event = menu_change
			data = {
				state = uistate_autotest_next_test
			}}
	endif
	if ($autolaunch_startnow = 1)
		prepare_for_pending_animpaks
		playlist_switchtonextsong \{populate_list = 1}
		change \{gameplay_loading_transition = 1}
		change \{gameplay_restart_song = 1}
		change \{net_ready_to_start = 0}
		generic_event_back \{nosound
			state = uistate_gameplay}
	else
		loading_transition = 0
		gamemode_gettype
		if (<type> = career)
			if NOT playlist_isfinished
				playlist_switchtonextsong
				loading_transition = 1
			endif
		elseif (<type> = quickplay)
			stats_song_checksum = <current_song>
			if quickplay_set_new_song_in_gig_list
				loading_transition = 1
			endif
		elseif ((<type> = pro_faceoff) || (<type> = competitive))
			if quickplay_set_new_song_in_gig_list
				loading_transition = 1
			endif
		elseif (<type> = freeplay)
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
			spawnscriptlater \{final_battle_change_level}
		elseif (<loading_transition> = 1)
			if (<type> = career)
				if scriptisrunning \{gameplay_end_game_spawned}
					return
				endif
			endif
			change \{gameplay_loading_transition = 1}
			change \{gameplay_restart_song = 1}
			change \{net_ready_to_start = 0}
			generic_event_back \{nosound
				state = uistate_gameplay}
		else
			if ($is_network_game = 1 && <type> != career)
				ui_event_get_top
				if (<base_name> = 'controller_disconnect' || <base_name> = 'pausemenu_quit_warning' || <base_name> = 'online_quit_warning')
					if (<type> = quickplay)
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
					if (<type> = quickplay)
						ui_event \{event = menu_change
							data = {
								state = uistate_song_breakdown
								net_transition_not_career
							}}
					else
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
					if ((<type> = pro_faceoff) || (<type> = competitive))
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
					if ui_event_exists_in_stack \{name = 'debug'}
						ui_sfx \{menustate = generic
							uitype = back}
						gman_shutdowngamemodegoal
						generic_event_back \{state = uistate_mainmenu}
					elseif ($game_mode = career)
						if playlist_isfinished
							if ($end_credits = 2)
								progression_getcreditsvenue
								ui_memcard_autosave_all_players \{event = menu_back
									state = uistate_quest_map}
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
					elseif ((<type> = pro_faceoff) || (<type> = competitive))
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
	if ui_event_exists_in_stack \{name = 'gameplay'}
		<event> = menu_back
	endif
	if (<should_save> = 1)
		ui_memcard_autosave_all_players {
			event = <event>
			state = uistate_gameplay
		}
	endif
	return should_save = <should_save>
endscript

script songwon_autosave_wait 
	if (<should_save> = 1)
		old_transition = ($transition_playing)
		begin
		if NOT ui_event_exists_in_stack \{name = 'memcard'}
			if ($g_memcard_ingame_is_paused = 0)
				break
			endif
		endif
		wait \{1
			gameframe}
		printf \{'waiting for autosave to finish'}
		if (<old_transition> = true && $transition_playing = false)
			old_transition = ($transition_playing)
		endif
		repeat
	endif
endscript

script songwon_writeleaderboardstats 
	requireparams \{[
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
						if gotparam \{jam_info}
							agora_write_stats song_checksum = <song_checksum> jam_info = <jam_info>
						else
							agora_write_stats song_checksum = <song_checksum>
						endif
					endif
				else
					if gotparam \{jam_info}
						agora_write_stats song_checksum = <song_checksum> jam_info = <jam_info>
					else
						agora_write_stats song_checksum = <song_checksum>
					endif
				endif
			endif
		endif
	endif
endscript

script kill_you_rock_movie 
	killmovie \{textureslot = 1}
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
	if gotparam \{fade_out}
		gamemode_gettype
		if (<type> = career)
			hide_highway \{fadetime = 1.0
				endofsong}
		else
			set_all_highway_prepass_props \{alpha = 0}
			set_all_highway_props \{alpha = 0
				time = 0.5}
		endif
		wait \{0.5
			seconds}
	endif
	wait \{0.5
		seconds}
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
	array_size = <num_fretbar_notes>
	array_entry = 0
	array_entry2 = 0
	fretbar_count = 0
	change \{next_beat_time = -1}
	change \{time_to_next_beat = -1}
	change \{next_beat_time2 = -1}
	change \{time_to_next_beat2 = -1}
	change tempo_iterator_offset = <time_offset>
	songfilemanager func = get_song_end_time song_name = <song_name>
	begin
	if (<array_size> < 2)
		break
	endif
	<entry> = (<array_size> -2)
	songfilemanager func = get_fretbar_note song_name = <song_name> index = <entry>
	if (<total_end_time> > <fretbar_time>)
		break
	endif
	<array_size> = (<array_size> - 1)
	repeat
	getsongtimems time_offset = <time_offset>
	if NOT (<array_size> = 0)
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
		repeat <array_size>
		final_array_entry = (<array_size> - 1)
		array_size = (<array_size> - <array_entry>)
		if (<array_size> > 0)
			begin
			begin
			songfilemanager func = get_fretbar_note song_name = <song_name> index = <array_entry>
			getsongtimems
			if (<time> >= <fretbar_time>)
				getsongtimems time_offset = <time_offset>
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
					setplayerinfo <player> current_song_beat_time = <current_song_beat_time>
					setplayerinfo <player> current_song_measure_time = (<timesig_num_val> * <current_song_beat_time>)
				endif
				break
			endif
			wait \{1
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
				change next_beat_time = <fretbar_time>
				change time_to_next_beat = ($next_beat_time - <marker>)
				spawn_beat_callbacks \{time_to_next_beat = $time_to_next_beat}
			else
				change \{next_beat_time = -1}
				change \{time_to_next_beat = -1}
			endif
			if (<even> = 1)
				<next_array_entry> = (<array_entry> + 1)
				if (<next_array_entry> < <final_array_entry>)
					songfilemanager func = get_fretbar_note song_name = <song_name> index = <array_entry>
					change next_beat_time2 = <fretbar_time>
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
	addtoplayerinfo <player> sp_phrases_hit = 1
	if (($g_debug_highway_visible) = 0)
		return
	endif
	if isps3
		if NOT ($current_song = jamsession)
			if issingleplayergame
				soundevent \{event = audio_star_power_awarded}
			else
				spawnscriptnow audio_gameplay_star_power_awarded_logic params = {player = <player>}
			endif
		endif
	else
		if issingleplayergame
			soundevent \{event = audio_star_power_awarded}
		else
			spawnscriptnow audio_gameplay_star_power_awarded_logic params = {player = <player>}
		endif
	endif
	formattext checksumname = container_id 'nowbar_container_p%p' p = <player>
	getnowbarscale player = <player>
	player_index = (<player> - 1)
	getarraysize \{$gem_colors}
	inputarraygetelement name = <song> index = <array_entry>
	onexitrun guitarevent_starsequencebonus_exit params = {player = <player> gem_array = <gem_array>}
	destroy_big_bolt {player = <player> gem_array = <gem_array>}
	gem_count = 0
	getnumplayersingame \{on_screen}
	if (<num_players_shown> = 1)
		scale = (6.0, 3.0)
		scale2 = (6.0, 4.0)
	endif
	if (<num_players_shown> = 2)
		scale = (7.2, 3.0)
		scale2 = (7.2, 4.0)
	endif
	if (<num_players_shown> = 3)
		scale = (9.0, 3.0)
		scale2 = (9.0, 4.0)
	endif
	if (<num_players_shown> = 4)
		scale = (11.0, 3.0)
		scale2 = (11.0, 4.0)
	endif
	getplayerinfo <player> star_power_gain_multiplier
	if (<star_power_gain_multiplier> >= 4)
		default_lightning_alpha = 0
		rp_alphalvl1 = 1
		rp_alphalvl2 = 1
		spawnscriptnow newmale_rp_fx params = {player = <player> scale = (2.0, 1.0) pos = (-91.0, -102.0)}
	elseif (<star_power_gain_multiplier> >= 2)
		default_lightning_alpha = 0
		rp_alphalvl1 = 1
		rp_alphalvl2 = 0
		spawnscriptnow newmale_rp_fx params = {player = <player> scale = (1.0, 1.0) pos = (-30.0, -102.0)}
	else
		default_lightning_alpha = 1
		rp_alphalvl1 = 0
		rp_alphalvl2 = 0
	endif
	begin
	<note_value> = (<gem_array> [(<gem_count> + 1)])
	if (<note_value> > 0)
		if (<gem_count> = (<array_size> -1))
			if gotparam \{got_one}
				break
			endif
		else
			got_one = 1
		endif
		color = ($gem_colors [<gem_count>])
		lightning_rgba_01 = [200 255 255 255]
		lightning_rgba_02 = [0 255 255 128]
		lightning_rp_rgba_01 = [200 200 255 255]
		lightning_rp_rgba_02 = [0 128 255 255]
		bolt_dims = (128.0, 48.0)
		if playerinfoequals <player> lefthanded_button_ups = 1
			<pos2d> = (($button_up_models [<player_index>]).<color>.left_pos_2d)
			<angle> = ((($button_models [<player_index>]).<color>.angle) + 90)
			<angle2> = ((($button_models [<player_index>]).<color>.angle) + 80)
		else
			<pos2d> = (($button_up_models [<player_index>]).<color>.pos_2d)
			<angle> = ((($button_models [<player_index>]).<color>.left_angle) + 90)
			<angle2> = ((($button_models [<player_index>]).<color>.left_angle) + 80)
		endif
		formattext checksumname = bolt_cont 'big_boltp%p%e' p = <player> e = <gem_count> addtostringlookup = true
		if NOT screenelementexists id = <bolt_cont>
			createscreenelement {
				type = containerelement
				id = <bolt_cont>
				parent = <container_id>
				pos = <pos2d>
				rot_angle = <angle>
				alpha = 1
				scale = (1.0, 1.0)
				just = [center bottom]
				z_priority = 16
				dims = (32.0, 32.0)
			}
			createscreenelement {
				type = spriteelement
				parent = <bolt_cont>
				material = mat_lightning_arc_anim01
				rgba = <lightning_rgba_01>
				rot_angle = 0
				scale = <scale>
				just = [right center]
				z_priority = 16
				alpha = <default_lightning_alpha>
				dims = <bolt_dims>
			}
			bolt1 = <id>
			createscreenelement {
				type = spriteelement
				parent = <bolt_cont>
				material = mat_lightning_arc_anim02
				rgba = <lightning_rgba_02>
				pos = (0.0, 0.0)
				rot_angle = 0
				scale = <scale>
				just = [right center]
				z_priority = 16
				alpha = <default_lightning_alpha>
				dims = <bolt_dims>
			}
			bolt2 = <id>
			createscreenelement {
				type = spriteelement
				parent = <bolt_cont>
				material = mat_lightning_arc_anim01
				rgba = <lightning_rp_rgba_01>
				rot_angle = 0
				scale = <scale2>
				just = [1.0 , 0.3]
				z_priority = 16
				alpha = <rp_alphalvl1>
				dims = <bolt_dims>
			}
			bolt3 = <id>
			createscreenelement {
				type = spriteelement
				parent = <bolt_cont>
				material = mat_lightning_arc_anim02
				rgba = <lightning_rp_rgba_02>
				pos = (0.0, 0.0)
				rot_angle = 0
				scale = <scale2>
				just = [1.0 , 0.3]
				z_priority = 16
				alpha = <rp_alphalvl1>
				dims = <bolt_dims>
			}
			bolt4 = <id>
			createscreenelement {
				type = spriteelement
				parent = <bolt_cont>
				material = mat_lightning_arc_anim03
				rgba = <lightning_rp_rgba_01>
				rot_angle = 180
				scale = <scale>
				just = [left bottom]
				z_priority = 16
				alpha = <rp_alphalvl2>
				dims = <bolt_dims>
			}
			bolt5 = <id>
			createscreenelement {
				type = spriteelement
				parent = <bolt_cont>
				material = mat_lightning_arc_anim04
				rgba = <lightning_rp_rgba_02>
				pos = (0.0, 0.0)
				rot_angle = 180
				scale = <scale>
				just = [left bottom]
				z_priority = 16
				alpha = <rp_alphalvl2>
				dims = <bolt_dims>
			}
			bolt6 = <id>
		endif
		formattext checksumname = nameh 'big_bolt_hitp%p%e' p = <player> e = <gem_count> addtostringlookup = true
		if NOT screenelementexists id = <nameh>
			createscreenelement {
				type = spriteelement
				id = <nameh>
				parent = <container_id>
				material = mat_sp_xplosion1
				rgba = [255 255 255 255]
				pos = <pos2d>
				rot_angle = 0
				scale = (2.0, 2.0)
				just = [center bottom]
				z_priority = 16
			}
		endif
		formattext checksumname = fx_id 'big_bolt_particlep%p%e' p = <player> e = <gem_count> addtostringlookup = true
		destroy2dparticlesystem id = <fx_id>
		<particle_pos> = <pos2d>
		<particle_pos> = ((((<particle_pos> [0]) * <nowbar_x_scale>) * (1.0, 0.0)) + ((((<particle_pos> [1]) * <nowbar_y_scale>)) * (0.0, 1.0)))
		formattext checksumname = hwy 'highway_containerp%p' p = <player>
		if NOT objectexists id = <fx_id>
			if (($g_debug_highway_visible) = 1)
				create2dparticlesystem {
					id = <fx_id>
					pos = <particle_pos>
					z_priority = 8.0
					material = sys_particle_star01_sys_particle_star01
					parent = <container_id>
					start_color = [0 128 255 255]
					end_color = [0 128 128 0]
					start_scale = (0.25, 0.25)
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
		endif
		formattext checksumname = fx2_id 'big_bolt_particle2p%p%e' p = <player> e = <gem_count> addtostringlookup = true
		<particle_pos> = <pos2d>
		<particle_pos> = ((((<particle_pos> [0]) * <nowbar_x_scale>) * (1.0, 0.0)) + ((((<particle_pos> [1]) * <nowbar_y_scale>)) * (0.0, 1.0)))
		if NOT objectexists id = <fx2_id>
			if (($g_debug_highway_visible) = 1)
				create2dparticlesystem {
					id = <fx2_id>
					pos = <particle_pos>
					z_priority = 8.0
					material = mat_star03
					parent = <container_id>
					start_color = [255 255 255 128]
					end_color = [128 128 128 0]
					start_scale = (0.125, 0.125)
					end_scale = (0.15, 0.15)
					start_angle_spread = 360.0
					min_rotation = -120.0
					max_rotation = 508.0
					emit_start_radius = 0.0
					emit_radius = 2.0
					emit_rate = 0.07
					emit_dir = 0.0
					emit_spread = 28.0
					velocity = 12.0
					friction = (0.0, 33.0)
					time = 1.0
				}
			endif
		endif
		formattext checksumname = fx3_id 'big_bolt_particle3p%p%e' p = <player> e = <gem_count> addtostringlookup = true
		<particle_pos> = <pos2d>
		<particle_pos> = (<particle_pos> - (0.0, 15.0))
		<particle_pos> = ((((<particle_pos> [0]) * <nowbar_x_scale>) * (1.0, 0.0)) + ((((<particle_pos> [1]) * <nowbar_y_scale>)) * (0.0, 1.0)))
		if NOT objectexists id = <fx3_id>
			if (($g_debug_highway_visible) = 1)
				create2dparticlesystem {
					id = <fx3_id>
					pos = <particle_pos>
					z_priority = 8.0
					material = sys_particle_lnzflare02_sys_particle_lnzflare02
					parent = <container_id>
					start_color = [255 255 255 255]
					end_color = [0 255 255 0]
					start_scale = (0.5, 0.5)
					end_scale = (0.05, 0.05)
					start_angle_spread = 360.0
					min_rotation = -500.0
					max_rotation = 500.0
					emit_start_radius = 0.0
					emit_radius = 2.0
					emit_rate = 0.05
					emit_dir = 0.0
					emit_spread = 180.0
					velocity = 12.0
					friction = (0.0, 12.0)
					time = 0.5
				}
			endif
		endif
	endif
	gem_count = (<gem_count> + 1)
	repeat <array_size>
	wait \{$star_power_bolt_time
		seconds}
	destroy_big_bolt {player = <player> gem_array = <gem_array> kill_when_empty = kill_when_empty}
	onexitrun \{nullscript}
endscript

script guitarevent_starsequencebonus_exit 
	printf \{'GuitarEvent_StarSequenceBonus_Exit'}
	destroy_big_bolt {player = <player> gem_array = <gem_array> kill_when_empty = kill_when_empty}
endscript

script destroy_big_bolt 
	gem_count = 0
	getarraysize \{$gem_colors}
	begin
	<note_value> = (<gem_array> [(<gem_count> + 1)])
	if (<note_value> > 0)
		formattext checksumname = bolt_cont 'big_boltp%p%e' p = <player> e = <gem_count> addtostringlookup = true
		destroyscreenelement id = <bolt_cont>
		formattext checksumname = fx_id 'big_bolt_particlep%p%e' p = <player> e = <gem_count> addtostringlookup = true
		formattext checksumname = fx2_id 'big_bolt_particle2p%p%e' p = <player> e = <gem_count> addtostringlookup = true
		formattext checksumname = fx3_id 'big_bolt_particle3p%p%e' p = <player> e = <gem_count> addtostringlookup = true
		destroy2dparticlesystem id = <fx_id> <kill_when_empty>
		destroy2dparticlesystem id = <fx2_id> <kill_when_empty>
		destroy2dparticlesystem id = <fx3_id> <kill_when_empty>
		formattext checksumname = nameh 'big_bolt_hitp%p%e' p = <player> e = <gem_count> addtostringlookup = true
		destroyscreenelement id = <nameh>
	endif
	gem_count = (<gem_count> + 1)
	repeat <array_size>
endscript

script destroy_all_big_bolts 
	getarraysize \{$gem_colors}
	player = 0
	begin
	gem_count = 0
	begin
	formattext checksumname = name 'big_boltp%p%e' p = <player> e = <gem_count> addtostringlookup = true
	destroyscreenelement id = <name>
	formattext checksumname = fx_id 'big_bolt_particlep%p%e' p = <player> e = <gem_count> addtostringlookup = true
	formattext checksumname = fx2_id 'big_bolt_particle2p%p%e' p = <player> e = <gem_count> addtostringlookup = true
	formattext checksumname = fx3_id 'big_bolt_particle3p%p%e' p = <player> e = <gem_count> addtostringlookup = true
	destroy2dparticlesystem id = <fx_id>
	destroy2dparticlesystem id = <fx2_id>
	destroy2dparticlesystem id = <fx3_id>
	formattext checksumname = nameh 'big_bolt_hitp%p%e' p = <player> e = <gem_count> addtostringlookup = true
	destroyscreenelement id = <nameh>
	gem_count = (<gem_count> + 1)
	repeat <array_size>
	player = (<player> + 1)
	repeat 4
endscript

script guitarevent_multiplier4xoff 
	soundevent \{event = audio_ui_gameplay_lose_multiplier_4x}
	spawnscriptnow highway_pulse_multiplier_loss params = {player = <player> multiplier = 4}
endscript

script guitarevent_multiplier3xoff 
	soundevent \{event = audio_ui_gameplay_lose_multiplier_3x}
	spawnscriptnow highway_pulse_multiplier_loss params = {player = <player> multiplier = 3}
endscript

script guitarevent_multiplier2xoff 
	soundevent \{event = audio_ui_gameplay_lose_multiplier_2x}
	spawnscriptnow highway_pulse_multiplier_loss params = {player = <player> multiplier = 2}
endscript

script guitarevent_killsong \{loadingtransition = 0}
	audio_gameplay_stop_sounds_for_killsong <...> loading_transition = <loading_transition>
endscript

script guitarevent_venueenter 
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

script guitarevent_venueexit 
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
		<pos> = (255.0, 170.0)
	else
		<pos> = (66.0, 20.0)
	endif
	destroyscreenelement id = <fx_id>
	createscreenelement {
		type = spriteelement
		parent = <gem_id>
		id = <fx_id>
		scale = (1.0, 1.0)
		pos = <pos>
		material = sys_particle_lnzflare02_sys_particle_lnzflare02
		z_priority = 18
		rgba = [255 255 255 255]
	}
	spawnscriptnow destroy_first_gem_fx params = {gem_id = <gem_id> fx_id = <fx_id>}
	wait \{0.8
		seconds}
	destroyscreenelement id = <fx_id>
endscript

script destroy_first_gem_fx 
	begin
	if NOT screenelementexists id = <gem_id>
		destroyscreenelement id = <fx_id>
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script guitarevent_gemstarpoweron 
endscript

script guitarevent_transitionintro 
endscript

script guitarevent_transitionfastintro 
endscript

script guitarevent_transitionpreencore 
endscript

script guitarevent_transitionencore 
endscript
kick_index = 0

script guitarevent_kick_drum_hit_note \{player = 1
		kill_when_empty = 0}
	changeglobalinteger global_name = kick_index new_value = ($kick_index + 1)
	if ($kick_index > 1024)
		changeglobalinteger \{global_name = kick_index
			new_value = 0}
	endif
	extended_checksum = null
	getplayerchecksum player = <player> checksum = part
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
	getplayerinteger player = <player> checksum = star_power_used
	<star_power_used> = <integer_value>
	if (<star_power_used> = 1)
		<start_color1> = [200 255 255 255]
		<end_color1> = [0 128 128 0]
		<start_color2> = [200 255 255 255]
		<end_color2> = [0 128 128 0]
	endif
	<highway_info> = ($highway_pos_table [<player> -1])
	x_scale = 0.0
	<x_scale> = ((<highway_info>.highway_top_width + (<highway_info>.highway_top_width * <highway_info>.widthoffsetfactor)) / 32.0)
	extendcrcwithinteger checksum = highway_containerp integer = <player>
	container_id = <extended_checksum>
	getnowbarscale player = <player>
	<x_scale> = (<x_scale> * <nowbar_x_scale>)
	waitonegameframe
	<particle_pos> = (0.0, 630.0)
	extendcrcwithinteger checksum = kick_particlep integer = <player>
	extendcrcwithinteger checksum = <extended_checksum> integer = $kick_index
	fx_id = <extended_checksum>
	<start_scale> = (<x_scale> * (1.0, 0.0) + (0.0, 0.25))
	<end_scale> = (<x_scale> * (1.875, 0.0) + (0.0, 0.5))
	create2dparticlesystem {
		id = <fx_id>
		pos = <particle_pos>
		z_priority = 7.9
		material = mat_particle_kickhit_ring01
		parent = <container_id>
		start_color = <start_color1>
		end_color = <end_color1>
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
	getplayerchecksum player = <player> checksum = part
	<part> = <checksum_value>
	if (<part> = drum)
		getplayerinteger player = <player> checksum = four_lane_highway
		<four_lane_highway> = <integer_value>
	else
		<four_lane_highway> = 0
	endif
	if (<four_lane_highway> = 1)
		extendcrcwithinteger checksum = kick_particle2p integer = <player>
		extendcrcwithinteger checksum = <extended_checksum> integer = $kick_index
		fx2_id = <extended_checksum>
		<start_scale> = (<x_scale> * (0.5, 0.0) + (0.0, 0.15))
		<end_scale> = (<x_scale> * (0.5, 0.0) + (0.0, 0.5))
		create2dparticlesystem {
			id = <fx2_id>
			pos = <particle_pos>
			z_priority = 8.0
			material = mat_particle_kickhit_4l
			parent = <container_id>
			start_color = <start_color2>
			end_color = <end_color2>
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
		waitgameframes \{num_game_frames = 11}
		fastdestroy2dparticlesystem id = <fx_id> kill_when_empty = <kill_when_empty>
		fastdestroy2dparticlesystem id = <fx2_id> kill_when_empty = <kill_when_empty>
	else
		extendcrcwithinteger checksum = kick_particle2p integer = <player>
		extendcrcwithinteger checksum = <extended_checksum> integer = $kick_index
		fx2_id = <extended_checksum>
		<start_scale> = (<x_scale> * (0.5, 0.0) + (0.0, 0.15))
		<end_scale> = (<x_scale> * (0.5, 0.0) + (0.0, 0.5))
		create2dparticlesystem {
			id = <fx2_id>
			pos = <particle_pos>
			z_priority = 8.0
			material = mat_particle_kickhit_5l
			parent = <container_id>
			start_color = <start_color2>
			end_color = <end_color2>
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
		waitgameframes \{num_game_frames = 11}
		fastdestroy2dparticlesystem id = <fx_id> kill_when_empty = <kill_when_empty>
		fastdestroy2dparticlesystem id = <fx2_id> kill_when_empty = <kill_when_empty>
	endif
endscript

script guitarevent_open_note_sustain \{player = 1
		kill_when_empty = 0}
	getplayerchecksum player = <player> checksum = part
	<part> = <checksum_value>
	if (<part> != bass)
		return
	endif
	<highway_info> = ($highway_pos_table [<player> -1])
	x_scale = 0.0
	<x_scale> = ((<highway_info>.highway_top_width + (<highway_info>.highway_top_width * <highway_info>.widthoffsetfactor)) / 32.0)
	formattext checksumname = container_id 'nowbar_container_p%p' p = <player>
	getnowbarscale player = <player>
	<x_scale> = (<x_scale> * <nowbar_x_scale>)
	getplayerinfo <player> star_power_used
	if (<star_power_used> = 1)
		<start_color> = [128 255 255 255]
		<end_color> = [0 128 128 0]
	else
		<start_color> = [255 128 255 255]
		<end_color> = [255 0 255 0]
	endif
	<particle_pos> = (0.0, 630.0)
	formattext checksumname = open_note_sustain_fx_cont01 'Open_Note_Sustain_FX_Cont_p%p' p = <player>
	createscreenelement {
		type = containerelement
		parent = <container_id>
		id = <open_note_sustain_fx_cont01>
		alpha = 1
		pos = <particle_pos>
		scale = (1.0, 1.0)
		rot_angle = 0
		z_priority = 0
		just = [center , center]
		pos_anchor = [center , center]
		preserve_local_orientation = true
	}
	<start_scale> = (<x_scale> * (0.5, 0.0) + (0.0, 0.15))
	<end_scale> = (<x_scale> * (0.5, 0.0) + (0.0, 0.5))
	create2dparticlesystem {
		id = <fx1_id>
		pos = (0.0, 0.0)
		z_priority = 8.0
		material = mat_particle_kickhit_5l
		parent = <open_note_sustain_fx_cont01>
		start_color = <start_color>
		end_color = <end_color>
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
endscript

script cleanup_open_note_sustain_fx 
	formattext checksumname = open_note_sustain_fx_cont01 'Open_Note_Sustain_FX_Cont_p%p' p = <player>
	destroyscreenelement id = <open_note_sustain_fx_cont01>
endscript

script guitarevent_hit_open_note 
	guitarevent_kick_drum_hit_note player = <player>
endscript

script guitarevent_hit_beginner_note 
	guitarevent_kick_drum_hit_note player = <player>
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
	if playerinfoequals <player> part = drum
		if gotparam \{include_drums}
			setalldrumstates player = <player> volume = <volume>
		endif
	else
		setplayerinfo <player> guitar_volume = <volume>
		updateguitarvolume
	endif
endscript

script playergetvolume 
	if playerinfoequals <player> part = drum
		if gotparam \{drum}
			switch <drum>
				case 1
				getplayerinfo <player> drum_volume1
				return volume = <drum_volume1>
				case 2
				getplayerinfo <player> drum_volume2
				return volume = <drum_volume2>
				case 3
				getplayerinfo <player> drum_volume3
				return volume = <drum_volume3>
				case 4
				getplayerinfo <player> drum_volume4
				return volume = <drum_volume4>
			endswitch
		endif
	endif
	getplayerinfo <player> guitar_volume
	return volume = <guitar_volume>
endscript

script create_mushroomcloudhand \{text = qs(0x6f6d143d)}
	killspawnedscript \{name = create_exploding_text}
	destroy_all_exploding_text
	spawnscriptnow create_exploding_text params = {text = <text>}
endscript

script hot_start_achieved \{band = 0}
	return
	gamemode_gettype
	if (<type> = practice)
		return
	endif
	getnumplayersingame
	if (<player> = 1)
		printf \{channel = sfx
			qs(0x3f8e0b79)}
		if issingleplayergame
			pos = (640.0, 211.0)
			<base_scale> = 1.0
		elseif ($game_mode = career || ($game_mode = quickplay && <num_players> = 2))
			pos = (640.0, 170.0)
			<base_scale> = 1.0
		else
			<s> = 0.35000002
			pos = (415.0, 170.0)
		endif
	else
		printf \{channel = sfx
			qs(0xa30807c8)}
		if ($game_mode = career || ($game_mode = quickplay && <num_players> = 2))
			pos = (640.0, 170.0)
			<base_scale> = 1.0
		else
			<s> = 0.35000002
			pos = (865.0, 170.0)
		endif
	endif
	if NOT gamemode_isbandscoring
		getplayerinfo <player> part
		if (<part> = vocals)
			vocals_message_delayed {player = <player> text = qs(0x09a07a71) rgba = [255 172 64 255]}
		else
			hud_create_message player = <player> text = qs(0x09a07a71)
		endif
	elseif (<band> = 1)
		array = []
		getnumplayersingame
		if (<num_players> > 0)
			getfirstplayer
			begin
			addarrayelement array = <array> element = <player>
			getnextplayer player = <player>
			repeat <num_players>
		endif
		getarraysize array = <array>
		if (<array_size> > 0)
			hud_create_message band text = qs(0x09a07a71) style_script = hud_message_band_streak_style style_script_params = {players = <array>}
		endif
	endif
endscript

script hud_animate_star_meter_flames 
	spawnscriptnow \{son_of_hud_animate_star_meter_flames}
endscript

script son_of_hud_animate_star_meter_flames 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	wait \{0.3
		seconds}
	if NOT screenelementexists \{id = hud_star_meter_id}
		return
	endif
	id = hud_star_meter_id
	if NOT <id> :desc_resolvealias name = alias_star_earn_fx param = parent_cont
		return
	endif
	colorin = [255 200 0 255]
	colorout = [0 0 0 255]
	destroyscreenelement \{id = star_meter_counter_glow01}
	destroyscreenelement \{id = star_meter_counter_glow02}
	if NOT screenelementexists id = <parent_cont>
		return
	endif
	createscreenelement {
		type = spriteelement
		id = star_meter_counter_glow01
		parent = <parent_cont>
		material = mat_meter_wibble_glow
		rgba = [255 200 64 255]
		alpha = 0
		dims = (228.0, 228.0)
		pos = (0.0, 0.0)
		scale = (1.0, 1.0)
		rot_angle = 0
		just = [center center]
		pos_anchor = [center center]
		z_priority = 12
	}
	createscreenelement {
		type = spriteelement
		id = star_meter_counter_glow02
		parent = <parent_cont>
		material = mat_meter_wibble_glow
		rgba = [255 200 64 255]
		alpha = 0
		dims = (128.0, 128.0)
		pos = (0.0, 0.0)
		scale = (1.0, 1.0)
		rot_angle = 0
		just = [center center]
		pos_anchor = [center center]
		z_priority = 13
	}
	create2dparticlesystem {
		pos = (0.0, 0.0)
		z_priority = 12
		material = sys_particle_lnzflare02_sys_particle_lnzflare02
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
		emit_rate = 0.00151
		emit_dir = 0.0
		emit_spread = 360.0
		velocity = 12.1
		friction = (0.0, 24.0)
		time = 0.1
	}
	<rp_fx01> = <id>
	create2dparticlesystem {
		parent = <parent_cont>
		pos = (0.0, 0.0)
		z_priority = 11.0
		material = sys_particle_spark01_sys_particle_spark01
		start_color = <colorin>
		end_color = [255 255 255 0]
		start_scale = (0.5, 0.5)
		end_scale = (1.5, 1.5)
		start_angle_spread = 360.0
		min_rotation = 0
		max_rotation = 360
		emit_start_radius = 10
		emit_radius = 0.5
		emit_rate = 0.005
		emit_dir = 0.0
		emit_spread = 360.0
		velocity = 4
		friction = (-3.01, 12.0)
		time = 0.25
	}
	<rp_fx02> = <id>
	create2dparticlesystem {
		parent = <parent_cont>
		pos = (0.0, 0.0)
		z_priority = -1.0
		material = sys_particle_spark01_sys_particle_spark01
		start_color = [255 255 255 255]
		end_color = <colorout>
		start_scale = (1.5, 1.5)
		end_scale = (5.5, 0.15)
		start_angle_spread = 360.0
		min_rotation = 0
		max_rotation = 360
		emit_start_radius = 10
		emit_radius = 0.5
		emit_rate = 0.01
		emit_dir = 0.0
		emit_spread = 360.0
		velocity = 4
		friction = (0.0, 0.0)
		time = 0.15
	}
	<rp_fx03> = <id>
	wait \{0.1
		second}
	if NOT ($calibrate_lag_enabled = 1)
		soundevent \{event = audio_powers_star_acquire}
	endif
	destroy2dparticlesystem kill_when_empty id = <rp_fx01>
	if screenelementexists \{id = star_meter_counter_glow01}
		star_meter_counter_glow01 :se_setprops \{alpha = 1
			time = 0.1}
		star_meter_counter_glow02 :se_setprops \{alpha = 1
			time = 0.1}
	endif
	wait \{0.1
		second}
	if screenelementexists \{id = star_meter_counter_glow01}
		star_meter_counter_glow01 :se_setprops \{alpha = 0
			time = 0.3}
		star_meter_counter_glow02 :se_setprops \{alpha = 0
			time = 0.3}
	endif
	wait \{0.3
		seconds}
	destroyscreenelement \{id = star_meter_counter_glow01}
	destroy2dparticlesystem id = <rp_fx02> kill_when_empty
	destroy2dparticlesystem id = <rp_fx03> kill_when_empty
endscript
