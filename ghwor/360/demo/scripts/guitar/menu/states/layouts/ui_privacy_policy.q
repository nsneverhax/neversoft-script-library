
script ui_create_privacy_policy \{type = !q1768515945
		no_accept = 0
		back_script = generic_event_back
		back_params = {
		}}
	<body_text_array> = []
	create_mainmenu_bg
	switch <type>
		case facebook
		addarrayelement array = <body_text_array> element = ($g_facebook_privacy_policy)
		<body_text_array> = <array>
		case twitter
		addarrayelement array = <body_text_array> element = ($g_twitter_privacy_policy)
		<body_text_array> = <array>
		default
		scriptassert \{qs(0xcb4ae081)}
	endswitch
	createscreenelement {
		parent = root_window
		type = descinterface
		id = privacy_policy
		desc = 'privacy_policy'
		dlog_heading_text = qs(0x97c623cf)
		z_priority = 1010
		event_handlers = [
			{pad_up ui_privacy_policy_scroll params = {up}}
			{pad_down ui_privacy_policy_scroll params = {down}}
			{pad_back nullscript}
			{pad_choose nullscript}
		]
		exclusive_device = ($primary_controller)
		tags = {back_script = <back_script> back_params = <back_params> scrolled_to_bottom = 0}
	}
	if gotparam \{next_state}
		privacy_policy :settags {next_state = <next_state> next_state_params = <next_state_params>}
	endif
	getarraysize <body_text_array>
	if privacy_policy :desc_resolvealias \{name = alias_generic_scrollbar_wgt}
		generic_scrollbar_wgt_initialize id = <resolved_id>
		generic_scrollbar_wgt_set_resolution id = <resolved_id> num_elements = <array_size>
	endif
	if privacy_policy :desc_resolvealias \{name = alias_text_menu}
		if (<array_size> > 0)
			<i> = 0
			begin
			createscreenelement {
				type = textblockelement
				parent = <resolved_id>
				font = fontgrid_text_a3
				just = [left top]
				internal_just = [left top]
				scale = 1
				internal_scale = 0.35000002
				rgba = gh6_gold
				dims = (940.0, 30.0)
				text = (<body_text_array> [<i>])
				z_priority = 1010
				fit_width = wrap
				fit_height = `expand dims`
				scale_mode = proportional
				text_case = original
			}
			<i> = (<i> + 1)
			repeat <array_size>
		endif
	endif
	clean_up_user_control_helpers
	launchevent \{type = focus
		target = privacy_policy}
	ui_privacy_policy_setup_handlers no_accept = <no_accept> type = <type>
endscript

script ui_destroy_privacy_policy 
	hide_glitch \{num_frames = 3}
	destroy_mainmenu_bg
	clean_up_user_control_helpers
	if screenelementexists \{id = privacy_policy}
		destroyscreenelement \{id = privacy_policy}
	endif
endscript

script ui_privacy_policy_scroll \{desc_id = privacy_policy
		time = 0.1
		setup_handlers = 1}
	if <desc_id> :desc_resolvealias name = alias_text_menu
		getscreenelementdims id = <resolved_id>
		<menu_height> = <height>
		if <desc_id> :desc_resolvealias name = alias_text_clip
			getscreenelementdims id = <resolved_id>
			<clip_height> = <height>
			if (<menu_height> < <clip_height>)
				return
			endif
		endif
	endif
	<scroll_speed> = (0.0, 200.0)
	if <desc_id> :desc_resolvealias name = alias_text_menu
		<text_menu> = <resolved_id>
		getscreenelementprops id = <text_menu>
		getscreenelementchildren id = <text_menu>
		if NOT gotparam \{children}
			return
		endif
		getarraysize <children>
		if (<array_size> = 0)
			return
		endif
		<up_limit> = 0
		<down_limit> = ((<dims> [1] * -1) + 300)
		if gotparam \{up}
			<new_pos> = (<pos> + <scroll_speed>)
			if NOT ((<new_pos> [1]) < <up_limit>)
				<new_pos> = (0.0, 0.0)
			endif
		elseif gotparam \{down}
			<new_pos> = (<pos> - <scroll_speed>)
			if NOT ((<new_pos> [1]) > <down_limit>)
				<new_pos> = ((0.0, 0.0) + (<down_limit> * (0.0, 1.0)))
				if (<setup_handlers> = 1)
					ui_privacy_policy_setup_handlers
				endif
			endif
		endif
		if (<pos> [1] = <new_pos> [1])
			return
		endif
		ui_menu_scroll_sfx
		<scrollable_length> = 280
		if <desc_id> :desc_resolvealias name = alias_generic_scrollbar_wgt
			<scrollbar_wgt> = <resolved_id>
			if <scrollbar_wgt> :desc_resolvealias name = alias_scroll_ends_height
				getscreenelementdims id = <resolved_id>
				<scrollbar_height> = <height>
				if <scrollbar_wgt> :desc_resolvealias name = alias_thumb_offset
					getscreenelementdims id = <resolved_id>
					<scrollable_length> = (<scrollbar_height> - <height>)
				endif
			endif
		endif
		<ratio> = (<scrollable_length> / <down_limit>)
		<new_thumb_pos> = (<new_pos> [1] * <ratio>)
		<scroll_pos> = ((0.0, 0.0) + (<new_thumb_pos> * (0.0, 1.0)))
		<desc_id> :setprops scroll_thumb_pos = <scroll_pos> time = <time>
		<text_menu> :setprops pos = <new_pos> time = <time>
	endif
endscript

script ui_privacy_policy_setup_handlers \{no_accept = 0
		type = !q1768515945}
	privacy_policy :gettags
	if (<no_accept> = 0)
		if NOT user_control_helper_exists \{button = green}
			clean_up_user_control_helpers
			privacy_policy :se_setprops event_handlers = [
				{pad_choose ui_privacy_policy_accepted_policy params = {type = <type> state = <next_state> data = {is_popup <next_state_params>}}}
				{pad_choose ui_sfx params = {menustate = generic uitype = select}}
			]
			add_user_control_helper \{text = qs(0xb73cb78f)
				button = green
				z = 100000}
		endif
		if NOT user_control_helper_exists \{button = red}
			privacy_policy :se_setprops event_handlers = [
				{pad_back <back_script> params = {<back_params>}}
				{pad_back ui_sfx params = {menustate = generic uitype = back}}
			]
			add_user_control_helper \{text = qs(0x0bbc9ad9)
				button = red
				z = 100000}
		endif
	else
		if NOT user_control_helper_exists \{button = green}
			clean_up_user_control_helpers
			privacy_policy :se_setprops event_handlers = [
				{pad_choose <back_script> params = {<back_params>}}
				{pad_choose ui_sfx params = {menustate = generic uitype = select}}
			]
			add_user_control_helper \{text = qs(0x3fc1c076)
				button = green
				z = 100000}
		endif
	endif
endscript

script ui_privacy_policy_accepted_policy \{type = !q1768515945}
	printf \{qs(0xdbb7f047)}
	switch <type>
		case facebook
		facebook_set_info controller = ($primary_controller) element = accepted_terms value = 1
		case twitter
		twitter_set_info controller = ($primary_controller) element = accepted_terms value = 1
		default
		scriptassert \{qs(0xcb4ae081)}
	endswitch
	generic_event_replace state = <state> data = <data>
endscript
