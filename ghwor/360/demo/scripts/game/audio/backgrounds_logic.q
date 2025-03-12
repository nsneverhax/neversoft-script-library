
script sfx_backgrounds_new_area \{immediate = 0
		fadeintime = 3
		fadeouttime = 3
		fadeouttype = log_slow
		fadeintype = log_fast
		volpercentincrease = 0
		loading_transition = 0
		restarting = 0}
	change sfx_background_last_area = <bg_sfx_area>
	if (<immediate> = 0)
		wait \{1
			gameframe}
	endif
	gamemode_gettype
	if (<type> = freeplay)
		if (<bg_sfx_area> = frontend)
			change sfx_background_requested_area = <bg_sfx_area>
		else
			change \{sfx_background_requested_area = $g_current_crowd_looping_bg_area_good}
		endif
	else
		change sfx_background_requested_area = <bg_sfx_area>
	endif
	check_for_specific_bgs_in_struct
	spawnscriptnow skate8_sfx_background_play params = {volpercentincrease = <volpercentincrease> fadeintime = <fadeintime> fadeouttime = <fadeouttime> fadeouttype = <fadeouttype> fadeintype = <fadeintype> loading_transition = <loading_transition> restarting = <restarting>}
endscript

script skate8_sfx_request_background_area_change 
	change sfx_background_requested_area = <bg_sfx_area>
endscript
sfx_background_last_area = `default`
sfx_background_requested_area = `default`
sfx_background_requested_checksum = `default`
sfx_background_requested_volume = 60
sfx_background_current_area = `default`
sfx_background_current_checksum = `default`
sfx_background_current_volume = 100
sfx_background_previous_area = `default`
sfx_background_previous_checksum = `default`
sfx_background_fadein_area = `default`
sfx_background_fadein_checksum = `default`
sfx_background_fadein_volume_start = 1.0
sfx_background_fadein_volume_target = 100.0
sfx_background_fadein_volume_current = 1.0
sfx_background_fadein_volume_add = 3.0
sfx_background_fadingout_area = `default`
sfx_background_fadingout_checksum = `default`
sfx_background_fadeout_volume_start = 100.0
sfx_background_fadeout_volume_target = 0.0
sfx_background_fadeout_volume_current = 100.0
sfx_background_fadeout_volume_subtract = 3.0
sfx_background_crossfade_time = 0.75
background_crossfade_gameframes = 90
backgrounds_master_volume = 50.0
pleasedocrossfade = 1
sfx_background_is_crossfading = false
currentlyplayingoneshotsoundevent = audio_crowd_oneshots_do_nothing
currentoneshotwaittime = 15

script check_for_specific_bgs_in_struct 
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	local_var_struct = ($sfx_background_requested_area)
	if structurecontains structure = $skate8_sfx_background_areas_and_states <local_var_struct>
		check_for_tod_bgs_in_struct <...>
	else
	endif
endscript

script check_for_tod_bgs_in_struct 
	<current_time> = day
	this_current_tod_name = <current_time>
	if structurecontains structure = ($skate8_sfx_background_areas_and_states.<local_var_struct>) <this_current_tod_name>
		change sfx_background_requested_checksum = ($skate8_sfx_background_areas_and_states.<local_var_struct>.<this_current_tod_name>)
	else
		if structurecontains structure = ($skate8_sfx_background_areas_and_states.<local_var_struct>) afternoon
			change sfx_background_requested_checksum = ($skate8_sfx_background_areas_and_states.<local_var_struct>.afternoon)
		else
			if structurecontains structure = ($skate8_sfx_background_areas_and_states.<local_var_struct>) `default`
				change sfx_background_requested_checksum = ($skate8_sfx_background_areas_and_states.<local_var_struct>.`default`)
			else
			endif
		endif
	endif
endscript

script skate8_sfx_background_play \{crossfadetime = 0.7
		volpercentincrease = 0
		fadeintime = 0
		fadeouttime = 0
		fadeouttype = log_fast
		fadeintype = log_fast
		newvolumepercent = 100
		loading_transition = 0
		restarting = 0}
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	wait \{2
		gameframes}
	change sfx_background_fadein_area = ($sfx_background_requested_area)
	change sfx_background_fadein_checksum = ($sfx_background_requested_checksum)
	change sfx_background_fadingout_area = ($sfx_background_current_area)
	change sfx_background_fadingout_checksum = ($sfx_background_current_checksum)
	local_var_struct_fadein_area = ($sfx_background_fadein_area)
	local_var_struct_fadein_checksum = ($sfx_background_fadein_checksum)
	local_var_struct_fadeout_area = ($sfx_background_fadingout_area)
	local_var_struct_fadeout_checksum = ($sfx_background_fadingout_checksum)
	change \{sfx_background_crossfade_time = 0.75}
	printf channel = sfx qs(0x4cfc579c) s = <local_var_struct_fadein_area>
	if structurecontains structure = ($skate8_sfx_background_areas_and_states.<local_var_struct_fadein_area>) fade_from
		if structurecontains structure = ($skate8_sfx_background_areas_and_states.<local_var_struct_fadein_area>.fade_from) <local_var_struct_fadeout_area>
			change sfx_background_crossfade_time = ($skate8_sfx_background_areas_and_states.<local_var_struct_fadein_area>.fade_from.<local_var_struct_fadeout_area>)
		endif
	endif
	if (<fadeintime> = 0)
		fadeintime = $sfx_background_crossfade_time
	endif
	if (<fadeouttime> = 0)
		fadeouttime = $sfx_background_crossfade_time
	endif
	change \{sfx_background_fadein_volume_target = 100}
	if structurecontains structure = ($skate8_sfx_background_areas_and_states.<local_var_struct_fadein_area>) volume_params
		if structurecontains structure = ($skate8_sfx_background_areas_and_states.<local_var_struct_fadein_area>.volume_params) <local_var_struct_fadein_checksum>
			change sfx_background_fadein_volume_target = ($skate8_sfx_background_areas_and_states.<local_var_struct_fadein_area>.volume_params.<local_var_struct_fadein_checksum>)
		endif
	endif
	if (<volpercentincrease> = 0)
		newvolumepercent = $sfx_background_fadein_volume_target
	else
		newvolumepercent = ($sfx_background_fadein_volume_target + <volpercentincrease>)
	endif
	appendsuffixtochecksum base = ($sfx_background_current_checksum) suffixstring = '_FT'
	frontchecksumname = <appended_id>
	appendsuffixtochecksum base = ($sfx_background_current_checksum) suffixstring = '_BK'
	backchecksumname = <appended_id>
	if NOT ($sfx_background_current_checksum = $sfx_background_requested_checksum)
		backgrounds_shared_logic new_fade_time = <fadeouttime> new_fade_type = <fadeouttype> <...>
		playsound <frontchecksumname> vol_percent = <newvolumepercent> pan1x = -1 pan1y = 1 pan2x = 1 pan2y = 1 priority = 105 buss = crowd_beds attack_length = <fadeintime> decay_length = 0 release_length = 0 attack_function = <fadeintype> num_loops = -1
		if NOT ($g_crowd_in_jam_mode_song_state = 1)
			playsound <backchecksumname> vol_percent = <newvolumepercent> pan1x = -1 pan1y = -1 pan2x = 1 pan2y = -1 priority = 100 buss = crowd_beds attack_length = <fadeintime> decay_length = 0 release_length = 0 attack_function = <fadeintype> num_loops = -1
		else
		endif
	else
		if issoundplaying <frontchecksumname>
			setsoundparams <frontchecksumname> vol_percent = <newvolumepercent> time = <fadeintime> fade_type = <fadeouttype>
		else
			playsound <frontchecksumname> vol_percent = <newvolumepercent> pan1x = -1 pan1y = 1 pan2x = 1 pan2y = 1 priority = 105 buss = crowd_beds attack_length = <fadeintime> decay_length = 0 release_length = 0 attack_function = <fadeintype> num_loops = -1
		endif
		if issoundplaying <backchecksumname>
			setsoundparams <backchecksumname> vol_percent = <newvolumepercent> time = <fadeintime> fade_type = <fadeouttype>
		else
			playsound <backchecksumname> vol_percent = <newvolumepercent> pan1x = -1 pan1y = -1 pan2x = 1 pan2y = -1 priority = 100 buss = crowd_beds attack_length = <fadeintime> decay_length = 0 release_length = 0 attack_function = <fadeintype> num_loops = -1
		endif
	endif
	if ($current_playing_transition = loading)
		if NOT ($sfx_background_requested_checksum = silence_front_end_crowd_loop)
			spawnscriptnow \{audio_crowd_kill_surging_scripts}
		endif
	else
		if ($g_crowd_transition_start_of_song_normal = 1)
			if NOT ($sfx_background_requested_checksum = silence_front_end_crowd_loop)
				change \{g_crowd_transition_start_of_song_normal = 0}
				if scriptexists \{audio_crowd_loading_whistle}
					killspawnedscript \{name = audio_crowd_loading_whistle}
				endif
				if scriptexists \{crowd_loading_surge}
					killspawnedscript \{name = crowd_loading_surge}
				endif
			endif
		endif
	endif
	if ($backgroundsfxdebugprinttoscreen = 1)
		formattext textname = my_text qs(0xc87eafca) n = ($sfx_background_requested_checksum) dontassertforchecksums
		create_panel_message {text = <my_text>
			pos = (300.0, 30.0)
			rgba = [255 255 255 255]
			font_face = fontgrid_text_a3
			time = 180000
			just = [left left]
			id = sfx_bg_panel_message
		}
	endif
	change sfx_background_current_area = ($sfx_background_requested_area)
	change sfx_background_current_checksum = ($sfx_background_requested_checksum)
	change \{sfx_background_requested_checksum = `default`}
endscript

script backgrounds_shared_logic \{new_fade_time = 3
		new_fade_type = log_slow}
	stopsound <frontchecksumname> fade_time = <new_fade_time> fade_type = <new_fade_type>
	stopsound <backchecksumname> fade_time = <new_fade_time> fade_type = <new_fade_type>
	appendsuffixtochecksum base = ($sfx_background_requested_checksum) suffixstring = '_FT'
	frontchecksumname = <appended_id>
	appendsuffixtochecksum base = ($sfx_background_requested_checksum) suffixstring = '_BK'
	backchecksumname = <appended_id>
	return <...>
endscript

script one_shot_soundevent \{waittime = 15
		immediate = 0}
	if gotparam \{soundevent}
		requestedsoundevent = <soundevent>
	else
		requestedsoundevent = audio_crowd_oneshots_do_nothing
	endif
	localcurrentlyplaying = $currentlyplayingoneshotsoundevent
	if (<localcurrentlyplaying> = <requestedsoundevent>)
		if NOT ($currentoneshotwaittime = <waittime>)
			doactualchangeingofoneshots <...>
		endif
	else
		doactualchangeingofoneshots <...>
	endif
endscript

script doactualchangeingofoneshots \{immediate = 0}
	if issoundeventplaying <localcurrentlyplaying>
		waitforoneshotsoundeventtoend <...>
	endif
	killspawnedscript \{name = spawnedoneshotbeginrepeatloop}
	spawnscriptnow spawnedoneshotbeginrepeatloop params = {myoneshot = <requestedsoundevent> waittime = <waittime>}
	change currentlyplayingoneshotsoundevent = <requestedsoundevent>
	change currentoneshotwaittime = <waittime>
endscript

script spawnedoneshotbeginrepeatloop \{waittime = 15}
	if NOT (<myoneshot> = audio_crowd_oneshots_do_nothing)
		wait (RandomFloat (0.3, 0.5) * <waittime>) seconds
		begin
		if (($game_mode != practice) && ($calibrate_lag_enabled = 0))
			soundevent event = <myoneshot>
		else
			break
		endif
		begin
		if issoundeventplaying <myoneshot>
			wait \{1
				gameframe}
		else
			break
		endif
		repeat
		wait (RandomFloat (0.9, 1.6) * <waittime>) seconds
		repeat
	else
	endif
endscript

script waitforoneshotsoundeventtoend \{immediate = 0}
	if (<immediate> = 1)
		printf \{qs(0xc32b16a8)}
		if (issoundeventplaying <localcurrentlyplaying>)
			stopsoundevent <localcurrentlyplaying>
		endif
		return
	endif
	begin
	if (issoundeventplaying <localcurrentlyplaying>)
	else
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript
