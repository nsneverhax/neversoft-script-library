jow_musicstudio_ghmix_a = [
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (1.1, 1.0)
		Color = [
			255
			255
			255
			254
		]
		angle = 0
		angularvel = 0
		BlendMode = blend
		nonuniformscale
	}
	{
		Type = line
		Pos = (0.05, 0.5, 0.0)
		length = 1.0
		Color = [
			174
			164
			131
			29
		]
		BlendMode = blend
		thickness = 7.0
		angle = 1.5708001
		angularvel = 0
		controls = [
			{
				Type = constant
				response = offsetx
				scalemod = 0.04
				responsefunc = sintime
				timerate = 0.523599
			}
			{
				Type = constant
				response = offsety
				scalemod = 0.04
				responsefunc = sintime
				timerate = 0.523599
			}
		]
	}
	{
		Type = line
		Pos = (0.95, 0.5, 0.0)
		length = 1.0
		Color = [
			174
			164
			131
			29
		]
		BlendMode = blend
		thickness = 7.0
		angle = 1.5708001
		angularvel = 0
		controls = [
			{
				Type = constant
				response = offsetx
				scalemod = 0.04
				responsefunc = sintime
				timerate = 0.523599
			}
			{
				Type = constant
				response = offsety
				scalemod = 0.04
				responsefunc = sintime
				timerate = 0.523599
			}
		]
	}
	{
		Type = nstar2
		Pos = (0.3, 0.3, 0.0)
		npoints = 19
		radius = 0.15
		radius2 = 1.5
		Color = [
			0
			255
			255
			255
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 0.0698132
		controls = [
			{
				Type = constant
				response = alphamodulation
				scalemod = 0.25
				responsefunc = sintime
				timerate = 0.872665
			}
			{
				Type = constant
				response = huemodulation
				scalemod = 0.1
				responsefunc = sintime
				timerate = 0.872665
			}
			{
				Type = constant
				response = huemodulation
				scalemod = 0.5
				responsefunc = sintime
				timerate = 1.5708001
			}
		]
	}
	{
		Type = nstar2
		Pos = (0.7, 0.7, 0.0)
		npoints = 7
		radius = 0.15
		radius2 = 1.5
		Color = [
			87
			117
			117
			124
		]
		BlendMode = blend
		thickness = 1.0
		angle = 0
		angularvel = 0.0698132
		controls = [
			{
				Type = constant
				response = alphamodulation
				scalemod = 0.25
				responsefunc = sintime
				timerate = 0.872665
			}
			{
				Type = constant
				response = huemodulation
				scalemod = 0.1
				responsefunc = sintime
				timerate = 0.872665
			}
		]
	}
]
