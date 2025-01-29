character_head_viewport_props = {
	viewport = character_head_viewport
	Camera = character_head_camera
	style = character_head_rendering
}

script begin_car_capture \{test = 0}
	kill_car_capture
	if cas_player_has_character_object player = ($cas_current_player)
		AddParams ($character_head_viewport_props)
		if ViewportExists id = <viewport>
			ScriptAssert \{'Viewport still hanging around'}
		endif
		CreateViewport {
			Priority = 6
			id = <viewport>
			style = <style>
		}
		if (<test> = 1)
			CreateScreenElement {
				id = photo_test
				type = viewportelement
				parent = root_window
				texture = white
				scale = (128.0, 128.0)
				Pos = (50.0, 50.0)
				just = [left top]
				z_priority = 15
				existing_viewport_id = <viewport>
			}
			SetViewportProperties viewport = <viewport> active = true
			SetActiveCamera id = viewer_cam viewport = <viewport>
			viewer_cam :SetHFov \{hfov = 45}
		else
			SetViewportProperties viewport = <viewport> active = false
		endif
		fxParam = $DOF_CAR_Photo_tod_manager
		ScreenFX_ClearFXInstances viewport = <viewport>
		if StructureContains \{structure = fxParam
				screen_fx}
			begin
			if GetNextArrayElement (<fxParam>.screen_fx)
				ScreenFX_AddFXInstance {
					viewport = <viewport>
					<element>
				}
			else
				break
			endif
			repeat
		endif
	endif
endscript

script kill_car_capture 
	if ScreenElementExists \{id = photo_test}
		DestroyScreenElement \{id = photo_test}
	endif
	if cas_player_has_character_object player = ($cas_current_player)
		AddParams ($character_head_viewport_props)
		if ViewportExists id = <viewport>
			ScreenFX_ClearFXInstances {
				viewport = <viewport>
			}
			DestroyViewport id = <viewport>
			KillCamAnim name = <Camera>
		endif
	endif
endscript

script car_capture_place_camera 
	if cas_player_has_character_object player = ($cas_current_player)
		AddParams ($character_head_viewport_props)
		param_sets = [
			{
				LockToBone = Bone_Head
				Pos = (0.0, 0.34, 0.0)
				Quat = (-0.161807, -0.16227801, -0.60744905)
				FOV = 45
				LookAt = <character_object>
				LookAtBone = Bone_Brow_Mid
				ScreenOffset = (0.2, -0.9)
			}
			{
				LockToBone = Bone_Head
				Pos = (0.0, 0.33, -0.1)
				Quat = (-0.161807, -0.16227801, -0.60744905)
				FOV = 45
				LookAt = <character_object>
				LookAtBone = Bone_Brow_Mid
				ScreenOffset = (0.2, -0.9)
			}
			{
				LockToBone = Bone_Head
				Pos = (0.0, 0.35000002, 0.1)
				Quat = (-0.161807, -0.16227801, -0.60744905)
				FOV = 45
				LookAt = <character_object>
				LookAtBone = Bone_Brow_Mid
				ScreenOffset = (0.0, -0.9)
			}
			{
				LockToBone = Bone_Head
				Pos = (0.05, 0.35000002, 0.1)
				Quat = (-0.161807, -0.16227801, -0.60744905)
				FOV = 45
				LookAt = <character_object>
				LookAtBone = Bone_Brow_Mid
				ScreenOffset = (0.0, -0.9)
			}
		]
		GetArraySize <param_sets>
		GetRandomValue a = 0 b = (<array_size> - 1) name = index integer
		chosen_param = (<param_sets> [<index>])
		if GotParam \{do_not_modify}
			chosen_param = {
				LockTo = $cas_current_player_name
				Pos = (-0.00301, 1.6, 1.2)
				Quat = (0.0051659998, -1.0, -0.01)
				FOV = 35
				LookAt = $cas_current_player_name
				LookAtBone = Bone_Neck
				ScreenOffset = (0.2, 0.65000004)
			}
		endif
		PlayIGCCam {
			name = <Camera>
			viewport = <viewport>
			LockTo = <character_object>
			<chosen_param>
			Play_hold = 1
			interrupt_current
		}
	endif
endscript

script do_car_capture 
	printf \{qs(0x1bb4efa4)}
	if cas_player_has_character_object player = ($cas_current_player)
		AddParams ($character_head_viewport_props)
		car_capture_move_away_character do_not_modify = <do_not_modify>
		wait \{1
			gameframes}
		if NOT GotParam \{do_not_modify}
			band_PlayfacialAnim name = <character_object> anim = gh_rocker_male_hardrockface_5
		endif
		car_capture_place_camera do_not_modify = <do_not_modify>
		wait \{1
			gameframes}
		FinishRendering
		SetViewportProperties viewport = <viewport> active = true
		wait \{4
			gameframes}
		FinishRendering
		FinishRendering
		SetViewportProperties viewport = <viewport> active = false
		if NOT GotParam \{readytorock}
			car_capture_move_back_character do_not_modify = <do_not_modify>
		endif
		PhotoCapture_CaptureFromViewport name = car viewport = <viewport> saveshot = <saveshot>
	endif
endscript
car_capture_moved_char = 0
car_capture_moved_old_pos = (0.0, 0.0, 0.0)
car_capture_moved_old_quat = (0.0, 0.0, 0.0)

script car_capture_move_away_character 
	pos_dir = [
		{
			Pos = (-2.6, 0.0, -23.0)
			Quat = (-0.078807004, 0.56277496, 0.053912997)
		}
		{
			Pos = (-2.94172, 0.0, -29.387184)
			Quat = (-0.022496998, 0.540664, 0.014366)
		}
		{
			Pos = (-2.9122872, 0.0, -35.93344)
			Quat = (0.024223, 0.53719, -0.015568)
		}
		{
			Pos = (-3.139093, 0.0, -42.170322)
			Quat = (-0.008305001, 0.53201497, 0.005087)
		}
	]
	GetArraySize <pos_dir>
	GetRandomValue a = 0 b = (<array_size> - 1) name = index integer
	chosen_pos_dir = (<pos_dir> [<index>])
	car_capture_move_back_character do_not_modify = <do_not_modify>
	if cas_player_has_character_object player = ($cas_current_player)
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
		if cas_player_has_character_object player = ($cas_current_player)
			if NOT GotParam \{do_not_modify}
				<character_object> :Obj_SetPosition position = ($car_capture_moved_old_pos)
				<character_object> :Obj_SetOrientation Quat = ($car_capture_moved_old_quat)
			endif
		endif
		Change \{car_capture_moved_char = 0}
	endif
endscript

script show_photo_cam 
	if cas_player_has_character_object player = ($cas_current_player)
		showcamoffset name = <character_object> bone = Bone_Head
	endif
endscript

script photograb_preset_profiles 
endscript

script cas_save_photo_of_car 
endscript
