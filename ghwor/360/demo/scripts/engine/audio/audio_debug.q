
script debug_reload_sound 
	printf \{'debug_reload_sound'}
	printstruct <...>
	allowassetloading \{on}
	pushassetcontext
	reloadsound {
		asset_id = <asset_id>
		filename = <filename>
	}
	popassetcontext
	allowassetloading \{off}
endscript

script debug_pre_reload_music 
	guitarevent_songfailed
endscript

script debug_post_reload_music 
	postqbromid
endscript
