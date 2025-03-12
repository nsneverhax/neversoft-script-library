cache_build_band_members = 0
nondrummer_anim_node_ids = [
	body
	bodytimer
	moment_blend
	moment_branch
	momenttimer
	strumtimer
	frettimer
	fingertimer
	facialtimer
	ik
	lefthandpartial
	leftarm
	lefthand
	rightarm
	face
	strum_anim_mod
	fret_anim_mod
	chord_anim_mod
	maleanimadjust
	maleanimadjust_moment
	tweakbonesnode
	mirrornode
	femalediff
	vocal_face_mod
	heel
]
drummer_anim_node_ids = [
	body
	bodytimer
	facialtimer
	ik
	lefthandpartial
	leftarm
	lefthand
	rightarm
	face
	femalediff
	drumkit
	moment_branch
	moment_blend
	moment_timer
	faceoff_blend
	faceoff_branch
	faceoff_timer
	tweakbonesnode
	mirrornode
	heel
]

script create_band_member \{name = guitarist
		lightgroup = band
		async = 0
		pos = (0.0, 0.0, 0.0)
		dir = (0.0, 0.0, 1.0)}
	removeparameter \{profile_struct}
	create_band_member_wait_for_lock
	printf qs(0xc143fb65) a = <name>
	if gotparam \{start_node}
		if doeswaypointexist name = <start_node>
			getwaypointpos name = <start_node>
			getwaypointdir name = <start_node>
		endif
	endif
	if compositeobjectexists <name>
		scriptassert '%s already exists' s = <name>
	endif
	if (<name> = guitarist)
		if compositeobjectexists \{name = bassist}
			bassist :hero_pause_anim
		endif
	elseif (<name> = bassist)
		if compositeobjectexists \{name = guitarist}
			guitarist :hero_pause_anim
		endif
	endif
	if NOT gotparam \{asset_heap}
		get_best_heap_for_appearance appearance = (<profile>.appearance)
		asset_heap = <best_heap>
	endif
	anim_asset_context = <asset_heap>
	if get_body_key_from_appearance key = anim_struct appearance = (<profile>.appearance)
		if gotparam \{loading_into_song}
			get_anim_struct_member anim_struct = <anim_struct> loading_into_song = <loading_into_song> member = <instrument>
		else
		endif
		if NOT structurecontains structure = ($<anim_struct>) anim_asset_context
			scriptassert \{'anim_asset_context missing!'}
		endif
		anim_asset_context = (($<anim_struct>).anim_asset_context)
	else
		scriptassert \{'anim_struct not found in appearance'}
	endif
	removeparameter \{highway_texture}
	if gotparam \{loading_into_song}
		if gotparam \{player_status}
			if NOT (($<player_status>.part) = vocals)
				if NOT get_highway_struct_from_appearance part = ($<player_status>.part) appearance = (<profile>.appearance)
					scriptassert \{'Problem grabbing highway struct'}
				endif
				if (($is_attract_mode = 1) || ((<profile>.name) = emptyguy))
					highway_pak = highway_axel
					highway_texture = `tex\models\highway\highway_axel_fm_01.dds`
				endif
				mpm_object_load_pak pak = <highway_pak> owner = <name> async = <async>
			endif
		else
			if ((<profile>.name) = jimi)
				if (<name> = vocalist)
					if NOT get_highway_struct_from_appearance part = <instrument> appearance = (<profile>.appearance)
						scriptassert \{'Problem grabbing highway struct'}
					endif
					mpm_object_unload_paks owner = guitarist async = <async>
					mpm_object_load_pak pak = <highway_pak> owner = <name> async = <async>
					get_band_member_player_status \{part = guitar}
					if gotparam \{band_member_player_status}
						change structurename = <band_member_player_status> highway_texture = <highway_texture>
						change structurename = <band_member_player_status> band_member = vocalist
					endif
					removeparameter \{highway_texture}
				endif
			endif
			if ((<profile>.name) = travis)
				if (<name> = drummer)
					if NOT get_highway_struct_from_appearance part = <instrument> appearance = (<profile>.appearance)
						scriptassert \{'Problem grabbing highway struct'}
					endif
					mpm_object_unload_paks owner = drummer async = <async>
					mpm_object_load_pak pak = <highway_pak> owner = <name> async = <async>
					get_band_member_player_status \{part = drum}
					if gotparam \{band_member_player_status}
						change structurename = <band_member_player_status> highway_texture = <highway_texture>
						change structurename = <band_member_player_status> band_member = drummer
					endif
					removeparameter \{highway_texture}
				endif
			endif
		endif
	endif
	if (<name> = guitarist)
		if compositeobjectexists \{name = bassist}
			bassist :hero_unpause_anim
		endif
	elseif (<name> = bassist)
		if compositeobjectexists \{name = guitarist}
			guitarist :hero_unpause_anim
		endif
	endif
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_viewer
		lightgroup = none
		default
		switch <name>
			case drummer
			case drummer2
			lightgroup = [band drummer]
			case bassist
			lightgroup = [band alt_band bassist]
			case guitarist
			case guitarist2
			lightgroup = [band alt_band guitarist]
			case vocalist
			case vocalist2
			lightgroup = [band alt_band vocalist]
			default
			lightgroup = [band alt_band]
		endswitch
	endswitch
	ik_params = hero_ik_params
	if NOT get_body_key_from_appearance key = skeleton appearance = (<profile>.appearance)
		scriptassert \{'Missing skeleton in appearance'}
	endif
	if NOT get_body_key_from_appearance key = skeleton_path appearance = (<profile>.appearance)
		scriptassert \{'Missing skeleton_path in appearance'}
	endif
	if NOT get_body_key_from_appearance key = ragdoll appearance = (<profile>.appearance)
		scriptassert \{'Missing ragdoll in appearance'}
	endif
	if NOT get_body_key_from_appearance key = ragdoll_path appearance = (<profile>.appearance)
		scriptassert \{'Missing ragdoll_path in appearance'}
	endif
	if NOT get_body_key_from_appearance key = ragdoll_collision_group appearance = (<profile>.appearance)
		scriptassert \{'Missing ragdoll_collision_group in appearance'}
	endif
	if NOT get_body_key_from_appearance key = accessory_bones appearance = (<profile>.appearance)
		scriptassert \{'Missing accessory_bones in appearance'}
	endif
	get_body_key_from_appearance key = ik_params appearance = (<profile>.appearance)
	if gotparam \{loading_into_song}
		switch (<instrument>)
			case vocals
			if get_body_key_from_appearance key = ik_params_vocals appearance = (<profile>.appearance)
				ik_params = <ik_params_vocals>
				printf 'Using ik_params_vocals - %s' s = <ik_params> donotresolve
			endif
			case drum
			if get_body_key_from_appearance key = ik_params_drum appearance = (<profile>.appearance)
				ik_params = <ik_params_drum>
				printf 'Using ik_params_drum - %s' s = <ik_params> donotresolve
			endif
			default
			if get_body_key_from_appearance key = ik_params_guitar appearance = (<profile>.appearance)
				ik_params = <ik_params_guitar>
				printf 'Using ik_params_guitar - %s' s = <ik_params> donotresolve
			endif
		endswitch
	else
		if get_body_key_from_appearance key = ik_params_frontend appearance = (<profile>.appearance)
			ik_params = <ik_params_frontend>
			printf 'Using ik_params_frontend - %s' s = <ik_params> donotresolve
		endif
	endif
	if gotparam \{player_status}
		if gotparam \{highway_texture}
			change structurename = <player_status> highway_texture = <highway_texture>
		endif
		change structurename = <player_status> band_member = <name>
	endif
	<band_member_components1> = [
		{
			component = skeleton
			uniqueskeletonpath = <skeleton_path>
			skeletonname = <skeleton>
			allow_reset
			heap = heap_ragskel
		}
		{
			component = ragdoll
			initialize_empty = false
			disable_collision_callbacks
			useuniqueskeleton
			ragdollname = <ragdoll>
			uniqueragdollpath = <ragdoll_path>
			ragdollcollisiongroup = $<ragdoll_collision_group>
			heap = heap_ragskel
			accessory_bones = $<accessory_bones>
		}
		{
			component = setdisplaymatrix
		}
		{
			component = animtree
		}
	]
	switch <name>
		case guitarist
		case guitarist2
		case bassist
		case vocalist
		case vocalist2
		<band_member_components2> = [
			{
				component = wavecastermaterialupdate
			}
		]
		default
		<band_member_components2> = []
	endswitch
	<band_member_components3> = [
		{
			component = model
			lightgroup = <lightgroup>
		}
		{
			component = motion
		}
		{
			component = modelbuilder
			global_storage = <asset_heap>
		}
	]
	createcompositeobject {
		components = (<band_member_components1> + <band_member_components2> + <band_member_components3>)
		params = {
			<profile>
			pos = <pos>
			assetcontext = <anim_asset_context>
			object_type = bandmember
			profilebudget = 800
			name = <name>
		}
	}
	<name> :obj_setorientation dir = <dir>
	get_body_checksum_from_appearance appearance = (<profile>.appearance)
	get_is_female_from_appearance appearance = (<profile>.appearance)
	<name> :settags asset_heap = <asset_heap>
	<name> :settags body_checksum = <body_checksum>
	<name> :settags is_female = <is_female>
	if gotparam \{anim_struct_member}
		<name> :settags anim_struct = (<anim_struct_member>.anim_set)
	endif
	switch <name>
		case cas_musician1
		case cas_musician2
		case cas_musician3
		case cas_musician4
		desired_tree = frontend_static_tree
		default
		switch (<instrument>)
			case vocals
			desired_tree = vocalist_static_tree
			case drum
			desired_tree = drummer_static_tree
			default
			desired_tree = guitarist_static_tree
		endswitch
		if ((<profile>.name) = james)
			if (<desired_tree> = guitarist_static_tree)
				desired_tree = guitarist_face_tension_static_tree
			elseif (<desired_tree> = vocalist_static_tree)
				desired_tree = vocalist_face_tension_static_tree
			endif
		endif
	endswitch
	if (<instrument> = drum)
		node_ids = $drummer_anim_node_ids
	else
		node_ids = $nondrummer_anim_node_ids
	endif
	<name> :anim_inittree {
		tree = $<desired_tree>
		nodeiddeclaration = <node_ids>
		params = {
			ik_params = <ik_params>
		}
	}
	if (<instrument> = drum)
		if (<is_female> = 1)
			<name> :anim_command target = femalediff command = applyfemaledrummerdifference_setanim params = {anim = gh_rocker_female_drummer_d}
		endif
	endif
	printf \{'Backing up bones'}
	<name> :obj_resetbones
	printf \{'Done backing up bones'}
	with_mic = 0
	if gotparam \{loading_into_song}
		get_song_struct song = <loading_into_song>
		if structurecontains structure = <song_struct> parts_with_mic
			if arraycontains array = (<song_struct>.parts_with_mic) contains = <name>
				with_mic = 1
			endif
		endif
	endif
	if (<name> = vocalist)
		if (<instrument> = guitar || <instrument> = bass)
			with_mic = 1
		endif
	endif
	extendcrc <name> '_Info' out = info_struct
	change structurename = <info_struct> part = <instrument>
	change structurename = <info_struct> playing = true
	<name> :settags instrument = <instrument> lightgroup = <lightgroup>
	if NOT <name> :build_band_member_from_appearance {
			name = (<profile>.name)
			appearance = (<profile>.appearance)
			lightgroup = <lightgroup>
			async = <async>
			instrument = <instrument>
			loading_into_song = <loading_into_song>
			asset_heap = <asset_heap>
			with_mic = <with_mic>
		}
		cancelled = 1
	endif
	printf 'anim_asset_context context=%c' c = <anim_asset_context>
	create_band_member_unlock
	if gotparam \{cancelled}
		return \{false}
	endif
	return \{true}
endscript

script get_body_checksum_from_appearance 
	if structurecontains structure = <appearance> cas_body
		return body_checksum = ((<appearance>.cas_body).desc_id)
	endif
	if structurecontains structure = <appearance> cas_full_body
		return body_checksum = ((<appearance>.cas_full_body).desc_id)
	endif
	printstruct <appearance>
	scriptassert \{'Character has no body!'}
endscript

script get_is_female_from_appearance 
	if structurecontains structure = <appearance> cas_body
		getactualcasoptionstruct part = cas_body desc_id = ((<appearance>.cas_body).desc_id)
	endif
	if structurecontains structure = <appearance> cas_full_body
		getactualcasoptionstruct part = cas_full_body desc_id = ((<appearance>.cas_full_body).desc_id)
	endif
	if NOT gotparam \{is_female}
		scriptassert \{'Character has no body!'}
	endif
	return is_female = <is_female>
endscript

script build_band_member_from_appearance \{instrument = guitar
		with_mic = 0}
	if NOT gotparam \{loading_into_song}
		instrument = none
	else
		maybe_use_song_or_venue_specific_instrument {song = $current_song venue = $current_level appearance = <appearance> name = <name>}
	endif
	if (<with_mic> = 1)
		if (<instrument> = guitar)
			instrument = guitar_and_vocals
		elseif (<instrument> = bass)
			instrument = bass_and_vocals
		elseif (<instrument> = vocals)
			instrument = guitar_and_vocals
		endif
	endif
	if buildcasmodel {
			appearance = <appearance>
			async = <async>
			buildscriptparams = {
				instrument = <instrument>
				new_object = 1
				loading_into_song = <loading_into_song>
			}
		}
		obj_getid
		if (<with_mic> = 1 && <objid> != vocalist)
			if NOT (<instrument> = vocals)
				hide_mic
			endif
		endif
		return \{true}
	endif
	return \{false}
endscript

script get_anim_struct_member 
	if gotparam \{loading_into_song}
		get_song_prefix song = <loading_into_song>
		extendcrc <anim_struct> '_' out = song_anim_struct
		extendcrc <song_anim_struct> <song_prefix> out = song_anim_struct
		if globalexists name = <song_anim_struct> type = structure
			if use_alternate_anim_struct song = <loading_into_song>
				appendsuffixtochecksum base = <song_anim_struct> suffixstring = '_alt'
				if globalexists name = <appended_id> type = structure
					song_anim_struct = <appended_id>
				endif
			endif
			if structurecontains structure = ($<song_anim_struct>) <member>
				printf 'get_anim_struct_member - Using song anim struct : %s' s = <song_anim_struct> donotresolve
				printstruct <...>
				return true anim_struct_member = (($<song_anim_struct>).<member>)
			elseif (<member> = bass || <member> = rhythm)
				printf \{'get_anim_struct_member - Dropping from bass to guitar struct'}
				if structurecontains structure = ($<song_anim_struct>) guitar
					printf 'get_anim_struct_member - Using song anim struct : %s' s = <song_anim_struct> donotresolve
					return true anim_struct_member = (($<song_anim_struct>).guitar)
				endif
			endif
		endif
	endif
	if globalexists name = <anim_struct> type = structure
		if NOT ($guitar_character_loops_state = loop_paks_enabled)
			appendsuffixtochecksum base = <anim_struct> suffixstring = '_alt'
			if globalexists name = <appended_id> type = structure
				anim_struct = <appended_id>
			endif
		endif
		if structurecontains structure = ($<anim_struct>) <member>
			printf 'get_anim_struct_member - Using global anim struct : %s' s = <anim_struct> donotresolve
			printstruct <...>
			return true anim_struct_member = (($<anim_struct>).<member>)
		elseif (<member> = bass || <member> = rhythm)
			printf \{'get_anim_struct_member - Dropping from bass to guitar struct'}
			if structurecontains structure = ($<anim_struct>) guitar
				printf 'get_anim_struct_member - Using global anim struct : %s' s = <anim_struct> donotresolve
				return true anim_struct_member = (($<anim_struct>).guitar)
			endif
		endif
	endif
	printf 'get_anim_struct_member - Failed! : %s' s = <anim_struct> donotresolve
	printstruct <...>
	return \{false}
endscript

script preload_band_member \{name = guitarist
		async = 0}
	create_band_member_wait_for_lock
	filename_crc = none
	instrument_crc = none
	create_band_member_unlock
	return filename_crc = <filename_crc> instrument_crc = <instrument_crc> true
endscript

script preload_band_member_finish \{name = guitarist
		async = 0}
	create_band_member_wait_for_lock
	create_band_member_unlock
endscript
create_band_member_lock_queue = 0
create_band_member_lock = 0

script create_band_member_unlock 
	change \{create_band_member_lock = 0}
endscript

script create_band_member_wait_for_lock 
	begin
	if ($create_band_member_lock_queue = 0)
		break
	endif
	wait \{1
		gameframe}
	repeat
	change \{create_band_member_lock_queue = 1}
	begin
	if ($create_band_member_lock = 0)
		break
	endif
	wait \{1
		gameframe}
	repeat
	change \{create_band_member_lock_queue = 0}
	change \{create_band_member_lock = 1}
endscript

script destroy_band 
	if ($in_tutorial_mode = 1)
		scriptassert \{'should not destroy band in tutorial mode'}
	endif
	cas_destroy_all_characters
	band_stop_anims
	destroy_band_member \{name = guitarist}
	destroy_band_member \{name = guitarist2}
	destroy_band_member \{name = bassist}
	destroy_band_member \{name = bassist2}
	destroy_band_member \{name = drummer}
	destroy_band_member \{name = drummer2}
	destroy_band_member \{name = vocalist}
	destroy_band_member \{name = vocalist2}
	band_unload_anim_paks
	if gotparam \{unload_paks}
		mpm_flush_all_paks
	endif
endscript

script destroy_band_member 
	if compositeobjectexists name = <name>
		bandmanager_removecharacter name = <name>
		<name> :die
		mpm_object_unload_paks owner = <name>
		flushdeadobjects
	endif
endscript

script kill_character_scripts 
	printf \{qs(0x2498acb7)}
	if compositeobjectexists \{name = guitarist}
		guitarist :obj_switchscript \{emptyscript}
	endif
	if compositeobjectexists \{name = bassist}
		bassist :obj_switchscript \{emptyscript}
	endif
	if compositeobjectexists \{name = vocalist}
		vocalist :obj_switchscript \{emptyscript}
	endif
	if compositeobjectexists \{name = drummer}
		drummer :obj_switchscript \{emptyscript}
	endif
endscript

script emptyscript 
endscript

script hero_pause_anim 
	if anim_animnodeexists \{id = bodytimer}
		anim_command \{target = bodytimer
			command = timer_setspeed
			params = {
				speed = 0.0
			}}
	endif
endscript

script hero_unpause_anim 
	if anim_animnodeexists \{id = bodytimer}
		anim_command \{target = bodytimer
			command = timer_setspeed
			params = {
				speed = 1.0
			}}
	endif
endscript

script hero_enable_mirroring 
	if anim_animnodeexists \{id = mirrornode}
		anim_command \{target = mirrornode
			command = mirror_setstate
			params = {
				on
			}}
	endif
endscript

script hero_disable_mirroring 
	if anim_animnodeexists \{id = mirrornode}
		anim_command \{target = mirrornode
			command = mirror_setstate
			params = {
				off
			}}
	endif
endscript

script hero_play_strum_anim \{blendduration = 0.0}
	if anim_animnodeexists \{id = rightarm}
		anim_command {
			target = rightarm
			command = degenerateblend_addbranch
			params = {
				tree = $hero_strumming_branch
				blendduration = $strum_anim_blend_time
				params = {
					strum_name = <anim>
				}
			}
		}
	endif
endscript

script band_play_strum_anim 
	if compositeobjectexists name = <name>
		<name> :hero_play_strum_anim anim = <anim>
	endif
endscript

script hero_play_fret_anim \{blendduration = $fret_blend_time}
	if anim_animnodeexists \{id = leftarm}
		anim_command {
			target = leftarm
			command = degenerateblend_addbranch
			params = {
				tree = $hero_fret_branch
				blendduration = <blendduration>
				params = {
					fret_anim = <anim>
				}
			}
		}
	endif
endscript

script band_play_fret_anim 
	if compositeobjectexists name = <name>
		<name> :hero_play_fret_anim anim = <anim>
	endif
endscript

script hero_play_finger_anim \{blendduration = 0.2}
	if anim_animnodeexists \{id = lefthand}
		anim_command {
			target = lefthand
			command = degenerateblend_addbranch
			params = {
				tree = $hero_finger_branch
				blendduration = <blendduration>
				params = {
					finger_anim = <anim>
				}
			}
		}
	endif
endscript

script band_play_finger_anim 
	if compositeobjectexists name = <name>
		<name> :hero_play_finger_anim anim = <anim>
	endif
endscript

script hero_play_facial_anim \{blendduration = 0.0}
	if anim_animnodeexists \{id = face}
		obj_getid
		if ((<objid> = vocalist) || (<objid> = vocalist2))
			tree = $vocalist_face_branch
		else
			tree = $hero_face_branch
		endif
		anim_command {
			target = face
			command = degenerateblend_addbranch
			params = {
				tree = <tree>
				blendduration = <blendduration>
				params = {
					facial_anim = <anim>
				}
			}
		}
	endif
endscript

script hero_clear_facial_anim \{blendduration = 0.0}
	if anim_animnodeexists \{id = face}
		anim_command {
			target = face
			command = degenerateblend_addbranch
			params = {
				tree = $hero_empty_branch
				blendduration = <blendduration>
			}
		}
	endif
endscript

script hero_add_clothing_difference_anim 
	if NOT gotparam \{anim}
		return
	endif
	anim_command target = heel command = applyheeldifference_setanim params = {anim = <anim>}
endscript

script hero_wait_until_anim_finished \{timer = bodytimer}
	begin
	if hero_anim_complete timer = <timer>
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script hero_anim_complete \{timer = bodytimer}
	if NOT anim_animnodeexists id = <timer>
		return \{true}
	else
		if anim_command target = <timer> command = timer_isanimcomplete
			return \{true}
		else
			return \{false}
		endif
	endif
endscript

script hero_wait_until_anim_near_end \{timer = bodytimer
		time_from_end = 0.2}
	begin
	if hero_anim_near_end timer = <timer> time_from_end = <time_from_end>
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script hero_anim_near_end \{timer = bodytimer}
	if NOT anim_animnodeexists id = <timer>
		return \{true}
	else
		if anim_command target = <timer> command = timer_wait params = {secondsfromend = <time_from_end>}
			return \{true}
		else
			return \{false}
		endif
	endif
endscript

script hero_disable_arms \{blend_time = 0.0}
	obj_getid
	band_setikchain name = <objid> chain = slave
	return
endscript

script hero_enable_arms \{blend_time = 0.0}
	obj_getid
	band_setikchain name = <objid> chain = guitar
	return
endscript

script hero_toggle_arms \{num_arms = 2
		prev_num_arms = 0
		blend_time = 0.25}
	disable_left_arm = false
	enable_left_arm = false
	disable_right_arm = false
	enable_right_arm = false
	if (<num_arms> = 0)
		if (<prev_num_arms> = 1)
			disable_right_arm = true
		elseif (<prev_num_arms> = 2)
			disable_left_arm = true
			disable_right_arm = true
		endif
	elseif (<num_arms> = 1)
		if (<prev_num_arms> = 2)
			disable_right_arm = true
			enable_left_arm = true
		endif
	elseif (<num_arms> = 2)
		if (<prev_num_arms> = 0)
			enable_left_arm = true
			enable_right_arm = true
		elseif (<prev_num_arms> = 1)
			enable_right_arm = true
		endif
	endif
	if anim_animnodeexists \{id = ik}
		if anim_command \{target = ik
				command = ik_haschain
				params = {
					chain = bone_ik_hand_slave_l
				}}
			left_hand_bone = bone_ik_hand_slave_l
			right_hand_bone = bone_ik_hand_slave_r
		elseif anim_command \{target = ik
				command = ik_haschain
				params = {
					chain = bone_ik_hand_guitar_l
				}}
			left_hand_bone = bone_ik_hand_guitar_l
			right_hand_bone = bone_ik_hand_guitar_r
		else
			scriptassert \{'No valid IK chain to work with'}
		endif
	endif
	if (<disable_left_arm> = true)
		printf \{channel = newdebug
			qs(0xf9e6434b)}
		if anim_animnodeexists \{id = ik}
			anim_command {
				target = ik
				command = ik_setchainstrength
				params = {
					strength = 0.0
					blendduration = <blend_time>
					chain = <left_hand_bone>
				}
			}
		else
			printf \{channel = newdebug
				qs(0x3e3968e0)}
		endif
	endif
	if (<disable_right_arm> = true)
		if anim_animnodeexists \{id = ik}
			anim_command {
				target = ik
				command = ik_setchainstrength
				params = {
					strength = 0.0
					blendduration = <blend_time>
					chain = <right_hand_bone>
				}
			}
		endif
	endif
	if (<enable_left_arm> = true)
		if anim_animnodeexists \{id = ik}
			anim_command {
				target = ik
				command = ik_setchainstrength
				params = {
					strength = 1.0
					blendduration = <blend_time>
					chain = <left_hand_bone>
				}
			}
		endif
	endif
	if (<enable_right_arm> = true)
		if anim_animnodeexists \{id = ik}
			anim_command {
				target = ik
				command = ik_setchainstrength
				params = {
					strength = 1.0
					blendduration = <blend_time>
					chain = <right_hand_bone>
				}
			}
		endif
	endif
endscript

script killanim 
	skeleton_getskeletonname
	extendcrc <skeletonname> '_default' out = anim
	obj_killallspawnedscripts
	hero_play_anim anim = <anim> blendduration = 0.0
endscript

script handle_moment_anim_blending 
	obj_getid
	anim_command \{target = moment_blend
		command = partialswitch_setstate
		params = {
			on
			blendduration = 0.0
		}}
	anim_command \{target = bodytimer
		command = tempomatch_pause}
	ragdoll_markforreset
	stop_loop_cameras name = <objid>
	anim_command \{target = momenttimer
		command = timer_waitanimcomplete}
	wait \{2
		gameframes}
	end_moment_anim
endscript

script end_moment_anim 
	obj_getid
	obj_killspawnedscript \{name = handle_drummer_moment_anim_blending}
	if anim_animnodeexists \{id = moment_blend}
		anim_command \{target = moment_blend
			command = partialswitch_setstate
			params = {
				off
				blendduration = 0.0
			}}
		anim_command \{target = moment_branch
			command = degenerateblend_addbranch
			params = {
				tree = $hero_empty_branch
				blendduration = 0.0
			}}
	endif
	if anim_animnodeexists \{id = bodytimer}
		anim_command \{target = bodytimer
			command = tempomatch_unpause}
	endif
	extendcrc <objid> '_Info' out = info_struct
	part = ($<info_struct>.part)
	getpakmancurrent \{map = zones}
	if (<pak> != z_soundcheck && <pak> != z_objviewer)
		if (<part> = guitar || <part> = bass || <part> = rhythm)
			chain = guitar
		else
			chain = slave
		endif
		band_setikchain name = <objid> chain = <chain>
	endif
	ragdoll_markforreset
	start_loop_cameras name = <objid>
	if compositeobjectexists \{name = guitarist}
		guitarist :obj_setboundingsphere \{10}
	endif
	if compositeobjectexists \{name = bassist}
		bassist :obj_setboundingsphere \{10}
	endif
	if compositeobjectexists \{name = vocalist}
		vocalist :obj_setboundingsphere \{10}
	endif
	wait \{1
		gameframe}
	getpakmancurrent \{map = zones}
	if (<pak> != z_soundcheck && <pak> != z_objviewer)
		band_movetostartnode name = <objid>
	endif
endscript

script stop_loop_cameras 
	if (<name> = drummer)
		return
	endif
	extendcrc <name> '_mocap_lock_target_01' out = camera1
	if compositeobjectexists name = <camera1>
		if <camera1> :anim_animnodeexists id = bodytimer
			<camera1> :anim_command target = bodytimer command = tempomatch_pause
		endif
	endif
	extendcrc <name> '_mocap_lock_target_02' out = camera2
	if compositeobjectexists name = <camera2>
		if <camera2> :anim_animnodeexists id = bodytimer
			<camera2> :anim_command target = bodytimer command = tempomatch_pause
		endif
	endif
endscript

script start_loop_cameras 
	extendcrc <name> '_mocap_lock_target_01' out = camera1
	if compositeobjectexists name = <camera1>
		if <camera1> :anim_animnodeexists id = bodytimer
			<camera1> :anim_command target = bodytimer command = tempomatch_unpause
		endif
	endif
	extendcrc <name> '_mocap_lock_target_02' out = camera2
	if compositeobjectexists name = <camera2>
		if <camera2> :anim_animnodeexists id = bodytimer
			<camera2> :anim_command target = bodytimer command = tempomatch_unpause
		endif
	endif
endscript

script set_timer_node_speed 
endscript

script handle_drummer_moment_anim_blending 
	anim_command \{target = moment_blend
		command = partialswitch_setstate
		params = {
			on
			blendduration = 0.1
		}}
	anim_command \{target = moment_timer
		command = timer_waitanimcomplete}
	anim_command \{target = moment_blend
		command = partialswitch_setstate
		params = {
			off
			blendduration = 0.1
		}}
endscript

script end_drummer_moment_anim 
	obj_killspawnedscript \{name = handle_drummer_moment_anim_blending}
	anim_command \{target = moment_blend
		command = partialswitch_setstate
		params = {
			off
			blendduration = 0.0
		}}
endscript

script drummer_faceoff_rest 
	anim = drum_hth_loop_notempo
	anim_command {
		target = faceoff_branch
		command = degenerateblend_addbranch
		params = {
			tree = $faceoff_drummer_notempo
			blendduration = 0.0
			params = {
				anim = <anim>
			}
		}
	}
	anim_command \{target = faceoff_blend
		command = partialswitch_setstate
		params = {
			on
			blendduration = 0.3
		}}
endscript

script drummer_faceoff_play 
	anim_command \{target = faceoff_blend
		command = partialswitch_setstate
		params = {
			off
			blendduration = 0.3
		}}
endscript
faceoff_drummer_notempo = {
	type = cycle
	id = faceoff_timer
	anim = anim
	[
		{
			type = source
			anim = anim
		}
	]
}

script hide_mic 
	switchoffatomic \{cas_mic}
	switchoffatomic \{cas_mic_stand}
endscript

script show_mic 
	switchonatomic \{cas_mic}
	switchonatomic \{cas_mic_stand}
endscript

script hide_mic_stand 
	switchoffatomic \{cas_mic_stand}
endscript

script show_mic_stand 
	switchonatomic \{cas_mic_stand}
endscript

script hide_mic_microphone 
	switchoffatomic \{cas_mic}
endscript

script show_mic_microphone 
	switchonatomic \{cas_mic}
endscript

script hide_drumkit 
	switchoffatomic \{cas_drums}
endscript

script show_drumkit 
	switchonatomic \{cas_drums}
endscript

script vocalist_facial_animations_start \{blendtime = 0.3}
	anim_command target = vocal_face_mod command = modulate_startblend params = {blendtime = <blendtime> blendcurve = [1 0]}
endscript

script vocalist_facial_animations_stop \{blendtime = 0.3}
	anim_command target = vocal_face_mod command = modulate_startblend params = {blendtime = <blendtime> blendcurve = [0 1]}
endscript
generic_static_tree = {
	type = degenerateblend
	id = body
}
guitarist_static_tree = {
	type = constraintbones
	constraintbones = hero_constraintbones
	[
		{
			type = ragdoll
			[
				{
					type = applyheeldifference
					id = heel
					[
						{
							type = ik
							two_bone_chains = ik_params
							id = ik
							[
								{
									type = tweakbones
									id = tweakbonesnode
									[
										{
											type = partialswitch
											state = on
											[
												{
													type = degenerateblend
													id = face
												}
												{
													type = applydifference
													id = lefthandpartial
													[
														{
															$hero_arm_branch
														}
														{
															type = switch
															state = off
															id = moment_blend
															[
																{
																	type = applyfemaledifference
																	id = maleanimadjust_moment
																	anim = gh_rocker_female_guitarraise_d
																	[
																		{
																			type = degenerateblend
																			id = moment_branch
																		}
																	]
																}
																{
																	type = applyfemaledifference
																	id = maleanimadjust
																	anim = gh_rocker_female_guitarraise_d
																	[
																		{
																			type = degenerateblend
																			id = body
																		}
																	]
																}
															]
														}
													]
												}
											]
										}
									]
								}
							]
						}
					]
				}
			]
		}
	]
}
guitarist_face_tension_static_tree = {
	type = constraintbones
	constraintbones = hero_constraintbones
	[
		{
			type = ragdoll
			[
				{
					type = applyheeldifference
					id = heel
					[
						{
							type = ik
							two_bone_chains = ik_params
							id = ik
							[
								{
									type = tweakbones
									id = tweakbonesnode
									[
										{
											type = partialswitch
											state = on
											[
												{
													type = tensionstorage
													min_stress_anim = test_character_nm_min_d
													max_stress_anim = test_character_nm_max_d
													[
														{
															type = degenerateblend
															id = face
														}
													]
												}
												{
													type = applydifference
													id = lefthandpartial
													[
														{
															$hero_arm_branch
														}
														{
															type = switch
															state = off
															id = moment_blend
															[
																{
																	type = applyfemaledifference
																	id = maleanimadjust_moment
																	anim = gh_rocker_female_guitarraise_d
																	[
																		{
																			type = degenerateblend
																			id = moment_branch
																		}
																	]
																}
																{
																	type = applyfemaledifference
																	id = maleanimadjust
																	anim = gh_rocker_female_guitarraise_d
																	[
																		{
																			type = degenerateblend
																			id = body
																		}
																	]
																}
															]
														}
													]
												}
											]
										}
									]
								}
							]
						}
					]
				}
			]
		}
	]
}
frontend_static_tree = {
	type = constraintbones
	constraintbones = hero_constraintbones
	[
		{
			type = ragdoll
			[
				{
					type = applyheeldifference
					id = heel
					[
						{
							type = ik
							two_bone_chains = ik_params
							id = ik
							[
								{
									type = applyfemaledifference
									id = maleanimadjust
									anim = gh_rocker_female_guitarraise_d
									[
										{
											type = applyfemaledrummerdifference
											id = femalediff
											[
												{
													type = tweakbones
													id = tweakbonesnode
													[
														{
															type = partialswitch
															state = on
															[
																{
																	type = degenerateblend
																	id = face
																}
																{
																	type = applydifference
																	id = lefthandpartial
																	[
																		{
																			$hero_arm_branch
																		}
																		{
																			type = degenerateblend
																			type = partialswitch
																			state = off
																			id = moment_blend
																			[
																				{
																					type = degenerateblend
																					id = moment_branch
																				}
																				{
																					type = degenerateblend
																					id = body
																				}
																			]
																		}
																	]
																}
															]
														}
													]
												}
											]
										}
									]
								}
							]
						}
					]
				}
			]
		}
	]
}
hero_arm_branch = {
	type = add
	[
		{
			type = add
			[
				{
					type = modulate
					strength = 1.0
					id = fret_anim_mod
					[
						{
							type = degenerateblend
							id = leftarm
						}
					]
				}
				{
					type = modulate
					strength = 1.0
					id = chord_anim_mod
					[
						{
							type = degenerateblend
							id = lefthand
						}
					]
				}
			]
		}
		{
			type = modulate
			strength = 1.0
			id = strum_anim_mod
			[
				{
					type = degenerateblend
					id = rightarm
				}
			]
		}
	]
}
hero_body_branch = {
	type = timer_type
	id = bodytimer
	anim = anim_name
	speed = speed
	start = start
	end = end
	tempo_anim = tempo_anim
	min_time_factor = min_time_factor
	max_time_factor = max_time_factor
	allow_beat_skipping = allow_beat_skipping
	allow_tempo_override = allow_tempo_override
	anim_events = on
	[
		{
			type = source_type
			anim = anim_name
		}
	]
}
hero_moment_branch = {
	type = timer_type
	id = momenttimer
	anim = anim_name
	speed = speed
	start = start
	end = end
	tempo_anim = tempo_anim
	min_time_factor = min_time_factor
	max_time_factor = max_time_factor
	allow_beat_skipping = allow_beat_skipping
	allow_tempo_override = allow_tempo_override
	anim_events = on
	[
		{
			type = source_type
			anim = anim_name
		}
	]
}
hero_strumming_branch = {
	type = play
	id = strumtimer
	anim = strum_name
	[
		{
			type = source
			anim = strum_name
		}
	]
}
hero_fret_branch = {
	type = play
	id = frettimer
	anim = fret_anim
	[
		{
			type = source
			anim = fret_anim
		}
	]
}
hero_finger_branch = {
	type = play
	id = fingertimer
	anim = finger_anim
	[
		{
			type = source
			anim = finger_anim
		}
	]
}
hero_face_branch = {
	type = play
	id = facialtimer
	anim = facial_anim
	[
		{
			type = facialhacksource
			anim = facial_anim
		}
	]
}
vocalist_face_branch = {
	type = playnodurationblending
	id = facialtimer
	anim = facial_anim
	[
		{
			type = facialhacksource
			anim = facial_anim
		}
	]
}
hero_play_branch = {
	type = play
	id = timer_id
	anim = anim_name
	[
		{
			type = source
			anim = anim_name
		}
	]
}
hero_empty_branch = {
	type = blank
}
hero_drumming_branch = {
	type = timer_type
	id = timer_id
	anim = anim_name
	speed = speed
	[
		{
			type = source
			anim = anim_name
		}
	]
}
vocalist_static_tree = {
	type = constraintbones
	constraintbones = hero_constraintbones
	[
		{
			type = ragdoll
			[
				{
					type = ik
					two_bone_chains = singer_ik_params_arms
					id = ik
					[
						{
							type = applyheeldifference
							id = heel
							[
								{
									type = ik
									two_bone_chains = singer_ik_params_legs
									id = ik
									[
										{
											type = tweakbones
											id = tweakbonesnode
											[
												{
													type = partialswitch
													state = on
													[
														{
															type = modulate
															id = vocal_face_mod
															strength = 1
															[
																{
																	type = degenerateblend
																	id = face
																}
															]
														}
														{
															type = switch
															state = off
															id = moment_blend
															[
																{
																	type = degenerateblend
																	id = moment_branch
																}
																{
																	type = degenerateblend
																	id = body
																}
															]
														}
													]
												}
											]
										}
									]
								}
							]
						}
					]
				}
			]
		}
	]
}
vocalist_face_tension_static_tree = {
	type = constraintbones
	constraintbones = hero_constraintbones
	[
		{
			type = ragdoll
			[
				{
					type = ik
					two_bone_chains = singer_ik_params_arms
					id = ik
					[
						{
							type = applyheeldifference
							id = heel
							[
								{
									type = ik
									two_bone_chains = singer_ik_params_legs
									id = ik
									[
										{
											type = tweakbones
											id = tweakbonesnode
											[
												{
													type = partialswitch
													state = on
													[
														{
															type = modulate
															id = vocal_face_mod
															strength = 1
															[
																{
																	type = tensionstorage
																	min_stress_anim = test_character_nm_min_d
																	max_stress_anim = test_character_nm_max_d
																	[
																		{
																			type = degenerateblend
																			id = face
																		}
																	]
																}
															]
														}
														{
															type = switch
															state = off
															id = moment_blend
															[
																{
																	type = degenerateblend
																	id = moment_branch
																}
																{
																	type = degenerateblend
																	id = body
																}
															]
														}
													]
												}
											]
										}
									]
								}
							]
						}
					]
				}
			]
		}
	]
}
drummer_static_tree = {
	type = constraintbones
	constraintbones = hero_constraintbones
	[
		{
			type = ragdoll
			[
				{
					type = applyheeldifference
					id = heel
					[
						{
							type = ik
							two_bone_chains = drummer_ik_params
							id = ik
							[
								{
									type = applyfemaledrummerdifference
									id = femalediff
									[
										{
											type = tweakbones
											id = tweakbonesnode
											[
												{
													type = partialswitch
													state = on
													[
														{
															type = degenerateblend
															id = face
														}
														{
															type = switch
															state = off
															id = faceoff_blend
															[
																{
																	type = degenerateblend
																	id = faceoff_branch
																}
																{
																	type = applydrumkitdifference
																	id = drumkit
																	drum_kit_channel_list = $drum_kit_channel_list
																	[
																		{
																			type = switch
																			state = off
																			id = moment_blend
																			[
																				{
																					type = degenerateblend
																					id = moment_branch
																				}
																				{
																					type = degenerateblend
																					id = body
																				}
																			]
																		}
																	]
																}
															]
														}
													]
												}
											]
										}
									]
								}
							]
						}
					]
				}
			]
		}
	]
}
drummer_moment_branch = {
	type = timer_type
	id = moment_timer
	anim = anim_name
	speed = speed
	start = start
	end = end
	skip_beats = skip_beats
	tempo_anim = tempo_anim
	anim_events = on
	[
		{
			type = source_type
			anim = anim_name
		}
	]
}
hero_cymbal_branch = {
	type = play
	id = cymbal_timer_id
	anim = cymbal_anim
	[
		{
			type = source
			anim = cymbal_anim
		}
	]
}
drum_kit_channel_list = [
	{
		name = tom_1
		bones = [
			bone_mic_adjust_height
		]
	}
	{
		name = tom_2
		bones = [
			bone_mic_adjust_angle
		]
	}
	{
		name = snare
		bones = [
			bone_mic_stand
		]
	}
	{
		name = cymbal_hh
		bones = [
			bone_guitar_string_2
			bone_guitar_string_3
			bone_guitar_string_4
		]
	}
	{
		name = cymbal_1
		bones = [
			bone_ik_hand_guitar_l
		]
	}
	{
		name = cymbal_2
		bones = [
			bone_ik_hand_guitar_r
		]
	}
	{
		name = cymbal_3
		bones = [
			bone_guitar_string_1
		]
	}
	{
		name = kick
		bones = [
			bone_thigh_r
			bone_toe_r
			bone_ik_foot_slave_r
			bone_guitar_string_5
			bone_guitar_string_6
			bone_mic_adjust_height
			bone_mic_adjust_angle
			bone_mic_microphone
		]
	}
]
empty_ik_params = [
]
car_ik_params = [
	{
		bone0 = bone_bicep_r
		bone1 = bone_forearm_r
		bone2 = bone_palm_r
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_slave_r
	}
	{
		bone0 = bone_bicep_l
		bone1 = bone_forearm_l
		bone2 = bone_palm_l
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_slave_l
	}
	{
		bone0 = bone_thigh_l
		bone1 = bone_knee_l
		bone2 = bone_ankle_l
		hingeaxis = (0.0, 0.0, 1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_l
	}
	{
		bone0 = bone_thigh_r
		bone1 = bone_knee_r
		bone2 = bone_ankle_r
		hingeaxis = (0.0, 0.0, 1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_r
	}
]
hero_ik_params = [
	{
		bone0 = bone_bicep_r
		bone1 = bone_forearm_r
		bone2 = bone_palm_r
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_guitar_r
		newtarget = bone_ik_hand_slave_r
		stretch = 1.0
	}
	{
		bone0 = bone_bicep_l
		bone1 = bone_forearm_l
		bone2 = bone_palm_l
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_guitar_l
		newtarget = bone_ik_hand_slave_l
		stretch = 1.0
	}
	{
		bone0 = bone_thigh_l
		bone1 = bone_knee_l
		bone2 = bone_ankle_l
		hingeaxis = (0.0, 0.0, 1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_l
	}
	{
		bone0 = bone_thigh_r
		bone1 = bone_knee_r
		bone2 = bone_ankle_r
		hingeaxis = (0.0, 0.0, 1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_r
	}
]
hero_feet_ik_params = [
	{
		bone0 = bone_thigh_l
		bone1 = bone_knee_l
		bone2 = bone_ankle_l
		hingeaxis = (0.0, 0.0, 1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_l
	}
	{
		bone0 = bone_thigh_r
		bone1 = bone_knee_r
		bone2 = bone_ankle_r
		hingeaxis = (0.0, 0.0, 1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_r
	}
]
singer_ik_params_arms = [
	{
		bone0 = bone_bicep_r
		bone1 = bone_forearm_r
		bone2 = bone_palm_r
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_slave_r
		stretch = 1.0
	}
	{
		bone0 = bone_bicep_l
		bone1 = bone_forearm_l
		bone2 = bone_palm_l
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_slave_l
		stretch = 1.0
	}
]
singer_ik_params_legs = [
	{
		bone0 = bone_thigh_l
		bone1 = bone_knee_l
		bone2 = bone_ankle_l
		hingeaxis = (0.0, 0.0, 1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_l
	}
	{
		bone0 = bone_thigh_r
		bone1 = bone_knee_r
		bone2 = bone_ankle_r
		hingeaxis = (0.0, 0.0, 1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_r
	}
]
drummer_ik_params = [
	{
		bone0 = bone_bicep_r
		bone1 = bone_forearm_r
		bone2 = bone_palm_r
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_slave_r
		stretch = 1.0
	}
	{
		bone0 = bone_bicep_l
		bone1 = bone_forearm_l
		bone2 = bone_palm_l
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_slave_l
		stretch = 1.0
	}
	{
		bone0 = bone_thigh_l
		bone1 = bone_knee_l
		bone2 = bone_ankle_l
		hingeaxis = (0.0, 0.0, 1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_l
	}
	{
		bone0 = bone_thigh_r
		bone1 = bone_knee_r
		bone2 = bone_ankle_r
		hingeaxis = (0.0, 0.0, 1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_r
	}
]
guitar_ik_params = [
	{
		bone0 = bone_bicep_r
		bone1 = bone_forearm_r
		bone2 = bone_palm_r
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_guitar_r
		newtarget = bone_ik_hand_slave_r
		stretch = 1.0
	}
	{
		bone0 = bone_bicep_l
		bone1 = bone_forearm_l
		bone2 = bone_palm_l
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_guitar_l
		newtarget = bone_ik_hand_slave_l
		stretch = 1.0
	}
	{
		bone0 = bone_thigh_l
		bone1 = bone_knee_l
		bone2 = bone_ankle_l
		hingeaxis = (0.0, 0.0, 1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_l
	}
	{
		bone0 = bone_thigh_r
		bone1 = bone_knee_r
		bone2 = bone_ankle_r
		hingeaxis = (0.0, 0.0, 1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_r
	}
]
hero_constraintbones = [
	{
		type = twistchild
		bone = bone_twist_wrist_l
		target = bone_palm_l
		amount = 0.5
	}
	{
		type = twistchild
		bone = bone_twist_wrist_r
		target = bone_palm_r
		amount = 0.5
	}
	{
		type = twist
		bone = bone_twist_bicep_mid_r
		target = bone_bicep_r
		amount = 0.5
	}
	{
		type = twist
		bone = bone_twist_bicep_mid_l
		target = bone_bicep_l
		amount = 0.5
	}
	{
		type = twist
		bone = bone_twist_bicep_top_r
		target = bone_bicep_r
		amount = 1.0
	}
	{
		type = twist
		bone = bone_twist_bicep_top_l
		target = bone_bicep_l
		amount = 1.0
	}
	{
		type = twistthigh
		bone = bone_twist_thigh_r
		target = bone_thigh_r
		amount = 1.0
	}
	{
		type = twistthigh
		bone = bone_twist_thigh_l
		target = bone_thigh_l
		amount = 1.0
	}
	{
		type = splitr
		bone = bone_split_ass_r
		target = bone_twist_thigh_r
		amount = 0.5
	}
	{
		type = splitr
		bone = bone_split_ass_l
		target = bone_twist_thigh_l
		amount = 0.5
	}
]
car_female_facial_bones = [
	bone_jaw
	bone_mouth_l
	bone_mouth_r
	bone_lip_lower_mid
	bone_lip_upper_mid
	bone_lip_lower_corner_l
	bone_lip_lower_corner_r
	bone_lip_lower_l
	bone_lip_lower_r
	bone_lip_upper_corner_l
	bone_lip_upper_corner_r
	bone_lip_upper_l
	bone_lip_upper_r
	bone_tongue
]
car_female_facial_bone_anim_scale = 0.75
car_female_facial_scale_apply = [
	gh4_singer_male_ozzyface_1
	gh4_singer_male_ozzyface_2
	gh4_singer_male_ozzyface_3
	gh4_singer_male_aboutagirl_1
	gh4_singer_male_aboutagirl_2
	gh4_singer_male_aboutagirl_3
	gh4_singer_male_aggro_1
	gh4_singer_male_aggro_2
	gh4_singer_male_aggro_3
	gh4_singer_male_aggro_4
	gh4_singer_male_aggro_5
	gh4_singer_male_americanwoman_1
	gh4_singer_male_americanwoman_2
	gh4_singer_male_americanwoman_3
	gh4_singer_male_americanwoman_4
	gh4_singer_male_americanwoman_5
	gh4_singer_male_americanwoman_6
	gh3_singer_male_antisocial_1
	gh3_singer_male_antisocial_2
	gh3_singer_male_antisocial_3
	gh3_singer_male_antisocial_4
	gh3_singer_male_antisocial_5
	gh3_singer_male_antisocial_6
	gh3_singer_male_antisocial_7
	gh4_singer_male_antisocial_1
	gh4_singer_male_antisocial_2
	gh4_singer_male_antisocial_3
	gh4_singer_male_antisocial_4
	gh4_singer_male_antisocial_5
	gh4_singer_male_antisocial_6
	gh4_singer_male_antisocial_7
	gh4_singer_male_areyougonnago_1
	gh4_singer_male_areyougonnago_1b
	gh4_singer_male_areyougonnago_2
	gh4_singer_male_areyougonnago_2b
	gh4_singer_male_areyougonnago_3
	gh4_singer_male_areyougonnago_4
	gh4_singer_male_areyougonnago_5
	gh4_singer_male_assassin_1
	gh4_singer_male_assassin_1b
	gh4_singer_male_assassin_2
	gh4_singer_male_assassin_2b
	gh4_singer_male_assassin_3
	gh4_singer_male_assassin_3b
	gh4_singer_male_badtothebone_1
	gh4_singer_male_badtothebone_2
	gh4_singer_male_badtothebone_3
	gh4_singer_male_badtothebone_4
	gh4_singer_male_bandontherun_1
	gh4_singer_male_bandontherun_2
	gh4_singer_male_bandontherun_2b
	gh4_singer_male_bandontherun_3
	gh4_singer_male_bandontherun_3b
	gh4_singer_male_bandontherun_4
	gh4_singer_male_bandontherun_4b
	gh4_singer_male_bandontherun_5
	gh4_singer_male_bandontherun_5b
	gh4_singer_male_bandontherun_6
	gh4_singer_male_bandontherun_6b
	gh4_singer_male_bandontherun_7
	gh4_singer_male_bandontherun_8
	gh4_singer_male_beatit_1
	gh4_singer_male_beatit_1b
	gh4_singer_male_beatit_2
	gh4_singer_male_beatit_2b
	gh4_singer_male_beatit_3
	gh4_singer_male_beatit_3b
	gh4_singer_male_beatit_4
	gh4_singer_male_beatit_5
	gh4_singer_male_beatit_6
	gh4_singer_male_beatit_7
	gh4_singer_male_beautifuldis_1
	gh4_singer_male_beautifuldis_1b
	gh4_singer_male_beautifuldis_2
	gh4_singer_male_beautifuldis_2b
	gh4_singer_male_beautifuldis_3
	gh4_singer_male_beautifuldis_3b
	gh4_singer_male_beautifuldis_4
	gh4_singer_male_beautifuldis_4b
	gh4_singer_male_beautifuldis_5
	gh4_singer_male_beautifuldis_5b
	gh4_singer_male_byob_1
	gh4_singer_male_byob_1b
	gh4_singer_male_byob_2
	gh4_singer_male_byob_2b
	gh4_singer_male_byob_3
	gh4_singer_male_byob_3b
	gh4_singer_male_byob_4
	gh4_singer_male_byob_4b
	gh4_singer_male_byob_5
	gh4_singer_male_byob_5b
	gh4_singer_male_byob_6
	gh4_singer_male_byob_6b
	gh4_singer_male_byob_7
	gh4_singer_male_byob_7b
	gh4_singer_male_byob_8
	gh4_singer_male_byob_8b
	gh4_singer_male_crazytrain_1
	gh4_singer_male_crazytrain_2
	gh4_singer_male_crazytrain_3
	gh4_singer_male_crazytrain_4
	gh4_singer_male_crazytrain_5
	gh4_singer_male_crazytrain_6
	gh4_singer_male_dammit_1
	gh4_singer_male_dammit_2
	gh4_singer_male_demolitionman_1
	gh4_singer_male_demolitionman_2
	gh4_singer_male_demolitionman_2b
	gh4_singer_male_demolitionman_3
	gh4_singer_male_demolitionman_3b
	gh4_singer_male_demolitionman_4
	gh4_singer_male_demolitionman_4b
	gh4_singer_male_demolitionman_5
	gh4_singer_male_demolitionman_6
	gh4_singer_male_doitagain_1
	gh4_singer_male_doitagain_2
	gh4_singer_male_doitagain_3
	gh4_singer_male_electrorock_1
	gh4_singer_male_electrorock_2
	gh4_singer_male_electrorock_3
	gh4_singer_male_electrorock_4
	gh4_singer_male_electrorock_5
	gh4_singer_male_electrorock_6
	gh4_singer_male_electrorock_7
	gh4_singer_male_electrorock_8
	gh4_singer_male_electrorock_9
	gh4_singer_male_escueladecalor_1
	gh4_singer_male_escueladecalor_2
	gh4_singer_male_escueladecalor_3
	gh4_singer_male_escueladecalor_4
	gh4_singer_male_escueladecalor_5
	gh4_singer_male_escueladecalor_6
	gh4_singer_male_escueladecalor_6b
	gh4_singer_male_escueladecalor_7
	gh4_singer_male_everlong_1
	gh4_singer_male_everlong_2
	gh4_singer_male_everlong_3
	gh4_singer_male_everlong_4
	gh4_singer_male_everlong_5
	gh4_singer_male_eyeofthetiger_1
	gh4_singer_male_eyeofthetiger_2
	gh4_singer_male_eyeofthetiger_3
	gh4_singer_male_eyeofthetiger_4
	gh4_singer_male_eyeofthetiger_5
	gh4_singer_male_feelthepain_1
	gh4_singer_male_feelthepain_2
	gh4_singer_male_feelthepain_3
	gh4_singer_male_feelthepain_4
	gh4_singer_male_feelthepain_5
	gh4_singer_male_floaton_1
	gh4_singer_male_floaton_2
	gh4_singer_male_floaton_2b
	gh4_singer_male_floaton_3
	gh4_singer_male_floaton_4
	gh4_singer_male_floaton_4b
	gh4_singer_male_floaton_5
	gh4_singer_male_floaton_5b
	gh4_singer_male_floaton_6b
	gh4_singer_male_floaton_7b
	gh4_singer_male_freakonaleash_1
	gh4_singer_male_freakonaleash_1b
	gh4_singer_male_freakonaleash_2
	gh4_singer_male_freakonaleash_2b
	gh4_singer_male_freakonaleash_3
	gh4_singer_male_freakonaleash_3b
	gh4_singer_male_freakonaleash_4
	gh4_singer_male_freakonaleash_5
	gh4_singer_male_freakonaleash_6
	gh4_singer_male_goyourownway_1
	gh4_singer_male_goyourownway_1b
	gh4_singer_male_goyourownway_2
	gh4_singer_male_goyourownway_2b
	gh4_singer_male_goyourownway_3
	gh4_singer_male_goyourownway_3b
	gh4_singer_male_goyourownway_4
	gh4_singer_male_hailtothefreaks_1
	gh4_singer_male_hailtothefreaks_2
	gh4_singer_male_hailtothefreaks_2b
	gh4_singer_male_hailtothefreaks_3
	gh4_singer_male_hailtothefreaks_3b
	gh4_singer_male_hailtothefreaks_4
	gh4_singer_male_hailtothefreaks_4b
	gh4_singer_male_heymanniceshot_1
	gh4_singer_male_heymanniceshot_2
	gh4_singer_male_heymanniceshot_3
	gh4_singer_male_heymanniceshot_4
	gh4_singer_male_heymanniceshot_5
	gh4_singer_male_heymanniceshot_6
	gh4_singer_male_hollywoodnights_1
	gh4_singer_male_hollywoodnights_1b
	gh4_singer_male_hollywoodnights_2
	gh4_singer_male_hollywoodnights_2b
	gh4_singer_male_hollywoodnights_3
	gh4_singer_male_hollywoodnights_4
	gh4_singer_male_hollywoodnights_5
	gh4_singer_male_hollywoodnights_6
	gh4_singer_male_hollywoodnights_7
	gh4_singer_male_hollywoodnights_8
	gh4_singer_male_hotblooded_1
	gh4_singer_male_hotblooded_1b
	gh4_singer_male_hotblooded_2
	gh4_singer_male_hotblooded_2b
	gh4_singer_male_hotblooded_3
	gh4_singer_male_hotblooded_3b
	gh4_singer_male_hotblooded_4
	gh4_singer_male_hotblooded_4b
	gh4_singer_male_hotblooded_5
	gh4_singer_male_hotelcalifornia_1
	gh4_singer_male_hotelcalifornia_1b
	gh4_singer_male_hotelcalifornia_2
	gh4_singer_male_hotelcalifornia_2b
	gh4_singer_male_hotforteacher_1
	gh4_singer_male_hotforteacher_1b
	gh4_singer_male_hotforteacher_2
	gh4_singer_male_hotforteacher_2b
	gh4_singer_male_hotforteacher_3
	gh4_singer_male_hotforteacher_3b
	gh4_singer_male_hotforteacher_4
	gh4_singer_male_hotforteacher_5
	gh4_singer_male_hotforteacher_6
	gh4_singer_male_hotforteacher_7
	gh4_singer_male_hotforteacher_8
	gh4_singer_male_hotforteacher_9
	gh4_singer_male_jessiesgirl_1
	gh4_singer_male_jessiesgirl_1b
	gh4_singer_male_jessiesgirl_2
	gh4_singer_male_jessiesgirl_2b
	gh4_singer_male_jessiesgirl_3
	gh4_singer_male_jessiesgirl_3b
	gh4_singer_male_jessiesgirl_4
	gh4_singer_male_jessiesgirl_4b
	gh4_singer_male_jessiesgirl_5
	gh4_singer_male_jessiesgirl_6
	gh4_singer_male_jessiesgirl_7
	gh4_singer_male_jimi_1
	gh4_singer_male_jimi_2
	gh4_singer_male_jimi_2b
	gh4_singer_male_kickoutthejams_1
	gh4_singer_male_kickoutthejams_1b
	gh4_singer_male_kickoutthejams_2
	gh4_singer_male_kickoutthejams_2b
	gh4_singer_male_kickoutthejams_3
	gh4_singer_male_kickoutthejams_3b
	gh4_singer_male_kickoutthejams_4
	gh4_singer_male_kickoutthejams_4b
	gh4_singer_male_kickoutthejams_5
	gh4_singer_male_kickoutthejams_5b
	gh4_singer_male_kickoutthejams_6
	gh4_singer_male_kickoutthejams_6b
	gh4_singer_male_kickoutthejams_7
	gh4_singer_male_kickoutthejams_7b
	gh4_singer_male_kickoutthejams_8
	gh4_singer_male_kickoutthejams_9
	gh3_singer_male_knightsofcydonia_1
	gh3_singer_male_knightsofcydonia_2
	gh4_singer_male_labamba_1
	gh4_singer_male_labamba_1b
	gh4_singer_male_labamba_2
	gh4_singer_male_labamba_2b
	gh4_singer_male_labamba_3
	gh4_singer_male_labamba_4
	gh4_singer_male_lazyeye_1
	gh4_singer_male_lazyeye_1b
	gh4_singer_male_lazyeye_2
	gh4_singer_male_lazyeye_2b
	gh4_singer_male_lazyeye_3
	gh4_singer_male_lazyeye_4
	gh4_singer_male_lazyeye_5
	gh4_singer_male_lazyeye_6
	gh4_singer_male_lazyeye_7
	gh4_singer_male_livingonaprayer_1
	gh4_singer_male_livingonaprayer_1b
	gh4_singer_male_livingonaprayer_2
	gh4_singer_male_livingonaprayer_2b
	gh4_singer_male_livingonaprayer_3
	gh4_singer_male_livingonaprayer_3b
	gh4_singer_male_livingonaprayer_4
	gh4_singer_male_livingonaprayer_4b
	gh4_singer_male_livingonaprayer_5
	gh4_singer_male_livingonaprayer_5b
	gh4_singer_male_livingonaprayer_6
	gh4_singer_male_livingonaprayer_7
	gh4_singer_male_lovemetwotimes_1
	gh4_singer_male_lovemetwotimes_2
	gh4_singer_male_lovemetwotimes_3
	gh4_singer_male_lovemetwotimes_4
	gh4_singer_male_loveremoval_1
	gh4_singer_male_loveremoval_1b
	gh4_singer_male_loveremoval_2
	gh4_singer_male_loveremoval_2b
	gh4_singer_male_loveremoval_3
	gh4_singer_male_loveremoval_3b
	gh4_singer_male_loveremoval_4
	gh4_singer_male_loveremoval_5
	gh4_singer_male_loveremoval_6
	gh4_singer_male_loveremoval_7
	gh4_singer_male_loveremoval_8
	gh4_singer_male_lovespreads_1
	gh4_singer_male_lovespreads_1b
	gh4_singer_male_lovespreads_2
	gh4_singer_male_lovespreads_3
	gh4_singer_male_lovespreads_3b
	gh4_singer_male_lovespreads_4
	gh4_singer_male_lovespreads_5
	gh4_singer_male_lovespreads_5b
	gh4_singer_male_lovespreads_5c
	gh4_singer_male_lvialviaquez_1
	gh4_singer_male_lvialviaquez_10
	gh4_singer_male_lvialviaquez_1b
	gh4_singer_male_lvialviaquez_2
	gh4_singer_male_lvialviaquez_2b
	gh4_singer_male_lvialviaquez_3
	gh4_singer_male_lvialviaquez_3b
	gh4_singer_male_lvialviaquez_4
	gh4_singer_male_lvialviaquez_4b
	gh4_singer_male_lvialviaquez_5
	gh4_singer_male_lvialviaquez_5b
	gh4_singer_male_lvialviaquez_6
	gh4_singer_male_lvialviaquez_6b
	gh4_singer_male_lvialviaquez_7
	gh4_singer_male_lvialviaquez_7b
	gh4_singer_male_lvialviaquez_8
	gh4_singer_male_lvialviaquez_8b
	gh4_singer_male_lvialviaquez_9
	gh4_singer_male_monsoon_1
	gh4_singer_male_monsoon_10
	gh4_singer_male_monsoon_1b
	gh4_singer_male_monsoon_2
	gh4_singer_male_monsoon_2b
	gh4_singer_male_monsoon_3
	gh4_singer_male_monsoon_3b
	gh4_singer_male_monsoon_4
	gh4_singer_male_monsoon_5
	gh4_singer_male_monsoon_6
	gh4_singer_male_monsoon_7
	gh4_singer_male_monsoon_8
	gh4_singer_male_monsoon_9
	gh4_singer_male_mountainsong_1
	gh4_singer_male_mountainsong_10
	gh4_singer_male_mountainsong_2
	gh4_singer_male_mountainsong_3
	gh4_singer_male_mountainsong_4
	gh4_singer_male_mountainsong_5
	gh4_singer_male_mountainsong_6
	gh4_singer_male_mountainsong_7
	gh4_singer_male_mountainsong_8
	gh4_singer_male_mountainsong_9
	gh4_singer_male_mrcrowley_1
	gh4_singer_male_mrcrowley_2
	gh4_singer_male_mrcrowley_3
	gh3_singer_male_mycurse_1
	gh3_singer_male_mycurse_1b
	gh3_singer_male_mycurse_2
	gh3_singer_male_mycurse_2b
	gh3_singer_male_mycurse_3
	gh3_singer_male_mycurse_4
	gh3_singer_male_mycurse_5
	gh4_singer_male_nevertoolate_1
	gh4_singer_male_nevertoolate_1b
	gh4_singer_male_nevertoolate_2
	gh4_singer_male_nevertoolate_2b
	gh4_singer_male_nevertoolate_3
	gh4_singer_male_nevertoolate_3b
	gh4_singer_male_nevertoolate_4
	gh4_singer_male_nevertoolate_4b
	gh4_singer_male_nevertoolate_5
	gh4_singer_male_nevertoolate_5b
	gh4_singer_male_nevertoolate_6
	gh4_singer_male_nevertoolate_6b
	gh4_singer_male_nevertoolate_7
	gh4_singer_male_norain_1
	gh4_singer_male_norain_1b
	gh4_singer_male_norain_2
	gh4_singer_male_norain_2b
	gh4_singer_male_norain_3
	gh4_singer_male_norain_3b
	gh4_singer_male_norain_4
	gh4_singer_male_norain_4b
	gh4_singer_male_norain_5
	gh4_singer_male_nosleeptill_1
	gh4_singer_male_nosleeptill_1b
	gh4_singer_male_nosleeptill_2
	gh4_singer_male_nosleeptill_2b
	gh4_singer_male_nosleeptill_3
	gh4_singer_male_nosleeptill_3b
	gh4_singer_male_nosleeptill_4
	gh4_singer_male_nosleeptill_4b
	gh4_singer_male_nosleeptill_5
	gh4_singer_male_nosleeptill_5b
	gh4_singer_male_nosleeptill_6
	gh4_singer_male_nosleeptill_6b
	gh4_singer_male_nosleeptill_7
	gh4_singer_male_nosleeptill_7b
	gh4_singer_male_nosleeptill_8
	gh4_singer_male_nosleeptill_8b
	gh4_singer_male_nuvole_1
	gh4_singer_male_nuvole_1b
	gh4_singer_male_nuvole_2
	gh4_singer_male_nuvole_2b
	gh4_singer_male_nuvole_3
	gh4_singer_male_nuvole_4
	gh4_singer_male_nuvole_5
	gh4_singer_male_obstacle1_1
	gh4_singer_male_obstacle1_1b
	gh4_singer_male_obstacle1_2
	gh4_singer_male_obstacle1_2b
	gh4_singer_male_obstacle1_3
	gh4_singer_male_obstacle1_4
	gh4_singer_male_obstacle1_5
	gh4_singer_male_obstacle1_6
	gh4_singer_male_obstacle1_7
	gh4_singer_male_onearmedscissor_1
	gh4_singer_male_onearmedscissor_1b
	gh4_singer_male_onearmedscissor_2
	gh4_singer_male_onearmedscissor_2b
	gh4_singer_male_onearmedscissor_3
	gh4_singer_male_onearmedscissor_3b
	gh4_singer_male_onearmedscissor_4
	gh4_singer_male_onearmedscissor_4b
	gh4_singer_male_onearmedscissor_5
	gh4_singer_male_onearmedscissor_6
	gh4_singer_male_ontheroad_1
	gh4_singer_male_ontheroad_2
	gh4_singer_male_ontheroad_2b
	gh4_singer_male_ontheroad_3
	gh4_singer_male_ontheroad_3b
	gh4_singer_male_ontheroad_4
	gh4_singer_male_overkill_1
	gh4_singer_male_overkill_2
	gh4_singer_male_overkill_3
	gh4_singer_male_prettyvacant_1
	gh4_singer_male_prettyvacant_1b
	gh4_singer_male_prettyvacant_2
	gh4_singer_male_prettyvacant_2b
	gh4_singer_male_prettyvacant_3
	gh4_singer_male_prettyvacant_3b
	gh4_singer_male_prettyvacant_4
	gh4_singer_male_prettyvacant_4b
	gh4_singer_male_prettyvacant_5
	gh4_singer_male_prisonersociety_1
	gh4_singer_male_prisonersociety_1b
	gh4_singer_male_prisonersociety_2
	gh4_singer_male_prisonersociety_2b
	gh4_singer_male_prisonersociety_3
	gh4_singer_male_prisonersociety_3b
	gh4_singer_male_prisonersociety_4
	gh4_singer_male_prisonersociety_4b
	gh4_singer_male_prisonersociety_5
	gh4_singer_male_prisonersociety_5b
	gh4_singer_male_pullmeunder_1
	gh4_singer_male_pullmeunder_2
	gh4_singer_male_pullmeunder_3
	gh4_singer_male_pullmeunder_4
	gh4_singer_male_pullmeunder_5
	gh4_singer_male_pullmeunder_6
	gh4_singer_male_pullmeunder_7
	gh4_singer_male_pullmeunder_8
	gh4_singer_male_purplehaze_1
	gh4_singer_male_purplehaze_2
	gh4_singer_male_purplehaze_3
	gh4_singer_male_purplehaze_4
	gh4_singer_male_ramblinman_1
	gh4_singer_male_ramblinman_1b
	gh4_singer_male_ramblinman_2
	gh4_singer_male_ramblinman_2b
	gh4_singer_male_ramblinman_3
	gh4_singer_male_ramblinman_4
	gh4_singer_male_rebelyell_1
	gh4_singer_male_rebelyell_2
	gh4_singer_male_rebelyell_3
	gh4_singer_male_rebelyell_4
	gh4_singer_male_rebelyell_5
	gh4_singer_male_reedthroughlabor_1
	gh4_singer_male_reedthroughlabor_2
	gh4_singer_male_reedthroughlabor_3
	gh4_singer_male_reedthroughlabor_4
	gh4_singer_male_reedthroughlabor_5
	gh4_singer_male_revolution_1
	gh4_singer_male_revolution_2
	gh4_singer_male_revolutiongeorge_1
	gh4_singer_male_revolutiongeorge_2
	gh4_singer_male_revolutiongeorge_3
	gh4_singer_male_revolutionpaul_1
	gh4_singer_male_revolutionpaul_2
	gh4_singer_male_revolutionpaul_3
	gh4_singer_male_rockandrollband_1
	gh4_singer_male_rockandrollband_2
	gh4_singer_male_rockandrollband_3
	gh4_singer_male_rockandrollband_4
	gh4_singer_male_rockandrollband_5
	gh4_singer_male_rockandrollband_6
	gh4_singer_male_rooftops_1
	gh4_singer_male_rooftops_2
	gh4_singer_male_rooftops_2b
	gh4_singer_male_rooftops_3
	gh4_singer_male_rooftops_3b
	gh4_singer_male_rooftops_4
	gh4_singer_male_rooftops_4b
	gh4_singer_male_rooftops_5
	gh4_singer_male_santeria_1
	gh4_singer_male_santeria_2
	gh4_singer_male_screamaimfire_1
	gh4_singer_male_screamaimfire_1b
	gh4_singer_male_screamaimfire_2
	gh4_singer_male_screamaimfire_3
	gh4_singer_male_screamaimfire_4
	gh4_singer_male_screamaimfire_5
	gh4_singer_male_screamaimfire_6
	gh4_singer_male_sgtpeppers_1
	gh4_singer_male_sgtpeppers_2
	gh4_singer_male_sgtpeppersgeorge_1
	gh4_singer_male_sgtpeppersjohn_1
	gh4_singer_male_sgtpeppersjohn_2
	gh4_singer_male_shiver_1
	gh4_singer_male_shiver_2
	gh4_singer_male_shiver_3
	gh4_singer_male_shiver_4
	gh4_singer_male_shiver_5
	gh4_singer_male_shiver_6
	gh4_singer_male_shiver_7
	gh4_singer_male_somemightsay_1
	gh4_singer_male_somemightsay_1b
	gh4_singer_male_somemightsay_2
	gh4_singer_male_somemightsay_2b
	gh4_singer_male_somemightsay_3
	gh4_singer_male_somemightsay_3b
	gh4_singer_male_somemightsay_4
	gh4_singer_male_somemightsay_5
	gh4_singer_male_songname_1
	gh4_singer_male_souldoubt_1
	gh4_singer_male_souldoubt_1b
	gh4_singer_male_souldoubt_2
	gh4_singer_male_souldoubt_2b
	gh4_singer_male_souldoubt_3
	gh4_singer_male_souldoubt_3b
	gh4_singer_male_souldoubt_4
	gh4_singer_male_souldoubt_4b
	gh4_singer_male_souldoubt_5
	gh4_singer_male_stillborn_1
	gh4_singer_male_stillborn_2
	gh4_singer_male_stillborn_3
	gh4_singer_male_stranglehold_1
	gh4_singer_male_stranglehold_2
	gh4_singer_male_stranglehold_3
	gh4_singer_male_stranglehold_4
	gh4_singer_male_stranglehold_5
	gh4_singer_male_stranglehold_6
	gh4_singer_male_sweethome_1
	gh4_singer_male_sweethome_2
	gh4_singer_male_sweethome_2b
	gh4_singer_male_sweethome_3
	gh4_singer_male_sweethome_3b
	gh4_singer_male_sweethome_4
	gh4_singer_male_sweethome_4b
	gh4_singer_male_sweethome_5
	gh4_singer_male_sweethome_6
	gh4_singer_male_sweethome_6b
	gh4_singer_male_sweethome_7
	gh4_singer_male_sweethome_8
	gh4_singer_male_sweethome_9
	gh4_singer_male_thejoker_1
	gh4_singer_male_thejoker_2
	gh4_singer_male_thejoker_3
	gh4_singer_male_thejoker_4
	gh4_singer_male_thejoker_5
	gh4_singer_male_thekill_1
	gh4_singer_male_thekill_1b
	gh4_singer_male_thekill_2
	gh4_singer_male_thekill_2b
	gh4_singer_male_thekill_3
	gh4_singer_male_thekill_3b
	gh4_singer_male_thekill_4
	gh4_singer_male_thekill_4b
	gh4_singer_male_thekill_5
	gh4_singer_male_thekill_5b
	gh4_singer_male_themiddle_1
	gh4_singer_male_themiddle_1b
	gh4_singer_male_themiddle_2
	gh4_singer_male_themiddle_2b
	gh4_singer_male_themiddle_3b
	gh4_singer_male_themiddle_4b
	gh4_singer_male_theoneilove_1
	gh4_singer_male_theoneilove_1b
	gh4_singer_male_theoneilove_2
	gh4_singer_male_theoneilove_2b
	gh4_singer_male_theoneilove_3
	gh4_singer_male_today_1
	gh4_singer_male_today_2
	gh4_singer_male_today_3
	gh4_singer_male_today_4
	gh4_singer_male_toomuchtoo_1
	gh4_singer_male_toomuchtoo_2
	gh4_singer_male_toomuchtoo_2b
	gh4_singer_male_toomuchtoo_3
	gh4_singer_male_toomuchtoo_4
	gh4_singer_male_toomuchtoo_4b
	gh4_singer_male_toomuchtoo_4c
	gh4_singer_male_toomuchtoo_5
	gh4_singer_male_toomuchtoo_5b
	gh4_singer_male_toyboy_1
	gh4_singer_male_toyboy_2
	gh4_singer_male_toyboy_3
	gh4_singer_male_toyboy_4
	gh4_singer_male_toyboy_5
	gh4_singer_male_toyboy_6
	gh4_singer_male_toyboy_7
	gh4_singer_male_toyboy_8
	gh4_singer_male_trappedunderice_1
	gh4_singer_male_trappedunderice_1b
	gh4_singer_male_trappedunderice_2
	gh4_singer_male_trappedunderice_2b
	gh4_singer_male_trappedunderice_3
	gh4_singer_male_trappedunderice_3b
	gh4_singer_male_trappedunderice_4
	gh4_singer_male_trappedunderice_4b
	gh4_singer_male_twistandshout_1
	gh4_singer_male_twistandshout_1b
	gh4_singer_male_twistandshout_2
	gh4_singer_male_twistandshout_2b
	gh4_singer_male_twistandshout_3b
	gh4_singer_male_uparoundthebend_1
	gh4_singer_male_uparoundthebend_1b
	gh4_singer_male_uparoundthebend_2
	gh4_singer_male_uparoundthebend_2b
	gh4_singer_male_uparoundthebend_3
	gh4_singer_male_uparoundthebend_4
	gh4_singer_male_uparoundthebend_5
	gh4_singer_male_vinternoll2_1
	gh4_singer_male_vinternoll2_1b
	gh4_singer_male_vinternoll2_2
	gh4_singer_male_vinternoll2_2b
	gh4_singer_male_vinternoll2_3
	gh4_singer_male_vinternoll2_3b
	gh4_singer_male_vinternoll2_4
	gh4_singer_male_vinternoll2_5
	gh4_singer_male_vinternoll2_6
	gh4_singer_male_vinternoll2_7
	gh4_singer_male_vinternoll2_8
	gh4_singer_male_weaponofchoice_1
	gh4_singer_male_weaponofchoice_2
	gh4_singer_male_weaponofchoice_3
	gh4_singer_male_weaponofchoice_4
	gh4_singer_male_whativedone_1
	gh4_singer_male_whativedone_1b
	gh4_singer_male_whativedone_2
	gh4_singer_male_windcriesmary_1
	gh4_singer_male_windcriesmary_2
	gh4_singer_male_windcriesmary_3
	gh4_singer_male_windcriesmary_4
	gh4_singer_male_youregonnasay_1
	gh4_singer_male_youregonnasay_2
	gh4_singer_male_youregonnasay_3
	gh4_singer_male_youregonnasay_4
	gh4_singer_male_youregonnasay_5
	gh4_singer_male_youregonnasay_6
	gh4_singer_male_yourface_1
	gh4_singer_male_yourface_2
	gh4_singer_male_yourface_3
	gh4_singer_male_yourface_4
	gh4_singer_male_yourface_5
	gh4_singer_male_yourface_6
	gh_rocker_male_hardrockface_2
	gh_rocker_male_hardrockface_4
	gh_rocker_male_hardrockface_5
	gh_rocker_male_hardrockface_6
	gh_rocker_male_happy_1
]
