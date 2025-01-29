load_warning_menu_font = fontgrid_title_gh3

script create_signin_warning_menu 
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		create_popup_warning_menu \{textblock = {
				text = "You are not signed in to the PLAYSTATION®Network. You will be unable to write statistics."
			}
			menu_pos = (640.0, 480.0)
			dialog_dims = (288.0, 64.0)
			helper_pills = [
				select
			]
			options = [
				{
					func = signin_warning_select_continue
					text = "CONTINUE"
					Scale = (1.0, 1.0)
				}
			]}
		case Xenon
		create_popup_warning_menu \{textblock = {
				text = "You are not signed in to a Xbox 360 gamer profile. You will be unable to save any game content until you sign in."
				dims = (800.0, 400.0)
				Scale = 0.5
			}
			TextElement = {
				text = "Do you want to sign in?"
				Pos = (640.0, 465.0)
				Scale = 0.6
			}
			menu_pos = (640.0, 480.0)
			dialog_dims = (600.0, 80.0)
			helper_pills = [
				select
				updown
			]
			options = [
				{
					func = signin_warning_select_signin
					text = "SIGN IN"
				}
				{
					func = signin_warning_select_cws
					text = "CONTINUE WITHOUT SAVING"
				}
			]}
	endswitch
endscript

script destroy_signin_warning_menu 
	destroy_popup_warning_menu
endscript

script signin_warning_select_signin 
	ui_flow_manager_respond_to_action \{action = select_choose_storage_device}
endscript

script signin_warning_select_cws 
	start_checking_for_signin_change
	Change \{enable_saving = 0}
	SetGlobalTags \{user_options
		params = {
			autosave = 0
		}}
	refreshxusersignininfo device_num = <device_num>
	ui_flow_manager_respond_to_action \{action = select_continue_without_saving}
endscript

script signin_warning_select_continue 
	ui_flow_manager_respond_to_action \{action = select_continue_without_signing_in}
endscript

script create_signin_complete_menu 
	memcard_cleanup_messages
	create_popup_warning_menu \{textblock = {
			text = "This game saves data automatically at certain points. Do not switch off the power when the HDD access indicator is flashing."
			Pos = (640.0, 380.0)
			Scale = 0.6
		}
		menu_pos = (640.0, 490.0)
		dialog_dims = (384.0, 64.0)
		helper_pills = [
			select
		]
		options = [
			{
				func = signin_complete_menu_select_ok
				text = "OK"
				Scale = (1.0, 1.0)
			}
		]}
	Change \{signin_complete_menu_select_ok_called = 0}
endscript
signin_complete_menu_select_ok_called = 0

script signin_complete_menu_select_ok 
	if ($signin_complete_menu_select_ok_called = 0)
		Change \{signin_complete_menu_select_ok_called = 1}
		destroy_popup_warning_menu
		ui_flow_manager_respond_to_action \{action = continue}
	endif
endscript

script destroy_signin_complete_menu 
	destroy_popup_warning_menu
endscript

script create_online_signin_warning_menu 
	memcard_cleanup_messages
	if isXenon
		<text> = "You must be signed in to Xbox LIVE."
	else
		<text> = "You must be signed in to access PLAYSTATION®Network features."
	endif
	create_popup_warning_menu {
		textblock = {
			text = <text>
		}
		menu_pos = (640.0, 490.0)
		dialog_dims = (288.0, 64.0)
		helper_pills = [select]
		options = [
			{
				func = {ui_flow_manager_respond_to_action params = {action = continue}}
				text = "CONTINUE"
				Scale = (1.0, 1.0)
			}
		]
	}
endscript

script destroy_online_signin_warning_menu 
	destroy_popup_warning_menu
endscript

script create_storagedevice_warning_menu 
	memcard_cleanup_messages
	if isps3
		memcard_sequence_quit
	else
		desc_text = "No storage device selected or found. If no storage device is available, progress will not be saved."
		continue_text = "CONTINUE WITHOUT SAVING"
		continue_func = memcard_disable_saves_and_quit
		create_popup_warning_menu {
			textblock = {
				text = <desc_text>
				Pos = (640.0, 380.0)
				dims = (700.0, 400.0)
				Scale = 0.6
			}
			menu_pos = (640.0, 465.0)
			dialog_dims = (600.0, 80.0)
			dialog_pos = (640.0, 455.0)
			dialgo
			helper_pills = [select updown]
			options = [
				{
					func = {memcard_sequence_retry params = {StorageSelectorForce = 1}}
					text = "SELECT STORAGE DEVICE"
				}
				{
					func = <continue_func>
					text = <continue_text>
				}
			]
		}
	endif
	mark_safe_for_shutdown
endscript

script create_checking_memory_card_screen 
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		create_popup_warning_menu \{title = "CHECKING..."
			textblock = {
				text = "Checking HDD.  Do not switch off power during this time."
			}}
		case Xenon
		create_popup_warning_menu \{title = "CHECKING..."
			textblock = {
				text = "Checking storage device...\\nPlease do not turn off the Xbox 360 console."
			}}
	endswitch
endscript

script create_confirm_overwrite_menu 
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		text = "Are you sure you want to overwrite this Save Data? All progress within this Save Data will be lost."
		case Xenon
		text = "Are you sure you want to overwrite this content? All progress within this save content will be lost."
	endswitch
	create_popup_warning_menu {
		textblock = {
			text = <text>
			Pos = (640.0, 370.0)
		}
		menu_pos = (640.0, 465.0)
		dialog_dims = (350.0, 64.0)
		helper_pills = [select updown]
		options = [
			{
				func = {memcard_save_file params = {OverwriteConfirmed = 1}}
				text = "OVERWRITE"
			}
			{
				func = {memcard_sequence_quit}
				text = "CANCEL"
			}
		]
	}
endscript

script create_confirm_load_menu 
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		text = "Are you sure you want to load this Save Data? All progress since your last save will be lost."
		case Xenon
		text = "Are you sure you want to load this content? All progress since your last save will be lost."
	endswitch
	create_popup_warning_menu {
		textblock = {
			text = <text>
			Pos = (640.0, 370.0)
		}
		menu_pos = (640.0, 465.0)
		dialog_dims = (256.0, 64.0)
		helper_pills = [select updown]
		options = [
			{
				func = {memcard_load_file params = {LoadConfirmed = 1}}
				text = "LOAD"
			}
			{
				func = {memcard_sequence_quit}
				text = "CANCEL"
			}
		]
	}
endscript

script create_no_save_found_menu 
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		create_popup_warning_menu \{textblock = {
				text = "No GUITAR HERO Aerosmith save data found on HDD."
			}
			menu_pos = (640.0, 480.0)
			dialog_dims = (288.0, 64.0)
			helper_pills = [
				select
			]
			options = [
				{
					func = memcard_sequence_quit
					text = "CONTINUE"
					Scale = (1.0, 1.0)
				}
			]}
		case Xenon
		create_popup_warning_menu \{title = "NO SAVES"
			textblock = {
				text = "No GUITAR HERO Aerosmith saves present."
			}
			menu_pos = (640.0, 465.0)
			dialog_dims = (500.0, 80.0)
			dialog_pos = (640.0, 450.0)
			helper_pills = [
				select
				updown
			]
			options = [
				{
					func = {
						memcard_sequence_retry
						params = {
							StorageSelectorForce = 1
						}
					}
					text = "TRY ANOTHER DEVICE"
				}
				{
					func = memcard_sequence_quit
					text = "CANCEL"
				}
			]}
	endswitch
endscript

script create_corrupted_data_menu 
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		text = "Save Data is damaged and cannot be used. Do you want to delete this Save Data? All progress within this Save Data will be lost."
		case Xenon
		text = "Game content is damaged and cannot be used. Do you want to delete this content? All progress within this save content will be lost."
	endswitch
	if ($MemcardSavingOrLoading = saving)
		options = [
			{
				func = memcard_delete_file
				text = "DELETE"
				Scale = 1
			}
			{
				func = memcard_disable_saves_and_quit
				text = "CONTINUE WITHOUT SAVING"
				Scale = 1
			}
		]
	else
		options = [
			{
				func = memcard_delete_file
				text = "DELETE"
				Scale = 1
			}
			{
				func = memcard_sequence_quit
				text = "CONTINUE WITHOUT SAVING"
				Scale = 1
			}
		]
	endif
	create_popup_warning_menu {
		textblock = {
			text = <text>
			dims = (800.0, 500.0)
			Pos = (640.0, 375.0)
			Scale = 0.5
		}
		menu_pos = (640.0, 465.0)
		dialog_dims = (256.0, 64.0)
		helper_pills = [select updown]
		options = <options>
	}
endscript

script create_delete_file_menu 
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		create_popup_warning_menu \{title = "DELETING..."
			textblock = {
				text = "Deleting Save Data. Do not switch off power during this time."
			}}
		case Xenon
		create_popup_warning_menu \{title = "DELETING..."
			textblock = {
				text = "Deleting Content.\\nPlease don't turn off the Xbox 360 console."
			}}
	endswitch
endscript

script create_delete_success_menu 
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		create_popup_warning_menu \{title = "SUCCESSFUL"
			textblock = {
				text = "Delete successful."
			}}
		case Xenon
		create_popup_warning_menu \{title = "SUCCESSFUL"
			textblock = {
				text = "Delete successful."
			}}
	endswitch
endscript

script create_load_success_menu 
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		create_popup_warning_menu \{title = "SUCCESSFUL"
			textblock = {
				text = "Load successful."
			}}
		case Xenon
		create_popup_warning_menu \{title = "SUCCESSFUL"
			textblock = {
				text = "Load successful."
			}}
	endswitch
endscript

script create_save_success_menu 
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		create_popup_warning_menu \{title = "SUCCESSFUL"
			textblock = {
				text = "Save successful."
			}}
		case Xenon
		create_popup_warning_menu \{title = "SUCCESSFUL"
			textblock = {
				text = "Save successful."
			}}
	endswitch
endscript

script create_overwrite_success_menu 
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		create_popup_warning_menu \{title = "SUCCESSFUL"
			textblock = {
				text = "Overwrite successful."
			}}
		case Xenon
		create_popup_warning_menu \{title = "SUCCESSFUL"
			textblock = {
				text = "Overwrite successful."
			}}
	endswitch
endscript

script create_delete_failed_menu 
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		create_popup_warning_menu \{title = "DELETE FAILED!"
			textblock = {
				text = "Delete Failed!  Please exit the game and delete this game data."
			}
			menu_pos = (640.0, 465.0)
			dialog_dims = (275.0, 64.0)
			helper_pills = [
				select
				updown
			]
			options = [
				{
					func = memcard_sequence_retry
					text = "RETRY"
				}
				{
					func = memcard_sequence_quit
					text = "CONTINUE"
				}
			]}
		case Xenon
		create_popup_warning_menu \{title = "DELETE FAILED!"
			textblock = {
				text = "Unable to delete."
			}
			menu_pos = (640.0, 465.0)
			dialog_dims = (275.0, 64.0)
			helper_pills = [
				select
				updown
			]
			options = [
				{
					func = memcard_sequence_retry
					text = "RETRY"
				}
				{
					func = memcard_sequence_quit
					text = "CONTINUE"
				}
			]}
	endswitch
endscript

script create_load_failed_menu 
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		create_popup_warning_menu \{textblock = {
				text = "Failed to load. The save appears to be corrupt."
				Pos = (640.0, 380.0)
			}
			menu_pos = (640.0, 465.0)
			dialog_dims = (275.0, 64.0)
			helper_pills = [
				select
				updown
			]
			options = [
				{
					func = memcard_sequence_retry
					text = "RETRY"
				}
				{
					func = memcard_sequence_quit
					text = "CONTINUE"
				}
			]}
		case Xenon
		create_popup_warning_menu \{textblock = {
				text = "Failed trying to load."
				Pos = (640.0, 380.0)
			}
			menu_pos = (640.0, 465.0)
			dialog_dims = (275.0, 64.0)
			helper_pills = [
				select
				updown
			]
			options = [
				{
					func = memcard_sequence_retry
					text = "RETRY"
				}
				{
					func = memcard_sequence_quit
					text = "CONTINUE"
				}
			]}
	endswitch
endscript

script create_save_failed_menu 
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		create_popup_warning_menu \{textblock = {
				text = "Failed trying to save."
				Pos = (640.0, 380.0)
			}
			menu_pos = (640.0, 465.0)
			dialog_dims = (275.0, 64.0)
			helper_pills = [
				select
				updown
			]
			options = [
				{
					func = memcard_sequence_retry
					text = "RETRY"
				}
				{
					func = memcard_sequence_quit
					text = "CONTINUE"
				}
			]}
		case Xenon
		create_popup_warning_menu \{textblock = {
				text = "Save Failed.\\nNo storage device was selected or the in-use storage device is unavailable."
				Pos = (640.0, 380.0)
			}
			menu_pos = (640.0, 465.0)
			dialog_dims = (275.0, 64.0)
			helper_pills = [
				select
				updown
			]
			options = [
				{
					func = memcard_sequence_retry
					text = "RETRY"
				}
				{
					func = memcard_sequence_quit
					text = "CONTINUE"
				}
			]}
	endswitch
endscript

script create_overwrite_failed_menu 
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		create_popup_warning_menu \{textblock = {
				text = "Failed trying to overwrite."
				Pos = (640.0, 380.0)
			}
			menu_pos = (640.0, 465.0)
			dialog_dims = (275.0, 64.0)
			helper_pills = [
				select
				updown
			]
			options = [
				{
					func = memcard_sequence_retry
					text = "RETRY"
				}
				{
					func = memcard_sequence_quit
					text = "CONTINUE"
				}
			]}
		case Xenon
		create_popup_warning_menu \{textblock = {
				text = "Overwrite Failed.\\nNo storage device was selected or the in-use storage device is unavailable."
				Pos = (640.0, 380.0)
			}
			menu_pos = (640.0, 465.0)
			dialog_dims = (275.0, 64.0)
			helper_pills = [
				select
				updown
			]
			options = [
				{
					func = memcard_sequence_retry
					text = "RETRY"
				}
				{
					func = memcard_sequence_quit
					text = "CONTINUE"
				}
			]}
	endswitch
endscript

script create_out_of_space_menu 
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		MC_SpaceForNewFolder \{desc = GuitarContent}
		formatText TextName = message "Insufficient HDD space to save games. Guitar Hero Aerosmith requires %dKB HDD space for a single save. If you choose to proceed, you will be unable to save your progress in the game." d = <SpaceRequired>
		create_popup_warning_menu {
			textblock = {
				text = <message>
				Pos = (640.0, 390.0)
				dims = (900.0, 490.0)
				Scale = 0.5
			}
			menu_pos = (640.0, 465.0)
			dialog_dims = (600.0, 80.0)
			helper_pills = [select updown]
			options = [
				{
					func = memcard_delete_file
					text = "DELETE FILES"
				}
				{
					func = memcard_disable_saves_and_quit
					text = "CONTINUE WITHOUT SAVING"
				}
			]
		}
		case Xenon
		if ($MemcardSavingOrLoading = saving)
			create_popup_warning_menu \{textblock = {
					text = [
						"No space to save"
						"\\n"
						"Please delete some existing data."
					]
					Pos = (640.0, 390.0)
					dims = (900.0, 490.0)
					Scale = 0.5
				}
				menu_pos = (640.0, 465.0)
				dialog_dims = (600.0, 80.0)
				helper_pills = [
					select
				]
				options = [
					{
						func = memcard_disable_saves_and_quit
						text = "CONTINUE WITHOUT SAVING"
					}
				]}
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
		create_popup_warning_menu \{title = "LOADING..."
			textblock = {
				text = "Loading Data. Please do not reset/switch off your system."
			}}
		case Xenon
		create_popup_warning_menu \{title = "LOADING..."
			textblock = {
				text = "Loading Content.\\nPlease don't turn off the Xbox 360 console."
			}}
	endswitch
endscript

script create_overwrite_menu 
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		create_popup_warning_menu \{title = "OVERWRITING..."
			textblock = {
				text = "Overwriting previous Save Data.  Do not switch off power during this time."
			}}
		case Xenon
		default
		create_popup_warning_menu \{title = "SAVING..."
			textblock = {
				text = "Saving Content.\\nPlease don't turn off your console."
			}}
	endswitch
endscript

script create_save_menu 
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		create_popup_warning_menu \{title = "SAVING..."
			textblock = {
				text = "Saving to the HDD. Please do not reset/switch off your system."
			}}
		case Xenon
		create_popup_warning_menu \{title = "SAVING..."
			textblock = {
				text = "Saving Content.\\nPlease don't turn off your console."
			}}
	endswitch
endscript
