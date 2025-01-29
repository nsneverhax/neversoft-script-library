
script cascachemodel \{async = !i1768515945
		appearance = 0x69696969
		buildscript = !q1768515945
		buildscriptparams = 0x69696969
		global_storage = !q1768515945}
	printf \{'CASCacheModel'}
	if CompositeObjectExists \{Name = global_cas_cache}
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
		dumparchivecache \{Name = cas_building_cache}
	else
		printf \{'CASCacheModel Failed - No cache object'}
	endif
endscript

script create_cas_caches 
	MemPushContext \{heap_cas_cache}
	if NOT CompositeObjectExists \{Name = global_cas_cache}
		CreateCompositeObject \{components = [
				{
					component = modelbuilder
				}
			]
			params = {
				Name = global_cas_cache
			}}
		memory_get_heap_sizes
		setuparchivecache {
			Name = cas_building_cache
			max_files = 128
			size = <cas_building_cache_size>
			vram_size = <cas_building_cache_size_vram>
		}
		if (<cas_ui_precache_size> > 0)
			setuparchivecache {
				Name = cas_ui_precache
				max_files = 1280
				size = <cas_ui_precache_size>
				vram_size = <cas_ui_precache_size_vram>
				no_purge
			}
		endif
	else
		printf \{'Global CAS Cache already exists'}
	endif
	MemPopContext \{heap_cas_cache}
endscript

script free_cas_caches 
	if CompositeObjectExists \{Name = global_cas_cache}
		archivecancelloading \{cas_ui_precache}
		archivewaitloading \{cas_ui_precache
			async = 0}
		global_cas_cache :Die
		flushdeadobjects
		freearchivecache \{Name = cas_building_cache}
		freearchivecache \{Name = cas_ui_precache}
		Change \{cas_current_precached_array_list = None}
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
	if GotParam \{finishes}
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
	RemoveParameter \{finishes}
	if GotParam \{instrument}
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
			ScriptAssert 'ui_cas_precache: bad instrument %s' s = <instrument>
		endswitch
	elseif GotParam \{part}
		cas_get_is_female Player = ($cas_current_player)
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
	if GotParam \{pak}
		ExtendCrc <pak> '_ui_assets' out = array_name
		if GlobalExists Name = <array_name> Type = array
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
	Change cas_current_precached_array_list = <global_array_name>
	archivecancelloading \{cas_ui_precache}
	archivewaitloading \{cas_ui_precache
		async = 0}
	flusharchivecache \{Name = cas_ui_precache}
	flusharchivecache \{Name = cas_ui_precache
		vram}
	archivecachefiles {
		Name = cas_ui_precache
		files = <global_array_name>
		globalarray
		Priority = -1
	}
	KillSpawnedScript \{Name = cas_precache_file_list_timing}
	SpawnScriptNow cas_precache_file_list_timing params = {list_name = <global_array_name>}
endscript

script cas_precache_file_list_timing 
	GetTrueStartTime
	archivewaitloading \{cas_ui_precache
		async = 1}
	GetTrueElapsedTime starttime = <starttime>
	dumparchivecache \{Name = cas_ui_precache}
	finalprintf qs(0xbf4b6e86) a = <ElapsedTime> t = <list_name> DontAssertForChecksums
endscript
