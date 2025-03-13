mousezoomfactor = 0.2
mouseyoffsetupdownfactor = 0.02
mouserotationupdownfactor = -0.013332999
mouserotationleftrightfactor = 0.01
hi_def_object_viewer_globalscale = 0.6
low_def_object_viewer_globalscale = 0.7
object_viewer_yoffset = 34
object_viewer_globalscale = 1.2
object_viewer_num_lines = 12
default_viewer_modules = [
	defaultviewer
	objectviewer
	dynamicadviewer
]

script enablenewobjviewer 
	if ($highdefviewer = 1)
		change \{object_viewer_globalscale = $hi_def_object_viewer_globalscale}
	endif
	if ($highdefviewer = 0)
		change \{object_viewer_globalscale = $low_def_object_viewer_globalscale}
	endif
	if NOT screenelementexists \{id = view_dot}
		setscreenelementlock \{id = root_window
			off}
		createscreenelement \{id = view_dot
			type = spriteelement
			texture = white
			rgba = [
				255
				0
				0
				128
			]
			scale = 1.0
			pos = (640.0, 360.0)
			parent = root_window}
	endif
	if screenelementexists \{id = obj_viewer_anchor}
		destroyscreenelement \{id = obj_viewer_anchor}
	endif
	setscreenelementlock \{id = root_window
		off}
	createscreenelement \{type = containerelement
		parent = root_window
		id = obj_viewer_anchor
		pos = (100.0, 360.0)
		just = [
			center
			center
		]
		internal_just = [
			left
			center
		]}
	scale = ($object_viewer_yoffset * $object_viewer_globalscale)
	posoffset = ((0.0, 1.0) * <scale>)
	pos0 = ((0.0, 200.0) - (<posoffset> * ($object_viewer_num_lines + 1)))
	createscreenelement \{type = textblockelement
		parent = obj_viewer_anchor
		id = viewer_text_display_block
		pos = (120.0, -300.0)
		dims = (700.0, 700.0)
		text = qs(0x03ac90f0)
		font = debug
		line_spacing = 1
		rgba = [
			58
			108
			58
			255
		]
		just = [
			left
			left
		]
		scale = $object_viewer_globalscale}
endscript

script enableobjviewer 
	if ($highdefviewer = 1)
		change \{object_viewer_globalscale = $hi_def_object_viewer_globalscale}
	endif
	if ($highdefviewer = 0)
		change \{object_viewer_globalscale = $low_def_object_viewer_globalscale}
	endif
	if NOT screenelementexists \{id = view_dot}
		setscreenelementlock \{id = root_window
			off}
		createscreenelement \{id = view_dot
			type = spriteelement
			texture = white
			rgba = [
				255
				0
				0
				128
			]
			scale = 1.0
			pos = (640.0, 360.0)
			parent = root_window}
	endif
	if screenelementexists \{id = obj_viewer_anchor}
		destroyscreenelement \{id = obj_viewer_anchor}
	endif
	setscreenelementlock \{id = root_window
		off}
	createscreenelement \{type = containerelement
		parent = root_window
		id = obj_viewer_anchor
		pos = (100.0, 360.0)
		just = [
			center
			center
		]
		internal_just = [
			left
			center
		]}
	scale = ($object_viewer_yoffset * $object_viewer_globalscale)
	posoffset = ((0.0, 1.0) * <scale>)
	pos0 = ((0.0, 200.0) - (<posoffset> * ($object_viewer_num_lines + 1)))
	createscreenelement {
		type = textelement
		parent = obj_viewer_anchor
		id = view_obj_text1
		pos = <pos0>
		text = qs(0x3f1bbbb1)
		font = debug
		rgba = [60 60 100 255]
		just = [left center]
		scale = $object_viewer_globalscale
	}
	pos0 = (<pos0> + <posoffset>)
	createscreenelement {
		type = textelement
		parent = obj_viewer_anchor
		id = view_obj_text2
		pos = <pos0>
		text = qs(0x3f1bbbb1)
		font = debug
		rgba = [58 108 58 255]
		just = [left center]
		scale = $object_viewer_globalscale
	}
	pos0 = (<pos0> + <posoffset>)
	createscreenelement {
		type = textelement
		parent = obj_viewer_anchor
		id = view_obj_text11
		pos = <pos0>
		text = qs(0x3f1bbbb1)
		font = debug
		rgba = [58 108 58 255]
		just = [left center]
		scale = $object_viewer_globalscale
	}
	pos0 = (<pos0> + <posoffset>)
	createscreenelement {
		type = textelement
		parent = obj_viewer_anchor
		id = view_obj_text12
		pos = <pos0>
		text = qs(0x3f1bbbb1)
		font = debug
		rgba = [58 108 58 255]
		just = [left center]
		scale = $object_viewer_globalscale
	}
	pos0 = (<pos0> + <posoffset>)
	createscreenelement {
		type = textelement
		parent = obj_viewer_anchor
		id = view_obj_text3
		pos = <pos0>
		text = qs(0x3f1bbbb1)
		font = debug
		rgba = [58 108 58 255]
		just = [left center]
		scale = $object_viewer_globalscale
	}
	pos0 = (<pos0> + <posoffset>)
	createscreenelement {
		type = textelement
		parent = obj_viewer_anchor
		id = view_obj_text4
		pos = <pos0>
		text = qs(0x3f1bbbb1)
		font = debug
		rgba = [58 108 58 255]
		just = [left center]
		scale = $object_viewer_globalscale
	}
	pos0 = (<pos0> + <posoffset>)
	createscreenelement {
		type = textelement
		parent = obj_viewer_anchor
		id = view_obj_text5
		pos = <pos0>
		text = qs(0x3f1bbbb1)
		font = debug
		rgba = [58 108 58 255]
		just = [left center]
		scale = $object_viewer_globalscale
	}
	pos0 = (<pos0> + <posoffset>)
	createscreenelement {
		type = textelement
		parent = obj_viewer_anchor
		id = view_obj_text6
		pos = <pos0>
		text = qs(0x3f1bbbb1)
		font = debug
		rgba = [58 108 58 255]
		just = [left center]
		scale = $object_viewer_globalscale
	}
	pos0 = (<pos0> + <posoffset>)
	createscreenelement {
		type = textelement
		parent = obj_viewer_anchor
		id = view_obj_text7
		pos = <pos0>
		text = qs(0x3f1bbbb1)
		font = debug
		rgba = [58 108 58 255]
		just = [left center]
		scale = $object_viewer_globalscale
	}
	pos0 = (<pos0> + <posoffset>)
	createscreenelement {
		type = textelement
		parent = obj_viewer_anchor
		id = view_obj_text8
		pos = <pos0>
		text = qs(0x3f1bbbb1)
		font = debug
		rgba = [58 108 58 255]
		just = [left center]
		scale = $object_viewer_globalscale
	}
	pos0 = (<pos0> + <posoffset>)
	createscreenelement {
		type = textelement
		parent = obj_viewer_anchor
		id = view_obj_text9
		pos = <pos0>
		text = qs(0x3f1bbbb1)
		font = debug
		rgba = [58 108 58 255]
		just = [left center]
		scale = $object_viewer_globalscale
	}
	pos0 = (<pos0> + <posoffset>)
	createscreenelement {
		type = textelement
		parent = obj_viewer_anchor
		id = view_obj_text10
		pos = <pos0>
		text = qs(0x3f1bbbb1)
		font = debug
		rgba = [58 108 58 255]
		just = [left center]
		scale = $object_viewer_globalscale
	}
endscript
default_obj_viewer_display = 1

script updateobjviewer 
	if ($default_obj_viewer_display = 1)
		setscreenelementprops id = view_obj_text2 text = <objname>
		setscreenelementprops id = view_obj_text1 text = <objtype>
		setscreenelementprops id = view_obj_text11 text = <polystat8>
		setscreenelementprops id = view_obj_text12 text = <polystat9>
		setscreenelementprops id = view_obj_text3 text = <polystat0>
		setscreenelementprops id = view_obj_text4 text = <polystat1>
		setscreenelementprops id = view_obj_text5 text = <polystat2>
		setscreenelementprops id = view_obj_text6 text = <polystat3>
		setscreenelementprops id = view_obj_text7 text = <polystat4>
		setscreenelementprops id = view_obj_text8 text = <polystat5>
		setscreenelementprops id = view_obj_text9 text = <polystat6>
		setscreenelementprops id = view_obj_text10 text = <polystat7>
		hide_ai_debug
	else
		setscreenelementprops \{id = view_obj_text2
			text = qs(0x03ac90f0)}
		setscreenelementprops \{id = view_obj_text1
			text = qs(0x03ac90f0)}
		setscreenelementprops \{id = view_obj_text11
			text = qs(0x03ac90f0)}
		setscreenelementprops \{id = view_obj_text12
			text = qs(0x03ac90f0)}
		setscreenelementprops \{id = view_obj_text3
			text = qs(0x03ac90f0)}
		setscreenelementprops \{id = view_obj_text4
			text = qs(0x03ac90f0)}
		setscreenelementprops \{id = view_obj_text5
			text = qs(0x03ac90f0)}
		setscreenelementprops \{id = view_obj_text6
			text = qs(0x03ac90f0)}
		setscreenelementprops \{id = view_obj_text7
			text = qs(0x03ac90f0)}
		setscreenelementprops \{id = view_obj_text8
			text = qs(0x03ac90f0)}
		setscreenelementprops \{id = view_obj_text9
			text = qs(0x03ac90f0)}
		setscreenelementprops \{id = view_obj_text10
			text = qs(0x03ac90f0)}
	endif
	if gotparam \{objid}
		if compositeobjectexists name = <objid>
			if <objid> :containscomponent name = agent
				<objid> :agent_updateviewed
			endif
		endif
	endif
endscript

script disablenewobjviewer 
	if screenelementexists \{id = view_dot}
		destroyscreenelement \{id = view_dot}
	endif
	if screenelementexists \{id = viewer_text_display_block}
		destroyscreenelement \{id = viewer_text_display_block}
	endif
endscript

script disableobjviewer 
	if screenelementexists \{id = view_dot}
		destroyscreenelement \{id = view_dot}
	endif
	if screenelementexists \{id = view_obj_text1}
		destroyscreenelement \{id = view_obj_text1}
	endif
	if screenelementexists \{id = view_obj_text2}
		destroyscreenelement \{id = view_obj_text2}
	endif
	if screenelementexists \{id = view_obj_text3}
		destroyscreenelement \{id = view_obj_text3}
	endif
	if screenelementexists \{id = view_obj_text4}
		destroyscreenelement \{id = view_obj_text4}
	endif
	if screenelementexists \{id = view_obj_text5}
		destroyscreenelement \{id = view_obj_text5}
	endif
	if screenelementexists \{id = view_obj_text6}
		destroyscreenelement \{id = view_obj_text6}
	endif
	if screenelementexists \{id = view_obj_text7}
		destroyscreenelement \{id = view_obj_text7}
	endif
	if screenelementexists \{id = view_obj_text8}
		destroyscreenelement \{id = view_obj_text8}
	endif
	if screenelementexists \{id = view_obj_text9}
		destroyscreenelement \{id = view_obj_text9}
	endif
	if screenelementexists \{id = view_obj_text10}
		destroyscreenelement \{id = view_obj_text10}
	endif
	if screenelementexists \{id = view_obj_text11}
		destroyscreenelement \{id = view_obj_text11}
	endif
	if screenelementexists \{id = view_obj_text12}
		destroyscreenelement \{id = view_obj_text12}
	endif
	if screenelementexists \{id = view_obj_ai}
		destroyscreenelement \{id = view_obj_ai}
	endif
endscript
