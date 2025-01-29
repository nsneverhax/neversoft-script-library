g_music_store_terms_window_width = 920
g_music_store_terms_window_height = 376

script ui_create_music_store_terms 
	SoundEvent \{event = audio_ui_ghtunes_select}
	<event_handlers> = [
		{pad_choose music_store_select_sfx}
		{pad_back music_store_terms_decline params = {}}
		{pad_up ui_privacy_policy_scroll params = {desc_id = music_store_terms up = 1 setup_handlers = 0}}
		{pad_down ui_privacy_policy_scroll params = {desc_id = music_store_terms down = 1 setup_handlers = 0}}
	]
	if GotParam \{product_long_description}
		ui_event_remove_params \{param = product_long_description}
		<dlog_heading_text> = (<purchase_struct>.song_title)
		<legal_text> = <product_long_description>
		<choose_option> = {pad_choose music_store_terms_accept params = {product_long_description = <product_long_description> exclusive_device = <exclusive_device> purchase_struct = <purchase_struct>}}
	else
		<dlog_heading_text> = qs(0x9135a641)
		get_musicstore_legal_text
		<choose_option> = {pad_choose music_store_terms_accept params = {exclusive_device = <exclusive_device> purchase_struct = <purchase_struct>}}
	endif
	AddArrayElement array = <event_handlers> element = <choose_option>
	<event_handlers> = <array>
	CreateScreenElement {
		parent = root_window
		Type = descinterface
		id = music_store_terms
		desc = 'privacy_policy'
		event_handlers = <event_handlers>
		exclusive_device = <exclusive_device>
		dlog_heading_text = <dlog_heading_text>
	}
	if music_store_terms :desc_resolvealias \{Name = alias_text_clip}
		GetScreenElementDims id = <resolved_id>
		<max_y> = <height>
	else
		ScriptAssert \{'ui_music_store_terms is unable to resolve alias_text_clip'}
	endif
	if music_store_terms :desc_resolvealias \{Name = alias_text_menu}
		AssignAlias id = <resolved_id> alias = music_store_terms_text_parent
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
			text = <legal_text>
			alpha = 0.0
		}
		GetScreenElementChildren id = <id>
		GetArraySize <children>
		<i> = 0
		begin
		(<children> [<i>]) :se_getprops
		CreateScreenElement {
			<common_props>
			parent = music_store_terms_text_parent
			text = <text>
		}
		<i> = (<i> + 1)
		repeat <array_Size>
		DestroyScreenElement \{id = dummy}
		<enable_scrolling> = 1
		GetScreenElementDims \{id = music_store_terms_text_parent}
		if (<height> < <max_y>)
			<enable_scrolling> = 0
			music_store_terms :se_setprops \{event_handlers = [
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
		if music_store_terms :desc_resolvealias \{Name = alias_generic_scrollbar_wgt}
			if (<enable_scrolling> = 1)
				generic_scrollbar_wgt_initialize id = <resolved_id>
				generic_scrollbar_wgt_set_resolution id = <resolved_id> num_elements = <array_Size>
			else
				<resolved_id> :se_setprops alpha = 0.0
			endif
		endif
	else
		ScriptAssert \{'ui_music_store_terms is unable to resolve alias_text_menu'}
	endif
	music_store_terms_create_default_user_control_helpers exclusive_device = <exclusive_device>
endscript

script music_store_terms_create_default_user_control_helpers 
	RequireParams \{[
			exclusive_device
		]
		all}
	clean_up_user_control_helpers
	add_gamertag_helper exclusive_device = <exclusive_device>
	add_user_control_helper \{text = qs(0xb73cb78f)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0x0bbc9ad9)
		button = red
		z = 100000}
endscript

script ui_destroy_music_store_terms 
	if ($g_marketplace_responding_to_error = 0)
		DestroyScreenElement \{id = music_store_terms}
		clean_up_user_control_helpers
		destroy_dialog_box
	endif
endscript

script music_store_terms_decline 
	ui_sfx \{menustate = musicstore
		uitype = negativeselect}
	music_store_terms :se_setprops \{block_events}
	SetSpawnInstanceLimits \{Max = 1
		managment = ignore_spawn_request}
	generic_event_back \{state = uistate_songlist}
endscript

script music_store_terms_accept 
	if ($shutdown_game_for_signin_change_flag = 0)
		music_store_terms :se_setprops \{block_events}
		SetSpawnInstanceLimits \{Max = 1
			managment = ignore_spawn_request}
		ui_destroy_music_store_terms
		music_store_purchase_content purchase_struct = <purchase_struct>
		ui_event event = menu_replace data = {is_popup state = uistate_music_store_scan_marketplace data = {purchase_struct = <purchase_struct>}}
	endif
endscript
