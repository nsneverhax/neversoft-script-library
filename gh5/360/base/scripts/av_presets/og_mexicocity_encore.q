og_mexicocity_encore = [
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (0.95, 0.95)
		Color = [
			222
			222
			222
			249
		]
		angle = 0
		angularvel = 0
		BlendMode = add
		controls = [
			{
				Type = frequency
				response = redmodulation
				scalemod = 0.5
				spectrumband = 17
			}
			{
				Type = frequency
				response = greenmodulation
				scalemod = 0.25
				spectrumband = 20
			}
			{
				Type = frequency
				response = bluemodulation
				scalemod = 0.5
				spectrumband = 7
			}
		]
	}
	{
		Type = nstar2
		Pos = (0.51, 0.45000002, 0.0)
		npoints = 4
		radius = 0.0
		radius2 = 2.0
		Color = [
			31
			31
			31
			84
		]
		BlendMode = subtract
		thickness = 5.0
		angle = 0
		angularvel = 1.9198599
		controls = [
			{
				Type = gamepaused
				response = alphamodulation
				scalemod = -1.0
				fade = 1.0
			}
		]
	}
	{
		Type = nstar2
		Pos = (0.51, 0.45000002, 0.0)
		npoints = 4
		radius = 0.0
		radius2 = 2.0
		Color = [
			31
			31
			31
			84
		]
		BlendMode = subtract
		thickness = 5.0
		angle = 0
		angularvel = -1.65806
		controls = [
			{
				Type = gamepaused
				response = alphamodulation
				scalemod = -1.0
				fade = 1.0
			}
		]
	}
	{
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		Scale = (1.0, 1.0)
		width = 0.5
		height = 0.5
		Color = [
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
				Type = frequency
				response = redmodulation
				scalemod = 0.2
				spectrumband = 10
			}
			{
				Type = frequency
				response = greenmodulation
				scalemod = 0.2
				spectrumband = 15
			}
			{
				Type = frequency
				response = bluemodulation
				scalemod = 0.1
				spectrumband = 5
			}
			{
				Type = constant
				response = offsety
				scalemod = 0.05
				responsefunc = sintime
				timerate = 2.0944
			}
			{
				Type = constant
				response = offsetx
				scalemod = 0.1
				responsefunc = costime
				timerate = 1.0472
			}
		]
	}
	{
		Type = nstar2
		Pos = (0.51, 0.45000002, 0.0)
		npoints = 4
		radius = 0.04
		radius2 = 2.0
		Color = [
			31
			31
			31
			255
		]
		BlendMode = brighten
		thickness = 10.0
		angle = 0
		angularvel = 1.7453301
		controls = [
			{
				Type = gamepaused
				response = alphamodulation
				scalemod = -1.0
				fade = 1.0
			}
			{
				Type = constant
				response = offsetx
				scalemod = 0.1
				responsefunc = costime
				timerate = 1.0472
			}
			{
				Type = constant
				response = offsety
				scalemod = 0.05
				responsefunc = sintime
				timerate = 2.0944
			}
		]
	}
	{
		Type = nstar2
		Pos = (0.51, 0.45000002, 0.0)
		npoints = 4
		radius = 0.04
		radius2 = 2.0
		Color = [
			31
			31
			31
			255
		]
		BlendMode = brighten
		thickness = 10.0
		angle = 0
		angularvel = -1.5708001
		controls = [
			{
				Type = gamepaused
				response = alphamodulation
				scalemod = -1.0
				fade = 1.0
			}
			{
				Type = constant
				response = offsety
				scalemod = 0.05
				responsefunc = sintime
				timerate = 2.0944
			}
			{
				Type = constant
				response = offsetx
				scalemod = 0.1
				responsefunc = costime
				timerate = 1.0472
			}
		]
	}
	{
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		Scale = (1.0, 1.0)
		width = 2.0
		height = 2.0
		Color = [
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
				Type = beaton
				response = alphamodulation
				scalemod = 0.1
				fade = 0.1
			}
		]
	}
]
