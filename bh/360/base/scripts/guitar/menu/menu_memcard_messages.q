
script do_ps3_memcard_warning 
	create_dialog_box {
		body_text = qs(0xcefbc6d3)
		options = [
			{
				func = do_ps3_memcard_warning_helper
				func_params = {func = <func> params = <func_params>}
				text = qs(0x0e41fe46)
			}
		]
		use_all_controllers
	}
endscript

script do_ps3_memcard_warning_helper 
	<func> <params> controller = ($MemcardController)
endscript

script create_storagedevice_warning_menu 
	printscriptinfo \{'create_storagedevice_warning_menu'}
	printstruct <...>
	if ($autolaunch_jam_skip_memcard = 1)
		memcard_sequence_quit
	endif
	mark_safe_for_shutdown
	memcard_cleanup_messages
	if IsPS3
		memcard_sequence_quit
	else
		if NOT CheckForSignIn local controller_index = ($MemcardController)
			memcard_sequence_quit
		endif
		if ($MemcardSavingOrLoading = saving)
			if ($MemcardJamOrDefault = Jam)
				desc_text = qs(0xacd4569d)
			else
				desc_text = qs(0x55dfedef)
			endif
			continue_text = qs(0x06d0b6b0)
			continue_func = memcard_disable_saves_and_quit
		else
			if ($MemcardJamOrDefault = Jam)
				desc_text = qs(0x98fc56ca)
			else
				desc_text = qs(0x8cfe7bb3)
			endif
			continue_text = qs(0x182f0173)
			continue_func = memcard_disable_saves_and_quit
		endif
		<options_array> = [
			{
				func = memcard_sequence_retry
				func_params = {StorageSelectorForce = 1}
				text = qs(0x727bdc99)
			}
			{
				func = <continue_func>
				text = <continue_text>
			}
		]
		if ($signin_jam_mode = 1)
			desc_text = qs(0x1a8dba7d)
			continue_text = qs(0x06d0b6b0)
			continue_func = memcard_disable_saves_and_quit
			<options_array> = [
				{
					func = memcard_sequence_retry
					func_params = {StorageSelectorForce = 1}
					text = qs(0x727bdc99)
				}
				{
					func = <continue_func>
					text = <continue_text>
				}
				{
					func = generic_event_back
					func_params = {nosound}
					text = qs(0xf7723015)
				}
			]
		endif
		create_dialog_box {
			body_text = <desc_text>
			player_device = ($MemcardController)
			options = <options_array>
		}
	endif
	destroy_loading_screen
endscript

script create_confirm_overwrite_menu 
	mark_safe_for_shutdown
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		text = qs(0xc0da9b99)
		case windx
		text = qs(0xd13a6074)
		case Xenon
		text = qs(0xd13a6074)
	endswitch
	create_dialog_box {
		body_text = <text>
		player_device = ($MemcardController)
		options = [
			{
				func = memcard_sequence_quit
				text = qs(0xf7723015)
			}
			{
				func = confirm_overwrite_cleanup_messages_and_save_file
				text = qs(0xf77909ae)
			}
		]
	}
endscript

script confirm_overwrite_cleanup_messages_and_save_file 
	memcard_cleanup_messages
	if ($MemcardJamOrDefault = Jam)
		memcard_save_jam \{overwriteconfirmed = 1}
	else
		memcard_save_file \{overwriteconfirmed = 1}
	endif
endscript

script create_confirm_load_menu 
	mark_safe_for_shutdown
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		text = qs(0x99b26111)
		case windx
		text = qs(0x77aeac11)
		case Xenon
		text = qs(0x77aeac11)
	endswitch
	create_dialog_box {
		body_text = <text>
		player_device = ($MemcardController)
		options = [
			{
				func = memcard_sequence_quit
				text = qs(0xf7723015)
			}
			{
				func = memcard_load_file_confirmed
				text = qs(0xad5cfad4)
			}
		]
	}
endscript

script create_no_save_found_menu 
	mark_safe_for_shutdown
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		if ($MemcardJamOrDefault = Jam)
			FormatText \{TextName = body_text
				qs(0xd95be559)
				s = $memcard_default_title}
		else
			FormatText \{TextName = body_text
				qs(0x6ac01722)
				s = $memcard_default_title}
		endif
		create_dialog_box {
			player_device = ($MemcardController)
			body_text = <body_text>
			options = [
				{
					func = memcard_sequence_quit
					text = qs(0x182f0173)
				}
			]
		}
		case windx
		case Xenon
		if ($MemcardJamOrDefault = Jam)
			FormatText \{TextName = body_text
				qs(0x149ab44e)
				s = $memcard_default_title}
		else
			FormatText \{TextName = body_text
				qs(0x9972002e)
				s = $memcard_default_title}
		endif
		create_dialog_box {
			player_device = ($MemcardController)
			heading_text = qs(0x423b9e4e)
			body_text = <body_text>
			options = [
				{
					func = memcard_sequence_retry
					func_params = {StorageSelectorForce = 1}
					text = qs(0xa647ca8f)
				}
				{
					func = memcard_sequence_quit
					text = qs(0xf7723015)
				}
			]
		}
	endswitch
endscript

script create_corrupted_data_menu \{file_type = Default}
	mark_safe_for_shutdown
	printf \{channel = bkutcher
		qs(0x3b3f7b9b)}
	printstruct channel = bkutcher <...>
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		if (<file_type> = jam_file)
			text = qs(0xfb455ec5)
		else
			text = qs(0x601ed76f)
		endif
		case windx
		case Xenon
		if (<file_type> = jam_file)
			text = qs(0x3996dc6e)
		else
			text = qs(0x972c83ff)
		endif
	endswitch
	if (($MemcardSavingOrLoading = saving) || ($MemcardSigningIn = true) || ($memcard_boot_process = true) || (<file_type> = jam_file) || ($MemcardRetryScript = memcard_sequence_begin_lobby_error))
		options = [
			{
				func = memcard_delete_file
				text = qs(0x271a1633)
				func_params = <...>
			}
			{
				func = memcard_disable_saves_and_quit
				text = qs(0x06d0b6b0)
			}
		]
	else
		options = [
			{
				func = memcard_delete_file
				text = qs(0x271a1633)
				func_params = <...>
			}
			{
				func = memcard_sequence_quit
				text = qs(0xf7723015)
			}
		]
	endif
	create_dialog_box {
		player_device = ($MemcardController)
		body_text = <text>
		options = <options>
	}
	destroy_loading_screen
endscript

script create_delete_failed_menu 
	mark_safe_for_shutdown
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		create_dialog_box {
			heading_text = qs(0x1aa397cd)
			body_text = qs(0xba04b3d6)
			player_device = ($MemcardController)
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
		case windx
		case Xenon
		create_dialog_box {
			heading_text = qs(0x1aa397cd)
			body_text = qs(0x3605b1df)
			player_device = ($MemcardController)
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
		create_dialog_box {
			body_text = qs(0x02f65e0b)
			player_device = ($MemcardController)
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
		case windx
		case Xenon
		create_dialog_box {
			body_text = qs(0xd82f86b3)
			player_device = ($MemcardController)
			options = [
				{
					func = memcard_sequence_retry
					func_params = {StorageSelectorForce = 1}
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

script create_save_failed_menu 
	mark_safe_for_shutdown
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		create_dialog_box {
			body_text = qs(0x451503a2)
			player_device = ($MemcardController)
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
		case windx
		case Xenon
		create_dialog_box {
			body_text = qs(0x36e7d810)
			player_device = ($MemcardController)
			options = [
				{
					func = memcard_sequence_retry
					func_params = {StorageSelectorForce = 1}
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
		create_dialog_box {
			body_text = qs(0xf03a8927)
			player_device = ($MemcardController)
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
		case windx
		case Xenon
		create_dialog_box {
			body_text = qs(0xbf8a9615)
			player_device = ($MemcardController)
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
		FormatText TextName = message qs(0xe2a38082) s = $memcard_default_title d = <SpaceRequired>
		create_dialog_box {
			body_text = <message>
			player_device = ($MemcardController)
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
		case windx
		case Xenon
		if ($MemcardSavingOrLoading = saving)
			if ($MemcardJamOrDefault = Default)
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
			create_dialog_box {
				body_text = <text>
				player_device = ($MemcardController)
				options = [
					{
						func = memcard_sequence_retry
						func_params = {StorageSelectorForce = 1}
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
