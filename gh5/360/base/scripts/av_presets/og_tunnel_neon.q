og_tunnel_neon = [
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (0.98999995, 0.98999995)
		Color = [
			255
			255
			255
			254
		]
		angularvel = 0
		BlendMode = blend
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (1.0, 0.99099994)
		Color = [
			255
			255
			255
			9
		]
		angularvel = 0
		BlendMode = add
	}
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.25
		Color = [
			51
			0
			0
			255
		]
		thickness = 1.0
		controls = [
			{
				Type = frequency
				response = bluemodulation
				colorscale = 100.0
				spectrumband = 10
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.1
		Color = [
			255
			58
			64
			25
		]
		thickness = 1.0
		controls = [
			{
				Type = frequency
				response = alphamodulation
				colorscale = 1000.0
				spectrumband = 30
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		length = 1.0
		Color = [
			37
			37
			37
			127
		]
		thickness = 2.0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = redmodulation
				colorscale = 255.0
				spectrumband = 10
			}
			{
				Type = frequency
				response = greenmodulation
				colorscale = 200.0
				spectrumband = 11
			}
			{
				Type = frequency
				response = bluemodulation
				colorscale = 100.0
				spectrumband = 12
			}
			{
				Type = waveform
				response = deform
				deformscale = 50000.0
				responsefunc = exp
			}
		]
	}
]
