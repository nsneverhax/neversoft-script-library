
script ui_init_privacy_policy 
	push_load_social_networks_choose_pak
endscript

script ui_create_privacy_policy \{Type = !q1768515945
		no_accept = 0
		back_script = generic_event_back
		back_params = {
		}}
	<body_text_array> = []
	if privacy_policy_should_use_mainmenu_bg
		create_mainmenu_bg
	endif
	switch <Type>
		case facebook
		AddArrayElement array = <body_text_array> element = ($g_facebook_privacy_policy)
		<body_text_array> = <array>
		case twitter
		AddArrayElement array = <body_text_array> element = ($g_twitter_privacy_policy)
		<body_text_array> = <array>
		default
		ScriptAssert \{qs(0xcb4ae081)}
	endswitch
	CreateScreenElement {
		parent = root_window
		Type = descinterface
		id = privacy_policy
		desc = 'privacy_policy'
		dlog_heading_text = qs(0x97c623cf)
		z_priority = (($g_options_facebook_twitter_z_priority) + 1000)
		event_handlers = [
			{pad_up ui_privacy_policy_scroll params = {up}}
			{pad_down ui_privacy_policy_scroll params = {down}}
			{pad_back nullscript}
			{pad_choose nullscript}
		]
		exclusive_device = ($primary_controller)
		tags = {back_script = <back_script> back_params = <back_params> scrolled_to_bottom = 0}
	}
	if GotParam \{next_state}
		privacy_policy :SetTags {next_state = <next_state> next_state_params = <next_state_params>}
	endif
	GetArraySize <body_text_array>
	if privacy_policy :desc_resolvealias \{Name = alias_generic_scrollbar_wgt}
		generic_scrollbar_wgt_initialize id = <resolved_id>
		generic_scrollbar_wgt_set_resolution id = <resolved_id> num_elements = <array_Size>
	endif
	if privacy_policy :desc_resolvealias \{Name = alias_text_menu}
		if (<array_Size> > 0)
			<i> = 0
			begin
			CreateScreenElement {
				Type = TextBlockElement
				parent = <resolved_id>
				font = fontgrid_text_a3
				just = [left top]
				internal_just = [left top]
				Scale = 1
				internal_scale = 0.4
				rgba = gh6_gold
				dims = (940.0, 30.0)
				text = (<body_text_array> [<i>])
				z_priority = (($g_options_facebook_twitter_z_priority) + 1000)
				fit_width = wrap
				fit_height = `expand	dims`
				scale_mode = proportional
				text_case = Original
			}
			<i> = (<i> + 1)
			repeat <array_Size>
		endif
	endif
	clean_up_user_control_helpers
	LaunchEvent \{Type = focus
		target = privacy_policy}
	spawnscript ui_privacy_policy_setup_handlers params = {
		no_accept = <no_accept>
		Type = <Type>
	}
endscript

script ui_destroy_privacy_policy 
	hide_glitch \{num_frames = 3}
	if privacy_policy_should_use_mainmenu_bg
		destroy_mainmenu_bg
	endif
	clean_up_user_control_helpers
	if ScreenElementExists \{id = privacy_policy}
		DestroyScreenElement \{id = privacy_policy}
	endif
endscript

script ui_deinit_privacy_policy 
	push_unload_social_networks_choose_pak
endscript

script ui_privacy_policy_scroll \{desc_id = privacy_policy
		time = 0.1
		setup_handlers = 1}
	if <desc_id> :desc_resolvealias Name = alias_text_menu
		GetScreenElementDims id = <resolved_id>
		<menu_height> = <height>
		if <desc_id> :desc_resolvealias Name = alias_text_clip
			GetScreenElementDims id = <resolved_id>
			<clip_height> = <height>
			if (<menu_height> < <clip_height>)
				return
			endif
		endif
	endif
	<scroll_speed> = (0.0, 200.0)
	if <desc_id> :desc_resolvealias Name = alias_text_menu
		<text_menu> = <resolved_id>
		GetScreenElementProps id = <text_menu>
		GetScreenElementChildren id = <text_menu>
		if NOT GotParam \{children}
			return
		endif
		GetArraySize <children>
		if (<array_Size> = 0)
			return
		endif
		<up_limit> = 0
		<down_limit> = ((<dims> [1] * -1) + 300)
		if GotParam \{up}
			<new_pos> = (<Pos> + <scroll_speed>)
			if NOT ((<new_pos> [1]) < <up_limit>)
				<new_pos> = (0.0, 0.0)
			endif
		elseif GotParam \{down}
			<new_pos> = (<Pos> - <scroll_speed>)
			if NOT ((<new_pos> [1]) > <down_limit>)
				<new_pos> = ((0.0, 0.0) + (<down_limit> * (0.0, 1.0)))
				if (<setup_handlers> = 1)
					ui_privacy_policy_setup_handlers
				endif
			endif
		endif
		if (<Pos> [1] = <new_pos> [1])
			return
		endif
		ui_menu_scroll_sfx
		<scrollable_length> = 280
		if <desc_id> :desc_resolvealias Name = alias_generic_scrollbar_wgt
			<scrollbar_wgt> = <resolved_id>
			if <scrollbar_wgt> :desc_resolvealias Name = alias_scroll_ends_height
				GetScreenElementDims id = <resolved_id>
				<scrollbar_height> = <height>
				if <scrollbar_wgt> :desc_resolvealias Name = alias_thumb_offset
					GetScreenElementDims id = <resolved_id>
					<scrollable_length> = (<scrollbar_height> - <height>)
				endif
			endif
		endif
		<ratio> = (<scrollable_length> / <down_limit>)
		<new_thumb_pos> = (<new_pos> [1] * <ratio>)
		<scroll_pos> = ((0.0, 0.0) + (<new_thumb_pos> * (0.0, 1.0)))
		<desc_id> :SetProps scroll_thumb_pos = <scroll_pos> time = <time>
		<text_menu> :SetProps Pos = <new_pos> time = <time>
	endif
endscript

script ui_privacy_policy_setup_handlers \{no_accept = 0
		Type = !q1768515945}
	ui_event_wait_for_safe
	privacy_policy :GetTags
	z = (($g_options_facebook_twitter_z_priority) + 10000)
	clean_up_user_control_helpers
	if (<no_accept> = 0)
		privacy_policy :se_setprops event_handlers = [
			{pad_choose ui_privacy_policy_accepted_policy params = {Type = <Type> state = <next_state> data = {is_popup <next_state_params>}}}
			{pad_choose ui_sfx params = {menustate = Generic uitype = select}}
		]
		add_user_control_helper text = qs(0xb73cb78f) button = green z = <z>
		privacy_policy :se_setprops event_handlers = [
			{pad_back <back_script> params = {<back_params>}}
			{pad_back ui_sfx params = {menustate = Generic uitype = back}}
		]
		add_user_control_helper text = qs(0x0bbc9ad9) button = red z = <z>
	else
		privacy_policy :se_setprops event_handlers = [
			{pad_choose <back_script> params = {<back_params>}}
			{pad_choose ui_sfx params = {menustate = Generic uitype = select}}
		]
		add_user_control_helper text = qs(0x3fc1c076) button = green z = <z>
	endif
endscript

script ui_privacy_policy_accepted_policy \{Type = !q1768515945}
	printf \{qs(0xdbb7f047)}
	switch <Type>
		case facebook
		facebook_set_info controller = ($primary_controller) element = accepted_terms value = 1
		case twitter
		twitter_set_info controller = ($primary_controller) element = accepted_terms value = 1
		default
		ScriptAssert \{qs(0xcb4ae081)}
	endswitch
	generic_event_replace state = <state> data = <data>
endscript

script privacy_policy_should_use_mainmenu_bg 
	return \{FALSE}
endscript
