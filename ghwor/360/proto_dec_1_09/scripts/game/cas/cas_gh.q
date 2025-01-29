
script get_section_index_from_desc_id 
	RequireParams \{[
			part
			target_desc_id
		]
		all}
	if getcapsectionsarray appearance = $cas_current_appearance part = <part>
		GetArraySize \{sections}
		if (<array_Size> > 0)
			i = 0
			begin
			if ((<sections> [<i>].desc_id) = <target_desc_id>)
				return true section_index = <i>
			endif
			i = (<i> + 1)
			repeat <array_Size>
		endif
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
	updatecurrentcasmodel \{buildscript = modelbuilder_update_reskins}
endscript

script verify_genre_data 
	if NOT CD
		ForEachIn \{$master_editable_list
			do = verify_genre_data_foreach}
		ForEachIn \{$cas_preset_female_vocals
			do = verify_genre_data_foreach_part}
		ForEachIn \{$cas_preset_male_vocals
			do = verify_genre_data_foreach_part}
		ForEachIn \{$cas_preset_guitars
			do = verify_genre_data_foreach_part}
		ForEachIn \{$cas_preset_basses
			do = verify_genre_data_foreach_part}
		ForEachIn \{$cas_preset_drums
			do = verify_genre_data_foreach_part}
		ForEachIn \{$cas_preset_outfit_female
			do = verify_genre_data_foreach_part}
		ForEachIn \{$cas_preset_outfit_male
			do = verify_genre_data_foreach_part}
		ForEachIn \{$cas_preset_tattoo_female
			do = verify_genre_data_foreach_part}
		ForEachIn \{$cas_preset_tattoo_male
			do = verify_genre_data_foreach_part}
		ForEachIn \{$cas_preset_body_female
			do = verify_genre_data_foreach_part}
		ForEachIn \{$cas_preset_body_male
			do = verify_genre_data_foreach_part}
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
			ScriptAssert 'CAS Piece %d\'s genre parameter must be an array, using [ and ]' d = <desc_id>
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
		ScriptAssert '%p - Genre %g not found. Should match something in the cas_common_arrays.q list' p = <piece> g = <genre> donotresolve
	endif
endscript

script cas_artist_flush 
	if NOT CD
		if casartist
			if ($is_in_cas = 1)
				stars
				printf \{'******* cas_artist_flush ********'}
				stars
				if ScriptIsRunning \{cas_artist_flush_worker}
					return
				endif
				SpawnScriptNow \{cas_artist_flush_worker}
			endif
		else
			stars
			printf \{'cas_artist=1 must be set in your personal.q file'}
			stars
		endif
	endif
endscript

script cas_artist_flush_worker 
	if NOT checksumequals \{a = $cas_reskin_preview
			b = None}
		cas_bonemenu_apply_changes \{kill_objects = 1}
	endif
	killallcompositetextures
	flush_cas_caches
	cascancelloading
	casblockforcomposite
	casblockforloading
	cas_queue_wait
	getcurrentcasobject
	<cas_object> :accoutrement_removealldata
	<cas_object> :obj_cleargeoms
	FinishRendering
	<cas_object> :modelbuilder_unload
	castemporariesflush
	waitunloadgroup \{cas
		async = 0}
	cas_artist_reload_globalpaks
	rebuildcurrentcasmodel \{force_update = 1}
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
	characterprofilegetstruct Name = <character_id> savegame = <savegame>
	setcasappearance appearance = (<profile_struct>.appearance)
	Change cas_current_profile = <character_id>
	Change cas_current_savegame = <savegame>
endscript

script cas_get_player 
	return Player = ($cas_current_player)
endscript

script cas_load_and_setup_resources \{async = 1}
	printscriptinfo \{channel = cas_debug
		'cas_load_and_setup_resources'}
	if ($is_in_cas = 1)
		ScriptAssert \{'Already have resources loaded'}
	endif
	Change \{is_in_cas = 1}
	if ((GotParam album_art) || (GotParam band_logo))
		pushunsafeforshutdown \{context = cas_load_and_setup_resources}
		waitunloadgroup \{cas
			async = 0}
		FinishRendering
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
	else
		destroy_song_and_musicstudio_heaps \{do_unloads}
		LoadPakAsync pak_name = 'pak/cas_precache_lists.pak' Heap = heap_cas_cache async = <async>
		memory_get_heap_sizes
		create_cas_caches
	endif
	animkickoffskinningenable \{Enabled = 0}
	if ((GotParam album_art) || (GotParam band_logo))
		popunsafeforshutdown \{context = cas_load_and_setup_resources}
	endif
endscript

script cas_free_resources 
	printscriptinfo \{channel = cas_debug
		'cas_free_resources'}
	if ($is_in_cas = 1)
		animkickoffskinningenable \{Enabled = 1}
		pushunsafeforshutdown \{context = cas_free_resources}
		UnLoadPak \{'pak/cas_precache_lists.pak'}
		KillSpawnedScript \{Name = updatecurrentcasmodelspawned}
		FinishRendering
		casblockforloading
		killallcompositetextures
		waitunloadgroup \{cas
			async = 0}
		archivecancelloading \{cas_building_cache}
		archivewaitloading \{cas_building_cache
			async = 0}
		free_cas_caches
		create_song_and_musicstudio_heaps
		if NOT GotParam \{no_fix_camera}
		endif
		popunsafeforshutdown \{context = cas_free_resources}
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

script is_avatar_appearance 
	RequireParams \{[
			appearance
		]
		all}
	if StructureContains structure = <appearance> cas_full_body
		if checksumequals a = ((<appearance>.cas_full_body).desc_id) b = avatar
			return \{true}
		endif
	endif
	return \{FALSE}
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
	if characterprofilegetstruct Name = <id> savegame = <savegame>
		if is_avatar_appearance appearance = (<profile_struct>.appearance)
			return \{true}
		endif
	endif
	return \{FALSE}
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
	Change cas_current_fullname = <random_name>
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

script get_random_avatar_appearance 
	if getavatarcasmetadata randomize is_female = <is_female>
		fullbody_part = ($avatar_profile.appearance.cas_full_body)
		fullbody_part = {<fullbody_part> avatar_meta_data = <metadata>}
		updatestructelement struct = ($avatar_profile.appearance) element = cas_full_body value = <fullbody_part>
		return true appearance = <newstruct>
	endif
	return \{FALSE}
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
	if NOT GotParam \{sponsor_id}
		if NOT getcasappearancepartdescid part = <part>
			return \{FALSE}
		endif
		if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
			return \{FALSE}
		endif
		if NOT GotParam \{sponsor_id}
			return \{FALSE}
		endif
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

script 0x1dbb24ff \{characters = [
		]
		0xddf69a88 = 1}
	Change \{debug_unlockall_on_boot = 1}
	GetArraySize <characters>
	if (<array_Size> = 0)
		return
	endif
	<i> = 0
	begin
	<0xe9c6ec54> = 0x5cd2159e
	AppendSuffixToChecksum Base = <0xe9c6ec54> SuffixString = (<characters> [<i>])
	<0xe9c6ec54> = <appended_id>
	formatText checksumName = outfit_name '%n_%i' n = (<characters> [<i>]) i = <0xddf69a88>
	<outfit_array> = ($0x7356e5ae)
	<0x646712fc> = {0xe9c6ec54 = <0xe9c6ec54> outfit_name = <outfit_name>}
	AddArrayElement array = <outfit_array> element = <0x646712fc>
	Change 0x7356e5ae = <array>
	<i> = (<i> + 1)
	repeat <array_Size>
endscript

script 0xb3c74245 
	<outfit_array> = ($0x7356e5ae)
	GetArraySize <outfit_array>
	if (<array_Size> = 0)
		return
	endif
	get_savegame_from_controller controller = ($primary_controller)
	<i> = 0
	begin
	<0xe9c6ec54> = (<outfit_array> [<i>].0xe9c6ec54)
	<outfit_name> = (<outfit_array> [<i>].outfit_name)
	characterprofilegetstruct Name = <0xe9c6ec54> savegame = <savegame>
	<cas_full_body> = {desc_id = <outfit_name>}
	<appearance> = {(<profile_struct>.appearance) cas_full_body = <cas_full_body>}
	<profile_struct> = {<profile_struct> appearance = <appearance>}
	characterprofilesetstruct savegame = <savegame> Name = <0xe9c6ec54> profile_struct = <profile_struct>
	<i> = (<i> + 1)
	repeat <array_Size>
endscript
