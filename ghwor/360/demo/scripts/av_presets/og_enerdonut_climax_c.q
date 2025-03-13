og_enerdonut_climax_c = [
	{
		type = blendprev
		offset = (-0.0004, -0.0007)
		scale = (0.97999996, 0.97999996)
		color = [
			255
			255
			255
			255
		]
		angle = 0.0
		angularvel = 0
		blendmode = add
		controls = [
			{
				type = constant
				response = offsetx
				scalemod = 0.005
				responsefunc = sintime
				timerate = 1.0472
			}
			{
				type = constant
				response = offsety
				scalemod = 0.005
				responsefunc = costime
				timerate = 1.0472
			}
		]
	}
	{
		type = blendprev
		offset = (-0.0004, -0.0007)
		scale = (2.0, 1.0)
		color = [
			121
			246
			110
			38
		]
		angle = 1.48353
		angularvel = 0
		blendmode = subtract
	}
	{
		type = hypotrochoid
		pos = (0.5, 0.5, 0.0)
		length = 0.05
		innerradius = 0.25
		outerradius = 0.05
		color = [
			144
			70
			255
			126
		]
		material = og_mat_flare_add
		blendmode = blend
		thickness = 200.0
		angularvel = 17453.3
		controls = [
		]
	}
	{
		type = hypotrochoid
		pos = (0.5, 0.5, 0.0)
		length = 0.05
		innerradius = 0.25
		outerradius = 0.05
		color = [
			196
			228
			255
			102
		]
		material = og_mat_flare_add
		blendmode = blend
		thickness = 101.0
		angularvel = 1745.3301
		controls = [
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.2
		color = [
			255
			169
			59
			93
		]
		blendmode = add
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = constant
				response = radiusscale
				scalemod = 0.05
				responsefunc = sintime
				timerate = 3.1415896
			}
			{
				type = frequency_history
				response = deform
				scalemod = -50.0
				responsefunc = costime
				spectrumband = 10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 0.4
		color = [
			255
			138
			114
			255
		]
		blendmode = add
		thickness = 1.0
		angle = 0
		angularvel = 3.1415896
		controls = [
			{
				type = constant
				response = lengthscale
				scalemod = 0.1
				responsefunc = sintime
				timerate = 3.1415896
			}
			{
				type = frequency_history
				response = deform
				scalemod = -50.0
				responsefunc = costime
				spectrumband = 10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 0.4
		color = [
			255
			61
			195
			255
		]
		blendmode = add
		thickness = 1.0
		angle = 0
		angularvel = -3.1415896
		controls = [
			{
				type = constant
				response = lengthscale
				scalemod = 0.1
				responsefunc = sintime
				timerate = 3.1415896
			}
			{
				type = frequency_history
				response = deform
				scalemod = 50.0
				responsefunc = costime
				spectrumband = 10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 0.4
		color = [
			255
			114
			114
			121
		]
		blendmode = add
		thickness = 1.0
		angle = 0
		angularvel = 1.39627
		controls = [
			{
				type = constant
				response = lengthscale
				scalemod = 0.1
				responsefunc = sintime
				timerate = 3.1415896
			}
			{
				type = frequency_history
				response = deform
				scalemod = 50.0
				responsefunc = costime
				spectrumband = 10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 0.4
		color = [
			72
			61
			255
			128
		]
		blendmode = add
		thickness = 1.0
		angle = 0
		angularvel = -1.39626
		controls = [
			{
				type = constant
				response = lengthscale
				scalemod = 0.1
				responsefunc = sintime
				timerate = 3.1415896
			}
			{
				type = frequency_history
				response = deform
				scalemod = -50.0
				responsefunc = costime
				spectrumband = 10
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.2
		color = [
			255
			169
			59
			93
		]
		blendmode = add
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = constant
				response = radiusscale
				scalemod = 0.05
				responsefunc = costime
				timerate = 3.1415896
			}
			{
				type = frequency_history
				response = deform
				scalemod = -50.0
				responsefunc = costime
				spectrumband = 10
			}
		]
	}
	{
		type = sprite
		pos = (0.5, 0.5, 0.0)
		scale = (0.5, 0.5)
		width = 0.5
		height = 0.5
		color = [
			255
			161
			128
			255
		]
		material = og_mat_flare_blend
		blendmode = blend
		angle = 0
		angularvel = 1.7453301
		controls = [
			{
				type = beaton
				response = scalex
				scalemod = 0.5
				fade = 1.0
			}
			{
				type = beaton
				response = scaley
				scalemod = 0.5
				fade = 1.0
			}
		]
	}
]
