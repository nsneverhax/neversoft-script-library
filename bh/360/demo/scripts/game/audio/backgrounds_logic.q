
script skate8_sfx_backgrounds_new_area \{immediate = 0
		fadeintime = 3
		fadeouttime = 3
		fadeouttype = log_slow
		fadeintype = log_fast
		volpercentincrease = 0
		loading_transition = 0
		restarting = 0}
	printf channel = sfx qs(0xa7f0b4b9) s = <bg_sfx_area>
	gamemode_gettype
	if NOT (($0xe3aed043 = 1) || (<type> = tutorial))
		change sfx_background_last_area = <bg_sfx_area>
		if (<immediate> = 0)
			wait \{1
				gameframe}
		endif
		change sfx_background_requested_area = <bg_sfx_area>
		check_for_specific_bgs_in_struct
		spawnscriptnow skate8_sfx_background_play params = {volpercentincrease = <volpercentincrease> fadeintime = <fadeintime> fadeouttime = <fadeouttime> fadeouttype = <fadeouttype> fadeintype = <fadeintype> loading_transition = <loading_transition> restarting = <restarting>}
	else
		change \{sfx_background_last_area = frontend}
		if (<immediate> = 0)
			wait \{1
				gameframe}
		endif
		change \{sfx_background_requested_area = frontend}
		check_for_specific_bgs_in_struct
		spawnscriptnow skate8_sfx_background_play params = {volpercentincrease = <volpercentincrease> fadeintime = <fadeintime> fadeouttime = <fadeouttime> fadeouttype = <fadeouttype> fadeintype = <fadeintype> loading_transition = <loading_transition> restarting = <restarting>}
	endif
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
currentlyplayingoneshotsoundevent = donothing_oneshot
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
			printf \{channel = sfx
				qs(0xe0885199)
				s = $sfx_background_fadein_volume_target}
		endif
	endif
	printf channel = sfx qs(0x05d910ec) s = <fadeintype>
	printf channel = sfx qs(0xdb5ca868) s = <fadeouttype>
	if (<volpercentincrease> = 0)
		newvolumepercent = $sfx_background_fadein_volume_target
	else
		newvolumepercent = ($sfx_background_fadein_volume_target + <volpercentincrease>)
		printf channel = sfx qs(0x8f6c28f0) s = <newvolumepercent>
	endif
	appendsuffixtochecksum base = ($sfx_background_current_checksum) suffixstring = '_FT'
	frontchecksumname = <appended_id>
	appendsuffixtochecksum base = ($sfx_background_current_checksum) suffixstring = '_BK'
	backchecksumname = <appended_id>
	if NOT ($sfx_background_current_checksum = $sfx_background_requested_checksum)
		printf \{channel = sfx
			qs(0xf299651b)}
		backgrounds_shared_logic new_fade_time = <fadeouttime> new_fade_type = <fadeouttype> <...>
		printf \{channel = sfx
			qs(0xb9f91bd6)
			s = $sfx_background_requested_checksum}
		playsound <frontchecksumname> vol_percent = <newvolumepercent> pan1x = -1 pan1y = 1 pan2x = 1 pan2y = 1 priority = 105 buss = crowd_beds attack_length = <fadeintime> decay_length = 0 release_length = 0 attack_function = <fadeintype> num_loops = -1
		if NOT ($crowd_in_jam_mode_song_state = 1)
			printf \{channel = sfx
				qs(0x95d13fb2)}
			playsound <backchecksumname> vol_percent = <newvolumepercent> pan1x = -1 pan1y = -1 pan2x = 1 pan2y = -1 priority = 100 buss = crowd_beds attack_length = <fadeintime> decay_length = 0 release_length = 0 attack_function = <fadeintype> num_loops = -1
		else
			printf \{channel = sfx
				qs(0x3cad13d5)}
		endif
	else
		printf \{channel = sfx
			qs(0x2e8957c6)}
		if issoundplaying <frontchecksumname>
			setsoundparams <frontchecksumname> vol_percent = <newvolumepercent> time = <fadeintime> fade_type = <fadeouttype>
		else
			printf channel = sfx qs(0x30987070) s = <frontchecksumname>
			playsound <frontchecksumname> vol_percent = <newvolumepercent> pan1x = -1 pan1y = 1 pan2x = 1 pan2y = 1 priority = 105 buss = crowd_beds attack_length = <fadeintime> decay_length = 0 release_length = 0 attack_function = <fadeintype> num_loops = -1
		endif
		if issoundplaying <backchecksumname>
			setsoundparams <backchecksumname> vol_percent = <newvolumepercent> time = <fadeintime> fade_type = <fadeouttype>
		else
			printf channel = sfx qs(0x30987070) s = <backchecksumname>
			playsound <backchecksumname> vol_percent = <newvolumepercent> pan1x = -1 pan1y = -1 pan2x = 1 pan2y = -1 priority = 100 buss = crowd_beds attack_length = <fadeintime> decay_length = 0 release_length = 0 attack_function = <fadeintype> num_loops = -1
		endif
	endif
	if ($current_playing_transition = loading)
		printf \{channel = sfx
			qs(0x55587d03)
			s = $sfx_background_requested_checksum}
		if NOT ($sfx_background_requested_checksum = silence_front_end_crowd_loop)
			printf \{channel = sfx
				qs(0xb45f42e4)}
			printf \{channel = sfx
				qs(0x463d3bfa)}
			spawnscriptnow \{killsurgingscripts}
		endif
	else
		if ($crowd_transition_start_of_song_normal = 1)
			printf \{channel = sfx
				qs(0x077fdfe1)}
			if NOT ($sfx_background_requested_checksum = silence_front_end_crowd_loop)
				printf channel = sfx qs(0x9daa6935) s = <frontchecksumname>
				printf \{channel = sfx
					qs(0x84edbba2)}
				change \{crowd_transition_start_of_song_normal = 0}
				if scriptexists \{crowd_loading_whistle}
					printf \{channel = sfx
						qs(0x50b1ed1f)}
					killspawnedscript \{name = crowd_loading_whistle}
				endif
				if scriptexists \{crowd_loading_surge}
					printf \{channel = sfx
						qs(0x6cc40f41)}
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
		requestedsoundevent = donothing_oneshot
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
	if NOT (<myoneshot> = donothing_oneshot || $calibrate_lag_enabled = 1)
		gamemode_gettype
		if NOT (($0xe3aed043 = 1) || (<type> = tutorial))
			wait (RandomFloat (0.3, 0.5) * <waittime>) seconds
			begin
			soundevent event = <myoneshot>
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
		endif
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
