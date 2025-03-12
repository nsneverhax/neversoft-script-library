
script qbroperf_stopsong 
	guitarevent_songfailed
endscript

script qbroperf_unloadsong 
	unload_song_pak
endscript

script postqbroperffull 
	formattext textname = songqpak 'songs/%a_song.pak' a = <song_name> dontassertforchecksums
	load_song_pak songqpak = <songqpak> async = 1 song_name = <song_name>
	postqbromid
	restore_start_key_binding
endscript

script preqbroperfquick 
	pausegh3
endscript

script postqbroperfquick 
	postqbromid
	restore_start_key_binding
endscript
