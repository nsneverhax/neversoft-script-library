
script ui_create_import_post_legal 
	if NOT import_check_signin_state
		import_setup_failed fail_text = <fail_text>
		return
	endif
	formattext textname = dialog_text qs(0x5f4b19c5) s = <display_name>
	createscreenelement {
		parent = root_window
		type = descinterface
		id = ghtunes_legal_dialog_box
		desc = 'ghtunes_legal_dialog'
		z_priority = 499
		event_handlers = [
			{pad_choose ui_import_post_legal_choose params = {code = <code>}}
			{pad_back ui_import_post_legal_back params = {}}
			{pad_up ui_import_legal_scroll params = {up = 1}}
			{pad_down ui_import_legal_scroll params = {down = 1}}
		]
		exclusive_device = ($primary_controller)
		legal_title_text = qs(0xaa163738)
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
	add_user_control_helper \{text = qs(0x182f0173)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
endscript

script ui_destroy_import_post_legal 
	destroyscreenelement \{id = current_menu}
	clean_up_user_control_helpers
	destroy_dialog_box
endscript

script ui_import_post_legal_choose 
	current_menu :se_setprops \{block_events}
	setspawninstancelimits \{max = 1
		managment = ignore_spawn_request}
	if isps3
		generic_event_choose state = uistate_import_terms data = {code = <code>}
	else
		import_purchase_content code = <code>
	endif
endscript

script ui_import_post_legal_back 
	current_menu :se_setprops \{block_events}
	setspawninstancelimits \{max = 1
		managment = ignore_spawn_request}
	generic_event_back \{state = uistate_import}
endscript
