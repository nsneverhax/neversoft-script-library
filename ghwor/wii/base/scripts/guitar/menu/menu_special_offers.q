import_download_content_list_finished = 1

script menu_special_offers_deinit 
	if ScriptIsRunning \{menu_special_offers_setup}
		KillSpawnedScript \{Name = menu_special_offers_setup}
	endif
	if ScriptExists \{import_shutdown}
		import_shutdown
	endif
endscript

script menu_special_offers_setup 
	music_store_start_saving_net_error
	NetSessionFunc \{func = is_leaderboard_lobby_available}
	current_menu :se_setprops \{block_events}
	import_wait_for_download_content_list
	Change \{g_import_wait_for_download_content_list_count = 0}
	Change \{import_download_content_list_finished = 0}
	NetSessionFunc {
		Obj = content_unlock
		func = download_content_list
		params = {
			controller_index = ($primary_controller)
			callback = callback_import_download_content_list
		}
	}
	if NOT import_wait_for_download_content_list
		SetButtonEventMappings \{unblock_menu_input}
		current_menu :se_setprops \{unblock_events}
		return
	endif
	if (($g_import_wait_for_download_content_list_count) < 50)
		Wait (50 - ($g_import_wait_for_download_content_list_count)) gameframes
	endif
	Change \{g_import_wait_for_download_content_list_count = 0}
	if NOT NetSessionFunc Obj = content_unlock func = get_content_list params = {controller_index = ($primary_controller)}
		ScriptAssert \{' was reached without download_content_list being completed!'}
	endif
	Change g_music_store_global_content_keys = (<content_keys>)
	if music_store_stop_saving_net_error
		return
	endif
	current_menu :se_setprops \{unblock_events}
	if ScriptExists \{import_startup}
		import_startup
	endif
endscript

script callback_import_download_content_list 
	Change \{import_download_content_list_finished = 1}
	if NOT ui_event_exists_in_stack \{Name = 'songlist'}
		return
	endif
	if (<Result> = error)
		printf \{'download_content_list fail'}
		if ScriptIsRunning \{menu_special_offers_setup}
			KillSpawnedScript \{Name = menu_special_offers_setup}
		endif
		import_setup_failed \{destroymenu
			ErrorCode = 8}
		return
	endif
	printf \{'download_content_list success'}
endscript

script import_wait_for_download_content_list 
	begin
	if (($import_download_content_list_finished) = 1)
		return
	endif
	printf \{qs(0x77661465)}
	Wait \{0.1
		Seconds}
	repeat 150
	printf \{qs(0x81f379d9)}
	import_setup_failed \{ErrorCode = 9}
	if ScriptIsRunning \{menu_special_offers_setup}
		KillSpawnedScript \{Name = menu_special_offers_setup}
	endif
endscript

script import_setup_failed \{fail_text = qs(0xd8f3244a)
		accept_func = marketplace_exit_check_warning_exit}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	destroy_dialog_box
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{Type = unfocus
			target = current_menu}
	endif
	if NetSessionFunc \{func = iscableunplugged}
		<fail_text> = qs(0xf8fc9e4e)
	endif
	if NOT CD
		if GotParam \{ErrorCode}
			formatText TextName = fail_text qs(0xc85fd987) s = <fail_text> d = <ErrorCode>
		endif
	endif
	create_dialog_box {
		player_device = ($primary_controller)
		heading_text = <heading_text>
		body_text = <fail_text>
		error_code = <ErrorCode>
		options = [
			{
				func = <accept_func>
				text = qs(0x0e41fe46)
			}
		]
	}
endscript

script import_check_signin_state 
	if isxenonorwindx
		if NetSessionFunc func = xenonisguest params = {controller_index = ($primary_controller)}
			return \{FALSE
				fail_text = qs(0x9cfe4a9b)}
		endif
	endif
	if NOT CheckForSignIn controller_index = ($primary_controller)
		if isps3
			return \{FALSE
				fail_text = qs(0x6dcc7555)}
		endif
		if NOT CheckForSignIn network_platform_only controller_index = ($primary_controller)
			return \{FALSE
				fail_text = qs(0xf13aa4d1)}
		endif
		if CheckForSignIn local controller_index = ($primary_controller)
			if NetSessionFunc \{func = iscableunplugged}
				return \{FALSE
					fail_text = qs(0x8216ad67)}
			endif
		else
			if isxenonorwindx
				<dialog_txt> = qs(0x0a2293d5)
			elseif isps3
				<dialog_txt> = qs(0x6dcc7555)
			endif
			return FALSE fail_text = <dialog_txt>
		endif
	endif
	if isps3
		return \{true
			valid_user = 0}
	else
		return true valid_user = ($primary_controller)
	endif
endscript

script menu_special_offers_select_import \{purchase_struct = 0x69696969
		offeringid = !i1768515945}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if NOT import_check_signin_state
		import_setup_failed fail_text = <fail_text>
		return
	endif
	if NOT NetSessionFunc Obj = content_unlock func = get_content_list params = {controller_index = ($primary_controller)}
		ScriptAssert \{'menu_special_offers_select_import was reached without download_content_list being completed!'}
	endif
	if NOT GotParam \{content_keys}
		ScriptAssert \{'get_content_list succeeded but did not return content_keys, something is very wrong.'}
	endif
	marketplacefunc func = get_content_info id = (<purchase_struct>.song_checksum)
	marketplacefunc \{func = get_cart_confirmation_info}
	if (<purchased> = 1)
		songlist_music_store_proceed_to_pre_purchase song_item_id = <id> purchase_struct = <purchase_struct> Type = music_store
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
				songlist_music_store_proceed_to_pre_purchase song_item_id = <id> purchase_struct = <purchase_struct> Type = music_store
			else
				ui_sfx \{menustate = Generic
					uitype = select}
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
				ui_event_wait event = menu_change data = {state = uistate_import_pre_legal purchase_struct = <purchase_struct> offeringid = <offeringid> display_name = <display_name> title_name = <title_name> save_code = <save_code> is_popup}
			endif
		endif
	endif
endscript

script import_match_content_key \{content_keys = !a1768515945
		offeringid = !i1768515945}
	GetArraySize <content_keys>
	if (<array_Size> > 0)
		<i> = 0
		begin
		if (((<content_keys> [<i>]).content_key) = <offeringid>)
			return \{true}
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	return \{FALSE}
endscript

script menu_special_offers_select_ecard_code 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	ui_sfx \{menustate = Generic
		uitype = select}
	clean_up_user_control_helpers
	ui_event state = uistate_ecard_edit_name event = menu_change data = {
		is_popup
		default_name = qs(0x00000000)
		char_limit = 16
		title = qs(0x6cd678f9)
		allowed_sets = [number]
		accept_script = ui_import_ecard_code_confirm
		accept_params = {}
		cancel_script = ui_import_keycode_cancel
		device_num = ($primary_controller)
		show_gamertag = ($primary_controller)
	}
endscript

script ui_import_ecard_code_confirm 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if ScreenElementExists \{id = edit_name_menu}
		LaunchEvent \{Type = unfocus
			target = edit_name_menu}
	endif
	ui_sfx \{menustate = Generic
		uitype = select}
	StringLength string = <text>
	if (<str_len> != 16)
		create_dialog_box {
			player_device = ($primary_controller)
			heading_text = qs(0x79597197)
			body_text = qs(0x43540cac)
			options = [
				{
					func = ui_import_keycode_cancel
					text = qs(0x0e41fe46)
				}
			]
		}
		return
	endif
	formatText TextName = nl_text '%s' s = <text>
	marketplacefunc \{func = clear_cart}
	marketplacefunc func = enum_ecard card_id = <nl_text>
	create_dialog_box \{heading_text = qs(0x131b4d0f)
		body_text = qs(0xdf46632e)}
	dialog_box_container :obj_spawnscript \{music_store_entry_dialog_script
		params = {
			ecard_check = 1
		}}
	spawn_instrument_spinner_ui_icon
	SpawnScriptNow \{ui_import_ecard_code_confirm_spawned}
endscript

script ui_import_ecard_code_confirm_spawned 
	begin
	if marketplacefunc \{func = get_enum_progress}
		printf \{'Waiting'}
	else
		printf \{'Done'}
		break
	endif
	WaitOneGameFrame
	repeat
	marketplacefunc \{func = get_enum_error_result}
	if music_store_handle_error <...> func = ui_import_keycode_cancel
		return
	endif
	if marketplacefunc \{func = get_ecard_info}
		if NOT get_marketplace_song_struct song_name = <ecardproduct>
			if faststructurecontains structure = $download_songlist_props Name = <ecardproduct>
				if faststructurecontains structure = $download_songlist_props_musicstore Name = <ecardproduct>
					<songprops> = (($download_songlist_props.<ecardproduct>) + ($download_songlist_props_musicstore.<ecardproduct>))
					printstruct <songprops>
					get_marketplace_song_struct_real song_name = <ecardproduct> songprops = <songprops>
				endif
			endif
		endif
	endif
	if GotParam \{song_entry}
		if (<song_entry>.purchased = 0)
			Change g_music_store_purchase_struct = (<song_entry>)
			music_store_preliminary_checks purchase_struct = ($g_music_store_purchase_struct)
			return
		else
			music_store_handle_error \{error_crc = ec_error_ecard_already_own
				error_code = -1
				func = ui_import_keycode_cancel}
			return
		endif
	endif
	music_store_handle_error \{error_crc = ec_error_ecard_bad_item_count
		error_code = -1
		func = ui_import_keycode_cancel}
endscript
