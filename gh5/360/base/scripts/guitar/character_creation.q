
script create_band_member \{async = 0
		Pos = (0.0, 0.0, 0.0)
		Dir = (0.0, 0.0, 1.0)
		Player = -1
		with_mic = 0}
	RequireParams \{[
			Name
			async
			Pos
			Dir
		]
		all}
	if CompositeObjectExists <Name>
		ScriptAssert '%s already exists' s = <Name>
	endif
	instrument_played = <instrument>
	if (<instrument> = vocals_and_guitar)
		instrument_played = guitar
	endif
	ExtendCrc <Name> '_Info' out = info_struct
	if NOT GotParam \{profile_struct}
		RequireParams \{[
				id
				savegame
			]
			all}
		characterprofilegetstruct Name = <id> savegame = <savegame>
	endif
	if NOT GotParam \{appearance_checksum}
		RequireParams \{[
				profile_struct
				instrument_played
			]
			all}
		get_appearance_checksum {appearance = (<profile_struct>.appearance) instrument = <instrument_played> mic = <with_mic>}
		appearance_checksum = <new_appearance_checksum>
	endif
	create_band_member_wait_for_lock
	get_start_node_id member = <Name>
	if GotParam \{waypoint_id}
		if DoesWaypointExist Name = <waypoint_id>
			GetWaypointPos Name = <waypoint_id>
			GetWaypointDir Name = <waypoint_id>
			Change structurename = <info_struct> target_node = <waypoint_id>
		else
			printf qs(0xa84ca33d) a = <Name>
		endif
	endif
	printf qs(0xe349ad7b) a = <Name> i = <instrument_played>
	if NOT GotParam \{asset_heap}
		get_best_heap_for_appearance appearance = (<profile_struct>.appearance)
		asset_heap = <best_heap>
	endif
	character_asset_context = <asset_heap>
	ik_params = Hero_Ik_params
	if NOT get_body_key_from_appearance key = Skeleton appearance = (<profile_struct>.appearance)
		ScriptAssert \{'Missing skeleton in appearance'}
	endif
	if NOT get_body_key_from_appearance key = skeleton_path appearance = (<profile_struct>.appearance)
		ScriptAssert \{'Missing skeleton_path in appearance'}
	endif
	if NOT get_body_key_from_appearance key = ragdoll appearance = (<profile_struct>.appearance)
		ScriptAssert \{'Missing ragdoll in appearance'}
	endif
	if NOT get_body_key_from_appearance key = ragdoll_path appearance = (<profile_struct>.appearance)
		ScriptAssert \{'Missing ragdoll_path in appearance'}
	endif
	if NOT get_body_key_from_appearance key = ragdoll_collision_group appearance = (<profile_struct>.appearance)
		ScriptAssert \{'Missing ragdoll_collision_group in appearance'}
	endif
	if NOT get_body_key_from_appearance key = accessory_bones appearance = (<profile_struct>.appearance)
		ScriptAssert \{'Missing accessory_bones in appearance'}
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
		Change structurename = <info_struct> anim_struct = <anim_struct>
	else
		ScriptAssert \{'anim_struct missing from appearance'}
	endif
	if (<instrument_played> = guitar)
		set_guitar_string_properties appearance = (<profile_struct>.appearance) info_struct = <info_struct> Name = <Name>
	elseif (<instrument_played> = bass)
		set_bass_string_properties appearance = (<profile_struct>.appearance) info_struct = <info_struct> Name = <Name>
	endif
	if (<Player> > 0)
		setplayerinfo <Player> band_member = <Name>
		if (<use_ingame_anims> = 1)
			if NOT (<instrument_played> = vocals)
				setplayerinfo <Player> highway_texture = `tex\models\highway\highway_judy_fm_01.dds`
			endif
		endif
	endif
	switch <Name>
		case musician1
		anim_frame = even
		case musician2
		anim_frame = even
		case musician3
		anim_frame = odd
		case musician4
		anim_frame = odd
	endswitch
	LightGroup = [Band Alt_Band]
	createfromdesc {
		<profile_struct>
		Name = <Name>
		desc_id = compositeobject_bandmember
		Pos = <Pos>
		AssetContext = <character_asset_context>
		object_type = bandmember
		profilebudget = 800
		only_animate_on_frames = <anim_frame>
		uniqueskeletonpath = <skeleton_path>
		skeletonname = <Skeleton>
		allow_reset
		Heap = heap_ragskel
		initialize_empty = FALSE
		disable_collision_callbacks
		useuniqueskeleton
		ragdollName = <ragdoll>
		uniqueragdollpath = <ragdoll_path>
		RagdollCollisionGroup = $<ragdoll_collision_group>
		Heap = heap_ragskel
		accessory_bones = $<accessory_bones>
		LightGroup = <LightGroup>
		global_storage = <asset_heap>
		active_value_set = preview
		active_value_source_list = $drummer_active_values
	}
	<Name> :Obj_SetOrientation Dir = <Dir>
	get_body_checksum_from_appearance appearance = (<profile_struct>.appearance)
	get_is_female_from_appearance appearance = (<profile_struct>.appearance)
	get_is_lefty_from_appearance appearance = (<profile_struct>.appearance)
	get_has_large_hands_from_appearance appearance = (<profile_struct>.appearance)
	if (<id> = gh_rocker_blackout)
		is_special_unlockable_rocker_that_uses_net_silhouette_body = true
	endif
	<Name> :SetTags {
		asset_heap = <asset_heap>
		body_checksum = <body_checksum>
		is_female = <is_female>
		lefty = <lefty>
		large_hands = <large_hands>
		appearance_checksum = <appearance_checksum>
		is_special_unlockable_rocker_that_uses_net_silhouette_body = <is_special_unlockable_rocker_that_uses_net_silhouette_body>
	}
	if GotParam \{anim_struct_member}
		<Name> :SetTags anim_struct = (<anim_struct_member>.anim_set)
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
		<Name> :SetTags frontend_character = 0
		if (<instrument_played> = drum)
			node_ids = $drumdroid_animnode_ids
		else
			node_ids = $nondrummer_anim_node_ids
		endif
	else
		desired_tree = frontend_static_tree
		node_ids = $nondrummer_anim_node_ids
		<Name> :SetTags frontend_character = 1
	endif
	use_face_tension = 0
	face_tension_max = gh_rocker_male_nm_max_d
	face_tension_min = gh_rocker_male_nm_min_d
	appearance = (<profile_struct>.appearance)
	if StructureContains structure = <appearance> face_tension
		use_face_tension = $<appearance_checksum>.face_tension
	endif
	if StructureContains structure = <appearance> face_tension_max
		face_tension_max = $<appearance_checksum>.face_tension_max
	endif
	if StructureContains structure = <appearance> face_tension_min
		face_tension_min = $<appearance_checksum>.face_tension_min
	endif
	elbow_bone_chord = Bone_Forearm_L
	elbow_bone_strum = Bone_Forearm_R
	negate_rolls = 1
	if (<lefty> = 1)
		elbow_bone_chord = Bone_Forearm_R
		elbow_bone_strum = Bone_Forearm_L
		negate_rolls = 0
	endif
	<Name> :Anim_InitTree {
		Tree = $<desired_tree>
		NodeIdDeclaration = <node_ids>
		params = {
			ik_params = <ik_params>
			Player = <Player>
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
			<Name> :Anim_Command target = femalediff Command = applyfemaledrummerdifference_setanim params = {anim = gh_rocker_female_drummer_d}
		endif
		if ((<Skeleton> = gh_rocker_lars_1) || (<Skeleton> = gh_rocker_lars_2) || (<Skeleton> = gh_rocker_lars_3) || (<Skeleton> = gh_rocker_lars_4))
			<Name> :Anim_Command target = femalediff Command = applyfemaledrummerdifference_setanim params = {anim = gh_rocker_lars_drummer_d}
		endif
		if ((<Skeleton> = gh_rocker_frankenrocker_1) || (<Skeleton> = gh_rocker_frankenrocker_2) || (<Skeleton> = gh_rocker_frankenrocker_3) || (<Skeleton> = gh_rocker_frankenrocker_4))
			<Name> :Anim_Command target = femalediff Command = applyfemaledrummerdifference_setanim params = {anim = gh_rocker_frankenrocker_drummer_d}
		endif
		if ((<Skeleton> = gh_rocker_axel_1) || (<Skeleton> = gh_rocker_axel_2) || (<Skeleton> = gh_rocker_axel_3) || (<Skeleton> = gh_rocker_axel_4))
			<Name> :Anim_Command target = femalediff Command = applyfemaledrummerdifference_setanim params = {anim = gh_rocker_axel_drummer_d}
		endif
	endif
	printf \{'Backing up bones'}
	<Name> :obj_resetbones
	printf \{'Done backing up bones'}
	Change structurename = <info_struct> part = <instrument_played>
	Change structurename = <info_struct> playing = true
	<Name> :SetTags instrument = <instrument_played> LightGroup = <LightGroup>
	if (<use_ingame_anims> = 0)
		band_member_start_anims {
			Name = <Name>
			instrument = None
		}
	endif
	<Name> :Obj_SpawnScriptNow build_band_member_from_appearance params = {
		appearance = (<profile_struct>.appearance)
		LightGroup = <LightGroup>
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
		instrument_played = None
	endif
	create_band_member_unlock
	if ($cas_model_build_success = 1)
		<Name> :Obj_SpawnScriptNow preparebandmemberforrenderupdateloop
		persistent_band_set_data {
			object = <Name>
			Player = <Player>
			instrument = <instrument_played>
			savegame = <savegame>
			character_id = <id>
			appearance = (<profile_struct>.appearance)
			stored_character_index = <stored_character_index>
			microphone = <with_mic>
			building = 0
		}
		persistent_band_setup_new_character {
			Name = <Name>
			instrument = <instrument>
			Player = <Player>
		}
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script cas_get_lightgroup 
	RequireParams \{[
			position
		]
		all}
	GetPakManCurrent \{map = zones}
	if (<pak> = z_viewer)
	else
		switch <position>
			case drummer
			LightGroup = [Band drummer]
			case BASSIST
			LightGroup = [Band Alt_Band BASSIST]
			case GUITARIST
			LightGroup = [Band Alt_Band GUITARIST]
			case vocalist
			LightGroup = [Band Alt_Band vocalist]
			default
			LightGroup = [Band Alt_Band]
		endswitch
	endif
	return LightGroup = <LightGroup>
endscript

script get_body_checksum_from_appearance 
	if StructureContains structure = <appearance> cas_body
		return body_checksum = ((<appearance>.cas_body).desc_id)
	endif
	if StructureContains structure = <appearance> cas_full_body
		return body_checksum = ((<appearance>.cas_full_body).desc_id)
	endif
	printstruct <appearance>
	ScriptAssert \{'Character has no body!'}
endscript

script get_is_female_from_appearance 
	if StructureContains structure = <appearance> cas_body
		getactualcasoptionstruct part = cas_body desc_id = ((<appearance>.cas_body).desc_id)
	endif
	if StructureContains structure = <appearance> cas_full_body
		getactualcasoptionstruct part = cas_full_body desc_id = ((<appearance>.cas_full_body).desc_id)
	endif
	if NOT GotParam \{is_female}
		if NOT GotParam \{dont_assert}
			ScriptAssert \{'Character has no body!'}
		endif
		getnullchecksum
		return FALSE is_female = <nullchecksum>
	endif
	return true is_female = <is_female>
endscript

script get_is_lefty_from_appearance 
	if StructureContains structure = <appearance> cas_body
		getactualcasoptionstruct part = cas_body desc_id = ((<appearance>.cas_body).desc_id)
	endif
	if StructureContains structure = <appearance> cas_full_body
		getactualcasoptionstruct part = cas_full_body desc_id = ((<appearance>.cas_full_body).desc_id)
	endif
	if NOT GotParam \{lefty}
		getnullchecksum
		return \{FALSE
			lefty = 0}
	endif
	return true lefty = <lefty>
endscript

script get_has_large_hands_from_appearance 
	if StructureContains structure = <appearance> cas_body
		getactualcasoptionstruct part = cas_body desc_id = ((<appearance>.cas_body).desc_id)
	endif
	if StructureContains structure = <appearance> cas_full_body
		getactualcasoptionstruct part = cas_full_body desc_id = ((<appearance>.cas_full_body).desc_id)
	endif
	if NOT GotParam \{large_hands}
		return \{FALSE
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
				no_bone_copy = 1
				loading_into_song = <loading_into_song>
			}
		}
		return \{true}
	endif
	return \{FALSE}
endscript
create_band_member_lock_queue = 0
create_band_member_lock = 0

script create_band_member_unlock 
	Change \{create_band_member_lock = 0}
endscript

script create_band_member_wait_for_lock 
	begin
	if ($create_band_member_lock_queue = 0)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	Change \{create_band_member_lock_queue = 1}
	begin
	if ($create_band_member_lock = 0)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	Change \{create_band_member_lock_queue = 0}
	Change \{create_band_member_lock = 1}
endscript

script destroy_band 
	printscriptinfo \{'destroy_band'}
	if ($in_tutorial_mode = 1)
		ScriptAssert \{'should not destroy band in tutorial mode'}
	endif
	cas_destroy_all_characters
	drummer_kill_spawnscripts
	band_stop_anims
	destroy_band_member \{Name = musician1}
	destroy_band_member \{Name = musician2}
	destroy_band_member \{Name = musician3}
	destroy_band_member \{Name = musician4}
	if ($use_old_system_setup = 1)
		band_unload_anim_paks
	endif
endscript

script destroy_band_member 
	if CompositeObjectExists Name = <Name>
		bandmanager_removecharacter Name = <Name>
		<Name> :Die
		smartunloadpak async = 0 tags = {highway_for = <Name>}
		flushdeadobjects
		cas_queue_external_destroy_object Name = <Name>
	endif
endscript

script kill_character_scripts 
	printf \{qs(0x2498acb7)}
	if CompositeObjectExists \{Name = musician1}
		musician1 :Obj_SwitchScript \{EmptyScript}
	endif
	if CompositeObjectExists \{Name = musician2}
		musician2 :Obj_SwitchScript \{EmptyScript}
	endif
	if CompositeObjectExists \{Name = musician3}
		musician3 :Obj_SwitchScript \{EmptyScript}
	endif
	if CompositeObjectExists \{Name = musician4}
		musician4 :Obj_SwitchScript \{EmptyScript}
	endif
endscript
