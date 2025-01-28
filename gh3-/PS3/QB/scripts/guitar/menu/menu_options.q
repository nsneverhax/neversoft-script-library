options_menu_font = text_a5
g_options_start_pos = (460.0, 100.0)
options_menu_index = 1

script create_options_menu 
	Change \{options_for_manage_band = 0}
	Change \{current_num_players = 1}
	font_size = 0.95
	bluish = [130 160 175 255]
	set_focus_color \{rgba = [
			223
			223
			223
			255
		]}
	set_unfocus_color rgba = <RED>
	create_menu_backdrop \{texture = Venue_BG}
	CreateScreenElement \{Type = ContainerElement
		PARENT = root_window
		Id = om_container
		Scale = 1.1
		Pos = (-20.0, -20.0)}
	set_focus_color \{rgba = [
			220
			220
			220
			255
		]}
	set_unfocus_color \{rgba = [
			0
			0
			0
			255
		]}
	Change \{options_menu_index = 1}
	rot = 3
	displaySprite PARENT = om_container tex = options_main_poster Pos = (640.0, 340.0) Dims = (600.0, 600.0) just = [Center Center] Rot_Angle = <rot>
	displaySprite PARENT = om_container Id = om_black_bg tex = options_main_highlight Pos = (500.0, 210.0) Dims = (180.0, 30.0) rgba = [50 0 0 255] Z = 9 just = [Center Center] Rot_Angle = <rot>
	displayText PARENT = om_container Text = "OPTIONS" Pos = (700.0, 110.0) Scale = 1.9 just = [Center Center] rgba = [50 0 0 255] font = text_A11_Large Z = 10 rot = (<rot> -3) noshadow
	displayText PARENT = om_container Text = "OPTIONS" Pos = (695.0, 115.0) Scale = 1.9 just = [Center Center] rgba = [160 130 105 255] font = text_A11_Large Z = 9 rot = (<rot> -2) noshadow
	displaySprite PARENT = om_container Id = options_monster tex = options_main_monster Pos = (735.0, 320.0) Dims = (256.0, 512.0) Z = 15 just = [Center Center] Rot_Angle = <rot>
	RunScriptOnScreenElement \{Id = options_monster
		anim_float}
	text_params = {PARENT = om_container Type = TextElement font = ($options_menu_font) rgba = ($menu_unfocus_color) Scale = <font_size> Rot_Angle = <rot> z_priority = 10 exclusive_device = ($primary_controller)}
	CreateScreenElement {
		<text_params>
		Id = om_text_1
		Text = "AUDIO"
		Pos = (500.0, 210.0)
		Scale = 0.8
		event_handlers = [
			{Focus options_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action Params = {action = select_audio_settings}}
			{pad_up options_change_index Params = {move = UP}}
			{pad_down options_change_index Params = {move = DOWN}}
			{pad_back menu_flow_go_back}
		]
	}
	<Id> :SetTags bg_pos = (507.0, 205.0) bg_dims = (190.0, 40.0)
	GetScreenElementDims Id = <Id>
	if (<width> > 190)
		SetScreenElementProps Id = <Id> Scale = 1
		fit_text_in_rectangle Id = <Id> Dims = (175.0, 35.0) Pos = (500.0, 210.0)
	endif
	CreateScreenElement {
		<text_params>
		Id = om_text_2
		Text = "CALIBRATE LAG"
		Pos = (503.0, 255.0)
		Scale = 0.7
		event_handlers = [
			{Focus options_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action Params = {action = select_calibrate_lag}}
			{pad_up options_change_index Params = {move = UP}}
			{pad_down options_change_index Params = {move = DOWN}}
			{pad_back menu_flow_go_back}
		]
	}
	<Id> :SetTags bg_pos = (500.0, 247.0) bg_dims = (192.0, 50.0)
	GetScreenElementDims Id = <Id>
	if (<width> > 190)
		SetScreenElementProps Id = <Id> Scale = 1
		fit_text_in_rectangle Id = <Id> Dims = (175.0, 45.0) Pos = (503.0, 255.0)
	endif
	CreateScreenElement {
		<text_params>
		Id = om_text_3
		Text = "CONTROLLER"
		Pos = (497.0, 298.0)
		Scale = 0.7
		event_handlers = [
			{Focus options_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action Params = {action = select_controller_settings}}
			{pad_up options_change_index Params = {move = UP}}
			{pad_down options_change_index Params = {move = DOWN}}
			{pad_back menu_flow_go_back}
		]
	}
	<Id> :SetTags bg_pos = (500.0, 290.0) bg_dims = (180.0, 38.0)
	GetScreenElementDims Id = <Id>
	if (<width> > 180)
		SetScreenElementProps Id = <Id> Scale = 1
		fit_text_in_rectangle Id = <Id> Dims = (165.0, 33.0) Pos = (497.0, 298.0)
	endif
	CreateScreenElement {
		<text_params>
		Id = om_text_4
		Text = "MANAGE BAND"
		Pos = (498.0, 342.0)
		Scale = 0.7
		event_handlers = [
			{Focus options_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose options_select_manage_band}
			{pad_up options_change_index Params = {move = UP}}
			{pad_down options_change_index Params = {move = DOWN}}
			{pad_back menu_flow_go_back}
		]
	}
	<Id> :SetTags bg_pos = (500.0, 335.0) bg_dims = (192.0, 50.0)
	GetScreenElementDims Id = <Id>
	if (<width> > 185)
		SetScreenElementProps Id = <Id> Scale = 1
		fit_text_in_rectangle Id = <Id> Dims = (170.0, 45.0) Pos = (498.0, 342.0)
	endif
	if ($enable_saving = 0)
		saveload_props = {rgba = [128 128 128 255] tag_disabled}
	else
		saveload_props = {}
	endif
	CreateScreenElement {
		<text_params>
		Id = om_text_5
		Text = "SAVE / LOAD"
		Pos = (500.0, 388.0)
		Scale = 0.8
		event_handlers = [
			{Focus options_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action Params = {action = select_data_settings}}
			{pad_up options_change_index Params = {move = UP}}
			{pad_down options_change_index Params = {move = DOWN}}
			{pad_back menu_flow_go_back}
		]
		<saveload_props>
	}
	<Id> :SetTags bg_pos = (500.0, 380.0) bg_dims = (190.0, 50.0) <saveload_props>
	GetScreenElementDims Id = <Id>
	if (<width> > 190)
		SetScreenElementProps Id = <Id> Scale = 1
		fit_text_in_rectangle Id = <Id> Dims = (175.0, 45.0) Pos = (500.0, 388.0)
	endif
	if ($is_demo_mode = 1)
		demo_mode_disable = {rgba = [128 128 128 255] tag_disabled}
	else
		demo_mode_disable = {}
	endif
	CreateScreenElement {
		<text_params>
		Id = om_text_6
		Text = "VIDEOS"
		Pos = (490.0, 433.0)
		Scale = 0.9
		event_handlers = [
			{Focus options_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action Params = {action = select_bonus_videos}}
			{pad_up options_change_index Params = {move = UP}}
			{pad_down options_change_index Params = {move = DOWN}}
			{pad_back menu_flow_go_back}
		]
		<demo_mode_disable>
	}
	<Id> :SetTags bg_pos = (495.0, 425.0) bg_dims = (190.0, 50.0) <demo_mode_disable>
	GetScreenElementDims Id = <Id>
	if (<width> > 190)
		SetScreenElementProps Id = <Id> Scale = 1
		fit_text_in_rectangle Id = <Id> Dims = (175.0, 45.0) Pos = (490.0, 433.0)
	endif
	CreateScreenElement {
		<text_params>
		Id = om_text_7
		Text = "THE STORE"
		Pos = (485.0, 474.0)
		Scale = 0.6
		event_handlers = [
			{Focus options_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action Params = {action = select_store}}
			{pad_up options_change_index Params = {move = UP}}
			{pad_down options_change_index Params = {move = DOWN}}
			{pad_back menu_flow_go_back}
		]
		<demo_mode_disable>
	}
	<Id> :SetTags bg_pos = (489.0, 470.0) bg_dims = (185.0, 35.0) <demo_mode_disable>
	GetScreenElementDims Id = <Id>
	if (<width> > 185)
		SetScreenElementProps Id = <Id> Scale = 1
		fit_text_in_rectangle Id = <Id> Dims = (170.0, 30.0) Pos = (485.0, 474.0)
	endif
	CreateScreenElement {
		<text_params>
		Id = om_text_8
		Text = "TOP ROCKERS"
		Pos = (490.0, 520.0)
		Scale = 0.8
		event_handlers = [
			{Focus options_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action Params = {action = select_top_rockers}}
			{pad_up options_change_index Params = {move = UP}}
			{pad_down options_change_index Params = {move = DOWN}}
			{pad_back menu_flow_go_back}
		]
	}
	<Id> :SetTags bg_pos = (490.0, 513.0) bg_dims = (190.0, 50.0)
	GetScreenElementDims Id = <Id>
	if (<width> > 190)
		SetScreenElementProps Id = <Id> Scale = 1
		fit_text_in_rectangle Id = <Id> Dims = (175.0, 45.0) Pos = (490.0, 520.0)
	endif
	CreateScreenElement {
		<text_params>
		Id = om_text_9
		Text = "CHEATS"
		Pos = (480.0, 561.0)
		Scale = 0.6
		event_handlers = [
			{Focus options_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action Params = {action = select_cheats}}
			{pad_up options_change_index Params = {move = UP}}
			{pad_down options_change_index Params = {move = DOWN}}
			{pad_back menu_flow_go_back}
		]
	}
	<Id> :SetTags bg_pos = (488.0, 555.0) bg_dims = (185.0, 40.0)
	GetScreenElementDims Id = <Id>
	if (<width> > 185)
		SetScreenElementProps Id = <Id> Scale = 1
		fit_text_in_rectangle Id = <Id> Dims = (170.0, 35.0) Pos = (480.0, 561.0)
	endif
	displaySprite \{PARENT = om_container
		tex = tape_H_03
		Pos = (420.0, 590.0)
		Scale = 0.5
		Z = 20}
	displaySprite {
		PARENT = <Id>
		tex = tape_H_03
		Pos = (5.0, 5.0)
		rgba = [0 0 0 128]
		Z = 19
	}
	displaySprite \{PARENT = om_container
		tex = tape_H_04
		Pos = (325.0, 100.0)
		Scale = 0.5
		Z = 20
		Rot_Angle = -20}
	displaySprite {
		PARENT = <Id>
		tex = tape_H_04
		Pos = (5.0, 5.0)
		rgba = [0 0 0 128]
		Z = 19
	}
	displaySprite \{PARENT = om_container
		tex = tape_V_02
		Pos = (840.0, 380.0)
		Scale = 0.5
		Z = 20}
	displaySprite {
		PARENT = <Id>
		tex = tape_V_02
		Pos = (5.0, 5.0)
		rgba = [0 0 0 128]
		Z = 19
	}
	displaySprite \{PARENT = om_container
		tex = Venue_Overlay
		Pos = (0.0, 0.0)
		Dims = (1280.0, 720.0)
		Z = 50}
	Change \{menu_options_current_index = 1}
	LaunchEvent \{Type = Focus
		Target = om_text_1}
	Change \{user_control_pill_text_color = [
			0
			0
			0
			255
		]}
	Change \{user_control_pill_color = [
			180
			180
			180
			255
		]}
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

script options_select_manage_band 
	ui_flow_manager_respond_to_action \{action = select_manage_band}
	Change \{options_for_manage_band = 1}
endscript

script anim_float 
	if NOT ScreenElementExists \{Id = options_monster}
		return
	endif
	GetScreenElementProps \{Id = options_monster}
	base_pos = <Pos>
	options_monster :DoMorph \{Pos = {
			(0.0, 20.0)
			Relative
		}
		Time = 0.5
		Motion = ease_in}
	begin
	options_monster :DoMorph \{Pos = {
			(0.0, -40.0)
			Relative
		}
		Time = 0.5
		Motion = ease_out}
	options_monster :DoMorph \{Pos = {
			(0.0, 40.0)
			Relative
		}
		Time = 0.5
		Motion = ease_in}
	repeat
endscript

script destroy_options_menu 
	clean_up_user_control_helpers
	destroy_menu_backdrop
	destroy_menu \{menu_id = om_container}
	destroy_menu \{menu_id = om_scroll}
endscript
menu_options_current_index = 0

script options_change_index \{move = UP}
	if (<move> = UP)
		if ($menu_options_current_index = 1)
			Change \{menu_options_current_index = 9}
		else
			Change menu_options_current_index = ($menu_options_current_index - 1)
		endif
	else
		if ($menu_options_current_index = 9)
			Change \{menu_options_current_index = 1}
		else
			Change menu_options_current_index = ($menu_options_current_index + 1)
		endif
	endif
	Index = ($menu_options_current_index)
	LaunchEvent Type = unfocus Target = <Id>
	FormatText ChecksumName = text_id 'om_text_%d' D = <Index>
	LaunchEvent Type = Focus Target = <text_id>
	<text_id> :GetTags
	if (GotParam tag_disabled)
		if (<move> = UP)
			LaunchEvent Type = pad_up Target = <text_id>
		else
			LaunchEvent Type = pad_down Target = <text_id>
		endif
		return
	endif
	generic_menu_up_or_down_sound
endscript

script options_menu_hilight 
	Index = ($menu_options_current_index)
	GetTags
	GetScreenElementProps Id = <Id>
	SetScreenElementProps Id = om_black_bg Pos = <bg_pos> Dims = <bg_dims>
	retail_menu_focus
endscript
