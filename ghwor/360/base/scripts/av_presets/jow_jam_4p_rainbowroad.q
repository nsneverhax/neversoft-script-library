jow_jam_4p_rainbowroad = [
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (0.92999995, 0.97999996)
		Color = [
			255
			255
			255
			253
		]
		angle = 0
		angularvel = 0.0
		BlendMode = blend
		controls = [
		]
	}
	{
		Type = sprite
		Pos = (0.499, 1.0)
		Scale = (1.0, 1.0)
		width = 0.1
		height = 1.0
		Color = [
			255
			255
			255
			0
		]
		material = og_mat_sphere_add
		angle = 0
		angularvel = -0.00349066
		controls = [
			{
				Type = constant
				response = huemodulation
				scalemod = 0.5
				responsefunc = costime
			}
			{
				Type = notehit
				response = alphamodulation
				scalemod = 0.04
				Player = 3
				fade = 1.0
			}
			{
				Type = notehit
				response = scalexy
				scalemod = 0.1
				Player = 3
				fade = 1.0
			}
		]
	}
	{
		Type = line
		Pos = (0.499, 0.5, 0.0)
		length = 0.4
		Color = [
			0
			255
			255
			255
		]
		BlendMode = blend
		thickness = 1.0
		angle = 4.71239
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 100.0
				deformwindowstart = 3
				spectrumband = 24
			}
			{
				Type = constant
				response = huemodulation
				scalemod = 0.5
				responsefunc = costime
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.4
		Color = [
			0
			255
			255
			255
		]
		BlendMode = blend
		thickness = 1.0
		angle = 4.71239
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = -100.0
				deformwindowstart = 3
				spectrumband = 0
			}
			{
				Type = constant
				response = huemodulation
				scalemod = 0.5
				responsefunc = costime
			}
		]
	}
	{
		Type = circle
		Pos = (0.499, -0.8, 0.0)
		radius = 0.65000004
		Color = [
			255
			255
			255
			0
		]
		BlendMode = brighten
		thickness = 2.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = notehit
				response = radiusscale
				scalemod = 0.05
				Player = 4
				fade = 1.0
			}
			{
				Type = notehit
				response = alphamodulation
				scalemod = 1.0
				Player = 4
				fade = 1.0
			}
			{
				Type = waveform
				response = deform
				scalemod = 100.0
			}
		]
	}
	{
		Type = circle
		Pos = (0.499, 0.3, 0.0)
		radius = 0.0
		Color = [
			255
			255
			255
			255
		]
		BlendMode = brighten
		thickness = 2.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = notehit
				response = radiusscale
				scalemod = 0.05
				Player = 1
				fade = 1.0
			}
			{
				Type = waveform
				response = deform
				scalemod = 50.0
				Player = 1
			}
		]
	}
	{
		Type = circle
		Pos = (0.499, 0.7, 0.0)
		radius = 0.0
		Color = [
			255
			255
			255
			255
		]
		BlendMode = brighten
		thickness = 2.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = notehit
				response = radiusscale
				scalemod = 0.05
				Player = 1
				fade = 1.0
			}
			{
				Type = waveform
				response = deform
				scalemod = 50.0
				Player = 1
			}
		]
	}
	{
		Type = hypotrochoid
		Pos = (0.499, 0.5, 0.0)
		Scale = (0.5, 0.5)
		length = 0.15
		InnerRadius = 0.15
		outerradius = 0.35000002
		Color = [
			102
			102
			102
			0
		]
		material = og_mat_flare_add
		thickness = 60.0
		angularvel = 1.7453301
		controls = [
			{
				Type = notehit
				response = alphamodulation
				scalemod = 1.0
				Player = 2
				fade = 1.0
			}
			{
				Type = notehit
				response = scalexy
				scalemod = 0.1
				Player = 2
				fade = 1.0
			}
		]
	}
	{
		Type = hypotrochoid
		Pos = (0.499, 0.5, 0.0)
		Scale = (0.5, 0.5)
		length = 0.15
		InnerRadius = 0.15
		outerradius = 0.35000002
		Color = [
			102
			102
			102
			0
		]
		material = og_mat_flare_add
		thickness = 60.0
		angularvel = -1.7453301
		controls = [
			{
				Type = notehit
				response = alphamodulation
				scalemod = 1.0
				Player = 2
				fade = 1.0
			}
			{
				Type = notehit
				response = scalexy
				scalemod = 0.1
				Player = 2
				fade = 1.0
			}
		]
	}
]
