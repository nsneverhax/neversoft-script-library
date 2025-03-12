button_up_models = {
	green = {
		name = button_g
		name_string = 'button_g'
		material_lip = sys_nowbar_button01_green_lip_sys_nowbar_button01_green_lip
		material_mid = sys_nowbar_button01_green_mid2_sys_nowbar_button01_green_mid2
		material_head = sys_nowbar_head_green_sys_nowbar_head_green
		material_head_lit = sys_nowbar_head_greenl_sys_nowbar_head_greenl
		material_neck = sys_nowbar_neck01_sys_nowbar_neck01
		material_down = sys_nowbar_button01_green_down_sys_nowbar_button01_green_down
	}
	red = {
		name = button_r
		name_string = 'button_r'
		material_lip = sys_nowbar_button01_red_lip_sys_nowbar_button01_red_lip
		material_mid = sys_nowbar_button01_red_mid2_sys_nowbar_button01_red_mid2
		material_head = sys_nowbar_head_red_sys_nowbar_head_red
		material_head_lit = sys_nowbar_head_redl_sys_nowbar_head_redl
		material_neck = sys_nowbar_neck01_sys_nowbar_neck01
		material_down = sys_nowbar_button01_red_down_sys_nowbar_button01_red_down
	}
	yellow = {
		name = button_y
		name_string = 'button_y'
		material_lip = sys_nowbar_button01_yellow_lip_sys_nowbar_button01_yellow_lip
		material_mid = sys_nowbar_button01_yellow_mid2_sys_nowbar_button01_yellow_mid2
		material_head = sys_nowbar_head_yellow_sys_nowbar_head_yellow
		material_head_lit = sys_nowbar_head_yellowl_sys_nowbar_head_yellowl
		material_neck = sys_nowbar_neck01_sys_nowbar_neck01
		material_down = sys_nowbar_button01_yellow_down_sys_nowbar_button01_yellow_down
	}
	blue = {
		name = button_b
		name_string = 'button_b'
		material_lip = sys_nowbar_button01_blue_lip_sys_nowbar_button01_blue_lip
		material_mid = sys_nowbar_button01_blue_mid2_sys_nowbar_button01_blue_mid2
		material_head = sys_nowbar_head_blue_sys_nowbar_head_blue
		material_head_lit = sys_nowbar_head_bluel_sys_nowbar_head_bluel
		material_neck = sys_nowbar_neck01_sys_nowbar_neck01
		material_down = sys_nowbar_button01_blue_down_sys_nowbar_button01_blue_down
	}
	orange = {
		name = button_o
		name_string = 'button_o'
		material_lip = sys_nowbar_button01_orange_lip_sys_nowbar_button01_orange_lip
		material_mid = sys_nowbar_button01_orange_mid2_sys_nowbar_button01_orange_mid2
		material_head = sys_nowbar_head_orange_sys_nowbar_head_orange
		material_head_lit = sys_nowbar_head_orangel_sys_nowbar_head_orangel
		material_neck = sys_nowbar_neck01_sys_nowbar_neck01
		material_down = sys_nowbar_button01_orange_down_sys_nowbar_button01_orange_down
	}
}

script setup_highway \{player = 1}
	generate_pos_table
	setscreenelementlock \{id = root_window
		off}
	if ($current_num_players = 1)
		<pos> = (0.0, 0.0)
		<scale> = (1.0, 1.0)
	else
		if (<player> = 1)
			<pos> = ((0 - $x_offset_p2) * (1.0, 0.0))
		else
			if NOT ($devil_finish = 1)
				<pos> = ($x_offset_p2 * (1.0, 0.0))
			else
				<pos> = (1000.0, 0.0)
			endif
		endif
		<scale> = (1.0, 1.0)
	endif
	<container_pos> = (<pos> + (0.0, 720.0))
	if ($highwayvisible = on)
		<highway_alpha> = 1
	else
		<highway_alpha> = 0
	endif
	formattext checksumname = container_id 'gem_container%p' p = <player_text> addtostringlookup = true
	createscreenelement {
		type = containerelement
		id = <container_id>
		parent = root_window
		pos = <container_pos>
		just = [left top]
		scale = <scale>
		z_priority = 0
		alpha = <highway_alpha>
	}
	hpos = ((640.0 - ($highway_top_width / 2.0)) * (1.0, 0.0))
	hdims = ($highway_top_width * (1.0, 0.0))
	<highway_material> = ($<player_status>.highway_material)
	formattext checksumname = highway_name 'Highway_2D%p' p = <player_text> addtostringlookup = true
	createscreenelement {
		type = spriteelement
		id = <highway_name>
		parent = <container_id>
		clonematerial = <highway_material>
		rgba = $highway_normal
		pos = <hpos>
		dims = <hdims>
		just = [left left]
		z_priority = 0.1
	}
	highway_speed = (0.0 - ($ghighwaytiling / ($<player_status>.scroll_time - $destroy_time)))
	printf "Setting highway speed to: %h" h = <highway_speed>
	set2dhighwayspeed speed = <highway_speed> id = <highway_name> player_status = <player_status>
	fe = ($highway_playline - $highway_height)
	fs = (<fe> + $highway_fade)
	set2dhighwayfade start = <fs> end = <fe> id = <highway_name> player = <player>
	pos = ((640 * (1.0, 0.0)) + ($highway_playline * (0.0, 1.0)))
	now_scale = (($nowbar_scale_x * (1.0, 0.0)) + ($nowbar_scale_y * (0.0, 1.0)))
	lpos = (($sidebar_x * (1.0, 0.0)) + ($sidebar_y * (0.0, 1.0)))
	langle = ($sidebar_angle)
	rpos = ((((640.0 - $sidebar_x) + 640.0) * (1.0, 0.0)) + ($sidebar_y * (0.0, 1.0)))
	rangle = (0.0 - ($sidebar_angle))
	scale = (($sidebar_x_scale * (1.0, 0.0)) + ($sidebar_y_scale * (0.0, 1.0)))
	rscale = (((0 - $sidebar_x_scale) * (1.0, 0.0)) + ($sidebar_y_scale * (0.0, 1.0)))
	formattext checksumname = cont 'sidebar_container_left%p' p = <player_text> addtostringlookup = true
	createscreenelement {
		type = containerelement
		id = <cont>
		parent = <container_id>
		pos = <lpos>
		rot_angle = <langle>
		just = [center bottom]
		z_priority = 3
	}
	formattext checksumname = name 'sidebar_left%p' p = <player_text> addtostringlookup = true
	createscreenelement {
		type = spriteelement
		id = <name>
		parent = <cont>
		material = sys_sidebar2d_sys_sidebar2d
		rgba = [255 255 255 255]
		pos = (0.0, 0.0)
		scale = <scale>
		just = [center bottom]
		z_priority = 3
	}
	set2dgemfade id = <name> player = <player>
	formattext checksumname = cont 'starpower_container_left%p' p = <player_text> addtostringlookup = true
	createscreenelement {
		type = containerelement
		id = <cont>
		parent = <container_id>
		pos = <lpos>
		rot_angle = <langle>
		just = [center bottom]
		z_priority = 3
	}
	starpower_pos = (((-55.0 * $starpower_fx_scale) * (1.0, 0.0)) + ((55.0 * $starpower_fx_scale) * (0.0, 1.0)))
	starpower_scale = (((1.0 * $starpower_fx_scale) * (1.0, 0.0)) + ((1.1 * $starpower_fx_scale) * (0.0, 1.0)))
	formattext checksumname = name 'sidebar_left_glow%p' p = <player_text> addtostringlookup = true
	createscreenelement {
		type = spriteelement
		id = <name>
		parent = <cont>
		material = sys_starpower_sdglow_sys_starpower_sdglow
		rgba = [255 255 255 255]
		pos = <starpower_pos>
		scale = <starpower_scale>
		just = [center bottom]
		z_priority = 0
	}
	starpower_pos = (((0.0 * $starpower_fx_scale) * (1.0, 0.0)) + ((0 * $starpower_fx_scale) * (0.0, 1.0)))
	starpower_scale = (((-0.5 * $starpower_fx_scale) * (1.0, 0.0)) + ((0.9 * $starpower_fx_scale) * (0.0, 1.0)))
	formattext checksumname = name 'sidebar_left_Lightning01%p' p = <player_text> addtostringlookup = true
	createscreenelement {
		type = spriteelement
		id = <name>
		parent = <cont>
		material = sys_big_bolt01_sys_big_bolt01
		rgba = [0 0 128 128]
		pos = <starpower_pos>
		rot_angle = (180)
		scale = <starpower_scale>
		just = [center top]
		z_priority = 4
	}
	starpower_pos = (((0.0 * $starpower_fx_scale) * (1.0, 0.0)) + ((0.0 * $starpower_fx_scale) * (0.0, 1.0)))
	starpower_scale = (((2.0 * $starpower_fx_scale) * (1.0, 0.0)) + ((0.9 * $starpower_fx_scale) * (0.0, 1.0)))
	formattext checksumname = name 'sidebar_left_Lightning02%p' p = <player_text> addtostringlookup = true
	createscreenelement {
		type = spriteelement
		id = <name>
		parent = <cont>
		material = sys_big_bolt01_sys_big_bolt01
		rgba = [255 255 255 255]
		pos = <starpower_pos>
		rot_angle = (180)
		scale = <starpower_scale>
		just = [center top]
		z_priority = 0.02
	}
	formattext checksumname = cont 'sidebar_container_right%p' p = <player_text> addtostringlookup = true
	createscreenelement {
		type = containerelement
		id = <cont>
		parent = <container_id>
		pos = <rpos>
		rot_angle = <rangle>
		just = [center bottom]
		z_priority = 3
	}
	formattext checksumname = name 'sidebar_right%p' p = <player_text> addtostringlookup = true
	createscreenelement {
		type = spriteelement
		id = <name>
		parent = <cont>
		material = sys_sidebar2d_sys_sidebar2d
		rgba = [255 255 255 255]
		pos = (0.0, 0.0)
		scale = <rscale>
		just = [center bottom]
		z_priority = 3
	}
	set2dgemfade id = <name> player = <player>
	formattext checksumname = cont 'starpower_container_right%p' p = <player_text> addtostringlookup = true
	createscreenelement {
		type = containerelement
		id = <cont>
		parent = <container_id>
		pos = <rpos>
		rot_angle = <rangle>
		just = [center bottom]
		z_priority = 3
	}
	starpower_pos = (((55.0 * $starpower_fx_scale) * (1.0, 0.0)) + ((55.0 * $starpower_fx_scale) * (0.0, 1.0)))
	starpower_scale = (((-1.0 * $starpower_fx_scale) * (1.0, 0.0)) + ((1.1 * $starpower_fx_scale) * (0.0, 1.0)))
	formattext checksumname = name 'sidebar_Right_glow%p' p = <player_text> addtostringlookup = true
	createscreenelement {
		type = spriteelement
		id = <name>
		parent = <cont>
		material = sys_starpower_sdglow_sys_starpower_sdglow
		rgba = [255 255 255 255]
		pos = <starpower_pos>
		scale = <starpower_scale>
		just = [center bottom]
		z_priority = 0
	}
	starpower_pos = (((0.0 * $starpower_fx_scale) * (1.0, 0.0)) + ((0 * $starpower_fx_scale) * (0.0, 1.0)))
	starpower_scale = (((0.5 * $starpower_fx_scale) * (1.0, 0.0)) + ((0.9 * $starpower_fx_scale) * (0.0, 1.0)))
	formattext checksumname = name 'sidebar_Right_Lightning01%p' p = <player_text> addtostringlookup = true
	createscreenelement {
		type = spriteelement
		id = <name>
		parent = <cont>
		material = sys_big_bolt01_sys_big_bolt01
		rgba = [0 0 128 128]
		pos = <starpower_pos>
		rot_angle = (180)
		scale = <starpower_scale>
		just = [center top]
		z_priority = 4
	}
	starpower_pos = (((0.0 * $starpower_fx_scale) * (1.0, 0.0)) + ((0.0 * $starpower_fx_scale) * (0.0, 1.0)))
	starpower_scale = (((2.0 * $starpower_fx_scale) * (1.0, 0.0)) + ((0.9 * $starpower_fx_scale) * (0.0, 1.0)))
	formattext checksumname = name 'sidebar_Right_Lightning02%p' p = <player_text> addtostringlookup = true
	createscreenelement {
		type = spriteelement
		id = <name>
		parent = <cont>
		material = sys_big_bolt01_sys_big_bolt01
		rgba = [255 255 255 255]
		pos = <starpower_pos>
		rot_angle = (180)
		scale = <starpower_scale>
		just = [center top]
		z_priority = 0.02
	}
	formattext checksumname = cont 'starpower_container_left%p' p = <player_text> addtostringlookup = true
	doscreenelementmorph id = <cont> alpha = 0
	formattext checksumname = cont 'starpower_container_right%p' p = <player_text> addtostringlookup = true
	doscreenelementmorph id = <cont> alpha = 0
	getarraysize \{$gem_colors}
	array_count = 0
	begin
	color = ($gem_colors [<array_count>])
	if structurecontains structure = ($button_up_models.<color>) name = name
		if ($<player_status>.lefthanded_button_ups = 1)
			<pos2d> = ($button_up_models.<color>.left_pos_2d)
		else
			<pos2d> = ($button_up_models.<color>.pos_2d)
		endif
		pos = (640.0, 643.0)
		formattext checksumname = name_base '%s_base%p' s = ($button_up_models.<color>.name_string) p = <player_text> addtostringlookup = true
		formattext checksumname = name_string '%s_string%p' s = ($button_up_models.<color>.name_string) p = <player_text> addtostringlookup = true
		formattext checksumname = name_lip '%s_lip%p' s = ($button_up_models.<color>.name_string) p = <player_text> addtostringlookup = true
		formattext checksumname = name_mid '%s_mid%p' s = ($button_up_models.<color>.name_string) p = <player_text> addtostringlookup = true
		formattext checksumname = name_neck '%s_neck%p' s = ($button_up_models.<color>.name_string) p = <player_text> addtostringlookup = true
		formattext checksumname = name_head '%s_head%p' s = ($button_up_models.<color>.name_string) p = <player_text> addtostringlookup = true
		<pos> = (((<pos2d>.(1.0, 0.0)) * (1.0, 0.0)) + (1024 * (0.0, 1.0)))
		if ($<player_status>.lefthanded_button_ups = 1)
			<playline_scale> = (((0 - <now_scale>.(1.0, 0.0)) * (1.0, 0.0)) + (<now_scale>.(0.0, 1.0) * (0.0, 1.0)))
		else
			<playline_scale> = <now_scale>
		endif
		createscreenelement {
			type = containerelement
			id = <name_base>
			parent = <container_id>
			pos = (0.0, 0.0)
			just = [center bottom]
			z_priority = 3
		}
		createscreenelement {
			type = spriteelement
			id = <name_lip>
			parent = <name_base>
			material = ($button_up_models.<color>.material_lip)
			rgba = [255 255 255 255]
			pos = <pos2d>
			scale = <playline_scale>
			just = [center bottom]
			z_priority = 3.9
		}
		createscreenelement {
			type = spriteelement
			id = <name_mid>
			parent = <name_base>
			material = ($button_up_models.<color>.material_mid)
			rgba = [255 255 255 255]
			pos = <pos2d>
			scale = <playline_scale>
			just = [center bottom]
			z_priority = 3.6
		}
		<y_scale> = ($neck_lip_add / $neck_sprite_size)
		<pos> = (<pos2d> - ($neck_lip_base * (0.0, 1.0)))
		<neck_scale> = (((<playline_scale>.(1.0, 0.0)) * (1.0, 0.0)) + (<y_scale> * (0.0, 1.0)))
		createscreenelement {
			type = spriteelement
			id = <name_neck>
			parent = <name_base>
			material = ($button_up_models.<color>.material_neck)
			rgba = [255 255 255 255]
			pos = <pos>
			scale = <neck_scale>
			just = [center bottom]
			z_priority = 3.7
		}
		createscreenelement {
			type = spriteelement
			id = <name_head>
			parent = <name_base>
			material = ($button_up_models.<color>.material_head)
			rgba = [255 255 255 255]
			pos = <pos2d>
			scale = <playline_scale>
			just = [center bottom]
			z_priority = 3.8
		}
		string_pos2d = ($button_up_models.<color>.pos_2d)
		<string_scale> = (($string_scale_x * (1.0, 0.0)) + ($string_scale_y * (0.0, 1.0)))
		createscreenelement {
			type = spriteelement
			id = <name_string>
			parent = <container_id>
			material = sys_string01_sys_string01
			rgba = [200 200 200 200]
			scale = <string_scale>
			rot_angle = ($button_models.<color>.angle)
			pos = <string_pos2d>
			just = [center bottom]
			z_priority = 2
		}
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
	spawnscriptlater move_highway_2d params = {<...>}
	create_highway_prepass <...>
	setscreenelementlock \{id = root_window
		on}
endscript

script destroy_highway 
	killspawnedscript \{name = movegem}
	destroy_highway_prepass <...>
	formattext checksumname = name 'Highway_2D%p' p = <player_text> addtostringlookup = true
	if screenelementexists id = <name>
		destroyscreenelement id = <name>
	endif
	formattext checksumname = name 'gem_container%p' p = <player_text> addtostringlookup = true
	if screenelementexists id = <name>
		destroyscreenelement id = <name>
	endif
	formattext checksumname = name 'Gem_basebar%p' p = <player_text> addtostringlookup = true
	if screenelementexists id = <name>
		destroyscreenelement id = <name>
	endif
	getarraysize \{$gem_colors}
	array_count = 0
	begin
	color = ($gem_colors [<array_count>])
	if structurecontains structure = ($button_up_models.<color>) name = name_string
		formattext checksumname = name '%s%p' s = ($button_up_models.<color>.name_string) p = <player_text> addtostringlookup = true
		if screenelementexists id = <name>
			destroyscreenelement id = <name>
		endif
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
endscript
prepass_camera_pos = (500.0, -100.0, -100.0)
prepass_border = 8

script calculate_prepass_poly_params \{x_offset = 0}
	prepass_mdl_top_width = 1
	prepass_mdl_bottom_width = 3.5
	prepass_mdl_height = 1
	w0 = ($highway_top_width)
	highway_slope = (<w0> * $widthoffsetfactor / $highway_height)
	highway_start = ($highway_playline - $highway_height)
	prepass_start = ($highway_fade + $prepass_border)
	prepass_top_width = (<w0> + <highway_slope> * <prepass_start> -2 * $prepass_border)
	tan_theta = 0.674
	prepass_z_offset = (<prepass_mdl_top_width> / (<tan_theta> * <prepass_top_width> / 640))
	prepass_y_offset = ((360 - (<highway_start> + <prepass_start>)) * <prepass_z_offset> * <tan_theta> / 640)
	prepass_x_offset = (<x_offset> * <prepass_z_offset> * <tan_theta> / 640)
	prepass_y_scale = ((<prepass_mdl_bottom_width> - <prepass_mdl_top_width>) / (<prepass_mdl_height> * <highway_slope>))
	return prepass_offset = (<prepass_z_offset> * (0.0, 0.0, 1.0) + <prepass_y_offset> * (0.0, 1.0, 0.0) + <prepass_x_offset> * (-1.0, 0.0, 0.0)) prepass_scale = ((1.0, 0.0, 1.0) + <prepass_y_scale> * (0.0, 1.0, 0.0))
endscript

script calculate_prepass_offset 
	getscreenelementprops id = <screen_element>
	tan_theta = 0.674
	x_screen = (<pos>.(1.0, 0.0))
	y_screen = (360 - ($highway_playline - $highway_height + $highway_fade + $prepass_border + <pos>.(0.0, 1.0)))
	prepass_x_offset = (<x_screen> * <distance> * <tan_theta> / 640)
	prepass_y_offset = (<y_screen> * <distance> * <tan_theta> / 640)
	return prepass_offset = (<prepass_x_offset> * (-1.0, 0.0, 0.0) + <prepass_y_offset> * (0.0, 1.0, 0.0) + <distance> * (0.0, 0.0, 1.0))
endscript

script update_prepass_position 
	<obj> :obj_getposition
	prepass_distance = (<pos>.(0.0, 0.0, 1.0) - $prepass_camera_pos.(0.0, 0.0, 1.0))
	calculate_prepass_offset screen_element = <elem> distance = <prepass_distance>
	<obj> :obj_setposition position = (<prepass_offset> + $prepass_camera_pos)
	<obj> :obj_updatemodel
endscript

script update_highway_prepass 
	if compositeobjectexists \{highway_prepassp1}
		update_prepass_position \{obj = highway_prepassp1
			elem = gem_containerp1}
	endif
	if compositeobjectexists \{highway_prepassp2}
		update_prepass_position \{obj = highway_prepassp2
			elem = gem_containerp2}
	endif
endscript

script create_highway_prepass_object \{roty = 0}
	formattext checksumname = highway_prepass_name 'highway_prepass%p' p = <player_text> addtostringlookup = true
	formattext checksumname = container_id 'gem_container%p' p = <player_text> addtostringlookup = true
	calculate_prepass_poly_params <...>
	createcompositeobjectinstance {
		priority = $coim_priority_permanent
		heap = generic
		components = [
			{component = model lightgroup = highway}
		]
		params = {
			name = <highway_prepass_name>
			model = 'Props\\highway\\highway_prepass\\highway_prepass.mdl'
			pos = (<cam_pos> + <prepass_offset>)
			suspenddistance = 60
			lod_dist1 = 10
			lod_dist2 = 100
			object_type = highway
			profilebudget = 20
		}
	}
	<highway_prepass_name> :obj_setorientation y = 180
	<highway_prepass_name> :obj_enablescaling
	<highway_prepass_name> :obj_applyscaling scale = <prepass_scale>
	<highway_prepass_name> :obj_setboundingsphere 1000.0
	<highway_prepass_name> :obj_setnosizecull
endscript

script create_highway_prepass 
	<cam_pos> = ($prepass_camera_pos)
	if ($current_num_players = 1)
		<style> = highway_prepass_rendering_1p
		create_highway_prepass_object <...>
	else
		<style> = highway_prepass_rendering_1p
		if (<player> = 1)
			create_highway_prepass_object <...> player_text = 'p1' x_offset = (<container_pos>.(1.0, 0.0))
		else
			create_highway_prepass_object <...> player_text = 'p2' x_offset = (<container_pos>.(1.0, 0.0))
		endif
	endif
	if (<player> = 1)
		<highway_cam> = {
			lockto = world
			pos = <cam_pos>
			facing = (0.0, 0.0, 1.0)
			fov = 68.0
		}
		texture = highway_prepass_texture
		extendcrc <texture> <player_text> out = texture
		addprepassviewport viewport = bg_viewport style = <style>
		formattext checksumname = camera 'highway_prepass_camera%p' p = <player_text> addtostringlookup = true
		createcompositeobjectinstance {
			priority = $coim_priority_permanent
			heap = generic
			components = [
				{
					component = cinematiccamera
					updatewhencamerainactive = true
					enabled = true
				}
				{
					component = camera
				}
			]
			params = {
				name = <camera>
				object_type = highway
				profilebudget = 20
				use_jq
			}
		}
		setprepassviewportcamera viewport = bg_viewport id = <camera> prepass = (<player> - 1)
		<camera> :unpause
		<camera> :ccam_domorph <highway_cam>
		<camera> :obj_forceupdate
		if ($highwayvisible = on)
			enable_highway_prepass
		endif
	endif
endscript

script destroy_highway_prepass 
	if (<player> = 1)
		removeprepassviewport \{viewport = bg_viewport}
	endif
	formattext checksumname = name 'highway_prepass%p' p = <player_text> addtostringlookup = true
	if compositeobjectexists name = <name>
		<name> :die
	endif
	formattext checksumname = name 'highway_prepass_camera%p' p = <player_text> addtostringlookup = true
	if compositeobjectexists name = <name>
		<name> :die
	endif
	setviewportproperties \{viewport = bg_viewport
		clear_colorbuffer = true}
	setviewportproperties \{viewport = bg_viewport
		clear_depthstencilbuffer = true}
endscript

script disable_highway_prepass 
	if viewportexists \{id = bg_viewport}
		if prepassviewportexists \{viewport = bg_viewport}
			setviewportproperties \{viewport = bg_viewport
				clear_colorbuffer = true}
			setviewportproperties \{viewport = bg_viewport
				clear_depthstencilbuffer = true}
			setviewportproperties \{viewport = bg_viewport
				prepass = 0
				active = false}
			setviewportproperties \{viewport = bg_viewport
				prepass = 1
				active = false}
		endif
	endif
endscript

script enable_highway_prepass 
	if viewportexists \{id = bg_viewport}
		if prepassviewportexists \{viewport = bg_viewport}
			setviewportproperties \{viewport = bg_viewport
				clear_colorbuffer = false}
			setviewportproperties \{viewport = bg_viewport
				clear_depthstencilbuffer = false}
			setviewportproperties \{viewport = bg_viewport
				prepass = 0
				active = true}
			setviewportproperties \{viewport = bg_viewport
				prepass = 1
				active = true}
		endif
	endif
endscript
start_2d_move = 0

script move_highway_2d 
	change \{start_2d_move = 0}
	begin
	if ($start_2d_move = 1)
		break
	endif
	wait \{1
		gameframe}
	repeat
	highway_start_y = 720
	pos_start_orig = 0
	pos_add = -720
	pos_sub = 1.0
	pos_sub_add = -0.00044
	begin
	<pos> = (((<container_pos>.(1.0, 0.0)) * (1.0, 0.0)) + (<highway_start_y> * (0.0, 1.0)))
	setscreenelementprops id = <container_id> pos = <pos>
	getdeltatime \{ignore_slomo}
	<highway_start_y> = (<highway_start_y> + (<pos_add> * <delta_time>))
	<pos_add> = (<pos_add> * <pos_sub>)
	<pos_sub> = (<pos_sub> + <pos_sub_add>)
	if (<highway_start_y> <= <pos_start_orig>)
		<pos> = (((<container_pos>.(1.0, 0.0)) * (1.0, 0.0)) + (<pos_start_orig> * (0.0, 1.0)))
		setscreenelementprops id = <container_id> pos = <pos>
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script move_highway_camera_to_default \{player = 1}
	change \{start_2d_move = 1}
endscript

script disable_bg_viewport_properties 
	setviewportproperties \{viewport = bg_viewport
		clear_colorbuffer = true}
	setviewportproperties \{viewport = bg_viewport
		clear_depthstencilbuffer = true}
	if prepassviewportexists \{viewport = bg_viewport}
		setviewportproperties \{viewport = bg_viewport
			prepass = 0
			active = false}
		setviewportproperties \{viewport = bg_viewport
			prepass = 1
			active = false}
	endif
endscript

script disable_highway 
	if screenelementexists \{id = gem_containerp1}
		doscreenelementmorph \{id = gem_containerp1
			alpha = 0}
	endif
	if screenelementexists \{id = gem_containerp2}
		doscreenelementmorph \{id = gem_containerp2
			alpha = 0}
	endif
	if screenelementexists \{id = hud_2d_containerp1}
		doscreenelementmorph \{id = hud_2d_containerp1
			alpha = 0}
	endif
	if screenelementexists \{id = hud_2d_containerp2}
		doscreenelementmorph \{id = hud_2d_containerp2
			alpha = 0}
	endif
	if screenelementexists \{id = battle_alert_containerp1}
		doscreenelementmorph \{id = battle_alert_containerp1
			alpha = 0}
	endif
	if screenelementexists \{id = battle_alert_containerp2}
		doscreenelementmorph \{id = battle_alert_containerp2
			alpha = 0}
	endif
endscript

script disable_bg_viewport 
	disable_highway <...>
	kill_dummy_bg_camera
	ui_clip_root :setprops \{hide}
	disable_bg_viewport_properties
	setactivecamera \{id = viewer_cam
		viewport = bg_viewport}
endscript

script enable_bg_viewport_properties 
	if prepassviewportexists \{viewport = bg_viewport}
		setviewportproperties \{viewport = bg_viewport
			clear_colorbuffer = false}
		setviewportproperties \{viewport = bg_viewport
			clear_depthstencilbuffer = false}
		setviewportproperties \{viewport = bg_viewport
			no_resolve_depthstencilbuffer = true}
		setviewportproperties \{viewport = bg_viewport
			no_resolve_colorbuffer = true}
		setviewportproperties \{viewport = bg_viewport
			prepass = 0
			active = true}
		setviewportproperties \{viewport = bg_viewport
			prepass = 1
			active = true}
	else
		setviewportproperties \{viewport = bg_viewport
			clear_colorbuffer = true}
		setviewportproperties \{viewport = bg_viewport
			clear_depthstencilbuffer = true}
		setviewportproperties \{viewport = bg_viewport
			no_resolve_depthstencilbuffer = true}
		setviewportproperties \{viewport = bg_viewport
			no_resolve_colorbuffer = true}
	endif
	tod_proxim_update_lightfx_viewport \{fxparam = $default_tod_manager
		viewport = bg_viewport
		time = 0}
endscript

script enable_highway 
	if screenelementexists \{id = gem_containerp1}
		doscreenelementmorph \{id = gem_containerp1
			alpha = 1}
	endif
	if screenelementexists \{id = gem_containerp2}
		doscreenelementmorph \{id = gem_containerp2
			alpha = 1}
	endif
	if screenelementexists \{id = hud_2d_containerp1}
		doscreenelementmorph \{id = hud_2d_containerp1
			alpha = 1}
	endif
	if screenelementexists \{id = hud_2d_containerp2}
		doscreenelementmorph \{id = hud_2d_containerp2
			alpha = 1}
	endif
	if screenelementexists \{id = battle_alert_containerp1}
		doscreenelementmorph \{id = battle_alert_containerp1
			alpha = 1}
	endif
	if screenelementexists \{id = battle_alert_containerp2}
		doscreenelementmorph \{id = battle_alert_containerp2
			alpha = 1}
	endif
endscript

script enable_bg_viewport 
	enable_highway <...>
	enable_bg_viewport_properties
	ui_clip_root :setprops \{unhide}
endscript

script destroy_bg_viewport 
	kill_dummy_bg_camera
	if screenelementexists \{id = ui_clip_root}
		destroyscreenelement \{id = ui_clip_root}
	endif
	setscreenmode \{one_camera}
	setviewportproperties \{viewport = 0
		clear_colorbuffer = true}
	setviewportproperties \{viewport = 0
		no_resolve_depthstencilbuffer = false}
endscript
highway_fader_params = {
	style = highway_fader
	rt_size = (1280.0, 720.0)
	rt_offset = (0.0, 0.0)
	clip_dims = (256.0, 256.0)
	clip_offset = (0.0, -64.0)
	mask_dims = (512.0, 200.0)
}
highway_fader_params_2p = {
	style = highway_fader_2p
	rt_size = (1280.0, 720.0)
	rt_offset = (0.0, 0.0)
	clip_dims = (1024.0, 200.0)
	clip_offset = (0.0, 0.0)
	mask_dims = (1280.0, 200.0)
}
highway_fader_params_ps3 = {
	style = highway_fader_ps3
	rt_size = (1280.0, 720.0)
	rt_offset = (0.0, 0.0)
	clip_dims = (256.0, 256.0)
	clip_offset = (0.0, -64.0)
	mask_dims = (512.0, 200.0)
}
highway_fader_params_2p_ps3 = {
	style = highway_fader_2p_ps3
	rt_size = (1280.0, 720.0)
	rt_offset = (0.0, 0.0)
	clip_dims = (832.0, 200.0)
	clip_offset = (0.0, 0.0)
	mask_dims = (1040.0, 200.0)
}

script setup_bg_viewport 
	printf \{"Setting bg viewport"}
	destroy_bg_viewport
	if isxenon
		if ($current_num_players = 1)
			addparams \{$highway_fader_params}
		else
			addparams \{$highway_fader_params_2p}
		endif
	else
		if ($current_num_players = 1)
			addparams \{$highway_fader_params_ps3}
		else
			addparams \{$highway_fader_params_2p_ps3}
		endif
	endif
	pos = (2000.0, 300.0)
	pos = (<pos> + <clip_offset>)
	mask_pos = (<clip_dims> * 0.5 - <clip_offset>)
	bg_pos = (<clip_dims> * 0.5 - <pos> + <rt_offset>)
	if NOT screenelementexists \{id = ui_clip_root}
		createscreenelement {
			parent = root_window
			type = windowelement
			id = ui_clip_root
			just = [center center]
			pos = <pos>
			dims = <clip_dims>
		}
		createmaskedscreenelements {
			z_priority = -10
			mask_element = {
				id = viewport_mask_sprite
				parent = ui_clip_root
				type = spriteelement
				pos = <mask_pos>
				just = [center center]
				dims = <mask_dims>
				rgba = [255 255 255 255]
				alpha = 1
				z_priority = 110
				texture = white2
				rot_angle = -180
			}
			elements = [
				{
					parent = ui_clip_root
					type = viewportelement
					id = bg_viewport
					texture = viewport0
					pos = <bg_pos>
					just = [left top]
					dims = <rt_size>
					rgba = [128 128 128 255]
					alpha = 1
					has_shadow = true
					draw_debug_lines = true
					show_lightvolumes = true
					style = <style>
				}
			]
		}
	endif
	enable_bg_viewport_properties
	printf \{"Setting bg viewport end"}
endscript
highway_pulse_p1 = 0
highway_pulse_p2 = 0

script highway_pulse_multiplier_loss \{player_text = 'p1'
		multiplier = 1}
	if ($game_mode = p2_battle || $boss_battle = 1)
		return
	endif
	time = 0.1
	switch <multiplier>
		case 1
		push_pos = (0.0, 3.0)
		case 2
		push_pos = (0.0, 4.0)
		case 3
		push_pos = (0.0, 10.0)
		case 4
		push_pos = (0.0, 15.0)
		time = 0.11
		default
		push_pos = (0.0, 3.0)
	endswitch
	if (($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff) || ($game_mode = p2_coop) || ($game_mode = p2_quickplay))
		<push_pos> = (<push_pos> * 0.6)
	endif
	if (<player_text> = 'p1')
		highway_pulse = $highway_pulse_p1
	else
		highway_pulse = $highway_pulse_p2
	endif
	if (<highway_pulse> = 0)
		change \{highway_pulse = 1}
		formattext checksumname = container_id 'gem_container%p' p = <player_text> addtostringlookup = true
		getscreenelementposition id = <container_id>
		original_position = <screenelementpos>
		getrandomvalue \{name = random_x
			a = -7
			b = 7
			integer}
		doscreenelementmorph {id = <container_id> pos = (<original_position> + <push_pos> + ((1.0, 0.0) * <random_x>)) just = [center bottom] time = <time>}
		wait <time> seconds
		getrandomvalue \{name = random_x
			a = -7
			b = 7
			integer}
		doscreenelementmorph {id = <container_id> pos = (<original_position> - (<push_pos> * 0.7) + ((1.0, 0.0) * <random_x>)) just = [center bottom] time = <time>}
		wait <time> seconds
		getrandomvalue \{name = random_x
			a = -5
			b = 5
			integer}
		doscreenelementmorph {id = <container_id> pos = (<original_position> + (<push_pos> * 0.4) + ((1.0, 0.0) * <random_x>)) just = [center bottom] time = <time>}
		wait <time> seconds
		getrandomvalue \{name = random_x
			a = -5
			b = 5
			integer}
		doscreenelementmorph {id = <container_id> pos = (<original_position> - (<push_pos> * 0.3) + ((1.0, 0.0) * <random_x>)) just = [center bottom] time = <time>}
		wait <time> seconds
		getrandomvalue \{name = random_x
			a = -3
			b = 3
			integer}
		doscreenelementmorph {id = <container_id> pos = (<original_position> + (<push_pos> * 0.2) + ((1.0, 0.0) * <random_x>)) just = [center bottom] time = <time>}
		wait <time> seconds
		doscreenelementmorph {id = <container_id> pos = <original_position> just = [center bottom] time = <time>}
	endif
	change \{highway_pulse = 0}
endscript

script highway_visible 
	change \{highwayvisible = on}
endscript

script highway_invisible 
	change \{highwayvisible = off}
endscript
