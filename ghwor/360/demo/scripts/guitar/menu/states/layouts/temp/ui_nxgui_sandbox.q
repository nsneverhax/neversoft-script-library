
script ui_create_nxgui_sandbox 
	printf \{qs(0xe72ea1ae)}
	createscreenelement \{type = descinterface
		parent = root_window
		desc = 'NxGUI_Sandbox'
		id = nxgui_sandbox}
	<event_handlers> = [
		{pad_back ui_sfx params = {menustate = generic uitype = back}}
		{pad_back generic_event_back}
	]
	nxgui_sandbox :se_setprops event_handlers = <event_handlers>
	launchevent \{type = focus
		target = nxgui_sandbox}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
endscript

script ui_destroy_nxgui_sandbox 
	destroyscreenelement \{id = nxgui_sandbox}
	clean_up_user_control_helpers
endscript
