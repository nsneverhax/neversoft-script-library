
script ui_create_trophy_warning 
	RequireParams \{[
			freeSpaceRequired
		]
		all}
	freeSpaceRequiredKB = (<freeSpaceRequired> / 1024)
	freeSpaceRequiredMB = (<freeSpaceRequiredKB> / 1024)
	Mod a = <freeSpaceRequiredKB> b = 1024
	if (<Mod> > 0)
		freeSpaceRequiredMB = (<freeSpaceRequiredMB> + 1)
	endif
	FormatText TextName = text qs(0xad93f523) d = <freeSpaceRequiredMB>
	create_dialog_box {
		body_text = <text>
		player_device = <device_num>
		no_background
	}
endscript

script ui_destroy_trophy_warning 
endscript
