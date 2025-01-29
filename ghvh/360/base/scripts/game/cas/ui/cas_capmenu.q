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
	RequireParams \{[
			part
			section
			mask_index
		]
		all}
	mask = (<section>.mask)
	if NOT StructureContains structure = ((<mask>) [<mask_index>]) no_color
		cap_get_current_rgb section = <section> part = <part> mask_index = <mask_index>
		colorwheel_add_item {
			Scale = 0.6
			pad_choose_script = unfocus_color_wheel
			pad_choose_params = {part = <part>}
			increment_focus_script = cap_artist_colorwheel_focus_change
			increment_focus_params = {section = <section> part = <part> mask_index = <mask_index>}
			initial_rgb = <rgb>
			lookup_table = <color_wheel>
			special_exit_script = restore_color_initial
			special_exit_params = {part = <part> add_script = cap_artist_colorwheel_focus_change add_params = {Color = <rgb> section = <section> part = <part> mask_index = <mask_index>}}
			special_choose_script = widget_init_cap
		}
	endif
	if NOT StructureContains structure = ((<mask>) [<mask_index>]) no_alpha
		get_cap part = <part> section = <section> mask_index = <mask_index>
		a = ($default_cap_alpha)
		if GotParam \{pre_layer}
			if StructureContains structure = <pre_layer> a
				a = (<pre_layer>.a)
			endif
		elseif GotParam \{post_layer}
			if StructureContains structure = <post_layer> a
				a = (<post_layer>.a)
			endif
		endif
		button_widget_add_item {
			widget_id = alpha_widget
			text = qs(0x3d6d9684)
			button_icon = widget_transparency
			start_value = <a>
			min = ($color_min_alpha)
			Max = ($color_max_alpha)
			step = ($color_alpha_increment)
			pad_up_script = cap_layer_set_alpha
			pad_up_params = {section = <section> part = <part> mask_index = <mask_index> pre_layer = <pre_layer> post_layer = <post_layer>}
			pad_down_script = cap_layer_set_alpha
			pad_down_params = {section = <section> part = <part> mask_index = <mask_index> pre_layer = <pre_layer> post_layer = <post_layer>}
			fill_type = `bottom	to	top`
			<no_cas_handlers>
			deinit_script = widget_accept_cap
			init_script = widget_init_cap
			accept_script = widget_accept_cap
			camera_list = <camera_list>
			zoom_camera = <zoom_camera>
		}
	endif
	if NOT StructureContains structure = ((<mask>) [<mask_index>]) no_scale
		get_cap part = <part> section = <section> mask_index = <mask_index>
		x_scale = ($default_cap_scale)
		if GotParam \{pre_layer}
			if StructureContains structure = <pre_layer> x_scale
				x_scale = (<pre_layer>.x_scale)
			endif
		elseif GotParam \{post_layer}
			if StructureContains structure = <post_layer> x_scale
				x_scale = (<post_layer>.x_scale)
			endif
		endif
		button_widget_add_item {
			widget_id = x_scale_widget
			text = qs(0x52052a00)
			button_icon = widget_uni_scale
			start_value = <x_scale>
			min = ($min_scale)
			Max = ($max_scale)
			step = ($scale_increment)
			pad_left_script = cap_layer_set_x_scale
			pad_left_params = {section = <section> part = <part> mask_index = <mask_index> pre_layer = <pre_layer> post_layer = <post_layer>}
			pad_right_script = cap_layer_set_x_scale
			pad_right_params = {section = <section> part = <part> mask_index = <mask_index> pre_layer = <pre_layer> post_layer = <post_layer>}
			fill_type = `center	left/right`
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
		if GotParam \{pre_layer}
			if StructureContains structure = <pre_layer> y_scale
				y_scale = (<pre_layer>.y_scale)
			endif
		elseif GotParam \{post_layer}
			if StructureContains structure = <post_layer> y_scale
				y_scale = (<post_layer>.y_scale)
			endif
		endif
		button_widget_add_item {
			widget_id = y_scale_widget
			text = qs(0xea1fd0c6)
			button_icon = widget_uni_scale
			start_value = <y_scale>
			min = ($min_scale)
			Max = ($max_scale)
			step = ($scale_increment)
			pad_up_script = cap_layer_set_y_scale
			pad_up_params = {section = <section> part = <part> mask_index = <mask_index> pre_layer = <pre_layer> post_layer = <post_layer>}
			pad_down_script = cap_layer_set_y_scale
			pad_down_params = {section = <section> part = <part> mask_index = <mask_index> pre_layer = <pre_layer> post_layer = <post_layer>}
			fill_type = `center	up/down`
			<no_cas_handlers>
			deinit_script = widget_accept_cap
			init_script = widget_init_cap
			accept_script = widget_accept_cap
			camera_list = <camera_list>
			zoom_camera = <zoom_camera>
		}
	endif
	if NOT StructureContains structure = ((<mask>) [<mask_index>]) no_translate
		get_cap part = <part> section = <section> mask_index = <mask_index>
		x_trans = ($default_cap_trans)
		if GotParam \{pre_layer}
			if StructureContains structure = <pre_layer> x_trans
				x_trans = (<pre_layer>.x_trans)
			endif
		elseif GotParam \{post_layer}
			if StructureContains structure = <post_layer> x_trans
				x_trans = (<post_layer>.x_trans)
			endif
		endif
		button_widget_add_item {
			widget_id = x_trans_widget
			text = qs(0xc261e706)
			button_icon = widget_uni_move
			start_value = <x_trans>
			min = ($min_trans)
			Max = ($max_trans)
			step = ($trans_increment)
			pad_left_script = cap_layer_set_x_trans
			pad_left_params = {section = <section> part = <part> mask_index = <mask_index> pre_layer = <pre_layer> post_layer = <post_layer>}
			pad_right_script = cap_layer_set_x_trans
			pad_right_params = {section = <section> part = <part> mask_index = <mask_index> pre_layer = <pre_layer> post_layer = <post_layer>}
			fill_type = `center	left/right`
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
		if GotParam \{pre_layer}
			if StructureContains structure = <pre_layer> y_trans
				y_trans = (<pre_layer>.x_scale)
			endif
		elseif GotParam \{post_layer}
			if StructureContains structure = <post_layer> y_trans
				y_trans = (<post_layer>.y_trans)
			endif
		endif
		button_widget_add_item {
			widget_id = y_trans_widget
			text = qs(0xbc37bc4e)
			button_icon = widget_uni_move
			start_value = <y_trans>
			min = ($min_trans)
			Max = ($max_trans)
			step = ($trans_increment)
			pad_up_script = cap_layer_set_y_trans
			pad_up_params = {section = <section> part = <part> mask_index = <mask_index> pre_layer = <pre_layer> post_layer = <post_layer>}
			pad_down_script = cap_layer_set_y_trans
			pad_down_params = {section = <section> part = <part> mask_index = <mask_index> pre_layer = <pre_layer> post_layer = <post_layer>}
			fill_type = `center	up/down`
			<no_cas_handlers>
			deinit_script = widget_accept_cap
			init_script = widget_init_cap
			accept_script = widget_accept_cap
			camera_list = <camera_list>
			zoom_camera = <zoom_camera>
		}
	endif
	if NOT StructureContains structure = ((<mask>) [<mask_index>]) no_skew
		get_cap part = <part> section = <section> mask_index = <mask_index>
		x_skew = ($default_cap_skew)
		if GotParam \{pre_layer}
			if StructureContains structure = <pre_layer> x_skew
				x_skew = (<pre_layer>.x_skew)
			endif
		elseif GotParam \{post_layer}
			if StructureContains structure = <post_layer> x_skew
				x_skew = (<post_layer>.x_skew)
			endif
		endif
		button_widget_add_item {
			widget_id = x_skew_widget
			text = qs(0xc432bf92)
			button_icon = widget_shear
			start_value = <x_skew>
			min = ($min_skew)
			Max = ($max_skew)
			step = ($skew_increment)
			pad_left_script = cap_layer_set_x_skew
			pad_left_params = {section = <section> part = <part> mask_index = <mask_index> pre_layer = <pre_layer> post_layer = <post_layer>}
			pad_right_script = cap_layer_set_x_skew
			pad_right_params = {section = <section> part = <part> mask_index = <mask_index> pre_layer = <pre_layer> post_layer = <post_layer>}
			fill_type = `center	left/right`
			<no_cas_handlers>
			deinit_script = widget_accept_cap
			init_script = widget_init_cap
			accept_script = widget_accept_cap
			camera_list = <camera_list>
			zoom_camera = <zoom_camera>
		}
		get_cap part = <part> section = <section> mask_index = <mask_index>
		y_skew = ($default_cap_skew)
		if GotParam \{pre_layer}
			if StructureContains structure = <pre_layer> y_skew
				y_skew = (<pre_layer>.y_skew)
			endif
		elseif GotParam \{post_layer}
			if StructureContains structure = <post_layer> y_skew
				y_skew = (<post_layer>.y_skew)
			endif
		endif
		button_widget_add_item {
			widget_id = y_skew_widget
			text = qs(0x5ee97771)
			button_icon = widget_shear
			start_value = <y_skew>
			min = ($min_skew)
			Max = ($max_skew)
			step = ($skew_increment)
			pad_up_script = cap_layer_set_y_skew
			pad_up_params = {section = <section> part = <part> mask_index = <mask_index> pre_layer = <pre_layer> post_layer = <post_layer>}
			pad_down_script = cap_layer_set_y_skew
			pad_down_params = {section = <section> part = <part> mask_index = <mask_index> pre_layer = <pre_layer> post_layer = <post_layer>}
			fill_type = `center	up/down`
			icon_rot = 90
			<no_cas_handlers>
			deinit_script = widget_accept_cap
			init_script = widget_init_cap
			accept_script = widget_accept_cap
			camera_list = <camera_list>
			zoom_camera = <zoom_camera>
		}
	endif
	if NOT StructureContains structure = ((<mask>) [<mask_index>]) NO_ROTATE
		get_cap part = <part> section = <section> mask_index = <mask_index>
		rot = ($default_cap_rot)
		if GotParam \{pre_layer}
			if StructureContains structure = <pre_layer> rot
				rot = (<pre_layer>.rot)
			endif
		elseif GotParam \{post_layer}
			if StructureContains structure = <post_layer> rot
				rot = (<post_layer>.rot)
			endif
		endif
		rot_widget_add_item {
			widget_id = rot_widget
			text = qs(0x63e34942)
			button_icon = widget_rotate
			start_value = <rot>
			min = ($min_rot)
			Max = ($max_rot)
			step = ($rot_increment)
			pad_up_script = cap_layer_set_rot
			pad_up_params = {section = <section> part = <part> mask_index = <mask_index> pre_layer = <pre_layer> post_layer = <post_layer>}
			pad_down_script = cap_layer_set_rot
			pad_down_params = {section = <section> part = <part> mask_index = <mask_index> pre_layer = <pre_layer> post_layer = <post_layer>}
			fill_type = `counter	clockwise`
			wrap
			sweep
			<no_cas_handlers>
			deinit_script = widget_accept_cap
			init_script = widget_init_cap
			accept_script = widget_accept_cap
			camera_list = <camera_list>
			zoom_camera = <zoom_camera>
		}
	endif
	add_generic_menu_icon_item {
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
	RequireParams \{[
			part
			cap_index
			layer_index
		]
		all}
	if NOT StructureContains structure = <mask> no_color
		add_generic_menu_icon_item {
			icon = widget_colorwheel
			text = qs(0x6149aa3d)
			choose_state = uistate_cap_color_wheel
			choose_state_data = {part = <part> cap_index = <cap_index> layer_index = <layer_index> color_wheel = <color_wheel> camera_list = <camera_list> zoom_camera = <zoom_camera>}
		}
	endif
	if NOT StructureContains structure = <mask> no_alpha
		getlayer part = <part> cap_index = <cap_index> layer_index = <layer_index>
		if StructureContains structure = <layer> a
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
			Max = ($color_max_alpha)
			step = ($color_alpha_increment)
			pad_up_script = cap_layer_set_alpha
			pad_up_params = {part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>}
			pad_down_script = cap_layer_set_alpha
			pad_down_params = {part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>}
			fill_type = `bottom	to	top`
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
	if NOT StructureContains structure = <mask> no_scale
		getlayer part = <part> cap_index = <cap_index> layer_index = <layer_index>
		if StructureContains structure = <layer> x_scale
			x_scale = (<layer>.x_scale)
		else
			x_scale = ($default_cap_scale)
		endif
		if StructureContains structure = <layer> y_scale
			y_scale = (<layer>.y_scale)
		else
			y_scale = ($default_cap_scale)
		endif
		if StructureContains structure = <mask> uniform_scale
			MathMax a = <y_scale> b = <x_scale>
			MathMin a = <y_scale> b = <x_scale>
			button_widget_add_item {
				widget_id = uni_scale_widget
				text = qs(0xbae0063c)
				start_value = <Max>
				min = (<Max> - (<min> - ($min_scale)))
				Max = ($max_scale)
				step = (2 * ($scale_increment))
				pad_left_script = cap_layer_set_uni_scale
				pad_left_params = {part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer> aspect_ratio = (<min> / <Max>)}
				pad_right_script = cap_layer_set_uni_scale
				pad_right_params = {part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer> aspect_ratio = (<min> / <Max>)}
				fill_type = `center	out`
				button_icon = widget_scale
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
		else
			if (<part> = cas_guitar_body || <part> = cas_bass_body || <part> = cas_guitar_head || <part> = cas_bass_head)
				additional_width_params = {
					pad_left_script = cap_layer_set_y_scale
					pad_right_script = cap_layer_set_y_scale
					start_value = <y_scale>
				}
				additional_height_params = {
					pad_up_script = cap_layer_set_x_scale
					pad_down_script = cap_layer_set_x_scale
					start_value = <x_scale>
				}
			endif
			button_widget_add_item {
				widget_id = x_scale_widget
				text = qs(0x52052a00)
				button_icon = widget_uni_scale
				start_value = <x_scale>
				min = ($min_scale)
				Max = ($max_scale)
				step = ($scale_increment)
				pad_left_script = cap_layer_set_x_scale
				pad_left_params = {part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>}
				pad_right_script = cap_layer_set_x_scale
				pad_right_params = {part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>}
				fill_type = `center	left/right`
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
				<additional_width_params>
			}
			button_widget_add_item {
				widget_id = y_scale_widget
				text = qs(0xea1fd0c6)
				button_icon = widget_uni_scale
				start_value = <y_scale>
				min = ($min_scale)
				Max = ($max_scale)
				step = ($scale_increment)
				pad_up_script = cap_layer_set_y_scale
				pad_up_params = {part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>}
				pad_down_script = cap_layer_set_y_scale
				pad_down_params = {part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>}
				fill_type = `center	up/down`
				<no_cas_handlers>
				deinit_script = widget_accept_cap
				deinit_params = {part = <part>}
				init_script = widget_init_cap
				init_params = {part = <part>}
				accept_script = widget_accept_cap
				accept_params = {part = <part>}
				camera_list = <camera_list>
				zoom_camera = <zoom_camera>
				<additional_height_params>
			}
		endif
	endif
	if NOT StructureContains structure = <mask> no_translate
		getlayer part = <part> cap_index = <cap_index> layer_index = <layer_index>
		if StructureContains structure = <layer> x_trans
			x_trans = (<layer>.x_trans)
		else
			x_trans = ($default_cap_trans)
		endif
		if (<part> = cas_guitar_body || <part> = cas_bass_body || <part> = cas_guitar_head || <part> = cas_bass_head)
			additional_x_trans_params = {
				pad_left_script = cap_layer_set_y_trans
				pad_right_script = cap_layer_set_y_trans
				pad_left_params = {part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer> reverse}
				pad_right_params = {part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer> reverse}
				start_value = <y_trans>
			}
			additional_y_trans_params = {
				pad_up_script = cap_layer_set_x_trans
				pad_down_script = cap_layer_set_x_trans
				start_value = <x_trans>
			}
		endif
		button_widget_add_item {
			widget_id = x_trans_widget
			text = qs(0xc261e706)
			button_icon = widget_uni_move
			start_value = <x_trans>
			min = ($min_trans)
			Max = ($max_trans)
			step = ($trans_increment)
			pad_left_script = cap_layer_set_x_trans
			pad_left_params = {part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>}
			pad_right_script = cap_layer_set_x_trans
			pad_right_params = {part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>}
			fill_type = `center	left/right`
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
			<additional_x_trans_params>
		}
		getlayer part = <part> cap_index = <cap_index> layer_index = <layer_index>
		if StructureContains structure = <layer> y_trans
			y_trans = (<layer>.y_trans)
		else
			y_trans = ($default_cap_trans)
		endif
		button_widget_add_item {
			widget_id = y_trans_widget
			text = qs(0xbc37bc4e)
			button_icon = widget_uni_move
			start_value = <y_trans>
			min = ($min_trans)
			Max = ($max_trans)
			step = ($trans_increment)
			pad_up_script = cap_layer_set_y_trans
			pad_up_params = {part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>}
			pad_down_script = cap_layer_set_y_trans
			pad_down_params = {part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>}
			fill_type = `center	up/down`
			<no_cas_handlers>
			deinit_script = widget_accept_cap
			deinit_params = {part = <part>}
			init_script = widget_init_cap
			init_params = {part = <part>}
			accept_script = widget_accept_cap
			accept_params = {part = <part>}
			camera_list = <camera_list>
			zoom_camera = <zoom_camera>
			<additional_y_trans_params>
		}
	endif
	if NOT StructureContains structure = <mask> no_skew
		getlayer part = <part> cap_index = <cap_index> layer_index = <layer_index>
		if StructureContains structure = <layer> x_skew
			x_skew = (<layer>.x_skew)
		else
			x_skew = ($default_cap_skew)
		endif
		if (<part> = cas_guitar_body || <part> = cas_bass_body || <part> = cas_guitar_head || <part> = cas_bass_head)
			additional_x_skew_params = {
				pad_left_script = cap_layer_set_y_skew
				pad_right_script = cap_layer_set_y_skew
				pad_left_params = {part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer> reverse}
				pad_right_params = {part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer> reverse}
				start_value = <y_skew>
			}
			additional_y_skew_params = {
				pad_up_script = cap_layer_set_x_skew
				pad_down_script = cap_layer_set_x_skew
				start_value = <x_skew>
			}
		endif
		button_widget_add_item {
			widget_id = x_skew_widget
			text = qs(0xc432bf92)
			button_icon = widget_shear
			start_value = <x_skew>
			min = ($min_skew)
			Max = ($max_skew)
			step = ($skew_increment)
			pad_left_script = cap_layer_set_x_skew
			pad_left_params = {part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>}
			pad_right_script = cap_layer_set_x_skew
			pad_right_params = {part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>}
			fill_type = `center	left/right`
			<no_cas_handlers>
			deinit_script = widget_accept_cap
			deinit_params = {part = <part>}
			init_script = widget_init_cap
			init_params = {part = <part>}
			accept_script = widget_accept_cap
			accept_params = {part = <part>}
			camera_list = <camera_list>
			zoom_camera = <zoom_camera>
			<additional_x_skew_params>
		}
		getlayer part = <part> cap_index = <cap_index> layer_index = <layer_index>
		if StructureContains structure = <layer> y_skew
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
			Max = ($max_skew)
			step = ($skew_increment)
			pad_up_script = cap_layer_set_y_skew
			pad_up_params = {part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>}
			pad_down_script = cap_layer_set_y_skew
			pad_down_params = {part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>}
			fill_type = `center	up/down`
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
			<additional_y_skew_params>
		}
	endif
	if NOT StructureContains structure = <mask> NO_ROTATE
		getlayer part = <part> cap_index = <cap_index> layer_index = <layer_index>
		if StructureContains structure = <layer> rot
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
			Max = ($max_rot)
			step = ($rot_increment)
			pad_up_script = cap_layer_set_rot
			pad_up_params = {part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>}
			pad_down_script = cap_layer_set_rot
			pad_down_params = {part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>}
			fill_type = `counter	clockwise`
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
	endif
	if NOT StructureContains structure = <mask> no_u_flip
		if is_flip_layer_horizontal part = <part> cap_index = <cap_index> layer_index = <layer_index>
			horiz_on = true
		endif
		if (<part> = cas_guitar_body || <part> = cas_bass_body || <part> = cas_guitar_head || <part> = cas_bass_head)
			pad_choose_script = flip_layer_vertical
		else
			pad_choose_script = flip_layer_horizontal
		endif
		add_generic_menu_button_icon_item {
			id = flip_horiz_widget
			icon = widget_flip
			text = qs(0xc619fe8a)
			pad_choose_sound = ui_menu_select_sfx
			pad_choose_script = <pad_choose_script>
			pad_choose_params = {part = <part> cap_index = <cap_index> layer_index = <layer_index>}
			icon_rot = 90
			On = <horiz_on>
			icon_dims = (54.0, 54.0)
			icon_offset = (-120.0, 0.0)
			icon_anchor = [center , center]
		}
	endif
	if NOT StructureContains structure = <mask> no_v_flip
		if is_flip_layer_vertical part = <part> cap_index = <cap_index> layer_index = <layer_index>
			vert_on = true
		endif
		if (<part> = cas_guitar_body || <part> = cas_bass_body || <part> = cas_guitar_head || <part> = cas_bass_head)
			pad_choose_script = flip_layer_horizontal
		else
			pad_choose_script = flip_layer_vertical
		endif
		add_generic_menu_button_icon_item {
			id = flip_vert_widget
			icon = widget_flip
			text = qs(0x2916c9f2)
			pad_choose_sound = ui_menu_select_sfx
			pad_choose_script = <pad_choose_script>
			pad_choose_params = {part = <part> cap_index = <cap_index> layer_index = <layer_index>}
			On = <vert_on>
			icon_dims = (54.0, 54.0)
			icon_offset = (-120.0, 0.0)
			icon_anchor = [center , center]
		}
	endif
	add_generic_menu_icon_item {
		icon = widget_default
		text = qs(0x675459e3)
		pad_choose_sound = ui_menu_select_sfx
		pad_choose_script = reset_layer_to_default
		pad_choose_params = {mask = <mask> part = <part> cap_index = <cap_index> layer_index = <layer_index> section = <section> mask = <mask>}
	}
endscript

script cap_layer_set_alpha 
	CastToInteger \{value}
	if GotParam \{pre_layer}
		get_cap part = <part> section = <section> mask_index = <mask_index>
		pre_layer = {<pre_layer>
			a = <value>}
		set_cap part = <part> section = <section> pre_layer = <pre_layer> mask_index = <mask_index>
	endif
	if GotParam \{post_layer}
		get_cap part = <part> section = <section> mask_index = <mask_index>
		post_layer = {<post_layer>
			a = <value>}
		set_cap part = <part> section = <section> post_layer = <post_layer> mask_index = <mask_index>
	endif
	if GotParam \{layer}
		getlayer part = <part> cap_index = <cap_index> layer_index = <layer_index>
		layer = {<layer>
			a = <value>}
		setlayer part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>
	endif
endscript

script cap_layer_set_x_scale 
	CastToInteger \{value}
	if GotParam \{pre_layer}
		get_cap part = <part> section = <section> mask_index = <mask_index>
		pre_layer = {<pre_layer>
			x_scale = <value>}
		set_cap part = <part> section = <section> pre_layer = <pre_layer> mask_index = <mask_index>
	endif
	if GotParam \{post_layer}
		get_cap part = <part> section = <section> mask_index = <mask_index>
		post_layer = {<post_layer>
			x_scale = <value>}
		set_cap part = <part> section = <section> post_layer = <post_layer> mask_index = <mask_index>
	endif
	if GotParam \{layer}
		getlayer part = <part> cap_index = <cap_index> layer_index = <layer_index>
		layer = {<layer>
			x_scale = <value>}
		setlayer part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>
	endif
endscript

script cap_layer_set_y_scale 
	CastToInteger \{value}
	if GotParam \{pre_layer}
		get_cap part = <part> section = <section> mask_index = <mask_index>
		pre_layer = {<pre_layer>
			y_scale = <value>}
		set_cap part = <part> section = <section> pre_layer = <pre_layer> mask_index = <mask_index>
	endif
	if GotParam \{post_layer}
		get_cap part = <part> section = <section> mask_index = <mask_index>
		post_layer = {<post_layer>
			y_scale = <value>}
		set_cap part = <part> section = <section> post_layer = <post_layer> mask_index = <mask_index>
	endif
	if GotParam \{layer}
		getlayer part = <part> cap_index = <cap_index> layer_index = <layer_index>
		layer = {<layer>
			y_scale = <value>}
		setlayer part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>
	endif
endscript

script cap_layer_set_uni_scale 
	CastToInteger \{value}
	x_scale = ($default_cap_scale)
	y_scale = ($default_cap_scale)
	if GotParam \{layer}
		getlayer part = <part> cap_index = <cap_index> layer_index = <layer_index>
		if StructureContains structure = <layer> x_scale
			x_scale = (<layer>.x_scale)
		endif
		if StructureContains structure = <layer> y_scale
			y_scale = (<layer>.y_scale)
		endif
	endif
	if GotParam \{pre_layer}
		get_cap part = <part> section = <section> mask_index = <mask_index>
		if StructureContains structure = <pre_layer> x_scale
			x_scale = (<pre_layer>.x_scale)
		endif
		if StructureContains structure = <pre_layer> y_scale
			y_scale = (<pre_layer>.y_scale)
		endif
	endif
	if GotParam \{post_layer}
		get_cap part = <part> section = <section> mask_index = <mask_index>
		if StructureContains structure = <post_layer> x_scale
			x_scale = (<post_layer>.x_scale)
		endif
		if StructureContains structure = <post_layer> y_scale
			y_scale = (<post_layer>.y_scale)
		endif
	endif
	y_scale = (<y_scale> * 1.0)
	x_scale = (<x_scale> * 1.0)
	if (<y_scale> > <x_scale>)
		y_scale = <value>
		x_scale = (<value> * <aspect_ratio>)
	else
		x_scale = <value>
		y_scale = (<value> * <aspect_ratio>)
	endif
	y_scale = (<y_scale> + 0.5)
	x_scale = (<x_scale> + 0.5)
	CastToInteger \{y_scale}
	CastToInteger \{x_scale}
	printstruct <...>
	if GotParam \{pre_layer}
		get_cap part = <part> section = <section> mask_index = <mask_index>
		pre_layer = {<pre_layer>
			y_scale = <y_scale>
			x_scale = <x_scale>}
		set_cap part = <part> section = <section> pre_layer = <pre_layer> mask_index = <mask_index>
	endif
	if GotParam \{post_layer}
		get_cap part = <part> section = <section> mask_index = <mask_index>
		post_layer = {<post_layer>
			y_scale = <y_scale>
			x_scale = <x_scale>}
		set_cap part = <part> section = <section> post_layer = <post_layer> mask_index = <mask_index>
	endif
	if GotParam \{layer}
		getlayer part = <part> cap_index = <cap_index> layer_index = <layer_index>
		layer = {<layer>
			y_scale = <y_scale>
			x_scale = <x_scale>}
		setlayer part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>
	endif
endscript

script cap_layer_set_x_trans 
	CastToInteger \{value}
	if GotParam \{pre_layer}
		get_cap part = <part> section = <section> mask_index = <mask_index>
		pre_layer = {<pre_layer>
			x_trans = <value>}
		set_cap part = <part> section = <section> pre_layer = <pre_layer> mask_index = <mask_index>
	endif
	if GotParam \{post_layer}
		get_cap part = <part> section = <section> mask_index = <mask_index>
		post_layer = {<post_layer>
			x_trans = <value>}
		set_cap part = <part> section = <section> post_layer = <post_layer> mask_index = <mask_index>
	endif
	if GotParam \{layer}
		getlayer part = <part> cap_index = <cap_index> layer_index = <layer_index>
		layer = {<layer>
			x_trans = <value>}
		setlayer part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>
	endif
endscript

script cap_layer_set_y_trans 
	if GotParam \{reverse}
		value = (-1 * <value>)
	endif
	CastToInteger \{value}
	if GotParam \{pre_layer}
		get_cap part = <part> section = <section> mask_index = <mask_index>
		pre_layer = {<pre_layer>
			y_trans = <value>}
		set_cap part = <part> section = <section> pre_layer = <pre_layer> mask_index = <mask_index>
	endif
	if GotParam \{post_layer}
		get_cap part = <part> section = <section> mask_index = <mask_index>
		post_layer = {<post_layer>
			y_trans = <value>}
		set_cap part = <part> section = <section> post_layer = <post_layer> mask_index = <mask_index>
	endif
	if GotParam \{layer}
		getlayer part = <part> cap_index = <cap_index> layer_index = <layer_index>
		layer = {<layer>
			y_trans = <value>}
		setlayer part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>
	endif
endscript

script cap_layer_set_x_skew 
	if GotParam \{reverse}
		value = (-1 * <value>)
	endif
	CastToInteger \{value}
	if GotParam \{pre_layer}
		get_cap part = <part> section = <section> mask_index = <mask_index>
		pre_layer = {<pre_layer>
			x_skew = <value>}
		set_cap part = <part> section = <section> pre_layer = <pre_layer> mask_index = <mask_index>
	endif
	if GotParam \{post_layer}
		get_cap part = <part> section = <section> mask_index = <mask_index>
		post_layer = {<post_layer>
			x_skew = <value>}
		set_cap part = <part> section = <section> post_layer = <post_layer> mask_index = <mask_index>
	endif
	if GotParam \{layer}
		getlayer part = <part> cap_index = <cap_index> layer_index = <layer_index>
		layer = {<layer>
			x_skew = <value>}
		setlayer part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>
	endif
endscript

script cap_layer_set_y_skew 
	CastToInteger \{value}
	if GotParam \{pre_layer}
		get_cap part = <part> section = <section> mask_index = <mask_index>
		pre_layer = {<pre_layer>
			y_skew = <value>}
		set_cap part = <part> section = <section> pre_layer = <pre_layer> mask_index = <mask_index>
	endif
	if GotParam \{post_layer}
		get_cap part = <part> section = <section> mask_index = <mask_index>
		post_layer = {<post_layer>
			y_skew = <value>}
		set_cap part = <part> section = <section> post_layer = <post_layer> mask_index = <mask_index>
	endif
	if GotParam \{layer}
		getlayer part = <part> cap_index = <cap_index> layer_index = <layer_index>
		layer = {<layer>
			y_skew = <value>}
		setlayer part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>
	endif
endscript

script cap_layer_set_rot 
	CastToInteger \{value}
	if GotParam \{pre_layer}
		get_cap part = <part> section = <section> mask_index = <mask_index>
		pre_layer = {<pre_layer>
			rot = <value>}
		set_cap part = <part> section = <section> pre_layer = <pre_layer> mask_index = <mask_index>
	endif
	if GotParam \{post_layer}
		get_cap part = <part> section = <section> mask_index = <mask_index>
		post_layer = {<post_layer>
			rot = <value>}
		set_cap part = <part> section = <section> post_layer = <post_layer> mask_index = <mask_index>
	endif
	if GotParam \{layer}
		getlayer part = <part> cap_index = <cap_index> layer_index = <layer_index>
		layer = {<layer>
			rot = <value>}
		setlayer part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>
	endif
endscript

script get_cap 
	if NOT getcasappearancepart part = <part>
		ScriptAssert '%s not found' s = <part> donotresolve donotresolve
	endif
	mask = (<section>.mask)
	set_cap_flags mask = ((<mask>) [<mask_index>])
	if GotParam \{cap}
		GetArraySize (cap)
		capsize = <array_Size>
		i = 0
		begin
		if is_matching_section cap = (<cap> [<i>]) section = <section>
			if StructureContains structure = (<cap> [<i>]) pre_layer
				if StructureContains structure = <section> pre_userlayer
					cap_populate_layer cap_entry = ((<cap> [<i>]).pre_layer) mask_entry = ((<mask>) [<mask_index>]) flags = <flags>
					if GotParam \{layer}
						return pre_layer = <layer>
					endif
				endif
			endif
			if StructureContains structure = (<cap> [<i>]) post_layer
				if StructureContains structure = <section> post_userlayer
					cap_populate_layer cap_entry = ((<cap> [<i>]).post_layer) mask_entry = ((<mask>) [<mask_index>]) flags = <flags>
					if GotParam \{layer}
						return post_layer = <layer>
					endif
				endif
			endif
		endif
		i = (<i> + 1)
		repeat <capsize>
	endif
	if StructureContains structure = <section> pre_userlayer
		cap_new_artist_layer section = <section> mask_entry = ((<mask>) [<mask_index>]) flags = <flags>
		return pre_layer = <layer>
	endif
	if StructureContains structure = <section> post_userlayer
		cap_new_artist_layer section = <section> mask_entry = ((<mask>) [<mask_index>]) flags = <flags>
		return post_layer = <layer>
	endif
endscript

script set_cap 
	RequireParams \{[
			section
			part
		]
		all}
	if NOT getcasappearancepart part = <part>
		ScriptAssert '%s not found' s = <part> donotresolve donotresolve
	endif
	mask = (<section>.mask)
	if GotParam \{cap}
		found_mat = 0
		GetArraySize (cap)
		cap_array_size = <array_Size>
		i = 0
		begin
		formatText checksumName = Name '%s' s = (<section>.base_tex)
		if is_matching_section cap = (<cap> [<i>]) section = <section>
			found_mat = 1
			found_tex = 0
			capstruct = (<cap> [<i>])
			if ((GotParam pre_layer) && (StructureContains structure = <capstruct> pre_layer))
				GetArraySize ((<cap> [<i>]).pre_layer)
				mat_array_size = <array_Size>
				j = 0
				begin
				if StructureContains structure = ((<mask>) [<mask_index>]) pattern
					fiximagepath path = (((<mask>) [<mask_index>]).pattern)
					if in_tex_same_section section = <section> prev_tex = <Name> new_tex = ((((<cap> [<i>]).pre_layer) [<j>]).texture)
						found_tex = 1
						pre_layers = ((<cap> [<i>]).pre_layer)
						SetArrayElement ArrayName = pre_layers index = <j> NewValue = <pre_layer>
						SetArrayElement ArrayName = cap index = <i> NewValue = {
							(<cap> [<i>])
							pre_layer = <pre_layers>
						}
						setcasappearancecap part = <part> cap = <cap>
						updatecasmodelcap part = <part>
						return
					endif
				elseif StructureContains structure = ((<mask>) [<mask_index>]) font
					if in_font_same_section section = <section> prev_text = (((<mask>) [<mask_index>]).text) new_text = ((((<cap> [<i>]).pre_layer) [<j>]).text)
						found_tex = 1
						pre_layers = ((<cap> [<i>]).pre_layer)
						SetArrayElement ArrayName = pre_layers index = <j> NewValue = <pre_layer>
						SetArrayElement ArrayName = cap index = <i> NewValue = {
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
				if GotParam \{index}
					insertarrayelement array = ((<cap> [<i>]).pre_layer) element = <pre_layer> index = <index>
					SetArrayElement ArrayName = cap index = <i> NewValue = {
						(<cap> [<i>])
						pre_layer = <array>
					}
				else
					AddArrayElement array = ((<cap> [<i>]).pre_layer) element = <pre_layer>
					SetArrayElement ArrayName = cap index = <i> NewValue = {
						(<cap> [<i>])
						pre_layer = <array>
					}
				endif
				setcasappearancecap part = <part> cap = <cap>
				updatecasmodelcap part = <part>
				return
			elseif ((GotParam post_layer) && (StructureContains structure = <capstruct> post_layer))
				GetArraySize ((<cap> [<i>]).post_layer)
				mat_array_size = <array_Size>
				j = 0
				begin
				if StructureContains structure = ((<mask>) [<mask_index>]) pattern
					fiximagepath path = (((<mask>) [<mask_index>]).pattern)
					if in_tex_same_section section = <section> prev_tex = <Name> new_tex = ((((<cap> [<i>]).post_layer) [<j>]).texture)
						found_tex = 1
						post_layers = ((<cap> [<i>]).post_layer)
						SetArrayElement ArrayName = post_layers index = <j> NewValue = <post_layer>
						SetArrayElement ArrayName = cap index = <i> NewValue = {
							(<cap> [<i>])
							post_layer = <post_layers>
						}
						setcasappearancecap part = <part> cap = <cap>
						updatecasmodelcap part = <part>
						return
					endif
				elseif StructureContains structure = ((<mask>) [<mask_index>]) font
					if in_font_same_section section = <section> prev_text = (((<mask>) [<mask_index>]).text) new_text = ((((<cap> [<i>]).post_layer) [<j>]).text)
						found_tex = 1
						post_layer = ((<cap> [<i>]).post_layer)
						SetArrayElement ArrayName = post_layer index = <j> NewValue = <post_layer>
						SetArrayElement ArrayName = cap index = <i> NewValue = {
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
				if GotParam \{index}
					insertarrayelement array = ((<cap> [<i>]).post_layer) element = <post_layer> index = <index>
					SetArrayElement ArrayName = cap index = <i> NewValue = {
						(<cap> [<i>])
						post_layer = <array>
					}
				else
					AddArrayElement array = ((<cap> [<i>]).post_layer) element = <post_layer>
					SetArrayElement ArrayName = cap index = <i> NewValue = {
						(<cap> [<i>])
						post_layer = <array>
					}
				endif
				setcasappearancecap part = <part> cap = <cap>
				updatecasmodelcap part = <part>
				return
			else
				printf \{qs(0x1aff5f9d)}
				if GotParam \{pre_layer}
					printf \{qs(0x1305fce1)}
					pre_layers = [{<pre_layer>}]
					SetArrayElement ArrayName = cap index = <i> NewValue = {
						(<cap> [<i>])
						pre_layer = <pre_layers>
					}
				endif
				if GotParam \{post_layer}
					printf \{qs(0x4af2b10e)}
					post_layers = [{<post_layer>}]
					SetArrayElement ArrayName = cap index = <i> NewValue = {
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
			formatText checksumName = Name '%s' s = (<section>.base_tex)
			if GotParam \{pre_layer}
				new_select = [{<pre_layer>}]
				entry = {
					base_tex = <Name>
					material = (<section>.material)
					pre_layer = <new_select>
				}
				cap_set_target entry = <entry> section = <section>
			endif
			if GotParam \{post_layer}
				new_select = [{<post_layer>}]
				entry = {
					base_tex = <Name>
					material = (<section>.material)
					post_layer = <new_select>
				}
				cap_set_target entry = <entry> section = <section>
			endif
			AddArrayElement array = <cap> element = <entry>
			<cap> = <array>
			setcasappearancecap part = <part> cap = <cap>
			updatecasmodelcap part = <part>
			return
		endif
	else
		formatText checksumName = Name '%s' s = (<section>.base_tex)
		if GotParam \{pre_layer}
			new_select = [{<pre_layer>}]
			entry = {
				base_tex = <Name>
				material = (<section>.material)
				pre_layer = <new_select>
			}
			cap_set_target entry = <entry> section = <section>
			cap = [{<entry>}]
		endif
		if GotParam \{post_layer}
			new_select = [{<post_layer>}]
			entry = {
				base_tex = <Name>
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
	RequireParams \{[
			prev_tex
			new_tex
			section
		]
		all}
	mask = (<section>.mask)
	match_prev_tex = 0
	match_new_tex = 0
	GetArraySize (<mask>)
	j = 0
	begin
	fiximagepath path = (((<mask>) [<j>]).pattern)
	if (<Name> = <prev_tex>)
		match_prev_tex = 1
	endif
	if (<Name> = <new_tex>)
		match_new_tex = 1
	endif
	j = (<j> + 1)
	repeat <array_Size>
	if (<match_prev_tex> = 1)
		if (<match_new_tex> = 1)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script in_font_same_section 
	RequireParams \{[
			prev_text
			new_text
			section
		]
		all}
	mask = (<section>.mask)
	match_prev_text = 0
	match_new_text = 0
	GetArraySize (<mask>)
	j = 0
	begin
	fiximagepath path = (((<mask>) [<j>]).text)
	if (<Name> = <prev_text>)
		match_prev_text = 1
	endif
	if (<Name> = <new_text>)
		match_new_text = 1
	endif
	j = (<j> + 1)
	repeat <array_Size>
	if (<match_prev_text> = 1)
		if (<match_new_text> = 1)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script reset_to_default 
	RequireParams \{[
			section
			mask_index
		]
		all}
	mask = (<section>.mask)
	set_cap_flags mask = ((<mask>) [<mask_index>])
	if StructureContains structure = <section> pre_userlayer
		reset_to_default_helper mask_entry = ((<mask>) [<mask_index>]) flags = <flags> section = <section>
		set_cap part = <part> section = <section> pre_layer = <layer> mask_index = <mask_index>
	endif
	if StructureContains structure = <section> post_userlayer
		reset_to_default_helper mask_entry = ((<mask>) [<mask_index>]) flags = <flags> section = <section>
		set_cap part = <part> section = <section> post_layer = <layer> mask_index = <mask_index>
	endif
	reset_widgets layer = <layer>
endscript

script reset_to_default_helper 
	RequireParams \{[
			mask_entry
			flags
			section
		]
		all}
	if StructureContains structure = <mask_entry> pattern
		fiximagepath path = (<mask_entry>.pattern)
		layer = {texture = <Name>}
	elseif StructureContains structure = <mask_entry> font
		layer = {font = (<mask_entry>.font)
			text = (<mask_entry>.text)}
	endif
	if NOT (<flags> = 0)
		layer = {<layer>
			flags = <flags>}
	endif
	if StructureContains structure = <section> initial_values
		layer = {<layer> (<section>.initial_values)}
	endif
	if StructureContains structure = <mask_entry> initial_values
		layer = {<layer> (<mask_entry>.initial_values)}
	endif
	return layer = <layer>
endscript

script add_layer_to_profile 
	RequireParams \{[
			section
			mask
			part
		]
		all}
	if NOT getcasappearancepart part = <part>
		ScriptAssert '%s not found' s = <part> donotresolve donotresolve
	endif
	set_cap_flags mask = (<mask>)
	if StructureContains structure = <mask> pattern
		fiximagepath path = (<mask>.pattern)
		layer = {texture = <Name>}
	elseif StructureContains structure = <mask> font
		layer = {font = (<mask>.font)
			text = (<mask>.text)}
	endif
	if NOT (<flags> = 0)
		layer = {<layer>
			flags = <flags>}
	endif
	if StructureContains structure = <section> initial_values
		initial_values = (<section>.initial_values)
		layer = {<layer>
			<initial_values>}
		if ((StructureContains structure = initial_values x_trans) || (StructureContains structure = initial_values y_trans))
			no_average = 1
		endif
	endif
	if StructureContains structure = (<mask>) initial_values
		initial_values = ((<mask>).initial_values)
		layer = {<layer>
			((<mask>).initial_values)}
		if ((StructureContains structure = initial_values x_trans) || (StructureContains structure = initial_values y_trans))
			no_average = 1
		endif
	endif
	if StructureContains structure = <section> center
		x_trans = (50 - (<section>.center [0]))
		y_trans = (50 - (<section>.center [1]))
		CastToInteger \{x_trans}
		CastToInteger \{y_trans}
		if NOT (<x_trans> = 0)
			layer = {<layer>
				x_trans = <x_trans>}
		endif
		if NOT (<y_trans> = 0)
			layer = {<layer>
				y_trans = <y_trans>}
		endif
	endif
	if GotParam \{cap}
		GetArraySize (cap)
		cap_array_size = <array_Size>
		if (<cap_array_size> > 0)
			i = 0
			begin
			formatText checksumName = Name '%s' s = (<section>.base_tex)
			if is_matching_section cap = (<cap> [<i>]) section = <section>
				if StructureContains structure = (<cap> [<i>]) layers
					GetArraySize (((<cap> [<i>]).layers))
					AddArrayElement array = ((<cap> [<i>]).layers) element = <layer>
					new_layers = <array>
					SetArrayElement ArrayName = cap index = <i> NewValue = {
						(<cap> [<i>])
						layers = <new_layers>
					}
					setcasappearancecap part = <part> cap = <cap>
					updatecasmodelcap part = <part>
					return cap_index = <i> layer_index = <array_Size>
				else
					SetArrayElement ArrayName = cap index = <i> NewValue = {
						(<cap> [<i>])
						layers = [{<layer>}]
					}
					setcasappearancecap part = <part> cap = <cap>
					updatecasmodelcap part = <part>
					return cap_index = <i> layer_index = 0
				endif
			endif
			i = (<i> + 1)
			repeat <cap_array_size>
		endif
		formatText checksumName = Name '%s' s = (<section>.base_tex)
		entry = {
			base_tex = <Name>
			material = (<section>.material)
			layers = [{<layer>}]
		}
		cap_set_target entry = <entry> section = <section>
		AddArrayElement array = <cap> element = <entry>
		<cap> = <array>
		setcasappearancecap part = <part> cap = <cap>
		updatecasmodelcap part = <part>
		return cap_index = (<cap_array_size>) layer_index = 0
	endif
	formatText checksumName = Name '%s' s = (<section>.base_tex)
	new_layers = [{<layer>}]
	entry = {
		base_tex = <Name>
		material = (<section>.material)
		layers = <new_layers>
	}
	cap_set_target entry = <entry> section = <section>
	cap = [{<entry>}]
	setcasappearancecap part = <part> cap = <cap>
	updatecasmodelcap part = <part>
	return \{cap_index = 0
		layer_index = 0}
endscript

script match_layers_texture 
	RequireParams \{[
			prof_texture
			sections
		]
		all}
	GetArraySize (sections)
	sections_size = <array_Size>
	i = 0
	begin
	if StructureContains structure = (<sections> [<i>]) mask
		if section_has_target_and_material section = (<sections> [<i>]) target = <target> material = <material>
			mask = (<sections> [<i>].mask)
			GetArraySize (mask)
			mask_size = <array_Size>
			j = 0
			begin
			if StructureContains structure = ((<mask>) [<j>]) pattern
				fiximagepath path = ((<mask>) [<j>].pattern)
				if (<Name> = <prof_texture>)
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
	RequireParams \{[
			prof_font
			prof_text
			sections
		]
		all}
	GetArraySize (sections)
	sections_size = <array_Size>
	i = 0
	begin
	if StructureContains structure = (<sections> [<i>]) mask
		if section_has_target_and_material section = (<sections> [<i>]) target = <target> material = <material>
			mask = (<sections> [<i>].mask)
			GetArraySize (mask)
			mask_size = <array_Size>
			j = 0
			begin
			if StructureContains structure = ((<mask>) [<j>]) font
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
		ScriptAssert '%s not found' s = <part> donotresolve
	endif
	if NOT CD
		GetArraySize <cap>
		if (<cap_index> > (<array_Size> -1))
			ScriptAssert \{qs(0x69c75a7f)}
		endif
		GetArraySize ((<cap> [<cap_index>]).layers)
		if (<layer_index> > (<array_Size> -1))
			ScriptAssert \{qs(0xd06c9a70)}
		endif
	endif
	if GotParam \{cap}
		if StructureContains structure = (((<cap> [<cap_index>]).layers) [<layer_index>]) texture
			layer = {texture = ((((<cap> [<cap_index>]).layers) [<layer_index>]).texture)}
		elseif StructureContains structure = (((<cap> [<cap_index>]).layers) [<layer_index>]) font
			layer = {font = ((((<cap> [<cap_index>]).layers) [<layer_index>]).font)
				text = ((((<cap> [<cap_index>]).layers) [<layer_index>]).text)}
		endif
		layer = {
			<layer>
			Color = ((((<cap> [<cap_index>]).layers) [<layer_index>]).Color)
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
	RequireParams \{[
			layer_index
			cap_index
			part
			layer
		]
		all}
	if NOT getcasappearancepart part = <part>
		ScriptAssert '%s not found' s = <part> donotresolve donotresolve
	endif
	if GotParam \{cap}
		old_layers = ((<cap> [<cap_index>]).layers)
		SetArrayElement ArrayName = old_layers index = <layer_index> NewValue = <layer>
		SetArrayElement ArrayName = cap index = <cap_index> NewValue = {
			(<cap> [<cap_index>])
			layers = <old_layers>
		}
		setcasappearancecap part = <part> cap = <cap>
		updatecasmodelcap part = <part> nounload
	endif
endscript

script reset_layer_to_default 
	RequireParams \{[
			mask
			layer_index
			cap_index
			part
			section
		]
		all}
	getlayer part = <part> cap_index = <cap_index> layer_index = <layer_index>
	set_cap_flags mask = (<mask>)
	if StructureContains structure = <mask> pattern
		fiximagepath path = (<mask>.pattern)
		layer = {texture = <Name>}
	elseif StructureContains structure = <mask> font
		layer = {font = (<mask>.font) text = (<mask>.text)}
	endif
	if NOT (<flags> = 0)
		layer = {<layer>
			flags = <flags>}
	endif
	if StructureContains structure = <section> initial_values
		layer = {<layer> (<section>.initial_values)}
	endif
	if StructureContains structure = <mask> initial_values
		layer = {<layer> (<mask>.initial_values)}
	endif
	setlayer part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>
	reset_widgets layer = <layer>
	reset_flip_buttons part = <part> cap_index = <cap_index> layer_index = <layer_index>
endscript

script delete_layer 
	RequireParams \{[
			cap_index
			layer_index
			part
		]
		all}
	if NOT getcasappearancepart part = <part>
		ScriptAssert '%s not found' s = <part> donotresolve donotresolve
	endif
	if GotParam \{cap}
		RemoveArrayElement array = ((<cap> [<cap_index>]).layers) index = <layer_index>
		SetArrayElement ArrayName = cap index = <cap_index> NewValue = {
			(<cap> [<cap_index>])
			layers = <array>
		}
		GetArraySize (array)
		if (<array_Size> = 0)
			cap_struct = (<cap> [<cap_index>])
			if ((StructureContains structure = <cap_struct> pre_layer) || (StructureContains structure = <cap_struct> post_layer))
				capstruct = (<cap> [<cap_index>])
				RemoveComponent \{Name = layers
					structure_name = capstruct}
				SetArrayElement ArrayName = cap index = <cap_index> NewValue = <capstruct>
			else
				RemoveArrayElement array = (<cap>) index = <cap_index>
				cap = <array>
			endif
		endif
		GetArraySize (cap)
		if (<array_Size> = 0)
			setcasappearancecap part = <part>
		else
			setcasappearancecap part = <part> cap = <cap>
		endif
		if NOT GotParam \{skip_build}
			updatecasmodelcap part = <part>
		endif
	endif
endscript

script has_user_layers 
	RequireParams \{[
			sections
		]
		all}
	GetArraySize (sections)
	i = 0
	begin
	if NOT StructureContains structure = (<sections> [<i>]) pre_userlayer
		return \{true}
	endif
	if NOT StructureContains structure = (<sections> [<i>]) post_userlayer
		return \{true}
	endif
	i = (<i> + 1)
	repeat <array_Size>
	return \{FALSE}
endscript

script get_proper_location 
	RequireParams \{[
			section
			part
		]
		all}
	if GotParam \{pre_layer}
		GetArraySize (pre_layer)
		i = 0
		begin
		if NOT is_pre_layer_before_section section = <section> pre_layer = (<pre_layer> [<i>]) part = <part>
			return index = <i>
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	if GotParam \{post_layer}
		GetArraySize (post_layer)
		i = 0
		begin
		if NOT is_pre_layer_before_section section = <section> post_layer = (<post_layer> [<i>]) part = <part>
			return index = <i>
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
endscript

script is_pre_layer_before_section 
	RequireParams \{[
			part
		]
		all}
	if GotParam \{pre_layer}
		get_section_index_of_pre_layer pre_layer = <pre_layer> section = <section> part = <part>
	endif
	if GotParam \{post_layer}
		get_section_index_of_pre_layer post_layer = <post_layer> section = <section> part = <part>
	endif
	if ((GotParam pre_layer_section_index) && (GotParam section_index))
		if (<pre_layer_section_index> < <section_index>)
			return \{true}
		else
			return \{FALSE}
		endif
	endif
endscript

script get_section_index_of_pre_layer 
	if NOT getcasappearancepart part = <part>
		ScriptAssert '%s not found' s = <part> donotresolve
	endif
	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
		ScriptAssert '%s %t not found' s = <part> t = <desc_id>
	endif
	if GotParam \{sections}
		if GotParam \{pre_layer}
			if StructureContains structure = <pre_layer> texture
				match_layers_texture prof_texture = (<pre_layer>.texture) sections = <sections>
			elseif StructureContains structure = <pre_layer> font
				match_layers_font prof_font = (<pre_layer>.font) prof_text = (<pre_layer>.text) sections = <sections>
			endif
			GetArraySize (sections)
			i = 0
			begin
			if ((<sections> [<i>].mask) = (<section>.mask))
				return pre_layer_section_index = <section_index> section_index = <i>
			endif
			i = (<i> + 1)
			repeat <array_Size>
		endif
		if GotParam \{post_layer}
			if StructureContains structure = <post_layer> texture
				match_layers_texture prof_texture = (<post_layer>.texture) sections = <sections>
			elseif StructureContains structure = <post_layer> font
				match_layers_font prof_font = (<post_layer>.font) prof_text = (<post_layer>.text) sections = <sections>
			endif
			GetArraySize (sections)
			i = 0
			begin
			if ((<sections> [<i>].mask) = (<section>.mask))
				return pre_layer_section_index = <section_index> section_index = <i>
			endif
			i = (<i> + 1)
			repeat <array_Size>
		endif
	else
		ScriptAssert \{qs(0x8ed8529e)}
	endif
endscript

script set_cap_flags 
	RequireParams \{[
			mask
		]
		all}
	flags = 0
	if StructureContains structure = <mask> clamp_u
		flags = (<flags> || 1)
	endif
	if StructureContains structure = <mask> clamp_v
		flags = (<flags> || 2)
	endif
	if StructureContains structure = <mask> clamp_uv
		flags = 3
	endif
	if StructureContains structure = <mask> static_alpha
		flags = (<flags> || 4)
	endif
	if StructureContains structure = <mask> wrap_texture
		flags = (<flags> || 32)
	endif
	return flags = <flags>
endscript

script flip_layer_horizontal 
	if NOT getcasappearancepart part = <part>
		ScriptAssert '%s not found' s = <part> donotresolve donotresolve
	endif
	layer = (((<cap> [<cap_index>]).layers) [<layer_index>])
	if GotParam \{cap}
		if StructureContains structure = <layer> flags
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
	SetArrayElement ArrayName = old_layers index = <layer_index> NewValue = <layer>
	SetArrayElement ArrayName = cap index = <cap_index> NewValue = {
		(<cap> [<cap_index>])
		layers = <old_layers>
	}
	setcasappearancecap part = <part> cap = <cap>
	updatecasmodelcap part = <part>
endscript

script is_flip_layer_horizontal 
	if NOT getcasappearancepart part = <part>
		ScriptAssert '%s not found' s = <part> donotresolve donotresolve
	endif
	layer = (((<cap> [<cap_index>]).layers) [<layer_index>])
	if GotParam \{cap}
		if StructureContains structure = <layer> flags
			if ((<layer>.flags) && 8)
				return \{true}
			endif
		endif
	endif
	return \{FALSE}
endscript

script flip_layer_vertical 
	if NOT getcasappearancepart part = <part>
		ScriptAssert '%s not found' s = <part> donotresolve donotresolve
	endif
	layer = (((<cap> [<cap_index>]).layers) [<layer_index>])
	if GotParam \{cap}
		if StructureContains structure = <layer> flags
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
	SetArrayElement ArrayName = old_layers index = <layer_index> NewValue = <layer>
	SetArrayElement ArrayName = cap index = <cap_index> NewValue = {
		(<cap> [<cap_index>])
		layers = <old_layers>
	}
	setcasappearancecap part = <part> cap = <cap>
	updatecasmodelcap part = <part>
endscript

script is_flip_layer_vertical 
	if NOT getcasappearancepart part = <part>
		ScriptAssert '%s not found' s = <part> donotresolve donotresolve
	endif
	layer = (((<cap> [<cap_index>]).layers) [<layer_index>])
	if GotParam \{cap}
		if StructureContains structure = <layer> flags
			if ((<layer>.flags) && 16)
				return \{true}
			endif
		endif
	endif
	return \{FALSE}
endscript

script updatecasmodelcap 
	casupdateunloads
	if NOT GotParam \{part}
		ScriptAssert \{'This requires a part parameter, updating CAP on everything at once isn\'t a great idea!'}
	endif
	updatecurrentcasmodel buildscript = update_cap_part buildscriptparams = {part = <part>}
	if NOT GotParam \{nounload}
		castemporariesflush \{group = cap}
	endif
endscript

script is_matching_section 
	formatText checksumName = Name '%s' s = (<section>.base_tex)
	if (((<cap>.material) = (<section>.material)) && ((<cap>.base_tex) = <Name>))
		if ((StructureContains structure = <section> normal_map) && (StructureContains structure = <cap> normal_map))
			return \{true}
		elseif ((StructureContains structure = <section> cas_1) && (StructureContains structure = <cap> cas_1))
			return \{true}
		elseif ((StructureContains structure = <section> cas_2) && (StructureContains structure = <cap> cas_2))
			return \{true}
		elseif ((StructureContains structure = <section> specular) && (StructureContains structure = <cap> specular))
			return \{true}
		elseif ((StructureContains structure = <section> diffuse) && (StructureContains structure = <cap> diffuse))
			return \{true}
		else
			return \{FALSE}
		endif
	endif
	return \{FALSE}
endscript

script cap_set_target 
	RequireParams \{[
			section
			entry
		]
		all}
	if StructureContains structure = <section> normal_map
		entry = {<entry>
			normal_map}
	elseif StructureContains structure = <section> cas_1
		entry = {<entry>
			cas_1}
	elseif StructureContains structure = <section> cas_2
		entry = {<entry>
			cas_2}
	elseif StructureContains structure = <section> specular
		entry = {<entry>
			specular}
	elseif StructureContains structure = <section> diffuse
		entry = {<entry>
			diffuse}
	else
		entry = {<entry>
			diffuse}
	endif
	return entry = <entry>
endscript

script is_target_in_div 
	RequireParams \{[
			target
			part
		]
		all}
	if NOT getcasappearancepart part = <part>
		ScriptAssert '%s not found' s = <part> donotresolve donotresolve
	endif
	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
		ScriptAssert '%s %t not found' s = <part> t = <desc_id>
	endif
	if NOT GotParam \{divisions}
		return \{true}
	elseif NOT GotParam \{div_id}
		return \{true}
	else
		GetArraySize \{divisions}
		if (<array_Size> > 0)
			i = 0
			begin
			if ((<divisions> [<i>].desc_id) = <div_id>)
				if ((<target>.material) = (<divisions> [<i>].material))
					if StructureContains structure = <target> (<divisions> [<i>].target)
						return \{true}
					endif
				endif
			endif
			i = (<i> + 1)
			repeat <array_Size>
		endif
	endif
	return \{FALSE}
endscript

script get_div_info 
	RequireParams \{[
			part
		]}
	if NOT GotParam \{div_id}
		return
	endif
	if NOT getcasappearancepart part = <part>
		ScriptAssert '%s not found' s = <part> donotresolve donotresolve
	endif
	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
		ScriptAssert '%s %t not found' s = <part> t = <desc_id>
	endif
	if GotParam \{divisions}
		GetArraySize \{divisions}
		if (<array_Size> > 0)
			i = 0
			begin
			if ((<divisions> [<i>].desc_id) = <div_id>)
				return target = (<divisions> [<i>].target) material = (<divisions> [<i>].material)
			endif
			i = (<i> + 1)
			repeat <array_Size>
		endif
	endif
endscript

script section_has_target_and_material 
	RequireParams \{[
			section
		]
		all}
	if NOT GotParam \{target}
		return \{true}
	elseif NOT GotParam \{material}
		return \{true}
	else
		if StructureContains structure = <section> <target>
			if checksumequals a = (<section>.material) b = <material>
				return \{true}
			endif
		endif
	endif
	return \{FALSE}
endscript

script add_cap_array_to_part 
	RequireParams \{[
			part
			newstruct
		]
		all}
	if NOT getactualcasoptionstruct part = <part> desc_id = (<newstruct>.desc_id)
		ScriptAssert '%s %t not found' s = <part> t = (<newstruct>.desc_id)
	endif
	if GotParam \{default_cap}
		newstruct = {<newstruct>
			cap = <default_cap>}
		return newstruct = <newstruct>
	endif
endscript

script cap_artist_colorwheel_focus_change 
	get_cap part = <part> section = <section> mask_index = <mask_index>
	if GotParam \{pre_layer}
		pre_layer = {<pre_layer>
			Color = <Color>}
		set_cap part = <part> section = <section> pre_layer = <pre_layer> mask_index = <mask_index>
	endif
	if GotParam \{post_layer}
		post_layer = {<post_layer>
			Color = <Color>}
		set_cap part = <part> section = <section> post_layer = <post_layer> mask_index = <mask_index>
	endif
endscript

script unfocus_color_wheel 
	color_slice_back
	color_wheel_back \{skip_exit_script}
	widget_accept_cap part = <part>
endscript

script cap_get_current_rgb 
	RequireParams \{[
			part
			section
			mask_index
		]
		all}
	get_cap part = <part> section = <section> mask_index = <mask_index>
	if GotParam \{pre_layer}
		if StructureContains structure = <pre_layer> Color
			rgba = ((($color_lookup_table).(<pre_layer>.Color)).diffuse)
		else
			AddArrayElement array = [] element = ($default_cap_red)
			AddArrayElement array = <array> element = ($default_cap_green)
			AddArrayElement array = <array> element = ($default_cap_blue)
			rgba = <array>
		endif
	else
		if StructureContains structure = <post_layer> Color
			rgba = ((($color_lookup_table).(<post_layer>.Color)).diffuse)
		else
			AddArrayElement array = [] element = ($default_cap_red)
			AddArrayElement array = <array> element = ($default_cap_green)
			AddArrayElement array = <array> element = ($default_cap_blue)
			rgba = <array>
		endif
	endif
	return rgb = <rgba>
endscript

script average_layer_translation 
	RequireParams \{[
			layers
		]
		all}
	GetArraySize <layers>
	if (<array_Size> > 0)
		sum_x = 0
		sum_y = 0
		i = 0
		begin
		if StructureContains structure = (<layers> [<i>]) x_trans
			x_trans = ((<layers> [<i>]).x_trans)
			sum_x = (<sum_x> + <x_trans>)
		endif
		if StructureContains structure = (<layers> [<i>]) y_trans
			y_trans = ((<layers> [<i>]).y_trans)
			sum_y = (<sum_y> + <y_trans>)
		endif
		i = (<i> + 1)
		repeat <array_Size>
		return x_trans = (<sum_x> / <array_Size>) y_trans = (<sum_y> / <array_Size>)
	endif
endscript

script cap_no_transforms 
	RequireParams \{[
			mask
		]
		all}
	if StructureContains structure = <mask> no_edit_options
		return \{true}
	elseif NOT StructureContains structure = <mask> no_color
		return \{FALSE}
	elseif NOT StructureContains structure = <mask> no_alpha
		return \{FALSE}
	elseif NOT StructureContains structure = <mask> no_translate
		return \{FALSE}
	elseif NOT StructureContains structure = <mask> no_scale
		return \{FALSE}
	elseif NOT StructureContains structure = <mask> NO_ROTATE
		return \{FALSE}
	elseif NOT StructureContains structure = <mask> no_skew
		return \{FALSE}
	elseif NOT StructureContains structure = <mask> no_u_flip
		return \{FALSE}
	elseif NOT StructureContains structure = <mask> no_v_flip
		return \{FALSE}
	else
		return \{true}
	endif
endscript

script cap_populate_layer 
	GetArraySize <cap_entry>
	j = 0
	begin
	cap_entry_struct = (<cap_entry> [<j>])
	if ((StructureContains structure = <cap_entry_struct> texture) && (StructureContains structure = <mask_entry> pattern))
		fiximagepath path = (<mask_entry>.pattern)
		if (((<cap_entry> [<j>]).texture) = <Name>)
			fiximagepath path = (<mask_entry>.pattern)
			layer = {
				texture = <Name>
				Color = ((<cap_entry> [<j>]).Color)
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
	elseif ((StructureContains structure = <cap_entry_struct> font) && (StructureContains structure = <mask_entry> font))
		layer = {
			font = (<mask_entry>.font)
			text = (<mask_entry>.text)
			Color = ((<cap_entry> [<j>]).Color)
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
	repeat <array_Size>
endscript

script cap_new_artist_layer 
	if StructureContains structure = <mask_entry> pattern
		fiximagepath path = (<mask_entry>.pattern)
		layer = {texture = <Name>}
	elseif StructureContains structure = <mask_entry> font
		layer = {font = (<mask_entry>.font) text = (<mask_entry>.text)}
	endif
	if NOT (<flags> = 0)
		layer = {<layer>
			flags = <flags>}
	endif
	if StructureContains structure = <section> center
		x_trans = (50 - (<section>.center [0]))
		y_trans = (50 - (<section>.center [1]))
		CastToInteger \{x_trans}
		CastToInteger \{y_trans}
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
		Color = <Color>}
	setlayer part = <part> cap_index = <cap_index> layer_index = <layer_index> layer = <layer>
endscript

script reset_widgets 
	RequireParams \{[
			layer
		]
		all}
	if StructureContains structure = <layer> a
		button_widget_set_value widget_id = alpha_widget new_value = (<layer>.a)
	else
		button_widget_set_value widget_id = alpha_widget new_value = ($default_cap_alpha)
	endif
	if StructureContains structure = <layer> x_trans
		button_widget_set_value widget_id = x_trans_widget new_value = (<layer>.x_trans)
	else
		button_widget_set_value widget_id = x_trans_widget new_value = ($default_cap_trans)
	endif
	if StructureContains structure = <layer> y_trans
		button_widget_set_value widget_id = y_trans_widget new_value = (<layer>.y_trans)
	else
		button_widget_set_value widget_id = y_trans_widget new_value = ($default_cap_trans)
	endif
	if StructureContains structure = <layer> x_scale
		button_widget_set_value widget_id = x_scale_widget new_value = (<layer>.x_scale)
	else
		button_widget_set_value widget_id = x_scale_widget new_value = ($default_cap_scale)
	endif
	if StructureContains structure = <layer> y_scale
		button_widget_set_value widget_id = y_scale_widget new_value = (<layer>.y_scale)
	else
		button_widget_set_value widget_id = y_scale_widget new_value = ($default_cap_scale)
	endif
	if StructureContains structure = <layer> rot
		rotate_widget_set_value widget_id = rot_widget new_value = (<layer>.rot)
	else
		rotate_widget_set_value widget_id = rot_widget new_value = ($default_cap_rot)
	endif
	if StructureContains structure = <layer> x_skew
		button_widget_set_value widget_id = x_skew_widget new_value = (<layer>.x_skew)
	else
		button_widget_set_value widget_id = x_skew_widget new_value = ($default_cap_skew)
	endif
	if StructureContains structure = <layer> y_skew
		button_widget_set_value widget_id = y_skew_widget new_value = (<layer>.y_skew)
	else
		button_widget_set_value widget_id = y_skew_widget new_value = ($default_cap_skew)
	endif
	if ((StructureContains structure = <layer> x_scale) && (StructureContains structure = <layer> y_scale))
		MathMax a = (<layer>.x_scale) b = (<layer>.y_scale)
		button_widget_set_value widget_id = uni_scale_widget new_value = <Max>
	endif
endscript

script reset_flip_buttons 
	if is_flip_layer_horizontal part = <part> cap_index = <cap_index> layer_index = <layer_index>
		button_generic_set_value \{id = flip_horiz_widget
			new_value = true}
	else
		button_generic_set_value \{id = flip_horiz_widget
			new_value = FALSE}
	endif
	if is_flip_layer_vertical part = <part> cap_index = <cap_index> layer_index = <layer_index>
		button_generic_set_value \{id = flip_vert_widget
			new_value = true}
	else
		button_generic_set_value \{id = flip_vert_widget
			new_value = FALSE}
	endif
endscript

script widget_restore_cap 
	widget_accept_cap <...>
endscript

script widget_init_cap 
	clean_up_user_control_helpers
	if GotParam \{part}
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
	if GotParam \{part}
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
	if StructureContains \{structure = add_params
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
