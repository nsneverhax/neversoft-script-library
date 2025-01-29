jow_jam_4p_electrictunnel = [
	{
		Type = blendprev
		offset = (0.0, 0.007)
		Scale = (0.95, 0.92999995)
		Color = [
			217
			217
			217
			254
		]
		angle = 0.0
		angularvel = 0.0
		BlendMode = blend
		controls = [
			{
				Type = frequency
				response = scalex
				scalemod = -0.04
				spectrumband = 0
			}
		]
	}
	{
		Type = nstar2
		Pos = (0.45000002, 0.4, 0.0)
		npoints = 4
		radius = 0.049
		radius2 = 0.07
		Color = [
			255
			255
			255
			255
		]
		BlendMode = blend
		thickness = 3.0
		angle = 0
		angularvel = 0.0
		controls = [
			{
				Type = notehit
				response = greenmodulation
				scalemod = -0.8
				Player = 2
				fade = 0.1
			}
			{
				Type = notehit
				response = bluemodulation
				scalemod = -0.8
				Player = 2
				fade = 0.1
			}
			{
				Type = frequency
				response = angularvelmod
				scalemod = 0.0
				spectrumband = 0
			}
			{
				Type = beaton
				response = radiusscale
				scalemod = 0.04
				fade = 0.1
			}
		]
	}
	{
		Type = nstar2
		Pos = (0.55, 0.4, 0.0)
		npoints = 4
		radius = 0.049
		radius2 = 0.07
		Color = [
			255
			255
			255
			255
		]
		BlendMode = blend
		thickness = 3.0
		angle = 0
		angularvel = 0.0
		controls = [
			{
				Type = notehit
				response = greenmodulation
				scalemod = -0.8
				Player = 2
				fade = 0.1
			}
			{
				Type = notehit
				response = bluemodulation
				scalemod = -0.8
				Player = 2
				fade = 0.1
			}
			{
				Type = frequency
				response = angularvelmod
				scalemod = 0.0
				spectrumband = 0
			}
			{
				Type = beaton
				response = radiusscale
				scalemod = 0.04
				fade = 0.1
			}
		]
	}
	{
		Type = line
		Pos = (0.48000002, 0.5, 0.0)
		length = 1.0
		Color = [
			115
			255
			62
			255
		]
		BlendMode = brighten
		thickness = 2.0
		angle = 1.5708001
		angularvel = 0.0
		controls = [
			{
				Type = waveform
				response = deform
				scalemod = 200.0
			}
		]
	}
	{
		Type = line
		Pos = (0.52, 0.5, 0.0)
		length = 1.0
		Color = [
			115
			255
			62
			255
		]
		BlendMode = brighten
		thickness = 2.0
		angle = 1.5708001
		angularvel = 0
		controls = [
			{
				Type = waveform
				response = deform
				scalemod = -200.0
			}
		]
	}
	{
		Type = line
		Pos = (0.75, 0.5, 0.0)
		length = 0.5
		Color = [
			115
			255
			62
			255
		]
		BlendMode = brighten
		thickness = 4.0
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
		Type = circle
		Pos = (0.5, 0.4, 0.0)
		radius = 0.1
		Color = [
			0
			0
			0
			255
		]
		BlendMode = brighten
		thickness = 3.0
		angle = 0
		angularvel = 0.43633202
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
				Player = 2
				fade = 0.1
			}
		]
	}
	{
		Type = line
		Pos = (0.25, 0.5, 0.0)
		length = -0.5
		Color = [
			115
			255
			62
			255
		]
		BlendMode = brighten
		thickness = 4.0
		angle = 0.0
		angularvel = 0
		controls = [
			{
				Type = notehit
				response = brightnessmodulation
				scalemod = 1.0
				Player = 3
				fade = 0.2
			}
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
				Player = 4
				fade = 0.2
			}
		]
	}
	{
		Type = sprite
		Pos = (0.5, 0.38000003)
		Scale = (1.0, 1.0)
		width = 0.1
		height = 0.1
		Color = [
			128
			28
			25
			0
		]
		material = jow_mat_star01_add
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = notehit
				response = alphamodulation
				scalemod = 1.0
				Player = 1
				fade = 0.1
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = 0.33
				Player = 1
				gemcolor = green
				fade = 0.1
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = 0.63
				Player = 1
				gemcolor = blue
				fade = 0.1
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = 0.09
				Player = 1
				gemcolor = orange
				fade = 0.1
			}
		]
	}
]
