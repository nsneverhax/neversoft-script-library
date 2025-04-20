ingame_save_active = 0
ingame_save_disabled_pedspawn = 0
game_progress_check_result = 0
autosave_result = 0
autosave_initiated_pause = 0

script game_progress_autosave_active 
	if (($block_pedspawn) = 0)
		change \{ingame_save_disabled_pedspawn = 1}
		change \{block_pedspawn = 1}
	endif
	change \{ingame_save_active = 1}
endscript

script game_progress_autosave_inactive 
	if (($ingame_save_disabled_pedspawn) = 1)
		change \{ingame_save_disabled_pedspawn = 0}
		change \{block_pedspawn = 0}
	endif
	change \{ingame_save_active = 0}
endscript

script game_progress_can_autosave 
	if istrue \{$game_progress_debug_active}
		return \{false}
	endif
	if istrue \{$sysnotify_wait_in_progress}
		return \{false}
	endif
	if isxenon
		if NOT checkforsignin \{local}
			return \{false}
		endif
	endif
	if ($ingame_save_active = 1)
		return \{false}
	endif
	return \{true}
endscript

script game_progress_check_valid_save 
	if ($ingame_save_active = 1)
		return false
	endif
	if game_progress_has_valid_save
		return true
	endif
	printf 'game_progress_check_valid_save'
	change DoneScript = game_progress_valid_save_done
	change abortscript = game_progress_valid_save_cancel
	change RetryScript = game_progress_check_valid_save_spawned
	if gotparam freeze_skater
		skatercam0 :disableplayerinput
		freeze_skater_for_cinematic
	endif
	spawnscriptnow game_progress_check_valid_save_spawned params = {corrupt = <corrupt> force_wait_frames = <force_wait_frames>}
	block type = game_progress_check_finished
	mc_waitasyncopsfinished
	printf 'game_progress_check_valid_save - done!'
	if gotparam fix_start_key
		restore_start_key_binding
	endif
	if gotparam freeze_skater
		unfreeze_skater_after_cinematic
		skatercam0 :enableplayerinput
	endif
	if ($game_progress_check_result = 1)
		return true
	endif
	return false
endscript

script game_progress_check_valid_save_spawned 
	if NOT gotparam corrupt
		if game_progress_has_valid_save
			wait 2 gameframes
			goto game_progress_valid_save_done
			return
		endif
	endif
	if gotparam force_wait_frames
		wait <force_wait_frames> gameframes
	endif
	if mc_hasvalidatedfolder
		if isps3
			create_dialog_box {title = "Corrupt or Missing Save"
				text = "Your save couldn't be found, or is corrupt.\\nDo you wish to attempt to re-save your current game?\\n\\nA valid progress save is required to use this feature."
				buttons = [{text = "new save" pad_choose_script = game_progress_valid_save_save_to_new pad_choose_params = {corrupt}}
					{text = "cancel" pad_choose_script = game_progress_valid_save_cancel}]
				preserve_case
				text_dims = (700.0, 0.0)
				vmenu_width = 600
				additional_highlight_scale = (0.5, 0.0)
			}
		else
			if (<corrupt> = 1)
				create_dialog_box {title = "Corrupt Save"
					text = "Your save was found and is corrupt. Do you wish to attempt to re-save your current game?\\n\\nA valid progress save is required to use this feature."
					buttons = [{text = "new save" pad_choose_script = game_progress_valid_save_save_to_new pad_choose_params = {corrupt}}
						{text = "cancel" pad_choose_script = game_progress_valid_save_cancel}]
					preserve_case
					text_dims = (700.0, 0.0)
					vmenu_width = 600
					additional_highlight_scale = (0.5, 0.0)
				}
			else
				create_dialog_box {title = "Couldn't find save file"
					text = "The in-use storage device is unavailable.\\n\\nDo you wish to try searching another device for the current savegame?\\n\\nA valid progress save is required to use this feature."
					buttons = [{text = "try another device" pad_choose_script = game_progress_valid_save_try_another_device}
						{text = "cancel" pad_choose_script = game_progress_valid_save_cancel}]
					preserve_case
					text_dims = (700.0, 0.0)
					vmenu_width = 600
					additional_highlight_scale = (0.5, 0.0)
				}
			endif
		endif
	else
		create_dialog_box {title = "Feature Unavailable"
			text = "This story game was activated with saving disabled. You'll need to save your game progress to use this feature."
			buttons = [{text = "new save" pad_choose_script = game_progress_valid_save_save_to_new}
				{text = "cancel" pad_choose_script = game_progress_valid_save_cancel}]
			preserve_case
			text_dims = (700.0, 0.0)
			vmenu_width = 600
			additional_highlight_scale = (0.5, 0.0)
		}
	endif
endscript

script game_progress_valid_save_try_another_device 
	printf \{'game_progress_valid_save_try_another_device'}
	check_card \{no_message
		filetype = progress
		save
		ValidateForAutoSave = 1
		force = 1}
	if game_progress_check_valid_save
		game_progress_valid_save_done
	endif
endscript

script game_progress_valid_save_save_to_new 
	printf \{'game_progress_valid_save_save_to_new'}
	careerfunc \{func = removeextrasavecontent}
	change \{DoneScript = game_progress_valid_save_done}
	change \{abortscript = game_progress_valid_save_cancel}
	launch_autosave_menu_save_game_sequence \{SetAbortScript = 0
		force = 1}
endscript

script game_progress_valid_save_cancel 
	printf \{'game_progress_valid_save_cancel'}
	change \{game_progress_check_result = 0}
	unpausespawnedscript \{game_progress_check_valid_save}
	broadcastevent \{type = game_progress_check_finished}
endscript

script game_progress_valid_save_done 
	printf \{'game_progress_valid_save_done'}
	change \{game_progress_check_result = 1}
	unpausespawnedscript \{game_progress_check_valid_save}
	broadcastevent \{type = game_progress_check_finished}
endscript

script game_progress_has_valid_save 
	if ($memcard_using_autosave = 0)
		return false {corrupt = 0}
	endif
	if isxenon
		if NOT checkforsignin local
			return false {corrupt = 0}
		endif
	endif
	if NOT cardisinslot
		printf 'game_progress_has_valid_save - No card in slot'
		return false {corrupt = 0}
	endif
	if NOT mc_hasactivefolder
		net_view_goals_create_searching_text {
			text = "Checking..."
			scale = 0.75
			parent = root_window
		}
		scanning_ui = 1
	endif
	if memcard_validate_known_device
		validated = 1
	endif
	if gotparam scanning_ui
		if screenelementexists id = net_view_goals_searching_cont
			runscriptonscreenelement id = net_view_goals_searching_cont net_view_goals_searching_fade_out_and_die
		endif
	endif
	if NOT gotparam validated
		printf 'game_progress_has_valid_save - Validate failed'
		return false {corrupt = <corrupt>}
	endif
	return true
endscript

script do_autosave 
	if NOT game_progress_can_autosave
		return false
	endif
	change DoneScript = autosave_success
	change abortscript = autosave_failed
	change RetryScript = autosave_spawned_guts
	change savingorloading = saving
	change FilesOrFolders = files
	change autosave_initiated_pause = 0
	printf '*** AUTOSAVE STARTED ***'
	ve_restore_node_flags
	ve_restore_old_cas_skater
	if ($skater_using_temporary_appearance = 1)
		scriptassert 'Still using temporary CAS guy during save... Maybe saving at a bad time in a goal?'
	endif
	crib_kill_bink
	if gotparam suspend_ui
		create_dialog_box_with_wait {
			title = ""
			text = "Please wait..."
			text_dims = (350.0, 0.0)
			vmenu_width = 400
			wait_frames = 3
		}
		killallmovies blocking
	else
		killallmovies
	endif
	game_progress_autosave_active
	spawnscriptnow autosave_spawned params = {<...>}
	block type = autosave_finished
	mc_waitasyncopsfinished
	if ($autosave_initiated_pause = 1)
		unpausegame
		restore_start_key_binding
		change autosave_initiated_pause = 0
	endif
	game_progress_autosave_inactive
	if gotparam suspend_ui
		destroy_dialog_box
		restore_start_key_binding
	endif
	spawnscriptlater crib_update_av
	printf '*** AUTOSAVE FINISHED *** Result=%d' d = ($autosave_result)
	if ($autosave_result = 1)
		return true
	endif
	return false
endscript

script autosave_spawned 
	if gotparam \{immediate}
		autosave_spawned_guts {<...>}
	else
		WaitUntilScreenClear {callback = autosave_spawned_guts <...>}
	endif
endscript

script autosave_spawned_guts 
	printf 'autosave_spawned_guts'
	if NOT game_progress_has_valid_save
		printf 'no valid save'
		autosave_pause_game
		if NOT gotparam disallow_search
			if mc_hasvalidatedfolder
				if isps3
					create_dialog_box {title = "Corrupt or Missing Save"
						text = "Your save couldn't be found, or is corrupt.\\nDo you wish to attempt to re-save your current game?"
						buttons = [{text = "new save" pad_choose_script = autosave_create_new pad_choose_params = {corrupt}}
							{text = "continue without saving" pad_choose_script = autosave_failed}]
						preserve_case
						text_dims = (700.0, 0.0)
						vmenu_width = 600
						additional_highlight_scale = (0.5, 0.0)
					}
				else
					if (<corrupt> = 1)
						create_dialog_box {title = "Corrupt Save"
							text = "Your save was found and is corrupt. Do you wish to attempt to re-save your current game?"
							buttons = [{text = "new save" pad_choose_script = autosave_create_new pad_choose_params = {corrupt}}
								{text = "continue without saving" pad_choose_script = autosave_failed}]
							preserve_case
							text_dims = (700.0, 0.0)
							vmenu_width = 600
							additional_highlight_scale = (0.5, 0.0)
						}
					else
						create_dialog_box {title = "Couldn't find save file"
							text = "The in-use storage device is unavailable.\\n\\nDo you wish to try searching another device for the current savegame?"
							buttons = [{text = "try another device" pad_choose_script = autosave_failed_try_another_device}
								{text = "continue without saving" pad_choose_script = autosave_failed}]
							preserve_case
							text_dims = (700.0, 0.0)
							vmenu_width = 600
							additional_highlight_scale = (0.5, 0.0)
						}
					endif
				endif
			else
				if gotparam allow_new
					autosave_create_new
				else
					wait 2 gameframes
					goto autosave_failed
				endif
			endif
		else
			wait 2 gameframes
			goto autosave_failed
		endif
	else
		if gotparam allow_new
			manual_save = 1
		endif
		goto ingame_quicksave params = {filetype = progress filename = "ProgressFile" usepaddingslot = always manual_save = <manual_save>}
	endif
endscript

script autosave_failed_try_another_device 
	printf \{'autosave_failed_try_another_device'}
	change \{DoneScript = autosave_success}
	change \{abortscript = autosave_failed}
	change \{RetryScript = autosave_spawned_guts}
	check_card \{no_message
		filetype = progress
		save
		ValidateForAutoSave = 1
		force = 1}
	spawnscriptnow \{autosave_spawned_guts}
endscript

script autosave_failed 
	printf \{'autosave_failed'}
	change \{autosave_result = 0}
	autosave_wake_scripts
	broadcastevent \{type = autosave_finished}
endscript

script autosave_success 
	printf \{'autosave_success'}
	change \{autosave_result = 1}
	autosave_wake_scripts
	broadcastevent \{type = autosave_finished}
endscript

script autosave_create_new 
	printf \{'autosave_create_new'}
	change \{DoneScript = autosave_success}
	change \{abortscript = autosave_failed}
	killallmovies \{blocking}
	careerfunc \{func = removeextrasavecontent}
	launch_autosave_menu_save_game_sequence \{SetAbortScript = 0
		force = 1}
endscript

script autosave_abort 
	printf \{'autosave_abort'}
	autosave_wake_scripts
	killspawnedscript \{name = autosave_spawned}
	autosave_failed
	memcard_panic_cleanup
endscript

script autosave_wake_scripts 
	unpausespawnedscript \{do_autosave}
	unpausespawnedscript \{autosave_spawned}
	unpausespawnedscript \{autosave_spawned_guts}
	unpausespawnedscript \{ingame_quicksave}
endscript

script autosave_pause_game 
	printf \{'autosave_pause_game'}
	if ($autosave_initiated_pause = 0)
		if NOT gameispaused
			pausegame
			change \{autosave_initiated_pause = 1}
			autosave_wake_scripts
		endif
	endif
endscript

script delete_extra_saved_data 
	casttointeger name
	formattext textname = extra_data_filename "%d" d = <name> integer_width = 6
	if game_progress_check_valid_save
		resettimer
		mcmess_deletingfile filetype = <filetype>
		if memcardfileexists filename = <extra_data_filename> filetype = <filetype>
			if gotparam total_file_size
				if (<total_file_size> > 0)
					fake_delete = 1
				endif
			endif
			if NOT gotparam fake_delete
				deletememcardfile filename = <extra_data_filename> filetype = <filetype>
			endif
		endif
		mc_waitasyncopsfinished
		memcard_wait_for_timer
		destroy_dialog_box
		if gotparam result
			if (<result> = false)
				<error_message> = "Unable to delete."
				if isxenon
					if NOT cardisinslot
						<error_message> = "No storage device was selected or the in-use storage device is unavailable."
					endif
				endif
				do_ok_dialog_box {
					preserve_case
					text_dims = (500.0, 0.0)
					vmenu_width = 400
					title = "DELETE FAILED!"
					text = <error_message>
				}
				return false
			endif
		endif
		return true
	endif
	return false
endscript
