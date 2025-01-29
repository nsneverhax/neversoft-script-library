song_heap_status = None
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
	RequireParams \{[
			songqpak
		]
		all}
	if ischecksum <songqpak>
		ScriptAssert \{'%s is a checksum! It should be a nonloc string'}
	endif
	formatText checksumName = songcrc '%a' a = <songqpak> AddToStringLookup = true
	dump_song_heap_status \{title = qs(0xe2c270c6)}
	if ($song_heap_status = <songcrc>)
		return \{true}
	endif
	UnLoadPak ($song_heap_pakname)
	WaitUnloadPak ($song_heap_pakname)
	Change \{song_heap_status = None}
	Change song_heap_status = <songcrc>
	Change song_heap_pakname = <songqpak>
	Change \{song_heap_required = 1}
	dump_song_heap_status \{title = qs(0x44ad2c2d)}
	if NOT LoadPakAsync pak_name = <songqpak> Heap = heap_song no_vram async = <async>
		return \{FALSE}
	endif
	return \{true}
endscript

script unload_song_pak 
	dump_song_heap_status \{title = qs(0xd750a239)}
	Change \{song_heap_required = 0}
	UnLoadPak \{$song_heap_pakname}
	WaitUnloadPak \{$song_heap_pakname}
	Change \{song_heap_status = None}
	Change \{song_heap_pakname = 'none'}
	dump_song_heap_status \{title = qs(0x3ce9ae5c)}
endscript

script unload_all_song_paks 
	unload_songqpak
endscript

script debug_load_song 
	RequireParams \{[
			song_prefix
		]}
	formatText TextName = songqpak 'songs/%a_song.pak' a = <song_prefix> DontAssertForChecksums
	printf '*** debug_load_song %s' s = <songqpak>
	if load_song_pak songqpak = <songqpak> async = 1
		return \{true}
	else
		printf \{'*** load_song_pak FAILED'}
		return \{FALSE}
	endif
endscript

script debug_stop_song_unload_pak 
	kill_gem_scroller
	unload_song_pak
endscript

script debug_load_pak_start_song 
	if NOT GotParam \{song_prefix}
		playlist_getcurrentsong
		get_song_prefix song = <current_song>
	endif
	formatText checksumName = song_name '%s' s = <song_prefix>
	if debug_load_song song_prefix = <song_prefix>
		if GameIsPaused
			ui_event \{event = menu_back
				data = {
					state = Uistate_gameplay
				}}
		endif
		start_song starttime = ($current_starttime) song_name = <song_name>
		restore_start_key_binding
	else
		SoftAssert 'debug_load_song failed for %s' s = <song_prefix>
	endif
endscript
