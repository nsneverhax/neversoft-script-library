
script ui_create_net_zero_search_results_popup 
	ui_band_mode_change_menu_focus_all \{focus_type = unfocus}
	create_popup_warning_menu {
		title = qs(0x9b97c7b2)
		textblock = {
			text = qs(0xced13a93)
		}
		options = [
			{
				func = refresh_band_search
				text = qs(0xa22c24d9)
			}
			{
				func = cancel_net_career_mode_search
				text = qs(0xf7723015)
			}
		]
		no_background
		popup_event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_back cancel_net_career_mode_search}
		]
		player_device = <device_num>
	}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
endscript

script ui_destroy_net_zero_search_results_popup 
	destroy_popup_warning_menu
endscript

script ui_deinit_net_zero_search_results_popup 
	destroy_popup_warning_menu
endscript

script refresh_band_search 
	obj_getid
	<objid> :se_setprops block_events
	netsessionfunc \{obj = match
		func = stop_server_list}
	cancel_join_server
	destroy_popup_warning_menu
	ui_create_net_career_join_popup device_num = <device_num>
endscript
