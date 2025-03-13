
script init_band_logo controller = ($primary_controller)
	cascancelloading
	casblockforcomposite
	casblockforloading
	cas_load_and_setup_resources \{no_cam
		no_bink
		band_logo}
	change \{cas_editing_new_character = false}
	ensure_band_logo_object_created
	setcasappearance \{appearance = {
			cas_band_logo = {
				desc_id = cas_band_logo_id
			}
		}}
	change \{cas_override_object = bandlogoobject}
	get_savegame_from_controller controller = ($band_name_logo_controller)
	get_current_band_info
	getglobaltags savegame = <savegame> <band_info>
	if gotparam \{band_logo}
		setcasappearancecap part = cas_band_logo cap = <band_logo>
		cas_update_band_logo controller = <controller>
	endif
endscript

script ensure_band_logo_object_created 
	if NOT compositeobjectexists \{name = bandlogoobject}
		lightgroup = [band alt_band]
		createcompositeobject {
			params = {
				name = bandlogoobject
				pos = (0.0, 0.0, 0.0)
				assetcontext = ($cas_band_logo_details.assetcontext)
			}
			components = [
				{
					component = skeleton
					skeletonname = gh_rocker_female_original
				}
				{
					component = setdisplaymatrix
				}
				{
					component = animtree
				}
				{
					component = model
					lightgroup = <lightgroup>
				}
				{
					component = modelbuilder
					global_storage = band_logo_block
				}
			]
		}
		bandlogoobject :settags {
			no_bone_work
			instrument = none
			lightgroup = <lightgroup>
		}
		params = {
			async = 0
			buildscriptparams = {
				lightgroup = <lightgroup>
				temporary_heap = heap_cas
			}
			appearance = {
				cas_band_logo = {desc_id = cas_band_logo_id}
			}
		}
		bandlogoobject :modelbuilder_preload <params>
		bandlogoobject :modelbuilder_loadassets <params>
		bandlogoobject :modelbuilder_build <params>
		bandlogoobject :switchoffatomic \{cas_band_logo}
	endif
	return \{object_name = bandlogoobject}
endscript

script cas_update_band_logo controller = ($band_name_logo_controller)
	caswaitforunloads \{block}
	casblockforloading
	casblockforcomposite
	if gotparam \{album_art}
		band_logo = ($editable_jam_album_cover)
		if NOT isarray <band_logo>
			band_logo = ($default_album_cover)
		else
			getarraysize \{band_logo}
			if (<array_size> > 0)
				if NOT structurecontains structure = (<band_logo> [0]) base_tex
					band_logo = ($default_album_cover)
				endif
			else
				band_logo = ($default_album_cover)
			endif
		endif
	else
		get_savegame_from_controller controller = <controller>
		get_current_band_info
		getglobaltags savegame = <savegame> <band_info>
		if NOT gotparam \{band_logo}
			printf \{'No band logo to build!'}
			return
		endif
	endif
	if gotparam \{empty_logo}
		band_logo = []
	endif
	printf \{'Building logo...'}
	bandlogoobject :getsingletag \{lightgroup}
	params = {
		async = 0
		buildscriptparams = {
			lightgroup = <lightgroup>
			temporary_heap = heap_cas
		}
		appearance = {
			cas_band_logo = {
				desc_id = cas_band_logo_id
				cap = <band_logo>
			}
		}
	}
	bandlogoobject :modelbuilder_preload <params>
	bandlogoobject :modelbuilder_loadassets <params>
	bandlogoobject :modelbuilder_build <params>
	bandlogoobject :switchoffatomic \{cas_band_logo}
	casblockforloading
	casblockforcomposite
	flushallcompositetextures
	caswaitforunloads \{block}
	castemporariesflush
	printf \{'Done building logo...'}
endscript

script band_logo_backout 
	if NOT getcasappearance
		scriptassert \{qs(0xd09a342c)}
	endif
	if structurecontains structure = (<appearance>.cas_band_logo) cap
		get_savegame_from_controller controller = ($band_name_logo_controller)
		get_current_band_info
		getglobaltags savegame = <savegame> <band_info>
		if gotparam \{band_logo}
			generatechecksumfromarray \{arrayname = band_logo}
			old_save_checksum = <array_checksum>
			new_cap = ((<appearance>.cas_band_logo).cap)
			generatechecksumfromarray \{arrayname = new_cap}
			if checksumequals a = <old_save_checksum> b = <array_checksum>
				generic_event_back
			else
				setglobaltags savegame = <savegame> <band_info> params = {band_logo = ((<appearance>.cas_band_logo).cap)}
				ui_memcard_autosave \{event = menu_back
					data = {
						num_states = 2
					}}
			endif
		else
			setglobaltags savegame = <savegame> <band_info> params = {band_logo = ((<appearance>.cas_band_logo).cap)}
			ui_memcard_autosave \{event = menu_back
				data = {
					num_states = 2
				}}
		endif
	else
		generic_event_back
	endif
endscript
