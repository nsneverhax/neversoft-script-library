og_enerdonut_f = [
	{
		Type = blendprev
		offset = (-0.0004, -0.0007)
		Scale = (0.97999996, 0.97999996)
		Color = [
			252
			250
			255
			255
		]
		BlendMode = add
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
		material = og_mat_flare_brighten
		thickness = 200.0
		angularvel = 17453.3
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
		material = og_mat_flare_brighten
		thickness = 101.0
		angularvel = 1745.3301
	}
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.1
		Color = [
			255
			169
			59
			93
		]
		BlendMode = add
		thickness = 3.0
		controls = [
			{
				Type = constant
				response = radiusscale
				scalemod = 0.05
				responsefunc = sintime
				timerate = 3.1415896
			}
			{
				Type = frequency_history
				response = deform
				scalemod = -500.0
				responsefunc = costime
				spectrumband = 10
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.4
		Color = [
			255
			138
			114
			255
		]
		angularvel = 0.523599
		controls = [
			{
				Type = constant
				response = lengthscale
				scalemod = 0.1
				responsefunc = sintime
				timerate = 3.1415896
			}
			{
				Type = frequency_history
				response = deform
				scalemod = -500.0
				responsefunc = costime
				spectrumband = 10
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		length = -0.4
		Color = [
			255
			61
			195
			255
		]
		angularvel = -0.523599
		controls = [
			{
				Type = constant
				response = lengthscale
				scalemod = 0.1
				responsefunc = sintime
				timerate = 3.1415896
			}
			{
				Type = frequency_history
				response = deform
				scalemod = 500.0
				responsefunc = costime
				spectrumband = 10
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.4
		Color = [
			255
			227
			227
			121
		]
		BlendMode = brighten
		thickness = 20.0
		angle = 0.0349066
		angularvel = 1.5708001
		controls = [
			{
				Type = constant
				response = lengthscale
				scalemod = 0.1
				responsefunc = sintime
				timerate = 3.1415896
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.4
		Color = [
			217
			215
			255
			128
		]
		BlendMode = brighten
		thickness = 10.0
		angle = -0.0349066
		angularvel = -1.5708001
		controls = [
			{
				Type = constant
				response = lengthscale
				scalemod = 0.1
				responsefunc = sintime
				timerate = 3.1415896
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.1
		Color = [
			255
			169
			59
			93
		]
		BlendMode = add
		thickness = 3.0
		controls = [
			{
				Type = constant
				response = radiusscale
				scalemod = 0.05
				responsefunc = costime
				timerate = 3.1415896
			}
			{
				Type = frequency_history
				response = deform
				scalemod = -500.0
				responsefunc = costime
				spectrumband = 10
			}
		]
	}
	{
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		width = 0.5
		height = 0.5
		Color = [
			255
			255
			255
			255
		]
		material = og_mat_flare_sub
	}
]
