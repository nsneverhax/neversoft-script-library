og_energy_vortex_b = [
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (1.0, 1.0)
		Color = [
			40
			5
			0
			254
		]
		angle = 0.0
		angularvel = 6.28319
		BlendMode = subtract
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (0.9, 0.9)
		Color = [
			246
			238
			255
			229
		]
		angle = 0.052359905
		angularvel = 0
		BlendMode = blend
	}
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.01
		Color = [
			255
			255
			255
			255
		]
		BlendMode = brighten
		thickness = 10.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = notehit
				response = radiusscale
				scalemod = 1.0
				Player = 1
				fade = 0.5
			}
			{
				Type = waveform
				response = deform
				scalemod = 500.0
			}
		]
	}
	{
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		Scale = (0.0, 0.0)
		width = 0.5
		height = 0.5
		Color = [
			255
			180
			180
			255
		]
		material = og_mat_sphere_bright
		angle = 0
		angularvel = 1.7453301
		controls = [
			{
				Type = constant
				response = offsetx
				scalemod = 0.01
				responsefunc = costime
			}
			{
				Type = constant
				response = offsety
				scalemod = 0.01
				responsefunc = sintime
			}
			{
				Type = notehit
				response = scalexy
				scalemod = 1.0
				Player = 1
				fade = 0.5
			}
		]
	}
	{
		Type = nstar2
		Pos = (0.5, 0.5, 0.0)
		npoints = 19
		radius = 0.1
		radius2 = 1.0
		Color = [
			46
			24
			24
			255
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 0.872665
		controls = [
			{
				Type = frequency
				response = radiusscale
				scalemod = 0.1
				spectrumband = 1
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
			130
			86
			46
			255
		]
		material = og_mat_sphere_add
		angle = 0
		angularvel = -0.54105204
	}
	{
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		Scale = (1.0, 1.0)
		width = 0.5
		height = 0.5
		Color = [
			202
			193
			235
			139
		]
		material = og_mat_sphere_b_sub
		angle = 0
		angularvel = 0.523599
		controls = [
			{
				Type = frequency
				response = scalexy
				scalemod = -0.5
				spectrumband = 10
			}
		]
	}
]
