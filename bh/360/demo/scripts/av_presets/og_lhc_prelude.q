og_lhc_prelude = [
	{
		type = sprite
		pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 1.0
		height = 0.25
		color = [
			15
			9
			18
			255
		]
		material = og_mat_flare_add
		blendmode = blend
		angle = 0
		angularvel = 1.7453301
		controls = [
			{
				type = constant
				response = scalex
				scalemod = 1.0
				responsefunc = sintime
				timerate = 2.0
			}
			{
				type = constant
				response = scaley
				scalemod = 1.0
				responsefunc = sintime
				timerate = 2.0
			}
		]
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (0.97999996, 0.97999996)
		color = [
			225
			223
			229
			254
		]
		angle = 0.0174533
		angularvel = 0.0
		blendmode = blend
		controls = [
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.35000002
		color = [
			11
			9
			20
			127
		]
		blendmode = add
		thickness = 3.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = constant
				response = radiusscale
				scalemod = 0.15
				responsefunc = sintime
				timerate = 2.0
			}
			{
				type = constant
				response = alphamodulation
				scalemod = -1.0
				responsefunc = sintime
				timerate = 2.0
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.35000002
		color = [
			29
			62
			64
			127
		]
		blendmode = add
		thickness = 3.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = constant
				response = radiusscale
				scalemod = 0.15
				responsefunc = sintime
				timeoffset = 4.71239
				timerate = 2.0
			}
			{
				type = constant
				response = alphamodulation
				scalemod = -1.0
				responsefunc = sintime
				timeoffset = 4.71239
				timerate = 2.0
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.35000002
		color = [
			11
			9
			20
			127
		]
		blendmode = add
		thickness = 3.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = constant
				response = radiusscale
				scalemod = 0.15
				responsefunc = sintime
				timeoffset = 1.5708001
				timerate = 2.0
			}
			{
				type = constant
				response = alphamodulation
				scalemod = -1.0
				responsefunc = sintime
				timeoffset = 1.5708001
				timerate = 2.0
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.35000002
		color = [
			29
			62
			64
			127
		]
		blendmode = add
		thickness = 3.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = constant
				response = radiusscale
				scalemod = 0.15
				responsefunc = sintime
				timeoffset = 3.1415896
				timerate = 2.0
			}
			{
				type = constant
				response = alphamodulation
				scalemod = -1.0
				responsefunc = sintime
				timeoffset = 3.1415896
				timerate = 2.0
			}
		]
	}
	{
		type = hypotrochoid
		pos = (0.5, 0.5, 0.0)
		scale = (2.0, 2.0)
		length = 0.05
		innerradius = 0.25
		outerradius = 0.1
		color = [
			255
			255
			255
			38
		]
		material = og_mat_dot_add
		blendmode = blend
		thickness = 30.0
		angularvel = 87.266495
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.1
		color = [
			138
			138
			138
			255
		]
		blendmode = brighten
		thickness = 10.0
		angle = 0
		angularvel = 1.7453301
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 1000.0
				spectrumband = 10
			}
		]
	}
	{
		type = hypotrochoid
		pos = (0.5, 0.5, 0.0)
		scale = (2.0, 2.0)
		length = 0.05
		innerradius = 0.25
		outerradius = 0.1
		color = [
			255
			255
			255
			38
		]
		material = og_mat_dot_add
		blendmode = blend
		thickness = 30.0
		angularvel = -87.266495
	}
]
