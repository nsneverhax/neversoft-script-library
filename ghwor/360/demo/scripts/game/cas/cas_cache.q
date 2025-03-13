
script cascachemodel \{async = !i1768515945
		appearance = 0x69696969
		buildscript = !q1768515945
		buildscriptparams = 0x69696969
		global_storage = !q1768515945}
	printf \{'CASCacheModel'}
	if compositeobjectexists \{name = global_cas_cache}
		archivewaitloading {
			cas_building_cache
			async = <async>
		}
		global_cas_cache :modelbuilder_cache {
			cache_name = cas_building_cache
			appearance = <appearance>
			buildscript = <buildscript>
			buildscriptparams = {
				<buildscriptparams>
				caching
			}
			async = <async>
			global_storage = <global_storage>
		}
		dumparchivecache \{name = cas_building_cache}
	else
		printf \{'CASCacheModel Failed - No cache object'}
	endif
endscript

script cascacheflushvram 
	flusharchivecache \{name = cas_building_cache
		vram}
endscript

script create_cas_caches 
	mempushcontext \{heap_cas_cache}
	if NOT compositeobjectexists \{name = global_cas_cache}
		createcompositeobject \{components = [
				{
					component = modelbuilder
				}
			]
			params = {
				name = global_cas_cache
			}}
		memory_get_heap_sizes
		setuparchivecache {
			name = cas_building_cache
			max_files = 128
			size = <cas_building_cache_size>
			vram_size = <cas_building_cache_size_vram>
		}
		if (<cas_ui_precache_size> > 0)
			setuparchivecache {
				name = cas_ui_precache
				max_files = 1280
				size = <cas_ui_precache_size>
				vram_size = <cas_ui_precache_size_vram>
				no_purge
			}
		endif
	else
		printf \{'Global CAS Cache already exists'}
	endif
	mempopcontext \{heap_cas_cache}
endscript

script free_cas_caches 
	if compositeobjectexists \{name = global_cas_cache}
		archivecancelloading \{cas_ui_precache}
		archivewaitloading \{cas_ui_precache
			async = 0}
		global_cas_cache :die
		flushdeadobjects
		freearchivecache \{name = cas_building_cache}
		freearchivecache \{name = cas_ui_precache}
		change \{cas_current_precached_array_list = none}
	endif
endscript

script flush_cas_caches 
	free_cas_caches
	create_cas_caches
endscript

script ui_cas_precache 
	if ($cas_pieces_is_a_reference_archive = 1)
		return
	endif
	if gotparam \{finishes}
		switch (<finishes>)
			case cas_guitar_body
			pak = cas_guitarpak_finishes
			case cas_guitar_pickguards
			case cas_guitar_bridges
			case cas_guitar_knobs
			case cas_guitar_pickups
			case cas_guitar_misc
			return
			case cas_guitar_neck
			case cas_guitar_head
			pak = cas_guitarpak_nh
			default
			part = <finishes>
		endswitch
	endif
	removeparameter \{finishes}
	if gotparam \{instrument}
		switch (<instrument>)
			case guitar
			pak = cas_guitarpak
			case bass
			pak = cas_basspak
			case drum
			pak = cas_drumspak
			case vocals
			pak = cas_vocalspak
			default
			scriptassert 'ui_cas_precache: bad instrument %s' s = <instrument>
		endswitch
	elseif gotparam \{part}
		cas_get_is_female player = ($cas_current_player)
		resolvebodyspecificpartinappearance part = <part>
		switch (<part>)
			case cas_body
			if (<is_female> = 1)
				pak = cas_female_bodypak
			else
				pak = cas_male_bodypak
			endif
			case cas_female_facial_hair
			case cas_female_eyebrows
			pak = cas_female_bodypak
			case cas_male_facial_hair
			case cas_male_eyebrows
			pak = cas_male_bodypak
			case cas_female_hair
			case cas_female_hat_hair
			pak = cas_female_hairpak
			case cas_male_hair
			case cas_male_hat_hair
			pak = cas_male_hairpak
			case cas_female_hat
			case cas_female_acc_left
			case cas_female_acc_right
			case cas_female_acc_face
			case cas_female_acc_ears
			pak = cas_female_accpak
			case cas_male_hat
			case cas_male_acc_left
			case cas_male_acc_right
			case cas_male_acc_face
			case cas_male_acc_ears
			pak = cas_male_accpak
			case cas_female_torso
			pak = cas_female_torsopak
			case cas_male_torso
			pak = cas_male_torsopak
			case cas_female_legs
			pak = cas_female_legspak
			case cas_male_legs
			pak = cas_male_legspak
			case cas_female_shoes
			pak = cas_female_shoespak
			case cas_male_shoes
			pak = cas_male_shoespak
			case cas_guitar_body
			case cas_guitar_pickguards
			case cas_guitar_bridges
			case cas_guitar_knobs
			case cas_guitar_pickups
			case cas_guitar_misc
			pak = cas_guitarpak
			case cas_guitar_neck
			case cas_guitar_head
			pak = cas_guitarpak_nh
			case cas_bass_body
			case cas_bass_pickguards
			case cas_bass_pickups
			case cas_bass_bridges
			case cas_bass_knobs
			case cas_bass_misc
			case cas_bass_neck
			case cas_bass_head
			pak = cas_basspak
			case cas_drums
			case cas_drums_sticks
			pak = cas_drumspak
			case cas_mic
			case cas_mic_stand
			pak = cas_vocalspak
			default
			printf 'ui_cas_precache: No pak to load part=%p' p = <part> donotresolve
		endswitch
	endif
	if gotparam \{pak}
		extendcrc <pak> '_ui_assets' out = array_name
		if globalexists name = <array_name> type = array
			cas_precache_file_list global_array_name = <array_name>
		else
			printf 'ui_cas_precache: %s not found' s = <array_name>
		endif
	endif
endscript

script cas_precache_file_list 
	if (($cas_current_precached_array_list) = <global_array_name>)
		printf 'Already cached or caching %s' s = <global_array_name>
		return
	endif
	change cas_current_precached_array_list = <global_array_name>
	archivecancelloading \{cas_ui_precache}
	archivewaitloading \{cas_ui_precache
		async = 0}
	flusharchivecache \{name = cas_ui_precache}
	flusharchivecache \{name = cas_ui_precache
		vram}
	archivecachefiles {
		name = cas_ui_precache
		files = <global_array_name>
		globalarray
		priority = -1
	}
	killspawnedscript \{name = cas_precache_file_list_timing}
	spawnscriptnow cas_precache_file_list_timing params = {list_name = <global_array_name>}
endscript

script cas_precache_file_list_timing 
	gettruestarttime
	archivewaitloading \{cas_ui_precache
		async = 1}
	gettrueelapsedtime starttime = <starttime>
	dumparchivecache \{name = cas_ui_precache}
	finalprintf qs(0xbf4b6e86) a = <elapsedtime> t = <list_name> dontassertforchecksums
endscript
