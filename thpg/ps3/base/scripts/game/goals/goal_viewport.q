
script goal_create_viewport_type type = none
	switch <type>
		case photo
		<vport_scale> = (0.3 * (16.0, 9.0))
		<vport_pos> = (510.0, 70.0)
		<extra_style> = goal_viewport_frame_filmer
		case race
		<vport_scale> = (0.2 * (16.0, 9.0))
		<vport_pos> = (525.0, 60.0)
		case film
		<vport_scale> = (0.3 * (16.0, 9.0))
		<vport_pos> = (510.0, 70.0)
		<extra_style> = goal_viewport_frame_filmer
		case demo
		<vport_pos> = (1048.0, 135.0)
		<vport_scale> = (0.6 * (16.0, 9.0))
		case rewards
		<vport_pos> = (900.0, 450.0)
		<vport_scale> = (0.8 * (16.0, 9.0))
		case rig_rewards
		<vport_pos> = (940.0, 520.0)
		<vport_scale> = (0.8 * (16.0, 9.0))
		case comp_intermission
		<vport_pos> = (250.0, 210.0)
		<vport_scale> = (0.62 * (16.0, 9.0))
		case unlock
		case story
		case pro
		case none
		default
		<vport_pos> = (1048.0, 135.0)
		<vport_scale> = (0.5 * (16.0, 9.0))
	endswitch
	removeparameter type
	goal_viewport_create <...>
endscript

script goal_viewport_create {
		viewport_style = viewport_element
		vport_pos = (1000.0, 150.0)
		vport_scale = (0.4 * (16.0, 9.0))
		fov = 72.0
		extra_style = goal_viewport_frame_create
		skater_visible = 1
		extra_style_rgba = [0 0 0 255]
		near_clip = 0.1
		far_clip = 100.0
	}
	if NOT insplitscreengame
		if screenelementexists id = goal_viewport_parent
			requireparams [goal_string] all
			if goal_viewport_parent :getsingletag current_appearance_priority
				if (<current_appearance_priority> < <appearance_priority>)
					printf 'WARNING: goal_viewport_create - not killing viewport due to priority: current is %a, you created %b' a = <current_appearance_priority> b = <appearance_priority>
					return
				endif
			endif
			goal_viewport_kill all
			goal_viewport_parent :obj_spawnscriptnow goal_viewport_spawned_create params = <...>
		else
			printf 'WARNING: goal_viewport_create - not creating viewport, no goal_viewport_parent'
		endif
	endif
endscript

script goal_viewport_frame_create 
	getscreenelementdims id = goal_viewport_viewport_element
	<h_scale> = (<width> / 8.0)
	<v_scale> = (<height> / 8.0)
	<bg_scale> = (((1.025, 0.0) * <h_scale>) + ((0.0, 1.05) * <v_scale>))
	createscreenelement {
		parent = <vport_id>
		type = spriteelement
		id = goal_viewport_background_element
		texture = white2
		rgba = <extra_style_rgba>
		pos = (0.0, 0.0)
		scale = <bg_scale>
		z_priority = 9
		local_id = background
	}
endscript

script goal_viewport_frame_filmer 
	getscreenelementdims id = goal_viewport_viewport_element
	createscreenelement {
		parent = <vport_id>
		type = spriteelement
		texture = HUD_filmer_leftside
		rgba = [128 128 128 255]
		pos = ((-1.0, 0.0) * (<width> / 2) + (1.0, -27.5))
		just = [right center]
		scale = (1.0, 0.95)
		z_priority = 8
	}
	createscreenelement {
		parent = <vport_id>
		type = spriteelement
		texture = HUD_filmer_leftside
		rgba = [128 128 128 255]
		pos = ((-1.0, 0.0) * (<width> / 2) + (1.0, 29.0))
		just = [right center]
		scale = (1.0, 0.9)
		flip_h
		z_priority = 8
	}
	createscreenelement {
		parent = <vport_id>
		type = spriteelement
		texture = HUD_filmer_rightside
		rgba = [128 128 128 255]
		pos = ((1.0, 0.0) * (<width> / 2) + (0.0, 0.5))
		just = [left center]
		scale = (1.0, 0.91249996)
		z_priority = 8
	}
	createscreenelement {
		parent = <vport_id>
		type = spriteelement
		texture = HUD_filmer_topside
		rgba = [128 128 128 255]
		pos = ((0.0, -1.0) * (<height> / 2) + (0.0, 1.0))
		just = [center bottom]
		scale = (4.8500004, 1.0)
		z_priority = 9
	}
	createscreenelement {
		parent = <vport_id>
		type = spriteelement
		texture = HUD_filmer_topside
		rgba = [128 128 128 255]
		pos = ((0.0, 1.0) * (<height> / 2) + (0.0, -1.0))
		just = [center bottom]
		rot_angle = 180
		scale = (4.8500004, 1.0)
		z_priority = 9
	}
endscript

script goal_viewport_spawned_create play_hold = 1
	if NOT gotparam appearance_priority
		scriptassert "missing priority in call to create goal viewport"
		appearance_priority = 3
	endif
	goal_viewport_parent :settags {
		current_goal_string = <goal_string>
		current_appearance_priority = <appearance_priority>
		pending = 1
	}
	wait 3 gameframes
	goal_viewport_parent :removetags [pending]
	formattext checksumname = vport_id '%s_vport_element' s = <goal_string>
	formattext checksumname = cam_id '%s_vport_cam' s = <goal_string>
	goal_viewport_parent :settags cam_id = <cam_id> vport_id = <vport_id>
	createscreenelement {
		parent = goal_viewport_parent
		type = containerelement
		id = <vport_id>
		pos = <vport_pos>
		just = [left top]
		rot_angle = <rot_angle>
	}
	mempushcontext bottomupheap
	createscreenelement {
		parent = <vport_id>
		type = viewportelement
		id = goal_viewport_viewport_element
		texture = viewport0
		pos = (0.0, 0.0)
		scale = <vport_scale>
		z_priority = 10
		local_id = viewport
		near_clip = <near_clip>
		far_clip = <far_clip>
		style = <viewport_style>
	}
	mempopcontext
	if gotparam extra_style
		<extra_style> <...>
	endif
	playigccam {
		name = <cam_id>
		viewport = goal_viewport_viewport_element
		near_clip = <near_clip>
		far_clip = <far_clip>
		controlscript = <controlscript>
		params = <...>
		lockto = <lockto>
		pos = <pos>
		quat = <quat>
		fov = <fov>
		lookat = <lookat>
		lookatpos = <lookatpos>
		allow_pause = 1
		play_hold = <play_hold>
	}
	if gotparam viewport_script
		<viewport_script> cam_id = <cam_id> vport_id = <vport_id> <viewport_script_params>
	endif
	if gotparam tags
		goal_viewport_parent :settags <tags>
	endif
	if (<skater_visible> = 0)
		skater :obj_clearvisibility viewport = goal_viewport_viewport_element
	endif
	if screenelementexists id = score_in_goal_container
		doscreenelementmorph id = score_in_goal_container pos = (515.0, 171.0)
	endif
	ui_messages_check_all_positions
endscript

script goal_viewport_kill 
	if NOT insplitscreengame
		if screenelementexists id = goal_viewport_parent
			if gotparam goal_string
				if goal_viewport_parent :getsingletag current_goal_string
					if NOT stringequals a = <current_goal_string> b = <goal_string>
						printf 'goal_viewport_kill: not killing viewport due to goal_string mismatch: current is %a, you killed %b' a = <current_goal_string> b = <goal_string>
						return
					endif
				endif
			elseif NOT gotparam all
				scriptassert 'missing either goal_string or ALL param to kill viewport'
			else
				printf 'goal_viewport_kill - ALL'
			endif
			if goal_viewport_parent :getsingletag pending
				goal_viewport_parent :removetags [pending]
				goal_viewport_parent :obj_killspawnedscript name = goal_viewport_spawned_create
			endif
			goal_viewport_parent :removetags {
				[
					chase_obj_id
					current_appearance_priority
					current_goal_string
				]
			}
			goal_viewport_parent :gettags
			if viewportexists id = goal_viewport_viewport_element
				skater :obj_setvisibility viewport = goal_viewport_viewport_element
			endif
			if gotparam vport_id
				if screenelementexists id = <vport_id>
					goal_viewport_parent :settags vport_id = none
					destroyscreenelement id = <vport_id>
				endif
			endif
			if gotparam cam_id
				killskatercamanim name = <cam_id>
				goal_viewport_parent :settags cam_id = none
			endif
			doscreenelementmorph id = goal_viewport_parent alpha = 1.0
		endif
		if screenelementexists id = score_in_goal_container
			doscreenelementmorph id = score_in_goal_container pos = (515.0, 36.0)
		endif
		ui_messages_check_all_positions
	endif
endscript

script goal_viewport_hide 
	if screenelementexists \{id = goal_viewport_parent}
		doscreenelementmorph \{id = goal_viewport_parent
			alpha = 0}
	endif
endscript

script goal_viewport_show 
	if screenelementexists \{id = goal_viewport_parent}
		doscreenelementmorph \{id = goal_viewport_parent
			alpha = 1}
	endif
endscript

script goal_viewport_photo_effect_capture 
	mempushcontext bottomupheap
	createscreenelement {
		parent = goal_viewport_parent
		type = viewportelement
		id = viewport_photo
		texture = viewport1
		just = [left top]
		pos = (0.0, 0.0)
		scale = (1.55 * (13.0, 9.0))
		z_priority = 1000
		alpha = 0
		style = viewport_photo
	}
	mempopcontext
	if gotparam camera
		playigccam {
			<camera>
			name = viewport_photo_cam
			viewport = viewport_photo
			play_hold
		}
	endif
	runscriptonscreenelement id = viewport_photo goal_viewport_photo_effect_script
endscript

script goal_viewport_photo_effect_script 
	wait \{1
		gameframes}
	clearcamera
	killskatercamanim \{name = viewport_photo_cam}
	domorph \{alpha = 1}
	wait \{5
		gameframes}
	domorph \{alpha = 0
		time = 1}
endscript

script goal_viewport_photo_resize_and_show 
	doscreenelementmorph \{id = viewport_photo
		pos = (150.0, 100.0)
		alpha = 1
		relative_scale
		scale = 0.55}
endscript

script goal_viewport_photo_effect_destroy 
	if screenelementexists \{id = viewport_photo}
		destroyscreenelement \{id = viewport_photo}
	endif
endscript
