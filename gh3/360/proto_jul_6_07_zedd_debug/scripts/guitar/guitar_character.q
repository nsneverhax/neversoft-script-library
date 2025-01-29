guitarist_info = {
	anim_set = judy_animations
	stance = stance_frontend
	finger_anims = guitarist_finger_anims_large
	fret_anims = guitarist_fret_anims
	strum = normal
	guitar_model = none
	playing_missed_note = false
	last_strum_length = short
	current_anim = idle
	anim_repeat_count = 1
	arms_disabled = false
	disable_arms = false
	cycle_anim = false
	next_stance = stance_frontend
	next_anim = none
	next_anim_repeat_count = 1
	next_anim_disable_arms = false
	cycle_next_anim = false
	last_anim_name = none
	allow_movement = true
	target_node = none
	facial_anim = idle
}
bassist_info = {
	anim_set = axel_animations
	stance = stance_frontend
	finger_anims = guitarist_finger_anims_large
	fret_anims = guitarist_fret_anims
	strum = normal
	bass_model = none
	playing_missed_note = false
	last_strum_length = short
	current_anim = idle
	anim_repeat_count = 1
	arms_disabled = false
	disable_arms = false
	cycle_anim = false
	next_stance = stance_frontend
	next_anim = none
	next_anim_repeat_count = 1
	next_anim_disable_arms = false
	cycle_next_anim = false
	last_anim_name = none
	allow_movement = true
	target_node = none
	facial_anim = idle
}
vocalist_info = {
	anim_set = vocalist_animations
	stance = stance_a
	current_anim = idle
	anim_repeat_count = 1
	disable_arms = false
	cycle_anim = false
	next_stance = stance_a
	next_anim = none
	next_anim_repeat_count = 1
	next_anim_disable_arms = false
	cycle_next_anim = false
	last_anim_name = none
	allow_movement = true
	target_node = none
	facial_anim = idle
}
drummer_info = {
	anim_set = drummer_animations
	stance = stance_a
	current_anim = idle
	anim_repeat_count = 1
	disable_arms = false
	cycle_anim = false
	next_stance = stance_a
	next_anim = none
	next_anim_repeat_count = 1
	next_anim_disable_arms = false
	cycle_next_anim = false
	last_anim_name = none
	allow_movement = true
	target_node = none
	twist = 0.0
	desired_twist = 0.0
	facial_anim = idle
}
current_bass_model = none

script create_band async = 0
	if ($disable_band = 1)
		return
	endif
	if ($current_num_players = 1)
		create_guitarist async = <async>
		create_drummer async = <async>
		get_song_struct song = ($current_song)
		if structurecontains structure = <song_struct> name = bassist
			bassist_profile = (<song_struct>.bassist)
			create_bassist profile_name = <bassist_profile> async = <async>
		else
			create_bassist async = <async>
		endif
		if structurecontains structure = <song_struct> name = singer
			if (<song_struct>.singer = none)
				if compositeobjectexists name = vocalist
					unload_character name = vocalist
				endif
			else
				if (<song_struct>.singer = female)
					singer_profile = "singer_female"
				elseif (<song_struct>.singer = bret)
					singer_profile = "singer_bret"
				else
					singer_profile = "singer"
				endif
				create_vocalist profile_name = <singer_profile> async = <async>
			endif
		else
			create_vocalist profile_name = "singer" async = <async>
		endif
	else
		unload_character name = vocalist
		create_guitarist name = guitarist async = <async>
		create_guitarist name = bassist async = <async>
		create_drummer async = <async>
	endif
	set_bandvisible
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
	if find_profile_by_id id = ($<player_status>.character_id)
		<found> = 1
	endif
	if (<found> = 1)
		if gotparam no_guitar
			<instrument_id> = none
		else
			if ($boss_battle = 1 && <name> = bassist)
				get_musician_profile_struct index = <index>
				<instrument_id> = (<profile_struct>.musician_instrument.desc_id)
			else
				<instrument_id> = ($<player_status>.instrument_id)
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

script create_guitarist name = guitarist profile_name = 'judy' instrument_id = instrument_les_paul_black async = 0 animpak = 1
	extendcrc <name> '_Info' out = info_struct
	printf channel = animinfo "creating guitarist - %a ........." a = <name>
	create_guitarist_profile <...>
	if (<found> = 1)
		if gotparam node_name
			waypoint_id = <node_name>
		else
			get_start_node_id member = <name>
		endif
		if doeswaypointexist name = <waypoint_id>
			change structurename = <info_struct> target_node = <waypoint_id>
		else
			printf "unable to find starting position for %a ........" a = <name>
		endif
		cleareventhandlergroup hand_events
		create_band_member name = <name> profile = <profile> start_node = <waypoint_id> <...>
		change structurename = <player_status> band_member = <name>
		get_musician_profile_struct index = <index>
		change structurename = <info_struct> anim_set = (<profile_struct>.anim_set)
		change structurename = <info_struct> finger_anims = (<profile_struct>.finger_anims)
		change structurename = <info_struct> fret_anims = (<profile_struct>.fret_anims)
		change structurename = <info_struct> strum = (<profile_struct>.strum_anims)
		change structurename = <info_struct> allow_movement = true
		change structurename = <info_struct> arms_disabled = false
		change structurename = <info_struct> disable_arms = false
		change structurename = <info_struct> next_stance = ($<info_struct>.stance)
		stance = ($<info_struct>.stance)
		printf channel = animinfo "creating guitarist in stance %a ........" a = <stance>
		if (<stance> = stance_frontend || <stance> = stance_frontend_guitar)
			change structurename = <info_struct> arms_disabled = true
			change structurename = <info_struct> disable_arms = true
			<name> :hero_disable_arms blend_time = 0.0
		else
			<name> :hero_enable_arms blend_time = 0.0
		endif
		finger_anims = ($<info_struct>.finger_anims)
		fret_anims = ($<info_struct>.fret_anims)
		strum_type = ($<info_struct>.strum)
		extendcrc <strum_type> '_Strums' out = strum_anims
		if NOT gotparam no_strum
			<name> :hero_play_strum_anim anim = ($<strum_anims>.no_strum_anim)
			<name> :hero_play_fret_anim anim = (<fret_anims>.track_123)
			<name> :hero_play_finger_anim anim = (<finger_anims>.track_none)
		endif
		<name> :ragdoll_setaccessorybones accessory_bones = $guitarist_accessory_bones
		<name> :obj_switchscript guitarist_idle
		if gotparam no_anim
			spawnscriptnow temp_hero_pause_script params = {name = <name>}
		endif
	else
		printf "profile not found in create_guitarist! ........."
	endif
endscript

script temp_hero_pause_script 
	wait \{1
		gameframes}
	if <name> :anim_animnodeexists id = bodytimer
		<name> :anim_command target = bodytimer command = timer_setspeed params = {speed = 0.0}
	endif
endscript

script create_bassist name = bassist profile_name = 'bassist' async = 0
	extendcrc <name> '_Info' out = info_struct
	printf channel = animinfo "creating bassist - %a ........." a = <name>
	find_profile name = <profile_name>
	if (<found> = 1)
		get_start_node_id member = <name>
		if doeswaypointexist name = <waypoint_id>
			getwaypointpos name = <waypoint_id>
			change structurename = <info_struct> target_node = <waypoint_id>
		else
			printf "unable to find starting position for %a ........" a = <name>
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
		create_band_member name = <name> profile = <profile> start_node = <waypoint_id> <...>
		get_musician_profile_struct index = <index>
		change structurename = <info_struct> anim_set = (<profile_struct>.anim_set)
		change structurename = <info_struct> finger_anims = (<profile_struct>.finger_anims)
		change structurename = <info_struct> fret_anims = (<profile_struct>.fret_anims)
		change structurename = <info_struct> strum = (<profile_struct>.strum_anims)
		change structurename = <info_struct> allow_movement = true
		change structurename = <info_struct> arms_disabled = false
		if gotparam stance
			change structurename = <info_struct> stance = <stance>
		else
			change structurename = <info_struct> stance = (<profile_struct>.stance)
		endif
		finger_anims = ($<info_struct>.finger_anims)
		fret_anims = ($<info_struct>.fret_anims)
		strum_type = ($bassist_info.strum)
		extendcrc <strum_type> '_Strums' out = strum_anims
		if NOT gotparam no_strum
			<name> :hero_play_strum_anim anim = ($<strum_anims>.no_strum_anim)
			<name> :hero_play_fret_anim anim = (<fret_anims>.track_101)
			<name> :hero_play_finger_anim anim = (<finger_anims>.track_none)
		endif
		<name> :ragdoll_setaccessorybones accessory_bones = $guitarist_accessory_bones
		<name> :obj_switchscript guitarist_idle
	else
		printf "profile not found in create_bassist! ........."
	endif
endscript

script create_vocalist name = vocalist profile_name = 'singer' async = 0
	extendcrc <name> '_Info' out = info_struct
	printf "creating vocalist - %a ........." a = <name>
	find_profile name = <profile_name>
	if (<found> = 1)
		get_start_node_id member = <name>
		if doeswaypointexist name = <waypoint_id>
			getwaypointpos name = <waypoint_id>
			change structurename = <info_struct> target_node = <waypoint_id>
		else
			printf "unable to find starting position for %a ........" a = <name>
		endif
		get_musician_profile_struct index = <index>
		create_band_member name = <name> profile = <profile_struct> start_node = <waypoint_id> <...>
		change structurename = <info_struct> anim_set = (<profile_struct>.anim_set)
		change structurename = <info_struct> allow_movement = true
		if gotparam stance
			change structurename = <info_struct> stance = <stance>
		else
			change structurename = <info_struct> stance = (<profile_struct>.stance)
		endif
		<name> :ragdoll_setaccessorybones accessory_bones = $guitarist_accessory_bones
		<name> :obj_switchscript bandmember_idle
	else
		printf "profile not found in create_vocalist! ........."
	endif
endscript

script create_drummer name = drummer profile_name = 'drummer' async = 0
	extendcrc <name> '_Info' out = info_struct
	printf "creating drummer - %a ........." a = <name>
	find_profile name = <profile_name>
	if (<found> = 1)
		get_start_node_id member = <name>
		if doeswaypointexist name = <waypoint_id>
			getwaypointpos name = <waypoint_id>
			change structurename = <info_struct> target_node = <waypoint_id>
		else
			printf "unable to find starting position for %a ........" a = <name>
		endif
		get_musician_profile_struct index = <index>
		create_band_member name = <name> profile = <profile_struct> start_node = <waypoint_id> <...>
		change structurename = <info_struct> anim_set = (<profile_struct>.anim_set)
		change structurename = <info_struct> allow_movement = true
		if gotparam stance
			change structurename = <info_struct> stance = <stance>
		else
			change structurename = <info_struct> stance = (<profile_struct>.stance)
		endif
		<name> :ragdoll_setaccessorybones accessory_bones = $guitarist_accessory_bones
		<name> :obj_killspawnedscript name = drummer_autotwist
		<name> :obj_spawnscriptnow drummer_autotwist
		<name> :obj_switchscript bandmember_idle
	else
		printf "profile not found in create_drummer! ........."
	endif
endscript

script drummer_autotwist 
	hero_play_anim tree = $drummer_twist_branch target = bodytwist anim = test_drum_bodytwist_d blendduration = 0.0
	change_rate = 0.18
	begin
	twist = ($drummer_info.twist)
	desired_twist = ($drummer_info.desired_twist)
	diff = (<desired_twist> - <twist>)
	if (<twist> < <desired_twist>)
		if (<diff> < $drummer_twist_rate)
			twist = <desired_twist>
		else
			twist = (<twist> + $drummer_twist_rate)
		endif
	elseif (<twist> > <desired_twist>)
		if ((<diff> * -1) < $drummer_twist_rate)
			twist = <desired_twist>
		else
			twist = (<twist> - $drummer_twist_rate)
		endif
	endif
	drummer_twist strength = <twist>
	change structurename = drummer_info twist = <twist>
	wait 1 gameframe
	repeat
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

script 0x42f1ee7b anim = idle blendduration = 0.2
	obj_getid
	extendcrc <objid> '_Info' out = info_struct
	anim_set = ($<info_struct>.anim_set)
	stance = ($<info_struct>.stance)
	last_anim_name = ($<info_struct>.last_anim_name)
	0x193df704
	0x42194fa9
	casttointeger tempo
	if NOT gotparam anim_speed
		0x04724821
	endif
	display_debug_info = false
	if (should_display_debug_info)
		display_debug_info = true
	endif
	if NOT structurecontains structure = $<anim_set> name = <stance>
		return false
	endif
	if NOT structurecontains structure = ($<anim_set>.<stance>) name = <anim>
		printf channel = animinfo "%a's stance %b anim set does not include anim %c ...." a = <objid> b = <stance> c = <anim>
		return false
	endif
	anims = ($<anim_set>.<stance>.<anim>.<skill>.<anim_speed>)
	getarraysize <anims>
	getrandomvalue name = newindex integer a = 0 b = (<array_size> - 1)
	anim_name = (<anims> [<newindex>])
	if (<anim_name> = <last_anim_name>)
		blendduration = 0.0
	endif
	if (<display_debug_info> = true)
		printf channel = animinfo "%a now playing %b anim - %c" a = <objid> b = <anim> c = <anim_name>
		printf channel = 0x9e686549 "name-%a   anim-%b   stance-%c   tempo-%e(%d)   skill-%f   index-%g(of %h)   file-%i   blendtime-%j" a = <objid> b = <anim> c = <stance> d = <anim_speed> e = <tempo> f = <skill> g = (<newindex> + 1) h = <array_size> i = <anim_name> j = <blendduration>
	endif
	hero_play_anim anim = <anim_name> blendduration = <blendduration>
	change structurename = <info_struct> last_anim_name = <anim_name>
	return true
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

script hero_play_adjusting_random_anims blend_time = 0.2
	obj_getid
	extendcrc <objid> '_Info' out = info_struct
	count = 0
	begin
	anim = ($<info_struct>.current_anim)
	cycle = ($<info_struct>.cycle_anim)
	repeat_count = ($<info_struct>.anim_repeat_count)
	if (<objid> = guitarist || <objid> = bassist)
		if (($<info_struct>.disable_arms) = true)
			if ($<info_struct>.arms_disabled = false)
				hero_disable_arms
				change structurename = <info_struct> arms_disabled = true
			endif
		else
			if ($<info_struct>.arms_disabled = true)
				hero_enable_arms
				change structurename = <info_struct> arms_disabled = false
			endif
		endif
	endif
	if (<objid> = guitarist)
		if NOT (<anim> = idle)
			change structurename = <info_struct> facial_anim = <anim>
		endif
	endif
	if 0x42f1ee7b anim = <anim> blendduration = <blend_time>
		hero_wait_until_anim_finished
	else
		wait 1 gameframe
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
			printf channel = animinfo "%c stance now changing from %a to %b............" c = <objid> a = <stance> b = <next_stance>
		endif
		0x1a86ca93 anim_set = <anim_set> old_stance = <stance> new_stance = <next_stance>
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
					printf channel = animinfo "%a has finished playing anim %b " a = <objid> b = <anim>
				endif
				repeat_count = 0
			endif
		endif
		change structurename = <info_struct> anim_repeat_count = <repeat_count>
		if (<cycle> = false && <repeat_count> <= 0)
			change structurename = <info_struct> current_anim = idle
			change structurename = <info_struct> cycle_anim = true
			blend_time = 0.2
			if (<display_debug_info> = true)
				printf channel = animinfo "%a has no anims in queue...returning to idle" a = <objid>
			endif
		else
			blend_time = 0.2
			if (<display_debug_info> = true)
				if (<cycle> = false)
					printf channel = animinfo "%a repeating the %c anim (%b more times)" c = <anim> a = <objid> b = <repeat_count>
				else
					printf channel = animinfo "%a %b anim is cycling" a = <objid> b = <anim>
				endif
			endif
		endif
	else
		repeat_count = ($<info_struct>.next_anim_repeat_count)
		if ((<display_debug_info> = true) && (<next_anim> != none))
			if (<repeat_count> > 1)
				printf channel = animinfo "%a will play %b anim %c times ......." a = <objid> b = <next_anim> c = <repeat_count>
			else
			endif
		endif
		if (<next_anim> = none)
			if (<display_debug_info> = true)
				printf channel = animinfo "%a has no anims in queue...returning to idle" a = <objid>
			endif
			next_anim = idle
			cycle_next_anim = true
		else
			cycle_next_anim = ($<info_struct>.cycle_next_anim)
		endif
		if (<next_stance> = intro || <next_stance> = intro_smstg || <next_stance> = stance_frontend || <next_stance> = stance_frontend_guitar)
			disable_arms_next_anim = true
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
		change structurename = <info_struct> next_anim_disable_arms = false
		blend_time = 0.2
	endif
	repeat
endscript

script crowd_play_adjusting_random_anims anim = idle blend_time = 0.2
	obj_getid
	begin
	0x193df704
	0x04724821
	if gotparam anim_set
		anims = ($<anim_set>.<anim>.<skill>.<anim_speed>)
	else
		anims = ($crowd_animations.<anim>.<skill>.<anim_speed>)
	endif
	getarraysize <anims>
	getrandomvalue name = newindex integer a = 0 b = (<array_size> - 1)
	anim_name = (<anims> [<newindex>])
	if ($display_crowd_anim_info = true)
		printf channel = crowd "%a playing %b anim (%c) ..." a = <objid> b = <anim> c = <anim_name>
	endif
	gameobj_playanim anim = <anim_name>
	gameobj_waitanimfinished
	repeat
endscript

script hero_strum_guitar note_length = 150
	if (<note_length> < $short_strum_max_gem_length)
		anim_length = short
	elseif (<note_length> < $med_strum_max_gem_length)
		anim_length = med
	else
		anim_length = long
	endif
	obj_getid
	extendcrc <objid> '_Info' out = info_struct
	change structurename = <info_struct> last_strum_length = <anim_length>
	strum_type = ($<info_struct>.strum)
	extendcrc <strum_type> '_Strums' out = strum_anims
	if (($<info_struct>.playing_missed_note = false) || ($always_strum = true))
		getarraysize (<strum_anims>.<anim_length>)
		getrandomvalue name = newindex integer a = 0 b = (<array_size> - 1)
		strum_anim = (<strum_anims>.<anim_length> [<newindex>])
		hero_play_strum_anim anim = <strum_anim> blendduration = 0.1
	else
		strum_anims = bad_strums
		strum_anim = (<strum_anims>.<anim_length> [0])
		hero_play_strum_anim anim = <strum_anim> blendduration = 0.15
	endif
	hero_wait_until_anim_finished timer = strumtimer
	hero_play_strum_anim anim = (($<strum_anims>).no_strum_anim)
endscript

script hero_play_chord chord = track_none
	obj_getid
	extendcrc <objid> '_Info' out = info_struct
	finger_anims = ($<info_struct>.finger_anims)
	if structurecontains structure = $<finger_anims> name = <chord>
		finger_anim = (<finger_anims>.<chord>)
		if (<chord> = none)
			blend_time = $finger_release_blend_time
		else
			blend_time = $finger_press_blend_time
		endif
	else
		finger_anim = (<finger_anims>.none)
		blend_time = $finger_release_blend_time
	endif
	if (<finger_anim> != none)
		hero_play_finger_anim anim = <finger_anim> blendduration = <blend_time>
	endif
endscript

script find_profile 
	get_musician_profile_size
	if gotparam name
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
	elseif gotparam body_id
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
	return \{false}
endscript

script get_waypoint_id index = 0
	getpakmancurrent map = zones
	getpakmancurrentname map = zones
	if (<index> < 10)
		formattext textname = suffix '_TRG_Waypoint_0%a' a = <index>
	else
		formattext textname = suffix '_TRG_Waypoint_%a' a = <index>
	endif
	waypoint_name = (<pakname> + <suffix>)
	appendsuffixtochecksum base = <pak> suffixstring = <suffix>
	return waypoint_id = <appended_id> waypoint_name = <waypoint_name>
endscript

script get_start_node_id character = "guitarist"
	switch (<member>)
		case guitarist
		if ($current_num_players = 1)
			character = "guitarist"
		else
			character = "guitarist_player1"
		endif
		case bassist
		if ($current_num_players = 1)
			character = "bassist"
		else
			character = "guitarist_player2"
		endif
		case vocalist
		character = "vocalist"
		case drummer
		character = "drummer"
		default
		printf "Unknown character referenced in get_starting_position!"
		character = "unknown"
	endswitch
	getpakmancurrent map = zones
	getpakmancurrentname map = zones
	formattext textname = suffix '_TRG_Waypoint_%a_start' a = <character>
	waypoint_name = (<pakname> + <suffix>)
	appendsuffixtochecksum base = <pak> suffixstring = <suffix>
	return waypoint_id = <appended_id> waypoint_name = <waypoint_name>
endscript

script 0x42194fa9 
	0x4fc3b884 = ($player1_status.current_song_beat_time)
	if (<0x4fc3b884> = 0)
		tempo_bpm = 100
	else
		tempo_bpm = ((1000.0 / <0x4fc3b884>) * 60.0)
	endif
	return tempo = <tempo_bpm>
endscript

script 0x04724821 
	0x42194fa9
	0xced4aadb = (($slow_tempo + $med_tempo) * 0.5)
	0xda1d5fc3 = (($med_tempo + $fast_tempo) * 0.5)
	if (<tempo> < <0xced4aadb>)
		anim_speed = slow
	elseif (<tempo> < <0xda1d5fc3>)
		anim_speed = med
	else
		anim_speed = fast
	endif
	return anim_speed = <anim_speed>
endscript

script 0x193df704 
	obj_getid
	health = 1.0
	if (<objid> = guitarist)
		if (($current_num_players = 1) || ($player1_status.part = guitar))
			health = ($player1_status.current_health)
		else
			health = ($player2_status.current_health)
		endif
	elseif (<objid> = bassist)
		if (($current_num_players = 2) && ($player2_status.part = bass))
			health = ($player2_status.current_health)
		else
			health = ($player1_status.current_health)
		endif
	else
		health = ($player1_status.current_health)
	endif
	skill = normal
	if (<health> < 0.66)
		skill = bad
	elseif (<health> > 1.3299999)
		skill = good
	endif
	return skill = <skill>
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
			printf channel = facial "facial anims not defined for %a ... reverting to idle" a = <anim>
		endif
		anim = idle
	endif
	anims = ($<anim_set>.facial_anims.<anim>)
	getarraysize <anims>
	getrandomvalue name = index integer a = 0 b = (<array_size> - 1)
	anim_name = (<anims> [<index>])
	if ($display_facial_anim_info = true)
		printf channel = facial "playing facial anim - %a (%b) ..." a = <anim> b = <anim_name>
	endif
	change structurename = <info_struct> facial_anim = idle
	hero_play_facial_anim anim = <anim_name>
	hero_wait_until_anim_finished timer = facialtimer
	wait 1 gameframe
	repeat
endscript
guitarist_idle_eventtable = [
	{
		response = call_script
		event = start_playing
		scr = handle_start_playing
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
	reseteventhandlersfromtable guitarist_idle_eventtable group = hand_events
	obj_getid
	if (<objid> = guitarist)
		seteventhandler response = call_script event = strum_guitar scr = handle_strum_event group = hand_events
	else
		if ($game_mode = p2_battle)
			seteventhandler response = call_script event = strum_guitar scr = handle_strum_event group = hand_events
		else
			seteventhandler response = call_script event = 0xe76c8218 scr = handle_strum_event group = hand_events
		endif
	endif
	if (($player1_status.band_member) = <objid>)
		seteventhandler response = call_script event = star_power_onp1 scr = handle_star_power group = hand_events
	else (($player2_status.band_member) = <objid>)
		seteventhandler response = call_script event = star_power_onp2 scr = handle_star_power group = hand_events
	endif
	obj_killspawnedscript name = hero_play_adjusting_random_anims
	obj_spawnscriptnow hero_play_adjusting_random_anims params = {anim = idle blend_time = 0.2 cycle}
	obj_killspawnedscript name = facial_anim_loop
	obj_spawnscriptnow facial_anim_loop
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
	obj_getid
	if (<objid> = guitarist)
		seteventhandler \{response = call_script
			event = strum_guitar
			scr = handle_strum_event
			group = hand_events}
	else
		seteventhandler \{response = call_script
			event = 0xe76c8218
			scr = handle_strum_event
			group = hand_events}
	endif
	obj_killspawnedscript \{name = hero_play_adjusting_random_anims}
	walk_to_waypoint <...>
	obj_switchscript \{guitarist_idle}
endscript

script play_special_anim stance = stance_a disable_arms = true
	obj_getid
	extendcrc <objid> '_Info' out = info_struct
	cleareventhandlergroup hand_events
	seteventhandler response = call_script event = change_stance scr = queue_change_stance group = hand_events
	obj_killspawnedscript name = hero_play_adjusting_random_anims
	if (<disable_arms> = true)
		if (<objid> = guitarist || <objid> = bassist)
			hero_disable_arms blend_time = 0.0
		endif
	endif
	change structurename = <info_struct> stance = <stance>
	0x42f1ee7b anim = <anim> blendduration = 0.0
	if (<objid> = guitarist || <objid> = bassist)
		hero_wait_until_anim_near_end time_from_end = 0.25
		hero_enable_arms blend_time = 0.25
	endif
	hero_wait_until_anim_finished
	change structurename = <info_struct> stance = stance_a
	if (<objid> = guitarist || <objid> = bassist)
		obj_switchscript guitarist_idle
	else
		obj_switchscript bandmember_idle
	endif
endscript

script play_simple_anim disable_arms = true
	obj_getid
	extendcrc <objid> '_Info' out = info_struct
	cleareventhandlergroup hand_events
	obj_killspawnedscript name = hero_play_adjusting_random_anims
	if (<disable_arms> = true)
		if (<objid> = guitarist || <objid> = bassist)
			hero_disable_arms blend_time = 0.0
		endif
	endif
	hero_play_anim anim = <anim> blendduration = 0.0
	if (<objid> = guitarist || <objid> = bassist)
		hero_wait_until_anim_near_end time_from_end = 0.25
		hero_enable_arms blend_time = 0.25
	endif
	hero_wait_until_anim_finished
	change structurename = <info_struct> stance = stance_a
	if (<objid> = guitarist || <objid> = bassist)
		obj_switchscript guitarist_idle
	else
		obj_switchscript bandmember_idle
	endif
endscript

script handle_star_power 
	obj_switchscript \{play_special_anim
		params = {
			stance = stance_a
			anim = special
			disable_arms = false
		}}
endscript

script handle_song_won 
	printf \{channel = animinfo
		"handle song won............"}
	obj_switchscript \{play_special_anim
		params = {
			stance = win
			anim = idle
			kill_transitions_when_done
		}}
endscript

script handle_song_failed 
	printf \{channel = animinfo
		"handle song failed........."}
	obj_switchscript \{play_special_anim
		params = {
			stance = lose
			anim = idle
			kill_transitions_when_done
		}}
endscript

script play_intro_anims 
	printf channel = animinfo "play_intro_anims............."
	intro_stance = intro
	if (0xfbf32fda)
		printf channel = animinfo "Using small venue anims! ............"
		intro_stance = intro_smstg
	endif
	band_changestance name = guitarist stance = <intro_stance> no_wait
	band_changestance name = bassist stance = <intro_stance> no_wait
endscript

script 0xfbf32fda 
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
	printf channel = animinfo "play_win_anims............."
	win_stance = win
	lose_stance = lose
	if (0xfbf32fda)
		printf channel = animinfo "Using small venue anims! ............"
		win_stance = win_smstg
		lose_stance = lose_smstg
	endif
	if ((($current_num_players = 1) && ($boss_battle = 0)) || ($game_mode = p2_coop) || ($game_mode = p2_career))
		guitarist :obj_switchscript play_special_anim params = {stance = <win_stance> anim = idle kill_transitions_when_done}
		bassist :obj_switchscript play_special_anim params = {stance = <win_stance> anim = idle kill_transitions_when_done}
	else
		if ($boss_battle = 1)
			guitarist :obj_switchscript play_special_anim params = {stance = <win_stance> anim = idle kill_transitions_when_done}
			bassist :obj_switchscript play_special_anim params = {stance = <lose_stance> anim = idle kill_transitions_when_done}
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
				($player1_status.band_member) :obj_switchscript play_special_anim params = {stance = <win_stance> anim = idle}
				($player2_status.band_member) :obj_switchscript play_special_anim params = {stance = <lose_stance> anim = idle}
			else
				($player2_status.band_member) :obj_switchscript play_special_anim params = {stance = <win_stance> anim = idle}
				($player1_status.band_member) :obj_switchscript play_special_anim params = {stance = <lose_stance> anim = idle}
			endif
		endif
	endif
	if compositeobjectexists name = drummer
		drummer :obj_switchscript play_special_anim params = {stance = <win_stance> anim = idle}
	endif
	if compositeobjectexists name = vocalist
		vocalist :obj_switchscript play_special_anim params = {stance = <win_stance> anim = idle}
	endif
endscript

script play_lose_anims 
	if ($disable_band = 1)
		return
	endif
	if ((($current_num_players = 1) && ($boss_battle = 0)) || ($game_mode = p2_coop) || ($game_mode = p2_career))
		guitarist :obj_switchscript play_special_anim params = {stance = lose anim = idle}
		bassist :obj_switchscript play_special_anim params = {stance = lose anim = idle}
	else
		if ($boss_battle = 1)
			guitarist :obj_switchscript play_special_anim params = {stance = lose anim = idle}
			bassist :obj_switchscript play_special_anim params = {stance = win anim = idle}
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
				($player1_status.band_member) :obj_switchscript play_special_anim params = {stance = win anim = idle}
				($player2_status.band_member) :obj_switchscript play_special_anim params = {stance = lose anim = idle}
			else
				($player2_status.band_member) :obj_switchscript play_special_anim params = {stance = win anim = idle}
				($player1_status.band_member) :obj_switchscript play_special_anim params = {stance = lose anim = idle}
			endif
		endif
	endif
	if compositeobjectexists name = drummer
		drummer :obj_switchscript play_special_anim params = {stance = lose anim = idle}
	endif
	if compositeobjectexists name = vocalist
		vocalist :obj_switchscript play_special_anim params = {stance = lose anim = idle}
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
