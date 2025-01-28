ps2_saveload_successor = null_flow_state
ps2_saveload_successor_action_state = {
}
0x285fecb3 = 62
restartmenumusic = 0

script ps2_leave_saveload_flow 
	wait \{5
		gameframe}
	destroy_ps2_trc_menu
	spawnscriptnow \{ui_flow_manager_respond_to_action
		params = {
			action = leave_saveload_flow
		}}
	if ($restartmenumusic = 1)
		change \{restartmenumusic = 0}
		spawnscriptnow \{menu_music_on}
	endif
endscript

script ps2_memcard_load_check_status 
	destroy_ps2_saveload_screen
	create_ps2_saveload_screen <...>
	wait \{3
		seconds}
	if NOT cardisinslot
		spawnscriptnow \{ui_flow_manager_respond_to_action
			params = {
				action = no_memcard
			}}
		return
	endif
	memcard_check_for_existing_save
	if (<found> = 0)
		spawnscriptnow \{ui_flow_manager_respond_to_action
			params = {
				action = no_save
			}}
		return
	endif
	spawnscriptnow \{ui_flow_manager_respond_to_action
		params = {
			action = status_ok
		}}
endscript

script ps2_memcard_load 
	destroy_ps2_saveload_screen
	create_ps2_saveload_screen <...>
	wait \{5
		gameframe}
	setsavefilename \{filetype = progress
		name = 'GH3Progress'}
	getglobaltags \{globaltag_checksum
		params = globaltag_checksum}
	oldglobaltag_checksum = <globaltag_checksum>
	if NOT loadfrommemorycard \{filetype = progress}
		if NOT cardisinslot
			spawnscriptnow \{ui_flow_manager_respond_to_action
				params = {
					action = no_memcard
				}}
			return
		elseif gotparam \{corrupteddata}
			spawnscriptnow \{ui_flow_manager_respond_to_action
				params = {
					action = corrupt_save
				}}
			return
		else

			spawnscriptnow \{ui_flow_manager_respond_to_action
				params = {
					action = corrupt_save
				}}
			return
		endif
	endif
	globaltag_checksum = invalid
	getglobaltags \{globaltag_checksum
		params = globaltag_checksum
		noassert = 1}
	if NOT (<globaltag_checksum> = <oldglobaltag_checksum>)

		clearglobaltags
		setup_globaltags
		spawnscriptnow \{ui_flow_manager_respond_to_action
			params = {
				action = corrupt_save
			}}
		return
	endif
	restore_options_from_global_tags
	scan_globaltag_downloads
	spawnscriptnow \{ui_flow_manager_respond_to_action
		params = {
			action = load_complete
		}}
endscript

script ps2_memcard_save_check_status \{no_check = 0
		check_for_existing = 0}
	destroy_ps2_saveload_screen
	create_ps2_saveload_screen <...>
	wait \{5
		gameframe}
	if (<no_check> = 0)
		if cardisnew
			spawnscriptnow \{ui_flow_manager_respond_to_action
				params = {
					action = new_memcard
				}}
			return
		endif
	endif
	if NOT cardisinslot
		spawnscriptnow \{ui_flow_manager_respond_to_action
			params = {
				action = no_memcard
			}}
		return
	endif
	if NOT cardisformatted
		wait \{5
			gameframe}
		if NOT cardisformatted
			if NOT cardisinslot
				spawnscriptnow \{ui_flow_manager_respond_to_action
					params = {
						action = no_memcard
					}}
				return
			endif
			spawnscriptnow \{ui_flow_manager_respond_to_action
				params = {
					action = not_formatted
				}}
			return
		endif
	endif
	if (<check_for_existing> = 1)
		memcard_check_for_existing_save
		if NOT (<found> = 0)
			if NOT cardisinslot
				spawnscriptnow \{ui_flow_manager_respond_to_action
					params = {
						action = no_memcard
					}}
				return
			endif
			spawnscriptnow \{ui_flow_manager_respond_to_action
				params = {
					action = existing_save
				}}
			return
		endif
	endif
	0x4884c33d
	if (<nospace> = 0)
		spawnscriptnow \{ui_flow_manager_respond_to_action
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

		if (<spacerequired> > <spaceavailable>)
			if NOT cardisinslot
				spawnscriptnow \{ui_flow_manager_respond_to_action
					params = {
						action = no_memcard
					}}
				return \{nospace = 1}
			endif
			spawnscriptnow \{ui_flow_manager_respond_to_action
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
	wait \{5
		gameframe}
	if ($progression_pop_count = 1)
		pop_later = 1
		progression_push_current
	else
		pop_later = 0
	endif
	setsavefilename \{filetype = progress
		name = 'GH3Progress'}
	if NOT savetomemorycard \{filetype = progress}

		spawnscriptnow \{ui_flow_manager_respond_to_action
			params = {
				action = error
			}}
		return
	endif
	if (<pop_later> = 1)
		progression_pop_current
	endif
	destroy_ps2_saveload_screen
	spawnscriptnow \{ui_flow_manager_respond_to_action
		params = {
			action = save_complete
		}}
endscript

script ps2_memcard_format_check_status 
	destroy_ps2_saveload_screen
	create_ps2_saveload_screen <...>
	wait \{5
		gameframe}
	if cardisformatted
		spawnscriptnow \{ui_flow_manager_respond_to_action
			params = {
				action = is_formatted
			}}
		return
	endif
	wait \{5
		gameframe}
	if cardisformatted
		spawnscriptnow \{ui_flow_manager_respond_to_action
			params = {
				action = is_formatted
			}}
		return
	endif
	if NOT cardisinslot
		spawnscriptnow \{ui_flow_manager_respond_to_action
			params = {
				action = no_memcard
			}}
		return
	endif
	spawnscriptnow \{ui_flow_manager_respond_to_action
		params = {
			action = status_ok
		}}
endscript

script ps2_memcard_format 
	destroy_ps2_saveload_screen
	create_ps2_saveload_screen <...>
	wait \{5
		gameframe}
	if NOT formatcard
		if NOT cardisinslot
			spawnscriptnow \{ui_flow_manager_respond_to_action
				params = {
					action = no_memcard
				}}
			return
		else
			scriptassert \{'something went wrong with the format card'}
		endif
	endif
	destroy_ps2_saveload_screen
	spawnscriptnow \{ui_flow_manager_respond_to_action
		params = {
			action = success
		}}
endscript

script ps2_replace_file 
	clearglobaltags
	setup_globaltags
	deletememcardfile \{filetype = progress}
	spawnscriptnow \{ui_flow_manager_respond_to_action
		params = {
			action = 0x5b5fc631
		}}
endscript

script ps2_disable_autosave 
	destroy_ps2_saveload_screen
	create_ps2_saveload_screen <...>
	wait \{3
		seconds}
	setglobaltags \{user_options
		params = {
			autosave = 0
		}}
	ps2_leave_saveload_flow
endscript

script ps2_set_saveload_successor 
	get_flow_manager_action_state \{action = continue}
	change ps2_saveload_successor = <state>
	hack_ps2_set_saveload_successor_checksum <state>
endscript

script ps2_get_saveload_successor 
	return \{flow_state = hack_ps2_saveload_successor}
endscript

script ps2_memcard_set_options_as_successor 
	ps2_memcard_set_autosave \{autosave = 0}
	change \{ps2_saveload_successor = options_data_settings_fs}
	hack_ps2_set_saveload_successor_checksum \{options_data_settings_fs}
endscript

script ps2_memcard_saveload_complete 
	destroy_ps2_saveload_screen
	create_ps2_saveload_screen <...>
	wait \{1
		second}
	ps2_leave_saveload_flow
endscript

script ps2_memcard_message 
	change \{check_for_unplugged_controllers = 1}
	destroy_ps2_saveload_screen
	create_ps2_saveload_screen <...>
	add_user_control_helper \{text = 'CONTINUE'
		button = green
		z = 1006}
	createscreenelement \{type = spriteelement
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
	launchevent type = focus target = <id>
endscript
ps2_memcard_autosave = 0

script ps2_memcard_set_autosave 
	change ps2_memcard_autosave = <autosave>
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
