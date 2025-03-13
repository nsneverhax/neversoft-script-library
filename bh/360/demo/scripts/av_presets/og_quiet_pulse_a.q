og_quiet_pulse_a = [
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (0.97999996, 0.97999996)
		color = [
			250
			255
			255
			255
		]
		angle = 0.00872665
		angularvel = 0.0
		blendmode = blend
		controls = [
			{
				type = constant
				response = huemodulation
				scalemod = 0.5
				responsefunc = sintime
				timerate = 0.523599
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.015
		color = [
			128
			114
			97
			255
		]
		blendmode = blend
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = constant
				response = offsetx
				scalemod = 0.05
				responsefunc = sintime
			}
			{
				type = constant
				response = offsety
				scalemod = 0.025
				responsefunc = costime
			}
			{
				type = history
				historytype = frequency
				response = deform
				scalemod = 100.0
				spectrumband = 10
			}
			{
				type = constant
				response = brightnessmodulation
				scalemod = 0.8
				responsefunc = sintime
				timerate = 0.523599
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.1
		color = [
			62
			62
			62
			255
		]
		blendmode = brighten
		thickness = 2.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = constant
				response = radiusscale
				scalemod = 0.1
				responsefunc = sintime
				timerate = 1.0646498
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.15
		color = [
			62
			62
			62
			255
		]
		blendmode = brighten
		thickness = 3.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = constant
				response = radiusscale
				scalemod = 0.1
				responsefunc = costime
				timerate = 1.0472
			}
		]
	}
	{
		type = nstar2
		pos = (0.5, 0.5, 0.0)
		npoints = 6
		radius = 0.0
		radius2 = 0.5
		color = [
			62
			62
			62
			255
		]
		blendmode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 3.1415896
		controls = [
			{
				type = constant
				response = offsetx
				scalemod = 0.05
				responsefunc = sintime
			}
			{
				type = constant
				response = offsety
				scalemod = 0.025
				responsefunc = costime
			}
			{
				type = constant
				response = radiusscale
				scalemod = 0.1
				responsefunc = sintime
				timeoffset = 3.1415896
				timerate = 2.0944
			}
			{
				type = constant
				response = radius2scale
				scalemod = 0.1
				responsefunc = costime
				timerate = 2.26893
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.015
		color = [
			128
			114
			97
			255
		]
		blendmode = blend
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = constant
				response = offsetx
				scalemod = 0.05
				responsefunc = costime
			}
			{
				type = constant
				response = offsety
				scalemod = 0.025
				responsefunc = sintime
			}
			{
				type = history
				historytype = frequency
				response = deform
				scalemod = 100.0
				spectrumband = 10
			}
			{
				type = constant
				response = brightnessmodulation
				scalemod = 0.8
				responsefunc = costime
				timerate = 0.523599
			}
		]
	}
]
