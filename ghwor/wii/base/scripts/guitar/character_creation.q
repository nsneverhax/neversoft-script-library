drummer_active_values = [
	av_drum_anim_hand_l
	av_drum_anim_hand_r
	av_drum_anim_foot_r
	av_drum_anim_transit
	av_drum_blend_hand_l
	av_drum_blend_hand_r
	av_drum_blend_foot_r
	av_drum_blend_hh_kit
	av_drum_mod_loop_body
	av_drum_mod_hand_r
	av_drum_mod_hand_l
	av_drum_mod_foot_r
	av_drum_ik_hand_l
	av_drum_ik_hand_r
	av_drum_ik_feet
	av_eyerot_1
	av_eyerot_2
	av_eyemag_1
	av_eyemag_2
	av_headrot_1
	av_headrot_2
	av_headmag_1
	av_headmag_2
	av_drum_face_rock
]
default_active_values = [
	av_eyerot_1
	av_eyerot_2
	av_eyemag_1
	av_eyemag_2
	av_headrot_1
	av_headrot_2
	av_headmag_1
	av_headmag_2
]
vocalist_active_values = [
	av_eyerot_1
	av_eyerot_2
	av_eyemag_1
	av_eyemag_2
	av_headrot_1
	av_headrot_2
	av_headmag_1
	av_headmag_2
]

script create_band_member \{async = !i1768515945
		Pos = (0.0, 0.0, 0.0)
		Dir = (0.0, 0.0, 1.0)
		Player = !i1768515945
		Name = !q1768515945
		instrument = !q1768515945
		savegame = !i1768515945
		with_mic = !i1768515945
		id = !q1768515945}
	if CompositeObjectExists <Name>
		ScriptAssert '%s already exists' s = <Name>
	endif
	Change \{cas_build_model_request = 0}
	instrument_played = <instrument>
	if (<instrument> = vocals_and_guitar)
		instrument_played = guitar
	endif
	ExtendCrc <Name> '_Info' out = info_struct
	ps2_get_musician_context_data Name = <Name>
	if NOT GotParam \{profile_struct}
		if NOT characterprofilegetstruct Name = <id> savegame = <savegame>
			ScriptAssert 'Failed getting character: %a %b' a = <id> b = <savegame>
		endif
	endif
	if NOT GotParam \{appearance_checksum}
		get_appearance_checksum {appearance = (<profile_struct>.appearance) instrument = <instrument_played> mic = <with_mic>}
		appearance_checksum = <new_appearance_checksum>
	endif
	create_band_member_lock
	get_start_node_id member = <Name>
	if NOT GotParam \{no_appearance_pak_load}
		Change GlobalName = <bandmember_appearance> NewValue = {}
	endif
	if GotParam \{waypoint_id}
		if DoesWaypointExist Name = <waypoint_id>
			GetWaypointPos Name = <waypoint_id>
			getwaypointquat Name = <waypoint_id>
			Change structurename = <info_struct> target_node = <waypoint_id>
		else
			printf qs(0xa84ca33d) a = <Name>
		endif
	endif
	printf qs(0xe349ad7b) a = <Name> i = <instrument_played>
	cas_instrument = <instrument>
	if (<with_mic> = 1)
		if (<cas_instrument> = guitar)
			<cas_instrument> = guitar_and_vocals
		elseif (<cas_instrument> = bass)
			<cas_instrument> = bass_and_vocals
		endif
	endif
	if NOT GotParam \{asset_heap}
		get_best_heap_for_appearance appearance = (<profile_struct>.appearance) instrument = <cas_instrument>
		asset_heap = <best_heap>
	endif
	anim_asset_context = <asset_heap>
	if get_body_key_from_appearance key = anim_struct appearance = (<profile_struct>.appearance)
		if GotParam \{loading_into_song}
			get_anim_struct_member anim_struct = <anim_struct> loading_into_song = <loading_into_song> member = <instrument_played>
		endif
		if NOT StructureContains structure = ($<anim_struct>) anim_asset_context
			ScriptAssert \{'anim_asset_context missing!'}
		endif
		anim_asset_context = (($<anim_struct>).anim_asset_context)
	else
		ScriptAssert \{'anim_struct not found in appearance'}
	endif
	use_ingame_anims = 0
	if ($is_in_cas = 0 && $in_character_select = 0)
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
	if NOT get_body_key_from_appearance key = skeleton_id appearance = (<profile_struct>.appearance)
		ScriptAssert \{'Missing skeleton_id in appearance'}
	endif
	if get_body_key_from_appearance key = ik_params_set appearance = (<profile_struct>.appearance)
		if (<use_ingame_anims> = 1)
			switch (<instrument_played>)
				case vocals
				ik_params = (<ik_params_set>.vocals)
				case drum
				ik_params = (<ik_params_set>.drum)
				default
				ik_params = (<ik_params_set>.guitar)
			endswitch
		else
			ik_params = (<ik_params_set>.FrontEnd)
		endif
	endif
	if NOT ischecksum \{ik_params}
		ScriptAssert \{'Problem with ik_params'}
	endif
	get_is_female_from_appearance appearance = (<profile_struct>.appearance)
	if get_body_key_from_appearance key = anim_struct appearance = (<profile_struct>.appearance)
		if (<anim_struct> = pick_correct_avatar_anim_struct)
			if (<is_female> = 1)
				<anim_struct> = car_female_anim_struct
			else
				<anim_struct> = car_male_anim_struct
			endif
		endif
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
	switch <instrument_played>
		case drum
		active_value_source_list = $drummer_active_values
		case vocals
		active_value_source_list = $vocalist_active_values
		default
		active_value_source_list = $default_active_values
	endswitch
	if NOT GotParam \{create_mii}
		get_is_female_from_appearance appearance = (<profile_struct>.appearance)
		switch (<instrument_played>)
			case drum
			if get_body_key_from_appearance key = body_skeleton2 appearance = (<profile_struct>.appearance)
				formatText TextName = skeleton_pak_name 'pak\\skeletons\\skeleton_%a.pak' a = <body_skeleton2>
				formatText checksumName = Skeleton '%a' a = <body_skeleton2>
			endif
			default
			if get_body_key_from_appearance key = body_skeleton appearance = (<profile_struct>.appearance)
				formatText TextName = skeleton_pak_name 'pak\\skeletons\\skeleton_%a.pak' a = <body_skeleton>
				formatText checksumName = Skeleton '%a' a = <body_skeleton>
			endif
		endswitch
		if NOT GotParam \{skeleton_pak_name}
			switch (<instrument_played>)
				case drum
				if (<is_female> = 1)
					formatchecksum skeleton_pak_name 'pak\\skeletons\\drummer_skeleton%af.pak' a = <asset_slot_num>
					formatchecksum Skeleton 'drummer_skeleton%af' a = <asset_slot_num>
				else
					formatchecksum skeleton_pak_name 'pak\\skeletons\\drummer_skeleton%am.pak' a = <asset_slot_num>
					formatchecksum Skeleton 'drummer_skeleton%am' a = <asset_slot_num>
				endif
				default
				if (<is_female> = 1)
					formatchecksum skeleton_pak_name 'pak\\skeletons\\guitarist_skeleton%af.pak' a = <asset_slot_num>
					formatchecksum Skeleton 'guitarist_skeleton%af' a = <asset_slot_num>
				else
					formatchecksum skeleton_pak_name 'pak\\skeletons\\guitarist_skeleton%am.pak' a = <asset_slot_num>
					formatchecksum Skeleton 'guitarist_skeleton%am' a = <asset_slot_num>
				endif
			endswitch
		endif
		PushAssetContext context = <asset_heap>
		LoadPak <skeleton_pak_name> Heap = <asset_heap>
		PopAssetContext
		Wait \{1
			gameframe}
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
			endif
		endif
	endif
	shadow_models = []
	get_body_key_from_appearance key = shadow_models appearance = (<profile_struct>.appearance)
	cas_get_lightgroup Name = <Name>
	if GotParam \{create_mii}
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
					component = lookatanim
				}
				{
					component = AnimTree
					skeletonname = <Skeleton>
					only_animate_on_frames = <anim_frame>
				}
				{
					component = LockObj
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
					global_storage = <asset_heap>
				}
				{
					component = AnimPreview
					active_value_source_list = <active_value_source_list>
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
	<Name> :Obj_SetOrientation Quat = <Quat>
	if (<Name> = $anim_debug_target)
		set_new_anim_debug_target target = <Name>
	endif
	get_body_checksum_from_appearance appearance = (<profile_struct>.appearance)
	is_special_unlockable_rocker_that_uses_net_silhouette_body = FALSE
	if NOT GotParam \{create_mii}
		get_is_female_from_appearance appearance = (<profile_struct>.appearance)
		get_is_fat_from_appearance appearance = (<profile_struct>.appearance)
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
	<Name> :SetTags {
		asset_heap = <asset_heap>
		body_checksum = <body_checksum>
		is_female = <is_female>
		is_fat = <is_fat>
		lefty = <lefty>
		large_hands = <large_hands>
		appearance_checksum = <appearance_checksum>
		is_special_unlockable_rocker_that_uses_net_silhouette_body = <is_special_unlockable_rocker_that_uses_net_silhouette_body>
		geom_heap = <asset_heap>
		current_instrument = <temp_instrument>
	}
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
		elseif (<instrument_played> = vocals)
			node_ids = $vocalist_anim_node_ids
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
	printf \{'Backing up bones'}
	<Name> :obj_resetbones
	printf \{'Done backing up bones'}
	ExtendCrc <Name> '_Info' out = info_struct
	Change structurename = <info_struct> part = <instrument_played>
	Change structurename = <info_struct> playing = true
	<Name> :SetTags instrument = <instrument_played> LightGroup = <LightGroup>
	if (<use_ingame_anims> = 0)
		band_member_start_anims {
			Name = <Name>
			instrument = None
		}
	endif
	<Name> :Obj_SpawnScriptNow buildcasmodel params = {
		appearance = (<profile_struct>.appearance)
		async = <async>
		appearance_checksum = <appearance_checksum>
		buildscriptparams = {
			instrument = <cas_instrument>
			new_object = 1
			no_bone_copy = 1
			loading_into_song = <loading_into_song>
		}
	}
	if (<async> = 1)
		blockforscript \{buildcasmodel}
	endif
	if StructureContains structure = (<profile_struct>.appearance) model_scale
		<Name> :Obj_EnableScaling
		<Name> :Obj_ApplyScaling Scale = (<profile_struct>.appearance.model_scale)
	endif
	if StructureContains structure = (<profile_struct>.appearance) cas_full_body
		full_body_desc_id = (((<profile_struct>.appearance).cas_full_body).desc_id)
	endif
	if ($g_cas_model_build_success = 1)
		create_band_member_unlock
		if (<use_ingame_anims> = 0)
			<instrument_played> = None
		endif
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
		create_band_member_unlock
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

script get_body_checksum_from_appearance \{appearance = 0x69696969}
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

script get_is_female_from_appearance \{appearance = 0x69696969}
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

script get_is_fat_from_appearance \{appearance = 0x69696969}
	<is_fat> = 0
	if StructureContains structure = <appearance> cas_body
		getactualcasoptionstruct part = cas_body desc_id = ((<appearance>.cas_body).desc_id)
	endif
	if StructureContains structure = <appearance> cas_full_body
		getactualcasoptionstruct part = cas_full_body desc_id = ((<appearance>.cas_full_body).desc_id)
	endif
	return is_fat = <is_fat>
endscript

script get_is_female_from_character_id \{character_id = !q1768515945
		savegame = !i1768515945}
	if (<character_id> = None || <savegame> < 0)
		return \{FALSE}
	endif
	characterprofilegetstruct Name = <character_id> savegame = <savegame>
	if NOT GotParam \{profile_struct}
		return \{FALSE}
	endif
	get_is_female_from_appearance appearance = (<profile_struct>.appearance)
	return true {is_female = <is_female>}
endscript

script get_is_lefty_from_appearance \{appearance = 0x69696969}
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

script get_has_large_hands_from_appearance \{appearance = 0x69696969}
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
g_create_band_member_lock = 0
create_band_member_success = 0

script create_band_member_unlock 
	if ($g_create_band_member_lock = 0)
		ScriptAssert \{'Band member lock already off... Something wrong here'}
	endif
	Change \{g_create_band_member_lock = 0}
endscript

script create_band_member_lock 
	if ($g_create_band_member_lock = 1)
		ScriptAssert \{'Band member lock left on... Something wrong here'}
	endif
	Change \{g_create_band_member_lock = 1}
endscript

script destroy_band 
	if ($in_tutorial_mode = 1)
		ScriptAssert \{'should not destroy band in tutorial mode'}
	endif
	cas_destroy_all_characters
	drummer_kill_spawnscripts
	autolook_kill_spawnscripts
	crowd_kill_spawnscripts
	band_stop_anims
	destroy_band_member \{Name = musician1}
	destroy_band_member \{Name = musician2}
	destroy_band_member \{Name = musician3}
	destroy_band_member \{Name = musician4}
	band_unload_anim_paks
endscript

script destroy_band_member 
	ps2_get_musician_context_data Name = <Name>
	if CompositeObjectExists Name = <Name>
		band_builder_remove_setup_entry Name = <Name>
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
		if get_body_key_from_appearance key = body_skeleton2 appearance = ($<bandmember_appearance>)
			formatText TextName = skeleton_pak_name 'pak\\skeletons\\skeleton_%a.pak' a = <body_skeleton2>
			formatText checksumName = Skeleton '%a' a = <body_skeleton2>
			if ispakloaded <skeleton_pak_name> Heap = <asset_heap>
				printf \{qs(0x7a5edbc4)}
				PushAssetContext context = <asset_heap>
				UnLoadPak <skeleton_pak_name> Heap = <asset_heap> sameheaps
				WaitUnloadPak <skeleton_pak_name>
				PopAssetContext
			endif
		endif
		if get_body_key_from_appearance key = body_skeleton appearance = ($<bandmember_appearance>)
			formatText TextName = skeleton_pak_name 'pak\\skeletons\\skeleton_%a.pak' a = <body_skeleton>
			formatText checksumName = Skeleton '%a' a = <body_skeleton>
			if ispakloaded <skeleton_pak_name> Heap = <asset_heap>
				printf qs(0xaa4ae605) t = <skeleton_pak_name>
				PushAssetContext context = <asset_heap>
				UnLoadPak <skeleton_pak_name> Heap = <asset_heap> sameheaps
				WaitUnloadPak <skeleton_pak_name>
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
		cas_queue_external_destroy_object Name = <Name>
		Change GlobalName = <bandmember_appearance> NewValue = {}
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

script reset_facial_animations 
	if CompositeObjectExists \{Name = musician1}
		musician1 :Obj_KillSpawnedScript \{Name = facial_anim_loop}
		musician1 :Obj_SpawnScriptNow \{facial_anim_loop}
	endif
	if CompositeObjectExists \{Name = musician2}
		musician2 :Obj_KillSpawnedScript \{Name = facial_anim_loop}
		musician2 :Obj_SpawnScriptNow \{facial_anim_loop}
	endif
	if CompositeObjectExists \{Name = musician3}
		musician3 :Obj_KillSpawnedScript \{Name = facial_anim_loop}
		musician3 :Obj_SpawnScriptNow \{facial_anim_loop}
	endif
	if CompositeObjectExists \{Name = musician4}
		musician4 :Obj_KillSpawnedScript \{Name = facial_anim_loop}
		musician4 :Obj_SpawnScriptNow \{facial_anim_loop}
	endif
endscript
