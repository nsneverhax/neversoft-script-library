
script create_viewport_ui \{viewport_id = menu_viewport
		viewport_override_id = menu_viewport_override
		window_id = viewport_root
		texture = `tex/zones/sound_stage/temp_viewport01.dds`
		texdict = `zones/z_soundcheck/z_soundcheck.tex`
		window_dims = (1280.0, 720.0)}
	destroy_viewport_ui window_id = <window_id> viewport_id = <viewport_id> viewport_override_id = <viewport_override_id>
	if NOT gotparam \{keep_current_level}
		printscriptinfo \{'create_viewport_ui - bad soundcheck load'}
		frontend_load_soundcheck
	endif
	createviewport {
		priority = 6
		id = <viewport_id>
		style = viewport_ui_texture
		has_ui = true
		has_ui_only = true
		no_resolve_depthstencilbuffer = true
	}
	setsearchallassetcontexts
	createviewporttextureoverride {
		id = <viewport_override_id>
		viewportid = <viewport_id>
		texture = <texture>
		texdict = <texdict>
	}
	setsearchallassetcontexts \{off}
	createscreenelement {
		type = windowelement
		parent = root_window
		id = <window_id>
		viewport = <viewport_id>
		dims = <window_dims>
	}
	return {window_id = <window_id>}
endscript

script destroy_viewport_ui \{viewport_id = menu_viewport
		viewport_override_id = menu_viewport_override
		window_id = viewport_root}
	if screenelementexists id = <window_id>
		<window_id> :die
	endif
	if viewportexists id = <viewport_id>
		setsearchallassetcontexts
		destroyviewporttextureoverride id = <viewport_override_id>
		setsearchallassetcontexts \{off}
		destroyviewport id = <viewport_id>
	endif
endscript
