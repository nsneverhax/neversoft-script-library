OG_Band_Moment = [
	{
		type = blendPrev
		offset = (0.0, 0.001)
		scale = (0.9, 0.95)
		Color = [
			223
			235
			235
			255
		]
		angle = 0.0
		angularVel = 0
		BlendMode = blend
		controls = [
			{
				type = frequency
				response = hueModulation
				scaleMod = 0.5
				spectrumBand = 1
			}
		]
	}
	{
		type = line
		Pos = (0.25, 0.45000002, 0.0)
		length = -0.5
		Color = [
			219
			161
			255
			255
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 200.0
				responseFunc = sinTime
				timeRate = 3.1415896
				spectrumBand = 0
			}
		]
	}
	{
		type = line
		Pos = (0.25, 0.45000002, 0.0)
		length = -0.5
		Color = [
			106
			149
			255
			255
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = -100.0
				responseFunc = sinTime
				timeRate = 3.1415896
				spectrumBand = 0
			}
		]
	}
	{
		type = line
		Pos = (0.25, 0.45000002, 0.0)
		length = -0.5
		Color = [
			106
			149
			255
			255
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = -200.0
				responseFunc = sinTime
				timeRate = 3.1415896
				spectrumBand = 0
			}
		]
	}
	{
		type = line
		Pos = (0.25, 0.45000002, 0.0)
		length = -0.5
		Color = [
			219
			161
			255
			255
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 100.0
				responseFunc = sinTime
				timeRate = 3.1415896
				spectrumBand = 0
			}
		]
	}
	{
		type = line
		Pos = (0.75, 0.45000002, 0.0)
		length = 0.5
		Color = [
			219
			161
			255
			255
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 200.0
				spectrumBand = 0
			}
		]
	}
	{
		type = line
		Pos = (0.75, 0.45000002, 0.0)
		length = 0.5
		Color = [
			106
			149
			255
			255
		]
		BlendMode = brighten
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
		Pos = (0.75, 0.45000002, 0.0)
		length = 0.5
		Color = [
			106
			149
			255
			255
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = -200.0
				spectrumBand = 0
			}
		]
	}
	{
		type = line
		Pos = (0.75, 0.45000002, 0.0)
		length = 0.5
		Color = [
			219
			161
			255
			255
		]
		BlendMode = brighten
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
		type = sprite
		Pos = (0.5, 0.45000002)
		scale = (3.0, 0.2)
		width = 1.0
		height = 1.0
		Color = [
			99
			81
			0
			12
		]
		material = OG_Mat_Flare_add
		angle = 0
		angularVel = 3.1415896
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 0.1
				player = 1
				fade = 1.0
			}
			{
				type = beatOn
				response = scaleY
				scaleMod = 0.2
				fade = 0.8
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.4, 0.0)
		radius = 0.1
		Color = [
			121
			200
			193
			198
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = History
				historyType = frequency
				response = deform
				scaleMod = 1000.0
				spectrumBand = 2
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.4, 0.0)
		radius = 0.01
		Color = [
			121
			200
			193
			124
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = History
				historyType = frequency
				response = deform
				scaleMod = 1000.0
				spectrumBand = 2
			}
		]
	}
	{
		type = hypotrochoid
		Pos = (0.5, 0.4, 0.0)
		scale = (1.0, 0.2)
		length = 0.05
		InnerRadius = 0.25
		outerRadius = 0.05
		Color = [
			255
			255
			255
			255
		]
		material = OG_Mat_Flare_Blend
		thickness = 20
		angularVel = 1.0
	}
	{
		type = hypotrochoid
		Pos = (0.5, 0.4, 0.0)
		scale = (1.0, 0.2)
		length = 0.05
		InnerRadius = 0.25
		outerRadius = 0.05
		Color = [
			255
			255
			255
			255
		]
		material = OG_Mat_Flare_Blend
		thickness = 20
		angularVel = -1.0
	}
	{
		type = hypotrochoid
		Pos = (0.5, 0.4, 0.0)
		scale = (1.0, 1.0)
		length = 0.125
		InnerRadius = 0.25
		outerRadius = 0.05
		Color = [
			255
			255
			255
			255
		]
		material = OG_Mat_Flare_Blend
		thickness = 20
		angularVel = 2.0
	}
	{
		type = hypotrochoid
		Pos = (0.5, 0.4, 0.0)
		scale = (1.0, 1.0)
		length = 0.125
		InnerRadius = 0.25
		outerRadius = 0.05
		Color = [
			255
			255
			255
			255
		]
		material = OG_Mat_Flare_Blend
		thickness = 20.0
		angularVel = -2.0
	}
]
