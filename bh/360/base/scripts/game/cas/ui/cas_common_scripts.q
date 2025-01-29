
script cas_rotate_skater_left 
	killspawnedscript \{name = cas_rotate_skater}
	PlaySound \{Menu_ColorWheel_Rotate
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
	if IsPS3
		button = triangle
	else
		button = square
	endif
	spawnscriptlater cas_rotate_skater params = {angle = -3 button = <button>}
endscript

script cas_rotate_skater_right 
	killspawnedscript \{name = cas_rotate_skater}
	PlaySound \{Menu_ColorWheel_Rotate
		vol = -5
		pitch = -0.5
		buss = front_end}
	spawnscriptlater \{cas_rotate_skater
		params = {
			angle = 3
			button = R1
		}}
endscript

script cas_rotate_skater 
	begin
	if ControllerPressed <button>
		if GetCurrentCASObject
			if NOT (<cas_object> = BandLogoObject)
				<cas_object> :Obj_Rotate relative = ((<angle> * (0.0, 1.0, 0.0)))
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

script cas_pull_back_camera \{button = R2}
	printf \{'cas_pull_back_camera'}
	SetScriptCannotPause
	RequireParams \{[
			zoom_camera
		]
		all}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if NOT ScriptIsRunning \{task_menu_default_anim_in}
		Change \{pulled_back = 1}
		task_menu_retrieve_camera_base_name
		if (<zoom_camera> = <camera_name>)
			printf '%a = %b' a = <zoom_camera> b = <camera_name>
			return
		endif
		Change \{generic_menu_block_input = 1}
		Change \{cas_override_camera_time = 0.0}
		task_menu_default_anim_in base_name = <zoom_camera> do_not_hide ignore_time = 1 dont_cancel_cas_pull_cam = 1
		Change \{generic_menu_block_input = 0}
		SoundEvent \{event = CAR_Zoom_Out}
		OnExitRun cas_pull_back_camera_cleanup params = {base_name = <camera_name>}
		wait \{0.1
			seconds}
		begin
		if NOT ControllerPressed <button> <device_num>
			break
		endif
		wait \{1
			gameframe}
		repeat
		Change \{generic_menu_block_input = 1}
		task_menu_default_anim_in base_name = <camera_name> do_not_hide ignore_time = 1 dont_cancel_cas_pull_cam = 1
		Change \{generic_menu_block_input = 0}
		SoundEvent \{event = CAR_Zoom_In}
	endif
endscript

script cas_pull_back_camera_cleanup 
	Change target_menu_camera = <base_name>
	Change \{cas_override_camera_time = -1}
	Change \{pulled_back = 0}
endscript
cas_pull_back_camera_base = 'none'

script cas_pull_back_camera_gh \{button = R2}
	printf \{'cas_pull_back_camera_gh'}
	SetScriptCannotPause
	RequireParams \{[
			zoom_camera
		]
		all}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if NOT ScriptIsRunning \{task_menu_default_anim_in}
		if ($pulled_back = 0)
			task_menu_retrieve_camera_base_name
			if (<zoom_camera> = <camera_name>)
				return
			endif
			Change cas_pull_back_camera_base = <camera_name>
			Change \{generic_menu_block_input = 1}
			Change \{cas_override_camera_time = 0.0}
			task_menu_default_anim_in base_name = <zoom_camera> do_not_hide ignore_time = 1
			Change \{generic_menu_block_input = 0}
			Change \{cas_override_camera_time = -1}
			generic_menu_up_or_down_sound \{up}
			Change \{pulled_back = 1}
		else
			Change \{generic_menu_block_input = 1}
			Change \{cas_override_camera_time = 0.0}
			task_menu_default_anim_in base_name = ($cas_pull_back_camera_base) do_not_hide ignore_time = 1
			cas_pull_back_camera_base = 'none'
			Change \{generic_menu_block_input = 0}
			Change \{cas_override_camera_time = -1}
			Change \{pulled_back = 0}
		endif
	endif
endscript

script cas_pull_back_camera_adaptive \{button = R2
		pull_back_distance = 1.0}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	SetScriptCannotPause
	Change \{pulled_back = 1}
	task_menu_retrieve_camera_base_name
	task_menu_retrieve_camera_params camera_name = <camera_name>
	task_menu_retrieve_camera_DOF_params camera_name = <camera_name>
	if GotParam \{camera_params}
		Pos = (<camera_params>.Pos)
		Quat = (<camera_params>.Quat)
		RotateVector vector = (0.0, 0.0, -1.0) Quat = <Quat>
		back_pos = (<Pos> + <pull_back_distance> * <result_vector>)
		PlayIGCCam {
			id = cs_view_cam_id
			name = menu_view_cam_pullback
			viewport = bg_viewport
			LockTo = World
			Pos = <back_pos>
			Quat = <Quat>
			FOV = (<camera_params>.FOV)
			Play_hold = 1
			interrupt_current
		}
		if GotParam \{dof_params}
			GetDistance posA = <Pos> PosB = <back_pos>
			increase_dof_distance distance = <dist_atob> dof_params = <dof_params>
		endif
		wait \{0.3
			seconds}
		begin
		if NOT ControllerPressed <button> <device_num>
			break
		endif
		wait \{1
			gameframe}
		repeat
		KillCamAnim \{name = menu_view_cam_pullback}
		if GotParam \{dof_params}
			spawnscriptnow ApplyMenuDOF params = {dofParam = <dof_params>}
		endif
		wait \{0.3
			seconds}
	endif
	Change \{pulled_back = 0}
endscript

script increase_dof_distance 
	RequireParams \{[
			distance
			dof_params
		]
		all}
	new_dof_params = {
		<dof_params>
		farblurbegin = ((<dof_params>.farblurbegin) + <distance>)
		farblurend = ((<dof_params>.farblurend) + <distance>)
	}
	spawnscriptnow ApplyMenuDOF params = {dofParam = <new_dof_params>}
endscript

script cleanup_cas_menu_handlers 
	printf \{'cleanup_cas_menu_handlers'}
	if ScriptIsRunning \{cas_pull_back_camera_adaptive}
		killspawnedscript \{name = cas_pull_back_camera_adaptive}
	endif
	if ScriptIsRunning \{cas_pull_back_camera}
		killspawnedscript \{name = cas_pull_back_camera}
	endif
	if ScriptIsRunning \{cas_pull_back_camera_gh}
		killspawnedscript \{name = cas_pull_back_camera_gh}
	endif
	Change \{generic_menu_block_input = 0}
	cas_pull_back_camera_base = 'none'
	Change \{cas_override_camera_time = -1}
	Change \{pulled_back = 0}
	KillCamAnim \{name = menu_view_cam_pullback}
	KillCamAnim \{name = CASCamera}
	Change \{current_camera_cut_num = 0}
endscript

script generic_pause_exit_sound 
	ui_menu_select_sfx
endscript

script generic_menu_update_arrows \{menu_id = current_menu}
	if NOT ObjectExists id = <up_arrow_id>
		return
	endif
	if NOT ObjectExists id = <down_arrow_id>
		return
	endif
	if <menu_id> :Menu_SelectedIndexIs first
		SetScreenElementProps {
			id = <up_arrow_id>
			rgba = [128 128 128 0]
		}
	else
		SetScreenElementProps {
			id = <up_arrow_id>
			rgba = [128 128 128 128]
		}
	endif
	if <menu_id> :Menu_SelectedIndexIs last
		SetScreenElementProps {
			id = <down_arrow_id>
			rgba = [128 128 128 0]
		}
	else
		SetScreenElementProps {
			id = <down_arrow_id>
			rgba = [128 128 128 128]
		}
	endif
endscript
cas_free_cam_active = 0

script cas_toggle_free_cam 
	if (($cas_free_cam_active) = 0)
		Change \{cas_free_cam_active = 1}
	else
		Change \{cas_free_cam_active = 0}
	endif
	printf \{'cas_toggle_free_cam'}
	if NOT CD
		if NOT isguitarcontroller controller = <device_num>
			Change \{toggleviewmode_enabled = true}
			if ($view_mode = 0)
				ToggleViewMode \{no_reload}
			else
				Change \{view_mode = 2}
				ToggleViewMode \{no_reload}
			endif
		endif
	endif
endscript

script pick_correct_camera_cut 
	RequireParams \{[
			find_correct_camera
			camera_list
		]
		all}
	GetArraySize <camera_list>
	i = 0
	begin
	cam = (<camera_list> [<i>])
	if (<cam> = <find_correct_camera>)
		printf 'Found camera %s' s = <cam>
		Change current_camera_cut_num = <i>
		return
	endif
	i = (<i> + 1)
	repeat <array_size>
endscript

script setup_cas_menu_handlers controller = ($primary_controller)
	RequireParams \{[
			vmenu_id
		]
		all}
	if ((GotParam find_correct_camera) && (GotParam camera_list))
		pick_correct_camera_cut camera_list = <camera_list> find_correct_camera = <find_correct_camera>
	endif
	event_handlers = []
	if isguitarcontroller controller = <controller>
		if NOT GotParam \{no_rotate}
			if GotParam \{camera_list}
				AddArrayElement array = <event_handlers> element = {pad_option cas_change_camera_cut params = {camera_list = <camera_list> right}}
				event_handlers = <array>
			else
				AddArrayElement array = <event_handlers> element = {pad_option cas_rotate_skater_option}
				event_handlers = <array>
			endif
		endif
		if NOT GotParam \{no_zoom}
			if GotParam \{zoom_camera}
				AddArrayElement array = <event_handlers> element = {pad_L1 cas_pull_back_camera params = {button = l1 zoom_camera = <zoom_camera>}}
				event_handlers = <array>
			else
				AddArrayElement array = <event_handlers> element = {pad_L1 cas_pull_back_camera_adaptive params = {button = l1 pull_back_distance = <pull_back_distance>}}
				event_handlers = <array>
			endif
		endif
	elseif isdrumcontroller controller = <controller>
		if NOT GotParam \{no_rotate}
			if GotParam \{camera_list}
				AddArrayElement array = <event_handlers> element = {pad_option cas_change_camera_cut params = {camera_list = <camera_list> right}}
				event_handlers = <array>
			else
				AddArrayElement array = <event_handlers> element = {pad_option cas_rotate_skater_option}
				event_handlers = <array>
			endif
		endif
		if NOT GotParam \{no_zoom}
			if GotParam \{zoom_camera}
				if IsRBDrum controller = <controller>
					AddArrayElement array = <event_handlers> element = {pad_L1 cas_pull_back_camera params = {button = l1 zoom_camera = <zoom_camera>}}
				else
					AddArrayElement array = <event_handlers> element = {pad_L1 cas_pull_back_camera_gh params = {button = l1 zoom_camera = <zoom_camera>}}
				endif
				event_handlers = <array>
			else
				AddArrayElement array = <event_handlers> element = {pad_L1 cas_pull_back_camera_adaptive params = {button = l1 pull_back_distance = <pull_back_distance>}}
				event_handlers = <array>
			endif
		endif
	else
		event_handlers = [
			{pad_L3 cas_artist_flush}
			{pad_alt2 cas_toggle_free_cam}
		]
		if NOT GotParam \{no_rotate}
			if GotParam \{camera_list}
				AddArrayElement array = <event_handlers> element = {pad_R1 cas_change_camera_cut params = {camera_list = <camera_list> right}}
				AddArrayElement array = <array> element = {pad_L1 cas_change_camera_cut params = {camera_list = <camera_list> left}}
				event_handlers = <array>
			else
				AddArrayElement array = <event_handlers> element = {pad_L1 cas_rotate_skater_left}
				AddArrayElement array = <array> element = {pad_R1 cas_rotate_skater_right}
				event_handlers = <array>
			endif
		endif
		if NOT GotParam \{no_zoom}
			if GotParam \{zoom_camera}
				AddArrayElement array = <event_handlers> element = {pad_R2 cas_pull_back_camera params = {button = R2 zoom_camera = <zoom_camera>}}
				event_handlers = <array>
			else
				AddArrayElement array = <event_handlers> element = {pad_R2 cas_pull_back_camera_adaptive params = {button = R2 pull_back_distance = <pull_back_distance>}}
				event_handlers = <array>
			endif
		endif
	endif
	GetArraySize \{event_handlers}
	if (<array_size> > 0)
		SetScreenElementProps {
			id = <vmenu_id>
			event_handlers = <event_handlers>
			replace_handlers
		}
	endif
endscript
current_camera_cut_num = 0

script cas_change_camera_cut 
	RequireParams \{[
			camera_list
		]
		all}
	printf \{'cas_change_camera_cut'}
	if NOT ((ScriptIsRunning task_menu_default_anim_in) || (ScriptIsRunning cas_pull_back_camera) || (ScriptIsRunning cas_pull_back_camera_gh))
		Change \{cas_override_camera_time = -1}
		GetArraySize <camera_list>
		if (<array_size> = 0)
			return
		endif
		if GotParam \{right}
			SoundEvent \{event = GigBoard_Zoom_right}
			Change current_camera_cut_num = (($current_camera_cut_num) + 1)
		else
			SoundEvent \{event = GigBoard_Zoom_Left}
			Change current_camera_cut_num = (($current_camera_cut_num) -1)
		endif
		if (($current_camera_cut_num) > (<array_size> -1))
			Change \{current_camera_cut_num = 0}
		elseif (($current_camera_cut_num) < 0)
			Change current_camera_cut_num = (<array_size> -1)
		endif
		Change \{generic_menu_block_input = 1}
		task_menu_default_anim_in base_name = (<camera_list> [($current_camera_cut_num)]) do_not_hide
		Change \{generic_menu_block_input = 0}
	endif
endscript

script setup_cas_menu_handlers_restricted 
	RequireParams \{[
			vmenu_id
		]
		all}
	SetScreenElementProps {
		id = <vmenu_id>
		event_handlers =
		[
			{pad_L1 cas_rotate_skater_left}
			{pad_R1 cas_rotate_skater_right}
			{pad_L3 cas_artist_flush}
			{pad_alt2 cas_toggle_free_cam}
		]
		replace_handlers
	}
endscript

script GetInstrumentNodeName 
	if (<instrument> = None)
		return \{false}
	endif
	GetPakManCurrent \{map = zones}
	ExtendCrc <pak> '_TRG_Waypoint_' out = node_prefix
	ExtendCrc <node_prefix> 'Vocalist_Start' out = node
	return instrument_node_name = <node> true
endscript

script is_female_char 
	GetCurrentCASObject
	cas_get_is_female player = ($cas_current_player)
	if (<is_female> = 1)
		return \{true}
	else
		return \{false}
	endif
endscript

script create_font_arrays 
	GetArraySize ($car_font_list)
	font_list_size = <array_size>
	i = 0
	begin
	new_global_value = ($car_char_list)
	GetArraySize (<new_global_value>)
	j = 0
	begin
	FormatText checksumname = font '%i' i = ((($car_font_list) [<i>]).font)
	newstruct = {(<new_global_value> [<j>]) font = <font>}
	SetArrayElement arrayName = new_global_value index = <j> newValue = <newstruct>
	j = (<j> + 1)
	repeat <array_size>
	Change globalname = ((($car_font_list) [<i>]).global_array) newValue = <new_global_value>
	i = (<i> + 1)
	repeat <font_list_size>
endscript

script make_generic_car_menu 
	make_generic_menu {
		<...>
	}
endscript

script generic_car_menu_physics_elements 
	create_2D_spring_system \{desc_id = generic_menu
		num_springs = 2
		stiffness = 50
		rest_length = 1}
	if generic_menu :Desc_ResolveAlias \{name = alias_instrument_add
			param = instrument_add_id}
		<instrument_add_id> :Obj_SpawnScript ui_shakey
	else
		ScriptAssert \{'pdetrich'}
	endif
	if generic_menu :Desc_ResolveAlias \{name = alias_instrument_add
			param = instrument_add_id}
		<instrument_add_id> :Obj_SpawnScript ui_frazzmatazz
	else
		ScriptAssert \{'pdetrich'}
	endif
	if generic_menu :Desc_ResolveAlias \{name = alias_CAR_title_banner
			param = anim2_id}
		<anim2_id> :Obj_SpawnScript ui_shakeytime params = {Pos = (430.0, 103.0)}
	else
		ScriptAssert \{'UI_art'}
	endif
	if generic_menu :Desc_ResolveAlias \{name = alias_skull_add_container
			param = skull_add_container_id}
		<skull_add_container_id> :Obj_SpawnScript ui_shakey
	else
		ScriptAssert \{'pdetrich'}
	endif
	if generic_menu :Desc_ResolveAlias \{name = alias_skull_add_container
			param = skull_add_container_id}
		<skull_add_container_id> :Obj_SpawnScript ui_frazzmatazz
	else
		ScriptAssert \{'pdetrich'}
	endif
endscript

script add_car_menu_text_item \{focus_script = focus_car_menu_text_item
		unfocus_script = unfocus_car_menu_text_item}
	add_generic_menu_text_item {
		<...>
		desc = 'generic_car_menu_text_item'
		font = fontgrid_text_A1
		rgba = (($cas_color_scheme).text_color)
		focus_script = <focus_script>
		unfocus_script = <unfocus_script>
	}
	return item_container_id = <item_container_id>
endscript

script add_car_layer_options_menu_text_item 
	add_car_menu_text_item {
		<...>
		focus_script = focus_car_layer_options_menu_text_item
		unfocus_script = unfocus_car_layer_options_menu_text_item
		not_focusable_alpha = 0.3
		dims = (500.0, 40.0)
	}
	<item_container_id> :SE_SetProps generic_menu_smenu_textitem_text_scale = 1.22
	return item_container_id = <item_container_id>
endscript

script focus_car_menu_text_item 
	if ScreenElementExists \{id = generic_menu}
		<id> :SE_SetProps generic_menu_smenu_textitem_text_rgba = (($cas_color_scheme).text_focus_color)
		<id> :SE_SetProps generic_menu_smenu_textitem_text_font = fontgrid_title_a1
		<id> :SE_SetProps generic_menu_smenu_textitem_text_scale = 1.22
		<id> :SE_SetProps light_bar_alpha = 1
		if NOT GotParam \{do_not_scroll}
			set_generic_menu_scrollbar_pos \{id = generic_menu}
		endif
		ExtendCRCWithString checksum = <id> string = '_particle'
		<id> :Obj_SpawnScript create_ui_highlight_particles params = {id = <ExtendedChecksum> Pos = (900.0, 0.0) z = 9}
	endif
	if GotParam \{additional_focus_script}
		<additional_focus_script> <additional_focus_params>
	endif
endscript

script unfocus_car_menu_text_item 
	<id> :SE_SetProps generic_menu_smenu_textitem_text_rgba = (($cas_color_scheme).text_color)
	<id> :SE_SetProps generic_menu_smenu_textitem_text_font = fontgrid_text_A1
	<id> :SE_SetProps generic_menu_smenu_textitem_text_scale = 1
	<id> :SE_SetProps light_bar_alpha = 0
	ExtendCRCWithString checksum = <id> string = '_particle'
	Destroy2DParticleSystem id = <ExtendedChecksum> kill_when_empty
	if GotParam \{additional_unfocus_script}
		<additional_unfocus_script> {id = <id>} <additional_unfocus_params>
	endif
endscript

script focus_car_layer_options_menu_text_item 
	if ScreenElementExists \{id = generic_menu}
		<id> :SE_SetProps generic_menu_smenu_textitem_text_rgba = (($cas_color_scheme).text_focus_color)
		<id> :SE_SetProps generic_menu_smenu_textitem_text_font = fontgrid_title_a1
		<id> :SE_SetProps generic_menu_smenu_textitem_text_scale = 1.4399999
		<id> :SE_SetProps light_bar_alpha = 1
		if NOT GotParam \{do_not_scroll}
			set_generic_menu_scrollbar_pos \{id = generic_menu}
		endif
		ExtendCRCWithString checksum = <id> string = '_particle'
		<id> :Obj_SpawnScript create_ui_highlight_particles params = {id = <ExtendedChecksum> Pos = (650.0, 0.0) z = 9}
	endif
	if GotParam \{additional_focus_script}
		<additional_focus_script> <additional_focus_params>
	endif
endscript

script unfocus_car_layer_options_menu_text_item 
	<id> :SE_SetProps generic_menu_smenu_textitem_text_rgba = (($cas_color_scheme).text_color)
	<id> :SE_SetProps generic_menu_smenu_textitem_text_font = fontgrid_text_A1
	<id> :SE_SetProps generic_menu_smenu_textitem_text_scale = 1.22
	<id> :SE_SetProps light_bar_alpha = 0
	ExtendCRCWithString checksum = <id> string = '_particle'
	Destroy2DParticleSystem id = <ExtendedChecksum> kill_when_empty
	if GotParam \{additional_unfocus_script}
		<additional_unfocus_script> {id = <id>} <additional_unfocus_params>
	endif
endscript

script add_car_menu_icon_item 
	add_generic_menu_icon_item {
		<...>
		desc = 'generic_car_menu_icon_item'
		font = fontgrid_text_A1
		rgba = (($cas_color_scheme).text_color)
		focus_script = focus_car_menu_icon_item
		unfocus_script = unfocus_car_menu_icon_item
	}
	<item_container_id> :SE_SetProps highlight_btn_alpha = 0.0
	return item_container_id = <item_container_id>
endscript

script focus_car_menu_icon_item 
	if ScreenElementExists \{id = generic_menu}
		<id> :SE_SetProps generic_menu_smenu_iconitem_text_rgba = (($cas_color_scheme).text_focus_color)
		<id> :SE_SetProps generic_menu_smenu_iconitem_text_font = fontgrid_title_a1
		<id> :SE_SetProps generic_menu_smenu_iconitem_text_scale = 1.5
		<id> :SE_SetProps highlight_btn_alpha = 1
		if NOT GotParam \{do_not_scroll}
			set_generic_menu_scrollbar_pos id = <id>
		endif
		ExtendCRCWithString checksum = <id> string = '_particle'
		<id> :Obj_SpawnScript create_ui_highlight_particles params = {id = <ExtendedChecksum> Pos = (900.0, 0.0) z = 9}
	endif
	if GotParam \{additional_focus_script}
		<additional_focus_script> <additional_focus_params>
	endif
endscript

script unfocus_car_menu_icon_item 
	<id> :SE_SetProps generic_menu_smenu_iconitem_text_rgba = (($cas_color_scheme).text_color)
	<id> :SE_SetProps generic_menu_smenu_iconitem_text_font = <font>
	<id> :SE_SetProps generic_menu_smenu_iconitem_text_scale = 1.0
	<id> :SE_SetProps generic_menu_smenu_iconitem_highlight_alpha = 0 time = 0.5 anim = fast_in
	<id> :SE_SetProps highlight_btn_alpha = 0.0
	ExtendCRCWithString checksum = <id> string = '_particle'
	Destroy2DParticleSystem id = <ExtendedChecksum> kill_when_empty
	if GotParam \{additional_unfocus_script}
		<additional_unfocus_script> {id = <id>} <additional_unfocus_params>
	endif
endscript
