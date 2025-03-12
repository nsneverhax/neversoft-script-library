jow_jam_4p_rainbowroad = [
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (0.92999995, 0.97999996)
		color = [
			255
			255
			255
			253
		]
		angle = 0
		angularvel = 0.0
		blendmode = blend
		controls = [
		]
	}
	{
		type = sprite
		pos = (0.499, 1.0)
		scale = (1.0, 1.0)
		width = 0.1
		height = 1.0
		color = [
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
				type = constant
				response = huemodulation
				scalemod = 0.5
				responsefunc = costime
			}
			{
				type = notehit
				response = alphamodulation
				scalemod = 0.04
				player = 3
				fade = 1.0
			}
			{
				type = notehit
				response = scalexy
				scalemod = 0.1
				player = 3
				fade = 1.0
			}
		]
	}
	{
		type = line
		pos = (0.499, 0.5, 0.0)
		length = 0.4
		color = [
			0
			255
			255
			255
		]
		blendmode = blend
		thickness = 1.0
		angle = 4.71239
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 100.0
				deformwindowstart = 3
				spectrumband = 24
			}
			{
				type = constant
				response = huemodulation
				scalemod = 0.5
				responsefunc = costime
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 0.4
		color = [
			0
			255
			255
			255
		]
		blendmode = blend
		thickness = 1.0
		angle = 4.71239
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = -100.0
				deformwindowstart = 3
				spectrumband = 0
			}
			{
				type = constant
				response = huemodulation
				scalemod = 0.5
				responsefunc = costime
			}
		]
	}
	{
		type = circle
		pos = (0.499, -0.8, 0.0)
		radius = 0.65000004
		color = [
			255
			255
			255
			0
		]
		blendmode = brighten
		thickness = 2.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = notehit
				response = radiusscale
				scalemod = 0.05
				player = 4
				fade = 1.0
			}
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				player = 4
				fade = 1.0
			}
			{
				type = waveform
				response = deform
				scalemod = 100.0
			}
		]
	}
	{
		type = circle
		pos = (0.499, 0.3, 0.0)
		radius = 0.0
		color = [
			255
			255
			255
			255
		]
		blendmode = brighten
		thickness = 2.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = notehit
				response = radiusscale
				scalemod = 0.05
				player = 1
				fade = 1.0
			}
			{
				type = waveform
				response = deform
				scalemod = 50.0
				player = 1
			}
		]
	}
	{
		type = circle
		pos = (0.499, 0.7, 0.0)
		radius = 0.0
		color = [
			255
			255
			255
			255
		]
		blendmode = brighten
		thickness = 2.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = notehit
				response = radiusscale
				scalemod = 0.05
				player = 1
				fade = 1.0
			}
			{
				type = waveform
				response = deform
				scalemod = 50.0
				player = 1
			}
		]
	}
	{
		type = hypotrochoid
		pos = (0.499, 0.5, 0.0)
		scale = (0.5, 0.5)
		length = 0.15
		innerradius = 0.15
		outerradius = 0.35000002
		color = [
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
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				player = 2
				fade = 1.0
			}
			{
				type = notehit
				response = scalexy
				scalemod = 0.1
				player = 2
				fade = 1.0
			}
		]
	}
	{
		type = hypotrochoid
		pos = (0.499, 0.5, 0.0)
		scale = (0.5, 0.5)
		length = 0.15
		innerradius = 0.15
		outerradius = 0.35000002
		color = [
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
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				player = 2
				fade = 1.0
			}
			{
				type = notehit
				response = scalexy
				scalemod = 0.1
				player = 2
				fade = 1.0
			}
		]
	}
]
