og_mexicocity_encore = [
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (0.95, 0.95)
		color = [
			222
			222
			222
			249
		]
		angle = 0
		angularvel = 0
		blendmode = add
		controls = [
			{
				type = frequency
				response = redmodulation
				scalemod = 0.5
				spectrumband = 17
			}
			{
				type = frequency
				response = greenmodulation
				scalemod = 0.25
				spectrumband = 20
			}
			{
				type = frequency
				response = bluemodulation
				scalemod = 0.5
				spectrumband = 7
			}
		]
	}
	{
		type = nstar2
		pos = (0.51, 0.45000002, 0.0)
		npoints = 4
		radius = 0.0
		radius2 = 2.0
		color = [
			31
			31
			31
			84
		]
		blendmode = subtract
		thickness = 5.0
		angle = 0
		angularvel = 1.9198599
		controls = [
			{
				type = gamepaused
				response = alphamodulation
				scalemod = -1.0
				fade = 1.0
			}
		]
	}
	{
		type = nstar2
		pos = (0.51, 0.45000002, 0.0)
		npoints = 4
		radius = 0.0
		radius2 = 2.0
		color = [
			31
			31
			31
			84
		]
		blendmode = subtract
		thickness = 5.0
		angle = 0
		angularvel = -1.65806
		controls = [
			{
				type = gamepaused
				response = alphamodulation
				scalemod = -1.0
				fade = 1.0
			}
		]
	}
	{
		type = sprite
		pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 0.5
		height = 0.5
		color = [
			110
			110
			143
			127
		]
		material = og_mat_mexicocity_skull
		angle = 0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = redmodulation
				scalemod = 0.2
				spectrumband = 10
			}
			{
				type = frequency
				response = greenmodulation
				scalemod = 0.2
				spectrumband = 15
			}
			{
				type = frequency
				response = bluemodulation
				scalemod = 0.1
				spectrumband = 5
			}
			{
				type = constant
				response = offsety
				scalemod = 0.05
				responsefunc = sintime
				timerate = 2.0944
			}
			{
				type = constant
				response = offsetx
				scalemod = 0.1
				responsefunc = costime
				timerate = 1.0472
			}
		]
	}
	{
		type = nstar2
		pos = (0.51, 0.45000002, 0.0)
		npoints = 4
		radius = 0.04
		radius2 = 2.0
		color = [
			31
			31
			31
			255
		]
		blendmode = brighten
		thickness = 10.0
		angle = 0
		angularvel = 1.7453301
		controls = [
			{
				type = gamepaused
				response = alphamodulation
				scalemod = -1.0
				fade = 1.0
			}
			{
				type = constant
				response = offsetx
				scalemod = 0.1
				responsefunc = costime
				timerate = 1.0472
			}
			{
				type = constant
				response = offsety
				scalemod = 0.05
				responsefunc = sintime
				timerate = 2.0944
			}
		]
	}
	{
		type = nstar2
		pos = (0.51, 0.45000002, 0.0)
		npoints = 4
		radius = 0.04
		radius2 = 2.0
		color = [
			31
			31
			31
			255
		]
		blendmode = brighten
		thickness = 10.0
		angle = 0
		angularvel = -1.5708001
		controls = [
			{
				type = gamepaused
				response = alphamodulation
				scalemod = -1.0
				fade = 1.0
			}
			{
				type = constant
				response = offsety
				scalemod = 0.05
				responsefunc = sintime
				timerate = 2.0944
			}
			{
				type = constant
				response = offsetx
				scalemod = 0.1
				responsefunc = costime
				timerate = 1.0472
			}
		]
	}
	{
		type = sprite
		pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 2.0
		height = 2.0
		color = [
			255
			255
			255
			0
		]
		material = og_mat_flare_add
		angle = 0
		angularvel = 0
		controls = [
			{
				type = beaton
				response = alphamodulation
				scalemod = 0.1
				fade = 0.1
			}
		]
	}
]
