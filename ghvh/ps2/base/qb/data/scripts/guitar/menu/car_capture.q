character_head_viewport_props = {
	viewport = character_head_viewport
	Camera = character_head_camera
	style = character_head_rendering
}
character_head_viewport_props_ps3 = {
	viewport = character_head_viewport
	Camera = character_head_camera
	style = character_head_rendering_ps3
}

script begin_car_capture \{test = 0}
	kill_car_capture
	if cas_player_has_character_object Player = ($cas_current_player)
		if isps3
			AddParams ($character_head_viewport_props_ps3)
		else
			AddParams ($character_head_viewport_props)
		endif
		if ViewportExists id = <viewport>

		endif
		createviewport {
			Priority = 6
			id = <viewport>
			style = <style>
		}
		if (<test> = 1)
			CreateScreenElement {
				id = photo_test
				Type = ViewportElement
				parent = root_window
				texture = white
				Scale = (128.0, 128.0)
				Pos = (50.0, 50.0)
				just = [left top]
				z_priority = 15
				existing_viewport_id = <viewport>
			}
			SetViewportProperties viewport = <viewport> Active = true
			SetActiveCamera id = viewer_cam viewport = <viewport>
			viewer_cam :SetHFOV \{hfov = 45}
		else
			SetViewportProperties viewport = <viewport> Active = FALSE
		endif
		fxParam = $dof_car_photo_tod_manager
		ScreenFX_ClearFXInstances viewport = <viewport>
		if StructureContains \{structure = fxParam
				screen_FX}
			begin
			if GetNextArrayElement (<fxParam>.screen_FX)
				ScreenFX_AddFXInstance {
					viewport = <viewport>
					<element>
				}
			else
				break
			endif
			repeat
		endif
		destroy_popup_warning_menu
		destroy_band_money_display
		destroy_character_selection_menu
		ui_destroy_customize_character
		Wait \{2
			gameframes}
	endif
endscript

script kill_car_capture 
	if ScreenElementExists \{id = photo_test}
		DestroyScreenElement \{id = photo_test}
	endif
	if cas_player_has_character_object Player = ($cas_current_player)
		AddParams ($character_head_viewport_props)
		if ViewportExists id = <viewport>
			ScreenFX_ClearFXInstances {
				viewport = <viewport>
			}
			DestroyViewport id = <viewport>
			KillCamAnim Name = <Camera>
		endif
	endif
endscript

script car_capture_place_camera 
	if cas_player_has_character_object Player = ($cas_current_player)
		AddParams ($character_head_viewport_props)
		param_sets = [
			{
				LookAt = <character_object>
				LookAtBone = bone_head
				Pos = (-0.894, 1.7, 1.789)
			}
			{
				LookAt = <character_object>
				LookAtBone = bone_head
				Pos = (0.894, 1.7, 1.789)
			}
			{
				LookAt = <character_object>
				LookAtBone = bone_head
				Pos = (0.0, 1.5, 2.0)
			}
		]
		GetArraySize <param_sets>
		GetRandomValue a = 0 b = (<array_Size> - 1) Name = index integer
		chosen_param = (<param_sets> [<index>])
		PlayIGCCam {
			Name = <Camera>
			viewport = bg_viewport
			LockTo = <character_object>
			<chosen_param>
			play_hold = 1
			interrupt_current
		}
	endif
endscript

script do_car_capture 
	if cas_player_has_character_object Player = ($cas_current_player)
		AddParams ($character_head_viewport_props)
		if NOT GotParam \{do_not_modify}
			Band_PlayFacialAnim Name = <character_object> anim = gh_rocker_male_hardrockface_5
		endif
		car_capture_place_camera do_not_modify = <do_not_modify>
		Wait \{1
			gameframes}
		FinishRendering
		SetViewportProperties viewport = <viewport> Active = true
		photo_preparerenderbuffer
		Wait \{2
			gameframes}
		FinishRendering
		SetViewportProperties viewport = <viewport> Active = FALSE
		if NOT GotParam \{readytorock}
			car_capture_move_back_character do_not_modify = <do_not_modify>
		endif
		Wait \{1
			gameframes}
		photo_createfromviewport Name = car viewport = <viewport> saveshot = <saveshot>
	endif
endscript
car_capture_moved_char = 0
car_capture_moved_old_pos = (0.0, 0.0, 0.0)
car_capture_moved_old_quat = (0.0, 0.0, 0.0)

script car_capture_move_away_character 
	pos_dir = [
		{
			Pos = (0.0, 0.0, 0.0)
			Quat = (0.0, 0.0, 0.0)
		}
	]
	GetArraySize <pos_dir>
	GetRandomValue a = 0 b = (<array_Size> - 1) Name = index integer
	chosen_pos_dir = (<pos_dir> [<index>])
	car_capture_move_back_character do_not_modify = <do_not_modify>
	if cas_player_has_character_object Player = ($cas_current_player)
		<character_object> :Obj_GetPosition
		<character_object> :Obj_GetQuat
		Change car_capture_moved_old_pos = <Pos>
		Change car_capture_moved_old_quat = <Quat>
		Change \{car_capture_moved_char = 1}
		if NOT GotParam \{do_not_modify}
			<character_object> :Obj_SetPosition position = (<chosen_pos_dir>.Pos)
			<character_object> :Obj_SetOrientation Quat = (<chosen_pos_dir>.Quat)
		endif
	endif
endscript

script car_capture_move_back_character 
	if ($car_capture_moved_char = 1)
		if cas_player_has_character_object Player = ($cas_current_player)
			if NOT GotParam \{do_not_modify}
				<character_object> :Obj_SetPosition position = ($car_capture_moved_old_pos)
				<character_object> :Obj_SetOrientation Quat = ($car_capture_moved_old_quat)
			endif
		endif
		Change \{car_capture_moved_char = 0}
	endif
endscript

script show_photo_cam 
	if cas_player_has_character_object Player = ($cas_current_player)
		showcamoffset Name = <character_object> bone = bone_head
	endif
endscript

script photograb_preset_profiles 
	get_musician_profile_size \{savegame = 0}
	i = 0
	begin
	get_musician_profile_struct_by_index index = <i> savegame = 0
	this_ID = (<profile_struct>.Name)
	formatText TextName = saveshot 'photo_%d' d = <this_ID> DontAssertForChecksums donotresolve
	if is_selectable_profile profile_struct = <profile_struct>
		cas_queue_new_character_profile Player = 1 id = <this_ID> savegame = 0
		cas_queue_wait
		begin_car_capture
		Wait \{2
			gameframes}
		do_car_capture saveshot = <saveshot>
		photo_delete \{Name = car}
		Wait \{2
			gameframes}
		kill_car_capture
	endif
	i = (<i> + 1)
	repeat <array_Size>
endscript

script cas_save_photo_of_car 
	begin_car_capture
	Wait \{2
		gameframes}
	do_car_capture do_not_modify = <do_not_modify> readytorock = <readytorock>
	if cas_player_has_character_object Player = ($cas_current_player)
		photoputinglobaltags character_name = <character_name> photo_name = car savegame = <savegame>
		photo_delete \{Name = car}
	endif
	Wait \{2
		gameframes}
	kill_car_capture
endscript
