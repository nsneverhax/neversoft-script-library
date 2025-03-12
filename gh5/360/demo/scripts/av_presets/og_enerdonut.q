og_enerdonut = [
	{
		type = blendprev
		offset = (-0.0004, -0.0007)
		scale = (1.01, 1.01)
		color = [
			255
			255
			255
			254
		]
		angle = 0.00174533
		angularvel = 0
		blendmode = blend_alphadiffuse
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.2
		color = [
			99
			98
			70
			255
		]
		blendmode = brighten
		thickness = 10.0
		controls = [
			{
				type = constant
				response = radiusscale
				scalemod = 0.05
				responsefunc = sintime
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
				timerate = 2.0944
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
