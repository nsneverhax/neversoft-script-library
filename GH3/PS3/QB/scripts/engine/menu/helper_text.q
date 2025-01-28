
script create_helper_text \{anchor_id = helper_text_anchor
		PARENT = root_window
		helper_pos = (640.0, 720.0)
		spacing_between = 3
		Bg_rgba = [
			2
			0
			1
			98
		]
		z_priority = 1000
		font = text_A1}
	if ObjectExists Id = <anchor_id>
		DestroyScreenElement Id = <anchor_id>
	endif
	CreateScreenElement {
		Type = ContainerElement
		PARENT = <PARENT>
		Id = <anchor_id>
		just = [Center Center]
		Pos = (640.0, 360.0)
		Dims = (1280.0, 720.0)
		Rot_Angle = 0
	}
	if NOT GotParam \{no_bar}
		CreateScreenElement {
			Type = SpriteElement
			PARENT = <anchor_id>
			texture = white2
			Pos = <helper_pos>
			just = [Center Bottom]
			rgba = [0 0 0 255]
			Scale = (160.0, 4.0)
			z_priority = (<z_priority> -1)
			Rot_Angle = -0.125
		}
	endif
	CreateScreenElement {
		Type = HMenu
		PARENT = <anchor_id>
		Pos = (<helper_pos> - (0.0, 4.0))
		just = [Center Bottom]
		internal_just = [Center Center]
		padding_scale = 1.1
		spacing_between = <spacing_between>
		Scale = <Scale>
	}
	<menu_id> = <Id>
	if GotParam \{helper_text_elements}
		ForEachIn <helper_text_elements> do = helper_text_update_element Params = {font = <font> menu_id = <menu_id> z_priority = <z_priority>}
	endif
endscript

script helper_text_update_element 
	if GotParam \{Id}
		if ObjectExists <Id>
			SetScreenElementProps {
				Id = <Id>
				Text = <Text>
			}
			return
		endif
	endif
	GetUpperCaseString <Text>
	CreateScreenElement {
		Type = TextElement
		PARENT = <menu_id>
		Id = <Id>
		font = <font>
		Text = <UpperCaseString>
		rgba = [90 90 90 255]
		Scale = 0.4
		z_priority = <z_priority>
		NOT_FOCUSABLE
	}
endscript
generic_helper_text = {
	helper_text_elements = [
		{
			Text = "\\b7/\\b4 SELECT"
		}
		{
			Text = "\\m1 BACK"
		}
		{
			Text = "\\m0 ACCEPT"
		}
	]
}
generic_helper_text_no_back = {
	helper_text_elements = [
		{
			Text = "\\b7/\\b4 SELECT"
		}
		{
			Text = "\\m0 ACCEPT"
		}
	]
}
generic_helper_text_no_accept = {
	helper_text_elements = [
		{
			Text = "\\b7/\\b4 SELECT"
		}
		{
			Text = "\\m1 BACK"
		}
	]
}
generic_helper_text_cas = {
	helper_text_elements = [
		{
			Text = "\\b7/\\b4 SELECT"
		}
		{
			Text = "\\m1 BACK"
		}
		{
			Text = "\\m0 ACCEPT"
		}
		{
			Text = "\\be/\\bf ROTATE"
		}
	]
}
generic_helper_text_cas_z = {
	helper_text_elements = [
		{
			Text = "\\b7/\\b4 SELECT"
		}
		{
			Text = "\\m1 BACK"
		}
		{
			Text = "\\m0 ACCEPT"
		}
		{
			Text = "\\be/\\bf ROTATE"
		}
		{
			Text = "\\mj ZOOM"
		}
	]
}
generic_helper_text_left_right = {
	helper_text_elements = [
		{
			Text = "\\b6/\\b5 SELECT"
		}
		{
			Text = "\\m1 BACK"
		}
		{
			Text = "\\m0 ACCEPT"
		}
	]
}
generic_helper_text_left_right_no_back = {
	helper_text_elements = [
		{
			Text = "\\b6/\\b5 SELECT"
		}
		{
			Text = "\\m0 ACCEPT"
		}
	]
}
generic_helper_text_up_down_left_right = {
	helper_text_elements = [
		{
			Text = "\\b7/\\b4/\\b6/\\b5 SELECT"
		}
		{
			Text = "\\m1 BACK"
		}
		{
			Text = "\\m0 ACCEPT"
		}
	]
}
generic_helper_text_left_right_up_down = {
	helper_text_elements = [
		{
			Text = "\\b7/\\b4 SELECT"
		}
		{
			Text = "\\b6/\\b5 ADJUST"
		}
		{
			Text = "\\m1 BACK"
		}
		{
			Text = "\\m0 ACCEPT"
		}
	]
}
generic_helper_text_color_menu = {
	helper_text_elements = [
		{
			Text = "\\b7/\\b4 SELECT"
		}
		{
			Text = "\\b6/\\b5 ADJUST"
		}
		{
			Text = "\\m1 BACK"
		}
		{
			Text = "\\m0 ACCEPT"
		}
		{
			Text = "\\be/\\bf ROTATE"
		}
	]
}
generic_helper_text_color_menu_z = {
	helper_text_elements = [
		{
			Text = "\\b7/\\b4 SELECT"
		}
		{
			Text = "\\b6/\\b5 ADJUST"
		}
		{
			Text = "\\m1 BACK"
		}
		{
			Text = "\\be/\\bf ROTATE"
		}
		{
			Text = "\\mj ZOOM"
		}
	]
}
generic_helper_text_color_menu_reset = {
	helper_text_elements = [
		{
			Text = "\\m1 BACK"
		}
		{
			Text = "\\be/\\bf ROTATE"
		}
		{
			Text = "\\mn RESET"
		}
		{
			Text = "\\mj ZOOM"
		}
	]
}
generic_dialog_helper_text = {
	helper_text_elements = [
		{
			Text = "\\m0 ACCEPT"
		}
	]
}
generic_dialog_helper_text2 = {
	helper_text_elements = [
		{
			Text = "\\b7/\\b4 SELECT"
		}
		{
			Text = "\\m0 ACCEPT"
		}
	]
}
generic_dialog_helper_text3 = {
	helper_text_elements = [
		{
			Text = "\\m1 BACK"
		}
		{
			Text = "\\m0 ACCEPT"
		}
	]
}
