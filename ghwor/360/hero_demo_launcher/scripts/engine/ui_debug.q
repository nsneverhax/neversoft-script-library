ui_preview_pak_name = 'pak/ui/ui_testassets.pak'
ui_preview_pak_loaded = 0
ui_preview_pak_size = -1

script debug_ui_loadpreviewpak 
	if ($ui_preview_pak_loaded)
		change \{ui_preview_pak_loaded = 0}
		unloadpak \{$ui_preview_pak_name}
		waitunloadpak \{$ui_preview_pak_name}
	endif
	change \{ui_preview_pak_loaded = 1}
	mempushcontext \{bottomupheap}
	loadpak \{$ui_preview_pak_name}
	if isps3
		change ui_preview_pak_size = (<loadpak_alloc_size> + <loadpak_alloc_size_vram>)
	else
		change ui_preview_pak_size = <loadpak_alloc_size>
	endif
	mempopcontext
endscript

script debug_ui_show_paksize 
	if screenelementexists \{id = debugpaksize}
		destroyscreenelement \{id = debugpaksize}
	endif
	if gotparam \{die}
		return
	endif
	if ($ui_preview_pak_size < 0)
		<text> = qs(0x661324a9)
	else
		formattext textname = text qs(0x81a85be4) d = ($ui_preview_pak_size / 1024) usecommas
	endif
	createscreenelement {
		type = textelement
		parent = root_window
		id = debugpaksize
		just = [left center]
		pos = (160.0, 664.0)
		z_priority = 10000
		rgba = [255 255 255 255]
		use_shadow = true
		shadow_rgba = [0 , 0 , 0 , 255]
		shadow_offs = (3.0, 3.0)
		tags = {hide_from_debugger}
		scale = 0.75
		text = <text>
		font = debug
	}
endscript
