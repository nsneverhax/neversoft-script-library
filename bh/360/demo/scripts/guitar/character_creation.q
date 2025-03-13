
script create_band_member \{async = 0
		pos = (0.0, 0.0, 0.0)
		dir = (0.0, 0.0, 1.0)
		player = -1
		with_mic = 0}
	requireparams \{[
			name
			async
			pos
			dir
		]
		all}
	if compositeobjectexists <name>
		scriptassert '%s already exists' s = <name>
	endif
	instrument_played = <instrument>
	if (<instrument> = vocals_and_guitar)
		instrument_played = guitar
	endif
	extendcrc <name> '_Info' out = info_struct
	if NOT gotparam \{profile_struct}
		requireparams \{[
				id
				savegame
			]
			all}
		characterprofilegetstruct name = <id> savegame = <savegame>
	endif
	if NOT gotparam \{appearance_checksum}
		requireparams \{[
				profile_struct
				instrument_played
			]
			all}
		get_appearance_checksum {appearance = (<profile_struct>.appearance) instrument = <instrument_played> mic = <with_mic>}
		appearance_checksum = <new_appearance_checksum>
	endif
	create_band_member_wait_for_lock
	get_start_node_id member = <name>
	if gotparam \{waypoint_id}
		if doeswaypointexist name = <waypoint_id>
			getwaypointpos name = <waypoint_id>
			getwaypointdir name = <waypoint_id>
			change structurename = <info_struct> target_node = <waypoint_id>
		else
			printf qs(0xa84ca33d) a = <name>
		endif
	endif
	printf qs(0xe349ad7b) a = <name> i = <instrument_played>
	if NOT gotparam \{asset_heap}
		get_best_heap_for_appearance appearance = (<profile_struct>.appearance)
		asset_heap = <best_heap>
	endif
	character_asset_context = <asset_heap>
	ik_params = hero_ik_params
	if NOT get_body_key_from_appearance key = skeleton appearance = (<profile_struct>.appearance)
		scriptassert \{'Missing skeleton in appearance'}
	endif
	if NOT get_body_key_from_appearance key = skeleton_path appearance = (<profile_struct>.appearance)
		scriptassert \{'Missing skeleton_path in appearance'}
	endif
	if NOT get_body_key_from_appearance key = ragdoll appearance = (<profile_struct>.appearance)
		scriptassert \{'Missing ragdoll in appearance'}
	endif
	if NOT get_body_key_from_appearance key = ragdoll_path appearance = (<profile_struct>.appearance)
		scriptassert \{'Missing ragdoll_path in appearance'}
	endif
	if NOT get_body_key_from_appearance key = ragdoll_collision_group appearance = (<profile_struct>.appearance)
		scriptassert \{'Missing ragdoll_collision_group in appearance'}
	endif
	if NOT get_body_key_from_appearance key = accessory_bones appearance = (<profile_struct>.appearance)
		scriptassert \{'Missing accessory_bones in appearance'}
	endif
	get_body_key_from_appearance key = ik_params appearance = (<profile_struct>.appearance)
	use_ingame_anims = 0
	if ($is_in_cas = 0 && $in_character_select = 0)
		use_ingame_anims = 1
	endif
	if (<use_ingame_anims> = 1)
		switch (<instrument_played>)
			case vocals
			if get_body_key_from_appearance key = ik_params_vocals appearance = (<profile_struct>.appearance)
				ik_params = <ik_params_vocals>
				printf 'Using ik_params_vocals - %s' s = <ik_params> donotresolve
			endif
			case drum
			if get_body_key_from_appearance key = ik_params_drum appearance = (<profile_struct>.appearance)
				ik_params = <ik_params_drum>
				printf 'Using ik_params_drum - %s' s = <ik_params> donotresolve
			endif
			default
			if get_body_key_from_appearance key = ik_params_guitar appearance = (<profile_struct>.appearance)
				ik_params = <ik_params_guitar>
				printf 'Using ik_params_guitar - %s' s = <ik_params> donotresolve
			endif
		endswitch
	else
		if get_body_key_from_appearance key = ik_params_frontend appearance = (<profile_struct>.appearance)
			ik_params = <ik_params_frontend>
			printf 'Using ik_params_frontend - %s' s = <ik_params> donotresolve
		endif
	endif
	if get_body_key_from_appearance key = anim_struct appearance = (<profile_struct>.appearance)
		change structurename = <info_struct> anim_struct = <anim_struct>
	else
		scriptassert \{'anim_struct missing from appearance'}
	endif
	if (<instrument_played> = guitar)
		set_guitar_string_properties appearance = (<profile_struct>.appearance) info_struct = <info_struct> name = <name>
	elseif (<instrument_played> = bass)
		set_bass_string_properties appearance = (<profile_struct>.appearance) info_struct = <info_struct> name = <name>
	endif
	if (<player> > 0)
		setplayerinfo <player> band_member = <name>
		if (<use_ingame_anims> = 1)
			if NOT (<instrument_played> = vocals)
				setplayerinfo <player> highway_texture = `tex\models\highway\highway_judy_fm_01.dds`
			endif
		endif
	endif
	switch <name>
		case musician1
		anim_frame = even
		case musician2
		anim_frame = even
		case musician3
		anim_frame = odd
		case musician4
		anim_frame = odd
	endswitch
	lightgroup = [band alt_band]
	createfromdesc {
		<profile_struct>
		name = <name>
		desc_id = compositeobject_bandmember
		pos = <pos>
		assetcontext = <character_asset_context>
		object_type = bandmember
		profilebudget = 800
		only_animate_on_frames = <anim_frame>
		uniqueskeletonpath = <skeleton_path>
		skeletonname = <skeleton>
		allow_reset
		heap = heap_ragskel
		initialize_empty = false
		disable_collision_callbacks
		useuniqueskeleton
		ragdollname = <ragdoll>
		uniqueragdollpath = <ragdoll_path>
		ragdollcollisiongroup = $<ragdoll_collision_group>
		heap = heap_ragskel
		accessory_bones = $<accessory_bones>
		lightgroup = <lightgroup>
		global_storage = <asset_heap>
		active_value_set = preview
		active_value_source_list = $drummer_active_values
	}
	<name> :obj_setorientation dir = <dir>
	get_body_checksum_from_appearance appearance = (<profile_struct>.appearance)
	get_is_female_from_appearance appearance = (<profile_struct>.appearance)
	get_is_lefty_from_appearance appearance = (<profile_struct>.appearance)
	get_has_large_hands_from_appearance appearance = (<profile_struct>.appearance)
	if (<id> = gh_rocker_blackout)
		is_special_unlockable_rocker_that_uses_net_silhouette_body = true
	endif
	<name> :settags {
		asset_heap = <asset_heap>
		body_checksum = <body_checksum>
		is_female = <is_female>
		lefty = <lefty>
		large_hands = <large_hands>
		appearance_checksum = <appearance_checksum>
		is_special_unlockable_rocker_that_uses_net_silhouette_body = <is_special_unlockable_rocker_that_uses_net_silhouette_body>
	}
	if gotparam \{anim_struct_member}
		<name> :settags anim_struct = (<anim_struct_member>.anim_set)
	endif
	if (<use_ingame_anims> = 1)
		switch (<instrument_played>)
			case vocals
			desired_tree = vocalist_static_tree
			case drum
			if ($drumtest = 1)
				desired_tree = new_drummer_static_tree
			else
				desired_tree = drummer_static_tree
			endif
			default
			desired_tree = guitarist_static_tree
		endswitch
		<name> :settags frontend_character = 0
		if (<instrument_played> = drum)
			node_ids = $drumdroid_animnode_ids
		else
			node_ids = $nondrummer_anim_node_ids
		endif
	else
		desired_tree = frontend_static_tree
		node_ids = $nondrummer_anim_node_ids
		<name> :settags frontend_character = 1
	endif
	use_face_tension = 0
	face_tension_max = gh_rocker_male_nm_max_d
	face_tension_min = gh_rocker_male_nm_min_d
	appearance = (<profile_struct>.appearance)
	if structurecontains structure = <appearance> face_tension
		use_face_tension = $<appearance_checksum>.face_tension
	endif
	if structurecontains structure = <appearance> face_tension_max
		face_tension_max = $<appearance_checksum>.face_tension_max
	endif
	if structurecontains structure = <appearance> face_tension_min
		face_tension_min = $<appearance_checksum>.face_tension_min
	endif
	elbow_bone_chord = bone_forearm_l
	elbow_bone_strum = bone_forearm_r
	negate_rolls = 1
	if (<lefty> = 1)
		elbow_bone_chord = bone_forearm_r
		elbow_bone_strum = bone_forearm_l
		negate_rolls = 0
	endif
	<name> :anim_inittree {
		tree = $<desired_tree>
		nodeiddeclaration = <node_ids>
		params = {
			ik_params = <ik_params>
			player = <player>
			use_face_tension = <use_face_tension>
			face_tension_max = <face_tension_max>
			face_tension_min = <face_tension_min>
			elbow_bone_chord = <elbow_bone_chord>
			elbow_bone_strum = <elbow_bone_strum>
			negate_rolls = <negate_rolls>
		}
	}
	if (<instrument_played> = drum)
		if (<is_female> = 1)
			<name> :anim_command target = femalediff command = applyfemaledrummerdifference_setanim params = {anim = gh_rocker_female_drummer_d}
		endif
		if ((<skeleton> = gh_rocker_lars_1) || (<skeleton> = gh_rocker_lars_2) || (<skeleton> = gh_rocker_lars_3) || (<skeleton> = gh_rocker_lars_4))
			<name> :anim_command target = femalediff command = applyfemaledrummerdifference_setanim params = {anim = gh_rocker_lars_drummer_d}
		endif
		if ((<skeleton> = gh_rocker_frankenrocker_1) || (<skeleton> = gh_rocker_frankenrocker_2) || (<skeleton> = gh_rocker_frankenrocker_3) || (<skeleton> = gh_rocker_frankenrocker_4))
			<name> :anim_command target = femalediff command = applyfemaledrummerdifference_setanim params = {anim = gh_rocker_frankenrocker_drummer_d}
		endif
		if ((<skeleton> = gh_rocker_axel_1) || (<skeleton> = gh_rocker_axel_2) || (<skeleton> = gh_rocker_axel_3) || (<skeleton> = gh_rocker_axel_4))
			<name> :anim_command target = femalediff command = applyfemaledrummerdifference_setanim params = {anim = gh_rocker_axel_drummer_d}
		endif
	endif
	printf \{'Backing up bones'}
	<name> :obj_resetbones
	printf \{'Done backing up bones'}
	change structurename = <info_struct> part = <instrument_played>
	change structurename = <info_struct> playing = true
	<name> :settags instrument = <instrument_played> lightgroup = <lightgroup>
	if (<use_ingame_anims> = 0)
		band_member_start_anims {
			name = <name>
			instrument = none
		}
	endif
	<name> :obj_spawnscriptnow build_band_member_from_appearance params = {
		appearance = (<profile_struct>.appearance)
		lightgroup = <lightgroup>
		async = <async>
		instrument = <instrument_played>
		loading_into_song = <loading_into_song>
		asset_heap = <asset_heap>
		with_mic = <with_mic>
	}
	if (<async> = 1)
		blockforscript \{build_band_member_from_appearance}
	endif
	if (<use_ingame_anims> = 0)
		instrument_played = none
	endif
	create_band_member_unlock
	if ($cas_model_build_success = 1)
		<name> :obj_spawnscriptnow preparebandmemberforrenderupdateloop
		persistent_band_set_data {
			object = <name>
			player = <player>
			instrument = <instrument_played>
			savegame = <savegame>
			character_id = <id>
			appearance = (<profile_struct>.appearance)
			stored_character_index = <stored_character_index>
			microphone = <with_mic>
			building = 0
		}
		persistent_band_setup_new_character {
			name = <name>
			instrument = <instrument>
			player = <player>
		}
		return \{true}
	else
		return \{false}
	endif
endscript

script cas_get_lightgroup 
	requireparams \{[
			position
		]
		all}
	getpakmancurrent \{map = zones}
	if (<pak> = z_viewer)
	else
		switch <position>
			case drummer
			lightgroup = [band drummer]
			case bassist
			lightgroup = [band alt_band bassist]
			case guitarist
			lightgroup = [band alt_band guitarist]
			case vocalist
			lightgroup = [band alt_band vocalist]
			default
			lightgroup = [band alt_band]
		endswitch
	endif
	return lightgroup = <lightgroup>
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
		if NOT gotparam \{dont_assert}
			scriptassert \{'Character has no body!'}
		endif
		getnullchecksum
		return false is_female = <nullchecksum>
	endif
	return true is_female = <is_female>
endscript

script get_is_female_from_character_id 
	requireparams \{[
			character_id
			savegame
		]
		all}
	if (<character_id> = none || <savegame> < 0)
		return \{false}
	endif
	characterprofilegetstruct name = <character_id> savegame = <savegame>
	if NOT gotparam \{profile_struct}
		return \{false}
	endif
	if NOT is_avatar_character id = <character_id> savegame = <savegame>
		get_is_female_from_appearance appearance = (<profile_struct>.appearance)
	else
		is_female = 0
		if isavatarfemale avatar_meta_data = ((<profile_struct>.appearance.cas_full_body).avatar_meta_data)
			is_female = 1
		endif
	endif
	return true {is_female = <is_female>}
endscript

script get_is_lefty_from_appearance 
	if structurecontains structure = <appearance> cas_body
		getactualcasoptionstruct part = cas_body desc_id = ((<appearance>.cas_body).desc_id)
	endif
	if structurecontains structure = <appearance> cas_full_body
		getactualcasoptionstruct part = cas_full_body desc_id = ((<appearance>.cas_full_body).desc_id)
	endif
	if NOT gotparam \{lefty}
		getnullchecksum
		return \{false
			lefty = 0}
	endif
	return true lefty = <lefty>
endscript

script get_has_large_hands_from_appearance 
	if structurecontains structure = <appearance> cas_body
		getactualcasoptionstruct part = cas_body desc_id = ((<appearance>.cas_body).desc_id)
	endif
	if structurecontains structure = <appearance> cas_full_body
		getactualcasoptionstruct part = cas_full_body desc_id = ((<appearance>.cas_full_body).desc_id)
	endif
	if NOT gotparam \{large_hands}
		return \{false
			large_hands = 0}
	endif
	return true large_hands = <large_hands>
endscript

script build_band_member_from_appearance \{instrument = guitar
		with_mic = 0}
	if (<with_mic> = 1)
		if (<instrument> = guitar)
			instrument = guitar_and_vocals
		elseif (<instrument> = bass)
			instrument = bass_and_vocals
		endif
	endif
	if buildcasmodel {
			appearance = <appearance>
			async = <async>
			buildscriptparams = {
				instrument = <instrument>
				new_object = 1
				no_bone_copy = 1
				loading_into_song = <loading_into_song>
			}
		}
		return \{true}
	endif
	return \{false}
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
	printscriptinfo \{'destroy_band'}
	if ($in_tutorial_mode = 1)
		scriptassert \{'should not destroy band in tutorial mode'}
	endif
	cas_destroy_all_characters
	drummer_kill_spawnscripts
	band_stop_anims
	destroy_band_member \{name = musician1}
	destroy_band_member \{name = musician2}
	destroy_band_member \{name = musician3}
	destroy_band_member \{name = musician4}
	if ($use_old_system_setup = 1)
		band_unload_anim_paks
	endif
endscript

script destroy_band_member 
	if compositeobjectexists name = <name>
		bandmanager_removecharacter name = <name>
		<name> :die
		smartunloadpak async = 0 tags = {highway_for = <name>}
		flushdeadobjects
		cas_queue_external_destroy_object name = <name>
	endif
endscript

script kill_character_scripts 
	printf \{qs(0x2498acb7)}
	if compositeobjectexists \{name = musician1}
		musician1 :obj_switchscript \{emptyscript}
	endif
	if compositeobjectexists \{name = musician2}
		musician2 :obj_switchscript \{emptyscript}
	endif
	if compositeobjectexists \{name = musician3}
		musician3 :obj_switchscript \{emptyscript}
	endif
	if compositeobjectexists \{name = musician4}
		musician4 :obj_switchscript \{emptyscript}
	endif
endscript
