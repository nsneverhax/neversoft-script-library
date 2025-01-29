popup_menu_base_name = qs(0x00000000)
0xa77ba368 = 0

script get_top_ui_base_name 
	ui_event_get_top
	return base_name = <base_name>
endscript

script create_new_generic_popup \{Priority = 11
		text = qs(0x00000000)
		options = [
		]
		popup_type = message_options
		dont_swap_colors = 0
		z_priority = 300}
	Change \{0xa77ba368 = 1}
	Change \{g_using_alt_popup_bg = 0}
	if (<popup_type> = loading_window)
		if GotParam \{wait_variable}
			if ($<wait_variable> = 1)
				return
			endif
		endif
	endif
	if (($generic_popup_open) = 1)
		if (<Priority> < ($popup_priority))
			printf qs(0x8dc6d51c) d = <Priority> e = ($popup_priority)
			<dont_swap_colors> = 1
			kill_generic_popup_early
			Change \{generic_popup_open = 0}
		else
			printf qs(0x14f224f7) d = <Priority> e = ($popup_priority)
			return
		endif
	endif
	Change popup_priority = <Priority>
	Change \{popup_focus_color = [
			180
			50
			50
			255
		]}
	Change \{popup_unfocus_color = [
			50
			50
			150
			255
		]}
	desc = 'dialog_box_wii'
	extra_desc_props = {}
	switch <popup_type>
		case error_menu
		if NOT GotParam \{error_func_params}
			error_func_params = {}
		endif
		options = [
			{
				func = <error_func>
				func_params = <error_func_params>
				text = qs(0x0e41fe46)
			}
		]
		<back_script> = <error_func>
		<back_params> = <error_func_params>
		if NOT GotParam \{title}
			title = qs(0x79597197)
		endif
		title_effect = 1
		case ok_menu
		if NOT GotParam \{ok_func_params}
			ok_func_params = {}
		endif
		options = [
			{
				func = <ok_func>
				func_params = <ok_func_params>
				text = qs(0x0e41fe46)
			}
		]
		case yes_no_menu
		if NOT GotParam \{yes_func_params}
			yes_func_params = {}
		endif
		if NOT GotParam \{no_func_params}
			no_func_params = {}
		endif
		options = [
			{
				func = <yes_func>
				func_params = <yes_func_params>
				text = qs(0x58e0a1fb)
			}
			{
				func = <no_func>
				func_params = <no_func_params>
				text = qs(0xd2915c27)
			}
		]
		case loading_window
		printf \{qs(0x175aadd1)}
		case phrase_window
		printf \{qs(0xecff2560)}
		desc = 'dialog_box_reason'
		case dlc_pin
		desc = 'DLC_PIN_Dialog'
		<extra_desc_props> = {
			pin_label_text = <text>
			tags = {pin_callback = <callback>}
		}
		<event_handlers> = [
			{pad_up enter_parent_pin_change_character params = {up}}
			{pad_down enter_parent_pin_change_character params = {down}}
			{pad_choose parent_pin_advance_pointer}
			{pad_back parent_pin_retreat_pointer}
			{pad_start confirm_parent_pin}
		]
		Change \{parent_pin_index = 0}
		Change \{parent_pin_values = [
				0
				0
				0
				0
			]}
		clean_up_user_control_helpers
		parent_pin_make_helpers
		case dlc_confirmation
		desc = 'DLC_Confirm_Download_Dialog'
		options = [
			{
				func = <cancel_func>
				func_params = {}
				text = qs(0xf7723015)
			}
			{
				func = <confirm_func>
				func_params = {<confirm_params>}
				text = qs(0x326e2d2f)
			}
		]
		<extra_desc_props> = {
			label_column_text = <left_text>
			wii_points_column_text = <middle_text>
			blocks_column_text = <right_text>
			disclaimer_text = qs(0xbc9f2748)
		}
		case dlc_wait
		desc = 'DLC_Waiting_Dialog'
		<loading_text_menu_pos> = (0.0, -80.0)
		<progress_bar_alpha> = 1
		<menu_alpha> = 1
		if GotParam \{can_cancel}
			options = [
				{
					func = <cancel_func>
					func_params = {}
					text = qs(0xf7723015)
				}
			]
			if NOT GotParam \{progress_bar}
				<progress_bar_alpha> = 0
			endif
		else
			options = []
			if NOT GotParam \{progress_bar}
				<progress_bar_alpha> = 0
				<loading_text_menu_pos> = (0.0, 0.0)
			endif
			<menu_alpha> = 0
		endif
		<extra_desc_props> = {
			wait_label_text = <text>
			wait_dots_text = qs(0x00000000)
			bar_sprite_dims = (0.0, 0.0)
			progress_bar_container_alpha = <progress_bar_alpha>
			dlog_vmenu_container_alpha = <menu_alpha>
			loading_text_menu_pos = <loading_text_menu_pos>
		}
		case band_choose
		desc = 'dialog_box'
		<full_blackout> = 0
		default
		printf \{qs(0x1d1be7f1)}
	endswitch
	GetArraySize <options>
	if NOT GotParam \{event_handlers}
		if (<array_Size> > 1)
			<event_handlers> = [
				{pad_up generic_menu_up_or_down_sound params = {up}}
				{pad_down generic_menu_up_or_down_sound params = {down}}
			]
		else
			<event_handlers> = []
		endif
	endif
	<menu_alias> = alias_dlog_vmenu
	if (<desc> = 'dialog_box_wii')
		if (<array_Size> = 0)
			<text_dims> = (580.0, 350.0)
			<big_menu_alpha> = 0
			<small_menu_alpha> = 0
			<menu_alias> = alias_dlog_vmenu_small
		elseif (<array_Size> <= 2)
			<text_dims> = (580.0, 330.0)
			<big_menu_alpha> = 0
			<small_menu_alpha> = 1
			<menu_alias> = alias_dlog_vmenu_small
		else
			<text_dims> = (580.0, 180.0)
			<big_menu_alpha> = 1
			<small_menu_alpha> = 0
			<menu_alias> = alias_dlog_vmenu_big
		endif
		if GotParam \{force_big_vmenu}
			<text_dims> = (580.0, 180.0)
			<big_menu_alpha> = 1
			<small_menu_alpha> = 0
			<menu_alias> = alias_dlog_vmenu_big
		endif
		<extra_desc_props> = {
			dlog_menu_container_big_alpha = <big_menu_alpha>
			dlog_menu_container_small_alpha = <small_menu_alpha>
			dlog_message_dims = <text_dims>
		}
	endif
	if GotParam \{back_script}
		if NOT GotParam \{back_params}
			back_params = {}
		endif
		AddArrayElement array = <event_handlers> element = ({pad_back <back_script> params = <back_params>})
		<event_handlers> = <array>
	endif
	if NOT GotParam \{title}
		title = qs(0x00000000)
	endif
	CreateScreenElement {
		parent = root_window
		id = generic_popupelement
		Type = descinterface
		desc = <desc>
		z_priority = <z_priority>
		blackout_alpha = <full_blackout>
		popuptitle_text = <title>
		popupbody_text = <text>
		<extra_desc_props>
	}
	getfocusid
	if ScreenElementExists id = <focus_on_me>
		LaunchEvent Type = unfocus target = <focus_on_me>
	endif
	if generic_popupelement :desc_resolvealias Name = <menu_alias>
		AssignAlias id = <resolved_id> alias = pu_warning_vmenu
		<resolved_id> :se_setprops event_handlers = <event_handlers>
		<resolved_id> :se_getprops
		<z> = <z_priority>
	endif
	if generic_popupelement :desc_resolvealias \{Name = alias_dlog_message}
		AssignAlias id = <resolved_id> alias = message_block
	endif
	if GotParam \{add_user_control_helpers}
		if GotParam \{back_script}
			add_back = true
		else
			add_back = FALSE
		endif
		GetArraySize <options>
		if (<array_Size> <= 1)
			add_nav = FALSE
		else
			add_nav = true
		endif
		if (<array_Size> > 0)
			add_popup_user_control_helpers popup_z = <z> add_back = <add_back> add_nav = <add_nav>
		else
			clean_up_user_control_helpers
		endif
	endif
	if GotParam \{title_effect}
		generic_popupelement :SetProps {
			popuptitle_text = qs(0x00000000)
			popuptitle_rgba = (($g_menu_colors).alert_red)
		}
		if generic_popupelement :desc_resolvealias \{Name = alias_dialog_text}
			split_text_into_menu {
				text = <title>
				dims = (330.0, 120.0)
				fit_major = `fit	content`
				fit_minor = `fit	content`
				text_params = {
					z_priority = 525.0
					rgba = (($g_menu_colors).alert_red)
					font = ($popup_warning_menu_font)
					use_shadow = true
					shadow_rgba =
					[
						0 , 0 , 0 , 255
					]
					shadow_offs = (-3.0, -3.0)
				}
				pos_anchor = [center center]
				just = [center , center]
				internal_just = [center center]
				parent = <resolved_id>
				spacing_between = 0
				Pos = (0.0, 15.0)
			}
			letter_scale = [1.8 1.5 1.2 1.5]
			if NOT GotParam \{title_effect_index}
				<title_effect_index> = Random (@ 0 @ 1 )
			endif
			s = <title_effect_index>
			i = 0
			begin
			text_element = (<text_element_array> [<i>])
			<text_element> :se_setprops internal_scale = (<letter_scale> [<s>])
			s = (<s> + 1)
			if (<s> > 3)
				s = 0
			endif
			i = (<i> + 1)
			repeat <text_element_array_size>
		endif
	endif
	if GotParam \{options}
		GetArraySize <options>
		if (<array_Size> > 0)
			create_popup_warning_menu_options <...>
		endif
	endif
	if (<popup_type> = phrase_window)
		GetArraySize <phrase_array> globalarray
		if (<array_Size> > 0)
			formatText TextName = num_text (qs(0x8519701a)) d = '%d' m = <array_Size>
			<index> = 0
			begin
			create_phrase_option {
				func = <phrase_func>
				func_params = <phrase_func_params>
				phrase_array = <phrase_array>
				phrase_index = <index>
				num_text = <num_text>
				z = <z>
			}
			<index> = (<index> + 1)
			repeat <array_Size>
		endif
	endif
	if NOT GotParam \{no_focus}
		if ScreenElementExists \{id = pu_warning_vmenu}
			if GotParam \{focus_index}
				LaunchEvent Type = focus target = pu_warning_vmenu data = {child_index = <focus_index>}
			else
				LaunchEvent \{Type = focus
					target = pu_warning_vmenu
					data = {
						child_index = 0
					}}
			endif
		endif
	endif
	if (<popup_type> = dlc_pin)
		if generic_popupelement :desc_resolvealias \{Name = alias_arrow_container}
			AssignAlias id = <resolved_id> alias = alias_arrow_container
		endif
		menu_epp_refresh_parent_pin
	endif
	if (<popup_type> = loading_window)
		generic_popupelement :se_setprops \{popupbody_text = qs(0x569a2ede)}
		generic_popupelement :se_setprops popupbody_text = <text>
		WaitOneGameFrame
		WaitOneGameFrame
		if NOT ScreenElementExists \{id = message_block}
			return
		endif
		GetScreenElementChildren \{id = message_block}
		GetArraySize <children>
		GetScreenElementProps {
			id = {message_block child = (<array_Size> - 1)}
		}
		GetScreenElementDims {
			id = {message_block child = (<array_Size> - 1)}
		}
		<dot_pos> = (<Pos> + ((<width> * (0.5, 0.0)) + (<height> * (0.0, 0.5))))
		CreateScreenElement {
			Type = TextElement
			parent = message_block
			id = generic_popup_dot_text
			just = [left center]
			internal_just = [left top]
			Pos = <dot_pos>
			Scale = <Scale>
			text = qs(0x00000000)
			font = fontgrid_text_a6
			rgba = [128 , 128 , 128 , 255]
			z_priority = <z_priority>
		}
		if GotParam \{wait_variable}
			start_new_loading_process wait_var = <wait_variable>
		else
			printf \{qs(0xd9176484)}
		endif
		if (($generic_popup_loading_window_open) = 1)
			destroy_generic_popup
		endif
	endif
endscript

script destroy_new_generic_popup 
	printscriptinfo \{'destroy_new_generic_popup'}
	if ScreenElementExists \{id = generic_popupelement}
		DestroyScreenElement \{id = generic_popupelement}
	endif
	printf \{qs(0x1193a126)}
	get_top_ui_base_name
	if ($generic_popup_open = 1)
		if (<base_name> = ($popup_menu_base_name))
			popup_old_focus_color = ($menu_unfocus_color)
			popup_old_unfocus_color = ($menu_focus_color)
			Change menu_focus_color = <popup_old_focus_color>
			Change menu_unfocus_color = <popup_old_unfocus_color>
		endif
	endif
	Change \{popup_menu_base_name = qs(0x00000000)}
	Change \{generic_popup_open = 0}
	Change \{popup_priority = 11}
	getfocusid
	if ScreenElementExists id = <focus_on_me>
		LaunchEvent Type = focus target = <focus_on_me>
	else
		printf qs(0x34fbd6ae) t = <focus_on_me>
		if ScreenElementExists \{id = current_menu}
			LaunchEvent \{Type = focus
				target = current_menu}
		endif
	endif
	Change \{0xa77ba368 = 0}
endscript

script start_new_loading_process \{time = 0.3333}
	Change \{generic_popup_loading_window_open = 1}
	num_dots = 3
	begin
	if NOT ScreenElementExists \{id = generic_popup_dot_text}
		return
	endif
	<num_dots> = (<num_dots> + 1)
	if (<num_dots> > 3)
		<num_dots> = 0
	endif
	if ($<wait_var> = 0)
		<dot_text> = ''
		if (<num_dots> > 0)
			begin
			formatText TextName = dot_text '%s.' s = <dot_text>
			repeat <num_dots>
		endif
		formatText TextName = dot_text qs(0x4d4555da) s = <dot_text>
		SetScreenElementProps id = generic_popup_dot_text text = <dot_text>
	else
		return
	endif
	Wait <time> Seconds
	repeat
endscript

script create_phrase_option 
	<focus_params> = {use_highlight = 0}
	formatText TextName = row_text qs(0x4d4555da) s = (($<phrase_array>) [<phrase_index>])
	printstruct <...>
	CreateScreenElement {
		Type = TextBlockElement
		dims = (400.0, 80.0)
		font = ($popup_warning_menu_font)
		parent = pu_warning_vmenu
		local_id = text
		rgba = ($menu_unfocus_color)
		font_spacing = 0
		just = [center center]
		internal_just = [center center]
		z_priority = (<z> + 5)
		text = <row_text>
		fit_width = `scale	each	line	if	larger`
		fit_height = `scale	to	fit`
		scale_mode = `per	axis`
		event_handlers = [
			{focus menu_popup_focus params = <focus_params>}
			{focus phrase_option_focus params = {phrase_index = <phrase_index> num_text = <num_text>}}
			{unfocus menu_popup_unfocus params = <focus_params>}
			{pad_choose generic_menu_pad_choose_sound}
			{pad_choose (<func>) params = {(<func_params>) phrase_array = <phrase_array> phrase_index = <phrase_index>}}
		]
	}
endscript

script phrase_option_focus 
	formatText TextName = text <num_text> d = (<phrase_index> + 1)
	generic_popupelement :se_setprops popupbody_text = <text>
endscript
