max_num_create_a_rockers = 20
max_num_instrument_saves = 20
max_num_logo_saves = 30
cas_current_player = 1
cas_current_player_name = cas_player1
cas_editing_new_character = false
charselect_previous_character_id = judy
CAS_node_name = Z_SoundCheck_TRG_Waypoint_CAR_Start
cas_empty_heap_score = 0.25

script get_section_index_from_desc_id 
	RequireParams \{[
			part
			target_desc_id
		]
		all}
	if NOT GetCASAppearancePart part = <part>
		ScriptAssert '%s not found' s = <part> DoNotResolve
	endif
	if NOT GetActualCASOptionStruct part = <part> desc_id = <desc_id>
		ScriptAssert '%s %t not found' s = <part> t = <desc_id>
	endif
	if GotParam \{sections}
		GetArraySize \{sections}
		i = 0
		begin
		if ((<sections> [<i>].desc_id) = <target_desc_id>)
			return section_index = <i>
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
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

script reset_additional_bone_deform_info 
	SetCASAppearanceAdditionalBones part = <part> additional_bone_transforms = []
	UpdateCurrentCASModel \{buildScript = reskin_model_from_appearance}
endscript

script exit_to_customize_character 
	ui_event \{event = menu_change
		data = {
			state = UIstate_customize_character
		}}
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
			SoftAssert 'CAS Piece %d\'s genre parameter must be an array, using [ and ]' d = <desc_id>
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
	GetArraySize ($Genre_List)
	begin
	if (((($Genre_List) [<i>]).desc_id) = <genre>)
		found = 1
		break
	endif
	i = (<i> + 1)
	repeat <array_size>
	if NOT GotParam \{found}
		if NOT GotParam \{piece}
			piece = none
		endif
		SoftAssert '%p - Genre %g not found. Should match something in the cas_common_arrays.q list' p = <piece> g = <genre> DoNotResolve
	endif
endscript

script create_cas_cache_pak \{heap = heap_cas}
	if NOT CompositeObjectExists \{name = Global_Cas_Cache}
		CreateCompositeObject \{Components = [
				{
					Component = ModelBuilder
					create_cache
				}
			]
			params = {
				name = Global_Cas_Cache
			}}
		Global_Cas_Cache :ModelBuilder_CreateDynamicPak heap = <heap> size = <size> vram_size = <vram_size>
	else
		printf \{'Global CAS Cache already exists'}
	endif
endscript

script free_cas_cache_pak 
	if CompositeObjectExists \{name = Global_Cas_Cache}
		CasCancelLoading
		Global_Cas_Cache :Die
		FlushDeadObjects
	endif
endscript

script CASCacheFlushVRAM 
	if CompositeObjectExists \{name = Global_Cas_Cache}
		Global_Cas_Cache :ModelBuilder_FlushDynamicPakVRAM
	endif
endscript

script CASCacheModel \{async = 0}
	if CompositeObjectExists \{name = Global_Cas_Cache}
		Global_Cas_Cache :ModelBuilder_Cache {
			appearance = <appearance>
			buildscriptparams = {
				<buildscriptparams>
				caching
			}
			async = <async>
			callback = <callback>
			callbackparams = {<callbackparams> appearance = <appearance>}
			global_storage = <global_storage>
		}
	else
		if GotParam \{callback}
			<callback> {<callbackparams> appearance = <appearance>}
		endif
	endif
endscript

script flush_cas_cache 
	get_heap_sizes
	free_cas_cache_pak
	if ($cas_heap_state = in_game)
		create_cas_cache_pak size = <cas_cache_size> vram_size = <cas_cache_size_vram>
	else
		create_cas_cache_pak size = <cas_cache_size_in_cas> vram_size = <cas_cache_size_vram_in_cas>
	endif
endscript

script dump_cas_cache 
	if CompositeObjectExists \{name = Global_Cas_Cache}
		Global_Cas_Cache :ModelBuilder_DumpDynamicPak
	endif
endscript

script cas_artist_flush 
	if NOT CD
		if CasArtist
			if NOT ($cas_heap_state = in_game)
				stars
				printf \{'******* cas_artist_flush ********'}
				stars
				flush_cas_cache
				cas_rawpak_clear
				DisableCASArchive
				CasCancelLoading
				CasBlockForComposite
				CASBlockForLoading
				cas_queue_wait
				GetCurrentCASObject
				<cas_object> :Obj_ClearGeoms
				FinishRendering
				<cas_object> :ModelBuilder_Unload
				RebuildCurrentCASModel
			endif
		else
			stars
			printf \{'cas_artist=1 must be set in your personal.q file'}
			stars
		endif
	endif
endscript

script cas_edit_character_profile 
	RequireParams \{[
			character_id
			savegame
		]
		all}
	change \{cas_current_instrument = none}
	get_musician_profile_struct_by_id id = <character_id> savegame = <savegame>
	SetCASAppearance appearance = (<profile_struct>.appearance)
	change cas_current_profile = <character_id>
	change cas_current_savegame = <savegame>
endscript

script cas_get_player_status 
	FormatText checksumname = player_status 'player%d_status' d = ($cas_current_player)
	return player_status = <player_status>
endscript

script cas_print_player_status 
	cas_get_player_status
	printstruct ($<player_status>.character_id)
endscript

script cas_fix_cameras_for_game 
	KillCamAnim \{all}
	destroy_bg_viewport
	setup_bg_viewport
	restore_dummy_bg_camera
endscript

script cas_load_and_setup_resources 
	mark_unsafe_for_shutdown
	CASWaitForUnloads \{Block}
	FinishRendering
	if NOT ((GotParam album_art) || (GotParam band_logo))
		GetPakManCurrent \{map = zones}
		if ChecksumEquals a = <pak> b = z_soundcheck
			if ($autolaunch_cas_artist = 1)
				SetPakManCurrentBlock \{map = zones
					pak = z_objviewer_cas
					block_scripts = 1}
				LightShow_InitEventMappings \{force_pakname = 'z_objviewer'}
				LightShow_DummyLoop
			else
				SetPakManCurrentBlock \{map = zones
					pak = z_soundcheck_cas
					block_scripts = 1}
			endif
		else
			ScriptAssert \{'Should be in z_soundcheck here!'}
		endif
		set_cas_heap_state \{state = in_cas}
	endif
	SetShadowRenderingFlags \{enable = 'true'
		object = 'skin'}
	SetShadowMapParams \{far = 16.0}
	if NOT GotParam \{no_cam}
		destroy_bg_viewport
		setup_bg_viewport
		restore_dummy_bg_camera
		if NOT GotParam \{album_art}
			PlayIGCCam \{id = cas_view_cam_id
				name = cas_view_cam
				viewport = bg_viewport
				LockTo = world
				pos = (2.028921, 0.879576, -0.059630997)
				Quat = (-0.000911, 0.9990699, 0.027344998)
				FOV = 72.0
				Play_hold = 1
				interrupt_current}
		else
			PlayIGCCam \{id = cas_view_cam_id
				name = cas_view_cam
				viewport = bg_viewport
				LockTo = world
				pos = (-0.536864, 2.1043458, 15.148574)
				Quat = (0.0052940003, 0.02768, -0.000218)
				FOV = 72.0
				Play_hold = 1
				interrupt_current}
		endif
	endif
	if NOT ((GotParam album_art) || (GotParam band_logo))
		cas_rawpak_setup
	endif
	mark_safe_for_shutdown
endscript

script cas_free_resources \{block_scripts = 0}
	SetScriptCannotPause
	mark_unsafe_for_shutdown
	FinishRendering
	CASBlockForLoading
	KillAllCompositeTextures
	CASTemporariesFlush
	CASWaitForUnloads \{Block}
	cas_rawpak_free
	set_cas_heap_state \{state = in_game}
	if NOT GotParam \{no_loading_screen}
		printf \{'cas_free_resources - create_loading_screen'}
		if PakFilesAreCached
			hide_glitch \{num_frames = 3}
		else
			create_loading_screen <...>
		endif
	endif
	if NOT GotParam \{album_art}
		if NOT GotParam \{band_logo}
			SetPakManCurrentBlock map = zones pak = z_soundcheck block_scripts = <block_scripts>
		endif
	endif
	if ($shutdown_game_for_signin_change_flag = 0)
		printf \{'cas_free_resources - destroy_loading_screen'}
		if NOT PakFilesAreCached
			destroy_loading_screen
		endif
	endif
	if NOT GotParam \{no_fix_camera}
		cas_fix_cameras_for_game
	endif
	mark_safe_for_shutdown
	change \{cas_free_cam_active = 0}
endscript

script RefreshCASProfile 
	if CD
		return
	endif
	if NOT CasArtist
		stars
		printf \{'cas_artist=1 must be set in your personal.q file'}
		stars
		return
	endif
	if ($cas_heap_state = in_game)
		printf \{'Only works in CAS'}
	endif
	if NOT GetCurrentCASObject
		printf \{'Only works in CAS'}
	endif
	cas_queue_new_character_profile id = ($cas_current_profile) player = ($cas_current_player) savegame = ($cas_current_savegame)
	get_musician_profile_struct_by_id id = ($cas_current_profile) savegame = ($cas_current_savegame)
	SetCASAppearance appearance = (<profile_struct>.appearance)
endscript

script CreateAssetStorageFromBudgetBlock 
	if NOT GotParam \{slopheap}
		slopheap = <name>
	endif
	if NOT GotParam \{assetcontext}
		assetcontext = <name>
	endif
	CASSetupAssetStorage name = <name> params = {
		Allocator = Budget
		blockname = <name>
		assetcontext = <assetcontext>
		slopheap = <slopheap>
	}
endscript

script set_new_car_preset_physique 
	if NOT GetCASAppearancePart \{part = cas_physique}
		ScriptAssert \{'%s not found'
			s = cas_physique}
	endif
	if NOT GetActualCASOptionStruct part = cas_physique desc_id = <desc_id>
		ScriptAssert '%s %t not found' s = cas_physique t = <desc_id>
	endif
	if NOT GotParam \{preset_builds}
		ScriptAssert \{'preset_builds not found'}
	endif
	if NOT GotParam \{default_car_preset_build_index}
		ScriptAssert \{'default_car_preset_build_index not found'}
	endif
	chosen = (<preset_builds> [<default_car_preset_build_index>])
	SetCASAppearanceAdditionalBones part = cas_physique additional_bone_transforms = (<chosen>.additional_bone_transforms)
	return preset_physique_index = <default_car_preset_build_index>
endscript

script generate_random_appearance 
	RequireParams \{[
			is_female
			genre
		]}
	if GotParam \{new_car_character}
		if (<is_female> = 1)
			change cas_current_appearance = ($default_custom_musician_profile_female.appearance)
		else
			change cas_current_appearance = ($default_custom_musician_profile_male.appearance)
		endif
		set_new_car_preset_physique
		new_car_character_flag = {new_car_character random_instruments from_car}
	endif
	cas_set_random_appearance genre = <genre> <new_car_character_flag>
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
	GetArraySize \{$Genre_List}
	GetRandomValue a = 0 b = (<array_size> - <takeaway>) name = genre_index Integer
	return genre = ($Genre_List [<genre_index>].desc_id)
endscript

script cas_change_current_character_gender 
	genre = (($cas_current_appearance).genre)
	generate_random_name is_female = <is_female>
	generate_random_appearance is_female = <is_female> genre = <genre> new_car_character
	modify_custom_profile_fullname id = ($cas_current_profile) fullname = <random_name> savegame = ($cas_current_savegame)
	if (is_female = 0)
		modify_custom_profile_blurb id = ($cas_current_profile) savegame = ($cas_current_savegame) blurb = (($default_custom_musician_profile_male).blurb)
	else
		modify_custom_profile_blurb id = ($cas_current_profile) savegame = ($cas_current_savegame) blurb = (($default_custom_musician_profile_female).blurb)
	endif
	cas_queue_add_request appearance = ($cas_current_appearance) player = ($cas_current_player)
endscript

script ui_load_cas_rawpak \{async = 1}
	cas_get_is_female player = ($cas_current_player)
	if GotParam \{instrument}
		switch (<instrument>)
			case guitar
			pak = cas_guitarpak
			case Bass
			pak = cas_basspak
			case drum
			pak = cas_drumspak
			case Vocals
			pak = cas_vocalspak
			default
			ScriptAssert 'bad instrument %s' s = <instrument>
		endswitch
	elseif GotParam \{Finishes}
		switch (<Finishes>)
			case CAS_Guitar_Body
			if NOT GetCASAppearancePart \{part = CAS_Guitar_Body}
				ScriptAssert \{'%s not found'
					s = CAS_Guitar_Body}
			endif
			if NOT GetActualCASOptionStruct part = CAS_Guitar_Body desc_id = <desc_id>
				ScriptAssert '%s %t not found' s = CAS_Guitar_Body t = <desc_id>
			endif
			if GotParam \{pak_num}
				if (($cas_num_finishes_pak) > <pak_num>)
					FormatText checksumname = pak_name 'CAS_GUITARPAK_FINISHES_%i' i = <pak_num>
					pak = <pak_name>
				else
					pak = cas_guitarpak_finishes_0
				endif
			else
				pak = cas_guitarpak_finishes_0
			endif
			case CAS_Bass_Body
			if NOT GetCASAppearancePart \{part = CAS_Bass_Body}
				ScriptAssert \{'%s not found'
					s = CAS_Bass_Body}
			endif
			if NOT GetActualCASOptionStruct part = CAS_Bass_Body desc_id = <desc_id>
				ScriptAssert '%s %t not found' s = CAS_Bass_Body t = <desc_id>
			endif
			if GotParam \{pak_num}
				if (($cas_num_finishes_pak) > <pak_num>)
					FormatText checksumname = pak_name 'CAS_BASSPAK_FINISHES_%i' i = <pak_num>
					pak = <pak_name>
				else
					pak = cas_basspak_finishes_0
				endif
			else
				pak = cas_basspak_finishes_0
			endif
			default
			printf 'ui_load_cas_rawpak: No pak to load finish=%p' p = <Finishes> DoNotResolve
		endswitch
	else
		ResolveBodySpecificPartInAppearance part = <part>
		switch (<part>)
			case CAS_Body
			if (<is_female> = 1)
				pak = cas_female_bodypak
			else
				pak = cas_male_bodypak
			endif
			case CAS_Female_Hair
			case CAS_Female_Hat_Hair
			case CAS_Female_Facial_Hair
			pak = cas_female_bodypak
			case CAS_Male_Hair
			case CAS_Male_Hat_Hair
			case CAS_Male_Facial_Hair
			pak = cas_male_bodypak
			case CAS_Female_Hat
			case CAS_Female_Acc_Left
			case CAS_Female_Acc_Right
			case CAS_Female_Acc_Face
			case CAS_Female_Acc_Ears
			pak = cas_female_accpak
			case CAS_Male_Hat
			case CAS_Male_Acc_Left
			case CAS_Male_Acc_Right
			case CAS_Male_Acc_Face
			case CAS_Male_Acc_Ears
			pak = cas_male_accpak
			case CAS_Female_Torso
			pak = cas_female_torsopak
			case CAS_Male_Torso
			pak = cas_male_torsopak
			case CAS_Female_Legs
			pak = cas_female_legspak
			case CAS_Male_Legs
			pak = cas_male_legspak
			case CAS_Female_Shoes
			pak = cas_female_shoespak
			case CAS_Male_Shoes
			pak = cas_male_shoespak
			case CAS_Guitar_Body
			case CAS_Guitar_Pickguards
			case CAS_Guitar_Bridges
			case CAS_Guitar_Knobs
			case CAS_Guitar_Pickups
			pak = cas_guitarpak
			case CAS_Guitar_Neck
			case CAS_Guitar_Head
			pak = cas_guitarpak_nh
			case CAS_Bass_Body
			case CAS_Bass_Pickguards
			case CAS_Bass_Pickups
			case CAS_Bass_Bridges
			case CAS_Bass_Knobs
			pak = cas_basspak
			case CAS_Bass_Neck
			case CAS_Bass_Head
			pak = cas_basspak_nh
			case CAS_Drums
			case CAS_Drums_Sticks
			pak = cas_drumspak
			case CAS_Mic
			case CAS_Mic_Stand
			pak = cas_vocalspak
			default
			printf 'ui_load_cas_rawpak: No pak to load part=%p' p = <part> DoNotResolve
		endswitch
	endif
	if GotParam \{pak}
		cas_rawpak_set pak = <pak> async = <async>
	endif
endscript

script cas_soak_test 
	Randomize \{1980}
	begin
	get_musician_profile_size \{savegame = 0}
	i = 0
	begin
	get_musician_profile_struct_by_index index = <i> savegame = 0
	this_id = (<profile_struct>.name)
	if is_selectable_profile profile_struct = <profile_struct>
		cas_queue_new_character_profile player = RandomInteger (1.0, 4.0) id = <this_id> savegame = 0
		if (RandomInteger (0.0, 5.0) = 0)
			cas_queue_wait
		else
			if (RandomInteger (0.0, 3.0) > 0)
				frames = Random (@ 1 @ 5 @ 40 @ 100 )
				Wait <frames> gameframes
			endif
			CasCancelLoading
		endif
		frames = Random (@ 0 @ 1 @ 2 )
		if (<frames> > 0)
			Wait <frames> gameframes
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
	repeat 100
endscript
Highway_Instrument_map = {
	guitar = CAS_Guitar_Highway
	Bass = CAS_Bass_Highway
	drum = CAS_Drums_Highway
}

script get_highway_struct_from_appearance 
	if StructureContains Structure = ($Highway_Instrument_map) <part>
		highway_part = ($Highway_Instrument_map.<part>)
		printf 'Highway part is %s' s = <highway_part> DoNotResolve
		if StructureContains Structure = <appearance> <highway_part>
			if ($game_mode = p1_quickplay)
				GetPlayerInfo \{1
					character_id}
				printf qs("\Lcharacter_id = %d") d = <character_id> channel = achievements
				if (<character_id> = RandomAppearance0)
					GetActualCASOptionStruct part = <highway_part> desc_id = Random (@ AxelHighway @ PunkHighway @ CaseyHighway @ FlamesHighway @ ChainsHighway @ JohnnyHighway @ JudyHighway @ PurpleSpiderHighway @ GrimHighway @ WinstonHighway @ GreenRockGodHighway )
				else
					GetActualCASOptionStruct part = <highway_part> desc_id = (<appearance>.<highway_part>.desc_id)
				endif
			else
				GetActualCASOptionStruct part = <highway_part> desc_id = (<appearance>.<highway_part>.desc_id)
			endif
		else
			GetActualCASOptionStruct part = <highway_part> desc_id = AxelHighway
		endif
		return true frontend_img = <frontend_img> highway_pak = <highway_pak> highway_texture = <highway_texture>
	else
		printf 'Part %s not found in highway->inst map' s = <part> DoNotResolve
		return \{false}
	endif
endscript

script cas_free_resources_camera_fix 
	if ScriptIsRunning \{cas_free_resources}
		begin
		if NOT ScriptIsRunning \{cas_free_resources}
			break
		endif
		Wait \{1
			gameframe}
		repeat
		spawnscriptnow task_menu_default_anim_in params = {base_name = <base_name>}
	elseif GotParam \{alwaysfix}
		spawnscriptnow task_menu_default_anim_in params = {base_name = <base_name>}
	endif
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
	if GotParam \{sections}
		return \{true}
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
		if (<array_size> > 0)
			return \{true}
		endif
	else
		if GotParam \{material_groups}
			GetArraySize <material_groups>
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
