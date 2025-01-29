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
		if ScreenElementExists id = {<id> child = bookend_right}
			DoScreenElementMorph id = {<id> child = bookend_right} alpha = 1.0 preserve_flip
		endif
		if ScreenElementExists id = {<id> child = bookend_left}
			DoScreenElementMorph id = {<id> child = bookend_left} alpha = 1.0 preserve_flip
		endif
	else
		GetTags
		SetScreenElementProps id = <id> rgba = ($popup_focus_color)
		if ScreenElementExists id = {<id> child = bookend_right}
			DoScreenElementMorph id = {<id> child = bookend_right} alpha = 1.0 preserve_flip
		endif
		if ScreenElementExists id = {<id> child = bookend_left}
			DoScreenElementMorph id = {<id> child = bookend_left} alpha = 1.0 preserve_flip
		endif
	endif
endscript

script popup_menu_unfocus 
	if GotParam \{id}
		if ScreenElementExists id = <id>
			SetScreenElementProps id = <id> rgba = ($popup_unfocus_color)
		endif
		if ScreenElementExists id = {<id> child = bookend_right}
			DoScreenElementMorph id = {<id> child = bookend_right} alpha = 0.0 preserve_flip
		endif
		if ScreenElementExists id = {<id> child = bookend_left}
			DoScreenElementMorph id = {<id> child = bookend_left} alpha = 0.0 preserve_flip
		endif
	else
		GetTags
		SetScreenElementProps id = <id> rgba = ($popup_unfocus_color)
		if ScreenElementExists id = {<id> child = bookend_right}
			DoScreenElementMorph id = {<id> child = bookend_right} alpha = 0.0 preserve_flip
		endif
		if ScreenElementExists id = {<id> child = bookend_left}
			DoScreenElementMorph id = {<id> child = bookend_left} alpha = 0.0 preserve_flip
		endif
	endif
endscript
popup_priority = 11

script create_generic_popup \{text_font = text_a1
		menu_font = fontgrid_title_gh3
		z = 100
		font_scale = 0.75
		message_scale = 0.75}
	dont_swap_colors = 0
	if ($generic_popup_open = 1)
		if GotParam \{Priority}
			if ($popup_priority <= <Priority>)

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
	if GotParam \{loading_window}
		if ($<wait_variable> = 1)
			return
		endif
	endif

	scale_1 = ((1.5, 0.0) + (0.0, 1.4))
	scale_2 = ((1.4, 0.0) + (0.0, 1.4))
	scale_3 = ((1.4, 0.0) + (0.0, 1.25))
	scale_4 = ((1.575, 0.0) + (0.0, 1.5))
	scale_5 = ((1.5, 0.0) + (0.0, 1.4))
	menu_pos = (534.0, 474.0)
	<dialog> = 0
	generic_popup_z = <z>
	menu_font = <font>
	text_font = <message_font>
	if GotParam \{option_menu}
		if (<option_menu> = 1)
			<menu_pos> = (534.0, 494.0)
		elseif (<option_menu> = 2)
			<menu_pos> = (534.0, 494.0)
		elseif (<option_menu> = 3)
			<menu_pos> = (534.0, 474.0)
		else
			<menu_pos> = (534.0, 454.0)
		endif
		<dialog> = 1

	endif
	if GotParam \{ok_menu}
		<menu_pos> = (534.0, 484.0)
		<dialog> = 1
	endif
	if GotParam \{yes_no_menu}
		<menu_pos> = (534.0, 480.0)
		<dialog> = 1
	endif
	if GotParam \{phrase_window}
		<menu_pos> = (415.0, 250.0)
	endif
	if GotParam \{loading_window}
		<menu_pos> = (534.0, 484.0)
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
			0
			0
			0
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
		AddArrayElement array = (<generic_popup_event_handlers>) element = (<back_handler>)
		<generic_popup_event_handlers> = (<array>)
	endif
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = generic_popup_container
		Pos = (0.0, 0.0)
		internal_just = [
			center
			center
		]}
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
			z_priority = <generic_popup_z>
			alpha = <full_blackout>
		}
	endif
	<center_pos> = (640.0, 360.0)
	CreateScreenElement {
		Type = SpriteElement
		parent = generic_popup_container
		texture = GH3_Pause_Frame_02
		rgba = [255 255 255 255]
		Pos = (<center_pos>)
		Scale = <scale_3>
		just = [bottom right]
		z_priority = (<generic_popup_z> + 2)
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = generic_popup_container
		texture = GH3_Pause_Frame_02
		rgba = [255 255 255 255]
		Pos = (<center_pos>)
		Scale = <scale_3>
		just = [top right]
		z_priority = (<generic_popup_z> + 2)
		flip_v
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = generic_popup_container
		texture = GH3_Pause_Frame_02
		rgba = [255 255 255 255]
		Pos = (<center_pos>)
		Scale = <scale_3>
		just = [top left]
		z_priority = (<generic_popup_z> + 2)
		flip_v
		flip_h
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = generic_popup_container
		texture = GH3_Pause_Frame_02
		rgba = [255 255 255 255]
		Pos = (<center_pos>)
		Scale = <scale_3>
		just = [bottom left]
		z_priority = (<generic_popup_z> + 2)
		flip_h
	}
	if GotParam \{title}
		popup_title_off = (645.0, 60.0)
		displaySprite parent = generic_popup_container tex = Dialog_Title_BG flip_v Pos = (416.0, 0.0) Scale = (1.75, 1.75) z = (<generic_popup_z> + 2.1)
		displaySprite parent = generic_popup_container tex = Dialog_Title_BG Pos = (640.0, 0.0) Scale = (1.75, 1.75) z = (<generic_popup_z> + 2.1)
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
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba = [0 0 0 255]
			}
		endif
	endif
	if GotParam \{message}

		if GotParam \{long_text}
			osprintf \{'Using Long Text Dimmensions'}
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
	generic_popup_menu_z = (<generic_popup_z> + 5)
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
				id = 0x4de6bfec
				font = <menu_font>
				Scale = 1.5
				rgba = ($popup_unfocus_color)
				text = $wii_cancel
				just = [center top]
				event_handlers = <cancel_eventhandlers>
				z_priority = (<generic_popup_menu_z> + 5)
			}
			displaySprite parent = generic_popup_container tex = Dialog_BG Pos = (410.0, 450.0) Scale = (1.8, 1.25) z = <generic_popup_menu_z>
			displaySprite parent = generic_popup_container tex = Dialog_BG flip_h Pos = (410.0, 530.0) Scale = (1.8, 1.25) z = <generic_popup_menu_z>
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
		displaySprite parent = generic_popup_container tex = Dialog_BG Pos = (450.0, 450.0) Scale = (1.5, 1.25) z = <generic_popup_menu_z>
		displaySprite parent = generic_popup_container tex = Dialog_BG flip_h Pos = (450.0, 530.0) Scale = (1.5, 1.25) z = <generic_popup_menu_z>
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
		displaySprite parent = generic_popup_container tex = Dialog_BG Pos = (450.0, 450.0) Scale = (1.5, 1.25) z = <generic_popup_menu_z>
		displaySprite parent = generic_popup_container tex = Dialog_BG flip_h Pos = (450.0, 530.0) Scale = (1.5, 1.25) z = <generic_popup_menu_z>
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
			displaySprite parent = generic_popup_container tex = Dialog_BG Pos = (390.0, 428.0) Scale = (1.9499999, 2.05) z = <generic_popup_menu_z>
			displaySprite parent = generic_popup_container tex = Dialog_BG flip_h Pos = (390.0, 530.0) Scale = (1.9499999, 2.05) z = <generic_popup_menu_z>
		elseif (<option_menu> = 4)
			displaySprite parent = generic_popup_container tex = Dialog_BG Pos = (390.0, 428.0) Scale = (1.9499999, 1.65) z = <generic_popup_menu_z>
			displaySprite parent = generic_popup_container tex = Dialog_BG flip_h Pos = (390.0, 530.0) Scale = (1.9499999, 1.65) z = <generic_popup_menu_z>
		else
			displaySprite parent = generic_popup_container tex = Dialog_BG Pos = (390.0, 450.0) Scale = (1.9499999, 1.25) z = <generic_popup_menu_z>
			displaySprite parent = generic_popup_container tex = Dialog_BG flip_h Pos = (390.0, 530.0) Scale = (1.9499999, 1.25) z = <generic_popup_menu_z>
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
		formatText TextName = selection_text '%a of %b' a = (($phrase_index) + 1) b = ($phrase_array_size)
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
		<left_pos> = ((0.0, 15.0) + (-5.0, 0.0))
		<right_pos> = ((0.0, 15.0) + (1.3499999, 0.0) * <width> + (2.0, 0.0))
		if GotParam \{loading_window}
			if GotParam \{can_cancel}
				<right_pos> = ((0.0, 15.0) + (0.7, 0.0) * <width> + (2.0, 0.0))
			endif
		elseif GotParam \{yes_no_menu}
			<right_pos> = ((0.0, 15.0) + (1.0, 0.0) * <width> + (2.0, 0.0))
		elseif GotParam \{ok_menu}
			<right_pos> = ((0.0, 15.0) + (0.6, 0.0) * <width> + (2.0, 0.0))
		endif
		CreateScreenElement {
			Type = SpriteElement
			parent = (<children> [<i>])
			local_id = bookend_left
			texture = Dialog_Highlight
			alpha = 0.0
			just = [right top]
			Pos = <left_pos>
			z_priority = (<z> + 6)
			Scale = (1.0, 1.0)
			rgba = ($popup_focus_color)
			flip_v
		}
		CreateScreenElement {
			Type = SpriteElement
			parent = (<children> [<i>])
			local_id = bookend_right
			texture = Dialog_Highlight
			alpha = 0.0
			just = [left top]
			Pos = <right_pos>
			z_priority = (<z> + 6)
			Scale = (1.0, 1.0)
			rgba = ($popup_focus_color)
		}

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

script set_generic_popup_open 
	Change \{generic_popup_open = 1}
endscript

script destroy_generic_popup 
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
	Change \{generic_popup_open = 0}
	Change \{generic_popup_loading_window_open = 0}
	Change \{popup_priority = 11}

	popup_old_focus_color = ($menu_unfocus_color)
	popup_old_unfocus_color = ($menu_focus_color)
	Change menu_focus_color = <popup_old_focus_color>
	Change menu_unfocus_color = <popup_old_unfocus_color>
	getfocusid
	LaunchEvent Type = focus target = <focus_on_me>
endscript

script kill_generic_popup_early 
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
			<temp_string> = (<temp_string> + '.')
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
	formatText TextName = selection_text '%a of %b' a = (($phrase_index) + 1) b = ($phrase_array_size)
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
	Change \{0x432a975d = 0}
endscript

script add_popup_user_control_helpers \{add_nav = true}
	clean_up_user_control_helpers
	add_user_control_helper text = 'SELECT' button = green z = (<popup_z> + 10)
	if (<add_back> = true)
		add_user_control_helper text = 'BACK' button = red z = (<popup_z> + 10)
	endif
	if (<add_nav> = true)
		add_user_control_helper text = 'UP/DOWN' button = strumbar z = (<popup_z> + 10)
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
	create_generic_popup \{title = 'TEST MENU 2'
		loading_window
		can_cancel
		message = 'Please Wait while this loads'
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
