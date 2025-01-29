
script cas_rotate_skater_left 
	KillSpawnedScript \{Name = cas_rotate_skater}
	PlaySound \{menu_colorwheel_rotate
		vol = -5
		pitch = 0.5
		buss = Front_End}
	SpawnScriptLater \{cas_rotate_skater
		params = {
			angle = -3
			button = L1
		}}
endscript

script cas_rotate_skater_option 
	KillSpawnedScript \{Name = cas_rotate_skater}
	if isps3
		button = Triangle
	else
		button = X
	endif
	SpawnScriptLater cas_rotate_skater params = {angle = -3 button = <button>}
endscript

script cas_rotate_skater_right 
	KillSpawnedScript \{Name = cas_rotate_skater}
	PlaySound \{menu_colorwheel_rotate
		vol = -5
		pitch = -0.5
		buss = Front_End}
	SpawnScriptLater \{cas_rotate_skater
		params = {
			angle = 3
			button = R1
		}}
endscript

script cas_rotate_skater 
	begin
	if ControllerPressed <button>
		if getcurrentcasobject
			if NOT (<cas_object> = bandlogoobject)
				<cas_object> :Obj_Rotate relative = ((<angle> * (0.0, 1.0, 0.0)))
			endif
		endif
	else
		break
	endif
	Wait \{1
		Frame}
	repeat
endscript

script cas_setup_rotating_camera \{FOV = 70}

	cas_parts_pos_script = cas_get_part_camera_pos_bedroom
	if GotParam \{cam_anim}
		switch <cam_anim>
			case hand
			case torso
			case adjtorso
			case accessory
			case waist
			0xd518ab19 \{video = 0x812b3ad0}
			case misc_head
			case Misc
			case head
			case headtop
			0xd518ab19 \{video = 0x51399456}
			case legs
			case pants
			case calves
			0xd518ab19 \{video = 0x86528a24}
			case shoes
			0xd518ab19 \{video = 0xccc51098}
			case guitarneck
			case guitarhead
			case guitarbody
			case guitarstart
			0xd518ab19 \{video = 0x4aaed581}
			case drumstart
			0xd518ab19 \{video = 0xeecd2162}
			default

		endswitch
	endif
	if GotParam \{cam_anim}
		<cas_parts_pos_script> cam_anim = <cam_anim>
	else
		<cas_parts_pos_script> cam_anim = None
	endif
	KillSkaterCamAnim \{all}
	PlayIGCCam {
		viewport = bg_viewport
		LockTo = World
		Pos = <cam_pos>
		Quat = <cam_quat>
		FOV = <cam_fov>
		play_hold = 1
		interrupt_current
		Name = cascamera
	}
endscript
cas_override_camera_time = -1

script cas_pull_back_camera \{button = R2}


	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if NOT ScriptIsRunning \{task_menu_default_anim_in}
		Change \{pulled_back = 1}
		task_menu_retrieve_camera_base_name
		if (<zoom_camera> = <Camera_Name>)
			return
		endif
		Change \{generic_menu_block_input = 1}
		Change \{cas_override_camera_time = 0.0}
		task_menu_default_anim_in base_name = <zoom_camera> do_not_hide ignore_time = 1
		Change \{generic_menu_block_input = 0}
		generic_menu_up_or_down_sound \{up}
		Wait \{0.1
			Seconds}
		begin
		if NOT ControllerPressed <button> <device_num>
			break
		endif
		Wait \{1
			gameframe}
		repeat
		Change \{generic_menu_block_input = 1}
		task_menu_default_anim_in base_name = <Camera_Name> do_not_hide ignore_time = 1
		Change \{generic_menu_block_input = 0}
		generic_menu_up_or_down_sound \{down}
		Change \{cas_override_camera_time = -1}
		Change \{pulled_back = 0}
	endif
endscript
cas_pull_back_camera_base = 'none'

script cas_pull_back_camera_gh \{button = R2}


	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if NOT ScriptIsRunning \{task_menu_default_anim_in}
		if ($pulled_back = 0)
			task_menu_retrieve_camera_base_name
			if (<zoom_camera> = <Camera_Name>)
				return
			endif
			Change cas_pull_back_camera_base = <Camera_Name>
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
			generic_menu_up_or_down_sound \{down}
			Change \{cas_override_camera_time = -1}
			Change \{pulled_back = 0}
		endif
	endif
endscript

script cas_pull_back_camera_adaptive \{button = R2
		pull_back_distance = 1.0}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	Change \{pulled_back = 1}
	task_menu_retrieve_camera_base_name
	task_menu_retrieve_camera_params Camera_Name = <Camera_Name>
	task_menu_retrieve_camera_dof_params Camera_Name = <Camera_Name>
	if GotParam \{camera_params}
		Pos = (<camera_params>.Pos)
		Quat = (<camera_params>.Quat)
		RotateVector vector = (0.0, 0.0, -1.0) Quat = <Quat>
		back_pos = (<Pos> + <pull_back_distance> * <result_vector>)
		PlayIGCCam {
			id = cs_view_cam_id
			Name = menu_view_cam_pullback
			viewport = bg_viewport
			LockTo = World
			Pos = <back_pos>
			Quat = <Quat>
			FOV = (<camera_params>.FOV)
			play_hold = 1
			interrupt_current
		}
		if GotParam \{dof_params}
			GetDistance posA = <Pos> posB = <back_pos>
			increase_dof_distance distance = <dist_AToB> dof_params = <dof_params>
		endif
		SoundEvent \{event = menu_car_zoomout}
		Wait \{0.3
			Seconds}
		begin
		if NOT ControllerPressed <button> <device_num>
			break
		endif
		Wait \{1
			gameframe}
		repeat
		KillCamAnim \{Name = menu_view_cam_pullback}
		if GotParam \{dof_params}
			SpawnScriptNow applymenudof params = {dofParam = <dof_params>}
		endif
		SoundEvent \{event = menu_car_zoomin}
		Wait \{0.3
			Seconds}
	endif
	Change \{pulled_back = 0}
endscript

script increase_dof_distance 

	new_dof_params = {
		<dof_params>
		farblurbegin = ((<dof_params>.farblurbegin) + <distance>)
		farblurend = ((<dof_params>.farblurend) + <distance>)
	}
	SpawnScriptNow applymenudof params = {dofParam = <new_dof_params>}
endscript

script cleanup_cas_menu_handlers 

	if ScriptIsRunning \{cas_pull_back_camera_adaptive}
		KillSpawnedScript \{Name = cas_pull_back_camera_adaptive}
	endif
	if ScriptIsRunning \{cas_pull_back_camera}
		KillSpawnedScript \{Name = cas_pull_back_camera}
	endif
	if ScriptIsRunning \{cas_pull_back_camera_gh}
		KillSpawnedScript \{Name = cas_pull_back_camera_gh}
	endif
	Change \{generic_menu_block_input = 0}
	cas_pull_back_camera_base = 'none'
	Change \{cas_override_camera_time = -1}
	Change \{pulled_back = 0}
	KillCamAnim \{Name = menu_view_cam_pullback}
	KillCamAnim \{Name = cascamera}
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

	if NOT CD
		if NOT IsGuitarController controller = <device_num>
			Change \{toggleviewmode_enabled = 1}
			if ($view_mode = 0)
				ToggleViewMode \{no_reload}
			else
				Change \{view_mode = 2}
				ToggleViewMode \{no_reload}
			endif
		endif
	endif
endscript

script setup_cas_menu_handlers controller = ($primary_controller)

	if NOT (($menu_over_ride_exclusive_device) = -1)
		controller = ($menu_over_ride_exclusive_device)
	endif
	event_handlers = []
	if IsGuitarController controller = <controller>
		if NOT GotParam \{NO_ROTATE}
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
				AddArrayElement array = <event_handlers> element = {pad_square cas_pull_back_camera params = {button = Square zoom_camera = <zoom_camera>}}
				event_handlers = <array>
			else
				AddArrayElement array = <event_handlers> element = {pad_square cas_pull_back_camera_adaptive params = {button = Square zoom_camera = <zoom_camera>}}
				event_handlers = <array>
			endif
		endif
	elseif isdrumcontroller controller = <controller>
		if NOT GotParam \{NO_ROTATE}
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
				if isrbdrum controller = <controller>
					AddArrayElement array = <event_handlers> element = {pad_L1 cas_pull_back_camera params = {button = L1 zoom_camera = <zoom_camera>}}
				else
					AddArrayElement array = <event_handlers> element = {pad_L1 cas_pull_back_camera_gh params = {button = L1 zoom_camera = <zoom_camera>}}
				endif
				event_handlers = <array>
			else
				AddArrayElement array = <event_handlers> element = {pad_L1 cas_pull_back_camera_adaptive params = {button = L1 pull_back_distance = <pull_back_distance>}}
				event_handlers = <array>
			endif
		endif
	else
		event_handlers = [
			{pad_L3 cas_artist_flush}
			{pad_alt2 cas_toggle_free_cam}
		]
		if NOT GotParam \{NO_ROTATE}
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
	if (<array_Size> > 0)
		SetScreenElementProps {
			id = <vmenu_id>
			event_handlers = <event_handlers>
			replace_handlers
		}
	endif
endscript
current_camera_cut_num = 0

script cas_change_camera_cut 


	if NOT ((ScriptIsRunning task_menu_default_anim_in) || (ScriptIsRunning cas_pull_back_camera) || (ScriptIsRunning cas_pull_back_camera_gh))
		Change \{cas_override_camera_time = -1}
		GetArraySize <camera_list>
		if (<array_Size> = 0)
			return
		endif
		if GotParam \{right}
			SoundEvent \{event = gigboard_zoom_right}
			Change current_camera_cut_num = (($current_camera_cut_num) + 1)
		else
			SoundEvent \{event = gigboard_zoom_left}
			Change current_camera_cut_num = (($current_camera_cut_num) -1)
		endif
		if (($current_camera_cut_num) > (<array_Size> -1))
			Change \{current_camera_cut_num = 0}
		elseif (($current_camera_cut_num) < 0)
			Change current_camera_cut_num = (<array_Size> -1)
		endif
		Change \{generic_menu_block_input = 1}
		0x79db87d7
		task_menu_default_anim_in base_name = (<camera_list> [($current_camera_cut_num)]) do_not_hide
		Change \{generic_menu_block_input = 0}
		0xf00f29a9
	endif
endscript

script setup_cas_menu_handlers_restricted 

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

script getinstrumentnodename 
	if (<instrument> = None)
		return \{FALSE}
	endif
	node = Z_SoundCheck_TRG_Waypoint_Guitar_Start
	switch (<instrument>)
		case guitar
		case bass
		<node> = Z_SoundCheck_TRG_Waypoint_Guitar_Start
		case drum
		<node> = z_soundcheck_trg_waypoint_drum_start
		case vocals
		<node> = z_soundcheck_trg_waypoint_microphone_start
	endswitch
	return instrument_node_name = <node> true
endscript

script is_female_char 
	getcurrentcasobject
	cas_get_is_female Player = ($cas_current_player)
	if (<is_female> = 1)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script create_font_arrays 
	GetArraySize ($car_font_list)
	font_list_size = <array_Size>
	i = 0
	begin
	formatText checksumName = new_global_name 'car_%i' i = ((($car_font_list) [<i>]).font)
	new_global_value = ($car_char_list)
	GetArraySize (<new_global_value>)
	j = 0
	begin
	formatText checksumName = font '%i' i = ((($car_font_list) [<i>]).font)
	newstruct = {(<new_global_value> [<j>]) font = <font>}
	SetArrayElement ArrayName = new_global_value index = <j> NewValue = <newstruct>
	j = (<j> + 1)
	repeat <array_Size>
	newglobal Name = <new_global_name> value = <new_global_value>
	i = (<i> + 1)
	repeat <font_list_size>
endscript
