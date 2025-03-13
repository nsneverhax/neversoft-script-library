jow_viz_electrictunnel_b = [
	{
		type = blendprev
		offset = (0.0, 0.007)
		scale = (0.92999995, 0.92999995)
		color = [
			230
			230
			230
			254
		]
		angle = 0.0
		angularvel = 0.0
		blendmode = blend
		controls = [
			{
				type = frequency
				response = scalex
				scalemod = -0.01
				spectrumband = 0
			}
		]
	}
	{
		type = nstar2
		pos = (0.45000002, 0.4, 0.0)
		npoints = 4
		radius = 0.05
		radius2 = 0.07
		color = [
			121
			194
			255
			255
		]
		blendmode = blend
		thickness = 4.0
		angle = 0
		angularvel = -0.0872665
		controls = [
			{
				type = notehit
				response = radiusscale
				scalemod = 0.04
				player = 1
				fade = 0.1
			}
			{
				type = notehit
				response = huemodulation
				scalemod = 0.5
				player = 1
				fade = 0.1
			}
			{
				type = frequency
				response = angularvelmod
				scalemod = -5.0
				spectrumband = 0
			}
		]
	}
	{
		type = nstar2
		pos = (0.55, 0.4, 0.0)
		npoints = 4
		radius = 0.05
		radius2 = 0.07
		color = [
			121
			194
			255
			255
		]
		blendmode = blend
		thickness = 4.0
		angle = 0
		angularvel = 0.0872665
		controls = [
			{
				type = notehit
				response = radiusscale
				scalemod = 0.04
				player = 1
				fade = 0.1
			}
			{
				type = notehit
				response = huemodulation
				scalemod = 0.5
				player = 1
				fade = 0.1
			}
			{
				type = frequency
				response = angularvelmod
				scalemod = 5.0
				spectrumband = 0
			}
		]
	}
	{
		type = line
		pos = (0.49, 0.5, 0.0)
		length = 1.0
		color = [
			0
			0
			0
			255
		]
		blendmode = brighten
		thickness = 12.0
		angle = -0.78539795
		angularvel = 0.0
		controls = [
			{
				type = notehit
				response = brightnessmodulation
				scalemod = 1.0
				player = 2
				fade = 0.2
			}
			{
				type = waveform
				response = deform
				scalemod = 300.0
			}
		]
	}
	{
		type = line
		pos = (0.51, 0.5, 0.0)
		length = 1.0
		color = [
			0
			0
			0
			255
		]
		blendmode = brighten
		thickness = 12.0
		angle = 0.78539795
		angularvel = 0
		controls = [
			{
				type = notehit
				response = brightnessmodulation
				scalemod = 1.0
				player = 2
				fade = 0.2
			}
			{
				type = waveform
				response = deform
				scalemod = -300.0
			}
		]
	}
	{
		type = line
		pos = (0.75, 0.5, 0.0)
		length = 0.5
		color = [
			26
			23
			16
			255
		]
		blendmode = brighten
		thickness = 6.0
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
				player = 1
				fade = 0.2
			}
		]
	}
	{
		type = line
		pos = (0.25, 0.5, 0.0)
		length = -0.5
		color = [
			26
			23
			16
			255
		]
		blendmode = brighten
		thickness = 6.0
		angle = 0.0
		angularvel = 0
		controls = [
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
				player = 1
				fade = 0.2
			}
		]
	}
]
