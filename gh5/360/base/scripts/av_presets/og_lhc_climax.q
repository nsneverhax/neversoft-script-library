og_lhc_climax = [
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (0.94, 0.94)
		Color = [
			242
			249
			255
			253
		]
		angle = 0.17453298
		angularvel = 0.0
		BlendMode = blend
	}
	{
		Type = line
		Pos = (0.4, 0.5, 0.0)
		length = 0.1
		Color = [
			165
			160
			249
			255
		]
		BlendMode = blend
		thickness = 10.0
		angle = 0
		angularvel = 0.0
		controls = [
			{
				Type = constant
				response = lengthscale
				scalemod = 0.2
				responsefunc = sintime
				timeoffset = 1.5708001
				timerate = 6.28319
			}
			{
				Type = constant
				response = anglemod
				scalemod = 0.8
				responsefunc = sintime
				timerate = 3.1415896
			}
			{
				Type = constant
				response = offsetx
				scalemod = 0.1
				responsefunc = sintime
				timerate = 1.0472
			}
		]
	}
	{
		Type = line
		Pos = (0.6, 0.5, 0.0)
		length = 0.1
		Color = [
			165
			160
			249
			255
		]
		BlendMode = blend
		thickness = 10.0
		angle = 0
		angularvel = 0.0
		controls = [
			{
				Type = constant
				response = lengthscale
				scalemod = 0.2
				responsefunc = sintime
				timeoffset = 1.5708001
				timerate = 6.28319
			}
			{
				Type = constant
				response = anglemod
				scalemod = 0.8
				responsefunc = sintime
				timerate = 3.1415896
			}
			{
				Type = constant
				response = offsetx
				scalemod = 0.1
				responsefunc = sintime
				timeoffset = 3.1415896
				timerate = 1.0472
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.1
		Color = [
			255
			255
			255
			255
		]
		BlendMode = brighten
		thickness = 5.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = constant
				response = radiusscale
				scalemod = 0.1
				responsefunc = sintime
				timeoffset = 3.1415896
				timerate = 0.872665
			}
			{
				Type = frequency
				response = deform
				scalemod = 1000.0
				spectrumband = 10
			}
		]
	}
]
