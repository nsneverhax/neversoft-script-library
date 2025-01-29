max_num_create_a_rockers = 8
max_num_instrument_saves = 8
max_num_logo_saves = 10
cas_current_player = 1
cas_current_player_name = cas_player1
cas_editing_new_character = FALSE
charselect_previous_character_id = Judy
cas_node_name = z_soundcheck_trg_waypoint_car_start
cas_empty_heap_score = 0.25

script get_section_index_from_desc_id 

	if NOT getcasappearancepart part = <part>

	endif
	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>

	endif
	if GotParam \{sections}
		GetArraySize \{sections}
		i = 0
		begin
		if ((<sections> [<i>].desc_id) = <target_desc_id>)
			return section_index = <i>
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
endscript

script find_bone_deform_info 

	GetArraySize <deform_bones> globalarray
	i = 0
	begin
	if (((($<deform_bones>) [<i>]).group_name) = <group_name>)
		return true bone_deform_info = (($<deform_bones>) [<i>])
	endif
	i = (<i> + 1)
	repeat <array_Size>
	return \{FALSE}
endscript

script reset_bone_deform_info 
	setcasappearancebones part = <part> bones = {}
	updatecurrentcasmodel \{buildscript = reskin_model_from_appearance}
endscript

script reset_additional_bone_deform_info 
	setcasappearanceadditionalbones part = <part> additional_bone_transforms = []
	updatecurrentcasmodel \{buildscript = reskin_model_from_appearance}
endscript

script exit_to_customize_character 
	ui_event \{event = menu_change
		data = {
			state = uistate_customize_character
		}}
endscript

script verify_genre_data 
	if NOT CD
		ForEachIn \{$master_editable_list
			do = verify_genre_data_foreach}
	endif
endscript

script verify_genre_data_foreach 
	if GlobalExists Name = <part> Type = array
		ForEachIn ($<part>) do = verify_genre_data_foreach_part
	endif
endscript

script verify_genre_data_foreach_part 
	if GotParam \{genre}
		if NOT IsArray (<genre>)

		else
			ForEachIn <genre> do = verify_genre_data_foreach_part_genre params = {piece = <desc_id>}
		endif
	endif
endscript

script verify_genre_data_foreach_part_genre 
	if (<checksum> = any)

	endif
	verify_genre genre = <checksum> piece = <piece>
endscript

script verify_genre 
	i = 0
	GetArraySize ($genre_list)
	begin
	if (((($genre_list) [<i>]).desc_id) = <genre>)
		found = 1
		break
	endif
	i = (<i> + 1)
	repeat <array_Size>
	if NOT GotParam \{found}
		if NOT GotParam \{piece}
			piece = None
		endif

	endif
endscript

script create_cas_cache_pak \{Heap = heap_cas}
	if NOT CompositeObjectExists \{Name = global_cas_cache}
		CreateCompositeObject \{components = [
				{
					component = modelbuilder
					create_cache
				}
			]
			params = {
				Name = global_cas_cache
			}}
		global_cas_cache :modelbuilder_createdynamicpak Heap = <Heap> size = <size> vram_size = <vram_size>
	else

	endif
endscript

script free_cas_cache_pak 
	if CompositeObjectExists \{Name = global_cas_cache}
		cascancelloading
		global_cas_cache :Die
		flushdeadobjects
	endif
endscript

script cascacheflushvram 
	if CompositeObjectExists \{Name = global_cas_cache}
		global_cas_cache :modelbuilder_flushdynamicpakvram
	endif
endscript

script cascachemodel async = 0 object_name = ($cas_current_object)
	(<object_name>) :obj_cleargeoms
	if (<async> = 1)
		KillSpawnedScript \{Name = ps2_cas_model_caching}
		SpawnScriptLater ps2_cas_model_caching params = {Heap = heap_musician1 asset_context = heap_musician1 <...>}
	else
		unloadappearancepaks asset_context = heap_musician1 appearance = <appearance>
		loadappearancepaks appearance = <appearance> Heap = heap_musician1 asset_context = heap_musician1
		<callback> {<callbackparams> appearance = <appearance>}
	endif
endscript

script ps2_cas_model_caching 
	Wait \{1
		Seconds}
	unloadappearancepaks async = 1 <...>
	loadappearancepaks async = 1 <...>
	<callback> {<callbackparams> appearance = <appearance>}
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

script cas_artist_flush 
	if NOT CD
		if casartist
			if NOT ($cas_heap_state = in_game)
				stars

				stars
				flush_cas_cache
				cas_rawpak_clear
				disablecasarchive
				cascancelloading
				casblockforcomposite
				casblockforloading
				cas_queue_wait
				getcurrentcasobject
				<cas_object> :obj_cleargeoms
				FinishRendering
				<cas_object> :modelbuilder_unload
				rebuildcurrentcasmodel
			endif
		else
			stars

			stars
		endif
	endif
endscript

script cas_edit_character_profile 

	Change \{cas_current_instrument = None}
	get_musician_profile_struct_by_id id = <character_id> savegame = <savegame>
	setcasappearance appearance = (<profile_struct>.appearance)
	Change cas_current_profile = <character_id>
	Change cas_current_savegame = <savegame>
endscript

script cas_get_player_status 
	<player_status> = ($0x2994109a [$cas_current_player])
	return player_status = <player_status>
endscript

script cas_fix_cameras_for_game 
	KillCamAnim \{all}
	destroy_bg_viewport
	setup_bg_viewport
	restore_dummy_bg_camera
endscript

script cas_load_and_setup_resources 
	mark_unsafe_for_shutdown
	caswaitforunloads \{Block}
	FinishRendering
	if NOT ((GotParam album_art) || (GotParam band_logo))
		GetPakManCurrent \{map = zones}
		if checksumequals a = <pak> b = z_soundcheck
			if ($autolaunch_cas_artist = 1)
				SetPakManCurrentBlock \{map = zones
					pak = z_objviewer_cas
					block_scripts = 1}
				LightShow_InitEventMappings \{force_pakname = 'z_objviewer'}
				lightshow_dummyloop
			else
				SetPakManCurrentBlock \{map = zones
					pak = z_soundcheck_cas
					block_scripts = 1}
			endif
		else

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
				Name = cas_view_cam
				viewport = bg_viewport
				LockTo = World
				Pos = (2.028921, 0.879576, -0.059630997)
				Quat = (-0.000911, 0.9990699, 0.027344998)
				FOV = 72.0
				play_hold = 1
				interrupt_current}
		else
			PlayIGCCam \{id = cas_view_cam_id
				Name = cas_view_cam
				viewport = bg_viewport
				LockTo = World
				Pos = (-0.536864, 2.1043458, 15.148574)
				Quat = (0.0052940003, 0.02768, -0.000218)
				FOV = 72.0
				play_hold = 1
				interrupt_current}
		endif
	endif
	if NOT ((GotParam album_art) || (GotParam band_logo))
		cas_rawpak_setup
	endif
	mark_safe_for_shutdown
endscript

script cas_free_resources \{block_scripts = 0}
	setscriptcannotpause
	mark_unsafe_for_shutdown
	FinishRendering
	casblockforloading
	killallcompositetextures
	castemporariesflush
	caswaitforunloads \{Block}
	cas_rawpak_free
	set_cas_heap_state \{state = in_game}
	if ($shutdown_game_for_signin_change_flag = 0)

		if NOT pakfilesarecached
			destroy_loading_screen
		endif
	endif
	if NOT GotParam \{no_fix_camera}
		cas_fix_cameras_for_game
	endif
	mark_safe_for_shutdown
	Change \{cas_free_cam_active = 0}
endscript

script refreshcasprofile 
	if CD
		return
	endif
	if NOT casartist
		stars

		stars
		return
	endif
	if ($cas_heap_state = in_game)

	endif
	if NOT getcurrentcasobject

	endif
	cas_queue_new_character_profile id = ($cas_current_profile) Player = ($cas_current_player) savegame = ($cas_current_savegame)
	get_musician_profile_struct_by_id id = ($cas_current_profile) savegame = ($cas_current_savegame)
	setcasappearance appearance = (<profile_struct>.appearance)
endscript

script createassetstoragefrombudgetblock 
	if NOT GotParam \{slopheap}
		slopheap = <Name>
	endif
	if NOT GotParam \{AssetContext}
		AssetContext = <Name>
	endif
	cassetupassetstorage Name = <Name> params = {
		allocator = budget
		blockname = <Name>
		AssetContext = <AssetContext>
		slopheap = <slopheap>
	}
endscript

script set_new_car_preset_physique 
	if NOT getcasappearancepart \{part = cas_physique}

	endif
	if NOT getactualcasoptionstruct part = cas_physique desc_id = <desc_id>

	endif
	if NOT GotParam \{preset_builds}

	endif
	if NOT GotParam \{default_car_preset_build_index}

	endif
	chosen = (<preset_builds> [<default_car_preset_build_index>])
	setcasappearanceadditionalbones part = cas_physique additional_bone_transforms = (<chosen>.additional_bone_transforms)
	return preset_physique_index = <default_car_preset_build_index>
endscript

script generate_random_appearance 

	if GotParam \{new_car_character}
		if (<is_female> = 1)
			Change cas_current_appearance = ($default_custom_musician_profile_female.appearance)
		else
			Change cas_current_appearance = ($default_custom_musician_profile_male.appearance)
		endif
		set_new_car_preset_physique
		new_car_character_flag = {new_car_character random_instruments from_car}
	endif
	cas_set_random_appearance genre = <genre> <new_car_character_flag>
endscript

script generate_random_name 

	if (<is_female> = 1)
		getrandomarrayelement ($gh_random_car_female_names)
	else
		getrandomarrayelement ($gh_random_car_male_names)
	endif
	return random_name = <element>
endscript

script generate_random_genre 
	takeaway = 2
	if GotParam \{allow_mixed}
		takeaway = 1
	endif
	GetArraySize \{$genre_list}
	GetRandomValue a = 0 b = (<array_Size> - <takeaway>) Name = genre_index integer
	return genre = ($genre_list [<genre_index>].desc_id)
endscript

script cas_change_current_character_gender 
	if NOT GotParam \{genre}
		genre = (($cas_current_appearance).genre)
	endif
	generate_random_name is_female = <is_female>
	generate_random_appearance is_female = <is_female> genre = <genre> new_car_character
	modify_custom_profile_fullname id = ($cas_current_profile) fullname = <random_name> savegame = ($cas_current_savegame)
	if (is_female = 0)
		modify_custom_profile_blurb id = ($cas_current_profile) savegame = ($cas_current_savegame) blurb = (($default_custom_musician_profile_male).blurb)
	else
		modify_custom_profile_blurb id = ($cas_current_profile) savegame = ($cas_current_savegame) blurb = (($default_custom_musician_profile_female).blurb)
	endif
	cas_queue_add_request appearance = ($cas_current_appearance) Player = ($cas_current_player)
endscript

script ui_load_cas_rawpak \{async = 1}
	return
endscript

script cas_soak_test 
endscript
highway_instrument_map = {
	guitar = cas_guitar_highway
	bass = cas_bass_highway
	drum = cas_drums_highway
}

script get_highway_struct_from_appearance 
	if StructureContains structure = ($highway_instrument_map) <part>
		highway_part = ($highway_instrument_map.<part>)

		if StructureContains structure = <appearance> <highway_part>
			getactualcasoptionstruct part = <highway_part> desc_id = (<appearance>.<highway_part>.desc_id)
		else
			getactualcasoptionstruct part = <highway_part> desc_id = axelhighway
		endif
		return true frontend_img = <frontend_img> highway_pak = <highway_pak> highway_texture = <highway_texture>
	else

		return \{FALSE}
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
		SpawnScriptNow task_menu_default_anim_in params = {base_name = <base_name>}
	elseif GotParam \{alwaysfix}
		SpawnScriptNow task_menu_default_anim_in params = {base_name = <base_name>}
	endif
endscript

script is_part_editable 

	getactualcasoptionstruct part = <part> desc_id = <desc_id>
	if part_has_sections part = <part> desc_id = <desc_id>
		return \{true}
	elseif part_has_materials part = <part> desc_id = <desc_id>
		return \{true}
	else
		if ((GotParam color_all_materials) || (GotParam materials))
			return \{true}
		endif
		return \{FALSE}
	endif
endscript

script part_has_sections 

	getactualcasoptionstruct part = <part> desc_id = <desc_id>
	if GotParam \{sections}
		return \{true}
	endif
	return \{FALSE}
endscript

script part_has_materials 

	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
		return \{FALSE}
	endif
	if GotParam \{materials}
		GetArraySize <materials>
		if (<array_Size> > 0)
			return \{true}
		endif
	else
		if GotParam \{material_groups}
			GetArraySize <material_groups>
			if (<array_Size> > 0)
				return \{true}
			endif
		else
			if GotParam \{modify_all_materials}
				return \{true}
			endif
		endif
	endif
	return \{FALSE}
endscript

script cas_drum_stick_bake_transforms 



	switch <skeletonname>
		case drummer_skeleton0m
		case drummer_skeleton1m
		case drummer_skeleton2m
		case drummer_skeleton3m
		if (<material_index> = 0)
			Pos = (0.0, 0.0, 0.0)
			orientation = (0.0, 0.0, 0.0)
		else
			Pos = (0.0, 0.0, 0.0)
			orientation = (0.0, 0.0, 0.0)
		endif
		case drummer_skeleton0f
		case drummer_skeleton1f
		case drummer_skeleton2f
		case drummer_skeleton3f

		if (<material_index> = 0)

			Pos = (-0.09081, 0.09465001, 0.014779999)
			orientation = (0.0, 0.0, 0.0)
		else

			Pos = (0.09079, 0.09463001, 0.014779999)
			orientation = (0.0, 0.0, 0.0)
		endif
		case 0xd0ef43ee
		case gh_drummer_axel_1
		axel_drumstick_offset <...>
		case gh_drummer_casey_1
		casey_drumstick_offset <...>
		case gh_drummer_clive_1
		clive_drumstick_offset <...>
		case gh_drummer_eddie_1
		eddie_drumstick_offset <...>
		case gh_drummer_izzy_1
		izzy_drumstick_offset <...>
		case gh_drummer_johnny_1
		johnny_drumstick_offset <...>
		case 0x239025b6
		johnnycash_drumstick_offset <...>
		case gh_drummer_shirleymanson_1
		shirleymanson_drumstick_offset <...>
		case gh_drummer_judy_1
		judy_drumstick_offset <...>
		case gh_drummer_lars_1
		lars_drumstick_offset <...>
		case gh_drummer_midori_1
		midori_drumstick_offset <...>
		case gh_drummer_pandora_1
		pandora_drumstick_offset <...>
		case gh_drummer_frankenrocker_1
		frankenrocker_drumstick_offset <...>
		default
		if (<material_index> = 0)
			Pos = (0.0, 0.0, 0.0)
			orientation = (0.0, 0.0, 0.0)
		else
			Pos = (0.0, 0.0, 0.0)
			orientation = (0.0, 0.0, 0.0)
		endif
	endswitch
	obj_baketransform geom = <part> Pos = <Pos>
endscript

script axel_drumstick_offset 

	if (<material_index> = 0)
		Pos = (0.159723, -0.021472, 0.0023196302)
		orientation = (0.0, 0.0, 0.0)
	else
		Pos = (-0.159739, -0.0214857, 0.0023173501)
		orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script casey_drumstick_offset 

	if (<material_index> = 0)
		Pos = (-0.09135061, 0.093663804, -0.0147257)
		orientation = (0.0, 0.0, 0.0)
	else
		Pos = (0.0913313, 0.09364941, -0.0147287)
		orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script clive_drumstick_offset 

	if (<material_index> = 0)
		Pos = (0.0, 0.0, 0.0)
		orientation = (0.0, 0.0, 0.0)
	else
		Pos = (0.0, 0.0, 0.0)
		orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script eddie_drumstick_offset 

	if (<material_index> = 0)
		Pos = (0.0, 0.0, 0.0)
		orientation = (0.0, 0.0, 0.0)
	else
		Pos = (0.0, 0.0, 0.0)
		orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script izzy_drumstick_offset 

	if (<material_index> = 0)
		Pos = (0.0, 0.0, 0.0)
		orientation = (0.0, 0.0, 0.0)
	else
		Pos = (0.0, 0.0, 0.0)
		orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script johnny_drumstick_offset 

	if (<material_index> = 0)
		Pos = (0.0, 0.0, 0.0)
		orientation = (0.0, 0.0, 0.0)
	else
		Pos = (0.0, 0.0, 0.0)
		orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script johnnycash_drumstick_offset 

	if (<material_index> = 0)
		Pos = (0.029867599, -0.00027984398, 0.000767075)
		orientation = (0.0, 0.0, 0.0)
	else
		Pos = (-0.0298582, -0.00026875702, 0.00076712697)
		orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script shirleymanson_drumstick_offset 

	if (<material_index> = 0)
		Pos = (-0.091300905, 0.09368741, -0.014790599)
		orientation = (0.0, 0.0, 0.0)
	else
		Pos = (0.0912823, 0.0936723, -0.014792499)
		orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script judy_drumstick_offset 

	if (<material_index> = 0)
		Pos = (-0.09135061, 0.093663804, -0.0147257)
		orientation = (0.0, 0.0, 0.0)
	else
		Pos = (0.0913313, 0.09364941, -0.0147287)
		orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script lars_drumstick_offset 

	if (<material_index> = 0)
		Pos = (0.12968501, -0.0029761803, 0.0201722)
		orientation = (0.0, 0.0, 0.0)
	else
		Pos = (-0.129701, -0.0029930503, 0.0201723)
		orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script midori_drumstick_offset 

	if (<material_index> = 0)
		Pos = (-0.091301, 0.09368741, -0.014790599)
		orientation = (0.0, 0.0, 0.0)
	else
		Pos = (0.091282204, 0.0936726, -0.014792499)
		orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script pandora_drumstick_offset 

	if (<material_index> = 0)
		Pos = (-0.091301, 0.09368741, -0.014790599)
		orientation = (0.0, 0.0, 0.0)
	else
		Pos = (0.091282204, 0.0936726, -0.014792499)
		orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script frankenrocker_drumstick_offset 

	if (<material_index> = 0)
		Pos = (0.159723, -0.021472, 0.0023196603)
		orientation = (0.0, 0.0, 0.0)
	else
		Pos = (-0.159739, -0.0214857, 0.0023173601)
		orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script avatar_drumstick_offset 
	if (<material_index> = 0)
		Pos = (-0.023487, 0.0465757, 0.0336008)
		orientation = (0.0, 0.0, 0.0)
	else
		Pos = (0.014034899, 0.051011495, 0.024354799)
		orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript
