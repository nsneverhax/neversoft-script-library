guitarist_info = {
	anim_set = judy_animations
	stance = stance_frontend
	0x6a7a41d3 = 0x77aa6c97
	0x7955c7d7 = none
	outfit = 1
	finger_anims = guitarist_finger_anims_large
	fret_anims = guitarist_fret_anims
	strum = normal
	guitar_model = none
	playing_missed_note = false
	last_strum_length = short
	current_anim = idle
	anim_repeat_count = 1
	arms_disabled = 0
	disable_arms = 0
	cycle_anim = false
	next_stance = stance_frontend
	next_anim = none
	next_anim_repeat_count = 1
	next_anim_disable_arms = 0
	cycle_next_anim = false
	last_anim_name = none
	waiting_for_cameracut = false
	allow_movement = true
	target_node = none
	facial_anim = idle
	scale = 1.0
}
bassist_info = {
	anim_set = axel_animations
	stance = stance_frontend
	0x6a7a41d3 = 0x414e0cbe
	0x7955c7d7 = none
	outfit = 1
	finger_anims = guitarist_finger_anims_large
	fret_anims = guitarist_fret_anims
	strum = normal
	bass_model = none
	playing_missed_note = false
	last_strum_length = short
	current_anim = idle
	anim_repeat_count = 1
	arms_disabled = 0
	disable_arms = 0
	cycle_anim = false
	next_stance = stance_frontend
	next_anim = none
	next_anim_repeat_count = 1
	next_anim_disable_arms = 0
	cycle_next_anim = false
	last_anim_name = none
	waiting_for_cameracut = false
	allow_movement = true
	target_node = none
	facial_anim = idle
	scale = 1.0
}
vocalist_info = {
	anim_set = vocalist_animations
	stance = stance_a
	0x6a7a41d3 = 0x414e0cbe
	0x7955c7d7 = none
	current_anim = idle
	anim_repeat_count = 1
	disable_arms = 0
	arms_disabled = 0
	cycle_anim = false
	next_stance = stance_a
	next_anim = none
	next_anim_repeat_count = 1
	next_anim_disable_arms = 0
	cycle_next_anim = false
	last_anim_name = none
	allow_movement = true
	target_node = none
	facial_anim = idle
	scale = 1.0
}
drummer_info = {
	twist = 0.0
	desired_twist = 0.0
	anim_set = drummer_animations
	stance = stance_a
	0x6a7a41d3 = 0x414e0cbe
	0x7955c7d7 = none
	current_anim = idle
	anim_repeat_count = 1
	disable_arms = 0
	arms_disabled = 0
	cycle_anim = false
	next_stance = stance_a
	next_anim = none
	next_anim_repeat_count = 1
	next_anim_disable_arms = 0
	cycle_next_anim = false
	last_anim_name = none
	allow_movement = true
	target_node = none
	facial_anim = idle
	last_left_arm_note = 0
	last_right_arm_note = 0
	scale = 1.0
}
current_bass_model = none
current_outfit = 1

script create_band \{async = 0}
	if ($disable_band = 1)
		return
	endif
	getpakmancurrent \{map = zones}
	if (<pak> = z_credits)
		if NOT create_guitarist async = <async>
			return \{false}
		endif
		unload_character \{name = bassist}
		unload_character \{name = vocalist}
		unload_character \{name = drummer}
		set_bandvisible
		return \{true}
	endif
	if ($current_num_players = 1)
		if NOT create_guitarist async = <async>
			return \{false}
		endif
		get_song_struct song = ($current_song)
		if structurecontains structure = <song_struct> name = bassist
			bassist_profile = (<song_struct>.bassist)
			if NOT create_bassist profile_name = <bassist_profile> async = <async>
				return \{false}
			endif
		else
			if NOT create_bassist async = <async>
				return \{false}
			endif
		endif
		if NOT create_drummer async = <async>
			return \{false}
		endif
		if structurecontains structure = <song_struct> name = singer
			if (<song_struct>.singer = none)
				if compositeobjectexists \{name = vocalist}
					unload_character \{name = vocalist}
				endif
			else
				if (<pak> = z_wikker || <pak> = z_budokan || <pak> = z_hell)
					if (<song_struct>.singer = female)
						singer_profile = 'singer_female'
					elseif (<song_struct>.singer = bret)
						singer_profile = 'singer_bret'
					else
						singer_profile = 'singer'
					endif
				else
					if (<song_struct>.singer = female)
						singer_profile = 'singer_female'
					elseif (<song_struct>.singer = bret)
						singer_profile = 'singer_bret'
					else
						singer_profile = 'singer'
					endif
				endif
				if ($cheat_bretmichaels = 1)
					if NOT (<song_struct>.singer = female)
						singer_profile = 'singer_bret'
					endif
				endif
				if NOT create_vocalist profile_name = <singer_profile> async = <async>
					return \{false}
				endif
			endif
		else
			if ($cheat_bretmichaels = 1)
				singer_profile = 'singer_bret'
			else
				singer_profile = 'singer'
			endif
			if NOT create_vocalist profile_name = <singer_profile> async = <async>
				return \{false}
			endif
		endif
	else
		unload_character \{name = vocalist}
		if NOT create_guitarist name = guitarist async = <async>
			return \{false}
		endif
		if NOT create_guitarist name = bassist async = <async>
			return \{false}
		endif
		if NOT create_drummer async = <async>
			return \{false}
		endif
	endif
	set_bandvisible
	return \{true}
endscript

script create_guitarist_profile 
	player2_is_lead = false
	if ($current_num_players = 2)
		if (($game_mode = p2_career) || ($game_mode = p2_coop))
			if NOT ($player1_status.part = guitar)
				player2_is_lead = true
			endif
		endif
	endif
	if ((<name> = guitarist && <player2_is_lead> = false) || (<name> = bassist && <player2_is_lead> = true))
		player_status = player1_status
	else
		player_status = player2_status
	endif
	found = 0
	find_profile_by_id id = ($<player_status>.character_id)
	<found> = 1
	if (<found> = 1)
		if gotparam \{no_guitar}
			<instrument_id> = none
		else
			if ($boss_battle = 1 && <name> = bassist)
				get_musician_profile_struct index = <index>
				<instrument_id> = (<profile_struct>.musician_instrument.desc_id)
			else
				<instrument_id> = ($<player_status>.instrument_id)
			endif
		endif
		if ($cheat_airguitar = 1)
			if NOT ($is_network_game)
				<instrument_id> = none
			endif
		endif
		outfit = ($<player_status>.outfit)
		style = ($<player_status>.style)
		get_musician_profile_struct index = <index>
		character_name = (<profile_struct>.name)
		formattext checksumname = body_id 'Guitarist_%n_Outfit%o_Style%s' n = <character_name> o = <outfit> s = <style>
		profile = {<profile_struct>
			musician_instrument = {desc_id = <instrument_id>}
			musician_body = {desc_id = <body_id>}
			download_musician_instrument = {desc_id = <instrument_id>}
			download_musician_body = {desc_id = <body_id>}
			outfit = <outfit>}
	endif
	return <...>
endscript

script create_guitarist \{name = guitarist
		profile_name = 'judy'
		instrument_id = instrument_les_paul_black
		async = 0
		animpak = 1}
	extendcrc <name> '_Info' out = info_struct

	create_guitarist_profile <...>
	if (<found> = 1)
		if gotparam \{node_name}
			waypoint_id = <node_name>
		else
			get_start_node_id member = <name>
		endif
		if doeswaypointexist name = <waypoint_id>
			change structurename = <info_struct> target_node = <waypoint_id>
		else

		endif
		cleareventhandlergroup \{hand_events}
		if NOT create_band_member name = <name> profile = <profile> start_node = <waypoint_id> <...>
			return \{false}
		endif
		find_profile_by_id id = ($<player_status>.character_id)
		formattext checksumname = highway_material 'Highway_Guitarist_%n_Outfit%o_Style%s' n = (<profile_struct>.name) o = <outfit> s = <style>
		change structurename = <player_status> highway_material = <highway_material>
		change structurename = <player_status> band_member = <name>
		get_musician_profile_struct index = <index>
		change structurename = <info_struct> anim_set = (<profile_struct>.anim_set)
		change structurename = <info_struct> 0x6a7a41d3 = (<profile_struct>.0x6a7a41d3)
		if structurecontains structure = <profile_struct> name = 0x7955c7d7
			change structurename = <info_struct> 0x7955c7d7 = (<profile_struct>.0x7955c7d7)
		endif
		change structurename = <info_struct> finger_anims = (<profile_struct>.finger_anims)
		change structurename = <info_struct> fret_anims = (<profile_struct>.fret_anims)
		change structurename = <info_struct> strum = (<profile_struct>.strum_anims)
		change structurename = <info_struct> allow_movement = true
		change structurename = <info_struct> arms_disabled = 0
		change structurename = <info_struct> disable_arms = 0
		change structurename = <info_struct> next_stance = ($<info_struct>.stance)
		if structurecontains structure = <profile_struct> name = scale
			scale_x = ((<profile_struct>.scale).(1.0, 0.0, 0.0))
			scale_y = ((<profile_struct>.scale).(0.0, 1.0, 0.0))
			scale_z = ((<profile_struct>.scale).(0.0, 0.0, 1.0))
			if ((<scale_x> != <scale_y>) || (<scale_y> != <scale_z>))
				scriptassert \{'Attempting to create a guitarist with a non-uniform scale!'}
			endif

			change structurename = <info_struct> scale = <scale_x>
		else
			change structurename = <info_struct> scale = 1.0
		endif
		stance = ($<info_struct>.stance)

		if (<stance> = stance_frontend || <stance> = stance_frontend_guitar)
			change structurename = <info_struct> arms_disabled = 2
			change structurename = <info_struct> disable_arms = 2
			<name> :hero_toggle_arms num_arms = 0 prev_num_arms = 2 blend_time = 0.0
		else
			<name> :hero_toggle_arms num_arms = 1 prev_num_arms = 0 blend_time = 0.0
		endif
		finger_anims = ($<info_struct>.finger_anims)
		fret_anims = ($<info_struct>.fret_anims)
		strum_type = ($<info_struct>.strum)
		extendcrc <strum_type> '_Strums' out = strum_anims
		if NOT gotparam \{no_strum}
			<name> :hero_play_strum_anim anim = ($<strum_anims>.no_strum_anim)
			<name> :hero_play_fret_anim anim = (<fret_anims>.track_123)
			<name> :hero_play_finger_anim anim = (<finger_anims>.track_none)
		endif
		<name> :obj_switchscript guitarist_idle
		<name> :obj_spawnscriptnow facial_anim_loop
		if gotparam \{no_anim}
			spawnscriptnow temp_hero_pause_script params = {name = <name>}
		endif
		<name> :obj_forceupdate
	else

	endif
	return \{true}
endscript

script 0x3a5e65b5 \{stance = none}
	0x954391f1 = [stance_a , stance_b , stance_c]
	getarraysize <0x954391f1>
	count = 0
	begin
	0x2f24b3ba = (<0x954391f1> [<count>])
	if (<stance> = <0x2f24b3ba>)
		return \{true}
	endif
	count = (<count> + 1)
	repeat (<array_size> -1)
	return \{false}
endscript

script 0x5df4bf10 \{0x959bf483 = none}
	anim_command {
		target = acc
		command = degenerateblend_addbranch
		params = {
			tree = $0xec94f5b8
			blendduration = 0.5
			params = {
				timer_type = play
				anim_name = (<0x959bf483> [0])
				speed = 0.0
			}
		}
	}
endscript

script 0x88fa31d7 \{0x959bf483 = none
		stance = none}
	getarraysize <0x959bf483>
	if (<array_size> = 0)
		return
	endif
	if NOT 0x3a5e65b5 stance = <stance>
		0x5df4bf10 <...>
		return
	endif
	getrandomvalue name = anim_index a = 0 b = (<array_size> -1) integer
	if NOT objectexists \{id = 0x1e508238}

		anim_command {
			target = acc
			command = degenerateblend_addbranch
			params = {
				tree = $0xec94f5b8
				blendduration = 0.5
				params = {
					timer_type = cycle
					anim_name = (<0x959bf483> [<anim_index>])
					speed = 1.0
				}
			}
		}
	endif
	if anim_command \{target = 0x1e508238
			command = timer_isanimcomplete}
		anim_command {
			target = acc
			command = degenerateblend_addbranch
			params = {
				tree = $0xec94f5b8
				blendduration = 0.5
				params = {
					timer_type = cycle
					anim_name = (<0x959bf483> [<anim_index>])
					speed = 1.0
				}
			}
		}
	endif
endscript

script temp_hero_pause_script 
	waitonegameframe
	if <name> :anim_animnodeexists id = bodytimer
		<name> :anim_command target = bodytimer command = timer_setspeed params = {speed = 0.0}
	endif
endscript

script create_bassist \{name = bassist
		profile_name = 'bassist'
		async = 0}
	extendcrc <name> '_Info' out = info_struct

	find_profile name = <profile_name>
	if (<found> = 1)
		get_start_node_id member = <name>
		if doeswaypointexist name = <waypoint_id>
			getwaypointpos name = <waypoint_id>
			change structurename = <info_struct> target_node = <waypoint_id>
		else

		endif
		get_musician_profile_struct index = <index>
		if ($current_bass_model = none)
			profile = <profile_struct>
		else
			profile = {
				<profile_struct>
				musician_instrument = {desc_id = ($current_bass_model)}
			}
		endif
		if NOT create_band_member name = <name> profile = <profile> start_node = <waypoint_id> <...>
			return \{false}
		endif
		get_musician_profile_struct index = <index>
		change structurename = <info_struct> anim_set = (<profile_struct>.anim_set)
		change structurename = <info_struct> 0x6a7a41d3 = (<profile_struct>.0x6a7a41d3)
		change structurename = <info_struct> finger_anims = (<profile_struct>.finger_anims)
		change structurename = <info_struct> fret_anims = (<profile_struct>.fret_anims)
		change structurename = <info_struct> strum = (<profile_struct>.strum_anims)
		change structurename = <info_struct> allow_movement = true
		change structurename = <info_struct> arms_disabled = 0
		change structurename = <info_struct> disable_arms = 0
		if structurecontains structure = <profile_struct> name = scale
			scale_x = ((<profile_struct>.scale) * (1.0, 0.0, 0.0))
			scale_y = ((<profile_struct>.scale) * (0.0, 1.0, 0.0))
			scale_z = ((<profile_struct>.scale) * (0.0, 0.0, 1.0))
			if ((<scale_x> != <scale_y>) || (<scale_y> != <scale_z>))
				scriptassert \{'Attempting to create a guitarist with a non-uniform scale!'}
			endif

			change structurename = <info_struct> scale = <scale_x>
		else
			change structurename = <info_struct> scale = 1.0
		endif
		if gotparam \{stance}
			change structurename = <info_struct> stance = <stance>
		else
			change structurename = <info_struct> stance = (<profile_struct>.stance)
		endif
		finger_anims = ($<info_struct>.finger_anims)
		fret_anims = ($<info_struct>.fret_anims)
		strum_type = ($bassist_info.strum)
		extendcrc <strum_type> '_Strums' out = strum_anims
		if NOT gotparam \{no_strum}
			<name> :hero_play_strum_anim anim = ($<strum_anims>.no_strum_anim)
			<name> :hero_play_fret_anim anim = (<fret_anims>.track_106)
			<name> :hero_play_finger_anim anim = (<finger_anims>.track_none)
		endif
		<name> :obj_switchscript guitarist_idle
		<name> :obj_spawnscriptnow facial_anim_loop
	else

	endif
	return \{true}
endscript

script create_vocalist \{name = vocalist
		profile_name = 'singer'
		async = 0}
	extendcrc <name> '_Info' out = info_struct

	find_profile name = <profile_name>
	if (<found> = 1)
		get_start_node_id member = <name>
		if doeswaypointexist name = <waypoint_id>
			getwaypointpos name = <waypoint_id>
			change structurename = <info_struct> target_node = <waypoint_id>
		else

		endif
		get_musician_profile_struct index = <index>
		if NOT create_band_member name = <name> profile = <profile_struct> start_node = <waypoint_id> <...>
			return \{false}
		endif
		change structurename = <info_struct> anim_set = (<profile_struct>.anim_set)
		change structurename = <info_struct> 0x6a7a41d3 = (<profile_struct>.0x6a7a41d3)
		change structurename = <info_struct> allow_movement = true
		if gotparam \{stance}
			change structurename = <info_struct> stance = <stance>
		else
			change structurename = <info_struct> stance = (<profile_struct>.stance)
		endif
		<name> :obj_switchscript bandmember_idle
		<name> :obj_spawnscriptnow facial_anim_loop
	else

	endif
	return \{true}
endscript

script create_drummer \{name = drummer
		profile_name = 'drummer'
		async = 0}
	extendcrc <name> '_Info' out = info_struct

	find_profile name = <profile_name>
	if (<found> = 1)
		get_start_node_id member = <name>
		if doeswaypointexist name = <waypoint_id>
			getwaypointpos name = <waypoint_id>
			change structurename = <info_struct> target_node = <waypoint_id>
		else

		endif
		get_musician_profile_struct index = <index>
		if NOT create_band_member name = <name> profile = <profile_struct> start_node = <waypoint_id> <...>
			return \{false}
		endif
		change structurename = <info_struct> anim_set = (<profile_struct>.anim_set)
		change structurename = <info_struct> allow_movement = true
		if gotparam \{stance}
			change structurename = <info_struct> stance = <stance>
		else
			change structurename = <info_struct> stance = (<profile_struct>.stance)
		endif
		<name> :obj_killspawnedscript name = drummer_autotwist
		<name> :obj_spawnscriptnow drummer_autotwist
		<name> :obj_switchscript bandmember_idle
		<name> :obj_spawnscriptnow facial_anim_loop
		change \{structurename = drummer_info
			last_left_arm_note = 0}
		change \{structurename = drummer_info
			last_right_arm_note = 0}
	else

	endif
	return \{true}
endscript

script drummer_autotwist 
	0x348ae3b7
	begin
	if 0xbf608b37
		break
	endif
	waitonegameframe
	repeat
	0x44587e3e
endscript

script unload_character 
	destroy_band_member name = <name>
endscript

script unload_band 
	destroy_band_member \{name = guitarist}
	destroy_band_member \{name = bassist}
	destroy_band_member \{name = drummer}
	destroy_band_member \{name = vocalist}
	force_unload_all_character_paks
endscript

script hero_play_random_anim \{blendduration = 0.2}
	getarraysize <anims>
	getrandomvalue name = newindex integer a = 0 b = (<array_size> - 1)
	anim_name = (<anims> [<newindex>])
	if gotparam \{cycle}
		hero_play_anim anim = <anim_name> blendduration = <blendduration> cycle
	else
		hero_play_anim anim = <anim_name> blendduration = <blendduration>
	endif
endscript

script should_display_debug_info 
	obj_getid
	display_info = false
	switch (<objid>)
		case guitarist
		if ($display_guitarist_anim_info = true)
			display_info = true
		endif
		case bassist
		if ($display_bassist_anim_info = true)
			display_info = true
		endif
		case vocalist
		if ($display_vocalist_anim_info = true)
			display_info = true
		endif
		case drummer
		if ($display_drummer_anim_info = true)
			display_info = true
		endif
	endswitch
	return <display_info>
endscript

script hero_play_random_anims 
	count = 0
	begin
	hero_play_random_anim anims = <anim_array>
	hero_wait_until_anim_finished
	count = (<count> + 1)
	if gotparam \{repeat_count}
		if (<count> = <repeat_count>)
			break
		endif
	endif
	repeat
endscript

script hero_play_adjusting_random_anims \{blend_time = 0.2}
	obj_getid
	extendcrc <objid> '_Info' out = info_struct
	count = 0
	begin
	anim = ($<info_struct>.current_anim)
	cycle = ($<info_struct>.cycle_anim)
	repeat_count = ($<info_struct>.anim_repeat_count)
	0x92666030 = ($<info_struct>.0x6a7a41d3)
	if (<objid> = guitarist || <objid> = bassist)
		if ($<info_struct>.outfit = 2)
			if NOT ($<info_struct>.0x7955c7d7 = none)
				0x92666030 = ($<info_struct>.0x7955c7d7)
			endif
		endif
	endif
	if NOT (<objid> = drummer)
		0x88fa31d7 0x959bf483 = (<0x92666030>) stance = ($<info_struct>.stance)
	endif
	if (<objid> = guitarist || <objid> = bassist)
		if (($<info_struct>.disable_arms) = 2)

			if ($<info_struct>.arms_disabled != 2)

				hero_toggle_arms num_arms = 0 prev_num_arms = (2 - ($<info_struct>.arms_disabled))
				change structurename = <info_struct> arms_disabled = 2
			endif
		elseif (($<info_struct>.disable_arms) = 1)
			if ($<info_struct>.arms_disabled != 1)
				hero_toggle_arms num_arms = 1 prev_num_arms = (2 - ($<info_struct>.arms_disabled))
				change structurename = <info_struct> arms_disabled = 1
			endif
		else
			if ($<info_struct>.arms_disabled != 0)
				hero_toggle_arms num_arms = 2 prev_num_arms = (2 - ($<info_struct>.arms_disabled))
				change structurename = <info_struct> arms_disabled = 0
			endif
		endif
	endif
	if (<objid> = guitarist)
		if NOT (<anim> = idle)
			change structurename = <info_struct> facial_anim = <anim>
		endif
	endif
	if hero_play_tempo_anim_cfunc anim = <anim> blendduration = <blend_time>
		hero_play_anim anim = <anim_to_run> blendduration = <blend_duration> usemotionextraction = <use_motion_extraction>
		hero_wait_until_anim_finished
	else
		waitonegameframe
	endif
	display_debug_info = false
	if (should_display_debug_info)
		display_debug_info = true
	endif
	anim_set = ($<info_struct>.anim_set)
	stance = ($<info_struct>.stance)
	next_stance = ($<info_struct>.next_stance)
	stance_changed = false
	if NOT (<next_stance> = <stance>)
		if (<display_debug_info> = true)

		endif
		if play_stance_transition_cfunc anim_set = <anim_set> old_stance = <stance> new_stance = <next_stance>
			hero_play_anim anim = <anim_to_run>
			hero_wait_until_anim_finished
		endif
		change structurename = <info_struct> stance = <next_stance>
		stance = <next_stance>
		stance_changed = true
	endif
	next_anim = ($<info_struct>.next_anim)
	if (<next_anim> = none && <stance_changed> = false)
		if (<cycle> = false)
			repeat_count = (<repeat_count> - 1)
			if (<repeat_count> < 1)
				if (<display_debug_info> = true)

				endif
				repeat_count = 0
			endif
		endif
		change structurename = <info_struct> anim_repeat_count = <repeat_count>
		if (<cycle> = false && <repeat_count> <= 0)
			change structurename = <info_struct> current_anim = idle
			change structurename = <info_struct> cycle_anim = true
			if (<next_stance> = intro || <next_stance> = intro_smstg || <next_stance> = stance_frontend || <next_stance> = stance_frontend_guitar)
			else
				change structurename = <info_struct> disable_arms = 0
			endif
			blend_time = 0.2
			if (<display_debug_info> = true)

			endif
		else
			blend_time = 0.2
			if (<display_debug_info> = true)
				if (<cycle> = false)

				else

				endif
			endif
		endif
	else
		repeat_count = ($<info_struct>.next_anim_repeat_count)
		if ((<display_debug_info> = true) && (<next_anim> != none))
			if (<repeat_count> > 1)

			else
			endif
		endif
		if (<next_anim> = none)
			if (<display_debug_info> = true)

			endif
			next_anim = idle
			cycle_next_anim = true
		else
			cycle_next_anim = ($<info_struct>.cycle_next_anim)
		endif
		if (<next_stance> = intro || <next_stance> = intro_smstg || <next_stance> = stance_frontend || <next_stance> = stance_frontend_guitar)
			disable_arms_next_anim = 2
		else
			disable_arms_next_anim = ($<info_struct>.next_anim_disable_arms)
		endif
		change structurename = <info_struct> stance = <next_stance>
		change structurename = <info_struct> current_anim = <next_anim>
		change structurename = <info_struct> cycle_anim = <cycle_next_anim>
		change structurename = <info_struct> disable_arms = <disable_arms_next_anim>
		change structurename = <info_struct> next_anim = none
		change structurename = <info_struct> cycle_next_anim = true
		change structurename = <info_struct> anim_repeat_count = <repeat_count>
		change structurename = <info_struct> next_anim_disable_arms = 0
		blend_time = 0.2
	endif
	repeat
endscript

script crowd_play_adjusting_random_anims \{anim = idle
		blend_time = 0.2
		startwithnoblend = 0}
	obj_getid
	old_speed = undefined
	begin
	hero_get_skill_level_cfunc
	get_anim_speed_for_tempo_cfunc
	if gotparam \{anim_set}
		anims = ($<anim_set>.<anim>.<skill>.<anim_speed>)
	else
		anims = ($crowd_animations.<anim>.<skill>.<anim_speed>)
	endif
	getarraysize <anims>
	getrandomvalue name = newindex integer a = 0 b = (<array_size> - 1)
	anim_name = (<anims> [<newindex>])
	if (<startwithnoblend> = 1)
		blend_time = 0.0
		startwithnoblend = 0
	elseif (<anim_speed> != <old_speed>)
		blend_time = $crowd_blendtime_tempochange
	elseif (<skill> = bad)
		blend_time = $crowd_blendtime_bad
	elseif (<anim> = special)
		blend_time = $crowd_blendtime_special
	elseif (<anim_speed> = slow)
		blend_time = $crowd_blendtime_slow
	elseif (<anim_speed> = med)
		blend_time = $crowd_blendtime_med
	elseif (<anim_speed> = fast)
		blend_time = $crowd_blendtime_fast
	else
		blend_time = -1.0
	endif
	if ($display_crowd_anim_info = true)

	endif
	gameobj_playanim anim = <anim_name> blendduration = <blend_time> animevents = on
	gameobj_waitanimfinished
	old_speed = <anim_speed>
	repeat
endscript

script hero_strum_guitar \{note_length = 150}
	hero_strum_guitar_cfunc_setup
	begin
	if hero_strum_guitar_cfunc
		break
	endif
	waitonegameframe
	repeat
	hero_strum_guitar_cfunc_cleanup
endscript

script find_profile 
	get_musician_profile_size
	if gotparam \{name}
		getlowercasestring <name>
		search_name = <lowercasestring>
		found = 0
		index = 0
		begin
		get_musician_profile_struct index = <index>
		getlowercasestring (<profile_struct>.name)
		profile_name = <lowercasestring>
		if (<profile_name> = <search_name>)
			found = 1
			break
		endif
		index = (<index> + 1)
		repeat <array_size>
		return found = <found> index = <index>
	elseif gotparam \{body_id}
		found = 0
		index = 0
		begin
		get_musician_profile_struct index = <index>
		body = (<profile_struct>.musician_body)
		body_descid = (<body>.desc_id)
		if (<body_id> = <body_descid>)
			found = 1
			break
		endif
		index = (<index> + 1)
		repeat <array_size>
		return found = <found> index = <index>
	endif
endscript

script find_profile_by_id 
	get_musician_profile_size
	found = 0
	index = 0
	begin
	get_musician_profile_struct index = <index>
	next_name = (<profile_struct>.name)
	formattext checksumname = profile_id '%n' n = <next_name> addtostringlookup = true
	if (<profile_id> = <id>)
		return true index = <index>
		break
	endif
	index = (<index> + 1)
	repeat <array_size>
	find_profile_by_id \{id = axel}
	return false index = <index>
endscript

script get_waypoint_id \{index = 0}
	getpakmancurrent \{map = zones}
	getpakmancurrentname \{map = zones}
	if (<index> < 10)
		formattext textname = suffix '_TRG_Waypoint_0%a' a = <index>
	else
		formattext textname = suffix '_TRG_Waypoint_%a' a = <index>
	endif
	waypoint_name = (<pakname> + <suffix>)
	appendsuffixtochecksum base = <pak> suffixstring = <suffix>
	return waypoint_id = <appended_id> waypoint_name = <waypoint_name>
endscript

script get_start_node_id \{character = 'guitarist'}
	player2_is_guitarist = false
	if (($game_mode = p2_career) || ($game_mode = p2_coop))
		if NOT ($player1_status.part = guitar)
			player2_is_guitarist = true
		endif
	endif
	art_deco_encore = false
	getpakmancurrent \{map = zones}
	if (<pak> = z_artdeco)
		if getnodeflag \{ls_encore_post}
			art_deco_encore = true
		endif
	endif
	switch (<member>)
		case guitarist
		if ($current_num_players = 1)
			character = 'guitarist'
		else
			if (<player2_is_guitarist> = true)
				if (<art_deco_encore> = true)
					character = 'guitarist'
				else
					character = 'guitarist_player2'
				endif
			else
				character = 'guitarist_player1'
			endif
		endif
		case bassist
		if ($current_num_players = 1)
			character = 'bassist'
		else
			if (<player2_is_guitarist> = true)
				character = 'guitarist_player1'
			else
				if (<art_deco_encore> = true)
					character = 'guitarist'
				else
					character = 'guitarist_player2'
				endif
			endif
		endif
		case vocalist
		character = 'vocalist'
		case drummer
		character = 'drummer'
		default

		character = 'unknown'
	endswitch
	if getpakmancurrentname \{map = zones}
		getpakmancurrent \{map = zones}
		formattext textname = suffix '_TRG_Waypoint_%a_start' a = <character>
		waypoint_name = (<pakname> + <suffix>)
		appendsuffixtochecksum base = <pak> suffixstring = <suffix>
		return waypoint_id = <appended_id> waypoint_name = <waypoint_name>
	else
		return \{waypoint_id = none
			waypoint_name = 'NONE'}
	endif
endscript

script get_skill_level 
	health = ($player1_status.current_health)
	skill = normal
	if (<health> < 0.66)
		skill = bad
	elseif (<health> > 1.3299999)
		skill = good
	endif
	return skill = <skill>
endscript

script get_target_node 
	obj_getid
	extendcrc <objid> '_Info' out = info_struct
	return target_node = ($<info_struct>.target_node)
endscript
bandmember_idle_eventtable = [
	{
		response = call_script
		event = play_anim
		scr = handle_play_anim
	}
	{
		response = call_script
		event = change_stance
		scr = handle_change_stance
	}
]

script bandmember_idle 
	reseteventhandlersfromtable \{bandmember_idle_eventtable
		group = hand_events}
	obj_killspawnedscript \{name = hero_play_adjusting_random_anims}
	obj_spawnscriptnow \{hero_play_adjusting_random_anims
		params = {
			anim = idle
		}}
	block
endscript

script play_special_facial_anim 
	if NOT gotparam \{anim}
		return
	endif
	obj_killspawnedscript \{name = facial_anim_loop}
	obj_getid
	if (<objid> = guitarist)

	endif
	hero_play_facial_anim anim = <anim>
	hero_wait_until_anim_finished \{timer = facialtimer}
	if (<objid> = guitarist)

	endif
	obj_spawnscriptnow \{facial_anim_loop}
endscript

script facial_anim_loop 
	obj_getid
	extendcrc <objid> '_Info' out = info_struct
	anim_set = ($<info_struct>.anim_set)
	if NOT structurecontains structure = $<anim_set> name = facial_anims
		return
	endif
	if NOT structurecontains structure = ($<anim_set>.facial_anims) name = idle
		return
	endif
	begin
	anim = ($<info_struct>.facial_anim)
	if NOT structurecontains structure = ($<anim_set>.facial_anims) name = <anim>
		if ($display_facial_anim_info = true)

		endif
		anim = idle
	endif
	anims = ($<anim_set>.facial_anims.<anim>)
	getarraysize <anims>
	getrandomvalue name = index integer a = 0 b = (<array_size> - 1)
	anim_name = (<anims> [<index>])
	if ($display_facial_anim_info = true)

	endif
	change structurename = <info_struct> facial_anim = idle
	hero_play_facial_anim anim = <anim_name>
	hero_wait_until_anim_finished \{timer = facialtimer}
	waitonegameframe
	repeat
endscript
guitarist_idle_eventtable = [
	{
		response = call_script
		event = strum_guitar
		scr = handle_strum_event
	}
	{
		response = call_script
		event = pose_fret
		scr = handle_fret_event
	}
	{
		response = call_script
		event = pose_fingers
		scr = handle_finger_event
	}
	{
		response = call_script
		event = anim_missednote
		scr = handle_missed_note
	}
	{
		response = call_script
		event = anim_hitnote
		scr = handle_hit_note
	}
	{
		response = call_script
		event = play_anim
		scr = handle_play_anim
	}
	{
		response = call_script
		event = play_battle_anim
		scr = handle_play_anim
	}
	{
		response = call_script
		event = change_stance
		scr = handle_change_stance
	}
	{
		response = call_script
		event = walk
		scr = handle_walking
	}
]

script guitarist_idle 
	reseteventhandlersfromtable \{guitarist_idle_eventtable
		group = hand_events}
	obj_getid
	if (($player1_status.band_member) = <objid>)
		seteventhandler \{response = call_script
			event = star_power_onp1
			scr = handle_star_power
			group = hand_events}
	else (($player2_status.band_member) = <objid>)
		seteventhandler \{response = call_script
			event = star_power_onp2
			scr = handle_star_power
			group = hand_events}
	endif
	obj_killspawnedscript \{name = hero_play_adjusting_random_anims}
	obj_spawnscriptnow \{hero_play_adjusting_random_anims
		params = {
			anim = idle
			blend_time = 0.2
			cycle
		}}
	block
endscript

script guitarist_idle_animpreview 
	cleareventhandlergroup \{hand_events}
endscript
guitarist_walking_eventtable = [
	{
		response = call_script
		event = strum_guitar
		scr = handle_strum_event
	}
	{
		response = call_script
		event = pose_fret
		scr = handle_fret_event
	}
	{
		response = call_script
		event = pose_fingers
		scr = handle_finger_event
	}
	{
		response = call_script
		event = anim_missednote
		scr = handle_missed_note
	}
	{
		response = call_script
		event = anim_hitnote
		scr = handle_hit_note
	}
	{
		response = call_script
		event = change_stance
		scr = queue_change_stance
	}
]

script guitarist_walking 
	reseteventhandlersfromtable \{guitarist_walking_eventtable
		group = hand_events}
	obj_killspawnedscript \{name = hero_play_adjusting_random_anims}
	spawnscriptnow \{start_walk_camera}
	walk_to_waypoint <...>
	spawnscriptnow \{kill_walk_camera}
	obj_switchscript \{guitarist_idle}
endscript

script play_special_anim \{stance = stance_a
		disable_arms = 2
		blendduration = 0.2}
	obj_getid
	extendcrc <objid> '_Info' out = info_struct
	cleareventhandlergroup \{hand_events}
	if gotparam \{respond_to_hand_events}
		reseteventhandlersfromtable \{guitarist_walking_eventtable
			group = hand_events}
	else
		seteventhandler \{response = call_script
			event = change_stance
			scr = queue_change_stance
			group = hand_events}
	endif
	obj_killspawnedscript \{name = hero_play_adjusting_random_anims}
	if gotparam \{wait}
		hero_wait_until_anim_finished
	endif
	if (<disable_arms> = 0)
		if (<info_struct>.arms_disabled = 2)
			hero_toggle_arms \{prev_num_arms = 0
				num_arms = 2}
			change structurename = <info_struct> arms_disabled = 0
			change structurename = <info_struct> disable_arms = 0
			change structurename = <info_struct> next_anim_disable_arms = 0
			change structurename = <info_struct> current_anim = idle
			change structurename = <info_struct> cycle_anim = idle
			change structurename = <info_struct> next_anim = idle
			change structurename = <info_struct> cycle_next_anim = true
		endif
	endif
	if (<disable_arms> = 2)
		if (<objid> = guitarist || <objid> = bassist || <objid> = drummer)
			hero_disable_arms \{blend_time = 0.0}
		endif
	endif
	change structurename = <info_struct> stance = <stance>
	if hero_play_tempo_anim_cfunc anim = <anim> blendduration = <blendduration>
		if NOT (<unique_id> = none)
			change winlose_sfx_unique_id = <unique_id>
			change \{winlose_sfx_loaded = 1}
		endif
		hero_play_anim anim = <anim_to_run> blendduration = <blend_duration> usemotionextraction = <use_motion_extraction>
	endif
	if (<objid> = guitarist || <objid> = bassist)
		if (<disable_arms> = 2)
			hero_wait_until_anim_near_end \{time_from_end = 0.25}
			hero_enable_arms \{blend_time = 0.25}
		endif
	endif
	hero_wait_until_anim_finished
	change structurename = <info_struct> stance = stance_a
	if (<objid> = guitarist || <objid> = bassist)
		obj_switchscript \{guitarist_idle}
	else
		obj_switchscript \{bandmember_idle}
	endif
endscript

script play_simple_anim \{disable_arms = 2
		blendduration = 0.0}
	obj_getid
	extendcrc <objid> '_Info' out = info_struct
	cleareventhandlergroup \{hand_events}
	obj_killspawnedscript \{name = hero_play_adjusting_random_anims}
	if (<disable_arms> = 2)
		if (<objid> = guitarist || <objid> = bassist)
			hero_disable_arms blend_time = <blendduration>
		endif
	endif
	hero_play_anim anim = <anim> blendduration = <blendduration>
	if (<objid> = guitarist || <objid> = bassist)
		hero_wait_until_anim_near_end \{time_from_end = 0.25}
		hero_enable_arms \{blend_time = 0.25}
	endif
	hero_wait_until_anim_finished
	handle_change_stance \{stance = stance_a
		no_wait}
	if (<objid> = guitarist || <objid> = bassist)
		obj_switchscript \{guitarist_idle}
	else
		obj_switchscript \{bandmember_idle}
	endif
endscript

script handle_star_power 
	obj_getid
	extendcrc <objid> '_Info' out = info_struct
	change structurename = <info_struct> waiting_for_cameracut = true
	begin
	if ($<info_struct>.waiting_for_cameracut = false)
		break
	endif
	waitonegameframe
	repeat
	obj_switchscript \{play_special_anim
		params = {
			stance = stance_a
			anim = starpower
			blendduration = 0.0
			disable_arms = 0
			respond_to_hand_events = 1
		}}
endscript

script handle_song_won 
	obj_killspawnedscript \{name = handle_star_power}

	obj_switchscript \{play_special_anim
		params = {
			stance = win
			anim = idle
			kill_transitions_when_done
		}}
endscript

script handle_song_failed 
	obj_killspawnedscript \{name = handle_star_power}

	obj_switchscript \{play_special_anim
		params = {
			stance = lose
			anim = idle
			kill_transitions_when_done
		}}
endscript

script play_intro_anims 

	intro_stance = intro
	if (usesmallvenueanims)

		intro_stance = intro_smstg
	endif
	play_guitarist_intro = true
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_artdeco
		if getnodeflag \{ls_encore_post}
			play_guitarist_intro = false
		endif
	endswitch
	if (<play_guitarist_intro> = true)
		band_changestance name = guitarist stance = <intro_stance> no_wait
		band_changestance name = bassist stance = <intro_stance> no_wait
	else
		if ($game_mode = p2_career || $game_mode = p2_coop)
			band_changestance name = ($player1_status.band_member) stance = <intro_stance> no_wait
			band_changestance name = ($player2_status.band_member) stance = stance_a no_wait
		else
			band_changestance \{name = guitarist
				stance = stance_a
				no_wait}
			band_changestance name = bassist stance = <intro_stance> no_wait
		endif
	endif
	band_changestance name = vocalist stance = <intro_stance> no_wait
	band_changestance \{name = drummer
		stance = intro
		no_wait}
	band_changestance \{name = guitarist
		stance = stance_a}
	band_changestance \{name = bassist
		stance = stance_a}
	band_changestance \{name = vocalist
		stance = stance_a}
	band_changestance \{name = drummer
		stance = stance_a}
endscript

script usesmallvenueanims 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_party
		return_val = true
		case z_dive
		return_val = true
		case z_video
		return_val = true
		case z_prison
		return_val = true
		case z_hell
		return_val = true
		case z_artdeco
		if getnodeflag \{ls_encore_post}
			return \{true}
		endif
		case z_wikker
		if ($player1_status.character_id = judy)
			return_val = true
		endif
		if ($current_num_players = 2)
			if ($player2_status.character_id = judy)
				return_val = true
			endif
		endif
		default
		return_val = false
	endswitch
	return <return_val>
endscript

script play_win_anims 
	if ($disable_band = 1)
		return
	endif
	if ($game_mode = tutorial)
		return
	endif

	win_stance = win
	lose_stance = lose
	if (usesmallvenueanims)

		win_stance = win_smstg
		lose_stance = lose_smstg
	endif
	if ((($current_num_players = 1) && ($boss_battle = 0)) || ($game_mode = p2_coop) || ($game_mode = p2_career))
		if compositeobjectexists \{name = guitarist}
			guitarist :obj_switchscript play_special_anim params = {stance = <win_stance> anim = idle kill_transitions_when_done blendduration = 0.0}
		endif
		if compositeobjectexists \{name = bassist}
			bassist :obj_switchscript play_special_anim params = {stance = <win_stance> anim = idle kill_transitions_when_done blendduration = 0.0}
		endif
	else
		if ($boss_battle = 1)
			guitarist :obj_switchscript play_special_anim params = {stance = <win_stance> anim = idle kill_transitions_when_done blendduration = 0.0}
			bassist :obj_switchscript play_special_anim params = {stance = <lose_stance> anim = idle kill_transitions_when_done blendduration = 0.0}
		else
			p1_won = true
			if ($game_mode = p2_battle)
				if (($player2_status.current_health) > ($player1_status.current_health))
					p1_won = false
				endif
			else
				if (($player2_status.score) > ($player1_status.score))
					p1_won = false
				endif
			endif
			if (<p1_won> = true)
				($player1_status.band_member) :obj_switchscript play_special_anim params = {stance = <win_stance> anim = idle blendduration = 0.0}
				($player2_status.band_member) :obj_switchscript play_special_anim params = {stance = <lose_stance> anim = idle blendduration = 0.0}
			else
				($player2_status.band_member) :obj_switchscript play_special_anim params = {stance = <win_stance> anim = idle blendduration = 0.0}
				($player1_status.band_member) :obj_switchscript play_special_anim params = {stance = <lose_stance> anim = idle blendduration = 0.0}
			endif
		endif
	endif
	if compositeobjectexists \{name = drummer}
		change \{structurename = drummer_info
			desired_twist = 0.0}
		change \{structurename = drummer_info
			last_left_arm_note = 0}
		change \{structurename = drummer_info
			last_right_arm_note = 0}
		drummer :obj_switchscript \{play_special_anim
			params = {
				stance = win
				anim = idle
				blendduration = 0.0
			}}
	endif
	if compositeobjectexists \{name = vocalist}
		vocalist :obj_switchscript \{play_special_anim
			params = {
				stance = win
				anim = idle
				blendduration = 0.0
			}}
	endif
	restore_idle_faces
endscript

script play_lose_anims 

	if ($disable_band = 1)
		return
	endif
	win_stance = win
	lose_stance = lose
	if (usesmallvenueanims)

		win_stance = win_smstg
		lose_stance = lose_smstg
	endif
	if ((($current_num_players = 1) && ($boss_battle = 0)) || ($game_mode = p2_coop) || ($game_mode = p2_career))
		guitarist :obj_switchscript play_special_anim params = {stance = <lose_stance> anim = idle blendduration = 0.0}
		bassist :obj_switchscript play_special_anim params = {stance = <lose_stance> anim = idle blendduration = 0.0}
	else
		if ($boss_battle = 1)
			guitarist :obj_switchscript play_special_anim params = {stance = <lose_stance> anim = idle blendduration = 0.0}
			bassist :obj_switchscript play_special_anim params = {stance = <win_stance> anim = idle blendduration = 0.0}
		else

			p1_won = true
			if ($game_mode = p2_battle)
				if (($player2_status.current_health) > ($player1_status.current_health))
					p1_won = false
				endif
			else
				if (($player2_status.score) > ($player1_status.score))
					p1_won = false
				endif
			endif
			if (<p1_won> = true)
				($player1_status.band_member) :obj_switchscript play_special_anim params = {stance = <win_stance> anim = idle blendduration = 0.0}
				($player2_status.band_member) :obj_switchscript play_special_anim params = {stance = <lose_stance> anim = idle blendduration = 0.0}
			else
				($player2_status.band_member) :obj_switchscript play_special_anim params = {stance = <win_stance> anim = idle blendduration = 0.0}
				($player1_status.band_member) :obj_switchscript play_special_anim params = {stance = <lose_stance> anim = idle blendduration = 0.0}
			endif
		endif
	endif
	if compositeobjectexists \{name = drummer}
		change \{structurename = drummer_info
			last_left_arm_note = 0}
		change \{structurename = drummer_info
			last_right_arm_note = 0}
		change \{structurename = drummer_info
			desired_twist = 0.0}
		drummer :obj_switchscript \{play_special_anim
			params = {
				stance = lose
				anim = idle
				blendduration = 0.0
			}}
	endif
	if compositeobjectexists \{name = vocalist}
		vocalist :obj_switchscript \{play_special_anim
			params = {
				stance = lose
				anim = idle
				blendduration = 0.0
			}}
	endif
	restore_idle_faces
endscript

script restore_idle_faces 
	if compositeobjectexists \{name = guitarist}
		guitarist :obj_killspawnedscript \{name = facial_anim_loop}
		guitarist :obj_spawnscriptnow \{facial_anim_loop}
	endif
	if compositeobjectexists \{name = bassist}
		bassist :obj_killspawnedscript \{name = facial_anim_loop}
		bassist :obj_spawnscriptnow \{facial_anim_loop}
	endif
	if compositeobjectexists \{name = vocalist}
		vocalist :obj_killspawnedscript \{name = facial_anim_loop}
		vocalist :obj_spawnscriptnow \{facial_anim_loop}
	endif
	if compositeobjectexists \{name = drummer}
		drummer :obj_killspawnedscript \{name = facial_anim_loop}
		drummer :obj_spawnscriptnow \{facial_anim_loop}
	endif
endscript

script hide_band 
	if compositeobjectexists \{guitarist}
		guitarist :hide
	endif
	if compositeobjectexists \{bassist}
		bassist :hide
	endif
	if compositeobjectexists \{vocalist}
		vocalist :hide
	endif
	if compositeobjectexists \{drummer}
		drummer :hide
	endif
endscript

script unhide_band 
	if compositeobjectexists \{guitarist}
		guitarist :unhide
	endif
	if compositeobjectexists \{bassist}
		bassist :unhide
	endif
	if compositeobjectexists \{vocalist}
		vocalist :unhide
	endif
	if compositeobjectexists \{drummer}
		drummer :unhide
	endif
endscript
using_walk_camera = false

script start_walk_camera 
	if ($using_walk_camera = true || $using_starpower_camera = true || $game_mode = training)
		return
	endif
	change \{using_walk_camera = true}
	change \{cameracuts_allownotescripts = false}
	cameracuts_setarrayprefix \{prefix = 'cameras_walk'
		changetime = $max_walk_camera_cut_delay}
	wait \{7
		seconds}
	cameracuts_setarrayprefix \{prefix = 'cameras'}
	change \{cameracuts_allownotescripts = true}
	change \{using_walk_camera = false}
endscript

script kill_walk_camera \{changecamera = 1}
	if ($using_walk_camera = false || $game_mode = training)
		return
	endif
	killspawnedscript \{name = start_walk_camera}
	if (<changecamera> = 1)
		cameracuts_setarrayprefix \{prefix = 'cameras'}
	endif
	change \{cameracuts_allownotescripts = true}
	change \{using_walk_camera = false}
endscript
