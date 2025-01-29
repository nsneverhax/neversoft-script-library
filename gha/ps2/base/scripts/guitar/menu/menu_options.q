options_menu_font = text_a5
g_options_start_pos = (480.0, 100.0)
options_menu_index = 1

script create_options_menu 
	Change \{options_for_manage_band = 0}
	Change \{current_num_players = 1}
	font_size = 0.8
	bluish = [130 160 175 255]
	create_menu_backdrop \{texture = Venue_BG}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = om_container
		Scale = 1.1
		Pos = (-20.0, -20.0)}
	set_focus_color \{Color = white220}
	set_unfocus_color \{Color = black}
	Change \{options_menu_index = 1}
	rot = 3
	displaySprite parent = om_container tex = options_main_poster Pos = (640.0, 340.0) dims = (600.0, 600.0) just = [center center] rot_angle = <rot>
	displaySprite parent = om_container id = om_black_bg tex = options_main_highlight Pos = (500.0, 210.0) dims = (180.0, 30.0) rgba = [50 0 0 255] z = 9 just = [center center] rot_angle = <rot>
	displayText parent = om_container text = 'OPTIONS' Pos = (700.0, 105.0) Scale = 1.9 just = [center center] rgba = [0 0 20 255] font = text_a11_Large z = 10 rot = <rot> noshadow
	displayText parent = om_container text = 'OPTIONS' Pos = (695.0, 110.0) Scale = 1.9 just = [center center] rgba = [191 237 226 255] font = text_a11_Large z = 9 rot = <rot> noshadow
	CreateScreenElement {
		Type = SpriteElement
		parent = om_container
		id = options_monster_wings
		texture = options_main_monster_wings
		Pos = (730.0, 330.0)
		dims = (256.0, 256.0)
		z_priority = 15
		just = [center center]
		rot_angle = <rot>
	}
	RunScriptOnScreenElement \{id = options_monster_wings
		anim_float}
	CreateScreenElement {
		Type = SpriteElement
		parent = om_container
		id = options_monster
		texture = options_main_monster
		Pos = (735.0, 330.0)
		dims = (256.0, 256.0)
		z_priority = 16
		just = [center center]
		rot_angle = <rot>
	}
	RunScriptOnScreenElement \{id = options_monster
		anim_float}
	text_params = {parent = om_container Type = TextElement font = ($options_menu_font) rgba = ($menu_unfocus_color) Scale = <font_size> rot_angle = <rot> z_priority = 10 exclusive_device = ($primary_controller)}
	CreateScreenElement {
		<text_params>
		id = om_text_1
		text = 'AUDIO'
		Pos = (504.0, 207.0)
		Scale = 0.76
		event_handlers = [
			{focus options_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_audio_settings}}
			{pad_up options_change_index params = {move = up}}
			{pad_down options_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
	}
	<id> :SetTags bg_pos = (507.0, 206.0) bg_dims = (182.0, 38.0)
	GetScreenElementDims id = <id>
	if (<width> > 190)
		SetScreenElementProps id = <id> Scale = 1
		fit_text_in_rectangle id = <id> dims = (175.0, 35.0) Pos = (500.0, 210.0)
	endif
	CreateScreenElement {
		<text_params>
		id = om_text_2
		text = 'VIDEO'
		Pos = (502.0, 250.0)
		Scale = 0.9
		event_handlers = [
			{focus options_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = 0x0c97feb9}}
			{pad_up options_change_index params = {move = up}}
			{pad_down options_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
	}
	<id> :SetTags bg_pos = (504.0, 250.0) bg_dims = (184.0, 47.0)
	GetScreenElementDims id = <id>
	if (<width> > 190)
		SetScreenElementProps id = <id> Scale = 1
		fit_text_in_rectangle id = <id> dims = (175.0, 45.0) Pos = (503.0, 255.0)
	endif
	CreateScreenElement {
		<text_params>
		id = om_text_3
		text = 'CONTROLLER'
		Pos = (499.0, 295.0)
		Scale = 0.65000004
		event_handlers = [
			{focus options_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_controller_settings}}
			{pad_up options_change_index params = {move = up}}
			{pad_down options_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
	}
	<id> :SetTags bg_pos = (500.0, 292.0) bg_dims = (180.0, 35.0)
	GetScreenElementDims id = <id>
	if (<width> > 180)
		SetScreenElementProps id = <id> Scale = 1
		fit_text_in_rectangle id = <id> dims = (165.0, 33.0) Pos = (497.0, 298.0)
	endif
	CreateScreenElement {
		<text_params>
		id = om_text_4
		text = 'MANAGE BAND'
		Pos = (498.0, 339.0)
		Scale = 0.6
		event_handlers = [
			{focus options_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose options_select_manage_band}
			{pad_up options_change_index params = {move = up}}
			{pad_down options_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
	}
	<id> :SetTags bg_pos = (501.0, 335.0) bg_dims = (186.0, 52.0)
	GetScreenElementDims id = <id>
	if (<width> > 180)
		SetScreenElementProps id = <id> Scale = 1
		fit_text_in_rectangle id = <id> dims = (170.0, 28.0) Pos = (498.0, 342.0)
	endif
	if ($enable_saving = 0)
		saveload_props = {rgba = [128 128 128 255] tag_disabled}
	else
		saveload_props = {}
	endif
	CreateScreenElement {
		<text_params>
		id = om_text_5
		text = 'SAVE / LOAD'
		Pos = (497.0, 383.0)
		Scale = 0.65000004
		event_handlers = [
			{focus options_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_data_settings}}
			{pad_up options_change_index params = {move = up}}
			{pad_down options_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
		<saveload_props>
	}
	<id> :SetTags bg_pos = (496.0, 381.0) bg_dims = (184.0, 46.0) <saveload_props>
	GetScreenElementDims id = <id>
	if (<width> > 180)
		SetScreenElementProps id = <id> Scale = 1
		fit_text_in_rectangle id = <id> dims = (170.0, 28.0) Pos = (497.0, 383.0)
	endif
	if ($is_demo_mode = 1)
		demo_mode_disable = {rgba = [128 128 128 255] tag_disabled}
	else
		demo_mode_disable = {}
	endif
	CreateScreenElement {
		<text_params>
		id = om_text_6
		text = 'VIDEOS'
		Pos = (490.0, 427.0)
		Scale = 0.9
		event_handlers = [
			{focus options_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_bonus_videos}}
			{pad_up options_change_index params = {move = up}}
			{pad_down options_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
		<demo_mode_disable>
	}
	<id> :SetTags bg_pos = (495.0, 425.0) bg_dims = (184.0, 48.0) <demo_mode_disable>
	GetScreenElementDims id = <id>
	if (<width> > 190)
		SetScreenElementProps id = <id> Scale = 1
		fit_text_in_rectangle id = <id> dims = (175.0, 45.0) Pos = (490.0, 433.0)
	endif
	CreateScreenElement {
		<text_params>
		id = om_text_7
		text = 'THE VAULT'
		Pos = (490.0, 471.0)
		Scale = 0.6
		event_handlers = [
			{focus options_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_store}}
			{pad_up options_change_index params = {move = up}}
			{pad_down options_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
		<demo_mode_disable>
	}
	<id> :SetTags bg_pos = (492.0, 469.0) bg_dims = (180.0, 38.0) <demo_mode_disable>
	GetScreenElementDims id = <id>
	if (<width> > 185)
		SetScreenElementProps id = <id> Scale = 1
		fit_text_in_rectangle id = <id> dims = (170.0, 30.0) Pos = (485.0, 474.0)
	endif
	CreateScreenElement {
		<text_params>
		id = om_text_8
		text = 'TOP ROCKERS'
		Pos = (490.0, 516.0)
		Scale = 0.68
		event_handlers = [
			{focus options_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_top_rockers}}
			{pad_up options_change_index params = {move = up}}
			{pad_down options_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
	}
	<id> :SetTags bg_pos = (490.0, 513.0) bg_dims = (184.0, 48.0)
	GetScreenElementDims id = <id>
	if (<width> > 190)
		SetScreenElementProps id = <id> Scale = 1
		fit_text_in_rectangle id = <id> dims = (175.0, 45.0) Pos = (490.0, 520.0)
	endif
	CreateScreenElement {
		<text_params>
		id = om_text_9
		text = 'CHEATS'
		Pos = (482.0, 556.0)
		Scale = 0.6
		event_handlers = [
			{focus options_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_cheats}}
			{pad_up options_change_index params = {move = up}}
			{pad_down options_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
	}
	<id> :SetTags bg_pos = (488.0, 555.0) bg_dims = (184.0, 36.0)
	GetScreenElementDims id = <id>
	if (<width> > 185)
		SetScreenElementProps id = <id> Scale = 1
		fit_text_in_rectangle id = <id> dims = (170.0, 35.0) Pos = (480.0, 561.0)
	endif
	displaySprite \{parent = om_container
		tex = tape_H_03
		Pos = (420.0, 590.0)
		Scale = 0.5
		z = 20}
	displaySprite {
		parent = <id>
		tex = tape_H_03
		Pos = (5.0, 5.0)
		rgba = [0 0 0 128]
		z = 19
	}
	displaySprite \{parent = om_container
		tex = tape_H_04
		Pos = (325.0, 100.0)
		Scale = 0.5
		z = 20
		rot_angle = -20}
	displaySprite {
		parent = <id>
		tex = tape_H_04
		Pos = (5.0, 5.0)
		rgba = [0 0 0 128]
		z = 19
	}
	displaySprite \{parent = om_container
		tex = tape_V_02
		Pos = (840.0, 380.0)
		Scale = 0.5
		z = 20}
	displaySprite {
		parent = <id>
		tex = tape_V_02
		Pos = (5.0, 5.0)
		rgba = [0 0 0 128]
		z = 19
	}
	Change \{menu_options_current_index = 1}
	LaunchEvent \{Type = focus
		target = om_text_1}
	add_user_control_helper \{text = 'SELECT'
		button = green
		z = 100}
	add_user_control_helper \{text = 'BACK'
		button = red
		z = 100}
	add_user_control_helper \{text = 'UP/DOWN'
		button = strumbar
		z = 100}
endscript

script options_select_manage_band 
	ui_flow_manager_respond_to_action \{action = select_manage_band}
	Change \{options_for_manage_band = 1}
endscript

script anim_float \{lag = 0}
	GetTags
	if NOT ScreenElementExists id = <id>

		return
	endif
	Wait <lag> Seconds
	GetScreenElementProps id = <id>
	base_pos = <Pos>
	DoMorph \{Pos = {
			(0.0, 20.0)
			relative
		}
		time = 0.5
		motion = ease_in}
	begin
	DoMorph \{Pos = {
			(0.0, -40.0)
			relative
		}
		time = 0.5
		motion = ease_out}
	DoMorph \{Pos = {
			(0.0, 40.0)
			relative
		}
		time = 0.5
		motion = ease_in}
	repeat
endscript

script destroy_options_menu 
	clean_up_user_control_helpers
	destroy_menu_backdrop
	destroy_menu \{menu_id = om_container}
	destroy_menu \{menu_id = om_scroll}
endscript
menu_options_current_index = 0

script options_change_index \{move = up}
	formatText checksumName = last_text_id 'om_text_%d' d = ($menu_options_current_index)
	if (<move> = up)
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
	index = ($menu_options_current_index)
	if NOT is_disabled id = <last_text_id>
		LaunchEvent Type = unfocus target = <id>
	endif
	formatText checksumName = text_id 'om_text_%d' d = <index>
	<text_id> :GetTags
	if (GotParam tag_disabled)
		if (<move> = up)
			LaunchEvent Type = pad_up target = <text_id>
		else
			LaunchEvent Type = pad_down target = <text_id>
		endif
		return
	endif
	LaunchEvent Type = focus target = <text_id>
	generic_menu_up_or_down_sound
endscript

script is_disabled 
	<id> :GetTags
	if (GotParam tag_disabled)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script options_menu_hilight 
	index = ($menu_options_current_index)
	GetTags
	GetScreenElementProps id = <id>
	SetScreenElementProps id = om_black_bg Pos = <bg_pos> dims = <bg_dims>
	retail_menu_focus
endscript
