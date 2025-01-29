mousezoomfactor = 0.2
mouseyoffsetupdownfactor = 0.02
mouserotationupdownfactor = -0.013332999
mouserotationleftrightfactor = 0.01
hi_def_object_viewer_globalscale = 0.3
low_def_object_viewer_globalscale = 0.45000002
object_viewer_yoffset = 34
object_viewer_globalscale = 0.6
object_viewer_num_lines = 12

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
			pos = (320.0, 240.0)
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
		pos = (20.0, 250.0)
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
		text = "None"
		font = text_a1
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
		text = "None"
		font = text_a1
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
		text = "None"
		font = text_a1
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
		text = "None"
		font = text_a1
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
		text = "None"
		font = text_a1
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
		text = "None"
		font = text_a1
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
		text = "None"
		font = text_a1
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
		text = "None"
		font = text_a1
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
		text = "None"
		font = text_a1
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
		text = "None"
		font = text_a1
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
		text = "None"
		font = text_a1
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
		text = "None"
		font = text_a1
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
			text = ""}
		setscreenelementprops \{id = view_obj_text1
			text = ""}
		setscreenelementprops \{id = view_obj_text11
			text = ""}
		setscreenelementprops \{id = view_obj_text12
			text = ""}
		setscreenelementprops \{id = view_obj_text3
			text = ""}
		setscreenelementprops \{id = view_obj_text4
			text = ""}
		setscreenelementprops \{id = view_obj_text5
			text = ""}
		setscreenelementprops \{id = view_obj_text6
			text = ""}
		setscreenelementprops \{id = view_obj_text7
			text = ""}
		setscreenelementprops \{id = view_obj_text8
			text = ""}
		setscreenelementprops \{id = view_obj_text9
			text = ""}
		setscreenelementprops \{id = view_obj_text10
			text = ""}
	endif
	if gotparam \{objid}
		if compositeobjectexists name = <objid>
			if <objid> :containscomponent name = agent
				<objid> :agent_updateviewed
			endif
		endif
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
