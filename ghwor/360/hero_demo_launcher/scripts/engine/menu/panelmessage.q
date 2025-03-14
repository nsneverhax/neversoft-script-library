
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
		legacydoscreenelementmorph \{id = panel_message_layer
			alpha = 0}
	endif
endscript

script show_panel_messages 
	if screenelementexists \{id = panel_message_layer}
		legacydoscreenelementmorph \{id = panel_message_layer
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

script create_panel_message \{text = qs(0xee9e2315)
		pos = (320.0, 70.0)
		rgba = [
			100
			90
			80
			255
		]
		font_face = fontgrid_text_a3
		time = 1500
		z_priority = -5
		just = [
			center
			center
		]
		parent = panel_message_layer
		scale = 0.65000004}
	if NOT (<font_face> = fontgrid_text_a3)
		<font_face> = fontgrid_text_a3
	endif
	if gotparam \{id}
		kill_panel_message_if_it_exists id = <id>
	endif
	create_panel_message_layer_if_needed
	setscreenelementlock id = <parent> off
	createscreenelement {
		type = textelement
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
	if gotparam \{style}
		if gotparam \{params}
			runscriptonscreenelement id = <id> <style> params = <params>
		else
			runscriptonscreenelement id = <id> <style> params = <...>
		endif
	else
		runscriptonscreenelement id = <id> panel_message_wait_and_die params = {time = <time>}
	endif
endscript

script create_panel_sprite \{pos = (320.0, 60.0)
		rgba = [
			128
			128
			128
			100
		]
		z_priority = -5
		parent = panel_message_layer
		just = [
			center
			center
		]}
	if gotparam \{id}
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
	if gotparam \{style}
		if gotparam \{params}
			runscriptonscreenelement id = <id> <style> params = <params>
		else
			runscriptonscreenelement id = <id> <style> params = <...>
		endif
	else
		if gotparam \{time}
			runscriptonscreenelement id = <id> panel_message_wait_and_die params = {time = <time>}
		endif
	endif
endscript

script create_panel_block \{text = qs(0xee9e2315)
		pos = (320.0, 240.0)
		dims = (250.0, 0.0)
		rgba = [
			100
			90
			80
			255
		]
		font_face = fontgrid_text_a3
		time = 2000
		just = [
			center
			center
		]
		internal_just = [
			center
			center
		]
		z_priority = -5
		scale = 0.125
		parent = panel_message_layer}
	create_panel_message_layer_if_needed
	setscreenelementlock id = <parent> off
	if gotparam \{id}
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
	if gotparam \{style}
		if gotparam \{params}
			runscriptonscreenelement id = <id> <style> params = <params>
		else
			runscriptonscreenelement id = <id> <style> params = <...>
		endif
	else
		if NOT gotparam \{hold}
			runscriptonscreenelement id = <id> panel_message_wait_and_die params = {time = <time>}
		endif
	endif
endscript

script create_intro_panel_block \{text = qs(0xf27e0fbb)
		pos = (320.0, 60.0)
		dims = (250.0, 0.0)
		rgba = [
			100
			90
			80
			255
		]
		font_face = fontgrid_text_a3
		time = 2000
		just = [
			center
			center
		]
		internal_just = [
			center
			center
		]
		z_priority = -5
		scale = 0.5
		parent = panel_message_layer}
	create_panel_message_layer_if_needed
	setscreenelementlock id = <parent> off
	if gotparam \{id}
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
	if gotparam \{create_bg}
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
			scale = (13.0, 1.0)
			texture = roundbar_middle
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
	if gotparam \{style}
		if gotparam \{params}
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
		<id> :legacydomorph alpha = 0
	endif
endscript

script show_panel_message 
	if screenelementexists id = <id>
		setscreenelementprops {
			id = <id>
			unhide
		}
		<id> :legacydomorph alpha = 1
	endif
endscript

script destroy_panel_message 
	if screenelementexists id = <id>
		<id> :die
	endif
endscript
