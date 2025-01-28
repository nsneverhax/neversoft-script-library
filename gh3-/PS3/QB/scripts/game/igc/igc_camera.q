
script IGC_Camera_MoveToPlayer \{Time = 0
		Motion = smooth}
	cameraid = skatercam0
	<cameraid> :GetHFOV
	CCam_DoMorph {
		LockTo = <cameraid>
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = <hFOV>
		Time = <Time>
		Motion = <Motion>
	}
	if NOT GotParam \{no_block}
		CCam_WaitMorph
	endif
endscript
