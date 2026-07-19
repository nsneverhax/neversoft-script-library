
script viewport_debug_follow_cam_gen_ids 
	if NOT gotparam \{camera_id}
		manglechecksums a = <object_id> b = debug_follow_camera
		<camera_id> = <mangled_id>
	endif
	if NOT gotparam \{viewport_id}
		manglechecksums a = <object_id> b = debug_follow_viewport
		<viewport_id> = <mangled_id>
	endif
	return <...>
endscript

script viewport_debug_follow_cam_create \{object_id = skater}
	viewport_debug_follow_cam_gen_ids <...>
	<camera_object_params> = {
		components = [
			{component = cinematiccamera enabled = true}
			{component = camera}
		]
		params = {
			name = <camera_id>
		}
	}
	if iscompositeobjectmanagerenabled
		createcompositeobject <camera_object_params>
	else
		createcompositeobjectinstance <camera_object_params> priority = coim_priority_permanent heap = generic oldheap = com
	endif
	<camera_id> :ccam_domorph {
		lockto = <object_id>
		pos = (0.008657, 2.082745, -2.1572049)
		quat = (0.098622, -0.00072499993, -0.012637)
		fov = 72.0
	}
	<camera_id> :ccam_setsmoothing type = all fast_lerp_factor = 0.89
	createdebugviewport id = <viewport_id>
	setactivecamera id = <camera_id> viewport = <viewport_id>
endscript

script viewport_debug_follow_cam_destroy \{object_id = skater}
	viewport_debug_follow_cam_gen_ids <...>
	destroydebugviewport id = <viewport_id>
	<camera_id> :die
endscript
