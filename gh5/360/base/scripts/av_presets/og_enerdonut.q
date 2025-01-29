og_enerdonut = [
	{
		Type = blendprev
		offset = (-0.0004, -0.0007)
		Scale = (1.01, 1.01)
		Color = [
			255
			255
			255
			254
		]
		angle = 0.00174533
		angularvel = 0
		BlendMode = blend_alphadiffuse
	}
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.2
		Color = [
			99
			98
			70
			255
		]
		BlendMode = brighten
		thickness = 10.0
		controls = [
			{
				Type = constant
				response = radiusscale
				scalemod = 0.05
				responsefunc = sintime
				timerate = 1.0472
			}
		]
	}
	{
		Type = hypotrochoid
		Pos = (0.5, 0.5, 0.0)
		length = 0.05
		InnerRadius = 0.25
		outerradius = 0.05
		Color = [
			144
			70
			255
			126
		]
		material = og_mat_flare_add
		BlendMode = blend
		thickness = 200.0
		angularvel = 17453.3
		controls = [
		]
	}
	{
		Type = hypotrochoid
		Pos = (0.5, 0.5, 0.0)
		length = 0.05
		InnerRadius = 0.25
		outerradius = 0.05
		Color = [
			196
			228
			255
			102
		]
		material = og_mat_flare_add
		BlendMode = blend
		thickness = 101.0
		angularvel = 1745.3301
		controls = [
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.2
		Color = [
			255
			169
			59
			93
		]
		BlendMode = add
		thickness = 1.0
		controls = [
			{
				Type = constant
				response = radiusscale
				scalemod = 0.05
				responsefunc = sintime
				timerate = 2.0944
			}
			{
				Type = frequency_history
				response = deform
				scalemod = -50.0
				responsefunc = costime
				spectrumband = 10
			}
		]
	}
]
