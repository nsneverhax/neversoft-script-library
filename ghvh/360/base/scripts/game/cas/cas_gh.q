max_num_create_a_rockers = 20
max_num_instrument_saves = 20
max_num_logo_saves = 30
cas_current_player = 1
cas_current_player_name = cas_player1
cas_editing_new_character = FALSE
charselect_previous_character_id = Judy
cas_node_name = z_soundcheck_trg_waypoint_car_start
cas_empty_heap_score = 0.25

script get_section_index_from_desc_id 
	RequireParams \{[
			part
			target_desc_id
		]
		all}
	if NOT getcasappearancepart part = <part>
		ScriptAssert '%s not found' s = <part> donotresolve
	endif
	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
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
		repeat <array_Size>
	endif
endscript

script find_bone_deform_info 
	RequireParams \{[
			deform_bones
			group_name
		]
		all}
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
		SoftAssert '%p - Genre %g not found. Should match something in the cas_common_arrays.q list' p = <piece> g = <genre> donotresolve
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
		printf \{'Global CAS Cache already exists'}
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

script cascachemodel \{async = 0}
	if CompositeObjectExists \{Name = global_cas_cache}
		global_cas_cache :modelbuilder_cache {
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
	if CompositeObjectExists \{Name = global_cas_cache}
		global_cas_cache :modelbuilder_dumpdynamicpak
	endif
endscript

script cas_artist_flush 
	if NOT CD
		if casartist
			if NOT ($cas_heap_state = in_game)
				stars
				printf \{'******* cas_artist_flush ********'}
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
	Change \{cas_current_instrument = None}
	get_musician_profile_struct_by_id id = <character_id> savegame = <savegame>
	setcasappearance appearance = (<profile_struct>.appearance)
	Change cas_current_profile = <character_id>
	Change cas_current_savegame = <savegame>
endscript

script cas_get_player_status 
	formatText checksumName = player_status 'player%d_status' d = ($cas_current_player)
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
	if NOT GotParam \{no_loading_screen}
		printf \{'cas_free_resources - create_loading_screen'}
		if pakfilesarecached
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
		printf \{'cas_artist=1 must be set in your personal.q file'}
		stars
		return
	endif
	if ($cas_heap_state = in_game)
		printf \{'Only works in CAS'}
	endif
	if NOT getcurrentcasobject
		printf \{'Only works in CAS'}
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
		ScriptAssert \{'%s not found'
			s = cas_physique}
	endif
	if NOT getactualcasoptionstruct part = cas_physique desc_id = <desc_id>
		ScriptAssert '%s %t not found' s = cas_physique t = <desc_id>
	endif
	if NOT GotParam \{preset_builds}
		ScriptAssert \{'preset_builds not found'}
	endif
	if NOT GotParam \{default_car_preset_build_index}
		ScriptAssert \{'default_car_preset_build_index not found'}
	endif
	chosen = (<preset_builds> [<default_car_preset_build_index>])
	setcasappearanceadditionalbones part = cas_physique additional_bone_transforms = (<chosen>.additional_bone_transforms)
	return preset_physique_index = <default_car_preset_build_index>
endscript

script generate_random_appearance 
	RequireParams \{[
			is_female
			genre
		]}
	if GotParam \{new_car_character}
		if (<is_female> = 1)
			Change cas_current_appearance = ($default_custom_musician_profile_female.appearance)
		else
			Change cas_current_appearance = ($default_custom_musician_profile_male.appearance)
		endif
		new_car_character_flag = {new_car_character random_instruments from_car}
	endif
	cas_set_random_appearance genre = <genre> <new_car_character_flag>
endscript

script generate_random_name 
	RequireParams \{[
			is_female
		]}
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
	genre = (($cas_current_appearance).genre)
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
	cas_get_is_female Player = ($cas_current_player)
	if GotParam \{instrument}
		switch (<instrument>)
			case guitar
			pak = cas_guitarpak
			case bass
			pak = cas_basspak
			case drum
			pak = cas_drumspak
			case vocals
			pak = cas_vocalspak
			default
			ScriptAssert 'bad instrument %s' s = <instrument>
		endswitch
	elseif GotParam \{finishes}
		switch (<finishes>)
			case cas_guitar_body
			if NOT getcasappearancepart \{part = cas_guitar_body}
				ScriptAssert \{'%s not found'
					s = cas_guitar_body}
			endif
			if NOT getactualcasoptionstruct part = cas_guitar_body desc_id = <desc_id>
				ScriptAssert '%s %t not found' s = cas_guitar_body t = <desc_id>
			endif
			if GotParam \{pak_num}
				if (($cas_num_finishes_pak) > <pak_num>)
					formatText checksumName = pak_name 'CAS_GUITARPAK_FINISHES_%i' i = <pak_num>
					pak = <pak_name>
				else
					pak = cas_guitarpak_finishes_0
				endif
			else
				pak = cas_guitarpak_finishes_0
			endif
			case cas_bass_body
			if NOT getcasappearancepart \{part = cas_bass_body}
				ScriptAssert \{'%s not found'
					s = cas_bass_body}
			endif
			if NOT getactualcasoptionstruct part = cas_bass_body desc_id = <desc_id>
				ScriptAssert '%s %t not found' s = cas_bass_body t = <desc_id>
			endif
			if GotParam \{pak_num}
				if (($cas_num_finishes_pak) > <pak_num>)
					formatText checksumName = pak_name 'CAS_BASSPAK_FINISHES_%i' i = <pak_num>
					pak = <pak_name>
				else
					pak = cas_basspak_finishes_0
				endif
			else
				pak = cas_basspak_finishes_0
			endif
			default
			printf 'ui_load_cas_rawpak: No pak to load finish=%p' p = <finishes> donotresolve
		endswitch
	else
		resolvebodyspecificpartinappearance part = <part>
		switch (<part>)
			case cas_body
			if (<is_female> = 1)
				pak = cas_female_bodypak
			else
				pak = cas_male_bodypak
			endif
			case cas_female_hair
			case cas_female_hat_hair
			case cas_female_facial_hair
			pak = cas_female_bodypak
			case cas_male_hair
			case cas_male_hat_hair
			case cas_male_facial_hair
			pak = cas_male_bodypak
			case cas_female_hat
			case cas_female_acc_left
			case cas_female_acc_right
			case cas_female_acc_face
			case cas_female_acc_ears
			pak = cas_female_accpak
			case cas_male_hat
			case cas_male_acc_left
			case cas_male_acc_right
			case cas_male_acc_face
			case cas_male_acc_ears
			pak = cas_male_accpak
			case cas_female_torso
			pak = cas_female_torsopak
			case cas_male_torso
			pak = cas_male_torsopak
			case cas_female_legs
			pak = cas_female_legspak
			case cas_male_legs
			pak = cas_male_legspak
			case cas_female_shoes
			pak = cas_female_shoespak
			case cas_male_shoes
			pak = cas_male_shoespak
			case cas_guitar_body
			case cas_guitar_pickguards
			case cas_guitar_bridges
			case cas_guitar_knobs
			case cas_guitar_pickups
			pak = cas_guitarpak
			case cas_guitar_neck
			case cas_guitar_head
			pak = cas_guitarpak_nh
			case cas_bass_body
			case cas_bass_pickguards
			case cas_bass_pickups
			case cas_bass_bridges
			case cas_bass_knobs
			pak = cas_basspak
			case cas_bass_neck
			case cas_bass_head
			pak = cas_basspak_nh
			case cas_drums
			case cas_drums_sticks
			pak = cas_drumspak
			case cas_mic
			case cas_mic_stand
			pak = cas_vocalspak
			default
			printf 'ui_load_cas_rawpak: No pak to load part=%p' p = <part> donotresolve
		endswitch
	endif
	if GotParam \{pak}
		cas_rawpak_set pak = <pak> async = <async>
	endif
endscript

script cas_soak_test 
	randomize \{1980}
	begin
	get_musician_profile_size \{savegame = 0}
	i = 0
	begin
	get_musician_profile_struct_by_index index = <i> savegame = 0
	this_ID = (<profile_struct>.Name)
	if is_selectable_profile profile_struct = <profile_struct>
		cas_queue_new_character_profile Player = RandomInteger (1.0, 4.0) id = <this_ID> savegame = 0
		if (RandomInteger (0.0, 5.0) = 0)
			cas_queue_wait
		else
			if (RandomInteger (0.0, 3.0) > 0)
				frames = Random (@ 1 @ 5 @ 40 @ 100 )
				Wait <frames> gameframes
			endif
			cascancelloading
		endif
		frames = Random (@ 0 @ 1 @ 2 )
		if (<frames> > 0)
			Wait <frames> gameframes
		endif
	endif
	i = (<i> + 1)
	repeat <array_Size>
	repeat 100
endscript
highway_instrument_map = {
	guitar = cas_guitar_highway
	bass = cas_bass_highway
	drum = cas_drums_highway
}

script get_highway_struct_from_appearance 
	if StructureContains structure = ($highway_instrument_map) <part>
		highway_part = ($highway_instrument_map.<part>)
		printf 'Highway part is %s' s = <highway_part> donotresolve
		if StructureContains structure = <appearance> <highway_part>
			getactualcasoptionstruct part = <highway_part> desc_id = (<appearance>.<highway_part>.desc_id)
		else
			getactualcasoptionstruct part = <highway_part> desc_id = axelhighway
		endif
		return true frontend_img = <frontend_img> highway_pak = <highway_pak> highway_texture = <highway_texture>
	else
		printf 'Part %s not found in highway->inst map' s = <part> donotresolve
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
	RequireParams \{[
			part
			desc_id
		]
		all}
	getactualcasoptionstruct part = <part> desc_id = <desc_id>
	if part_has_sections part = <part> desc_id = <desc_id>
		return \{true}
	elseif part_has_materials part = <part> desc_id = <desc_id>
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script part_has_sections 
	RequireParams \{[
			part
			desc_id
		]
		all}
	getactualcasoptionstruct part = <part> desc_id = <desc_id>
	if GotParam \{sections}
		return \{true}
	endif
	return \{FALSE}
endscript

script part_has_materials 
	RequireParams \{[
			part
			desc_id
		]
		all}
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
