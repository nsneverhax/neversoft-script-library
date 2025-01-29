
script vvdbg_pre_asset_stream 
	switch <stream_type>
		case venue_geometry
		LightShow_SetActive \{Active = FALSE}
		Change \{lightshow_enabled = 0}
		destroy_crowd_models
		KillCamAnim \{all}
		case single_texture
		case single_animation
		Change \{lightshow_enabled = 0}
		default
		ScriptAssert \{qs(0x1da7da1b)}
	endswitch
endscript

script vvdbg_post_asset_stream 
	switch <stream_type>
		case venue_geometry
		create_crowd_models
		Wait \{2
			Seconds}
		LightShow_InitEventMappings
		LightShow_SetActive \{Active = true}
		Change \{lightshow_enabled = 1}
		CameraCuts_StartCallback
		if NOT ($view_mode = 0)
			Change \{view_mode = 0}
			ToggleViewMode \{no_reload}
		endif
		case single_texture
		case single_animation
		Change \{lightshow_enabled = 1}
		default
		ScriptAssert \{qs(0x1da7da1b)}
	endswitch
endscript
