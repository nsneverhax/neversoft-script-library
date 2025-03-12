
script ui_create_trophy_warning 
	requireparams \{[
			freespacerequired
		]
		all}
	freespacerequiredkb = (<freespacerequired> / 1024)
	freespacerequiredmb = (<freespacerequiredkb> / 1024)
	mod a = <freespacerequiredkb> b = 1024
	if (<mod> > 0)
		freespacerequiredmb = (<freespacerequiredmb> + 1)
	endif
	formattext textname = text qs(0xad93f523) d = <freespacerequiredmb>
	create_dialog_box {
		body_text = <text>
		player_device = <device_num>
		no_background
	}
endscript

script ui_destroy_trophy_warning 
endscript
