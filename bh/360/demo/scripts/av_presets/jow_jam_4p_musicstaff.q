jow_jam_4p_musicstaff = [
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (0.98999995, 0.98999995)
		color = [
			224
			190
			153
			255
		]
		angle = 0
		angularvel = 0
		blendmode = blend
	}
	{
		type = sprite
		pos = (0.7, 0.3)
		scale = (1.0, 1.0)
		width = 0.6
		height = 1.2
		color = [
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
				type = notehit
				response = brightnessmodulation
				scalemod = 0.1
				player = 4
				fade = 0.5
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.45000002, 0.0)
		length = 1.0
		color = [
			51
			51
			51
			255
		]
		blendmode = blend
		thickness = 2.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 60.0
				spectrumband = 0
			}
			{
				type = notehit
				response = redmodulation
				scalemod = 0.7
				player = 1
				gemcolor = red
				fade = 0.5
			}
		]
	}
	{
		type = sprite
		pos = (0.25, 0.8)
		scale = (1.0, 1.0)
		width = 0.6
		height = 1.2
		color = [
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
				type = notehit
				response = brightnessmodulation
				scalemod = 0.1
				player = 4
				fade = 0.5
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.25, 0.0)
		length = 1.0
		color = [
			51
			51
			51
			255
		]
		blendmode = blend
		thickness = 2.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 60.0
				spectrumband = 0
			}
			{
				type = notehit
				response = redmodulation
				scalemod = 0.7
				player = 1
				gemcolor = yellow
				fade = 0.5
			}
			{
				type = notehit
				response = greenmodulation
				scalemod = 0.7
				player = 1
				gemcolor = yellow
				fade = 0.5
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.35000002, 0.0)
		length = 1.0
		color = [
			51
			51
			51
			255
		]
		blendmode = blend
		thickness = 2.0
		angle = 0.0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 60.0
				spectrumband = 0
			}
			{
				type = notehit
				response = greenmodulation
				scalemod = 0.7
				player = 1
				gemcolor = green
				fade = 0.5
			}
			{
				type = notehit
				response = redmodulation
				scalemod = 0.25
				player = 1
				gemcolor = green
				fade = 0.5
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.4, 0.0)
		length = 1.0
		color = [
			51
			51
			51
			255
		]
		blendmode = blend
		thickness = 2.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 60.0
				spectrumband = 0
			}
			{
				type = notehit
				response = bluemodulation
				scalemod = 0.7
				player = 1
				gemcolor = blue
				fade = 0.5
			}
			{
				type = notehit
				response = greenmodulation
				scalemod = 0.35000002
				player = 1
				gemcolor = blue
				fade = 0.5
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.3, 0.0)
		length = 1.0
		color = [
			51
			51
			51
			255
		]
		blendmode = blend
		thickness = 2.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 60.0
				spectrumband = 0
			}
			{
				type = notehit
				response = redmodulation
				scalemod = 0.7
				player = 1
				gemcolor = orange
				fade = 0.5
			}
			{
				type = notehit
				response = greenmodulation
				scalemod = 0.35000002
				player = 1
				gemcolor = orange
				fade = 0.5
			}
		]
	}
	{
		type = sprite
		pos = (0.6, 0.35000002)
		scale = (1.0, 1.0)
		width = 0.06
		height = 0.120000005
		color = [
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
				type = notehit
				response = brightnessmodulation
				scalemod = 0.6
				player = 2
				fade = 0.2
			}
			{
				type = constant
				response = offsetx
				scalemod = 0.25
				responsefunc = sintime
				timeoffset = 0.00061086507
				timerate = 0.69813204
			}
			{
				type = constant
				response = offsety
				scalemod = 0.1
				responsefunc = costime
				timeoffset = 0.0296706
				timerate = 1.2217301
			}
		]
	}
	{
		type = sprite
		pos = (0.6, 0.35000002)
		scale = (1.0, 1.0)
		width = 0.06
		height = 0.120000005
		color = [
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
				type = notehit
				response = brightnessmodulation
				scalemod = 0.6
				player = 2
				fade = 0.2
			}
			{
				type = constant
				response = offsetx
				scalemod = 0.25
				responsefunc = sintime
				timeoffset = 0.00820305
				timerate = 0.837758
			}
			{
				type = constant
				response = offsety
				scalemod = 0.1
				responsefunc = costime
				timeoffset = 0.019198598
				timerate = 1.0472
			}
		]
	}
	{
		type = nstar2
		pos = (0.5, 0.3, 0.0)
		npoints = 5
		radius = 0.120000005
		radius2 = 0.138
		color = [
			0
			0
			0
			255
		]
		blendmode = brighten
		thickness = 3.0
		angle = 0.0
		angularvel = 0.2
		controls = [
			{
				type = frequency
				response = radius2scale
				scalemod = 0.2
				spectrumband = 0
			}
			{
				type = notehit
				response = brightnessmodulation
				scalemod = 1.0
				player = 3
				fade = 0.2
			}
		]
	}
	{
		type = nstar2
		pos = (0.29299998, 0.515, 0.0)
		npoints = 5
		radius = 0.120000005
		radius2 = 0.138
		color = [
			0
			0
			0
			255
		]
		blendmode = brighten
		thickness = 3.0
		angle = 0
		angularvel = -0.4
		controls = [
			{
				type = frequency
				response = radius2scale
				scalemod = 0.2
				spectrumband = 0
			}
			{
				type = notehit
				response = brightnessmodulation
				scalemod = 1.0
				player = 3
				fade = 0.2
			}
		]
	}
	{
		type = sprite
		pos = (0.15, 0.35000002)
		scale = (1.0, 1.0)
		width = 0.1
		height = 0.3
		color = [
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
				type = constant
				response = offsetx
				scalemod = 0.03
				responsefunc = sintime
				timerate = 0.78539795
			}
			{
				type = constant
				response = offsety
				scalemod = 0.02
				responsefunc = costime
				timerate = 0.78539795
			}
			{
				type = constant
				response = scalexy
				scalemod = 0.1
				responsefunc = costime
				timerate = 0.523599
			}
			{
				type = constant
				response = brightnessmodulation
				scalemod = 0.2
				responsefunc = costime
				timerate = 0.523599
			}
			{
				type = notehit
				response = brightnessmodulation
				scalemod = 0.2
				player = 4
				fade = 0.5
			}
			{
				type = notehit
				response = alphamodulation
				scalemod = 0.5
				player = 4
				fade = 0.5
			}
		]
	}
	{
		type = nstar2
		pos = (0.707, 0.515, 0.0)
		npoints = 5
		radius = 0.120000005
		radius2 = 0.138
		color = [
			0
			0
			0
			255
		]
		blendmode = brighten
		thickness = 3.0
		angle = 0
		angularvel = -0.4
		controls = [
			{
				type = frequency
				response = radius2scale
				scalemod = 0.2
				spectrumband = 0
			}
			{
				type = notehit
				response = brightnessmodulation
				scalemod = 1.0
				player = 3
				fade = 0.2
			}
		]
	}
	{
		type = nstar2
		pos = (0.085999995, 0.3, 0.0)
		npoints = 5
		radius = 0.120000005
		radius2 = 0.138
		color = [
			0
			0
			0
			255
		]
		blendmode = brighten
		thickness = 3.0
		angle = 0.0
		angularvel = 0.2
		controls = [
			{
				type = frequency
				response = radius2scale
				scalemod = 0.2
				spectrumband = 0
			}
			{
				type = notehit
				response = brightnessmodulation
				scalemod = 1.0
				player = 3
				fade = 0.2
			}
		]
	}
	{
		type = nstar2
		pos = (0.914, 0.3, 0.0)
		npoints = 5
		radius = 0.120000005
		radius2 = 0.138
		color = [
			0
			0
			0
			255
		]
		blendmode = brighten
		thickness = 3.0
		angle = 0.0
		angularvel = 0.2
		controls = [
			{
				type = frequency
				response = radius2scale
				scalemod = 0.2
				spectrumband = 0
			}
			{
				type = notehit
				response = brightnessmodulation
				scalemod = 1.0
				player = 3
				fade = 0.2
			}
		]
	}
	{
		type = sprite
		pos = (0.6, 0.35000002)
		scale = (1.0, 1.0)
		width = 0.06
		height = 0.120000005
		color = [
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
				type = notehit
				response = brightnessmodulation
				scalemod = 0.6
				player = 1
				fade = 0.2
			}
			{
				type = constant
				response = offsetx
				scalemod = 0.25
				responsefunc = sintime
				timerate = 0.78539795
			}
			{
				type = constant
				response = offsety
				scalemod = 0.1
				responsefunc = costime
				timerate = 1.1344599
			}
		]
	}
]
