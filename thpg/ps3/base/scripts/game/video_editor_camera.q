ve_camera_types = [
	`default`
	user
	goal
	lock_board
	lock_skater
	lock_skater_left
	lock_skater_right
	user_look_at
	user_follow
	user_static
]
ve_camera_names = {
	`default` = "Default"
	user = "User"
	goal = "Goal Cam"
	lock_board = "Lock To Board"
	lock_skater = "Lock To Skater"
	lock_skater_left = "Lock To Skater Left"
	lock_skater_right = "Lock To Skater Right"
	user_look_at = "User Track"
	user_follow = "User Follow"
	user_static = "User Static"
}
ve_usercam_rot_speed = 1.5
ve_usercam_zoom_speed = 7.5
ve_camera_extra_rot_decay = 2.0
ve_user_cam_max_distance = 40.0
ve_user_cam_min_distance = 2.0
ve_user_cam_collision_move = 0.2
ve_user_cam_ylock_min = 0.35000002
ve_user_cam_ylock_max = 0.65000004
ve_user_cam_ylock_lerp_speed = 50.0
ve_igc_col_vec_add = (0.0, 1.0, 0.0)
ve_igc_col_normal_move = 0.2
ve_cam_feeler_moveaway = 0.2

script ve_cam_control 
	printf 've_cam_control - start'
	switch <camera_type>
		case user_look_at
		case user_static
		start_pos = <camera_pos>
		case goal
		start_pos = (<goal_camera_morph>.pos)
		case user_follow
		default
		<my_object> :obj_getposition
		start_pos = (<pos> + (0.0, 1.0, 0.0))
	endswitch
	if gotparam start_pos
		obj_setposition position = <start_pos>
		ccam_domorph {
			pos = <start_pos>
			quat = (0.22144, -0.455478, 0.114262)
			fov = 72.0
			motion = linear
		}
	endif
	if gotparam seek
		motion = linear
	else
		motion = smooth
		if (<camera_type> = goal)
			ccam_enablehandcam shakeenabled = false driftenabled = false
		else
			ccam_enablehandcam shakeenabled = false driftenabled = true
		endif
		ccam_sethandcamparams {
			$cinematic_camera_default_handcam_params
		}
	endif
	ccam_setcollision true videoeditor = 1
	switch <camera_type>
		case lock_board
		ccam_domorph {
			lockto = <my_object>
			locktobone = bone_board_deck
			locktoworldorientation
			pos = (0.85406804, 0.764265, -0.7162729)
			quat = (0.22144, -0.455478, 0.114262)
			fov = 72.0
			motion = <motion>
		}
		case lock_skater
		ccam_domorph {
			lockto = <my_object>
			lookatbone = bone_pelvis
			pos = (0.6474991, 0.70392996, -2.392589)
			quat = (-0.025806, -0.041940995, -0.0010820001)
			fov = 78.0
			motion = <motion>
		}
		case lock_skater_left
		ccam_domorph {
			lockto = <my_object>
			pos = (2.6153967, 1.205001, -0.59564793)
			quat = (0.038509, -0.6038691, 0.029225998)
			fov = 72.0
			motion = <motion>
		}
		case lock_skater_right
		ccam_domorph {
			lockto = <my_object>
			pos = (-2.9888518, 1.0656009, 0.91522396)
			quat = (0.015723, 0.82136697, -0.022663001)
			fov = 72.0
			motion = <motion>
		}
		case user_look_at
		ccam_domorph {
			lookat = <my_object>
			pos = <camera_pos>
			lookatbone = bone_pelvis
			locktoworldorientation
			quat = <camera_quat>
			fov = <camera_fov>
			motion = <motion>
		}
		case user_follow
		begin
		<my_object> :obj_getposition
		pos = (<pos> + <camera_pos>)
		ccam_domorph {
			LockToWorld
			lookat = <my_object>
			lookatbone = bone_pelvis
			pos = <pos>
			fov = <camera_fov>
			motion = <motion>
			quat = <camera_quat>
			locktoworldorientation
		}
		printf 'follow!'
		wait 1 gameframe
		if NOT <my_object> :anim_animnodeexists id = bodytimer
			break
		endif
		if <my_object> :anim_command target = bodytimer command = timer_isanimcomplete
			break
		endif
		repeat
		case user_static
		ccam_domorph {
			lockto = world
			pos = <camera_pos>
			quat = <camera_quat>
			fov = <camera_fov>
			motion = <motion>
			locktoworldorientation
		}
		case goal
		ccam_domorph {
			lookat = <my_object>
			lookatbone = bone_pelvis
			<goal_camera_morph>
		}
	endswitch
	if <my_object> :anim_animnodeexists id = bodytimer
		<my_object> :anim_command target = bodytimer command = timer_wait
	endif
	printf 've_cam_control - end'
endscript
ve_camera_is_ready_start = 0
ve_camera_is_ready_cancelled = 0
ve_camera_is_recording = 0

script ve_camera_is_ready 
	change \{ve_camera_is_ready_start = 1}
	change \{ve_camera_is_ready_cancelled = 0}
endscript

script ve_camera_rec_cancelled 
	if ($ve_camera_is_recording = 1)
		change \{ve_record_usercam_cancelled = 1}
	endif
	change \{ve_camera_is_ready_start = 1}
	change \{ve_camera_is_ready_cancelled = 1}
	change \{ve_camera_is_recording = 0}
endscript

script ui_video_editor_choose_custom_camera_pos ReplayActorName = ($ve_preview_actor) cameraname = ($ve_preview_camera)
	ve_pop_editing_buss
	skater :hide
	skater :pause
	printf 'ui_video_editor_choose_custom_camera_pos'
	change ve_camera_is_ready_cancelled = 0
	change ve_camera_is_recording = 1
	if screenelementexists id = Video_Editor_Container
		doscreenelementmorph {
			id = Video_Editor_Container
			alpha = 0
		}
		setscreenelementprops id = Video_Editor_Container block_events
		Video_Editor_Container :setprops hide
		killspawnedscript name = ui_video_editor_analog_stick_watcher
	endif
	printf 'ui_video_editor_choose_custom_camera_pos - Starting'
	<ReplayActorName> :unhide
	skater :hide
	setactivecamera id = <cameraname> viewport = 0
	ve_begin_user_free_cam actor = <ReplayActorName> camera = <cameraname> disable_static_rot = <disable_static_rot>
	tod_proxim_reapply_lightfx
	createscreenelement {
		parent = root_window
		type = containerelement
		id = ve_camera_pos_ui
		event_handlers = [
			{pad_choose ve_camera_is_ready}
			{pad_back ve_camera_is_ready}
		]
	}
	change ve_camera_is_ready_start = 0
	change ve_playback_allow_ui_stop = 1
	accept_text = "\\m0 Use This Camera"
	title_text = "Choose your user camera position"
	if gotparam recorded_cam
		accept_text = "\\m0 Start recording from here"
		title_text = "Choose your camera start position"
	endif
	if ($ui_gameplay_show_hud = 1)
		createscreenelement {
			parent = ve_camera_pos_ui
			type = textelement
			just = [center center]
			font = text_a1
			pos = (640.0, 50.0)
			scale = (0.9, 0.7)
			text = <title_text>
			rgba = [240 240 240 180]
			not_focusable
			shadow
			shadow_rgba = [0 0 0 255]
			shadow_offs = (2.0, 2.0)
		}
		createscreenelement {
			parent = ve_camera_pos_ui
			type = textelement
			just = [left center]
			font = text_a1
			pos = (80.0, 620.0)
			scale = (0.9, 0.7)
			text = "\\m1 Cancel"
			rgba = [240 240 240 180]
			not_focusable
			shadow
			shadow_rgba = [0 0 0 255]
			shadow_offs = (2.0, 2.0)
		}
		createscreenelement {
			parent = ve_camera_pos_ui
			type = textelement
			just = [left center]
			font = text_a1
			pos = (80.0, 650.0)
			scale = (0.9, 0.7)
			text = <accept_text>
			rgba = [240 240 240 180]
			not_focusable
			shadow
			shadow_rgba = [0 0 0 255]
			shadow_offs = (2.0, 2.0)
		}
		ve_camera_add_button_prompts ypos = 590 disable_static_rot = <disable_static_rot> parent = ve_camera_pos_ui
	endif
	launchevent type = focus target = ve_camera_pos_ui
	begin
	if ($ve_camera_is_ready_start = 1)
		if ($ve_camera_is_ready_cancelled = 1)
			cancelled = 1
		endif
		break
	endif
	ve_user_cam_fov_control cameraname = <cameraname>
	wait 1 gameframe ignoreslomo
	repeat
	<cameraname> :gethfov
	kill_panel_message_if_it_exists id = ve_camera_pos_ui
	ve_get_cam_offset use_camera = <use_camera> subject = <ReplayActorName>
	printf 'ui_video_editor_choose_custom_camera_pos - Chosen Position'
	if NOT gotparam recorded_cam
		ve_end_user_free_cam camera = <cameraname>
	endif
	if screenelementexists id = Video_Editor_Container
		setscreenelementprops id = Video_Editor_Container unblock_events
		doscreenelementmorph {
			id = Video_Editor_Container
			alpha = 1
		}
		Video_Editor_Container :setprops unhide
		spawnscriptlater ui_video_editor_analog_stick_watcher
	endif
	if NOT gotparam recorded_cam
		setactivecamera id = skatercam0 viewport = 0
	endif
	printf 'ui_video_editor_choose_custom_camera_pos - Cleaned up, returning....'
	if gotparam cancelled
		return false
	else
		return true camera_pos = <camera_pos> camera_fov = <hfov> camera_quat = <camera_quat>
	endif
endscript

script ve_camera_add_button_prompts 
	createscreenelement {
		parent = <parent>
		type = textelement
		just = [left center]
		font = text_a1
		pos = ((80.0, 0.0) + (<ypos> * (0.0, 1.0)))
		scale = (0.9, 0.7)
		text = "\\bg\\bh Change FOV"
		rgba = [240 240 240 180]
		not_focusable
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (2.0, 2.0)
	}
	if NOT gotparam disable_static_rot
		ypos = (<ypos> - 30)
		createscreenelement {
			parent = <parent>
			type = textelement
			just = [left center]
			font = text_a1
			pos = ((80.0, 0.0) + (<ypos> * (0.0, 1.0)))
			scale = (0.9, 0.7)
			text = "\\be\\bf Tilt Camera"
			rgba = [200 200 200 255]
			not_focusable
			shadow
			shadow_rgba = [0 0 0 255]
			shadow_offs = (2.0, 2.0)
		}
		ypos = (<ypos> - 30)
		createscreenelement {
			parent = <parent>
			type = textelement
			just = [left center]
			font = text_a1
			pos = ((80.0, 0.0) + (<ypos> * (0.0, 1.0)))
			scale = (0.9, 0.7)
			text = "\\m5 + \\bk Rotate Camera"
			rgba = [200 200 200 255]
			not_focusable
			shadow
			shadow_rgba = [0 0 0 255]
			shadow_offs = (2.0, 2.0)
		}
	endif
	ypos = (<ypos> - 30)
	createscreenelement {
		parent = <parent>
		type = textelement
		just = [left center]
		font = text_a1
		pos = ((80.0, 0.0) + (<ypos> * (0.0, 1.0)))
		scale = (0.9, 0.7)
		text = "\\bl Orbit Skater"
		rgba = [200 200 200 255]
		not_focusable
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (2.0, 2.0)
	}
	ypos = (<ypos> - 30)
	createscreenelement {
		parent = <parent>
		type = textelement
		just = [left center]
		font = text_a1
		pos = ((80.0, 0.0) + (<ypos> * (0.0, 1.0)))
		scale = (0.9, 0.7)
		text = "\\bk Zoom"
		rgba = [200 200 200 255]
		not_focusable
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (2.0, 2.0)
	}
endscript

script ve_get_cam_offset 
	getcamoffset
	if gotparam \{use_camera}
		if (<use_camera> = user_follow)
			<subject> :obj_getposition
			actor_pos = <pos>
			ReplayCamera :obj_getposition
			pos = (<pos> - <actor_pos>)
		endif
	endif
	return camera_pos = <pos> camera_quat = <quat>
endscript

script ve_user_cam_fov_control cameraname = ReplayCamera
	<cameraname> :gethfov
	fov_change_rate = 3.0
	fov_max = 120.0
	fov_min = 40.0
	if <cameraname> :vecam_getdistance
		if getanalogueinfo
			lefttrigger = ((<lefttrigger> + 128.0) / 256.0)
			righttrigger = ((<righttrigger> + 128.0) / 256.0)
			if (<lefttrigger> > 0.1)
				hfov = (<hfov> - (<fov_change_rate> * <lefttrigger>))
				if (<hfov> < <fov_min>)
					hfov = <fov_min>
				endif
				<cameraname> :sethfov hfov = <hfov>
				printf 'changed fov=%f' f = <hfov>
			endif
			if (<righttrigger> > 0.1)
				hfov = (<hfov> + (<fov_change_rate> * <righttrigger>))
				if (<hfov> > <fov_max>)
					hfov = <fov_max>
				endif
				<cameraname> :sethfov hfov = <hfov>
				printf 'changed fov=%f' f = <hfov>
			endif
		endif
		distance_limit_start = 5.0
		distance_limit_end = 20.0
		fov_cap = 80.0
		if (<distance> > <distance_limit_start>)
			if (<hfov> > <fov_cap>)
				if (<distance> > <distance_limit_end>)
					printf 'FOV capped=%f' f = <fov_cap>
					hfov = <fov_cap>
				else
					linearmap result = newfov from = <fov_max> to = <fov_cap> basedon = <distance> lowerbound = <distance_limit_start> upperbound = <distance_limit_end>
					if (<hfov> > <newfov>)
						printf 'FOV capped=%f' f = <newfov>
						hfov = <newfov>
					endif
				endif
				<cameraname> :sethfov hfov = <hfov>
			endif
		endif
	endif
endscript

script ve_begin_user_free_cam 
	<camera> :vecam_enable subject = <actor> inputobject = skater disable_static_rot = <disable_static_rot>
	skater :unpause
	skater :pausephysics
	<camera> :unpause
	skater :enableplayerinput
endscript

script ve_end_user_free_cam 
	skater :disableplayerinput
	skater :unpausephysics
	skater :pause
	<camera> :vecam_disable
	<camera> :pause
endscript

script ve_is_custom_pos_camera 
	switch (<camera>)
		case user_look_at
		case user_follow
		case user_static
		return \{true}
		default
		return \{false}
	endswitch
endscript
