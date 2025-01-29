
script ui_init_music_store_scan_marketplace 
endscript

script ui_deinit_music_store_scan_marketplace 
endscript

script ui_create_music_store_scan_marketplace 
	SpawnScriptNow ui_create_music_store_scan_marketplace_spawned params = <...>
endscript

script ui_create_music_store_scan_marketplace_spawned 
	Wait \{2
		gameframes}
	if NOT ui_event_exists_in_stack \{Name = 'music_store_scan_marketplace'}
		music_store_stop_saving_net_error
		return
	endif
	songlist_destroy_dialog_box
	if ObjectExists \{id = current_menu}
		LaunchEvent \{Type = unfocus
			target = current_menu}
	endif
	<body_text> = qs(0x4818fd85)
	formatText TextName = body_text qs(0x17b336eb) s = <body_text>
	create_dialog_box {
		heading_text = qs(0xea124b1e)
		body_text = <body_text>
		player_device = ($primary_controller)
		music_store_dialog_hack
	}
	dialog_box_container :obj_spawnscript \{music_store_animate_progress_bar}
	dialog_box_container :obj_spawnscript \{jam_recording_animate_spinning_record}
	GetTrueStartTime
	SongList :GetTags
	if contentmanfunc func = refresh Name = <list_name>
		Change \{dlc_timeout_counter = 0}
		begin
		if contentmanfunc func = is_ready Name = <list_name>
			Change \{g_songlist_refresh_menus = 1}
			<purchase_struct> = ($g_music_store_purchase_struct)
			Change \{g_music_store_purchase_struct = {
				}}
			generic_event_back \{data = {
					bypass_return_script = songlist_back
				}}
			ui_event_wait_for_safe
			Wait \{5
				gameframes}
			sdcardmanagerfunc \{func = force_hold_ejects
				OFF}
			music_store_stop_saving_net_error
			return
		endif
		Change dlc_timeout_counter = ($dlc_timeout_counter + 1)
		if ($dlc_timeout_counter > $dlc_timeout_time)
			break
		endif
		Wait \{3
			gameframes}
		repeat
	endif
	contentmanfunc func = cancel_request Name = <list_name>
	destroy_dialog_box
	create_dialog_box \{no_background
		heading_text = qs(0xaa163738)
		body_text = qs(0xa47088ec)
		options = [
			{
				func = songlist_marketplace_timed_out_go_back
				text = qs(0x0e41fe46)
			}
		]}
endscript

script ui_destroy_music_store_scan_marketplace 
	destroy_dialog_box
endscript
