
script igc_camera_movetoplayer \{time = 0
		motion = smooth}
	cameraid = skatercam0
	<cameraid> :gethfov
	ccam_domorph {
		lockto = <cameraid>
		pos = (0.0, 0.0, 0.0)
		quat = (0.0, 0.0, 0.0)
		fov = <hfov>
		time = <time>
		motion = <motion>
	}
	if NOT gotparam \{no_block}
		ccam_waitmorph
	endif
endscript
