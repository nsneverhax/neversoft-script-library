
script viewport_debug_follow_cam_gen_ids 
	if NOT GotParam \{camera_id}
		MangleChecksums A = <object_id> B = debug_follow_camera
		<camera_id> = <mangled_ID>
	endif
	if NOT GotParam \{viewport_id}
		MangleChecksums A = <object_id> B = debug_follow_viewport
		<viewport_id> = <mangled_ID>
	endif
	return <...>
endscript

script viewport_debug_follow_cam_create \{object_id = Skater}
	viewport_debug_follow_cam_gen_ids <...>
	<camera_object_params> = {
		Components = [
			{Component = CinematicCamera Enabled = TRUE}
			{Component = Camera}
		]
		Params = {
			Name = <camera_id>
		}
	}
	if IsCompositeObjectManagerEnabled
		CreateCompositeObject <camera_object_params>
	else
		CreateCompositeObjectInstance <camera_object_params> Priority = COIM_Priority_Permanent Heap = Generic OldHeap = COM
	endif
	<camera_id> :CCam_DoMorph {
		LockTo = <object_id>
		Pos = (0.008657, 2.082745, -2.1572049)
		Quat = (0.098622, -0.00072499993, -0.012637)
		FOV = 72.0
	}
	<camera_id> :CCam_SetSmoothing Type = All fast_lerp_factor = 0.89
	CreateDebugViewport Id = <viewport_id>
	SetActiveCamera Id = <camera_id> viewport = <viewport_id>
endscript

script viewport_debug_follow_cam_destroy \{object_id = Skater}
	viewport_debug_follow_cam_gen_ids <...>
	DestroyDebugViewport Id = <viewport_id>
	<camera_id> :DIE
endscript
