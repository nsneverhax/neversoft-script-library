
script load_pak_for_quickplay 
	if NOT ispakloaded \{'pak/quickplay/icons.pak'
			Heap = quota_misc}
		LoadPak \{'pak/quickplay/icons.pak'
			Heap = quota_misc}
	endif
endscript

script unload_pak_for_quickplay \{Wait = FALSE}
	if ispakloaded \{'pak/quickplay/icons.pak'
			Heap = quota_misc}
		UnLoadPak \{'pak/quickplay/icons.pak'}
		if (<Wait> = true)
			WaitUnloadPak \{'pak/quickplay/icons.pak'}
		endif
	endif
endscript
