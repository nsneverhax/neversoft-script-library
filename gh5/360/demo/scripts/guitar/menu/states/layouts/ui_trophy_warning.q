
script ui_create_trophy_warning 
	trophy_size = 55
	formattext textname = text qs(0x5b30c060) d = <trophy_size>
	create_dialog_box {
		body_text = <text>
		player_device = <device_num>
		no_background
	}
endscript

script ui_destroy_trophy_warning 
endscript
