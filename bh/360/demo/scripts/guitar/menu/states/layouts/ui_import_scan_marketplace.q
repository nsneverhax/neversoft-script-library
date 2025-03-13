
script ui_create_import_scan_marketplace 
	if NOT isps3
		scriptassert \{'In UIstate_import_scan_marketplace and not PS3, something is wrong.'}
		generic_event_back_block \{state = uistate_import}
		return
	endif
	spawnscriptnow ui_create_import_scan_marketplace_spawned params = <...>
endscript

script ui_destroy_import_scan_marketplace 
	destroy_dialog_box
endscript

script ui_create_import_scan_marketplace_spawned 
	wait \{2
		gameframes}
	if NOT ui_event_exists_in_stack \{name = 'import_scan_marketplace'}
		return
	endif
	create_dialog_box {
		heading_text = qs(0xea124b1e)
		body_text = qs(0x4818fd85)
		player_device = ($primary_controller)
		music_store_dialog_hack
	}
	dialog_box_container :obj_spawnscript \{jam_recording_animate_spinning_record}
	if NOT import_check_signin_state
		import_setup_failed fail_text = <fail_text>
		return
	endif
	if NOT import_enumerate_store userid = <valid_user>
		if NOT cd
			fail_text = qs(0x5136632c)
		endif
		import_setup_failed destroymenu errorcode = 11 fail_text = <fail_text>
		return
	endif
	destroy_dialog_box
	if NOT import_check_signin_state
		import_setup_failed fail_text = <fail_text>
		return
	endif
	generic_event_back_block \{state = uistate_import}
endscript
