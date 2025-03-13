jow_musicstudio_ghmix_a = [
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (1.1, 1.0)
		color = [
			255
			255
			255
			254
		]
		angle = 0
		angularvel = 0
		blendmode = blend
		nonuniformscale
	}
	{
		type = line
		pos = (0.05, 0.5, 0.0)
		length = 1.0
		color = [
			174
			164
			131
			29
		]
		blendmode = blend
		thickness = 7.0
		angle = 1.5708001
		angularvel = 0
		controls = [
			{
				type = constant
				response = offsetx
				scalemod = 0.04
				responsefunc = sintime
				timerate = 0.523599
			}
			{
				type = constant
				response = offsety
				scalemod = 0.04
				responsefunc = sintime
				timerate = 0.523599
			}
		]
	}
	{
		type = line
		pos = (0.95, 0.5, 0.0)
		length = 1.0
		color = [
			174
			164
			131
			29
		]
		blendmode = blend
		thickness = 7.0
		angle = 1.5708001
		angularvel = 0
		controls = [
			{
				type = constant
				response = offsetx
				scalemod = 0.04
				responsefunc = sintime
				timerate = 0.523599
			}
			{
				type = constant
				response = offsety
				scalemod = 0.04
				responsefunc = sintime
				timerate = 0.523599
			}
		]
	}
	{
		type = nstar2
		pos = (0.3, 0.3, 0.0)
		npoints = 19
		radius = 0.15
		radius2 = 1.5
		color = [
			0
			255
			255
			255
		]
		blendmode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 0.0698132
		controls = [
			{
				type = constant
				response = alphamodulation
				scalemod = 0.25
				responsefunc = sintime
				timerate = 0.872665
			}
			{
				type = constant
				response = huemodulation
				scalemod = 0.1
				responsefunc = sintime
				timerate = 0.872665
			}
			{
				type = constant
				response = huemodulation
				scalemod = 0.5
				responsefunc = sintime
				timerate = 1.5708001
			}
		]
	}
	{
		type = nstar2
		pos = (0.7, 0.7, 0.0)
		npoints = 7
		radius = 0.15
		radius2 = 1.5
		color = [
			87
			117
			117
			124
		]
		blendmode = blend
		thickness = 1.0
		angle = 0
		angularvel = 0.0698132
		controls = [
			{
				type = constant
				response = alphamodulation
				scalemod = 0.25
				responsefunc = sintime
				timerate = 0.872665
			}
			{
				type = constant
				response = huemodulation
				scalemod = 0.1
				responsefunc = sintime
				timerate = 0.872665
			}
		]
	}
]
