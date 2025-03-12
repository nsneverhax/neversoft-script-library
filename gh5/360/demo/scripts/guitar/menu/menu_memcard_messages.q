
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
	<func> <params> controller = ($memcardcontroller)
endscript

script create_storagedevice_warning_menu 
	printscriptinfo \{'create_storagedevice_warning_menu'}
	printstruct <...>
	if ($autolaunch_jam_skip_memcard = 1)
		memcard_sequence_quit
	endif
	mark_safe_for_shutdown
	memcard_cleanup_messages
	if isps3
		memcard_sequence_quit
	else
		if NOT checkforsignin local controller_index = ($memcardcontroller)
			memcard_sequence_quit
		endif
		if ($memcardsavingorloading = saving)
			if ($memcardjamordefault = jam)
				desc_text = qs(0xacd4569d)
			else
				desc_text = qs(0x55dfedef)
			endif
			continue_text = qs(0x06d0b6b0)
			continue_func = memcard_disable_saves_and_quit
		else
			if ($memcardjamordefault = jam)
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
				func_params = {storageselectorforce = 1}
				text = qs(0x727bdc99)
			}
			{
				func = <continue_func>
				text = <continue_text>
			}
		]
		if ($signin_jam_mode = 1)
			desc_text = qs(0x86e75bd0)
			continue_text = qs(0x06d0b6b0)
			continue_func = memcard_disable_saves_and_quit
			<options_array> = [
				{
					func = memcard_sequence_retry
					func_params = {storageselectorforce = 1}
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
			player_device = ($memcardcontroller)
			options = <options_array>
		}
	endif
	destroy_loading_screen
endscript

script create_confirm_overwrite_menu 
	mark_safe_for_shutdown
	memcard_cleanup_messages
	getplatform
	switch <platform>
		case ps3
		text = qs(0xc0da9b99)
		case windx
		text = qs(0xd13a6074)
		case xenon
		text = qs(0xd13a6074)
	endswitch
	if ($memcardjamordefault = jam)
		<save_func> = memcard_save_jam
	else
		<save_func> = memcard_save_file
	endif
	create_dialog_box {
		body_text = <text>
		player_device = ($memcardcontroller)
		options = [
			{
				func = memcard_sequence_quit
				text = qs(0xf7723015)
			}
			{
				func = <save_func>
				func_params = {overwriteconfirmed = 1}
				text = qs(0xf77909ae)
			}
		]
	}
endscript

script create_confirm_load_menu 
	mark_safe_for_shutdown
	memcard_cleanup_messages
	getplatform
	switch <platform>
		case ps3
		text = qs(0x99b26111)
		case windx
		text = qs(0x77aeac11)
		case xenon
		text = qs(0x77aeac11)
	endswitch
	create_dialog_box {
		body_text = <text>
		player_device = ($memcardcontroller)
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
	getplatform
	switch <platform>
		case ps3
		if ($memcardjamordefault = jam)
			formattext \{textname = body_text
				qs(0xd95be559)
				s = $memcard_default_title}
		else
			formattext \{textname = body_text
				qs(0x6ac01722)
				s = $memcard_default_title}
		endif
		create_dialog_box {
			player_device = ($memcardcontroller)
			body_text = <body_text>
			options = [
				{
					func = memcard_sequence_quit
					text = qs(0x182f0173)
				}
			]
		}
		case windx
		case xenon
		if ($memcardjamordefault = jam)
			formattext \{textname = body_text
				qs(0x149ab44e)
				s = $memcard_default_title}
		else
			formattext \{textname = body_text
				qs(0x9972002e)
				s = $memcard_default_title}
		endif
		create_dialog_box {
			player_device = ($memcardcontroller)
			heading_text = qs(0x423b9e4e)
			body_text = <body_text>
			options = [
				{
					func = memcard_sequence_retry
					func_params = {storageselectorforce = 1}
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

script create_corrupted_data_menu \{file_type = `default`}
	mark_safe_for_shutdown
	printf \{channel = bkutcher
		qs(0x3b3f7b9b)}
	printstruct channel = bkutcher <...>
	memcard_cleanup_messages
	getplatform
	switch <platform>
		case ps3
		if (<file_type> = jam_file)
			text = qs(0xfb455ec5)
		else
			text = qs(0x601ed76f)
		endif
		case windx
		case xenon
		if (<file_type> = jam_file)
			text = qs(0x3996dc6e)
		else
			text = qs(0x972c83ff)
		endif
	endswitch
	if (($memcardsavingorloading = saving) || ($memcardsigningin = true) || ($memcard_boot_process = true) || (<file_type> = jam_file) || ($memcardretryscript = memcard_sequence_begin_lobby_error))
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
		player_device = ($memcardcontroller)
		body_text = <text>
		options = <options>
	}
	destroy_loading_screen
endscript

script create_delete_failed_menu 
	mark_safe_for_shutdown
	memcard_cleanup_messages
	getplatform
	switch <platform>
		case ps3
		create_dialog_box {
			heading_text = qs(0x1aa397cd)
			body_text = qs(0xba04b3d6)
			player_device = ($memcardcontroller)
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
		case xenon
		create_dialog_box {
			heading_text = qs(0x1aa397cd)
			body_text = qs(0x3605b1df)
			player_device = ($memcardcontroller)
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
	getplatform
	switch <platform>
		case ps3
		create_dialog_box {
			body_text = qs(0x02f65e0b)
			player_device = ($memcardcontroller)
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
		case xenon
		create_dialog_box {
			body_text = qs(0xd82f86b3)
			player_device = ($memcardcontroller)
			options = [
				{
					func = memcard_sequence_retry
					func_params = {storageselectorforce = 1}
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
	getplatform
	switch <platform>
		case ps3
		create_dialog_box {
			body_text = qs(0x451503a2)
			player_device = ($memcardcontroller)
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
		case xenon
		create_dialog_box {
			body_text = qs(0x36e7d810)
			player_device = ($memcardcontroller)
			options = [
				{
					func = memcard_sequence_retry
					func_params = {storageselectorforce = 1}
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
	getplatform
	switch <platform>
		case ps3
		create_dialog_box {
			body_text = qs(0xf03a8927)
			player_device = ($memcardcontroller)
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
		case xenon
		create_dialog_box {
			body_text = qs(0xbf8a9615)
			player_device = ($memcardcontroller)
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

script create_out_of_space_menu \{message_type = `default`}
	mark_safe_for_shutdown
	memcard_cleanup_messages
	getplatform
	switch <platform>
		case ps3
		mc_spacefornewfolder \{desc = guitarcontent}
		formattext textname = message qs(0xe2a38082) s = $memcard_default_title d = <spacerequired>
		create_dialog_box {
			body_text = <message>
			player_device = ($memcardcontroller)
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
		case xenon
		if ($memcardsavingorloading = saving)
			if ($memcardjamordefault = `default`)
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
				player_device = ($memcardcontroller)
				options = [
					{
						func = memcard_sequence_retry
						func_params = {storageselectorforce = 1}
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
