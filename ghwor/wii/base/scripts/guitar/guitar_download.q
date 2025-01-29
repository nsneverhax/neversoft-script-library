g_numsongsinlibrary = 0

script dlc_patch_unload 
endscript

script dlc_patch_load 
endscript

script sd_unload_song 
	sap_stop
	sdcardmanagerfunc \{func = clear_cached_song}
endscript
