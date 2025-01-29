
script qbroperf_stopsong 
	GuitarEvent_SongFailed
endscript

script qbroperf_unloadsong 
	unload_song_pak
endscript

script postqbroperffull 
	formatText TextName = songqpak 'songs/%a_song.pak' a = <song_name> DontAssertForChecksums
	load_song_pak songqpak = <songqpak> async = 1 song_name = <song_name>
	postqbromid
	restore_start_key_binding
endscript

script preqbroperfquick 
	gh_pause_ui
endscript

script postqbroperfquick 
	postqbromid
	restore_start_key_binding
endscript
