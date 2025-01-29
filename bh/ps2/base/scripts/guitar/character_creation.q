
script create_band_member \{Name = GUITARIST
		LightGroup = Band
		async = 0
		Pos = (0.0, 0.0, 0.0)
		Dir = (0.0, 0.0, 1.0)}
	if ($cheat_focusmode = 1)
		highway_pak = highway_judy
		highway_texture = highway_judy
		return
	endif
	RemoveParameter \{profile_struct}
	ps2_get_musician_context_data Name = <Name>
	create_band_member_wait_for_lock
	with_mic = 0
	band_builder_get_band_global
	if has_singing_guitarist Band = <Band>
		if (<Name> = vocalist)
			with_mic = 1
			instrument = guitar
		endif
	elseif (<Name> = vocalist)
		if (<instrument> = guitar || <instrument> = bass)
			with_mic = 1
		endif
	endif

	Pos = (0.0, 0.0, 0.0)
	Dir = (0.0, 0.0, 1.0)
	if GotParam \{start_node}
		if DoesWaypointExist Name = <start_node>
			GetWaypointPos Name = <start_node>
			GetWaypointDir Name = <start_node>
		endif
	endif
	if CompositeObjectExists <Name>

	endif
	if ($ps2_gameplay_restart_song = 1)
		generatechecksumfromstruct struct = (<Profile>.appearance)
		0x56d85794 = <structure_checksum>
		generatechecksumfromstruct struct = ($<bandmember_appearance>)
		if (<0x56d85794> = <structure_checksum>)
			no_appearance_pak_load = 1
		endif
	endif
	temp_instrument = <instrument>
	if GotParam \{no_instrument_pak_load}
		temp_instrument = None
	endif
	if NOT GotParam \{no_appearance_pak_load}
		0x6aa93fce context = <asset_heap>
		Change GlobalName = <bandmember_appearance> NewValue = {}
	endif
	if NOT GotParam \{asset_heap}
		asset_heap = heap_musician_anim
	endif
	anim_asset_context = <asset_heap>
	if get_key_from_appearance key = anim_struct appearance = (<Profile>.appearance)
		if GotParam \{loading_into_song}
			get_anim_struct_member anim_struct = <anim_struct> loading_into_song = <loading_into_song> member = <instrument>
		endif
		if NOT StructureContains structure = ($<anim_struct>) anim_asset_context

		endif
		anim_asset_context = (($<anim_struct>).anim_asset_context)
	else

	endif
	cas_get_lightgroup Name = <Name>
	ik_params = Hero_Ik_params
	if GotParam \{player_status}
		Change structurename = <player_status> band_member = <Name>
		if NOT (($<player_status>.part) = vocals)
			Change structurename = <player_status> highway_texture = highway_judy
		endif
	endif
	get_is_female_from_appearance appearance = (<Profile>.appearance)
	switch (<instrument>)
		case drum
		if get_key_from_appearance key = drummer_skeleton appearance = (<Profile>.appearance)
			formatText TextName = skeleton_pak_name 'pak\\skeletons\\skeleton_%a.pak' a = <drummer_skeleton>
			formatText checksumName = Skeleton '%a' a = <drummer_skeleton>
		elseif (<is_female> = 1)
			formatText TextName = skeleton_pak_name 'pak\\skeletons\\drummer_skeleton%af.pak' a = <asset_slot_num>
			formatText checksumName = Skeleton 'drummer_skeleton%af' a = <asset_slot_num>
		else
			formatText TextName = skeleton_pak_name 'pak\\skeletons\\drummer_skeleton%am.pak' a = <asset_slot_num>
			formatText checksumName = Skeleton 'drummer_skeleton%am' a = <asset_slot_num>
		endif
		default
		if get_key_from_appearance key = rocker_skeleton appearance = (<Profile>.appearance)
			formatText TextName = skeleton_pak_name 'pak\\skeletons\\skeleton_%a.pak' a = <rocker_skeleton>
			formatText checksumName = Skeleton '%a' a = <rocker_skeleton>
		elseif (<is_female> = 1)
			formatText TextName = skeleton_pak_name 'pak\\skeletons\\guitarist_skeleton%af.pak' a = <asset_slot_num>
			formatText checksumName = Skeleton 'guitarist_skeleton%af' a = <asset_slot_num>
		else
			formatText TextName = skeleton_pak_name 'pak\\skeletons\\guitarist_skeleton%am.pak' a = <asset_slot_num>
			formatText checksumName = Skeleton 'guitarist_skeleton%am' a = <asset_slot_num>
		endif
	endswitch
	PushAssetContext context = <asset_heap>
	LoadPak <skeleton_pak_name> Heap = <asset_heap>
	PopAssetContext
	if GotParam \{loading_into_song}
		maybe_use_song_or_venue_specific_instrument {song = $current_song venue = $current_level appearance = (<Profile>.appearance) Name = (<Profile>.Name)}
	else
		appearance = (<Profile>.appearance)
	endif
	Change GlobalName = <bandmember_appearance> NewValue = <appearance>
	if NOT GotParam \{no_appearance_pak_load}
		loadappearancepaks appearance = <appearance> Heap = (<asset_heap>) instrument = <temp_instrument> asset_context = <asset_heap> async = 1
	endif
	shadow_models = []
	if NOT GotParam \{loading_into_song}
		if NOT (<instrument> = drum)
			if get_key_from_appearance key = shadow_models appearance = (<Profile>.appearance)
				formatText checksumName = Shadow '%a' a = (<shadow_models> [0])
				PushAssetContext context = <asset_heap>
				begin
				if isassetloaded Name = <Shadow>
					break
				endif
				if ($ps2_cas_load_canceled = 1)
					break
				endif
				Wait \{1
					gameframe}
				repeat
				PopAssetContext
			endif
		endif
	endif
	0xd1e7ae62 = no_shadow
	0xa0f5eb04 = 0xff2a743e
	if NOT GotParam \{loading_into_song}
		switch (<instrument>)
			case guitar
			case bass
			0xd1e7ae62 = 'car_guitar_shadow01'
			0xa0f5eb04 = 'pak/models/shadows/car_guitar_shadow01.pak'
			case vocals
			0xd1e7ae62 = 'car_mic_shadow01'
			0xa0f5eb04 = 'pak/models/shadows/car_mic_shadow01.pak'
			case drum
			default
			0xd1e7ae62 = no_shadow
			0xa0f5eb04 = 0xff2a743e
		endswitch
	endif
	if NOT (<0xd1e7ae62> = no_shadow)
		PushAssetContext context = <asset_heap>
		LoadPak (<0xa0f5eb04>) Heap = <asset_heap>
		formatText checksumName = Shadow '%a' a = (<0xd1e7ae62>)
		begin
		if isassetloaded Name = <Shadow>
			break
		endif
		if ($ps2_cas_load_canceled = 1)
			break
		endif
		Wait \{1
			gameframe}
		repeat
		PopAssetContext
		AddArrayElement array = <shadow_models> element = (<0xd1e7ae62>)
		shadow_models = <array>
	endif
	if ($ps2_cas_load_canceled = 1)
		Change \{ps2_cas_load_canceled = 0}
		0x239b2ee5 appearance = (<Profile>.appearance)
		create_band_member_unlock
		return \{FALSE}
	endif
	PushAssetContext context = <asset_heap>
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
				component = Shadow
				ShadowType = Volume
				ShadowVolumeModels = <shadow_models>
				AssetContext = <asset_heap>
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
			<Profile>
			Pos = <Pos>
			AssetContext = <asset_heap>
			object_type = bandmember
			profilebudget = 800
			Name = <Name>
		}
	}
	PopAssetContext
	<Name> :Obj_SetOrientation Dir = <Dir>
	get_body_checksum_from_appearance appearance = (<Profile>.appearance)
	get_is_female_from_appearance appearance = (<Profile>.appearance)
	get_is_lefty_from_appearance appearance = (<Profile>.appearance)
	get_has_large_hands_from_appearance appearance = (<Profile>.appearance)
	if NOT (GotParam is_female)
		is_female = 0
	endif
	<Name> :SetTags {
		asset_heap = <asset_heap>
		body_checksum = <body_checksum>
		is_female = <is_female>
		lefty = <lefty>
		large_hands = <large_hands>
	}
	if GotParam \{anim_struct_member}
		<Name> :SetTags anim_struct = (<anim_struct_member>.anim_set)
	endif
	generatechecksumfromstruct struct = (<Profile>.appearance)
	<Name> :SetTags appearance_checksum = <structure_checksum>
	<Name> :SetTags geom_heap = <asset_heap>
	<Name> :SetTags current_instrument = <temp_instrument>
	switch (<instrument>)
		case vocals
		desired_tree = vocalist_static_tree
		case drum
		desired_tree = drummer_static_tree
		default
		desired_tree = guitarist_static_tree
	endswitch
	if (<lefty>)
		desired_tree = 0xb67a972f
		ik_params = 0xf56342fc
	endif
	if (<instrument> = drum)
		node_ids = $drumdroid_animnode_ids
	else
		node_ids = $nondrummer_anim_node_ids
	endif
	elbow_bone_chord = Bone_Forearm_L
	elbow_bone_strum = Bone_Forearm_R
	negate_rolls = 1
	if (<lefty> = 1)
		elbow_bone_chord = Bone_Forearm_R
		elbow_bone_strum = Bone_Forearm_L
		negate_rolls = 0
	endif
	if NOT GotParam \{loading_into_song}
		node_ids = $nondrummer_anim_node_ids
		desired_tree = frontend_static_tree
	endif
	0xf6e941dd = gh_rocker_male_empty_d
	if (<body_checksum> = 0xa2de9ea8)
		0xf6e941dd = 0x64ec3628
	endif
	<Name> :Anim_InitTree {
		Tree = $<desired_tree>
		NodeIdDeclaration = <node_ids>
		params = {
			0xd432622d = <0xf6e941dd>
			ik_params = <ik_params>
			elbow_bone_chord = <elbow_bone_chord>
			elbow_bone_strum = <elbow_bone_strum>
			negate_rolls = <negate_rolls>
		}
	}
	if (<instrument> = drum)
		if (<is_female> = 1)
			<Name> :Anim_Command target = femalediff Command = applyfemaledrummerdifference_setanim params = {anim = gh_rocker_female_drummer_d}
			<Name> :Anim_Command target = 0xd7adf5e7 Command = applyfemaledrummerdifference_setanim params = {anim = gh_rocker_female_drummer_d}
		endif
		if ((<Skeleton> = gh_drummer_lars_1))
			<Name> :Anim_Command target = femalediff Command = applyfemaledrummerdifference_setanim params = {anim = gh_rocker_lars_drummer_d}
		endif
		if ((<Skeleton> = gh_drummer_axel_1) || (<Skeleton> = 0xd0ef43ee))
			<Name> :Anim_Command target = femalediff Command = applyfemaledrummerdifference_setanim params = {anim = gh_rocker_axel_drummer_d}
		endif
	endif
	<Name> :cas_reset_bones
	ExtendCrc <Name> '_Info' out = info_struct
	Change structurename = <info_struct> part = <instrument>
	Change structurename = <info_struct> playing = true
	if (<with_mic> = 1)
		loadpartpak appearance = (<Profile>.appearance) part = cas_mic_stand Heap = (<asset_heap>) instrument = vocals asset_context = <asset_heap> async = 0
		loadpartpak appearance = (<Profile>.appearance) part = cas_mic Heap = (<asset_heap>) instrument = vocals asset_context = <asset_heap> async = 0
	endif
	if NOT <Name> :build_band_member_from_appearance {
			Name = (<Profile>.Name)
			appearance = (<Profile>.appearance)
			LightGroup = <LightGroup>
			async = <async>
			instrument = <instrument>
			loading_into_song = <loading_into_song>
			with_mic = <with_mic>
			geom_heap = <asset_heap>
			AssetContext = <asset_heap>
		}
		cancelled = 1
	endif
	if get_key_from_appearance key = 0xb6d2786b appearance = (<Profile>.appearance)
		if get_key_from_appearance key = 0x26dbd790 appearance = (<Profile>.appearance)
			<Name> :Obj_SpawnScriptNow 0x24cfe7d0 params = {0x26dbd790 = <0x26dbd790> 0xb6d2786b = <0xb6d2786b>}
		endif
	endif
	if (<body_checksum> = 0xa2de9ea8 && <instrument> != drum)
		<Name> :Obj_SpawnScriptNow 0x64ec3628
	endif

	if (<instrument> = drum)
		<Name> :cas_drum_stick_bake_transforms part = cas_drums_sticks_l skeletonname = <Skeleton> material_index = 0
		<Name> :cas_drum_stick_bake_transforms part = cas_drums_sticks_r skeletonname = <Skeleton> material_index = 1
	endif
	create_band_member_unlock
	if NOT GotParam \{loading_into_song}
		if NOT (<instrument> = drum)
			if ((<Skeleton> = gh_rocker_axel_1) || (<Skeleton> = 0xde4de899))
				<Name> :cas_apply_bone_transforms bone_info = {bone = Bone_IK_Hand_Slave_L translation = {value = (0.0, 0.038, 0.0)}}
			endif
		endif
	endif
	if GotParam \{cancelled}
		return \{FALSE}
	endif
	return \{true}
endscript

script cas_get_lightgroup 

	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_viewer
		LightGroup = None
		default
		switch <Name>
			case drummer
			case drummer2
			LightGroup = [Band drummer]
			case BASSIST
			LightGroup = [Band Alt_Band BASSIST]
			case GUITARIST
			case guitarist2
			LightGroup = [Band Alt_Band GUITARIST]
			case vocalist
			case vocalist2
			LightGroup = [Band Alt_Band vocalist]
			default
			LightGroup = [Band Alt_Band]
		endswitch
	endswitch
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


endscript

script get_is_female_from_appearance 
	if StructureContains structure = <appearance> cas_body
		getactualcasoptionstruct part = cas_body desc_id = ((<appearance>.cas_body).desc_id)
	endif
	if StructureContains structure = <appearance> cas_full_body
		0x5a95f6d5 = 0
		if NOT load_part_desc_pak \{part_type = cas_full_body}
			0x5a95f6d5 = 1
		endif
		getactualcasoptionstruct part = cas_full_body desc_id = ((<appearance>.cas_full_body).desc_id)
		if (<0x5a95f6d5> = 1)
			unload_part_desc_pak \{part_type = cas_full_body}
		endif
	endif
	if NOT GotParam \{is_female}

		<is_female> = 0
	endif
	return is_female = <is_female>
endscript

script get_is_lefty_from_appearance 
	if StructureContains structure = <appearance> cas_body
		getactualcasoptionstruct part = cas_body desc_id = ((<appearance>.cas_body).desc_id)
	endif
	if StructureContains structure = <appearance> cas_full_body
		getactualcasoptionstruct part = cas_full_body desc_id = ((<appearance>.cas_full_body).desc_id)
	endif
	if NOT GotParam \{lefty}
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
0x21556355 = 0

script build_band_member_from_appearance \{instrument = guitar
		with_mic = 0}
	if GotParam \{loading_into_song}
		maybe_use_song_or_venue_specific_instrument {song = $current_song venue = $current_level appearance = <appearance> Name = <Name>}
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
	Change \{0x21556355 = 0}
	if ($cheat_airinstruments = 1)
		if GotParam \{loading_into_song}
			Change \{0x21556355 = 1}
		endif
	endif
	get_hat_hair_choice appearance = <appearance>
	buildscriptparams = {
		LightGroup = <LightGroup>
		temporary_heap = heap_cas
		instrument = <instrument>
		hat_hair_choice = <hat_hair_choice>
	}
	modelbuilder_preload {
		<...>
		geom_heap = <geom_heap>
		AssetContext = <AssetContext>
		appearance = <appearance>
		buildscriptparams = <buildscriptparams>
	}
	if NOT GotParam \{cancelled}
		Obj_GetID
		if (<with_mic> = 1 && <objID> != vocalist)
			if NOT (<instrument> = vocals)
				hide_mic
			endif
		endif
		return \{true}
	endif
	return \{FALSE}
endscript
create_band_member_lock_queue = 0
create_band_member_lock = 0
guitarist_appearance = {
}
bassist_appearance = {
}
vocalist_appearance = {
}
drummer_appearance = {
}

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
endscript

script destroy_band 
	if ($in_tutorial_mode = 1)

	endif
	cas_destroy_all_characters
	drummer_kill_spawnscripts
	band_stop_anims
	destroy_band_member \{Name = GUITARIST}
	destroy_band_member \{Name = guitarist2}
	destroy_band_member \{Name = BASSIST}
	destroy_band_member \{Name = bassist2}
	destroy_band_member \{Name = drummer}
	destroy_band_member \{Name = drummer2}
	destroy_band_member \{Name = vocalist}
	destroy_band_member \{Name = vocalist2}
	band_unload_anim_paks
endscript

script destroy_band_member 
	ps2_get_musician_context_data Name = <Name>
	if CompositeObjectExists Name = <Name>
		<Name> :GetTags current_instrument
		<Name> :obj_resetbones
		bandmanager_removecharacter Name = <Name>
		<Name> :Die
		flushdeadobjects
		smartunloadpak async = 0 tags = {highway_for = <Name>}
		flushdeadobjects
		0x239b2ee5 appearance = ($<bandmember_appearance>) asset_slot_num = <asset_slot_num> asset_heap = <asset_heap>
		if ($ps2_gameplay_restart_song = 1)
			no_appearance_pak_unload = 1
		endif
		if NOT GotParam \{no_appearance_pak_unload}
			unloadappearancepaks appearance = ($<bandmember_appearance>) instrument = <current_instrument> no_wait asset_context = <asset_heap>
			Change GlobalName = <bandmember_appearance> NewValue = {}
		endif
	endif
endscript

script 0x239b2ee5 appearance = ($cas_current_appearance) asset_slot_num = 0 asset_heap = heap_musician1
	0xec020f56 = 0
	if get_key_from_appearance key = drummer_skeleton appearance = <appearance>
		formatText TextName = skeleton_pak_name 'pak\\skeletons\\skeleton_%a.pak' a = <drummer_skeleton>
		PushAssetContext context = <asset_heap>
		UnLoadPak <skeleton_pak_name> Heap = <asset_heap> sameheaps
		PopAssetContext
		0xec020f56 = (<0xec020f56> + 1)
	endif
	if get_key_from_appearance key = rocker_skeleton appearance = <appearance>
		formatText TextName = skeleton_pak_name 'pak\\skeletons\\skeleton_%a.pak' a = <rocker_skeleton>
		PushAssetContext context = <asset_heap>
		UnLoadPak <skeleton_pak_name> Heap = <asset_heap> sameheaps
		PopAssetContext
		0xec020f56 = (<0xec020f56> + 1)
	endif
	if (<0xec020f56> < 2)
		get_is_female_from_appearance appearance = <appearance>
		if (<is_female> = 1)
			formatText TextName = skeleton_pak_name 'pak\\skeletons\\drummer_skeleton%af.pak' a = <asset_slot_num>
			if ispakloaded <skeleton_pak_name> Heap = <asset_heap>
				PushAssetContext context = <asset_heap>
				UnLoadPak <skeleton_pak_name> Heap = <asset_heap> sameheaps
				PopAssetContext
			else
				formatText TextName = skeleton_pak_name 'pak\\skeletons\\guitarist_skeleton%af.pak' a = <asset_slot_num>
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
			else
				formatText TextName = skeleton_pak_name 'pak\\skeletons\\guitarist_skeleton%am.pak' a = <asset_slot_num>
				PushAssetContext context = <asset_heap>
				UnLoadPak <skeleton_pak_name> Heap = <asset_heap> sameheaps
				PopAssetContext
			endif
		endif
	endif
endscript

script kill_character_scripts 

	if CompositeObjectExists \{Name = GUITARIST}
		GUITARIST :Obj_SwitchScript \{EmptyScript}
	endif
	if CompositeObjectExists \{Name = BASSIST}
		BASSIST :Obj_SwitchScript \{EmptyScript}
	endif
	if CompositeObjectExists \{Name = vocalist}
		vocalist :Obj_SwitchScript \{EmptyScript}
	endif
	if CompositeObjectExists \{Name = drummer}
		drummer :Obj_SwitchScript \{EmptyScript}
	endif
endscript

script preload_band_member \{Name = GUITARIST
		async = 0}
	create_band_member_wait_for_lock
	filename_crc = None
	instrument_crc = None
	create_band_member_unlock
	return filename_crc = <filename_crc> instrument_crc = <instrument_crc> true
endscript

script preload_band_member_finish \{Name = GUITARIST
		async = 0}
	create_band_member_wait_for_lock
	create_band_member_unlock
endscript

script 0x24cfe7d0 
	0xdf84e324 = (<0x26dbd790>.material)
	0x18e25931 = (<0x26dbd790>.pass)
	GetArraySize <0xb6d2786b>
	i = 0
	begin
	next_struct = (<0xb6d2786b> [<i>])
	0x57eb306e material = <0xdf84e324> pass = <0x18e25931> u = (<next_struct>.u) v = (<next_struct>.v)
	Wait (<next_struct>.Seconds) Seconds
	i = (<i> + 1)
	if (<i> = <array_Size>)
		i = 0
	endif
	repeat
endscript
