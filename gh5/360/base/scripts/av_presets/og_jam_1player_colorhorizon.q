og_jam_1player_colorhorizon = [
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (-1.01, 0.95)
		Color = [
			225
			208
			249
			255
		]
		angle = 0.0349066
		angularvel = 0.0
		BlendMode = blend
		nonuniformscale
		controls = [
		]
	}
	{
		Type = line
		Pos = (-0.1, 0.49, 0.0)
		length = 2.0
		Color = [
			255
			0
			0
			0
		]
		BlendMode = add
		thickness = 10.0
		angle = 0.0
		angularvel = 0
		controls = [
			{
				Type = notehit
				response = alphamodulation
				scalemod = 1.0
				Player = 1
				gemcolor = red
				fade = 1.0
			}
			{
				Type = frequency
				response = deform
				scalemod = -2000.0
				spectrumband = 15
			}
		]
	}
	{
		Type = line
		Pos = (0.0, 0.48000002, 0.0)
		length = 2.0
		Color = [
			141
			255
			0
			0
		]
		BlendMode = add
		thickness = 10.0
		angle = 0.0
		angularvel = 0
		controls = [
			{
				Type = notehit
				response = alphamodulation
				scalemod = 1.0
				Player = 1
				gemcolor = green
				fade = 1.0
			}
			{
				Type = frequency
				response = deform
				scalemod = -2000.0
				spectrumband = 10
			}
		]
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (-0.9, 12.0)
		Color = [
			255
			200
			200
			1
		]
		angle = 1.5708001
		angularvel = 0.0
		BlendMode = blend
		nonuniformscale
	}
	{
		Type = line
		Pos = (-0.25, 0.5, 0.0)
		length = 2.0
		Color = [
			255
			255
			0
			0
		]
		BlendMode = add
		thickness = 10.0
		angle = 0.0
		angularvel = 0
		controls = [
			{
				Type = notehit
				response = alphamodulation
				scalemod = 1.0
				Player = 1
				gemcolor = yellow
				fade = 1.0
			}
			{
				Type = frequency
				response = jitterdeform
				scalemod = 2000.0
				spectrumband = 20
			}
		]
	}
	{
		Type = line
		Pos = (-0.3, 0.51, 0.0)
		length = 2.0
		Color = [
			0
			107
			255
			0
		]
		BlendMode = add
		thickness = 10.0
		angle = 0.0
		angularvel = 0
		controls = [
			{
				Type = notehit
				response = alphamodulation
				scalemod = 1.0
				Player = 1
				gemcolor = blue
				fade = 1.0
			}
			{
				Type = frequency
				response = deform
				scalemod = 2000.0
				spectrumband = 25
			}
		]
	}
	{
		Type = line
		Pos = (-0.5, 0.52, 0.0)
		length = 2.0
		Color = [
			255
			132
			0
			0
		]
		BlendMode = add
		thickness = 10.0
		angle = 0.0
		angularvel = 0
		controls = [
			{
				Type = notehit
				response = alphamodulation
				scalemod = 250.0
				Player = 1
				gemcolor = orange
				fade = 1.0
			}
			{
				Type = frequency
				response = deform
				scalemod = 2000.0
				spectrumband = 30
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.0125
		Color = [
			255
			255
			255
			0
		]
		BlendMode = add
		thickness = 1.0
		controls = [
			{
				Type = beaton
				response = alphamodulation
				scalemod = 1.0
				fade = 1.0
			}
			{
				Type = waveform
				response = deform
				scalemod = 500.0
			}
		]
	}
]
