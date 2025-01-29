JOW_MusicStudio_Menu_CB = [
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (1.0, 1.05)
		Color = [
			255
			255
			255
			254
		]
		angle = 0
		angularVel = 0.0174533
		BlendMode = blend
		controls = [
		]
	}
	{
		type = line
		Pos = (0.5, 0.0, 0.0)
		length = 1.0
		Color = [
			65
			79
			53
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
			65
			79
			53
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
		thickness = 2.0
		angle = 1.5708001
		angularVel = 1.0
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
		thickness = 2.0
		angle = 1.5708001
		angularVel = -1.0
		controls = [
		]
	}
	{
		type = line
		Pos = (0.25, 0.5, 0.0)
		length = -0.5
		Color = [
			0
			0
			0
			255
		]
		BlendMode = brighten
		thickness = 1.5
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 150.0
				spectrumBand = 0
			}
			{
				type = constant
				response = brightnessModulation
				scaleMod = 1.0
				responseFunc = sinTime
				timeRate = 0.523599
			}
		]
	}
	{
		type = line
		Pos = (0.25, 0.5, 0.0)
		length = -0.5
		Color = [
			0
			0
			0
			255
		]
		BlendMode = brighten
		thickness = 1.5
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = -150.0
				spectrumBand = 0
			}
			{
				type = constant
				response = brightnessModulation
				scaleMod = 1.0
				responseFunc = sinTime
				timeRate = 0.523599
			}
		]
	}
	{
		type = line
		Pos = (0.75, 0.5, 0.0)
		length = 0.5
		Color = [
			0
			0
			0
			255
		]
		BlendMode = brighten
		thickness = 1.5
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 150.0
				spectrumBand = 0
			}
			{
				type = constant
				response = brightnessModulation
				scaleMod = 1.0
				responseFunc = sinTime
				timeRate = 0.523599
			}
		]
	}
	{
		type = line
		Pos = (0.75, 0.5, 0.0)
		length = 0.5
		Color = [
			0
			0
			0
			255
		]
		BlendMode = brighten
		thickness = 1.5
		angle = 0.0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = -150.0
				spectrumBand = 0
			}
			{
				type = constant
				response = brightnessModulation
				scaleMod = 1.0
				responseFunc = sinTime
				timeRate = 0.523599
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
		thickness = 2.0
		angle = 1.5708001
		angularVel = -1.0
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
		thickness = 2.0
		angle = 1.5708001
		angularVel = 1.0
		controls = [
		]
	}
	{
		type = line
		Pos = (0.25, 0.5, 0.0)
		length = -0.5
		Color = [
			226
			116
			255
			255
		]
		material = JOW_Mat_ColorBlue01_Blend
		thickness = 2.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = History
				historyType = frequency
				response = deform
				scaleMod = 250.0
				spectrumBand = 0
			}
		]
	}
	{
		type = line
		Pos = (0.75, 0.5, 0.0)
		length = 0.5
		Color = [
			226
			116
			255
			255
		]
		material = JOW_Mat_ColorBlue01_Blend
		thickness = 2.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = History
				historyType = frequency
				response = deform
				scaleMod = 250.0
				spectrumBand = 0
			}
		]
	}
	{
		type = line
		Pos = (0.25, 0.5, 0.0)
		length = -0.5
		Color = [
			226
			116
			255
			255
		]
		material = JOW_Mat_ColorBlue01_Blend
		thickness = 2.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = History
				historyType = frequency
				response = deform
				scaleMod = -250.0
				spectrumBand = 0
			}
		]
	}
	{
		type = line
		Pos = (0.75, 0.5, 0.0)
		length = 0.5
		Color = [
			226
			116
			255
			255
		]
		material = JOW_Mat_ColorBlue01_Blend
		thickness = 2.0
		angle = 0.0
		angularVel = 0
		controls = [
			{
				type = History
				historyType = frequency
				response = deform
				scaleMod = -250.0
				spectrumBand = 0
			}
		]
	}
]
