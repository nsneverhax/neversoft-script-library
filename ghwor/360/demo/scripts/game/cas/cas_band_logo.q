
script cas_band_logo_create_object 
	if compositeobjectexists \{name = bandlogoobject}
		scriptassert \{'BandLogoObject already created'}
	endif
	lightgroup = [band alt_band]
	mempushcontext \{bottomupheap}
	createfromdesc {
		name = bandlogoobject
		desc_id = bandlogogameobject
		pos = (0.0, 0.0, 0.0)
		assetcontext = ($cas_band_logo_details.assetcontext)
		uniqueskeletonpath = 'skeletons/EmptyDefaultCharacter.ske'
		skeletonname = bandlogoskeleton
		heap = bottomupheap
		lightgroup = <lightgroup>
		global_storage = band_logo_block
	}
	bandlogoobject :settags {
		instrument = none
		lightgroup = <lightgroup>
	}
	mempopcontext
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
	if gotparam \{album_art}
		if NOT gotparam \{band_logo}
			<band_logo> = ($editable_jam_album_cover)
		endif
		<use_band_logo> = 0
		if isarray <band_logo>
			getarraysize <band_logo>
			if (<array_size> > 0)
				if structurecontains structure = (<band_logo> [0]) base_tex
					<use_band_logo> = 1
				endif
			endif
		endif
		if (<use_band_logo> = 0)
			<band_logo> = ($default_album_cover)
		endif
	else
		get_savegame_from_controller controller = <controller>
		getglobaltags savegame = <savegame> progression_band_info
		if NOT gotparam \{band_logo}
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
	bandlogoobject :getsingletag \{lightgroup}
	<params> = {
		async = 0
		buildscript = modelbuilder_build_logo
		buildscriptparams = {
			lightgroup = <lightgroup>
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
	bandlogoobject :switchoffatomic \{cas_band_logo}
endscript
