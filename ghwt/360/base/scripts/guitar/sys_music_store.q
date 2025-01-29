
script music_store_init 
	music_store_show_loading_screen
	cas_destroy_all_characters
	unload_songqpak
	SetPakManCurrentBlock \{map = zones
		pak = None
		block_scripts = 1}
	flushdeferreddeletes
	if isps3
		vmheap \{func = swap_out}
		vmheap \{func = alloc_commerce}
		MemPushContext \{BottomUpHeap}
		MemInitHeap Name = 'heap_musicstore' size = (512 * 1024) vram_size = (8 * 1024 * 1024)
		MemPopContext
	else
		MemPushContext \{heap_song}
		MemInitHeap Name = 'heap_musicstore' size = (9 * 1024 * 1024)
		MemPopContext
	endif
	music_store_hide_loading_screen
endscript

script music_store_deinit 
	music_store_show_loading_screen
	flushdeferreddeletes
	memdeleteheap \{Name = heap_musicstore}
	if isps3
		memdeleteheap \{Name = heap_musicstore_vram}
		vmheap \{func = free_commerce}
		vmheap \{func = swap_in}
	endif
	SetPakManCurrentBlock \{map = zones
		pak = z_soundcheck
		block_scripts = 1}
	music_store_hide_loading_screen
endscript

script music_store_show_loading_screen 
	if isps3
		DisplayLoadingScreen \{'boot_copyright_BG_1'
			spin3d_texture = 'load_wheel'
			spin_x = 877
			spin_y = 467
			Scale = 0.055
			speed = -2}
	endif
endscript

script music_store_hide_loading_screen 
	if isps3
		HideLoadingScreen
	endif
endscript
