
script create_dialog_box_with_wait \{wait_frames = 20}
	if ($no_load = 0)
		memcard_menus_cleanup
	else
		<no_bg> = no_bg
	endif
	create_dialog_box {<...> no_animate}
	wait <wait_frames> gameframes
endscript

script mcmess_checkingcard 
	if screenelementexists id = helper_text_anchor
		destroyscreenelement id = helper_text_anchor
	endif
	getplatform
	switch <platform>
		case ps3
		create_dialog_box_with_wait {
			title = "CHECKING..."
			text = "Checking HDD.  Do not switch off power during this time."
			add_loading_anim = add_loading_anim
			preserve_case
		}
		case xenon
		create_dialog_box_with_wait {
			title = "CHECKING..."
			text = "Checking storage device...\\nPlease do not turn off the Xbox 360 console."
			no_bg = <no_bg>
			add_loading_anim = add_loading_anim
			preserve_case
		}
	endswitch
endscript

script mcmess_savingdata 
	getplatform
	switch <platform>
		case ps3
		create_dialog_box_with_wait {
			title = "SAVING..."
			text = "Saving data to the HDD.  Do not switch off power during this time."
			add_loading_anim = add_loading_anim
			preserve_case
		}
		case xenon
		GetFileTypeName file_type = <filetype>
		formattext {
			textname = text
			"Saving Content.\\nPlease don't turn off your console."
			f = <filetype_name>
		}
		create_dialog_box_with_wait {
			title = "SAVING..."
			text = <text>
			add_loading_anim = add_loading_anim
			preserve_case
		}
	endswitch
endscript

script mcmess_overwritingdata 
	getplatform
	switch <platform>
		case ps3
		create_dialog_box_with_wait {
			title = "OVERWRITING ..."
			text = "Overwriting previous save data.  Do not switch off power during this time."
			add_loading_anim = add_loading_anim
		}
		case xenon
		GetFileTypeName file_type = <filetype>
		formattext {
			textname = text
			"Saving Content.\\nPlease don't turn off your console."
			f = <filetype_name>
		}
		create_dialog_box_with_wait {
			title = "SAVING..."
			text = <text>
			add_loading_anim = add_loading_anim
			preserve_case
		}
	endswitch
endscript

script mcmess_loadingdata 
	getplatform
	switch <platform>
		case ps3
		create_dialog_box_with_wait {
			title = "LOADING..."
			text = "Loading data.  Do not switch off power during this time."
			add_loading_anim = add_loading_anim
		}
		no_animate = <no_animate>
		case xenon
		GetFileTypeName file_type = <filetype>
		formattext {
			textname = text
			"Loading Content.\\nPlease don't turn off the Xbox 360 console."
			f = <filetype_name>
		}
		create_dialog_box_with_wait {
			title = "LOADING..."
			text = <text>
			add_loading_anim = add_loading_anim
			preserve_case
		}
		no_animate = <no_animate>
	endswitch
endscript

script mcmess_deletingfile 
	getplatform
	switch <platform>
		case ps3
		create_dialog_box_with_wait {
			title = "DELETING..."
			text = "Deleting data. Do not switch off power during this time."
			add_loading_anim = add_loading_anim
		}
		case xenon
		GetFileTypeName file_type = <filetype>
		formattext {
			textname = text
			"Deleting Content.\\nPlease don't turn off the Xbox 360 console."
			f = <filetype_name>
		}
		create_dialog_box_with_wait {
			title = "DELETING..."
			text = <text>
			add_loading_anim = add_loading_anim
			preserve_case
		}
	endswitch
endscript

script mcmess_savesuccessful 
	<text> = "Save successful"
	soundevent \{event = Sk9_Temp_Goal_Chkpt_SFX}
	create_memcard_success_dialog_box {
		title = "SUCCESSFUL!"
		text = <text>
		name = <name>
	}
endscript

script mcmess_overwritesuccessful 
	<text> = "Overwrite successful"
	soundevent \{event = Sk9_Temp_Goal_Chkpt_SFX}
	create_memcard_success_dialog_box {
		title = "SUCCESSFUL!"
		text = <text>
		name = <name>
	}
endscript

script mcmess_loadsuccessful 
	soundevent \{event = Sk9_Temp_Goal_Chkpt_SFX}
	create_memcard_success_dialog_box \{title = "SUCCESSFUL!"
		text = "Load Successful"}
endscript

script mcmess_formattingcard 
	getplatform
	switch <platform>
		case ps3
		create_dialog_box_with_wait \{title = "FORMATTING. . ."
			text = $memcardmessages_format_text
			add_loading_anim = add_loading_anim}
	endswitch
endscript

script mcmess_formatsuccessful 
	memcard_menus_cleanup
	soundevent \{event = Sk9_Temp_Goal_Chkpt_SFX}
	create_dialog_box \{title = "SUCCESSFUL!"
		text = "Format Successful"
		buttons = [
			{
				font = text_a1
				text = "OK"
				pad_choose_script = RetryScript
			}
		]}
endscript

script create_memcard_error_dialog_box 
	memcard_menus_cleanup
	create_error_box {
		<...>
		pad_back_script = reload_anims_then_run_abort_script
		buttons = [
			{font = text_a1 text = "RETRY" pad_choose_script = RetryScript}
			{font = text_a1 text = "QUIT" pad_choose_script = reload_anims_then_run_abort_script}
		]
	}
endscript

script create_memcard_success_dialog_box 
	memcard_menus_cleanup
	create_dialog_box {
		<...>
		buttons = [
			{font = text_a1 text = "OK" pad_choose_script = DoneScript pad_choose_params = {type = <type> name = <name>}}
		]
	}
endscript

script run_memcard_success_pad_back_script 
	generic_menu_pad_back_sound
	DoneScript
endscript

script mcmess_formatfailed 
	memcard_menus_cleanup
	soundevent event = ChalkChallenge_FailGoal
	getplatform
	switch <platform>
		case ps3
		create_error_box {
			title = "WARNING!"
			text = "Format failed! Please check memory card and try again."
			pad_back_script = reload_anims_then_run_abort_script
			buttons = [
				{font = text_a1 text = "RETRY" pad_choose_script = RetryScript}
				{font = text_a1 text = "CONTINUE WITHOUT SAVING" pad_choose_script = reload_anims_then_run_abort_script}
			]
		}
	endswitch
endscript

script mcmess_errorsavefailed 
	getplatform
	switch <platform>
		case ps3
		create_memcard_error_dialog_box {
			title = "WARNING!"
			text = "Failed trying to save."
		}
		case xenon
		create_memcard_error_dialog_box {
			title = "WARNING!"
			text = "Save Failed.\\nNo storage device was selected or the in-use storage device is unavailable."
		}
	endswitch
endscript

script mcmess_erroroverwritefailed 
	soundevent event = ChalkChallenge_FailGoal
	getplatform
	switch <platform>
		case ps3
		if CheckPS2SaveState
			formattext textname = text "OVERWRITE NOT SUCCESSFUL!!!\\n\\n\\n\\n TELL HIM THIS:\\n Save State = %d" d = <save_state>
		else
			<text> = "Failed trying to overwrite."
		endif
		create_memcard_error_dialog_box {
			title = "WARNING!"
			text = <text>
		}
		case xenon
		create_memcard_error_dialog_box {
			title = "WARNING!"
			text = "Overwrite Failed.\\nNo storage device was selected or the in-use storage device is unavailable."
		}
	endswitch
endscript

script mcmess_ErrorbadParkMaxPlayers back_script = reload_anims_then_run_abort_script back_params = {}
	formattext {
		textname = text
		"This park cannot run with %p players.\\nThe maximum number of players for this park is %m"
		p = <num_players>
		m = <maxplayers>
	}
	create_error_box {
		title = "WARNING!"
		text = <text>
		buttons = [
			{font = text_a1 text = "OK" pad_choose_script = <back_script> pad_choose_params = <back_params>}
		]
	}
endscript

script mcmess_errorloadfailed 
	soundevent event = ChalkChallenge_FailGoal
	GetFileTypeName file_type = <file_type>
	if gotparam corrupteddata
		formattext textname = text "%s appears to be damaged and cannot be used." s = <filetype_name>
	else
		formattext textname = text "Failed to load %s, the save appears to be corrupt." s = <filetype_name>
	endif
	memcard_menus_cleanup
	create_error_box {
		title = "WARNING!"
		text = <text>
		preserve_case
		text_dims = (700.0, 0.0)
		vmenu_width = 750
		buttons = [
			{font = text_a1 text = "CONTINUE" pad_choose_script = reload_anims_then_run_abort_script}
		]
	}
endscript

script mcmess_errornocardinslot 
	memcard_menus_cleanup
	if scriptisrunning mcmess_AutosaveWarning
		killspawnedscript name = save
	endif
	if ($savingorloading = saving)
		ContinueText = "CONTINUE WITHOUT SAVING"
	else
		ContinueText = "CONTINUE"
	endif
	getplatform
	switch <platform>
		case ps3
		create_error_box {
			title = "WARNING!"
			text = [
				"No HDD found."
				""
			]
			pad_back_script = reload_anims_then_run_abort_script
			buttons = [
				{font = text_a1 text = "RETRY" pad_choose_script = RetryScript}
				{font = text_a1 text = <ContinueText> pad_choose_script = reload_anims_then_run_abort_script}
			]
			preserve_case
		}
		case xenon
		create_error_box {
			title = "WARNING!"
			text = [
				"No storage device was selected or the in-use storage device is unavailable."
			]
			pad_back_script = reload_anims_then_run_abort_script
			buttons = [
				{font = text_a1 text = "SELECT A DEVICE" pad_choose_script = RetryScript}
				{font = text_a1 text = <ContinueText> pad_choose_script = reload_anims_then_run_abort_script}
			]
			text_dims = (700.0, 0.0)
			vmenu_width = 750
			additional_highlight_scale = (0.5, 0.0)
		}
	endswitch
endscript

script mcmess_errornotenoughroomnothpsfilesexist spacerequired = 0 spaceavailable = 0
	memcard_menus_cleanup
	GetFileTypeName file_type = <filetype>
	getplatform
	switch <platform>
		case ps3
		formattext {
			textname = text
			"Insufficient free space on HDD.  160kb of free space required to save data."
			s = <spacerequired>
			f = <filetype_name>
		}
		create_error_box {
			preserve_case
			title = "WARNING!"
			text = <text>
			pad_back_script = reload_anims_then_run_abort_script
			buttons = [
				{font = text_a1 text = "CONTINUE WITHOUT SAVING" pad_choose_script = reload_anims_then_run_abort_script}
				{font = text_a1 text = "RETRY" pad_choose_script = RetryScript}
			]
		}
		case xenon
		formattext {
			textname = text
			"Your storage device does not have enough free blocks to save.\\nAt least %s blocks are needed to save the current %f.\\nPlease free at least %n blocks."
			s = <spacerequired>
			f = <filetype_name>
			n = (<spacerequired> - <spaceavailable>)
		}
		create_error_box {
			title = "WARNING!"
			text = <text>
			buttons = [
				{font = text_a1 text = "CONTINUE WITHOUT SAVING" pad_choose_script = reload_anims_then_run_abort_script}
			]
		}
	endswitch
endscript

script mcmess_errornotenoughroombutthpsfilesexist spacerequired = 0
	memcard_menus_cleanup
	GetFileTypeName file_type = <filetype>
	getplatform
	switch <platform>
		case ps3
		formattext {
			textname = text
			"Insufficient free space on HDD.  160kb of free space required to save data.\\nWould you like to overwrite previous data?"
			s = <spacerequired>
			f = <filetype_name>
		}
		create_error_box {
			preserve_case
			title = "WARNING!"
			text = <text>
			pad_back_script = reload_anims_then_run_abort_script
			buttons = [
				{font = text_a1 text = "CONTINUE" pad_choose_script = launch_files_menu pad_choose_params = {DoNotShowNotEnoughRoomMessage save filetype = <filetype>}}
				{font = text_a1 text = "CANCEL" pad_choose_script = reload_anims_then_run_abort_script}
			]
		}
		case xenon
		formattext {
			textname = text
			"Your storage device does not have enough free blocks to save.\\nAt least %s blocks are needed to save the current %f.\\nYou will need to either delete or overwrite existing saves."
			s = <spacerequired>
			f = <filetype_name>
		}
		create_error_box {
			title = "WARNING!"
			text = <text>
			pad_back_script = reload_anims_then_run_abort_script
			buttons = [
				{font = text_a1 text = "CONTINUE" pad_choose_script = launch_files_menu pad_choose_params = {DoNotShowNotEnoughRoomMessage save filetype = <filetype>}}
				{font = text_a1 text = "QUIT" pad_choose_script = reload_anims_then_run_abort_script}
			]
		}
	endswitch
endscript

script mcmess_errordeletefailed 
	soundevent event = ChalkChallenge_FailGoal
	getplatform
	switch <platform>
		case ps3
		create_memcard_error_dialog_box {
			title = "DELETE FAILED!"
			text = "Delete Failed!  Please exit the game and delete this game data."
		}
		case xenon
		memcard_menus_cleanup
		if NOT cardisinslot
			<error_message> = "No storage device was selected or the in-use storage device is unavailable."
		else
			<error_message> = "Unable to delete."
		endif
		create_error_box {
			title = "DELETE FAILED!"
			text = <error_message>
			buttons = [
				{font = text_a1 text = "CONTINUE" pad_choose_script = RetryScript}
			]
		}
	endswitch
endscript

script mcmess_nofiles 
	GetFileTypeName file_type = <MenuFileType>
	if screenelementexists id = current_menu_anchor
		destroyscreenelement id = current_menu_anchor
	endif
	getplatform
	switch <platform>
		case ps3
		formattext {
			textname = text
			"No TONY HAWK'S PROVING GROUND save data found on HDD."
			n = <filetype_name>
		}
		buttons = [
			{font = text_a1 text = "OK" pad_choose_script = reload_anims_then_run_abort_script}
		]
		case xenon
		formattext {
			textname = text
			"No TONY HAWK'S PROVING GROUND %n DATA present."
			n = <filetype_name>
		}
		if NOT cardisinslot
			text = "No storage device was selected or the in-use storage device is unavailable."
		endif
		if ($FilesOrFolders = folders)
			buttons = [
				{font = text_a1 text = "TRY ANOTHER DEVICE" pad_choose_script = memcard_force_select_source pad_choose_params = {filetype = <MenuFileType>}}
				{font = text_a1 text = "CANCEL" pad_choose_script = reload_anims_then_run_abort_script}
			]
		else
			buttons = [
				{font = text_a1 text = "OK" pad_choose_script = reload_anims_then_run_abort_script}
			]
		endif
	endswitch
	memcard_menus_cleanup
	create_error_box {
		title = "NO SAVED DATA"
		text = <text>
		pad_back_script = reload_anims_then_run_abort_script
		buttons = <buttons>
		preserve_case
	}
endscript

script mcmess_NoSpaceForFile 
	if screenelementexists id = current_menu_anchor
		destroyscreenelement id = current_menu_anchor
	endif
	memcard_menus_cleanup
	create_error_box {
		title = "No space to save"
		text = "Please delete some existing data."
		pad_back_script = reload_anims_then_run_abort_script
		buttons = [{font = text_a1 text = "OK" pad_choose_script = reload_anims_then_run_abort_script}]
		preserve_case
	}
endscript

script mcmess_NoSpaceForNew 
	memcard_menus_cleanup
	MC_GetNewFolderSize desc = <desc>
	mb = (((<new_folder_size> / 1024.0) / 1024.0) + 1.0)
	casttointeger mb
	if gotparam repeated
		formattext textname = text "No TONY HAWK'S PROVING GROUND save data found.\\nYou'll need to delete content from other titles to free up the space to save. At least %dMB is required.\\n\\nThere is still not enough space." d = <mb>
	else
		formattext textname = text "No TONY HAWK'S PROVING GROUND save data found.\\nYou'll need to delete content from other titles to free up the space to save. At least %dMB is required." d = <mb>
	endif
	if isps3
		buttons = [
			{font = text_a1 text = "DELETE CONTENT" pad_choose_script = memcard_delete_no_th_saves}
			{font = text_a1 text = "CONTINUE WITHOUT SAVING" pad_choose_script = reload_anims_then_run_abort_script}
		]
	else
		buttons = [
			{font = text_a1 text = "TRY ANOTHER DEVICE" pad_choose_script = memcard_force_select_source pad_choose_params = {filetype = <MenuFileType> save}}
			{font = text_a1 text = "CONTINUE WITHOUT SAVING" pad_choose_script = reload_anims_then_run_abort_script}
		]
	endif
	create_error_box {
		title = "NO SPACE"
		text = <text>
		pad_back_script = reload_anims_then_run_abort_script
		buttons = <buttons>
		text_dims = (700.0, 0.0)
		vmenu_width = 750
		additional_highlight_scale = (0.5, 0.0)
		preserve_case
	}
endscript

script mcmess_errornotformatted quittext = "CONTINUE WITHOUT FORMATTING" backscript = reload_anims_then_run_abort_script
	memcard_menus_cleanup
	getplatform
	switch <platform>
		case ps3
		create_error_box {
			title = "WARNING!"
			text = "Memory card is unformatted."
			pad_back_script = <backscript>
			buttons = [
				{font = text_a1 text = <quittext> pad_choose_script = reload_anims_then_run_abort_script}
				{font = text_a1 text = "RETRY" pad_choose_script = RetryScript}
				{font = text_a1 text = "FORMAT MEMORY CARD?" pad_choose_script = mcmess_formatyesno pad_choose_params = {backscript = <backscript>}}
			]
		}
	endswitch
	checkforcardremoval menu_id = dialog_box_anchor
endscript

script mcmess_errornotformattednoformatoption 
	memcard_menus_cleanup
	getplatform
	switch <platform>
		case ps3
		create_error_box {
			title = "WARNING!"
			text = "Memory card is unformatted."
			pad_back_script = reload_anims_then_run_abort_script
			buttons = [
				{font = text_a1 text = "CONTINUE" pad_choose_script = reload_anims_then_run_abort_script}
				{font = text_a1 text = "RETRY" pad_choose_script = RetryScript}
			]
		}
	endswitch
	checkforcardremoval menu_id = dialog_box_anchor
endscript

script mcmess_formatyesno backscript = reload_anims_then_run_abort_script
	memcard_menus_cleanup
	getplatform
	switch <platform>
		case ps3
		create_dialog_box {
			title = "FORMAT"
			text = "Are you sure you wish to format the memory card?"
			pad_back_script = <backscript>
			buttons = [
				{font = text_a1 text = "NO" pad_choose_script = reload_anims_then_run_abort_script}
				{font = text_a1 text = "YES" pad_choose_script = doformatcard}
			]
		}
	endswitch
	checkforcardremoval menu_id = dialog_box_anchor
endscript

script GetSaveSizes 
	GetMemCardSpaceRequired \{progress}
	<SaveSize_Progress> = <spacerequired>
	GetMemCardSpaceRequired \{videoclip}
	<SaveSize_VideoClip> = <spacerequired>
	GetMemCardSpaceRequired \{photo}
	<SaveSize_Photo> = <spacerequired>
	GetMemCardSpaceRequired \{videorender}
	<SaveSize_VideoRender> = <spacerequired>
	return <...>
endscript

script mcmess_errornotenoughspacetosavealltypes 
	if ($no_load = 0)
		memcard_menus_cleanup
	else
		<no_bg> = no_bg
	endif
	GetSaveSizes
	getplatform
	switch <platform>
		case ps3
		scriptassert 'This needs fixing up for PS3!'
		formattext {
			textname = text
			"Insufficient free space on memory card.\\nAt least %c KB of free space is required to save Game Progress. 94 KB of free space is needed for the\\nmanagement of Your Network Configuration file. An\\nadditional %n KB of free space is also required to save\\nonline preferences.\\n\\nGame Progress requires %c KB\\nOnline Preferences requires %n KB\\nPark requires %p KB\\nTricks require %t KB\\nGraphics Require %u KB"
			c = <SaveSize_Progress>
			n = <SaveSize_NetworkSettings>
			u = <SaveSize_CreatedGraphic>
			p = <SaveSize_Park>
			t = <SaveSize_CreateATrick>
			z = ""
		}
		create_error_box {
			title = "WARNING!"
			text = <text>
			pos_tweak = (0.0, -33.0)
			no_animate
			pad_back_script = reload_anims_then_run_abort_script
			buttons = [
				{font = text_a1 text = "CONTINUE WITHOUT SAVING ALL TYPES OF FILES" pad_choose_script = reload_anims_then_run_abort_script}
				{font = text_a1 text = "RETRY" pad_choose_script = RetryScript}
			]
		}
		case xenon
		getmemcardspaceavailable
		total_blocks_needed = (<SaveSize_Progress> + <SaveSize_Park> + <SaveSize_CreateATrick> + <SaveSize_CreatedGraphic>)
		change movies_disabled = 1
		formattext {
			textname = text
			"Your storage device does not have enough free blocks to save all types of TONY HAWK'S PROVING GROUND saves.\\nPlease free at least %f blocks.\\n\\nGame Progress requires %c blocks\\nPark requires %p blocks\\nTricks require %t blocks\\nGraphics Require %u blocks"
			c = <SaveSize_Progress>
			p = <SaveSize_Park>
			t = <SaveSize_CreateATrick>
			u = <SaveSize_CreatedGraphic>
			f = (<total_blocks_needed> - <spaceavailable>)
		}
		create_error_box {
			title = ""
			text = <text>
			pos_tweak = (0.0, -15.0)
			no_animate
			no_bg = <no_bg>
			buttons = [
				{font = text_a1 text = "CONTINUE WITHOUT SAVING ALL TYPES OF GAME SAVES" pad_choose_script = reload_anims_then_run_abort_script}
				{font = text_a1 text = "FREE MORE BLOCKS" pad_choose_script = quittodashboard pad_choose_params = {total_blocks_needed = <total_blocks_needed>}}
			]
		}
	endswitch
endscript

script mcmess_errornocardonbootup 
	memcard_menus_cleanup
	GetSaveSizes
	getplatform
	switch <platform>
		case ps3
		scriptassert 'This needs fixing up for PS3!'
		formattext {
			textname = text
			"No memory card found.\\nPlease insert a memory card with at least %c KB free space for Game \\nProgress. 94 KB of free space is needed for the \\nManagement of Your Network Configuration file.\\nAn additional %n KB of free space is also required \\nto save online preferences.\\n\\nGame Progress requires %c KB\\nOnline Preferences requires %n KB\\nPark requires %p KB\\nTricks require %t KB\\nGraphics Require %u KB"
			c = <SaveSize_Progress>
			n = <SaveSize_NetworkSettings>
			u = <SaveSize_CreatedGraphic>
			p = <SaveSize_Park>
			t = <SaveSize_CreateATrick>
			z = ""
		}
		create_error_box {
			title = "WARNING!"
			text = <text>
			pos_tweak = (0.0, -33.0)
			no_animate
			pad_back_script = generic_menu_pad_back
			pad_back_params = {callback = reload_anims_then_run_abort_script}
			buttons = [
				{font = text_a1 text = "CONTINUE WITHOUT SAVING ALL TYPES OF FILES" pad_choose_script = reload_anims_then_run_abort_script}
				{font = text_a1 text = "RETRY" pad_choose_script = RetryScript}
			]
		}
		case xenon
		mcmess_errornocardinslot
	endswitch
endscript

script mcmess_ErrorCorruptContentDetected 
	getplatform
	switch <platform>
		case ps3
		memcard_menus_cleanup
		create_error_box {
			title = "WARNING!"
			text = "The TONY HAWK'S PROVING GROUND Content file appears to be damaged. Do you wish to overwrite it? Overwriting will erase all previous TONY HAWK'S PROVING GROUND Content."
			buttons = [
				{font = text_a1 text = "OVERWRITE" pad_choose_script = memcard_force_overwrite_content pad_choose_params = {filetype = <filetype>}}
				{font = text_a1 text = "RETRY" pad_choose_script = RetryScript}
				{font = text_a1 text = "TRY ANOTHER DEVICE" pad_choose_script = memcard_force_select_source pad_choose_params = {filetype = <filetype>}}
				{font = text_a1 text = "QUIT" pad_choose_script = reload_anims_then_run_abort_script}
			]
		}
		case xenon
		memcard_menus_cleanup
		create_error_box {
			title = "WARNING!"
			text = "The TONY HAWK'S PROVING GROUND Content file appears to be damaged. Do you wish to overwrite it? Overwriting will erase all previous TONY HAWK'S PROVING GROUND Content."
			buttons = [
				{font = text_a1 text = "OVERWRITE" pad_choose_script = memcard_force_overwrite_content pad_choose_params = {filetype = <filetype>}}
				{font = text_a1 text = "RETRY" pad_choose_script = RetryScript}
				{font = text_a1 text = "TRY ANOTHER DEVICE" pad_choose_script = memcard_force_select_source pad_choose_params = {filetype = <filetype>}}
				{font = text_a1 text = "QUIT" pad_choose_script = reload_anims_then_run_abort_script}
			]
		}
	endswitch
	checkforcardremoval menu_id = dialog_box_anchor
endscript

script mcmess_ErrorCorruptContentDetectedOnBootup 
	memcard_menus_cleanup
	getplatform
	switch <platform>
		case ps3
		create_error_box {
			title = "WARNING!"
			text = "The TONY HAWK'S PROVING GROUND Content file appears to be damaged. Load failed."
			buttons = [
				{font = text_a1 text = "CONTINUE" pad_choose_script = reload_anims_then_run_abort_script}
				{font = text_a1 text = "RETRY" pad_choose_script = RetryScript}
			]
		}
		case xenon
		create_error_box {
			title = "WARNING!"
			text = "The TONY HAWK'S PROVING GROUND Content file appears to be damaged. Load failed."
			buttons = [
				{font = text_a1 text = "CONTINUE" pad_choose_script = reload_anims_then_run_abort_script}
				{font = text_a1 text = "RETRY" pad_choose_script = RetryScript}
			]
		}
	endswitch
endscript

script mcmess_ErrorCorruptContentOverwriteSuccessful 
	soundevent event = Sk9_Temp_Goal_Chkpt_SFX
	getplatform
	switch <platform>
		case ps3
		memcard_menus_cleanup
		create_error_box {
			title = "SUCCESSFUL!"
			text = "Overwriting TONY HAWK'S PROVING GROUND Content succeeded."
			buttons = [
				{font = text_a1 text = "CONTINUE" pad_choose_script = RetryScript}
			]
		}
		case xenon
		memcard_menus_cleanup
		create_error_box {
			title = "SUCCESSFUL!"
			text = "Overwriting TONY HAWK'S PROVING GROUND Content succeeded."
			buttons = [
				{font = text_a1 text = "CONTINUE" pad_choose_script = RetryScript}
			]
		}
	endswitch
endscript

script mcmess_ErrorCorruptContentOverwriteFailed 
	getplatform
	switch <platform>
		case ps3
		memcard_menus_cleanup
		create_error_box {
			title = "WARNING!"
			text = "Overwriting TONY HAWK'S PROVING GROUND Content failed."
			buttons = [
				{font = text_a1 text = "TRY ANOTHER DEVICE" pad_choose_script = memcard_force_select_source pad_choose_params = {filetype = <filetype>}}
				{font = text_a1 text = "QUIT" pad_choose_script = reload_anims_then_run_abort_script}
			]
		}
		case xenon
		memcard_menus_cleanup
		create_error_box {
			title = "WARNING!"
			text = "Overwriting TONY HAWK'S PROVING GROUND Content failed."
			buttons = [
				{font = text_a1 text = "TRY ANOTHER DEVICE" pad_choose_script = memcard_force_select_source pad_choose_params = {filetype = <filetype>}}
				{font = text_a1 text = "QUIT" pad_choose_script = reload_anims_then_run_abort_script}
			]
		}
	endswitch
endscript

script mcmess_ErrorQuickSaveFailed 
	memcard_menus_cleanup
	autosave_pause_game
	if NOT cardisinslot
		text = "No storage device was selected or the in-use storage device is unavailable."
	else
		text = "An error occured when saving the game. Please try again."
	endif
	create_error_box {
		title = "SAVE ERROR"
		text = <text>
		buttons = [
			{font = text_a1 text = "retry" pad_choose_script = RetryScript pad_choose_params = {filetype = <filetype> force = 1}}
			{font = text_a1 text = "continue without saving" pad_choose_script = reload_anims_then_run_abort_script}
		]
		additional_highlight_scale = (0.7, 0.0)
	}
endscript

script mcmess_ErrorValidateFailed 
	memcard_menus_cleanup
	if gotparam saving_extra_data
		button_text = "TRY ANOTHER DEVICE"
	else
		button_text = "RETRY"
	endif
	create_error_box {
		title = "WARNING!"
		text = "Couldn't find your current save file on this device"
		buttons = [
			{font = text_a1 text = <button_text> pad_choose_script = RetryScript pad_choose_params = {filetype = <filetype> force = 1}}
			{font = text_a1 text = "CANCEL" pad_choose_script = reload_anims_then_run_abort_script pad_choose_params = {keep_ui}}
		]
	}
endscript
