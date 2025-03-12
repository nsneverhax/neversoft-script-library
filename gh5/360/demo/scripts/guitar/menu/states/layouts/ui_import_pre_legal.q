
script ui_create_import_pre_legal 
	if NOT import_check_signin_state
		import_setup_failed fail_text = <fail_text>
		return
	endif
	if isxenonorwindx
		formattext textname = dialog_text qs(0xffef102f) s = <display_name> t = <title_name>
	else
		formattext textname = dialog_text qs(0x5ca5730c) s = <display_name> t = <title_name>
	endif
	createscreenelement {
		parent = root_window
		type = descinterface
		id = ghtunes_legal_dialog_box
		desc = 'ghtunes_legal_dialog'
		z_priority = 499
		event_handlers = [
			{pad_choose ui_import_pre_legal_choose params = {code = <code> offeringid = <offeringid> display_name = <display_name>}}
			{pad_back ui_import_pre_legal_back params = {}}
			{pad_up ui_import_legal_scroll params = {up = 1}}
			{pad_down ui_import_legal_scroll params = {down = 1}}
		]
		exclusive_device = ($primary_controller)
		legal_title_text = qs(0x85ca640a)
		ghtuneslogo_alpha = 0.0
		icons_alpha = 0.0
		dialog_text = <dialog_text>
	}
	assignalias \{id = ghtunes_legal_dialog_box
		alias = current_menu}
	if ghtunes_legal_dialog_box :desc_resolvealias \{name = alias_dialog}
		getscreenelementchildren id = <resolved_id>
		getarraysize <children>
		if (<array_size> < 11)
			current_menu :se_setprops \{scrollbar_alpha = 0.0}
		endif
	endif
	current_menu :settags \{index = 0}
	add_gamertag_helper exclusive_device = ($primary_controller)
	add_user_control_helper \{text = qs(0xb73cb78f)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
endscript

script ui_destroy_import_pre_legal 
	destroyscreenelement \{id = current_menu}
	clean_up_user_control_helpers
	destroy_dialog_box
endscript

script ui_import_pre_legal_choose 
	current_menu :se_setprops \{block_events}
	setspawninstancelimits \{max = 1
		managment = ignore_spawn_request}
	generic_menu_pad_choose_sound
	ui_event event = menu_replace data = {
		state = uistate_import_edit_name
		default_name = qs(0x00000000)
		char_limit = 20
		title = qs(0x1c4e5be1)
		allowed_sets = [upper number]
		accept_script = ui_import_keycode_confirm
		accept_params = {code = <code> offeringid = <offeringid> display_name = <display_name>}
		cancel_script = ui_import_keycode_cancel
		device_num = ($primary_controller)
		show_gamertag = ($primary_controller)
	}
endscript

script ui_import_pre_legal_back 
	current_menu :se_setprops \{block_events}
	setspawninstancelimits \{max = 1
		managment = ignore_spawn_request}
	generic_event_back
endscript

script ui_import_legal_scroll 
	if ghtunes_legal_dialog_box :desc_resolvealias \{name = alias_dialog}
		getscreenelementchildren id = <resolved_id>
		getarraysize <children>
		if (<array_size> > 11)
			getscreenelementdims id = (<children> [0])
			<resolved_id> :se_getprops
			gettags
			printstruct {} index = <index> size = (<array_size> - 12)
			if gotparam \{up}
				if (<index> = 0)
					return
				endif
				index = (<index> - 1)
			else
				if (<index> = (<array_size> - 12))
					return
				endif
				index = (<index> + 1)
			endif
			current_menu :se_setprops scrollbar_pos = (((0.0, 392.0) * (<index> / (<array_size> - 12.0))) + (0.0, 3.0)) time = 0.1
			<resolved_id> :se_setprops pos = ((0.0, -1.0) * <height> * <index>) time = 0.1
			settags index = <index>
			generic_menu_up_or_down_sound down = <down>
		endif
	endif
endscript
