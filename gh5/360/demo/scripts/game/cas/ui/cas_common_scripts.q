
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
cas_override_camera_time = -1

script cas_pull_back_camera \{button = r2}
	printf \{'cas_pull_back_camera'}
	setscriptcannotpause
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
			printf '%a = %b' a = <zoom_camera> b = <camera_name>
			return
		endif
		change \{generic_menu_block_input = 1}
		change \{cas_override_camera_time = 0.0}
		task_menu_default_anim_in base_name = <zoom_camera> do_not_hide ignore_time = 1 dont_cancel_cas_pull_cam = 1
		change \{generic_menu_block_input = 0}
		soundevent \{event = car_zoom_out}
		onexitrun cas_pull_back_camera_cleanup params = {base_name = <camera_name>}
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
		task_menu_default_anim_in base_name = <camera_name> do_not_hide ignore_time = 1 dont_cancel_cas_pull_cam = 1
		change \{generic_menu_block_input = 0}
		soundevent \{event = car_zoom_in}
	endif
endscript

script cas_pull_back_camera_cleanup 
	change target_menu_camera = <base_name>
	change \{cas_override_camera_time = -1}
	change \{pulled_back = 0}
endscript
cas_pull_back_camera_base = 'none'

script cas_pull_back_camera_gh \{button = r2}
	printf \{'cas_pull_back_camera_gh'}
	setscriptcannotpause
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
			change \{cas_override_camera_time = -1}
			change \{pulled_back = 0}
		endif
	endif
endscript

script cas_pull_back_camera_adaptive \{button = r2
		pull_back_distance = 1.0}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	setscriptcannotpause
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
			change \{toggleviewmode_enabled = true}
			if ($view_mode = 0)
				toggleviewmode \{no_reload}
			else
				change \{view_mode = 2}
				toggleviewmode \{no_reload}
			endif
		endif
	endif
endscript

script pick_correct_camera_cut 
	requireparams \{[
			find_correct_camera
			camera_list
		]
		all}
	getarraysize <camera_list>
	i = 0
	begin
	cam = (<camera_list> [<i>])
	if (<cam> = <find_correct_camera>)
		printf 'Found camera %s' s = <cam>
		change current_camera_cut_num = <i>
		return
	endif
	i = (<i> + 1)
	repeat <array_size>
endscript

script setup_cas_menu_handlers controller = ($primary_controller)
	requireparams \{[
			vmenu_id
		]
		all}
	if ((gotparam find_correct_camera) && (gotparam camera_list))
		pick_correct_camera_cut camera_list = <camera_list> find_correct_camera = <find_correct_camera>
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
	getpakmancurrent \{map = zones}
	extendcrc <pak> '_TRG_Waypoint_' out = node_prefix
	extendcrc <node_prefix> 'Vocalist_Start' out = node
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
	new_global_value = ($car_char_list)
	getarraysize (<new_global_value>)
	j = 0
	begin
	formattext checksumname = font '%i' i = ((($car_font_list) [<i>]).font)
	newstruct = {(<new_global_value> [<j>]) font = <font>}
	setarrayelement arrayname = new_global_value index = <j> newvalue = <newstruct>
	j = (<j> + 1)
	repeat <array_size>
	change globalname = ((($car_font_list) [<i>]).global_array) newvalue = <new_global_value>
	i = (<i> + 1)
	repeat <font_list_size>
endscript

script make_generic_car_menu 
	make_generic_menu {
		<...>
	}
	generic_car_menu_physics_elements
endscript

script generic_car_menu_physics_elements 
	create_2d_spring_system \{desc_id = generic_menu
		num_springs = 2
		stiffness = 50
		rest_length = 1}
	if generic_menu :desc_resolvealias \{name = alias_instrument_add
			param = instrument_add_id}
		<instrument_add_id> :obj_spawnscript ui_shakey
	else
		scriptassert \{'pdetrich'}
	endif
	if generic_menu :desc_resolvealias \{name = alias_instrument_add
			param = instrument_add_id}
		<instrument_add_id> :obj_spawnscript ui_frazzmatazz
	else
		scriptassert \{'pdetrich'}
	endif
	if generic_menu :desc_resolvealias \{name = alias_car_title_banner
			param = anim2_id}
		<anim2_id> :obj_spawnscript ui_shakeytime params = {pos = (430.0, 103.0)}
	else
		scriptassert \{'UI_art'}
	endif
	if generic_menu :desc_resolvealias \{name = alias_skull_add_container
			param = skull_add_container_id}
		<skull_add_container_id> :obj_spawnscript ui_shakey
	else
		scriptassert \{'pdetrich'}
	endif
	if generic_menu :desc_resolvealias \{name = alias_skull_add_container
			param = skull_add_container_id}
		<skull_add_container_id> :obj_spawnscript ui_frazzmatazz
	else
		scriptassert \{'pdetrich'}
	endif
endscript

script add_car_menu_text_item 
	add_generic_menu_text_item {
		<...>
		desc = 'generic_car_menu_text_item'
		font = fontgrid_title_a1
		rgba = (($cas_color_scheme).text_color)
		focus_script = focus_car_menu_text_item
		unfocus_script = unfocus_car_menu_text_item
		not_focusable_rgba = (($cas_color_scheme).text_unfocusable_color)
	}
	create_2d_spring_system desc_id = <item_container_id> num_springs = 2 stiffness = 50 rest_length = 1
	<item_container_id> :se_setprops highlight_btn_alpha = 0.0
	return item_container_id = <item_container_id>
endscript

script focus_car_menu_text_item 
	if screenelementexists \{id = generic_menu}
		<id> :se_setprops generic_menu_smenu_textitem_text_rgba = (($cas_color_scheme).text_focus_color)
		<id> :se_setprops generic_menu_smenu_textitem_text_font = <font>
		<id> :se_setprops highlight_btn_alpha = 1
		if NOT gotparam \{do_not_scroll}
			set_generic_menu_scrollbar_pos id = <id>
		endif
	endif
	if gotparam \{additional_focus_script}
		<additional_focus_script> <additional_focus_params>
	endif
endscript

script unfocus_car_menu_text_item 
	<id> :se_setprops generic_menu_smenu_textitem_text_rgba = (($cas_color_scheme).text_color)
	<id> :se_setprops generic_menu_smenu_textitem_text_font = <font>
	<id> :se_setprops highlight_btn_alpha = 0.0
	if gotparam \{additional_unfocus_script}
		<additional_unfocus_script> {id = <id>} <additional_unfocus_params>
	endif
endscript

script add_car_menu_icon_item 
	add_generic_menu_icon_item {
		<...>
		desc = 'generic_car_menu_icon_item'
		font = fontgrid_title_a1
		rgba = (($cas_color_scheme).text_color)
		focus_script = focus_car_menu_icon_item
		unfocus_script = unfocus_car_menu_icon_item
	}
	create_2d_spring_system desc_id = <item_container_id> num_springs = 2 stiffness = 50 rest_length = 1
	<item_container_id> :se_setprops highlight_btn_alpha = 0.0
	return item_container_id = <item_container_id>
endscript

script focus_car_menu_icon_item 
	if screenelementexists \{id = generic_menu}
		<id> :se_setprops generic_menu_smenu_iconitem_text_rgba = (($cas_color_scheme).text_focus_color)
		<id> :se_setprops generic_menu_smenu_iconitem_text_font = <font>
		<id> :se_setprops highlight_btn_alpha = 1
		<id> :se_setprops generic_menu_smenu_iconitem_highlight_alpha = 1 time = 0.1 anim = fast_in
		if NOT gotparam \{do_not_scroll}
			set_generic_menu_scrollbar_pos id = <id>
		endif
	endif
	if gotparam \{additional_focus_script}
		<additional_focus_script> <additional_focus_params>
	endif
endscript

script unfocus_car_menu_icon_item 
	<id> :se_setprops generic_menu_smenu_iconitem_text_rgba = (($cas_color_scheme).text_color)
	<id> :se_setprops generic_menu_smenu_iconitem_text_font = <font>
	<id> :se_setprops generic_menu_smenu_iconitem_highlight_alpha = 0 time = 0.5 anim = fast_in
	<id> :se_setprops highlight_btn_alpha = 0.0
	if gotparam \{additional_unfocus_script}
		<additional_unfocus_script> {id = <id>} <additional_unfocus_params>
	endif
endscript
