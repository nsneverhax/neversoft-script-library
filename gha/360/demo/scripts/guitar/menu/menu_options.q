options_menu_font = text_a5
g_options_start_pos = (460.0, 100.0)
options_menu_index = 1

script create_options_menu 
	demo_mode_disable = {rgba = [128 128 128 255] tag_disabled}
	change \{options_for_manage_band = 0}
	change \{current_num_players = 1}
	font_size = 0.95
	bluish = [130 160 175 255]
	create_menu_backdrop \{texture = venue_bg}
	createscreenelement \{type = containerelement
		parent = root_window
		id = om_container
		scale = 1.1
		pos = (-20.0, -20.0)}
	set_focus_color \{color = white220}
	set_unfocus_color \{color = black}
	change \{options_menu_index = 1}
	rot = 3
	displaysprite parent = om_container tex = options_main_poster pos = (640.0, 340.0) dims = (600.0, 600.0) just = [center center] rot_angle = <rot>
	displaysprite parent = om_container id = om_black_bg tex = options_main_highlight pos = (500.0, 210.0) dims = (180.0, 30.0) rgba = [50 0 0 255] z = 9 just = [center center] rot_angle = <rot>
	displaytext parent = om_container text = "OPTIONS" pos = (700.0, 105.0) scale = 1.9 just = [center center] rgba = [0 0 20 255] font = text_a11_large z = 10 rot = <rot> noshadow
	displaytext parent = om_container text = "OPTIONS" pos = (695.0, 110.0) scale = 1.9 just = [center center] rgba = [191 237 226 255] font = text_a11_large z = 9 rot = <rot> noshadow
	createscreenelement {
		type = spriteelement
		parent = om_container
		id = options_monster_wings
		texture = options_main_monster_wings
		pos = (730.0, 330.0)
		dims = (256.0, 256.0)
		z_priority = 15
		just = [center center]
		rot_angle = <rot>
	}
	runscriptonscreenelement \{id = options_monster_wings
		anim_float
		params = {
			lag = 0.2
		}}
	createscreenelement {
		type = spriteelement
		parent = om_container
		id = options_monster
		texture = options_main_monster
		pos = (735.0, 330.0)
		dims = (256.0, 256.0)
		z_priority = 16
		just = [center center]
		rot_angle = <rot>
	}
	runscriptonscreenelement \{id = options_monster
		anim_float}
	text_params = {parent = om_container type = textelement font = ($options_menu_font) rgba = ($menu_unfocus_color) scale = <font_size> rot_angle = <rot> z_priority = 10 exclusive_device = ($primary_controller)}
	createscreenelement {
		<text_params>
		id = om_text_1
		text = "AUDIO"
		pos = (500.0, 210.0)
		scale = 0.8
		event_handlers = [
			{focus options_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_audio_settings}}
			{pad_up options_change_index params = {move = up}}
			{pad_down options_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
		<demo_mode_disable>
	}
	<id> :settags bg_pos = (507.0, 205.0) bg_dims = (190.0, 40.0) <demo_mode_disable>
	getscreenelementdims id = <id>
	if (<width> > 190)
		setscreenelementprops id = <id> scale = 1
		fit_text_in_rectangle id = <id> dims = (175.0, 35.0) pos = (500.0, 210.0)
	endif
	createscreenelement {
		<text_params>
		id = om_text_2
		text = "CALIBRATE LAG"
		pos = (503.0, 255.0)
		scale = 0.7
		event_handlers = [
			{focus options_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_calibrate_lag}}
			{pad_up options_change_index params = {move = up}}
			{pad_down options_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
	}
	<id> :settags bg_pos = (500.0, 247.0) bg_dims = (192.0, 50.0)
	getscreenelementdims id = <id>
	if (<width> > 190)
		setscreenelementprops id = <id> scale = 1
		fit_text_in_rectangle id = <id> dims = (175.0, 45.0) pos = (503.0, 255.0)
	endif
	createscreenelement {
		<text_params>
		id = om_text_3
		text = "CONTROLLER"
		pos = (497.0, 298.0)
		scale = 0.7
		event_handlers = [
			{focus options_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_controller_settings}}
			{pad_up options_change_index params = {move = up}}
			{pad_down options_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
	}
	<id> :settags bg_pos = (500.0, 290.0) bg_dims = (180.0, 38.0)
	getscreenelementdims id = <id>
	if (<width> > 180)
		setscreenelementprops id = <id> scale = 1
		fit_text_in_rectangle id = <id> dims = (165.0, 33.0) pos = (497.0, 298.0)
	endif
	createscreenelement {
		<text_params>
		id = om_text_4
		text = "MANAGE BAND"
		pos = (498.0, 342.0)
		scale = 0.7
		event_handlers = [
			{focus options_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose options_select_manage_band}
			{pad_up options_change_index params = {move = up}}
			{pad_down options_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
		<demo_mode_disable>
	}
	<id> :settags bg_pos = (500.0, 335.0) bg_dims = (192.0, 50.0) <demo_mode_disable>
	getscreenelementdims id = <id>
	if (<width> > 185)
		setscreenelementprops id = <id> scale = 1
		fit_text_in_rectangle id = <id> dims = (170.0, 45.0) pos = (498.0, 342.0)
	endif
	if ($enable_saving = 0)
		saveload_props = {rgba = [128 128 128 255] tag_disabled}
	else
		saveload_props = {}
	endif
	createscreenelement {
		<text_params>
		id = om_text_5
		text = "SAVE / LOAD"
		pos = (500.0, 388.0)
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
		<demo_mode_disable>
	}
	<id> :settags bg_pos = (500.0, 380.0) bg_dims = (190.0, 50.0) <saveload_props> <demo_mode_disable>
	getscreenelementdims id = <id>
	if (<width> > 190)
		setscreenelementprops id = <id> scale = 1
		fit_text_in_rectangle id = <id> dims = (175.0, 45.0) pos = (500.0, 388.0)
	endif
	createscreenelement {
		<text_params>
		id = om_text_6
		text = "VIDEOS"
		pos = (490.0, 433.0)
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
	<id> :settags bg_pos = (495.0, 425.0) bg_dims = (190.0, 50.0) <demo_mode_disable>
	getscreenelementdims id = <id>
	if (<width> > 190)
		setscreenelementprops id = <id> scale = 1
		fit_text_in_rectangle id = <id> dims = (175.0, 45.0) pos = (490.0, 433.0)
	endif
	createscreenelement {
		<text_params>
		id = om_text_7
		text = "THE VAULT"
		pos = (485.0, 474.0)
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
	<id> :settags bg_pos = (489.0, 470.0) bg_dims = (185.0, 35.0) <demo_mode_disable>
	getscreenelementdims id = <id>
	if (<width> > 185)
		setscreenelementprops id = <id> scale = 1
		fit_text_in_rectangle id = <id> dims = (170.0, 30.0) pos = (485.0, 474.0)
	endif
	createscreenelement {
		<text_params>
		id = om_text_8
		text = "TOP ROCKERS"
		pos = (490.0, 520.0)
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
	<id> :settags bg_pos = (490.0, 513.0) bg_dims = (190.0, 50.0)
	getscreenelementdims id = <id>
	if (<width> > 190)
		setscreenelementprops id = <id> scale = 1
		fit_text_in_rectangle id = <id> dims = (175.0, 45.0) pos = (490.0, 520.0)
	endif
	createscreenelement {
		<text_params>
		id = om_text_9
		text = "CHEATS"
		pos = (480.0, 561.0)
		scale = 0.6
		event_handlers = [
			{focus options_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_cheats}}
			{pad_up options_change_index params = {move = up}}
			{pad_down options_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
		<demo_mode_disable>
	}
	<id> :settags bg_pos = (488.0, 555.0) bg_dims = (185.0, 40.0) <demo_mode_disable>
	getscreenelementdims id = <id>
	if (<width> > 185)
		setscreenelementprops id = <id> scale = 1
		fit_text_in_rectangle id = <id> dims = (170.0, 35.0) pos = (480.0, 561.0)
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
		pos = (325.0, 100.0)
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
	change \{menu_options_current_index = 2}
	launchevent \{type = focus
		target = om_text_2}
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

script anim_float \{lag = 0}
	gettags
	if NOT screenelementexists id = <id>
		printf \{"anim_float script: NO SUCH SCREEN ELEMENT"}
		return
	endif
	wait <lag> seconds
	getscreenelementprops id = <id>
	base_pos = <pos>
	domorph \{pos = {
			(0.0, 20.0)
			relative
		}
		time = 0.5
		motion = ease_in}
	begin
	domorph \{pos = {
			(0.0, -40.0)
			relative
		}
		time = 0.5
		motion = ease_out}
	domorph \{pos = {
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
			change \{menu_options_current_index = 9}
		else
			change menu_options_current_index = ($menu_options_current_index - 1)
		endif
	else
		if ($menu_options_current_index = 9)
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
