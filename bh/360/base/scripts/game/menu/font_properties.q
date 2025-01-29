Default_Font_Colors = [
	[
		200
		200
		200
		255
	]
	[
		180
		80
		80
		255
	]
	[
		80
		120
		180
		255
	]
	[
		80
		180
		120
		255
	]
	[
		180
		140
		60
		255
	]
	[
		200
		100
		40
		255
	]
	[
		140
		100
		180
		255
	]
	[
		0
		180
		180
		255
	]
	[
		0
		0
		0
		255
	]
	[
		40
		40
		40
		255
	]
	[
		90
		90
		90
		255
	]
	[
		140
		140
		140
		255
	]
	[
		157
		44
		115
		255
	]
	[
		151
		68
		85
		255
	]
	[
		55
		116
		61
		255
	]
	[
		185
		171
		71
		255
	]
]
font_properties = {
	color_override_table = $Default_Font_Colors
	names = {
		debug = {
			use_non_proportional_numbers = true
			is_debug_font = true
		}
		buttons_x360 = {
			is_button_font = true
		}
		ButtonsPs3 = {
			is_button_font = true
		}
	}
}
text_enable_min_scale = 1
font_scaling = {
	Default = {
		min_scale = 0.45000002
	}
	fontgrid_text_A3 = {
		min_scale = 0.18
	}
	fontgrid_text_A1 = {
		min_scale = 0.38000003
	}
	fontgrid_title_a1 = {
		min_scale = 0.28
	}
	buttons_x360 = {
		min_scale = 0.65000004
	}
	ButtonsPs3 = {
		min_scale = 0.75
	}
}

script test_font_scales 
	DestroyScreenElement \{id = test_font_scales_container}
	CreateScreenElement \{id = test_font_scales_container
		parent = root_window
		type = vmenu
		just = [
			left
			top
		]
		Pos = (100.0, 50.0)
		dims = (100.0, 100.0)
		z_priority = 10000}
	ForEachIn \{structure = $font_scaling
		do = test_font_scales_element
		pass_index}
endscript

script test_font_scales_element 
	if (<foreachin_name> = Default)
		return
	endif
	CreateScreenElement {
		parent = test_font_scales_container
		type = TextBlockElement
		dims = (150.0, 50.0)
		font = <foreachin_name>
		text = qs(0x3859638d)
		fit_width = `scale	each	line	to	fit`
		fit_height = `scale	down	if	larger`
		tags = {debug_me}
	}
endscript
