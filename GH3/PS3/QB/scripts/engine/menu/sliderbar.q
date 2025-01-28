
script sliderbar_rescale_to_bar 
	<Target1> = ((<Value> - <Min>) / (<MAX> - <Min>))
	<target2> = (<RIGHT> - <LEFT>)
	<target3> = (<Target1> * <target2>)
	<rescaled_value> = (<target3> + <LEFT>)
	return x_val = <rescaled_value>
endscript

script sliderbar_add_item \{tab = tab1
		font = text_A1
		icon_rgba = [
			127
			102
			0
			128
		]
		icon_scale = 0
		icon_pos = (22.0, 9.0)
		text_just = [
			Center
			Center
		]
		text_pos = (0.0, 0.0)
		arrow_pos_up = (0.0, 8.0)
		arrow_pos_down = (0.0, -8.0)
		arrow_rgba = [
			100
			90
			80
			255
		]
		up_arrow_texture = up_arrow
		down_arrow_texture = down_arrow
		Dims = (0.0, 20.0)}
	if GotParam \{is_enabled_script}
		<is_enabled_script>
		if (<success> = 0)
			return
		endif
	endif
	switch <tab>
		case tab1
		<bar_scale> = (0.91999996, 1.2)
		case tab2
		<bar_scale> = (0.85, 1.2)
		case tab3
		<bar_scale> = (0.78, 1.2)
		<font> = dialog
	endswitch
	SetScreenElementLock \{Id = current_menu
		OFF}
	if NOT GotParam \{pad_choose_params}
		<pad_choose_params> = <...>
	endif
	if GotParam \{Index}
		if GotParam \{pad_choose_params}
			<pad_choose_params> = (<pad_choose_params> + {parent_index = <Index>})
		else
			<pad_choose_params> = {parent_index = <Index>}
		endif
	endif
	<z_priority> = 300
	CreateScreenElement {
		Type = ContainerElement
		PARENT = current_menu
		Id = <anchor_id>
		Dims = <Dims>
		event_handlers = [{Focus <focus_script> Params = <focus_params>}
			{unfocus <unfocus_script> Params = <unfocus_params>}
			{pad_choose <pad_choose_script> Params = <pad_choose_params>}
		]
		<NOT_FOCUSABLE>
		z_priority = <z_priority>
	}
	<parent_id> = <Id>
	if GotParam \{Index}
		SetScreenElementProps {
			Id = <parent_id>
			tags = {tag_grid_x = <Index>}
		}
	endif
	if GotParam \{NOT_FOCUSABLE}
		<rgba> = [60 60 60 100]
	else
		rgba = [128 128 128 240]
	endif
	CreateScreenElement {
		Type = TextElement
		PARENT = <parent_id>
		font = text_A1
		Text = <Text>
		Scale = 0.5
		rgba = [128 , 128 , 128 , 255]
		just = <text_just>
		Pos = <text_pos>
		Shadow
		shadow_rgba = $UI_text_shadow_color
		shadow_offs = (1.0, 1.0)
		Replace_Handlers
		<NOT_FOCUSABLE>
	}
	highlight_angle = 0
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <parent_id>
		texture = DE_highlight_bar
		Pos = (-25.0, -7.0)
		rgba = [0 0 0 0]
		just = [Center Center]
		Scale = (1.9, 0.7)
		z_priority = (3 -1)
		Rot_Angle = <highlight_angle>
	}
	<Pos> = (-9.0, 0.0)
	if GotParam \{bar_pos}
		<Pos> = <bar_pos>
	endif
	bar_rgba = [100 90 80 255]
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <parent_id>
		z_priority = 1
		Pos = <Pos>
		Scale = (8.0, 0.75)
		texture = roundbar_middle
		rgba = <bar_rgba>
	}
	DoScreenElementMorph Id = <Id> Alpha = 0 Time = 0
	CreateScreenElement {
		Type = ContainerElement
		PARENT = <anchor_id>
		just = [Center Bottom]
		Dims = {200 , 200}
		Pos = <arrow_pos_down>
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <Id>
		Id = <down_arrow_id>
		texture = <down_arrow_texture>
		rgba = <arrow_rgba>
		Scale = 0.0
	}
	CreateScreenElement {
		Type = ContainerElement
		PARENT = <anchor_id>
		just = [Center Top]
		Dims = {200 , 200}
		Pos = <arrow_pos_up>
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <Id>
		Id = <up_arrow_id>
		texture = <up_arrow_texture>
		rgba = <arrow_rgba>
		Scale = 0.0
	}
	if GotParam \{child_texture}
		CreateScreenElement {
			Type = SpriteElement
			PARENT = <parent_id>
			texture = <child_texture>
			Pos = <icon_pos>
			rgba = <icon_rgba>
			Scale = <icon_scale>
			Id = <icon_id>
		}
	endif
	SetScreenElementLock \{Id = current_menu
		ON}
endscript

script sliderbar_add_text_item 
	SetScreenElementLock \{Id = current_menu
		OFF}
	CreateScreenElement {
		Type = ContainerElement
		PARENT = current_menu
		event_handlers = [{Focus sliderbar_focus_text_item Params = <focus_params>}
			{unfocus sliderbar_unfocus_text_item}
			{pad_choose <pad_choose_script> Params = <pad_choose_params>}
		]
		Dims = (0.0, 20.0)
	}
	<parent_id> = <Id>
	CreateScreenElement {
		Type = TextElement
		PARENT = <parent_id>
		font = text_A1
		Text = <Text>
		Scale = 0.5
		rgba = [128 , 128 , 128 , 255]
		just = [Center Top]
		Pos = (-6.0, -6.0)
		Shadow
		shadow_rgba = $UI_text_shadow_color
		shadow_offs = (1.0, 1.0)
	}
	bar_rgba = [100 90 80 255]
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <parent_id>
		z_priority = 1
		Scale = (8.0, 0.75)
		Pos = (-34.0, 2.0)
		texture = roundbar_middle
		rgba = <bar_rgba>
	}
	DoScreenElementMorph Id = <Id> Alpha = 0 Time = 0
	SetScreenElementLock \{Id = current_menu
		ON}
endscript

script sliderbar_focus_text_item 
	create_helper_text helper_pos = <helper_pos> $generic_helper_text_cas_z Scale = 0.9
	Obj_GetID
	Id = <ObjID>
	on_color = [128 123 20 255]
	SetScreenElementProps {
		Id = {<Id> child = 0}
		rgba = [90 80 70 255]
		shadow_rgba = [0 , 0 , 0 , 0]
	}
	DoScreenElementMorph Id = {<Id> child = 1} Alpha = 1 Time = 0
endscript

script sliderbar_unfocus_text_item 
	Obj_GetID
	Id = <ObjID>
	SetScreenElementProps {
		Id = {<Id> child = 0}
		rgba = [110 110 110 255]
		shadow_rgba = $UI_text_shadow_color
	}
	DoScreenElementMorph Id = {<Id> child = 1} Alpha = 0 Time = 0
endscript
