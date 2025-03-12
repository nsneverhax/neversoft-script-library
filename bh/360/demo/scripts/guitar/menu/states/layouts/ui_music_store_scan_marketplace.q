
script ui_init_music_store_scan_marketplace 
endscript

script ui_deinit_music_store_scan_marketplace 
endscript

script ui_create_music_store_scan_marketplace 
	spawnscriptnow ui_create_music_store_scan_marketplace_spawned params = <...>
endscript

script ui_create_music_store_scan_marketplace_spawned 
	wait \{2
		gameframes}
	if ($g_marketplace_responding_to_error = 1)
		return
	endif
	if NOT ui_event_exists_in_stack \{name = 'music_store_scan_marketplace'}
		return
	endif
	launchevent \{type = unfocus
		target = current_menu}
	create_dialog_box {
		heading_text = qs(0xea124b1e)
		body_text = qs(0x4818fd85)
		player_device = ($primary_controller)
		music_store_dialog_hack
	}
	dialog_box_container :obj_spawnscript \{jam_recording_animate_spinning_record}
	gettruestarttime
	songlist :gettags
	if contentmanfunc func = refresh name = <list_name>
		begin
		if contentmanfunc func = is_ready name = <list_name>
			change \{g_songlist_refresh_menus = 1}
			generic_event_back \{nosound
				data = {
					no_pivot
				}}
			return
		endif
		wait \{0.1
			seconds}
		repeat 200
	endif
	destroy_dialog_box
	if screenelementexists \{id = current_menu}
		launchevent \{type = unfocus
			target = current_menu}
	endif
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
