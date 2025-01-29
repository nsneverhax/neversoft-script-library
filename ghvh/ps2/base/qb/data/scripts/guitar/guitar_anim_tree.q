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
guitarist_appearance = {
}
bassist_appearance = {
}
vocalist_appearance = {
}
drummer_appearance = {
}

script create_band_member \{Name = GUITARIST
		LightGroup = Band
		async = 0
		Pos = (0.0, 0.0, 0.0)
		Dir = (0.0, 0.0, 1.0)}
	RemoveParameter \{profile_struct}
	ps2_get_musician_context_data Name = <Name>
	create_band_member_wait_for_lock

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
	if NOT GotParam \{no_appearance_pak_load}
		unloadappearancepaks appearance = ($<bandmember_appearance>) asset_context = <asset_heap> async = <async>
		Change GlobalName = <bandmember_appearance> NewValue = {}
	endif
	if NOT GotParam \{asset_heap}
		asset_heap = heap_musician_anim
	endif
	anim_asset_context = <asset_heap>
	if get_key_from_appearance key = anim_struct appearance = (<Profile>.appearance)
		if GotParam \{loading_into_song}
			get_anim_struct_member anim_struct = <anim_struct> loading_into_song = <loading_into_song> member = <instrument>
		else
		endif
		if NOT StructureContains structure = ($<anim_struct>) anim_asset_context

		endif
		anim_asset_context = (($<anim_struct>).anim_asset_context)
	else

	endif
	RemoveParameter \{highway_texture}
	if GotParam \{loading_into_song}
		if GotParam \{player_status}
			if NOT (($<player_status>.part) = vocals)
				if NOT get_highway_struct_from_appearance part = ($<player_status>.part) appearance = (<Profile>.appearance)

				endif
				if (($is_attract_mode = 1) || ((<Profile>.Name) = emptyguy))
					highway_pak = highway_axel
					highway_texture = highway_axel
				endif
				if ($cheat_blackhighway = 1)
					highway_pak = highway_black
					highway_texture = highway_black
				endif
				mpm_object_load_pak pak = <highway_pak> owner = <Name> async = <async>
			endif
		else
			if ((<Profile>.Name) = jimi)
				if (<Name> = vocalist)
					if NOT get_highway_struct_from_appearance part = <instrument> appearance = (<Profile>.appearance)

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
	get_key_from_appearance key = ik_params appearance = (<Profile>.appearance)
	if GotParam \{loading_into_song}
		switch (<instrument>)
			case vocals
			if get_key_from_appearance key = ik_params_vocals appearance = (<Profile>.appearance)
				ik_params = <ik_params_vocals>

			endif
			case drum
			if get_key_from_appearance key = ik_params_drum appearance = (<Profile>.appearance)
				ik_params = <ik_params_drum>

			endif
			default
			if get_key_from_appearance key = ik_params_guitar appearance = (<Profile>.appearance)
				ik_params = <ik_params_guitar>

			endif
		endswitch
	else
		if get_key_from_appearance key = ik_params_frontend appearance = (<Profile>.appearance)
			ik_params = <ik_params_frontend>

		endif
	endif
	if GotParam \{player_status}
		if GotParam \{highway_texture}
			Change structurename = <player_status> highway_texture = <highway_texture>
		endif
		Change structurename = <player_status> band_member = <Name>
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
	temp_instrument = <instrument>
	if GotParam \{no_instrument_pak_load}
		temp_instrument = None
	endif
	if GotParam \{loading_into_song}
		maybe_use_song_or_venue_specific_instrument {song = $current_song venue = $current_level appearance = (<Profile>.appearance) Name = (<Profile>.Name)}
	else
		<appearance> = (<Profile>.appearance)
	endif
	Change GlobalName = <bandmember_appearance> NewValue = <appearance>
	if NOT GotParam \{no_appearance_pak_load}
		loadappearancepaks appearance = <appearance> Heap = (<asset_heap>) instrument = <temp_instrument> asset_context = <asset_heap> async = <async>
	endif
	shadow_models = []
	if NOT (<instrument> = drum)
		get_key_from_appearance key = shadow_models appearance = <appearance>
	endif
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
	<Name> :Obj_SetOrientation Dir = <Dir>
	get_body_checksum_from_appearance appearance = <appearance>
	get_is_female_from_appearance appearance = <appearance>
	if NOT (GotParam is_female)
		is_female = 0
	endif
	<Name> :SetTags asset_heap = <asset_heap>
	<Name> :SetTags body_checksum = <body_checksum>
	<Name> :SetTags is_female = <is_female>
	generatechecksumfromstruct struct = <appearance>
	<Name> :SetTags appearance_checksum = <structure_checksum>
	<Name> :SetTags geom_heap = <asset_heap>
	<Name> :SetTags current_instrument = <temp_instrument>
	switch <Name>
		case cas_musician1
		case cas_musician2
		case cas_musician3
		case cas_musician4
		default
		switch (<instrument>)
			case vocals
			desired_tree = vocalist_static_tree
			case drum
			desired_tree = drummer_static_tree
			default
			desired_tree = guitarist_static_tree
		endswitch
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
			<Name> :Anim_Command target = femalediff Command = Modulate_SetStrength params = {Strength = 1.0}
		endif
	endif
	<Name> :cas_reset_bones
	with_mic = 0
	if (<Name> = vocalist)
		if (<instrument> = guitar || <instrument> = bass)
			with_mic = 1
		endif
	endif
	if GotParam \{loading_into_song}
		get_song_struct song = <loading_into_song>
		if StructureContains structure = <song_struct> parts_with_mic_only
			if ArrayContains array = (<song_struct>.parts_with_mic_only) contains = <Name>
				with_mic = 2
			endif
		endif
		if StructureContains structure = <song_struct> parts_with_mic
			if ArrayContains array = (<song_struct>.parts_with_mic) contains = <Name>
				with_mic = 1
			endif
		endif
	endif
	ExtendCrc <Name> '_Info' out = info_struct
	Change structurename = <info_struct> part = <instrument>
	Change structurename = <info_struct> playing = true
	if (<with_mic> = 1)
		0x8dbdaee4 qs(0x1fd6f755) s = <Name>
		loadpartpak appearance = <appearance> part = cas_mic_stand Heap = (<asset_heap>) instrument = vocals asset_context = <asset_heap> async = 0
		loadpartpak appearance = <appearance> part = cas_mic Heap = (<asset_heap>) instrument = vocals asset_context = <asset_heap> async = 0
	endif
	if NOT <Name> :build_band_member_from_appearance {
			Name = (<Profile>.Name)
			appearance = <appearance>
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
		getactualcasoptionstruct part = cas_full_body desc_id = ((<appearance>.cas_full_body).desc_id)
	endif
	if NOT GotParam \{is_female}

		<is_female> = 0
	endif
	return is_female = <is_female>
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
		if (<with_mic> = 1)
			show_mic
		endif
		if (<with_mic> = 2)
			hide_mic
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
				get_song_struct \{song = $current_song}
				0x986442c9 = (($<song_anim_struct>).<member>)
				if use_alternate_anim_struct song = <loading_into_song>
					if (<member> != drum)

						0x34f5dfc5 = (<0x986442c9>.strum_anims)
						ExtendCrc <0x34f5dfc5> '_metalica' out = 0x34f5dfc5
						ExtendCrc <0x34f5dfc5> '_Strums' out = 0xb4e51aef
						if NOT GlobalExists Name = <0xb4e51aef> Type = structure
							0x93d8d5cf \{'could not find the strum animations!  Let Mike know about this'}
						endif
						<0x986442c9> = {<0x986442c9> strum_anims = (<0x34f5dfc5>)}
					endif
				endif


				return true anim_struct_member = (<0x986442c9>)
			elseif (<member> = bass || <member> = rhythm)

				if StructureContains structure = ($<song_anim_struct>) guitar

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


			return true anim_struct_member = (($<anim_struct>).<member>)
		elseif (<member> = bass || <member> = rhythm)

			if StructureContains structure = ($<anim_struct>) guitar

				return true anim_struct_member = (($<anim_struct>).guitar)
			endif
		endif
	endif


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
	ps2_get_musician_context_data Name = <Name>
	if CompositeObjectExists Name = <Name>

		<Name> :obj_resetbones
		<Name> :Die
		mpm_object_unload_paks owner = <Name>
		flushdeadobjects
		if get_key_from_appearance key = drummer_skeleton appearance = ($<bandmember_appearance>)
			formatText TextName = skeleton_pak_name 'pak\\skeletons\\skeleton_%a.pak' a = <drummer_skeleton>
			PushAssetContext context = <asset_heap>
			UnLoadPak <skeleton_pak_name> Heap = <asset_heap> sameheaps
			PopAssetContext
		elseif get_key_from_appearance key = rocker_skeleton appearance = ($<bandmember_appearance>)
			formatText TextName = skeleton_pak_name 'pak\\skeletons\\skeleton_%a.pak' a = <rocker_skeleton>
			PushAssetContext context = <asset_heap>
			UnLoadPak <skeleton_pak_name> Heap = <asset_heap> sameheaps
			PopAssetContext
		else
			get_is_female_from_appearance appearance = ($<bandmember_appearance>)
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
		if ($ps2_gameplay_restart_song = 1)
			no_appearance_pak_unload = 1
		endif
		if NOT GotParam \{no_appearance_pak_unload}
			unloadappearancepaks appearance = ($<bandmember_appearance>) no_wait asset_context = <asset_heap>
			Change GlobalName = <bandmember_appearance> NewValue = {}
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

script band_play_strum_anim 
	if CompositeObjectExists Name = <Name>
		<Name> :hero_play_strum_anim anim = <anim>
	endif
endscript

script band_play_fret_anim 
	if CompositeObjectExists Name = <Name>
		<Name> :hero_play_fret_anim anim = <anim>
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
	WaitOneGameFrame
	repeat
endscript

script hero_wait_until_anim_near_end \{Timer = BodyTimer
		time_from_end = 0.2}
	begin
	if hero_anim_near_end Timer = <Timer> time_from_end = <time_from_end>
		break
	endif
	WaitOneGameFrame
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
	band_setikchain Name = <objID> Chain = slave allow_in_2player = true
	return
endscript

script hero_enable_arms \{blend_time = 0.0}
	Obj_GetID
	band_setikchain Name = <objID> Chain = guitar allow_in_2player = true
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

		endif
	endif
	if (<disable_left_arm> = true)

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
		Command = Timer_SetSpeed
		params = {
			speed = 0.0
		}}
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
	endif
	if Anim_AnimNodeExists \{id = BodyTimer}
		Anim_Command \{target = BodyTimer
			Command = Timer_SetSpeed
			params = {
				speed = 1.0
			}}
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

script show_mic_only_parts 
	get_song_struct song = ($current_song)
	if StructureContains structure = <song_struct> parts_with_mic_only
		parts_with_mic_only = (<song_struct>.parts_with_mic_only)
		GetArraySize \{parts_with_mic_only}
		if (<array_Size> > 0)
			index = 0
			begin
			part = (<parts_with_mic_only> [<index>])

			if CompositeObjectExists Name = <part>
				<part> :show_mic_microphone
			endif
			index = (<index> + 1)
			repeat <array_Size>
		endif
	endif
endscript

script hide_mic_only_parts 
	get_song_struct song = ($current_song)
	if StructureContains structure = <song_struct> parts_with_mic_only
		parts_with_mic_only = (<song_struct>.parts_with_mic_only)
		GetArraySize \{parts_with_mic_only}
		if (<array_Size> > 0)
			index = 0
			begin
			part = (<parts_with_mic_only> [<index>])

			if CompositeObjectExists Name = <part>
				<part> :hide_mic_microphone
			endif
			index = (<index> + 1)
			repeat <array_Size>
		endif
	endif
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
											Type = PartialSwitch
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
frontend_static_tree = {
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
			Type = Source
			anim = facial_anim
		}
	]
}
vocalist_face_branch = {
	Type = Play
	id = FacialTimer
	anim = facial_anim
	[
		{
			Type = Source
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
	Type = Ik
	two_bone_chains = singer_ik_params_arms
	id = Ik
	[
		{
			Type = applyheeldifference
			id = heel
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
drummer_static_tree = {
	Type = applyheeldifference
	id = heel
	[
		{
			Type = Ik
			two_bone_chains = Drummer_IK_Params
			id = Ik
			[
				{
					Type = ApplyDifference
					[
						{
							Type = modulate
							id = femalediff
							Strength = 0.0
							[
								{
									Type = Source
									anim = gh_rocker_female_drummer_d
								}
							]
						}
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
											Type = PartialSwitch
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
			control_root
		]
	}
	{
		Name = cymbal_hh
		bones = [
			bone_guitar_string_3
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
			bone_mic_microphone
			bone_mic_adjust_height
			bone_mic_adjust_angle
			Bone_IK_Foot_Slave_R
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
		HingeAxis = (0.1483, 0.0, 0.98889995)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_L
	}
	{
		bone0 = Bone_Thigh_R
		bone1 = Bone_Knee_R
		bone2 = Bone_Ankle_R
		HingeAxis = (-0.1483, 0.0, 0.98889995)
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
		HingeAxis = (0.1483, 0.0, 0.98889995)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_L
	}
	{
		bone0 = Bone_Thigh_R
		bone1 = Bone_Knee_R
		bone2 = Bone_Ankle_R
		HingeAxis = (-0.1483, 0.0, 0.98889995)
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
	{
		bone0 = Bone_Thigh_L
		bone1 = Bone_Knee_L
		bone2 = Bone_Ankle_L
		HingeAxis = (0.1483, 0.0, 0.98889995)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_L
	}
	{
		bone0 = Bone_Thigh_R
		bone1 = Bone_Knee_R
		bone2 = Bone_Ankle_R
		HingeAxis = (-0.1483, 0.0, 0.98889995)
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
		HingeAxis = (0.447, 0.0, 0.894)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_L
	}
	{
		bone0 = Bone_Thigh_R
		bone1 = Bone_Knee_R
		bone2 = Bone_Ankle_R
		HingeAxis = (-0.3511, 0.0, 0.9362999)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_R
	}
]

script ps2_get_musician_context_data 
	switch (<Name>)
		case GUITARIST
		case cas_musician1
		case bassist2
		case vocalist2
		case drummer2
		asset_heap = heap_musician1
		bandmember_appearance = guitarist_appearance
		asset_slot_num = 0
		case BASSIST
		case cas_musician2
		case guitarist2
		asset_heap = heap_musician2
		bandmember_appearance = bassist_appearance
		asset_slot_num = 1
		case vocalist
		case cas_musician3
		asset_heap = heap_musician3
		bandmember_appearance = vocalist_appearance
		asset_slot_num = 2
		case drummer
		case cas_musician4
		asset_heap = heap_musician4
		bandmember_appearance = drummer_appearance
		asset_slot_num = 3
		default

		asset_heap = heap_musician1
		bandmember_appearance = guitarist_appearance
		asset_slot_num = 0
	endswitch
	return <...>
endscript
