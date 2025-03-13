
script ui_create_trophy_warning 
	trophy_size = 55
	formattext textname = text qs(0xcadadc81) d = <trophy_size>
	create_popup_warning_menu {
		textblock = {
			text = <text>
			dims = (600.0, 400.0)
			scale = 0.6
		}
		player_device = <device_num>
		no_background
		menu_pos = (640.0, 480.0)
	}
endscript

script ui_destroy_trophy_warning 
endscript
