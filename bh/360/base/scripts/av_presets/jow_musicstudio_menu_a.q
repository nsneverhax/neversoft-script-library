JOW_MusicStudio_Menu_A = [
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (1.1, 1.05)
		Color = [
			255
			255
			255
			254
		]
		angle = 0
		angularVel = 0.0
		BlendMode = blend
		controls = [
		]
	}
	{
		type = line
		Pos = (0.5, 0.0, 0.0)
		length = 1.0
		Color = [
			78
			88
			67
			255
		]
		BlendMode = blend
		thickness = 6.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = constant
				response = hueModulation
				scaleMod = 0.04
				responseFunc = sinTime
				timeRate = 0.17453298
			}
		]
	}
	{
		type = line
		Pos = (0.5, 1.0, 0.0)
		length = 1.0
		Color = [
			78
			88
			67
			255
		]
		BlendMode = blend
		thickness = 6.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = constant
				response = hueModulation
				scaleMod = 0.04
				responseFunc = sinTime
				timeRate = 0.17453298
			}
		]
	}
	{
		type = line
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
		angularVel = 0.3
		controls = [
		]
	}
	{
		type = line
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
		angularVel = -0.3
		controls = [
		]
	}
	{
		type = line
		Pos = (0.25, 0.5, 0.0)
		length = -0.5
		Color = [
			172
			200
			255
			255
		]
		BlendMode = blend
		thickness = 1.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 100.0
				spectrumBand = 0
			}
		]
	}
	{
		type = line
		Pos = (0.25, 0.5, 0.0)
		length = -0.5
		Color = [
			172
			200
			255
			255
		]
		BlendMode = blend
		thickness = 1.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = -100.0
				spectrumBand = 0
			}
		]
	}
	{
		type = line
		Pos = (0.75, 0.5, 0.0)
		length = 0.5
		Color = [
			172
			200
			255
			255
		]
		BlendMode = blend
		thickness = 1.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 100.0
				spectrumBand = 0
			}
		]
	}
	{
		type = line
		Pos = (0.75, 0.5, 0.0)
		length = 0.5
		Color = [
			172
			200
			255
			255
		]
		BlendMode = blend
		thickness = 1.0
		angle = 0.0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = -100.0
				spectrumBand = 0
			}
		]
	}
	{
		type = line
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
		angularVel = -0.3
		controls = [
		]
	}
	{
		type = line
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
		angularVel = 0.3
		controls = [
		]
	}
	{
		type = line
		Pos = (0.25, 0.5, 0.0)
		length = -0.5
		Color = [
			72
			124
			255
			255
		]
		BlendMode = blend
		thickness = 3.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = History
				historyType = frequency
				response = deform
				scaleMod = 300.0
				spectrumBand = 0
			}
		]
	}
	{
		type = line
		Pos = (0.75, 0.5, 0.0)
		length = 0.5
		Color = [
			72
			124
			255
			255
		]
		BlendMode = blend
		thickness = 3.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = History
				historyType = frequency
				response = deform
				scaleMod = 300.0
				spectrumBand = 0
			}
		]
	}
	{
		type = line
		Pos = (0.25, 0.5, 0.0)
		length = -0.5
		Color = [
			72
			124
			255
			255
		]
		BlendMode = blend
		thickness = 3.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = History
				historyType = frequency
				response = deform
				scaleMod = -300.0
				spectrumBand = 0
			}
		]
	}
	{
		type = line
		Pos = (0.75, 0.5, 0.0)
		length = 0.5
		Color = [
			72
			124
			255
			255
		]
		BlendMode = blend
		thickness = 3.0
		angle = 0.0
		angularVel = 0
		controls = [
			{
				type = History
				historyType = frequency
				response = deform
				scaleMod = -300.0
				spectrumBand = 0
			}
		]
	}
]
