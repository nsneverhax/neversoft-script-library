OG_Vocal_Comet = [
	{
		type = sprite
		Pos = (0.89, 0.0, 0.0)
		scale = (1.0, 0.9)
		width = 0.075
		height = 0.075
		Color = [
			3
			2
			0
			0
		]
		material = OG_Mat_Flare_add
		angle = 0
		angularVel = 0
		controls = [
			{
				type = vocalspitch
				response = offsetY
				scaleMod = 1.0
				vocalist_num = 1
			}
			{
				type = vocalsamplitude
				response = alphaModulation
				scaleMod = 50.0
				vocalist_num = 1
			}
			{
				type = starpowerstate
				response = alphaModulation
				scaleMod = -100.0
				vocalist_num = 1
				fade = 1.0
			}
			{
				type = vocalsphrasequality
				response = brightnessModulation
				scaleMod = 1.0
				vocalist_num = 1
			}
		]
	}
	{
		type = nStar2
		Pos = (0.89, 0.0, 0.0)
		nPoints = 5
		radius = 0.01
		radius2 = 0.0233
		Color = [
			59
			232
			252
			0
		]
		BlendMode = add
		thickness = 1.0
		angle = 0
		angularVel = 2.6179898
		controls = [
			{
				type = vocalspitch
				response = offsetY
				scaleMod = 1.0
				vocalist_num = 1
			}
			{
				type = vocalsamplitude
				response = brightnessModulation
				scaleMod = 0.5
				vocalist_num = 1
			}
			{
				type = vocalsnoteon
				response = brightnessModulation
				scaleMod = 0.5
				vocalist_num = 1
			}
			{
				type = starpowerstate
				response = alphaModulation
				scaleMod = 20.0
				vocalist_num = 1
				fade = 1.0
			}
		]
	}
	{
		type = nStar2
		Pos = (0.89, 0.0, 0.0)
		nPoints = 5
		radius = 0.0429
		radius2 = 0.1
		Color = [
			0
			1
			1
			0
		]
		BlendMode = add
		thickness = 3.0
		angle = 0
		angularVel = 2.6179898
		controls = [
			{
				type = vocalspitch
				response = offsetY
				scaleMod = 1.0
				vocalist_num = 1
			}
			{
				type = starpowerstate
				response = alphaModulation
				scaleMod = 1.0
				vocalist_num = 1
				fade = 1.0
			}
			{
				type = vocalsamplitude
				response = brightnessModulation
				scaleMod = 0.2
				vocalist_num = 1
			}
		]
	}
	{
		type = line
		Pos = (0.887, 0.5, 0.0)
		length = 0.5
		Color = [
			65
			250
			0
			255
		]
		BlendMode = add
		thickness = 1.0
		angle = 1.5708001
		angularVel = 0
		controls = [
			{
				type = waveform
				response = deform
				scaleMod = 40.0
			}
			{
				type = starpowerstate
				response = blueModulation
				scaleMod = 0.9
				vocalist_num = 1
				fade = 1.0
			}
			{
				type = vocalsphrasequality
				response = saturationModulation
				scaleMod = 1.0
				vocalist_num = 1
			}
		]
	}
	{
		type = sprite
		Pos = (0.82, 0.0)
		scale = (1.0, 0.9)
		width = 0.37
		height = 0.1
		Color = [
			3
			2
			0
			0
		]
		material = OG_Mat_Flare_add
		angle = 0
		angularVel = 0
		controls = [
			{
				type = vocalspitch
				response = offsetY
				scaleMod = 1.0
				vocalist_num = 1
			}
			{
				type = vocalsnoteon
				response = alphaModulation
				scaleMod = 0.9
				vocalist_num = 1
			}
			{
				type = starpowerstate
				response = hueModulation
				scaleMod = 0.4
				vocalist_num = 1
				fade = 1.0
			}
			{
				type = starpowerstate
				response = saturationModulation
				scaleMod = 0.0
				vocalist_num = 1
				fade = 1.0
			}
			{
				type = vocalsphrasequality
				response = brightnessModulation
				scaleMod = 1.0
				vocalist_num = 1
			}
		]
	}
	{
		type = blendPrev
		offset = (-0.005, 0.0)
		scale = (1.0, 1.0)
		Color = [
			255
			255
			255
			154
		]
		angle = 0
		angularVel = 0
		BlendMode = add
		controls = [
			{
				type = vocalsamplitude
				response = alphaModulation
				scaleMod = 0.18
				vocalist_num = 1
			}
		]
	}
]
