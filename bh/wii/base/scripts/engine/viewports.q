
script viewport_debug_follow_cam_gen_ids 
	if NOT GotParam \{camera_id}
		MangleChecksums a = <object_id> b = debug_follow_camera
		<camera_id> = <mangled_ID>
	endif
	if NOT GotParam \{viewport_id}
		MangleChecksums a = <object_id> b = debug_follow_viewport
		<viewport_id> = <mangled_ID>
	endif
	return <...>
endscript

script viewport_debug_follow_cam_create \{object_id = skater}
	ScriptAssert \{'viewport_debug_follow_cam_create: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script viewport_debug_follow_cam_destroy \{object_id = skater}
	ScriptAssert \{'viewport_debug_follow_cam_destroy: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript
