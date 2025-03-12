text_enable_min_scale = 1
font_scaling = {
	`default` = {
		min_scale = 0.45000002
	}
	fontgrid_text_a3 = {
		min_scale = 0.18
	}
	fontgrid_text_a1 = {
		min_scale = 0.38000003
	}
	fontgrid_title_a1 = {
		min_scale = 0.28
	}
	buttons_x360 = {
		min_scale = 0.65000004
	}
	buttonsps3 = {
		min_scale = 0.75
	}
}

script test_font_scales 
	destroyscreenelement \{id = test_font_scales_container}
	createscreenelement \{id = test_font_scales_container
		parent = root_window
		type = vmenu
		just = [
			left
			top
		]
		pos = (100.0, 50.0)
		dims = (100.0, 100.0)
		z_priority = 10000}
	foreachin \{structure = $font_scaling
		do = test_font_scales_element
		pass_index}
endscript

script test_font_scales_element 
	if (<foreachin_name> = `default`)
		return
	endif
	createscreenelement {
		parent = test_font_scales_container
		type = textblockelement
		dims = (150.0, 50.0)
		font = <foreachin_name>
		text = qs(0x3859638d)
		fit_width = `scale each line to fit`
		fit_height = `scale down if larger`
		tags = {debug_me}
	}
endscript
