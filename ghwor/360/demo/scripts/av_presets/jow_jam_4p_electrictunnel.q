jow_jam_4p_electrictunnel = [
	{
		type = blendprev
		offset = (0.0, 0.007)
		scale = (0.95, 0.92999995)
		color = [
			217
			217
			217
			254
		]
		angle = 0.0
		angularvel = 0.0
		blendmode = blend
		controls = [
			{
				type = frequency
				response = scalex
				scalemod = -0.04
				spectrumband = 0
			}
		]
	}
	{
		type = nstar2
		pos = (0.45000002, 0.4, 0.0)
		npoints = 4
		radius = 0.049
		radius2 = 0.07
		color = [
			255
			255
			255
			255
		]
		blendmode = blend
		thickness = 3.0
		angle = 0
		angularvel = 0.0
		controls = [
			{
				type = notehit
				response = greenmodulation
				scalemod = -0.8
				player = 2
				fade = 0.1
			}
			{
				type = notehit
				response = bluemodulation
				scalemod = -0.8
				player = 2
				fade = 0.1
			}
			{
				type = frequency
				response = angularvelmod
				scalemod = 0.0
				spectrumband = 0
			}
			{
				type = beaton
				response = radiusscale
				scalemod = 0.04
				fade = 0.1
			}
		]
	}
	{
		type = nstar2
		pos = (0.55, 0.4, 0.0)
		npoints = 4
		radius = 0.049
		radius2 = 0.07
		color = [
			255
			255
			255
			255
		]
		blendmode = blend
		thickness = 3.0
		angle = 0
		angularvel = 0.0
		controls = [
			{
				type = notehit
				response = greenmodulation
				scalemod = -0.8
				player = 2
				fade = 0.1
			}
			{
				type = notehit
				response = bluemodulation
				scalemod = -0.8
				player = 2
				fade = 0.1
			}
			{
				type = frequency
				response = angularvelmod
				scalemod = 0.0
				spectrumband = 0
			}
			{
				type = beaton
				response = radiusscale
				scalemod = 0.04
				fade = 0.1
			}
		]
	}
	{
		type = line
		pos = (0.48000002, 0.5, 0.0)
		length = 1.0
		color = [
			115
			255
			62
			255
		]
		blendmode = brighten
		thickness = 2.0
		angle = 1.5708001
		angularvel = 0.0
		controls = [
			{
				type = waveform
				response = deform
				scalemod = 200.0
			}
		]
	}
	{
		type = line
		pos = (0.52, 0.5, 0.0)
		length = 1.0
		color = [
			115
			255
			62
			255
		]
		blendmode = brighten
		thickness = 2.0
		angle = 1.5708001
		angularvel = 0
		controls = [
			{
				type = waveform
				response = deform
				scalemod = -200.0
			}
		]
	}
	{
		type = line
		pos = (0.75, 0.5, 0.0)
		length = 0.5
		color = [
			115
			255
			62
			255
		]
		blendmode = brighten
		thickness = 4.0
		angle = 0.0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 200.0
				spectrumband = 0
			}
			{
				type = notehit
				response = brightnessmodulation
				scalemod = 1.0
				player = 3
				fade = 0.2
			}
			{
				type = notehit
				response = brightnessmodulation
				scalemod = 1.0
				player = 4
				fade = 0.2
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.4, 0.0)
		radius = 0.1
		color = [
			0
			0
			0
			255
		]
		blendmode = brighten
		thickness = 3.0
		angle = 0
		angularvel = 0.43633202
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 200.0
				spectrumband = 0
			}
			{
				type = notehit
				response = brightnessmodulation
				scalemod = 1.0
				player = 2
				fade = 0.1
			}
		]
	}
	{
		type = line
		pos = (0.25, 0.5, 0.0)
		length = -0.5
		color = [
			115
			255
			62
			255
		]
		blendmode = brighten
		thickness = 4.0
		angle = 0.0
		angularvel = 0
		controls = [
			{
				type = notehit
				response = brightnessmodulation
				scalemod = 1.0
				player = 3
				fade = 0.2
			}
			{
				type = frequency
				response = deform
				scalemod = -200.0
				spectrumband = 0
			}
			{
				type = notehit
				response = brightnessmodulation
				scalemod = 1.0
				player = 4
				fade = 0.2
			}
		]
	}
	{
		type = sprite
		pos = (0.5, 0.38000003)
		scale = (1.0, 1.0)
		width = 0.1
		height = 0.1
		color = [
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
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				player = 1
				fade = 0.1
			}
			{
				type = notehit
				response = huemodulation
				scalemod = 0.33
				player = 1
				gemcolor = green
				fade = 0.1
			}
			{
				type = notehit
				response = huemodulation
				scalemod = 0.63
				player = 1
				gemcolor = blue
				fade = 0.1
			}
			{
				type = notehit
				response = huemodulation
				scalemod = 0.09
				player = 1
				gemcolor = orange
				fade = 0.1
			}
		]
	}
]
