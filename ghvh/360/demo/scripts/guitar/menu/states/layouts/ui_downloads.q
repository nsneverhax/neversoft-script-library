
script ui_init_downloads 
	jam_init_reverb
endscript

script ui_create_downloads 
	change \{respond_to_signin_changed = 1}
	change \{respond_to_signin_changed_func = none}
	menu_music_on
	make_menu_frontend \{screen = bassist
		title = qs(0x271e2cfc)}
	if isxenon
		add_menu_frontend_item text = qs(0x99680c13) pad_choose_script = set_primary_controller pad_choose_params = {device_num = <device_num> state = uistate_jam_ghtunes require_live = 1 jam = 3}
	elseif isps3
		add_menu_frontend_item text = qs(0x99680c13) pad_choose_script = set_primary_controller pad_choose_params = {device_num = <device_num> state = uistate_jam_ghtunes require_live = 1}
	endif
	<item_container_id> :settags spinner_offset = 20
	createscreenelement {
		type = textelement
		parent = <item_container_id>
		id = ghtunes_sm
		text = qs(0x7ca19d0c)
		font = fontgrid_title_a1
		just = [left top]
		scale = 0.25
		pos = (215.0, 5.0)
		rgba = ($menu_unfocus_color)
	}
	<item_id> :se_setprops {
		event_handlers = [
			{focus retail_menu_focus params = {id = <id>}}
			{unfocus retail_menu_unfocus params = {id = <id>}}
		]
	}
	add_menu_frontend_item text = qs(0xa8e9637f) pad_choose_script = set_primary_controller pad_choose_params = {device_num = <device_num> state = uistate_music_store_setup require_live = 1 musicstore = 1}
	add_menu_frontend_item \{text = qs(0x323d3e47)
		pad_choose_script = ui_downloads_setlist_warning}
	launchevent \{type = focus
		target = current_menu}
	menu_finish
	unblock_invites
endscript

script ui_destroy_downloads 
	generic_ui_destroy
endscript

script ui_deinit_downloads 
	jam_deinit_reverb
endscript

script ui_downloads_setlist_warning 
	launchevent \{type = unfocus
		target = current_menu}
	destroy_popup_warning_menu
	create_popup_warning_menu {
		title = qs(0xef89be45)
		textblock = {
			text = qs(0x22101db1)
			dims = (800.0, 400.0)
			scale = 0.45000002
		}
		long
		menu_pos = (640.0, 520.0)
		player_device = ($primary_controller)
		options = [
			{
				func = ui_downloads_setlist_warning_ok
				text = qs(0x0e41fe46)
			}
			{
				func = ui_downloads_setlist_warning_cancel
				text = qs(0xf7723015)
			}
		]
	}
endscript

script ui_downloads_setlist_warning_ok 
	destroy_popup_warning_menu
	unload_songqpak
	get_savegame_from_controller controller = ($primary_controller)
	ui_event_wait event = menu_change data = {
		state = uistate_boot_download_scan savegame = <savegame> controller = ($primary_controller)
		event_params = {event = menu_back data = {state = uistate_downloads}}
	}
	add_gamertag_helper exclusive_device = ($primary_controller)
	menu_finish
endscript

script ui_downloads_setlist_warning_cancel 
	destroy_popup_warning_menu
	launchevent \{type = focus
		target = current_menu}
	add_gamertag_helper exclusive_device = ($primary_controller)
	menu_finish
endscript
