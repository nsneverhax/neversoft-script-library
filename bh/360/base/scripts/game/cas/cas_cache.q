
script CASCacheModel \{async = 0}
	printf \{'CASCacheModel'}
	if CompositeObjectExists \{name = Global_Cas_Cache}
		Global_Cas_Cache :ModelBuilder_Cache {
			cache_name = cas_building_cache
			appearance = <appearance>
			buildscriptparams = {
				<buildscriptparams>
				caching
			}
			async = <async>
			global_storage = <global_storage>
		}
		DumpArchiveCache \{name = cas_building_cache}
	else
		printf \{'CASCacheModel Failed - No cache object'}
	endif
endscript

script CASCacheFlushVRAM 
	FlushArchiveCache \{name = cas_building_cache
		vram}
endscript

script create_cas_caches 
	MemPushContext \{heap_cas_cache}
	if NOT CompositeObjectExists \{name = Global_Cas_Cache}
		CreateCompositeObject \{components = [
				{
					component = ModelBuilder
				}
			]
			params = {
				name = Global_Cas_Cache
			}}
		get_heap_sizes
		SetupArchiveCache {
			name = cas_building_cache
			max_files = 128
			size = <cas_building_cache_size>
			vram_size = <cas_building_cache_size_vram>
		}
		if (<cas_ui_precache_size> > 0)
			SetupArchiveCache {
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
	MemPopContext \{heap_cas_cache}
endscript

script free_cas_caches 
	if CompositeObjectExists \{name = Global_Cas_Cache}
		ArchiveCancelLoading \{cas_ui_precache}
		ArchiveWaitLoading \{cas_ui_precache
			async = 0}
		Global_Cas_Cache :Die
		FlushDeadObjects
		FreeArchiveCache \{name = cas_building_cache}
		FreeArchiveCache \{name = cas_ui_precache}
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
	if GotParam \{Finishes}
		switch (<Finishes>)
			case CAS_Guitar_Body
			pak = CAS_GUITARPAK_FINISHES
			case CAS_Guitar_Pickguards
			case CAS_Guitar_Bridges
			case CAS_Guitar_Knobs
			case CAS_Guitar_Pickups
			case CAS_Guitar_Misc
			return
			case CAS_Guitar_Neck
			case CAS_Guitar_Head
			pak = CAS_GUITARPAK_NH
			default
			part = <Finishes>
		endswitch
	endif
	RemoveParameter \{Finishes}
	if GotParam \{instrument}
		switch (<instrument>)
			case guitar
			pak = CAS_GUITARPAK
			case bass
			pak = CAS_BASSPAK
			case Drum
			pak = CAS_DRUMSPAK
			case vocals
			pak = CAS_VOCALSPAK
			default
			ScriptAssert 'ui_cas_precache: bad instrument %s' s = <instrument>
		endswitch
	elseif GotParam \{part}
		cas_get_is_female player = ($cas_current_player)
		ResolveBodySpecificPartInAppearance part = <part>
		switch (<part>)
			case CAS_Body
			if (<is_female> = 1)
				pak = CAS_FEMALE_BODYPAK
			else
				pak = CAS_MALE_BODYPAK
			endif
			case CAS_Female_Facial_Hair
			case CAS_female_Eyebrows
			pak = CAS_FEMALE_BODYPAK
			case CAS_Male_Facial_Hair
			case CAS_male_Eyebrows
			pak = CAS_MALE_BODYPAK
			case CAS_Female_Hair
			case CAS_Female_Hat_Hair
			pak = CAS_FEMALE_HAIRPAK
			case CAS_Male_Hair
			case CAS_Male_Hat_Hair
			pak = CAS_MALE_HAIRPAK
			case CAS_Female_Hat
			case CAS_Female_Acc_Left
			case CAS_Female_Acc_Right
			case CAS_Female_Acc_Face
			case CAS_Female_Acc_Ears
			pak = CAS_FEMALE_ACCPAK
			case CAS_Male_Hat
			case CAS_Male_Acc_Left
			case CAS_Male_Acc_Right
			case CAS_Male_Acc_Face
			case CAS_Male_Acc_Ears
			pak = CAS_MALE_ACCPAK
			case CAS_Female_Torso
			pak = CAS_FEMALE_TORSOPAK
			case CAS_Male_Torso
			pak = CAS_MALE_TORSOPAK
			case CAS_Female_Legs
			pak = CAS_FEMALE_LEGSPAK
			case CAS_Male_Legs
			pak = CAS_MALE_LEGSPAK
			case CAS_Female_Shoes
			pak = CAS_FEMALE_SHOESPAK
			case CAS_Male_Shoes
			pak = CAS_MALE_SHOESPAK
			case CAS_Guitar_Body
			case CAS_Guitar_Pickguards
			case CAS_Guitar_Bridges
			case CAS_Guitar_Knobs
			case CAS_Guitar_Pickups
			case CAS_Guitar_Misc
			pak = CAS_GUITARPAK
			case CAS_Guitar_Neck
			case CAS_Guitar_Head
			pak = CAS_GUITARPAK_NH
			case CAS_Bass_Body
			case CAS_Bass_Pickguards
			case CAS_Bass_Pickups
			case CAS_bass_Bridges
			case CAS_Bass_Knobs
			case CAS_Bass_Misc
			case CAS_Bass_Neck
			case CAS_Bass_Head
			pak = CAS_BASSPAK
			case CAS_Drums
			case CAS_Drums_Sticks
			pak = CAS_DRUMSPAK
			case CAS_Mic
			case CAS_Mic_Stand
			pak = CAS_VOCALSPAK
			default
			printf 'ui_cas_precache: No pak to load part=%p' p = <part> DoNotResolve
		endswitch
	endif
	if GotParam \{pak}
		ExtendCrc <pak> '_ui_assets' out = array_name
		if GlobalExists name = <array_name> type = array
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
	ArchiveCancelLoading \{cas_ui_precache}
	ArchiveWaitLoading \{cas_ui_precache
		async = 0}
	FlushArchiveCache \{name = cas_ui_precache}
	FlushArchiveCache \{name = cas_ui_precache
		vram}
	ArchiveCacheFiles {
		name = cas_ui_precache
		files = <global_array_name>
		GlobalArray
		Priority = -1
	}
	killspawnedscript \{name = cas_precache_file_list_timing}
	spawnscriptnow cas_precache_file_list_timing params = {list_name = <global_array_name>}
endscript

script cas_precache_file_list_timing 
	GetTrueStartTime
	ArchiveWaitLoading \{cas_ui_precache
		async = 1}
	GetTrueElapsedTime starttime = <starttime>
	DumpArchiveCache \{name = cas_ui_precache}
	FinalPrintf qs(0xbf4b6e86) a = <elapsedtime> t = <list_name> DontAssertForChecksums
endscript
