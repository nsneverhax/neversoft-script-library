
script ui_create_trophy_warning 
	RequireParams \{[
			freespacerequired
		]
		all}
	freespacerequiredkb = (<freespacerequired> / 1024)
	freespacerequiredmb = (<freespacerequiredkb> / 1024)
	Mod a = <freespacerequiredkb> b = 1024
	if (<Mod> > 0)
		freespacerequiredmb = (<freespacerequiredmb> + 1)
	endif
	formatText TextName = text qs(0xad93f523) d = <freespacerequiredmb>
	create_dialog_box {
		body_text = <text>
		player_device = <device_num>
		no_background
	}
endscript

script ui_destroy_trophy_warning 
endscript
