force_price_change_bool = 0

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
	if NOT ui_event_exists_in_stack \{name = 'music_store_scan_marketplace'}
		return
	endif
	launchevent \{type = unfocus
		target = current_menu}
	create_popup_warning_menu {
		title = qs(0xea124b1e)
		textblock = {
			text = qs(0x4818fd85)
			dims = (800.0, 400.0)
			scale = 0.55
		}
		menu_pos = (640.0, 520.0)
		player_device = ($primary_controller)
		music_store_dialog_hack
	}
	popup_warning_container :obj_spawnscript \{jam_recording_animate_spinning_record}
	getstarttime
	if NOT ui_request_scan_marketplace
		destroy_popup_warning_menu
		if NOT ui_event_exists_in_stack \{name = 'music_store_scan_marketplace'}
			return
		endif
		create_popup_warning_menu {
			textblock = {
				text = qs(0x07912b48)
				dims = (800.0, 400.0)
				scale = 0.55
			}
			menu_pos = (640.0, 520.0)
			player_device = ($primary_controller)
			options = [
				{
					func = {generic_event_back}
					func_params = {nosound state = uistate_downloads}
					text = qs(0x0e41fe46)
				}
			]
		}
	else
		begin
		getelapsedtime starttime = <starttime>
		if (<elapsedtime> > 3000.0)
			break
		else
			wait \{1
				gameframe}
		endif
		if NOT ui_event_exists_in_stack \{name = 'music_store_scan_marketplace'}
			return
		endif
		repeat
		purchased = 0
		if gotparam \{data}
			if structurecontains structure = <data> purchase_struct
				if marketplacefunc func = get_content_info id = ((<data>.purchase_struct).code)
					purchased = <purchased>
				endif
			endif
		endif
		generic_event_back nosound data = {purchased = <purchased>}
	endif
endscript

script ui_destroy_music_store_scan_marketplace 
	destroy_popup_warning_menu
endscript

script ui_request_scan_marketplace 
	begin
	if NOT scriptisrunning \{ui_scan_marketplace_worker}
		break
	endif
	wait \{1
		gameframe}
	repeat
	if ui_scan_marketplace_worker heartbeat = <heartbeat>
		return true marketplace_changed = <marketplace_changed>
	else
		return \{false}
	endif
endscript

script ui_scan_marketplace_worker 
	begin
	marketplacefunc \{func = get_state}
	if (<state> = init)
		break
	endif
	wait \{1
		gameframe}
	repeat
	marketplacefunc \{func = enum_content}
	begin
	marketplacefunc \{func = get_state}
	if NOT (<state> = enum)
		break
	endif
	wait \{1
		gameframe}
	repeat
	if marketplacefunc \{func = last_enum_failed}
		return \{false}
	else
		if gotparam \{heartbeat}
			marketplace_changed = 0
			if ($force_price_change_bool = 1)
				marketplace_changed = 1
				change \{force_price_change_bool = 0}
			endif
			if (<marketplace_changed> = 1)
				ui_music_store_refresh_prices
			endif
			return true marketplace_changed = <marketplace_changed>
		else
			ui_music_store_refresh_prices
			return \{true
				marketplace_changed = 1}
		endif
	endif
endscript

script force_price_change 
	change \{force_price_change_bool = 1}
endscript
