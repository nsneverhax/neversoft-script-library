compass_debug = 0
compass_max_blips = 96
compass_max_displays = 2
compass_blip_fadeout = 1.5
compass_skater_rank = 50.0
compass_bliptypes = {
	goal_important = {
		z_priority = 5
		rgba = [
			180
			180
			0
			250
		]
		texture = HUD_comp_goal
		style = compass_pulse
		use_dist1 = true
		use_dist2 = true
		use_height_indicator = true
	}
	goal = {
		z_priority = 4
		rgba = [
			180
			120
			40
			0
		]
		texture = HUD_comp_goal
		use_dist1 = true
		use_dist2 = true
		use_height_indicator = false
	}
	goal_career = {
		z_priority = 5
		rgba = [
			40
			180
			40
			250
		]
		texture = HUD_comp_goal
		use_dist1 = true
		use_dist2 = true
		use_height_indicator = true
	}
	goal_career_pulse = {
		z_priority = 5
		rgba = [
			40
			180
			40
			250
		]
		texture = HUD_comp_goal
		style = compass_pulse
		use_dist1 = true
		use_dist2 = true
		use_height_indicator = true
	}
	goal_hardcore = {
		z_priority = 5
		rgba = [
			180
			100
			40
			250
		]
		texture = HUD_comp_goal
		use_dist1 = true
		use_dist2 = true
		use_height_indicator = true
	}
	goal_hardcore_pulse = {
		z_priority = 5
		rgba = [
			180
			100
			40
			250
		]
		texture = HUD_comp_goal
		style = compass_pulse
		use_dist1 = true
		use_dist2 = true
		use_height_indicator = true
	}
	goal_rigger = {
		z_priority = 5
		rgba = [
			120
			40
			180
			250
		]
		texture = HUD_comp_goal
		use_dist1 = true
		use_dist2 = true
		use_height_indicator = true
	}
	goal_rigger_pulse = {
		z_priority = 5
		rgba = [
			120
			40
			180
			250
		]
		texture = HUD_comp_goal
		style = compass_pulse
		use_dist1 = true
		use_dist2 = true
		use_height_indicator = true
	}
	waypoint = {
		z_priority = 3
		rgba = [
			0
			180
			180
			250
		]
		texture = HUD_comp_waypoint
		use_dist1 = false
		use_dist2 = true
		use_height_indicator = true
	}
	skateshop = {
		z_priority = 2
		rgba = [
			180
			120
			40
			250
		]
		texture = HUD_comp_shop
		use_dist1 = true
		use_dist2 = true
		use_height_indicator = false
	}
	home = {
		z_priority = 2
		rgba = [
			180
			40
			40
			250
		]
		texture = HUD_comp_home
		use_dist1 = true
		use_dist2 = true
		use_height_indicator = false
	}
	location = {
		z_priority = 2
		rgba = [
			80
			180
			120
			250
		]
		texture = HUD_comp_goal
		use_dist1 = true
		use_dist2 = true
		use_height_indicator = false
	}
}
compass_display_params = {
	on = 1
	width = 140.0
	angle = none
	fov = 215
	clamp_at_edge_angle = 5
	maxdist1_rank100 = 40
	maxdist1_rank1 = 60
	distance2 = scale_xy
	maxdist2_rank100 = 60
	maxdist2_rank1 = 80
	mode = depth
	clamp_at_edge_enable = true
	lr_flip = 0
	height = 8
	depth_rotate_adj = -1.5
	depth_y_scale_adj = 0.2
	distance1 = scale_xy
	maxdist1_value = 1.5
	maxdist2_value = 0.45000002
}
compass_direction_params = {
	north = (0.0, -1.0)
	ticks_between_directions = 3
	tick_texture = HUD_comp_tick
	y_offset = 1
	rgba = [
		255
		255
		255
		90
	]
	scale = (0.35000002, 0.35000002)
	cardinal_textures = [
		[
			{
				texture = HUD_comp_north
				languages = [
					language_undefined
				]
			}
		]
		[
			{
				texture = HUD_comp_ouest
				languages = [
					language_french
					language_italian
					language_spanish
				]
			}
			{
				texture = HUD_comp_west
				languages = [
					language_undefined
				]
			}
		]
		[
			{
				texture = HUD_comp_south
				languages = [
					language_undefined
				]
			}
		]
		[
			{
				texture = HUD_comp_ouest
				languages = [
					language_german
				]
			}
			{
				texture = HUD_comp_east
				languages = [
					language_undefined
				]
			}
		]
	]
}

script compass_create 
	obj_getid
	if NOT screenelementexists id = compass_anchor
		setscreenelementlock id = root_window off
		createscreenelement {
			type = containerelement
			parent = root_window
			id = compass_anchor
			not_focusable
			alpha = 0
		}
	endif
	setscreenelementlock id = compass_anchor off
	if (<objid> = skatercam0)
		<anchor_pos> = (640.0, 50.0)
	else
		<anchor_pos> = (640.0, 150.0)
	endif
	createscreenelement {
		type = containerelement
		parent = compass_anchor
		local_id = <objid>
		not_focusable
		just = [center top]
		pos = <anchor_pos>
		scale = 1.5
	}
endscript

script compass_create_item 
	obj_getid
	compass_id = {compass_anchor child = <objid>}
	if gotparam compassbliptype
		<z_priority> = ($compass_bliptypes.<compassbliptype>.z_priority)
		<rgba> = ($compass_bliptypes.<compassbliptype>.rgba)
		<texture> = ($compass_bliptypes.<compassbliptype>.texture)
		if checksumequals a = ($compass_bliptypes.<compassbliptype>.use_height_indicator) b = true
			<use_height_indicator> = 1
		endif
		if structurecontains structure = ($compass_bliptypes.<compassbliptype>) style
			<style> = ($compass_bliptypes.<compassbliptype>.style)
		endif
		<sprite_pos> = (0.0, 0.0)
		<sprite_scale> = (0.5, 1.3)
	else
		<z_priority> = 1
		<rgba> = ($compass_direction_params.rgba)
		<sprite_pos> = ((0.0, 1.0) * ($compass_direction_params.y_offset))
		<sprite_scale> = ($compass_direction_params.scale)
	endif
	setscreenelementlock id = <compass_id> off
	createscreenelement {
		type = containerelement
		parent = <compass_id>
		z_priority = <z_priority>
		pos = (0.0, 0.0)
		alpha = 0
		not_focusable
	}
	anchor = <id>
	createscreenelement {
		type = spriteelement
		parent = <anchor>
		texture = <texture>
		pos = <sprite_pos>
		scale = <sprite_scale>
		just = [center center]
		rgba = <rgba>
		z_priority = <z_priority>
		alpha = 1
		not_focusable
	}
	if gotparam style
		runscriptonscreenelement id = <id> <style>
	endif
	if gotparam use_height_indicator
		createscreenelement {
			type = spriteelement
			parent = <anchor>
			texture = up_arrow
			pos = (0.0, 0.0)
			just = [center center]
			scale = (0.6, 0.5)
			rgba = [128 128 128 128]
			alpha = 0
			not_focusable
		}
		arrow_id = <id>
	endif
	return {id = <anchor> arrow_id = <arrow_id>}
endscript

script hide_compass_anchor 
	if screenelementexists \{id = compass_anchor}
		compass_anchor :domorph \{alpha = 0}
	endif
endscript

script show_compass_anchor 
	if getglobalflag \{flag = $NO_DISPLAY_COMPASS}
		return
	endif
	if gman_getactivatedgoalid
		return
	endif
	if levelis \{load_z_crib}
		return
	endif
	getscreenelementchildren \{id = the_time}
	if gotparam \{children}
		getarraysize <children>
		if (<array_size> > 0)
			return
		endif
	endif
	if screenelementexists \{id = compass_anchor}
		compass_anchor :domorph \{alpha = 1}
	endif
endscript

script compass_pulse 
	begin
	domorph \{relative_scale
		scale = 1.0
		time = 0.3
		anim = gentle}
	domorph \{relative_scale
		scale = 1.7
		time = 0.8
		anim = gentle}
	repeat
endscript

script compass_debug_menu_create 
	if screenelementexists id = debug_menu
		exit_pause_menu
	endif
	if screenelementexists id = compass_debug
		compass_debug_menu_exit
		return
	endif
	kill_start_key_binding
	MakeSkaterGoto freezeskater
	structure_control_menu_create {
		vmenu_id = compass_debug
		text = "Compass Params"
		pos = (50.0, 80.0)
		callback = compass_debug_apply
		structure = compass_display_params
		control_items = [
			{
				text = "Enabled"
				param = on
				values = [1 0]
				value_labels = ["on" "off"]
				range_loop = 1
			}
			{
				text = "Mode"
				param = mode
				values = [flat depth]
				value_labels = ["2D" "3D"]
				range_loop = 1
			}
			{
				text = "Edge clamp enable"
				param = clamp_at_edge_enable
				values = [true false]
				value_labels = ["true" "false"]
				range_loop = 1
			}
			{text = "Edge clamp angle" param = clamp_at_edge_angle min = 0 max = 50.0 step = 0.2}
			{
				text = "Flip"
				param = lr_flip
				values = [1 0]
				value_labels = ["on" "off"]
				range_loop = 1
			}
			{text = "FOV" param = fov min = 45 max = 350 step = 1}
			{text = "Width" param = width min = 10.0 max = 200.0 step = 1}
			{text = "Height" param = height min = -50.0 max = 50.0 step = 0.2}
			{text = "Depth rotate" param = depth_rotate_adj min = -2.0 max = 2.0 step = 0.01}
			{text = "Depth Y scale" param = depth_y_scale_adj min = 0.0 max = 1.0 step = 0.01}
			{
				text = "Angle adjustment"
				param = angle
				values = [none alpha scale_xy scale_x]
				value_labels = ["none" "alpha" "scale_xy" "scale_x"]
			}
			{separator}
			{
				text = "Dist adjustment 1"
				param = distance1
				values = [none alpha scale_xy scale_x]
				value_labels = ["none" "alpha" "scale_xy" "scale_x"]
			}
			{text = "Dist pct min 1" param = maxdist1_value min = 0.0 max = 1.0 step = 0.01}
			{text = "Dist cutoff 1 (rank 100)" param = maxdist1_rank100 min = 5 max = 200 step = 0.5}
			{text = "Dist cutoff 1 (rank 1)" param = maxdist1_rank1 min = 5 max = 200 step = 0.5}
			{separator}
			{
				text = "Dist adjustment 2"
				param = distance2
				values = [none alpha scale_xy scale_x]
				value_labels = ["none" "alpha" "scale_xy" "scale_x"]
			}
			{text = "Dist pct min 2" param = maxdist2_value min = 0.0 max = 1.0 step = 0.01}
			{text = "Dist cutoff 2 (rank 100)" param = maxdist2_rank100 min = 5 max = 200 step = 0.5}
			{text = "Dist cutoff 2 (rank 1)" param = maxdist2_rank1 min = 5 max = 200 step = 0.5}
		]
		pad_back_script = compass_debug_menu_exit
	}
endscript
compass_debug_last_mode = null

script compass_debug_apply 
	skatercam0 :compassdisplay_setparams <...>
	if NOT (<mode> = (compass_debug_last_mode))
		change compass_debug_last_mode = <mode>
		if (<mode> = flat)
		else
		endif
	endif
endscript

script compass_debug_menu_exit 
	printstruct (compass_display_params)
	MakeSkaterGoto \{ongroundai}
	destroyscreenelement \{id = current_menu}
	restore_start_key_binding
endscript
