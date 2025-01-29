
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
	waitunloadgroup \{cas
		async = 0}
	rebuildcurrentcasmodel \{force_update = 1}
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
	if (<savegame> = -1)
		ScriptAssert 'savegame %s is invalid' s = <savegame>
	endif
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
		KillSpawnedScript \{Name = updatecurrentcasmodelspawned}
		FinishRendering
		casblockforloading
		waitunloadgroup \{cas
			async = 0}
		archivewaitloading \{cas_building_cache
			async = 0}
		create_song_and_musicstudio_heaps
		if NOT GotParam \{no_fix_camera}
		endif
		popunsafeforshutdown \{context = cas_free_resources}
		Change \{cas_free_cam_active = 0}
		Change \{is_in_cas = 0}
	endif
endscript

script createassetstoragefrombudgetblock 
	if NOT GotParam \{slopheap}
		slopheap = <Name>
	endif
	if NOT GotParam \{AssetContext}
		AssetContext = <Name>
	endif
	cassetupassetstorage Name = <Name> params = {
		allocator = simple
		blockname = <Name>
		AssetContext = <AssetContext>
		Heap = <slopheap>
	}
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

script cas_change_current_character_gender \{instrument = None}
	genre = (($cas_current_appearance).genre)
	generate_random_name is_female = <is_female>
	cas_set_random_appearance is_female = <is_female> genre = <genre> savegame = ($cas_current_savegame) new_car_character random_instruments
	Change cas_current_fullname = <random_name>
	if (is_female = 0)
		modify_custom_profile_blurb id = ($cas_current_profile) savegame = ($cas_current_savegame) blurb = (($default_custom_musician_profile_male).blurb)
	else
		modify_custom_profile_blurb id = ($cas_current_profile) savegame = ($cas_current_savegame) blurb = (($default_custom_musician_profile_female).blurb)
	endif
	if ($leaving_genre_select = 1)
		return
	endif
	cas_queue_add_request appearance = ($cas_current_appearance) Player = ($cas_current_player) instrument = <instrument>
endscript

script get_random_avatar_appearance 
	ScriptAssert \{qs(0x8ef307f5)}
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
