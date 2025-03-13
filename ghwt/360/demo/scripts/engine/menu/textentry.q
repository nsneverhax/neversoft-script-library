default_text_characters = [
	[
		qs(0x713755f7)
		qs(0x713755f7)
	]
	[
		qs(0x0dd10f11)
		qs(0x98552bb3)
	]
	[
		qs(0x26fc5cd2)
		qs(0xb3787870)
	]
	[
		qs(0x3fe76d93)
		qs(0xaa634931)
	]
	[
		qs(0x70a6fb54)
		qs(0xe522dff6)
	]
	[
		qs(0x69bdca15)
		qs(0xfc39eeb7)
	]
	[
		qs(0x429099d6)
		qs(0xd714bd74)
	]
	[
		qs(0x5b8ba897)
		qs(0xce0f8c35)
	]
	[
		qs(0xdc13b458)
		qs(0x499790fa)
	]
	[
		qs(0xc5088519)
		qs(0x508ca1bb)
	]
	[
		qs(0xee25d6da)
		qs(0x7ba1f278)
	]
	[
		qs(0xf73ee79b)
		qs(0x62bac339)
	]
	[
		qs(0xb87f715c)
		qs(0x2dfb55fe)
	]
	[
		qs(0xa164401d)
		qs(0x34e064bf)
	]
	[
		qs(0x8a4913de)
		qs(0x1fcd377c)
	]
	[
		qs(0x9352229f)
		qs(0x06d6063d)
	]
	[
		qs(0x5e082c01)
		qs(0xcb8c08a3)
	]
	[
		qs(0x47131d40)
		qs(0xd29739e2)
	]
	[
		qs(0x6c3e4e83)
		qs(0xf9ba6a21)
	]
	[
		qs(0x75257fc2)
		qs(0xe0a15b60)
	]
	[
		qs(0x3a64e905)
		qs(0xafe0cda7)
	]
	[
		qs(0x237fd844)
		qs(0xb6fbfce6)
	]
	[
		qs(0x08528b87)
		qs(0x9dd6af25)
	]
	[
		qs(0x1149bac6)
		qs(0x84cd9e64)
	]
	[
		qs(0x96d1a609)
		qs(0x035582ab)
	]
	[
		qs(0x8fca9748)
		qs(0x1a4eb3ea)
	]
	[
		qs(0xa4e7c48b)
		qs(0x3163e029)
	]
	[
		qs(0x22ee76e7)
		qs(0x22ee76e7)
	]
	[
		qs(0x09c32524)
		qs(0x09c32524)
	]
	[
		qs(0x10d81465)
		qs(0x10d81465)
	]
	[
		qs(0x5f9982a2)
		qs(0x5f9982a2)
	]
	[
		qs(0x4682b3e3)
		qs(0x4682b3e3)
	]
	[
		qs(0x6dafe020)
		qs(0x6dafe020)
	]
	[
		qs(0x74b4d161)
		qs(0x74b4d161)
	]
	[
		qs(0xf32ccdae)
		qs(0xf32ccdae)
	]
	[
		qs(0xea37fcef)
		qs(0xea37fcef)
	]
	[
		qs(0x3bf547a6)
		qs(0x3bf547a6)
	]
	[
		qs(0x3e76c330)
		qs(0x3e76c330)
	]
]
default_text_array = [
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
]
num_name_size = 18

script text_entry_add_item \{pad_back_script = generic_event_back
		pad_choose_script = nullscript
		focus_script = focus_text_entry
		unfocus_script = unfocus_text_entry
		font = fontgrid_text_a6_fire
		font_material = sys_fontgrid_text_a6_fire_sys_fontgrid_text_a6_fire
		text_case = mixed
		dims = (350.0, 29.0)
		pos = (12.0, 0.0)
		text_offset = (0.0, 0.0)
		marker_offset = (0.0, 10.0)
		validity_message = qs(0x40d1d9f7)}
	createscreenelement {
		type = containerelement
		parent = current_menu
		dims = <dims>
		<focusable_flags>
		just = [left , top]
		pos_anchor = [left , top]
	}
	text_entry = <id>
	setscreenelementprops {
		id = <text_entry>
		event_handlers = [
			{focus <focus_script> params = {text_entry = <text_entry> <focus_params>}}
			{unfocus <unfocus_script> params = {text_entry = <text_entry> <unfocus_params>}}
			{pad_choose initiate_text_entry params = {text_entry = <text_entry>}}
		]
	}
	createscreenelement {
		type = vmenu
		parent = <id>
		dims = <dims>
		pos = <pos>
		just = [left , top]
		internal_just = [left , top]
		fit_major = `fit content`
		fit_minor = `fit content`
	}
	cont_id = <id>
	createscreenelement {
		type = textblockelement
		parent = <cont_id>
		font = <font>
		material = <font_material>
		text = <text>
		just = [left , top]
		rgba = (($cas_color_scheme).text_color)
		dims = <dims>
		internal_just = [left , top]
		fit_width = `expand dims`
		fit_height = `expand dims`
		pos = <text_offset>
	}
	text_entry_text = <id>
	createscreenelement {
		type = textblockelement
		parent = <id>
		text = qs(0xd99030ce)
		font = ($test_menu_font)
		rgba = [0 0 0 0]
		just = [left top]
		anchor_pos = [left , top]
		internal_just = [left , top]
		fit_width = `expand dims`
		fit_height = `expand dims`
	}
	text_entry_marker = <id>
	if gotparam \{linear_flow}
		linear_flow = true
	else
		linear_flow = false
	endif
	<text_entry> :settags {
		text_entry_text = <text_entry_text>
		text_entry_marker = <text_entry_marker>
		current_index = 0
		char_index_array = ($default_text_array)
		caps_lock_state = 0
		pad_back_script = <pad_back_script>
		pad_back_params = <pad_back_params>
		pad_choose_script = <pad_choose_script>
		pad_choose_params = <pad_choose_params>
		font = <font>
		text_case = <text_case>
		linear_flow = <linear_flow>
		marker_offset = <marker_offset>
		validity_message = <validity_message>
		skip_deinit = <skip_deinit>
	}
	if gotparam \{text}
		seed_text_entry text = <text> text_entry = <text_entry>
	else
		refresh_text_on_screen char_index_array = ($default_text_array) current_index = 0 caps_lock_state = 0 text_entry = <text_entry>
	endif
	runscriptonscreenelement id = <text_entry_marker> text_blink params = {id = <text_entry_marker> time = 0.5}
	return text_entry = <text_entry>
endscript

script change_char_up 
	<text_entry> :gettags
	getarraysize ($default_text_characters)
	character = (<char_index_array> [<current_index>])
	setarrayelement arrayname = character index = 0 newvalue = ((<character> [0]) + 1)
	setarrayelement arrayname = character index = 1 newvalue = <caps_lock_state>
	if ((<character> [0]) = <array_size>)
		setarrayelement \{arrayname = character
			index = 0
			newvalue = 0}
	endif
	setarrayelement arrayname = char_index_array index = <current_index> newvalue = <character>
	<text_entry> :settags {
		char_index_array = <char_index_array>
	}
	refresh_text_on_screen <...>
	soundevent \{event = enter_band_name_scroll_down}
endscript

script change_char_down 
	<text_entry> :gettags
	getarraysize ($default_text_characters)
	character = (<char_index_array> [<current_index>])
	setarrayelement arrayname = character index = 0 newvalue = ((<character> [0]) -1)
	setarrayelement arrayname = character index = 1 newvalue = <caps_lock_state>
	if ((<character> [0]) < 0)
		setarrayelement arrayname = character index = 0 newvalue = (<array_size> -1)
	endif
	setarrayelement arrayname = char_index_array index = <current_index> newvalue = <character>
	<text_entry> :settags {
		char_index_array = <char_index_array>
	}
	refresh_text_on_screen <...>
	soundevent \{event = enter_band_name_scroll_up}
endscript

script refresh_text_on_screen 
	<text_entry> :gettags
	get_string_from_array array = <char_index_array> index = (<current_index> + 1)
	setscreenelementprops id = <text_entry_text> text = <text>
	stringncopy string = <text> length = <current_index>
	text_index = (<char_index_array> [<current_index>] [0])
	new_string = (<new_string> + (($default_text_characters) [<text_index>] [<caps_lock_state>]))
	update_text_entry_marker text = <new_string> text_entry = <text_entry>
endscript

script advance_text_pointer \{force_final_char_for_confirm = false}
	<text_entry> :gettags
	current_index = (<current_index> + 1)
	if ((<current_index> < ($num_name_size)) || (<force_final_char_for_confirm> = true))
		<text_entry> :settags {
			current_index = <current_index>
		}
		get_string_from_array array = <char_index_array> index = (<current_index> + 1)
		stringncopy string = <text> length = <current_index>
		text_index = (<char_index_array> [<current_index>] [0])
		new_string = (<new_string> + (($default_text_characters) [<text_index>] [<caps_lock_state>]))
		update_text_entry_marker text = <new_string> text_entry = <text_entry>
		setscreenelementprops id = <text_entry_text> text = <new_string>
		<character> = (<char_index_array> [<current_index>])
		setarrayelement arrayname = character index = 0 newvalue = ((<character> [0]))
		setarrayelement arrayname = character index = 1 newvalue = <caps_lock_state>
		setarrayelement arrayname = char_index_array index = <current_index> newvalue = <character>
		<text_entry> :settags {
			char_index_array = <char_index_array>
		}
		soundevent \{event = enter_band_name_select}
	endif
endscript

script retreat_text_pointer 
	<text_entry> :gettags
	if (<current_index> = 0)
		soundevent \{event = menu_scroll_end}
		if (<pad_back_script> = nullscript)
			return
		endif
		if (<linear_flow> = true)
			<text_entry> :settags {
				current_index = 0
				char_index_array = ($default_text_array)
			}
			if NOT gotparam \{skip_deinit}
				deinitiate_text_entry text_entry = <text_entry>
			endif
			<pad_back_script> <pad_back_params>
		endif
	else
		setarrayelement arrayname = char_index_array index = <current_index> newvalue = (($default_text_array) [<current_index>])
		current_index = (<current_index> -1)
		<text_entry> :settags {
			current_index = <current_index>
			char_index_array = <char_index_array>
		}
		get_string_from_array array = <char_index_array> index = (<current_index> + 1)
		setscreenelementprops id = <text_entry_text> text = <text>
		stringncopy string = <text> length = <current_index>
		text_index = (<char_index_array> [<current_index>] [0])
		new_string = (<new_string> + (($default_text_characters) [<text_index>] [<caps_lock_state>]))
		update_text_entry_marker text = <new_string> text_entry = <text_entry>
		soundevent \{event = enter_band_name_back}
	endif
endscript

script confirm_name 
	<text_entry> :gettags
	if NOT is_text_valid text_entry = <text_entry>
		launchevent type = unfocus target = <text_entry>
		generic_event_choose no_sound state = uistate_generic_alert_popup data = {pad_choose_script = return_reinit_text_entry pad_choose_params = {text_entry = <text_entry>} is_popup title = qs(0x154925b6) text = <validity_message>}
		soundevent \{event = menu_warning_sfx}
	else
		advance_text_pointer text_entry = <text_entry> force_final_char_for_confirm = true
		<text_entry> :gettags
		get_string_from_array array = <char_index_array> index = <current_index>
		stringremovetrailingwhitespace string = <text>
		deinitiate_text_entry text_entry = <text_entry>
		pad_choose_params = {<pad_choose_params> text = <new_string>}
		<pad_choose_script> <pad_choose_params>
	endif
endscript

script get_string_from_array 
	requireparams \{[
			array
		]}
	text = qs(0x00000000)
	if (<index> = 0)
		return \{text = qs(0x00000000)}
	endif
	i = 0
	begin
	text_index = (<array> [<i>] [0])
	cap_state = (<array> [<i>] [1])
	text = (<text> + (($default_text_characters) [<text_index>] [<cap_state>]))
	i = (<i> + 1)
	repeat <index>
	return text = <text>
endscript

script initiate_text_entry 
	launchevent \{type = unfocus
		target = current_menu}
	launchevent type = focus target = <text_entry>
	<text_entry> :getsingletag text_case
	<text_entry> :getsingletag linear_flow
	<text_entry> :getsingletag pad_back_script
	if (<linear_flow> = true)
		event_handlers = [
			{pad_up change_char_down params = {text_entry = <text_entry>}}
			{pad_down change_char_up params = {text_entry = <text_entry>}}
			{pad_choose advance_text_pointer params = {text_entry = <text_entry>}}
			{pad_back retreat_text_pointer params = {text_entry = <text_entry>}}
			{pad_start confirm_name params = {text_entry = <text_entry>}}
		]
	else
		event_handlers = [
			{pad_up change_char_down params = {text_entry = <text_entry>}}
			{pad_down change_char_up params = {text_entry = <text_entry>}}
			{pad_option2 advance_text_pointer params = {text_entry = <text_entry>}}
			{pad_option retreat_text_pointer params = {text_entry = <text_entry>}}
			{pad_choose confirm_name params = {text_entry = <text_entry>}}
			{pad_back <pad_back_script>}
		]
	endif
	if checksumequals a = <text_case> b = mixed
		addarrayelement array = <event_handlers> element = {{pad_l1 toggle_caps_lock params = {text_entry = <text_entry>}}}
		event_handlers = <array>
	endif
	setscreenelementprops {
		id = <text_entry>
		event_handlers = <event_handlers>
		replace_handlers
	}
endscript

script deinitiate_text_entry 
	if screenelementexists id = <text_entry>
		<text_entry> :settags {
			current_index = 0
			char_index_array = ($default_text_array)
			caps_lock_state = 0
		}
		setscreenelementprops {
			id = <text_entry>
			event_handlers = [
				{pad_choose initiate_text_entry params = {text_entry = <text_entry>}}
				{pad_start nullscript}
				{pad_back nullscript}
				{pad_up nullscript}
				{pad_down nullscript}
				{pad_option nullscript}
			]
			replace_handlers
		}
	endif
	refresh_text_on_screen char_index_array = ($default_text_array) current_index = 0 caps_lock_state = 0 text_entry = <text_entry>
	launchevent type = unfocus target = <text_entry>
	launchevent \{type = focus
		target = current_menu}
endscript

script is_text_valid 
	<text_entry> :gettags
	get_string_from_array array = <char_index_array> index = (<current_index> + 1)
	stringremovetrailingwhitespace string = <text>
	if (<new_string> = qs(0x03ac90f0))
		return \{false}
	else
		return \{true}
	endif
endscript

script return_reinit_text_entry 
	generic_event_back
	initiate_text_entry <...>
endscript

script seed_text_entry 
	requireparams \{[
			text
		]}
	caps_lock_state = 0
	text_array = ($default_text_array)
	stringtochararray string = <text>
	getarraysize <char_array>
	string_size = <array_size>
	if (<string_size> > (($num_name_size) + 1))
		scriptassert \{qs(0x5c0e981e)}
	endif
	<text_entry> :getsingletag text_case
	if (<string_size> > 0)
		i = 0
		begin
		getarraysize ($default_text_characters)
		j = 0
		begin
		if (<char_array> [<i>] = ($default_text_characters) [<j>] [0])
			new_val = [0 0]
			setarrayelement arrayname = new_val index = 0 newvalue = <j>
			setarrayelement arrayname = text_array index = <i> newvalue = <new_val>
			caps_lock_state = (<text_array> [<i>] [1])
			break
		endif
		if (<char_array> [<i>] = ($default_text_characters) [<j>] [1])
			new_val = [0 1]
			setarrayelement arrayname = new_val index = 0 newvalue = <j>
			setarrayelement arrayname = text_array index = <i> newvalue = <new_val>
			caps_lock_state = (<text_array> [<i>] [1])
			break
		endif
		j = (<j> + 1)
		repeat <array_size>
		i = (<i> + 1)
		repeat <string_size>
	endif
	update_text_entry_marker text = <text> text_entry = <text_entry>
	current_index = (<string_size> -1)
	if (<current_index> < 0)
		current_index = 0
	endif
	if checksumequals a = <text_case> b = lower
		caps_lock_state = 0
	endif
	if checksumequals a = <text_case> b = upper
		caps_lock_state = 1
	endif
	<text_entry> :settags {
		char_index_array = <text_array>
		current_index = (<current_index>)
		caps_lock_state = <caps_lock_state>
	}
endscript

script text_blink 
	if NOT screenelementexists id = <id>
		return
	endif
	begin
	setscreenelementprops id = <id> alpha = 0 time = <time>
	wait <time> seconds
	setscreenelementprops id = <id> alpha = 1.0
	wait <time> seconds
	repeat
endscript

script toggle_caps_lock 
	<text_entry> :gettags
	if (<caps_lock_state> = 0)
		caps_lock_state = 1
	else
		caps_lock_state = 0
	endif
	character = (<char_index_array> [<current_index>])
	setarrayelement arrayname = character index = 1 newvalue = <caps_lock_state>
	setarrayelement arrayname = char_index_array index = <current_index> newvalue = <character>
	<text_entry> :settags {
		caps_lock_state = <caps_lock_state>
		char_index_array = <char_index_array>
	}
	get_string_from_array array = <char_index_array> index = (<current_index> + 1)
	setscreenelementprops id = <text_entry_text> text = <text>
	if NOT ((($default_text_characters) [(<character> [0])] [0]) = (($default_text_characters) [(<character> [0])] [1]))
		soundevent \{event = enter_band_name_caps}
	endif
endscript

script focus_text_entry 
	<text_entry> :gettags
	setscreenelementprops id = <text_entry_text> rgba = (($cas_color_scheme).text_focus_color)
	setscreenelementprops id = <text_entry_marker> rgba = (($cas_color_scheme).title_color)
endscript

script unfocus_text_entry 
	<text_entry> :gettags
	setscreenelementprops id = <text_entry_text> rgba = (($cas_color_scheme).text_color)
	setscreenelementprops id = <text_entry_marker> rgba = [0 0 0 0]
endscript

script update_text_entry_marker 
	requireparams \{[
			text
		]
		all}
	<text_entry> :gettags
	querystring string = <text> font = <font>
	new_width = <width>
	stringtochararray string = <text>
	getarraysize <char_array>
	last_char = qs(0x03ac90f0)
	if (<array_size> > 0)
		last_char = (<char_array> [(<array_size> -1)])
	endif
	querystring string = <last_char> font = ($test_menu_font)
	new_width = (<new_width> - <width>)
	setscreenelementprops id = <text_entry_marker> pos = (<marker_offset> + ((1.0, 0.0) * <new_width>))
endscript
