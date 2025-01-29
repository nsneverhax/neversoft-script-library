og_lhc_falling = [
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (1.0, 1.0)
		Color = [
			248
			255
			252
			254
		]
		angle = 0
		angularvel = 0
		BlendMode = blend
	}
	{
		Type = hypotrochoid
		Pos = (0.5, 0.5, 0.0)
		Scale = (1.0, 1.0)
		length = 0.05
		InnerRadius = 0.25
		outerradius = 0.05
		Color = [
			255
			255
			255
			255
		]
		material = og_mat_dot_add
		BlendMode = blend
		thickness = 10.0
		angularvel = 10
		controls = [
			{
				Type = constant
				response = radiusscale
				scalemod = 0.5
				responsefunc = sintime
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.1
		Color = [
			117
			175
			255
			255
		]
		BlendMode = blend
		thickness = 1.0
		angle = 1.0472
		angularvel = -0.17453298
		controls = [
			{
				Type = History
				historytype = frequency
				response = deform
				scalemod = 1000.0
				spectrumband = 10
			}
		]
	}
	{
		Type = nstar2
		Pos = (0.5, 0.5, 0.0)
		npoints = 3
		radius = 0.1
		radius2 = 0.1
		Color = [
			20
			44
			53
			255
		]
		BlendMode = add
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = constant
				response = anglemod
				scalemod = 0.5
				responsefunc = sintime
			}
			{
				Type = constant
				response = radiusscale
				scalemod = 0.5
				responsefunc = sintime
			}
			{
				Type = constant
				response = radius2scale
				scalemod = 0.5
				responsefunc = sintime
				timerate = 0.523599
			}
		]
	}
]
