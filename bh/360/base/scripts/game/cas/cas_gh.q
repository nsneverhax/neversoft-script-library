
script get_section_index_from_desc_id 
	RequireParams \{[
			part
			target_desc_id
		]
		all}
	if GetCAPSectionsArray appearance = $cas_current_appearance part = <part>
		GetArraySize \{sections}
		if (<array_size> > 0)
			i = 0
			begin
			if ((<sections> [<i>].desc_id) = <target_desc_id>)
				return true section_index = <i>
			endif
			i = (<i> + 1)
			repeat <array_size>
		endif
	endif
	return \{false}
endscript

script find_bone_deform_info 
	RequireParams \{[
			deform_bones
			group_name
		]
		all}
	GetArraySize <deform_bones> GlobalArray
	i = 0
	begin
	if (((($<deform_bones>) [<i>]).group_name) = <group_name>)
		return true bone_deform_info = (($<deform_bones>) [<i>])
	endif
	i = (<i> + 1)
	repeat <array_size>
	return \{false}
endscript

script reset_bone_deform_info 
	SetCASAppearanceBones part = <part> bones = {}
	UpdateCurrentCASModel \{buildScript = reskin_model_from_appearance}
endscript

script verify_genre_data 
	if NOT CD
		ForEachIn \{$master_editable_list
			do = verify_genre_data_foreach}
	endif
endscript

script verify_genre_data_foreach 
	if GlobalExists name = <part> type = array
		ForEachIn ($<part>) do = verify_genre_data_foreach_part
	endif
endscript

script verify_genre_data_foreach_part 
	if GotParam \{genre}
		if NOT IsArray (<genre>)
			softassert 'CAS Piece %d\'s genre parameter must be an array, using [ and ]' d = <desc_id>
		else
			ForEachIn <genre> do = verify_genre_data_foreach_part_genre params = {piece = <desc_id>}
		endif
	endif
endscript

script verify_genre_data_foreach_part_genre 
	if (<checksum> = any)
		ScriptAssert \{'Cannot use the :any: genre on CAS pieces'}
	endif
	verify_genre genre = <checksum> piece = <piece>
endscript

script verify_genre 
	i = 0
	GetArraySize ($cas_genre_list)
	begin
	if (((($cas_genre_list) [<i>]).desc_id) = <genre>)
		found = 1
		break
	endif
	i = (<i> + 1)
	repeat <array_size>
	if NOT GotParam \{found}
		if NOT GotParam \{piece}
			piece = None
		endif
		softassert '%p - Genre %g not found. Should match something in the cas_common_arrays.q list' p = <piece> g = <genre> DoNotResolve
	endif
endscript

script cas_artist_flush 
	if NOT CD
		if CasArtist
			if ($is_in_cas = 1)
				STARS
				printf \{'******* cas_artist_flush ********'}
				STARS
				if ScriptIsRunning \{cas_artist_flush_worker}
					return
				endif
				spawnscriptnow \{cas_artist_flush_worker}
			endif
		else
			STARS
			printf \{'cas_artist=1 must be set in your personal.q file'}
			STARS
		endif
	endif
endscript

script cas_artist_flush_worker 
	if NOT checksumequals \{a = $cas_reskin_preview
			b = None}
		cas_bonemenu_apply_changes \{kill_objects = 1}
	endif
	KillAllCompositeTextures
	flush_cas_caches
	CasCancelLoading
	CasBlockForComposite
	CasBlockForLoading
	cas_queue_wait
	GetCurrentCASObject
	<cas_object> :Obj_ClearGeoms
	FinishRendering
	<cas_object> :ModelBuilder_Unload
	CASTemporariesFlush
	WaitUnloadGroup \{CAS
		async = 0}
	cas_artist_reload_globalpaks
	RebuildCurrentCASModel \{force_update = 1}
endscript

script cas_artist_reload_globalpaks 
	printf \{'cas_artist_reload_globalpaks'}
endscript

script cas_edit_character_profile 
	RequireParams \{[
			character_id
			savegame
		]
		all}
	Change \{cas_current_instrument = guitar_and_vocals}
	CharacterProfileGetStruct name = <character_id> savegame = <savegame>
	SetCASAppearance appearance = (<profile_struct>.appearance)
	Change cas_current_profile = <character_id>
	Change cas_current_savegame = <savegame>
endscript

script cas_get_player 
	return player = ($cas_current_player)
endscript

script cas_load_and_setup_resources \{async = 1}
	printscriptinfo \{channel = cas_debug
		'cas_load_and_setup_resources'}
	if ($is_in_cas = 1)
		ScriptAssert \{'Already have resources loaded'}
	endif
	Change \{is_in_cas = 1}
	if ((GotParam album_art) || (GotParam band_logo))
		push_unsafe_for_shutdown \{reason = cas_load_and_setup_resources}
		WaitUnloadGroup \{CAS
			async = 0}
		FinishRendering
		if NOT GotParam \{album_art}
			PlayIGCCam \{id = cas_view_cam_id
				name = cas_view_cam
				viewport = bg_viewport
				LockTo = World
				Pos = (2.028921, 0.879576, -0.059630997)
				Quat = (-0.000911, 0.9990699, 0.027344998)
				FOV = 72.0
				Play_hold = 1
				interrupt_current}
		else
			PlayIGCCam \{id = cas_view_cam_id
				name = cas_view_cam
				viewport = bg_viewport
				LockTo = World
				Pos = (-0.536864, 2.1043458, 15.148574)
				Quat = (0.0052940003, 0.02768, -0.000218)
				FOV = 72.0
				Play_hold = 1
				interrupt_current}
		endif
	else
		destroy_song_and_musicstudio_heaps \{do_unloads}
		LoadPakAsync pak_name = 'pak/cas_precache_lists.pak' heap = heap_cas_cache async = <async>
		get_heap_sizes
		create_cas_caches
	endif
	AnimKickoffSkinningEnable \{enabled = 0}
	if ((GotParam album_art) || (GotParam band_logo))
		pop_unsafe_for_shutdown \{reason = cas_load_and_setup_resources}
	endif
endscript

script cas_free_resources 
	printscriptinfo \{channel = cas_debug
		'cas_free_resources'}
	if ($is_in_cas = 1)
		AnimKickoffSkinningEnable \{enabled = 1}
		push_unsafe_for_shutdown \{reason = cas_free_resources}
		UnLoadPak \{'pak/cas_precache_lists.pak'}
		killspawnedscript \{name = UpdateCurrentCASModelSpawned}
		FinishRendering
		CasBlockForLoading
		KillAllCompositeTextures
		WaitUnloadGroup \{CAS
			async = 0}
		ArchiveCancelLoading \{cas_building_cache}
		ArchiveWaitLoading \{cas_building_cache
			async = 0}
		free_cas_caches
		create_song_and_musicstudio_heaps
		if NOT GotParam \{no_fix_camera}
		endif
		pop_unsafe_for_shutdown \{reason = cas_free_resources}
		Change \{cas_free_cam_active = 0}
		Change \{is_in_cas = 0}
	endif
endscript

script RefreshCASProfile 
	if CD
		return
	endif
	if NOT CasArtist
		STARS
		printf \{'cas_artist=1 must be set in your personal.q file'}
		STARS
		return
	endif
	if ($is_in_cas = 0)
		printf \{'Only works in CAS'}
		return
	endif
	if NOT GetCurrentCASObject
		printf \{'Only works in CAS'}
		return
	endif
	cas_queue_new_character_profile id = ($cas_current_profile) player = ($cas_current_player) savegame = ($cas_current_savegame) instrument = ($cas_current_instrument)
	CharacterProfileGetStruct name = ($cas_current_profile) savegame = ($cas_current_savegame)
	SetCASAppearance appearance = (<profile_struct>.appearance)
endscript

script CreateAssetStorageFromBudgetBlock 
	if NOT GotParam \{slopheap}
		slopheap = <name>
	endif
	if NOT GotParam \{AssetContext}
		AssetContext = <name>
	endif
	CASSetupAssetStorage name = <name> params = {
		Allocator = budget
		blockname = <name>
		AssetContext = <AssetContext>
		slopheap = <slopheap>
	}
endscript

script is_avatar_appearance 
	RequireParams \{[
			appearance
		]
		all}
	if StructureContains structure = <appearance> CAS_Full_Body
		if checksumequals a = ((<appearance>.CAS_Full_Body).desc_id) b = avatar
			return \{true}
		endif
	endif
	return \{false}
endscript

script is_avatar_character 
	RequireParams \{[
			id
			savegame
		]
		all}
	if (<id> = avatar)
		return \{true}
	endif
	if CharacterProfileGetStruct name = <id> savegame = <savegame>
		if is_avatar_appearance appearance = (<profile_struct>.appearance)
			return \{true}
		endif
	endif
	return \{false}
endscript

script generate_random_avatar 
	if get_random_avatar_appearance is_female = <is_female>
		Change cas_current_appearance = <appearance>
		generate_random_genre
		cas_set_random_avatar_instrument is_female = <is_female> genre = <genre>
	endif
endscript

script generate_random_name 
	RequireParams \{[
			is_female
		]}
	if (<is_female> = 1)
		GetRandomArrayElement ($gh_random_car_female_names)
	else
		GetRandomArrayElement ($gh_random_car_male_names)
	endif
	return random_name = <element>
endscript

script generate_random_genre 
	takeaway = 2
	if GotParam \{allow_mixed}
		takeaway = 1
	endif
	GetArraySize \{$cas_genre_list}
	GetRandomValue a = 0 b = (<array_size> - <takeaway>) name = genre_index integer
	return genre = ($cas_genre_list [<genre_index>].desc_id)
endscript

script cas_change_current_character_gender 
	genre = (($cas_current_appearance).genre)
	generate_random_name is_female = <is_female>
	cas_set_random_appearance is_female = <is_female> genre = <genre> new_car_character random_instruments
	modify_custom_profile_fullname id = ($cas_current_profile) fullname = <random_name> savegame = ($cas_current_savegame)
	if (is_female = 0)
		modify_custom_profile_blurb id = ($cas_current_profile) savegame = ($cas_current_savegame) blurb = (($default_custom_musician_profile_male).blurb)
	else
		modify_custom_profile_blurb id = ($cas_current_profile) savegame = ($cas_current_savegame) blurb = (($default_custom_musician_profile_female).blurb)
	endif
	if ($leaving_genre_select = 1)
		return
	endif
	cas_queue_add_request appearance = ($cas_current_appearance) player = ($cas_current_player) instrument = None
endscript

script cas_set_random_car_appearance 
	RequireParams \{[
			savegame
		]
		all}
	is_female = Random (@ 0 @ 1 )
	if (<is_female> = 1)
		Profile = ($default_custom_musician_profile_female)
	else
		Profile = ($default_custom_musician_profile_male)
	endif
	Change cas_current_savegame = <savegame>
	generate_random_name is_female = <is_female>
	generate_random_genre
	cas_set_random_appearance is_female = <is_female> genre = <genre> new_car_character random_instruments
	Change cas_current_appearance = {
		($cas_current_appearance)
		car_character = 1
	}
	Change \{cas_current_savegame = -1}
endscript

script get_random_avatar_appearance 
	if GetAvatarCASMetadata Randomize is_female = <is_female>
		fullbody_part = ($avatar_profile.appearance.CAS_Full_Body)
		fullbody_part = {<fullbody_part> avatar_meta_data = <Metadata>}
		UpdateStructElement struct = ($avatar_profile.appearance) element = CAS_Full_Body value = <fullbody_part>
		return true appearance = <newstruct>
	endif
	return \{false}
endscript

script cas_soak_test 
endscript

script is_part_editable 
	RequireParams \{[
			part
			desc_id
		]
		all}
	GetActualCASOptionStruct part = <part> desc_id = <desc_id>
	if part_has_sections part = <part> desc_id = <desc_id>
		return \{true}
	elseif part_has_materials part = <part> desc_id = <desc_id>
		return \{true}
	else
		return \{false}
	endif
endscript

script part_has_sections 
	RequireParams \{[
			part
			desc_id
		]
		all}
	GetActualCASOptionStruct part = <part> desc_id = <desc_id>
	if GotParam \{cap_textures}
		return \{true}
	endif
	if GotParam \{sections}
		ScriptAssert \{'sections is deprecated'}
	endif
	return \{false}
endscript

script part_has_materials 
	RequireParams \{[
			part
			desc_id
		]
		all}
	if NOT GetActualCASOptionStruct part = <part> desc_id = <desc_id>
		return \{false}
	endif
	if GotParam \{materials}
		GetArraySize <materials>
		if (<array_size> = 0)
			ScriptAssert 'material array on %s is empty, remove it' s = <desc_id>
		endif
		if (<array_size> > 0)
			return \{true}
		endif
	else
		if GotParam \{material_groups}
			GetArraySize <material_groups>
			if (<array_size> = 0)
				ScriptAssert 'material array on %s is empty, remove it' s = <desc_id>
			endif
			if (<array_size> > 0)
				return \{true}
			endif
		else
			if GotParam \{modify_all_materials}
				return \{true}
			endif
		endif
	endif
	return \{false}
endscript

script part_has_swatch_list 
	RequireParams \{[
			part
			desc_id
		]
		all}
	if NOT GetActualCASOptionStruct part = <part> desc_id = <desc_id>
		return \{false}
	endif
	if GotParam \{swatch_list}
		return true parent_swatch = <desc_id>
	endif
	if GotParam \{swatch_for}
		return true parent_swatch = <swatch_for>
	endif
	return \{false}
endscript

script get_cas_sponsor_texture_and_title 
	RequireParams \{[
			part
		]
		all}
	if NOT GetCASAppearancePartDescID part = <part>
		return \{false}
	endif
	if NOT GetActualCASOptionStruct part = <part> desc_id = <desc_id>
		return \{false}
	endif
	if NOT GotParam \{sponsor_id}
		return \{false}
	endif
	GetArraySize ($CAS_Sponsors)
	j = 0
	begin
	if ((($CAS_Sponsors [<j>]).id) = <sponsor_id>)
		Title = (($CAS_Sponsors [<j>]).display_name)
		texture = (($CAS_Sponsors [<j>]).texture)
		return true Title = <Title> texture = <texture>
	endif
	<j> = (<j> + 1)
	repeat <array_size>
	return \{false}
endscript

script cas_drum_stick_bake_transforms 
	printf \{'cas_drum_stick_bake_transforms'}
	printstruct <...>
	Skeleton_GetSkeletonName
	printf channel = mydebug qs(0x6f2e83c9) s = <skeletonName>
	switch <skeletonName>
		case gh_rocker_male
		if (<material_index> = 0)
			Pos = (0.0, 0.0, 0.0)
			Orientation = (0.0, 0.0, 0.0)
		else
			Pos = (0.0, 0.0, 0.0)
			Orientation = (0.0, 0.0, 0.0)
		endif
		case gh_rocker_female
		printf \{channel = mydebug
			qs(0x0111a0f9)}
		if (<material_index> = 0)
			printf \{channel = mydebug
				qs(0x40f6a61c)}
			Pos = (-0.09081, 0.09465001, 0.014779999)
			Orientation = (0.0, 0.0, 0.0)
		else
			printf \{channel = mydebug
				qs(0xdc7f9334)}
			Pos = (0.09079, 0.09463001, 0.014779999)
			Orientation = (0.0, 0.0, 0.0)
		endif
		case gh_rocker_Axel_1
		Axel_Drumstick_Offset <...>
		case gh_rocker_Axel_2
		Axel_Drumstick_Offset <...>
		case gh_rocker_Axel_3
		Axel_Drumstick_Offset <...>
		case gh_rocker_Axel_4
		Axel_Drumstick_Offset <...>
		case gh_rocker_Axel_5
		Axel_Drumstick_Offset <...>
		case gh_rocker_Casey_1
		Casey_Drumstick_Offset <...>
		case gh_rocker_Casey_2
		Casey_Drumstick_Offset <...>
		case gh_rocker_Casey_3
		Casey_Drumstick_Offset <...>
		case gh_rocker_Casey_4
		Casey_Drumstick_Offset <...>
		case gh_rocker_Casey_5
		Casey_Drumstick_Offset <...>
		case gh_rocker_Clive_1
		Clive_Drumstick_Offset <...>
		case gh_rocker_Clive_2
		Clive_Drumstick_Offset <...>
		case gh_rocker_Clive_3
		Clive_Drumstick_Offset <...>
		case gh_rocker_Clive_4
		Clive_Drumstick_Offset <...>
		case gh_rocker_Clive_5
		Clive_Drumstick_Offset <...>
		case gh_rocker_Eddie_1
		Eddie_Drumstick_Offset <...>
		case gh_rocker_Eddie_2
		Eddie_Drumstick_Offset <...>
		case gh_rocker_Eddie_3
		Eddie_Drumstick_Offset <...>
		case gh_rocker_Eddie_4
		Eddie_Drumstick_Offset <...>
		case gh_rocker_Eddie_5
		Eddie_Drumstick_Offset <...>
		case gh_rocker_Izzy_1
		Izzy_Drumstick_Offset <...>
		case gh_rocker_Izzy_2
		Izzy_Drumstick_Offset <...>
		case gh_rocker_Izzy_3
		Izzy_Drumstick_Offset <...>
		case gh_rocker_Izzy_4
		Izzy_Drumstick_Offset <...>
		case gh_rocker_Johnny_1
		Johnny_Drumstick_Offset <...>
		case gh_rocker_Johnny_2
		Johnny_Drumstick_Offset <...>
		case gh_rocker_Johnny_3
		Johnny_Drumstick_Offset <...>
		case gh_rocker_Johnny_4
		Johnny_Drumstick_Offset <...>
		case gh_rocker_JohnnyCash_CAR
		JohnnyCash_Drumstick_Offset <...>
		case GH_Rocker_ShirleyManson_1
		ShirleyManson_Drumstick_Offset <...>
		case GH_Rocker_GwenStefani
		GwenStefani_Drumstick_Offset <...>
		case GH_Rocker_TaylorSwift_1
		TaylorSwift_Drumstick_Offset <...>
		case gh_rocker_Judy_1
		Judy_Drumstick_Offset <...>
		case gh_rocker_Judy_2
		Judy_Drumstick_Offset <...>
		case gh_rocker_Judy_3
		Judy_Drumstick_Offset <...>
		case gh_rocker_Judy_4
		Judy_Drumstick_Offset <...>
		case gh_rocker_Judy_5
		Judy_Drumstick_Offset <...>
		case gh_rocker_lars_1
		Lars_Drumstick_Offset <...>
		case gh_rocker_lars_2
		Lars_Drumstick_Offset <...>
		case gh_rocker_lars_3
		Lars_Drumstick_Offset <...>
		case gh_rocker_lars_4
		Lars_Drumstick_Offset <...>
		case gh_rocker_Midori_1
		Midori_Drumstick_Offset <...>
		case gh_rocker_Midori_2
		Midori_Drumstick_Offset <...>
		case gh_rocker_Midori_3
		Midori_Drumstick_Offset <...>
		case gh_rocker_Midori_3
		Midori_Drumstick_Offset <...>
		case gh_rocker_Midori_4
		Midori_Drumstick_Offset <...>
		case gh_rocker_Pandora_1
		Pandora_Drumstick_Offset <...>
		case gh_rocker_Pandora_2
		Pandora_Drumstick_Offset <...>
		case gh_rocker_Pandora_3
		Pandora_Drumstick_Offset <...>
		case gh_rocker_Pandora_4
		Pandora_Drumstick_Offset <...>
		case gh_rocker_Pandora_5
		Pandora_Drumstick_Offset <...>
		case gh_rocker_FrankenRocker_1
		FrankenRocker_Drumstick_Offset <...>
		case gh_rocker_FrankenRocker_2
		FrankenRocker_Drumstick_Offset <...>
		case gh_rocker_FrankenRocker_3
		FrankenRocker_Drumstick_Offset <...>
		case gh_rocker_FrankenRocker_4
		FrankenRocker_Drumstick_Offset <...>
		case GH_Rocker_Avatar
		Avatar_Drumstick_Offset <...>
		default
		if (<material_index> = 0)
			Pos = (0.0, 0.0, 0.0)
			Orientation = (0.0, 0.0, 0.0)
		else
			Pos = (0.0, 0.0, 0.0)
			Orientation = (0.0, 0.0, 0.0)
		endif
	endswitch
	Obj_BakeTransform material = <material> geom = <part> Pos = <Pos> Orientation = <Orientation>
endscript

script Axel_Drumstick_Offset 
	printf \{channel = mydebug
		qs(0xbd4803f3)}
	if (<material_index> = 0)
		Pos = (0.159723, -0.021472, 0.0023196302)
		Orientation = (0.0, 0.0, 0.0)
	else
		Pos = (-0.159739, -0.0214857, 0.0023173501)
		Orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script Casey_Drumstick_Offset 
	printf \{channel = mydebug
		qs(0x8ee531fb)}
	if (<material_index> = 0)
		Pos = (-0.09135061, 0.093663804, -0.0147257)
		Orientation = (0.0, 0.0, 0.0)
	else
		Pos = (0.0913313, 0.09364941, -0.0147287)
		Orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script Clive_Drumstick_Offset 
	printf \{channel = mydebug
		qs(0x09ed0fba)}
	if (<material_index> = 0)
		Pos = (0.0, 0.0, 0.0)
		Orientation = (0.0, 0.0, 0.0)
	else
		Pos = (0.0, 0.0, 0.0)
		Orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script Eddie_Drumstick_Offset 
	printf \{channel = mydebug
		qs(0x9c824f31)}
	if (<material_index> = 0)
		Pos = (0.0298674, -0.000279784, 0.0007670819)
		Orientation = (0.0, 0.0, 0.0)
	else
		Pos = (-0.0298583, -0.00026887702, 0.00076697)
		Orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script Izzy_Drumstick_Offset 
	printf \{channel = mydebug
		qs(0x79fd5399)}
	if (<material_index> = 0)
		Pos = (0.0, 0.0, 0.0)
		Orientation = (0.0, 0.0, 0.0)
	else
		Pos = (0.0, 0.0, 0.0)
		Orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script Johnny_Drumstick_Offset 
	printf \{channel = mydebug
		qs(0xff20fc33)}
	if (<material_index> = 0)
		Pos = (0.0, 0.0, 0.0)
		Orientation = (0.0, 0.0, 0.0)
	else
		Pos = (0.0, 0.0, 0.0)
		Orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script JohnnyCash_Drumstick_Offset 
	printf \{channel = mydebug
		qs(0x53bc0781)}
	if (<material_index> = 0)
		Pos = (0.029867599, -0.00027984398, 0.000767075)
		Orientation = (0.0, 0.0, 0.0)
	else
		Pos = (-0.0298582, -0.00026875702, 0.00076712697)
		Orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script ShirleyManson_Drumstick_Offset 
	printf \{channel = mydebug
		qs(0x1270c5a4)}
	if (<material_index> = 0)
		Pos = (-0.091300905, 0.09368741, -0.014790599)
		Orientation = (0.0, 0.0, 0.0)
	else
		Pos = (0.0912823, 0.0936723, -0.014792499)
		Orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script GwenStefani_Drumstick_Offset 
	printf \{channel = mydebug
		qs(0x40b760c5)}
	if (<material_index> = 0)
		Pos = (-0.091300905, 0.09368741, -0.014790599)
		Orientation = (0.0, 0.0, 0.0)
	else
		Pos = (0.0912823, 0.0936723, -0.014792499)
		Orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script TaylorSwift_Drumstick_Offset 
	printf \{channel = mydebug
		qs(0x8aa5e969)}
	if (<material_index> = 0)
		Pos = (-0.091350704, 0.093663804, -0.0147257)
		Orientation = (0.0, 0.0, 0.0)
	else
		Pos = (0.09133141, 0.09364961, -0.0147287)
		Orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script Judy_Drumstick_Offset 
	printf \{channel = mydebug
		qs(0x723699dd)}
	if (<material_index> = 0)
		Pos = (-0.09135061, 0.093663804, -0.0147257)
		Orientation = (0.0, 0.0, 0.0)
	else
		Pos = (0.0913313, 0.09364941, -0.0147287)
		Orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script Lars_Drumstick_Offset 
	printf \{channel = mydebug
		qs(0x3debd7a9)}
	if (<material_index> = 0)
		Pos = (0.12968501, -0.0029761803, 0.0201722)
		Orientation = (0.0, 0.0, 0.0)
	else
		Pos = (-0.129701, -0.0029930503, 0.0201723)
		Orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script Midori_Drumstick_Offset 
	printf \{channel = mydebug
		qs(0x874b867c)}
	if (<material_index> = 0)
		Pos = (-0.091301, 0.09368741, -0.014790599)
		Orientation = (0.0, 0.0, 0.0)
	else
		Pos = (0.091282204, 0.0936726, -0.014792499)
		Orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script Pandora_Drumstick_Offset 
	printf \{channel = mydebug
		qs(0xd0967dbf)}
	if (<material_index> = 0)
		Pos = (-0.091301, 0.09368741, -0.014790599)
		Orientation = (0.0, 0.0, 0.0)
	else
		Pos = (0.091282204, 0.0936726, -0.014792499)
		Orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script FrankenRocker_Drumstick_Offset 
	printf \{channel = mydebug
		qs(0xb81db2da)}
	if (<material_index> = 0)
		Pos = (0.159723, -0.021472, 0.0023196603)
		Orientation = (0.0, 0.0, 0.0)
	else
		Pos = (-0.159739, -0.0214857, 0.0023173601)
		Orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script Avatar_Drumstick_Offset 
	if (<material_index> = 0)
		Pos = (-0.01, 0.055, 0.0)
		Orientation = (0.0, 0.0, 0.0)
	else
		Pos = (0.01, 0.055, 0.0)
		Orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript
