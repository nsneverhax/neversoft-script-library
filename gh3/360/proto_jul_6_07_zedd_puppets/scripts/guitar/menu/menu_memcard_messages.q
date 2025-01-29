load_warning_menu_font = fontgrid_title_gh3

script create_signin_warning_menu 
	getplatform
	switch <platform>
		case ps3
		create_popup_warning_menu {
			textblock = {
				text = "You are not signed in to the Network Platform. You will be unable to write statistics."
			}
			textelement = {
				text = "\\b4"
				pos = (535.0, 535.0)
				scale = 1.0
				z_priority = 1000
				no_shadow
			}
			menu_pos = (570.0, 480.0)
			dialog_dims = (288.0, 64.0)
			options = [
				{
					func = signin_warning_select_continue
					text = "CONTINUE"
					scale = (1.0, 1.0)
				}
			]
		}
		case xenon
		create_popup_warning_menu {
			textblock = {
				text = "You are not signed in to a Xbox 360 gamer profile. You will be unable to save any game content until you sign in."
				dims = (800.0, 400.0)
				scale = 0.5
			}
			textelement = {
				text = "Do you want to sign in?"
				pos = (640.0, 445.0)
				scale = 0.6
			}
			menu_pos = (380.0, 460.0)
			dialog_dims = (600.0, 80.0)
			options = [
				{
					func = signin_warning_select_signin
					text = "SIGN IN"
				}
				{
					func = signin_warning_select_cws
					text = "CONTINUE WITHOUT SAVING"
				}
			]
		}
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
	change \{enable_saving = 0}
	setglobaltags \{user_options
		params = {
			autosave = 0
		}}
	ui_flow_manager_respond_to_action \{action = select_continue_without_saving}
endscript

script signin_warning_select_continue 
	ui_flow_manager_respond_to_action \{action = select_continue_without_signing_in}
endscript

script create_signin_complete_menu 
	create_popup_warning_menu {
		textblock = {
			text = "This game saves data automatically at certain points. Do not switch off the power when the HDD access indicator is flashing."
			pos = (640.0, 380.0)
			scale = 0.6
		}
		textelement = {
			text = "\\b4"
			pos = (610.0, 535.0)
			scale = 1.0
			z_priority = 1000
			no_shadow
		}
		menu_pos = (630.0, 480.0)
		dialog_dims = (256.0, 64.0)
		options = [
			{
				func = signin_complete_menu_select_ok
				text = "OK"
				scale = (1.0, 1.0)
			}
		]
	}
	change signin_complete_menu_select_ok_called = 0
endscript
signin_complete_menu_select_ok_called = 0

script signin_complete_menu_select_ok 
	if ($signin_complete_menu_select_ok_called = 0)
		change \{signin_complete_menu_select_ok_called = 1}
		destroy_popup_warning_menu
		ui_flow_manager_respond_to_action \{action = continue}
	endif
endscript

script destroy_signin_complete_menu 
	destroy_popup_warning_menu
endscript

script create_online_signin_warning_menu 
	if isxenon
		<text> = "You must be signed in to Xbox Live."
	else
		<text> = "You must be signed in to access Online features."
	endif
	create_popup_warning_menu {
		textblock = {
			text = <text>
		}
		textelement = {
			text = "\\b4"
			pos = (535.0, 535.0)
			scale = 1.0
			z_priority = 1000
			no_shadow
		}
		menu_pos = (570.0, 480.0)
		dialog_dims = (288.0, 64.0)
		options = [
			{
				func = {ui_flow_manager_respond_to_action params = {action = continue}}
				text = "CONTINUE"
				scale = (1.0, 1.0)
			}
		]
	}
endscript

script destroy_online_signin_warning_menu 
	destroy_popup_warning_menu
endscript

script create_storagedevice_warning_menu 
	memcard_cleanup_messages
	if ($memcardsavingorloading = saving)
		desc_text = "No storage device selected or found. If no storage device is available, progress will not be saved."
		continue_text = "CONTINUE WITHOUT SAVING"
	else
		desc_text = "No storage device selected or found."
		continue_text = "CONTINUE"
	endif
	create_popup_warning_menu {
		textblock = {
			text = <desc_text>
			pos = (640.0, 380.0)
			dims = (700.0, 400.0)
			scale = 0.6
		}
		menu_pos = (380.0, 455.0)
		dialog_dims = (600.0, 80.0)
		dialog_pos = (640.0, 455.0)
		dialgo
		options = [
			{
				func = {memcard_sequence_retry params = {storageselectorforce = 1}}
				text = "SELECT STORAGE DEVICE"
			}
			{
				func = memcard_sequence_quit
				text = <continue_text>
			}
		]
	}
endscript

script create_checking_memory_card_screen 
	memcard_cleanup_messages
	getplatform
	switch <platform>
		case ps3
		create_popup_warning_menu {
			title = "CHECKING..."
			textblock = {
				text = "Checking HDD.  Do not switch off power during this time."
			}
		}
		case xenon
		create_popup_warning_menu {
			title = "CHECKING..."
			textblock = {
				text = "Checking storage device...\\nPlease do not turn off the Xbox 360 console."
			}
		}
	endswitch
endscript

script create_confirm_overwrite_menu 
	memcard_cleanup_messages
	create_popup_warning_menu {
		textblock = {
			text = "Are you sure you want to overwrite this content? All progress within this save content will be lost."
			pos = (640.0, 370.0)
		}
		menu_pos = (535.0, 460.0)
		dialog_dims = (350.0, 64.0)
		options = [
			{
				func = {memcard_save_file params = {overwriteconfirmed = 1}}
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
	create_popup_warning_menu {
		textblock = {
			text = "Are you sure you want to load this content? All progress since your last save will be lost."
			pos = (640.0, 370.0)
		}
		menu_pos = (570.0, 460.0)
		dialog_dims = (256.0, 64.0)
		options = [
			{
				func = {memcard_load_file params = {loadconfirmed = 1}}
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
	getplatform
	switch <platform>
		case ps3
		create_popup_warning_menu {
			textblock = {
				text = "No GUITAR HERO III save data found on HDD."
			}
			textelement = {
				text = "\\b4"
				pos = (535.0, 535.0)
				scale = 1.0
				z_priority = 1000
				no_shadow
			}
			menu_pos = (570.0, 480.0)
			dialog_dims = (288.0, 64.0)
			options = [
				{
					func = memcard_sequence_quit
					text = "CONTINUE"
					scale = (1.0, 1.0)
				}
			]
		}
		case xenon
		create_popup_warning_menu {
			title = "NO SAVES"
			textblock = {
				text = "No GUITAR HERO III saves present."
			}
			menu_pos = (440.0, 460.0)
			dialog_dims = (500.0, 80.0)
			dialog_pos = (640.0, 450.0)
			options = [
				{
					func = {memcard_sequence_retry params = {storageselectorforce = 1}}
					text = "TRY ANOTHER DEVICE"
				}
				{
					func = memcard_sequence_quit
					text = "CANCEL"
				}
			]
		}
	endswitch
endscript

script create_corrupted_data_menu 
	memcard_cleanup_messages
	create_popup_warning_menu {
		textblock = {
			text = "Game content is damaged and cannot be used. Do you want to delete this content? All progress within this save content will be lost."
			dims = (800.0, 500.0)
			pos = (640.0, 375.0)
			scale = 0.5
		}
		menu_pos = (570.0, 460.0)
		dialog_dims = (256.0, 64.0)
		options = [
			{
				func = memcard_delete_file
				text = "DELETE"
				scale = 10
			}
			{
				func = memcard_sequence_quit
				text = "CANCEL"
				scale = 1
			}
		]
	}
endscript

script create_delete_file_menu 
	memcard_cleanup_messages
	getplatform
	switch <platform>
		case ps3
		create_popup_warning_menu {
			title = "DELETING..."
			textblock = {
				text = "Deleting data. Do not switch off power during this time."
			}
		}
		case xenon
		create_popup_warning_menu {
			title = "DELETING..."
			textblock = {
				text = "Deleting Content.\\nPlease don't turn off the Xbox 360 console."
			}
		}
	endswitch
endscript

script create_delete_success_menu 
	memcard_cleanup_messages
	getplatform
	switch <platform>
		case ps3
		create_popup_warning_menu {
			title = "SUCCESSFUL"
			textblock = {
				text = "Delete successful."
			}
		}
		case xenon
		create_popup_warning_menu {
			title = "SUCCESSFUL"
			textblock = {
				text = "Delete successful."
			}
		}
	endswitch
endscript

script create_load_success_menu 
	memcard_cleanup_messages
	getplatform
	switch <platform>
		case ps3
		create_popup_warning_menu {
			title = "SUCCESSFUL"
			textblock = {
				text = "Load successful."
			}
		}
		case xenon
		create_popup_warning_menu {
			title = "SUCCESSFUL"
			textblock = {
				text = "Load successful."
			}
		}
	endswitch
endscript

script create_save_success_menu 
	memcard_cleanup_messages
	getplatform
	switch <platform>
		case ps3
		create_popup_warning_menu {
			title = "SUCCESSFUL"
			textblock = {
				text = "Save successful."
			}
		}
		case xenon
		create_popup_warning_menu {
			title = "SUCCESSFUL"
			textblock = {
				text = "Save successful."
			}
		}
	endswitch
endscript

script create_overwrite_success_menu 
	memcard_cleanup_messages
	getplatform
	switch <platform>
		case ps3
		create_popup_warning_menu {
			title = "SUCCESSFUL"
			textblock = {
				text = "Overwrite successful."
			}
		}
		case xenon
		create_popup_warning_menu {
			title = "SUCCESSFUL"
			textblock = {
				text = "Overwrite successful."
			}
		}
	endswitch
endscript

script create_delete_failed_menu 
	memcard_cleanup_messages
	getplatform
	switch <platform>
		case ps3
		create_popup_warning_menu {
			title = "DELETE FAILED!"
			textblock = {
				text = "Delete Failed!  Please exit the game and delete this game data."
			}
			menu_pos = (550.0, 460.0)
			dialog_dims = (275.0, 64.0)
			options = [
				{
					func = memcard_sequence_retry
					text = "RETRY"
				}
				{
					func = memcard_sequence_quit
					text = "CONTINUE"
				}
			]
		}
		case xenon
		create_popup_warning_menu {
			title = "DELETE FAILED!"
			textblock = {
				text = "Unable to delete."
			}
			menu_pos = (550.0, 460.0)
			dialog_dims = (275.0, 64.0)
			options = [
				{
					func = memcard_sequence_retry
					text = "RETRY"
				}
				{
					func = memcard_sequence_quit
					text = "CONTINUE"
				}
			]
		}
	endswitch
endscript

script create_load_failed_menu 
	memcard_cleanup_messages
	getplatform
	switch <platform>
		case ps3
		create_popup_warning_menu {
			textblock = {
				text = "Load failed !\\nCheck memory card (8MB) (for PlayStation®2) in MEMORY CARD slot 1 and please try again."
				pos = (640.0, 380.0)
			}
			menu_pos = (550.0, 460.0)
			dialog_dims = (275.0, 64.0)
			options = [
				{
					func = memcard_sequence_retry
					text = "RETRY"
				}
				{
					func = memcard_sequence_quit
					text = "CONTINUE"
				}
			]
		}
		case xenon
		create_popup_warning_menu {
			textblock = {
				text = "Failed trying to load."
				pos = (640.0, 380.0)
			}
			menu_pos = (550.0, 460.0)
			dialog_dims = (275.0, 64.0)
			options = [
				{
					func = memcard_sequence_retry
					text = "RETRY"
				}
				{
					func = memcard_sequence_quit
					text = "CONTINUE"
				}
			]
		}
	endswitch
endscript

script create_save_failed_menu 
	memcard_cleanup_messages
	getplatform
	switch <platform>
		case ps3
		create_popup_warning_menu {
			textblock = {
				text = "Save failed !\\nCheck memory card (8MB) (for PlayStation®2) in MEMORY CARD slot 1 and please try again."
				pos = (640.0, 380.0)
			}
			menu_pos = (550.0, 460.0)
			dialog_dims = (275.0, 64.0)
			options = [
				{
					func = memcard_sequence_retry
					text = "RETRY"
				}
				{
					func = memcard_sequence_quit
					text = "CONTINUE"
				}
			]
		}
		case xenon
		create_popup_warning_menu {
			textblock = {
				text = "Failed trying to save."
				pos = (640.0, 380.0)
			}
			menu_pos = (550.0, 460.0)
			dialog_dims = (275.0, 64.0)
			options = [
				{
					func = memcard_sequence_retry
					text = "RETRY"
				}
				{
					func = memcard_sequence_quit
					text = "CONTINUE"
				}
			]
		}
	endswitch
endscript

script create_overwrite_failed_menu 
	memcard_cleanup_messages
	getplatform
	switch <platform>
		case ps3
		create_popup_warning_menu {
			textblock = {
				text = "Overwrite failed !\\nCheck memory card (8MB) (for PlayStation®2) in MEMORY CARD slot 1 and please try again."
				pos = (640.0, 380.0)
			}
			menu_pos = (550.0, 460.0)
			dialog_dims = (275.0, 64.0)
			options = [
				{
					func = memcard_sequence_retry
					text = "RETRY"
				}
				{
					func = memcard_sequence_quit
					text = "CONTINUE"
				}
			]
		}
		case xenon
		create_popup_warning_menu {
			textblock = {
				text = "Failed trying to save."
				pos = (640.0, 380.0)
			}
			menu_pos = (550.0, 460.0)
			dialog_dims = (275.0, 64.0)
			options = [
				{
					func = memcard_sequence_retry
					text = "RETRY"
				}
				{
					func = memcard_sequence_quit
					text = "CONTINUE"
				}
			]
		}
	endswitch
endscript

script create_load_file_menu 
	memcard_cleanup_messages
	getplatform
	switch <platform>
		case ps3
		create_popup_warning_menu {
			title = "LOADING..."
			textblock = {
				text = "Loading Data. Please do not reset/switch off your console."
			}
		}
		case xenon
		create_popup_warning_menu {
			title = "LOADING..."
			textblock = {
				text = "Loading Content.\\nPlease don't turn off the Xbox 360 console."
			}
		}
	endswitch
endscript

script create_overwrite_menu 
	memcard_cleanup_messages
	getplatform
	switch <platform>
		case ps3
		create_popup_warning_menu {
			title = "OVERWRITING..."
			textblock = {
				text = "Overwriting previous save data.  Do not switch off power during this time."
			}
		}
		case xenon
		default
		create_popup_warning_menu {
			title = "SAVING..."
			textblock = {
				text = "Saving Content.\\nPlease don't turn off your console."
			}
		}
	endswitch
endscript

script create_save_menu 
	memcard_cleanup_messages
	getplatform
	switch <platform>
		case ps3
		create_popup_warning_menu {
			title = "SAVING..."
			textblock = {
				text = "Saving to the HDD. Please do not reset/switch off your console."
			}
		}
		case xenon
		create_popup_warning_menu {
			title = "SAVING..."
			textblock = {
				text = "Saving Content.\\nPlease don't turn off your console."
			}
		}
	endswitch
endscript
