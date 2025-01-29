
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
			return true section_index = <i>
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	return \{FALSE}
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
	ScriptAssert \{'exit_to_customize_character: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script verify_genre_data 
	ScriptAssert \{'verify_genre_data: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
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
	GetArraySize ($cas_genre_list)
	begin
	if (((($cas_genre_list) [<i>]).desc_id) = <genre>)
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

script create_cas_cache_pak \{Heap = quota_cas}
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

script dump_cas_cache 
	ScriptAssert \{'dump_cas_cache: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
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
	Change \{cas_current_instrument = guitar_and_vocals}
	characterprofilegetstruct Name = <character_id> savegame = <savegame>
	setcasappearance appearance = (<profile_struct>.appearance)
	Change cas_current_profile = <character_id>
	Change cas_current_savegame = <savegame>
endscript

script cas_get_player 
	return Player = ($cas_current_player)
endscript

script cas_print_player_info 
	ScriptAssert \{'cas_print_player_info: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script cas_fix_cameras_for_game 
	KillCamAnim \{all}
	destroy_bg_viewport
	setup_bg_viewport
	restore_dummy_bg_camera
endscript

script cas_load_and_setup_resources \{async = 1}
	printscriptinfo \{channel = cas_debug
		'cas_load_and_setup_resources'}
	if ($is_in_cas = 1)
		ScriptAssert \{'Already have resources loaded'}
	endif
	Change \{is_in_cas = 1}
	if ((GotParam album_art) || (GotParam band_logo))
		mark_unsafe_for_shutdown
		caswaitforunloads \{Block}
		FinishRendering
		if NOT GotParam \{no_cam}
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
	else
		cas_rawpak_setup
	endif
	if ((GotParam album_art) || (GotParam band_logo))
		mark_safe_for_shutdown
	endif
endscript

script cas_free_resources 
	printscriptinfo \{channel = cas_debug
		'cas_free_resources'}
	if ($is_in_cas = 1)
		mark_unsafe_for_shutdown
		KillSpawnedScript \{Name = updatecurrentcasmodelspawned}
		cas_rawpak_free
		FinishRendering
		casblockforloading
		killallcompositetextures
		caswaitforunloads \{Block}
		if NOT GotParam \{no_fix_camera}
		endif
		mark_safe_for_shutdown
		Change \{cas_free_cam_active = 0}
		Change \{is_in_cas = 0}
	endif
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
	if ($is_in_cas = 0)
		printf \{'Only works in CAS'}
		return
	endif
	if NOT getcurrentcasobject
		printf \{'Only works in CAS'}
		return
	endif
	cas_queue_new_character_profile id = ($cas_current_profile) Player = ($cas_current_player) savegame = ($cas_current_savegame) instrument = ($cas_current_instrument)
	characterprofilegetstruct Name = ($cas_current_profile) savegame = ($cas_current_savegame)
	setcasappearance appearance = (<profile_struct>.appearance)
endscript

script createassetstoragefrombudgetblock 
	ScriptAssert \{'CreateAssetStorageFromBudgetBlock: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script is_avatar_appearance 
	return \{FALSE}
endscript

script is_avatar_character 
	return \{FALSE}
endscript

script generate_random_avatar 
	ScriptAssert \{qs(0x8ef307f5)}
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
	GetArraySize \{$cas_genre_list}
	GetRandomValue a = 0 b = (<array_Size> - <takeaway>) Name = genre_index integer
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
	cas_queue_add_request appearance = ($cas_current_appearance) Player = ($cas_current_player) instrument = None
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

script ui_load_cas_rawpak \{async = 1}
	return
endscript

script cas_soak_test 
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
		if ((GotParam color_all_materials) || (GotParam materials))
			return \{true}
		endif
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
	if GotParam \{cap_textures}
		return \{true}
	endif
	if GotParam \{sections}
		ScriptAssert \{'sections is deprecated'}
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
		if (<array_Size> = 0)
			ScriptAssert 'material array on %s is empty, remove it' s = <desc_id>
		endif
		if (<array_Size> > 0)
			return \{true}
		endif
	else
		if GotParam \{material_groups}
			GetArraySize <material_groups>
			if (<array_Size> = 0)
				ScriptAssert 'material array on %s is empty, remove it' s = <desc_id>
			endif
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

script part_has_swatch_list 
	RequireParams \{[
			part
			desc_id
		]
		all}
	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
		return \{FALSE}
	endif
	if GotParam \{swatch_list}
		return true parent_swatch = <desc_id>
	endif
	if GotParam \{swatch_for}
		return true parent_swatch = <swatch_for>
	endif
	return \{FALSE}
endscript

script get_cas_sponsor_texture_and_title 
	RequireParams \{[
			part
		]
		all}
	if NOT getcasappearancepartdescid part = <part>
		return \{FALSE}
	endif
	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
		return \{FALSE}
	endif
	if NOT GotParam \{sponsor_id}
		return \{FALSE}
	endif
	GetArraySize ($cas_sponsors)
	j = 0
	begin
	if ((($cas_sponsors [<j>]).id) = <sponsor_id>)
		title = (($cas_sponsors [<j>]).display_name)
		texture = (($cas_sponsors [<j>]).texture)
		return true title = <title> texture = <texture>
	endif
	<j> = (<j> + 1)
	repeat <array_Size>
	return \{FALSE}
endscript

script cas_drum_stick_bake_transforms 
	printf \{'cas_drum_stick_bake_transforms'}
	printstruct <...>
	Skeleton_GetSkeletonName
	printf channel = mydebug qs(0x6f2e83c9) s = <skeletonname>
	switch <skeletonname>
		case gh_rocker_male
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
		case gh_rocker_female
		case drummer_skeleton0f
		case drummer_skeleton1f
		case drummer_skeleton2f
		case drummer_skeleton3f
		printf \{channel = mydebug
			qs(0x0111a0f9)}
		if (<material_index> = 0)
			printf \{channel = mydebug
				qs(0x40f6a61c)}
			Pos = (-0.09081, 0.09465001, 0.014779999)
			orientation = (0.0, 0.0, 0.0)
		else
			printf \{channel = mydebug
				qs(0xdc7f9334)}
			Pos = (0.09079, 0.09463001, 0.014779999)
			orientation = (0.0, 0.0, 0.0)
		endif
		case gh_drummer_axel_1
		axel_drumstick_offset <...>
		case gh_drummer_axel_2
		axel_drumstick_offset <...>
		case gh_drummer_axel_3
		axel_drumstick_offset <...>
		case gh_drummer_axel_4
		axel_drumstick_offset <...>
		case gh_drummer_casey_1
		casey_drumstick_offset <...>
		case gh_drummer_casey_2
		casey_drumstick_offset <...>
		case gh_drummer_casey_3
		casey_drumstick_offset <...>
		case gh_drummer_casey_4
		casey_drumstick_offset <...>
		case gh_drummer_clive_1
		clive_drumstick_offset <...>
		case gh_drummer_clive_2
		clive_drumstick_offset <...>
		case gh_drummer_clive_3
		clive_drumstick_offset <...>
		case gh_drummer_clive_4
		clive_drumstick_offset <...>
		case gh_drummer_eddie_1
		eddie_drumstick_offset <...>
		case gh_drummer_eddie_2
		eddie_drumstick_offset <...>
		case gh_drummer_eddie_3
		eddie_drumstick_offset <...>
		case gh_drummer_eddie_4
		eddie_drumstick_offset <...>
		case gh_drummer_izzy_1
		izzy_drumstick_offset <...>
		case gh_drummer_izzy_2
		izzy_drumstick_offset <...>
		case gh_drummer_izzy_3
		izzy_drumstick_offset <...>
		case gh_drummer_izzy_4
		izzy_drumstick_offset <...>
		case gh_drummer_johnny_1
		johnny_drumstick_offset <...>
		case gh_drummer_johnny_2
		johnny_drumstick_offset <...>
		case gh_drummer_johnny_3
		johnny_drumstick_offset <...>
		case gh_drummer_johnny_4
		johnny_drumstick_offset <...>
		case gh_drummer_johnnycash_car
		johnnycash_drumstick_offset <...>
		case gh_drummer_shirleymanson_1
		shirleymanson_drumstick_offset <...>
		case gh_drummer_judy_1
		judy_drumstick_offset <...>
		case gh_drummer_judy_2
		judy_drumstick_offset <...>
		case gh_drummer_judy_3
		judy_drumstick_offset <...>
		case gh_drummer_judy_4
		judy_drumstick_offset <...>
		case gh_drummer_lars_1
		lars_drumstick_offset <...>
		case gh_drummer_lars_2
		lars_drumstick_offset <...>
		case gh_drummer_lars_3
		lars_drumstick_offset <...>
		case gh_drummer_lars_4
		lars_drumstick_offset <...>
		case gh_drummer_midori_1
		midori_drumstick_offset <...>
		case gh_drummer_midori_2
		midori_drumstick_offset <...>
		case gh_drummer_midori_3
		midori_drumstick_offset <...>
		case gh_drummer_midori_3
		midori_drumstick_offset <...>
		case gh_drummer_midori_4
		midori_drumstick_offset <...>
		case gh_drummer_pandora_1
		pandora_drumstick_offset <...>
		case gh_drummer_pandora_2
		pandora_drumstick_offset <...>
		case gh_drummer_pandora_3
		pandora_drumstick_offset <...>
		case gh_drummer_pandora_4
		pandora_drumstick_offset <...>
		case gh_drummer_frankenrocker_1
		frankenrocker_drumstick_offset <...>
		case gh_drummer_frankenrocker_2
		frankenrocker_drumstick_offset <...>
		case gh_drummer_frankenrocker_3
		frankenrocker_drumstick_offset <...>
		case gh_drummer_frankenrocker_4
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
	obj_baketransform material = <material> geom = <part> Pos = <Pos> orientation = <orientation>
endscript

script axel_drumstick_offset 
	printf \{channel = mydebug
		qs(0xbd4803f3)}
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
	printf \{channel = mydebug
		qs(0x8ee531fb)}
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
	printf \{channel = mydebug
		qs(0x09ed0fba)}
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
	printf \{channel = mydebug
		qs(0x9c824f31)}
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
	printf \{channel = mydebug
		qs(0x79fd5399)}
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
	printf \{channel = mydebug
		qs(0xff20fc33)}
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
	printf \{channel = mydebug
		qs(0x53bc0781)}
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
	printf \{channel = mydebug
		qs(0x1270c5a4)}
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
	printf \{channel = mydebug
		qs(0x723699dd)}
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
	printf \{channel = mydebug
		qs(0x3debd7a9)}
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
	printf \{channel = mydebug
		qs(0x874b867c)}
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
	printf \{channel = mydebug
		qs(0xd0967dbf)}
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
	printf \{channel = mydebug
		qs(0xb81db2da)}
	if (<material_index> = 0)
		Pos = (0.159723, -0.021472, 0.0023196603)
		orientation = (0.0, 0.0, 0.0)
	else
		Pos = (-0.159739, -0.0214857, 0.0023173601)
		orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript
