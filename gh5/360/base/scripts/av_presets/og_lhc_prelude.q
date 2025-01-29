og_lhc_prelude = [
	{
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		Scale = (1.0, 1.0)
		width = 1.0
		height = 0.25
		Color = [
			15
			9
			18
			255
		]
		material = og_mat_flare_add
		BlendMode = blend
		angle = 0
		angularvel = 1.7453301
		controls = [
			{
				Type = constant
				response = scalex
				scalemod = 1.0
				responsefunc = sintime
				timerate = 2.0
			}
			{
				Type = constant
				response = scaley
				scalemod = 1.0
				responsefunc = sintime
				timerate = 2.0
			}
		]
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (0.97999996, 0.97999996)
		Color = [
			225
			223
			229
			254
		]
		angle = 0.0174533
		angularvel = 0.0
		BlendMode = blend
		controls = [
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.35000002
		Color = [
			11
			9
			20
			127
		]
		BlendMode = add
		thickness = 3.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = constant
				response = radiusscale
				scalemod = 0.15
				responsefunc = sintime
				timerate = 2.0
			}
			{
				Type = constant
				response = alphamodulation
				scalemod = -1.0
				responsefunc = sintime
				timerate = 2.0
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.35000002
		Color = [
			29
			62
			64
			127
		]
		BlendMode = add
		thickness = 3.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = constant
				response = radiusscale
				scalemod = 0.15
				responsefunc = sintime
				timeoffset = 4.71239
				timerate = 2.0
			}
			{
				Type = constant
				response = alphamodulation
				scalemod = -1.0
				responsefunc = sintime
				timeoffset = 4.71239
				timerate = 2.0
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.35000002
		Color = [
			11
			9
			20
			127
		]
		BlendMode = add
		thickness = 3.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = constant
				response = radiusscale
				scalemod = 0.15
				responsefunc = sintime
				timeoffset = 1.5708001
				timerate = 2.0
			}
			{
				Type = constant
				response = alphamodulation
				scalemod = -1.0
				responsefunc = sintime
				timeoffset = 1.5708001
				timerate = 2.0
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.35000002
		Color = [
			29
			62
			64
			127
		]
		BlendMode = add
		thickness = 3.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = constant
				response = radiusscale
				scalemod = 0.15
				responsefunc = sintime
				timeoffset = 3.1415896
				timerate = 2.0
			}
			{
				Type = constant
				response = alphamodulation
				scalemod = -1.0
				responsefunc = sintime
				timeoffset = 3.1415896
				timerate = 2.0
			}
		]
	}
	{
		Type = hypotrochoid
		Pos = (0.5, 0.5, 0.0)
		Scale = (2.0, 2.0)
		length = 0.05
		InnerRadius = 0.25
		outerradius = 0.1
		Color = [
			255
			255
			255
			38
		]
		material = og_mat_dot_add
		BlendMode = blend
		thickness = 30.0
		angularvel = 87.266495
	}
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.1
		Color = [
			138
			138
			138
			255
		]
		BlendMode = brighten
		thickness = 10.0
		angle = 0
		angularvel = 1.7453301
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 1000.0
				spectrumband = 10
			}
		]
	}
	{
		Type = hypotrochoid
		Pos = (0.5, 0.5, 0.0)
		Scale = (2.0, 2.0)
		length = 0.05
		InnerRadius = 0.25
		outerradius = 0.1
		Color = [
			255
			255
			255
			38
		]
		material = og_mat_dot_add
		BlendMode = blend
		thickness = 30.0
		angularvel = -87.266495
	}
]
