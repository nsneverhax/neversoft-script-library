JOW_RainbowRoad = [
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (0.92999995, 0.97999996)
		Color = [
			255
			255
			255
			253
		]
		angle = 0
		angularVel = 0.0
		BlendMode = blend
		controls = [
		]
	}
	{
		type = sprite
		Pos = (0.5, 0.5)
		scale = (1.0, 1.0)
		width = 0.1
		height = 0.1
		Color = [
			0
			255
			255
			0
		]
		material = OG_Mat_Sphere_Add
		angle = 0
		angularVel = 0
		controls = [
			{
				type = constant
				response = hueModulation
				scaleMod = 0.5
				responseFunc = cosTime
			}
			{
				type = beatOn
				response = alphaModulation
				scaleMod = 0.03
				fade = 1.0
			}
			{
				type = beatOn
				response = scaleXY
				scaleMod = 1.0
				fade = 1.0
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.4
		Color = [
			0
			255
			255
			255
		]
		BlendMode = blend
		thickness = 1.0
		angle = 1.5708001
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 70.0
				deformWindowStart = 3
				spectrumBand = 0
			}
			{
				type = constant
				response = hueModulation
				scaleMod = 0.5
				responseFunc = cosTime
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.4
		Color = [
			0
			255
			255
			255
		]
		BlendMode = blend
		thickness = 1.0
		angle = 1.5708001
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = -70.0
				deformWindowStart = 3
				spectrumBand = 0
			}
			{
				type = constant
				response = hueModulation
				scaleMod = 0.5
				responseFunc = cosTime
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.3, 0.0)
		radius = 0.05
		Color = [
			255
			255
			255
			255
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequencyOnBeat
				response = deform
				scaleMod = 100.0
				spectrumBand = 0
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.7, 0.0)
		radius = 0.05
		Color = [
			255
			255
			255
			255
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequencyOnBeat
				response = deform
				scaleMod = 100.0
				spectrumBand = 0
			}
		]
	}
]
