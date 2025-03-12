og_jam_1player_colorhorizon = [
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (-1.01, 0.95)
		color = [
			225
			208
			249
			255
		]
		angle = 0.0349066
		angularvel = 0.0
		blendmode = blend
		nonuniformscale
		controls = [
		]
	}
	{
		type = line
		pos = (-0.1, 0.49, 0.0)
		length = 2.0
		color = [
			255
			0
			0
			0
		]
		blendmode = add
		thickness = 10.0
		angle = 0.0
		angularvel = 0
		controls = [
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				player = 1
				gemcolor = red
				fade = 1.0
			}
			{
				type = frequency
				response = deform
				scalemod = -2000.0
				spectrumband = 15
			}
		]
	}
	{
		type = line
		pos = (0.0, 0.48000002, 0.0)
		length = 2.0
		color = [
			141
			255
			0
			0
		]
		blendmode = add
		thickness = 10.0
		angle = 0.0
		angularvel = 0
		controls = [
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				player = 1
				gemcolor = green
				fade = 1.0
			}
			{
				type = frequency
				response = deform
				scalemod = -2000.0
				spectrumband = 10
			}
		]
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (-0.9, 12.0)
		color = [
			255
			200
			200
			1
		]
		angle = 1.5708001
		angularvel = 0.0
		blendmode = blend
		nonuniformscale
	}
	{
		type = line
		pos = (-0.25, 0.5, 0.0)
		length = 2.0
		color = [
			255
			255
			0
			0
		]
		blendmode = add
		thickness = 10.0
		angle = 0.0
		angularvel = 0
		controls = [
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				player = 1
				gemcolor = yellow
				fade = 1.0
			}
			{
				type = frequency
				response = jitterdeform
				scalemod = 2000.0
				spectrumband = 20
			}
		]
	}
	{
		type = line
		pos = (-0.3, 0.51, 0.0)
		length = 2.0
		color = [
			0
			107
			255
			0
		]
		blendmode = add
		thickness = 10.0
		angle = 0.0
		angularvel = 0
		controls = [
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				player = 1
				gemcolor = blue
				fade = 1.0
			}
			{
				type = frequency
				response = deform
				scalemod = 2000.0
				spectrumband = 25
			}
		]
	}
	{
		type = line
		pos = (-0.5, 0.52, 0.0)
		length = 2.0
		color = [
			255
			132
			0
			0
		]
		blendmode = add
		thickness = 10.0
		angle = 0.0
		angularvel = 0
		controls = [
			{
				type = notehit
				response = alphamodulation
				scalemod = 250.0
				player = 1
				gemcolor = orange
				fade = 1.0
			}
			{
				type = frequency
				response = deform
				scalemod = 2000.0
				spectrumband = 30
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.0125
		color = [
			255
			255
			255
			0
		]
		blendmode = add
		thickness = 1.0
		controls = [
			{
				type = beaton
				response = alphamodulation
				scalemod = 1.0
				fade = 1.0
			}
			{
				type = waveform
				response = deform
				scalemod = 500.0
			}
		]
	}
]
