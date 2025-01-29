load_warning_menu_font = fontgrid_title_a1
respond_to_signin_changed = 0
respond_to_signin_changed_all_players = 0
respond_to_signin_changed_func = None

script start_checking_for_signin_change 
	printf \{qs(0x08e4bedc)}
	printscriptinfo \{qs(0x08e4bedc)}
	printf \{qs(0x329c888b)}
	KillSpawnedScript \{Name = sysnotify_handle_signin_change}
	printf \{qs(0x80fc902c)}
	Change \{respond_to_signin_changed = 1}
	Change \{menu_select_difficulty_first_time = 1}
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
			Frame}
		repeat
	endif
endscript
ps3_signin_complete = 0

script signin_complete_callback 
	printf \{'signin_complete_callback'}
	Change \{ps3_signin_complete = 1}
endscript

script create_signin_warning_menu player_device = ($memcardcontroller)
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		<error_string_when_too_young_for_online> = qs(0x052f0757)
		if NOT GotParam \{require_live}
			array = [
				{
					func = signin_warning_select_continue
					text = qs(0x182f0173)
					Scale = (1.0, 1.0)
				}
			]
			if GotParam \{allow_back}
				AddArrayElement array = <array> element = {func = ui_signin_warning_back text = qs(0xf7723015)}
			endif
			if NetSessionFunc \{func = isoldenoughforonline}
				if CheckForSignIn \{network_platform_only}
					text = qs(0xf6ab5df3)
				else
					text = qs(0xbecdcff0)
				endif
			else
				text = <error_string_when_too_young_for_online>
			endif
		else
			array = [
			]
			AddArrayElement array = <array> element = {func = ui_signin_warning_back text = qs(0xf7723015)}
			if NetSessionFunc \{func = isoldenoughforonline}
				if NetSessionFunc \{func = iscableunplugged}
					text = qs(0xb9836f21)
				else
					if CheckForSignIn \{network_platform_only}
						text = qs(0x0f686da5)
					else
						text = qs(0xb9836f21)
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
		case Xenon
		array = [
			{
				func = {signin_warning_select_signin params = {device_num = <player_device> allow_back = <allow_back> jam = <jam> require_live = <require_live> downloads = <downloads> leaderboards = <leaderboards> primary = <primary> force_signin = 1}}
				text = qs(0x17df5913)
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
			AddArrayElement array = <array> element = {func = signin_warning_select_cws func_params = {player_device = <player_device>} text = qs(0x06d0b6b0)}
		endif
		if GotParam \{allow_back}
			AddArrayElement array = <array> element = {func = ui_signin_warning_back text = qs(0xf7723015) require_live = <require_live>}
		endif
		text = qs(0xf97bd659)
		if GotParam \{downloads}
			text = qs(0xb586f45b)
		elseif GotParam \{leaderboards}
			text = qs(0x3f6f5d6a)
			if CheckForSignIn local controller_index = ($primary_controller)
				text = qs(0x3a2c3ac0)
			endif
		endif
		if GotParam \{require_live}
			<signed_in> = 0
			<multiplayer_allowed> = 0
			<live_enabled> = 0
			if NetSessionFunc func = isliveenabled params = {controller_index = ($primary_controller)}
				<live_enabled> = 1
			endif
			if CheckForSignIn local controller_index = ($primary_controller)
				<signed_in> = 1
				if NetSessionFunc func = ismultiplayerallowed params = {controller_index = ($primary_controller)}
					<multiplayer_allowed> = 1
				endif
			endif
			if NetSessionFunc \{func = iscableunplugged}
				text = qs(0xab79bf04)
			elseif NetSessionFunc func = xenonisguest params = {controller_index = ($primary_controller)}
				text = qs(0xb9fd7c2c)
			elseif (<signed_in> = 0)
				text = qs(0xee63bbfc)
			elseif (<signed_in> = 1 && <multiplayer_allowed> = 0)
				text = qs(0x7888d99e)
			endif
		endif
		create_popup_warning_menu {
			player_device = <player_device>
			textblock = {
				text = <text>
				Scale = 0.5
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
	Change \{enable_saving = 0}
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
			text = qs(0xcefbc6d3)
			Pos = (640.0, 380.0)
			Scale = 0.6
		}
		menu_pos = (640.0, 490.0)
		options = [
			{
				func = do_ps3_memcard_warning_helper
				func_params = {func = <func> params = <func_params>}
				text = qs(0x0e41fe46)
				Scale = (1.0, 1.0)
			}
		]
		player_device = ($memcardcontroller)
	}
endscript

script do_ps3_memcard_warning_helper 
	<func> <params> controller = ($memcardcontroller)
endscript

script create_signin_complete_menu 
	memcard_cleanup_messages
	signin_complete_menu_select_ok
	Change \{signin_complete_menu_select_ok_called = 0}
endscript
signin_complete_menu_select_ok_called = 0

script signin_complete_menu_select_ok 
	if ($signin_complete_menu_select_ok_called = 0)
		Change \{signin_complete_menu_select_ok_called = 1}
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
		<text> = qs(0x859788d5)
	else
		<text> = qs(0x272e1a21)
	endif
	create_popup_warning_menu {
		player_device = ($memcardcontroller)
		textblock = {
			text = <text>
		}
		menu_pos = (640.0, 490.0)
		options = [
			{
				func = {ui_flow_manager_respond_to_action params = {action = continue}}
				text = qs(0x182f0173)
				Scale = (1.0, 1.0)
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
	if isps3
		memcard_sequence_quit
	else
		if NOT CheckForSignIn local controller_index = ($memcardcontroller)
			memcard_sequence_quit
		endif
		if ($MemcardSavingOrLoading = saving)
			if ($memcardjamordefault = jam)
				desc_text = qs(0xacd4569d)
			else
				desc_text = qs(0x55dfedef)
			endif
			continue_text = qs(0x06d0b6b0)
			continue_func = memcard_disable_saves_and_quit
		else
			if ($memcardjamordefault = jam)
				desc_text = qs(0x4e114193)
			else
				desc_text = qs(0x300c4bf5)
			endif
			continue_text = qs(0x182f0173)
			continue_func = memcard_disable_saves_and_quit
		endif
		if ($memcardjamordefault = jam)
			<options_array> = [
				{
					func = <continue_func>
					text = <continue_text>
				}
			]
		else
			<options_array> = [
				{
					func = {memcard_sequence_retry params = {StorageSelectorForce = 1}}
					text = qs(0x727bdc99)
				}
				{
					func = <continue_func>
					text = <continue_text>
				}
			]
		endif
		if ($signin_jam_mode = 1)
			desc_text = qs(0x86e75bd0)
			continue_text = qs(0x06d0b6b0)
			continue_func = memcard_disable_saves_and_quit
			<options_array> = [
				{
					func = {memcard_sequence_retry params = {StorageSelectorForce = 1}}
					text = qs(0x727bdc99)
				}
				{
					func = <continue_func>
					text = <continue_text>
				}
				{
					func = generic_event_back
					text = qs(0xf7723015)
				}
			]
		endif
		create_popup_warning_menu {
			textblock = {
				text = <desc_text>
				Pos = (640.0, 380.0)
				Scale = 0.6
			}
			player_device = ($memcardcontroller)
			menu_pos = (640.0, 465.0)
			dialog_pos = (640.0, 455.0)
			dialgo
			options = <options_array>
			background
		}
	endif
endscript

script create_checking_memory_card_screen 
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		create_popup_warning_menu {
			player_device = ($memcardcontroller)
			title = qs(0x232eed4e)
			textblock = {
				text = qs(0x2ccef527)
			}
			background
		}
		case Xenon
		create_popup_warning_menu {
			player_device = ($memcardcontroller)
			title = qs(0x232eed4e)
			textblock = {
				text = qs(0x7aede44a)
			}
			background
		}
	endswitch
endscript

script create_confirm_overwrite_menu 
	mark_safe_for_shutdown
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		text = qs(0xc0da9b99)
		case Xenon
		text = qs(0xd13a6074)
	endswitch
	if ($memcardjamordefault = jam)
		<save_func> = memcard_save_jam
	else
		<save_func> = memcard_save_file
	endif
	create_popup_warning_menu {
		textblock = {
			text = <text>
			Pos = (640.0, 370.0)
		}
		player_device = ($memcardcontroller)
		menu_pos = (640.0, 465.0)
		options = [
			{
				func = {<save_func> params = {OverwriteConfirmed = 1}}
				text = qs(0xf77909ae)
			}
			{
				func = {memcard_sequence_quit}
				text = qs(0xf7723015)
			}
		]
		focus_index = 1
	}
endscript

script create_confirm_load_menu 
	mark_safe_for_shutdown
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		text = qs(0x03ff95e6)
		case Xenon
		text = qs(0xde509f6c)
	endswitch
	create_popup_warning_menu {
		textblock = {
			text = <text>
			Pos = (640.0, 370.0)
		}
		player_device = ($memcardcontroller)
		menu_pos = (640.0, 465.0)
		options = [
			{
				func = {memcard_load_file params = {LoadConfirmed = 1}}
				text = qs(0xad5cfad4)
			}
			{
				func = {memcard_sequence_quit}
				text = qs(0xf7723015)
			}
		]
		focus_index = 1
		player_device = ($memcardcontroller)
	}
endscript

script create_no_save_found_menu 
	mark_safe_for_shutdown
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		if ($memcardjamordefault = jam)
			<textblock> = {text = qs(0x487b46d4)}
		else
			<textblock> = {text = qs(0xa927fa79)}
		endif
		create_popup_warning_menu {
			player_device = ($memcardcontroller)
			textblock = <textblock>
			menu_pos = (640.0, 480.0)
			options = [
				{
					func = memcard_sequence_quit
					text = qs(0x182f0173)
					Scale = (1.0, 1.0)
				}
			]
			background
		}
		case Xenon
		if ($memcardjamordefault = jam)
			<textblock> = {text = qs(0x7ad61e8c)}
		else
			<textblock> = {text = qs(0x48338929)}
		endif
		create_popup_warning_menu {
			player_device = ($memcardcontroller)
			title = qs(0x423b9e4e)
			textblock = <textblock>
			menu_pos = (640.0, 465.0)
			dialog_pos = (640.0, 450.0)
			options = [
				{
					func = {memcard_sequence_retry params = {StorageSelectorForce = 1}}
					text = qs(0xa647ca8f)
				}
				{
					func = memcard_sequence_quit
					text = qs(0xf7723015)
				}
			]
			background
		}
	endswitch
endscript

script create_corrupted_data_menu \{file_type = Default}
	mark_safe_for_shutdown
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		if (<file_type> = jam_file)
			text = qs(0xfb455ec5)
		else
			text = qs(0x601ed76f)
		endif
		case Xenon
		if (<file_type> = jam_file)
			text = qs(0x3996dc6e)
		else
			text = qs(0x972c83ff)
		endif
	endswitch
	if ($MemcardSavingOrLoading = saving)
		options = [
			{
				func = memcard_delete_file
				text = qs(0x271a1633)
				Scale = 1
				func_params = <...>
			}
			{
				func = memcard_disable_saves_and_quit
				text = qs(0x06d0b6b0)
				Scale = 1
			}
		]
	elseif ($memcardinitialboot = true)
		options = [
			{
				func = memcard_delete_file
				text = qs(0x271a1633)
				Scale = 1
				func_params = <...>
			}
			{
				func = {menu_memcard_corrupt_data_cancel params = {disable file_type = <file_type>}}
				text = qs(0x06d0b6b0)
				Scale = 1
			}
		]
	else
		options = [
			{
				func = memcard_delete_file
				text = qs(0x271a1633)
				Scale = 1
				func_params = <...>
			}
			{
				func = {menu_memcard_corrupt_data_cancel params = {file_type = <file_type>}}
				text = qs(0xf7723015)
				Scale = 1
			}
		]
	endif
	create_popup_warning_menu {
		player_device = ($memcardcontroller)
		textblock = {
			text = <text>
			Pos = (640.0, 375.0)
			Scale = 0.5
		}
		menu_pos = (640.0, 465.0)
		options = <options>
		background
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
	switch <Platform>
		case PS3
		create_popup_warning_menu {
			player_device = ($memcardcontroller)
			title = qs(0x6b122c30)
			textblock = {
				text = qs(0xb7450831)
			}
		}
		case Xenon
		create_popup_warning_menu {
			player_device = ($memcardcontroller)
			title = qs(0x6b122c30)
			textblock = {
				text = qs(0x0b751720)
			}
		}
	endswitch
endscript

script create_load_success_menu 
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		create_popup_warning_menu {
			player_device = ($memcardcontroller)
			title = qs(0x9853e050)
			textblock = {
				text = qs(0xeae1a950)
			}
			background
		}
		case Xenon
		create_popup_warning_menu {
			player_device = ($memcardcontroller)
			title = qs(0x9853e050)
			textblock = {
				text = qs(0xeae1a950)
			}
			background
		}
	endswitch
endscript

script create_rename_success_menu 
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		create_popup_warning_menu {
			player_device = ($memcardcontroller)
			title = qs(0x9853e050)
			textblock = {
				text = qs(0xe546315d)
			}
		}
		case Xenon
		create_popup_warning_menu {
			player_device = ($memcardcontroller)
			title = qs(0x9853e050)
			textblock = {
				text = qs(0xe546315d)
			}
		}
	endswitch
endscript

script create_delete_success_menu 
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		create_popup_warning_menu {
			player_device = ($memcardcontroller)
			title = qs(0x9853e050)
			textblock = {
				text = qs(0x78f0a884)
			}
		}
		case Xenon
		create_popup_warning_menu {
			player_device = ($memcardcontroller)
			title = qs(0x9853e050)
			textblock = {
				text = qs(0x78f0a884)
			}
		}
	endswitch
endscript

script create_save_success_menu 
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		create_popup_warning_menu {
			player_device = ($memcardcontroller)
			title = qs(0x9853e050)
			textblock = {
				text = qs(0xe546315d)
			}
		}
		case Xenon
		create_popup_warning_menu {
			player_device = ($memcardcontroller)
			title = qs(0x9853e050)
			textblock = {
				text = qs(0xe546315d)
			}
		}
	endswitch
endscript

script create_overwrite_success_menu 
	memcard_cleanup_messages
	printscriptinfo
	GetPlatform
	switch <Platform>
		case PS3
		create_popup_warning_menu {
			player_device = ($memcardcontroller)
			title = qs(0x9853e050)
			textblock = {
				text = qs(0x6a3945f4)
			}
		}
		case Xenon
		create_popup_warning_menu {
			player_device = ($memcardcontroller)
			title = qs(0x9853e050)
			textblock = {
				text = qs(0x6a3945f4)
			}
		}
	endswitch
endscript

script create_delete_failed_menu 
	mark_safe_for_shutdown
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		create_popup_warning_menu {
			title = qs(0x1aa397cd)
			textblock = {
				text = qs(0xba04b3d6)
			}
			player_device = ($memcardcontroller)
			menu_pos = (640.0, 465.0)
			options = [
				{
					func = memcard_sequence_retry
					text = qs(0x5d8b66a0)
				}
				{
					func = memcard_sequence_quit
					text = qs(0x182f0173)
				}
			]
		}
		case Xenon
		create_popup_warning_menu {
			title = qs(0x1aa397cd)
			textblock = {
				text = qs(0x3605b1df)
			}
			player_device = ($memcardcontroller)
			menu_pos = (640.0, 465.0)
			options = [
				{
					func = memcard_sequence_retry
					text = qs(0x5d8b66a0)
				}
				{
					func = memcard_sequence_quit
					text = qs(0x182f0173)
				}
			]
		}
	endswitch
endscript

script create_load_failed_menu 
	mark_safe_for_shutdown
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		create_popup_warning_menu {
			textblock = {
				text = qs(0x02f65e0b)
				Pos = (640.0, 380.0)
			}
			player_device = ($memcardcontroller)
			menu_pos = (640.0, 465.0)
			options = [
				{
					func = memcard_sequence_retry
					text = qs(0x5d8b66a0)
				}
				{
					func = memcard_sequence_quit
					text = qs(0x182f0173)
				}
			]
			background
		}
		case Xenon
		create_popup_warning_menu {
			textblock = {
				text = qs(0xd82f86b3)
				Pos = (640.0, 380.0)
			}
			player_device = ($memcardcontroller)
			menu_pos = (640.0, 465.0)
			options = [
				{
					func = {memcard_sequence_retry params = {StorageSelectorForce = 1}}
					text = qs(0x5d8b66a0)
				}
				{
					func = memcard_sequence_quit
					text = qs(0x182f0173)
				}
			]
			background
		}
	endswitch
endscript

script create_save_failed_menu 
	mark_safe_for_shutdown
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		create_popup_warning_menu {
			textblock = {
				text = qs(0x451503a2)
				Pos = (640.0, 380.0)
			}
			player_device = ($memcardcontroller)
			menu_pos = (640.0, 465.0)
			options = [
				{
					func = memcard_sequence_retry
					text = qs(0x5d8b66a0)
				}
				{
					func = memcard_sequence_quit
					text = qs(0x182f0173)
				}
			]
		}
		case Xenon
		create_popup_warning_menu {
			textblock = {
				text = qs(0x36e7d810)
				Pos = (640.0, 380.0)
			}
			player_device = ($memcardcontroller)
			menu_pos = (640.0, 465.0)
			options = [
				{
					func = {memcard_sequence_retry params = {StorageSelectorForce = 1}}
					text = qs(0x5d8b66a0)
				}
				{
					func = memcard_sequence_quit
					text = qs(0x182f0173)
				}
			]
		}
	endswitch
endscript

script create_overwrite_failed_menu 
	mark_safe_for_shutdown
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		create_popup_warning_menu {
			textblock = {
				text = qs(0xf03a8927)
				Pos = (640.0, 380.0)
			}
			player_device = ($memcardcontroller)
			menu_pos = (640.0, 465.0)
			options = [
				{
					func = memcard_sequence_retry
					text = qs(0x5d8b66a0)
				}
				{
					func = memcard_sequence_quit
					text = qs(0x182f0173)
				}
			]
		}
		case Xenon
		create_popup_warning_menu {
			textblock = {
				text = qs(0xbf8a9615)
				Pos = (640.0, 380.0)
			}
			player_device = ($memcardcontroller)
			menu_pos = (640.0, 465.0)
			options = [
				{
					func = memcard_sequence_retry
					text = qs(0x5d8b66a0)
				}
				{
					func = memcard_sequence_quit
					text = qs(0x182f0173)
				}
			]
		}
	endswitch
endscript

script create_out_of_space_menu \{message_type = Default}
	mark_safe_for_shutdown
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		MC_SpaceForNewFolder \{desc = GuitarContent}
		formatText TextName = message qs(0xd1a60c64) d = <SpaceRequired>
		create_popup_warning_menu {
			textblock = {
				text = <message>
				Pos = (640.0, 390.0)
				Scale = 0.5
			}
			player_device = ($memcardcontroller)
			menu_pos = (640.0, 465.0)
			options = [
				{
					func = memcard_delete_file
					text = qs(0x0b690d61)
				}
				{
					func = memcard_disable_saves_and_quit
					text = qs(0x06d0b6b0)
				}
			]
		}
		case Xenon
		if ($MemcardSavingOrLoading = saving)
			if ($memcardjamordefault = Default)
				text = [
					qs(0x924e0051)
					qs(0x9a6bfa3b)
					qs(0x4bb7edcb)
				]
				continue_text = qs(0x182f0173)
			else
				text = [
					qs(0x33709e0a)
					qs(0x9a6bfa3b)
					qs(0xb5e140a8)
				]
				continue_text = qs(0x06d0b6b0)
			endif
			create_popup_warning_menu {
				textblock = {
					text = <text>
					Pos = (640.0, 390.0)
					Scale = 0.5
				}
				player_device = ($memcardcontroller)
				menu_pos = (640.0, 465.0)
				options = [
					{
						func = {memcard_sequence_retry params = {StorageSelectorForce = 1}}
						text = qs(0x727bdc99)
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
	switch <Platform>
		case PS3
		create_popup_warning_menu {
			player_device = ($memcardcontroller)
			title = qs(0xfab8f6e7)
			textblock = {
				text = qs(0xc4412f98)
			}
			background
		}
		case Xenon
		create_popup_warning_menu {
			player_device = ($memcardcontroller)
			title = qs(0xfab8f6e7)
			textblock = {
				text = qs(0x3987d67f)
			}
			background
		}
	endswitch
endscript

script create_overwrite_menu 
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		create_popup_warning_menu {
			player_device = ($memcardcontroller)
			title = qs(0xd99906d4)
			textblock = {
				text = qs(0xdcc10e42)
			}
		}
		case Xenon
		default
		create_popup_warning_menu {
			player_device = ($memcardcontroller)
			title = qs(0xc13ee209)
			textblock = {
				text = qs(0x35df82e3)
			}
		}
	endswitch
endscript

script create_save_menu 
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		create_popup_warning_menu {
			player_device = ($memcardcontroller)
			title = qs(0xc13ee209)
			textblock = {
				text = qs(0x01b18d92)
			}
		}
		case Xenon
		create_popup_warning_menu {
			player_device = ($memcardcontroller)
			title = qs(0xc13ee209)
			textblock = {
				text = qs(0x35df82e3)
			}
		}
	endswitch
endscript

script create_delete_menu 
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		create_popup_warning_menu {
			player_device = ($memcardcontroller)
			title = qs(0x6b122c30)
			textblock = {
				text = qs(0x57d417a1)
			}
		}
		case Xenon
		create_popup_warning_menu {
			player_device = ($memcardcontroller)
			title = qs(0x6b122c30)
			textblock = {
				text = qs(0x7ff39530)
			}
		}
	endswitch
endscript
