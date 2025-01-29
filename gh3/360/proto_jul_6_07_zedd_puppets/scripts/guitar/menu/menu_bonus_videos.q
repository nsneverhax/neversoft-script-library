
script create_bonus_videos_menu 
	create_menu_backdrop texture = venue_bg
	createscreenelement {
		type = containerelement
		parent = root_window
		id = bv_container
		pos = (0.0, 0.0)
	}
	displaysprite {
		parent = bv_container
		tex = options_videos_poster
		just = [center center]
		pos = (640.0, 320.0)
		dims = (850.0, 850.0)
		rot_angle = 3
		z = 51
	}
	displaysprite {
		parent = bv_container
		tex = white
		rgba = [220 100 100 255]
		just = [center center]
		pos = (640.0, 360.0)
		dims = (700.0, 700.0)
		rot_angle = 3
	}
	displaysprite {
		parent = bv_container
		id = bv_hilite
		tex = white
		rgba = [105 130 85 255]
		just = [center center]
		pos = (640.0, 360.0)
		dims = (700.0, 40.0)
		rot_angle = 4
		z = 49
	}
	displaysprite {
		parent = bv_container
		tex = toprockers_tape_1
		pos = (250.0, 130.0)
		rot_angle = 75
		dims = (192.0, 96.0)
		z = 100
	}
	displaysprite {
		parent = bv_container
		tex = toprockers_tape_1
		rgba = [0 0 0 128]
		pos = (255.0, 135.0)
		rot_angle = 75
		dims = (192.0, 96.0)
		z = 99
	}
	displaysprite {
		parent = bv_container
		tex = toprockers_tape_2
		pos = (1070.0, 270.0)
		rot_angle = 75
		dims = (192.0, 96.0)
		z = 100
		flip_v
	}
	displaysprite {
		parent = bv_container
		tex = toprockers_tape_1
		rgba = [0 0 0 128]
		pos = (1075.0, 275.0)
		rot_angle = 75
		dims = (192.0, 96.0)
		z = 99
		flip_v
	}
	new_menu scrollid = mbv_scroll vmenuid = mbv_vmenu menu_pos = (480.0, 130.0) text_left spacing = -12 rot_angle = 1
	text_params = {parent = mbv_vmenu type = textelement font = text_a3 rgba = [255 245 225 255] z_priority = 50 rot_angle = 3 scale = 1.2}
	createscreenelement {
		<text_params>
		text = "CREDITS"
		event_handlers = [
			{focus bv_morph_hilite params = {pos = (640.0, 195.0)}}
			{pad_choose ui_flow_manager_respond_to_action params = {action = select_credits}}
		]
	}
	createscreenelement {
		<text_params>
		text = "SLASH"
		event_handlers = [
			{focus bv_morph_hilite params = {pos = (640.0, 242.0)}}
			{pad_choose menu_bonus_videos_play_video params = {movie = 'singleplayer_02'}}
		]
	}
	createscreenelement {
		<text_params>
		text = "TOM MORELLO"
		event_handlers = [
			{focus bv_morph_hilite params = {pos = (640.0, 287.0)}}
			{pad_choose menu_bonus_videos_play_video params = {movie = 'singleplayer_03'}}
		]
	}
	createscreenelement {
		<text_params>
		text = "BRETT MICHAELS"
		event_handlers = [
			{focus bv_morph_hilite params = {pos = (640.0, 333.0)}}
			{pad_choose menu_bonus_videos_play_video params = {movie = 'singleplayer_04'}}
		]
	}
	createscreenelement {
		<text_params>
		text = "SEX PISTOLS"
		event_handlers = [
			{focus bv_morph_hilite params = {pos = (640.0, 380.0)}}
			{pad_choose menu_bonus_videos_play_video params = {movie = 'singleplayer_05'}}
		]
	}
	add_user_control_helper text = "SELECT" button = green z = 100
	add_user_control_helper text = "BACK" button = red z = 100
	add_user_control_helper text = "UP/DOWN" button = strumbar z = 100
endscript

script destroy_bonus_videos_menu 
	clean_up_user_control_helpers
	destroy_menu \{menu_id = bv_container}
	destroy_menu_backdrop
	destroy_menu \{menu_id = mbv_scroll}
endscript

script bv_morph_hilite \{time = 0.025}
	bv_hilite :domorph pos = (<pos> - (0.0, 20.0)) scale = (1.0, 0.25) time = <time> relative_scale
	bv_hilite :domorph pos = (<pos>) scale = 1 time = <time> relative_scale
endscript

script menu_bonus_videos_play_video \{movie = 'atvi'}
	playmovie {
		movie = <movie>
		textureslot = 0
		texturepri = 1000
		no_looping
		no_hold
	}
	begin
	if ismovieplaying \{textureslot = 0}
		ui_flow_manager_respond_to_action \{action = continue}
		break
	endif
	repeat
endscript

script on_options_video_play 
	spawnscriptnow \{0x1448301d}
endscript

script 0x1448301d 
	begin
	getbuttonspressed
	if NOT (<makes> = 0)
		spawnscriptnow \{ui_flow_manager_respond_to_action
			params = {
				action = continue
			}}
	endif
	if NOT ismovieplaying \{textureslot = 0}
		printf \{"Handling movie ended"}
		spawnscriptnow \{ui_flow_manager_respond_to_action
			params = {
				action = continue
			}}
	endif
	wait \{1
		gameframe}
	repeat
endscript

script end_options_video_play 
	killmovie \{textureslot = 0}
	killspawnedscript \{name = 0x1448301d}
endscript
