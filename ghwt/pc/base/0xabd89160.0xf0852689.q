
script 0xd87a0fd7 
	printstruct <...>
	create_popup_warning_menu \{textblock = {
			text = qs(0xbec817a7)
			dims = (800.0, 400.0)
			scale = 0.55
		}
		use_all_controllers
		no_background
		menu_pos = (640.0, 520.0)
		options = [
			{
				func = 0x5749bbbf
				text = qs(0xf7723015)
			}
			{
				func = 0x71039a5f
				text = qs(0x23b6e962)
			}
		]}
endscript

script 0xca8a1e65 
	destroy_popup_warning_menu
endscript

script 0x5749bbbf 
	0x31a98615
endscript

script 0x71039a5f 
	0xbd306dc1
endscript

script 0x31a98615 
	generic_event_back
endscript
