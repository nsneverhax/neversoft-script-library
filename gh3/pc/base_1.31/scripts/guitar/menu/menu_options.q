options_menu_font = text_a5
g_options_start_pos = (460.0, 100.0)
options_menu_index = 1

script create_options_menu 
	change \{options_for_manage_band = 0}
	change \{current_num_players = 1}
	font_size = 0.95
	bluish = [130 160 175 255]
	set_focus_color \{rgba = [
			223
			223
			223
			255
		]}
	set_unfocus_color rgba = <red>
	create_menu_backdrop \{texture = venue_bg}
	createscreenelement \{type = containerelement
		parent = root_window
		id = om_container
		scale = 1.1
		pos = (-20.0, -20.0)}
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
	change \{options_menu_index = 1}
	rot = 3
	displaysprite parent = om_container tex = options_main_poster pos = (640.0, 340.0) dims = (600.0, 600.0) just = [center center] rot_angle = <rot>
	displaysprite parent = om_container id = om_black_bg tex = options_main_highlight pos = (500.0, 210.0) dims = (180.0, 30.0) rgba = [50 0 0 255] z = 9 just = [center center] rot_angle = <rot>
	titlescale = 1.7
	if ((german) || (spanish))
		titlescale = 1.5
	endif
	displaytext parent = om_container text = "OPTIONS" pos = (733.0, 110.0) scale = <titlescale> just = [center center] rgba = [50 0 0 255] font = text_a11_large z = 10 rot = (<rot> -3) noshadow
	displaytext parent = om_container text = "OPTIONS" pos = (728.0, 115.0) scale = <titlescale> just = [center center] rgba = [160 130 105 255] font = text_a11_large z = 9 rot = (<rot> -2) noshadow
	displaysprite parent = om_container id = options_monster tex = options_main_monster pos = (735.0, 320.0) dims = (256.0, 512.0) z = 15 just = [center center] rot_angle = <rot>
	runscriptonscreenelement \{id = options_monster
		anim_float}
	text_params = {parent = om_container type = textelement font = ($options_menu_font) rgba = ($menu_unfocus_color) scale = <font_size> rot_angle = <rot> z_priority = 10 exclusive_device = ($primary_controller)}
	createscreenelement {
		<text_params>
		id = om_text_1
		text = "AUDIO"
		pos = (506.0, 100.0)
		scale = 0.85
		event_handlers = [
			{focus options_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_audio_settings}}
			{pad_up options_change_index params = {move = up}}
			{pad_down options_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
	}
	<id> :settags bg_pos = (512.0, 93.0) bg_dims = (190.0, 53.0)
	getscreenelementdims id = <id>
	if (<width> > 190)
		setscreenelementprops id = <id> scale = 1
		fit_text_in_rectangle id = <id> dims = (175.0, 35.0) pos = (506.0, 100.0)
	endif
	createscreenelement {
		<text_params>
		id = om_text_2
		text = "GRAPHICS"
		pos = (501.0, 140.0)
		scale = 0.7
		event_handlers = [
			{focus options_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_gfx_settings}}
			{pad_up options_change_index params = {move = up}}
			{pad_down options_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
	}
	<id> :settags bg_pos = (510.0, 135.0) bg_dims = (190.0, 39.0)
	getscreenelementdims id = <id>
	if (<width> > 190)
		setscreenelementprops id = <id> scale = 1
		fit_text_in_rectangle id = <id> dims = (175.0, 35.0) pos = (501.0, 140.0)
	endif
	createscreenelement {
		<text_params>
		id = om_text_3
		text = "CALIBRATE VIDEO LAG"
		pos = (507.0, 184.0)
		scale = 0.5
		event_handlers = [
			{focus options_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_calibrate_lag}}
			{pad_up options_change_index params = {move = up}}
			{pad_down options_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
	}
	<id> :settags bg_pos = (508.0, 178.0) bg_dims = (192.0, 52.0)
	getscreenelementdims id = <id>
	if (<width> > 190)
		setscreenelementprops id = <id> scale = 1
		fit_text_in_rectangle id = <id> dims = (175.0, 40.0) pos = (507.0, 184.0)
	endif
	createscreenelement {
		<text_params>
		id = om_text_4
		text = "CALIBRATE AUDIO LAG"
		pos = (503.0, 225.0)
		scale = 0.5
		event_handlers = [
			{focus options_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = winport_select_calibrate_lag}}
			{pad_up options_change_index params = {move = up}}
			{pad_down options_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
	}
	<id> :settags bg_pos = (505.0, 221.0) bg_dims = (192.0, 38.0)
	getscreenelementdims id = <id>
	if (<width> > 190)
		setscreenelementprops id = <id> scale = 1
		fit_text_in_rectangle id = <id> dims = (175.0, 40.0) pos = (503.0, 225.0)
	endif
	createscreenelement {
		<text_params>
		id = om_text_5
		text = "CONTROLLER"
		pos = (497.0, 263.0)
		scale = 0.6
		event_handlers = [
			{focus options_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_controller_settings}}
			{pad_up options_change_index params = {move = up}}
			{pad_down options_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
	}
	<id> :settags bg_pos = (500.0, 258.0) bg_dims = (186.0, 38.0)
	getscreenelementdims id = <id>
	if (<width> > 180)
		setscreenelementprops id = <id> scale = 1
		fit_text_in_rectangle id = <id> dims = (165.0, 33.0) pos = (497.0, 266.0)
	endif
	createscreenelement {
		<text_params>
		id = om_text_6
		text = "MANAGE BAND"
		pos = (498.0, 307.0)
		scale = 0.7
		event_handlers = [
			{focus options_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose options_select_manage_band}
			{pad_up options_change_index params = {move = up}}
			{pad_down options_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
	}
	<id> :settags bg_pos = (502.0, 302.0) bg_dims = (190.0, 55.0)
	getscreenelementdims id = <id>
	if (<width> > 185)
		setscreenelementprops id = <id> scale = 1
		fit_text_in_rectangle id = <id> dims = (170.0, 45.0) pos = (498.0, 307.0)
	endif
	if ($enable_saving = 0)
		saveload_props = {rgba = [128 128 128 255] tag_disabled}
	else
		saveload_props = {}
	endif
	createscreenelement {
		<text_params>
		id = om_text_7
		text = "SAVE / LOAD"
		pos = (500.0, 354.0)
		scale = 0.8
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
	<id> :settags bg_pos = (500.0, 348.0) bg_dims = (190.0, 50.0) <saveload_props>
	getscreenelementdims id = <id>
	if (<width> > 190)
		setscreenelementprops id = <id> scale = 1
		fit_text_in_rectangle id = <id> dims = (175.0, 45.0) pos = (500.0, 354.0)
	endif
	if ($is_demo_mode = 1)
		demo_mode_disable = {rgba = [128 128 128 255] tag_disabled}
	else
		demo_mode_disable = {}
	endif
	createscreenelement {
		<text_params>
		id = om_text_8
		text = "VIDEOS"
		pos = (490.0, 400.0)
		scale = 0.9
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
	<id> :settags bg_pos = (495.0, 392.0) bg_dims = (190.0, 50.0) <demo_mode_disable>
	getscreenelementdims id = <id>
	if (<width> > 190)
		setscreenelementprops id = <id> scale = 1
		fit_text_in_rectangle id = <id> dims = (175.0, 45.0) pos = (490.0, 410.0)
	endif
	createscreenelement {
		<text_params>
		id = om_text_9
		text = "THE STORE"
		pos = (485.0, 440.0)
		scale = 0.6
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
	<id> :settags bg_pos = (491.0, 436.0) bg_dims = (185.0, 35.0) <demo_mode_disable>
	getscreenelementdims id = <id>
	if (<width> > 185)
		setscreenelementprops id = <id> scale = 1
		fit_text_in_rectangle id = <id> dims = (170.0, 30.0) pos = (485.0, 440.0)
	endif
	createscreenelement {
		<text_params>
		id = om_text_10
		text = "TOP ROCKERS"
		pos = (490.0, 487.0)
		scale = 0.8
		event_handlers = [
			{focus options_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_top_rockers}}
			{pad_up options_change_index params = {move = up}}
			{pad_down options_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
	}
	<id> :settags bg_pos = (490.0, 480.0) bg_dims = (190.0, 50.0)
	getscreenelementdims id = <id>
	if (<width> > 190)
		setscreenelementprops id = <id> scale = 1
		fit_text_in_rectangle id = <id> dims = (175.0, 45.0) pos = (490.0, 487.0)
	endif
	createscreenelement {
		<text_params>
		id = om_text_11
		text = "CHEATS"
		pos = (480.0, 527.0)
		scale = 0.6
		event_handlers = [
			{focus options_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_cheats}}
			{pad_up options_change_index params = {move = up}}
			{pad_down options_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
	}
	<id> :settags bg_pos = (488.0, 521.0) bg_dims = (185.0, 40.0)
	getscreenelementdims id = <id>
	if (<width> > 185)
		setscreenelementprops id = <id> scale = 1
		fit_text_in_rectangle id = <id> dims = (170.0, 35.0) pos = (480.0, 527.0)
	endif
	createscreenelement {
		<text_params>
		id = om_text_12
		text = "AUTOMATIC LOGIN"
		pos = (480.0, 560.0)
		scale = 0.5
		event_handlers = [
			{focus options_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_auto_login}}
			{pad_up options_change_index params = {move = up}}
			{pad_down options_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
	}
	<id> :settags bg_pos = (486.0, 558.0) bg_dims = (185.0, 40.0)
	getscreenelementdims id = <id>
	if (<width> > 185)
		setscreenelementprops id = <id> scale = 1
		fit_text_in_rectangle id = <id> dims = (170.0, 35.0) pos = (480.0, 560.0)
	endif
	displaysprite \{parent = om_container
		tex = tape_h_03
		pos = (420.0, 590.0)
		scale = 0.5
		z = 20}
	displaysprite {
		parent = <id>
		tex = tape_h_03
		pos = (5.0, 5.0)
		rgba = [0 0 0 128]
		z = 19
	}
	displaysprite \{parent = om_container
		tex = tape_h_04
		pos = (325.0, 70.0)
		scale = 0.5
		z = 20
		rot_angle = -20}
	displaysprite {
		parent = <id>
		tex = tape_h_04
		pos = (5.0, 5.0)
		rgba = [0 0 0 128]
		z = 19
	}
	displaysprite \{parent = om_container
		tex = tape_v_02
		pos = (840.0, 380.0)
		scale = 0.5
		z = 20}
	displaysprite {
		parent = <id>
		tex = tape_v_02
		pos = (5.0, 5.0)
		rgba = [0 0 0 128]
		z = 19
	}
	displaysprite \{parent = om_container
		tex = venue_overlay
		pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		z = 50}
	change \{menu_options_current_index = 1}
	launchevent \{type = focus
		target = om_text_1}
	change \{user_control_pill_text_color = [
			0
			0
			0
			255
		]}
	change \{user_control_pill_color = [
			180
			180
			180
			255
		]}
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

script options_select_manage_band 
	ui_flow_manager_respond_to_action \{action = select_manage_band}
	change \{options_for_manage_band = 1}
endscript

script anim_float 
	if NOT screenelementexists \{id = options_monster}
		return
	endif
	getscreenelementprops \{id = options_monster}
	base_pos = <pos>
	options_monster :domorph \{pos = {
			(0.0, 20.0)
			relative
		}
		time = 0.5
		motion = ease_in}
	begin
	options_monster :domorph \{pos = {
			(0.0, -40.0)
			relative
		}
		time = 0.5
		motion = ease_out}
	options_monster :domorph \{pos = {
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
	formattext checksumname = last_text_id 'om_text_%d' d = ($menu_options_current_index)
	if (<move> = up)
		if ($menu_options_current_index = 1)
			change \{menu_options_current_index = 12}
		else
			change menu_options_current_index = ($menu_options_current_index - 1)
		endif
	else
		if ($menu_options_current_index = 12)
			change \{menu_options_current_index = 1}
		else
			change menu_options_current_index = ($menu_options_current_index + 1)
		endif
	endif
	index = ($menu_options_current_index)
	if NOT is_disabled id = <last_text_id>
		launchevent type = unfocus target = <id>
	endif
	formattext checksumname = text_id 'om_text_%d' d = <index>
	<text_id> :gettags
	if (gotparam tag_disabled)
		if (<move> = up)
			launchevent type = pad_up target = <text_id>
		else
			launchevent type = pad_down target = <text_id>
		endif
		return
	endif
	launchevent type = focus target = <text_id>
	generic_menu_up_or_down_sound
endscript

script is_disabled 
	<id> :gettags
	if (gotparam tag_disabled)
		return \{true}
	else
		return \{false}
	endif
endscript

script options_menu_hilight 
	index = ($menu_options_current_index)
	gettags
	getscreenelementprops id = <id>
	setscreenelementprops id = om_black_bg pos = <bg_pos> dims = <bg_dims>
	retail_menu_focus
endscript
