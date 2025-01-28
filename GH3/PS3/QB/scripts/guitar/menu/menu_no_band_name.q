last_band_name_message_index = -1
no_band_name_messages = [
	"Unless you're the artist formerly known as Prince, enter a name."
	"ENTER A F@*$#&% NAME!!!"
	"You too cool for school? Enter a name pal."
	"Every time you don't enter a band name, a kitten dies."
	"Why won't you enter a band name? It feels so great."
	"What will your adoring fans chant if you don't have a name?"
	"Here's a band name suggestion: Lazy McUnimaginative"
	"Come on already!"
]

script create_no_band_menu 
	header_font = fontgrid_title_gh3
	menu_font = fontgrid_title_gh3
	warning_text_pos = (640.0, 218.0)
	quit_warning_text_dims = (580.0, 300.0)
	quit_warning_text_pos = (640.0, 375.0)
	Menu_pos = (550.0, 530.0)
	Z = 7
	offwhite = [223 223 223 255]
	new_menu scrollid = nb_scroll vmenuid = nb_vmenu use_backdrop = (0) Menu_pos = <Menu_pos>
	create_pause_menu_frame x_scale = 1.1 y_scale = 1.1 tile_sprite = 0 Z = <Z>
	CreateScreenElement \{Type = ContainerElement
		PARENT = root_window
		Id = no_band_container
		Pos = (0.0, 0.0)}
	CreateScreenElement {
		Type = TextElement
		PARENT = no_band_container
		font = <header_font>
		Text = "ENTER A BAND NAME"
		rgba = [130 50 50 255]
		just = [Center Top]
		Scale = (1.25, 1.15)
		Pos = <warning_text_pos>
		z_priority = (<Z> + 4)
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
	GetArraySize ($no_band_name_messages)
	begin
	GetRandomValue A = 0 B = (<array_Size> -1) Integer Name = random_carp
	if NOT (<random_carp> = ($last_band_name_message_index))
		break
	endif
	repeat
	Change last_band_name_message_index = (<random_carp>)
	no_band_text = ($no_band_name_messages [<random_carp>])
	PrintStruct <...>
	CreateScreenElement {
		Type = TextBlockElement
		PARENT = no_band_container
		font = <menu_font>
		Text = <no_band_text>
		rgba = [210 210 210 250]
		just = [Center Center]
		Scale = (0.8, 0.7)
		font_spacing = 1
		Pos = <quit_warning_text_pos>
		Dims = <quit_warning_text_dims>
		z_priority = (<Z> + 3)
	}
	displaySprite PARENT = no_band_container tex = Dialog_BG Pos = (480.0, 485.0) Dims = (320.0, 64.0) Z = (<Z> + 3)
	displaySprite PARENT = no_band_container tex = Dialog_BG flip_h Pos = (480.0, 554.0) Dims = (320.0, 64.0) Z = (<Z> + 3)
	displaySprite PARENT = no_band_container tex = White Pos = (492.0, 541.0) Scale = (75.0, 6.0) Z = (<Z> + 3) rgba = <offwhite>
	displaySprite PARENT = no_band_container tex = Dialog_Frame_Joiner Pos = (480.0, 534.0) Rot_Angle = 5 Scale = (1.575, 1.5) Z = (<Z> + 3.01)
	displaySprite PARENT = no_band_container tex = Dialog_Frame_Joiner Pos = (750.0, 538.0) flip_v Rot_Angle = -5 Scale = (1.575, 1.5) Z = (<Z> + 3.01)
	displaySprite Id = hi_right PARENT = no_band_container tex = Dialog_Highlight Pos = (770.0, 533.0) Scale = (1.0, 1.0) Z = (<Z> + 3.02)
	displaySprite Id = hi_left PARENT = no_band_container tex = Dialog_Highlight flip_v Pos = (500.0, 533.0) Scale = (1.0, 1.0) Z = (<Z> + 3.02)
	set_focus_color \{rgba = [
			180
			50
			50
			255
		]}
	set_unfocus_color \{rgba = [
			0
			0
			0
			255
		]}
	CreateScreenElement {
		Type = TextElement
		PARENT = nb_vmenu
		font = <header_font>
		rgba = [130 50 50 255]
		Text = "CONTINUE"
		just = [LEFT Top]
		z_priority = (<Z> + 3.01)
		font_spacing = 1
		event_handlers = [
			{Focus menu_no_band_continue_highlight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action Params = {action = Continue}}
		]
	}
endscript

script destroy_no_band_menu 
	destroy_menu \{menu_id = nb_scroll}
	destroy_menu \{menu_id = no_band_container}
	destroy_pause_menu_frame
endscript

script menu_no_band_continue_highlight 
	retail_menu_focus
	SetScreenElementProps \{Id = hi_left
		Pos = (480.0, 530.0)
		flip_v}
	SetScreenElementProps \{Id = hi_right
		Pos = (740.0, 530.0)}
endscript
