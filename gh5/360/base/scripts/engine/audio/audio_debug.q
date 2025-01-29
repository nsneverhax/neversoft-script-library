
script debug_reload_sound 
	printf \{'debug_reload_sound'}
	printstruct <...>
	AllowAssetLoading \{On}
	PushAssetContext
	reloadsound {
		asset_id = <asset_id>
		FileName = <FileName>
	}
	PopAssetContext
	AllowAssetLoading \{OFF}
endscript

script debug_pre_reload_music 
	GuitarEvent_SongFailed
endscript

script debug_post_reload_music 
	postqbromid
endscript
