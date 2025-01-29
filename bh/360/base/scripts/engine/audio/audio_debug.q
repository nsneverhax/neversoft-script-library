
script debug_reload_sound 
	printf \{'debug_reload_sound'}
	printstruct <...>
	AllowAssetLoading \{on}
	PushAssetContext
	ReloadSound {
		asset_id = <asset_id>
		FileName = <FileName>
	}
	PopAssetContext
	AllowAssetLoading \{off}
endscript

script debug_pre_reload_music 
	GuitarEvent_SongFailed
endscript

script debug_post_reload_music 
	postqbromid
endscript
