
script init_band_logo controller = ($primary_controller)
	casblockforloading
	cas_load_and_setup_resources \{no_cam
		no_bink
		band_logo}
	Change \{cas_editing_new_character = FALSE}
	ensure_band_logo_object_created
	setcasappearance \{appearance = {
			cas_band_logo = {
				desc_id = cas_band_logo_id
			}
		}}
	Change \{cas_override_object = bandlogoobject}
	get_savegame_from_controller controller = ($band_name_logo_controller)
	get_current_band_info
	GetGlobalTags savegame = <savegame> <band_info>
	if GotParam \{band_logo}
		setcasappearancecap part = cas_band_logo cap = <band_logo>
		cas_update_band_logo controller = <controller>
	endif
endscript

script ensure_band_logo_object_created 
	if NOT CompositeObjectExists \{Name = bandlogoobject}
		LightGroup = [Band Alt_Band]
		CreateCompositeObject {
			params = {
				Name = bandlogoobject
				Pos = (0.0, 0.0, 0.0)
				AssetContext = ($cas_band_logo_details.AssetContext)
			}
			components = [
				{
					component = Skeleton
					skeletonname = gh_rocker_female_original
				}
				{
					component = SetDisplayMatrix
				}
				{
					component = AnimTree
				}
				{
					component = Model
					LightGroup = <LightGroup>
				}
				{
					component = modelbuilder
					global_storage = band_logo_block
				}
			]
		}
		bandlogoobject :SetTags {
			no_bone_work
			instrument = None
			LightGroup = <LightGroup>
		}
		params = {
			async = 0
			buildscriptparams = {
				LightGroup = <LightGroup>
				temporary_heap = heap_cas
			}
			appearance = {
				cas_band_logo = {desc_id = cas_band_logo_id}
			}
		}
		bandlogoobject :modelbuilder_preload <params>
		bandlogoobject :modelbuilder_loadassets <params>
		bandlogoobject :modelbuilder_build <params>
		bandlogoobject :SwitchOffAtomic \{cas_band_logo}
	endif
	return \{object_name = bandlogoobject}
endscript

script cas_update_band_logo controller = ($band_name_logo_controller)
	caswaitforunloads \{Block}
	casblockforloading
	casblockforcomposite
	if GotParam \{album_art}
		band_logo = ($editable_jam_album_cover)
		if NOT IsArray <band_logo>
			band_logo = ($default_album_cover)
		else
			GetArraySize \{band_logo}
			if (<array_Size> > 0)
				if NOT StructureContains structure = (<band_logo> [0]) base_tex
					band_logo = ($default_album_cover)
				endif
			else
				band_logo = ($default_album_cover)
			endif
		endif
	else
		get_savegame_from_controller controller = <controller>
		get_current_band_info
		GetGlobalTags savegame = <savegame> <band_info>
		if NOT GotParam \{band_logo}
			printf \{'No band logo to build!'}
			return
		endif
	endif
	if GotParam \{empty_logo}
		band_logo = []
	endif
	printf \{channel = UI
		'Building logo...'}
	bandlogoobject :GetSingleTag \{LightGroup}
	params = {
		async = 0
		buildscriptparams = {
			LightGroup = <LightGroup>
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
	bandlogoobject :SwitchOffAtomic \{cas_band_logo}
	casblockforloading
	casblockforcomposite
	flushallcompositetextures
	caswaitforunloads \{Block}
	castemporariesflush
	printf \{channel = UI
		'Done building logo...'}
endscript

script band_logo_backout 
	if NOT getcasappearance
		ScriptAssert \{qs(0xd09a342c)}
	endif
	if StructureContains structure = (<appearance>.cas_band_logo) cap
		get_savegame_from_controller controller = ($band_name_logo_controller)
		get_current_band_info
		GetGlobalTags savegame = <savegame> <band_info>
		if GotParam \{band_logo}
			generatechecksumfromarray \{ArrayName = band_logo}
			old_save_checksum = <array_checksum>
			new_cap = ((<appearance>.cas_band_logo).cap)
			generatechecksumfromarray \{ArrayName = new_cap}
			if checksumequals a = <old_save_checksum> b = <array_checksum>
				generic_event_back
			else
				SetGlobalTags savegame = <savegame> <band_info> params = {band_logo = ((<appearance>.cas_band_logo).cap)}
				ui_memcard_autosave \{event = menu_back
					data = {
						num_states = 2
					}}
			endif
		else
			SetGlobalTags savegame = <savegame> <band_info> params = {band_logo = ((<appearance>.cas_band_logo).cap)}
			ui_memcard_autosave \{event = menu_back
				data = {
					num_states = 2
				}}
		endif
	else
		generic_event_back
	endif
endscript
