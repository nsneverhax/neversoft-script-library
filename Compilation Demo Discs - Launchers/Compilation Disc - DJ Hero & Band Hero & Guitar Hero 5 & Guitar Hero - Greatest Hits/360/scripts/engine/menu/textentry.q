default_text_characters = [
	[
		qs("\L ")
		qs("\L ")
	]
	[
		qs("\LA")
		qs("\La")
	]
	[
		qs("\LB")
		qs("\Lb")
	]
	[
		qs("\LC")
		qs("\Lc")
	]
	[
		qs("\LD")
		qs("\Ld")
	]
	[
		qs("\LE")
		qs("\Le")
	]
	[
		qs("\LF")
		qs("\Lf")
	]
	[
		qs("\LG")
		qs("\Lg")
	]
	[
		qs("\LH")
		qs("\Lh")
	]
	[
		qs("\LI")
		qs("\Li")
	]
	[
		qs("\LJ")
		qs("\Lj")
	]
	[
		qs("\LK")
		qs("\Lk")
	]
	[
		qs("\LL")
		qs("\Ll")
	]
	[
		qs("\LM")
		qs("\Lm")
	]
	[
		qs("\LN")
		qs("\Ln")
	]
	[
		qs("\LO")
		qs("\Lo")
	]
	[
		qs("\LP")
		qs("\Lp")
	]
	[
		qs("\LQ")
		qs("\Lq")
	]
	[
		qs("\LR")
		qs("\Lr")
	]
	[
		qs("\LS")
		qs("\Ls")
	]
	[
		qs("\LT")
		qs("\Lt")
	]
	[
		qs("\LU")
		qs("\Lu")
	]
	[
		qs("\LV")
		qs("\Lv")
	]
	[
		qs("\LW")
		qs("\Lw")
	]
	[
		qs("\LX")
		qs("\Lx")
	]
	[
		qs("\LY")
		qs("\Ly")
	]
	[
		qs("\LZ")
		qs("\Lz")
	]
	[
		qs("\L1")
		qs("\L1")
	]
	[
		qs("\L2")
		qs("\L2")
	]
	[
		qs("\L3")
		qs("\L3")
	]
	[
		qs("\L4")
		qs("\L4")
	]
	[
		qs("\L5")
		qs("\L5")
	]
	[
		qs("\L6")
		qs("\L6")
	]
	[
		qs("\L7")
		qs("\L7")
	]
	[
		qs("\L8")
		qs("\L8")
	]
	[
		qs("\L9")
		qs("\L9")
	]
	[
		qs("\L0")
		qs("\L0")
	]
	[
		qs("\L'")
		qs("\L'")
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

script text_entry_add_item {
		pad_back_script = generic_event_back
		pad_choose_script = nullscript
		focus_script = focus_text_entry
		unfocus_script = unfocus_text_entry
		font = fontgrid_bordello
		font_material = 0x00000000
		text_case = mixed
		dims = (350.0, 29.0)
		pos = (12.0, 0.0)
		rgba = (($cas_color_scheme).text_color)
		text_offset = (0.0, 0.0)
		marker_offset = (0.0, 0.0)
		validity_message = qs("You must enter a Name to proceed!")
	}
	CreateScreenElement {
		type = ContainerElement
		parent = current_menu
		dims = <dims>
		<focusable_flags>
		just = [left , top]
		pos_anchor = [left , top]
	}
	text_entry = <id>
	SetScreenElementProps {
		id = <text_entry>
		event_handlers = [
			{focus <focus_script> params = {text_entry = <text_entry> <focus_params>}}
			{unfocus <unfocus_script> params = {text_entry = <text_entry> <unfocus_params>}}
			{pad_choose initiate_text_entry params = {text_entry = <text_entry>}}
		]
	}
	CreateScreenElement {
		type = VMenu
		parent = <id>
		dims = <dims>
		pos = <pos>
		just = [left , top]
		internal_just = [left , top]
		fit_major = `fit content`
		fit_minor = `fit content`
	}
	cont_id = <id>
	CreateScreenElement {
		type = TextBlockElement
		parent = <cont_id>
		font = <font>
		material = <font_material>
		text = <text>
		just = [left , top]
		rgba = <rgba>
		dims = <dims>
		internal_just = [left , top]
		fit_width = `expand dims`
		fit_height = `expand dims`
		pos = <text_offset>
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = (($g_menu_colors).menu_shadow)
	}
	text_entry_text = <id>
	CreateScreenElement {
		type = TextBlockElement
		parent = <id>
		text = qs("\L_")
		font = fontgrid_bordello
		rgba = [0 0 0 0]
		just = [left top]
		anchor_pos = [left , top]
		internal_just = [left , top]
		fit_width = `expand dims`
		fit_height = `expand dims`
	}
	text_entry_marker = <id>
	if GotParam \{linear_flow}
		linear_flow = true
	else
		linear_flow = false
	endif
	<text_entry> :SetTags {
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
		rgba = <rgba>
	}
	if GotParam \{text}
		seed_text_entry text = <text> text_entry = <text_entry>
	else
		refresh_text_on_screen char_index_array = ($default_text_array) current_index = 0 caps_lock_state = 0 text_entry = <text_entry> font = <font>
	endif
	RunScriptOnScreenElement id = <text_entry_marker> text_blink params = {id = <text_entry_marker> time = 0.5}
	return text_entry = <text_entry>
endscript

script change_char_up 
	<text_entry> :GetTags
	GetArraySize ($default_text_characters)
	character = (<char_index_array> [<current_index>])
	SetArrayElement ArrayName = character index = 0 newvalue = ((<character> [0]) + 1)
	SetArrayElement ArrayName = character index = 1 newvalue = <caps_lock_state>
	if ((<character> [0]) = <array_size>)
		SetArrayElement \{ArrayName = character
			index = 0
			newvalue = 0}
	endif
	SetArrayElement ArrayName = char_index_array index = <current_index> newvalue = <character>
	<text_entry> :SetTags {
		char_index_array = <char_index_array>
	}
	refresh_text_on_screen <...>
	SoundEvent \{event = Enter_Band_Name_Scroll_Down}
endscript

script change_char_down 
	<text_entry> :GetTags
	GetArraySize ($default_text_characters)
	character = (<char_index_array> [<current_index>])
	SetArrayElement ArrayName = character index = 0 newvalue = ((<character> [0]) -1)
	SetArrayElement ArrayName = character index = 1 newvalue = <caps_lock_state>
	if ((<character> [0]) < 0)
		SetArrayElement ArrayName = character index = 0 newvalue = (<array_size> -1)
	endif
	SetArrayElement ArrayName = char_index_array index = <current_index> newvalue = <character>
	<text_entry> :SetTags {
		char_index_array = <char_index_array>
	}
	refresh_text_on_screen <...>
	SoundEvent \{event = Enter_Band_Name_Scroll_Up}
endscript

script refresh_text_on_screen 
	<text_entry> :GetTags
	get_string_from_array array = <char_index_array> index = (<current_index> + 1)
	SetScreenElementProps id = <text_entry_text> text = <text>
	StringNCopy string = <text> length = <current_index>
	text_index = (<char_index_array> [<current_index>] [0])
	new_string = (<new_string> + (($default_text_characters) [<text_index>] [<caps_lock_state>]))
	update_text_entry_marker text = <new_string> text_entry = <text_entry> font = <font>
endscript

script advance_text_pointer \{force_final_char_for_confirm = false}
	<text_entry> :GetTags
	current_index = (<current_index> + 1)
	if ((<current_index> < ($num_name_size)) || (<force_final_char_for_confirm> = true))
		<text_entry> :SetTags {
			current_index = <current_index>
		}
		get_string_from_array array = <char_index_array> index = (<current_index> + 1)
		StringNCopy string = <text> length = <current_index>
		text_index = (<char_index_array> [<current_index>] [0])
		new_string = (<new_string> + (($default_text_characters) [<text_index>] [<caps_lock_state>]))
		update_text_entry_marker text = <new_string> text_entry = <text_entry>
		SetScreenElementProps id = <text_entry_text> text = <new_string>
		<character> = (<char_index_array> [<current_index>])
		SetArrayElement ArrayName = character index = 0 newvalue = ((<character> [0]))
		SetArrayElement ArrayName = character index = 1 newvalue = <caps_lock_state>
		SetArrayElement ArrayName = char_index_array index = <current_index> newvalue = <character>
		<text_entry> :SetTags {
			char_index_array = <char_index_array>
		}
		SoundEvent \{event = enter_band_name_select}
	endif
endscript

script retreat_text_pointer 
	<text_entry> :GetTags
	if (<current_index> = 0)
		SoundEvent \{event = Menu_Scroll_End}
		if (<pad_back_script> = nullscript)
			return
		endif
		if (<linear_flow> = true)
			<text_entry> :SetTags {
				current_index = 0
				char_index_array = ($default_text_array)
			}
			if NOT GotParam \{skip_deinit}
				deinitiate_text_entry text_entry = <text_entry>
			endif
			<pad_back_script> <pad_back_params>
		endif
	else
		SetArrayElement ArrayName = char_index_array index = <current_index> newvalue = (($default_text_array) [<current_index>])
		current_index = (<current_index> -1)
		<text_entry> :SetTags {
			current_index = <current_index>
			char_index_array = <char_index_array>
		}
		get_string_from_array array = <char_index_array> index = (<current_index> + 1)
		SetScreenElementProps id = <text_entry_text> text = <text>
		StringNCopy string = <text> length = <current_index>
		text_index = (<char_index_array> [<current_index>] [0])
		new_string = (<new_string> + (($default_text_characters) [<text_index>] [<caps_lock_state>]))
		update_text_entry_marker text = <new_string> text_entry = <text_entry>
		SoundEvent \{event = Enter_Band_Name_Back}
	endif
endscript

script confirm_name 
	<text_entry> :GetTags
	if NOT is_text_valid text_entry = <text_entry>
		LaunchEvent type = unfocus target = <text_entry>
		generic_event_choose no_sound state = UIstate_generic_alert_popup data = {pad_choose_script = return_reinit_text_entry pad_choose_params = {text_entry = <text_entry>} is_popup title = qs("Invalid Name") text = <validity_message>}
		SoundEvent \{event = Menu_Warning_SFX}
	else
		advance_text_pointer text_entry = <text_entry> force_final_char_for_confirm = true
		<text_entry> :GetTags
		get_string_from_array array = <char_index_array> index = <current_index>
		StringRemoveTrailingWhitespace string = <text>
		deinitiate_text_entry text_entry = <text_entry>
		pad_choose_params = {<pad_choose_params> text = <new_string>}
		<pad_choose_script> <pad_choose_params>
	endif
endscript

script get_string_from_array 
	RequireParams \{[
			array
		]}
	text = qs("")
	if (<index> = 0)
		return \{text = qs("")}
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
	LaunchEvent \{type = unfocus
		target = current_menu}
	LaunchEvent type = focus target = <text_entry>
	<text_entry> :GetSingleTag text_case
	<text_entry> :GetSingleTag linear_flow
	<text_entry> :GetSingleTag pad_back_script
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
	if ChecksumEquals a = <text_case> b = mixed
		AddArrayElement array = <event_handlers> element = {{pad_l1 toggle_caps_lock params = {text_entry = <text_entry>}}}
		event_handlers = <array>
	endif
	SetScreenElementProps {
		id = <text_entry>
		event_handlers = <event_handlers>
		replace_handlers
	}
endscript

script deinitiate_text_entry 
	if ScreenElementExists id = <text_entry>
		<text_entry> :SetTags {
			current_index = 0
			char_index_array = ($default_text_array)
			caps_lock_state = 0
		}
		SetScreenElementProps {
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
	LaunchEvent type = unfocus target = <text_entry>
	LaunchEvent \{type = focus
		target = current_menu}
endscript

script is_text_valid 
	<text_entry> :GetTags
	get_string_from_array array = <char_index_array> index = (<current_index> + 1)
	StringRemoveTrailingWhitespace string = <text>
	if (<new_string> = qs("\L"))
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
	RequireParams \{[
			text
		]}
	caps_lock_state = 0
	text_array = ($default_text_array)
	StringToCharArray string = <text>
	GetArraySize <char_array>
	string_size = <array_size>
	if (<string_size> > (($num_name_size) + 1))
		ScriptAssert \{qs("\LText provided to TextEntry menu item is too long")}
	endif
	<text_entry> :GetSingleTag text_case
	if (<string_size> > 0)
		i = 0
		begin
		GetArraySize ($default_text_characters)
		j = 0
		begin
		if (<char_array> [<i>] = ($default_text_characters) [<j>] [0])
			new_val = [0 0]
			SetArrayElement ArrayName = new_val index = 0 newvalue = <j>
			SetArrayElement ArrayName = text_array index = <i> newvalue = <new_val>
			caps_lock_state = (<text_array> [<i>] [1])
			break
		endif
		if (<char_array> [<i>] = ($default_text_characters) [<j>] [1])
			new_val = [0 1]
			SetArrayElement ArrayName = new_val index = 0 newvalue = <j>
			SetArrayElement ArrayName = text_array index = <i> newvalue = <new_val>
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
	if ChecksumEquals a = <text_case> b = lower
		caps_lock_state = 0
	endif
	if ChecksumEquals a = <text_case> b = upper
		caps_lock_state = 1
	endif
	<text_entry> :SetTags {
		char_index_array = <text_array>
		current_index = (<current_index>)
		caps_lock_state = <caps_lock_state>
	}
endscript

script text_blink 
	if NOT ScreenElementExists id = <id>
		return
	endif
	begin
	SetScreenElementProps id = <id> alpha = 0 time = <time>
	Wait <time> seconds
	SetScreenElementProps id = <id> alpha = 1.0
	Wait <time> seconds
	repeat
endscript

script toggle_caps_lock 
	<text_entry> :GetTags
	if (<caps_lock_state> = 0)
		caps_lock_state = 1
	else
		caps_lock_state = 0
	endif
	character = (<char_index_array> [<current_index>])
	SetArrayElement ArrayName = character index = 1 newvalue = <caps_lock_state>
	SetArrayElement ArrayName = char_index_array index = <current_index> newvalue = <character>
	<text_entry> :SetTags {
		caps_lock_state = <caps_lock_state>
		char_index_array = <char_index_array>
	}
	get_string_from_array array = <char_index_array> index = (<current_index> + 1)
	SetScreenElementProps id = <text_entry_text> text = <text>
	if NOT ((($default_text_characters) [(<character> [0])] [0]) = (($default_text_characters) [(<character> [0])] [1]))
		SoundEvent \{event = Enter_Band_Name_Caps}
	endif
endscript

script focus_text_entry 
	<text_entry> :GetTags
	SetScreenElementProps id = <text_entry_text> rgba = <rgba>
	SetScreenElementProps id = <text_entry_marker> rgba = (($cas_color_scheme).title_color)
endscript

script unfocus_text_entry 
	<text_entry> :GetTags
	SetScreenElementProps id = <text_entry_text> rgba = <rgba>
	SetScreenElementProps id = <text_entry_marker> rgba = (($cas_color_scheme).title_color)
endscript

script update_text_entry_marker 
	RequireParams \{[
			text
		]
		all}
	<text_entry> :GetTags
	QueryString string = <text> font = <font>
	new_width = <width>
	StringToCharArray string = <text>
	GetArraySize <char_array>
	last_char = qs("\L")
	if (<array_size> > 0)
		last_char = (<char_array> [(<array_size> -1)])
	endif
	QueryString string = <last_char> font = <font>
	new_width = (<new_width> - <width>)
	SetScreenElementProps id = <text_entry_marker> pos = (<marker_offset> + ((1.0, 0.0) * <new_width>))
endscript
