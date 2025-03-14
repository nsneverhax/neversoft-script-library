
script kill_panel_message_if_it_exists 
	if screenelementexists id = <id>
		destroyscreenelement id = <id>
	endif
endscript

script kill_panel_messages 
	kill_panel_message_if_it_exists \{id = panel_message_layer}
endscript

script hide_panel_messages 
	if screenelementexists \{id = panel_message_layer}
		doscreenelementmorph \{id = panel_message_layer
			alpha = 0}
	endif
endscript

script show_panel_messages 
	if screenelementexists \{id = panel_message_layer}
		doscreenelementmorph \{id = panel_message_layer
			alpha = 1}
	endif
endscript

script create_panel_message_layer_if_needed 
	if NOT screenelementexists \{id = panel_message_layer}
		setscreenelementlock \{id = root_window
			off}
		createscreenelement \{type = containerelement
			parent = root_window
			id = panel_message_layer}
	endif
endscript

script create_panel_message {text = ""
		pos = (640.0, 360.0)
		rgba = [200 180 160 255]
		font_face = text_a1
		time = 1500
		z_priority = -5
		just = [center center]
		parent = panel_message_layer
		scale = 0.65000004
		type = textelement
	}
	if NOT (<font_face> = text_a1)
		<font_face> = text_a1
	endif
	if gotparam id
		kill_panel_message_if_it_exists id = <id>
	endif
	create_panel_message_layer_if_needed
	setscreenelementlock id = <parent> off
	if (<type> = spriteelement)
		createscreenelement {
			type = <type>
			parent = <parent>
			id = <id>
			texture = <texture>
			scale = <scale>
			pos = <pos>
			just = <just>
			rgba = <rgba>
			z_priority = <z_priority>
			not_focusable
		}
	else
		createscreenelement {
			type = <type>
			parent = <parent>
			id = <id>
			font = <font_face>
			text = <text>
			scale = <scale>
			pos = <pos>
			just = <just>
			rgba = <rgba>
			z_priority = <z_priority>
			shadow
			shadow_offs = (2.0, 2.0)
			shadow_rgba = [0 0 0 255]
			font_spacing = 2
			not_focusable
		}
	endif
	if gotparam style
		if gotparam params
			runscriptonscreenelement id = <id> <style> params = <params>
		else
			runscriptonscreenelement id = <id> <style> params = <...>
		endif
	else
		runscriptonscreenelement id = <id> panel_message_wait_and_die params = {time = <time>}
	endif
endscript

script create_panel_sprite {pos = (640.0, 60.0)
		rgba = [255 255 255 200]
		z_priority = -5
		parent = panel_message_layer
		just = [center center]
	}
	if gotparam id
		if screenelementexists id = <id>
			runscriptonscreenelement id = <id> kill_panel_message
		endif
	endif
	create_panel_message_layer_if_needed
	setscreenelementlock id = <parent> off
	createscreenelement {
		type = spriteelement
		parent = <parent>
		texture = <texture>
		id = <id>
		scale = <scale>
		pos = <pos>
		just = <just>
		rgba = <rgba>
		z_priority = <z_priority>
		blend = <blend>
	}
	if gotparam style
		if gotparam params
			runscriptonscreenelement id = <id> <style> params = <params>
		else
			runscriptonscreenelement id = <id> <style> params = <...>
		endif
	else
		if gotparam time
			runscriptonscreenelement id = <id> panel_message_wait_and_die params = {time = <time>}
		endif
	endif
endscript

script create_panel_block {text = ""
		pos = (640.0, 360.0)
		dims = (250.0, 0.0)
		rgba = [200 180 160 255]
		font_face = text_a1
		time = 2000
		just = [center center]
		internal_just = [center center]
		z_priority = -5
		scale = 0.125
		parent = panel_message_layer
	}
	create_panel_message_layer_if_needed
	setscreenelementlock id = <parent> off
	if gotparam id
		if screenelementexists id = <id>
			destroyscreenelement id = <id>
		endif
	endif
	createscreenelement {
		type = textblockelement
		parent = <parent>
		id = <id>
		font = <font_face>
		text = <text>
		dims = <dims>
		pos = <pos>
		just = <just>
		internal_just = <internal_just>
		line_spacing = <line_spacing>
		rgba = <rgba>
		scale = <scale>
		shadow
		shadow_rgba = $ui_text_shadow_color
		shadow_offs = $ui_text_shadow_offset
		allow_expansion
		z_priority = <z_priority>
	}
	if gotparam style
		if gotparam params
			runscriptonscreenelement id = <id> <style> params = <params>
		else
			runscriptonscreenelement id = <id> <style> params = <...>
		endif
	else
		if NOT gotparam hold
			runscriptonscreenelement id = <id> panel_message_wait_and_die params = {time = <time>}
		endif
	endif
endscript

script create_wheel_panel_block {
		id = net_panel_msg
		parent = root_window
		time = 3
		text = "NULL"
		pos = (800.0, 530.0)
	}
	the_id = <id>
	printf "--- net_view_goals_create_searching_text"
	z_pri = 100000
	text_scale = (0.8, 0.6)
	box_extra_size = 30
	if screenelementexists id = <id>
		destroyscreenelement id = <id>
	endif
	createscreenelement {
		id = <id>
		type = containerelement
		parent = <parent>
		pos = <pos>
		just = [left center]
		z_priority = <z_pri>
		alpha = 0
	}
	parent_id = <id>
	net_view_goals_create_grey_box {
		cont_id = wheel_panel_block_bg
		parent = <parent_id>
		z_priority = (<z_pri> - 1)
	}
	text_type = textblockelement
	text_dims = (300.0, 1.0)
	text_pos = ((0.0, 20.0) + (<box_extra_size> / 2) * (1.0, 0.0))
	createscreenelement {
		type = <text_type>
		parent = <parent_id>
		local_id = searching_text
		id = wheel_panel_block_text
		pos = <text_pos>
		text = <text>
		font = text_a1
		rgba = ($cas_color_scheme.text_color)
		scale = <text_scale>
		just = [left top]
		internal_just = [center top]
		z_priority = <z_pri>
		dims = <text_dims>
		allow_expansion
	}
	getscreenelementdims id = <id>
	actual_text_height = (<height>)
	actual_text_width = <width>
	createscreenelement {
		type = spriteelement
		id = wheel_panel_block_anim_icon
		parent = <parent_id>
		local_id = anim_icon
		texture = spinning_load
		rgba = ($cas_color_scheme.text_color)
		scale = 0.5
		just = [center center]
		z_priority = <z_pri>
	}
	getscreenelementdims id = <id>
	icon_width = <width>
	icon_height = <height>
	icon_tweak = 10
	bg_height = (<actual_text_height> + 30)
	scale_element_to_size {
		id = wheel_panel_block_bg
		target_width = (<actual_text_width> + <icon_width> + <icon_tweak> + 30)
		target_height = <bg_height>
	}
	setscreenelementprops {
		id = <id>
		pos = ((<actual_text_width> + <icon_width> / 2 + <icon_tweak>) * (1.0, 0.0) + (<bg_height> / 2) * (0.0, 1.0))
	}
	getscreenelementprops id = wheel_panel_block_text
	printstruct <...>
	runscriptonscreenelement id = <parent_id> net_view_goals_searching_fade_in params = {time = 0.1}
	runscriptonscreenelement id = wheel_panel_block_anim_icon net_view_goals_animate_searching_icon params = {time = 0.1}
	runscriptonscreenelement id = <parent_id> 0xb2ba1a94
	runscriptonscreenelement {
		net_view_goals_searching_fade_out_and_die
		id = <the_id>
		params = {
			extra_wait = <time>
		}
	}
endscript

script 0xb2ba1a94 
	obj_getid
	wait \{5
		seconds}
	<objid> :die
endscript

script create_intro_panel_block {text = ""
		pos = (640.0, 80.0)
		dims = (250.0, 0.0)
		rgba = [200 180 160 255]
		font_face = text_a1
		time = 2000
		just = [center center]
		internal_just = [center center]
		z_priority = -5
		scale = 0.5
		parent = panel_message_layer
	}
	create_panel_message_layer_if_needed
	setscreenelementlock id = <parent> off
	if gotparam id
		if screenelementexists id = <id>
			destroyscreenelement id = <id>
		endif
	endif
	createscreenelement {
		type = containerelement
		parent = <parent>
		id = <id>
		pos = (0.0, 0.0)
	}
	<the_id> = <id>
	createscreenelement {
		type = textblockelement
		parent = <the_id>
		font = <font_face>
		text = <text>
		dims = <dims>
		pos = <pos>
		just = <just>
		internal_just = <internal_just>
		line_spacing = <line_spacing>
		rgba = <rgba>
		scale = <scale>
		shadow
		shadow_rgba = $ui_text_shadow_color
		shadow_offs = $ui_text_shadow_offset
		allow_expansion
		z_priority = (<z_priority> + 3)
	}
	grad_color = [17 67 92 255]
	if gotparam create_bg
		createscreenelement {
			type = spriteelement
			parent = <the_id>
			texture = goal_grad
			pos = (<pos> + (300.0, 0.0))
			scale = (21.0, 10.0)
			just = [center center]
			rgba = <grad_color>
			alpha = 0.4
			z_priority = (<z_priority> + 1)
		}
		createscreenelement {
			type = spriteelement
			parent = <the_id>
			texture = goal_grad
			pos = (<pos> + (300.0, -20.0))
			scale = (21.0, 1.0)
			just = [center center]
			rgba = <grad_color>
			alpha = 0.6
			z_priority = (<z_priority> + 1)
		}
		createscreenelement {
			type = spriteelement
			parent = <the_id>
			texture = goal_grad
			pos = (<pos> + (300.0, 20.0))
			scale = (21.0, 1.0)
			just = [center center]
			rgba = <grad_color>
			alpha = 0.6
			flip_v
			z_priority = (<z_priority> + 1)
		}
		createscreenelement {
			type = spriteelement
			parent = <the_id>
			pos = (<pos> + (320.0, 0.0))
			just = [center center]
			texture = menu_highlight
			z_priority = (<z_priority> + 2)
			rgba = [128 128 128 20]
		}
		getscreenelementposition id = <id>
		getscreenelementdims id = <id>
		createscreenelement {
			type = spriteelement
			parent = <the_id>
			pos = (<screenelementpos> + (-16.0, 16.0))
			just = [center center]
			scale = 1
			texture = roundbar_tip_left
			z_priority = (<z_priority> + 2)
			rgba = [128 128 128 20]
		}
		createscreenelement {
			type = spriteelement
			parent = <the_id>
			pos = (<screenelementpos> + <width> * (1.0, 0.0) + (16.0, 16.0))
			just = [center center]
			scale = 1
			texture = roundbar_tip_right
			z_priority = (<z_priority> + 2)
			rgba = [128 128 128 20]
		}
	endif
	if gotparam style
		if gotparam params
			runscriptonscreenelement id = <the_id> <style> params = <params>
		else
			runscriptonscreenelement id = <the_id> <style> params = <...>
		endif
	else
		runscriptonscreenelement id = <the_id> panel_message_wait_and_die params = {time = <time>}
	endif
endscript

script panel_message_wait_and_die \{time = 1500}
	wait <time> ignoreslomo
	die
endscript

script kill_panel_message 
	die
endscript

script hide_panel_message 
	if screenelementexists id = <id>
		setscreenelementprops {
			id = <id>
			hide
		}
		<id> :domorph alpha = 0
	endif
endscript

script show_panel_message 
	if screenelementexists id = <id>
		setscreenelementprops {
			id = <id>
			unhide
		}
		<id> :domorph alpha = 1
	endif
endscript

script destroy_panel_message 
	if screenelementexists id = <id>
		<id> :die
	endif
endscript
