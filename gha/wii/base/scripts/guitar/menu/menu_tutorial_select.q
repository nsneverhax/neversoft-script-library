tutorial_select_menu_font = text_a4
menu_tutorial_select_num_items = 3

script create_tutorial_select_menu 
	disable_pause
	Change \{rich_presence_context = presence_tutorial}
	CreateScreenElement {
		parent = root_window
		id = ts_container
		Type = ContainerElement
		Pos = (0.0, 0.0)
		exclusive_device = ($primary_controller)
	}
	new_menu \{scrollid = ts_scroll
		vmenuid = ts_vmenu
		font = $video_settings_menu_font
		menu_pos = (310.0, 400.0)
		spacing = 5
		text_left
		focus_color = dark_red
		unfocus_color = blueish_grey}
	displayText \{parent = ts_container
		Pos = (800.0, 572.0)
		just = [
			center
			center
		]
		text = 'TUTORIALS'
		Scale = 1.5
		rgba = [
			180
			180
			180
			255
		]
		font = $video_settings_menu_font
		noshadow}
	create_menu_backdrop \{texture = Venue_BG}
	displaySprite \{parent = ts_container
		tex = options_video_poster
		Pos = (640.0, 365.0)
		dims = (1024.0, 512.0)
		just = [
			center
			center
		]
		z = 1
		font = $video_settings_menu_font}
	displaySprite \{tex = tape_H_02
		parent = ts_container
		Pos = (275.0, 120.0)
		dims = (160.0, 64.0)
		rot_angle = -40
		just = [
			center
			center
		]
		z = 7}
	displaySprite {
		tex = tape_H_02
		parent = <id>
		Pos = (5.0, 5.0)
		rgba = [0 0 0 128]
		z = 6
	}
	displaySprite \{tex = tape_H_02
		parent = ts_container
		Pos = (980.0, 110.0)
		dims = (160.0, 64.0)
		rot_angle = 20
		just = [
			center
			center
		]
		z = 7}
	displaySprite {
		tex = tape_H_02
		parent = <id>
		Pos = (5.0, 5.0)
		rgba = [0 0 0 128]
		z = 6
	}
	displaySprite \{parent = ts_container
		id = ts_hilite
		tex = white
		Pos = (285.0, 415.0)
		rgba = [
			185
			190
			200
			255
		]
		dims = (305.0, 35.0)
		z = 2}
	text_params = {parent = ts_vmenu Type = TextElement font = $video_settings_menu_font rgba = ($menu_unfocus_color) Scale = 0.75 z_priority = 3}
	CreateScreenElement {
		<text_params>
		id = ts_basic
		text = 'BASIC LESSONS'
		event_handlers = [
			{focus ts_focus params = {item = basic hilite_pos = (275.0, 414.0) hilite_dims = (245.0, 35.0)}}
			{unfocus ts_unfocus params = {item = basic}}
			{pad_choose menu_tutorial_select_choose_basic}
		]
	}
	CreateScreenElement {
		<text_params>
		id = ts_star
		text = 'STAR POWER'
		event_handlers = [
			{focus ts_focus params = {item = star hilite_pos = (275.0, 449.0) hilite_dims = (215.0, 35.0)}}
			{unfocus ts_unfocus params = {item = star}}
			{pad_choose menu_tutorial_select_choose_star_power}
		]
	}
	CreateScreenElement {
		<text_params>
		id = ts_battle
		text = 'GUITAR BATTLE'
		event_handlers = [
			{focus ts_focus params = {item = battle hilite_pos = (275.0, 484.0) hilite_dims = (255.0, 35.0)}}
			{unfocus ts_unfocus params = {item = battle}}
			{pad_choose menu_tutorial_select_choose_battle}
		]
	}
	CreateScreenElement {
		<text_params>
		id = ts_advanced
		text = 'ADVANCED TECHNIQUES'
		event_handlers = [
			{focus ts_focus params = {item = advanced hilite_pos = (275.0, 519.0) hilite_dims = (368.0, 35.0)}}
			{unfocus ts_unfocus params = {item = advanced}}
			{pad_choose menu_tutorial_select_choose_advanced}
		]
	}
	add_user_control_helper \{text = 'SELECT'
		button = green
		z = 100}
	add_user_control_helper \{text = 'BACK'
		button = red
		z = 100}
	add_user_control_helper \{text = 'UP/DOWN'
		button = strumbar
		z = 100}
	GetGlobalTags \{training}
	complete_color = [150 20 50 255]
	not_complete_color = $menu_unfocus_color
	if (<basic_lesson> = complete)
		ts_add_skull Pos = (292.0, 432.0) Color = <complete_color>
	else
		ts_add_skull Pos = (292.0, 432.0) Color = <not_complete_color>
	endif
	if (<star_power_lesson> = complete)
		ts_add_skull Pos = (292.0, 467.0) Color = <complete_color>
	else
		ts_add_skull Pos = (292.0, 467.0) Color = <not_complete_color>
	endif
	if (<guitar_battle_lesson> = complete)
		ts_add_skull Pos = (292.0, 502.0) Color = <complete_color>
	else
		ts_add_skull Pos = (292.0, 502.0) Color = <not_complete_color>
	endif
	if (<advanced_techniques_lesson> = complete)
		ts_add_skull Pos = (292.0, 537.0) Color = <complete_color>
	else
		ts_add_skull Pos = (292.0, 537.0) Color = <not_complete_color>
	endif
	if ($select_battle_tutorial = 1)
		LaunchEvent \{Type = pad_down}
		LaunchEvent \{Type = pad_down}
		Change \{select_battle_tutorial = 0}
	else
		retail_menu_focus \{id = ts_basic}
	endif
endscript

script ts_add_skull 
	displaySprite {
		tex = Toprockers_Skull
		parent = ts_container
		Pos = <Pos>
		dims = (24.0, 24.0)
		rot_angle = 0
		just = [center center]
		rgba = <Color>
		z = 7
	}
	displaySprite {
		tex = Toprockers_Skull
		parent = ts_container
		Pos = <Pos>
		dims = (26.0, 26.0)
		rot_angle = 0
		just = [center center]
		rgba = [0 0 0 255]
		z = 6
	}
endscript

script ts_focus 
	retail_menu_focus
	GetTags
	<id> :GetTags
	GetScreenElementDims id = <id>
	<hilite_dims> = ((<width> + 38) * (1.0, 0.0) + (<hilite_dims>.(0.0, 1.0)) * (0.0, 1.0))
	if ScreenElementExists \{id = ts_hilite}
		ts_hilite :SetProps Pos = <hilite_pos>
		ts_hilite :SetProps dims = <hilite_dims>
	endif
endscript

script ts_unfocus 
	retail_menu_unfocus
	return
endscript

script destroy_tutorial_select_menu 

	restore_start_key_binding
	clean_up_user_control_helpers
	destroy_menu \{menu_id = ts_container}
	destroy_menu_backdrop
	destroy_menu \{menu_id = ts_scroll}
	destroy_menu \{menu_id = ts_basic}
	destroy_menu \{menu_id = ts_star}
	destroy_menu \{menu_id = ts_battle}
	destroy_menu \{menu_id = ts_advanced}
endscript

script menu_tutorial_select_choose_basic 
	set_training_script \{Name = training_basic_tutorial_script}
	ui_flow_manager_respond_to_action \{action = continue}
endscript

script menu_tutorial_select_choose_star_power 
	set_training_script \{Name = training_star_power_tutorial_script}
	ui_flow_manager_respond_to_action \{action = continue}
endscript

script menu_tutorial_select_choose_battle 
	set_training_script \{Name = training_battle_tutorial_script}
	ui_flow_manager_respond_to_action \{action = continue}
endscript

script menu_tutorial_select_choose_advanced 
	set_training_script \{Name = training_advanced_techniques_tutorial_script}
	ui_flow_manager_respond_to_action \{action = continue}
endscript
