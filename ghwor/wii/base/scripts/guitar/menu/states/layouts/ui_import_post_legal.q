
script ui_create_import_post_legal 
	if NOT import_check_signin_state
		import_setup_failed fail_text = <fail_text>
		return
	endif
	formatText TextName = dialog_text qs(0x5f4b19c5) s = (<purchase_struct>.song_title)
	CreateScreenElement {
		parent = root_window
		Type = descinterface
		id = import_legal_dialog_box
		desc = 'privacy_policy'
		event_handlers = [
			{pad_choose ui_import_post_legal_choose params = {purchase_struct = <purchase_struct>}}
			{pad_back ui_import_post_legal_back params = {}}
			{pad_up ui_privacy_policy_scroll params = {desc_id = import_legal_dialog_box up = 1}}
			{pad_down ui_privacy_policy_scroll params = {desc_id = import_legal_dialog_box down = 1}}
		]
		exclusive_device = ($primary_controller)
		dlog_heading_text = qs(0xaa163738)
	}
	if import_legal_dialog_box :desc_resolvealias \{Name = alias_text_clip}
		GetScreenElementDims id = <resolved_id>
		<max_y> = <height>
	else
		ScriptAssert \{'ui_create_import_pre_legal is unable to resolve alias_text_clip'}
	endif
	if import_legal_dialog_box :desc_resolvealias \{Name = alias_text_menu}
		AssignAlias id = <resolved_id> alias = import_legal_text_parent
		<common_props> = {
			Type = TextBlockElement
			font = fontgrid_text_a1
			just = [left top]
			internal_just = [left top]
			internal_scale = 0.32000002
			rgba = gh6_gold
			dims = (700.0, 30.0)
			fit_width = wrap
			fit_height = `expand	dims`
			scale_mode = proportional
			text_case = Original
		}
		CreateScreenElement {
			<common_props>
			id = dummy
			parent = root_window
			text = <dialog_text>
			alpha = 0.0
		}
		GetScreenElementChildren id = <id>
		GetArraySize <children>
		<i> = 0
		begin
		(<children> [<i>]) :se_getprops
		CreateScreenElement {
			<common_props>
			parent = import_legal_text_parent
			text = <text>
		}
		<i> = (<i> + 1)
		repeat <array_Size>
		DestroyScreenElement \{id = dummy}
		<enable_scrolling> = 1
		GetScreenElementDims \{id = import_legal_text_parent}
		if (<height> < <max_y>)
			<enable_scrolling> = 0
			import_legal_dialog_box :se_setprops \{event_handlers = [
					{
						pad_up
						nullscript
					}
					{
						pad_down
						nullscript
					}
				]
				replace_handlers}
		endif
		if import_legal_dialog_box :desc_resolvealias \{Name = alias_generic_scrollbar_wgt}
			if (<enable_scrolling> = 1)
				generic_scrollbar_wgt_initialize id = <resolved_id>
				generic_scrollbar_wgt_set_resolution id = <resolved_id> num_elements = <array_Size>
			else
				<resolved_id> :se_setprops alpha = 0.0
			endif
		endif
	else
		ScriptAssert \{'ui_create_import_pre_legal is unable to resolve alias_text_menu'}
	endif
	add_gamertag_helper exclusive_device = ($primary_controller)
	add_user_control_helper \{text = qs(0xb73cb78f)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xf7723015)
		button = red
		z = 100000}
endscript

script ui_destroy_import_post_legal 
	if ($g_marketplace_responding_to_error = 0)
		DestroyScreenElement \{id = import_legal_dialog_box}
		clean_up_user_control_helpers
		destroy_dialog_box
	endif
endscript

script ui_import_post_legal_choose 
	import_legal_dialog_box :se_setprops \{block_events}
	ui_sfx \{menustate = Generic
		uitype = select}
	SetSpawnInstanceLimits \{Max = 1
		managment = ignore_spawn_request}
	sdcardmanagerfunc \{func = force_hold_ejects
		OFF}
	ui_destroy_import_post_legal
	songlist_options_music_store_purchase_accepted purchase_struct = <purchase_struct>
endscript

script ui_import_post_legal_back 
	ui_sfx \{menustate = Generic
		uitype = back}
	import_legal_dialog_box :se_setprops \{block_events}
	SetSpawnInstanceLimits \{Max = 1
		managment = ignore_spawn_request}
	songlist_music_store_return_to_special_offers
endscript
