
script ui_create_import_terms 
	if NOT import_check_signin_state
		import_setup_failed fail_text = <fail_text>
		return
	endif
	get_import_legal_text
	CreateScreenElement {
		parent = root_window
		type = DescInterface
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
		GHTuneslogo_alpha = 0.0
		icons_alpha = 0.0
		dialog_text = <legal_text>
	}
	AssignAlias \{id = ghtunes_legal_dialog_box
		alias = current_menu}
	if ghtunes_legal_dialog_box :Desc_ResolveAlias \{name = alias_dialog}
		GetScreenElementChildren id = <resolved_id>
		GetArraySize <children>
		if (<array_size> < 11)
			current_menu :SE_SetProps \{scrollbar_alpha = 0.0}
		endif
	endif
	current_menu :SetTags \{index = 0}
	GetDisplaySettings
	if (<height> >= 720)
		<logo> = Playstation_Logo_HD720
		<Pos> = (1120.0, 84.0)
		<scale> = 1.0
	else
		<logo> = Playstation_Logo_SD
		<Pos> = (1120.0, 84.0)
		<scale> = 1.5
	endif
	CreateScreenElement {
		type = SpriteElement
		parent = root_window
		id = PS_Logo
		texture = <logo>
		just = [right top]
		Pos = <Pos>
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
	DestroyScreenElement \{id = current_menu}
	clean_up_user_control_helpers
	destroy_dialog_box
	DestroyScreenElement \{id = PS_Logo}
endscript

script import_terms_choose 
	current_menu :SE_SetProps \{block_events}
	SetSpawnInstanceLimits \{Max = 1
		managment = ignore_spawn_request}
	import_purchase_content code = <code>
endscript

script import_terms_back 
	current_menu :SE_SetProps \{block_events}
	SetSpawnInstanceLimits \{Max = 1
		managment = ignore_spawn_request}
	generic_event_back \{state = UIstate_import}
endscript
