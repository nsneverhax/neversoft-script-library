
script buildcasmodel \{appearance = 0x69696969
		buildscript = modelbuilder_build_model
		buildscriptparams = 0x69696969
		async = !i1768515945
		use_cache = 0
		appearance_checksum = !q1768515945}
	change \{safe_to_free_cas_temporaries = 0}
	change \{g_cas_model_build_success = 0}
	build_incremental = 0
	if structurecontains structure = <buildscriptparams> build_incremental
		build_incremental = 1
	endif
	gettruestarttime
	onexitrun buildcasmodel_cleanup params = {starttime = <starttime> build_incremental = <build_incremental>}
	if structurecontains \{structure = buildscriptparams
			instrument}
		instrument = (<buildscriptparams>.instrument)
	else
		instrument = none
	endif
	printscriptinfo 'BuildCASModel %a' a = <async> donotresolve
	getsingletag \{asset_heap}
	getsingletag \{lightgroup}
	gethathairchoice
	if (<instrument> = drum)
		use_body_skeleton2 = true
	endif
	filterappearance appearance_name = appearance part_set = $instrument_part_sets chosen_set = <instrument>
	filterappearance appearance_name = appearance part_set = $hair_part_sets chosen_set = <hat_hair_choice>
	buildscriptparams = {
		<buildscriptparams>
		lightgroup = <lightgroup>
		temporary_heap = heap_cas_build
		hat_hair_choice = <hat_hair_choice>
		use_body_skeleton2 = <use_body_skeleton2>
	}
	change \{cancelled_model_build = 0}
	waitunloadgroup cas async = <async>
	modelbuilder_waitforavatar {
		async = <async>
	}
	if ($cancelled_model_build = 1)
		return \{false}
	endif
	archivecancelloading \{cas_building_cache}
	archivewaitloading cas_building_cache async = <async>
	original_async = <async>
	if (<use_cache> = 1)
		cascacheflushvram
		if ($cancelled_model_build = 1)
			return \{false}
		endif
		cascachemodel {
			appearance = <appearance>
			buildscript = <buildscript>
			buildscriptparams = <buildscriptparams>
			async = <async>
			global_storage = <asset_heap>
		}
		if ($cancelled_model_build = 1)
			return \{false}
		endif
		async = 0
	endif
	if (<async> = 1)
		hide
	endif
	archivecancelloading \{cas}
	cascancelavatars
	archivewaitloading \{cas}
	modelbuilder_preload {
		async = <async>
		appearance = <appearance>
		buildscript = <buildscript>
		buildscriptparams = <buildscriptparams>
	}
	if ($cancelled_model_build = 1)
		return \{false}
	endif
	modelbuilder_loadassets {
		async = <async>
	}
	if ($cancelled_model_build = 1)
		printf \{'CancelledLoadAssets-beforeprocess'}
		modelbuilder_processassets
		printf \{'CancelledLoadAssets-afterprocess'}
		return \{false}
	endif
	modelbuilder_waitforavatar {
		async = <async>
	}
	modelbuilder_processassets
	if ($cancelled_model_build = 1)
		return \{false}
	endif
	modelbuilder_build {
		appearance = <appearance>
		buildscript = <buildscript>
		buildscriptparams = <buildscriptparams>
	}
	if structurecontains structure = <buildscriptparams> new_object
		modelbuilder_restorenewobjectlightcache
	endif
	buildcasmodel_compositewait async = <original_async>
	if ($cancelled_model_build = 1)
		return \{false}
	endif
	if (<build_incremental> = 0)
		flushallcompositetextures \{no_block}
	endif
	settags appearance_checksum = <appearance_checksum>
	if ($g_face_preset_glitch_fix_hack = 1)
		hide_glitch \{num_frames = 1}
	endif
	if (<async> = 1)
		wait \{2
			gameframes}
	endif
	unhide
	forceinstanceupdate
	change \{g_cas_model_build_success = 1}
	return \{true}
endscript

script buildcasmodel_cleanup 
	change \{safe_to_free_cas_temporaries = 1}
	castemporariesflush
	if (<build_incremental> = 0)
		buildcasmodel_compositewait \{async = 0}
		flushallcompositetextures
	endif
endscript

script buildcasmodel_compositewait 
	if (<async> = 1)
		caswaitforcomposite
	else
		casblockforcomposite
	endif
endscript

script caswaitforcomposite 
	if modelbuilderiscompositingactive
		begin
		printf \{'Waiting for Compositing...'}
		wait \{1
			gameframe}
		if NOT modelbuilderiscompositingactive
			break
		endif
		repeat
	endif
endscript

script casblockforcomposite 
	if modelbuilderiscompositingactive
		modelbuilderblockforcompositing
	endif
endscript

script cascancelloading 
	archivecancelloading \{cas}
	cascancelavatars
	cas_queue_cancel_loading
	change \{cancelled_model_build = 1}
endscript

script casblockforloading 
	archivewaitloading \{cas
		async = 0}
endscript

script rebuildcurrentcasmodel {
		0x54 instrument = ($cas_current_instrument)
	}
	cas_queue_add_request {
		appearance = ($cas_current_appearance)
		player = ($cas_current_player)
		instrument = <instrument>
		force_update = <force_update>
		in_cas
	}
endscript

script updatecurrentcasmodel {
		0x54 buildscript
		0x59 buildscriptparams = {}
		0x54 instrument = ($cas_current_instrument)
		0x52 flush_assets = 1
		0x52 cache = 1
	}
	if cas_queue_is_busy \{in_queue_too}
		printf \{'UpdateCurrentCASModel: Doing full refresh, CAS queue is already working'}
		rebuildcurrentcasmodel instrument = <instrument>
		return
	endif
	killspawnedscript \{name = updatecurrentcasmodelspawned}
	spawnscriptnow updatecurrentcasmodelspawned params = {
		buildscript = <buildscript>
		buildscriptparams = <buildscriptparams>
		instrument = <instrument>
		flush_assets = <flush_assets>
		cache = <cache>
	}
endscript

script updatecurrentcasmodelspawned \{instrument = !q1768515945
		flush_assets = !i1768515945
		cache = !i1768515945}
	printscriptinfo \{'UpdateCurrentCASModelSpawned'}
	archivewaitloading \{cas
		async = 0}
	caswaitforcomposite
	if NOT ($cas_override_object = none)
		<cache> = 0
		cas_object = ($cas_override_object)
	else
		getcurrentcasobject
	endif
	if gotparam \{cas_object}
		if compositeobjectexists name = <cas_object>
			change \{safe_to_free_cas_temporaries = 0}
			onexitrun updatecurrentcasmodelspawned_cleanup params = {flush_assets = <flush_assets>}
			<cas_object> :getsingletag lightgroup
			<cas_object> :getsingletag asset_heap
			appearance = ($cas_current_appearance)
			get_appearance_checksum {appearance = <appearance> instrument = <instrument> mic = 0}
			gethathairchoice
			filterappearance appearance_name = appearance part_set = $instrument_part_sets chosen_set = <instrument>
			filterappearance appearance_name = appearance part_set = $hair_part_sets chosen_set = <hat_hair_choice>
			if (<instrument> = drum)
				use_body_skeleton2 = true
			endif
			buildscriptparams = {
				<buildscriptparams>
				temporary_heap = heap_cas_build
				instrument = <instrument>
				lightgroup = <lightgroup>
				hat_hair_choice = <hat_hair_choice>
				use_body_skeleton2 = <use_body_skeleton2>
				no_parts_added_or_removed
			}
			if (<cache> = 1)
				cascachemodel {
					async = 0
					appearance = <appearance>
					global_storage = <asset_heap>
					buildscript = <buildscript>
					buildscriptparams = <buildscriptparams>
				}
			endif
			<cas_object> :settags appearance_checksum = <new_appearance_checksum>
			<cas_object> :modelbuilder_preload {
				async = 0
				appearance = <appearance>
				buildscript = <buildscript>
				buildscriptparams = <buildscriptparams>
			}
			<cas_object> :modelbuilder_loadassets {
				async = 0
			}
			<cas_object> :modelbuilder_processassets
			<cas_object> :modelbuilder_build {
				appearance = <appearance>
				buildscript = <buildscript>
				buildscriptparams = <buildscriptparams>
			}
			forceinstanceupdate
		endif
	endif
endscript

script updatecurrentcasmodelspawned_cleanup \{flush_assets = !i1768515945}
	change \{safe_to_free_cas_temporaries = 1}
	if (<flush_assets> = 1)
		castemporariesflush
	endif
endscript
