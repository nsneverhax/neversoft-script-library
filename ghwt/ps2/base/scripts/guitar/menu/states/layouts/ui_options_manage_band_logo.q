
script ui_create_options_manage_band_logo 
	get_current_band_info
	bandname_id = <band_info>
	GetGlobalTags <bandname_id>
	formatText TextName = the_bands_name qs(0xb213c4fe) n = <Name>
	SpawnScriptNow \{menu_manage_band_edit_logo_focus}
	make_generic_menu \{title = qs(0x9baf87e5)
		pad_back_script = band_logo_backout
		vmenu_id = create_options_manage_band_vmenu}
	setup_cas_menu_handlers_restricted \{vmenu_id = create_options_manage_band_vmenu}
	add_generic_menu_text_item {
		text = <the_bands_name>
		text_just = [center center]
		child_anchor = [center center]
		text_offset = (0.0, 0.0)
		heading
	}
	add_generic_menu_text_item \{text = $0x0c138d34
		choose_state = uistate_cap_main
		choose_state_data = {
			text = qs(0x9a6bb96f)
			part = cas_band_logo
			cam_name = 'options_manage_band_logo'
			num_icons = 0
		}}
	add_generic_menu_text_item \{text = $0x25258bec
		choose_state = uistate_band_name_enter
		choose_state_data = {
			from_band_logo = from_band_logo
		}}
	menu_finish
endscript

script ui_destroy_options_manage_band_logo 
	destroy_generic_menu
endscript

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
	return
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
		if NOT StructureContains structure = (<band_logo> [0]) base_tex
			band_logo = ($default_album_cover)
		endif
	else
		get_savegame_from_controller controller = <controller>
		get_current_band_info
		GetGlobalTags savegame = <savegame> <band_info>
		if NOT GotParam \{band_logo}

			return
		endif
	endif
	if GotParam \{band_logo}
		if ischecksum <band_logo>
			if getactualcasoptionstruct part = 0x197f6b46 desc_id = <band_logo>
				if GotParam \{with1}
					generatecagtexture single_texture = (<with1>)
				endif
			endif
		endif
	endif

endscript

script band_logo_backout 
	if NOT getcasappearance

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
