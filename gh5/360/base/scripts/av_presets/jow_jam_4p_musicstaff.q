jow_jam_4p_musicstaff = [
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (0.98999995, 0.98999995)
		Color = [
			224
			190
			153
			255
		]
		angle = 0
		angularvel = 0
		BlendMode = blend
	}
	{
		Type = sprite
		Pos = (0.7, 0.3)
		Scale = (1.0, 1.0)
		width = 0.6
		height = 1.2
		Color = [
			5
			24
			51
			51
		]
		material = jow_mat_treblecleff01_add
		angle = 0.0
		angularvel = 0
		controls = [
			{
				Type = notehit
				response = brightnessmodulation
				scalemod = 0.1
				Player = 4
				fade = 0.5
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.45000002, 0.0)
		length = 1.0
		Color = [
			51
			51
			51
			255
		]
		BlendMode = blend
		thickness = 2.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 60.0
				spectrumband = 0
			}
			{
				Type = notehit
				response = redmodulation
				scalemod = 0.7
				Player = 1
				gemcolor = red
				fade = 0.5
			}
		]
	}
	{
		Type = sprite
		Pos = (0.25, 0.8)
		Scale = (1.0, 1.0)
		width = 0.6
		height = 1.2
		Color = [
			5
			24
			51
			51
		]
		material = jow_mat_treblecleff01_add
		angle = -0.523599
		angularvel = 0
		controls = [
			{
				Type = notehit
				response = brightnessmodulation
				scalemod = 0.1
				Player = 4
				fade = 0.5
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.25, 0.0)
		length = 1.0
		Color = [
			51
			51
			51
			255
		]
		BlendMode = blend
		thickness = 2.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 60.0
				spectrumband = 0
			}
			{
				Type = notehit
				response = redmodulation
				scalemod = 0.7
				Player = 1
				gemcolor = yellow
				fade = 0.5
			}
			{
				Type = notehit
				response = greenmodulation
				scalemod = 0.7
				Player = 1
				gemcolor = yellow
				fade = 0.5
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.35000002, 0.0)
		length = 1.0
		Color = [
			51
			51
			51
			255
		]
		BlendMode = blend
		thickness = 2.0
		angle = 0.0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 60.0
				spectrumband = 0
			}
			{
				Type = notehit
				response = greenmodulation
				scalemod = 0.7
				Player = 1
				gemcolor = green
				fade = 0.5
			}
			{
				Type = notehit
				response = redmodulation
				scalemod = 0.25
				Player = 1
				gemcolor = green
				fade = 0.5
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.4, 0.0)
		length = 1.0
		Color = [
			51
			51
			51
			255
		]
		BlendMode = blend
		thickness = 2.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 60.0
				spectrumband = 0
			}
			{
				Type = notehit
				response = bluemodulation
				scalemod = 0.7
				Player = 1
				gemcolor = blue
				fade = 0.5
			}
			{
				Type = notehit
				response = greenmodulation
				scalemod = 0.35000002
				Player = 1
				gemcolor = blue
				fade = 0.5
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.3, 0.0)
		length = 1.0
		Color = [
			51
			51
			51
			255
		]
		BlendMode = blend
		thickness = 2.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 60.0
				spectrumband = 0
			}
			{
				Type = notehit
				response = redmodulation
				scalemod = 0.7
				Player = 1
				gemcolor = orange
				fade = 0.5
			}
			{
				Type = notehit
				response = greenmodulation
				scalemod = 0.35000002
				Player = 1
				gemcolor = orange
				fade = 0.5
			}
		]
	}
	{
		Type = sprite
		Pos = (0.6, 0.35000002)
		Scale = (1.0, 1.0)
		width = 0.06
		height = 0.120000005
		Color = [
			0
			0
			0
			255
		]
		material = jow_mat_musicnote01_brighten
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = notehit
				response = brightnessmodulation
				scalemod = 0.6
				Player = 2
				fade = 0.2
			}
			{
				Type = constant
				response = offsetx
				scalemod = 0.25
				responsefunc = sintime
				timeoffset = 0.00061086507
				timerate = 0.69813204
			}
			{
				Type = constant
				response = offsety
				scalemod = 0.1
				responsefunc = costime
				timeoffset = 0.0296706
				timerate = 1.2217301
			}
		]
	}
	{
		Type = sprite
		Pos = (0.6, 0.35000002)
		Scale = (1.0, 1.0)
		width = 0.06
		height = 0.120000005
		Color = [
			0
			0
			0
			255
		]
		material = jow_mat_musicnote01_brighten
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = notehit
				response = brightnessmodulation
				scalemod = 0.6
				Player = 2
				fade = 0.2
			}
			{
				Type = constant
				response = offsetx
				scalemod = 0.25
				responsefunc = sintime
				timeoffset = 0.00820305
				timerate = 0.837758
			}
			{
				Type = constant
				response = offsety
				scalemod = 0.1
				responsefunc = costime
				timeoffset = 0.019198598
				timerate = 1.0472
			}
		]
	}
	{
		Type = nstar2
		Pos = (0.5, 0.3, 0.0)
		npoints = 5
		radius = 0.120000005
		radius2 = 0.138
		Color = [
			0
			0
			0
			255
		]
		BlendMode = brighten
		thickness = 3.0
		angle = 0.0
		angularvel = 0.2
		controls = [
			{
				Type = frequency
				response = radius2scale
				scalemod = 0.2
				spectrumband = 0
			}
			{
				Type = notehit
				response = brightnessmodulation
				scalemod = 1.0
				Player = 3
				fade = 0.2
			}
		]
	}
	{
		Type = nstar2
		Pos = (0.29299998, 0.515, 0.0)
		npoints = 5
		radius = 0.120000005
		radius2 = 0.138
		Color = [
			0
			0
			0
			255
		]
		BlendMode = brighten
		thickness = 3.0
		angle = 0
		angularvel = -0.4
		controls = [
			{
				Type = frequency
				response = radius2scale
				scalemod = 0.2
				spectrumband = 0
			}
			{
				Type = notehit
				response = brightnessmodulation
				scalemod = 1.0
				Player = 3
				fade = 0.2
			}
		]
	}
	{
		Type = sprite
		Pos = (0.15, 0.35000002)
		Scale = (1.0, 1.0)
		width = 0.1
		height = 0.3
		Color = [
			95
			99
			102
			45
		]
		material = jow_mat_treblecleff01_blend
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = constant
				response = offsetx
				scalemod = 0.03
				responsefunc = sintime
				timerate = 0.78539795
			}
			{
				Type = constant
				response = offsety
				scalemod = 0.02
				responsefunc = costime
				timerate = 0.78539795
			}
			{
				Type = constant
				response = scalexy
				scalemod = 0.1
				responsefunc = costime
				timerate = 0.523599
			}
			{
				Type = constant
				response = brightnessmodulation
				scalemod = 0.2
				responsefunc = costime
				timerate = 0.523599
			}
			{
				Type = notehit
				response = brightnessmodulation
				scalemod = 0.2
				Player = 4
				fade = 0.5
			}
			{
				Type = notehit
				response = alphamodulation
				scalemod = 0.5
				Player = 4
				fade = 0.5
			}
		]
	}
	{
		Type = nstar2
		Pos = (0.707, 0.515, 0.0)
		npoints = 5
		radius = 0.120000005
		radius2 = 0.138
		Color = [
			0
			0
			0
			255
		]
		BlendMode = brighten
		thickness = 3.0
		angle = 0
		angularvel = -0.4
		controls = [
			{
				Type = frequency
				response = radius2scale
				scalemod = 0.2
				spectrumband = 0
			}
			{
				Type = notehit
				response = brightnessmodulation
				scalemod = 1.0
				Player = 3
				fade = 0.2
			}
		]
	}
	{
		Type = nstar2
		Pos = (0.085999995, 0.3, 0.0)
		npoints = 5
		radius = 0.120000005
		radius2 = 0.138
		Color = [
			0
			0
			0
			255
		]
		BlendMode = brighten
		thickness = 3.0
		angle = 0.0
		angularvel = 0.2
		controls = [
			{
				Type = frequency
				response = radius2scale
				scalemod = 0.2
				spectrumband = 0
			}
			{
				Type = notehit
				response = brightnessmodulation
				scalemod = 1.0
				Player = 3
				fade = 0.2
			}
		]
	}
	{
		Type = nstar2
		Pos = (0.914, 0.3, 0.0)
		npoints = 5
		radius = 0.120000005
		radius2 = 0.138
		Color = [
			0
			0
			0
			255
		]
		BlendMode = brighten
		thickness = 3.0
		angle = 0.0
		angularvel = 0.2
		controls = [
			{
				Type = frequency
				response = radius2scale
				scalemod = 0.2
				spectrumband = 0
			}
			{
				Type = notehit
				response = brightnessmodulation
				scalemod = 1.0
				Player = 3
				fade = 0.2
			}
		]
	}
	{
		Type = sprite
		Pos = (0.6, 0.35000002)
		Scale = (1.0, 1.0)
		width = 0.06
		height = 0.120000005
		Color = [
			0
			0
			0
			255
		]
		material = jow_mat_musicnote01_brighten
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = notehit
				response = brightnessmodulation
				scalemod = 0.6
				Player = 1
				fade = 0.2
			}
			{
				Type = constant
				response = offsetx
				scalemod = 0.25
				responsefunc = sintime
				timerate = 0.78539795
			}
			{
				Type = constant
				response = offsety
				scalemod = 0.1
				responsefunc = costime
				timerate = 1.1344599
			}
		]
	}
]
