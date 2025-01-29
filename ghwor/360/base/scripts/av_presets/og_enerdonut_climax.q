og_enerdonut_climax = [
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
		material = og_mat_flare_add
		thickness = 101.0
		angularvel = 1745.3301
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
				scalemod = -50.0
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
		BlendMode = add
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
				scalemod = -50.0
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
		BlendMode = add
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
				scalemod = 50.0
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
		BlendMode = add
		angularvel = 1.39627
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
				scalemod = 50.0
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
			72
			61
			255
			128
		]
		BlendMode = add
		angularvel = -1.39626
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
				scalemod = -50.0
				responsefunc = costime
				spectrumband = 10
			}
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
				scalemod = -50.0
				responsefunc = costime
				spectrumband = 10
			}
		]
	}
	{
		Type = blendprev
		offset = (-0.0004, -0.0007)
		Scale = (0.97999996, 0.97999996)
		Color = [
			255
			255
			255
			255
		]
		BlendMode = add
	}
	{
		Type = blendprev
		offset = (-0.0004, -0.0007)
		Scale = (2.0, 1.0)
		Color = [
			15
			26
			14
			38
		]
		angle = 1.48353
		BlendMode = subtract
	}
	{
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		Scale = (0.5, 0.5)
		width = 0.5
		height = 0.5
		Color = [
			255
			161
			128
			255
		]
		material = og_mat_flare_blend
		angularvel = 1.7453301
		controls = [
			{
				Type = beaton
				response = scalex
				scalemod = 0.5
				fade = 1.0
			}
			{
				Type = beaton
				response = scaley
				scalemod = 0.5
				fade = 1.0
			}
		]
	}
]
