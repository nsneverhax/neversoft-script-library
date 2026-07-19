ui_preview_pak_name = 'pak/ui/ui_testassets.pak'
ui_preview_pak_loaded = 0
ui_preview_pak_size = -1

script debug_ui_loadpreviewpak 
	if ($ui_preview_pak_loaded)
		change \{ui_preview_pak_loaded = 0}
		UnloadPak \{$ui_preview_pak_name}
		WaitUnloadPak \{$ui_preview_pak_name}
	endif
	change \{ui_preview_pak_loaded = 1}
	MemPushContext \{BottomUpHeap}
	LoadPak \{$ui_preview_pak_name}
	if IsPs3
		change ui_preview_pak_size = (<loadpak_alloc_size> + <loadpak_alloc_size_vram>)
	else
		change ui_preview_pak_size = <loadpak_alloc_size>
	endif
	MemPopContext
endscript

script debug_ui_show_paksize 
	if ScreenElementExists \{id = debugpaksize}
		DestroyScreenElement \{id = debugpaksize}
	endif
	if GotParam \{Die}
		return
	endif
	if ($ui_preview_pak_size < 0)
		<text> = qs("\LTest Pak: not loaded")
	else
		FormatText TextName = text qs("\LTest Pak: %dkb") d = ($ui_preview_pak_size / 1024) usecommas
	endif
	CreateScreenElement {
		type = TextElement
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
