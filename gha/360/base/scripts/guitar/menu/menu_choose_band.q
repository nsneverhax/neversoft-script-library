choose_band_menu_font = text_a3

script create_choose_band_menu 
	menu_pos = (400.0, 270.0)
	new_menu {
		scrollid = scrolling_choose_band
		vmenuid = vmenu_choose_band
		use_backdrop = 0
		menu_pos = <menu_pos>
		spacing = -9
		focus_color = lt_violet_grey
		unfocus_color = dark_red2
	}
	create_menu_backdrop \{texture = Venue_BG}
	rotation_angle = -2
	SetScreenElementProps \{id = scrolling_choose_band}
	SetScreenElementProps \{id = vmenu_choose_band
		internal_just = [
			center
			top
		]
		dims = (650.0, 365.0)}
	CreateScreenElement \{Type = ContainerElement
		id = cb_helper_container
		parent = root_window
		Pos = (0.0, 0.0)}
	CreateScreenElement {
		Type = ContainerElement
		parent = root_window
		Pos = ($menu_pos)
		id = choose_band_header_container
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = choose_band_header_container
		id = big_blue_box
		just = [left bottom]
		rgba = [30 110 160 0]
		Pos = (-283.0, 165.0)
		dims = (655.0, 80.0)
		rot_angle = <rotation_angle>
	}
	CreateScreenElement \{Type = SpriteElement
		parent = cb_helper_container
		id = light_overlay
		texture = Venue_Overlay
		Pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [
			center
			center
		]
		z_priority = 99}
	CreateScreenElement \{Type = SpriteElement
		parent = cb_helper_container
		id = ticket_image
		texture = band_name_ticket
		rgba = [
			255
			255
			255
			255
		]
		Pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [
			center
			center
		]
		z_priority = 1}
	CreateScreenElement {
		Type = SpriteElement
		parent = cb_helper_container
		id = random_image
		texture = band_name_graphic03
		rgba = [255 255 255 200]
		Pos = (($enter_band_name_big_vals).right_side_img_pos)
		Scale = (($enter_band_name_big_vals).right_side_img_scale)
		relative_scale
		z_priority = 2
	}
	<rand> = 0
	GetRandomValue \{Name = rand
		integer
		a = 0
		b = 2}
	if (<rand> = 0)
		SetScreenElementProps \{id = random_image
			texture = band_name_graphic01}
	elseif (<rand> = 1)
		SetScreenElementProps \{id = random_image
			texture = band_name_graphic02}
	elseif (<rand> = 2)
		SetScreenElementProps \{id = random_image
			texture = band_name_graphic03}
	endif
	CreateScreenElement \{Type = SpriteElement
		parent = cb_helper_container
		id = ticket_overlay
		texture = band_name_ticket_bar_overlay
		rgba = [
			255
			255
			255
			255
		]
		Pos = (734.0, 360.0)
		dims = (684.0, 680.0)
		just = [
			center
			center
		]
		z_priority = 2}
	choose_band_text = "CHOOSE BAND"
	CreateScreenElement {
		Type = TextElement
		parent = big_blue_box
		just = [center bottom]
		font = text_a10_Large
		rgba = (($g_menu_colors).dk_violet_grey)
		text = <choose_band_text>
		Scale = 1.75
	}
	fit_text_in_rectangle id = <id> dims = (850.0, 200.0) Pos = (330.0, 65.0)
	<cb_hlBar_pos> = [(6.0, 96.0) (6.0, 145.0) (6.0, 204.0) (8.0, 255.0) (9.0, 312.0)]
	<cb_hlBar_dims> = [(656.0, 48.0) (656.0, 58.0) (656.0, 48.0) (654.0, 58.0) (653.0, 54.0)]
	CreateScreenElement {
		Type = SpriteElement
		parent = big_blue_box
		texture = white
		rgba = (($g_menu_colors).pink)
		just = [top left]
		Pos = ((<cb_hlBar_pos>) [0])
		dims = ((<cb_hlBar_dims>) [0])
		z_priority = 3
		alpha = 0.8
	}
	<cb_hlBarID> = <id>
	<loop_count> = 5
	band_index = 1
	begin
	band_name = "- NEW BAND -"
	get_band_game_mode_name
	formatText checksumName = bandname_id 'band%i_info_%g' i = <band_index> g = <game_mode_name>
	GetGlobalTags <bandname_id> param = Name
	if NOT (<Name> = "")
		<band_name> = <Name>
	endif
	CreateScreenElement {
		Type = TextElement
		parent = vmenu_choose_band
		font = ($choose_band_menu_font)
		Scale = (1.0, 1.3)
		rgba = ($menu_unfocus_color)
		text = <band_name>
		just = [center top]
		rot_angle = <rotation_angle>
		event_handlers = [
			{focus retail_menu_focus}
			{focus SetScreenElementProps params = {
					id = <cb_hlBarID>
					Pos = ((<cb_hlBar_pos>) [(<band_index> - 1)])
					dims = ((<cb_hlBar_dims>) [(<band_index> - 1)])
				}
			}
			{unfocus retail_menu_unfocus}
			{pad_choose menu_choose_band_make_selection params = {band_index = <band_index>}}
		]
	}
	GetScreenElementDims id = <id>
	if (<width> > 500)
		SetScreenElementProps id = <id> Scale = (0.9, 1.3)
	elseif (<width> > 300)
		SetScreenElementProps id = <id> Scale = (1.1, 1.3)
	else
		SetScreenElementProps id = <id> Scale = (1.4, 1.3)
	endif
	<band_index> = (<band_index> + 1)
	repeat <loop_count>
	add_user_control_helper \{text = "SELECT"
		button = green
		z = 100}
	add_user_control_helper \{text = "BACK"
		button = red
		z = 100}
	add_user_control_helper \{text = "UP/DOWN"
		button = strumbar
		z = 100}
endscript

script destroy_choose_band_menu 
	clean_up_user_control_helpers
	destroy_menu \{menu_id = scrolling_choose_band}
	destroy_menu \{menu_id = choose_band_header_container}
	destroy_menu \{menu_id = cb_helper_container}
	destroy_menu_backdrop
endscript

script menu_choose_band_make_selection 
	Change current_band = <band_index>
	get_band_game_mode_name
	formatText checksumName = bandname_id 'band%i_info_%g' i = <band_index> g = <game_mode_name>
	GetGlobalTags <bandname_id> param = Name
	if (<Name> = "")
		ui_flow_manager_respond_to_action \{action = select_new_band}
	else
		ui_flow_manager_respond_to_action \{action = select_existing_band}
	endif
endscript
