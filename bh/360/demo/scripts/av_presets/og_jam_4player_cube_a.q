og_jam_4player_cube_a = [
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (1.01, 1.01)
		color = [
			250
			251
			255
			252
		]
		angle = 0.0
		angularvel = 0
		blendmode = add
		controls = [
			{
				type = notehit
				response = alphamodulation
				scalemod = 0.1
				player = 1
				fade = 1.0
			}
			{
				type = notehit
				response = alphamodulation
				scalemod = 0.1
				player = 2
				fade = 1.0
			}
			{
				type = notehit
				response = alphamodulation
				scalemod = 0.1
				player = 3
				fade = 1.0
			}
			{
				type = notehit
				response = alphamodulation
				scalemod = 0.1
				player = 4
				fade = 1.0
			}
		]
	}
	{
		type = sprite
		pos = (0.5, 0.4)
		scale = (1.0, 1.0)
		width = 0.1
		height = 0.1
		color = [
			255
			225
			97
			132
		]
		material = og_mat_sphere_add
		angle = 0
		angularvel = 1.7453301
		controls = [
		]
	}
	{
		type = sprite
		pos = (0.5, 0.4)
		scale = (1.0, 1.0)
		width = 0.1
		height = 0.1
		color = [
			244
			237
			237
			166
		]
		material = og_mat_sphere_b_sub
		angle = 0
		angularvel = -0.872665
		controls = [
		]
	}
	{
		type = nstar2
		pos = (0.5, 0.4, 0.0)
		npoints = 5
		radius = 0.0
		radius2 = 0.5
		color = [
			68
			68
			68
			22
		]
		blendmode = subtract
		thickness = 3.0
		angle = 0
		angularvel = 174.533
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
		type = nstar2
		pos = (0.5, 0.4, 0.0)
		npoints = 5
		radius = 0.1
		radius2 = 0.5
		color = [
			30
			19
			55
			255
		]
		blendmode = brighten
		thickness = 3.0
		angle = 0
		angularvel = 0.872665
		controls = [
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
		radius = 0.15
		radius2 = 0.1
		color = [
			204
			186
			102
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
				scalemod = 0.15
				responsefunc = sintime
			}
			{
				type = constant
				response = radius2scale
				scalemod = 0.1
				responsefunc = sintime
			}
			{
				type = constant
				response = huemodulation
				scalemod = 0.1
				responsefunc = sintime
				timeoffset = 3.1415896
			}
		]
	}
	{
		type = nstar2
		pos = (0.5, 0.4, 0.0)
		npoints = 3
		radius = 0.15
		radius2 = 0.1
		color = [
			64
			102
			255
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
				scalemod = 0.15
				responsefunc = sintime
			}
			{
				type = constant
				response = radius2scale
				scalemod = 0.1
				responsefunc = sintime
				timeoffset = 3.1415896
			}
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
		width = 0.1
		height = 0.1
		color = [
			255
			201
			187
			102
		]
		material = og_mat_sphere_b_add
		angle = 0
		angularvel = -1.7453301
		controls = [
		]
	}
]
