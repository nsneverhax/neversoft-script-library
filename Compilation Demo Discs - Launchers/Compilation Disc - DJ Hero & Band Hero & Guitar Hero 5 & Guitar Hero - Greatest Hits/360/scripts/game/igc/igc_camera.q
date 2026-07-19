
script IGC_Camera_MoveToPlayer \{time = 0
		motion = smooth}
	cameraid = skatercam0
	<cameraid> :GetHFov
	CCam_DoMorph {
		LockTo = <cameraid>
		pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = <hfov>
		time = <time>
		motion = <motion>
	}
	if NOT GotParam \{no_block}
		CCam_WaitMorph
	endif
endscript
