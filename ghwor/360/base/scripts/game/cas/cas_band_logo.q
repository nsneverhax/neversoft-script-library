
script cas_band_logo_create_object 
	if CompositeObjectExists \{Name = bandlogoobject}
		ScriptAssert \{'BandLogoObject already created'}
	endif
	LightGroup = [Band Alt_Band]
	MemPushContext \{BottomUpHeap}
	createfromdesc {
		Name = bandlogoobject
		desc_id = bandlogogameobject
		Pos = (0.0, 0.0, 0.0)
		AssetContext = ($cas_band_logo_details.AssetContext)
		uniqueskeletonpath = 'skeletons/EmptyDefaultCharacter.ske'
		skeletonname = bandlogoskeleton
		Heap = BottomUpHeap
		LightGroup = <LightGroup>
		global_storage = band_logo_block
	}
	bandlogoobject :SetTags {
		instrument = None
		LightGroup = <LightGroup>
	}
	MemPopContext
	cas_band_logo_modelbuild \{band_logo = [
		]}
endscript

script cas_band_logo_update {
		0x52 controller = ($band_name_logo_controller)
	}
	cas_queue_block
	waitunloadgroup \{cas
		async = 0}
	casblockforloading
	casblockforcomposite
	if GotParam \{album_art}
		if NOT GotParam \{band_logo}
			<band_logo> = ($editable_jam_album_cover)
		endif
		<use_band_logo> = 0
		if IsArray <band_logo>
			GetArraySize <band_logo>
			if (<array_Size> > 0)
				if StructureContains structure = (<band_logo> [0]) base_tex
					<use_band_logo> = 1
				endif
			endif
		endif
		if (<use_band_logo> = 0)
			<band_logo> = ($default_album_cover)
		endif
	else
		get_savegame_from_controller controller = <controller>
		GetGlobalTags savegame = <savegame> progression_band_info
		if NOT GotParam \{band_logo}
			printf \{'No band logo to build!'}
			return
		endif
	endif
	cas_band_logo_modelbuild band_logo = <band_logo>
	casblockforloading
	casblockforcomposite
	flushallcompositetextures
	waitunloadgroup \{cas
		async = 0}
	printf \{'Done building logo...'}
endscript

script cas_band_logo_modelbuild \{band_logo = !a1768515945}
	printf \{'Building logo...'}
	bandlogoobject :GetSingleTag \{LightGroup}
	<params> = {
		async = 0
		buildscript = modelbuilder_build_logo
		buildscriptparams = {
			LightGroup = <LightGroup>
			temporary_heap = heap_cas_build
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
	bandlogoobject :modelbuilder_processassets
	bandlogoobject :modelbuilder_build <params>
	bandlogoobject :SwitchOffAtomic \{cas_band_logo}
endscript
