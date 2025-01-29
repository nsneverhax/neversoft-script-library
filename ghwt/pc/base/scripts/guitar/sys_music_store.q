
script music_store_init 
	music_store_show_loading_screen
	cas_destroy_all_characters
	unload_songqpak
	setpakmancurrentblock \{map = zones
		pak = none
		block_scripts = 1}
	flushdeferreddeletes
	if isps3
		vmheap \{func = swap_out}
		vmheap \{func = alloc_commerce}
		mempushcontext \{bottomupheap}
		meminitheap name = 'heap_musicstore' size = (512 * 1024) vram_size = (8 * 1024 * 1024)
		mempopcontext
	else
		mempushcontext \{heap_song}
		meminitheap name = 'heap_musicstore' size = (9 * 1024 * 1024)
		mempopcontext
	endif
	music_store_hide_loading_screen
endscript

script music_store_deinit 
	music_store_show_loading_screen
	flushdeferreddeletes
	memdeleteheap \{name = heap_musicstore}
	if isps3
		memdeleteheap \{name = heap_musicstore_vram}
		vmheap \{func = free_commerce}
		vmheap \{func = swap_in}
	endif
	setpakmancurrentblock \{map = zones
		pak = z_soundcheck
		block_scripts = 1}
	music_store_hide_loading_screen
endscript

script music_store_show_loading_screen 
	if isps3
		displayloadingscreen \{'boot_copyright_BG_1'
			spin3d_texture = 'load_wheel'
			spin_x = 877
			spin_y = 467
			scale = 0.055
			speed = -2}
	endif
endscript

script music_store_hide_loading_screen 
	if isps3
		hideloadingscreen
	endif
endscript
