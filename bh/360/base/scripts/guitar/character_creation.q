
script create_band_member \{async = 0
		Pos = (0.0, 0.0, 0.0)
		Dir = (0.0, 0.0, 1.0)
		player = -1
		with_mic = 0}
	RequireParams \{[
			name
			async
			Pos
			Dir
		]
		all}
	if CompositeObjectExists <name>
		ScriptAssert '%s already exists' s = <name>
	endif
	instrument_played = <instrument>
	if (<instrument> = vocals_and_guitar)
		instrument_played = guitar
	endif
	ExtendCrc <name> '_Info' out = info_struct
	if NOT GotParam \{profile_struct}
		RequireParams \{[
				id
				savegame
			]
			all}
		CharacterProfileGetStruct name = <id> savegame = <savegame>
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
	get_start_node_id member = <name>
	if GotParam \{waypoint_id}
		if DoesWayPointExist name = <waypoint_id>
			GetWaypointPos name = <waypoint_id>
			GetWaypointDir name = <waypoint_id>
			Change structurename = <info_struct> target_node = <waypoint_id>
		else
			printf qs(0xa84ca33d) a = <name>
		endif
	endif
	printf qs(0xe349ad7b) a = <name> i = <instrument_played>
	if NOT GotParam \{asset_heap}
		get_best_heap_for_appearance appearance = (<profile_struct>.appearance)
		asset_heap = <best_heap>
	endif
	character_asset_context = <asset_heap>
	ik_params = hero_IK_Params
	if NOT get_body_key_from_appearance key = Skeleton appearance = (<profile_struct>.appearance)
		ScriptAssert \{'Missing skeleton in appearance'}
	endif
	if NOT get_body_key_from_appearance key = skeleton_path appearance = (<profile_struct>.appearance)
		ScriptAssert \{'Missing skeleton_path in appearance'}
	endif
	if NOT get_body_key_from_appearance key = Ragdoll appearance = (<profile_struct>.appearance)
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
				printf 'Using ik_params_vocals - %s' s = <ik_params> DoNotResolve
			endif
			case Drum
			if get_body_key_from_appearance key = ik_params_drum appearance = (<profile_struct>.appearance)
				ik_params = <ik_params_drum>
				printf 'Using ik_params_drum - %s' s = <ik_params> DoNotResolve
			endif
			default
			if get_body_key_from_appearance key = ik_params_guitar appearance = (<profile_struct>.appearance)
				ik_params = <ik_params_guitar>
				printf 'Using ik_params_guitar - %s' s = <ik_params> DoNotResolve
			endif
		endswitch
	else
		if get_body_key_from_appearance key = ik_params_frontend appearance = (<profile_struct>.appearance)
			ik_params = <ik_params_frontend>
			printf 'Using ik_params_frontend - %s' s = <ik_params> DoNotResolve
		endif
	endif
	if get_body_key_from_appearance key = anim_struct appearance = (<profile_struct>.appearance)
		Change structurename = <info_struct> anim_struct = <anim_struct>
	else
		ScriptAssert \{'anim_struct missing from appearance'}
	endif
	if (<instrument_played> = guitar)
		set_guitar_string_properties appearance = (<profile_struct>.appearance) info_struct = <info_struct> name = <name>
	elseif (<instrument_played> = bass)
		set_bass_string_properties appearance = (<profile_struct>.appearance) info_struct = <info_struct> name = <name>
	endif
	if (<player> > 0)
		SetPlayerInfo <player> band_member = <name>
		if (<use_ingame_anims> = 1)
			if NOT (<instrument_played> = vocals)
				SetPlayerInfo <player> highway_texture = `tex\models\Highway\Highway_Judy_fm_01.dds`
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
	LightGroup = [Band Alt_Band]
	CreateFromDesc {
		<profile_struct>
		name = <name>
		desc_id = CompositeObject_BandMember
		Pos = <Pos>
		AssetContext = <character_asset_context>
		object_type = bandmember
		profilebudget = 800
		only_animate_on_frames = <anim_frame>
		uniqueSkeletonPath = <skeleton_path>
		skeletonName = <Skeleton>
		allow_reset
		heap = heap_ragskel
		initialize_empty = false
		disable_collision_callbacks
		useUniqueSkeleton
		RagdollName = <Ragdoll>
		uniqueRagdollPath = <ragdoll_path>
		RagdollCollisionGroup = $<ragdoll_collision_group>
		heap = heap_ragskel
		accessory_bones = $<accessory_bones>
		LightGroup = <LightGroup>
		global_storage = <asset_heap>
		active_value_set = preview
		active_value_source_list = $drummer_active_values
	}
	<name> :Obj_SetOrientation Dir = <Dir>
	get_body_checksum_from_appearance appearance = (<profile_struct>.appearance)
	get_is_female_from_appearance appearance = (<profile_struct>.appearance)
	get_is_lefty_from_appearance appearance = (<profile_struct>.appearance)
	get_has_large_hands_from_appearance appearance = (<profile_struct>.appearance)
	if (<id> = GH_Rocker_BlackOut)
		is_special_unlockable_rocker_that_uses_net_silhouette_body = true
	endif
	<name> :SetTags {
		asset_heap = <asset_heap>
		body_checksum = <body_checksum>
		is_female = <is_female>
		lefty = <lefty>
		large_hands = <large_hands>
		appearance_checksum = <appearance_checksum>
		is_special_unlockable_rocker_that_uses_net_silhouette_body = <is_special_unlockable_rocker_that_uses_net_silhouette_body>
	}
	if GotParam \{anim_struct_member}
		<name> :SetTags anim_struct = (<anim_struct_member>.anim_set)
	endif
	if (<use_ingame_anims> = 1)
		switch (<instrument_played>)
			case vocals
			desired_tree = vocalist_static_tree
			case Drum
			if ($DrumTest = 1)
				desired_tree = new_drummer_static_tree
			else
				desired_tree = drummer_static_tree
			endif
			default
			desired_tree = guitarist_static_tree
		endswitch
		<name> :SetTags frontend_character = 0
		if (<instrument_played> = Drum)
			node_ids = $drumdroid_animnode_ids
		else
			node_ids = $nondrummer_anim_node_ids
		endif
	else
		desired_tree = frontend_static_tree
		node_ids = $nondrummer_anim_node_ids
		<name> :SetTags frontend_character = 1
	endif
	use_face_tension = 0
	face_tension_max = GH_Rocker_Male_NM_Max_D
	face_tension_min = GH_Rocker_Male_NM_Min_D
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
	<name> :Anim_InitTree {
		Tree = $<desired_tree>
		NodeIdDeclaration = <node_ids>
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
	if (<instrument_played> = Drum)
		if (<is_female> = 1)
			<name> :Anim_Command target = FemaleDiff Command = ApplyFemaleDrummerDifference_SetAnim params = {anim = GH_Rocker_Female_Drummer_D}
		endif
		if ((<Skeleton> = gh_rocker_lars_1) || (<Skeleton> = gh_rocker_lars_2) || (<Skeleton> = gh_rocker_lars_3) || (<Skeleton> = gh_rocker_lars_4))
			<name> :Anim_Command target = FemaleDiff Command = ApplyFemaleDrummerDifference_SetAnim params = {anim = GH_Rocker_Lars_Drummer_D}
		endif
		if ((<Skeleton> = gh_rocker_FrankenRocker_1) || (<Skeleton> = gh_rocker_FrankenRocker_2) || (<Skeleton> = gh_rocker_FrankenRocker_3) || (<Skeleton> = gh_rocker_FrankenRocker_4))
			<name> :Anim_Command target = FemaleDiff Command = ApplyFemaleDrummerDifference_SetAnim params = {anim = GH_Rocker_FrankenRocker_Drummer_D}
		endif
		if ((<Skeleton> = gh_rocker_Axel_1) || (<Skeleton> = gh_rocker_Axel_2) || (<Skeleton> = gh_rocker_Axel_3) || (<Skeleton> = gh_rocker_Axel_4))
			<name> :Anim_Command target = FemaleDiff Command = ApplyFemaleDrummerDifference_SetAnim params = {anim = GH_Rocker_Axel_Drummer_D}
		endif
	endif
	printf \{'Backing up bones'}
	<name> :Obj_ResetBones
	printf \{'Done backing up bones'}
	Change structurename = <info_struct> part = <instrument_played>
	Change structurename = <info_struct> playing = true
	<name> :SetTags instrument = <instrument_played> LightGroup = <LightGroup>
	if (<use_ingame_anims> = 0)
		band_member_start_anims {
			name = <name>
			instrument = None
		}
	endif
	<name> :Obj_SpawnScriptNow build_band_member_from_appearance params = {
		appearance = (<profile_struct>.appearance)
		LightGroup = <LightGroup>
		async = <async>
		instrument = <instrument_played>
		loading_into_song = <loading_into_song>
		asset_heap = <asset_heap>
		with_mic = <with_mic>
	}
	if (<async> = 1)
		BlockForScript \{build_band_member_from_appearance}
	endif
	if (<use_ingame_anims> = 0)
		instrument_played = None
	endif
	create_band_member_unlock
	if ($cas_model_build_success = 1)
		<name> :Obj_SpawnScriptNow PrepareBandMemberForRenderUpdateLoop
		persistent_band_set_data {
			Object = <name>
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
	RequireParams \{[
			position
		]
		all}
	GetPakManCurrent \{map = zones}
	if (<pak> = z_viewer)
	else
		switch <position>
			case Drummer
			LightGroup = [Band Drummer]
			case Bassist
			LightGroup = [Band Alt_Band Bassist]
			case Guitarist
			LightGroup = [Band Alt_Band Guitarist]
			case Vocalist
			LightGroup = [Band Alt_Band Vocalist]
			default
			LightGroup = [Band Alt_Band]
		endswitch
	endif
	return LightGroup = <LightGroup>
endscript

script get_body_checksum_from_appearance 
	if StructureContains structure = <appearance> CAS_Body
		return body_checksum = ((<appearance>.CAS_Body).desc_id)
	endif
	if StructureContains structure = <appearance> CAS_Full_Body
		return body_checksum = ((<appearance>.CAS_Full_Body).desc_id)
	endif
	printstruct <appearance>
	ScriptAssert \{'Character has no body!'}
endscript

script get_is_female_from_appearance 
	if StructureContains structure = <appearance> CAS_Body
		GetActualCASOptionStruct part = CAS_Body desc_id = ((<appearance>.CAS_Body).desc_id)
	endif
	if StructureContains structure = <appearance> CAS_Full_Body
		GetActualCASOptionStruct part = CAS_Full_Body desc_id = ((<appearance>.CAS_Full_Body).desc_id)
	endif
	if NOT GotParam \{is_female}
		if NOT GotParam \{dont_assert}
			ScriptAssert \{'Character has no body!'}
		endif
		GetNullChecksum
		return false is_female = <nullchecksum>
	endif
	return true is_female = <is_female>
endscript

script get_is_female_from_character_id 
	RequireParams \{[
			character_id
			savegame
		]
		all}
	if (<character_id> = None || <savegame> < 0)
		return \{false}
	endif
	CharacterProfileGetStruct name = <character_id> savegame = <savegame>
	if NOT GotParam \{profile_struct}
		return \{false}
	endif
	if NOT is_avatar_character id = <character_id> savegame = <savegame>
		get_is_female_from_appearance appearance = (<profile_struct>.appearance)
	else
		is_female = 0
		if IsAvatarFemale avatar_meta_data = ((<profile_struct>.appearance.CAS_Full_Body).avatar_meta_data)
			is_female = 1
		endif
	endif
	return true {is_female = <is_female>}
endscript

script get_is_lefty_from_appearance 
	if StructureContains structure = <appearance> CAS_Body
		GetActualCASOptionStruct part = CAS_Body desc_id = ((<appearance>.CAS_Body).desc_id)
	endif
	if StructureContains structure = <appearance> CAS_Full_Body
		GetActualCASOptionStruct part = CAS_Full_Body desc_id = ((<appearance>.CAS_Full_Body).desc_id)
	endif
	if NOT GotParam \{lefty}
		GetNullChecksum
		return \{false
			lefty = 0}
	endif
	return true lefty = <lefty>
endscript

script get_has_large_hands_from_appearance 
	if StructureContains structure = <appearance> CAS_Body
		GetActualCASOptionStruct part = CAS_Body desc_id = ((<appearance>.CAS_Body).desc_id)
	endif
	if StructureContains structure = <appearance> CAS_Full_Body
		GetActualCASOptionStruct part = CAS_Full_Body desc_id = ((<appearance>.CAS_Full_Body).desc_id)
	endif
	if NOT GotParam \{large_hands}
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
			instrument = Bass_And_Vocals
		endif
	endif
	if BuildCASModel {
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
	Change \{create_band_member_lock = 0}
endscript

script create_band_member_wait_for_lock 
	begin
	if ($create_band_member_lock_queue = 0)
		break
	endif
	wait \{1
		gameframe}
	repeat
	Change \{create_band_member_lock_queue = 1}
	begin
	if ($create_band_member_lock = 0)
		break
	endif
	wait \{1
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
	Drummer_Kill_Spawnscripts
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
	if CompositeObjectExists name = <name>
		BandManager_RemoveCharacter name = <name>
		<name> :Die
		SmartUnloadPak async = 0 tags = {highway_for = <name>}
		FlushDeadObjects
		cas_queue_external_destroy_object name = <name>
	endif
endscript

script kill_character_scripts 
	printf \{qs(0x2498acb7)}
	if CompositeObjectExists \{name = musician1}
		musician1 :Obj_SwitchScript \{EmptyScript}
	endif
	if CompositeObjectExists \{name = musician2}
		musician2 :Obj_SwitchScript \{EmptyScript}
	endif
	if CompositeObjectExists \{name = musician3}
		musician3 :Obj_SwitchScript \{EmptyScript}
	endif
	if CompositeObjectExists \{name = musician4}
		musician4 :Obj_SwitchScript \{EmptyScript}
	endif
endscript
