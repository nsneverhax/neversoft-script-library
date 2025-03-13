
script cas_rotate_skater_left 
	killspawnedscript \{name = cas_rotate_skater}
	playsound \{menu_colorwheel_rotate
		vol = -5
		pitch = 0.5
		buss = front_end}
	spawnscriptlater \{cas_rotate_skater
		params = {
			angle = -3
			button = l1
		}}
endscript

script cas_rotate_skater_option 
	killspawnedscript \{name = cas_rotate_skater}
	if isps3
		button = triangle
	else
		button = square
	endif
	spawnscriptlater cas_rotate_skater params = {angle = -3 button = <button>}
endscript

script cas_rotate_skater_right 
	killspawnedscript \{name = cas_rotate_skater}
	playsound \{menu_colorwheel_rotate
		vol = -5
		pitch = -0.5
		buss = front_end}
	spawnscriptlater \{cas_rotate_skater
		params = {
			angle = 3
			button = r1
		}}
endscript

script cas_rotate_skater 
	begin
	if controllerpressed <button>
		if getcurrentcasobject
			if NOT (<cas_object> = bandlogoobject)
				<cas_object> :obj_rotate relative = ((<angle> * (0.0, 1.0, 0.0)))
			endif
		endif
	else
		break
	endif
	wait \{1
		frame}
	repeat
endscript

script cas_setup_rotating_camera \{fov = 70}
	printf \{'cas_setup_rotating_camera'}
	cas_parts_pos_script = cas_get_part_camera_pos_bedroom
	if gotparam \{cam_anim}
		<cas_parts_pos_script> cam_anim = <cam_anim>
	else
		<cas_parts_pos_script> cam_anim = none
	endif
	killskatercamanim \{all}
	playigccam {
		viewport = bg_viewport
		lockto = world
		pos = <cam_pos>
		quat = <cam_quat>
		fov = <cam_fov>
		play_hold = 1
		interrupt_current
		name = cascamera
	}
endscript
cas_override_camera_time = -1

script cas_pull_back_camera \{button = r2}
	printf \{'cas_pull_back_camera'}
	requireparams \{[
			zoom_camera
		]
		all}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	if NOT scriptisrunning \{task_menu_default_anim_in}
		change \{pulled_back = 1}
		task_menu_retrieve_camera_base_name
		if (<zoom_camera> = <camera_name>)
			return
		endif
		change \{generic_menu_block_input = 1}
		change \{cas_override_camera_time = 0.0}
		task_menu_default_anim_in base_name = <zoom_camera> do_not_hide ignore_time = 1
		change \{generic_menu_block_input = 0}
		generic_menu_up_or_down_sound \{up}
		wait \{0.1
			seconds}
		begin
		if NOT controllerpressed <button> <device_num>
			break
		endif
		wait \{1
			gameframe}
		repeat
		change \{generic_menu_block_input = 1}
		task_menu_default_anim_in base_name = <camera_name> do_not_hide ignore_time = 1
		change \{generic_menu_block_input = 0}
		generic_menu_up_or_down_sound \{down}
		change \{cas_override_camera_time = -1}
		change \{pulled_back = 0}
	endif
endscript
cas_pull_back_camera_base = 'none'

script cas_pull_back_camera_gh \{button = r2}
	printf \{'cas_pull_back_camera_gh'}
	requireparams \{[
			zoom_camera
		]
		all}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	if NOT scriptisrunning \{task_menu_default_anim_in}
		if ($pulled_back = 0)
			task_menu_retrieve_camera_base_name
			if (<zoom_camera> = <camera_name>)
				return
			endif
			change cas_pull_back_camera_base = <camera_name>
			change \{generic_menu_block_input = 1}
			change \{cas_override_camera_time = 0.0}
			task_menu_default_anim_in base_name = <zoom_camera> do_not_hide ignore_time = 1
			change \{generic_menu_block_input = 0}
			change \{cas_override_camera_time = -1}
			generic_menu_up_or_down_sound \{up}
			change \{pulled_back = 1}
		else
			change \{generic_menu_block_input = 1}
			change \{cas_override_camera_time = 0.0}
			task_menu_default_anim_in base_name = ($cas_pull_back_camera_base) do_not_hide ignore_time = 1
			cas_pull_back_camera_base = 'none'
			change \{generic_menu_block_input = 0}
			generic_menu_up_or_down_sound \{down}
			change \{cas_override_camera_time = -1}
			change \{pulled_back = 0}
		endif
	endif
endscript

script cas_pull_back_camera_adaptive \{button = r2
		pull_back_distance = 1.0}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	change \{pulled_back = 1}
	task_menu_retrieve_camera_base_name
	task_menu_retrieve_camera_params camera_name = <camera_name>
	task_menu_retrieve_camera_dof_params camera_name = <camera_name>
	if gotparam \{camera_params}
		pos = (<camera_params>.pos)
		quat = (<camera_params>.quat)
		rotatevector vector = (0.0, 0.0, -1.0) quat = <quat>
		back_pos = (<pos> + <pull_back_distance> * <result_vector>)
		playigccam {
			id = cs_view_cam_id
			name = menu_view_cam_pullback
			viewport = bg_viewport
			lockto = world
			pos = <back_pos>
			quat = <quat>
			fov = (<camera_params>.fov)
			play_hold = 1
			interrupt_current
		}
		if gotparam \{dof_params}
			getdistance posa = <pos> posb = <back_pos>
			increase_dof_distance distance = <dist_atob> dof_params = <dof_params>
		endif
		soundevent \{event = menu_car_zoomout}
		wait \{0.3
			seconds}
		begin
		if NOT controllerpressed <button> <device_num>
			break
		endif
		wait \{1
			gameframe}
		repeat
		killcamanim \{name = menu_view_cam_pullback}
		if gotparam \{dof_params}
			spawnscriptnow applymenudof params = {dofparam = <dof_params>}
		endif
		soundevent \{event = menu_car_zoomin}
		wait \{0.3
			seconds}
	endif
	change \{pulled_back = 0}
endscript

script increase_dof_distance 
	requireparams \{[
			distance
			dof_params
		]
		all}
	new_dof_params = {
		<dof_params>
		farblurbegin = ((<dof_params>.farblurbegin) + <distance>)
		farblurend = ((<dof_params>.farblurend) + <distance>)
	}
	spawnscriptnow applymenudof params = {dofparam = <new_dof_params>}
endscript

script cleanup_cas_menu_handlers 
	printf \{'cleanup_cas_menu_handlers'}
	if scriptisrunning \{cas_pull_back_camera_adaptive}
		killspawnedscript \{name = cas_pull_back_camera_adaptive}
	endif
	if scriptisrunning \{cas_pull_back_camera}
		killspawnedscript \{name = cas_pull_back_camera}
	endif
	if scriptisrunning \{cas_pull_back_camera_gh}
		killspawnedscript \{name = cas_pull_back_camera_gh}
	endif
	change \{generic_menu_block_input = 0}
	cas_pull_back_camera_base = 'none'
	change \{cas_override_camera_time = -1}
	change \{pulled_back = 0}
	killcamanim \{name = menu_view_cam_pullback}
	killcamanim \{name = cascamera}
	change \{current_camera_cut_num = 0}
endscript

script generic_pause_exit_sound 
	ui_menu_select_sfx
endscript

script generic_menu_update_arrows \{menu_id = current_menu}
	if NOT objectexists id = <up_arrow_id>
		return
	endif
	if NOT objectexists id = <down_arrow_id>
		return
	endif
	if <menu_id> :menu_selectedindexis first
		setscreenelementprops {
			id = <up_arrow_id>
			rgba = [128 128 128 0]
		}
	else
		setscreenelementprops {
			id = <up_arrow_id>
			rgba = [128 128 128 128]
		}
	endif
	if <menu_id> :menu_selectedindexis last
		setscreenelementprops {
			id = <down_arrow_id>
			rgba = [128 128 128 0]
		}
	else
		setscreenelementprops {
			id = <down_arrow_id>
			rgba = [128 128 128 128]
		}
	endif
endscript
cas_free_cam_active = 0

script cas_toggle_free_cam 
	if (($cas_free_cam_active) = 0)
		change \{cas_free_cam_active = 1}
	else
		change \{cas_free_cam_active = 0}
	endif
	printf \{'cas_toggle_free_cam'}
	if NOT cd
		if NOT isguitarcontroller controller = <device_num>
			change \{toggleviewmode_enabled = 1}
			if ($view_mode = 0)
				toggleviewmode \{no_reload}
			else
				change \{view_mode = 2}
				toggleviewmode \{no_reload}
			endif
		endif
	endif
endscript

script setup_cas_menu_handlers controller = ($primary_controller)
	requireparams \{[
			vmenu_id
		]
		all}
	if NOT (($menu_over_ride_exclusive_device) = -1)
		controller = ($menu_over_ride_exclusive_device)
	endif
	event_handlers = []
	if isguitarcontroller controller = <controller>
		if NOT gotparam \{no_rotate}
			if gotparam \{camera_list}
				addarrayelement array = <event_handlers> element = {pad_option cas_change_camera_cut params = {camera_list = <camera_list> right}}
				event_handlers = <array>
			else
				addarrayelement array = <event_handlers> element = {pad_option cas_rotate_skater_option}
				event_handlers = <array>
			endif
		endif
		if NOT gotparam \{no_zoom}
			if gotparam \{zoom_camera}
				addarrayelement array = <event_handlers> element = {pad_l1 cas_pull_back_camera params = {button = l1 zoom_camera = <zoom_camera>}}
				event_handlers = <array>
			else
				addarrayelement array = <event_handlers> element = {pad_l1 cas_pull_back_camera_adaptive params = {button = l1 pull_back_distance = <pull_back_distance>}}
				event_handlers = <array>
			endif
		endif
	elseif isdrumcontroller controller = <controller>
		if NOT gotparam \{no_rotate}
			if gotparam \{camera_list}
				addarrayelement array = <event_handlers> element = {pad_option cas_change_camera_cut params = {camera_list = <camera_list> right}}
				event_handlers = <array>
			else
				addarrayelement array = <event_handlers> element = {pad_option cas_rotate_skater_option}
				event_handlers = <array>
			endif
		endif
		if NOT gotparam \{no_zoom}
			if gotparam \{zoom_camera}
				if isrbdrum controller = <controller>
					addarrayelement array = <event_handlers> element = {pad_l1 cas_pull_back_camera params = {button = l1 zoom_camera = <zoom_camera>}}
				else
					addarrayelement array = <event_handlers> element = {pad_l1 cas_pull_back_camera_gh params = {button = l1 zoom_camera = <zoom_camera>}}
				endif
				event_handlers = <array>
			else
				addarrayelement array = <event_handlers> element = {pad_l1 cas_pull_back_camera_adaptive params = {button = l1 pull_back_distance = <pull_back_distance>}}
				event_handlers = <array>
			endif
		endif
	else
		event_handlers = [
			{pad_l3 cas_artist_flush}
			{pad_alt2 cas_toggle_free_cam}
		]
		if NOT gotparam \{no_rotate}
			if gotparam \{camera_list}
				addarrayelement array = <event_handlers> element = {pad_r1 cas_change_camera_cut params = {camera_list = <camera_list> right}}
				addarrayelement array = <array> element = {pad_l1 cas_change_camera_cut params = {camera_list = <camera_list> left}}
				event_handlers = <array>
			else
				addarrayelement array = <event_handlers> element = {pad_l1 cas_rotate_skater_left}
				addarrayelement array = <array> element = {pad_r1 cas_rotate_skater_right}
				event_handlers = <array>
			endif
		endif
		if NOT gotparam \{no_zoom}
			if gotparam \{zoom_camera}
				addarrayelement array = <event_handlers> element = {pad_r2 cas_pull_back_camera params = {button = r2 zoom_camera = <zoom_camera>}}
				event_handlers = <array>
			else
				addarrayelement array = <event_handlers> element = {pad_r2 cas_pull_back_camera_adaptive params = {button = r2 pull_back_distance = <pull_back_distance>}}
				event_handlers = <array>
			endif
		endif
	endif
	getarraysize \{event_handlers}
	if (<array_size> > 0)
		setscreenelementprops {
			id = <vmenu_id>
			event_handlers = <event_handlers>
			replace_handlers
		}
	endif
endscript
current_camera_cut_num = 0

script cas_change_camera_cut 
	requireparams \{[
			camera_list
		]
		all}
	printf \{'cas_change_camera_cut'}
	if NOT ((scriptisrunning task_menu_default_anim_in) || (scriptisrunning cas_pull_back_camera) || (scriptisrunning cas_pull_back_camera_gh))
		change \{cas_override_camera_time = -1}
		getarraysize <camera_list>
		if (<array_size> = 0)
			return
		endif
		if gotparam \{right}
			soundevent \{event = gigboard_zoom_right}
			change current_camera_cut_num = (($current_camera_cut_num) + 1)
		else
			soundevent \{event = gigboard_zoom_left}
			change current_camera_cut_num = (($current_camera_cut_num) -1)
		endif
		if (($current_camera_cut_num) > (<array_size> -1))
			change \{current_camera_cut_num = 0}
		elseif (($current_camera_cut_num) < 0)
			change current_camera_cut_num = (<array_size> -1)
		endif
		change \{generic_menu_block_input = 1}
		task_menu_default_anim_in base_name = (<camera_list> [($current_camera_cut_num)]) do_not_hide
		change \{generic_menu_block_input = 0}
	endif
endscript

script setup_cas_menu_handlers_restricted 
	requireparams \{[
			vmenu_id
		]
		all}
	setscreenelementprops {
		id = <vmenu_id>
		event_handlers =
		[
			{pad_l1 cas_rotate_skater_left}
			{pad_r1 cas_rotate_skater_right}
			{pad_l3 cas_artist_flush}
			{pad_alt2 cas_toggle_free_cam}
		]
		replace_handlers
	}
endscript

script getinstrumentnodename 
	if (<instrument> = none)
		return \{false}
	endif
	node = z_soundcheck_trg_waypoint_guitar_start
	switch (<instrument>)
		case guitar
		case bass
		<node> = z_soundcheck_trg_waypoint_guitar_start
		case drum
		<node> = z_soundcheck_trg_waypoint_drum_start
		case vocals
		<node> = z_soundcheck_trg_waypoint_microphone_start
	endswitch
	return instrument_node_name = <node> true
endscript

script is_female_char 
	getcurrentcasobject
	cas_get_is_female player = ($cas_current_player)
	if (<is_female> = 1)
		return \{true}
	else
		return \{false}
	endif
endscript

script create_font_arrays 
	getarraysize ($car_font_list)
	font_list_size = <array_size>
	i = 0
	begin
	formattext checksumname = new_global_name 'car_%i' i = ((($car_font_list) [<i>]).font)
	new_global_value = ($car_char_list)
	getarraysize (<new_global_value>)
	j = 0
	begin
	formattext checksumname = font '%i' i = ((($car_font_list) [<i>]).font)
	newstruct = {(<new_global_value> [<j>]) font = <font>}
	setarrayelement arrayname = new_global_value index = <j> newvalue = <newstruct>
	j = (<j> + 1)
	repeat <array_size>
	newglobal name = <new_global_name> value = <new_global_value>
	i = (<i> + 1)
	repeat <font_list_size>
endscript
