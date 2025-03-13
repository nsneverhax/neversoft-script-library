cas_max_layers = 32
color_bar_scale = (2.4, 2.0)
color_bar_focus_rgba = [
	200
	200
	200
	255
]
color_bar_unfocus_rgba = [
	200
	200
	200
	128
]
color_bar_pos = (300.0, 0.0)
color_text_pos = (200.0, 0.0)
color_arrow_pos_up = (300.0, 13.0)
color_arrow_pos_down = (300.0, -10.0)
color_arrow_rgba = [
	100
	90
	80
	255
]
color_nowrap_arrow_left = -80.0
color_nowrap_arrow_right = 80.0
color_wrap_arrow_left = -80.0
color_wrap_arrow_right = 80.0
color_arrow_scale = 0.5
color_min_alpha = 0.0
color_max_alpha = 100.0
max_trans = 100.0
min_trans = -100.0
max_skew = 75.0
min_skew = -75.0
max_rot = 6283.0
min_rot = 0.0
max_scale = 150.0
min_scale = 1.0
scale_increment = 1.0
trans_increment = 1.0
skew_increment = 3.0
rot_increment = 30.0
color_alpha_increment = 5
default_cap_alpha = 100
default_cap_scale = 100
default_cap_trans = 0
default_cap_rot = 0
default_cap_skew = 0
default_cap_red = 250
default_cap_green = 250
default_cap_blue = 250

script cap_artist_layer_edit 
	requireparams \{[
			part
			section
			mask_index
		]
		all}
	mask = (<section>.mask)
	if NOT structurecontains structure = ((<mask>) [<mask_index>]) no_color
		cap_get_current_rgb section = <section> part = <part> mask_index = <mask_index>
		colorwheel_add_item {
			scale = 0.7
			pos = (75.0, 0.0)
			dims = (550.0, 525.0)
			pad_choose_script = unfocus_color_wheel
			pad_choose_params = {part = <part>}
			increment_focus_script = cap_artist_colorwheel_focus_change
			increment_focus_params = {section = <section> part = <part> mask_index = <mask_index>}
			initial_rgb = <rgb>
			lookup_table = <color_wheel>
			special_exit_script = restore_color_initial
			special_exit_params = {part = <part> add_script = cap_artist_colorwheel_focus_change add_params = {color = <rgb> section = <section> part = <part> mask_index = <mask_index>}}
			special_choose_script = widget_init_cap
		}
	endif
	if NOT structurecontains structure = ((<mask>) [<mask_index>]) no_alpha
		get_cap part = <part> section = <section> mask_index = <mask_index>
		a = ($default_cap_alpha)
		if gotparam \{pre_layer}
			if structurecontains structure = <pre_layer> a
				a = (<pre_layer>.a)
			endif
		elseif gotparam \{post_layer}
			if structurecontains structure = <post_layer> a
				a = (<post_layer>.a)
			endif
		endif
		button_widget_add_item {
			widget_id = alpha_widget
			text = qs(0x3d6d9684)
			button_icon = widget_transparency
			start_value = <a>
			min = ($color_min_alpha)
			max = ($color_max_alpha)
			step = ($color_alpha_increment)
			pad_up_script = cap_layer_set_alpha
			pad_up_params = {section = <section> part = <part> mask_index = <mask_index> pre_layer = <pre_layer> post_layer = <post_layer>}
			pad_down_script = cap_layer_set_alpha
			pad_down_params = {section = <section> part = <part> mask_index = <mask_index> pre_layer = <pre_layer> post_layer = <post_layer>}
			fill_type = `bottom to top`
			<no_cas_handlers>
			deinit_script = widget_accept_cap
			init_script = widget_init_cap
			accept_script = widget_accept_cap
			camera_list = <camera_list>
			zoom_camera = <zoom_camera>
		}
	endif
	if NOT structurecontains structure = ((<mask>) [<mask_index>]) no_scale
		get_cap part = <part> section = <section> mask_index = <mask_index>
		x_scale = ($default_cap_scale)
		if gotparam \{pre_layer}
			if structurecontains structure = <pre_layer> x_scale
				x_scale = (<pre_layer>.x_scale)
			endif
		elseif gotparam \{post_layer}
			if structurecontains structure = <post_layer> x_scale
				x_scale = (<post_layer>.x_scale)
			endif
		endif
		button_widget_add_item {
			widget_id = x_scale_widget
			text = qs(0x52052a00)
			button_icon = widget_uni_scale
			start_value = <x_scale>
			min = ($min_scale)
			max = ($max_scale)
			step = ($scale_increment)
			pad_left_script = cap_layer_set_x_scale
			pad_left_params = {section = <section> part = <part> mask_index = <mask_index> pre_layer = <pre_layer> post_layer = <post_layer>}
			pad_right_script = cap_layer_set_x_scale
			pad_right_params = {section = <section> part = <part> mask_index = <mask_index> pre_layer = <pre_layer> post_layer = <post_layer>}
			fill_type = `center left/right`
			icon_rot = 90
			<no_cas_handlers>
			deinit_script = widget_accept_cap
			init_script = widget_init_cap
			accept_script = widget_accept_cap
			camera_list = <camera_list>
			zoom_camera = <zoom_camera>
		}
		get_cap part = <part> section = <section> mask_index = <mask_index>
		y_scale = ($default_cap_scale)
		if gotparam \{pre_layer}
			if structurecontains structure = <pre_layer> y_scale
				y_scale = (<pre_layer>.y_scale)
			endif
		elseif gotparam \{post_layer}
			if structurecontains structure = <post_layer> y_scale
				y_scale = (<post_layer>.y_scale)
			endif
		endif
		button_widget_add_item {
			widget_id = y_scale_widget
			text = qs(0xea1fd0c6)
			button_icon = widget_uni_scale
			start_value = <y_scale>
			min = ($min_scale)
			max = ($max_scale)
			step = ($scale_increment)
			pad_up_script = cap_layer_set_y_scale
			pad_up_params = {section = <section> part = <part> mask_index = <mask_index> pre_layer = <pre_layer> post_layer = <post_layer>}
			pad_down_script = cap_layer_set_y_scale
			pad_down_params = {section = <section> part = <part> mask_index = <mask_index> pre_layer = <pre_layer> post_layer = <post_layer>}
			fill_type = `center up/down`
			<no_cas_handlers>
			deinit_script = widget_accept_cap
			init_script = widget_init_cap
			accept_script = widget_accept_cap
			camera_list = <camera_list>
			zoom_camera = <zoom_camera>
		}
	endif
	if NOT structurecontains structure = ((<mask>) [<mask_index>]) no_translate
		get_cap part = <part> section = <section> mask_index = <mask_index>
		x_trans = ($default_cap_trans)
		if gotparam \{pre_layer}
			if structurecontains structure = <pre_layer> x_trans
				x_trans = (<pre_layer>.x_trans)
			endif
		elseif gotparam \{post_layer}
			if structurecontains structure = <post_layer> x_trans
				x_trans = (<post_layer>.x_trans)
			endif
		endif
		button_widget_add_item {
			widget_id = x_trans_widget
			text = qs(0xc261e706)
			button_icon = widget_uni_move
			start_value = <x_trans>
			min = ($min_trans)
			max = ($max_trans)
			step = ($trans_increment)
			pad_left_script = cap_layer_set_x_trans
			pad_left_params = {section = <section> part = <part> mask_index = <mask_index> pre_layer = <pre_layer> post_layer = <post_layer>}
			pad_right_script = cap_layer_set_x_trans
			pad_right_params = {section = <section> part = <part> mask_index = <mask_index> pre_layer = <pre_layer> post_layer = <post_layer>}
			fill_type = `center left/right`
			icon_rot = 90
			<no_cas_handlers>
			deinit_script = widget_accept_cap
			init_script = widget_init_cap
			accept_script = widget_accept_cap
			camera_list = <camera_list>
			zoom_camera = <zoom_camera>
		}
		get_cap part = <part> section = <section> mask_index = <mask_index>
		y_trans = ($default_cap_trans)
		if gotparam \{pre_layer}
			if structurecontains structure = <pre_layer> y_trans
				y_trans = (<pre_layer>.x_scale)
			endif
		elseif gotparam \{post_layer}
			if structurecontains structure = <post_layer> y_trans
				y_trans = (<post_layer>.y_trans)
			endif
		endif
		button_widget_add_item {
			widget_id = y_trans_widget
			text = qs(0xbc37bc4e)
			button_icon = widget_uni_move
			start_value = <y_trans>
			min = ($min_trans)
			max = ($max_trans)
			step = ($trans_increment)
			pad_up_script = cap_layer_set_y_trans
			pad_up_params = {section = <section> part = <part> mask_index = <mask_index> pre_layer = <pre_layer> post_layer = <post_layer>}
			pad_down_script = cap_layer_set_y_trans
			pad_down_params = {section = <section> part = <part> mask_index = <mask_index> pre_layer = <pre_layer> post_layer = <post_layer>}
			fill_type = `center up/down`
			<no_cas_handlers>
			deinit_script = widget_accept_cap
			init_script = widget_init_cap
			accept_script = widget_accept_cap
			camera_list = <camera_list>
			zoom_camera = <zoom_camera>
		}
	endif
	if NOT structurecontains structure = ((<mask>) [<mask_index>]) no_skew
		get_cap part = <part> section = <section> mask_index = <mask_index>
		x_skew = ($default_cap_skew)
		if gotparam \{pre_layer}
			if structurecontains structure = <pre_layer> x_skew
				x_skew = (<pre_layer>.x_skew)
			endif
		elseif gotparam \{post_layer}
			if structurecontains structure = <post_layer> x_skew
				x_skew = (<post_layer>.x_skew)
			endif
		endif
		button_widget_add_item {
			widget_id = x_skew_widget
			text = qs(0xc432bf92)
			button_icon = widget_shear
			start_value = <x_skew>
			min = ($min_skew)
			max = ($max_skew)
			step = ($skew_increment)
			pad_left_script = cap_layer_set_x_skew
			pad_left_params = {section = <section> part = <part> mask_index = <mask_index> pre_layer = <pre_layer> post_layer = <post_layer>}
			pad_right_script = cap_layer_set_x_skew
			pad_right_params = {section = <section> part = <part> mask_index = <mask_index> pre_layer = <pre_layer> post_layer = <post_layer>}
			fill_type = `center left/right`
			<no_cas_handlers>
			deinit_script = widget_accept_cap
			init_script = widget_init_cap
			accept_script = widget_accept_cap
			camera_list = <camera_list>
			zoom_camera = <zoom_camera>
		}
		get_cap part = <part> section = <section> mask_index = <mask_index>
		y_skew = ($default_cap_skew)
		if gotparam \{pre_layer}
			if structurecontains structure = <pre_layer> y_skew
				y_skew = (<pre_layer>.y_skew)
			endif
		elseif gotparam \{post_layer}
			if structurecontains structure = <post_layer> y_skew
				y_skew = (<post_layer>.y_skew)
			endif
		endif
		button_widget_add_item {
			widget_id = y_skew_widget
			text = qs(0x5ee97771)
			button_icon = widget_shear
			start_value = <y_skew>
			min = ($min_skew)
			max = ($max_skew)
			step = ($skew_increment)
			pad_up_script = cap_layer_set_y_skew
			pad_up_params = {section = <section> part = <part> mask_index = <mask_index> pre_layer = <pre_layer> post_layer = <post_layer>}
			pad_down_script = cap_layer_set_y_skew
			pad_down_params = {section = <section> part = <part> mask_index = <mask_index> pre_layer = <pre_layer> post_layer = <post_layer>}
			fill_type = `center up/down`
			icon_rot = 90
			<no_cas_handlers>
			deinit_script = widget_accept_cap
			init_script = widget_init_cap
			accept_script = widget_accept_cap
			camera_list = <camera_list>
			zoom_camera = <zoom_camera>
		}
	endif
	if NOT structurecontains structure = ((<mask>) [<mask_index>]) no_rotate
		get_cap part = <part> section = <section> mask_index = <mask_index>
		rot = ($default_cap_rot)
		if gotparam \{pre_layer}
			if structurecontains structure = <pre_layer> rot
				rot = (<pre_layer>.rot)
			endif
		elseif gotparam \{post_layer}
			if structurecontains structure = <post_layer> rot
				rot = (<post_layer>.rot)
			endif
		endif
		rot_widget_add_item {
			widget_id = rot_widget
			text = qs(0x63e34942)
			button_icon = widget_rotate
			start_value = <rot>
			min = ($min_rot)
			max = ($max_rot)
			step = ($rot_increment)
			pad_up_script = cap_layer_set_rot
			pad_up_params = {section = <section> part = <part> mask_index = <mask_index> pre_layer = <pre_layer> post_layer = <post_layer>}
			pad_down_script = cap_layer_set_rot
			pad_down_params = {section = <section> part = <part> mask_index = <mask_index> pre_layer = <pre_layer> post_layer = <post_layer>}
			fill_type = `counter clockwise`
			wrap
			sweep
			<no_cas_handlers>
			deinit_script = widget_accept_cap
			init_script = widget_init_cap
			accept_script = widget_accept_cap
			camera_list = <camera_list>
			zoom_camera = <zoom_camera>
		}
		rotate_widget_set_value widget_id = rot_widget new_value = <rot>
	endif
	add_car_menu_icon_item {
		icon = widget_default
		text = qs(0x675459e3)
		pad_choose_sound = ui_menu_select_sfx
		pad_choose_script = reset_to_default
		pad_choose_params = {part = <part> section = <section> mask_index = <mask_index>}
		not_focusable = <not_focusable>
		scale_highlight_text = 0
	}
endscript

script edit_cas_layer 
	requireparams \{[
			part
			cap_index
			layer_index
		]
		all}
	if NOT structurecontains structure = <mask> no_color
		if ($cas_override_object = none)
			pass_back_camera = 1
		endif
		add_car_menu_icon_item {
			icon = widget_color
			text = qs(0x6149aa3d)
			choose_state = uistate_cap_color_wheel
			choose_state_data = {part = <part> cap_index = <cap_index> layer_index = <layer_index> color_wheel = <color_wheel> camera_list = <camera_list> zoom_camera = <zoom_camera> pass_back_camera = <pass_back_camera>}
		}
	endif
	if NOT structurecontains structure = <mask> no_alpha
		getlayer part = <part> cap_index = <cap_index> layer_index = <layer_index>
		if structurecontains structure = <layer> a
			a = (<layer>.a)
		else
			a = ($default_cap_alpha)
		endif
		button_widget_add_item {
			widget_id = alpha_widget
			text = qs(0x3d6d9684)
			button_icon = widget_transparency
			start_value = <a>
			min = ($color_min_alpha)
			max = ($color_max_alpha)
			step = ($color_alpha_increment)
			pad_up_script = cap_layer_set_alpha
			pad_up_params = {part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>}
			pad_down_script = cap_layer_set_alpha
			pad_down_params = {part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>}
			fill_type = `bottom to top`
			<no_cas_handlers>
			deinit_script = widget_accept_cap
			deinit_params = {part = <part>}
			init_script = widget_init_cap
			init_params = {part = <part>}
			accept_script = widget_accept_cap
			accept_params = {part = <part>}
			camera_list = <camera_list>
			zoom_camera = <zoom_camera>
		}
	endif
	if NOT structurecontains structure = <mask> no_scale
		getlayer part = <part> cap_index = <cap_index> layer_index = <layer_index>
		if structurecontains structure = <layer> x_scale
			x_scale = (<layer>.x_scale)
		else
			x_scale = ($default_cap_scale)
		endif
		button_widget_add_item {
			widget_id = x_scale_widget
			text = qs(0x52052a00)
			button_icon = widget_uni_scale
			start_value = <x_scale>
			min = ($min_scale)
			max = ($max_scale)
			step = ($scale_increment)
			pad_left_script = cap_layer_set_x_scale
			pad_left_params = {part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>}
			pad_right_script = cap_layer_set_x_scale
			pad_right_params = {part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>}
			fill_type = `center left/right`
			icon_rot = 90
			<no_cas_handlers>
			deinit_script = widget_accept_cap
			deinit_params = {part = <part>}
			init_script = widget_init_cap
			init_params = {part = <part>}
			accept_script = widget_accept_cap
			accept_params = {part = <part>}
			camera_list = <camera_list>
			zoom_camera = <zoom_camera>
		}
		getlayer part = <part> cap_index = <cap_index> layer_index = <layer_index>
		if structurecontains structure = <layer> y_scale
			y_scale = (<layer>.y_scale)
		else
			y_scale = ($default_cap_scale)
		endif
		button_widget_add_item {
			widget_id = y_scale_widget
			text = qs(0xea1fd0c6)
			button_icon = widget_uni_scale
			start_value = <y_scale>
			min = ($min_scale)
			max = ($max_scale)
			step = ($scale_increment)
			pad_up_script = cap_layer_set_y_scale
			pad_up_params = {part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>}
			pad_down_script = cap_layer_set_y_scale
			pad_down_params = {part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>}
			fill_type = `center up/down`
			<no_cas_handlers>
			deinit_script = widget_accept_cap
			deinit_params = {part = <part>}
			init_script = widget_init_cap
			init_params = {part = <part>}
			accept_script = widget_accept_cap
			accept_params = {part = <part>}
			camera_list = <camera_list>
			zoom_camera = <zoom_camera>
		}
	endif
	if NOT structurecontains structure = <mask> no_translate
		getlayer part = <part> cap_index = <cap_index> layer_index = <layer_index>
		if structurecontains structure = <layer> x_trans
			x_trans = (<layer>.x_trans)
		else
			x_trans = ($default_cap_trans)
		endif
		if structurecontains structure = <layer> y_trans
			y_trans = (<layer>.y_trans)
		else
			y_trans = ($default_cap_trans)
		endif
		horiz_param = {
			widget_id = x_trans_widget
			pad_left_script = cap_layer_set_x_trans
			pad_right_script = cap_layer_set_x_trans
			start_value = <x_trans>
		}
		vert_param = {
			widget_id = y_trans_widget
			pad_up_script = cap_layer_set_y_trans
			pad_down_script = cap_layer_set_y_trans
			start_value = <y_trans>
		}
		if structurecontains structure = <section> ui_rotated_90
			horiz_param = {
				widget_id = y_trans_widget
				pad_left_script = cap_layer_set_y_trans
				pad_right_script = cap_layer_set_y_trans
				start_value = <y_trans>
				invert
			}
			vert_param = {
				widget_id = x_trans_widget
				pad_up_script = cap_layer_set_x_trans
				pad_down_script = cap_layer_set_x_trans
				start_value = <x_trans>
			}
		elseif structurecontains structure = <section> ui_rotated_180
			horiz_param = {
				<horiz_param>
				invert
			}
			vert_param = {
				<vert_param>
				invert
			}
		elseif structurecontains structure = <section> ui_rotated_270
			horiz_param = {
				widget_id = y_trans_widget
				pad_left_script = cap_layer_set_y_trans
				pad_right_script = cap_layer_set_y_trans
				start_value = <y_trans>
			}
			vert_param = {
				widget_id = x_trans_widget
				pad_up_script = cap_layer_set_x_trans
				pad_down_script = cap_layer_set_x_trans
				start_value = <x_trans>
				invert
			}
		endif
		button_widget_add_item {
			text = qs(0xc261e706)
			button_icon = widget_uni_move
			min = ($min_trans)
			max = ($max_trans)
			step = ($trans_increment)
			pad_left_params = {part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>}
			pad_right_params = {part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>}
			fill_type = `center left/right`
			icon_rot = 90
			<no_cas_handlers>
			deinit_script = widget_accept_cap
			deinit_params = {part = <part>}
			init_script = widget_init_cap
			init_params = {part = <part>}
			accept_script = widget_accept_cap
			accept_params = {part = <part>}
			camera_list = <camera_list>
			zoom_camera = <zoom_camera>
			<horiz_param>
		}
		button_widget_add_item {
			text = qs(0xbc37bc4e)
			button_icon = widget_uni_move
			min = ($min_trans)
			max = ($max_trans)
			step = ($trans_increment)
			pad_up_params = {part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>}
			pad_down_params = {part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>}
			fill_type = `center up/down`
			<no_cas_handlers>
			deinit_script = widget_accept_cap
			deinit_params = {part = <part>}
			init_script = widget_init_cap
			init_params = {part = <part>}
			accept_script = widget_accept_cap
			accept_params = {part = <part>}
			camera_list = <camera_list>
			zoom_camera = <zoom_camera>
			<vert_param>
		}
	endif
	if NOT structurecontains structure = <mask> no_skew
		getlayer part = <part> cap_index = <cap_index> layer_index = <layer_index>
		if structurecontains structure = <layer> x_skew
			x_skew = (<layer>.x_skew)
		else
			x_skew = ($default_cap_skew)
		endif
		button_widget_add_item {
			widget_id = x_skew_widget
			text = qs(0xc432bf92)
			button_icon = widget_shear
			start_value = <x_skew>
			min = ($min_skew)
			max = ($max_skew)
			step = ($skew_increment)
			pad_left_script = cap_layer_set_x_skew
			pad_left_params = {part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>}
			pad_right_script = cap_layer_set_x_skew
			pad_right_params = {part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>}
			fill_type = `center left/right`
			<no_cas_handlers>
			deinit_script = widget_accept_cap
			deinit_params = {part = <part>}
			init_script = widget_init_cap
			init_params = {part = <part>}
			accept_script = widget_accept_cap
			accept_params = {part = <part>}
			camera_list = <camera_list>
			zoom_camera = <zoom_camera>
		}
		getlayer part = <part> cap_index = <cap_index> layer_index = <layer_index>
		if structurecontains structure = <layer> y_skew
			y_skew = (<layer>.y_skew)
		else
			y_skew = ($default_cap_skew)
		endif
		button_widget_add_item {
			widget_id = y_skew_widget
			text = qs(0x5ee97771)
			button_icon = widget_shear
			start_value = <y_skew>
			min = ($min_skew)
			max = ($max_skew)
			step = ($skew_increment)
			pad_up_script = cap_layer_set_y_skew
			pad_up_params = {part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>}
			pad_down_script = cap_layer_set_y_skew
			pad_down_params = {part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>}
			fill_type = `center up/down`
			icon_rot = 90
			<no_cas_handlers>
			deinit_script = widget_accept_cap
			deinit_params = {part = <part>}
			init_script = widget_init_cap
			init_params = {part = <part>}
			accept_script = widget_accept_cap
			accept_params = {part = <part>}
			camera_list = <camera_list>
			zoom_camera = <zoom_camera>
		}
	endif
	if NOT structurecontains structure = <mask> no_rotate
		getlayer part = <part> cap_index = <cap_index> layer_index = <layer_index>
		if structurecontains structure = <layer> rot
			rot = (<layer>.rot)
		else
			rot = ($default_cap_rot)
		endif
		rot_widget_add_item {
			widget_id = rot_widget
			text = qs(0x63e34942)
			button_icon = widget_rotate
			start_value = <rot>
			min = ($min_rot)
			max = ($max_rot)
			step = ($rot_increment)
			pad_up_script = cap_layer_set_rot
			pad_up_params = {part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>}
			pad_down_script = cap_layer_set_rot
			pad_down_params = {part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>}
			fill_type = `counter clockwise`
			wrap
			sweep
			<no_cas_handlers>
			deinit_script = widget_accept_cap
			deinit_params = {part = <part>}
			init_script = widget_init_cap
			init_params = {part = <part>}
			accept_script = widget_accept_cap
			accept_params = {part = <part>}
			camera_list = <camera_list>
			zoom_camera = <zoom_camera>
		}
		rotate_widget_set_value widget_id = rot_widget new_value = <rot>
	endif
	if NOT structurecontains structure = <mask> no_u_flip
		if is_flip_layer_horizontal part = <part> cap_index = <cap_index> layer_index = <layer_index>
			horiz_on = true
		endif
		add_car_menu_icon_item {
			id = flip_horiz_widget
			icon = widget_flip
			text = qs(0xc619fe8a)
			pad_choose_sound = ui_menu_select_sfx
			pad_choose_script = flip_layer_horizontal
			pad_choose_params = {part = <part> cap_index = <cap_index> layer_index = <layer_index>}
			icon_rot = 90
			on = <horiz_on>
			font = fontgrid_title_a1
		}
	endif
	if NOT structurecontains structure = <mask> no_v_flip
		if is_flip_layer_vertical part = <part> cap_index = <cap_index> layer_index = <layer_index>
			vert_on = true
		endif
		add_car_menu_icon_item {
			id = flip_vert_widget
			icon = widget_flip
			text = qs(0x2916c9f2)
			pad_choose_sound = ui_menu_select_sfx
			pad_choose_script = flip_layer_vertical
			pad_choose_params = {part = <part> cap_index = <cap_index> layer_index = <layer_index>}
			on = <vert_on>
			font = fontgrid_title_a1
		}
	endif
	add_car_menu_icon_item {
		icon = widget_default
		text = qs(0x675459e3)
		pad_choose_sound = ui_menu_select_sfx
		pad_choose_script = reset_layer_to_default
		pad_choose_params = {mask = <mask> part = <part> cap_index = <cap_index> layer_index = <layer_index> section = <section> mask = <mask>}
	}
endscript

script cap_layer_set_alpha 
	casttointeger \{value}
	if gotparam \{pre_layer}
		get_cap part = <part> section = <section> mask_index = <mask_index>
		pre_layer = {<pre_layer>
			a = <value>}
		set_cap part = <part> section = <section> pre_layer = <pre_layer> mask_index = <mask_index>
	endif
	if gotparam \{post_layer}
		get_cap part = <part> section = <section> mask_index = <mask_index>
		post_layer = {<post_layer>
			a = <value>}
		set_cap part = <part> section = <section> post_layer = <post_layer> mask_index = <mask_index>
	endif
	if gotparam \{layer}
		getlayer part = <part> cap_index = <cap_index> layer_index = <layer_index>
		layer = {<layer>
			a = <value>}
		setlayer part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>
	endif
endscript

script cap_layer_set_x_scale 
	casttointeger \{value}
	if gotparam \{pre_layer}
		get_cap part = <part> section = <section> mask_index = <mask_index>
		pre_layer = {<pre_layer>
			x_scale = <value>}
		set_cap part = <part> section = <section> pre_layer = <pre_layer> mask_index = <mask_index>
	endif
	if gotparam \{post_layer}
		get_cap part = <part> section = <section> mask_index = <mask_index>
		post_layer = {<post_layer>
			x_scale = <value>}
		set_cap part = <part> section = <section> post_layer = <post_layer> mask_index = <mask_index>
	endif
	if gotparam \{layer}
		getlayer part = <part> cap_index = <cap_index> layer_index = <layer_index>
		layer = {<layer>
			x_scale = <value>}
		setlayer part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>
	endif
endscript

script cap_layer_set_y_scale 
	casttointeger \{value}
	if gotparam \{pre_layer}
		get_cap part = <part> section = <section> mask_index = <mask_index>
		pre_layer = {<pre_layer>
			y_scale = <value>}
		set_cap part = <part> section = <section> pre_layer = <pre_layer> mask_index = <mask_index>
	endif
	if gotparam \{post_layer}
		get_cap part = <part> section = <section> mask_index = <mask_index>
		post_layer = {<post_layer>
			y_scale = <value>}
		set_cap part = <part> section = <section> post_layer = <post_layer> mask_index = <mask_index>
	endif
	if gotparam \{layer}
		getlayer part = <part> cap_index = <cap_index> layer_index = <layer_index>
		layer = {<layer>
			y_scale = <value>}
		setlayer part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>
	endif
endscript

script cap_layer_set_x_trans 
	casttointeger \{value}
	if gotparam \{pre_layer}
		get_cap part = <part> section = <section> mask_index = <mask_index>
		pre_layer = {<pre_layer>
			x_trans = <value>}
		set_cap part = <part> section = <section> pre_layer = <pre_layer> mask_index = <mask_index>
	endif
	if gotparam \{post_layer}
		get_cap part = <part> section = <section> mask_index = <mask_index>
		post_layer = {<post_layer>
			x_trans = <value>}
		set_cap part = <part> section = <section> post_layer = <post_layer> mask_index = <mask_index>
	endif
	if gotparam \{layer}
		getlayer part = <part> cap_index = <cap_index> layer_index = <layer_index>
		layer = {<layer>
			x_trans = <value>}
		setlayer part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>
	endif
endscript

script cap_layer_set_y_trans 
	casttointeger \{value}
	if gotparam \{pre_layer}
		get_cap part = <part> section = <section> mask_index = <mask_index>
		pre_layer = {<pre_layer>
			y_trans = <value>}
		set_cap part = <part> section = <section> pre_layer = <pre_layer> mask_index = <mask_index>
	endif
	if gotparam \{post_layer}
		get_cap part = <part> section = <section> mask_index = <mask_index>
		post_layer = {<post_layer>
			y_trans = <value>}
		set_cap part = <part> section = <section> post_layer = <post_layer> mask_index = <mask_index>
	endif
	if gotparam \{layer}
		getlayer part = <part> cap_index = <cap_index> layer_index = <layer_index>
		layer = {<layer>
			y_trans = <value>}
		setlayer part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>
	endif
endscript

script cap_layer_set_x_skew 
	casttointeger \{value}
	if gotparam \{pre_layer}
		get_cap part = <part> section = <section> mask_index = <mask_index>
		pre_layer = {<pre_layer>
			x_skew = <value>}
		set_cap part = <part> section = <section> pre_layer = <pre_layer> mask_index = <mask_index>
	endif
	if gotparam \{post_layer}
		get_cap part = <part> section = <section> mask_index = <mask_index>
		post_layer = {<post_layer>
			x_skew = <value>}
		set_cap part = <part> section = <section> post_layer = <post_layer> mask_index = <mask_index>
	endif
	if gotparam \{layer}
		getlayer part = <part> cap_index = <cap_index> layer_index = <layer_index>
		layer = {<layer>
			x_skew = <value>}
		setlayer part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>
	endif
endscript

script cap_layer_set_y_skew 
	casttointeger \{value}
	if gotparam \{pre_layer}
		get_cap part = <part> section = <section> mask_index = <mask_index>
		pre_layer = {<pre_layer>
			y_skew = <value>}
		set_cap part = <part> section = <section> pre_layer = <pre_layer> mask_index = <mask_index>
	endif
	if gotparam \{post_layer}
		get_cap part = <part> section = <section> mask_index = <mask_index>
		post_layer = {<post_layer>
			y_skew = <value>}
		set_cap part = <part> section = <section> post_layer = <post_layer> mask_index = <mask_index>
	endif
	if gotparam \{layer}
		getlayer part = <part> cap_index = <cap_index> layer_index = <layer_index>
		layer = {<layer>
			y_skew = <value>}
		setlayer part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>
	endif
endscript

script cap_layer_set_rot 
	casttointeger \{value}
	if gotparam \{pre_layer}
		get_cap part = <part> section = <section> mask_index = <mask_index>
		pre_layer = {<pre_layer>
			rot = <value>}
		set_cap part = <part> section = <section> pre_layer = <pre_layer> mask_index = <mask_index>
	endif
	if gotparam \{post_layer}
		get_cap part = <part> section = <section> mask_index = <mask_index>
		post_layer = {<post_layer>
			rot = <value>}
		set_cap part = <part> section = <section> post_layer = <post_layer> mask_index = <mask_index>
	endif
	if gotparam \{layer}
		getlayer part = <part> cap_index = <cap_index> layer_index = <layer_index>
		layer = {<layer>
			rot = <value>}
		setlayer part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>
	endif
endscript

script get_cap 
	if NOT getcasappearancepart part = <part>
		scriptassert '%s not found' s = <part> donotresolve donotresolve
	endif
	mask = (<section>.mask)
	set_cap_flags mask = ((<mask>) [<mask_index>])
	if gotparam \{cap}
		getarraysize (cap)
		capsize = <array_size>
		i = 0
		begin
		if is_matching_section cap = (<cap> [<i>]) section = <section>
			if structurecontains structure = (<cap> [<i>]) pre_layer
				if structurecontains structure = <section> pre_userlayer
					cap_populate_layer cap_entry = ((<cap> [<i>]).pre_layer) mask_entry = ((<mask>) [<mask_index>]) flags = <flags>
					if gotparam \{layer}
						return pre_layer = <layer>
					endif
				endif
			endif
			if structurecontains structure = (<cap> [<i>]) post_layer
				if structurecontains structure = <section> post_userlayer
					cap_populate_layer cap_entry = ((<cap> [<i>]).post_layer) mask_entry = ((<mask>) [<mask_index>]) flags = <flags>
					if gotparam \{layer}
						return post_layer = <layer>
					endif
				endif
			endif
		endif
		i = (<i> + 1)
		repeat <capsize>
	endif
	if structurecontains structure = <section> pre_userlayer
		cap_new_artist_layer section = <section> mask_entry = ((<mask>) [<mask_index>]) flags = <flags>
		return pre_layer = <layer>
	endif
	if structurecontains structure = <section> post_userlayer
		cap_new_artist_layer section = <section> mask_entry = ((<mask>) [<mask_index>]) flags = <flags>
		return post_layer = <layer>
	endif
endscript

script set_cap 
	requireparams \{[
			section
			part
		]
		all}
	if NOT getcasappearancepart part = <part>
		scriptassert '%s not found' s = <part> donotresolve donotresolve
	endif
	mask = (<section>.mask)
	if gotparam \{cap}
		found_mat = 0
		getarraysize (cap)
		cap_array_size = <array_size>
		i = 0
		begin
		name = (<section>.base_tex)
		if is_matching_section cap = (<cap> [<i>]) section = <section>
			found_mat = 1
			found_tex = 0
			capstruct = (<cap> [<i>])
			if ((gotparam pre_layer) && (structurecontains structure = <capstruct> pre_layer))
				getarraysize ((<cap> [<i>]).pre_layer)
				mat_array_size = <array_size>
				j = 0
				begin
				if structurecontains structure = ((<mask>) [<mask_index>]) pattern
					name = (((<mask>) [<mask_index>]).pattern)
					if in_tex_same_section section = <section> prev_tex = <name> new_tex = ((((<cap> [<i>]).pre_layer) [<j>]).texture)
						found_tex = 1
						pre_layers = ((<cap> [<i>]).pre_layer)
						setarrayelement arrayname = pre_layers index = <j> newvalue = <pre_layer>
						setarrayelement arrayname = cap index = <i> newvalue = {
							(<cap> [<i>])
							pre_layer = <pre_layers>
						}
						setcasappearancecap part = <part> cap = <cap>
						updatecasmodelcap part = <part>
						return
					endif
				elseif structurecontains structure = ((<mask>) [<mask_index>]) font
					if in_font_same_section section = <section> prev_text = (((<mask>) [<mask_index>]).text) new_text = ((((<cap> [<i>]).pre_layer) [<j>]).text)
						found_tex = 1
						pre_layers = ((<cap> [<i>]).pre_layer)
						setarrayelement arrayname = pre_layers index = <j> newvalue = <pre_layer>
						setarrayelement arrayname = cap index = <i> newvalue = {
							(<cap> [<i>])
							pre_layer = <pre_layers>
						}
						setcasappearancecap part = <part> cap = <cap>
						updatecasmodelcap part = <part>
						return
					endif
				endif
				j = (<j> + 1)
				repeat <mat_array_size>
				get_proper_location section = <section> pre_layer = ((<cap> [<i>]).pre_layer) part = <part>
				if gotparam \{index}
					insertarrayelement array = ((<cap> [<i>]).pre_layer) element = <pre_layer> index = <index>
					setarrayelement arrayname = cap index = <i> newvalue = {
						(<cap> [<i>])
						pre_layer = <array>
					}
				else
					addarrayelement array = ((<cap> [<i>]).pre_layer) element = <pre_layer>
					setarrayelement arrayname = cap index = <i> newvalue = {
						(<cap> [<i>])
						pre_layer = <array>
					}
				endif
				setcasappearancecap part = <part> cap = <cap>
				updatecasmodelcap part = <part>
				return
			elseif ((gotparam post_layer) && (structurecontains structure = <capstruct> post_layer))
				getarraysize ((<cap> [<i>]).post_layer)
				mat_array_size = <array_size>
				j = 0
				begin
				if structurecontains structure = ((<mask>) [<mask_index>]) pattern
					name = (((<mask>) [<mask_index>]).pattern)
					if in_tex_same_section section = <section> prev_tex = <name> new_tex = ((((<cap> [<i>]).post_layer) [<j>]).texture)
						found_tex = 1
						post_layers = ((<cap> [<i>]).post_layer)
						setarrayelement arrayname = post_layers index = <j> newvalue = <post_layer>
						setarrayelement arrayname = cap index = <i> newvalue = {
							(<cap> [<i>])
							post_layer = <post_layers>
						}
						setcasappearancecap part = <part> cap = <cap>
						updatecasmodelcap part = <part>
						return
					endif
				elseif structurecontains structure = ((<mask>) [<mask_index>]) font
					if in_font_same_section section = <section> prev_text = (((<mask>) [<mask_index>]).text) new_text = ((((<cap> [<i>]).post_layer) [<j>]).text)
						found_tex = 1
						post_layer = ((<cap> [<i>]).post_layer)
						setarrayelement arrayname = post_layer index = <j> newvalue = <post_layer>
						setarrayelement arrayname = cap index = <i> newvalue = {
							(<cap> [<i>])
							post_layer = <post_layer>
						}
						setcasappearancecap part = <part> cap = <cap>
						updatecasmodelcap part = <part>
						return
					endif
				endif
				j = (<j> + 1)
				repeat <mat_array_size>
				get_proper_location section = <section> post_layer = ((<cap> [<i>]).post_layer) part = <part>
				if gotparam \{index}
					insertarrayelement array = ((<cap> [<i>]).post_layer) element = <post_layer> index = <index>
					setarrayelement arrayname = cap index = <i> newvalue = {
						(<cap> [<i>])
						post_layer = <array>
					}
				else
					addarrayelement array = ((<cap> [<i>]).post_layer) element = <post_layer>
					setarrayelement arrayname = cap index = <i> newvalue = {
						(<cap> [<i>])
						post_layer = <array>
					}
				endif
				setcasappearancecap part = <part> cap = <cap>
				updatecasmodelcap part = <part>
				return
			else
				printf \{qs(0x1aff5f9d)}
				if gotparam \{pre_layer}
					printf \{qs(0x1305fce1)}
					pre_layers = [{<pre_layer>}]
					setarrayelement arrayname = cap index = <i> newvalue = {
						(<cap> [<i>])
						pre_layer = <pre_layers>
					}
				endif
				if gotparam \{post_layer}
					printf \{qs(0x4af2b10e)}
					post_layers = [{<post_layer>}]
					setarrayelement arrayname = cap index = <i> newvalue = {
						(<cap> [<i>])
						post_layer = <post_layers>
					}
				endif
				setcasappearancecap part = <part> cap = <cap>
				updatecasmodelcap part = <part>
				return
			endif
		endif
		i = (<i> + 1)
		repeat <cap_array_size>
		if (<found_mat> = 0)
			name = (<section>.base_tex)
			if gotparam \{pre_layer}
				new_select = [{<pre_layer>}]
				entry = {
					base_tex = <name>
					material = (<section>.material)
					pre_layer = <new_select>
				}
				cap_set_target entry = <entry> section = <section>
			endif
			if gotparam \{post_layer}
				new_select = [{<post_layer>}]
				entry = {
					base_tex = <name>
					material = (<section>.material)
					post_layer = <new_select>
				}
				cap_set_target entry = <entry> section = <section>
			endif
			addarrayelement array = <cap> element = <entry>
			<cap> = <array>
			setcasappearancecap part = <part> cap = <cap>
			updatecasmodelcap part = <part>
			return
		endif
	else
		name = (<section>.base_tex)
		if gotparam \{pre_layer}
			new_select = [{<pre_layer>}]
			entry = {
				base_tex = <name>
				material = (<section>.material)
				pre_layer = <new_select>
			}
			cap_set_target entry = <entry> section = <section>
			cap = [{<entry>}]
		endif
		if gotparam \{post_layer}
			new_select = [{<post_layer>}]
			entry = {
				base_tex = <name>
				material = (<section>.material)
				post_layer = <new_select>
			}
			cap_set_target entry = <entry> section = <section>
			cap = [{<entry>}]
		endif
		setcasappearancecap part = <part> cap = <cap>
		updatecasmodelcap part = <part>
		return
	endif
endscript

script in_tex_same_section 
	requireparams \{[
			prev_tex
			new_tex
			section
		]
		all}
	mask = (<section>.mask)
	match_prev_tex = 0
	match_new_tex = 0
	getarraysize (<mask>)
	j = 0
	begin
	name = (((<mask>) [<j>]).pattern)
	if (<name> = <prev_tex>)
		match_prev_tex = 1
	endif
	if (<name> = <new_tex>)
		match_new_tex = 1
	endif
	j = (<j> + 1)
	repeat <array_size>
	if (<match_prev_tex> = 1)
		if (<match_new_tex> = 1)
			return \{true}
		endif
	endif
	return \{false}
endscript

script in_font_same_section 
	requireparams \{[
			prev_text
			new_text
			section
		]
		all}
	mask = (<section>.mask)
	match_prev_text = 0
	match_new_text = 0
	getarraysize (<mask>)
	j = 0
	begin
	name = (((<mask>) [<j>]).text)
	if (<name> = <prev_text>)
		match_prev_text = 1
	endif
	if (<name> = <new_text>)
		match_new_text = 1
	endif
	j = (<j> + 1)
	repeat <array_size>
	if (<match_prev_text> = 1)
		if (<match_new_text> = 1)
			return \{true}
		endif
	endif
	return \{false}
endscript

script reset_to_default 
	requireparams \{[
			section
			mask_index
		]
		all}
	mask = (<section>.mask)
	set_cap_flags mask = ((<mask>) [<mask_index>])
	if structurecontains structure = <section> pre_userlayer
		reset_to_default_helper mask_entry = ((<mask>) [<mask_index>]) flags = <flags> section = <section>
		set_cap part = <part> section = <section> pre_layer = <layer> mask_index = <mask_index>
	endif
	if structurecontains structure = <section> post_userlayer
		reset_to_default_helper mask_entry = ((<mask>) [<mask_index>]) flags = <flags> section = <section>
		set_cap part = <part> section = <section> post_layer = <layer> mask_index = <mask_index>
	endif
	reset_widgets
endscript

script reset_to_default_helper 
	requireparams \{[
			mask_entry
			flags
			section
		]
		all}
	if structurecontains structure = <mask_entry> pattern
		name = (<mask_entry>.pattern)
		layer = {texture = <name>}
	elseif structurecontains structure = <mask_entry> font
		layer = {font = (<mask_entry>.font)
			text = (<mask_entry>.text)}
	endif
	if NOT (<flags> = 0)
		layer = {<layer>
			flags = <flags>}
	endif
	if structurecontains structure = <section> initial_values
		layer = {<layer> (<section>.initial_values)}
	endif
	if structurecontains structure = <mask_entry> initial_values
		layer = {<layer> (<mask_entry>.initial_values)}
	endif
	return layer = <layer>
endscript

script set_default_rotation_on_layer 
	requireparams \{[
			layer
			section
			mask
		]
		all}
	if structurecontains structure = <section> ui_rotated_90
		if structurecontains structure = <mask> pattern
			return layer = {<layer> rot = 1573}
		else
			return layer = {<layer> rot = 4723}
		endif
	elseif structurecontains structure = <section> ui_rotated_180
		if structurecontains structure = <mask> pattern
			return layer = {<layer> rot = 3146}
		else
			return layer = {<layer> rot = 3146}
		endif
	elseif structurecontains structure = <section> ui_rotated_270
		if structurecontains structure = <mask> pattern
			return layer = {<layer> rot = 4723}
		else
			return layer = {<layer> rot = 1573}
		endif
	endif
	return layer = <layer>
endscript

script add_layer_to_profile 
	requireparams \{[
			section
			mask
			part
		]
		all}
	if NOT getcasappearancepart part = <part>
		scriptassert '%s not found' s = <part> donotresolve donotresolve
	endif
	set_cap_flags mask = (<mask>)
	if structurecontains structure = <mask> pattern
		name = (<mask>.pattern)
		layer = {texture = <name>}
	elseif structurecontains structure = <mask> font
		layer = {font = (<mask>.font)
			text = (<mask>.text)}
	endif
	if NOT (<flags> = 0)
		layer = {<layer>
			flags = <flags>}
	endif
	if structurecontains structure = <section> initial_values
		initial_values = (<section>.initial_values)
		layer = {<layer>
			<initial_values>}
		if ((structurecontains structure = initial_values x_trans) || (structurecontains structure = initial_values y_trans))
			no_average = 1
		endif
	endif
	set_default_rotation_on_layer section = <section> mask = <mask> layer = <layer>
	if structurecontains structure = (<mask>) initial_values
		initial_values = ((<mask>).initial_values)
		layer = {<layer>
			((<mask>).initial_values)}
		if ((structurecontains structure = initial_values x_trans) || (structurecontains structure = initial_values y_trans))
			no_average = 1
		endif
	endif
	if structurecontains structure = <section> center
		x_trans = (50 - (<section>.center [0]))
		y_trans = (50 - (<section>.center [1]))
		casttointeger \{x_trans}
		casttointeger \{y_trans}
		if NOT (<x_trans> = 0)
			layer = {<layer>
				x_trans = <x_trans>}
		endif
		if NOT (<y_trans> = 0)
			layer = {<layer>
				y_trans = <y_trans>}
		endif
	endif
	if gotparam \{cap}
		getarraysize (cap)
		cap_array_size = <array_size>
		if (<cap_array_size> > 0)
			i = 0
			begin
			name = (<section>.base_tex)
			if is_matching_section cap = (<cap> [<i>]) section = <section>
				if structurecontains structure = (<cap> [<i>]) layers
					getarraysize (((<cap> [<i>]).layers))
					addarrayelement array = ((<cap> [<i>]).layers) element = <layer>
					new_layers = <array>
					setarrayelement arrayname = cap index = <i> newvalue = {
						(<cap> [<i>])
						layers = <new_layers>
					}
					setcasappearancecap part = <part> cap = <cap>
					updatecasmodelcap part = <part> flush_assets = 0
					return cap_index = <i> layer_index = <array_size>
				else
					setarrayelement arrayname = cap index = <i> newvalue = {
						(<cap> [<i>])
						layers = [{<layer>}]
					}
					setcasappearancecap part = <part> cap = <cap>
					updatecasmodelcap part = <part> flush_assets = 0
					return cap_index = <i> layer_index = 0
				endif
			endif
			i = (<i> + 1)
			repeat <cap_array_size>
		endif
		name = (<section>.base_tex)
		entry = {
			base_tex = <name>
			material = (<section>.material)
			layers = [{<layer>}]
		}
		cap_set_target entry = <entry> section = <section>
		addarrayelement array = <cap> element = <entry>
		<cap> = <array>
		setcasappearancecap part = <part> cap = <cap>
		updatecasmodelcap part = <part> flush_assets = 0
		return cap_index = (<cap_array_size>) layer_index = 0
	endif
	name = (<section>.base_tex)
	new_layers = [{<layer>}]
	entry = {
		base_tex = <name>
		material = (<section>.material)
		layers = <new_layers>
	}
	cap_set_target entry = <entry> section = <section>
	cap = [{<entry>}]
	setcasappearancecap part = <part> cap = <cap>
	updatecasmodelcap part = <part> flush_assets = 0
	return \{cap_index = 0
		layer_index = 0}
endscript

script match_layers_texture 
	requireparams \{[
			prof_texture
			sections
		]
		all}
	getarraysize (sections)
	sections_size = <array_size>
	i = 0
	begin
	if structurecontains structure = (<sections> [<i>]) mask
		if section_has_target_and_material section = (<sections> [<i>]) target = <target> material = <material>
			mask = (<sections> [<i>].mask)
			getarraysize (mask)
			mask_size = <array_size>
			j = 0
			begin
			if structurecontains structure = ((<mask>) [<j>]) pattern
				name = ((<mask>) [<j>].pattern)
				if (<name> = <prof_texture>)
					return mask = ((<mask>) [<j>]) section_index = <i> mask_index = <j>
				endif
			endif
			j = (<j> + 1)
			repeat <mask_size>
		endif
	endif
	i = (<i> + 1)
	repeat <sections_size>
endscript

script match_layers_font 
	requireparams \{[
			prof_font
			prof_text
			sections
		]
		all}
	getarraysize (sections)
	sections_size = <array_size>
	i = 0
	begin
	if structurecontains structure = (<sections> [<i>]) mask
		if section_has_target_and_material section = (<sections> [<i>]) target = <target> material = <material>
			mask = (<sections> [<i>].mask)
			getarraysize (mask)
			mask_size = <array_size>
			j = 0
			begin
			if structurecontains structure = ((<mask>) [<j>]) font
				if checksumequals a = ((<mask>) [<j>].font) b = <prof_font>
					if (<prof_text> = ((<mask>) [<j>].text))
						return mask = ((<mask>) [<j>]) section_index = <i> mask_index = <j>
					endif
				endif
			endif
			j = (<j> + 1)
			repeat <mask_size>
		endif
	endif
	i = (<i> + 1)
	repeat <sections_size>
endscript

script getlayer 
	if NOT getcasappearancepart part = <part>
		scriptassert '%s not found' s = <part> donotresolve
	endif
	if NOT cd
		getarraysize <cap>
		if (<cap_index> > (<array_size> -1))
			scriptassert \{qs(0x69c75a7f)}
		endif
		getarraysize ((<cap> [<cap_index>]).layers)
		if (<layer_index> > (<array_size> -1))
			scriptassert \{qs(0xd06c9a70)}
		endif
	endif
	if gotparam \{cap}
		if structurecontains structure = (((<cap> [<cap_index>]).layers) [<layer_index>]) texture
			layer = {texture = ((((<cap> [<cap_index>]).layers) [<layer_index>]).texture)}
		elseif structurecontains structure = (((<cap> [<cap_index>]).layers) [<layer_index>]) font
			layer = {font = ((((<cap> [<cap_index>]).layers) [<layer_index>]).font)
				text = ((((<cap> [<cap_index>]).layers) [<layer_index>]).text)}
		endif
		layer = {
			<layer>
			color = ((((<cap> [<cap_index>]).layers) [<layer_index>]).color)
			a = ((((<cap> [<cap_index>]).layers) [<layer_index>]).a)
			x_trans = ((((<cap> [<cap_index>]).layers) [<layer_index>]).x_trans)
			y_trans = ((((<cap> [<cap_index>]).layers) [<layer_index>]).y_trans)
			x_skew = ((((<cap> [<cap_index>]).layers) [<layer_index>]).x_skew)
			y_skew = ((((<cap> [<cap_index>]).layers) [<layer_index>]).y_skew)
			x_scale = ((((<cap> [<cap_index>]).layers) [<layer_index>]).x_scale)
			y_scale = ((((<cap> [<cap_index>]).layers) [<layer_index>]).y_scale)
			rot = ((((<cap> [<cap_index>]).layers) [<layer_index>]).rot)
			flags = ((((<cap> [<cap_index>]).layers) [<layer_index>]).flags)
		}
		return layer = <layer>
	endif
	return \{layer = {
		}}
endscript

script setlayer 
	requireparams \{[
			layer_index
			cap_index
			part
			layer
		]
		all}
	if NOT getcasappearancepart part = <part>
		scriptassert '%s not found' s = <part> donotresolve donotresolve
	endif
	if gotparam \{cap}
		old_layers = ((<cap> [<cap_index>]).layers)
		setarrayelement arrayname = old_layers index = <layer_index> newvalue = <layer>
		setarrayelement arrayname = cap index = <cap_index> newvalue = {
			(<cap> [<cap_index>])
			layers = <old_layers>
		}
		setcasappearancecap part = <part> cap = <cap>
		updatecasmodelcap part = <part> flush_assets = 0
	endif
endscript

script reset_layer_to_default 
	requireparams \{[
			mask
			layer_index
			cap_index
			part
			section
		]
		all}
	getlayer part = <part> cap_index = <cap_index> layer_index = <layer_index>
	set_cap_flags mask = (<mask>)
	if structurecontains structure = <mask> pattern
		name = (<mask>.pattern)
		layer = {texture = <name>}
	elseif structurecontains structure = <mask> font
		layer = {font = (<mask>.font) text = (<mask>.text)}
	endif
	if NOT (<flags> = 0)
		layer = {<layer>
			flags = <flags>}
	endif
	if structurecontains structure = <section> initial_values
		layer = {<layer> (<section>.initial_values)}
	endif
	if structurecontains structure = <mask> initial_values
		layer = {<layer> (<mask>.initial_values)}
	endif
	set_default_rotation_on_layer section = <section> mask = <mask> layer = <layer>
	setlayer part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>
	reset_widgets layer = <layer>
	reset_flip_buttons part = <part> cap_index = <cap_index> layer_index = <layer_index>
endscript

script delete_layer 
	requireparams \{[
			cap_index
			layer_index
			part
		]
		all}
	if NOT getcasappearancepart part = <part>
		scriptassert '%s not found' s = <part> donotresolve donotresolve
	endif
	if gotparam \{cap}
		removearrayelement array = ((<cap> [<cap_index>]).layers) index = <layer_index>
		setarrayelement arrayname = cap index = <cap_index> newvalue = {
			(<cap> [<cap_index>])
			layers = <array>
		}
		getarraysize (array)
		if (<array_size> = 0)
			cap_struct = (<cap> [<cap_index>])
			if ((structurecontains structure = <cap_struct> pre_layer) || (structurecontains structure = <cap_struct> post_layer))
				capstruct = (<cap> [<cap_index>])
				removecomponent \{name = layers
					structure_name = capstruct}
				setarrayelement arrayname = cap index = <cap_index> newvalue = <capstruct>
			else
				removearrayelement array = (<cap>) index = <cap_index>
				cap = <array>
			endif
		endif
		getarraysize (cap)
		if (<array_size> = 0)
			setcasappearancecap part = <part>
		else
			setcasappearancecap part = <part> cap = <cap>
		endif
		if NOT gotparam \{skip_build}
			updatecasmodelcap part = <part>
		endif
	endif
endscript

script has_user_layers 
	requireparams \{[
			sections
		]
		all}
	getarraysize (sections)
	i = 0
	begin
	if NOT structurecontains structure = (<sections> [<i>]) pre_userlayer
		return \{true}
	endif
	if NOT structurecontains structure = (<sections> [<i>]) post_userlayer
		return \{true}
	endif
	i = (<i> + 1)
	repeat <array_size>
	return \{false}
endscript

script get_proper_location 
	requireparams \{[
			section
			part
		]
		all}
	if gotparam \{pre_layer}
		getarraysize (pre_layer)
		i = 0
		begin
		if NOT is_pre_layer_before_section section = <section> pre_layer = (<pre_layer> [<i>]) part = <part>
			return index = <i>
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	if gotparam \{post_layer}
		getarraysize (post_layer)
		i = 0
		begin
		if NOT is_pre_layer_before_section section = <section> post_layer = (<post_layer> [<i>]) part = <part>
			return index = <i>
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script is_pre_layer_before_section 
	requireparams \{[
			part
		]
		all}
	if gotparam \{pre_layer}
		get_section_index_of_pre_layer pre_layer = <pre_layer> section = <section> part = <part>
	endif
	if gotparam \{post_layer}
		get_section_index_of_pre_layer post_layer = <post_layer> section = <section> part = <part>
	endif
	if ((gotparam pre_layer_section_index) && (gotparam section_index))
		if (<pre_layer_section_index> < <section_index>)
			return \{true}
		else
			return \{false}
		endif
	endif
endscript

script get_section_index_of_pre_layer 
	if getcapsectionsarray appearance = $cas_current_appearance part = <part>
		if gotparam \{pre_layer}
			if structurecontains structure = <pre_layer> texture
				match_layers_texture prof_texture = (<pre_layer>.texture) sections = <sections>
			elseif structurecontains structure = <pre_layer> font
				match_layers_font prof_font = (<pre_layer>.font) prof_text = (<pre_layer>.text) sections = <sections>
			endif
			getarraysize (sections)
			i = 0
			begin
			if ((<sections> [<i>].mask) = (<section>.mask))
				return pre_layer_section_index = <section_index> section_index = <i>
			endif
			i = (<i> + 1)
			repeat <array_size>
		endif
		if gotparam \{post_layer}
			if structurecontains structure = <post_layer> texture
				match_layers_texture prof_texture = (<post_layer>.texture) sections = <sections>
			elseif structurecontains structure = <post_layer> font
				match_layers_font prof_font = (<post_layer>.font) prof_text = (<post_layer>.text) sections = <sections>
			endif
			getarraysize (sections)
			i = 0
			begin
			if ((<sections> [<i>].mask) = (<section>.mask))
				return pre_layer_section_index = <section_index> section_index = <i>
			endif
			i = (<i> + 1)
			repeat <array_size>
		endif
	else
		scriptassert \{qs(0x8ed8529e)}
	endif
endscript

script set_cap_flags 
	requireparams \{[
			mask
		]
		all}
	flags = 0
	if structurecontains structure = <mask> clamp_u
		flags = (<flags> || 1)
	endif
	if structurecontains structure = <mask> clamp_v
		flags = (<flags> || 2)
	endif
	if structurecontains structure = <mask> clamp_uv
		flags = 3
	endif
	if structurecontains structure = <mask> static_alpha
		flags = (<flags> || 4)
	endif
	if structurecontains structure = <mask> wrap_texture
		flags = (<flags> || 32)
	endif
	if structurecontains structure = <mask> depth_field
		flags = (<flags> || 256)
	endif
	return flags = <flags>
endscript

script flip_layer_horizontal 
	if NOT getcasappearancepart part = <part>
		scriptassert '%s not found' s = <part> donotresolve donotresolve
	endif
	layer = (((<cap> [<cap_index>]).layers) [<layer_index>])
	if gotparam \{cap}
		if structurecontains structure = <layer> flags
			if ((<layer>.flags) && 8)
				newflags = ((<layer>.flags) && -9)
				layer = {<layer>
					flags = <newflags>}
			else
				newflags = ((<layer>.flags) || 8)
				layer = {<layer>
					flags = <newflags>}
			endif
		else
			layer = {<layer>
				flags = 8}
		endif
	endif
	old_layers = ((<cap> [<cap_index>]).layers)
	setarrayelement arrayname = old_layers index = <layer_index> newvalue = <layer>
	setarrayelement arrayname = cap index = <cap_index> newvalue = {
		(<cap> [<cap_index>])
		layers = <old_layers>
	}
	setcasappearancecap part = <part> cap = <cap>
	updatecasmodelcap part = <part>
endscript

script is_flip_layer_horizontal 
	if NOT getcasappearancepart part = <part>
		scriptassert '%s not found' s = <part> donotresolve donotresolve
	endif
	layer = (((<cap> [<cap_index>]).layers) [<layer_index>])
	if gotparam \{cap}
		if structurecontains structure = <layer> flags
			if ((<layer>.flags) && 8)
				return \{true}
			endif
		endif
	endif
	return \{false}
endscript

script flip_layer_vertical 
	if NOT getcasappearancepart part = <part>
		scriptassert '%s not found' s = <part> donotresolve donotresolve
	endif
	layer = (((<cap> [<cap_index>]).layers) [<layer_index>])
	if gotparam \{cap}
		if structurecontains structure = <layer> flags
			if ((<layer>.flags) && 16)
				newflags = ((<layer>.flags) && -17)
				layer = {<layer>
					flags = <newflags>}
			else
				newflags = ((<layer>.flags) || 16)
				layer = {<layer>
					flags = <newflags>}
			endif
		else
			layer = {<layer>
				flags = 8}
		endif
	endif
	old_layers = ((<cap> [<cap_index>]).layers)
	setarrayelement arrayname = old_layers index = <layer_index> newvalue = <layer>
	setarrayelement arrayname = cap index = <cap_index> newvalue = {
		(<cap> [<cap_index>])
		layers = <old_layers>
	}
	setcasappearancecap part = <part> cap = <cap>
	updatecasmodelcap part = <part>
endscript

script is_flip_layer_vertical 
	if NOT getcasappearancepart part = <part>
		scriptassert '%s not found' s = <part> donotresolve donotresolve
	endif
	layer = (((<cap> [<cap_index>]).layers) [<layer_index>])
	if gotparam \{cap}
		if structurecontains structure = <layer> flags
			if ((<layer>.flags) && 16)
				return \{true}
			endif
		endif
	endif
	return \{false}
endscript

script updatecasmodelcap 
	if NOT gotparam \{part}
		scriptassert \{'This requires a part parameter, updating CAP on everything at once isn\'t a great idea!'}
	endif
	updatecurrentcasmodel buildscript = update_cap_part flush_assets = <flush_assets> buildscriptparams = {part = <part>}
endscript

script is_matching_section 
	name = (<section>.base_tex)
	if (((<cap>.material) = (<section>.material)) && ((<cap>.base_tex) = <name>))
		if ((structurecontains structure = <section> normal_map) && (structurecontains structure = <cap> normal_map))
			return \{true}
		elseif ((structurecontains structure = <section> cas_1) && (structurecontains structure = <cap> cas_1))
			return \{true}
		elseif ((structurecontains structure = <section> cas_2) && (structurecontains structure = <cap> cas_2))
			return \{true}
		elseif ((structurecontains structure = <section> specular) && (structurecontains structure = <cap> specular))
			return \{true}
		elseif ((structurecontains structure = <section> diffuse) && (structurecontains structure = <cap> diffuse))
			return \{true}
		else
			return \{false}
		endif
	endif
	return \{false}
endscript

script cap_set_target 
	requireparams \{[
			section
			entry
		]
		all}
	if structurecontains structure = <section> normal_map
		entry = {<entry>
			normal_map}
	elseif structurecontains structure = <section> cas_1
		entry = {<entry>
			cas_1}
	elseif structurecontains structure = <section> cas_2
		entry = {<entry>
			cas_2}
	elseif structurecontains structure = <section> specular
		entry = {<entry>
			specular}
	elseif structurecontains structure = <section> diffuse
		entry = {<entry>
			diffuse}
	else
		entry = {<entry>
			diffuse}
	endif
	return entry = <entry>
endscript

script is_target_in_div 
	requireparams \{[
			target
			part
		]
		all}
	if NOT getcasappearancepart part = <part>
		scriptassert '%s not found' s = <part> donotresolve donotresolve
	endif
	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
		scriptassert '%s %t not found' s = <part> t = <desc_id>
	endif
	if NOT gotparam \{divisions}
		return \{true}
	elseif NOT gotparam \{div_id}
		return \{true}
	else
		getarraysize \{divisions}
		if (<array_size> > 0)
			i = 0
			begin
			if ((<divisions> [<i>].desc_id) = <div_id>)
				if ((<target>.material) = (<divisions> [<i>].material))
					if structurecontains structure = <target> (<divisions> [<i>].target)
						return \{true}
					endif
				endif
			endif
			i = (<i> + 1)
			repeat <array_size>
		endif
	endif
	return \{false}
endscript

script get_div_info 
	requireparams \{[
			part
		]
		all}
	if NOT gotparam \{div_id}
		return
	endif
	if NOT gotparam \{desc_id}
		if NOT getcasappearancepart part = <part>
			scriptassert '%s not found' s = <part> donotresolve donotresolve
		endif
	endif
	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
		scriptassert '%s %t not found' s = <part> t = <desc_id>
	endif
	if gotparam \{divisions}
		getarraysize \{divisions}
		if (<array_size> > 0)
			i = 0
			begin
			if ((<divisions> [<i>].desc_id) = <div_id>)
				return target = (<divisions> [<i>].target) material = (<divisions> [<i>].material)
			endif
			i = (<i> + 1)
			repeat <array_size>
		endif
	endif
endscript

script section_has_target_and_material 
	requireparams \{[
			section
		]
		all}
	if NOT gotparam \{target}
		return \{true}
	elseif NOT gotparam \{material}
		return \{true}
	else
		if structurecontains structure = <section> <target>
			if checksumequals a = (<section>.material) b = <material>
				return \{true}
			endif
		endif
	endif
	return \{false}
endscript

script add_cap_array_to_part 
	requireparams \{[
			part
			newstruct
		]
		all}
	if NOT getactualcasoptionstruct part = <part> desc_id = (<newstruct>.desc_id)
		scriptassert '%s %t not found' s = <part> t = (<newstruct>.desc_id)
	endif
	if gotparam \{default_cap}
		newstruct = {<newstruct>
			cap = <default_cap>}
		return newstruct = <newstruct>
	endif
endscript

script cap_artist_colorwheel_focus_change 
	get_cap part = <part> section = <section> mask_index = <mask_index>
	if gotparam \{pre_layer}
		pre_layer = {<pre_layer>
			color = <color>}
		set_cap part = <part> section = <section> pre_layer = <pre_layer> mask_index = <mask_index>
	endif
	if gotparam \{post_layer}
		post_layer = {<post_layer>
			color = <color>}
		set_cap part = <part> section = <section> post_layer = <post_layer> mask_index = <mask_index>
	endif
endscript

script unfocus_color_wheel 
	color_slice_back
	color_wheel_back \{skip_exit_script}
	widget_accept_cap part = <part>
endscript

script cap_get_current_rgb 
	requireparams \{[
			part
			section
			mask_index
		]
		all}
	get_cap part = <part> section = <section> mask_index = <mask_index>
	if gotparam \{pre_layer}
		if structurecontains structure = <pre_layer> color
			rgba = ((($color_lookup_table).(<pre_layer>.color)).diffuse)
		else
			addarrayelement array = [] element = ($default_cap_red)
			addarrayelement array = <array> element = ($default_cap_green)
			addarrayelement array = <array> element = ($default_cap_blue)
			rgba = <array>
		endif
	else
		if structurecontains structure = <post_layer> color
			rgba = ((($color_lookup_table).(<post_layer>.color)).diffuse)
		else
			addarrayelement array = [] element = ($default_cap_red)
			addarrayelement array = <array> element = ($default_cap_green)
			addarrayelement array = <array> element = ($default_cap_blue)
			rgba = <array>
		endif
	endif
	return rgb = <rgba>
endscript

script average_layer_translation 
	requireparams \{[
			layers
		]
		all}
	getarraysize <layers>
	if (<array_size> > 0)
		sum_x = 0
		sum_y = 0
		i = 0
		begin
		if structurecontains structure = (<layers> [<i>]) x_trans
			x_trans = ((<layers> [<i>]).x_trans)
			sum_x = (<sum_x> + <x_trans>)
		endif
		if structurecontains structure = (<layers> [<i>]) y_trans
			y_trans = ((<layers> [<i>]).y_trans)
			sum_y = (<sum_y> + <y_trans>)
		endif
		i = (<i> + 1)
		repeat <array_size>
		return x_trans = (<sum_x> / <array_size>) y_trans = (<sum_y> / <array_size>)
	endif
endscript

script cap_no_transforms 
	requireparams \{[
			mask
		]
		all}
	if structurecontains structure = <mask> no_edit_options
		return \{true}
	elseif NOT structurecontains structure = <mask> no_color
		return \{false}
	elseif NOT structurecontains structure = <mask> no_alpha
		return \{false}
	elseif NOT structurecontains structure = <mask> no_translate
		return \{false}
	elseif NOT structurecontains structure = <mask> no_scale
		return \{false}
	elseif NOT structurecontains structure = <mask> no_rotate
		return \{false}
	elseif NOT structurecontains structure = <mask> no_skew
		return \{false}
	elseif NOT structurecontains structure = <mask> no_u_flip
		return \{false}
	elseif NOT structurecontains structure = <mask> no_v_flip
		return \{false}
	else
		return \{true}
	endif
endscript

script cap_populate_layer 
	getarraysize <cap_entry>
	j = 0
	begin
	cap_entry_struct = (<cap_entry> [<j>])
	if ((structurecontains structure = <cap_entry_struct> texture) && (structurecontains structure = <mask_entry> pattern))
		name = (<mask_entry>.pattern)
		if (((<cap_entry> [<j>]).texture) = <name>)
			name = (<mask_entry>.pattern)
			layer = {
				texture = <name>
				color = ((<cap_entry> [<j>]).color)
				a = ((<cap_entry> [<j>]).a)
				x_trans = ((<cap_entry> [<j>]).x_trans)
				y_trans = ((<cap_entry> [<j>]).y_trans)
				x_scale = ((<cap_entry> [<j>]).x_scale)
				y_scale = ((<cap_entry> [<j>]).y_scale)
				rot = ((<cap_entry> [<j>]).rot)
				flags = ((<cap_entry> [<j>]).flags)
				x_skew = ((<cap_entry> [<j>]).x_skew)
				y_skew = ((<cap_entry> [<j>]).y_skew)
			}
			if NOT (<flags> = 0)
				layer = {<layer>
					flags = <flags>}
			endif
			return layer = <layer>
		endif
	elseif ((structurecontains structure = <cap_entry_struct> font) && (structurecontains structure = <mask_entry> font))
		layer = {
			font = (<mask_entry>.font)
			text = (<mask_entry>.text)
			color = ((<cap_entry> [<j>]).color)
			a = ((<cap_entry> [<j>]).a)
			x_trans = ((<cap_entry> [<j>]).x_trans)
			y_trans = ((<cap_entry> [<j>]).y_trans)
			x_scale = ((<cap_entry> [<j>]).x_scale)
			y_scale = ((<cap_entry> [<j>]).y_scale)
			rot = ((<cap_entry> [<j>]).rot)
			flags = ((<cap_entry> [<j>]).flags)
			x_skew = ((<cap_entry> [<j>]).x_skew)
			y_skew = ((<cap_entry> [<j>]).y_skew)
		}
		if NOT (<flags> = 0)
			layer = {<layer>
				flags = <flags>}
		endif
		return layer = <layer>
	endif
	j = (<j> + 1)
	repeat <array_size>
endscript

script cap_new_artist_layer 
	if structurecontains structure = <mask_entry> pattern
		name = (<mask_entry>.pattern)
		layer = {texture = <name>}
	elseif structurecontains structure = <mask_entry> font
		layer = {font = (<mask_entry>.font) text = (<mask_entry>.text)}
	endif
	if NOT (<flags> = 0)
		layer = {<layer>
			flags = <flags>}
	endif
	if structurecontains structure = <section> center
		x_trans = (50 - (<section>.center [0]))
		y_trans = (50 - (<section>.center [1]))
		casttointeger \{x_trans}
		casttointeger \{y_trans}
		if NOT (<x_trans> = 0)
			layer = {<layer>
				x_trans = <x_trans>}
		endif
		if NOT (<y_trans> = 0)
			layer = {<layer>
				y_trans = <y_trans>}
		endif
	endif
	return layer = <layer>
endscript

script cap_color_wheel_focus_change_color 
	getlayer part = <part> cap_index = <cap_index> layer_index = <layer_index>
	layer = {<layer>
		color = <color>}
	setlayer part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>
endscript

script reset_widgets 
	reset_widget_with_layer widget_id = x_scale_widget param = x_scale layer = <layer> `default` = ($default_cap_scale)
	reset_widget_with_layer widget_id = y_scale_widget param = y_scale layer = <layer> `default` = ($default_cap_scale)
	reset_widget_with_layer widget_id = x_trans_widget param = x_trans layer = <layer> `default` = ($default_cap_trans)
	reset_widget_with_layer widget_id = y_trans_widget param = y_trans layer = <layer> `default` = ($default_cap_trans)
	reset_widget_with_layer widget_id = x_skew_widget param = x_skew layer = <layer> `default` = ($default_cap_skew)
	reset_widget_with_layer widget_id = y_skew_widget param = y_skew layer = <layer> `default` = ($default_cap_skew)
	reset_widget_with_layer widget_id = alpha_widget param = a layer = <layer> `default` = ($default_cap_alpha)
	reset_widget_with_layer widget_id = rot_widget param = rot layer = <layer> `default` = ($default_cap_rot) rotate_widget
endscript

script reset_widget_with_layer 
	value = <`default`>
	if gotparam \{layer}
		if structurecontains structure = <layer> <param>
			value = (<layer>.<param>)
		endif
	endif
	if gotparam \{rotate_widget}
		rotate_widget_set_value widget_id = <widget_id> new_value = <value>
	else
		button_widget_set_value widget_id = <widget_id> new_value = <value>
	endif
endscript

script reset_flip_buttons 
	if is_flip_layer_horizontal part = <part> cap_index = <cap_index> layer_index = <layer_index>
		button_generic_set_value \{id = flip_horiz_widget
			new_value = true}
	else
		button_generic_set_value \{id = flip_horiz_widget
			new_value = false}
	endif
	if is_flip_layer_vertical part = <part> cap_index = <cap_index> layer_index = <layer_index>
		button_generic_set_value \{id = flip_vert_widget
			new_value = true}
	else
		button_generic_set_value \{id = flip_vert_widget
			new_value = false}
	endif
endscript

script widget_restore_cap 
	widget_accept_cap <...>
endscript

script widget_init_cap 
	clean_up_user_control_helpers
	if gotparam \{part}
		if checksumequals a = <part> b = cas_band_logo
			menu_finish \{car_helper_text_cancel
				no_rotate_zoom_text}
		else
			menu_finish \{car_helper_text_cancel}
		endif
	else
		menu_finish \{car_helper_text_cancel}
	endif
endscript

script widget_accept_cap 
	clean_up_user_control_helpers
	if gotparam \{part}
		if checksumequals a = <part> b = cas_band_logo
			menu_finish \{car_helper_text_back
				no_rotate_zoom_text}
		else
			menu_finish \{car_helper_text_back}
		endif
	else
		menu_finish \{car_helper_text_back}
	endif
endscript

script restore_color_initial 
	clean_up_user_control_helpers
	if structurecontains \{structure = add_params
			part}
		if checksumequals a = (<add_params>.part) b = cas_band_logo
			menu_finish \{car_helper_text_back
				no_rotate_zoom_text}
		else
			menu_finish \{car_helper_text_back}
		endif
	else
		menu_finish \{car_helper_text_back}
	endif
endscript
