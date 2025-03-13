og_lhc_wash_e = [
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (0.98999995, 0.98999995)
		color = [
			255
			252
			255
			254
		]
		angle = 0.0
		angularvel = 0
		blendmode = blend
		controls = [
			{
				type = constant
				response = anglemod
				scalemod = 0.01
				responsefunc = sintime
				timerate = 1.0472
			}
			{
				type = beaton
				response = greenmodulation
				scalemod = -0.1
				fade = 0.01
			}
			{
				type = beaton
				response = greenmodulation
				scalemod = -0.1
				responsefunc = sintime
				fade = 0.01
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.01
		color = [
			255
			233
			174
			255
		]
		blendmode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = constant
				response = anglemod
				scalemod = 0.25
				responsefunc = sintime
				timerate = 1.0472
			}
			{
				type = constant
				response = radiusscale
				scalemod = 0.2
				responsefunc = sintime
				timerate = 0.69813204
			}
			{
				type = history
				historytype = frequency
				response = deform
				scalemod = 500.0
				spectrumband = 10
			}
		]
	}
	{
		type = nstar2
		pos = (0.5, 0.5, 0.0)
		npoints = 8
		radius = 0.1
		radius2 = 0.5
		color = [
			79
			117
			116
			255
		]
		blendmode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 0.872665
	}
	{
		type = nstar2
		pos = (0.5, 0.5, 0.0)
		npoints = 9
		radius = 0.1
		radius2 = 0.5
		color = [
			79
			117
			116
			255
		]
		blendmode = brighten
		thickness = 1.0
		angle = 0
		angularvel = -0.872665
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.01
		color = [
			255
			233
			174
			255
		]
		blendmode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = constant
				response = radiusscale
				scalemod = 0.2
				responsefunc = sintime
				timeoffset = 1.5708001
				timerate = 0.69813204
			}
			{
				type = history
				historytype = frequency
				response = deform
				scalemod = 500.0
				spectrumband = 10
			}
			{
				type = constant
				response = anglemod
				scalemod = 0.25
				responsefunc = sintime
				timerate = 1.0472
			}
		]
	}
	{
		type = nstar2
		pos = (0.5, 0.5, 0.0)
		npoints = 9
		radius = 0.01
		radius2 = 0.5
		color = [
			27
			40
			40
			148
		]
		blendmode = add
		thickness = 1.0
		angle = 0
		angularvel = 0.17453298
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.05
		color = [
			255
			242
			6
			187
		]
		blendmode = add
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
		]
	}
]
