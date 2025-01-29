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

script create_menu_jam_marker \{controller = 0}
	Change \{jam_current_marker = 0}
	Change \{jam_current_lightshow = 0}
	Change \{jam_current_marker_bpm = $jam_current_bpm}
	if jam_studio_element :desc_resolvealias \{Name = marker_box}
		<resolved_id> :SetProps Pos = (-27.0, 800.0) time = 0.0
		<resolved_id> :se_waitprops
	endif
	CreateScreenElement {
		Type = ContainerElement
		parent = <resolved_id>
		id = jam_marker_container
		Pos = (23.0, 55.0)
		Scale = 0.75
	}
	text_params = {Type = TextElement font = fontgrid_text_a3 just = [center center] Scale = 0.5 rgba = [0 0 0 255]}
	text_params = {Type = TextElement font = fontgrid_text_a3 just = [right center] Scale = 0.6 rgba = [0 0 0 255]}
	CreateScreenElement \{Type = TextBlockElement
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
		Scale = 1
		Pos = (116.0, 150.0)
		rgba = [
			0
			0
			0
			255
		]
		dims = (120.0, 30.0)
		text = qs(0xa86be03a)
		z_priority = 300
		fit_width = `scale	each	line	if	larger`
		fit_height = `scale	down	if	larger`
		scale_mode = proportional
		text_case = Original}
	CreateScreenElement \{Type = TextBlockElement
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
		Scale = 1
		Pos = (116.0, 190.0)
		rgba = [
			0
			0
			0
			255
		]
		dims = (110.0, 30.0)
		text = qs(0x61cf0912)
		z_priority = 300
		fit_width = `scale	each	line	if	larger`
		fit_height = `scale	down	if	larger`
		scale_mode = proportional
		text_case = Original}
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
	Change \{menu_focus_color = [
			230
			230
			230
			255
		]}
	Change \{menu_unfocus_color = [
			0
			0
			0
			255
		]}
	text_params = {Type = TextElement font = fontgrid_text_a11 just = [left center] Scale = 0.6 rgba = [0 0 0 255] z_priority = 300}
	CreateScreenElement \{Type = ContainerElement
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
	CreateScreenElement {
		Type = TextBlockElement
		parent = <id>
		id = marker_name_text
		font = fontgrid_text_a3
		just = [left center]
		internal_just = [right center]
		Scale = 1
		Pos = (260.0, 150.0)
		rgba = [0 0 0 255]
		dims = (120.0, 30.0)
		text = ($jam_markers [0].name_text)
		z_priority = 300
		fit_width = `scale	each	line	if	larger`
		fit_height = `scale	down	if	larger`
		scale_mode = proportional
		text_case = Original
	}
	CreateScreenElement \{Type = ContainerElement
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
	CreateScreenElement {
		Type = TextBlockElement
		parent = <id>
		id = marker_mood_text
		font = fontgrid_text_a3
		just = [left center]
		internal_just = [right center]
		Scale = 1
		Pos = (260.0, 143.0)
		rgba = [0 0 0 255]
		dims = (120.0, 30.0)
		text = ($jam_lightshow [0].name_text)
		z_priority = 300
		fit_width = `scale	each	line	if	larger`
		fit_height = `scale	down	if	larger`
		scale_mode = proportional
		text_case = Original
	}
	CreateScreenElement \{Type = ContainerElement
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
	CreateScreenElement {
		Type = TextBlockElement
		parent = <id>
		id = marker_done_text
		font = fontgrid_text_a3
		just = [left center]
		internal_just = [left center]
		Scale = 1
		Pos = (157.0, 130.0)
		rgba = [0 0 0 255]
		dims = (180.0, 50.0)
		text = qs(0x619cf5cd)
		z_priority = 300
		fit_width = `scale	each	line	if	larger`
		fit_height = `scale	down	if	larger`
		scale_mode = proportional
		text_case = Original
	}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
	if jam_studio_element :desc_resolvealias \{Name = marker_box}
		<resolved_id> :SetProps Pos = (-27.0, -200.0) time = 0.2
		<resolved_id> :se_waitprops
	endif
	LaunchEvent \{Type = focus
		target = vmenu_marker}
endscript

script change_marker_option 
	SetScreenElementProps \{id = vmenu_marker
		block_events}
	CreateScreenElement {
		Type = ContainerElement
		parent = root_window
		id = change_marker_option_event_handler
		z_priority = 10000
		event_handlers = [
			{pad_up change_marker_option_up params = {text_id = <text_id> select_array = <select_array> select_global = <select_global> numeric = <numeric> min = <min> Max = <Max>}}
			{pad_down change_marker_option_down params = {text_id = <text_id> select_array = <select_array> select_global = <select_global> numeric = <numeric> min = <min> Max = <Max>}}
			{pad_choose change_marker_option_back}
			{pad_back change_marker_option_back}
			{pad_start change_marker_option_back}
		]
	}
	LaunchEvent \{Type = focus
		target = change_marker_option_event_handler}
	ghmix_pad_choose_sound
	if ScreenElementExists \{id = change_marker_option_up_arrow}
		DestroyScreenElement \{id = change_marker_option_up_arrow}
	endif
	CreateScreenElement {
		Type = SpriteElement
		id = change_marker_option_up_arrow
		parent = <text_id>
		texture = up_arrow
		just = [center bottom]
		Pos = (-14.0, 13.0)
		rgba = [0 0 0 255]
		Scale = 0.6
	}
	if ScreenElementExists \{id = change_marker_option_down_arrow}
		DestroyScreenElement \{id = change_marker_option_down_arrow}
	endif
	CreateScreenElement {
		Type = SpriteElement
		id = change_marker_option_down_arrow
		parent = <text_id>
		texture = down_arrow
		just = [center top]
		Pos = (-14.0, 18.0)
		rgba = [0 0 0 255]
		Scale = 0.6
	}
endscript

script change_marker_option_up 
	SoundEvent \{event = ghmix_scroll_up_down}
	if (<numeric> = 0)
		new_option = ($<select_global> - 1)
		GetArraySize ($<select_array>)
		if (<new_option> < 0)
			<new_option> = (<array_Size> - 1)
		endif
		Change GlobalName = <select_global> NewValue = <new_option>
		text = ($<select_array> [$<select_global>].name_text)
	else
		new_option = ($<select_global> + 1)
		if (<new_option> > <Max>)
			<new_option> = <min>
		endif
		Change GlobalName = <select_global> NewValue = <new_option>
		formatText TextName = text qs(0x73307931) s = ($<select_global>)
	endif
	SetScreenElementProps id = <text_id> text = <text>
	legacydoscreenelementmorph \{id = change_marker_option_up_arrow
		Scale = 1.5
		relative_scale}
	legacydoscreenelementmorph \{id = change_marker_option_up_arrow
		Scale = 1.0
		relative_scale
		time = 0.15}
endscript

script change_marker_option_down 
	SoundEvent \{event = ghmix_scroll_up_down}
	if (<numeric> = 0)
		new_option = ($<select_global> + 1)
		GetArraySize ($<select_array>)
		if (<new_option> >= <array_Size>)
			<new_option> = 0
		endif
		Change GlobalName = <select_global> NewValue = <new_option>
		text = ($<select_array> [$<select_global>].name_text)
	else
		new_option = ($<select_global> - 1)
		if (<new_option> < <min>)
			<new_option> = <Max>
		endif
		Change GlobalName = <select_global> NewValue = <new_option>
		formatText TextName = text qs(0x73307931) s = ($<select_global>)
	endif
	SetScreenElementProps id = <text_id> text = <text>
	legacydoscreenelementmorph \{id = change_marker_option_down_arrow
		Scale = 1.5
		relative_scale}
	legacydoscreenelementmorph \{id = change_marker_option_down_arrow
		Scale = 1.0
		relative_scale
		time = 0.15}
endscript

script menu_jam_marker_back 
	ghmix_pad_back_sound
	destroy_menu_jam_marker
	LaunchEvent \{Type = focus
		target = jam_control_container}
endscript

script change_marker_option_back 
	SetScreenElementProps \{id = vmenu_marker
		unblock_events}
	DestroyScreenElement \{id = change_marker_option_event_handler}
	ghmix_pad_back_sound
	if ScreenElementExists \{id = change_marker_option_up_arrow}
		DestroyScreenElement \{id = change_marker_option_up_arrow}
	endif
	if ScreenElementExists \{id = change_marker_option_down_arrow}
		DestroyScreenElement \{id = change_marker_option_down_arrow}
	endif
endscript

script destroy_menu_jam_marker 
	LaunchEvent \{Type = unfocus
		target = vmenu_marker}
	if jam_studio_element :desc_resolvealias \{Name = marker_box}
		<resolved_id> :SetProps Pos = (-27.0, 800.0) time = 0.2
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
	add_user_control_helper text = ($jam_ghmix_text_skip_backwards) button = yellow z = 100
	add_user_control_helper text = ($jam_ghmix_text_skip_forwards) button = blue z = 100
	add_user_control_helper \{text = qs(0x48a351fa)
		button = start
		z = 100}
	destroy_menu \{menu_id = scrolling_marker}
	if ScreenElementExists \{id = jam_marker_container}
		DestroyScreenElement \{id = jam_marker_container}
	endif
endscript
