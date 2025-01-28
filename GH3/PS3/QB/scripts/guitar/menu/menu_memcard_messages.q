load_warning_menu_font = fontgrid_title_gh3

script create_signin_warning_menu 
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		create_popup_warning_menu \{textblock = {
				Text = "You are not signed in to the PLAYSTATION®Network. You will be unable to write statistics."
			}
			Menu_pos = (640.0, 480.0)
			dialog_dims = (288.0, 64.0)
			options = [
				{
					func = signin_warning_select_continue
					Text = "CONTINUE"
					Scale = (1.0, 1.0)
				}
			]}
		case XENON
		create_popup_warning_menu \{textblock = {
				Text = "You are not signed in to a Xbox 360 gamer profile. You will be unable to save any game content until you sign in."
				Dims = (800.0, 400.0)
				Scale = 0.5
			}
			TextElement = {
				Text = "Do you want to sign in?"
				Pos = (640.0, 465.0)
				Scale = 0.6
			}
			Menu_pos = (640.0, 480.0)
			dialog_dims = (600.0, 80.0)
			options = [
				{
					func = signin_warning_select_signin
					Text = "SIGN IN"
				}
				{
					func = signin_warning_select_cws
					Text = "CONTINUE WITHOUT SAVING"
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
		Params = {
			autosave = 0
		}}
	ui_flow_manager_respond_to_action \{action = select_continue_without_saving}
endscript

script signin_warning_select_continue 
	ui_flow_manager_respond_to_action \{action = select_continue_without_signing_in}
endscript

script create_signin_complete_menu 
	memcard_cleanup_messages
	create_popup_warning_menu \{textblock = {
			Text = "This game saves data automatically at certain points. Do not switch off the power when the HDD access indicator is flashing."
			Pos = (640.0, 380.0)
			Scale = 0.6
		}
		Menu_pos = (640.0, 490.0)
		dialog_dims = (384.0, 64.0)
		options = [
			{
				func = signin_complete_menu_select_ok
				Text = "OK"
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
		ui_flow_manager_respond_to_action \{action = Continue}
	endif
endscript

script destroy_signin_complete_menu 
	destroy_popup_warning_menu
endscript

script create_online_signin_warning_menu 
	memcard_cleanup_messages
	if IsXENON
		<Text> = "You must be signed in to Xbox Live."
	else
		<Text> = "You must be signed in to access PLAYSTATION®Network features."
	endif
	create_popup_warning_menu {
		textblock = {
			Text = <Text>
		}
		Menu_pos = (640.0, 490.0)
		dialog_dims = (288.0, 64.0)
		options = [
			{
				func = {ui_flow_manager_respond_to_action Params = {action = Continue}}
				Text = "CONTINUE"
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
	if ISPS3
		memcard_sequence_quit
	else
		if ($MemcardSavingOrLoading = Saving)
			desc_text = "No storage device selected or found. If no storage device is available, progress will not be saved."
			continue_text = "CONTINUE WITHOUT SAVING"
			continue_func = memcard_disable_saves_and_quit
		else
			desc_text = "No storage device selected or found."
			continue_text = "CONTINUE"
			continue_func = memcard_sequence_quit
		endif
		create_popup_warning_menu {
			textblock = {
				Text = <desc_text>
				Pos = (640.0, 380.0)
				Dims = (700.0, 400.0)
				Scale = 0.6
			}
			Menu_pos = (640.0, 465.0)
			dialog_dims = (600.0, 80.0)
			dialog_pos = (640.0, 455.0)
			dialgo
			options = [
				{
					func = {memcard_sequence_retry Params = {StorageSelectorForce = 1}}
					Text = "SELECT STORAGE DEVICE"
				}
				{
					func = <continue_func>
					Text = <continue_text>
				}
			]
		}
	endif
endscript

script create_checking_memory_card_screen 
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		create_popup_warning_menu \{Title = "CHECKING..."
			textblock = {
				Text = "Checking HDD.  Do not switch off power during this time."
			}}
		case XENON
		create_popup_warning_menu \{Title = "CHECKING..."
			textblock = {
				Text = "Checking storage device...\\nPlease do not turn off the Xbox 360 console."
			}}
	endswitch
endscript

script create_confirm_overwrite_menu 
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		Text = "Are you sure you want to overwrite this Save Data? All progress within this Save Data will be lost."
		case XENON
		Text = "Are you sure you want to overwrite this content? All progress within this save content will be lost."
	endswitch
	create_popup_warning_menu {
		textblock = {
			Text = <Text>
			Pos = (640.0, 370.0)
		}
		Menu_pos = (640.0, 465.0)
		dialog_dims = (350.0, 64.0)
		options = [
			{
				func = {memcard_save_file Params = {OverwriteConfirmed = 1}}
				Text = "OVERWRITE"
			}
			{
				func = {memcard_sequence_quit}
				Text = "CANCEL"
			}
		]
	}
endscript

script create_confirm_load_menu 
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		Text = "Are you sure you want to load this Save Data? All progress since your last save will be lost."
		case XENON
		Text = "Are you sure you want to load this content? All progress since your last save will be lost."
	endswitch
	create_popup_warning_menu {
		textblock = {
			Text = <Text>
			Pos = (640.0, 370.0)
		}
		Menu_pos = (640.0, 465.0)
		dialog_dims = (256.0, 64.0)
		options = [
			{
				func = {memcard_load_file Params = {LoadConfirmed = 1}}
				Text = "LOAD"
			}
			{
				func = {memcard_sequence_quit}
				Text = "CANCEL"
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
				Text = "No GUITAR HERO III save data found on HDD."
			}
			Menu_pos = (640.0, 480.0)
			dialog_dims = (288.0, 64.0)
			options = [
				{
					func = memcard_sequence_quit
					Text = "CONTINUE"
					Scale = (1.0, 1.0)
				}
			]}
		case XENON
		create_popup_warning_menu \{Title = "NO SAVES"
			textblock = {
				Text = "No GUITAR HERO III saves present."
			}
			Menu_pos = (640.0, 465.0)
			dialog_dims = (500.0, 80.0)
			dialog_pos = (640.0, 450.0)
			options = [
				{
					func = {
						memcard_sequence_retry
						Params = {
							StorageSelectorForce = 1
						}
					}
					Text = "TRY ANOTHER DEVICE"
				}
				{
					func = memcard_sequence_quit
					Text = "CANCEL"
				}
			]}
	endswitch
endscript

script create_corrupted_data_menu 
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		Text = "Save Data is damaged and cannot be used. Do you want to delete this Save Data? All progress within this Save Data will be lost."
		case XENON
		Text = "Game content is damaged and cannot be used. Do you want to delete this content? All progress within this save content will be lost."
	endswitch
	if ($MemcardSavingOrLoading = Saving)
		options = [
			{
				func = memcard_delete_file
				Text = "DELETE"
				Scale = 1
			}
			{
				func = memcard_disable_saves_and_quit
				Text = "CONTINUE WITHOUT SAVING"
				Scale = 1
			}
		]
	else
		options = [
			{
				func = memcard_delete_file
				Text = "DELETE"
				Scale = 1
			}
			{
				func = memcard_sequence_quit
				Text = "CANCEL"
				Scale = 1
			}
		]
	endif
	create_popup_warning_menu {
		textblock = {
			Text = <Text>
			Dims = (800.0, 500.0)
			Pos = (640.0, 375.0)
			Scale = 0.5
		}
		Menu_pos = (640.0, 465.0)
		dialog_dims = (256.0, 64.0)
		options = <options>
	}
endscript

script create_delete_file_menu 
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		create_popup_warning_menu \{Title = "DELETING..."
			textblock = {
				Text = "Deleting Save Data. Do not switch off power during this time."
			}}
		case XENON
		create_popup_warning_menu \{Title = "DELETING..."
			textblock = {
				Text = "Deleting Content.\\nPlease don't turn off the Xbox 360 console."
			}}
	endswitch
endscript

script create_delete_success_menu 
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		create_popup_warning_menu \{Title = "SUCCESSFUL"
			textblock = {
				Text = "Delete successful."
			}}
		case XENON
		create_popup_warning_menu \{Title = "SUCCESSFUL"
			textblock = {
				Text = "Delete successful."
			}}
	endswitch
endscript

script create_load_success_menu 
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		create_popup_warning_menu \{Title = "SUCCESSFUL"
			textblock = {
				Text = "Load successful."
			}}
		case XENON
		create_popup_warning_menu \{Title = "SUCCESSFUL"
			textblock = {
				Text = "Load successful."
			}}
	endswitch
endscript

script create_save_success_menu 
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		create_popup_warning_menu \{Title = "SUCCESSFUL"
			textblock = {
				Text = "Save successful."
			}}
		case XENON
		create_popup_warning_menu \{Title = "SUCCESSFUL"
			textblock = {
				Text = "Save successful."
			}}
	endswitch
endscript

script create_overwrite_success_menu 
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		create_popup_warning_menu \{Title = "SUCCESSFUL"
			textblock = {
				Text = "Overwrite successful."
			}}
		case XENON
		create_popup_warning_menu \{Title = "SUCCESSFUL"
			textblock = {
				Text = "Overwrite successful."
			}}
	endswitch
endscript

script create_delete_failed_menu 
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		create_popup_warning_menu \{Title = "DELETE FAILED!"
			textblock = {
				Text = "Delete Failed!  Please exit the game and delete this game data."
			}
			Menu_pos = (640.0, 465.0)
			dialog_dims = (275.0, 64.0)
			options = [
				{
					func = memcard_sequence_retry
					Text = "RETRY"
				}
				{
					func = memcard_sequence_quit
					Text = "CONTINUE"
				}
			]}
		case XENON
		create_popup_warning_menu \{Title = "DELETE FAILED!"
			textblock = {
				Text = "Unable to delete."
			}
			Menu_pos = (640.0, 465.0)
			dialog_dims = (275.0, 64.0)
			options = [
				{
					func = memcard_sequence_retry
					Text = "RETRY"
				}
				{
					func = memcard_sequence_quit
					Text = "CONTINUE"
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
				Text = "Failed to load. The save appears to be corrupt."
				Pos = (640.0, 380.0)
			}
			Menu_pos = (640.0, 465.0)
			dialog_dims = (275.0, 64.0)
			options = [
				{
					func = memcard_sequence_retry
					Text = "RETRY"
				}
				{
					func = memcard_sequence_quit
					Text = "CONTINUE"
				}
			]}
		case XENON
		create_popup_warning_menu \{textblock = {
				Text = "Failed trying to load."
				Pos = (640.0, 380.0)
			}
			Menu_pos = (640.0, 465.0)
			dialog_dims = (275.0, 64.0)
			options = [
				{
					func = memcard_sequence_retry
					Text = "RETRY"
				}
				{
					func = memcard_sequence_quit
					Text = "CONTINUE"
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
				Text = "Failed trying to save."
				Pos = (640.0, 380.0)
			}
			Menu_pos = (640.0, 465.0)
			dialog_dims = (275.0, 64.0)
			options = [
				{
					func = memcard_sequence_retry
					Text = "RETRY"
				}
				{
					func = memcard_sequence_quit
					Text = "CONTINUE"
				}
			]}
		case XENON
		create_popup_warning_menu \{textblock = {
				Text = "Save Failed.\\nNo storage device was selected or the in-use storage device is unavailable."
				Pos = (640.0, 380.0)
			}
			Menu_pos = (640.0, 465.0)
			dialog_dims = (275.0, 64.0)
			options = [
				{
					func = memcard_sequence_retry
					Text = "RETRY"
				}
				{
					func = memcard_sequence_quit
					Text = "CONTINUE"
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
				Text = "Failed trying to overwrite."
				Pos = (640.0, 380.0)
			}
			Menu_pos = (640.0, 465.0)
			dialog_dims = (275.0, 64.0)
			options = [
				{
					func = memcard_sequence_retry
					Text = "RETRY"
				}
				{
					func = memcard_sequence_quit
					Text = "CONTINUE"
				}
			]}
		case XENON
		create_popup_warning_menu \{textblock = {
				Text = "Overwrite Failed.\\nNo storage device was selected or the in-use storage device is unavailable."
				Pos = (640.0, 380.0)
			}
			Menu_pos = (640.0, 465.0)
			dialog_dims = (275.0, 64.0)
			options = [
				{
					func = memcard_sequence_retry
					Text = "RETRY"
				}
				{
					func = memcard_sequence_quit
					Text = "CONTINUE"
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
		FormatText TextName = message "Insufficient HDD space to save games. Guitar Hero 3 requires %dKB HDD space for a single save. If you choose to proceed, you will be unable to save your progress in the game." D = <SpaceRequired>
		create_popup_warning_menu {
			textblock = {
				Text = <message>
				Pos = (640.0, 390.0)
				Dims = (900.0, 490.0)
				Scale = 0.5
			}
			Menu_pos = (640.0, 465.0)
			dialog_dims = (600.0, 80.0)
			options = [
				{
					func = memcard_delete_file
					Text = "DELETE FILES"
				}
				{
					func = memcard_disable_saves_and_quit
					Text = "CONTINUE WITHOUT SAVING"
				}
			]
		}
		case XENON
		if ($MemcardSavingOrLoading = Saving)
			create_popup_warning_menu \{textblock = {
					Text = [
						"No space to save"
						"\\n"
						"Please delete some existing data."
					]
					Pos = (640.0, 390.0)
					Dims = (900.0, 490.0)
					Scale = 0.5
				}
				Menu_pos = (640.0, 465.0)
				dialog_dims = (600.0, 80.0)
				options = [
					{
						func = memcard_disable_saves_and_quit
						Text = "CONTINUE WITHOUT SAVING"
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
		create_popup_warning_menu \{Title = "LOADING..."
			textblock = {
				Text = "Loading Data. Please do not reset/switch off your console."
			}}
		case XENON
		create_popup_warning_menu \{Title = "LOADING..."
			textblock = {
				Text = "Loading Content.\\nPlease don't turn off the Xbox 360 console."
			}}
	endswitch
endscript

script create_overwrite_menu 
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		create_popup_warning_menu \{Title = "OVERWRITING..."
			textblock = {
				Text = "Overwriting previous Save Data.  Do not switch off power during this time."
			}}
		case XENON
		default
		create_popup_warning_menu \{Title = "SAVING..."
			textblock = {
				Text = "Saving Content.\\nPlease don't turn off your console."
			}}
	endswitch
endscript

script create_save_menu 
	memcard_cleanup_messages
	GetPlatform
	switch <Platform>
		case PS3
		create_popup_warning_menu \{Title = "SAVING..."
			textblock = {
				Text = "Saving to the HDD. Please do not reset/switch off your console."
			}}
		case XENON
		create_popup_warning_menu \{Title = "SAVING..."
			textblock = {
				Text = "Saving Content.\\nPlease don't turn off your console."
			}}
	endswitch
endscript
