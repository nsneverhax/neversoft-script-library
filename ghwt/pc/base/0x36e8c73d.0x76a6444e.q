0x60c6999d = 0
0xceccdecc = 0

script 0xcc791438 
	getglobaltags \{user_options}
	make_menu_frontend \{id = 0xe5668e05
		screen = guitarist
		title = qs(0xc1e39a57)
		pad_back_script = 0xd1311e94}
	add_menu_frontend_item \{text = qs(0x79f30cde)
		pos = (20.0, 0.0)
		pad_choose_script = 0xc9a3d3d1
		pad_choose_params = {
			no_restart
			player = 1
		}}
	winportgfxgetoptionchoices \{option = 0}
	getarraysize <choices>
	choicecount = <array_size>
	winportgfxgetoptionvalue \{option = 0}
	winportgfxsetoptionvalue option = 0 value = <value>
	createscreenelement {
		id = 0xdd973907
		parent = <item_container_id>
		type = textblockelement
		pos = (20.0, 20.0)
		text = (<choices> [<value>])
		font = fontgrid_title_a1
		dims = (0.0, 26.0)
		fit_height = `scale down if larger`
		fit_width = `expand dims`
		rgba = [255 255 255 255]
		internal_just = [center , center]
		just = [center , center]
		pos_anchor = [center , center]
		z_priority = 50
	}
	add_menu_frontend_item \{text = qs(0xc67b1e73)
		pos = (20.0, 0.0)
		pad_choose_script = 0xa17fdfa5
		pad_choose_params = {
			no_restart
			player = 1
		}}
	winportgfxgetoptionvalue \{option = 1}
	0xe756903f = <value>
	if (<0xe756903f> = 1)
		0xb73579f0 = data_settings_checkmark
	else
		0xb73579f0 = data_settings_xmark
	endif
	createscreenelement {
		id = 0x0f098e20
		type = spriteelement
		parent = <item_container_id>
		local_id = check
		pos = (0.0, 20.0)
		just = [center center]
		texture = <0xb73579f0>
	}
	add_menu_frontend_item \{text = qs(0x423ada32)
		pos = (20.0, 0.0)
		pad_choose_script = 0xda0675ca
		pad_choose_params = {
			no_restart
			player = 1
		}}
	winportgfxgetoptionvalue \{option = 2}
	0x96d5f572 = <value>
	if (<0x96d5f572> = 0)
		0xcef90f57 = data_settings_xmark
	else
		0xcef90f57 = data_settings_checkmark
	endif
	createscreenelement {
		id = 0x4d5ce250
		type = spriteelement
		parent = <item_container_id>
		local_id = check
		pos = (0.0, 20.0)
		just = [center center]
		texture = <0xcef90f57>
	}
	add_menu_frontend_item \{text = qs(0x91e877ec)
		pos = (20.0, 0.0)
		pad_choose_script = 0x0ac7b91b
		pad_choose_params = {
			no_restart
			player = 1
		}}
	if (<0xe756903f> = 0)
		<item_id> :se_setprops not_focusable text_rgba = [64 64 64 255]
	endif
	change 0xceccdecc = <item_id>
	winportgfxgetoptionvalue \{option = 3}
	0xc4747f67 = <value>
	if (<0xc4747f67> = 0)
		0xb42a497b = data_settings_xmark
	else
		0xb42a497b = data_settings_checkmark
	endif
	createscreenelement {
		id = 0xcf162786
		type = spriteelement
		parent = <item_container_id>
		local_id = check
		pos = (0.0, 20.0)
		just = [center center]
		texture = <0xb42a497b>
	}
	add_menu_frontend_item \{text = qs(0x4765710e)
		pos = (20.0, 0.0)
		pad_choose_script = 0xcb3a35dc
		pad_choose_params = {
			player = 1
		}}
	menu_finish
endscript

script 0xd1311e94 
	winportgfxapplyoptions
	generic_ui_destroy
	if ($0x60c6999d = 0)
		generic_event_back
	else
		0x5dbf2b9c
		change \{0x60c6999d = 0}
	endif
endscript

script 0x8048a5d2 
	clean_up_user_control_helpers
	add_gamertag_helper \{exclusive_device = $primary_controller}
	menu_finish
endscript

script 0xa17fdfa5 
	obj_getid
	<id> = <objid>
	resolvescreenelementid id = {<id> child = {0 child = check}}
	winportgfxgetoptionvalue \{option = 1}
	0xe756903f = <value>
	if (<0xe756903f> = 0)
		winportgfxsetoptionvalue \{option = 1
			value = 1}
		soundevent \{event = checkbox_check_sfx}
		<resolved_id> :setprops texture = data_settings_checkmark
	else
		winportgfxsetoptionvalue \{option = 1
			value = 0}
		soundevent \{event = checkbox_sfx}
		<resolved_id> :setprops texture = data_settings_xmark
	endif
	winportgfxapplyoptions
	if (<0xe756903f> = 0)
		($0xceccdecc) :se_setprops focusable text_rgba = ($menu_unfocus_color)
	else
		($0xceccdecc) :se_setprops not_focusable text_rgba = [64 64 64 255]
		resolvescreenelementid \{id = {
				$0xceccdecc
				child = {
					0
					child = check
				}
			}}
		<resolved_id> :setprops texture = data_settings_xmark
	endif
	change \{0x60c6999d = 1}
endscript

script 0xda0675ca 
	obj_getid
	<id> = <objid>
	resolvescreenelementid id = {<id> child = {0 child = check}}
	winportgfxgetoptionvalue \{option = 2}
	0x96d5f572 = <value>
	if (<0x96d5f572> = 0)
		winportgfxsetoptionvalue \{option = 2
			value = 2}
		soundevent \{event = checkbox_check_sfx}
		<resolved_id> :setprops texture = data_settings_checkmark
	else
		winportgfxsetoptionvalue \{option = 2
			value = 0}
		soundevent \{event = checkbox_sfx}
		<resolved_id> :setprops texture = data_settings_xmark
	endif
	winportgfxapplyoptions
endscript

script 0x0ac7b91b 
	obj_getid
	<id> = <objid>
	resolvescreenelementid id = {<id> child = {0 child = check}}
	winportgfxgetoptionvalue \{option = 3}
	0xc4747f67 = <value>
	if (<0xc4747f67> = 0)
		winportgfxsetoptionvalue \{option = 3
			value = 1}
		soundevent \{event = checkbox_check_sfx}
		<resolved_id> :setprops texture = data_settings_checkmark
	else
		winportgfxsetoptionvalue \{option = 3
			value = 0}
		soundevent \{event = checkbox_sfx}
		<resolved_id> :setprops texture = data_settings_xmark
	endif
	winportgfxapplyoptions
endscript

script 0xc9a3d3d1 
	winportgfxgetoptionchoices \{option = 0}
	getarraysize <choices>
	choicecount = (<array_size> - 1)
	winportgfxgetoptionvalue \{option = 0}
	if (<value> = <choicecount>)
		winportgfxsetoptionvalue \{option = 0
			value = 0}
	else
		winportgfxsetoptionvalue option = 0 value = (<value> + 1)
	endif
	winportgfxapplyoptions
	winportgfxgetoptionvalue \{option = 0}
	0xdd973907 :setprops text = (<choices> [<value>])
	change \{0x60c6999d = 1}
endscript

script 0xcb3a35dc 
	winportgfxgetdefaultoptionvalue \{option = 0}
	winportgfxsetoptionvalue option = 0 value = <value>
	winportgfxgetoptionchoices \{option = 0}
	0xdd973907 :setprops text = (<choices> [<value>])
	winportgfxgetdefaultoptionvalue \{option = 1}
	winportgfxsetoptionvalue option = 1 value = <value>
	0xe756903f = <value>
	if screenelementexists \{id = 0x0f098e20}
		if (<0xe756903f> = 1)
			setscreenelementprops \{id = 0x0f098e20
				texture = data_settings_checkmark}
			($0xceccdecc) :se_setprops focusable text_rgba = ($menu_unfocus_color)
		else
			setscreenelementprops \{id = 0x0f098e20
				texture = data_settings_xmark}
			($0xceccdecc) :se_setprops not_focusable text_rgba = [64 64 64 255]
		endif
	endif
	winportgfxgetdefaultoptionvalue \{option = 2}
	winportgfxsetoptionvalue option = 2 value = <value>
	0x96d5f572 = <value>
	if screenelementexists \{id = 0x4d5ce250}
		if (<0x96d5f572> = 2)
			setscreenelementprops \{id = 0x4d5ce250
				texture = data_settings_checkmark}
		else
			setscreenelementprops \{id = 0x4d5ce250
				texture = data_settings_xmark}
		endif
	endif
	winportgfxgetdefaultoptionvalue \{option = 3}
	winportgfxsetoptionvalue option = 3 value = <value>
	0x96d5f572 = <value>
	if screenelementexists \{id = 0xcf162786}
		if (<0x96d5f572> = 1)
			setscreenelementprops \{id = 0xcf162786
				texture = data_settings_checkmark}
		else
			setscreenelementprops \{id = 0xcf162786
				texture = data_settings_xmark}
		endif
	endif
	winportgfxapplyoptions
	change \{0x60c6999d = 1}
endscript

script 0xdcde6e91 
	winportgfxgetoptionchoices \{option = 0}
	text = <choices>
endscript

script 0x5dbf2b9c 
	printstruct <...>
	create_popup_warning_menu \{textblock = {
			text = qs(0x3fe70f90)
			dims = (800.0, 400.0)
			scale = 0.55
		}
		use_all_controllers
		no_background
		menu_pos = (640.0, 520.0)
		options = [
			{
				func = 0x99edc5a6
				text = qs(0x472ed33d)
			}
		]
		pad_back_script = 0x99edc5a6}
endscript

script 0x99edc5a6 
	destroy_popup_warning_menu
	generic_event_back
endscript
