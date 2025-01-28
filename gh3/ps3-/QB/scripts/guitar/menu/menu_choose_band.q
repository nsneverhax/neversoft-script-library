choose_band_menu_font = text_a3

script create_choose_band_menu 
	Menu_pos = (400.0, 270.0)
	new_menu {
		scrollid = scrolling_choose_band
		vmenuid = vmenu_choose_band
		use_backdrop = 0
		Menu_pos = <Menu_pos>
		Spacing = -9
	}
	set_focus_color \{rgba = [
			255
			220
			140
			255
		]}
	set_unfocus_color \{rgba = [
			90
			25
			5
			255
		]}
	create_menu_backdrop \{texture = Toprockers_bg}
	rotation_angle = -2
	SetScreenElementProps \{Id = scrolling_choose_band}
	SetScreenElementProps \{Id = vmenu_choose_band
		internal_just = [
			Center
			Top
		]
		Dims = (650.0, 365.0)}
	CreateScreenElement \{Type = ContainerElement
		Id = cb_helper_container
		PARENT = root_window
		Pos = (0.0, 0.0)}
	CreateScreenElement {
		Type = ContainerElement
		PARENT = root_window
		Pos = ($Menu_pos)
		Id = choose_band_header_container
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = choose_band_header_container
		Id = big_blue_box
		just = [LEFT Bottom]
		rgba = [30 110 160 0]
		Pos = (-283.0, 165.0)
		Dims = (655.0, 80.0)
		Rot_Angle = <rotation_angle>
	}
	CreateScreenElement \{Type = SpriteElement
		PARENT = cb_helper_container
		Id = light_overlay
		texture = Venue_Overlay
		Pos = (640.0, 360.0)
		Dims = (1280.0, 720.0)
		just = [
			Center
			Center
		]
		z_priority = 99}
	CreateScreenElement \{Type = SpriteElement
		PARENT = cb_helper_container
		Id = ticket_image
		texture = band_name_ticket
		rgba = [
			255
			255
			255
			255
		]
		Pos = (640.0, 360.0)
		Dims = (1280.0, 720.0)
		just = [
			Center
			Center
		]
		z_priority = 1}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = cb_helper_container
		Id = random_image
		texture = band_name_graphic03
		rgba = [255 255 255 255]
		Pos = (($enter_band_name_big_vals).right_side_img_pos)
		Dims = (($enter_band_name_big_vals).right_side_img_dims)
		z_priority = 2
	}
	<rand> = 0
	GetRandomValue \{Name = rand
		Integer
		A = 0
		B = 2}
	if (<rand> = 0)
		SetScreenElementProps \{Id = random_image
			texture = band_name_graphic01}
	elseif (<rand> = 1)
		SetScreenElementProps \{Id = random_image
			texture = band_name_graphic02}
	elseif (<rand> = 2)
		SetScreenElementProps \{Id = random_image
			texture = band_name_graphic03}
	endif
	CreateScreenElement \{Type = SpriteElement
		PARENT = cb_helper_container
		Id = ticket_overlay
		texture = band_name_ticket_bar_overlay
		rgba = [
			255
			255
			255
			255
		]
		Pos = (734.0, 360.0)
		Dims = (684.0, 680.0)
		just = [
			Center
			Center
		]
		z_priority = 2}
	choose_band_text = "CHOOSE BAND"
	CreateScreenElement {
		Type = TextElement
		PARENT = big_blue_box
		just = [RIGHT Bottom]
		font = text_a10_Large
		rgba = [105 50 35 255]
		Text = <choose_band_text>
		Scale = 1.75
	}
	fit_text_in_rectangle Id = <Id> Dims = (850.0, 200.0) Pos = (510.0, 75.0)
	CreateScreenElement \{Type = SpriteElement
		PARENT = big_blue_box
		just = [
			RIGHT
			Bottom
		]
		Id = logo_vault_image
		texture = setlist_icon_generic
		Pos = (660.0, 96.0)
		Dims = (128.0, 128.0)
		BLEND = Subtract}
	<cb_hlBar_pos> = [(6.0, 96.0) (6.0, 145.0) (6.0, 204.0) (8.0, 255.0) (9.0, 312.0)]
	<cb_hlBar_dims> = [(656.0, 48.0) (656.0, 58.0) (656.0, 48.0) (654.0, 58.0) (653.0, 54.0)]
	displaySprite {
		PARENT = big_blue_box
		tex = White
		rgba = [205 105 110 255]
		Pos = ((<cb_hlBar_pos>) [0])
		Dims = ((<cb_hlBar_dims>) [0])
		Z = 3
	}
	<cb_hlBarID> = <Id>
	<loop_count> = 5
	band_index = 1
	begin
	band_name = "- NEW BAND -"
	get_band_game_mode_name
	FormatText ChecksumName = bandname_id 'band%i_info_%g' I = <band_index> G = <game_mode_name>
	GetGlobalTags <bandname_id> Param = Name
	if NOT (<Name> = "")
		<band_name> = <Name>
	endif
	CreateScreenElement {
		Type = TextElement
		PARENT = vmenu_choose_band
		font = ($choose_band_menu_font)
		Scale = (1.1, 1.3)
		rgba = ($menu_unfocus_color)
		Text = <band_name>
		just = [Center Top]
		Rot_Angle = <rotation_angle>
		event_handlers = [
			{Focus retail_menu_focus}
			{Focus SetScreenElementProps Params = {
					Id = <cb_hlBarID>
					Pos = ((<cb_hlBar_pos>) [(<band_index> - 1)])
					Dims = ((<cb_hlBar_dims>) [(<band_index> - 1)])
				}
			}
			{unfocus retail_menu_unfocus}
			{pad_choose menu_choose_band_make_selection Params = {band_index = <band_index>}}
		]
	}
	GetScreenElementDims Id = <Id>
	if (<width> > 500)
		SetScreenElementProps Id = <Id> Scale = (1.0, 1.3)
	elseif (<width> > 300)
		SetScreenElementProps Id = <Id> Scale = (1.2, 1.3)
	else
		SetScreenElementProps Id = <Id> Scale = (1.5, 1.3)
	endif
	<band_index> = (<band_index> + 1)
	repeat <loop_count>
	add_user_control_helper \{Text = "SELECT"
		button = Green
		Z = 100}
	add_user_control_helper \{Text = "BACK"
		button = RED
		Z = 100}
	add_user_control_helper \{Text = "UP/DOWN"
		button = Strumbar
		Z = 100}
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
	FormatText ChecksumName = bandname_id 'band%i_info_%g' I = <band_index> G = <game_mode_name>
	GetGlobalTags <bandname_id> Param = Name
	if (<Name> = "")
		ui_flow_manager_respond_to_action \{action = select_new_band}
	else
		ui_flow_manager_respond_to_action \{action = select_existing_band}
	endif
endscript
