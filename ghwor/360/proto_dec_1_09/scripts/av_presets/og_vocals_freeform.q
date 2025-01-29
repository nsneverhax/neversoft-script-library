og_vocals_freeform = [
	{
		Type = blendprev
		offset = (0.01, 0.0)
		Scale = (0.95, 1.1)
		Color = [
			243
			250
			243
			243
		]
		angle = 0.0
		angularvel = 0
		BlendMode = add
	}
	{
		Type = hypotrochoid
		Pos = (0.31, 0.5, 0.0)
		Scale = (0.1, 0.1)
		length = 0.05
		InnerRadius = 0.25
		outerradius = 0.05
		Color = [
			44
			44
			44
			51
		]
		material = og_mat_sphere_add
		thickness = 500.0
		angularvel = -1.9198599
	}
	{
		Type = hypotrochoid
		Pos = (0.31, 0.5, 0.0)
		Scale = (0.5, 0.3)
		length = 0.05
		InnerRadius = 0.25
		outerradius = 0.05
		Color = [
			31
			31
			31
			51
		]
		material = og_mat_flare_add
		thickness = 200.0
		angularvel = 0.523599
	}
	{
		Type = sprite
		Pos = (0.31, 0.5)
		Scale = (1.0, 1.0)
		width = 0.5
		height = 0.5
		Color = [
			13
			13
			13
			255
		]
		material = og_mat_flare_add
		angle = 0
		angularvel = 0.523599
	}
	{
		Type = line
		Pos = (0.32000002, 0.5, 0.0)
		length = 0.0
		Color = [
			127
			108
			31
			0
		]
		BlendMode = brighten
		thickness = 1.5
		angle = 1.5708001
		angularvel = 0
		controls = [
			{
				Type = vocalsamplitude
				response = lengthscale
				scalemod = 2.0
				Player = 1
			}
			{
				Type = vocalsactive
				response = alphamodulation
				scalemod = 1.0
				Player = 1
			}
		]
	}
	{
		Type = line
		Pos = (0.3, 0.5, 0.0)
		length = 0.0
		Color = [
			127
			108
			31
			0
		]
		BlendMode = brighten
		thickness = 1.5
		angle = 1.5708001
		angularvel = 0
		controls = [
			{
				Type = vocalsamplitude
				response = lengthscale
				scalemod = 2.0
				Player = 1
			}
			{
				Type = vocalsactive
				response = alphamodulation
				scalemod = 1.0
				Player = 1
			}
		]
	}
	{
		Type = line
		Pos = (0.3, 0.5, 0.0)
		length = 0.0
		Color = [
			116
			96
			14
			0
		]
		BlendMode = brighten
		thickness = 1.5
		angle = 1.5708001
		angularvel = 0
		controls = [
			{
				Type = vocalsamplitude
				response = lengthscale
				scalemod = 2.0
				Player = 2
			}
			{
				Type = vocalsactive
				response = alphamodulation
				scalemod = 1.0
				Player = 2
			}
		]
	}
	{
		Type = line
		Pos = (0.32000002, 0.5, 0.0)
		length = 0.0
		Color = [
			116
			96
			14
			0
		]
		BlendMode = brighten
		thickness = 1.5
		angle = 1.5708001
		angularvel = 0
		controls = [
			{
				Type = vocalsamplitude
				response = lengthscale
				scalemod = 2.0
				Player = 2
			}
			{
				Type = vocalsactive
				response = alphamodulation
				scalemod = 1.0
				Player = 2
			}
		]
	}
	{
		Type = line
		Pos = (0.3, 0.5, 0.0)
		length = 0.0
		Color = [
			42
			108
			31
			0
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 1.5708001
		angularvel = 0
		controls = [
			{
				Type = vocalsamplitude
				response = lengthscale
				scalemod = 2.0
				Player = 3
			}
			{
				Type = vocalsactive
				response = alphamodulation
				scalemod = 1.0
				Player = 3
			}
		]
	}
	{
		Type = line
		Pos = (0.32000002, 0.5, 0.0)
		length = 0.0
		Color = [
			42
			108
			31
			0
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 1.5708001
		angularvel = 0
		controls = [
			{
				Type = vocalsamplitude
				response = lengthscale
				scalemod = 2.0
				Player = 3
			}
			{
				Type = vocalsactive
				response = alphamodulation
				scalemod = 1.0
				Player = 3
			}
		]
	}
	{
		Type = line
		Pos = (0.3, 0.5, 0.0)
		length = 0.0
		Color = [
			42
			108
			31
			0
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 1.5708001
		angularvel = 0
		controls = [
			{
				Type = vocalsamplitude
				response = lengthscale
				scalemod = 2.0
				Player = 4
			}
			{
				Type = vocalsactive
				response = alphamodulation
				scalemod = 1.0
				Player = 4
			}
		]
	}
	{
		Type = line
		Pos = (0.32000002, 0.5, 0.0)
		length = 0.0
		Color = [
			42
			108
			31
			0
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 1.5708001
		angularvel = 0
		controls = [
			{
				Type = vocalsamplitude
				response = lengthscale
				scalemod = 2.0
				Player = 4
			}
			{
				Type = vocalsactive
				response = alphamodulation
				scalemod = 1.0
				Player = 4
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.0
		Color = [
			255
			133
			58
			255
		]
		BlendMode = brighten
		thickness = 2.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = History
				historytype = vocalspitch
				response = deform
				scalemod = 100.0
				responsefunc = sintime
				timerate = 3.4906602
				Player = 1
			}
			{
				Type = vocalsnoteon
				response = alphamodulation
				scalemod = -1.0
				Player = 1
			}
			{
				Type = vocalsactive
				response = lengthscale
				scalemod = 1.0
				Player = 1
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.0
		Color = [
			255
			133
			58
			255
		]
		BlendMode = brighten
		thickness = 2.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = vocalsnoteon
				response = alphamodulation
				scalemod = -1.0
				Player = 2
			}
			{
				Type = History
				historytype = vocalspitch
				response = deform
				scalemod = 100.0
				responsefunc = sintime
				timerate = 3.4906602
				Player = 2
			}
			{
				Type = vocalsactive
				response = lengthscale
				scalemod = 1.0
				Player = 2
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.0
		Color = [
			255
			133
			58
			255
		]
		BlendMode = brighten
		thickness = 2.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = vocalsnoteon
				response = alphamodulation
				scalemod = -1.0
				Player = 3
			}
			{
				Type = vocalsactive
				response = lengthscale
				scalemod = 1.0
				Player = 3
			}
			{
				Type = History
				historytype = vocalspitch
				response = deform
				scalemod = 100.0
				responsefunc = sintime
				timerate = 3.4906602
				Player = 3
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.0
		Color = [
			255
			133
			58
			255
		]
		BlendMode = brighten
		thickness = 2.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = vocalsnoteon
				response = alphamodulation
				scalemod = -1.0
				Player = 4
			}
			{
				Type = vocalsactive
				response = lengthscale
				scalemod = 1.0
				Player = 4
			}
			{
				Type = History
				historytype = vocalspitch
				response = deform
				scalemod = 100.0
				responsefunc = sintime
				timerate = 3.4906602
				Player = 4
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.0
		Color = [
			58
			255
			255
			0
		]
		BlendMode = add
		thickness = 3.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = History
				historytype = vocalspitch
				response = deform
				scalemod = 100.0
				responsefunc = sintime
				timerate = 3.4906602
				Player = 1
			}
			{
				Type = vocalsnoteon
				response = alphamodulation
				scalemod = 1.0
				Player = 1
			}
			{
				Type = constant
				response = huemodulation
				scalemod = 0.5
				responsefunc = sintime
			}
			{
				Type = vocalsactive
				response = lengthscale
				scalemod = 1.0
				Player = 1
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.0
		Color = [
			58
			255
			255
			0
		]
		BlendMode = add
		thickness = 3.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = constant
				response = huemodulation
				scalemod = 0.5
				responsefunc = sintime
			}
			{
				Type = vocalsnoteon
				response = alphamodulation
				scalemod = 1.0
				Player = 2
			}
			{
				Type = History
				historytype = vocalspitch
				response = deform
				scalemod = 100.0
				responsefunc = sintime
				timerate = 3.4906602
				Player = 2
			}
			{
				Type = vocalsactive
				response = lengthscale
				scalemod = 1.0
				Player = 2
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.0
		Color = [
			58
			255
			255
			0
		]
		BlendMode = add
		thickness = 3.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = constant
				response = huemodulation
				scalemod = 0.5
				responsefunc = sintime
			}
			{
				Type = vocalsnoteon
				response = alphamodulation
				scalemod = 1.0
				Player = 3
			}
			{
				Type = vocalsactive
				response = lengthscale
				scalemod = 1.0
				Player = 3
			}
			{
				Type = History
				historytype = vocalspitch
				response = deform
				scalemod = 100.0
				responsefunc = sintime
				timerate = 3.4906602
				Player = 3
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		length = 1.0
		Color = [
			52
			49
			255
			255
		]
		BlendMode = brighten
		thickness = 2.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 100.0
				spectrumband = 10
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.0
		Color = [
			58
			255
			255
			0
		]
		BlendMode = add
		thickness = 3.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = constant
				response = huemodulation
				scalemod = 0.5
				responsefunc = sintime
			}
			{
				Type = vocalsnoteon
				response = alphamodulation
				scalemod = 1.0
				Player = 4
			}
			{
				Type = vocalsactive
				response = lengthscale
				scalemod = 1.0
				Player = 4
			}
			{
				Type = History
				historytype = vocalspitch
				response = deform
				scalemod = 100.0
				responsefunc = sintime
				timerate = 3.4906602
				Player = 4
			}
		]
	}
]
