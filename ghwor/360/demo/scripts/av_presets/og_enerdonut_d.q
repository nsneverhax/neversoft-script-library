og_enerdonut_d = [
	{
		type = blendprev
		offset = (-0.0004, -0.0007)
		color = [
			255
			255
			255
			254
		]
		angle = 0.0174533
		blendmode = blend
		nonuniformscale
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
		thickness = 60.0
		angularvel = 17453.3
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
		thickness = 60.0
		angularvel = 1745.3301
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
		angularvel = 3.1415896
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
			72
			61
			255
			128
		]
		angularvel = -3.1415896
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
		radius = 0.2
		color = [
			255
			169
			59
			93
		]
		blendmode = add
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
]
