
script create_dip_switch_test_menu 
	create_menu_backdrop \{texture = Venue_BG}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = dip_switch_test_container
		Pos = (0.0, 0.0)}
	displaySprite \{parent = dip_switch_test_container
		tex = Options_Calibrate_Paper
		Pos = (540.0, -90.0)
		dims = (900.0, 900.0)
		z = 1}
	displaySprite \{parent = dip_switch_test_container
		tex = data_settings_poster
		Pos = (400.0, 360.0)
		dims = (450.0, 900.0)
		just = [
			center
			center
		]
		rot_angle = -2}
	displaySprite \{parent = dip_switch_test_container
		tex = Tape_V_01
		Pos = (660.0, 85.0)
		dims = (96.0, 192.0)
		z = 5
		rot_angle = 170}
	displaySprite \{parent = dip_switch_test_container
		tex = Tape_V_01
		rgba = [
			0
			0
			0
			128
		]
		Pos = (663.0, 88.0)
		dims = (96.0, 192.0)
		z = 5
		rot_angle = 170}
	displaySprite \{parent = dip_switch_test_container
		tex = tape_H_02
		Pos = (170.0, 645.0)
		dims = (127.0, 64.0)
		z = 5
		rot_angle = -4}
	displaySprite \{parent = dip_switch_test_container
		tex = tape_H_02
		rgba = [
			0
			0
			0
			128
		]
		Pos = (173.0, 648.0)
		dims = (127.0, 64.0)
		z = 5
		rot_angle = -4}
	text_dip_switch_test_desc_root_loc = (390.0, 105.0)
	displayText parent = dip_switch_test_container text = "DIP SWITCHES" Pos = <text_dip_switch_test_desc_root_loc> Scale = 1 just = [center center] rgba = [250 250 250 255] font = text_a11_Large z = 10 rot = -2
	dip_switch_bg_color = [32 32 32 255]
	dip_switch_lane_color = [64 64 64 255]
	dip_switch_switch_color = [224 224 224 255]
	dip_switch_text_color = [224 224 224 255]
	dip_switch_desc_color = [32 32 32 255]
	dip_switch_disabled_color = [192 192 192 255]
	dip_switch_state_color = [32 32 32 255]
	CreateScreenElement {
		Type = SpriteElement
		parent = dip_switch_test_container
		rgba = <dip_switch_bg_color>
		id = dip_switch_bg
		Pos = (820.0, 360.0)
		dims = (128.0, 544.0)
		just = [center center]
		z_priority = 10
	}
	CreateScreenElement {
		Type = TextElement
		parent = dip_switch_bg
		rgba = <dip_switch_text_color>
		id = dip_switch_text_on
		Pos = (8.0, 524.0)
		just = [center center]
		z_priority = 11
		font = text_a4
		text = "On"
		rot_angle = -90
		Scale = 0.75
	}
	CreateScreenElement {
		Type = TextElement
		parent = dip_switch_bg
		rgba = <dip_switch_text_color>
		id = dip_switch_text_8
		Pos = (104.0, 48.0)
		just = [center center]
		z_priority = 11
		font = text_a4
		text = "8"
		rot_angle = -90
		Scale = 0.75
	}
	CreateScreenElement {
		Type = TextElement
		parent = dip_switch_bg
		rgba = <dip_switch_text_color>
		id = dip_switch_text_7
		Pos = (104.0, 112.0)
		just = [center center]
		z_priority = 11
		font = text_a4
		text = "7"
		rot_angle = -90
		Scale = 0.75
	}
	CreateScreenElement {
		Type = TextElement
		parent = dip_switch_bg
		rgba = <dip_switch_text_color>
		id = dip_switch_text_6
		Pos = (104.0, 176.0)
		just = [center center]
		z_priority = 11
		font = text_a4
		text = "6"
		rot_angle = -90
		Scale = 0.75
	}
	CreateScreenElement {
		Type = TextElement
		parent = dip_switch_bg
		rgba = <dip_switch_text_color>
		id = dip_switch_text_5
		Pos = (104.0, 240.0)
		just = [center center]
		z_priority = 11
		font = text_a4
		text = "5"
		rot_angle = -90
		Scale = 0.75
	}
	CreateScreenElement {
		Type = TextElement
		parent = dip_switch_bg
		rgba = <dip_switch_text_color>
		id = dip_switch_text_4
		Pos = (104.0, 304.0)
		just = [center center]
		z_priority = 11
		font = text_a4
		text = "4"
		rot_angle = -90
		Scale = 0.75
	}
	CreateScreenElement {
		Type = TextElement
		parent = dip_switch_bg
		rgba = <dip_switch_text_color>
		id = dip_switch_text_3
		Pos = (104.0, 368.0)
		just = [center center]
		z_priority = 11
		font = text_a4
		text = "3"
		rot_angle = -90
		Scale = 0.75
	}
	CreateScreenElement {
		Type = TextElement
		parent = dip_switch_bg
		rgba = <dip_switch_text_color>
		id = dip_switch_text_2
		Pos = (104.0, 432.0)
		just = [center center]
		z_priority = 11
		font = text_a4
		text = "2"
		rot_angle = -90
		Scale = 0.75
	}
	CreateScreenElement {
		Type = TextElement
		parent = dip_switch_bg
		rgba = <dip_switch_text_color>
		id = dip_switch_text_1
		Pos = (104.0, 496.0)
		just = [center center]
		z_priority = 11
		font = text_a4
		text = "1"
		rot_angle = -90
		Scale = 0.75
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = dip_switch_bg
		rgba = <dip_switch_lane_color>
		id = dip_switch_lane_8
		Pos = (32.0, 32.0)
		dims = (64.0, 32.0)
		just = [left top]
		z_priority = 11
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = dip_switch_bg
		rgba = <dip_switch_lane_color>
		id = dip_switch_lane_7
		Pos = (32.0, 96.0)
		dims = (64.0, 32.0)
		just = [left top]
		z_priority = 11
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = dip_switch_bg
		rgba = <dip_switch_lane_color>
		id = dip_switch_lane_6
		Pos = (32.0, 160.0)
		dims = (64.0, 32.0)
		just = [left top]
		z_priority = 11
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = dip_switch_bg
		rgba = <dip_switch_lane_color>
		id = dip_switch_lane_5
		Pos = (32.0, 224.0)
		dims = (64.0, 32.0)
		just = [left top]
		z_priority = 11
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = dip_switch_bg
		rgba = <dip_switch_lane_color>
		id = dip_switch_lane_4
		Pos = (32.0, 288.0)
		dims = (64.0, 32.0)
		just = [left top]
		z_priority = 11
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = dip_switch_bg
		rgba = <dip_switch_lane_color>
		id = dip_switch_lane_3
		Pos = (32.0, 352.0)
		dims = (64.0, 32.0)
		just = [left top]
		z_priority = 11
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = dip_switch_bg
		rgba = <dip_switch_lane_color>
		id = dip_switch_lane_2
		Pos = (32.0, 416.0)
		dims = (64.0, 32.0)
		just = [left top]
		z_priority = 11
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = dip_switch_bg
		rgba = <dip_switch_lane_color>
		id = dip_switch_lane_1
		Pos = (32.0, 480.0)
		dims = (64.0, 32.0)
		just = [left top]
		z_priority = 11
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = dip_switch_bg
		rgba = <dip_switch_switch_color>
		id = dip_switch_switch_8
		Pos = (64.0, 32.0)
		dims = (32.0, 32.0)
		just = [left top]
		z_priority = 12
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = dip_switch_bg
		rgba = <dip_switch_switch_color>
		id = dip_switch_switch_7
		Pos = (64.0, 96.0)
		dims = (32.0, 32.0)
		just = [left top]
		z_priority = 12
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = dip_switch_bg
		rgba = <dip_switch_switch_color>
		id = dip_switch_switch_6
		Pos = (64.0, 160.0)
		dims = (32.0, 32.0)
		just = [left top]
		z_priority = 12
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = dip_switch_bg
		rgba = <dip_switch_switch_color>
		id = dip_switch_switch_5
		Pos = (64.0, 224.0)
		dims = (32.0, 32.0)
		just = [left top]
		z_priority = 12
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = dip_switch_bg
		rgba = <dip_switch_switch_color>
		id = dip_switch_switch_4
		Pos = (64.0, 288.0)
		dims = (32.0, 32.0)
		just = [left top]
		z_priority = 12
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = dip_switch_bg
		rgba = <dip_switch_switch_color>
		id = dip_switch_switch_3
		Pos = (64.0, 352.0)
		dims = (32.0, 32.0)
		just = [left top]
		z_priority = 12
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = dip_switch_bg
		rgba = <dip_switch_switch_color>
		id = dip_switch_switch_2
		Pos = (64.0, 416.0)
		dims = (32.0, 32.0)
		just = [left top]
		z_priority = 12
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = dip_switch_bg
		rgba = <dip_switch_switch_color>
		id = dip_switch_switch_1
		Pos = (64.0, 480.0)
		dims = (32.0, 32.0)
		just = [left top]
		z_priority = 12
	}
	CreateScreenElement {
		Type = TextElement
		parent = dip_switch_bg
		rgba = <dip_switch_disabled_color>
		id = dip_switch_state_8
		Pos = (160.0, 40.0)
		just = [left center]
		z_priority = 11
		font = text_a4
		text = "Off"
		Scale = 0.75
	}
	CreateScreenElement {
		Type = TextElement
		parent = dip_switch_bg
		rgba = <dip_switch_disabled_color>
		id = dip_switch_state_7
		Pos = (160.0, 104.0)
		just = [left center]
		z_priority = 11
		font = text_a4
		text = "Off"
		Scale = 0.75
	}
	CreateScreenElement {
		Type = TextElement
		parent = dip_switch_bg
		rgba = <dip_switch_disabled_color>
		id = dip_switch_state_6
		Pos = (160.0, 168.0)
		just = [left center]
		z_priority = 11
		font = text_a4
		text = "Off"
		Scale = 0.75
	}
	CreateScreenElement {
		Type = TextElement
		parent = dip_switch_bg
		rgba = <dip_switch_disabled_color>
		id = dip_switch_state_5
		Pos = (160.0, 232.0)
		just = [left center]
		z_priority = 11
		font = text_a4
		text = "Off"
		Scale = 0.75
	}
	CreateScreenElement {
		Type = TextElement
		parent = dip_switch_bg
		rgba = <dip_switch_disabled_color>
		id = dip_switch_state_4
		Pos = (160.0, 296.0)
		just = [left center]
		z_priority = 11
		font = text_a4
		text = "Off"
		Scale = 0.75
	}
	CreateScreenElement {
		Type = TextElement
		parent = dip_switch_bg
		rgba = <dip_switch_disabled_color>
		id = dip_switch_state_3
		Pos = (160.0, 360.0)
		just = [left center]
		z_priority = 11
		font = text_a4
		text = "Off"
		Scale = 0.75
	}
	CreateScreenElement {
		Type = TextElement
		parent = dip_switch_bg
		rgba = <dip_switch_state_color>
		id = dip_switch_state_2
		Pos = (160.0, 424.0)
		just = [left center]
		z_priority = 11
		font = text_a4
		text = "Off"
		Scale = 0.75
	}
	CreateScreenElement {
		Type = TextElement
		parent = dip_switch_bg
		rgba = <dip_switch_state_color>
		id = dip_switch_state_1
		Pos = (160.0, 488.0)
		just = [left center]
		z_priority = 11
		font = text_a4
		text = "Off"
		Scale = 0.75
	}
	CreateScreenElement {
		Type = TextElement
		parent = dip_switch_bg
		rgba = <dip_switch_disabled_color>
		id = dip_switch_desc_8
		Pos = (240.0, 40.0)
		just = [left center]
		z_priority = 11
		font = text_a4
		text = "Not In Use"
		Scale = 0.75
	}
	CreateScreenElement {
		Type = TextElement
		parent = dip_switch_bg
		rgba = <dip_switch_disabled_color>
		id = dip_switch_desc_7
		Pos = (240.0, 104.0)
		just = [left center]
		z_priority = 11
		font = text_a4
		text = "Not In Use"
		Scale = 0.75
	}
	CreateScreenElement {
		Type = TextElement
		parent = dip_switch_bg
		rgba = <dip_switch_disabled_color>
		id = dip_switch_desc_6
		Pos = (240.0, 168.0)
		just = [left center]
		z_priority = 11
		font = text_a4
		text = "Not In Use"
		Scale = 0.75
	}
	CreateScreenElement {
		Type = TextElement
		parent = dip_switch_bg
		rgba = <dip_switch_disabled_color>
		id = dip_switch_desc_5
		Pos = (240.0, 232.0)
		just = [left center]
		z_priority = 11
		font = text_a4
		text = "Not In Use"
		Scale = 0.75
	}
	CreateScreenElement {
		Type = TextElement
		parent = dip_switch_bg
		rgba = <dip_switch_disabled_color>
		id = dip_switch_desc_4
		Pos = (240.0, 296.0)
		just = [left center]
		z_priority = 11
		font = text_a4
		text = "Not In Use"
		Scale = 0.75
	}
	CreateScreenElement {
		Type = TextElement
		parent = dip_switch_bg
		rgba = <dip_switch_disabled_color>
		id = dip_switch_desc_3
		Pos = (240.0, 360.0)
		just = [left center]
		z_priority = 11
		font = text_a4
		text = "Not In Use"
		Scale = 0.75
	}
	CreateScreenElement {
		Type = TextElement
		parent = dip_switch_bg
		rgba = <dip_switch_desc_color>
		id = dip_switch_desc_2
		Pos = (240.0, 424.0)
		just = [left center]
		z_priority = 11
		font = text_a4
		text = "Family Mode 2"
		Scale = 0.75
	}
	CreateScreenElement {
		Type = TextElement
		parent = dip_switch_bg
		rgba = <dip_switch_desc_color>
		id = dip_switch_desc_1
		Pos = (240.0, 488.0)
		just = [left center]
		z_priority = 11
		font = text_a4
		text = "Family Mode 1"
		Scale = 0.75
	}
	displayText parent = dip_switch_bg text = "Power cycle for changes to take effect." Pos = (192.0, 568.0) Scale = 0.5 just = [center center] rgba = <dip_switch_desc_color> font = text_a4 z = 11 noshadow
	event_handlers = [
		{pad_back ui_flow_manager_respond_to_action params = {action = go_back}}
	]
	new_menu {
		parent = dip_switch_test_container
		scrollid = menu_dip_switch_test
		vmenuid = vmenu_dip_switch_test
		menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
		exclusive_device = None
	}
	LaunchEvent \{Type = focus
		target = menu_dip_switch_test}
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
	add_user_control_helper \{text = "BACK"
		button = red
		z = 100}
	SpawnScriptNow \{update_dip_switch_test_menu}
endscript

script destroy_dip_switch_test_menu 
	KillSpawnedScript \{Name = update_dip_switch_test_menu}
	clean_up_user_control_helpers
	destroy_menu_backdrop
	destroy_menu \{menu_id = menu_dip_switch_test}
	destroy_menu \{menu_id = dip_switch_test_container}
endscript

script update_dip_switch_test_menu 
	begin
	dip_switches = 0
	checkdipswitches
	if (<dip_switches_8> != 0)
		dip_switch_switch_8 :SetProps \{Pos = (32.0, 32.0)}
		dip_switch_state_8 :SetProps \{text = "On"}
	else
		dip_switch_switch_8 :SetProps \{Pos = (64.0, 32.0)}
		dip_switch_state_8 :SetProps \{text = "Off"}
	endif
	if (<dip_switches_7> != 0)
		dip_switch_switch_7 :SetProps \{Pos = (32.0, 96.0)}
		dip_switch_state_7 :SetProps \{text = "On"}
	else
		dip_switch_switch_7 :SetProps \{Pos = (64.0, 96.0)}
		dip_switch_state_7 :SetProps \{text = "Off"}
	endif
	if (<dip_switches_6> != 0)
		dip_switch_switch_6 :SetProps \{Pos = (32.0, 160.0)}
		dip_switch_state_6 :SetProps \{text = "On"}
	else
		dip_switch_switch_6 :SetProps \{Pos = (64.0, 160.0)}
		dip_switch_state_6 :SetProps \{text = "Off"}
	endif
	if (<dip_switches_5> != 0)
		dip_switch_switch_5 :SetProps \{Pos = (32.0, 224.0)}
		dip_switch_state_5 :SetProps \{text = "On"}
	else
		dip_switch_switch_5 :SetProps \{Pos = (64.0, 224.0)}
		dip_switch_state_5 :SetProps \{text = "Off"}
	endif
	if (<dip_switches_4> != 0)
		dip_switch_switch_4 :SetProps \{Pos = (32.0, 288.0)}
		dip_switch_state_4 :SetProps \{text = "On"}
	else
		dip_switch_switch_4 :SetProps \{Pos = (64.0, 288.0)}
		dip_switch_state_4 :SetProps \{text = "Off"}
	endif
	if (<dip_switches_3> != 0)
		dip_switch_switch_3 :SetProps \{Pos = (32.0, 352.0)}
		dip_switch_state_3 :SetProps \{text = "On"}
	else
		dip_switch_switch_3 :SetProps \{Pos = (64.0, 352.0)}
		dip_switch_state_3 :SetProps \{text = "Off"}
	endif
	if (<dip_switches_2> != 0)
		dip_switch_switch_2 :SetProps \{Pos = (32.0, 416.0)}
		dip_switch_state_2 :SetProps \{text = "On"}
	else
		dip_switch_switch_2 :SetProps \{Pos = (64.0, 416.0)}
		dip_switch_state_2 :SetProps \{text = "Off"}
	endif
	if (<dip_switches_1> != 0)
		dip_switch_switch_1 :SetProps \{Pos = (32.0, 480.0)}
		dip_switch_state_1 :SetProps \{text = "On"}
	else
		dip_switch_switch_1 :SetProps \{Pos = (64.0, 480.0)}
		dip_switch_state_1 :SetProps \{text = "Off"}
	endif
	Wait \{1
		gameframes}
	repeat
endscript
