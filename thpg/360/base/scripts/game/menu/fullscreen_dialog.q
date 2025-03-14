
script Create_Fullscreen_Dialog {
		TextArray = $ui_fullscreen_dialog_sampletext
		helper_text = {helper_text_elements = [{text = "\\m1 Back"} {text = "\\m0 Accept Agreement"}]}
		pad_choose_script = nullscript
		pad_back_script = nullscript
		pad_choose_params = {}
		pad_back_params = {}
	}
	if screenelementexists id = ui_fullscreen_dialog_container
		printf "Create_Fullscreen_Dialog already exists, call Destroy_FullScreen_Dialog first"
		return
		Destroy_FullScreen_Dialog
	endif
	createscreenelement {
		type = containerelement
		parent = root_window
		id = ui_fullscreen_dialog_container
		pos = {(0.5, 0.5) proportional}
		just = [center center]
		child_anchor = [center top]
		dims = (((1.0, 0.0) * (1280 * 0.8)) + ((0.0, 1.0) * (720 * 0.8)))
		z_priority = 4000
		focusable_child = ui_fullscreen_dialog_window
		event_handlers = [
			{pad_choose Destroy_FullScreen_Dialog params = {run_script = <pad_choose_script> run_params = <pad_choose_params>}}
			{pad_back Destroy_FullScreen_Dialog params = {run_script = <pad_back_script> run_params = <pad_back_params>}}
		]
	}
	createscreenelement {
		type = spriteelement
		parent = ui_fullscreen_dialog_container
		texture = white
		pos = {(0.0, 0.5) proportional}
		just = [center center]
		dims = (1280.0, 720.0)
		rgba = [0 0 0 255]
		z_priority = 3000
	}
	createscreenelement {
		type = spriteelement
		parent = ui_fullscreen_dialog_container
		texture = white
		dims = (1280.0, 720.0)
		pos = {(0.0, 0.0) proportional}
		just = [center bottom]
		rgba = [0 0 0 255]
		z_priority = 4500
	}
	createscreenelement {
		type = spriteelement
		parent = ui_fullscreen_dialog_container
		texture = white
		dims = (1280.0, 720.0)
		pos = {(0.0, 1.0) proportional}
		just = [center top]
		rgba = [0 0 0 255]
		z_priority = 4500
	}
	createscreenelement {
		type = containerelement
		parent = ui_fullscreen_dialog_container
		id = ui_fullscreen_dialog_window
		pos = {(0.0, 0.05) proportional}
		just = [center top]
		child_anchor = [center top]
		event_handlers = [
			{pad_up Scroll_FullScreen_Dialog params = {}}
			{pad_down Scroll_FullScreen_Dialog params = {up}}
		]
	}
	getarraysize <TextArray>
	<total_height> = 0
	<i> = 0
	begin
	createscreenelement {
		type = textblockelement
		parent = ui_fullscreen_dialog_window
		font = text_a1
		text = ((<TextArray> [<i>]).text)
		pos = ((20.0, 0.0) + ((0.0, 1.0) * <total_height>))
		just = [center top]
		internal_just = [left top]
		dims = (((1.0, 0.0) * (1280 * 1.0)) + ((0.0, 1.0) * (720 * 0.8)))
		allow_expansion
		scale = 0.75
		rgba = [128 128 128 255]
	}
	getscreenelementdims id = <id>
	<total_height> = (<total_height> + <height>)
	<i> = (<i> + 1)
	repeat <array_size>
	ui_fullscreen_dialog_window :settags total_height = <total_height>
	ui_fullscreen_dialog_window :settags y = 0
	createscreenelement {
		type = containerelement
		parent = ui_fullscreen_dialog_container
		id = ui_fullscreen_dialog_scrollbar
		pos = {(-0.475, 0.0) proportional}
		just = [center top]
		child_anchor = [center top]
	}
	<bar_height> = 522
	createscreenelement {
		type = spriteelement
		parent = ui_fullscreen_dialog_scrollbar
		texture = menu_generic_scrolltip
		just = [center top]
		pos = (0.0, 0.0)
		dims = (32.0, 32.0)
		rgba = [255 255 255 255]
		z_priority = 5000
	}
	createscreenelement {
		type = spriteelement
		parent = ui_fullscreen_dialog_scrollbar
		texture = menu_generic_scrollstrip
		just = [center top]
		pos = (0.0, 32.0)
		dims = ((32.0, 0.0) + ((0.0, 0.95) * <bar_height>))
		rgba = [255 255 255 255]
		z_priority = 5000
	}
	createscreenelement {
		type = spriteelement
		parent = ui_fullscreen_dialog_scrollbar
		texture = menu_generic_scrolltip
		just = [center top]
		pos = ((0.0, 32.0) + ((0.0, 0.95) * <bar_height>))
		dims = (32.0, -32.0)
		rgba = [255 255 255 255]
		z_priority = 5000.5
	}
	<slider_height> = (<bar_height> / <array_size>)
	createscreenelement {
		type = spriteelement
		parent = ui_fullscreen_dialog_scrollbar
		local_id = slider_bar
		texture = menu_generic_scrolltab
		just = [center top]
		pos = (0.0, 7.0)
		dims = ((16.0, 0.0) + ((0.0, 1.0) * (<bar_height> / 20)))
		rgba = [255 255 255 255]
		z_priority = 5001
	}
	create_helper_text {
		<helper_text>
	}
	launchevent target = ui_fullscreen_dialog_container type = focus
endscript

script Destroy_FullScreen_Dialog \{run_script = nullscript
		run_params = {
		}}
	if NOT (<run_script> = nullscript)
		<run_script> <run_params>
	endif
	if screenelementexists \{id = ui_fullscreen_dialog_container}
		destroyscreenelement \{id = ui_fullscreen_dialog_container}
		if objectexists \{id = helper_text_anchor}
			destroyscreenelement \{id = helper_text_anchor}
		endif
	endif
endscript

script Scroll_FullScreen_Dialog 
	setspawninstancelimits max = 1 management = ignore_spawn_request
	gettags
	getscreenelementdims id = <id>
	if gotparam up
		<move> = -20
	else
		<move> = 20
	endif
	<new_y> = (<y> + <move>)
	if (<new_y> > 0)
		<move> = 0
	endif
	if (<new_y> < ((<total_height> - 500) * -1))
		<move> = 0
	endif
	printf "move %m" m = <move>
	domorph pos = {((0.0, 1.0) * <move>) relative}
	<y> = (<y> + <move>)
	ui_fullscreen_dialog_window :settags y = <y>
	if screenelementexists id = ui_fullscreen_dialog_scrollbar
		if screenelementexists id = {ui_fullscreen_dialog_scrollbar child = slider_bar}
			<scroll_y> = (((<y> * -1.0) / (<total_height> - 500)) * 522)
			doscreenelementmorph {
				id = {ui_fullscreen_dialog_scrollbar child = slider_bar}
				pos = ((0.0, 1.0) * (<scroll_y> + 7))
				time = 0.1
			}
		endif
	endif
endscript
