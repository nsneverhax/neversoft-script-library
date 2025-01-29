og_enerdonut_e = [
	{
		Type = blendprev
		offset = (-0.0004, -0.0007)
		Scale = (0.9, 0.95)
		Color = [
			255
			255
			255
			255
		]
		angle = 0.0
		angularvel = 0
		BlendMode = add
	}
	{
		Type = hypotrochoid
		Pos = (0.5, 0.5, 0.0)
		Scale = (1.0, 1.0)
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
		BlendMode = brighten
		thickness = 200.0
		angularvel = 17453.3
		controls = [
		]
	}
	{
		Type = hypotrochoid
		Pos = (0.5, 0.5, 0.0)
		Scale = (1.0, 1.0)
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
		BlendMode = blend
		thickness = 101.0
		angularvel = 1745.3301
		controls = [
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
		angle = 0
		angularvel = 0
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
		BlendMode = blend
		thickness = 1.0
		angle = 0
		angularvel = 3.1415896
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
		length = 0.4
		Color = [
			255
			61
			195
			255
		]
		BlendMode = blend
		thickness = 1.0
		angle = 0
		angularvel = -3.1415896
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
			114
			114
			121
		]
		BlendMode = blend
		thickness = 1.0
		angle = 0
		angularvel = 3.1415896
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
			72
			61
			255
			128
		]
		BlendMode = blend
		thickness = 1.0
		angle = 0
		angularvel = -3.1415896
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
		angle = 0
		angularvel = 0
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
		Scale = (1.0, 1.0)
		width = 0.5
		height = 0.5
		Color = [
			255
			255
			255
			255
		]
		material = og_mat_flare_sub
		BlendMode = blend
		angle = 0
		angularvel = 0
	}
]
