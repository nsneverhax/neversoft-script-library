
script ui_create_import_pre_legal 
	if NOT import_check_signin_state
		import_setup_failed fail_text = <fail_text>
		return
	endif
	if isxenonorwindx
		formatText TextName = dialog_text qs(0xffef102f) s = <display_name> t = <title_name>
	else
		formatText TextName = dialog_text qs(0x5ca5730c) s = <display_name> t = <title_name>
	endif
	CreateScreenElement {
		parent = root_window
		Type = descinterface
		id = ghtunes_legal_dialog_box
		desc = 'ghtunes_legal_dialog'
		z_priority = 1000
		event_handlers = [
			{pad_choose ui_import_pre_legal_choose params = {code = <code> offeringid = <offeringid> display_name = <display_name> save_code = <save_code>}}
			{pad_back ui_import_pre_legal_back params = {}}
			{pad_up ui_import_legal_scroll params = {up = 1}}
			{pad_down ui_import_legal_scroll params = {down = 1}}
		]
		exclusive_device = ($primary_controller)
		legal_title_text = qs(0x85ca640a)
		ghtuneslogo_alpha = 0.0
		dialog_text = <dialog_text>
	}
	AssignAlias \{id = ghtunes_legal_dialog_box
		alias = current_menu}
	if ghtunes_legal_dialog_box :desc_resolvealias \{Name = alias_dialog}
		GetScreenElementChildren id = <resolved_id>
		GetArraySize <children>
		if (<array_Size> < 11)
			current_menu :se_setprops \{scrollbar_alpha = 0.0}
		endif
	endif
	current_menu :SetTags \{index = 0}
	add_gamertag_helper exclusive_device = ($primary_controller)
	add_user_control_helper \{text = qs(0xb73cb78f)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
endscript

script ui_destroy_import_pre_legal 
	DestroyScreenElement \{id = current_menu}
	clean_up_user_control_helpers
	destroy_dialog_box
endscript

script ui_import_pre_legal_choose 
	current_menu :se_setprops \{block_events}
	SetSpawnInstanceLimits \{Max = 1
		managment = ignore_spawn_request}
	generic_menu_pad_choose_sound
	if GotParam \{save_code}
		printf 'pre_legal_choose - we require a save code: %s' s = <save_code>
		if doessavefileexist appid = <save_code>
			generic_event_replace state = uistate_import_post_legal data = {code = <code> display_name = <display_name> is_popup}
		else
			formatText TextName = body_text qs(0x742e3531) s = <display_name>
			<heading_text> = qs(0xaa163738)
			create_dialog_box {
				dlg_z_priority = 1001
				heading_text = <heading_text>
				body_text = <body_text>
				options = [
					{
						func = ui_import_pre_legal_back
						text = qs(0x0e41fe46)
					}
				]
			}
		endif
	else
		printf \{'pre_legal_choose - we do NOT require a save code'}
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
			is_popup
		}
	endif
endscript

script ui_import_pre_legal_back 
	current_menu :se_setprops \{block_events}
	SetSpawnInstanceLimits \{Max = 1
		managment = ignore_spawn_request}
	generic_event_back \{data = {
			bypass_return_script = songlist_music_store_return_to_special_offers
		}}
endscript

script ui_import_legal_scroll 
	if ghtunes_legal_dialog_box :desc_resolvealias \{Name = alias_dialog}
		GetScreenElementChildren id = <resolved_id>
		GetArraySize <children>
		if (<array_Size> > 11)
			GetScreenElementDims id = (<children> [0])
			<resolved_id> :se_getprops
			GetTags
			printstruct {} index = <index> size = (<array_Size> - 12)
			if GotParam \{up}
				if (<index> = 0)
					return
				endif
				index = (<index> - 1)
			else
				if (<index> = (<array_Size> - 12))
					return
				endif
				index = (<index> + 1)
			endif
			current_menu :se_setprops scrollbar_pos = (((0.0, 392.0) * (<index> / (<array_Size> - 12.0))) + (0.0, 3.0)) time = 0.1
			<resolved_id> :se_setprops Pos = ((0.0, -1.0) * <height> * <index>) time = 0.1
			SetTags index = <index>
			generic_menu_up_or_down_sound down = <down>
		endif
	endif
endscript
