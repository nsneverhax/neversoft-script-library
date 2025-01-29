
script ondebuggerstartup 
	printf \{"Starting up debugger scripts..."}
	sendscriptfunctionstodebugger
	debuggersendmodetext
endscript

script ondebuggerquit 
	clearspritepreview
endscript

script debuggersendmodetext 
	debuggergetmodetext
	runremotescript {
		objid = mouse_window
		scriptname = settitle
		params = {
			('Mouse window: ' + <mode_text>)
		}
	}
endscript

script getgamescriptfunctionlist 
	scriptfunctions = [
		{text = 'Toggle Mouse Select Mode' , scriptname = debuggercycleselectmode}
		{text = 'Preview Image' , scriptname = requestimagepreview}
		{text = 'Clear Previewed Images' , scriptname = clearspritepreview}
		{text = 'Send Camera to Clipboard' , scriptname = copycameralocationtoclipboard}
	]
	return <...>
endscript

script getandcombinescriptfunctionlists 
	getgamescriptfunctionlist
	if scriptexists \{getuserscriptfunctionlist}
		getuserscriptfunctionlist
		if gotparam \{userscriptfunctions}
			return {
				functionsets = [
					{setname = 'User Scripts' functions = <userscriptfunctions>}
					{setname = 'Game Scripts' functions = <scriptfunctions>}
				]
				title = 'Script Function List'
				id = scriptfuncs
				buttonscript = runremotescript
			}
		endif
	endif
	return {
		functionsets = [
			{setname = 'Game Scripts' functions = <scriptfunctions>}
		]
		title = 'Script Function List'
		id = scriptfuncs
		buttonscript = runremotescript
	}
endscript

script sendscriptfunctionstodebugger 
	getandcombinescriptfunctionlists
	runremotescript scriptname = createfunctionlistwindow params = <...>
endscript

script dospritehighlighteffect 
	setscreenelementlock \{id = root_window
		off}
	createscreenelement \{parent = root_window
		id = debugger_sprite_highlight
		type = containerelement
		tags = {
			hide_from_debugger
		}
		just = [
			left
			top
		]
		z_priority = 3000000}
	box_border_width = 3
	box_color = [128 30 128 128]
	resize_color = [128 80 0 128]
	createscreenelement {
		parent = debugger_sprite_highlight
		type = spriteelement
		pos = (<x> * (1.0, 0.0) + <y> * (0.0, 1.0))
		dims = (<w> * (1.0, 0.0) + <box_border_width> * (0.0, 1.0))
		rgba = <box_color>
		just = [left top]
	}
	createscreenelement {
		parent = debugger_sprite_highlight
		type = spriteelement
		pos = (<x> * (1.0, 0.0) + <y> * (0.0, 1.0) + <h> * (0.0, 1.0))
		dims = (<w> * (1.0, 0.0) + <box_border_width> * (0.0, 1.0))
		rgba = <box_color>
		just = [left bottom]
	}
	createscreenelement {
		parent = debugger_sprite_highlight
		type = spriteelement
		pos = (<x> * (1.0, 0.0) + <y> * (0.0, 1.0))
		dims = (<box_border_width> * (1.0, 0.0) + <h> * (0.0, 1.0))
		rgba = <box_color>
		just = [left top]
	}
	createscreenelement {
		parent = debugger_sprite_highlight
		type = spriteelement
		pos = (<x> * (1.0, 0.0) + <w> * (1.0, 0.0) + <y> * (0.0, 1.0))
		dims = (<box_border_width> * (1.0, 0.0) + <h> * (0.0, 1.0))
		rgba = <box_color>
		just = [right top]
	}
	resize_handle_x = 10
	resize_handle_y = 10
	if (<w> < <resize_handle_x>)
		resize_handle_x = <w>
	endif
	if (<h> < <resize_handle_y>)
		resize_handle_y = <h>
	endif
	createscreenelement {
		parent = debugger_sprite_highlight
		type = spriteelement
		pos = (<x> * (1.0, 0.0) + <w> * (1.0, 0.0) + <y> * (0.0, 1.0) + <h> * (0.0, 1.0))
		dims = (<resize_handle_x> * (1.0, 0.0) + <resize_handle_y> * (0.0, 1.0))
		rgba = <resize_color>
		just = [right bottom]
	}
	runscriptonscreenelement \{id = debugger_sprite_highlight
		debugger_sprite_highlight_flash}
endscript

script debugger_sprite_highlight_flash 
	begin
	domorph \{alpha = 0.5
		time = 1}
	domorph \{alpha = 1
		time = 1}
	repeat
endscript

script killspritehighlighteffect 
	if screenelementexists \{id = debugger_sprite_highlight}
		destroyscreenelement \{id = debugger_sprite_highlight}
	endif
endscript

script requestimagepreview 
	runremotescript \{scriptname = getopenfilename
		disabletimeout
		params = {
			typename = 'PNG Images'
			typefilter = '*.png'
		}
		localcallback = requestimagepreview_gotfile}
endscript

script requestimagepreview_gotfile 
	if gotparam \{filename}
		formattext textname = args '-pp -f%a' a = <filename>
		runremotescript {
			scriptname = runshellcommand
			disabletimeout
			params = {
				command = 'bindproj && pngconv.exe'
				args = <args>
			}
			localcallback = requestimagepreview_fileconverted
			callbackparams = {filename = <filename>}
		}
	else
		printf \{"No file selected!"}
	endif
endscript

script requestimagepreview_fileconverted 
	if getrelativepath path = (<callbackparams>.filename) dir = 'images' discard_extension
		getfilenamefrompath path = <relativepath>
	else
		message = 'Sprite needs to be located in ' [proj_root] / data / images ' or subdirectory thereof !!!!'
		printf <message>
		runremotescript scriptname = printf params = {<message>}
		return
	endif
	addimagetogame <...>
endscript

script addimagetogame 
	formattext checksumname = texture_checksum <filename>
	formattext checksumname = sprite_id 'debugger_preview_sprite_%s' s = <filename>
	if screenelementexists id = <sprite_id>
		clearspritepreview_killpreviewelement id = <sprite_id>
	endif
	if NOT istextureindictionary dictionary = sprite texture = <texture_checksum>
		loadtexture <relativepath>
		need_unload = 1
	endif
	element_z = 20000
	if NOT screenelementexists \{id = debugger_sprite_preview_anchor}
		setscreenelementlock \{id = root_window
			off}
		createscreenelement {
			type = containerelement
			parent = root_window
			id = debugger_sprite_preview_anchor
			z_priority = <element_z>
		}
	else
		debugger_sprite_preview_anchor :getsingletag \{element_z}
	endif
	element_z = (<element_z> + 1)
	setscreenelementlock \{id = debugger_sprite_preview_anchor
		off}
	createscreenelement {
		type = spriteelement
		parent = debugger_sprite_preview_anchor
		id = <sprite_id>
		texture = <texture_checksum>
		pos = (200.0, 200.0)
		scale = 1
		rgba = [128 128 128 128]
		z_priority = <element_z>
	}
	<sprite_id> :settags debugger_display_name = <filename>
	debugger_sprite_preview_anchor :settags element_z = <element_z>
	if gotparam \{need_unload}
		<sprite_id> :settags need_sprite_unload = <relativepath>
	endif
endscript

script clearspritepreview 
	if screenelementexists \{id = debugger_sprite_preview_anchor}
		getscreenelementchildren \{id = debugger_sprite_preview_anchor}
		if gotparam \{children}
			i = 0
			getarraysize <children>
			begin
			clearspritepreview_killpreviewelement id = (<children> [<i>])
			i = (<i> + 1)
			repeat <array_size>
		endif
		destroyscreenelement \{id = debugger_sprite_preview_anchor}
	endif
endscript

script clearspritepreview_killpreviewelement 
	if <id> :getsingletag need_sprite_unload
		printf \{"destroying element with sprite unload"}
		destroyscreenelement id = <id>
		unloadtexture <need_sprite_unload>
	else
		printf \{"destroying element with no sprite unload"}
		destroyscreenelement id = <id>
	endif
endscript
