cache_build_band_members = 0
nondrummer_anim_node_ids = [
	Body
	BodyTimer
	moment_blend
	moment_branch
	momenttimer
	StrumTimer
	FretTimer
	FingerTimer
	FacialTimer
	Ik
	LeftHandPartial
	LeftArm
	LeftHand
	RightArm
	Face
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
	Body
	BodyTimer
	FacialTimer
	Ik
	LeftHandPartial
	LeftArm
	LeftHand
	RightArm
	Face
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

script create_band_member \{Name = GUITARIST
		LightGroup = Band
		async = 0
		Pos = (0.0, 0.0, 0.0)
		Dir = (0.0, 0.0, 1.0)}
	RemoveParameter \{profile_struct}
	create_band_member_wait_for_lock
	printf qs(0xc143fb65) a = <Name>
	if GotParam \{start_node}
		if DoesWaypointExist Name = <start_node>
			GetWaypointPos Name = <start_node>
			GetWaypointDir Name = <start_node>
		endif
	endif
	if CompositeObjectExists <Name>
		ScriptAssert '%s already exists' s = <Name>
	endif
	if (<Name> = GUITARIST)
		if CompositeObjectExists \{Name = BASSIST}
			BASSIST :hero_pause_anim
		endif
	elseif (<Name> = BASSIST)
		if CompositeObjectExists \{Name = GUITARIST}
			GUITARIST :hero_pause_anim
		endif
	endif
	if NOT GotParam \{asset_heap}
		get_best_heap_for_appearance appearance = (<Profile>.appearance)
		asset_heap = <best_heap>
	endif
	anim_asset_context = <asset_heap>
	if get_body_key_from_appearance key = anim_struct appearance = (<Profile>.appearance)
		if GotParam \{loading_into_song}
			get_anim_struct_member anim_struct = <anim_struct> loading_into_song = <loading_into_song> member = <instrument>
		else
		endif
		if NOT StructureContains structure = ($<anim_struct>) anim_asset_context
			ScriptAssert \{'anim_asset_context missing!'}
		endif
		anim_asset_context = (($<anim_struct>).anim_asset_context)
	else
		ScriptAssert \{'anim_struct not found in appearance'}
	endif
	RemoveParameter \{highway_texture}
	if GotParam \{loading_into_song}
		if GotParam \{player_status}
			if NOT (($<player_status>.part) = vocals)
				if NOT get_highway_struct_from_appearance part = ($<player_status>.part) appearance = (<Profile>.appearance)
					ScriptAssert \{'Problem grabbing highway struct'}
				endif
				if (($is_attract_mode = 1) || ((<Profile>.Name) = emptyguy))
					highway_pak = highway_axel
					highway_texture = `tex\models\highway\highway_axel_fm_01.dds`
				endif
				if ($cheat_blackhighway = 1)
					highway_pak = highway_black
					highway_texture = `tex\models\highway\highway_black.dds`
				endif
				mpm_object_load_pak pak = <highway_pak> owner = <Name> async = <async>
			endif
		else
			if ((<Profile>.Name) = jimi)
				if (<Name> = vocalist)
					if NOT get_highway_struct_from_appearance part = <instrument> appearance = (<Profile>.appearance)
						ScriptAssert \{'Problem grabbing highway struct'}
					endif
					mpm_object_unload_paks owner = GUITARIST async = <async>
					mpm_object_load_pak pak = <highway_pak> owner = <Name> async = <async>
					get_band_member_player_status \{part = guitar}
					if GotParam \{band_member_player_status}
						Change structurename = <band_member_player_status> highway_texture = <highway_texture>
						Change structurename = <band_member_player_status> band_member = vocalist
					endif
					RemoveParameter \{highway_texture}
				endif
			endif
			if ((<Profile>.Name) = travis)
				if (<Name> = drummer)
					if NOT get_highway_struct_from_appearance part = <instrument> appearance = (<Profile>.appearance)
						ScriptAssert \{'Problem grabbing highway struct'}
					endif
					mpm_object_unload_paks owner = drummer async = <async>
					mpm_object_load_pak pak = <highway_pak> owner = <Name> async = <async>
					get_band_member_player_status \{part = drum}
					if GotParam \{band_member_player_status}
						Change structurename = <band_member_player_status> highway_texture = <highway_texture>
						Change structurename = <band_member_player_status> band_member = drummer
					endif
					RemoveParameter \{highway_texture}
				endif
			endif
		endif
	endif
	if (<Name> = GUITARIST)
		if CompositeObjectExists \{Name = BASSIST}
			BASSIST :hero_unpause_anim
		endif
	elseif (<Name> = BASSIST)
		if CompositeObjectExists \{Name = GUITARIST}
			GUITARIST :hero_unpause_anim
		endif
	endif
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
	ik_params = Hero_Ik_params
	if NOT get_body_key_from_appearance key = Skeleton appearance = (<Profile>.appearance)
		ScriptAssert \{'Missing skeleton in appearance'}
	endif
	if NOT get_body_key_from_appearance key = skeleton_path appearance = (<Profile>.appearance)
		ScriptAssert \{'Missing skeleton_path in appearance'}
	endif
	if NOT get_body_key_from_appearance key = ragdoll appearance = (<Profile>.appearance)
		ScriptAssert \{'Missing ragdoll in appearance'}
	endif
	if NOT get_body_key_from_appearance key = ragdoll_path appearance = (<Profile>.appearance)
		ScriptAssert \{'Missing ragdoll_path in appearance'}
	endif
	if NOT get_body_key_from_appearance key = ragdoll_collision_group appearance = (<Profile>.appearance)
		ScriptAssert \{'Missing ragdoll_collision_group in appearance'}
	endif
	if NOT get_body_key_from_appearance key = accessory_bones appearance = (<Profile>.appearance)
		ScriptAssert \{'Missing accessory_bones in appearance'}
	endif
	get_body_key_from_appearance key = ik_params appearance = (<Profile>.appearance)
	if GotParam \{loading_into_song}
		switch (<instrument>)
			case vocals
			if get_body_key_from_appearance key = ik_params_vocals appearance = (<Profile>.appearance)
				ik_params = <ik_params_vocals>
				printf 'Using ik_params_vocals - %s' s = <ik_params> donotresolve
			endif
			case drum
			if get_body_key_from_appearance key = ik_params_drum appearance = (<Profile>.appearance)
				ik_params = <ik_params_drum>
				printf 'Using ik_params_drum - %s' s = <ik_params> donotresolve
			endif
			default
			if get_body_key_from_appearance key = ik_params_guitar appearance = (<Profile>.appearance)
				ik_params = <ik_params_guitar>
				printf 'Using ik_params_guitar - %s' s = <ik_params> donotresolve
			endif
		endswitch
	else
		if get_body_key_from_appearance key = ik_params_frontend appearance = (<Profile>.appearance)
			ik_params = <ik_params_frontend>
			printf 'Using ik_params_frontend - %s' s = <ik_params> donotresolve
		endif
	endif
	if GotParam \{player_status}
		if GotParam \{highway_texture}
			Change structurename = <player_status> highway_texture = <highway_texture>
		endif
		Change structurename = <player_status> band_member = <Name>
	endif
	<band_member_components1> = [
		{
			component = Skeleton
			uniqueskeletonpath = <skeleton_path>
			skeletonname = <Skeleton>
			allow_reset
			Heap = heap_ragskel
		}
		{
			component = ragdoll
			initialize_empty = FALSE
			disable_collision_callbacks
			useuniqueskeleton
			ragdollName = <ragdoll>
			uniqueragdollpath = <ragdoll_path>
			RagdollCollisionGroup = $<ragdoll_collision_group>
			Heap = heap_ragskel
			accessory_bones = $<accessory_bones>
		}
		{
			component = SetDisplayMatrix
		}
		{
			component = AnimTree
		}
	]
	switch <Name>
		case GUITARIST
		case guitarist2
		case BASSIST
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
	]
	CreateCompositeObject {
		components = (<band_member_components1> + <band_member_components2> + <band_member_components3>)
		params = {
			<Profile>
			Pos = <Pos>
			AssetContext = <anim_asset_context>
			object_type = bandmember
			profilebudget = 800
			Name = <Name>
		}
	}
	<Name> :Obj_SetOrientation Dir = <Dir>
	get_body_checksum_from_appearance appearance = (<Profile>.appearance)
	get_is_female_from_appearance appearance = (<Profile>.appearance)
	<Name> :SetTags asset_heap = <asset_heap>
	<Name> :SetTags body_checksum = <body_checksum>
	<Name> :SetTags is_female = <is_female>
	if GotParam \{anim_struct_member}
		<Name> :SetTags anim_struct = (<anim_struct_member>.anim_set)
	endif
	switch <Name>
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
		if ((<Profile>.Name) = james)
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
	<Name> :Anim_InitTree {
		Tree = $<desired_tree>
		NodeIdDeclaration = <node_ids>
		params = {
			ik_params = <ik_params>
		}
	}
	if (<instrument> = drum)
		if (<is_female> = 1)
			<Name> :Anim_Command target = femalediff Command = applyfemaledrummerdifference_setanim params = {anim = gh_rocker_female_drummer_d}
		endif
	endif
	printf \{'Backing up bones'}
	<Name> :obj_resetbones
	printf \{'Done backing up bones'}
	with_mic = 0
	if GotParam \{loading_into_song}
		get_song_struct song = <loading_into_song>
		if StructureContains structure = <song_struct> parts_with_mic
			if ArrayContains array = (<song_struct>.parts_with_mic) contains = <Name>
				with_mic = 1
			endif
		endif
	endif
	if (<Name> = vocalist)
		if (<instrument> = guitar || <instrument> = bass)
			with_mic = 1
		endif
	endif
	ExtendCrc <Name> '_Info' out = info_struct
	Change structurename = <info_struct> part = <instrument>
	Change structurename = <info_struct> playing = true
	<Name> :SetTags instrument = <instrument> LightGroup = <LightGroup>
	if NOT <Name> :build_band_member_from_appearance {
			Name = (<Profile>.Name)
			appearance = (<Profile>.appearance)
			LightGroup = <LightGroup>
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
	if GotParam \{cancelled}
		return \{FALSE}
	endif
	return \{true}
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
		ScriptAssert \{'Character has no body!'}
	endif
	return is_female = <is_female>
endscript

script build_band_member_from_appearance \{instrument = guitar
		with_mic = 0}
	if NOT GotParam \{loading_into_song}
		instrument = None
	else
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
	if buildcasmodel {
			appearance = <appearance>
			async = <async>
			buildscriptparams = {
				instrument = <instrument>
				new_object = 1
				loading_into_song = <loading_into_song>
			}
		}
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

script get_anim_struct_member 
	if GotParam \{loading_into_song}
		get_song_prefix song = <loading_into_song>
		ExtendCrc <anim_struct> '_' out = song_anim_struct
		ExtendCrc <song_anim_struct> <song_prefix> out = song_anim_struct
		if GlobalExists Name = <song_anim_struct> Type = structure
			if use_alternate_anim_struct song = <loading_into_song>
				AppendSuffixToChecksum Base = <song_anim_struct> SuffixString = '_alt'
				if GlobalExists Name = <appended_id> Type = structure
					song_anim_struct = <appended_id>
				endif
			endif
			if StructureContains structure = ($<song_anim_struct>) <member>
				printf 'get_anim_struct_member - Using song anim struct : %s' s = <song_anim_struct> donotresolve
				printstruct <...>
				return true anim_struct_member = (($<song_anim_struct>).<member>)
			elseif (<member> = bass || <member> = rhythm)
				printf \{'get_anim_struct_member - Dropping from bass to guitar struct'}
				if StructureContains structure = ($<song_anim_struct>) guitar
					printf 'get_anim_struct_member - Using song anim struct : %s' s = <song_anim_struct> donotresolve
					return true anim_struct_member = (($<song_anim_struct>).guitar)
				endif
			endif
		endif
	endif
	if GlobalExists Name = <anim_struct> Type = structure
		if NOT ($guitar_character_loops_state = loop_paks_enabled)
			AppendSuffixToChecksum Base = <anim_struct> SuffixString = '_alt'
			if GlobalExists Name = <appended_id> Type = structure
				anim_struct = <appended_id>
			endif
		endif
		if StructureContains structure = ($<anim_struct>) <member>
			printf 'get_anim_struct_member - Using global anim struct : %s' s = <anim_struct> donotresolve
			printstruct <...>
			return true anim_struct_member = (($<anim_struct>).<member>)
		elseif (<member> = bass || <member> = rhythm)
			printf \{'get_anim_struct_member - Dropping from bass to guitar struct'}
			if StructureContains structure = ($<anim_struct>) guitar
				printf 'get_anim_struct_member - Using global anim struct : %s' s = <anim_struct> donotresolve
				return true anim_struct_member = (($<anim_struct>).guitar)
			endif
		endif
	endif
	printf 'get_anim_struct_member - Failed! : %s' s = <anim_struct> donotresolve
	printstruct <...>
	return \{FALSE}
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
	if ($in_tutorial_mode = 1)
		ScriptAssert \{'should not destroy band in tutorial mode'}
	endif
	cas_destroy_all_characters
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
	if GotParam \{unload_paks}
		mpm_flush_all_paks
	endif
endscript

script destroy_band_member 
	if CompositeObjectExists Name = <Name>
		bandmanager_removecharacter Name = <Name>
		<Name> :Die
		mpm_object_unload_paks owner = <Name>
		flushdeadobjects
	endif
endscript

script kill_character_scripts 
	printf \{qs(0x2498acb7)}
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

script EmptyScript 
endscript

script hero_pause_anim 
	if Anim_AnimNodeExists \{id = BodyTimer}
		Anim_Command \{target = BodyTimer
			Command = Timer_SetSpeed
			params = {
				speed = 0.0
			}}
	endif
endscript

script hero_unpause_anim 
	if Anim_AnimNodeExists \{id = BodyTimer}
		Anim_Command \{target = BodyTimer
			Command = Timer_SetSpeed
			params = {
				speed = 1.0
			}}
	endif
endscript

script hero_enable_mirroring 
	if Anim_AnimNodeExists \{id = mirrornode}
		Anim_Command \{target = mirrornode
			Command = mirror_setstate
			params = {
				On
			}}
	endif
endscript

script hero_disable_mirroring 
	if Anim_AnimNodeExists \{id = mirrornode}
		Anim_Command \{target = mirrornode
			Command = mirror_setstate
			params = {
				OFF
			}}
	endif
endscript

script hero_play_strum_anim \{BlendDuration = 0.0}
	if Anim_AnimNodeExists \{id = RightArm}
		Anim_Command {
			target = RightArm
			Command = DegenerateBlend_AddBranch
			params = {
				Tree = $hero_strumming_branch
				BlendDuration = $strum_anim_blend_time
				params = {
					strum_name = <anim>
				}
			}
		}
	endif
endscript

script band_play_strum_anim 
	if CompositeObjectExists Name = <Name>
		<Name> :hero_play_strum_anim anim = <anim>
	endif
endscript

script hero_play_fret_anim \{BlendDuration = $fret_blend_time}
	if Anim_AnimNodeExists \{id = LeftArm}
		Anim_Command {
			target = LeftArm
			Command = DegenerateBlend_AddBranch
			params = {
				Tree = $hero_fret_branch
				BlendDuration = <BlendDuration>
				params = {
					fret_anim = <anim>
				}
			}
		}
	endif
endscript

script band_play_fret_anim 
	if CompositeObjectExists Name = <Name>
		<Name> :hero_play_fret_anim anim = <anim>
	endif
endscript

script hero_play_finger_anim \{BlendDuration = 0.2}
	if Anim_AnimNodeExists \{id = LeftHand}
		Anim_Command {
			target = LeftHand
			Command = DegenerateBlend_AddBranch
			params = {
				Tree = $hero_finger_branch
				BlendDuration = <BlendDuration>
				params = {
					finger_anim = <anim>
				}
			}
		}
	endif
endscript

script band_play_finger_anim 
	if CompositeObjectExists Name = <Name>
		<Name> :hero_play_finger_anim anim = <anim>
	endif
endscript

script hero_play_facial_anim \{BlendDuration = 0.0}
	if Anim_AnimNodeExists \{id = Face}
		Obj_GetID
		if ((<objID> = vocalist) || (<objID> = vocalist2))
			Tree = $vocalist_face_branch
		else
			Tree = $hero_face_branch
		endif
		Anim_Command {
			target = Face
			Command = DegenerateBlend_AddBranch
			params = {
				Tree = <Tree>
				BlendDuration = <BlendDuration>
				params = {
					facial_anim = <anim>
				}
			}
		}
	endif
endscript

script hero_clear_facial_anim \{BlendDuration = 0.0}
	if Anim_AnimNodeExists \{id = Face}
		Anim_Command {
			target = Face
			Command = DegenerateBlend_AddBranch
			params = {
				Tree = $hero_empty_branch
				BlendDuration = <BlendDuration>
			}
		}
	endif
endscript

script hero_add_clothing_difference_anim 
	if NOT GotParam \{anim}
		return
	endif
	Anim_Command target = heel Command = applyheeldifference_setanim params = {anim = <anim>}
endscript

script hero_wait_until_anim_finished \{Timer = BodyTimer}
	begin
	if hero_anim_complete Timer = <Timer>
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script hero_anim_complete \{Timer = BodyTimer}
	if NOT Anim_AnimNodeExists id = <Timer>
		return \{true}
	else
		if Anim_Command target = <Timer> Command = Timer_IsAnimComplete
			return \{true}
		else
			return \{FALSE}
		endif
	endif
endscript

script hero_wait_until_anim_near_end \{Timer = BodyTimer
		time_from_end = 0.2}
	begin
	if hero_anim_near_end Timer = <Timer> time_from_end = <time_from_end>
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script hero_anim_near_end \{Timer = BodyTimer}
	if NOT Anim_AnimNodeExists id = <Timer>
		return \{true}
	else
		if Anim_Command target = <Timer> Command = Timer_Wait params = {SecondsFromEnd = <time_from_end>}
			return \{true}
		else
			return \{FALSE}
		endif
	endif
endscript

script hero_disable_arms \{blend_time = 0.0}
	Obj_GetID
	band_setikchain Name = <objID> Chain = slave
	return
endscript

script hero_enable_arms \{blend_time = 0.0}
	Obj_GetID
	band_setikchain Name = <objID> Chain = guitar
	return
endscript

script hero_toggle_arms \{num_arms = 2
		prev_num_arms = 0
		blend_time = 0.25}
	disable_left_arm = FALSE
	enable_left_arm = FALSE
	disable_right_arm = FALSE
	enable_right_arm = FALSE
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
	if Anim_AnimNodeExists \{id = Ik}
		if Anim_Command \{target = Ik
				Command = ik_haschain
				params = {
					Chain = Bone_IK_Hand_Slave_L
				}}
			left_hand_bone = Bone_IK_Hand_Slave_L
			right_hand_bone = Bone_IK_Hand_Slave_R
		elseif Anim_Command \{target = Ik
				Command = ik_haschain
				params = {
					Chain = Bone_IK_Hand_Guitar_L
				}}
			left_hand_bone = Bone_IK_Hand_Guitar_L
			right_hand_bone = Bone_IK_Hand_Guitar_R
		else
			ScriptAssert \{'No valid IK chain to work with'}
		endif
	endif
	if (<disable_left_arm> = true)
		printf \{channel = newdebug
			qs(0xf9e6434b)}
		if Anim_AnimNodeExists \{id = Ik}
			Anim_Command {
				target = Ik
				Command = IK_SetChainStrength
				params = {
					Strength = 0.0
					BlendDuration = <blend_time>
					Chain = <left_hand_bone>
				}
			}
		else
			printf \{channel = newdebug
				qs(0x3e3968e0)}
		endif
	endif
	if (<disable_right_arm> = true)
		if Anim_AnimNodeExists \{id = Ik}
			Anim_Command {
				target = Ik
				Command = IK_SetChainStrength
				params = {
					Strength = 0.0
					BlendDuration = <blend_time>
					Chain = <right_hand_bone>
				}
			}
		endif
	endif
	if (<enable_left_arm> = true)
		if Anim_AnimNodeExists \{id = Ik}
			Anim_Command {
				target = Ik
				Command = IK_SetChainStrength
				params = {
					Strength = 1.0
					BlendDuration = <blend_time>
					Chain = <left_hand_bone>
				}
			}
		endif
	endif
	if (<enable_right_arm> = true)
		if Anim_AnimNodeExists \{id = Ik}
			Anim_Command {
				target = Ik
				Command = IK_SetChainStrength
				params = {
					Strength = 1.0
					BlendDuration = <blend_time>
					Chain = <right_hand_bone>
				}
			}
		endif
	endif
endscript

script killanim 
	Skeleton_GetSkeletonName
	ExtendCrc <skeletonname> '_default' out = anim
	obj_killallspawnedscripts
	hero_play_anim anim = <anim> BlendDuration = 0.0
endscript

script handle_moment_anim_blending 
	Obj_GetID
	Anim_Command \{target = moment_blend
		Command = partialswitch_setstate
		params = {
			On
			BlendDuration = 0.0
		}}
	Anim_Command \{target = BodyTimer
		Command = tempomatch_pause}
	Ragdoll_MarkForReset
	stop_loop_cameras Name = <objID>
	Anim_Command \{target = momenttimer
		Command = Timer_WaitAnimComplete}
	Wait \{2
		gameframes}
	end_moment_anim
endscript

script end_moment_anim 
	Obj_GetID
	Obj_KillSpawnedScript \{Name = handle_drummer_moment_anim_blending}
	if Anim_AnimNodeExists \{id = moment_blend}
		Anim_Command \{target = moment_blend
			Command = partialswitch_setstate
			params = {
				OFF
				BlendDuration = 0.0
			}}
		Anim_Command \{target = moment_branch
			Command = DegenerateBlend_AddBranch
			params = {
				Tree = $hero_empty_branch
				BlendDuration = 0.0
			}}
	endif
	if Anim_AnimNodeExists \{id = BodyTimer}
		Anim_Command \{target = BodyTimer
			Command = tempomatch_unpause}
	endif
	ExtendCrc <objID> '_Info' out = info_struct
	part = ($<info_struct>.part)
	GetPakManCurrent \{map = zones}
	if (<pak> != z_soundcheck && <pak> != z_objviewer)
		if (<part> = guitar || <part> = bass || <part> = rhythm)
			Chain = guitar
		else
			Chain = slave
		endif
		band_setikchain Name = <objID> Chain = <Chain>
	endif
	Ragdoll_MarkForReset
	start_loop_cameras Name = <objID>
	if CompositeObjectExists \{Name = GUITARIST}
		GUITARIST :Obj_SetBoundingSphere \{10}
	endif
	if CompositeObjectExists \{Name = BASSIST}
		BASSIST :Obj_SetBoundingSphere \{10}
	endif
	if CompositeObjectExists \{Name = vocalist}
		vocalist :Obj_SetBoundingSphere \{10}
	endif
	Wait \{1
		gameframe}
	GetPakManCurrent \{map = zones}
	if (<pak> != z_soundcheck && <pak> != z_objviewer)
		band_movetostartnode Name = <objID>
	endif
endscript

script stop_loop_cameras 
	if (<Name> = drummer)
		return
	endif
	ExtendCrc <Name> '_mocap_lock_target_01' out = camera1
	if CompositeObjectExists Name = <camera1>
		if <camera1> :Anim_AnimNodeExists id = BodyTimer
			<camera1> :Anim_Command target = BodyTimer Command = tempomatch_pause
		endif
	endif
	ExtendCrc <Name> '_mocap_lock_target_02' out = camera2
	if CompositeObjectExists Name = <camera2>
		if <camera2> :Anim_AnimNodeExists id = BodyTimer
			<camera2> :Anim_Command target = BodyTimer Command = tempomatch_pause
		endif
	endif
endscript

script start_loop_cameras 
	ExtendCrc <Name> '_mocap_lock_target_01' out = camera1
	if CompositeObjectExists Name = <camera1>
		if <camera1> :Anim_AnimNodeExists id = BodyTimer
			<camera1> :Anim_Command target = BodyTimer Command = tempomatch_unpause
		endif
	endif
	ExtendCrc <Name> '_mocap_lock_target_02' out = camera2
	if CompositeObjectExists Name = <camera2>
		if <camera2> :Anim_AnimNodeExists id = BodyTimer
			<camera2> :Anim_Command target = BodyTimer Command = tempomatch_unpause
		endif
	endif
endscript

script set_timer_node_speed 
endscript

script handle_drummer_moment_anim_blending 
	Anim_Command \{target = moment_blend
		Command = partialswitch_setstate
		params = {
			On
			BlendDuration = 0.1
		}}
	Anim_Command \{target = moment_timer
		Command = Timer_WaitAnimComplete}
	Anim_Command \{target = moment_blend
		Command = partialswitch_setstate
		params = {
			OFF
			BlendDuration = 0.1
		}}
endscript

script end_drummer_moment_anim 
	Obj_KillSpawnedScript \{Name = handle_drummer_moment_anim_blending}
	Anim_Command \{target = moment_blend
		Command = partialswitch_setstate
		params = {
			OFF
			BlendDuration = 0.0
		}}
endscript

script drummer_faceoff_rest 
	anim = drum_hth_loop_notempo
	Anim_Command {
		target = faceoff_branch
		Command = DegenerateBlend_AddBranch
		params = {
			Tree = $faceoff_drummer_notempo
			BlendDuration = 0.0
			params = {
				anim = <anim>
			}
		}
	}
	Anim_Command \{target = faceoff_blend
		Command = partialswitch_setstate
		params = {
			On
			BlendDuration = 0.3
		}}
endscript

script drummer_faceoff_play 
	Anim_Command \{target = faceoff_blend
		Command = partialswitch_setstate
		params = {
			OFF
			BlendDuration = 0.3
		}}
endscript
faceoff_drummer_notempo = {
	Type = cycle
	id = faceoff_timer
	anim = anim
	[
		{
			Type = Source
			anim = anim
		}
	]
}

script hide_mic 
	SwitchOffAtomic \{cas_mic}
	SwitchOffAtomic \{cas_mic_stand}
endscript

script show_mic 
	SwitchOnAtomic \{cas_mic}
	SwitchOnAtomic \{cas_mic_stand}
endscript

script hide_mic_stand 
	SwitchOffAtomic \{cas_mic_stand}
endscript

script show_mic_stand 
	SwitchOnAtomic \{cas_mic_stand}
endscript

script hide_mic_microphone 
	SwitchOffAtomic \{cas_mic}
endscript

script show_mic_microphone 
	SwitchOnAtomic \{cas_mic}
endscript

script hide_drumkit 
	SwitchOffAtomic \{cas_drums}
endscript

script show_drumkit 
	SwitchOnAtomic \{cas_drums}
endscript

script vocalist_facial_animations_start \{blendtime = 0.3}
	Anim_Command target = vocal_face_mod Command = Modulate_StartBlend params = {blendtime = <blendtime> BlendCurve = [1 0]}
endscript

script vocalist_facial_animations_stop \{blendtime = 0.3}
	Anim_Command target = vocal_face_mod Command = Modulate_StartBlend params = {blendtime = <blendtime> BlendCurve = [0 1]}
endscript
generic_static_tree = {
	Type = DegenerateBlend
	id = Body
}
guitarist_static_tree = {
	Type = ConstraintBones
	ConstraintBones = hero_ConstraintBones
	[
		{
			Type = ragdoll
			[
				{
					Type = applyheeldifference
					id = heel
					[
						{
							Type = Ik
							two_bone_chains = ik_params
							id = Ik
							[
								{
									Type = tweakbones
									id = tweakbonesnode
									[
										{
											Type = PartialSwitch
											state = On
											[
												{
													Type = DegenerateBlend
													id = Face
												}
												{
													Type = ApplyDifference
													id = LeftHandPartial
													[
														{
															$hero_arm_branch
														}
														{
															Type = switch
															state = OFF
															id = moment_blend
															[
																{
																	Type = applyfemaledifference
																	id = maleanimadjust_moment
																	anim = gh_rocker_female_guitarraise_d
																	[
																		{
																			Type = DegenerateBlend
																			id = moment_branch
																		}
																	]
																}
																{
																	Type = applyfemaledifference
																	id = maleanimadjust
																	anim = gh_rocker_female_guitarraise_d
																	[
																		{
																			Type = DegenerateBlend
																			id = Body
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
	Type = ConstraintBones
	ConstraintBones = hero_ConstraintBones
	[
		{
			Type = ragdoll
			[
				{
					Type = applyheeldifference
					id = heel
					[
						{
							Type = Ik
							two_bone_chains = ik_params
							id = Ik
							[
								{
									Type = tweakbones
									id = tweakbonesnode
									[
										{
											Type = PartialSwitch
											state = On
											[
												{
													Type = tensionstorage
													min_stress_anim = test_character_nm_min_d
													max_stress_anim = test_character_nm_max_d
													[
														{
															Type = DegenerateBlend
															id = Face
														}
													]
												}
												{
													Type = ApplyDifference
													id = LeftHandPartial
													[
														{
															$hero_arm_branch
														}
														{
															Type = switch
															state = OFF
															id = moment_blend
															[
																{
																	Type = applyfemaledifference
																	id = maleanimadjust_moment
																	anim = gh_rocker_female_guitarraise_d
																	[
																		{
																			Type = DegenerateBlend
																			id = moment_branch
																		}
																	]
																}
																{
																	Type = applyfemaledifference
																	id = maleanimadjust
																	anim = gh_rocker_female_guitarraise_d
																	[
																		{
																			Type = DegenerateBlend
																			id = Body
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
	Type = ConstraintBones
	ConstraintBones = hero_ConstraintBones
	[
		{
			Type = ragdoll
			[
				{
					Type = applyheeldifference
					id = heel
					[
						{
							Type = Ik
							two_bone_chains = ik_params
							id = Ik
							[
								{
									Type = applyfemaledifference
									id = maleanimadjust
									anim = gh_rocker_female_guitarraise_d
									[
										{
											Type = applyfemaledrummerdifference
											id = femalediff
											[
												{
													Type = tweakbones
													id = tweakbonesnode
													[
														{
															Type = PartialSwitch
															state = On
															[
																{
																	Type = DegenerateBlend
																	id = Face
																}
																{
																	Type = ApplyDifference
																	id = LeftHandPartial
																	[
																		{
																			$hero_arm_branch
																		}
																		{
																			Type = DegenerateBlend
																			Type = PartialSwitch
																			state = OFF
																			id = moment_blend
																			[
																				{
																					Type = DegenerateBlend
																					id = moment_branch
																				}
																				{
																					Type = DegenerateBlend
																					id = Body
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
	Type = add
	[
		{
			Type = add
			[
				{
					Type = modulate
					Strength = 1.0
					id = fret_anim_mod
					[
						{
							Type = DegenerateBlend
							id = LeftArm
						}
					]
				}
				{
					Type = modulate
					Strength = 1.0
					id = chord_anim_mod
					[
						{
							Type = DegenerateBlend
							id = LeftHand
						}
					]
				}
			]
		}
		{
			Type = modulate
			Strength = 1.0
			id = strum_anim_mod
			[
				{
					Type = DegenerateBlend
					id = RightArm
				}
			]
		}
	]
}
hero_body_branch = {
	Type = timer_type
	id = BodyTimer
	anim = anim_name
	speed = speed
	start = start
	end = end
	tempo_anim = tempo_anim
	min_time_factor = min_time_factor
	max_time_factor = max_time_factor
	allow_beat_skipping = allow_beat_skipping
	allow_tempo_override = allow_tempo_override
	anim_events = On
	[
		{
			Type = source_type
			anim = anim_name
		}
	]
}
hero_moment_branch = {
	Type = timer_type
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
	anim_events = On
	[
		{
			Type = source_type
			anim = anim_name
		}
	]
}
hero_strumming_branch = {
	Type = Play
	id = StrumTimer
	anim = strum_name
	[
		{
			Type = Source
			anim = strum_name
		}
	]
}
hero_fret_branch = {
	Type = Play
	id = FretTimer
	anim = fret_anim
	[
		{
			Type = Source
			anim = fret_anim
		}
	]
}
hero_finger_branch = {
	Type = Play
	id = FingerTimer
	anim = finger_anim
	[
		{
			Type = Source
			anim = finger_anim
		}
	]
}
hero_face_branch = {
	Type = Play
	id = FacialTimer
	anim = facial_anim
	[
		{
			Type = facialhacksource
			anim = facial_anim
		}
	]
}
vocalist_face_branch = {
	Type = playnodurationblending
	id = FacialTimer
	anim = facial_anim
	[
		{
			Type = facialhacksource
			anim = facial_anim
		}
	]
}
hero_play_branch = {
	Type = Play
	id = timer_id
	anim = anim_name
	[
		{
			Type = Source
			anim = anim_name
		}
	]
}
hero_empty_branch = {
	Type = Blank
}
hero_drumming_branch = {
	Type = timer_type
	id = timer_id
	anim = anim_name
	speed = speed
	[
		{
			Type = Source
			anim = anim_name
		}
	]
}
vocalist_static_tree = {
	Type = ConstraintBones
	ConstraintBones = hero_ConstraintBones
	[
		{
			Type = ragdoll
			[
				{
					Type = Ik
					two_bone_chains = singer_ik_params_arms
					id = Ik
					[
						{
							Type = applyheeldifference
							id = heel
							[
								{
									Type = Ik
									two_bone_chains = singer_ik_params_legs
									id = Ik
									[
										{
											Type = tweakbones
											id = tweakbonesnode
											[
												{
													Type = PartialSwitch
													state = On
													[
														{
															Type = modulate
															id = vocal_face_mod
															Strength = 1
															[
																{
																	Type = DegenerateBlend
																	id = Face
																}
															]
														}
														{
															Type = switch
															state = OFF
															id = moment_blend
															[
																{
																	Type = DegenerateBlend
																	id = moment_branch
																}
																{
																	Type = DegenerateBlend
																	id = Body
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
	Type = ConstraintBones
	ConstraintBones = hero_ConstraintBones
	[
		{
			Type = ragdoll
			[
				{
					Type = Ik
					two_bone_chains = singer_ik_params_arms
					id = Ik
					[
						{
							Type = applyheeldifference
							id = heel
							[
								{
									Type = Ik
									two_bone_chains = singer_ik_params_legs
									id = Ik
									[
										{
											Type = tweakbones
											id = tweakbonesnode
											[
												{
													Type = PartialSwitch
													state = On
													[
														{
															Type = modulate
															id = vocal_face_mod
															Strength = 1
															[
																{
																	Type = tensionstorage
																	min_stress_anim = test_character_nm_min_d
																	max_stress_anim = test_character_nm_max_d
																	[
																		{
																			Type = DegenerateBlend
																			id = Face
																		}
																	]
																}
															]
														}
														{
															Type = switch
															state = OFF
															id = moment_blend
															[
																{
																	Type = DegenerateBlend
																	id = moment_branch
																}
																{
																	Type = DegenerateBlend
																	id = Body
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
	Type = ConstraintBones
	ConstraintBones = hero_ConstraintBones
	[
		{
			Type = ragdoll
			[
				{
					Type = applyheeldifference
					id = heel
					[
						{
							Type = Ik
							two_bone_chains = Drummer_IK_Params
							id = Ik
							[
								{
									Type = applyfemaledrummerdifference
									id = femalediff
									[
										{
											Type = tweakbones
											id = tweakbonesnode
											[
												{
													Type = PartialSwitch
													state = On
													[
														{
															Type = DegenerateBlend
															id = Face
														}
														{
															Type = switch
															state = OFF
															id = faceoff_blend
															[
																{
																	Type = DegenerateBlend
																	id = faceoff_branch
																}
																{
																	Type = applydrumkitdifference
																	id = drumkit
																	drum_kit_channel_list = $drum_kit_channel_list
																	[
																		{
																			Type = switch
																			state = OFF
																			id = moment_blend
																			[
																				{
																					Type = DegenerateBlend
																					id = moment_branch
																				}
																				{
																					Type = DegenerateBlend
																					id = Body
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
	Type = timer_type
	id = moment_timer
	anim = anim_name
	speed = speed
	start = start
	end = end
	skip_beats = skip_beats
	tempo_anim = tempo_anim
	anim_events = On
	[
		{
			Type = source_type
			anim = anim_name
		}
	]
}
hero_cymbal_branch = {
	Type = Play
	id = cymbal_timer_id
	anim = cymbal_anim
	[
		{
			Type = Source
			anim = cymbal_anim
		}
	]
}
drum_kit_channel_list = [
	{
		Name = tom_1
		bones = [
			bone_mic_adjust_height
		]
	}
	{
		Name = tom_2
		bones = [
			bone_mic_adjust_angle
		]
	}
	{
		Name = snare
		bones = [
			bone_mic_stand
		]
	}
	{
		Name = cymbal_hh
		bones = [
			bone_guitar_string_2
			bone_guitar_string_3
			bone_guitar_string_4
		]
	}
	{
		Name = cymbal_1
		bones = [
			Bone_IK_Hand_Guitar_L
		]
	}
	{
		Name = cymbal_2
		bones = [
			Bone_IK_Hand_Guitar_R
		]
	}
	{
		Name = cymbal_3
		bones = [
			bone_guitar_string_1
		]
	}
	{
		Name = kick
		bones = [
			Bone_Thigh_R
			Bone_Toe_R
			Bone_IK_Foot_Slave_R
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
		bone0 = Bone_Bicep_R
		bone1 = Bone_Forearm_R
		bone2 = Bone_Palm_R
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Hand_Slave_R
	}
	{
		bone0 = Bone_Bicep_L
		bone1 = Bone_Forearm_L
		bone2 = Bone_Palm_L
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Hand_Slave_L
	}
	{
		bone0 = Bone_Thigh_L
		bone1 = Bone_Knee_L
		bone2 = Bone_Ankle_L
		HingeAxis = (0.0, 0.0, 1.0)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_L
	}
	{
		bone0 = Bone_Thigh_R
		bone1 = Bone_Knee_R
		bone2 = Bone_Ankle_R
		HingeAxis = (0.0, 0.0, 1.0)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_R
	}
]
Hero_Ik_params = [
	{
		bone0 = Bone_Bicep_R
		bone1 = Bone_Forearm_R
		bone2 = Bone_Palm_R
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Hand_Guitar_R
		newTarget = Bone_IK_Hand_Slave_R
		stretch = 1.0
	}
	{
		bone0 = Bone_Bicep_L
		bone1 = Bone_Forearm_L
		bone2 = Bone_Palm_L
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Hand_Guitar_L
		newTarget = Bone_IK_Hand_Slave_L
		stretch = 1.0
	}
	{
		bone0 = Bone_Thigh_L
		bone1 = Bone_Knee_L
		bone2 = Bone_Ankle_L
		HingeAxis = (0.0, 0.0, 1.0)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_L
	}
	{
		bone0 = Bone_Thigh_R
		bone1 = Bone_Knee_R
		bone2 = Bone_Ankle_R
		HingeAxis = (0.0, 0.0, 1.0)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_R
	}
]
hero_feet_ik_params = [
	{
		bone0 = Bone_Thigh_L
		bone1 = Bone_Knee_L
		bone2 = Bone_Ankle_L
		HingeAxis = (0.0, 0.0, 1.0)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_L
	}
	{
		bone0 = Bone_Thigh_R
		bone1 = Bone_Knee_R
		bone2 = Bone_Ankle_R
		HingeAxis = (0.0, 0.0, 1.0)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_R
	}
]
singer_ik_params_arms = [
	{
		bone0 = Bone_Bicep_R
		bone1 = Bone_Forearm_R
		bone2 = Bone_Palm_R
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Hand_Slave_R
		stretch = 1.0
	}
	{
		bone0 = Bone_Bicep_L
		bone1 = Bone_Forearm_L
		bone2 = Bone_Palm_L
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Hand_Slave_L
		stretch = 1.0
	}
]
singer_ik_params_legs = [
	{
		bone0 = Bone_Thigh_L
		bone1 = Bone_Knee_L
		bone2 = Bone_Ankle_L
		HingeAxis = (0.0, 0.0, 1.0)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_L
	}
	{
		bone0 = Bone_Thigh_R
		bone1 = Bone_Knee_R
		bone2 = Bone_Ankle_R
		HingeAxis = (0.0, 0.0, 1.0)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_R
	}
]
Drummer_IK_Params = [
	{
		bone0 = Bone_Bicep_R
		bone1 = Bone_Forearm_R
		bone2 = Bone_Palm_R
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Hand_Slave_R
		stretch = 1.0
	}
	{
		bone0 = Bone_Bicep_L
		bone1 = Bone_Forearm_L
		bone2 = Bone_Palm_L
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Hand_Slave_L
		stretch = 1.0
	}
	{
		bone0 = Bone_Thigh_L
		bone1 = Bone_Knee_L
		bone2 = Bone_Ankle_L
		HingeAxis = (0.0, 0.0, 1.0)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_L
	}
	{
		bone0 = Bone_Thigh_R
		bone1 = Bone_Knee_R
		bone2 = Bone_Ankle_R
		HingeAxis = (0.0, 0.0, 1.0)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_R
	}
]
guitar_ik_params = [
	{
		bone0 = Bone_Bicep_R
		bone1 = Bone_Forearm_R
		bone2 = Bone_Palm_R
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Hand_Guitar_R
		newTarget = Bone_IK_Hand_Slave_R
		stretch = 1.0
	}
	{
		bone0 = Bone_Bicep_L
		bone1 = Bone_Forearm_L
		bone2 = Bone_Palm_L
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Hand_Guitar_L
		newTarget = Bone_IK_Hand_Slave_L
		stretch = 1.0
	}
	{
		bone0 = Bone_Thigh_L
		bone1 = Bone_Knee_L
		bone2 = Bone_Ankle_L
		HingeAxis = (0.0, 0.0, 1.0)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_L
	}
	{
		bone0 = Bone_Thigh_R
		bone1 = Bone_Knee_R
		bone2 = Bone_Ankle_R
		HingeAxis = (0.0, 0.0, 1.0)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_R
	}
]
hero_ConstraintBones = [
	{
		Type = Twistchild
		bone = Bone_Twist_Wrist_L
		target = Bone_Palm_L
		amount = 0.5
	}
	{
		Type = Twistchild
		bone = Bone_Twist_Wrist_R
		target = Bone_Palm_R
		amount = 0.5
	}
	{
		Type = TWIST
		bone = Bone_Twist_Bicep_Mid_R
		target = Bone_Bicep_R
		amount = 0.5
	}
	{
		Type = TWIST
		bone = Bone_Twist_Bicep_Mid_L
		target = Bone_Bicep_L
		amount = 0.5
	}
	{
		Type = TWIST
		bone = Bone_Twist_Bicep_Top_R
		target = Bone_Bicep_R
		amount = 1.0
	}
	{
		Type = TWIST
		bone = Bone_Twist_Bicep_Top_L
		target = Bone_Bicep_L
		amount = 1.0
	}
	{
		Type = twistthigh
		bone = Bone_Twist_Thigh_R
		target = Bone_Thigh_R
		amount = 1.0
	}
	{
		Type = twistthigh
		bone = Bone_Twist_Thigh_L
		target = Bone_Thigh_L
		amount = 1.0
	}
	{
		Type = SplitR
		bone = Bone_Split_Ass_R
		target = Bone_Twist_Thigh_R
		amount = 0.5
	}
	{
		Type = SplitR
		bone = Bone_Split_Ass_L
		target = Bone_Twist_Thigh_L
		amount = 0.5
	}
]
car_female_facial_bones = [
	Bone_Jaw
	Bone_Mouth_L
	Bone_Mouth_R
	Bone_Lip_Lower_Mid
	Bone_Lip_Upper_Mid
	Bone_Lip_Lower_Corner_L
	Bone_Lip_Lower_Corner_R
	Bone_Lip_Lower_L
	Bone_Lip_Lower_R
	Bone_Lip_Upper_Corner_L
	Bone_Lip_Upper_Corner_R
	Bone_Lip_Upper_L
	Bone_Lip_Upper_R
	Bone_Tongue
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
	GH3_Singer_Male_KnightsofCydonia_1
	GH3_Singer_Male_KnightsofCydonia_2
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
	GH3_Singer_Male_MyCurse_1
	GH3_Singer_Male_MyCurse_1b
	GH3_Singer_Male_MyCurse_2
	GH3_Singer_Male_MyCurse_2b
	GH3_Singer_Male_MyCurse_3
	GH3_Singer_Male_MyCurse_4
	GH3_Singer_Male_MyCurse_5
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
