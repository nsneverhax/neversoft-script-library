OG_Dublin_Encore_Falling = [
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (0.88, 0.88)
		Color = [
			255
			223
			0
			249
		]
		angle = 0.0
		angularVel = 0.0
		BlendMode = blend
		controls = [
			{
				type = constant
				response = angleMod
				scaleMod = 0.1
				responseFunc = sinTime
				timeRate = 0.872665
			}
			{
				type = constant
				response = scaleY
				scaleMod = 0.05
				responseFunc = cosTime
				timeRate = 1.0472
			}
			{
				type = constant
				response = scaleX
				scaleMod = 0.05
				responseFunc = cosTime
				timeRate = 0.872665
			}
			{
				type = constant
				response = offsetX
				scaleMod = 0.01
				responseFunc = cosTime
				timeRate = 0.349066
			}
			{
				type = constant
				response = offsetY
				scaleMod = 0.01
				responseFunc = cosTime
				timeRate = 0.523599
			}
		]
	}
	{
		type = sprite
		Pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 1.0
		height = 1.0
		Color = [
			22
			22
			22
			0
		]
		material = OG_Mat_Flare_add
		angle = 0
		angularVel = 0
		controls = [
			{
				type = beatOn
				response = alphaModulation
				scaleMod = 1.0
				responseFunc = cosTime
				fade = 0.1
			}
			{
				type = constant
				response = offsetY
				scaleMod = 0.05
				responseFunc = cosTime
				timeOffset = 1.5708001
				timeRate = 0.349066
			}
			{
				type = constant
				response = offsetX
				scaleMod = 0.05
				responseFunc = sinTime
				timeOffset = 1.5708001
				timeRate = 0.69813204
			}
		]
	}
	{
		type = sprite
		Pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 0.125
		height = 0.125
		Color = [
			255
			255
			255
			127
		]
		material = OG_Mat_Dublin_Shamrock
		angle = 0
		angularVel = 0.0
		controls = [
			{
				type = constant
				response = offsetX
				scaleMod = 0.05
				responseFunc = sinTime
				timeOffset = 4.71239
				timeRate = 0.43633202
			}
			{
				type = constant
				response = offsetY
				scaleMod = 0.05
				responseFunc = cosTime
				timeOffset = 4.71239
				timeRate = 0.61086506
			}
		]
	}
	{
		type = sprite
		Pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 0.125
		height = 0.125
		Color = [
			255
			255
			255
			127
		]
		material = OG_Mat_Dublin_Shamrock
		angle = 0
		angularVel = 0.0
		controls = [
			{
				type = constant
				response = offsetX
				scaleMod = 0.05
				responseFunc = sinTime
				timeOffset = 1.5708001
				timeRate = 0.69813204
			}
			{
				type = constant
				response = offsetY
				scaleMod = 0.05
				responseFunc = cosTime
				timeOffset = 1.5708001
				timeRate = 0.349066
			}
		]
	}
	{
		type = sprite
		Pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 1.0
		height = 1.0
		Color = [
			22
			22
			22
			0
		]
		material = OG_Mat_Flare_add
		angle = 0
		angularVel = 3.1415896
		controls = [
			{
				type = beatOn
				response = alphaModulation
				scaleMod = 1.0
				responseFunc = cosTime
				fade = 0.1
			}
			{
				type = constant
				response = offsetX
				scaleMod = 0.05
				responseFunc = sinTime
				timeOffset = 4.71239
				timeRate = 0.43633202
			}
			{
				type = constant
				response = offsetY
				scaleMod = 0.05
				responseFunc = cosTime
				timeOffset = 4.71239
				timeRate = 0.61086506
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.1
		Color = [
			123
			71
			71
			255
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = waveform
				response = deform
				scaleMod = 500.0
			}
			{
				type = constant
				response = offsetX
				scaleMod = 0.05
				responseFunc = sinTime
				timeOffset = 1.5708001
				timeRate = 0.69813204
			}
			{
				type = constant
				response = offsetY
				scaleMod = 0.05
				responseFunc = cosTime
				timeOffset = 1.5708001
				timeRate = 0.349066
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.1
		Color = [
			138
			80
			80
			255
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 3.1415896
		angularVel = 0
		controls = [
			{
				type = constant
				response = offsetX
				scaleMod = 0.05
				responseFunc = sinTime
				timeOffset = 4.71239
				timeRate = 0.43633202
			}
			{
				type = constant
				response = offsetY
				scaleMod = 0.05
				responseFunc = cosTime
				timeOffset = 4.71239
				timeRate = 0.61086506
			}
			{
				type = waveform
				response = deform
				scaleMod = 500.0
			}
		]
	}
]
