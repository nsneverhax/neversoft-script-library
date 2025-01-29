og_jam_4player_cube_b = [
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (1.01, 1.01)
		Color = [
			252
			250
			255
			252
		]
		BlendMode = add
		controls = [
			{
				Type = constant
				response = huemodulation
				scalemod = 0.1
				responsefunc = sintime
			}
		]
	}
	{
		Type = sprite
		Pos = (0.5, 0.4)
		width = 0.2
		height = 0.2
		Color = [
			255
			166
			119
			133
		]
		material = og_mat_flare_blend
		angularvel = 1.7453301
	}
	{
		Type = sprite
		Pos = (0.5, 0.4)
		width = 0.5
		height = 0.5
		Color = [
			255
			205
			128
			3
		]
		material = og_mat_lenzflare_add
		angularvel = 0.872665
		controls = [
			{
				Type = beaton
				response = alphamodulation
				scalemod = 0.065
				fade = 0.1
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.4, 0.0)
		radius = 0.01
		Color = [
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
				Type = notehit
				response = brightnessmodulation
				scalemod = 1.0
				Player = 1
				fade = 0.25
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = 0.6
				Player = 1
				gemcolor = blue
				fade = 1.0
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = 0.345
				Player = 1
				gemcolor = green
				fade = 1.0
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = 0.143
				Player = 1
				gemcolor = yellow
				fade = 1.0
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = 0.08
				Player = 1
				gemcolor = orange
				fade = 1.0
			}
			{
				Type = waveform
				response = deform
				scalemod = 500.0
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.4, 0.0)
		radius = 0.01
		Color = [
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
				Type = notehit
				response = brightnessmodulation
				scalemod = 0.1
				Player = 2
				fade = 0.25
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = 0.6
				Player = 2
				gemcolor = blue
				fade = 1.0
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = 0.345
				Player = 2
				gemcolor = green
				fade = 1.0
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = 0.143
				Player = 2
				gemcolor = yellow
				fade = 1.0
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = 0.08
				Player = 2
				gemcolor = orange
				fade = 1.0
			}
			{
				Type = waveform
				response = deform
				scalemod = 500.0
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.4, 0.0)
		radius = 0.01
		Color = [
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
				Type = notehit
				response = brightnessmodulation
				scalemod = 1.0
				Player = 3
				fade = 0.25
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = 0.6
				Player = 3
				gemcolor = blue
				fade = 1.0
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = 0.345
				Player = 3
				gemcolor = green
				fade = 1.0
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = 0.143
				Player = 3
				gemcolor = yellow
				fade = 1.0
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = 0.08
				Player = 3
				gemcolor = orange
				fade = 1.0
			}
			{
				Type = waveform
				response = deform
				scalemod = 500.0
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.4, 0.0)
		radius = 0.1
		Color = [
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
				Type = notehit
				response = brightnessmodulation
				scalemod = 1.0
				Player = 4
				fade = 0.25
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = 0.6
				Player = 4
				gemcolor = blue
				fade = 1.0
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = 0.345
				Player = 4
				gemcolor = green
				fade = 1.0
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = 0.143
				Player = 4
				gemcolor = yellow
				fade = 1.0
			}
			{
				Type = notehit
				response = huemodulation
				scalemod = 0.08
				Player = 4
				gemcolor = orange
				fade = 1.0
			}
			{
				Type = waveform
				response = deform
				scalemod = 500.0
			}
		]
	}
	{
		Type = nstar2
		Pos = (0.5, 0.4, 0.0)
		npoints = 3
		radius = 0.2
		radius2 = 0.0
		Color = [
			101
			100
			74
			255
		]
		material = og_mat_flare_blend
		thickness = 3.0
		angularvel = 0.17453298
		controls = [
			{
				Type = constant
				response = radiusscale
				scalemod = 0.1
				responsefunc = sintime
				timerate = 0.5
			}
		]
	}
	{
		Type = nstar2
		Pos = (0.5, 0.4, 0.0)
		npoints = 3
		radius = 0.2
		radius2 = 0.0
		Color = [
			95
			102
			103
			255
		]
		angularvel = 0.17453298
		controls = [
			{
				Type = constant
				response = radiusscale
				scalemod = 0.1
				responsefunc = sintime
				timerate = 0.5
			}
		]
	}
	{
		Type = nstar2
		Pos = (0.5, 0.4, 0.0)
		npoints = 3
		radius = 0.2
		radius2 = 0.13
		Color = [
			63
			60
			77
			255
		]
		angularvel = 0.17453298
		controls = [
			{
				Type = constant
				response = radiusscale
				scalemod = 0.1
				responsefunc = sintime
				timerate = 0.5
			}
			{
				Type = constant
				response = radius2scale
				scalemod = 0.05
				responsefunc = sintime
				timerate = 0.5
			}
		]
	}
	{
		Type = nstar2
		Pos = (0.5, 0.4, 0.0)
		npoints = 3
		radius = 0.2
		radius2 = 0.13
		Color = [
			64
			73
			90
			255
		]
		material = og_mat_flare_blend
		thickness = 3.0
		angularvel = 0.17453298
		controls = [
			{
				Type = constant
				response = radiusscale
				scalemod = 0.1
				responsefunc = sintime
				timerate = 0.5
			}
			{
				Type = constant
				response = radius2scale
				scalemod = 0.05
				responsefunc = sintime
				timerate = 0.5
			}
		]
	}
]
