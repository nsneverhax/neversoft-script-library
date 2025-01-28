
script shatterfromskater \{vel_scale = 0.5
		gravity = (0.0, -6.3500004, 0.0)
		area = 1.2900001
		blend_mode = blend
		variance = 0.0
		spread = 1.0
		life = 4.0
		bounce_floor = -254.0
		bounce_amp = 0.254
		shininess = 0
		radius = 0.0}
	obj_getid
	<objid> :obj_getvelocity
	<force> = (<vel> * <vel_scale>)
	<objid> :obj_getposition
	if gotparam \{radial_shatter}
		printf \{"Using skater's position for nicer shatter.  If a crash occurs after this text, please remove the radial_shatter parameter from the ShatterFromSkater parameter list"}
		<origin> = <pos>
	endif
	shatter <...>
endscript
