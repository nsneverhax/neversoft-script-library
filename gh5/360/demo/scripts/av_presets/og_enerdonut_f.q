og_enerdonut_f = [
	{
		type = blendprev
		offset = (-0.0004, -0.0007)
		scale = (0.97999996, 0.97999996)
		color = [
			252
			250
			255
			255
		]
		angle = 0.0
		angularvel = 0
		blendmode = add
	}
	{
		type = hypotrochoid
		pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		length = 0.05
		innerradius = 0.25
		outerradius = 0.05
		color = [
			144
			70
			255
			126
		]
		material = og_mat_flare_brighten
		blendmode = brighten
		thickness = 200.0
		angularvel = 17453.3
		controls = [
		]
	}
	{
		type = hypotrochoid
		pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		length = 0.05
		innerradius = 0.25
		outerradius = 0.05
		color = [
			196
			228
			255
			102
		]
		material = og_mat_flare_brighten
		blendmode = blend
		thickness = 101.0
		angularvel = 1745.3301
		controls = [
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.1
		color = [
			255
			169
			59
			93
		]
		blendmode = add
		thickness = 3.0
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
				scalemod = -500.0
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
		blendmode = blend
		thickness = 1.0
		angle = 0
		angularvel = 0.523599
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
				scalemod = -500.0
				responsefunc = costime
				spectrumband = 10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = -0.4
		color = [
			255
			61
			195
			255
		]
		blendmode = blend
		thickness = 1.0
		angle = 0
		angularvel = -0.523599
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
				scalemod = 500.0
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
			227
			227
			121
		]
		blendmode = brighten
		thickness = 20.0
		angle = 0.0349066
		angularvel = 1.5708001
		controls = [
			{
				type = constant
				response = lengthscale
				scalemod = 0.1
				responsefunc = sintime
				timerate = 3.1415896
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 0.4
		color = [
			217
			215
			255
			128
		]
		blendmode = brighten
		thickness = 10.0
		angle = -0.0349066
		angularvel = -1.5708001
		controls = [
			{
				type = constant
				response = lengthscale
				scalemod = 0.1
				responsefunc = sintime
				timerate = 3.1415896
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.1
		color = [
			255
			169
			59
			93
		]
		blendmode = add
		thickness = 3.0
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
				scalemod = -500.0
				responsefunc = costime
				spectrumband = 10
			}
		]
	}
	{
		type = sprite
		pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 0.5
		height = 0.5
		color = [
			255
			255
			255
			255
		]
		material = og_mat_flare_sub
		blendmode = blend
		angle = 0
		angularvel = 0
	}
]
