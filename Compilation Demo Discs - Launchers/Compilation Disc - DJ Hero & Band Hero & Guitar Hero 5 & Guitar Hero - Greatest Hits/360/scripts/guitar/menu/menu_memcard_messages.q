load_warning_menu_font = fontgrid_title_a1
respond_to_signin_changed = 0
respond_to_signin_changed_all_players = 0
respond_to_signin_changed_func = none

script start_checking_for_signin_change 
	printf \{qs("\Lstart_checking_for_signin_change")}
	printscriptinfo \{qs("\Lstart_checking_for_signin_change")}
	printf \{qs("\Lstart_checking_for_signin_change - killing sysnotifys")}
	KillSpawnedScript \{name = sysnotify_handle_signin_change}
	printf \{qs("\Lstart_checking_for_signin_change - begin")}
	change \{respond_to_signin_changed = 1}
	change \{menu_select_difficulty_first_time = 1}
endscript

script wait_for_blade_complete 
	if isXenon
		wait_for_sysnotify_unpause
	else
		begin
		printf \{'wait_for_blade_complete'}
		if (1 = $ps3_signin_complete)
			break
		endif
		Wait \{1
			frame}
		repeat
	endif
endscript
ps3_signin_complete = 0

script signin_complete_callback 
	printf \{'signin_complete_callback'}
	change \{ps3_signin_complete = 1}
endscript

script create_signin_warning_menu player_device = ($MemcardController)
	memcard_cleanup_messages
	GetPlatform
	switch <platform>
		case ps3
		<error_string_when_too_young_for_online> = qs("Online service is disabled on your PlayStation®Network account due to parental control restrictions.")
		if NOT GotParam \{require_live}
			array = [
				{
					func = signin_warning_select_continue
					text = qs("CONTINUE")
					scale = (1.0, 1.0)
				}
			]
			if GotParam \{allow_back}
				AddArrayElement array = <array> element = {func = ui_signin_warning_back text = qs("CANCEL")}
			endif
			if NetSessionFunc \{func = IsOldEnoughForOnline}
				if CheckForSignIn \{network_platform_only}
					text = qs("The game servers are currently unavailable. You will be unable to write statistics.")
				else
					text = qs("You are not signed in to the PlayStation®Network. You will be unable to write statistics.")
				endif
			else
				text = <error_string_when_too_young_for_online>
			endif
		else
			array = [
			]
			AddArrayElement array = <array> element = {func = ui_signin_warning_back text = qs("CANCEL")}
			if NetSessionFunc \{func = IsOldEnoughForOnline}
				if NetSessionFunc \{func = IsCableUnplugged}
					text = qs("You are not connected to the PlayStation®Network. Please connect and try again.")
				else
					if CheckForSignIn \{network_platform_only}
						text = qs("The game servers are currently unavailable. Please try again later.")
					else
						text = qs("You are not signed in to the PlayStation®Network. You must sign in to continue.")
					endif
				endif
			else
				text = <error_string_when_too_young_for_online>
			endif
		endif
		create_popup_warning_menu {
			textblock = {
				text = <text>
			}
			menu_pos = (640.0, 480.0)
			options = <array>
		}
		case xenon
		array = [
			{
				func = {signin_warning_select_signin params = {device_num = <player_device> allow_back = <allow_back> jam = <jam> require_live = <require_live> downloads = <downloads> leaderboards = <leaderboards> primary = <primary> force_signin = 1}}
				text = qs("SIGN IN")
			}
		]
		<continue_without_save> = 0
		if NOT GotParam \{downloads}
			if NOT GotParam \{leaderboards}
				if NOT GotParam \{require_live}
					<continue_without_save> = 1
				endif
			endif
		endif
		if ((GotParam jam) || (GotParam boot))
			<continue_without_save> = 1
		endif
		if GotParam \{jam}
			if (<jam> = 2)
				<continue_without_save> = 0
			endif
		endif
		if (<continue_without_save> = 1)
			AddArrayElement array = <array> element = {func = signin_warning_select_cws func_params = {player_device = <player_device>} text = qs("CONTINUE WITHOUT SAVING")}
		endif
		if GotParam \{allow_back}
			AddArrayElement array = <array> element = {func = ui_signin_warning_back text = qs("CANCEL") require_live = <require_live>}
		endif
		text = qs("You are not signed in to a gamer profile. You will be unable to save any game content until you sign in.")
		if GotParam \{downloads}
			text = qs("You are not signed in to a gamer profile. You will be unable to access any downloadable content until you sign into a gamer profile.")
		elseif GotParam \{leaderboards}
			text = qs("You are not signed in to a gamer profile. You will be unable to access any leaderboards until you sign into a gamer profile.")
			if CheckForSignIn local controller_index = ($primary_controller)
				text = qs("You must be signed in to Xbox LIVE to access leaderboards. Please connect and try again.")
			endif
		endif
		if GotParam \{require_live}
			<signed_in> = 0
			<multiplayer_allowed> = 0
			<live_enabled> = 0
			if NetSessionFunc func = IsLiveEnabled params = {controller_index = ($primary_controller)}
				<live_enabled> = 1
			endif
			if CheckForSignIn local controller_index = ($primary_controller)
				<signed_in> = 1
				if NetSessionFunc func = IsMultiplayerAllowed params = {controller_index = ($primary_controller)}
					<multiplayer_allowed> = 1
				endif
			endif
			if NetSessionFunc \{func = IsCableUnplugged}
				text = qs("You are not currently connected to Xbox LIVE. Please connect and try again.")
			elseif NetSessionFunc func = XenonIsGuest params = {controller_index = ($primary_controller)}
				text = qs("You are currently signed into a guest gamer profile. In order to use this feature, you must be signed into Xbox LIVE, and not a guest of a multiplayer enabled gamer profile.")
			elseif (<signed_in> = 0)
				text = qs("No gamer profile currently signed in. Please sign into an Xbox LIVE multiplayer enabled gamer profile to continue.")
			elseif (<signed_in> = 1 && <multiplayer_allowed> = 0)
				text = qs("The current gamer profile is not enabled for Xbox LIVE multiplayer game play or the network connection has been lost.")
			endif
		endif
		create_popup_warning_menu {
			player_device = <player_device>
			textblock = {
				text = <text>
				scale = 0.5
			}
			options = <array>
			menu_pos = (640.0, 480.0)
		}
	endswitch
endscript

script destroy_signin_warning_menu 
	destroy_popup_warning_menu
endscript

script signin_warning_select_signin 
	ui_event event = menu_replace data = {device_num = <device_num> state = uistate_signin new_state = ($signin_continue_state) new_data = ($signin_continue_data) allow_back = <allow_back> jam = <jam> require_live = <require_live> downloads = <downloads> leaderboards = <leaderboards> force_signin = <force_signin> primary = <primary>}
endscript

script signin_warning_select_cws player_device = ($primary_controller)
	start_checking_for_signin_change
	change \{enable_saving = 0}
	get_savegame_from_controller controller = <player_device>
	SetGlobalTags user_options savegame = <savegame> params = {autosave = 0}
	ui_event event = menu_replace data = {state = uistate_boot_download_scan controller = <device_num>
		event_params = {event = menu_replace data = {state = $signin_continue_state ($signin_continue_data)}}}
endscript

script signin_warning_select_continue 
	destroy_popup_warning_menu
	signin_warning_select_continue_done
endscript

script signin_warning_select_continue_done 
	destroy_popup_warning_menu
	if NOT (($signin_continue_state) = uistate_boot_guitar)
		ScriptAssert \{'$signin_continue_state != uistate_boot_guitar'}
	endif
	ui_event \{event = menu_replace
		data = {
			state = uistate_memcard
		}}
endscript

script do_ps3_memcard_warning 
	create_popup_warning_menu {
		textblock = {
			text = qs("This game saves data automatically at certain points. Do not switch off the power when the HDD access indicator is flashing.")
			pos = (640.0, 380.0)
			scale = 0.6
		}
		menu_pos = (640.0, 490.0)
		options = [
			{
				func = do_ps3_memcard_warning_helper
				func_params = {func = <func> params = <func_params>}
				text = qs("OK")
				scale = (1.0, 1.0)
			}
		]
		player_device = ($MemcardController)
	}
endscript

script do_ps3_memcard_warning_helper 
	<func> <params> controller = ($MemcardController)
endscript

script create_signin_complete_menu 
	memcard_cleanup_messages
	signin_complete_menu_select_ok
	change \{signin_complete_menu_select_ok_called = 0}
endscript
signin_complete_menu_select_ok_called = 0

script signin_complete_menu_select_ok 
	if ($signin_complete_menu_select_ok_called = 0)
		change \{signin_complete_menu_select_ok_called = 1}
		destroy_popup_warning_menu
		ui_signin_process_complete
		<callback> <callback_params>
	endif
endscript

script destroy_signin_complete_menu 
	destroy_popup_warning_menu
endscript

script create_online_signin_warning_menu 
	memcard_cleanup_messages
	if isXenon
		<text> = qs("You must be signed in to Xbox LIVE.")
	else
		<text> = qs("You must be signed in to access PlayStation®Network features.")
	endif
	create_popup_warning_menu {
		player_device = ($MemcardController)
		textblock = {
			text = <text>
		}
		menu_pos = (640.0, 490.0)
		options = [
			{
				func = {ui_flow_manager_respond_to_action params = {action = continue}}
				text = qs("CONTINUE")
				scale = (1.0, 1.0)
			}
		]
	}
endscript

script destroy_online_signin_warning_menu 
	destroy_popup_warning_menu
endscript

script create_storagedevice_warning_menu 
	mark_safe_for_shutdown
	memcard_cleanup_messages
	if IsPs3
		memcard_sequence_quit
	else
		if NOT CheckForSignIn local controller_index = ($MemcardController)
			memcard_sequence_quit
		endif
		if ($MemcardSavingOrLoading = Saving)
			if ($MemcardJamOrDefault = jam)
				desc_text = qs("No storage device selected or found. If no storage device is available, songs cannot be saved or deleted.")
			else
				desc_text = qs("No storage device selected or found. If no storage device is available, progress will not be saved.")
			endif
			continue_text = qs("CONTINUE WITHOUT SAVING")
			continue_func = memcard_disable_saves_and_quit
		else
			if ($MemcardJamOrDefault = jam)
				desc_text = qs("No storage device selected or found. If no storage device is available, songs will not be loaded and autosaving will be disabled.")
			else
				desc_text = qs("No storage device selected or found. If no storage device is available, progress will not be loaded and autosaving will be disabled.")
			endif
			continue_text = qs("CONTINUE")
			continue_func = memcard_disable_saves_and_quit
		endif
		<options_array> = [
			{
				func = {memcard_sequence_retry params = {StorageSelectorForce = 1}}
				text = qs("SELECT STORAGE DEVICE")
			}
			{
				func = <continue_func>
				text = <continue_text>
			}
		]
		if ($signin_jam_mode = 1)
			desc_text = qs("No storage device selected or found. You will be unable to create save data in the Music Studio without selecting a storage device.")
			continue_text = qs("CONTINUE WITHOUT SAVING")
			continue_func = memcard_disable_saves_and_quit
			<options_array> = [
				{
					func = {memcard_sequence_retry params = {StorageSelectorForce = 1}}
					text = qs("SELECT STORAGE DEVICE")
				}
				{
					func = <continue_func>
					text = <continue_text>
				}
				{
					func = generic_event_back
					text = qs("CANCEL")
				}
			]
		endif
		create_popup_warning_menu {
			textblock = {
				text = <desc_text>
				pos = (640.0, 380.0)
				scale = 0.6
			}
			player_device = ($MemcardController)
			menu_pos = (640.0, 465.0)
			dialog_pos = (640.0, 455.0)
			dialgo
			options = <options_array>
		}
	endif
endscript

script create_checking_memory_card_screen 
	memcard_cleanup_messages
	GetPlatform
	switch <platform>
		case ps3
		create_popup_warning_menu {
			player_device = ($MemcardController)
			title = qs("CHECKING...")
			textblock = {
				text = qs("Checking data. Please do not reset/switch off your system.")
			}
		}
		case xenon
		create_popup_warning_menu {
			player_device = ($MemcardController)
			title = qs("CHECKING...")
			textblock = {
				text = qs("Checking storage device...\nPlease do not turn off your Xbox 360 console.")
			}
		}
	endswitch
endscript

script create_confirm_overwrite_menu 
	mark_safe_for_shutdown
	memcard_cleanup_messages
	GetPlatform
	switch <platform>
		case ps3
		text = qs("Are you sure you want to overwrite this save data? All progress within this save data will be lost.")
		case xenon
		text = qs("Are you sure you want to overwrite this content? All progress within this save content will be lost.")
	endswitch
	if ($MemcardJamOrDefault = jam)
		<save_func> = memcard_save_jam
	else
		<save_func> = memcard_save_file
	endif
	create_popup_warning_menu {
		textblock = {
			text = <text>
			pos = (640.0, 370.0)
		}
		player_device = ($MemcardController)
		menu_pos = (640.0, 465.0)
		options = [
			{
				func = {<save_func> params = {OverwriteConfirmed = 1}}
				text = qs("OVERWRITE")
			}
			{
				func = {memcard_sequence_quit}
				text = qs("CANCEL")
			}
		]
		focus_index = 1
	}
endscript

script create_confirm_load_menu 
	mark_safe_for_shutdown
	memcard_cleanup_messages
	GetPlatform
	switch <platform>
		case ps3
		text = qs("Are you sure you want to load this save data? All progress since your last save will be lost.")
		case xenon
		text = qs("Are you sure you want to load this content? All progress since your last save will be lost.")
	endswitch
	create_popup_warning_menu {
		textblock = {
			text = <text>
			pos = (640.0, 370.0)
		}
		player_device = ($MemcardController)
		menu_pos = (640.0, 465.0)
		options = [
			{
				func = {memcard_load_file params = {LoadConfirmed = 1}}
				text = qs("LOAD")
			}
			{
				func = {memcard_sequence_quit}
				text = qs("CANCEL")
			}
		]
		focus_index = 1
		player_device = ($MemcardController)
	}
endscript

script create_no_save_found_menu 
	mark_safe_for_shutdown
	memcard_cleanup_messages
	GetPlatform
	switch <platform>
		case ps3
		if ($MemcardJamOrDefault = jam)
			FormatText \{TextName = BX_Save_Text
				qs("No Guitar Hero %a custom song save data found on HDD.")
				a = $BX_Game_Title
				AddToStringLookup}
			<textblock> = {text = <BX_Save_Text>}
		else
			FormatText \{TextName = BX_Save_Text
				qs("No Guitar Hero %a save data found on HDD.")
				a = $BX_Game_Title
				AddToStringLookup}
			<textblock> = {text = <BX_Save_Text>}
		endif
		create_popup_warning_menu {
			player_device = ($MemcardController)
			textblock = <textblock>
			menu_pos = (640.0, 480.0)
			options = [
				{
					func = memcard_sequence_quit
					text = qs("CONTINUE")
					scale = (1.0, 1.0)
				}
			]
		}
		case xenon
		if ($MemcardJamOrDefault = jam)
			FormatText \{TextName = BX_Save_Text
				qs("No Guitar Hero %a custom song saves present.")
				a = $BX_Game_Title
				AddToStringLookup}
			<textblock> = {text = <BX_Save_Text>}
		else
			FormatText \{TextName = BX_Save_Text
				qs("No Guitar Hero %a saves present.")
				a = $BX_Game_Title
				AddToStringLookup}
			<textblock> = {text = <BX_Save_Text>}
		endif
		create_popup_warning_menu {
			player_device = ($MemcardController)
			title = qs("NO SAVES")
			textblock = <textblock>
			menu_pos = (640.0, 465.0)
			dialog_pos = (640.0, 450.0)
			options = [
				{
					func = {memcard_sequence_retry params = {StorageSelectorForce = 1}}
					text = qs("TRY ANOTHER DEVICE")
				}
				{
					func = memcard_sequence_quit
					text = qs("CANCEL")
				}
			]
		}
	endswitch
endscript

script create_corrupted_data_menu \{file_type = `default`}
	mark_safe_for_shutdown
	memcard_cleanup_messages
	GetPlatform
	switch <platform>
		case ps3
		if (<file_type> = jam_file)
			text = qs("Custom song data is damaged and cannot be used. Do you want to delete this save data? All song data within this save will be lost.")
		else
			text = qs("Progression data is damaged and cannot be used. Do you want to delete this save data? All progress within this save data will be lost.")
		endif
		case xenon
		if (<file_type> = jam_file)
			text = qs("Custom song content is damaged and cannot be used. Do you want to delete this content? All song data within this save content will be lost.")
		else
			text = qs("Progression content is damaged and cannot be used. Do you want to delete this content? All progress within this save content will be lost.")
		endif
	endswitch
	if ($MemcardSavingOrLoading = Saving)
		options = [
			{
				func = memcard_delete_file
				text = qs("DELETE")
				scale = 1
				func_params = <...>
			}
			{
				func = memcard_disable_saves_and_quit
				text = qs("CONTINUE WITHOUT SAVING")
				scale = 1
			}
		]
	elseif ($MemcardInitialBoot = true)
		options = [
			{
				func = memcard_delete_file
				text = qs("DELETE")
				scale = 1
				func_params = <...>
			}
			{
				func = {menu_memcard_corrupt_data_cancel params = {disable file_type = <file_type>}}
				text = qs("CONTINUE WITHOUT SAVING")
				scale = 1
			}
		]
	else
		options = [
			{
				func = memcard_delete_file
				text = qs("DELETE")
				scale = 1
				func_params = <...>
			}
			{
				func = {menu_memcard_corrupt_data_cancel params = {file_type = <file_type>}}
				text = qs("CANCEL")
				scale = 1
			}
		]
	endif
	create_popup_warning_menu {
		player_device = ($MemcardController)
		textblock = {
			text = <text>
			pos = (640.0, 375.0)
			scale = 0.5
		}
		menu_pos = (640.0, 465.0)
		options = <options>
	}
endscript

script menu_memcard_corrupt_data_cancel 
	RequireParams \{[
			file_type
		]
		all}
	if NOT (<file_type> = jam_file)
		refresh_jam_directory_contents
	endif
	if GotParam \{disable}
		memcard_disable_saves_and_quit
	else
		memcard_sequence_quit
	endif
endscript

script create_delete_file_menu 
	memcard_cleanup_messages
	GetPlatform
	switch <platform>
		case ps3
		create_popup_warning_menu {
			player_device = ($MemcardController)
			title = qs("DELETING...")
			textblock = {
				text = qs("Deleting save data. Do not switch off power during this time.")
			}
		}
		case xenon
		create_popup_warning_menu {
			player_device = ($MemcardController)
			title = qs("DELETING...")
			textblock = {
				text = qs("Deleting content.\nPlease don't turn off your Xbox 360 console.")
			}
		}
	endswitch
endscript

script create_load_success_menu 
	memcard_cleanup_messages
	GetPlatform
	switch <platform>
		case ps3
		create_popup_warning_menu {
			player_device = ($MemcardController)
			title = qs("SUCCESSFUL")
			textblock = {
				text = qs("Load successful.")
			}
		}
		case xenon
		create_popup_warning_menu {
			player_device = ($MemcardController)
			title = qs("SUCCESSFUL")
			textblock = {
				text = qs("Load successful.")
			}
		}
	endswitch
endscript

script create_rename_success_menu 
	memcard_cleanup_messages
	GetPlatform
	switch <platform>
		case ps3
		create_popup_warning_menu {
			player_device = ($MemcardController)
			title = qs("SUCCESSFUL")
			textblock = {
				text = qs("Save successful.")
			}
		}
		case xenon
		create_popup_warning_menu {
			player_device = ($MemcardController)
			title = qs("SUCCESSFUL")
			textblock = {
				text = qs("Save successful.")
			}
		}
	endswitch
endscript

script create_delete_success_menu 
	memcard_cleanup_messages
	GetPlatform
	switch <platform>
		case ps3
		create_popup_warning_menu {
			player_device = ($MemcardController)
			title = qs("SUCCESSFUL")
			textblock = {
				text = qs("Delete successful.")
			}
		}
		case xenon
		create_popup_warning_menu {
			player_device = ($MemcardController)
			title = qs("SUCCESSFUL")
			textblock = {
				text = qs("Delete successful.")
			}
		}
	endswitch
endscript

script create_save_success_menu 
	memcard_cleanup_messages
	GetPlatform
	switch <platform>
		case ps3
		create_popup_warning_menu {
			player_device = ($MemcardController)
			title = qs("SUCCESSFUL")
			textblock = {
				text = qs("Save successful.")
			}
		}
		case xenon
		create_popup_warning_menu {
			player_device = ($MemcardController)
			title = qs("SUCCESSFUL")
			textblock = {
				text = qs("Save successful.")
			}
		}
	endswitch
endscript

script create_overwrite_success_menu 
	memcard_cleanup_messages
	printscriptinfo
	GetPlatform
	switch <platform>
		case ps3
		create_popup_warning_menu {
			player_device = ($MemcardController)
			title = qs("SUCCESSFUL")
			textblock = {
				text = qs("Overwrite successful.")
			}
		}
		case xenon
		create_popup_warning_menu {
			player_device = ($MemcardController)
			title = qs("SUCCESSFUL")
			textblock = {
				text = qs("Overwrite successful.")
			}
		}
	endswitch
endscript

script create_delete_failed_menu 
	mark_safe_for_shutdown
	memcard_cleanup_messages
	GetPlatform
	switch <platform>
		case ps3
		create_popup_warning_menu {
			title = qs("DELETE FAILED!")
			textblock = {
				text = qs("Delete failed!  Please exit the game and delete this game data.")
			}
			player_device = ($MemcardController)
			menu_pos = (640.0, 465.0)
			options = [
				{
					func = memcard_sequence_retry
					text = qs("RETRY")
				}
				{
					func = memcard_sequence_quit
					text = qs("CONTINUE")
				}
			]
		}
		case xenon
		create_popup_warning_menu {
			title = qs("DELETE FAILED!")
			textblock = {
				text = qs("UNABLE TO DELETE.")
			}
			player_device = ($MemcardController)
			menu_pos = (640.0, 465.0)
			options = [
				{
					func = memcard_sequence_retry
					text = qs("RETRY")
				}
				{
					func = memcard_sequence_quit
					text = qs("CONTINUE")
				}
			]
		}
	endswitch
endscript

script create_load_failed_menu 
	mark_safe_for_shutdown
	memcard_cleanup_messages
	GetPlatform
	switch <platform>
		case ps3
		create_popup_warning_menu {
			textblock = {
				text = qs("Failed to load. The save appears to be corrupt.")
				pos = (640.0, 380.0)
			}
			player_device = ($MemcardController)
			menu_pos = (640.0, 465.0)
			options = [
				{
					func = memcard_sequence_retry
					text = qs("RETRY")
				}
				{
					func = memcard_sequence_quit
					text = qs("CONTINUE")
				}
			]
		}
		case xenon
		create_popup_warning_menu {
			textblock = {
				text = qs("Failed trying to load.")
				pos = (640.0, 380.0)
			}
			player_device = ($MemcardController)
			menu_pos = (640.0, 465.0)
			options = [
				{
					func = {memcard_sequence_retry params = {StorageSelectorForce = 1}}
					text = qs("RETRY")
				}
				{
					func = memcard_sequence_quit
					text = qs("CONTINUE")
				}
			]
		}
	endswitch
endscript

script create_save_failed_menu 
	mark_safe_for_shutdown
	memcard_cleanup_messages
	GetPlatform
	switch <platform>
		case ps3
		create_popup_warning_menu {
			textblock = {
				text = qs("Process failed.")
				pos = (640.0, 380.0)
			}
			player_device = ($MemcardController)
			menu_pos = (640.0, 465.0)
			options = [
				{
					func = memcard_sequence_retry
					text = qs("RETRY")
				}
				{
					func = memcard_sequence_quit
					text = qs("CONTINUE")
				}
			]
		}
		case xenon
		create_popup_warning_menu {
			textblock = {
				text = qs("Process failed.\nNo storage device was selected or the in-use storage device is unavailable.")
				pos = (640.0, 380.0)
			}
			player_device = ($MemcardController)
			menu_pos = (640.0, 465.0)
			options = [
				{
					func = {memcard_sequence_retry params = {StorageSelectorForce = 1}}
					text = qs("RETRY")
				}
				{
					func = memcard_sequence_quit
					text = qs("CONTINUE")
				}
			]
		}
	endswitch
endscript

script create_overwrite_failed_menu 
	mark_safe_for_shutdown
	memcard_cleanup_messages
	GetPlatform
	switch <platform>
		case ps3
		create_popup_warning_menu {
			textblock = {
				text = qs("Failed trying to overwrite.")
				pos = (640.0, 380.0)
			}
			player_device = ($MemcardController)
			menu_pos = (640.0, 465.0)
			options = [
				{
					func = memcard_sequence_retry
					text = qs("RETRY")
				}
				{
					func = memcard_sequence_quit
					text = qs("CONTINUE")
				}
			]
		}
		case xenon
		create_popup_warning_menu {
			textblock = {
				text = qs("Overwrite failed.\nNo storage device was selected or the in-use storage device is unavailable.")
				pos = (640.0, 380.0)
			}
			player_device = ($MemcardController)
			menu_pos = (640.0, 465.0)
			options = [
				{
					func = memcard_sequence_retry
					text = qs("RETRY")
				}
				{
					func = memcard_sequence_quit
					text = qs("CONTINUE")
				}
			]
		}
	endswitch
endscript

script create_out_of_space_menu \{message_type = `default`}
	mark_safe_for_shutdown
	memcard_cleanup_messages
	GetPlatform
	switch <platform>
		case ps3
		MC_SpaceForNewFolder \{desc = GuitarContent}
		FormatText TextName = message qs("Insufficient HDD space to save. Guitar Hero %a requires %dKB HDD space to save data.") a = $BX_Game_Title d = <SpaceRequired>
		create_popup_warning_menu {
			textblock = {
				text = <message>
				pos = (640.0, 390.0)
				scale = 0.5
			}
			player_device = ($MemcardController)
			menu_pos = (640.0, 465.0)
			options = [
				{
					func = memcard_delete_file
					text = qs("DELETE FILES")
				}
				{
					func = memcard_disable_saves_and_quit
					text = qs("CONTINUE WITHOUT SAVING")
				}
			]
		}
		case xenon
		if ($MemcardSavingOrLoading = Saving)
			if ($MemcardJamOrDefault = `default`)
				text = [
					qs("No space left to save progress.")
					qs("\L\n")
					qs("Please return to the Xbox Dashboard and delete some existing data, or you will not be able to save future progress.")
				]
				continue_text = qs("CONTINUE")
			else
				text = [
					qs("No space to save.")
					qs("\L\n")
					qs("Please return to the Xbox Dashboard and delete some existing data.")
				]
				continue_text = qs("CONTINUE WITHOUT SAVING")
			endif
			create_popup_warning_menu {
				textblock = {
					text = <text>
					pos = (640.0, 390.0)
					scale = 0.5
				}
				player_device = ($MemcardController)
				menu_pos = (640.0, 465.0)
				options = [
					{
						func = {memcard_sequence_retry params = {StorageSelectorForce = 1}}
						text = qs("SELECT STORAGE DEVICE")
					}
					{
						func = memcard_disable_saves_and_quit
						text = <continue_text>
					}
				]
			}
		else
			create_load_failed_menu
		endif
	endswitch
endscript

script create_load_file_menu 
	memcard_cleanup_messages
	GetPlatform
	switch <platform>
		case ps3
		create_popup_warning_menu {
			player_device = ($MemcardController)
			title = qs("LOADING...")
			textblock = {
				text = qs("Loading data. Please do not reset/switch off your system.")
			}
		}
		case xenon
		create_popup_warning_menu {
			player_device = ($MemcardController)
			title = qs("LOADING...")
			textblock = {
				text = qs("Loading content.\nPlease don't turn off your Xbox 360 console.")
			}
		}
	endswitch
endscript

script create_overwrite_menu 
	memcard_cleanup_messages
	GetPlatform
	switch <platform>
		case ps3
		create_popup_warning_menu {
			player_device = ($MemcardController)
			title = qs("OVERWRITING...")
			textblock = {
				text = qs("Overwriting previous save data. Please do not reset/switch off your system.")
			}
		}
		case xenon
		default
		create_popup_warning_menu {
			player_device = ($MemcardController)
			title = qs("SAVING...")
			textblock = {
				text = qs("Saving content.\nPlease don't turn off your console.")
			}
		}
	endswitch
endscript

script create_save_menu 
	memcard_cleanup_messages
	GetPlatform
	switch <platform>
		case ps3
		create_popup_warning_menu {
			player_device = ($MemcardController)
			title = qs("SAVING...")
			textblock = {
				text = qs("Saving to the HDD. Please do not reset/switch off your system.")
			}
		}
		case xenon
		create_popup_warning_menu {
			player_device = ($MemcardController)
			title = qs("SAVING...")
			textblock = {
				text = qs("Saving content.\nPlease don't turn off your console.")
			}
		}
	endswitch
endscript

script create_delete_menu 
	memcard_cleanup_messages
	GetPlatform
	switch <platform>
		case ps3
		create_popup_warning_menu {
			player_device = ($MemcardController)
			title = qs("DELETING...")
			textblock = {
				text = qs("Deleting content from the HDD. Please do not reset/switch off your system.")
			}
		}
		case xenon
		create_popup_warning_menu {
			player_device = ($MemcardController)
			title = qs("DELETING...")
			textblock = {
				text = qs("Deleting content.\nPlease don't turn off the Xbox 360 console.")
			}
		}
	endswitch
endscript
