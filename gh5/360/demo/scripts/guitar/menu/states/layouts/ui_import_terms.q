
script ui_create_import_terms 
	if NOT import_check_signin_state
		import_setup_failed fail_text = <fail_text>
		return
	endif
	get_import_legal_text
	createscreenelement {
		parent = root_window
		type = descinterface
		id = ghtunes_legal_dialog_box
		desc = 'ghtunes_legal_dialog'
		z_priority = 499
		event_handlers = [
			{pad_choose import_terms_choose params = {code = <code>}}
			{pad_back import_terms_back params = {}}
			{pad_up ui_import_legal_scroll params = {up = 1}}
			{pad_down ui_import_legal_scroll params = {down = 1}}
		]
		exclusive_device = ($primary_controller)
		legal_title_text = qs(0xecebefc1)
		ghtuneslogo_alpha = 0.0
		icons_alpha = 0.0
		dialog_text = <legal_text>
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
	getdisplaysettings
	if (<height> >= 720)
		<logo> = playstation_logo_hd720
		<pos> = (1120.0, 84.0)
		<scale> = 1.0
	else
		<logo> = playstation_logo_sd
		<pos> = (1120.0, 84.0)
		<scale> = 1.5
	endif
	createscreenelement {
		type = spriteelement
		parent = root_window
		id = ps_logo
		texture = <logo>
		just = [right top]
		pos = <pos>
		scale = <scale>
		z_priority = 10000000
	}
	add_gamertag_helper exclusive_device = ($primary_controller)
	add_user_control_helper \{text = qs(0x182f0173)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
endscript

script ui_destroy_import_terms 
	destroyscreenelement \{id = current_menu}
	clean_up_user_control_helpers
	destroy_dialog_box
	destroyscreenelement \{id = ps_logo}
endscript

script import_terms_choose 
	current_menu :se_setprops \{block_events}
	setspawninstancelimits \{max = 1
		managment = ignore_spawn_request}
	import_purchase_content code = <code>
endscript

script import_terms_back 
	current_menu :se_setprops \{block_events}
	setspawninstancelimits \{max = 1
		managment = ignore_spawn_request}
	generic_event_back \{state = uistate_import}
endscript
