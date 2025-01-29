jow_musicstudio_menu_b = [
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (1.1, 1.05)
		Color = [
			255
			255
			255
			254
		]
		angle = 0
		angularvel = 0.0
		BlendMode = blend
		controls = [
		]
	}
	{
		Type = line
		Pos = (0.5, 0.0, 0.0)
		length = 1.0
		Color = [
			38
			34
			23
			255
		]
		BlendMode = blend
		thickness = 6.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = constant
				response = huemodulation
				scalemod = 0.04
				responsefunc = sintime
				timerate = 0.17453298
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 1.0, 0.0)
		length = 1.0
		Color = [
			38
			34
			23
			255
		]
		BlendMode = blend
		thickness = 6.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = constant
				response = huemodulation
				scalemod = 0.04
				responsefunc = sintime
				timerate = 0.17453298
			}
		]
	}
	{
		Type = line
		Pos = (0.0, 0.0, 0.0)
		length = 2.0
		Color = [
			255
			255
			255
			255
		]
		BlendMode = brighten
		thickness = 0.5
		angle = 1.5708001
		angularvel = 0.3
		controls = [
		]
	}
	{
		Type = line
		Pos = (1.0, 0.0, 0.0)
		length = 2.0
		Color = [
			255
			255
			255
			255
		]
		BlendMode = brighten
		thickness = 0.5
		angle = 1.5708001
		angularvel = -0.3
		controls = [
		]
	}
	{
		Type = line
		Pos = (0.25, 0.5, 0.0)
		length = -0.5
		Color = [
			166
			196
			255
			255
		]
		BlendMode = blend
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 100.0
				spectrumband = 0
			}
		]
	}
	{
		Type = line
		Pos = (0.25, 0.5, 0.0)
		length = -0.5
		Color = [
			166
			196
			255
			255
		]
		BlendMode = blend
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = -100.0
				spectrumband = 0
			}
		]
	}
	{
		Type = line
		Pos = (0.75, 0.5, 0.0)
		length = 0.5
		Color = [
			166
			196
			255
			255
		]
		BlendMode = blend
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 100.0
				spectrumband = 0
			}
		]
	}
	{
		Type = line
		Pos = (0.75, 0.5, 0.0)
		length = 0.5
		Color = [
			166
			196
			255
			255
		]
		BlendMode = blend
		thickness = 1.0
		angle = 0.0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = -100.0
				spectrumband = 0
			}
		]
	}
	{
		Type = line
		Pos = (0.0, 1.0, 0.0)
		length = 2.0
		Color = [
			255
			255
			255
			255
		]
		BlendMode = brighten
		thickness = 0.5
		angle = 1.5708001
		angularvel = -0.3
		controls = [
		]
	}
	{
		Type = line
		Pos = (1.0, 1.0, 0.0)
		length = 2.0
		Color = [
			255
			255
			255
			255
		]
		BlendMode = brighten
		thickness = 0.5
		angle = 1.5708001
		angularvel = 0.3
		controls = [
		]
	}
	{
		Type = line
		Pos = (0.25, 0.5, 0.0)
		length = -0.5
		Color = [
			154
			116
			255
			255
		]
		BlendMode = blend
		thickness = 0.8
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = History
				historytype = frequency
				response = deform
				scalemod = 300.0
				spectrumband = 0
			}
		]
	}
	{
		Type = line
		Pos = (0.75, 0.5, 0.0)
		length = 0.5
		Color = [
			154
			116
			255
			255
		]
		BlendMode = blend
		thickness = 0.8
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = History
				historytype = frequency
				response = deform
				scalemod = 300.0
				spectrumband = 0
			}
		]
	}
	{
		Type = line
		Pos = (0.25, 0.5, 0.0)
		length = -0.5
		Color = [
			154
			116
			255
			255
		]
		BlendMode = blend
		thickness = 0.8
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = History
				historytype = frequency
				response = deform
				scalemod = -300.0
				spectrumband = 0
			}
		]
	}
	{
		Type = line
		Pos = (0.75, 0.5, 0.0)
		length = 0.5
		Color = [
			154
			116
			255
			255
		]
		BlendMode = blend
		thickness = 0.8
		angle = 0.0
		angularvel = 0
		controls = [
			{
				Type = History
				historytype = frequency
				response = deform
				scalemod = -300.0
				spectrumband = 0
			}
		]
	}
]
