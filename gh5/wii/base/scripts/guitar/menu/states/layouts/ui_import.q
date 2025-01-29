
script ui_create_import 
	menu_music_on
	if NOT import_check_signin_state
		import_setup_failed fail_text = <fail_text>
		return
	endif
	if NOT NetSessionFunc Obj = content_unlock func = get_content_list params = {controller_index = ($primary_controller)}
		ScriptAssert \{'ui_create_import was reached without download_content_list being completed!'}
	endif
	if NOT GotParam \{content_keys}
		ScriptAssert \{'get_content_list succeeded but did not return content_keys, something is very wrong.'}
	endif
	if NOT GlobalExists \{Name = downloaded_offerings}
		ScriptAssert \{qs(0x7b5a8404)}
	endif
	CreateScreenElement \{Type = descinterface
		desc = 'music_store'
		id = SongList
		parent = root_window
		songlist_subheader_cont_alpha = 0.0
		music_store_title_alpha = 0.0
		songlist_title_text_alpha = 1.0
		songlist_title_text_text = qs(0x637c4479)
		music_store_slider_cont_alpha = 1.0
		exclusive_device = $primary_controller
		hilight_bar_dims = (925.0, 64.0)
		songlist_window_dims = (925.0, 380.0)}
	if SongList :desc_resolvealias \{Name = alias_songlist_vmenu}
		AssignAlias id = <resolved_id> alias = current_menu
		current_menu :se_setprops \{event_handlers = [
				{
					pad_back
					import_exit_check
				}
				{
					pad_up
					import_up
				}
				{
					pad_down
					import_down
				}
			]}
	endif
	if SongList :desc_resolvealias \{Name = alias_music_store_ticker_window}
		<resolved_id> :se_setprops alpha = 0.0
	endif
	if SongList :desc_resolvealias \{Name = alias_songlist_hilight_bar_cont}
		AssignAlias id = <resolved_id> alias = songlist_hilight_bar_cont
	endif
	if SongList :desc_resolvealias \{Name = alias_music_store_slider_nub_cont}
		AssignAlias id = <resolved_id> alias = songlist_slider_nub_cont
		songlist_slider_nub_cont :se_setprops \{alpha = 1.0}
	endif
	added_elements = 0
	GetArraySize \{$downloaded_offerings}
	if (<array_Size> > 0)
		i = 0
		begin
		if StructureContains structure = ($downloaded_offerings [<i>]) offer
			if import_get_product_code offer = (($downloaded_offerings [<i>]).offer)
				if ((($downloaded_offerings [<i>]).Type) = import)
					import_add_item {
						text = (($downloaded_offerings [<i>]).display_name)
						pad_choose_script = import_choose
						pad_choose_params = {code = <code> content_keys = <content_keys> offeringid = (($downloaded_offerings [<i>]).offeringid) display_name = (($downloaded_offerings [<i>]).display_name) title_name = (($downloaded_offerings [<i>]).title_name)}
						pad_option_script = import_choose_details
						pad_option_params = {index = <i>}
						($downloaded_offerings [<i>])
					}
					added_elements = 1
				elseif ((($downloaded_offerings [<i>]).Type) = patch)
					import_add_item {
						text = (($downloaded_offerings [<i>]).display_name)
						pad_choose_script = import_purchase_content
						pad_choose_params = {code = <code>}
						($downloaded_offerings [<i>])
					}
					added_elements = 1
				endif
			else
				printf 'unable to get code for %s' s = (($downloaded_offerings [<i>]).display_name)
			endif
		else
			printf 'no offer structure in %s' s = (($downloaded_offerings [<i>]).display_name)
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	if (<added_elements> = 0)
		import_setup_failed \{fail_text = qs(0x9d2e328d)
			heading_text = qs(0x03ac90f0)}
		return
	endif
	Change \{g_songlist_last_visible_index = 4}
	SongList :SetTags {
		list_index = 0
		list_top = 0
		list_bottom = ($g_songlist_last_visible_index)
		list_count = <array_Size>
		hilight_bar_res = 74
		slider_nub_res = (350.0 / (<array_Size> - 1))
		hilight_bar_index = 0
	}
	GetScreenElementChildren \{id = current_menu}
	if (<array_Size> > 0)
		if GotParam \{selected_index}
			if (<selected_index> > 0)
				begin
				import_down \{no_sound}
				repeat <selected_index>
			endif
			(<children> [<selected_index>]) :se_setprops item_rgba = ($g_music_store_item_focus_rgba)
		else
			(<children> [0]) :se_setprops item_rgba = ($g_music_store_item_focus_rgba)
		endif
	endif
	add_gamertag_helper exclusive_device = ($primary_controller)
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
endscript

script ui_destroy_import 
	clean_up_user_control_helpers
	DestroyScreenElement \{id = SongList}
	destroy_dialog_box
endscript

script import_add_item 
	CreateScreenElement {
		Type = descinterface
		desc = 'import_item'
		parent = current_menu
		item_text = <text>
		item_rgba = ($g_music_store_item_unfocus_rgba)
		autosizedims = true
		event_handlers = [
			{focus import_focus params = <...>}
			{unfocus import_unfocus}
			{pad_choose <pad_choose_script> params = <pad_choose_params>}
		]
	}
	if GotParam \{pad_option_script}
		<id> :se_setprops {
			event_handlers = [
				{pad_btn_left <pad_option_script> params = <pad_option_params>}
			]
		}
	endif
endscript

script import_focus 
	se_setprops {
		item_rgba = ($g_music_store_item_focus_rgba)
	}
	import_esrb_label_alpha = 0.0
	if GotParam \{rating}
		if NOT (<rating> = None)
			import_esrb_label_alpha = 1.0
		endif
	endif
	SongList :se_setprops import_esrb_label_alpha = <import_esrb_label_alpha>
	clean_up_user_control_helpers
	add_gamertag_helper exclusive_device = ($primary_controller)
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	if GotParam \{pad_option_script}
		add_user_control_helper \{text = qs(0x96561bac)
			button = blue
			z = 100000}
	endif
endscript

script import_unfocus 
	se_setprops {
		item_rgba = ($g_music_store_item_unfocus_rgba)
	}
endscript

script import_up 
	SongList :GetTags
	if SongList :desc_resolvealias \{Name = alias_songlist_vmenu}
	endif
	if (<list_index> >= 0)
		list_index = (<list_index> - 1)
		if (<list_index> < 0)
			return
		else
			if NOT GotParam \{no_sound}
				songlist_scroll_sfx
			endif
			songlist_update_slider_nub_pos \{Dir = up}
			songlist_update_hilight_bar_pos \{Dir = up}
			if (<list_index> < <list_top>)
				if (<list_top> > 0)
					list_top = (<list_top> - 1)
					list_bottom = (<list_bottom> - 1)
					<resolved_id> :se_setprops Pos = ((0.0, -74.0) * <list_top>)
				endif
			endif
			SongList :SetTags {
				list_index = <list_index>
				list_top = <list_top>
				list_bottom = <list_bottom>
			}
		endif
	endif
endscript

script import_down 
	SongList :GetTags
	if SongList :desc_resolvealias \{Name = alias_songlist_vmenu}
	endif
	printstruct <...>
	if (<list_index> < <list_count>)
		list_index = (<list_index> + 1)
		if (<list_index> >= <list_count>)
			return
		else
			if NOT GotParam \{no_sound}
				songlist_scroll_sfx
			endif
			songlist_update_slider_nub_pos \{Dir = down}
			songlist_update_hilight_bar_pos \{Dir = down}
			if (<list_index> > <list_bottom>)
				if (<list_top> >= 0)
					list_top = (<list_top> + 1)
					list_bottom = (<list_bottom> + 1)
					<resolved_id> :se_setprops Pos = ((0.0, -74.0) * <list_top>)
				endif
			endif
			SongList :SetTags {
				list_index = <list_index>
				list_top = <list_top>
				list_bottom = <list_bottom>
			}
		endif
	endif
endscript

script import_choose 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	RequireParams \{[
			content_keys
			offeringid
			ui_struct
		]
		all}
	if NOT import_check_signin_state
		import_setup_failed fail_text = <fail_text>
		return
	endif
	se_getparentid
	if ScreenElementExists id = <parent_id>
		LaunchEvent Type = unfocus target = <parent_id>
	endif
	marketplacefunc func = get_content_info id = <code>
	marketplacefunc \{func = get_cart_confirmation_info}
	if (<purchased> = 1)
		songlist_music_store_proceed_to_pre_purchase ui_struct = <ui_struct>
	else
		marketplacefunc \{func = get_cart_confirmation_info}
		if (((<confirmation_info>.top_wii_points) - <cost>) < 0)
			music_store_handle_error \{error_crc = ec_error_insufficient_funds
				error_code = -1
				support_code = 205810
				func = songlist_destroy_dialog_box}
			marketplacefunc \{func = clear_cart}
		else
			if import_match_content_key content_keys = <content_keys> offeringid = <offeringid>
				songlist_music_store_proceed_to_pre_purchase ui_struct = <ui_struct>
			else
				generic_menu_pad_choose_sound
				if isnabuild
					if StructureContains \{structure = ui_struct
							na_savegame_code}
						<save_code> = (<ui_struct>.na_savegame_code)
					endif
				else
					if StructureContains \{structure = ui_struct
							eu_savegame_code}
						<save_code> = (<ui_struct>.eu_savegame_code)
					endif
				endif
				clean_up_user_control_helpers
				sdcardmanagerfunc \{func = force_hold_ejects}
				ui_event_wait event = menu_change data = {state = uistate_import_pre_legal code = <code> offeringid = <offeringid> display_name = <display_name> title_name = <title_name> save_code = <save_code> is_popup}
			endif
		endif
	endif
endscript

script import_match_content_key 
	RequireParams \{[
			content_keys
			offeringid
		]
		all}
	GetArraySize <content_keys>
	if (<array_Size> > 0)
		i = 0
		begin
		if import_match_single_key content_key = ((<content_keys> [<i>]).content_key) offeringid = <offeringid>
			return \{true}
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	return \{FALSE}
endscript

script import_match_single_key 
	if (<content_key> = <offeringid>)
		return \{true}
	endif
endscript
downloaded_offerings_index = -1

script import_create_details_content_source 
	RequireParams \{[
			list_name
		]
		all}
	if NOT import_check_signin_state
		if ScriptIsRunning \{songlist_request_page_when_ready}
			KillSpawnedScript \{Name = songlist_request_page_when_ready}
		endif
		import_setup_failed fail_text = <fail_text>
		return
	endif
	if (($downloaded_offerings_index) = -1)
		ScriptAssert \{qs(0xfd92c0ad)}
	endif
	contentmanfunc func = register_content_source Name = <list_name> Type = playlist
	offering = ($downloaded_offerings [($downloaded_offerings_index)])
	if StructureContains structure = <offering> contents
		GetArraySize (<offering>.contents)
		if (<array_Size> > 0)
			i = 0
			begin
			formatText checksumName = item_name 'item_%s' s = <i> AddToStringLookup = true
			contentmanfunc func = add_data Name = <list_name> item_name = <item_name> item_data = ((<offering>.contents) [<i>])
			i = (<i> + 1)
			repeat <array_Size>
		endif
	endif
	Change \{downloaded_offerings_index = -1}
endscript

script import_choose_details 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	RequireParams \{[
			index
		]
		all}
	if NOT import_check_signin_state
		import_setup_failed fail_text = <fail_text>
		return
	endif
	Change downloaded_offerings_index = <index>
	generic_menu_pad_choose_sound
	ui_event_wait event = menu_change data = {state = uistate_songlist mode = import exclusive_device = ($primary_controller)}
endscript

script import_exit_check 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	generic_menu_pad_back_sound
	if NOT import_check_signin_state
		import_setup_failed fail_text = <fail_text>
		return
	endif
	if ScreenElementExists \{id = current_menu}
		current_menu :se_setprops \{block_events}
	endif
	if ($music_store_attempted_purchase = 1)
		create_dialog_box {
			no_background
			heading_text = qs(0x3ed675b6)
			body_text = qs(0x9d6e82da)
			player_device = ($primary_controller)
			options = [
				{
					text = qs(0x4b4accd7)
					func = import_exit_check_warning_exit
				}
				{
					text = qs(0xf07aa486)
					func = import_exit_check_warning_cancel
				}
			]
		}
		return
	endif
	generic_event_back_block \{state = uistate_options
		nosound}
endscript

script import_exit_check_warning 
	if ScreenElementExists \{id = generic_barrel_vmenu}
		LaunchEvent \{Type = unfocus
			target = generic_barrel_vmenu}
	endif
	destroy_dialog_box
	if GotParam \{long_flag}
		<template> = large_body
	else
		<template> = standard
	endif
	create_dialog_box {
		no_background
		template = <template>
		heading_text = <title>
		body_text = <body_text>
		options = <options>
		<long_flag>
		player_device = ($primary_controller)
	}
endscript

script import_exit_check_warning_cancel 
	destroy_dialog_box
	if ScreenElementExists \{id = current_menu}
		current_menu :se_setprops \{unblock_events}
	endif
	current_menu :menu_getselectedindex
	add_gamertag_helper exclusive_device = ($primary_controller)
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	GetArraySize \{$downloaded_offerings}
	if (<selected_index> < <array_Size>)
		if ((($downloaded_offerings [<selected_index>]).Type) = import)
			add_user_control_helper \{text = qs(0x96561bac)
				button = blue
				z = 100000}
		endif
	endif
endscript

script import_exit_check_warning_exit 
	destroy_dialog_box
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{Type = focus
			target = current_menu}
	endif
	generic_event_back_block \{state = uistate_options
		nosound}
endscript
