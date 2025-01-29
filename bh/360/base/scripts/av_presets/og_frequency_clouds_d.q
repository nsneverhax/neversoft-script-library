OG_Frequency_Clouds_D = [
	{
		type = blendPrev
		offset = (0.0, 0.001)
		scale = (0.99649996, 0.98999995)
		Color = [
			229
			229
			229
			255
		]
		angle = 0.0
		angularVel = 0
		BlendMode = blend
		controls = [
			{
				type = frequency
				response = redModulation
				scaleMod = 0.1
				spectrumBand = 1
			}
			{
				type = frequency
				response = greenModulation
				scaleMod = 0.1
				spectrumBand = 5
			}
			{
				type = frequency
				response = blueModulation
				scaleMod = 0.1
				spectrumBand = 8
			}
		]
	}
	{
		type = line
		Pos = (0.25, 0.4, 0.0)
		length = 0.5
		Color = [
			219
			161
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
				scaleMod = 200.0
				responseFunc = sinTime
				timeRate = 3.1415896
				spectrumBand = 0
			}
		]
	}
	{
		type = line
		Pos = (0.25, 0.4, 0.0)
		length = 0.5
		Color = [
			106
			149
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
				responseFunc = sinTime
				timeRate = 3.1415896
				spectrumBand = 0
			}
		]
	}
	{
		type = line
		Pos = (0.25, 0.4, 0.0)
		length = 0.5
		Color = [
			106
			149
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
				scaleMod = -200.0
				responseFunc = sinTime
				timeRate = 3.1415896
				spectrumBand = 0
			}
		]
	}
	{
		type = line
		Pos = (0.25, 0.4, 0.0)
		length = 0.5
		Color = [
			219
			161
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
				responseFunc = sinTime
				timeRate = 3.1415896
				spectrumBand = 0
			}
		]
	}
	{
		type = line
		Pos = (0.75, 0.4, 0.0)
		length = -0.5
		Color = [
			219
			161
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
				scaleMod = 200.0
				spectrumBand = 0
			}
		]
	}
	{
		type = line
		Pos = (0.75, 0.4, 0.0)
		length = -0.5
		Color = [
			106
			149
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
		Pos = (0.75, 0.4, 0.0)
		length = -0.5
		Color = [
			106
			149
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
				scaleMod = -200.0
				spectrumBand = 0
			}
		]
	}
	{
		type = line
		Pos = (0.75, 0.4, 0.0)
		length = -0.5
		Color = [
			219
			161
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
		type = sprite
		Pos = (0.5, 0.4)
		scale = (3.0, 0.01)
		width = 1.0
		height = 1.0
		Color = [
			178
			146
			0
			25
		]
		material = OG_Mat_Sphere_Add
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
		material = OG_Mat_Flare_add
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
		material = OG_Mat_Flare_add
		thickness = 20
		angularVel = -1.0
	}
]
