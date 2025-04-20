ai_viewer_selected_obj = null
ai_viewer_selected_obj_type = null

script enableaiviewer 
	printf "ENABLE AI VIEWER"
	if ($highdefviewer = 1)
		change object_viewer_globalscale = $hi_def_object_viewer_globalscale
	endif
	if ($highdefviewer = 0)
		change object_viewer_globalscale = $low_def_object_viewer_globalscale
	endif
	if NOT screenelementexists id = view_dot
		setscreenelementlock id = root_window off
		createscreenelement {
			id = view_dot
			type = spriteelement
			texture = white
			rgba = [0 0 255 128]
			scale = 1.0
			pos = (640.0, 360.0)
			parent = root_window
		}
	endif
	if screenelementexists id = obj_viewer_anchor
		destroyscreenelement id = obj_viewer_anchor
	endif
	setscreenelementlock id = root_window off
	createscreenelement {
		type = containerelement
		parent = root_window
		id = obj_viewer_anchor
		pos = (40.0, 200.0)
		just = [center center]
		internal_just = [left center]
	}
	scale = ($object_viewer_yoffset * $object_viewer_globalscale)
	posoffset = ((0.0, 1.0) * <scale>)
	pos0 = ((0.0, 200.0) - (<posoffset> * ($object_viewer_num_lines + 1)))
	createscreenelement {
		type = textelement
		parent = obj_viewer_anchor
		id = view_obj_text1
		pos = <pos0>
		text = "AI Viewer"
		font = text_a1
		rgba = [255 0 0 255]
		just = [left center]
		scale = $object_viewer_globalscale
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (1.0, 1.0)
	}
	pos0 = (<pos0> + <posoffset>)
	createscreenelement {
		type = textelement
		parent = obj_viewer_anchor
		id = view_obj_text2
		pos = <pos0>
		text = ""
		font = text_a1
		rgba = [128 128 128 255]
		just = [left center]
		scale = $object_viewer_globalscale
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (1.0, 1.0)
	}
	pos0 = (<pos0> + <posoffset>)
	createscreenelement {
		type = textelement
		parent = obj_viewer_anchor
		id = view_obj_text3
		pos = <pos0>
		text = ""
		font = text_a1
		rgba = [128 128 128 255]
		just = [left center]
		scale = $object_viewer_globalscale
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (1.0, 1.0)
	}
	pos0 = (<pos0> + <posoffset>)
	createscreenelement {
		type = textelement
		parent = obj_viewer_anchor
		id = view_obj_text4
		pos = <pos0>
		text = ""
		font = text_a1
		rgba = [128 128 128 255]
		just = [left center]
		scale = $object_viewer_globalscale
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (1.0, 1.0)
	}
	pos0 = (<pos0> + <posoffset>)
	createscreenelement {
		type = textelement
		parent = obj_viewer_anchor
		id = view_obj_text5
		pos = <pos0>
		text = ""
		font = text_a1
		rgba = [128 128 128 255]
		just = [left center]
		scale = $object_viewer_globalscale
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (1.0, 1.0)
	}
	pos0 = (<pos0> + <posoffset>)
	createscreenelement {
		type = textelement
		parent = obj_viewer_anchor
		id = view_obj_text6
		pos = <pos0>
		text = ""
		font = text_a1
		rgba = [128 128 128 255]
		just = [left center]
		scale = $object_viewer_globalscale
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (1.0, 1.0)
	}
endscript

script disableaiviewer 
	printf \{"DISABLE AI VIEWER"}
	if screenelementexists \{id = view_dot}
		destroyscreenelement \{id = view_dot}
	endif
	if screenelementexists \{id = obj_viewer_anchor}
		destroyscreenelement \{id = obj_viewer_anchor}
	endif
endscript

script update_ai_viewer 
	if gotparam objname
		setscreenelementprops id = view_obj_text2 text = <objname>
		switch <objtype>
			case agent
			setscreenelementprops id = view_obj_text3 text = "Type: Agent"
			if gotparam profile
				formattext textname = text "Profile: %a" a = <profile>
				setscreenelementprops id = view_obj_text4 text = <text>
			else
				setscreenelementprops id = view_obj_text4 text = ""
			endif
			if gotparam lastanim
				formattext textname = text "Last Anim: %a" a = <lastanim>
				setscreenelementprops id = view_obj_text5 text = <text>
			else
				setscreenelementprops id = view_obj_text5 text = ""
			endif
			setscreenelementprops id = view_obj_text6 text = ""
			case spawnnode
			setscreenelementprops id = view_obj_text3 text = "Type: SpawnNode"
			formattext textname = text "Area: %a" a = <area>
			setscreenelementprops id = view_obj_text4 text = <text>
			formattext textname = text "Relevance: %a" a = <relevance>
			setscreenelementprops id = view_obj_text5 text = <text>
			setscreenelementprops id = view_obj_text6 text = ""
			case interactionnode
			setscreenelementprops id = view_obj_text3 text = "Type: InteractionNode"
			formattext textname = text "Userdata: %a" a = <userdata>
			setscreenelementprops id = view_obj_text4 text = <text>
			formattext textname = text "Action: %a" a = <action>
			setscreenelementprops id = view_obj_text5 text = <text>
			formattext textname = text "Interact Type: %a" a = <interacttype>
			setscreenelementprops id = view_obj_text6 text = <text>
		endswitch
	else
		setscreenelementprops id = view_obj_text2 text = "Nothing Selected"
		setscreenelementprops id = view_obj_text3 text = ""
		setscreenelementprops id = view_obj_text4 text = ""
		setscreenelementprops id = view_obj_text5 text = ""
		setscreenelementprops id = view_obj_text6 text = ""
	endif
endscript

script toggleaidebugmenu 
	if GetViewerAiTarget
		change ai_viewer_selected_obj = <objname>
		change ai_viewer_selected_obj_type = <objtype>
		switch <objtype>
			case agent
			ui_change_state state = UIstate_AIDebug_Agent
			case spawn
			ui_change_state state = UIstate_AIDebug_Spawnnode
			case interaction
			ui_change_state state = UIstate_AIDebug_Interactionnode
			default
			ui_change_state state = UIstate_AIDebug
		endswitch
	else
		change ai_viewer_selected_obj = null
		change ai_viewer_selected_obj_type = invalid
		ui_change_state state = UIstate_AIDebug
	endif
endscript
