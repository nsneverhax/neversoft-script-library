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
	av_vocal_cycle_0
	av_vocal_cycle_1
	av_vocal_cycle_2
	av_vocal_cycle_3
	av_vocal_cycle_4
	av_vocal_cycle_5
	av_brow_scrub
	av_brow_emot
	av_brow_mod
	av_pitch_volume
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
	instrument_played = <instrument>
	if (<instrument> = vocals_and_guitar)
		instrument_played = guitar
	endif
	ExtendCrc <Name> '_Info' out = info_struct
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
	character_asset_context = <asset_heap>
	ik_params = Hero_Ik_params
	use_ingame_anims = 0
	if ($is_in_cas = 0 && $in_character_select = 0)
		use_ingame_anims = 1
	endif
	if NOT get_body_key_from_appearance key = skeleton_id appearance = (<profile_struct>.appearance)
		ScriptAssert \{'Missing skeleton in appearance'}
	endif
	get_body_key_from_appearance key = cloth appearance = (<profile_struct>.appearance)
	get_body_key_from_appearance key = cloth_coll_skeleton appearance = (<profile_struct>.appearance)
	get_body_key_from_appearance key = cloth_coll_bones appearance = (<profile_struct>.appearance)
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
	switch <instrument_played>
		case drum
		active_value_source_list = $drummer_active_values
		case vocals
		active_value_source_list = $vocalist_active_values
		default
		active_value_source_list = $default_active_values
	endswitch
	MemPushContext <asset_heap>
	createfromdesc {
		<profile_struct>
		Name = <Name>
		desc_id = compositeobject_bandmember
		Pos = <Pos>
		AssetContext = <character_asset_context>
		object_type = bandmember
		profilebudget = 800
		only_animate_on_frames = <anim_frame>
		uniqueskeletonpath = 'skeletons/EmptyDefaultCharacter.ske'
		skeletonname = <skeleton_id>
		allow_reset
		Heap = heap_skeleton
		cloth = <cloth>
		cloth_coll_skeleton = <cloth_coll_skeleton>
		cloth_coll_bones = <cloth_coll_bones>
		LightGroup = <LightGroup>
		global_storage = <asset_heap>
		active_value_set = preview
		active_value_source_list = <active_value_source_list>
		viewports = [all]
		neversuspend
	}
	MemPopContext
	<Name> :Obj_SetOrientation Quat = <Quat>
	get_body_checksum_from_appearance appearance = (<profile_struct>.appearance)
	get_is_female_from_appearance appearance = (<profile_struct>.appearance)
	get_is_fat_from_appearance appearance = (<profile_struct>.appearance)
	get_is_lefty_from_appearance appearance = (<profile_struct>.appearance)
	get_has_large_hands_from_appearance appearance = (<profile_struct>.appearance)
	<Name> :SetTags {
		asset_heap = <asset_heap>
		body_checksum = <body_checksum>
		is_female = <is_female>
		is_fat = <is_fat>
		lefty = <lefty>
		large_hands = <large_hands>
	}
	if GotParam \{anim_struct_member}
		<Name> :SetTags anim_struct = (<anim_struct_member>.anim_set)
	endif
	if (<use_ingame_anims> = 1)
		switch (<instrument_played>)
			case vocals
			if ($poselog_vocalist = true)
				desired_tree = vocalist_static_tree_poselog
			else
				desired_tree = vocalist_static_tree_standard
			endif
			case drum
			desired_tree = new_drummer_static_tree
			default
			desired_tree = guitarist_static_tree
		endswitch
		<Name> :SetTags frontend_character = 0
		if (<instrument_played> = drum)
			node_ids = $drumdroid_animnode_ids
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
	MemPushContext <asset_heap>
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
	MemPopContext <asset_heap>
	if (<instrument_played> = drum)
		if (<is_female> = 1)
			<Name> :Anim_Command target = femalediff Command = applyfemaledrummerdifference_setanim params = {anim = gh_rocker_female_drummer_d}
		endif
		if ((<skeleton_id> = gh_rocker_lars_1) || (<skeleton_id> = gh_rocker_lars_2) || (<skeleton_id> = gh_rocker_lars_3) || (<skeleton_id> = gh_rocker_lars_4))
			<Name> :Anim_Command target = femalediff Command = applyfemaledrummerdifference_setanim params = {anim = gh_rocker_lars_drummer_d}
		endif
		if ((<skeleton_id> = gh_rocker_frankenrocker_1) || (<skeleton_id> = gh_rocker_frankenrocker_2) || (<skeleton_id> = gh_rocker_frankenrocker_3) || (<skeleton_id> = gh_rocker_frankenrocker_4))
			<Name> :Anim_Command target = femalediff Command = applyfemaledrummerdifference_setanim params = {anim = gh_rocker_frankenrocker_drummer_d}
		endif
		if ((<skeleton_id> = gh_rocker_axel_1) || (<skeleton_id> = gh_rocker_axel_2) || (<skeleton_id> = gh_rocker_axel_3) || (<skeleton_id> = gh_rocker_axel_4))
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
	if StructureContains structure = (<profile_struct>.appearance) cas_full_body
		full_body_desc_id = (((<profile_struct>.appearance).cas_full_body).desc_id)
	endif
	if ($g_cas_model_build_success = 1)
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
		if ((<instrument> = bass) || (<instrument> = guitar))
			<Name> :curve_createstrings instrument = <instrument>
		endif
		create_band_member_unlock
		return \{true}
	else
		create_band_member_unlock
		return \{FALSE}
	endif
endscript

script cas_get_lightgroup \{position = !q1768515945}
	GetPakManCurrent \{map = zones}
	if (<pak> = z_viewer)
		return \{FALSE}
	else
		switch <position>
			case drummer
			LightGroup = [Band drummer combo]
			case BASSIST
			LightGroup = [Band Alt_Band BASSIST combo]
			case GUITARIST
			LightGroup = [Band Alt_Band GUITARIST combo]
			case vocalist
			LightGroup = [Band Alt_Band vocalist combo]
			default
			LightGroup = [Band Alt_Band combo]
		endswitch
		return true LightGroup = <LightGroup>
	endif
endscript

script get_body_checksum_from_appearance \{appearance = 0x69696969}
	if StructureContains structure = <appearance> cas_body
		return body_checksum = ((<appearance>.cas_body).desc_id)
	endif
	if StructureContains structure = <appearance> cas_full_body
		return body_checksum = ((<appearance>.cas_full_body).desc_id)
	endif
	printstruct <appearance>
	ScriptAssert \{'Character has no body!'}
endscript

script get_is_female_from_appearance \{appearance = 0x69696969}
	if StructureContains structure = <appearance> cas_body
		getactualcasoptionstruct part = cas_body desc_id = ((<appearance>.cas_body).desc_id)
	endif
	if StructureContains structure = <appearance> cas_full_body
		getactualcasoptionstruct part = cas_full_body desc_id = ((<appearance>.cas_full_body).desc_id)
	endif
	if (<desc_id> = avatar)
		if isavatarfemale avatar_meta_data = ((<appearance>.cas_full_body).avatar_meta_data)
			is_female = 1
		else
			is_female = 0
		endif
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
	printscriptinfo \{'destroy_band'}
	if ($in_tutorial_mode = 1)
		ScriptAssert \{'should not destroy band in tutorial mode'}
	endif
	cas_destroy_all_characters
	drummer_kill_spawnscripts
	vocalist_kill_spawnscripts
	crowd_kill_spawnscripts
	band_stop_anims
	destroy_band_member \{Name = musician1}
	destroy_band_member \{Name = musician2}
	destroy_band_member \{Name = musician3}
	destroy_band_member \{Name = musician4}
	band_unload_anim_paks
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
