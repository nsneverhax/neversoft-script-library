
script get_section_index_from_desc_id 
	requireparams \{[
			part
			target_desc_id
		]
		all}
	if getcapsectionsarray appearance = $cas_current_appearance part = <part>
		getarraysize \{sections}
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
	requireparams \{[
			deform_bones
			group_name
		]
		all}
	getarraysize <deform_bones> globalarray
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
	setcasappearancebones part = <part> bones = {}
	updatecurrentcasmodel \{buildscript = reskin_model_from_appearance}
endscript

script verify_genre_data 
	if NOT cd
		foreachin \{$master_editable_list
			do = verify_genre_data_foreach}
	endif
endscript

script verify_genre_data_foreach 
	if globalexists name = <part> type = array
		foreachin ($<part>) do = verify_genre_data_foreach_part
	endif
endscript

script verify_genre_data_foreach_part 
	if gotparam \{genre}
		if NOT isarray (<genre>)
			softassert 'CAS Piece %d\'s genre parameter must be an array, using [ and ]' d = <desc_id>
		else
			foreachin <genre> do = verify_genre_data_foreach_part_genre params = {piece = <desc_id>}
		endif
	endif
endscript

script verify_genre_data_foreach_part_genre 
	if (<checksum> = any)
		scriptassert \{'Cannot use the :any: genre on CAS pieces'}
	endif
	verify_genre genre = <checksum> piece = <piece>
endscript

script verify_genre 
	i = 0
	getarraysize ($cas_genre_list)
	begin
	if (((($cas_genre_list) [<i>]).desc_id) = <genre>)
		found = 1
		break
	endif
	i = (<i> + 1)
	repeat <array_size>
	if NOT gotparam \{found}
		if NOT gotparam \{piece}
			piece = none
		endif
		softassert '%p - Genre %g not found. Should match something in the cas_common_arrays.q list' p = <piece> g = <genre> donotresolve
	endif
endscript

script cas_artist_flush 
	if NOT cd
		if casartist
			if ($is_in_cas = 1)
				stars
				printf \{'******* cas_artist_flush ********'}
				stars
				if scriptisrunning \{cas_artist_flush_worker}
					return
				endif
				spawnscriptnow \{cas_artist_flush_worker}
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
			b = none}
		cas_bonemenu_apply_changes \{kill_objects = 1}
	endif
	killallcompositetextures
	flush_cas_caches
	cascancelloading
	casblockforcomposite
	casblockforloading
	cas_queue_wait
	getcurrentcasobject
	<cas_object> :obj_cleargeoms
	finishrendering
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
	requireparams \{[
			character_id
			savegame
		]
		all}
	change \{cas_current_instrument = guitar_and_vocals}
	characterprofilegetstruct name = <character_id> savegame = <savegame>
	setcasappearance appearance = (<profile_struct>.appearance)
	change cas_current_profile = <character_id>
	change cas_current_savegame = <savegame>
endscript

script cas_get_player 
	return player = ($cas_current_player)
endscript

script cas_load_and_setup_resources \{async = 1}
	printscriptinfo \{channel = cas_debug
		'cas_load_and_setup_resources'}
	if ($is_in_cas = 1)
		scriptassert \{'Already have resources loaded'}
	endif
	change \{is_in_cas = 1}
	if ((gotparam album_art) || (gotparam band_logo))
		push_unsafe_for_shutdown \{reason = cas_load_and_setup_resources}
		waitunloadgroup \{cas
			async = 0}
		finishrendering
		if NOT gotparam \{album_art}
			playigccam \{id = cas_view_cam_id
				name = cas_view_cam
				viewport = bg_viewport
				lockto = world
				pos = (2.028921, 0.879576, -0.059630997)
				quat = (-0.000911, 0.9990699, 0.027344998)
				fov = 72.0
				play_hold = 1
				interrupt_current}
		else
			playigccam \{id = cas_view_cam_id
				name = cas_view_cam
				viewport = bg_viewport
				lockto = world
				pos = (-0.536864, 2.1043458, 15.148574)
				quat = (0.0052940003, 0.02768, -0.000218)
				fov = 72.0
				play_hold = 1
				interrupt_current}
		endif
	else
		destroy_song_and_musicstudio_heaps \{do_unloads}
		loadpakasync pak_name = 'pak/cas_precache_lists.pak' heap = heap_cas_cache async = <async>
		get_heap_sizes
		create_cas_caches
	endif
	animkickoffskinningenable \{enabled = 0}
	if ((gotparam album_art) || (gotparam band_logo))
		pop_unsafe_for_shutdown \{reason = cas_load_and_setup_resources}
	endif
endscript

script cas_free_resources 
	printscriptinfo \{channel = cas_debug
		'cas_free_resources'}
	if ($is_in_cas = 1)
		animkickoffskinningenable \{enabled = 1}
		push_unsafe_for_shutdown \{reason = cas_free_resources}
		unloadpak \{'pak/cas_precache_lists.pak'}
		killspawnedscript \{name = updatecurrentcasmodelspawned}
		finishrendering
		casblockforloading
		killallcompositetextures
		waitunloadgroup \{cas
			async = 0}
		archivecancelloading \{cas_building_cache}
		archivewaitloading \{cas_building_cache
			async = 0}
		free_cas_caches
		create_song_and_musicstudio_heaps
		if NOT gotparam \{no_fix_camera}
		endif
		pop_unsafe_for_shutdown \{reason = cas_free_resources}
		change \{cas_free_cam_active = 0}
		change \{is_in_cas = 0}
	endif
endscript

script refreshcasprofile 
	if cd
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
	cas_queue_new_character_profile id = ($cas_current_profile) player = ($cas_current_player) savegame = ($cas_current_savegame) instrument = ($cas_current_instrument)
	characterprofilegetstruct name = ($cas_current_profile) savegame = ($cas_current_savegame)
	setcasappearance appearance = (<profile_struct>.appearance)
endscript

script createassetstoragefrombudgetblock 
	if NOT gotparam \{slopheap}
		slopheap = <name>
	endif
	if NOT gotparam \{assetcontext}
		assetcontext = <name>
	endif
	cassetupassetstorage name = <name> params = {
		allocator = budget
		blockname = <name>
		assetcontext = <assetcontext>
		slopheap = <slopheap>
	}
endscript

script is_avatar_appearance 
	requireparams \{[
			appearance
		]
		all}
	if structurecontains structure = <appearance> cas_full_body
		if checksumequals a = ((<appearance>.cas_full_body).desc_id) b = avatar
			return \{true}
		endif
	endif
	return \{false}
endscript

script is_avatar_character 
	requireparams \{[
			id
			savegame
		]
		all}
	if (<id> = avatar)
		return \{true}
	endif
	if characterprofilegetstruct name = <id> savegame = <savegame>
		if is_avatar_appearance appearance = (<profile_struct>.appearance)
			return \{true}
		endif
	endif
	return \{false}
endscript

script generate_random_avatar 
	if get_random_avatar_appearance is_female = <is_female>
		change cas_current_appearance = <appearance>
		generate_random_genre
		cas_set_random_avatar_instrument is_female = <is_female> genre = <genre>
	endif
endscript

script generate_random_name 
	requireparams \{[
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
	if gotparam \{allow_mixed}
		takeaway = 1
	endif
	getarraysize \{$cas_genre_list}
	getrandomvalue a = 0 b = (<array_size> - <takeaway>) name = genre_index integer
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
	cas_queue_add_request appearance = ($cas_current_appearance) player = ($cas_current_player) instrument = none
endscript

script cas_set_random_car_appearance 
	requireparams \{[
			savegame
		]
		all}
	is_female = Random (@ 0 @ 1 )
	if (<is_female> = 1)
		profile = ($default_custom_musician_profile_female)
	else
		profile = ($default_custom_musician_profile_male)
	endif
	change cas_current_savegame = <savegame>
	generate_random_name is_female = <is_female>
	generate_random_genre
	cas_set_random_appearance is_female = <is_female> genre = <genre> new_car_character random_instruments
	change cas_current_appearance = {
		($cas_current_appearance)
		car_character = 1
	}
	change \{cas_current_savegame = -1}
endscript

script get_random_avatar_appearance 
	if getavatarcasmetadata randomize is_female = <is_female>
		fullbody_part = ($avatar_profile.appearance.cas_full_body)
		fullbody_part = {<fullbody_part> avatar_meta_data = <metadata>}
		updatestructelement struct = ($avatar_profile.appearance) element = cas_full_body value = <fullbody_part>
		return true appearance = <newstruct>
	endif
	return \{false}
endscript

script cas_soak_test 
endscript

script is_part_editable 
	requireparams \{[
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
		return \{false}
	endif
endscript

script part_has_sections 
	requireparams \{[
			part
			desc_id
		]
		all}
	getactualcasoptionstruct part = <part> desc_id = <desc_id>
	if gotparam \{cap_textures}
		return \{true}
	endif
	if gotparam \{sections}
		scriptassert \{'sections is deprecated'}
	endif
	return \{false}
endscript

script part_has_materials 
	requireparams \{[
			part
			desc_id
		]
		all}
	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
		return \{false}
	endif
	if gotparam \{materials}
		getarraysize <materials>
		if (<array_size> = 0)
			scriptassert 'material array on %s is empty, remove it' s = <desc_id>
		endif
		if (<array_size> > 0)
			return \{true}
		endif
	else
		if gotparam \{material_groups}
			getarraysize <material_groups>
			if (<array_size> = 0)
				scriptassert 'material array on %s is empty, remove it' s = <desc_id>
			endif
			if (<array_size> > 0)
				return \{true}
			endif
		else
			if gotparam \{modify_all_materials}
				return \{true}
			endif
		endif
	endif
	return \{false}
endscript

script part_has_swatch_list 
	requireparams \{[
			part
			desc_id
		]
		all}
	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
		return \{false}
	endif
	if gotparam \{swatch_list}
		return true parent_swatch = <desc_id>
	endif
	if gotparam \{swatch_for}
		return true parent_swatch = <swatch_for>
	endif
	return \{false}
endscript

script get_cas_sponsor_texture_and_title 
	requireparams \{[
			part
		]
		all}
	if NOT getcasappearancepartdescid part = <part>
		return \{false}
	endif
	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
		return \{false}
	endif
	if NOT gotparam \{sponsor_id}
		return \{false}
	endif
	getarraysize ($cas_sponsors)
	j = 0
	begin
	if ((($cas_sponsors [<j>]).id) = <sponsor_id>)
		title = (($cas_sponsors [<j>]).display_name)
		texture = (($cas_sponsors [<j>]).texture)
		return true title = <title> texture = <texture>
	endif
	<j> = (<j> + 1)
	repeat <array_size>
	return \{false}
endscript

script cas_drum_stick_bake_transforms 
	printf \{'cas_drum_stick_bake_transforms'}
	printstruct <...>
	skeleton_getskeletonname
	printf channel = mydebug qs(0x6f2e83c9) s = <skeletonname>
	switch <skeletonname>
		case gh_rocker_male
		if (<material_index> = 0)
			pos = (0.0, 0.0, 0.0)
			orientation = (0.0, 0.0, 0.0)
		else
			pos = (0.0, 0.0, 0.0)
			orientation = (0.0, 0.0, 0.0)
		endif
		case gh_rocker_female
		printf \{channel = mydebug
			qs(0x0111a0f9)}
		if (<material_index> = 0)
			printf \{channel = mydebug
				qs(0x40f6a61c)}
			pos = (-0.09081, 0.09465001, 0.014779999)
			orientation = (0.0, 0.0, 0.0)
		else
			printf \{channel = mydebug
				qs(0xdc7f9334)}
			pos = (0.09079, 0.09463001, 0.014779999)
			orientation = (0.0, 0.0, 0.0)
		endif
		case gh_rocker_axel_1
		axel_drumstick_offset <...>
		case gh_rocker_axel_2
		axel_drumstick_offset <...>
		case gh_rocker_axel_3
		axel_drumstick_offset <...>
		case gh_rocker_axel_4
		axel_drumstick_offset <...>
		case 0x4a380e3b
		axel_drumstick_offset <...>
		case gh_rocker_casey_1
		casey_drumstick_offset <...>
		case gh_rocker_casey_2
		casey_drumstick_offset <...>
		case gh_rocker_casey_3
		casey_drumstick_offset <...>
		case gh_rocker_casey_4
		casey_drumstick_offset <...>
		case 0x65cec3a4
		casey_drumstick_offset <...>
		case gh_rocker_clive_1
		clive_drumstick_offset <...>
		case gh_rocker_clive_2
		clive_drumstick_offset <...>
		case gh_rocker_clive_3
		clive_drumstick_offset <...>
		case gh_rocker_clive_4
		clive_drumstick_offset <...>
		case 0xa490fd3c
		clive_drumstick_offset <...>
		case gh_rocker_eddie_1
		eddie_drumstick_offset <...>
		case gh_rocker_eddie_2
		eddie_drumstick_offset <...>
		case gh_rocker_eddie_3
		eddie_drumstick_offset <...>
		case gh_rocker_eddie_4
		eddie_drumstick_offset <...>
		case 0xdbf9c913
		eddie_drumstick_offset <...>
		case gh_rocker_izzy_1
		izzy_drumstick_offset <...>
		case gh_rocker_izzy_2
		izzy_drumstick_offset <...>
		case gh_rocker_izzy_3
		izzy_drumstick_offset <...>
		case gh_rocker_izzy_4
		izzy_drumstick_offset <...>
		case gh_rocker_johnny_1
		johnny_drumstick_offset <...>
		case gh_rocker_johnny_2
		johnny_drumstick_offset <...>
		case gh_rocker_johnny_3
		johnny_drumstick_offset <...>
		case gh_rocker_johnny_4
		johnny_drumstick_offset <...>
		case gh_rocker_johnnycash_car
		johnnycash_drumstick_offset <...>
		case gh_rocker_shirleymanson_1
		shirleymanson_drumstick_offset <...>
		case 0x48d89fb1
		0xba5bb2eb <...>
		case 0x1a478f49
		0x6b9e2218 <...>
		case gh_rocker_judy_1
		judy_drumstick_offset <...>
		case gh_rocker_judy_2
		judy_drumstick_offset <...>
		case gh_rocker_judy_3
		judy_drumstick_offset <...>
		case gh_rocker_judy_4
		judy_drumstick_offset <...>
		case 0x7a3e3cb7
		judy_drumstick_offset <...>
		case gh_rocker_lars_1
		lars_drumstick_offset <...>
		case gh_rocker_lars_2
		lars_drumstick_offset <...>
		case gh_rocker_lars_3
		lars_drumstick_offset <...>
		case gh_rocker_lars_4
		lars_drumstick_offset <...>
		case gh_rocker_midori_1
		midori_drumstick_offset <...>
		case gh_rocker_midori_2
		midori_drumstick_offset <...>
		case gh_rocker_midori_3
		midori_drumstick_offset <...>
		case gh_rocker_midori_3
		midori_drumstick_offset <...>
		case gh_rocker_midori_4
		midori_drumstick_offset <...>
		case gh_rocker_pandora_1
		pandora_drumstick_offset <...>
		case gh_rocker_pandora_2
		pandora_drumstick_offset <...>
		case gh_rocker_pandora_3
		pandora_drumstick_offset <...>
		case gh_rocker_pandora_4
		pandora_drumstick_offset <...>
		case 0x2dc3c923
		pandora_drumstick_offset <...>
		case gh_rocker_frankenrocker_1
		frankenrocker_drumstick_offset <...>
		case gh_rocker_frankenrocker_2
		frankenrocker_drumstick_offset <...>
		case gh_rocker_frankenrocker_3
		frankenrocker_drumstick_offset <...>
		case gh_rocker_frankenrocker_4
		frankenrocker_drumstick_offset <...>
		case gh_rocker_avatar
		avatar_drumstick_offset <...>
		default
		if (<material_index> = 0)
			pos = (0.0, 0.0, 0.0)
			orientation = (0.0, 0.0, 0.0)
		else
			pos = (0.0, 0.0, 0.0)
			orientation = (0.0, 0.0, 0.0)
		endif
	endswitch
	obj_baketransform material = <material> geom = <part> pos = <pos> orientation = <orientation>
endscript

script axel_drumstick_offset 
	printf \{channel = mydebug
		qs(0xbd4803f3)}
	if (<material_index> = 0)
		pos = (0.159723, -0.021472, 0.0023196302)
		orientation = (0.0, 0.0, 0.0)
	else
		pos = (-0.159739, -0.0214857, 0.0023173501)
		orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script casey_drumstick_offset 
	printf \{channel = mydebug
		qs(0x8ee531fb)}
	if (<material_index> = 0)
		pos = (-0.09135061, 0.093663804, -0.0147257)
		orientation = (0.0, 0.0, 0.0)
	else
		pos = (0.0913313, 0.09364941, -0.0147287)
		orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script clive_drumstick_offset 
	printf \{channel = mydebug
		qs(0x09ed0fba)}
	if (<material_index> = 0)
		pos = (0.0, 0.0, 0.0)
		orientation = (0.0, 0.0, 0.0)
	else
		pos = (0.0, 0.0, 0.0)
		orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script eddie_drumstick_offset 
	printf \{channel = mydebug
		qs(0x9c824f31)}
	if (<material_index> = 0)
		pos = (0.0298674, -0.000279784, 0.0007670819)
		orientation = (0.0, 0.0, 0.0)
	else
		pos = (-0.0298583, -0.00026887702, 0.00076697)
		orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script izzy_drumstick_offset 
	printf \{channel = mydebug
		qs(0x79fd5399)}
	if (<material_index> = 0)
		pos = (0.0, 0.0, 0.0)
		orientation = (0.0, 0.0, 0.0)
	else
		pos = (0.0, 0.0, 0.0)
		orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script johnny_drumstick_offset 
	printf \{channel = mydebug
		qs(0xff20fc33)}
	if (<material_index> = 0)
		pos = (0.0, 0.0, 0.0)
		orientation = (0.0, 0.0, 0.0)
	else
		pos = (0.0, 0.0, 0.0)
		orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script johnnycash_drumstick_offset 
	printf \{channel = mydebug
		qs(0x53bc0781)}
	if (<material_index> = 0)
		pos = (0.029867599, -0.00027984398, 0.000767075)
		orientation = (0.0, 0.0, 0.0)
	else
		pos = (-0.0298582, -0.00026875702, 0.00076712697)
		orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script shirleymanson_drumstick_offset 
	printf \{channel = mydebug
		qs(0x1270c5a4)}
	if (<material_index> = 0)
		pos = (-0.091300905, 0.09368741, -0.014790599)
		orientation = (0.0, 0.0, 0.0)
	else
		pos = (0.0912823, 0.0936723, -0.014792499)
		orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script 0xba5bb2eb 
	printf \{channel = mydebug
		qs(0x40b760c5)}
	if (<material_index> = 0)
		pos = (-0.091300905, 0.09368741, -0.014790599)
		orientation = (0.0, 0.0, 0.0)
	else
		pos = (0.0912823, 0.0936723, -0.014792499)
		orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script 0x6b9e2218 
	printf \{channel = mydebug
		qs(0x8aa5e969)}
	if (<material_index> = 0)
		pos = (-0.091350704, 0.093663804, -0.0147257)
		orientation = (0.0, 0.0, 0.0)
	else
		pos = (0.09133141, 0.09364961, -0.0147287)
		orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script judy_drumstick_offset 
	printf \{channel = mydebug
		qs(0x723699dd)}
	if (<material_index> = 0)
		pos = (-0.09135061, 0.093663804, -0.0147257)
		orientation = (0.0, 0.0, 0.0)
	else
		pos = (0.0913313, 0.09364941, -0.0147287)
		orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script lars_drumstick_offset 
	printf \{channel = mydebug
		qs(0x3debd7a9)}
	if (<material_index> = 0)
		pos = (0.12968501, -0.0029761803, 0.0201722)
		orientation = (0.0, 0.0, 0.0)
	else
		pos = (-0.129701, -0.0029930503, 0.0201723)
		orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script midori_drumstick_offset 
	printf \{channel = mydebug
		qs(0x874b867c)}
	if (<material_index> = 0)
		pos = (-0.091301, 0.09368741, -0.014790599)
		orientation = (0.0, 0.0, 0.0)
	else
		pos = (0.091282204, 0.0936726, -0.014792499)
		orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script pandora_drumstick_offset 
	printf \{channel = mydebug
		qs(0xd0967dbf)}
	if (<material_index> = 0)
		pos = (-0.091301, 0.09368741, -0.014790599)
		orientation = (0.0, 0.0, 0.0)
	else
		pos = (0.091282204, 0.0936726, -0.014792499)
		orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script frankenrocker_drumstick_offset 
	printf \{channel = mydebug
		qs(0xb81db2da)}
	if (<material_index> = 0)
		pos = (0.159723, -0.021472, 0.0023196603)
		orientation = (0.0, 0.0, 0.0)
	else
		pos = (-0.159739, -0.0214857, 0.0023173601)
		orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script avatar_drumstick_offset 
	if (<material_index> = 0)
		pos = (-0.01, 0.055, 0.0)
		orientation = (0.0, 0.0, 0.0)
	else
		pos = (0.01, 0.055, 0.0)
		orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript
