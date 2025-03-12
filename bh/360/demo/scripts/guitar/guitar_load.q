song_heap_status = none
song_heap_pakname = 'none'
song_heap_required = 0

script dump_song_heap_status \{title = qs(0x5c9f30ca)}
	printf \{channel = loading
		qs(0xaa9ecf0f)}
	printf channel = loading qs(0x0bc409e2) a = <title>
	printf \{channel = loading
		qs(0xaa9ecf0f)}
	printf channel = loading qs(0xe5d7dcde) a = ($song_heap_pakname) c = ($song_heap_status) b = ($song_heap_required)
	printf \{channel = loading
		qs(0xaa9ecf0f)}
endscript

script load_song_pak \{async = 0}
	requireparams \{[
			songqpak
		]
		all}
	if ischecksum <songqpak>
		scriptassert \{'%s is a checksum! It should be a nonloc string'}
	endif
	formattext checksumname = songcrc '%a' a = <songqpak> addtostringlookup = true
	dump_song_heap_status \{title = qs(0xe2c270c6)}
	if ($song_heap_status = <songcrc>)
		return \{true}
	endif
	printf \{channel = loading
		qs(0x363a19fe)
		a = $song_heap_pakname}
	printf \{qs(0x363a19fe)
		a = $song_heap_pakname}
	unloadpak ($song_heap_pakname)
	waitunloadpak ($song_heap_pakname)
	if ($use_old_system_setup = 0)
		unload_band_song_anims song = ($song_heap_status) async = 1
	endif
	change \{song_heap_status = none}
	change song_heap_status = <songcrc>
	change song_heap_pakname = <songqpak>
	change \{song_heap_required = 1}
	dump_song_heap_status \{title = qs(0x44ad2c2d)}
	if NOT loadpakasync pak_name = <songqpak> heap = heap_song no_vram async = <async>
		return \{false}
	endif
	return \{true}
endscript

script unload_song_pak 
	dump_song_heap_status \{title = qs(0xd750a239)}
	change \{song_heap_required = 0}
	printf \{channel = loading
		qs(0x363a19fe)
		a = $song_heap_pakname}
	printf \{qs(0x363a19fe)
		a = $song_heap_pakname}
	unloadpak \{$song_heap_pakname}
	waitunloadpak \{$song_heap_pakname}
	if ($use_old_system_setup = 0)
		unload_band_song_anims song = ($song_heap_status) async = 1
	endif
	change \{song_heap_status = none}
	change \{song_heap_pakname = 'none'}
	dump_song_heap_status \{title = qs(0x3ce9ae5c)}
endscript

script unload_all_song_paks 
	unload_songqpak
endscript

script debug_load_song 
	requireparams \{[
			song_prefix
		]}
	formattext textname = songqpak 'songs/%a_song.pak' a = <song_prefix> dontassertforchecksums
	printf '*** debug_load_song %s' s = <songqpak>
	if load_song_pak songqpak = <songqpak> async = 1
		return \{true}
	else
		printf \{'*** load_song_pak FAILED'}
		return \{false}
	endif
endscript

script debug_stop_song_unload_pak 
	kill_gem_scroller
	unload_song_pak
endscript

script debug_load_pak_start_song 
	if NOT gotparam \{song_prefix}
		gman_songfunc \{func = get_current_song}
		get_song_prefix song = <current_song>
	endif
	formattext checksumname = song_name '%s' s = <song_prefix>
	if debug_load_song song_prefix = <song_prefix>
		start_song starttime = ($current_starttime) song_name = <song_name>
		restore_start_key_binding
	else
		softassert 'debug_load_song failed for %s' s = <song_prefix>
	endif
endscript
