
script ui_init_guitarhero_com 
	netsessionfunc \{func = stats_uninit}
	netsessionfunc \{func = stats_init}
endscript

script ui_create_guitarhero_com 
	netsessionfunc \{func = get_agora_token}
	formattext textname = passcode_text qs(0x3c71eff6) t = <token>
	createscreenelement {
		parent = root_window
		id = current_menu
		type = descinterface
		desc = 'community'
		exclusive_device = ($primary_controller)
		event_handlers = [
			{pad_back generic_event_back}
		]
		passcode_text = <passcode_text>
	}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	current_menu :obj_spawnscriptnow \{ui_community_screen_anim}
	current_menu :obj_spawnscriptnow \{ui_widget_underline_anim}
endscript

script ui_destroy_guitarhero_com 
	clean_up_user_control_helpers
	destroyscreenelement \{id = current_menu}
	killspawnedscript \{name = ui_community_screen_anim}
	killspawnedscript \{name = ui_widget_underline_anim}
endscript

script ui_community_screen_anim 
	se_getprops \{community_skull_pos}
	<org_pos> = <community_skull_pos>
	<scale> = Random (@ 1.5 @ 1 @ 1.3 @ 1.2 @ 1.4 )
	a = Random (@ 0.03 @ 0.5 @ 1 @ 1.23 @ 0.8 @ 1.6 )
	b = Random (@ 13 @ 16 @ 12 @ 17 @ 11 )
	begin
	wait \{0.0
		seconds}
	se_setprops community_skull_scale = <scale>
	se_waitprops
	se_setprops community_skull_pos = (<org_pos> + ((1.0, 1.0) * <b>))
	se_waitprops
	ui_fx_set_blur amount = <a> time = 0.0
	se_waitprops
	wait \{0.08
		seconds}
	se_setprops community_skull_scale = <scale>
	se_waitprops
	se_setprops community_skull_pos = (<org_pos> + ((1.0, 1.0) * <b>))
	se_waitprops
	ui_fx_set_blur amount = <a> time = 0.4
	se_waitprops
	wait \{0.08
		seconds}
	se_setprops \{community_skull_scale = 1.0}
	se_waitprops
	se_setprops community_skull_pos = <org_pos>
	se_waitprops
	ui_fx_set_blur \{amount = 0.0
		time = 0.2}
	r = Random (@ 9 @ 7 @ 8 @ 6 @ 10 )
	wait <r> seconds
	repeat
endscript

script ui_widget_underline_anim 
	se_getprops \{widget_underline_pos}
	<org_pos> = <widget_underline_pos>
	c = Random (@ 2 @ 3 @ 1.5 @ 1 @ 2.5 )
	<scale> = Random (@ 1.002 @ 1 @ 1.005 @ 1.01 @ 1.0074999 )
	begin
	wait \{0.0
		seconds}
	se_setprops widget_underline_pos = (<org_pos> + (1.0, 1.0) * <c>)
	se_waitprops
	se_setprops widget_underline_scale = <scale>
	se_waitprops
	wait \{0.08
		seconds}
	se_setprops widget_underline_pos = <org_pos>
	se_waitprops
	se_setprops \{widget_underline_scale = 1.0}
	se_waitprops
	wait \{0.08
		seconds}
	repeat
endscript
