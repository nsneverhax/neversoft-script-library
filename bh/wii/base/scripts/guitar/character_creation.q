
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
	ps2_get_musician_context_data Name = <Name>
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
	if NOT GotParam \{no_appearance_pak_load}
		unloadappearancepaks appearance = ($<bandmember_appearance>) asset_context = <asset_heap> async = <async>
		Change GlobalName = <bandmember_appearance> NewValue = {}
	endif
	if GotParam \{waypoint_id}
		if DoesWaypointExist Name = <waypoint_id>
			GetWaypointPos Name = <waypoint_id>
			GetWaypointDir Name = <waypoint_id>
			Change structurename = <info_struct> target_node = <waypoint_id>
		else
		endif
	endif
	if NOT GotParam \{asset_heap}
		asset_heap = quota_animations
	endif
	anim_asset_context = <asset_heap>
	if get_key_from_appearance key = anim_struct appearance = (<profile_struct>.appearance)
		if GotParam \{loading_into_song}
			get_anim_struct_member anim_struct = <anim_struct> loading_into_song = <loading_into_song> member = <instrument_played>
		else
		endif
		if NOT StructureContains structure = ($<anim_struct>) anim_asset_context
			ScriptAssert \{'anim_asset_context missing!'}
		endif
		anim_asset_context = (($<anim_struct>).anim_asset_context)
	else
		ScriptAssert \{'anim_struct not found in appearance'}
	endif
	use_ingame_anims = 0
	if GotParam \{loading_into_song}
		use_ingame_anims = 1
	endif
	if ($soundcheck_in_store = 1)
		<LightGroup> = Guitar_Center_Band
	endif
	if NOT GotParam \{create_mii}
		ik_params = Hero_Ik_params
	else
		ik_params = mii_ik_params
	endif
	if NOT get_key_from_appearance key = Skeleton appearance = (<profile_struct>.appearance)
		ScriptAssert \{'Missing skeleton in appearance'}
	endif
	if NOT get_key_from_appearance key = skeleton_path appearance = (<profile_struct>.appearance)
		ScriptAssert \{'Missing skeleton_path in appearance'}
	endif
	use_ingame_anims = 0
	if ($use_persistent_band = 1 && $is_in_cas = 0 && $in_character_select = 0)
		use_ingame_anims = 1
	elseif GotParam \{loading_into_song}
		use_ingame_anims = 1
	endif
	get_key_from_appearance key = ik_params appearance = (<profile_struct>.appearance)
	if (<use_ingame_anims> = 1)
		switch (<instrument_played>)
			case vocals
			if get_key_from_appearance key = ik_params_vocals appearance = (<profile_struct>.appearance)
				ik_params = <ik_params_vocals>
				printf 'Using ik_params_vocals - %s' s = <ik_params> donotresolve
			endif
			case drum
			if get_key_from_appearance key = ik_params_drum appearance = (<profile_struct>.appearance)
				ik_params = <ik_params_drum>
				printf 'Using ik_params_drum - %s' s = <ik_params> donotresolve
			endif
			default
			if get_key_from_appearance key = ik_params_guitar appearance = (<profile_struct>.appearance)
				ik_params = <ik_params_guitar>
				printf 'Using ik_params_guitar - %s - %d' s = <ik_params> donotresolve d = <instrument_played>
			endif
		endswitch
	else
		if get_key_from_appearance key = ik_params_frontend appearance = (<profile_struct>.appearance)
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
	if GotParam \{Player}
		setplayerinfo <Player> band_member = <Name>
	endif
	if NOT GotParam \{create_mii}
		get_is_female_from_appearance appearance = (<profile_struct>.appearance)
		switch (<instrument_played>)
			case drum
			if get_key_from_appearance key = drummer_skeleton appearance = (<profile_struct>.appearance)
				formatText TextName = skeleton_pak_name 'pak\\skeletons\\skeleton_%a.pak' a = <drummer_skeleton>
				formatText checksumName = Skeleton '%a' a = <drummer_skeleton>
			endif
			default
			if get_key_from_appearance key = rocker_skeleton appearance = (<profile_struct>.appearance)
				formatText TextName = skeleton_pak_name 'pak\\skeletons\\skeleton_%a.pak' a = <rocker_skeleton>
				formatText checksumName = Skeleton '%a' a = <rocker_skeleton>
			endif
		endswitch
		if NOT GotParam \{skeleton_pak_name}
			switch (<instrument_played>)
				case drum
				if (<is_female> = 1)
					formatText TextName = skeleton_pak_name 'pak\\skeletons\\drummer_skeleton%af.pak' a = <asset_slot_num>
					formatText checksumName = Skeleton 'drummer_skeleton%af' a = <asset_slot_num>
				else
					formatText TextName = skeleton_pak_name 'pak\\skeletons\\drummer_skeleton%am.pak' a = <asset_slot_num>
					formatText checksumName = Skeleton 'drummer_skeleton%am' a = <asset_slot_num>
				endif
				default
				if (<is_female> = 1)
					formatText TextName = skeleton_pak_name 'pak\\skeletons\\guitarist_skeleton%af.pak' a = <asset_slot_num>
					formatText checksumName = Skeleton 'guitarist_skeleton%af' a = <asset_slot_num>
				else
					formatText TextName = skeleton_pak_name 'pak\\skeletons\\guitarist_skeleton%am.pak' a = <asset_slot_num>
					formatText checksumName = Skeleton 'guitarist_skeleton%am' a = <asset_slot_num>
				endif
			endswitch
		endif
		PushAssetContext context = <asset_heap>
		LoadPak <skeleton_pak_name> Heap = <asset_heap>
		PopAssetContext
	endif
	Change GlobalName = <bandmember_appearance> NewValue = (<profile_struct>.appearance)
	if (<Name> = vocalist)
		if (<instrument_played> = guitar || <instrument_played> = bass)
			with_mic = 1
		endif
	endif
	temp_instrument = <instrument_played>
	if GotParam \{no_instrument_pak_load}
		temp_instrument = None
	else
		if (<with_mic> = 1)
			if (<temp_instrument> = guitar)
				temp_instrument = guitar_and_vocals
			elseif (<temp_instrument> = bass)
				temp_instrument = bass_and_vocals
			elseif (<temp_instrument> = vocals)
				temp_instrument = guitar_and_vocals
			endif
		endif
	endif
	if NOT GotParam \{no_appearance_pak_load}
		loadappearancepaks appearance = (<profile_struct>.appearance) Heap = (<asset_heap>) instrument = <temp_instrument> asset_context = <asset_heap> async = <async>
	endif
	shadow_models = []
	get_key_from_appearance key = shadow_models appearance = (<profile_struct>.appearance)
	cas_get_lightgroup Name = <Name>
	if GotParam \{create_mii}
		mii_index = ($freestyle_player_data [<freestyle_player>].mii_index)
		mii_database = ($freestyle_player_data [<freestyle_player>].mii_database)
		mii_expressions = ($freestyle_player_data [<freestyle_player>].mii_expressions)
		CreateCompositeObject {
			components = [
				{
					component = Skeleton
					skeletonname = <Skeleton>
					allow_reset
				}
				{
					component = SetDisplayMatrix
				}
				{
					component = AnimTree
					skeletonname = <Skeleton>
				}
				{
					component = Model
					LightGroup = <LightGroup>
				}
				{
					component = motion
				}
				{
					component = modelbuilder
				}
				{
					component = miihead
					attach_bone = bone_head
					mii_index = <mii_index>
					mii_database = <mii_database>
					mii_expressions = <mii_expressions>
					mii_resolution = 256
				}
			]
			params = {
				<profile_struct>
				Pos = <Pos>
				AssetContext = <asset_heap>
				object_type = bandmember
				profilebudget = 800
				Name = <Name>
			}
		}
	else
		CreateCompositeObject {
			components = [
				{
					component = Skeleton
					skeletonname = <Skeleton>
					allow_reset
				}
				{
					component = SetDisplayMatrix
				}
				{
					component = AnimTree
					skeletonname = <Skeleton>
				}
				{
					component = Model
					LightGroup = <LightGroup>
				}
				{
					component = motion
				}
				{
					component = modelbuilder
				}
				{
					component = AnimPreview
					active_value_source_list = $drummer_active_values
				}
				{
					component = AnimInfo
					active_value_set = preview
				}
			]
			params = {
				<profile_struct>
				Pos = <Pos>
				AssetContext = <asset_heap>
				object_type = bandmember
				profilebudget = 800
				Name = <Name>
			}
		}
	endif
	<Name> :Obj_SetOrientation Dir = <Dir>
	if (<Name> = $anim_debug_target)
		set_new_anim_debug_target target = <Name>
	endif
	get_body_checksum_from_appearance appearance = (<profile_struct>.appearance)
	is_special_unlockable_rocker_that_uses_net_silhouette_body = FALSE
	if NOT GotParam \{create_mii}
		get_is_female_from_appearance appearance = (<profile_struct>.appearance)
		get_is_lefty_from_appearance appearance = (<profile_struct>.appearance)
		get_has_large_hands_from_appearance appearance = (<profile_struct>.appearance)
		if (<id> = gh_rocker_blackout)
			is_special_unlockable_rocker_that_uses_net_silhouette_body = true
		endif
	else
		is_female = 0
		lefty = 0
		large_hands = 0
	endif
	<Name> :SetTags asset_heap = <asset_heap>
	<Name> :SetTags body_checksum = <body_checksum>
	<Name> :SetTags is_female = <is_female>
	<Name> :SetTags lefty = <lefty>
	<Name> :SetTags large_hands = <large_hands>
	<Name> :SetTags appearance_checksum = <appearance_checksum>
	<Name> :SetTags geom_heap = <asset_heap>
	<Name> :SetTags is_special_unlockable_rocker_that_uses_net_silhouette_body = <is_special_unlockable_rocker_that_uses_net_silhouette_body>
	<Name> :SetTags current_instrument = <temp_instrument>
	if (<use_ingame_anims> = 1)
		if GotParam \{create_mii}
			switch (<instrument_played>)
				case drum
				desired_tree = mii_drummer_static_tree
				default
				desired_tree = mii_guitarist_static_tree
			endswitch
		else
			switch (<instrument_played>)
				case vocals
				desired_tree = vocalist_static_tree
				case drum
				desired_tree = new_drummer_static_tree
				default
				desired_tree = guitarist_static_tree
			endswitch
		endif
		<Name> :SetTags frontend_character = 0
		if (<instrument_played> = drum)
			if GotParam \{create_mii}
				node_ids = $drummer_anim_node_ids
			else
				node_ids = $drumdroid_animnode_ids
			endif
		else
			node_ids = $nondrummer_anim_node_ids
		endif
	else
		desired_tree = frontend_static_tree
		node_ids = $nondrummer_anim_node_ids
		<Name> :SetTags frontend_character = 1
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
			elbow_bone_chord = <elbow_bone_chord>
			elbow_bone_strum = <elbow_bone_strum>
			negate_rolls = <negate_rolls>
		}
	}
	if (<instrument_played> = drum)
		if (<is_female> = 1)
			<Name> :Anim_Command target = femalediff Command = applyfemaledrummerdifference_setanim params = {anim = gh_rocker_female_drummer_d}
		endif
		if ((<Skeleton> = gh_drummer_lars_1) || (<Skeleton> = gh_drummer_lars_2) || (<Skeleton> = gh_drummer_lars_3) || (<Skeleton> = gh_drummer_lars_4))
			<Name> :Anim_Command target = femalediff Command = applyfemaledrummerdifference_setanim params = {anim = gh_rocker_lars_drummer_d}
		endif
		if ((<Skeleton> = gh_drummer_frankenrocker_1) || (<Skeleton> = gh_drummer_frankenrocker_2) || (<Skeleton> = gh_drummer_frankenrocker_3) || (<Skeleton> = gh_drummer_frankenrocker_4))
			<Name> :Anim_Command target = femalediff Command = applyfemaledrummerdifference_setanim params = {anim = gh_rocker_frankenrocker_drummer_d}
		endif
		if ((<Skeleton> = gh_drummer_axel_1) || (<Skeleton> = gh_drummer_axel_2) || (<Skeleton> = gh_drummer_axel_3) || (<Skeleton> = gh_drummer_axel_4))
			<Name> :Anim_Command target = femalediff Command = applyfemaledrummerdifference_setanim params = {anim = gh_rocker_axel_drummer_d}
		endif
	endif
	ExtendCrc <Name> '_Info' out = info_struct
	Change structurename = <info_struct> part = <instrument_played>
	Change structurename = <info_struct> playing = true
	<Name> :SetTags instrument = <instrument_played> LightGroup = <LightGroup>
	if ($is_in_cas = 1 || $in_character_select = 1)
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
		with_mic = <with_mic>
		geom_heap = <asset_heap>
		AssetContext = <asset_heap>
	}
	if (<async> = 1)
		blockforscript \{build_band_member_from_appearance}
	endif
	if ($use_persistent_band = 1)
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
	endif
	create_band_member_unlock
	if ($create_band_member_success = 1)
		<Name> :Obj_SpawnScriptNow preparebandmemberforrenderupdateloop
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script cas_get_lightgroup 
	RequireParams \{[
			Name
		]
		all}
	switch <Name>
		case drummer
		case drummer2
		case musician2
		LightGroup = drummer
		case BASSIST
		case bassist2
		case musician4
		LightGroup = BASSIST
		case GUITARIST
		case guitarist2
		case musician3
		LightGroup = GUITARIST
		case vocalist
		case vocalist2
		case musician1
		LightGroup = vocalist
		default
		LightGroup = Band
	endswitch
	return LightGroup = <LightGroup>
endscript

script get_body_checksum_from_appearance 
	if StructureContains structure = <appearance> cas_body
		return body_checksum = ((<appearance>.cas_body).desc_id)
	endif
	if StructureContains structure = <appearance> musician_body
		return body_checksum = ((<appearance>.musician_body).desc_id)
	endif
	if StructureContains structure = <appearance> cas_full_body
		return body_checksum = ((<appearance>.cas_full_body).desc_id)
	endif
	ScriptAssert \{'Character has no body!'}
endscript

script get_is_female_from_appearance 
	if StructureContains structure = <appearance> cas_body
		getactualcasoptionstruct part = cas_body desc_id = ((<appearance>.cas_body).desc_id) car_parts_not_needed
	endif
	if StructureContains structure = <appearance> cas_full_body
		getactualcasoptionstruct part = cas_full_body desc_id = ((<appearance>.cas_full_body).desc_id) car_parts_not_needed
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
		endif
	endif
	if NOT 0x1469760b
		gethathairchoice appearance = <appearance>
		getaccchoice appearance = <appearance>
		getshoeschoice appearance = <appearance>
	endif
	buildscriptparams = {
		LightGroup = <LightGroup>
		temporary_heap = quota_cas
		instrument = <instrument>
		hat_hair_choice = <hat_hair_choice>
		acc_left_choice = <acc_left_choice>
		acc_right_choice = <acc_right_choice>
		shoes_choice = <shoes_choice>
	}
	modelbuilder_preload {
		<...>
		geom_heap = <geom_heap>
		AssetContext = <AssetContext>
		appearance = <appearance>
		buildscriptparams = <buildscriptparams>
	}
	if NOT GotParam \{cancelled}
		Change \{create_band_member_success = 1}
		Obj_GetID
		if (<with_mic> = 1 && <objID> != vocalist)
			if NOT (<instrument> = vocals)
			endif
		endif
		return \{true}
	endif
	return \{FALSE}
endscript
create_band_member_lock_queue = 0
create_band_member_lock = 0
create_band_member_success = 0

script create_band_member_unlock 
	Change \{create_band_member_lock = 0}
endscript

script create_band_member_wait_for_lock 
	begin
	if ($create_band_member_lock_queue = 0)
		break
	endif
	WaitOneGameFrame
	repeat
	Change \{create_band_member_lock_queue = 1}
	begin
	if ($create_band_member_lock = 0)
		break
	endif
	WaitOneGameFrame
	repeat
	Change \{create_band_member_lock_queue = 0}
	Change \{create_band_member_lock = 1}
	Change \{create_band_member_success = 0}
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
	band_unload_anim_paks
	if GotParam \{unload_paks}
		mpm_flush_all_paks
	endif
endscript

script destroy_band_member 
	printf \{qs(0x92dccd48)}
	printf qs(0x460ff8fc) d = <Name> donotresolve
	ps2_get_musician_context_data Name = <Name>
	if CompositeObjectExists Name = <Name>
		if NOT 0x1469760b
			band_builder_remove_setup_entry Name = <Name>
		endif
		switch <Name>
			case musician1
			KillCamAnim \{Name = band_viewport_cam_0}
			case musician2
			KillCamAnim \{Name = band_viewport_cam_1}
			case musician3
			KillCamAnim \{Name = band_viewport_cam_2}
			case musician4
			KillCamAnim \{Name = band_viewport_cam_3}
		endswitch
		bandmanager_removecharacter Name = <Name>
		<Name> :Die
		flushdeadobjects
		if NOT 0x1469760b
			if get_key_from_appearance key = drummer_skeleton appearance = ($<bandmember_appearance>)
				formatText TextName = skeleton_pak_name 'pak\\skeletons\\skeleton_%a.pak' a = <drummer_skeleton>
				formatText checksumName = Skeleton '%a' a = <drummer_skeleton>
				if ispakloaded <skeleton_pak_name> Heap = <asset_heap>
					PushAssetContext context = <asset_heap>
					UnLoadPak <skeleton_pak_name> Heap = <asset_heap> sameheaps
					PopAssetContext
				endif
			endif
			if get_key_from_appearance key = rocker_skeleton appearance = ($<bandmember_appearance>)
				formatText TextName = skeleton_pak_name 'pak\\skeletons\\skeleton_%a.pak' a = <rocker_skeleton>
				formatText checksumName = Skeleton '%a' a = <rocker_skeleton>
				if ispakloaded <skeleton_pak_name> Heap = <asset_heap>
					PushAssetContext context = <asset_heap>
					UnLoadPak <skeleton_pak_name> Heap = <asset_heap> sameheaps
					PopAssetContext
				endif
			endif
			if NOT GotParam \{skeleton_pak_name}
				get_is_female_from_appearance appearance = ($<bandmember_appearance>)
				if (<is_female> = 1)
					formatText TextName = skeleton_pak_name 'pak\\skeletons\\drummer_skeleton%af.pak' a = <asset_slot_num>
					if ispakloaded <skeleton_pak_name> Heap = <asset_heap>
						PushAssetContext context = <asset_heap>
						UnLoadPak <skeleton_pak_name> Heap = <asset_heap> sameheaps
						PopAssetContext
					endif
					formatText TextName = skeleton_pak_name 'pak\\skeletons\\guitarist_skeleton%af.pak' a = <asset_slot_num>
					if ispakloaded <skeleton_pak_name> Heap = <asset_heap>
						PushAssetContext context = <asset_heap>
						UnLoadPak <skeleton_pak_name> Heap = <asset_heap> sameheaps
						PopAssetContext
					endif
				else
					formatText TextName = skeleton_pak_name 'pak\\skeletons\\drummer_skeleton%am.pak' a = <asset_slot_num>
					if ispakloaded <skeleton_pak_name> Heap = <asset_heap>
						PushAssetContext context = <asset_heap>
						UnLoadPak <skeleton_pak_name> Heap = <asset_heap> sameheaps
						PopAssetContext
					endif
					formatText TextName = skeleton_pak_name 'pak\\skeletons\\guitarist_skeleton%am.pak' a = <asset_slot_num>
					if ispakloaded <skeleton_pak_name> Heap = <asset_heap>
						PushAssetContext context = <asset_heap>
						UnLoadPak <skeleton_pak_name> Heap = <asset_heap> sameheaps
						PopAssetContext
					endif
				endif
			endif
		endif
		if NOT GotParam \{no_appearance_pak_unload}
			unloadappearancepaks appearance = ($<bandmember_appearance>) no_wait asset_context = <asset_heap>
		endif
		cas_queue_external_destroy_object Name = <Name>
		Change GlobalName = <bandmember_appearance> NewValue = {}
	endif
endscript

script kill_character_scripts 
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
