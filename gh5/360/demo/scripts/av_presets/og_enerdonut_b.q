og_enerdonut_b = [
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (1.01, 1.01)
		color = [
			255
			255
			255
			254
		]
		angle = 0.0
		angularvel = 0
		blendmode = blend_alphadiffuse
		controls = [
			{
				type = constant
				response = offsetx
				scalemod = 0.001
				responsefunc = sintime
				timerate = 1.0472
			}
			{
				type = constant
				response = offsety
				scalemod = 0.001
				responsefunc = costime
				timerate = 1.0472
			}
		]
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
			114
			203
			255
			255
		]
		blendmode = blend
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
			61
			255
			242
			255
		]
		blendmode = blend
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
		blendmode = blend
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
		blendmode = blend
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
