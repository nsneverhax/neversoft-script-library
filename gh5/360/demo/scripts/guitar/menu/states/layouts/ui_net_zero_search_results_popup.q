
script ui_create_net_zero_search_results_popup 
	create_dialog_box {
		heading_text = qs(0xddccf0c3)
		body_text = qs(0xced13a93)
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
		back_button_script = cancel_net_career_mode_search
		player_device = <device_num>
	}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
endscript

script ui_destroy_net_zero_search_results_popup 
	destroy_dialog_box
endscript

script ui_deinit_net_zero_search_results_popup 
	destroy_dialog_box
endscript

script refresh_band_search 
	obj_getid
	<objid> :se_setprops block_events
	netsessionfunc \{obj = match
		func = stop_server_list}
	cancel_join_server
	destroy_dialog_box
	ui_create_net_career_join_popup device_num = <device_num>
endscript
