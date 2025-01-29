jam_current_marker = 0
jam_markers = [
	{
		name_text = qs(0x085b59c2)
	}
	{
		name_text = qs(0x8fcfee41)
	}
	{
		name_text = qs(0xe26cd97e)
	}
	{
		name_text = qs(0x179ef303)
	}
	{
		name_text = qs(0x4874e3de)
	}
	{
		name_text = qs(0x2b4356ef)
	}
	{
		name_text = qs(0x16357c52)
	}
	{
		name_text = qs(0x249404f8)
	}
]
jam_current_lightshow = 0
jam_lightshow = [
	{
		note = 75
		change = 1
		name_text = qs(0x34c6706f)
	}
	{
		note = 75
		change = 2
		name_text = qs(0x696cc970)
	}
	{
		note = 75
		change = 4
		name_text = qs(0x8de1e71a)
	}
	{
		note = 74
		change = 1
		name_text = qs(0x8aaca2e9)
	}
	{
		note = 74
		change = 2
		name_text = qs(0xc00568ae)
	}
	{
		note = 74
		change = 4
		name_text = qs(0x338b359c)
	}
	{
		note = 73
		change = 1
		name_text = qs(0x45f0f6d8)
	}
	{
		note = 73
		change = 2
		name_text = qs(0x62f15fe1)
	}
	{
		note = 73
		change = 4
		name_text = qs(0xfcd761ad)
	}
]

script create_menu_jam_marker \{controller = 0}
	change \{jam_current_marker = 0}
	change \{jam_current_lightshow = 0}
	change \{jam_current_marker_bpm = $jam_current_bpm}
	if jam_studio_element :desc_resolvealias \{name = marker_box}
		<resolved_id> :setprops pos = (-27.0, 800.0) time = 0.0
		<resolved_id> :se_waitprops
	endif
	createscreenelement {
		type = containerelement
		parent = <resolved_id>
		id = jam_marker_container
		pos = (23.0, 55.0)
		scale = 0.75
	}
	text_params = {type = textelement font = fontgrid_text_a3 just = [center center] scale = 0.5 rgba = [0 0 0 255]}
	text_params = {type = textelement font = fontgrid_text_a3 just = [right center] scale = 0.6 rgba = [0 0 0 255]}
	createscreenelement \{type = textblockelement
		parent = jam_marker_container
		font = fontgrid_text_a3
		just = [
			left
			center
		]
		internal_just = [
			left
			center
		]
		scale = 1
		pos = (116.0, 150.0)
		rgba = [
			0
			0
			0
			255
		]
		dims = (120.0, 30.0)
		text = qs(0xa86be03a)
		z_priority = 300
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		scale_mode = proportional
		text_case = original}
	createscreenelement \{type = textblockelement
		parent = jam_marker_container
		font = fontgrid_text_a3
		just = [
			left
			center
		]
		internal_just = [
			left
			center
		]
		scale = 1
		pos = (116.0, 190.0)
		rgba = [
			0
			0
			0
			255
		]
		dims = (110.0, 30.0)
		text = qs(0x61cf0912)
		z_priority = 300
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		scale_mode = proportional
		text_case = original}
	event_handlers = [
		{pad_up ghmix_pad_up_down params = {up}}
		{pad_down ghmix_pad_up_down params = {down}}
		{pad_back menu_jam_marker_back}
	]
	new_menu {
		menu_parent = jam_marker_container
		scrollid = scrolling_marker
		vmenuid = vmenu_marker
		menu_pos = (0.0, 0.0)
		default_colors = 0
		use_backdrop = 0
		exclusive_device = <controller>
		event_handlers = <event_handlers>
	}
	change \{menu_focus_color = [
			230
			230
			230
			255
		]}
	change \{menu_unfocus_color = [
			0
			0
			0
			255
		]}
	text_params = {type = textelement font = fontgrid_text_a11 just = [left center] scale = 0.6 rgba = [0 0 0 255] z_priority = 300}
	createscreenelement \{type = containerelement
		parent = vmenu_marker
		dims = (100.0, 47.0)
		event_handlers = [
			{
				focus
				jam_pause_focus
				params = {
					id = marker_name_text
				}
			}
			{
				unfocus
				retail_menu_unfocus
				params = {
					id = marker_name_text
				}
			}
			{
				pad_choose
				change_marker_option
				params = {
					text_id = marker_name_text
					select_array = jam_markers
					select_global = jam_current_marker
					numeric = 0
				}
			}
		]}
	createscreenelement {
		type = textblockelement
		parent = <id>
		id = marker_name_text
		font = fontgrid_text_a3
		just = [left center]
		internal_just = [right center]
		scale = 1
		pos = (260.0, 150.0)
		rgba = [0 0 0 255]
		dims = (120.0, 30.0)
		text = ($jam_markers [0].name_text)
		z_priority = 300
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		scale_mode = proportional
		text_case = original
	}
	createscreenelement \{type = containerelement
		parent = vmenu_marker
		dims = (100.0, 55.0)
		event_handlers = [
			{
				focus
				jam_pause_focus
				params = {
					id = marker_mood_text
				}
			}
			{
				unfocus
				retail_menu_unfocus
				params = {
					id = marker_mood_text
				}
			}
			{
				pad_choose
				change_marker_option
				params = {
					text_id = marker_mood_text
					select_array = jam_lightshow
					select_global = jam_current_lightshow
					numeric = 0
				}
			}
		]}
	createscreenelement {
		type = textblockelement
		parent = <id>
		id = marker_mood_text
		font = fontgrid_text_a3
		just = [left center]
		internal_just = [right center]
		scale = 1
		pos = (260.0, 143.0)
		rgba = [0 0 0 255]
		dims = (120.0, 30.0)
		text = ($jam_lightshow [0].name_text)
		z_priority = 300
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		scale_mode = proportional
		text_case = original
	}
	createscreenelement \{type = containerelement
		parent = vmenu_marker
		dims = (100.0, 80.0)
		event_handlers = [
			{
				focus
				jam_pause_focus
				params = {
					id = marker_done_text
				}
			}
			{
				unfocus
				retail_menu_unfocus
				params = {
					id = marker_done_text
				}
			}
			{
				pad_choose
				jam_highway_add_marker
			}
		]}
	createscreenelement {
		type = textblockelement
		parent = <id>
		id = marker_done_text
		font = fontgrid_text_a3
		just = [left center]
		internal_just = [left center]
		scale = 1
		pos = (157.0, 130.0)
		rgba = [0 0 0 255]
		dims = (180.0, 50.0)
		text = qs(0x619cf5cd)
		z_priority = 300
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		scale_mode = proportional
		text_case = original
	}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
	if jam_studio_element :desc_resolvealias \{name = marker_box}
		<resolved_id> :setprops pos = (-27.0, -200.0) time = 0.2
		<resolved_id> :se_waitprops
	endif
	launchevent \{type = focus
		target = vmenu_marker}
endscript

script change_marker_option 
	setscreenelementprops \{id = vmenu_marker
		block_events}
	createscreenelement {
		type = containerelement
		parent = root_window
		id = change_marker_option_event_handler
		z_priority = 10000
		event_handlers = [
			{pad_up change_marker_option_up params = {text_id = <text_id> select_array = <select_array> select_global = <select_global> numeric = <numeric> min = <min> max = <max>}}
			{pad_down change_marker_option_down params = {text_id = <text_id> select_array = <select_array> select_global = <select_global> numeric = <numeric> min = <min> max = <max>}}
			{pad_choose change_marker_option_back}
			{pad_back change_marker_option_back}
			{pad_start change_marker_option_back}
		]
	}
	launchevent \{type = focus
		target = change_marker_option_event_handler}
	ghmix_pad_choose_sound
	if screenelementexists \{id = change_marker_option_up_arrow}
		destroyscreenelement \{id = change_marker_option_up_arrow}
	endif
	createscreenelement {
		type = spriteelement
		id = change_marker_option_up_arrow
		parent = <text_id>
		texture = up_arrow
		just = [center bottom]
		pos = (-14.0, 13.0)
		rgba = [0 0 0 255]
		scale = 0.6
	}
	if screenelementexists \{id = change_marker_option_down_arrow}
		destroyscreenelement \{id = change_marker_option_down_arrow}
	endif
	createscreenelement {
		type = spriteelement
		id = change_marker_option_down_arrow
		parent = <text_id>
		texture = down_arrow
		just = [center top]
		pos = (-14.0, 18.0)
		rgba = [0 0 0 255]
		scale = 0.6
	}
endscript

script change_marker_option_up 
	soundevent \{event = ghmix_scroll_up_down}
	if (<numeric> = 0)
		new_option = ($<select_global> - 1)
		getarraysize ($<select_array>)
		if (<new_option> < 0)
			<new_option> = (<array_size> - 1)
		endif
		change globalname = <select_global> newvalue = <new_option>
		text = ($<select_array> [$<select_global>].name_text)
	else
		new_option = ($<select_global> + 1)
		if (<new_option> > <max>)
			<new_option> = <min>
		endif
		change globalname = <select_global> newvalue = <new_option>
		formattext textname = text qs(0x73307931) s = ($<select_global>)
	endif
	setscreenelementprops id = <text_id> text = <text>
	legacydoscreenelementmorph \{id = change_marker_option_up_arrow
		scale = 1.5
		relative_scale}
	legacydoscreenelementmorph \{id = change_marker_option_up_arrow
		scale = 1.0
		relative_scale
		time = 0.15}
endscript

script change_marker_option_down 
	soundevent \{event = ghmix_scroll_up_down}
	if (<numeric> = 0)
		new_option = ($<select_global> + 1)
		getarraysize ($<select_array>)
		if (<new_option> >= <array_size>)
			<new_option> = 0
		endif
		change globalname = <select_global> newvalue = <new_option>
		text = ($<select_array> [$<select_global>].name_text)
	else
		new_option = ($<select_global> - 1)
		if (<new_option> < <min>)
			<new_option> = <max>
		endif
		change globalname = <select_global> newvalue = <new_option>
		formattext textname = text qs(0x73307931) s = ($<select_global>)
	endif
	setscreenelementprops id = <text_id> text = <text>
	legacydoscreenelementmorph \{id = change_marker_option_down_arrow
		scale = 1.5
		relative_scale}
	legacydoscreenelementmorph \{id = change_marker_option_down_arrow
		scale = 1.0
		relative_scale
		time = 0.15}
endscript

script menu_jam_marker_back 
	ghmix_pad_back_sound
	destroy_menu_jam_marker
	launchevent \{type = focus
		target = jam_control_container}
endscript

script change_marker_option_back 
	setscreenelementprops \{id = vmenu_marker
		unblock_events}
	destroyscreenelement \{id = change_marker_option_event_handler}
	ghmix_pad_back_sound
	if screenelementexists \{id = change_marker_option_up_arrow}
		destroyscreenelement \{id = change_marker_option_up_arrow}
	endif
	if screenelementexists \{id = change_marker_option_down_arrow}
		destroyscreenelement \{id = change_marker_option_down_arrow}
	endif
endscript

script destroy_menu_jam_marker 
	launchevent \{type = unfocus
		target = vmenu_marker}
	if jam_studio_element :desc_resolvealias \{name = marker_box}
		<resolved_id> :setprops pos = (-27.0, 800.0) time = 0.2
		<resolved_id> :se_waitprops
	endif
	set_focus_color \{rgba = [
			220
			220
			220
			255
		]}
	set_unfocus_color \{rgba = [
			210
			130
			0
			255
		]}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100}
	add_user_control_helper \{text = qs(0x48a351fa)
		button = start
		z = 100}
	destroy_menu \{menu_id = scrolling_marker}
	if screenelementexists \{id = jam_marker_container}
		destroyscreenelement \{id = jam_marker_container}
	endif
endscript
