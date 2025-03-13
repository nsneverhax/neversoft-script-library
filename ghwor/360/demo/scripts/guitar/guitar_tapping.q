
script show_tapping_text 
	if screenelementexists \{id = tapping_text}
		destroyscreenelement \{id = tapping_text}
	endif
	createscreenelement \{type = textelement
		id = tapping_text
		parent = root_window
		font = fontgrid_text_a1
		just = [
			center
			center
		]
		scale = 1.0
		rgba = [
			255
			255
			255
			255
		]
		pos = (640.0, 265.0)
		z_priority = 10
		text = qs(0xc9373a79)}
	fit_text_in_rectangle id = <id> dims = (150.0, 50.0)
endscript

script remove_tapping_text 
	if screenelementexists \{id = tapping_text}
		destroyscreenelement \{id = tapping_text}
	endif
endscript
