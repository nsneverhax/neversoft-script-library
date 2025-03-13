og_lhc_climax = [
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (0.94, 0.94)
		color = [
			242
			249
			255
			253
		]
		angle = 0.17453298
		angularvel = 0.0
		blendmode = blend
	}
	{
		type = line
		pos = (0.4, 0.5, 0.0)
		length = 0.1
		color = [
			165
			160
			249
			255
		]
		blendmode = blend
		thickness = 10.0
		angle = 0
		angularvel = 0.0
		controls = [
			{
				type = constant
				response = lengthscale
				scalemod = 0.2
				responsefunc = sintime
				timeoffset = 1.5708001
				timerate = 6.28319
			}
			{
				type = constant
				response = anglemod
				scalemod = 0.8
				responsefunc = sintime
				timerate = 3.1415896
			}
			{
				type = constant
				response = offsetx
				scalemod = 0.1
				responsefunc = sintime
				timerate = 1.0472
			}
		]
	}
	{
		type = line
		pos = (0.6, 0.5, 0.0)
		length = 0.1
		color = [
			165
			160
			249
			255
		]
		blendmode = blend
		thickness = 10.0
		angle = 0
		angularvel = 0.0
		controls = [
			{
				type = constant
				response = lengthscale
				scalemod = 0.2
				responsefunc = sintime
				timeoffset = 1.5708001
				timerate = 6.28319
			}
			{
				type = constant
				response = anglemod
				scalemod = 0.8
				responsefunc = sintime
				timerate = 3.1415896
			}
			{
				type = constant
				response = offsetx
				scalemod = 0.1
				responsefunc = sintime
				timeoffset = 3.1415896
				timerate = 1.0472
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.1
		color = [
			255
			255
			255
			255
		]
		blendmode = brighten
		thickness = 5.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = constant
				response = radiusscale
				scalemod = 0.1
				responsefunc = sintime
				timeoffset = 3.1415896
				timerate = 0.872665
			}
			{
				type = frequency
				response = deform
				scalemod = 1000.0
				spectrumband = 10
			}
		]
	}
]
