jow_cube_expansion_dark = [
	{
		type = blendprev
		offset = (0.0, 0.006)
		scale = (0.96999997, 0.95)
		color = [
			252
			250
			255
			252
		]
		angle = 0.0
		angularvel = 0
		blendmode = add
		controls = [
			{
				type = constant
				response = huemodulation
				scalemod = 0.1
				responsefunc = sintime
			}
		]
	}
	{
		type = sprite
		pos = (0.5, 0.4)
		scale = (1.0, 1.0)
		width = 0.2
		height = 0.2
		color = [
			255
			166
			119
			133
		]
		material = og_mat_flare_blend
		angle = 0
		angularvel = 1.7453301
		controls = [
		]
	}
	{
		type = sprite
		pos = (0.5, 0.4)
		scale = (1.0, 1.0)
		width = 0.5
		height = 0.5
		color = [
			255
			205
			128
			3
		]
		material = og_mat_lenzflare_add
		angle = 0
		angularvel = 0.872665
		controls = [
			{
				type = beaton
				response = alphamodulation
				scalemod = 0.065
				fade = 0.1
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.4, 0.0)
		radius = 0.01
		color = [
			13
			1
			0
			121
		]
		material = og_mat_sphere_add
		thickness = 3.0
		angle = 1.5708001
		angularvel = 3.0
		controls = [
			{
				type = notehit
				response = brightnessmodulation
				scalemod = 1.0
				player = 1
				fade = 0.25
			}
			{
				type = notehit
				response = huemodulation
				scalemod = 0.6
				player = 1
				gemcolor = blue
				fade = 1.0
			}
			{
				type = notehit
				response = huemodulation
				scalemod = 0.345
				player = 1
				gemcolor = green
				fade = 1.0
			}
			{
				type = notehit
				response = huemodulation
				scalemod = 0.143
				player = 1
				gemcolor = yellow
				fade = 1.0
			}
			{
				type = notehit
				response = huemodulation
				scalemod = 0.08
				player = 1
				gemcolor = orange
				fade = 1.0
			}
			{
				type = waveform
				response = deform
				scalemod = 500.0
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.4, 0.0)
		radius = 0.01
		color = [
			13
			1
			0
			121
		]
		material = og_mat_flare_brighten
		thickness = 3.0
		angle = 0.78539795
		angularvel = 3.0
		controls = [
			{
				type = notehit
				response = brightnessmodulation
				scalemod = 0.1
				player = 2
				fade = 0.25
			}
			{
				type = notehit
				response = huemodulation
				scalemod = 0.6
				player = 2
				gemcolor = blue
				fade = 1.0
			}
			{
				type = notehit
				response = huemodulation
				scalemod = 0.345
				player = 2
				gemcolor = green
				fade = 1.0
			}
			{
				type = notehit
				response = huemodulation
				scalemod = 0.143
				player = 2
				gemcolor = yellow
				fade = 1.0
			}
			{
				type = notehit
				response = huemodulation
				scalemod = 0.08
				player = 2
				gemcolor = orange
				fade = 1.0
			}
			{
				type = waveform
				response = deform
				scalemod = 500.0
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.4, 0.0)
		radius = 0.01
		color = [
			13
			1
			0
			121
		]
		material = og_mat_flare_add
		thickness = 3.0
		angle = -0.78539795
		angularvel = 3.0
		controls = [
			{
				type = notehit
				response = brightnessmodulation
				scalemod = 1.0
				player = 3
				fade = 0.25
			}
			{
				type = notehit
				response = huemodulation
				scalemod = 0.6
				player = 3
				gemcolor = blue
				fade = 1.0
			}
			{
				type = notehit
				response = huemodulation
				scalemod = 0.345
				player = 3
				gemcolor = green
				fade = 1.0
			}
			{
				type = notehit
				response = huemodulation
				scalemod = 0.143
				player = 3
				gemcolor = yellow
				fade = 1.0
			}
			{
				type = notehit
				response = huemodulation
				scalemod = 0.08
				player = 3
				gemcolor = orange
				fade = 1.0
			}
			{
				type = waveform
				response = deform
				scalemod = 500.0
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.4, 0.0)
		radius = 0.1
		color = [
			13
			1
			0
			121
		]
		material = og_mat_flare_add
		thickness = 3.0
		angle = -1.5708001
		angularvel = 3.0
		controls = [
			{
				type = notehit
				response = brightnessmodulation
				scalemod = 1.0
				player = 4
				fade = 0.25
			}
			{
				type = notehit
				response = huemodulation
				scalemod = 0.6
				player = 4
				gemcolor = blue
				fade = 1.0
			}
			{
				type = notehit
				response = huemodulation
				scalemod = 0.345
				player = 4
				gemcolor = green
				fade = 1.0
			}
			{
				type = notehit
				response = huemodulation
				scalemod = 0.143
				player = 4
				gemcolor = yellow
				fade = 1.0
			}
			{
				type = notehit
				response = huemodulation
				scalemod = 0.08
				player = 4
				gemcolor = orange
				fade = 1.0
			}
			{
				type = waveform
				response = deform
				scalemod = 500.0
			}
		]
	}
	{
		type = nstar2
		pos = (0.5, 0.4, 0.0)
		npoints = 3
		radius = 0.2
		radius2 = 0.0
		color = [
			101
			100
			74
			255
		]
		material = og_mat_flare_blend
		thickness = 3.0
		angle = 0
		angularvel = 0.17453298
		controls = [
			{
				type = constant
				response = radiusscale
				scalemod = 0.1
				responsefunc = sintime
				timerate = 0.5
			}
		]
	}
	{
		type = nstar2
		pos = (0.5, 0.4, 0.0)
		npoints = 3
		radius = 0.2
		radius2 = 0.0
		color = [
			95
			102
			103
			255
		]
		blendmode = blend
		thickness = 1.0
		angle = 0
		angularvel = 0.17453298
		controls = [
			{
				type = constant
				response = radiusscale
				scalemod = 0.1
				responsefunc = sintime
				timerate = 0.5
			}
		]
	}
	{
		type = nstar2
		pos = (0.5, 0.4, 0.0)
		npoints = 3
		radius = 0.2
		radius2 = 0.13
		color = [
			63
			60
			77
			255
		]
		blendmode = blend
		thickness = 1.0
		angle = 0
		angularvel = 0.17453298
		controls = [
			{
				type = constant
				response = radiusscale
				scalemod = 0.1
				responsefunc = sintime
				timerate = 0.5
			}
			{
				type = constant
				response = radius2scale
				scalemod = 0.05
				responsefunc = sintime
				timerate = 0.5
			}
		]
	}
	{
		type = nstar2
		pos = (0.5, 0.4, 0.0)
		npoints = 3
		radius = 0.2
		radius2 = 0.13
		color = [
			64
			73
			90
			255
		]
		material = og_mat_flare_blend
		thickness = 3.0
		angle = 0
		angularvel = 0.17453298
		controls = [
			{
				type = constant
				response = radiusscale
				scalemod = 0.1
				responsefunc = sintime
				timerate = 0.5
			}
			{
				type = constant
				response = radius2scale
				scalemod = 0.05
				responsefunc = sintime
				timerate = 0.5
			}
		]
	}
]
