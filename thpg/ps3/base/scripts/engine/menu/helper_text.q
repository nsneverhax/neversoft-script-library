
script create_helper_text {anchor_id = helper_text_anchor
		parent = root_window
		helper_pos = (640.0, 720.0)
		spacing_between = 3
		bg_rgba = [45 45 45 255]
		z_priority = 5000
		font = text_a1
		scale = (2.0, 1.5)
	}
	if objectexists id = <anchor_id>
		destroyscreenelement id = <anchor_id>
	endif
	createscreenelement {
		type = containerelement
		parent = <parent>
		id = <anchor_id>
		just = [center bottom]
		pos = <helper_pos>
		dims = (1280.0, 720.0)
		rot_angle = -0.125
	}
	if NOT gotparam no_bar
		createscreenelement {
			type = spriteelement
			parent = <anchor_id>
			texture = white2
			pos = <helper_pos>
			just = [center bottom]
			rgba = <bg_rgba>
			dims = (1280.0, 72.0)
			z_priority = (<z_priority> -1)
		}
	endif
	createscreenelement {
		type = hmenu
		parent = <anchor_id>
		pos = (<helper_pos> - (0.0, 36.0))
		just = [center bottom]
		internal_just = [center center]
		padding_scale = 1.1
		spacing_between = <spacing_between>
		scale = <scale>
	}
	<menu_id> = <id>
	if gotparam helper_text_elements
		foreachin <helper_text_elements> do = helper_text_update_element params = {font = <font> menu_id = <menu_id> z_priority = <z_priority>}
	endif
endscript

script helper_text_update_element 
	if gotparam id
		if objectexists <id>
			setscreenelementprops {
				id = <id>
				text = <text>
			}
			return
		endif
	endif
	getlowercasestring <text>
	createscreenelement {
		type = textelement
		parent = <menu_id>
		id = <id>
		font = <font>
		text = <lowercasestring>
		rgba = [180 180 180 255]
		scale = (0.35000002, 0.4)
		z_priority = <z_priority>
		not_focusable
	}
endscript
generic_helper_text = {
	helper_text_elements = [
		{
			text = "\\m1 BACK"
		}
		{
			text = "\\m0 ACCEPT"
		}
	]
}
generic_helper_text_no_back = {
	helper_text_elements = [
		{
			text = "\\m0 ACCEPT"
		}
	]
}
generic_helper_text_no_accept = {
	helper_text_elements = [
		{
			text = "\\m1 BACK"
		}
	]
}
generic_helper_text_cas = {
	helper_text_elements = [
		{
			text = "\\m1 BACK"
		}
		{
			text = "\\m0 ACCEPT"
		}
		{
			text = "\\be/\\bf ROTATE"
		}
	]
}
generic_helper_text_cas_z = {
	helper_text_elements = [
		{
			text = "\\m1 BACK"
		}
		{
			text = "\\m0 ACCEPT"
		}
		{
			text = "\\be/\\bf ROTATE"
		}
		{
			text = "\\mj ZOOM OUT"
		}
	]
}
generic_helper_text_cas_z_no_rotate = {
	helper_text_elements = [
		{
			text = "\\m1 BACK"
		}
		{
			text = "\\m0 ACCEPT"
		}
		{
			text = "\\mj ZOOM OUT"
		}
	]
}
generic_helper_text_left_right = {
	helper_text_elements = [
		{
			text = "\\m1 BACK"
		}
		{
			text = "\\m0 ACCEPT"
		}
	]
}
generic_helper_text_left_right_no_back = {
	helper_text_elements = [
		{
			text = "\\m0 ACCEPT"
		}
	]
}
generic_helper_text_up_down_left_right = {
	helper_text_elements = [
		{
			text = "\\m1 BACK"
		}
		{
			text = "\\m0 ACCEPT"
		}
	]
}
generic_helper_text_left_right_up_down = {
	helper_text_elements = [
		{
			text = "\\m1 BACK"
		}
		{
			text = "\\m0 ACCEPT"
		}
	]
}
generic_helper_text_color_menu = {
	helper_text_elements = [
		{
			text = "\\b7/\\b4 Select"
		}
		{
			text = "\\b6/\\b5 Adjust"
		}
		{
			text = "\\m1 BACK"
		}
		{
			text = "\\be/\\bf ROTATE"
		}
	]
}
generic_helper_text_color_menu_z_no_rotate = {
	helper_text_elements = [
		{
			text = "\\b7/\\b4 Select"
		}
		{
			text = "\\b6/\\b5 Adjust"
		}
		{
			text = "\\m1 BACK"
		}
	]
}
generic_helper_text_color_menu_z = {
	helper_text_elements = [
		{
			text = "\\b7/\\b4 Select"
		}
		{
			text = "\\b6/\\b5 Adjust"
		}
		{
			text = "\\m1 BACK"
		}
		{
			text = "\\be/\\bf ROTATE"
		}
		{
			text = "\\mj ZOOM OUT"
		}
	]
}
generic_helper_text_color_menu_reset = {
	helper_text_elements = [
		{
			text = "\\m1 BACK"
		}
		{
			text = "\\be/\\bf ROTATE"
		}
		{
			text = "\\mn RESET"
		}
		{
			text = "\\mj ZOOM"
		}
	]
}
generic_dialog_helper_text = {
	helper_text_elements = [
		{
			text = "\\m0 ACCEPT"
		}
	]
}
generic_dialog_helper_text2 = {
	helper_text_elements = [
		{
			text = "\\m0 ACCEPT"
		}
	]
}
generic_dialog_helper_text3 = {
	helper_text_elements = [
		{
			text = "\\m1 BACK"
		}
		{
			text = "\\m0 ACCEPT"
		}
	]
}
