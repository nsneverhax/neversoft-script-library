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
	MaleAnimAdjust
	MaleAnimAdjust_Moment
	TweakBonesNode
	MirrorNode
	FemaleDiff
	vocal_face_mod
	Heel
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
	FemaleDiff
	DrumKit
	moment_branch
	moment_blend
	moment_timer
	faceoff_blend
	faceoff_branch
	faceoff_timer
	TweakBonesNode
	MirrorNode
	Heel
]

script create_band_member \{name = Guitarist
		lightgroup = Band
		async = 0
		pos = (0.0, 0.0, 0.0)
		dir = (0.0, 0.0, 1.0)}
	RemoveParameter \{profile_struct}
	create_band_member_wait_for_lock
	printf qs("\LCreate_Band_Member name=%a.............") a = <name>
	if GotParam \{start_node}
		if DoesWayPointExist name = <start_node>
			GetWaypointPos name = <start_node>
			GetWaypointDir name = <start_node>
		endif
	endif
	if CompositeObjectExists <name>
		ScriptAssert '%s already exists' s = <name>
	endif
	if (<name> = Guitarist)
		if CompositeObjectExists \{name = bassist}
			bassist :hero_pause_anim
		endif
	elseif (<name> = bassist)
		if CompositeObjectExists \{name = Guitarist}
			Guitarist :hero_pause_anim
		endif
	endif
	if NOT GotParam \{asset_heap}
		get_best_heap_for_appearance appearance = (<profile>.appearance)
		asset_heap = <best_heap>
	endif
	anim_asset_context = <asset_heap>
	if get_body_key_from_appearance key = anim_struct appearance = (<profile>.appearance)
		if GotParam \{loading_into_song}
			get_anim_struct_member anim_struct = <anim_struct> loading_into_song = <loading_into_song> member = <instrument>
		else
		endif
		if NOT StructureContains Structure = ($<anim_struct>) anim_asset_context
			ScriptAssert \{'anim_asset_context missing!'}
		endif
		anim_asset_context = (($<anim_struct>).anim_asset_context)
	else
		ScriptAssert \{'anim_struct not found in appearance'}
	endif
	RemoveParameter \{highway_texture}
	if GotParam \{loading_into_song}
		if GotParam \{player_status}
			if NOT (($<player_status>.part) = Vocals)
				if NOT get_highway_struct_from_appearance part = ($<player_status>.part) appearance = (<profile>.appearance)
					ScriptAssert \{'Problem grabbing highway struct'}
				endif
				if (($is_attract_mode = 1) || ((<profile>.name) = EmptyGuy))
					highway_pak = highway_axel
					highway_texture = `tex\models\Highway\Highway_Axel_fm_01.dds`
				endif
				mpm_object_load_pak pak = <highway_pak> owner = <name> async = <async>
			endif
		else
			if ((<profile>.name) = Jimi)
				if (<name> = vocalist)
					if NOT get_highway_struct_from_appearance part = <instrument> appearance = (<profile>.appearance)
						ScriptAssert \{'Problem grabbing highway struct'}
					endif
					mpm_object_unload_paks owner = Guitarist async = <async>
					mpm_object_load_pak pak = <highway_pak> owner = <name> async = <async>
					get_band_member_player_status \{part = guitar}
					if GotParam \{band_member_player_status}
						change structurename = <band_member_player_status> highway_texture = <highway_texture>
						change structurename = <band_member_player_status> band_member = vocalist
					endif
					RemoveParameter \{highway_texture}
				endif
			endif
			if ((<profile>.name) = travis)
				if (<name> = Drummer)
					if NOT get_highway_struct_from_appearance part = <instrument> appearance = (<profile>.appearance)
						ScriptAssert \{'Problem grabbing highway struct'}
					endif
					mpm_object_unload_paks owner = Drummer async = <async>
					mpm_object_load_pak pak = <highway_pak> owner = <name> async = <async>
					get_band_member_player_status \{part = drum}
					if GotParam \{band_member_player_status}
						change structurename = <band_member_player_status> highway_texture = <highway_texture>
						change structurename = <band_member_player_status> band_member = Drummer
					endif
					RemoveParameter \{highway_texture}
				endif
			endif
		endif
	endif
	if (<name> = Guitarist)
		if CompositeObjectExists \{name = bassist}
			bassist :hero_unpause_anim
		endif
	elseif (<name> = bassist)
		if CompositeObjectExists \{name = Guitarist}
			Guitarist :hero_unpause_anim
		endif
	endif
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_viewer
		lightgroup = none
		default
		switch <name>
			case Drummer
			case drummer2
			lightgroup = [Band Drummer]
			case bassist
			lightgroup = [Band Alt_Band bassist]
			case Guitarist
			case guitarist2
			lightgroup = [Band Alt_Band Guitarist]
			case vocalist
			case vocalist2
			lightgroup = [Band Alt_Band vocalist]
			default
			lightgroup = [Band Alt_Band]
		endswitch
	endswitch
	ik_params = Hero_Ik_params
	if NOT get_body_key_from_appearance key = skeleton appearance = (<profile>.appearance)
		ScriptAssert \{'Missing skeleton in appearance'}
	endif
	if NOT get_body_key_from_appearance key = skeleton_path appearance = (<profile>.appearance)
		ScriptAssert \{'Missing skeleton_path in appearance'}
	endif
	if NOT get_body_key_from_appearance key = ragdoll appearance = (<profile>.appearance)
		ScriptAssert \{'Missing ragdoll in appearance'}
	endif
	if NOT get_body_key_from_appearance key = ragdoll_path appearance = (<profile>.appearance)
		ScriptAssert \{'Missing ragdoll_path in appearance'}
	endif
	if NOT get_body_key_from_appearance key = ragdoll_collision_group appearance = (<profile>.appearance)
		ScriptAssert \{'Missing ragdoll_collision_group in appearance'}
	endif
	if NOT get_body_key_from_appearance key = accessory_bones appearance = (<profile>.appearance)
		ScriptAssert \{'Missing accessory_bones in appearance'}
	endif
	get_body_key_from_appearance key = ik_params appearance = (<profile>.appearance)
	if GotParam \{loading_into_song}
		switch (<instrument>)
			case Vocals
			if get_body_key_from_appearance key = ik_params_vocals appearance = (<profile>.appearance)
				ik_params = <ik_params_vocals>
				printf 'Using ik_params_vocals - %s' s = <ik_params> DoNotResolve
			endif
			case drum
			if get_body_key_from_appearance key = ik_params_drum appearance = (<profile>.appearance)
				ik_params = <ik_params_drum>
				printf 'Using ik_params_drum - %s' s = <ik_params> DoNotResolve
			endif
			default
			if get_body_key_from_appearance key = ik_params_guitar appearance = (<profile>.appearance)
				ik_params = <ik_params_guitar>
				printf 'Using ik_params_guitar - %s' s = <ik_params> DoNotResolve
			endif
		endswitch
	else
		if get_body_key_from_appearance key = ik_params_frontend appearance = (<profile>.appearance)
			ik_params = <ik_params_frontend>
			printf 'Using ik_params_frontend - %s' s = <ik_params> DoNotResolve
		endif
	endif
	if GotParam \{player_status}
		if GotParam \{highway_texture}
			change structurename = <player_status> highway_texture = <highway_texture>
		endif
		change structurename = <player_status> band_member = <name>
	endif
	<band_member_components1> = [
		{
			Component = skeleton
			uniqueskeletonpath = <skeleton_path>
			SkeletonName = <skeleton>
			allow_reset
			heap = heap_ragskel
		}
		{
			Component = ragdoll
			initialize_empty = false
			disable_collision_callbacks
			useuniqueskeleton
			ragdollName = <ragdoll>
			uniqueragdollpath = <ragdoll_path>
			RagdollCollisionGroup = $<ragdoll_collision_group>
			heap = heap_ragskel
			accessory_bones = $<accessory_bones>
		}
		{
			Component = SetDisplayMatrix
		}
		{
			Component = AnimTree
		}
	]
	switch <name>
		case Guitarist
		case guitarist2
		case bassist
		case vocalist
		case vocalist2
		<band_member_components2> = [
			{
				Component = wavecastermaterialupdate
			}
		]
		default
		<band_member_components2> = []
	endswitch
	<band_member_components3> = [
		{
			Component = Model
			lightgroup = <lightgroup>
		}
		{
			Component = motion
		}
		{
			Component = ModelBuilder
			global_storage = <asset_heap>
		}
	]
	CreateCompositeObject {
		Components = (<band_member_components1> + <band_member_components2> + <band_member_components3>)
		params = {
			<profile>
			pos = <pos>
			assetcontext = <anim_asset_context>
			object_type = bandmember
			profilebudget = 800
			name = <name>
		}
	}
	<name> :Obj_SetOrientation dir = <dir>
	get_body_checksum_from_appearance appearance = (<profile>.appearance)
	get_is_female_from_appearance appearance = (<profile>.appearance)
	<name> :SetTags asset_heap = <asset_heap>
	<name> :SetTags body_checksum = <body_checksum>
	<name> :SetTags is_female = <is_female>
	if GotParam \{anim_struct_member}
		<name> :SetTags anim_struct = (<anim_struct_member>.anim_set)
	endif
	switch <name>
		case cas_musician1
		case cas_musician2
		case cas_musician3
		case cas_musician4
		desired_tree = frontend_static_tree
		default
		switch (<instrument>)
			case Vocals
			desired_tree = vocalist_static_tree
			case drum
			desired_tree = drummer_static_tree
			default
			desired_tree = guitarist_static_tree
		endswitch
		if ((<profile>.name) = James)
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
	<name> :Anim_InitTree {
		Tree = $<desired_tree>
		NodeIdDeclaration = <node_ids>
		params = {
			ik_params = <ik_params>
		}
	}
	if (<instrument> = drum)
		if (<is_female> = 1)
			<name> :Anim_Command target = FemaleDiff command = ApplyFemaleDrummerDifference_SetAnim params = {Anim = GH_Rocker_Female_Drummer_D}
		endif
	endif
	printf \{'Backing up bones'}
	<name> :Obj_ResetBones
	printf \{'Done backing up bones'}
	with_mic = 0
	if GotParam \{loading_into_song}
		get_song_struct song = <loading_into_song>
		if StructureContains Structure = <song_struct> parts_with_mic
			if ArrayContains array = (<song_struct>.parts_with_mic) contains = <name>
				with_mic = 1
			endif
		endif
	endif
	if (<name> = vocalist)
		if (<instrument> = guitar || <instrument> = Bass)
			with_mic = 1
		endif
	endif
	ExtendCRC <name> '_Info' out = info_struct
	change structurename = <info_struct> part = <instrument>
	change structurename = <info_struct> playing = true
	<name> :SetTags instrument = <instrument> lightgroup = <lightgroup>
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
	if GotParam \{cancelled}
		return \{false}
	endif
	return \{true}
endscript

script get_body_checksum_from_appearance 
	if StructureContains Structure = <appearance> CAS_Body
		return body_checksum = ((<appearance>.CAS_Body).desc_id)
	endif
	if StructureContains Structure = <appearance> CAS_Full_Body
		return body_checksum = ((<appearance>.CAS_Full_Body).desc_id)
	endif
	printstruct <appearance>
	ScriptAssert \{'Character has no body!'}
endscript

script get_is_female_from_appearance 
	if StructureContains Structure = <appearance> CAS_Body
		GetActualCASOptionStruct part = CAS_Body desc_id = ((<appearance>.CAS_Body).desc_id)
	endif
	if StructureContains Structure = <appearance> CAS_Full_Body
		GetActualCASOptionStruct part = CAS_Full_Body desc_id = ((<appearance>.CAS_Full_Body).desc_id)
	endif
	if NOT GotParam \{is_female}
		ScriptAssert \{'Character has no body!'}
	endif
	return is_female = <is_female>
endscript

script build_band_member_from_appearance \{instrument = guitar
		with_mic = 0}
	if NOT GotParam \{loading_into_song}
		instrument = none
	else
		maybe_use_song_or_venue_specific_instrument {song = $current_song venue = $current_level appearance = <appearance> name = <name>}
	endif
	if (<with_mic> = 1)
		if (<instrument> = guitar)
			instrument = Guitar_And_Vocals
		elseif (<instrument> = Bass)
			instrument = Bass_And_Vocals
		elseif (<instrument> = Vocals)
			instrument = Guitar_And_Vocals
		endif
	endif
	if BuildCASModel {
			appearance = <appearance>
			async = <async>
			buildscriptparams = {
				instrument = <instrument>
				new_object = 1
				loading_into_song = <loading_into_song>
			}
		}
		Obj_GetID
		if (<with_mic> = 1 && <ObjID> != vocalist)
			if NOT (<instrument> = Vocals)
				hide_mic
			endif
		endif
		return \{true}
	endif
	return \{false}
endscript

script get_anim_struct_member 
	if GotParam \{loading_into_song}
		get_song_prefix song = <loading_into_song>
		ExtendCRC <anim_struct> '_' out = song_anim_struct
		ExtendCRC <song_anim_struct> <song_prefix> out = song_anim_struct
		if GlobalExists name = <song_anim_struct> type = Structure
			if use_alternate_anim_struct song = <loading_into_song>
				AppendSuffixToChecksum Base = <song_anim_struct> SuffixString = '_alt'
				if GlobalExists name = <appended_id> type = Structure
					song_anim_struct = <appended_id>
				endif
			endif
			if StructureContains Structure = ($<song_anim_struct>) <member>
				printf 'get_anim_struct_member - Using song anim struct : %s' s = <song_anim_struct> DoNotResolve
				printstruct <...>
				return true anim_struct_member = (($<song_anim_struct>).<member>)
			elseif (<member> = Bass || <member> = rhythm)
				printf \{'get_anim_struct_member - Dropping from bass to guitar struct'}
				if StructureContains Structure = ($<song_anim_struct>) guitar
					printf 'get_anim_struct_member - Using song anim struct : %s' s = <song_anim_struct> DoNotResolve
					return true anim_struct_member = (($<song_anim_struct>).guitar)
				endif
			endif
		endif
	endif
	if GlobalExists name = <anim_struct> type = Structure
		if NOT ($guitar_character_loops_state = loop_paks_enabled)
			AppendSuffixToChecksum Base = <anim_struct> SuffixString = '_alt'
			if GlobalExists name = <appended_id> type = Structure
				anim_struct = <appended_id>
			endif
		endif
		if StructureContains Structure = ($<anim_struct>) <member>
			printf 'get_anim_struct_member - Using global anim struct : %s' s = <anim_struct> DoNotResolve
			printstruct <...>
			return true anim_struct_member = (($<anim_struct>).<member>)
		elseif (<member> = Bass || <member> = rhythm)
			printf \{'get_anim_struct_member - Dropping from bass to guitar struct'}
			if StructureContains Structure = ($<anim_struct>) guitar
				printf 'get_anim_struct_member - Using global anim struct : %s' s = <anim_struct> DoNotResolve
				return true anim_struct_member = (($<anim_struct>).guitar)
			endif
		endif
	endif
	printf 'get_anim_struct_member - Failed! : %s' s = <anim_struct> DoNotResolve
	printstruct <...>
	return \{false}
endscript

script preload_band_member \{name = Guitarist
		async = 0}
	create_band_member_wait_for_lock
	filename_crc = none
	instrument_crc = none
	create_band_member_unlock
	return filename_crc = <filename_crc> instrument_crc = <instrument_crc> true
endscript

script preload_band_member_finish \{name = Guitarist
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
	Wait \{1
		gameframe}
	repeat
	change \{create_band_member_lock_queue = 1}
	begin
	if ($create_band_member_lock = 0)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	change \{create_band_member_lock_queue = 0}
	change \{create_band_member_lock = 1}
endscript

script destroy_band 
	if ($in_tutorial_mode = 1)
		ScriptAssert \{'should not destroy band in tutorial mode'}
	endif
	cas_destroy_all_characters
	band_stop_anims
	destroy_band_member \{name = Guitarist}
	destroy_band_member \{name = guitarist2}
	destroy_band_member \{name = bassist}
	destroy_band_member \{name = bassist2}
	destroy_band_member \{name = Drummer}
	destroy_band_member \{name = drummer2}
	destroy_band_member \{name = vocalist}
	destroy_band_member \{name = vocalist2}
	band_unload_anim_paks
	if GotParam \{unload_paks}
		mpm_flush_all_paks
	endif
endscript

script destroy_band_member 
	if CompositeObjectExists name = <name>
		BandManager_RemoveCharacter name = <name>
		<name> :Die
		mpm_object_unload_paks owner = <name>
		FlushDeadObjects
	endif
endscript

script kill_character_scripts 
	printf \{qs("\Lkill character scripts.......")}
	if CompositeObjectExists \{name = Guitarist}
		Guitarist :Obj_SwitchScript \{EmptyScript}
	endif
	if CompositeObjectExists \{name = bassist}
		bassist :Obj_SwitchScript \{EmptyScript}
	endif
	if CompositeObjectExists \{name = vocalist}
		vocalist :Obj_SwitchScript \{EmptyScript}
	endif
	if CompositeObjectExists \{name = Drummer}
		Drummer :Obj_SwitchScript \{EmptyScript}
	endif
endscript

script EmptyScript 
endscript

script hero_pause_anim 
	if Anim_AnimNodeExists \{id = BodyTimer}
		Anim_Command \{target = BodyTimer
			command = Timer_SetSpeed
			params = {
				Speed = 0.0
			}}
	endif
endscript

script hero_unpause_anim 
	if Anim_AnimNodeExists \{id = BodyTimer}
		Anim_Command \{target = BodyTimer
			command = Timer_SetSpeed
			params = {
				Speed = 1.0
			}}
	endif
endscript

script hero_enable_mirroring 
	if Anim_AnimNodeExists \{id = MirrorNode}
		Anim_Command \{target = MirrorNode
			command = Mirror_SetState
			params = {
				on
			}}
	endif
endscript

script hero_disable_mirroring 
	if Anim_AnimNodeExists \{id = MirrorNode}
		Anim_Command \{target = MirrorNode
			command = Mirror_SetState
			params = {
				off
			}}
	endif
endscript

script hero_play_strum_anim \{BlendDuration = 0.0}
	if Anim_AnimNodeExists \{id = RightArm}
		Anim_Command {
			target = RightArm
			command = DegenerateBlend_AddBranch
			params = {
				Tree = $hero_strumming_branch
				BlendDuration = $strum_anim_blend_time
				params = {
					strum_name = <Anim>
				}
			}
		}
	endif
endscript

script band_play_strum_anim 
	if CompositeObjectExists name = <name>
		<name> :hero_play_strum_anim Anim = <Anim>
	endif
endscript

script hero_play_fret_anim \{BlendDuration = $fret_blend_time}
	if Anim_AnimNodeExists \{id = LeftArm}
		Anim_Command {
			target = LeftArm
			command = DegenerateBlend_AddBranch
			params = {
				Tree = $hero_fret_branch
				BlendDuration = <BlendDuration>
				params = {
					fret_anim = <Anim>
				}
			}
		}
	endif
endscript

script band_play_fret_anim 
	if CompositeObjectExists name = <name>
		<name> :hero_play_fret_anim Anim = <Anim>
	endif
endscript

script hero_play_finger_anim \{BlendDuration = 0.2}
	if Anim_AnimNodeExists \{id = LeftHand}
		Anim_Command {
			target = LeftHand
			command = DegenerateBlend_AddBranch
			params = {
				Tree = $hero_finger_branch
				BlendDuration = <BlendDuration>
				params = {
					finger_anim = <Anim>
				}
			}
		}
	endif
endscript

script band_play_finger_anim 
	if CompositeObjectExists name = <name>
		<name> :hero_play_finger_anim Anim = <Anim>
	endif
endscript

script hero_play_facial_anim \{BlendDuration = 0.0}
	if Anim_AnimNodeExists \{id = Face}
		Obj_GetID
		if ((<ObjID> = vocalist) || (<ObjID> = vocalist2))
			Tree = $vocalist_face_branch
		else
			Tree = $hero_face_branch
		endif
		Anim_Command {
			target = Face
			command = DegenerateBlend_AddBranch
			params = {
				Tree = <Tree>
				BlendDuration = <BlendDuration>
				params = {
					facial_anim = <Anim>
				}
			}
		}
	endif
endscript

script hero_clear_facial_anim \{BlendDuration = 0.0}
	if Anim_AnimNodeExists \{id = Face}
		Anim_Command {
			target = Face
			command = DegenerateBlend_AddBranch
			params = {
				Tree = $hero_empty_branch
				BlendDuration = <BlendDuration>
			}
		}
	endif
endscript

script hero_add_clothing_difference_anim 
	if NOT GotParam \{Anim}
		return
	endif
	Anim_Command target = Heel command = ApplyHeelDifference_SetAnim params = {Anim = <Anim>}
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
		if Anim_Command target = <Timer> command = Timer_IsAnimComplete
			return \{true}
		else
			return \{false}
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
		if Anim_Command target = <Timer> command = Timer_Wait params = {SecondsFromEnd = <time_from_end>}
			return \{true}
		else
			return \{false}
		endif
	endif
endscript

script hero_disable_arms \{blend_time = 0.0}
	Obj_GetID
	Band_SetIKChain name = <ObjID> chain = slave
	return
endscript

script hero_enable_arms \{blend_time = 0.0}
	Obj_GetID
	Band_SetIKChain name = <ObjID> chain = guitar
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
	if Anim_AnimNodeExists \{id = Ik}
		if Anim_Command \{target = Ik
				command = IK_HasChain
				params = {
					chain = Bone_IK_Hand_Slave_L
				}}
			left_hand_bone = Bone_IK_Hand_Slave_L
			right_hand_bone = Bone_IK_Hand_Slave_R
		elseif Anim_Command \{target = Ik
				command = IK_HasChain
				params = {
					chain = Bone_IK_Hand_Guitar_L
				}}
			left_hand_bone = Bone_IK_Hand_Guitar_L
			right_hand_bone = Bone_IK_Hand_Guitar_R
		else
			ScriptAssert \{'No valid IK chain to work with'}
		endif
	endif
	if (<disable_left_arm> = true)
		printf \{channel = newdebug
			qs("\Ldisable_left_arm is true ")}
		if Anim_AnimNodeExists \{id = Ik}
			Anim_Command {
				target = Ik
				command = IK_SetChainStrength
				params = {
					strength = 0.0
					BlendDuration = <blend_time>
					chain = <left_hand_bone>
				}
			}
		else
			printf \{channel = newdebug
				qs("\Lik node doesn't exist.......")}
		endif
	endif
	if (<disable_right_arm> = true)
		if Anim_AnimNodeExists \{id = Ik}
			Anim_Command {
				target = Ik
				command = IK_SetChainStrength
				params = {
					strength = 0.0
					BlendDuration = <blend_time>
					chain = <right_hand_bone>
				}
			}
		endif
	endif
	if (<enable_left_arm> = true)
		if Anim_AnimNodeExists \{id = Ik}
			Anim_Command {
				target = Ik
				command = IK_SetChainStrength
				params = {
					strength = 1.0
					BlendDuration = <blend_time>
					chain = <left_hand_bone>
				}
			}
		endif
	endif
	if (<enable_right_arm> = true)
		if Anim_AnimNodeExists \{id = Ik}
			Anim_Command {
				target = Ik
				command = IK_SetChainStrength
				params = {
					strength = 1.0
					BlendDuration = <blend_time>
					chain = <right_hand_bone>
				}
			}
		endif
	endif
endscript

script killanim 
	Skeleton_GetSkeletonName
	ExtendCRC <SkeletonName> '_default' out = Anim
	obj_killallspawnedscripts
	hero_play_anim Anim = <Anim> BlendDuration = 0.0
endscript

script handle_moment_anim_blending 
	Obj_GetID
	Anim_Command \{target = moment_blend
		command = PartialSwitch_SetState
		params = {
			on
			BlendDuration = 0.0
		}}
	Anim_Command \{target = BodyTimer
		command = TempoMatch_Pause}
	ragdoll_markforreset
	stop_loop_cameras name = <ObjID>
	Anim_Command \{target = momenttimer
		command = Timer_WaitAnimComplete}
	Wait \{2
		gameframes}
	end_moment_anim
endscript

script end_moment_anim 
	Obj_GetID
	Obj_KillSpawnedScript \{name = handle_drummer_moment_anim_blending}
	if Anim_AnimNodeExists \{id = moment_blend}
		Anim_Command \{target = moment_blend
			command = PartialSwitch_SetState
			params = {
				off
				BlendDuration = 0.0
			}}
		Anim_Command \{target = moment_branch
			command = DegenerateBlend_AddBranch
			params = {
				Tree = $hero_empty_branch
				BlendDuration = 0.0
			}}
	endif
	if Anim_AnimNodeExists \{id = BodyTimer}
		Anim_Command \{target = BodyTimer
			command = TempoMatch_Unpause}
	endif
	ExtendCRC <ObjID> '_Info' out = info_struct
	part = ($<info_struct>.part)
	GetPakManCurrent \{map = zones}
	if (<pak> != z_soundcheck && <pak> != z_objviewer)
		if (<part> = guitar || <part> = Bass || <part> = rhythm)
			chain = guitar
		else
			chain = slave
		endif
		Band_SetIKChain name = <ObjID> chain = <chain>
	endif
	ragdoll_markforreset
	start_loop_cameras name = <ObjID>
	if CompositeObjectExists \{name = Guitarist}
		Guitarist :Obj_SetBoundingSphere \{10}
	endif
	if CompositeObjectExists \{name = bassist}
		bassist :Obj_SetBoundingSphere \{10}
	endif
	if CompositeObjectExists \{name = vocalist}
		vocalist :Obj_SetBoundingSphere \{10}
	endif
	Wait \{1
		gameframe}
	GetPakManCurrent \{map = zones}
	if (<pak> != z_soundcheck && <pak> != z_objviewer)
		Band_MoveToStartNode name = <ObjID>
	endif
endscript

script stop_loop_cameras 
	if (<name> = Drummer)
		return
	endif
	ExtendCRC <name> '_mocap_lock_target_01' out = camera1
	if CompositeObjectExists name = <camera1>
		if <camera1> :Anim_AnimNodeExists id = BodyTimer
			<camera1> :Anim_Command target = BodyTimer command = TempoMatch_Pause
		endif
	endif
	ExtendCRC <name> '_mocap_lock_target_02' out = camera2
	if CompositeObjectExists name = <camera2>
		if <camera2> :Anim_AnimNodeExists id = BodyTimer
			<camera2> :Anim_Command target = BodyTimer command = TempoMatch_Pause
		endif
	endif
endscript

script start_loop_cameras 
	ExtendCRC <name> '_mocap_lock_target_01' out = camera1
	if CompositeObjectExists name = <camera1>
		if <camera1> :Anim_AnimNodeExists id = BodyTimer
			<camera1> :Anim_Command target = BodyTimer command = TempoMatch_Unpause
		endif
	endif
	ExtendCRC <name> '_mocap_lock_target_02' out = camera2
	if CompositeObjectExists name = <camera2>
		if <camera2> :Anim_AnimNodeExists id = BodyTimer
			<camera2> :Anim_Command target = BodyTimer command = TempoMatch_Unpause
		endif
	endif
endscript

script set_timer_node_speed 
endscript

script handle_drummer_moment_anim_blending 
	Anim_Command \{target = moment_blend
		command = PartialSwitch_SetState
		params = {
			on
			BlendDuration = 0.1
		}}
	Anim_Command \{target = moment_timer
		command = Timer_WaitAnimComplete}
	Anim_Command \{target = moment_blend
		command = PartialSwitch_SetState
		params = {
			off
			BlendDuration = 0.1
		}}
endscript

script end_drummer_moment_anim 
	Obj_KillSpawnedScript \{name = handle_drummer_moment_anim_blending}
	Anim_Command \{target = moment_blend
		command = PartialSwitch_SetState
		params = {
			off
			BlendDuration = 0.0
		}}
endscript

script drummer_faceoff_rest 
	Anim = Drum_HTH_Loop_NoTempo
	Anim_Command {
		target = faceoff_branch
		command = DegenerateBlend_AddBranch
		params = {
			Tree = $faceoff_drummer_notempo
			BlendDuration = 0.0
			params = {
				Anim = <Anim>
			}
		}
	}
	Anim_Command \{target = faceoff_blend
		command = PartialSwitch_SetState
		params = {
			on
			BlendDuration = 0.3
		}}
endscript

script drummer_faceoff_play 
	Anim_Command \{target = faceoff_blend
		command = PartialSwitch_SetState
		params = {
			off
			BlendDuration = 0.3
		}}
endscript
faceoff_drummer_notempo = {
	type = Cycle
	id = faceoff_timer
	Anim = Anim
	[
		{
			type = Source
			Anim = Anim
		}
	]
}

script hide_mic 
	SwitchOffAtomic \{CAS_Mic}
	SwitchOffAtomic \{CAS_Mic_Stand}
endscript

script show_mic 
	SwitchOnAtomic \{CAS_Mic}
	SwitchOnAtomic \{CAS_Mic_Stand}
endscript

script hide_mic_stand 
	SwitchOffAtomic \{CAS_Mic_Stand}
endscript

script show_mic_stand 
	SwitchOnAtomic \{CAS_Mic_Stand}
endscript

script hide_mic_microphone 
	SwitchOffAtomic \{CAS_Mic}
endscript

script show_mic_microphone 
	SwitchOnAtomic \{CAS_Mic}
endscript

script hide_Drumkit 
	SwitchOffAtomic \{CAS_Drums}
endscript

script show_Drumkit 
	SwitchOnAtomic \{CAS_Drums}
endscript

script vocalist_facial_animations_start \{Blendtime = 0.3}
	Anim_Command target = vocal_face_mod command = Modulate_StartBlend params = {Blendtime = <Blendtime> blendcurve = [1 0]}
endscript

script vocalist_facial_animations_stop \{Blendtime = 0.3}
	Anim_Command target = vocal_face_mod command = Modulate_StartBlend params = {Blendtime = <Blendtime> blendcurve = [0 1]}
endscript
generic_static_tree = {
	type = DegenerateBlend
	id = Body
}
guitarist_static_tree = {
	type = ConstraintBones
	ConstraintBones = hero_ConstraintBones
	[
		{
			type = ragdoll
			[
				{
					type = ApplyHeelDifference
					id = Heel
					[
						{
							type = Ik
							two_bone_chains = ik_params
							id = Ik
							[
								{
									type = TweakBones
									id = TweakBonesNode
									[
										{
											type = PartialSwitch
											state = on
											[
												{
													type = DegenerateBlend
													id = Face
												}
												{
													type = applydifference
													id = LeftHandPartial
													[
														{
															$hero_arm_branch
														}
														{
															type = Switch
															state = off
															id = moment_blend
															[
																{
																	type = ApplyFemaleDifference
																	id = MaleAnimAdjust_Moment
																	Anim = GH_Rocker_Female_GuitarRaise_D
																	[
																		{
																			type = DegenerateBlend
																			id = moment_branch
																		}
																	]
																}
																{
																	type = ApplyFemaleDifference
																	id = MaleAnimAdjust
																	Anim = GH_Rocker_Female_GuitarRaise_D
																	[
																		{
																			type = DegenerateBlend
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
	type = ConstraintBones
	ConstraintBones = hero_ConstraintBones
	[
		{
			type = ragdoll
			[
				{
					type = ApplyHeelDifference
					id = Heel
					[
						{
							type = Ik
							two_bone_chains = ik_params
							id = Ik
							[
								{
									type = TweakBones
									id = TweakBonesNode
									[
										{
											type = PartialSwitch
											state = on
											[
												{
													type = tensionstorage
													min_stress_anim = TEST_character_NM_Min_D
													max_stress_anim = TEST_character_NM_Max_D
													[
														{
															type = DegenerateBlend
															id = Face
														}
													]
												}
												{
													type = applydifference
													id = LeftHandPartial
													[
														{
															$hero_arm_branch
														}
														{
															type = Switch
															state = off
															id = moment_blend
															[
																{
																	type = ApplyFemaleDifference
																	id = MaleAnimAdjust_Moment
																	Anim = GH_Rocker_Female_GuitarRaise_D
																	[
																		{
																			type = DegenerateBlend
																			id = moment_branch
																		}
																	]
																}
																{
																	type = ApplyFemaleDifference
																	id = MaleAnimAdjust
																	Anim = GH_Rocker_Female_GuitarRaise_D
																	[
																		{
																			type = DegenerateBlend
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
	type = ConstraintBones
	ConstraintBones = hero_ConstraintBones
	[
		{
			type = ragdoll
			[
				{
					type = ApplyHeelDifference
					id = Heel
					[
						{
							type = Ik
							two_bone_chains = ik_params
							id = Ik
							[
								{
									type = ApplyFemaleDifference
									id = MaleAnimAdjust
									Anim = GH_Rocker_Female_GuitarRaise_D
									[
										{
											type = ApplyFemaleDrummerDifference
											id = FemaleDiff
											[
												{
													type = TweakBones
													id = TweakBonesNode
													[
														{
															type = PartialSwitch
															state = on
															[
																{
																	type = DegenerateBlend
																	id = Face
																}
																{
																	type = applydifference
																	id = LeftHandPartial
																	[
																		{
																			$hero_arm_branch
																		}
																		{
																			type = DegenerateBlend
																			type = PartialSwitch
																			state = off
																			id = moment_blend
																			[
																				{
																					type = DegenerateBlend
																					id = moment_branch
																				}
																				{
																					type = DegenerateBlend
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
	type = Add
	[
		{
			type = Add
			[
				{
					type = modulate
					strength = 1.0
					id = fret_anim_mod
					[
						{
							type = DegenerateBlend
							id = LeftArm
						}
					]
				}
				{
					type = modulate
					strength = 1.0
					id = chord_anim_mod
					[
						{
							type = DegenerateBlend
							id = LeftHand
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
					type = DegenerateBlend
					id = RightArm
				}
			]
		}
	]
}
hero_body_branch = {
	type = timer_type
	id = BodyTimer
	Anim = anim_name
	Speed = Speed
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
			Anim = anim_name
		}
	]
}
hero_moment_branch = {
	type = timer_type
	id = momenttimer
	Anim = anim_name
	Speed = Speed
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
			Anim = anim_name
		}
	]
}
hero_strumming_branch = {
	type = Play
	id = StrumTimer
	Anim = strum_name
	[
		{
			type = Source
			Anim = strum_name
		}
	]
}
hero_fret_branch = {
	type = Play
	id = FretTimer
	Anim = fret_anim
	[
		{
			type = Source
			Anim = fret_anim
		}
	]
}
hero_finger_branch = {
	type = Play
	id = FingerTimer
	Anim = finger_anim
	[
		{
			type = Source
			Anim = finger_anim
		}
	]
}
hero_face_branch = {
	type = Play
	id = FacialTimer
	Anim = facial_anim
	[
		{
			type = FacialHackSource
			Anim = facial_anim
		}
	]
}
vocalist_face_branch = {
	type = PlayNoDurationBlending
	id = FacialTimer
	Anim = facial_anim
	[
		{
			type = FacialHackSource
			Anim = facial_anim
		}
	]
}
hero_play_branch = {
	type = Play
	id = timer_id
	Anim = anim_name
	[
		{
			type = Source
			Anim = anim_name
		}
	]
}
hero_empty_branch = {
	type = Blank
}
hero_drumming_branch = {
	type = timer_type
	id = timer_id
	Anim = anim_name
	Speed = Speed
	[
		{
			type = Source
			Anim = anim_name
		}
	]
}
vocalist_static_tree = {
	type = ConstraintBones
	ConstraintBones = hero_ConstraintBones
	[
		{
			type = ragdoll
			[
				{
					type = Ik
					two_bone_chains = Singer_IK_Params_Arms
					id = Ik
					[
						{
							type = ApplyHeelDifference
							id = Heel
							[
								{
									type = Ik
									two_bone_chains = Singer_IK_Params_Legs
									id = Ik
									[
										{
											type = TweakBones
											id = TweakBonesNode
											[
												{
													type = PartialSwitch
													state = on
													[
														{
															type = modulate
															id = vocal_face_mod
															strength = 1
															[
																{
																	type = DegenerateBlend
																	id = Face
																}
															]
														}
														{
															type = Switch
															state = off
															id = moment_blend
															[
																{
																	type = DegenerateBlend
																	id = moment_branch
																}
																{
																	type = DegenerateBlend
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
	type = ConstraintBones
	ConstraintBones = hero_ConstraintBones
	[
		{
			type = ragdoll
			[
				{
					type = Ik
					two_bone_chains = Singer_IK_Params_Arms
					id = Ik
					[
						{
							type = ApplyHeelDifference
							id = Heel
							[
								{
									type = Ik
									two_bone_chains = Singer_IK_Params_Legs
									id = Ik
									[
										{
											type = TweakBones
											id = TweakBonesNode
											[
												{
													type = PartialSwitch
													state = on
													[
														{
															type = modulate
															id = vocal_face_mod
															strength = 1
															[
																{
																	type = tensionstorage
																	min_stress_anim = TEST_character_NM_Min_D
																	max_stress_anim = TEST_character_NM_Max_D
																	[
																		{
																			type = DegenerateBlend
																			id = Face
																		}
																	]
																}
															]
														}
														{
															type = Switch
															state = off
															id = moment_blend
															[
																{
																	type = DegenerateBlend
																	id = moment_branch
																}
																{
																	type = DegenerateBlend
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
	type = ConstraintBones
	ConstraintBones = hero_ConstraintBones
	[
		{
			type = ragdoll
			[
				{
					type = ApplyHeelDifference
					id = Heel
					[
						{
							type = Ik
							two_bone_chains = drummer_IK_params
							id = Ik
							[
								{
									type = ApplyFemaleDrummerDifference
									id = FemaleDiff
									[
										{
											type = TweakBones
											id = TweakBonesNode
											[
												{
													type = PartialSwitch
													state = on
													[
														{
															type = DegenerateBlend
															id = Face
														}
														{
															type = Switch
															state = off
															id = faceoff_blend
															[
																{
																	type = DegenerateBlend
																	id = faceoff_branch
																}
																{
																	type = ApplyDrumKitDifference
																	id = DrumKit
																	drum_kit_channel_list = $drum_kit_channel_list
																	[
																		{
																			type = Switch
																			state = off
																			id = moment_blend
																			[
																				{
																					type = DegenerateBlend
																					id = moment_branch
																				}
																				{
																					type = DegenerateBlend
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
	type = timer_type
	id = moment_timer
	Anim = anim_name
	Speed = Speed
	start = start
	end = end
	skip_beats = skip_beats
	tempo_anim = tempo_anim
	anim_events = on
	[
		{
			type = source_type
			Anim = anim_name
		}
	]
}
hero_cymbal_branch = {
	type = Play
	id = cymbal_timer_id
	Anim = cymbal_anim
	[
		{
			type = Source
			Anim = cymbal_anim
		}
	]
}
drum_kit_channel_list = [
	{
		name = tom_1
		bones = [
			Bone_Mic_Adjust_Height
		]
	}
	{
		name = tom_2
		bones = [
			Bone_Mic_Adjust_Angle
		]
	}
	{
		name = snare
		bones = [
			Bone_Mic_Stand
		]
	}
	{
		name = cymbal_hh
		bones = [
			Bone_Guitar_String_2
			Bone_Guitar_String_3
			Bone_Guitar_String_4
		]
	}
	{
		name = cymbal_1
		bones = [
			Bone_IK_Hand_Guitar_L
		]
	}
	{
		name = cymbal_2
		bones = [
			Bone_IK_Hand_Guitar_R
		]
	}
	{
		name = cymbal_3
		bones = [
			Bone_Guitar_String_1
		]
	}
	{
		name = kick
		bones = [
			Bone_Thigh_R
			Bone_Toe_R
			Bone_IK_Foot_Slave_R
			Bone_Guitar_String_5
			Bone_Guitar_String_6
			Bone_Mic_Adjust_Height
			Bone_Mic_Adjust_Angle
			Bone_Mic_Microphone
		]
	}
]
empty_ik_params = [
]
CAR_IK_Params = [
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
		NewTarget = Bone_IK_Hand_Slave_R
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
		NewTarget = Bone_IK_Hand_Slave_L
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
Hero_Feet_IK_Params = [
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
Singer_IK_Params_Arms = [
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
Singer_IK_Params_Legs = [
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
drummer_IK_params = [
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
Guitar_IK_Params = [
	{
		bone0 = Bone_Bicep_R
		bone1 = Bone_Forearm_R
		bone2 = Bone_Palm_R
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Hand_Guitar_R
		NewTarget = Bone_IK_Hand_Slave_R
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
		NewTarget = Bone_IK_Hand_Slave_L
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
		type = Twistchild
		bone = Bone_Twist_Wrist_L
		target = Bone_Palm_L
		amount = 0.5
	}
	{
		type = Twistchild
		bone = Bone_Twist_Wrist_R
		target = Bone_Palm_R
		amount = 0.5
	}
	{
		type = Twist
		bone = Bone_Twist_Bicep_Mid_R
		target = Bone_Bicep_R
		amount = 0.5
	}
	{
		type = Twist
		bone = Bone_Twist_Bicep_Mid_L
		target = Bone_Bicep_L
		amount = 0.5
	}
	{
		type = Twist
		bone = Bone_Twist_Bicep_Top_R
		target = Bone_Bicep_R
		amount = 1.0
	}
	{
		type = Twist
		bone = Bone_Twist_Bicep_Top_L
		target = Bone_Bicep_L
		amount = 1.0
	}
	{
		type = twistthigh
		bone = Bone_Twist_Thigh_R
		target = Bone_Thigh_R
		amount = 1.0
	}
	{
		type = twistthigh
		bone = Bone_Twist_Thigh_L
		target = Bone_Thigh_L
		amount = 1.0
	}
	{
		type = SplitR
		bone = Bone_Split_Ass_R
		target = Bone_Twist_Thigh_R
		amount = 0.5
	}
	{
		type = SplitR
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
	GH4_Singer_Male_OzzyFace_1
	GH4_Singer_Male_OzzyFace_2
	GH4_Singer_Male_OzzyFace_3
	GH4_Singer_Male_AboutAGirl_1
	GH4_Singer_Male_AboutAGirl_2
	GH4_Singer_Male_AboutAGirl_3
	GH4_Singer_Male_Aggro_1
	GH4_Singer_Male_Aggro_2
	GH4_Singer_Male_Aggro_3
	GH4_Singer_Male_Aggro_4
	GH4_Singer_Male_Aggro_5
	GH4_Singer_Male_AmericanWoman_1
	GH4_Singer_Male_AmericanWoman_2
	GH4_Singer_Male_AmericanWoman_3
	GH4_Singer_Male_AmericanWoman_4
	GH4_Singer_Male_AmericanWoman_5
	GH4_Singer_Male_AmericanWoman_6
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
	GH4_Singer_Male_AreYouGonnaGo_1
	GH4_Singer_Male_AreYouGonnaGo_1B
	GH4_Singer_Male_AreYouGonnaGo_2
	GH4_Singer_Male_AreYouGonnaGo_2B
	GH4_Singer_Male_AreYouGonnaGo_3
	GH4_Singer_Male_AreYouGonnaGo_4
	GH4_Singer_Male_AreYouGonnaGo_5
	GH4_Singer_Male_Assassin_1
	GH4_Singer_Male_Assassin_1b
	GH4_Singer_Male_Assassin_2
	GH4_Singer_Male_Assassin_2b
	GH4_Singer_Male_Assassin_3
	GH4_Singer_Male_Assassin_3b
	gh4_singer_male_badtothebone_1
	gh4_singer_male_badtothebone_2
	gh4_singer_male_badtothebone_3
	gh4_singer_male_badtothebone_4
	GH4_Singer_Male_BandOnTheRun_1
	GH4_Singer_Male_BandOnTheRun_2
	GH4_Singer_Male_BandOnTheRun_2b
	GH4_Singer_Male_BandOnTheRun_3
	GH4_Singer_Male_BandOnTheRun_3b
	GH4_Singer_Male_BandOnTheRun_4
	GH4_Singer_Male_BandOnTheRun_4b
	GH4_Singer_Male_BandOnTheRun_5
	GH4_Singer_Male_BandOnTheRun_5b
	GH4_Singer_Male_BandOnTheRun_6
	GH4_Singer_Male_BandOnTheRun_6b
	GH4_Singer_Male_BandOnTheRun_7
	GH4_Singer_Male_BandOnTheRun_8
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
	GH4_Singer_Male_BeautifulDis_1
	GH4_Singer_Male_BeautifulDis_1b
	GH4_Singer_Male_BeautifulDis_2
	GH4_Singer_Male_BeautifulDis_2b
	GH4_Singer_Male_BeautifulDis_3
	GH4_Singer_Male_BeautifulDis_3b
	GH4_Singer_Male_BeautifulDis_4
	GH4_Singer_Male_BeautifulDis_4b
	GH4_Singer_Male_BeautifulDis_5
	GH4_Singer_Male_BeautifulDis_5b
	GH4_Singer_Male_BYOB_1
	GH4_Singer_Male_BYOB_1B
	GH4_Singer_Male_BYOB_2
	GH4_Singer_Male_BYOB_2B
	GH4_Singer_Male_BYOB_3
	GH4_Singer_Male_BYOB_3B
	GH4_Singer_Male_BYOB_4
	GH4_Singer_Male_BYOB_4B
	GH4_Singer_Male_BYOB_5
	GH4_Singer_Male_BYOB_5B
	GH4_Singer_Male_BYOB_6
	GH4_Singer_Male_BYOB_6B
	GH4_Singer_Male_BYOB_7
	GH4_Singer_Male_BYOB_7B
	GH4_Singer_Male_BYOB_8
	GH4_Singer_Male_BYOB_8B
	GH4_Singer_Male_CrazyTrain_1
	GH4_Singer_Male_CrazyTrain_2
	GH4_Singer_Male_CrazyTrain_3
	GH4_Singer_Male_CrazyTrain_4
	GH4_Singer_Male_CrazyTrain_5
	GH4_Singer_Male_CrazyTrain_6
	gh4_singer_male_dammit_1
	gh4_singer_male_dammit_2
	GH4_Singer_Male_DemolitionMan_1
	GH4_Singer_Male_DemolitionMan_2
	GH4_Singer_Male_DemolitionMan_2b
	GH4_Singer_Male_DemolitionMan_3
	GH4_Singer_Male_DemolitionMan_3b
	GH4_Singer_Male_DemolitionMan_4
	GH4_Singer_Male_DemolitionMan_4b
	GH4_Singer_Male_DemolitionMan_5
	GH4_Singer_Male_DemolitionMan_6
	GH4_Singer_Male_DoItAgain_1
	GH4_Singer_Male_DoItAgain_2
	GH4_Singer_Male_DoItAgain_3
	GH4_Singer_Male_ElectroRock_1
	GH4_Singer_Male_ElectroRock_2
	GH4_Singer_Male_ElectroRock_3
	GH4_Singer_Male_ElectroRock_4
	GH4_Singer_Male_ElectroRock_5
	GH4_Singer_Male_ElectroRock_6
	GH4_Singer_Male_ElectroRock_7
	GH4_Singer_Male_ElectroRock_8
	GH4_Singer_Male_ElectroRock_9
	GH4_Singer_Male_EscuelaDeCalor_1
	GH4_Singer_Male_EscuelaDeCalor_2
	GH4_Singer_Male_EscuelaDeCalor_3
	GH4_Singer_Male_EscuelaDeCalor_4
	GH4_Singer_Male_EscuelaDeCalor_5
	GH4_Singer_Male_EscuelaDeCalor_6
	GH4_Singer_Male_EscuelaDeCalor_6b
	GH4_Singer_Male_EscuelaDeCalor_7
	GH4_Singer_Male_Everlong_1
	GH4_Singer_Male_Everlong_2
	GH4_Singer_Male_Everlong_3
	GH4_Singer_Male_Everlong_4
	GH4_Singer_Male_Everlong_5
	gh4_singer_male_eyeofthetiger_1
	gh4_singer_male_eyeofthetiger_2
	gh4_singer_male_eyeofthetiger_3
	gh4_singer_male_eyeofthetiger_4
	gh4_singer_male_eyeofthetiger_5
	GH4_Singer_Male_FeelThePain_1
	GH4_Singer_Male_FeelThePain_2
	GH4_Singer_Male_FeelThePain_3
	GH4_Singer_Male_FeelThePain_4
	GH4_Singer_Male_FeelThePain_5
	GH4_Singer_Male_FloatOn_1
	GH4_Singer_Male_FloatOn_2
	GH4_Singer_Male_FloatOn_2b
	GH4_Singer_Male_FloatOn_3
	GH4_Singer_Male_FloatOn_4
	GH4_Singer_Male_FloatOn_4b
	GH4_Singer_Male_FloatOn_5
	GH4_Singer_Male_FloatOn_5b
	GH4_Singer_Male_FloatOn_6b
	GH4_Singer_Male_FloatOn_7b
	GH4_Singer_Male_FreakOnALeash_1
	GH4_Singer_Male_FreakOnALeash_1b
	GH4_Singer_Male_FreakOnALeash_2
	GH4_Singer_Male_FreakOnALeash_2b
	GH4_Singer_Male_FreakOnALeash_3
	GH4_Singer_Male_FreakOnALeash_3b
	GH4_Singer_Male_FreakOnALeash_4
	GH4_Singer_Male_FreakOnALeash_5
	GH4_Singer_Male_FreakOnALeash_6
	GH4_Singer_Male_GoYourOwnWay_1
	GH4_Singer_Male_GoYourOwnWay_1b
	GH4_Singer_Male_GoYourOwnWay_2
	GH4_Singer_Male_GoYourOwnWay_2b
	GH4_Singer_Male_GoYourOwnWay_3
	GH4_Singer_Male_GoYourOwnWay_3b
	GH4_Singer_Male_GoYourOwnWay_4
	GH4_Singer_Male_HailToTheFreaks_1
	GH4_Singer_Male_HailToTheFreaks_2
	GH4_Singer_Male_HailToTheFreaks_2b
	GH4_Singer_Male_HailToTheFreaks_3
	GH4_Singer_Male_HailToTheFreaks_3b
	GH4_Singer_Male_HailToTheFreaks_4
	GH4_Singer_Male_HailToTheFreaks_4b
	GH4_Singer_Male_HeyManNiceShot_1
	GH4_Singer_Male_HeyManNiceShot_2
	GH4_Singer_Male_HeyManNiceShot_3
	GH4_Singer_Male_HeyManNiceShot_4
	GH4_Singer_Male_HeyManNiceShot_5
	GH4_Singer_Male_HeyManNiceShot_6
	GH4_Singer_Male_HollywoodNights_1
	GH4_Singer_Male_HollywoodNights_1b
	GH4_Singer_Male_HollywoodNights_2
	GH4_Singer_Male_HollywoodNights_2b
	GH4_Singer_Male_HollywoodNights_3
	GH4_Singer_Male_HollywoodNights_4
	GH4_Singer_Male_HollywoodNights_5
	GH4_Singer_Male_HollywoodNights_6
	GH4_Singer_Male_HollywoodNights_7
	GH4_Singer_Male_HollywoodNights_8
	gh4_singer_male_hotblooded_1
	gh4_singer_male_hotblooded_1b
	gh4_singer_male_hotblooded_2
	gh4_singer_male_hotblooded_2b
	gh4_singer_male_hotblooded_3
	gh4_singer_male_hotblooded_3b
	gh4_singer_male_hotblooded_4
	gh4_singer_male_hotblooded_4b
	gh4_singer_male_hotblooded_5
	GH4_Singer_Male_HotelCalifornia_1
	GH4_Singer_Male_HotelCalifornia_1b
	GH4_Singer_Male_HotelCalifornia_2
	GH4_Singer_Male_HotelCalifornia_2b
	GH4_Singer_Male_HotForTeacher_1
	GH4_Singer_Male_HotForTeacher_1b
	GH4_Singer_Male_HotForTeacher_2
	GH4_Singer_Male_HotForTeacher_2b
	GH4_Singer_Male_HotForTeacher_3
	GH4_Singer_Male_HotForTeacher_3b
	GH4_Singer_Male_HotForTeacher_4
	GH4_Singer_Male_HotForTeacher_5
	GH4_Singer_Male_HotForTeacher_6
	GH4_Singer_Male_HotForTeacher_7
	GH4_Singer_Male_HotForTeacher_8
	GH4_Singer_Male_HotForTeacher_9
	GH4_Singer_Male_JessiesGirl_1
	GH4_Singer_Male_JessiesGirl_1B
	GH4_Singer_Male_JessiesGirl_2
	GH4_Singer_Male_JessiesGirl_2B
	GH4_Singer_Male_JessiesGirl_3
	GH4_Singer_Male_JessiesGirl_3B
	GH4_Singer_Male_JessiesGirl_4
	GH4_Singer_Male_JessiesGirl_4B
	GH4_Singer_Male_JessiesGirl_5
	GH4_Singer_Male_JessiesGirl_6
	GH4_Singer_Male_JessiesGirl_7
	GH4_Singer_Male_Jimi_1
	GH4_Singer_Male_Jimi_2
	GH4_Singer_Male_Jimi_2B
	GH4_Singer_Male_KickOutTheJams_1
	GH4_Singer_Male_KickOutTheJams_1b
	GH4_Singer_Male_KickOutTheJams_2
	GH4_Singer_Male_KickOutTheJams_2b
	GH4_Singer_Male_KickOutTheJams_3
	GH4_Singer_Male_KickOutTheJams_3b
	GH4_Singer_Male_KickOutTheJams_4
	GH4_Singer_Male_KickOutTheJams_4b
	GH4_Singer_Male_KickOutTheJams_5
	GH4_Singer_Male_KickOutTheJams_5b
	GH4_Singer_Male_KickOutTheJams_6
	GH4_Singer_Male_KickOutTheJams_6b
	GH4_Singer_Male_KickOutTheJams_7
	GH4_Singer_Male_KickOutTheJams_7b
	GH4_Singer_Male_KickOutTheJams_8
	GH4_Singer_Male_KickOutTheJams_9
	GH3_Singer_Male_KnightsofCydonia_1
	GH3_Singer_Male_KnightsofCydonia_2
	GH4_Singer_Male_LaBamba_1
	GH4_Singer_Male_LaBamba_1B
	GH4_Singer_Male_LaBamba_2
	GH4_Singer_Male_LaBamba_2B
	GH4_Singer_Male_LaBamba_3
	GH4_Singer_Male_LaBamba_4
	GH4_Singer_Male_LazyEye_1
	GH4_Singer_Male_LazyEye_1b
	GH4_Singer_Male_LazyEye_2
	GH4_Singer_Male_LazyEye_2b
	GH4_Singer_Male_LazyEye_3
	GH4_Singer_Male_LazyEye_4
	GH4_Singer_Male_LazyEye_5
	GH4_Singer_Male_LazyEye_6
	GH4_Singer_Male_LazyEye_7
	GH4_Singer_Male_LivingOnAPrayer_1
	GH4_Singer_Male_LivingOnAPrayer_1b
	GH4_Singer_Male_LivingOnAPrayer_2
	GH4_Singer_Male_LivingOnAPrayer_2b
	GH4_Singer_Male_LivingOnAPrayer_3
	GH4_Singer_Male_LivingOnAPrayer_3b
	GH4_Singer_Male_LivingOnAPrayer_4
	GH4_Singer_Male_LivingOnAPrayer_4b
	GH4_Singer_Male_LivingOnAPrayer_5
	GH4_Singer_Male_LivingOnAPrayer_5b
	GH4_Singer_Male_LivingOnAPrayer_6
	GH4_Singer_Male_LivingOnAPrayer_7
	gh4_singer_male_lovemetwotimes_1
	gh4_singer_male_lovemetwotimes_2
	gh4_singer_male_lovemetwotimes_3
	gh4_singer_male_lovemetwotimes_4
	GH4_Singer_Male_LoveRemoval_1
	GH4_Singer_Male_LoveRemoval_1B
	GH4_Singer_Male_LoveRemoval_2
	GH4_Singer_Male_LoveRemoval_2B
	GH4_Singer_Male_LoveRemoval_3
	GH4_Singer_Male_LoveRemoval_3B
	GH4_Singer_Male_LoveRemoval_4
	GH4_Singer_Male_LoveRemoval_5
	GH4_Singer_Male_LoveRemoval_6
	GH4_Singer_Male_LoveRemoval_7
	GH4_Singer_Male_LoveRemoval_8
	GH4_Singer_Male_LoveSpreads_1
	GH4_Singer_Male_LoveSpreads_1b
	GH4_Singer_Male_LoveSpreads_2
	GH4_Singer_Male_LoveSpreads_3
	GH4_Singer_Male_LoveSpreads_3b
	GH4_Singer_Male_LoveSpreads_4
	GH4_Singer_Male_LoveSpreads_5
	GH4_Singer_Male_LoveSpreads_5b
	GH4_Singer_Male_LoveSpreads_5c
	GH4_Singer_Male_LViaLViaquez_1
	GH4_Singer_Male_LViaLViaquez_10
	GH4_Singer_Male_LViaLViaquez_1b
	GH4_Singer_Male_LViaLViaquez_2
	GH4_Singer_Male_LViaLViaquez_2b
	GH4_Singer_Male_LViaLViaquez_3
	GH4_Singer_Male_LViaLViaquez_3b
	GH4_Singer_Male_LViaLViaquez_4
	GH4_Singer_Male_LViaLViaquez_4b
	GH4_Singer_Male_LViaLViaquez_5
	GH4_Singer_Male_LViaLViaquez_5b
	GH4_Singer_Male_LViaLViaquez_6
	GH4_Singer_Male_LViaLViaquez_6b
	GH4_Singer_Male_LViaLViaquez_7
	GH4_Singer_Male_LViaLViaquez_7b
	GH4_Singer_Male_LViaLViaquez_8
	GH4_Singer_Male_LViaLViaquez_8b
	GH4_Singer_Male_LViaLViaquez_9
	GH4_Singer_Male_Monsoon_1
	GH4_Singer_Male_Monsoon_10
	GH4_Singer_Male_Monsoon_1b
	GH4_Singer_Male_Monsoon_2
	GH4_Singer_Male_Monsoon_2b
	GH4_Singer_Male_Monsoon_3
	GH4_Singer_Male_Monsoon_3b
	GH4_Singer_Male_Monsoon_4
	GH4_Singer_Male_Monsoon_5
	GH4_Singer_Male_Monsoon_6
	GH4_Singer_Male_Monsoon_7
	GH4_Singer_Male_Monsoon_8
	GH4_Singer_Male_Monsoon_9
	GH4_Singer_Male_MountainSong_1
	GH4_Singer_Male_MountainSong_10
	GH4_Singer_Male_MountainSong_2
	GH4_Singer_Male_MountainSong_3
	GH4_Singer_Male_MountainSong_4
	GH4_Singer_Male_MountainSong_5
	GH4_Singer_Male_MountainSong_6
	GH4_Singer_Male_MountainSong_7
	GH4_Singer_Male_MountainSong_8
	GH4_Singer_Male_MountainSong_9
	GH4_Singer_Male_MrCrowley_1
	GH4_Singer_Male_MrCrowley_2
	GH4_Singer_Male_MrCrowley_3
	GH3_Singer_Male_MyCurse_1
	GH3_Singer_Male_MyCurse_1b
	GH3_Singer_Male_MyCurse_2
	GH3_Singer_Male_MyCurse_2b
	GH3_Singer_Male_MyCurse_3
	GH3_Singer_Male_MyCurse_4
	GH3_Singer_Male_MyCurse_5
	GH4_Singer_Male_NeverTooLate_1
	GH4_Singer_Male_NeverTooLate_1b
	GH4_Singer_Male_NeverTooLate_2
	GH4_Singer_Male_NeverTooLate_2b
	GH4_Singer_Male_NeverTooLate_3
	GH4_Singer_Male_NeverTooLate_3b
	GH4_Singer_Male_NeverTooLate_4
	GH4_Singer_Male_NeverTooLate_4b
	GH4_Singer_Male_NeverTooLate_5
	GH4_Singer_Male_NeverTooLate_5b
	GH4_Singer_Male_NeverTooLate_6
	GH4_Singer_Male_NeverTooLate_6b
	GH4_Singer_Male_NeverTooLate_7
	GH4_Singer_Male_NoRain_1
	GH4_Singer_Male_NoRain_1B
	GH4_Singer_Male_NoRain_2
	GH4_Singer_Male_NoRain_2B
	GH4_Singer_Male_NoRain_3
	GH4_Singer_Male_NoRain_3B
	GH4_Singer_Male_NoRain_4
	GH4_Singer_Male_NoRain_4B
	GH4_Singer_Male_NoRain_5
	GH4_Singer_Male_NoSleepTill_1
	GH4_Singer_Male_NoSleepTill_1b
	GH4_Singer_Male_NoSleepTill_2
	GH4_Singer_Male_NoSleepTill_2b
	GH4_Singer_Male_NoSleepTill_3
	GH4_Singer_Male_NoSleepTill_3b
	GH4_Singer_Male_NoSleepTill_4
	GH4_Singer_Male_NoSleepTill_4b
	GH4_Singer_Male_NoSleepTill_5
	GH4_Singer_Male_NoSleepTill_5b
	GH4_Singer_Male_NoSleepTill_6
	GH4_Singer_Male_NoSleepTill_6b
	GH4_Singer_Male_NoSleepTill_7
	GH4_Singer_Male_NoSleepTill_7b
	GH4_Singer_Male_NoSleepTill_8
	GH4_Singer_Male_NoSleepTill_8b
	GH4_Singer_Male_Nuvole_1
	GH4_Singer_Male_Nuvole_1b
	GH4_Singer_Male_Nuvole_2
	GH4_Singer_Male_Nuvole_2b
	GH4_Singer_Male_Nuvole_3
	GH4_Singer_Male_Nuvole_4
	GH4_Singer_Male_Nuvole_5
	GH4_Singer_Male_Obstacle1_1
	GH4_Singer_Male_Obstacle1_1b
	GH4_Singer_Male_Obstacle1_2
	GH4_Singer_Male_Obstacle1_2b
	GH4_Singer_Male_Obstacle1_3
	GH4_Singer_Male_Obstacle1_4
	GH4_Singer_Male_Obstacle1_5
	GH4_Singer_Male_Obstacle1_6
	GH4_Singer_Male_Obstacle1_7
	GH4_Singer_Male_OneArmedScissor_1
	GH4_Singer_Male_OneArmedScissor_1b
	GH4_Singer_Male_OneArmedScissor_2
	GH4_Singer_Male_OneArmedScissor_2b
	GH4_Singer_Male_OneArmedScissor_3
	GH4_Singer_Male_OneArmedScissor_3b
	GH4_Singer_Male_OneArmedScissor_4
	GH4_Singer_Male_OneArmedScissor_4b
	GH4_Singer_Male_OneArmedScissor_5
	GH4_Singer_Male_OneArmedScissor_6
	GH4_Singer_Male_OnTheRoad_1
	GH4_Singer_Male_OnTheRoad_2
	GH4_Singer_Male_OnTheRoad_2B
	GH4_Singer_Male_OnTheRoad_3
	GH4_Singer_Male_OnTheRoad_3B
	GH4_Singer_Male_OnTheRoad_4
	GH4_Singer_Male_Overkill_1
	GH4_Singer_Male_Overkill_2
	GH4_Singer_Male_Overkill_3
	gh4_singer_male_prettyvacant_1
	gh4_singer_male_prettyvacant_1b
	gh4_singer_male_prettyvacant_2
	gh4_singer_male_prettyvacant_2b
	gh4_singer_male_prettyvacant_3
	gh4_singer_male_prettyvacant_3b
	gh4_singer_male_prettyvacant_4
	gh4_singer_male_prettyvacant_4b
	gh4_singer_male_prettyvacant_5
	GH4_Singer_Male_PrisonerSociety_1
	GH4_Singer_Male_PrisonerSociety_1B
	GH4_Singer_Male_PrisonerSociety_2
	GH4_Singer_Male_PrisonerSociety_2B
	GH4_Singer_Male_PrisonerSociety_3
	GH4_Singer_Male_PrisonerSociety_3B
	GH4_Singer_Male_PrisonerSociety_4
	GH4_Singer_Male_PrisonerSociety_4B
	GH4_Singer_Male_PrisonerSociety_5
	GH4_Singer_Male_PrisonerSociety_5B
	GH4_Singer_Male_PullMeUnder_1
	GH4_Singer_Male_PullMeUnder_2
	GH4_Singer_Male_PullMeUnder_3
	GH4_Singer_Male_PullMeUnder_4
	GH4_Singer_Male_PullMeUnder_5
	GH4_Singer_Male_PullMeUnder_6
	GH4_Singer_Male_PullMeUnder_7
	GH4_Singer_Male_PullMeUnder_8
	GH4_Singer_Male_PurpleHaze_1
	GH4_Singer_Male_PurpleHaze_2
	GH4_Singer_Male_PurpleHaze_3
	GH4_Singer_Male_PurpleHaze_4
	GH4_Singer_Male_RamblinMan_1
	GH4_Singer_Male_RamblinMan_1B
	GH4_Singer_Male_RamblinMan_2
	GH4_Singer_Male_RamblinMan_2B
	GH4_Singer_Male_RamblinMan_3
	GH4_Singer_Male_RamblinMan_4
	GH4_Singer_Male_RebelYell_1
	GH4_Singer_Male_RebelYell_2
	GH4_Singer_Male_RebelYell_3
	GH4_Singer_Male_RebelYell_4
	GH4_Singer_Male_RebelYell_5
	GH4_Singer_Male_ReEdThroughLabor_1
	GH4_Singer_Male_ReEdThroughLabor_2
	GH4_Singer_Male_ReEdThroughLabor_3
	GH4_Singer_Male_ReEdThroughLabor_4
	GH4_Singer_Male_ReEdThroughLabor_5
	GH4_Singer_Male_Revolution_1
	GH4_Singer_Male_Revolution_2
	gh4_singer_male_revolutiongeorge_1
	gh4_singer_male_revolutiongeorge_2
	gh4_singer_male_revolutiongeorge_3
	GH4_Singer_Male_RevolutionPaul_1
	GH4_Singer_Male_RevolutionPaul_2
	GH4_Singer_Male_RevolutionPaul_3
	gh4_singer_male_rockandrollband_1
	gh4_singer_male_rockandrollband_2
	gh4_singer_male_rockandrollband_3
	gh4_singer_male_rockandrollband_4
	gh4_singer_male_rockandrollband_5
	gh4_singer_male_rockandrollband_6
	GH4_Singer_Male_Rooftops_1
	GH4_Singer_Male_Rooftops_2
	GH4_Singer_Male_Rooftops_2b
	GH4_Singer_Male_Rooftops_3
	GH4_Singer_Male_Rooftops_3b
	GH4_Singer_Male_Rooftops_4
	GH4_Singer_Male_Rooftops_4b
	GH4_Singer_Male_Rooftops_5
	GH4_Singer_Male_Santeria_1
	GH4_Singer_Male_Santeria_2
	GH4_Singer_Male_ScreamAimFire_1
	GH4_Singer_Male_ScreamAimFire_1b
	GH4_Singer_Male_ScreamAimFire_2
	GH4_Singer_Male_ScreamAimFire_3
	GH4_Singer_Male_ScreamAimFire_4
	GH4_Singer_Male_ScreamAimFire_5
	GH4_Singer_Male_ScreamAimFire_6
	GH4_Singer_Male_SgtPeppers_1
	GH4_Singer_Male_SgtPeppers_2
	GH4_Singer_Male_SgtPeppersGeorge_1
	GH4_Singer_Male_SgtPeppersJohn_1
	GH4_Singer_Male_SgtPeppersJohn_2
	GH4_Singer_Male_Shiver_1
	GH4_Singer_Male_Shiver_2
	GH4_Singer_Male_Shiver_3
	GH4_Singer_Male_Shiver_4
	GH4_Singer_Male_Shiver_5
	GH4_Singer_Male_Shiver_6
	GH4_Singer_Male_Shiver_7
	GH4_Singer_Male_SomeMightSay_1
	GH4_Singer_Male_SomeMightSay_1b
	GH4_Singer_Male_SomeMightSay_2
	GH4_Singer_Male_SomeMightSay_2b
	GH4_Singer_Male_SomeMightSay_3
	GH4_Singer_Male_SomeMightSay_3b
	GH4_Singer_Male_SomeMightSay_4
	GH4_Singer_Male_SomeMightSay_5
	gh4_singer_male_songname_1
	GH4_Singer_Male_SoulDoubt_1
	GH4_Singer_Male_SoulDoubt_1b
	GH4_Singer_Male_SoulDoubt_2
	GH4_Singer_Male_SoulDoubt_2b
	GH4_Singer_Male_SoulDoubt_3
	GH4_Singer_Male_SoulDoubt_3b
	GH4_Singer_Male_SoulDoubt_4
	GH4_Singer_Male_SoulDoubt_4b
	GH4_Singer_Male_SoulDoubt_5
	GH4_Singer_Male_Stillborn_1
	GH4_Singer_Male_Stillborn_2
	GH4_Singer_Male_Stillborn_3
	GH4_Singer_Male_Stranglehold_1
	GH4_Singer_Male_Stranglehold_2
	GH4_Singer_Male_Stranglehold_3
	GH4_Singer_Male_Stranglehold_4
	GH4_Singer_Male_Stranglehold_5
	GH4_Singer_Male_Stranglehold_6
	GH4_Singer_Male_SweetHome_1
	GH4_Singer_Male_SweetHome_2
	GH4_Singer_Male_SweetHome_2B
	GH4_Singer_Male_SweetHome_3
	GH4_Singer_Male_SweetHome_3B
	GH4_Singer_Male_SweetHome_4
	GH4_Singer_Male_SweetHome_4B
	GH4_Singer_Male_SweetHome_5
	GH4_Singer_Male_SweetHome_6
	GH4_Singer_Male_SweetHome_6B
	GH4_Singer_Male_SweetHome_7
	GH4_Singer_Male_SweetHome_8
	GH4_Singer_Male_SweetHome_9
	GH4_Singer_Male_TheJoker_1
	GH4_Singer_Male_TheJoker_2
	GH4_Singer_Male_TheJoker_3
	GH4_Singer_Male_TheJoker_4
	GH4_Singer_Male_TheJoker_5
	GH4_Singer_Male_TheKill_1
	GH4_Singer_Male_TheKill_1b
	GH4_Singer_Male_TheKill_2
	GH4_Singer_Male_TheKill_2b
	GH4_Singer_Male_TheKill_3
	GH4_Singer_Male_TheKill_3b
	GH4_Singer_Male_TheKill_4
	GH4_Singer_Male_TheKill_4b
	GH4_Singer_Male_TheKill_5
	GH4_Singer_Male_TheKill_5b
	GH4_Singer_Male_TheMiddle_1
	GH4_Singer_Male_TheMiddle_1B
	GH4_Singer_Male_TheMiddle_2
	GH4_Singer_Male_TheMiddle_2B
	GH4_Singer_Male_TheMiddle_3B
	GH4_Singer_Male_TheMiddle_4B
	GH4_Singer_Male_TheOneILove_1
	GH4_Singer_Male_TheOneILove_1B
	GH4_Singer_Male_TheOneILove_2
	GH4_Singer_Male_TheOneILove_2B
	GH4_Singer_Male_TheOneILove_3
	GH4_Singer_Male_Today_1
	GH4_Singer_Male_Today_2
	GH4_Singer_Male_Today_3
	GH4_Singer_Male_Today_4
	GH4_Singer_Male_TooMuchToo_1
	GH4_Singer_Male_TooMuchToo_2
	GH4_Singer_Male_TooMuchToo_2b
	GH4_Singer_Male_TooMuchToo_3
	GH4_Singer_Male_TooMuchToo_4
	GH4_Singer_Male_TooMuchToo_4b
	GH4_Singer_Male_TooMuchToo_4c
	GH4_Singer_Male_TooMuchToo_5
	GH4_Singer_Male_TooMuchToo_5b
	GH4_Singer_Male_ToyBoy_1
	GH4_Singer_Male_ToyBoy_2
	GH4_Singer_Male_ToyBoy_3
	GH4_Singer_Male_ToyBoy_4
	GH4_Singer_Male_ToyBoy_5
	GH4_Singer_Male_ToyBoy_6
	GH4_Singer_Male_ToyBoy_7
	GH4_Singer_Male_ToyBoy_8
	GH4_Singer_Male_TrappedUnderIce_1
	GH4_Singer_Male_TrappedUnderIce_1b
	GH4_Singer_Male_TrappedUnderIce_2
	GH4_Singer_Male_TrappedUnderIce_2b
	GH4_Singer_Male_TrappedUnderIce_3
	GH4_Singer_Male_TrappedUnderIce_3b
	GH4_Singer_Male_TrappedUnderIce_4
	GH4_Singer_Male_TrappedUnderIce_4b
	GH4_Singer_Male_TwistAndShout_1
	GH4_Singer_Male_TwistAndShout_1B
	GH4_Singer_Male_TwistAndShout_2
	GH4_Singer_Male_TwistAndShout_2B
	GH4_Singer_Male_TwistAndShout_3B
	GH4_Singer_Male_UpAroundTheBend_1
	GH4_Singer_Male_UpAroundTheBend_1B
	GH4_Singer_Male_UpAroundTheBend_2
	GH4_Singer_Male_UpAroundTheBend_2B
	GH4_Singer_Male_UpAroundTheBend_3
	GH4_Singer_Male_UpAroundTheBend_4
	GH4_Singer_Male_UpAroundTheBend_5
	GH4_Singer_Male_Vinternoll2_1
	GH4_Singer_Male_Vinternoll2_1b
	GH4_Singer_Male_Vinternoll2_2
	GH4_Singer_Male_Vinternoll2_2b
	GH4_Singer_Male_Vinternoll2_3
	GH4_Singer_Male_Vinternoll2_3b
	GH4_Singer_Male_Vinternoll2_4
	GH4_Singer_Male_Vinternoll2_5
	GH4_Singer_Male_Vinternoll2_6
	GH4_Singer_Male_Vinternoll2_7
	GH4_Singer_Male_Vinternoll2_8
	GH4_Singer_Male_WeaponOfChoice_1
	GH4_Singer_Male_WeaponOfChoice_2
	GH4_Singer_Male_WeaponOfChoice_3
	GH4_Singer_Male_WeaponOfChoice_4
	GH4_Singer_Male_WhatIveDone_1
	GH4_Singer_Male_WhatIveDone_1b
	GH4_Singer_Male_WhatIveDone_2
	GH4_Singer_Male_WindCriesMary_1
	GH4_Singer_Male_WindCriesMary_2
	GH4_Singer_Male_WindCriesMary_3
	GH4_Singer_Male_WindCriesMary_4
	GH4_Singer_Male_YoureGonnaSay_1
	GH4_Singer_Male_YoureGonnaSay_2
	GH4_Singer_Male_YoureGonnaSay_3
	GH4_Singer_Male_YoureGonnaSay_4
	GH4_Singer_Male_YoureGonnaSay_5
	GH4_Singer_Male_YoureGonnaSay_6
	GH4_Singer_Male_YourFace_1
	GH4_Singer_Male_YourFace_2
	GH4_Singer_Male_YourFace_3
	GH4_Singer_Male_YourFace_4
	GH4_Singer_Male_YourFace_5
	GH4_Singer_Male_YourFace_6
	gh_rocker_male_hardrockface_2
	gh_rocker_male_hardrockface_4
	gh_rocker_male_hardrockface_5
	gh_rocker_male_hardrockface_6
	gh_rocker_male_happy_1
]
