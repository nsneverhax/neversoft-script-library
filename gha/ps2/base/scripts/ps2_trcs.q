ps2_saveload_successor = null_flow_state
ps2_saveload_successor_action_state = {
}
0x285fecb3 = 74
restartmenumusic = 0

script ps2_leave_saveload_flow 
	Wait \{5
		gameframe}
	destroy_ps2_trc_menu
	SpawnScriptNow \{ui_flow_manager_respond_to_action
		params = {
			action = leave_saveload_flow
		}}
	if ($restartmenumusic = 1)
		Change \{restartmenumusic = 0}
		SpawnScriptNow \{menu_music_on}
	endif
endscript

script ps2_memcard_load_check_status 
	destroy_ps2_saveload_screen
	create_ps2_saveload_screen <...>
	Wait \{3
		Seconds}
	if NOT CardIsInSlot
		SpawnScriptNow \{ui_flow_manager_respond_to_action
			params = {
				action = no_memcard
			}}
		return
	endif
	memcard_check_for_existing_save
	if (<found> = 0)
		SpawnScriptNow \{ui_flow_manager_respond_to_action
			params = {
				action = no_save
			}}
		return
	endif
	SpawnScriptNow \{ui_flow_manager_respond_to_action
		params = {
			action = status_ok
		}}
endscript

script ps2_memcard_load 
	destroy_ps2_saveload_screen
	create_ps2_saveload_screen <...>
	Wait \{5
		gameframe}
	SetSaveFileName \{filetype = progress
		Name = 'GH3Progress'}
	GetGlobalTags \{globaltag_checksum
		params = globaltag_checksum}
	oldglobaltag_checksum = <globaltag_checksum>
	if NOT LoadFromMemoryCard \{filetype = progress}
		if NOT CardIsInSlot
			SpawnScriptNow \{ui_flow_manager_respond_to_action
				params = {
					action = no_memcard
				}}
			return
		elseif GotParam \{CorruptedData}
			SpawnScriptNow \{ui_flow_manager_respond_to_action
				params = {
					action = corrupt_save
				}}
			return
		else

			SpawnScriptNow \{ui_flow_manager_respond_to_action
				params = {
					action = corrupt_save
				}}
			return
		endif
	endif
	globaltag_checksum = invalid
	GetGlobalTags \{globaltag_checksum
		params = globaltag_checksum
		noassert = 1}
	if NOT (<globaltag_checksum> = <oldglobaltag_checksum>)

		ClearGlobalTags
		setup_globaltags
		SpawnScriptNow \{ui_flow_manager_respond_to_action
			params = {
				action = corrupt_save
			}}
		return
	endif
	restore_options_from_global_tags
	scan_globaltag_downloads
	SpawnScriptNow \{ui_flow_manager_respond_to_action
		params = {
			action = load_complete
		}}
endscript

script ps2_memcard_save_check_status \{no_check = 0
		check_for_existing = 0}
	destroy_ps2_saveload_screen
	create_ps2_saveload_screen <...>
	Wait \{5
		gameframe}
	if ScreenElementExists \{id = gh3c_fade_box}
		DestroyScreenElement \{id = gh3c_fade_box}
	endif

	if (<no_check> = 0)

		if cardisnew

			SpawnScriptNow \{ui_flow_manager_respond_to_action
				params = {
					action = new_memcard
				}}
			return
		endif
		if cardisnew

			SpawnScriptNow \{ui_flow_manager_respond_to_action
				params = {
					action = new_memcard
				}}
			return
		endif

	endif
	if NOT CardIsInSlot
		SpawnScriptNow \{ui_flow_manager_respond_to_action
			params = {
				action = no_memcard
			}}
		return
	endif
	if NOT cardisformatted
		Wait \{5
			gameframe}
		if NOT cardisformatted
			if NOT CardIsInSlot
				SpawnScriptNow \{ui_flow_manager_respond_to_action
					params = {
						action = no_memcard
					}}
				return
			endif
			SpawnScriptNow \{ui_flow_manager_respond_to_action
				params = {
					action = not_formatted
				}}
			return
		endif
	endif
	if (<check_for_existing> = 1)
		memcard_check_for_existing_save
		if NOT (<found> = 0)
			if NOT CardIsInSlot
				SpawnScriptNow \{ui_flow_manager_respond_to_action
					params = {
						action = no_memcard
					}}
				return
			endif
			SpawnScriptNow \{ui_flow_manager_respond_to_action
				params = {
					action = existing_save
				}}
			return
		endif
	endif
	0x4884c33d
	if (<nospace> = 0)
		SpawnScriptNow \{ui_flow_manager_respond_to_action
			params = {
				action = status_ok
			}}
	endif
endscript

script 0x4884c33d 
	memcard_check_for_existing_save
	if (<found> = 0)
		0x80d82aa7 \{progress}

		getmemcardspaceavailable

		if (<SpaceRequired> > <spaceavailable>)
			if NOT CardIsInSlot
				SpawnScriptNow \{ui_flow_manager_respond_to_action
					params = {
						action = no_memcard
					}}
				return \{nospace = 1}
			endif
			SpawnScriptNow \{ui_flow_manager_respond_to_action
				params = {
					action = insufficient_space
				}}
			return \{nospace = 1}
		endif
	endif
	return \{nospace = 0}
endscript

script ps2_memcard_save 
	destroy_ps2_saveload_screen
	create_ps2_saveload_screen <...>
	Wait \{5
		gameframe}
	if ($progression_pop_count = 1)
		pop_later = 1
		progression_push_current
	else
		pop_later = 0
	endif
	SetSaveFileName \{filetype = progress
		Name = 'GH3Progress'}
	if NOT SaveToMemoryCard \{filetype = progress}

		SpawnScriptNow \{ui_flow_manager_respond_to_action
			params = {
				action = error
			}}
		return
	endif
	if (<pop_later> = 1)
		progression_pop_current
	endif
	destroy_ps2_saveload_screen
	SpawnScriptNow \{ui_flow_manager_respond_to_action
		params = {
			action = save_complete
		}}
endscript

script ps2_memcard_format_check_status 
	destroy_ps2_saveload_screen
	create_ps2_saveload_screen <...>
	Wait \{5
		gameframe}
	if cardisformatted
		SpawnScriptNow \{ui_flow_manager_respond_to_action
			params = {
				action = is_formatted
			}}
		return
	endif
	Wait \{5
		gameframe}
	if cardisformatted
		SpawnScriptNow \{ui_flow_manager_respond_to_action
			params = {
				action = is_formatted
			}}
		return
	endif
	if NOT CardIsInSlot
		SpawnScriptNow \{ui_flow_manager_respond_to_action
			params = {
				action = no_memcard
			}}
		return
	endif
	SpawnScriptNow \{ui_flow_manager_respond_to_action
		params = {
			action = status_ok
		}}
endscript

script ps2_memcard_format 
	destroy_ps2_saveload_screen
	create_ps2_saveload_screen <...>
	Wait \{5
		gameframe}
	if NOT formatcard
		if NOT CardIsInSlot
			SpawnScriptNow \{ui_flow_manager_respond_to_action
				params = {
					action = no_memcard
				}}
			return
		else
			ScriptAssert \{'something went wrong with the format card'}
		endif
	endif
	destroy_ps2_saveload_screen
	SpawnScriptNow \{ui_flow_manager_respond_to_action
		params = {
			action = success
		}}
endscript

script ps2_replace_file 
	ClearGlobalTags
	setup_globaltags
	DeleteMemCardFile \{filetype = progress}
	SpawnScriptNow \{ui_flow_manager_respond_to_action
		params = {
			action = 0x5b5fc631
		}}
endscript

script ps2_disable_autosave 
	destroy_ps2_saveload_screen
	create_ps2_saveload_screen <...>
	Wait \{3
		Seconds}
	SetGlobalTags \{user_options
		params = {
			autosave = 0
		}}
	ps2_leave_saveload_flow
endscript

script ps2_set_saveload_successor 
	get_flow_manager_action_state \{action = continue}
	Change ps2_saveload_successor = <state>
	hack_ps2_set_saveload_successor_checksum <state>
endscript

script ps2_get_saveload_successor 
	return \{flow_state = hack_ps2_saveload_successor}
endscript

script ps2_memcard_set_options_as_successor 
	ps2_memcard_set_autosave \{autosave = 0}
	Change \{ps2_saveload_successor = options_data_settings_fs}
	hack_ps2_set_saveload_successor_checksum \{options_data_settings_fs}
endscript

script ps2_memcard_saveload_complete 
	destroy_ps2_saveload_screen
	create_ps2_saveload_screen <...>
	Wait \{1
		Second}
	ps2_leave_saveload_flow
endscript

script ps2_memcard_message 
	Change \{check_for_unplugged_controllers = 1}
	destroy_ps2_saveload_screen
	create_ps2_saveload_screen <...>
	add_user_control_helper \{text = 'CONTINUE'
		button = green
		z = 1006}
	CreateScreenElement \{Type = SpriteElement
		parent = ps2_trc_container
		rgba = [
			0
			0
			0
			0
		]
		event_handlers = [
			{
				pad_choose
				ui_flow_manager_respond_to_action
				params = {
					action = continue
				}
			}
		]}
	LaunchEvent Type = focus target = <id>
endscript
ps2_memcard_autosave = 0

script ps2_memcard_set_autosave 
	Change ps2_memcard_autosave = <autosave>
endscript

script ps2_memcard_save_successor 
	if (($ps2_memcard_autosave) = 0)
		return \{flow_state = ps2_memcard_save_ingame_fs}
	else
		return \{flow_state = ps2_memcard_autosave_ingame_fs}
	endif
endscript

script ps2_memcard_existing_save_successor 
	if (($ps2_memcard_autosave) = 0)
		return \{flow_state = ps2_memcard_overwrite_confirm_ingame_fs}
	else
		ps2_memcard_save_successor
		return flow_state = <flow_state>
	endif
endscript
