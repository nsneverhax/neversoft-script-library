jow_jam_4p_electrictunnel_b = [
	{
		Type = blendprev
		offset = (0.0, 0.007)
		Scale = (0.95, 0.92999995)
		Color = [
			230
			230
			230
			254
		]
		angle = 0.0
		angularvel = 0.0
		BlendMode = blend
		controls = [
			{
				Type = frequency
				response = scalex
				scalemod = -0.05
				spectrumband = 0
			}
		]
	}
	{
		Type = nstar2
		Pos = (0.45000002, 0.4, 0.0)
		npoints = 4
		radius = 0.05
		radius2 = 0.07
		Color = [
			121
			194
			255
			255
		]
		BlendMode = blend
		thickness = 4.0
		angle = 0
		angularvel = -0.0872665
		controls = [
			{
				Type = notehit
				response = radiusscale
				scalemod = 0.04
				Player = 2
				fade = 0.1
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = 0.5
				Player = 2
				fade = 0.1
			}
			{
				Type = frequency
				response = angularvelmod
				scalemod = -5.0
				spectrumband = 0
			}
		]
	}
	{
		Type = nstar2
		Pos = (0.55, 0.4, 0.0)
		npoints = 4
		radius = 0.05
		radius2 = 0.07
		Color = [
			121
			194
			255
			255
		]
		BlendMode = blend
		thickness = 4.0
		angle = 0
		angularvel = 0.0872665
		controls = [
			{
				Type = notehit
				response = radiusscale
				scalemod = 0.04
				Player = 2
				fade = 0.1
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = 0.5
				Player = 2
				fade = 0.1
			}
			{
				Type = frequency
				response = angularvelmod
				scalemod = 5.0
				spectrumband = 0
			}
		]
	}
	{
		Type = line
		Pos = (0.49, 0.5, 0.0)
		length = 1.0
		Color = [
			0
			0
			0
			255
		]
		BlendMode = brighten
		thickness = 12.0
		angle = -0.78539795
		angularvel = 0.0
		controls = [
			{
				Type = waveform
				response = deform
				scalemod = 300.0
			}
			{
				Type = notehit
				response = brightnessmodulation
				scalemod = 1.0
				Player = 4
				fade = 0.2
			}
		]
	}
	{
		Type = line
		Pos = (0.51, 0.5, 0.0)
		length = 1.0
		Color = [
			0
			0
			0
			255
		]
		BlendMode = brighten
		thickness = 12.0
		angle = 0.78539795
		angularvel = 0
		controls = [
			{
				Type = waveform
				response = deform
				scalemod = -300.0
			}
			{
				Type = notehit
				response = brightnessmodulation
				scalemod = 1.0
				Player = 4
				fade = 0.2
			}
		]
	}
	{
		Type = line
		Pos = (0.75, 0.5, 0.0)
		length = 0.5
		Color = [
			26
			23
			16
			255
		]
		BlendMode = brighten
		thickness = 6.0
		angle = 0.0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 200.0
				spectrumband = 0
			}
			{
				Type = notehit
				response = brightnessmodulation
				scalemod = 1.0
				Player = 3
				fade = 0.2
			}
		]
	}
	{
		Type = line
		Pos = (0.25, 0.5, 0.0)
		length = -0.5
		Color = [
			26
			23
			16
			255
		]
		BlendMode = brighten
		thickness = 6.0
		angle = 0.0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = -200.0
				spectrumband = 0
			}
			{
				Type = notehit
				response = brightnessmodulation
				scalemod = 1.0
				Player = 3
				fade = 0.2
			}
		]
	}
	{
		Type = sprite
		Pos = (0.5, 0.45000002)
		Scale = (1.0, 1.0)
		width = 0.5
		height = 0.75
		Color = [
			112
			255
			169
			0
		]
		material = jow_mat_cardshearts01_blend
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = notehit
				response = alphamodulation
				scalemod = 0.5
				Player = 1
				fade = 0.1
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = -0.4
				Player = 1
				gemcolor = red
				fade = 0.1
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = -0.25
				Player = 1
				gemcolor = yellow
				fade = 0.1
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = 0.21000001
				Player = 1
				gemcolor = blue
				fade = 0.1
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = -0.33
				Player = 1
				gemcolor = orange
				fade = 0.1
			}
		]
	}
]
