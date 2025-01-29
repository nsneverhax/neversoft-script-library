popup_focus_color = [
	210
	210
	210
	250
]
popup_unfocus_color = [
	210
	130
	0
	250
]
popup_previous_menu = vmenu_main_menu
phrase_index = 0
phrase_array_size = 0
generic_down_arrow_enabled = 1
generic_up_arrow_enabled = 1

script assign_alias_for_generic_popup 
	AssignAlias id = <focus_item> alias = current_menu
endscript
generic_popup_open = 0
generic_popup_loading_window_open = 0

script is_generic_popup_open 
	return \{open = $generic_popup_open}
endscript

script popup_menu_focus 
	if GotParam \{id}
		if ScreenElementExists id = <id>
			SetScreenElementProps id = <id> rgba = ($popup_focus_color)
		endif
	else
		Obj_GetID
		<id> = <objID>
		if GotParam \{objID}
			SetScreenElementProps id = <id> rgba = ($popup_focus_color)
		endif
	endif
endscript

script popup_menu_unfocus 
	if GotParam \{id}
		if ScreenElementExists id = <id>
			SetScreenElementProps id = <id> rgba = ($popup_unfocus_color)
		endif
	else
		Obj_GetID
		<id> = <objID>
		if GotParam \{objID}
			SetScreenElementProps id = <id> rgba = ($popup_unfocus_color)
		endif
	endif
endscript
popup_priority = 11

script popup_get_pad_choose_event 
	GetArraySize <event_handlers>
	<i> = (<array_Size> -1)
	begin
	spliteventhandlerstruct struct = (<event_handlers> [<i>])
	if (<event> = pad_choose)
		return func = <func> func_params = <params> true
	endif
	<i> = (<i> - 1)
	repeat <array_Size>
	return \{FALSE}
endscript

script create_generic_popup \{text_font = fontgrid_text_a8
		menu_font = fontgrid_text_a6
		z = 300
		font_scale = 0.75
		message_scale = 0.75}
	if GotParam \{ok_menu}
		if popup_get_pad_choose_event event_handlers = <ok_eventhandlers>
			options = [
				{
					func = <func>
					func_params = <func_params>
					text = $wii_ok
				}
			]
		endif
		<focus_child> = 0
	elseif GotParam \{yes_no_menu}
		if popup_get_pad_choose_event event_handlers = <yes_eventhandlers>
			yes_func = <func>
			yes_params = <func_params>
		endif
		if popup_get_pad_choose_event event_handlers = <no_eventhandlers>
			no_func = <func>
			no_params = <func_params>
		endif
		if ((GotParam yes_func) && (GotParam no_func))
			options = [
				{
					func = <yes_func>
					func_params = <yes_params>
					text = $wii_yes
				}
				{
					func = <no_func>
					func_params = <no_params>
					text = $wii_no
				}
			]
		endif
		<focus_child> = 0
		if GotParam \{focus_no}
			<focus_child> = 1
		endif
	elseif GotParam \{option_menu}
		options = []
		<i> = 1
		begin
		formatText checksumName = option_struct_chksum 'option%d' d = <i>
		<option_struct> = ((<...>).<option_struct_chksum>)
		if popup_get_pad_choose_event event_handlers = (<option_struct>.eventhandlers)
			<new_struct> = {
				func = <func>
				func_params = <func_params>
				text = (<option_struct>.title)
			}
			AddArrayElement array = <options> element = <new_struct>
			<options> = <array>
		endif
		<i> = (<i> + 1)
		repeat <option_menu>
		<focus_child> = 0
		if GotParam \{focus_option}
			<focus_child> = (<focus_option> - 1)
		endif
	elseif GotParam \{loading_window}
		<options> = []
		if GotParam \{can_cancel}
			if popup_get_pad_choose_event event_handlers = <cancel_eventhandlers>
				<options> = [
					{
						func = <func>
						func_params = <func_params>
						text = $wii_cancel
					}
				]
			endif
		endif
		<Type> = loading_window
	endif
	if GotParam \{options}
		if GotParam \{default_blackout}
			full_blackout = 0.65000004
		elseif NOT GotParam \{full_blackout}
			full_blackout = 0
		endif
		create_new_generic_popup {
			options = <options>
			title = <title>
			text = <message>
			Priority = <Priority>
			focus_index = <focus_child>
			popup_type = <Type>
			wait_variable = <wait_variable>
			full_blackout = <full_blackout>
			back_script = <back_script>
			back_params = <back_params>
		}
		return
	endif
	dont_swap_colors = 0
	if (($generic_popup_open) = 1)
		if GotParam \{Priority}
			if (($popup_priority) <= <Priority>)

				return
			else
				<dont_swap_colors> = 1
				kill_generic_popup_early
				Change popup_priority = <Priority>
			endif
		else

			return
		endif
	endif
	if GotParam \{Priority}
		Change popup_priority = <Priority>
	endif
	if GotParam \{loading_window}
		if GotParam \{wait_variable}
			if ($<wait_variable> = 1)
				return
			endif
		endif
	endif

	scale_1 = ((1.5, 0.0) + (0.0, 1.4))
	scale_2 = ((1.4, 0.0) + (0.0, 1.4))
	scale_3 = ((1.4, 0.0) + (0.0, 1.3499999))
	scale_4 = ((1.575, 0.0) + (0.0, 1.5))
	scale_5 = ((1.5, 0.0) + (0.0, 1.4))
	menu_pos = (574.0, 394.0)
	<dialog> = 0
	generic_popup_z = <z>
	menu_font = <font>
	text_font = <message_font>
	if GotParam \{option_menu}
		if (<option_menu> = 1)
			<menu_pos> = (574.0, 414.0)
		elseif (<option_menu> = 2)
			<menu_pos> = (574.0, 414.0)
		elseif (<option_menu> = 3)
			<menu_pos> = (574.0, 394.0)
		else
			<menu_pos> = (574.0, 374.0)
		endif
		<dialog> = 1

	endif
	if GotParam \{ok_menu}
		<menu_pos> = (574.0, 404.0)
		<dialog> = 1
	endif
	if GotParam \{yes_no_menu}
		<menu_pos> = (574.0, 400.0)
		<dialog> = 1
	endif
	if GotParam \{phrase_window}
		<menu_pos> = (415.0, 250.0)
	endif
	if GotParam \{loading_window}
		<menu_pos> = (574.0, 404.0)
		if GotParam \{can_cancel}
			<dialog> = 1
		endif
	endif
	if (<dont_swap_colors> = 0)
		popup_old_focus_color = ($menu_unfocus_color)
		popup_old_unfocus_color = ($menu_focus_color)
		Change menu_focus_color = <popup_old_focus_color>
		Change menu_unfocus_color = <popup_old_unfocus_color>
	endif
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
	if GotParam \{phrase_window}
		Change \{popup_focus_color = [
				223
				223
				223
				255
			]}
		Change \{popup_unfocus_color = [
				128
				128
				128
				255
			]}
	endif
	text_scale = <font_scale>
	offwhite = [223 223 223 255]
	if GotParam \{phrase_window}
		generic_popup_event_handlers = [
			{pad_up scroll_phrase_window params = {Dir = up}}
			{pad_down scroll_phrase_window params = {Dir = down}}
		]
	else
		if NOT ((GotParam ok_menu) || (GotParam loading_window) || (GotParam blank_menu))
			if GotParam \{option_menu}
				if (<option_menu> > 1)
					generic_popup_event_handlers = [
						{pad_up generic_menu_up_or_down_sound params = {up}}
						{pad_down generic_menu_up_or_down_sound params = {down}}
					]
				endif
			else
				generic_popup_event_handlers = [
					{pad_up generic_menu_up_or_down_sound params = {up}}
					{pad_down generic_menu_up_or_down_sound params = {down}}
				]
			endif
		endif
	endif
	if GotParam \{back_script}
		back_handler = {pad_back <back_script>}
		if NOT GotParam \{generic_popup_event_handlers}
			<generic_popup_event_handlers> = []
		endif
		AddArrayElement array = (<generic_popup_event_handlers>) element = (<back_handler>)
		<generic_popup_event_handlers> = (<array>)
	endif
	if NOT GotParam \{purchase_confirm}
		CreateScreenElement \{Type = ContainerElement
			parent = root_window
			id = generic_popup_container
			Pos = (0.0, 0.0)
			internal_just = [
				center
				center
			]}
	else
		CreateScreenElement {
			Type = ContainerElement
			parent = root_window
			id = generic_popup_container
			Pos = ($pc_popuppos)
			internal_just = [center center]
			Scale = ($pc_popupscale)
		}
	endif
	if GotParam \{default_blackout}
		full_blackout = 0.65000004
	endif
	if GotParam \{full_blackout}
		CreateScreenElement {
			Type = SpriteElement
			parent = generic_popup_container
			texture = black
			rgba = [0 0 0 255]
			Pos = (640.0, 360.0)
			dims = (1280.0, 720.0)
			just = [center center]
			z_priority = (<generic_popup_z> - 2)
			alpha = <full_blackout>
		}
	endif
	<center_pos> = (640.0, 360.0)
	CreateScreenElement {
		Type = SpriteElement
		parent = generic_popup_container
		texture = Dialog_BG
		rgba = [255 255 255 255]
		Pos = (640.0, 320.0)
		Scale = 1.25
		just = [center center]
		z_priority = <generic_popup_z>
	}
	if GotParam \{title}
		popup_title_off = (645.0, 60.0)
		if German
			CreateScreenElement {
				Type = TextElement
				parent = generic_popup_container
				font = <menu_font>
				text = <title>
				just = [center top]
				Pos = {<popup_title_off> relative}
				rgba = [223 223 223 250]
				Scale = (1.0, 1.15)
				z_priority = (<generic_popup_z> + 2.2)
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba = [0 0 0 255]
			}
		else
			CreateScreenElement {
				Type = TextElement
				parent = generic_popup_container
				font = <menu_font>
				text = <title>
				just = [center top]
				Pos = {<popup_title_off> relative}
				rgba = [223 223 223 250]
				Scale = (1.2, 1.3499999)
				z_priority = (<generic_popup_z> + 2.2)
			}
		endif
	endif
	if GotParam \{purchase_confirm}
		if GotParam \{long_text}
			osprintf \{qs(0x19154f67)}
			<pos_y> = 202
			<dims_x> = 606
		else
			<pos_y> = 220
			<dims_x> = 600
		endif
		message_block_left_pos = ((($pc_x_lpos) * (1.0, 0.0)) + (<pos_y> * (0.0, 1.0)))
		message_block_right_pos = ((($pc_x_rpos) * (1.0, 0.0)) + (<pos_y> * (0.0, 1.0)))
		message_block_left_dims = ((($pc_x_ldim) * (1.0, 0.0)) + (340 * (0.0, 1.0)))
		message_block_right_dims = ((($pc_x_rdim) * (1.0, 0.0)) + (340 * (0.0, 1.0)))
		CreateScreenElement {
			Type = TextBlockElement
			id = message_block_left
			text = <message_left>
			Scale = ($pc_mess_scale)
			parent = generic_popup_container
			font = <text_font>
			rgba = [210 130 0 250]
			Pos = <message_block_left_pos>
			dims = <message_block_left_dims>
			just = [left top]
			internal_just = ($pc_left_just)
			z_priority = (<generic_popup_z> + 2.2)
		}
		CreateScreenElement {
			Type = TextBlockElement
			id = message_block_right
			text = <message_right>
			Scale = ($pc_mess_scale)
			parent = generic_popup_container
			font = <text_font>
			rgba = [210 130 0 250]
			Pos = <message_block_right_pos>
			dims = <message_block_right_dims>
			just = [left top]
			internal_just = ($pc_right_just)
			z_priority = (<generic_popup_z> + 2.2)
		}
	elseif GotParam \{message}

		if GotParam \{long_text}
			osprintf \{qs(0x19154f67)}
			message_block_pos = (410.0, 180.0)
			message_block_dims = (606.0, 362.0)
		else
			message_block_pos = (410.0, 220.0)
			message_block_dims = (600.0, 300.0)
		endif
		CreateScreenElement {
			Type = TextBlockElement
			id = message_block
			text = <message>
			Scale = <message_scale>
			parent = generic_popup_container
			font = <text_font>
			rgba = [210 130 0 250]
			Pos = <message_block_pos>
			dims = <message_block_dims>
			just = [left top]
			z_priority = (<generic_popup_z> + 2.2)
		}
	endif
	if GotParam \{progress_bar}
		CreateScreenElement {
			Type = SpriteElement
			id = progress_bar
			parent = generic_popup_container
			tex = white
			rgba = [210 210 0 250]
			Pos = (490.0, 300.0)
			dims = (0.0, 50.0)
			just = [left top]
			z_priority = (<generic_popup_z> + 2.3)
		}
	endif
	generic_popup_menu_z = (<generic_popup_z> + 5)
	if GotParam \{phrase_window}
	elseif GotParam \{blank_menu}
	elseif GotParam \{loading_window}
		if GotParam \{can_cancel}
		endif
	else
	endif
	CreateScreenElement {
		Type = VScrollingMenu
		parent = root_window
		id = scrolling_generic_popup_menu
		dims = (400.0, 480.0)
		just = [left top]
		Pos = <menu_pos>
		z_priority = <generic_popup_menu_z>
	}
	CreateScreenElement {
		Type = VMenu
		parent = scrolling_generic_popup_menu
		id = vmenu_generic_popup_menu
		Pos = (0.0, 0.0)
		just = [center center]
		internal_just = [center center]
		event_handlers = <generic_popup_event_handlers>
	}
	if GotParam \{phrase_window}
		SetScreenElementProps \{id = scrolling_generic_popup_menu
			dims = (600.0, 300.0)}
		SetScreenElementProps \{id = vmenu_generic_popup_menu
			dont_allow_wrap}
	endif
	if GotParam \{loading_window}
		<largest_width> = 0
		GetScreenElementChildren \{id = message_block}
		GetArraySize <children>
		<i> = 0
		begin
		GetScreenElementDims id = (<children> [<i>])
		if (<largest_width> < <width>)
			<largest_width> = <width>
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
		GetScreenElementProps \{id = message_block}
		<starting_pos> = <Pos>
		<adjust_width> = ((600 - <largest_width>) / 2.0 - 40)
		<ending_pos> = (<starting_pos> + (<adjust_width> * (1.0, 0.0)))
		SetScreenElementProps id = message_block internal_just = [left center] Pos = <ending_pos>
	endif
	if GotParam \{loading_window}
		if GotParam \{can_cancel}
			CreateScreenElement {
				Type = TextElement
				parent = vmenu_generic_popup_menu
				font = <menu_font>
				Scale = 1.5
				rgba = ($popup_unfocus_color)
				text = $wii_cancel
				just = [center top]
				event_handlers = <cancel_eventhandlers>
				z_priority = (<generic_popup_menu_z> + 5)
			}
			displaySprite parent = generic_popup_container tex = dialog_menu_bg Pos = (480.0, 450.0) Scale = (2.5, 2.5) z = <generic_popup_menu_z>
			displaySprite parent = generic_popup_container tex = dialog_menu_bg flip_h Pos = (480.0, 530.0) Scale = (2.5, 2.5) z = <generic_popup_menu_z>
		endif
	elseif GotParam \{ok_menu}
		add_default_popup_handlers event_handlers = <ok_eventhandlers>
		CreateScreenElement {
			Type = TextElement
			parent = vmenu_generic_popup_menu
			font = <menu_font>
			Scale = 1.5
			rgba = ($popup_unfocus_color)
			text = $wii_ok
			just = [center top]
			event_handlers = <processed_handlers>
			z_priority = (<generic_popup_menu_z> + 5)
		}
	elseif GotParam \{yes_no_menu}
		add_default_popup_handlers event_handlers = <yes_eventhandlers>
		CreateScreenElement {
			Type = TextElement
			parent = vmenu_generic_popup_menu
			font = <menu_font>
			id = yes_option
			Scale = 1.0
			rgba = ($popup_unfocus_color)
			text = $wii_yes
			just = [center top]
			event_handlers = <processed_handlers>
			z_priority = (<generic_popup_menu_z> + 5)
		}
		add_default_popup_handlers event_handlers = <no_eventhandlers>
		CreateScreenElement {
			Type = TextElement
			parent = vmenu_generic_popup_menu
			font = <menu_font>
			id = no_option
			Scale = 1.0
			rgba = ($popup_unfocus_color)
			text = $wii_no
			just = [center top]
			event_handlers = <processed_handlers>
			z_priority = (<generic_popup_menu_z> + 5)
		}
	elseif GotParam \{option_menu}
		add_default_popup_handlers event_handlers = (<option1>.eventhandlers)
		CreateScreenElement {
			Type = TextElement
			parent = vmenu_generic_popup_menu
			font = <menu_font>
			id = option1
			Scale = <text_scale>
			rgba = ($popup_unfocus_color)
			text = (<option1>.title)
			just = [center top]
			event_handlers = <processed_handlers>
			z_priority = (<generic_popup_menu_z> + 5)
		}
		add_default_popup_handlers event_handlers = (<option2>.eventhandlers)
		if (<option_menu> > 1)
			CreateScreenElement {
				Type = TextElement
				parent = vmenu_generic_popup_menu
				font = <menu_font>
				id = option2
				Scale = <text_scale>
				rgba = ($popup_unfocus_color)
				text = (<option2>.title)
				just = [center top]
				event_handlers = <processed_handlers>
				z_priority = (<generic_popup_menu_z> + 5)
			}
		endif
		if (<option_menu> > 2)
			add_default_popup_handlers event_handlers = (<option3>.eventhandlers)
			CreateScreenElement {
				Type = TextElement
				parent = vmenu_generic_popup_menu
				font = <menu_font>
				id = option3
				Scale = <text_scale>
				rgba = ($popup_unfocus_color)
				text = (<option3>.title)
				just = [center top]
				event_handlers = <processed_handlers>
				z_priority = (<generic_popup_menu_z> + 5)
			}
		endif
		if (<option_menu> > 3)
			add_default_popup_handlers event_handlers = (<option4>.eventhandlers)
			CreateScreenElement {
				Type = TextElement
				parent = vmenu_generic_popup_menu
				font = <menu_font>
				id = option4
				Scale = <text_scale>
				rgba = ($popup_unfocus_color)
				text = (<option4>.title)
				just = [center top]
				event_handlers = <processed_handlers>
				z_priority = (<generic_popup_menu_z> + 5)
			}
		endif
		if (<option_menu> > 4)
			add_default_popup_handlers event_handlers = (<option5>.eventhandlers)
			CreateScreenElement {
				Type = TextElement
				parent = vmenu_generic_popup_menu
				font = <menu_font>
				id = option5
				Scale = <text_scale>
				rgba = ($popup_unfocus_color)
				text = (<option5>.title)
				just = [center top]
				event_handlers = <processed_handlers>
				z_priority = (<generic_popup_menu_z> + 5)
			}
		endif
		if (<option_menu> = 5)
		elseif (<option_menu> = 4)
		else
		endif
	elseif GotParam \{phrase_window}
		GetArraySize $<phrase_array>
		numphrases = <array_Size>
		i = 0
		begin
		formatText checksumName = phraseid 'phraseid%n' n = <i>
		CreateScreenElement {
			Type = TextBlockElement
			parent = vmenu_generic_popup_menu
			font = <menu_font>
			id = <phraseid>
			Scale = <text_scale>
			rgba = ($popup_unfocus_color)
			text = ($<phrase_array> [<i>])
			just = [center top]
			dims = (600.0, 300.0)
			internal_just = [center center]
			event_handlers = <phrase_eventhandlers>
			z_priority = (<generic_popup_menu_z> + 5)
		}
		<i> = (<i> + 1)
		repeat <numphrases>
		CreateScreenElement \{Type = ContainerElement
			parent = generic_popup_container
			id = arrow_container
			Pos = (0.0, 0.0)
			internal_just = [
				center
				center
			]}
		CreateScreenElement {
			Type = SpriteElement
			parent = arrow_container
			id = down_arrow
			texture = scroll_arrow
			Pos = (<center_pos> + (0.0, 86.0))
			just = [center top]
			dims = (64.0, 64.0)
			z_priority = (<generic_popup_menu_z> + 6)
		}
		CreateScreenElement {
			Type = SpriteElement
			parent = arrow_container
			id = up_arrow
			texture = scroll_arrow
			Pos = (<center_pos> + (0.0, -150.0))
			just = [center top]
			flip_h
			dims = (64.0, 64.0)
			z_priority = (<generic_popup_menu_z> + 6)
		}
		Change \{generic_up_arrow_enabled = 1}
		Change \{generic_down_arrow_enabled = 1}
		Change phrase_array_size = <numphrases>
		Change \{phrase_index = 0}
		if (($phrase_array_size) > 1)
			enable_generic_arrow \{Dir = down}
		endif
		disable_generic_arrow \{Dir = up}
		SpawnScriptLater \{arrow_blinker
			params = {
				time = 0.5
			}}
		formatText TextName = selection_text qs(0x862202b8) a = (($phrase_index) + 1) b = ($phrase_array_size)
		CreateScreenElement {
			Type = TextElement
			parent = generic_popup_container
			text = <selection_text>
			font = <menu_font>
			Scale = 0.75
			id = current_phrase_text
			rgba = [223 223 223 255]
			Pos = (<center_pos> + (100.0, 150.0))
			just = [left bottom]
			z_priority = (<generic_popup_menu_z> + 5)
		}
	endif
	getfocusid
	if ScreenElementExists id = <focus_on_me>
		switch <focus_on_me>
			case vmenu_main_menu
			vmenu_main_menu :GetTags
			LaunchEvent \{Type = unfocus
				target = $popup_previous_menu}
			switch <tag_selected_index>
				case 0
				if ScreenElementExists \{id = main_menu_career_text}
					SetScreenElementProps \{id = main_menu_career_text
						no_shadow}
				endif
				case 1
				if ScreenElementExists \{id = main_menu_coop_career_text}
					SetScreenElementProps \{id = main_menu_coop_career_text
						no_shadow}
				endif
				case 2
				if ScreenElementExists \{id = main_menu_quickplay_text}
					SetScreenElementProps \{id = main_menu_quickplay_text
						no_shadow}
				endif
				case 3
				if ScreenElementExists \{id = main_menu_multiplayer_text}
					SetScreenElementProps \{id = main_menu_multiplayer_text
						no_shadow}
				endif
				case 4
				if ScreenElementExists \{id = main_menu_training_text}
					SetScreenElementProps \{id = main_menu_training_text
						no_shadow}
				endif
				case 5
				if ScreenElementExists \{id = main_menu_options_text}
					SetScreenElementProps \{id = main_menu_options_text
						no_shadow}
				endif
				case 6
				if ScreenElementExists \{id = main_menu_leaderboards_text}
					SetScreenElementProps \{id = main_menu_leaderboards_text
						no_shadow}
				endif
				default
			endswitch
			default
			LaunchEvent Type = unfocus target = <focus_on_me>
		endswitch
	endif
	if (<dialog> = 1)
		<largest_width> = 0
		GetScreenElementChildren \{id = vmenu_generic_popup_menu}
		GetArraySize <children>
		<i> = 0
		begin
		GetScreenElementDims id = (<children> [<i>])
		if (<largest_width> < <width>)
			<largest_width> = <width>
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
		<center_adjust> = ((210 - <largest_width>) / 2)
		GetScreenElementProps \{id = scrolling_generic_popup_menu}
		SetScreenElementProps id = scrolling_generic_popup_menu Pos = (<Pos> + ((1.0, 0.0) * <center_adjust>))
	endif
	if GotParam \{focus_yes}
		LaunchEvent \{Type = focus
			target = vmenu_generic_popup_menu
			data = {
				child_id = yes_option
			}}
	elseif GotParam \{focus_no}
		LaunchEvent \{Type = focus
			target = vmenu_generic_popup_menu
			data = {
				child_id = no_option
			}}
	elseif GotParam \{focus_option}
		formatText checksumName = focused_child 'option%a' a = <focus_option>
		LaunchEvent Type = focus target = vmenu_generic_popup_menu data = {child_id = <focused_child>}
	else
		LaunchEvent \{Type = focus
			target = vmenu_generic_popup_menu}
	endif
	if GotParam \{loading_window}
		if GotParam \{wait_variable}
			start_loading_process text_block_id = message_block wait_var = <wait_variable> base_text = <message>
		else

		endif
		if (($generic_popup_loading_window_open) = 1)
			destroy_generic_popup
		endif
	endif
	if GotParam \{add_user_control_helpers}
		if GotParam \{back_script}
			add_back = true
		else
			add_back = FALSE
		endif
		if GotParam \{ok_menu}
			add_nav = FALSE
		else
			add_nav = true
		endif
		add_popup_user_control_helpers popup_z = <generic_popup_menu_z> add_back = <add_back> add_nav = <add_nav>
	endif
endscript

script create_generic_popup_frames 
	CreateScreenElement {
		Type = SpriteElement
		parent = <parent>
		texture = <texture>
		rgba = <rgba>
		Pos = (<Pos>)
		Scale = <Scale>
		z_priority = <z_priority>
		just = [bottom right]
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <parent>
		texture = <texture>
		rgba = <rgba>
		Pos = (<Pos>)
		Scale = <Scale>
		z_priority = <z_priority>
		just = [top right]
		flip_v
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <parent>
		texture = <texture>
		rgba = <rgba>
		Pos = (<Pos>)
		Scale = <Scale>
		z_priority = <z_priority>
		just = [top left]
		flip_v
		flip_h
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <parent>
		texture = <texture>
		rgba = <rgba>
		Pos = (<Pos>)
		Scale = <Scale>
		z_priority = <z_priority>
		just = [bottom left]
		flip_h
	}
endscript

script set_generic_popup_open 
	Change \{generic_popup_open = 1}
endscript

script destroy_generic_popup 
	if ScreenElementExists \{id = generic_popupelement}
		destroy_new_generic_popup
	endif
	if ScreenElementExists \{id = arrow_container}
		KillSpawnedScript \{Name = arrow_blinker}
	endif
	if ScreenElementExists \{id = generic_popup_container}
		DestroyScreenElement \{id = generic_popup_container}
	endif
	if ScreenElementExists \{id = vmenu_generic_popup_menu}
		DestroyScreenElement \{id = vmenu_generic_popup_menu}
	endif
	Change \{generic_popup_open = 0}
	Change \{generic_popup_loading_window_open = 0}
	Change \{popup_priority = 11}
	if ScreenElementExists \{id = scrolling_generic_popup_menu}
		DestroyScreenElement \{id = scrolling_generic_popup_menu}
	else
		return
	endif

	popup_old_focus_color = ($menu_unfocus_color)
	popup_old_unfocus_color = ($menu_focus_color)
	Change menu_focus_color = <popup_old_focus_color>
	Change menu_unfocus_color = <popup_old_unfocus_color>
	getfocusid
	if NOT (($popup_no_refocus_on_close) = 1)
		if ScreenElementExists id = <focus_on_me>
			LaunchEvent Type = focus target = <focus_on_me>
		else

		endif
	endif
endscript
popup_no_refocus_on_close = 0

script kill_generic_popup_early 
	if ScreenElementExists \{id = generic_popupelement}
		DestroyScreenElement \{id = generic_popupelement}
	endif
	if ScreenElementExists \{id = arrow_container}
		KillSpawnedScript \{Name = arrow_blinker}
	endif
	if ScreenElementExists \{id = generic_popup_container}
		DestroyScreenElement \{id = generic_popup_container}
	endif
	if ScreenElementExists \{id = vmenu_generic_popup_menu}
		DestroyScreenElement \{id = vmenu_generic_popup_menu}
	endif
	if ScreenElementExists \{id = scrolling_generic_popup_menu}
		DestroyScreenElement \{id = scrolling_generic_popup_menu}
	else
		return
	endif
endscript

script start_loading_process \{time = 0.3333}
	Change \{generic_popup_loading_window_open = 1}
	num_dots = 3
	begin
	<num_dots> = (<num_dots> + 1)
	if (<num_dots> > 3)
		<num_dots> = 0
	endif
	if ($<wait_var> = 0)
		temp_string = <base_text>
		if (<num_dots> > 0)
			begin
			<temp_string> = (<temp_string> + qs(0xb521e42c))
			repeat <num_dots>
		endif
		SetScreenElementProps id = <text_block_id> text = <temp_string>
	else
		return
	endif
	Wait <time> Seconds
	repeat
endscript

script enable_generic_arrow 
	if (<Dir> = down)
		if (($generic_down_arrow_enabled) = 1)
			return
		else
			Change \{generic_down_arrow_enabled = 1}
		endif
	elseif (<Dir> = up)
		if (($generic_up_arrow_enabled) = 1)
			return
		else
			Change \{generic_up_arrow_enabled = 1}
		endif
	endif
endscript

script disable_generic_arrow 
	if (<Dir> = down)
		if (($generic_down_arrow_enabled) = 0)
			return
		else
			Change \{generic_down_arrow_enabled = 0}
		endif
	elseif (<Dir> = up)
		if (($generic_up_arrow_enabled) = 0)
			return
		else
			Change \{generic_up_arrow_enabled = 0}
		endif
	endif
endscript

script scroll_phrase_window 
	if (<Dir> = down)
		if (($phrase_index) < (($phrase_array_size) -1))
			Change phrase_index = (($phrase_index) + 1)

			generic_menu_up_or_down_sound \{params = {
					down
				}}
		endif
	elseif (<Dir> = up)
		if (($phrase_index) > 0)
			Change phrase_index = (($phrase_index) -1)

			generic_menu_up_or_down_sound \{params = {
					up
				}}
		endif
	endif
	if (($phrase_index) < (($phrase_array_size) -1))
		enable_generic_arrow \{Dir = down}

	else
		disable_generic_arrow \{Dir = down}

	endif
	if (($phrase_index) > 0)
		enable_generic_arrow \{Dir = up}

	else
		disable_generic_arrow \{Dir = up}

	endif
	formatText TextName = selection_text qs(0x862202b8) a = (($phrase_index) + 1) b = ($phrase_array_size)
	SetScreenElementProps id = current_phrase_text text = <selection_text>
endscript

script arrow_blinker \{time = 0.5}
	if NOT ScreenElementExists \{id = arrow_container}
		return
	endif
	begin
	if (($generic_up_arrow_enabled) = 1)
		SetScreenElementProps \{id = up_arrow
			alpha = 1.0
			flip_h}
	else
		SetScreenElementProps \{id = up_arrow
			alpha = 0.0
			flip_h}
	endif
	if (($generic_down_arrow_enabled) = 1)
		SetScreenElementProps \{id = down_arrow
			alpha = 1.0}
	else
		SetScreenElementProps \{id = down_arrow
			alpha = 0.0}
	endif
	DoScreenElementMorph id = arrow_container alpha = 1.0 time = <time>
	Wait <time> Seconds
	DoScreenElementMorph id = arrow_container alpha = 0.0 time = <time>
	Wait <time> Seconds
	repeat
endscript
test_wait_var = 0

script stop_waiting 
	Change \{test_wait_var = 1}
endscript
network_wait_var = 0

script enable_network_wait_variable 

	Change \{network_wait_var = 0}
endscript

script clear_network_wait_variable 

	Change \{network_wait_var = 1}
endscript

script add_popup_user_control_helpers \{add_nav = true}
	clean_up_user_control_helpers
	add_user_control_helper text = qs(0xc18d5e76) button = green z = (<popup_z> + 10)
	if (<add_back> = true)
		add_user_control_helper text = qs(0xaf4d5dd2) button = red z = (<popup_z> + 10)
	endif
	if (<add_nav> = true)
	endif
endscript

script add_default_popup_handlers 
	handler_index = 0
	contains_focus = FALSE
	contains_unfocus = FALSE
	GetArraySize <event_handlers>
	begin
	if (<handler_index> >= <array_Size>)
		break
	endif
	if StructureContains structure = (<event_handlers> [<handler_index>]) focus
		contains_focus = true
	endif
	if StructureContains structure = (<event_handlers> [<handler_index>]) unfocus
		contains_unfocus = true
	endif
	handler_index = (<handler_index> + 1)
	repeat
	if (<contains_focus> = FALSE)
		AddArrayElement array = (<event_handlers>) element = ({focus popup_menu_focus})
		<event_handlers> = (<array>)
	endif
	if (<contains_unfocus> = FALSE)
		AddArrayElement array = (<event_handlers>) element = ({unfocus popup_menu_unfocus})
		<event_handlers> = (<array>)
	endif
	return processed_handlers = <event_handlers>
endscript

script generic_popup_test 
	if ScreenElementExists \{id = vmenu_generic_popup_menu}
		return
	endif
	Change \{test_wait_var = 0}
	create_generic_popup \{title = qs(0x2251019f)
		loading_window
		can_cancel
		message = qs(0x0e111578)
		wait_variable = test_wait_var
		cancel_eventhandlers = [
			{
				focus
				popup_menu_focus
			}
			{
				unfocus
				popup_menu_unfocus
			}
			{
				pad_choose
				stop_waiting
			}
		]
		previous_menu = vmenu_main_menu}
endscript
