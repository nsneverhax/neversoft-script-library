OG_Vocal_Comet_Static = [
	{
		type = sprite
		Pos = (0.89, 0.0, 0.0)
		scale = (1.0, 0.7)
		width = 0.075
		height = 0.075
		Color = [
			255
			150
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
				scaleMod = 25.0
				vocalist_num = 1
			}
			{
				type = vocalsamplitude
				response = brightnessModulation
				scaleMod = 25.0
				vocalist_num = 1
			}
			{
				type = starpowerstate
				response = alphaModulation
				scaleMod = -100.0
				vocalist_num = 1
				fade = 1.0
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
		type = hypotrochoid
		Pos = (0.85, 0.0, 0.0)
		scale = (1.0, 0.7)
		length = 0.0125
		InnerRadius = 0.125
		outerRadius = 0.1
		Color = [
			255
			86
			0
			0
		]
		material = OG_Mat_Flare_add
		thickness = 10.0
		angularVel = 13.9626
		controls = [
			{
				type = vocalsnoteon
				response = greenModulation
				scaleMod = 0.5
				vocalist_num = 1
			}
			{
				type = vocalsnoteon
				response = redModulation
				scaleMod = -0.5
				vocalist_num = 1
			}
			{
				type = vocalspitch
				response = offsetY
				scaleMod = 1.0
				vocalist_num = 1
			}
			{
				type = vocalsnoteon
				response = alphaModulation
				scaleMod = 2.0
				vocalist_num = 1
			}
			{
				type = starpowerstate
				response = blueModulation
				scaleMod = 1.0
				vocalist_num = 1
				fade = 1.0
			}
			{
				type = starpowerstate
				response = redModulation
				scaleMod = -1.0
				vocalist_num = 1
				fade = 1.0
			}
		]
	}
	{
		type = hypotrochoid
		Pos = (0.85, 0.0, 0.0)
		scale = (0.7, 0.2)
		length = 0.052500002
		InnerRadius = 0.0125
		outerRadius = 0.1
		Color = [
			65
			251
			0
			31
		]
		material = OG_Mat_Flare_add
		thickness = 10.0
		angularVel = 13.9626
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
				scaleMod = 2.0
				vocalist_num = 1
			}
			{
				type = starpowerstate
				response = blueModulation
				scaleMod = 1.0
				vocalist_num = 1
				fade = 1.0
			}
			{
				type = starpowerstate
				response = redModulation
				scaleMod = -1.0
				vocalist_num = 1
				fade = 1.0
			}
		]
	}
	{
		type = hypotrochoid
		Pos = (0.85, 0.0, 0.0)
		scale = (1.0, 0.7)
		length = 0.0125
		InnerRadius = 0.125
		outerRadius = 0.1
		Color = [
			255
			185
			0
			0
		]
		material = OG_Mat_Flare_add
		thickness = 10.0
		angularVel = -52.359898
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
				scaleMod = 2.0
				vocalist_num = 1
			}
			{
				type = starpowerstate
				response = blueModulation
				scaleMod = 1.0
				vocalist_num = 1
				fade = 1.0
			}
			{
				type = starpowerstate
				response = redModulation
				scaleMod = -1.0
				vocalist_num = 1
				fade = 1.0
			}
		]
	}
	{
		type = hypotrochoid
		Pos = (0.89, 0.0, 0.0)
		scale = (0.3, 0.3)
		length = 0.2175
		InnerRadius = 0.125
		outerRadius = 0.3
		Color = [
			0
			196
			255
			0
		]
		material = OG_Mat_Flare_add
		thickness = 10.0
		angularVel = -523.599
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
				type = vocalsnoteon
				response = brightnessModulation
				scaleMod = 0.6
				vocalist_num = 1
			}
			{
				type = vocalsamplitude
				response = brightnessModulation
				scaleMod = 5.0
				vocalist_num = 1
			}
			{
				type = beatOn
				response = radius2Scale
				scaleMod = 0.3
				fade = 1.0
			}
		]
	}
	{
		type = line
		Pos = (0.887, 0.5, 0.0)
		length = 0.5
		Color = [
			65
			251
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
				response = saturationModulation
				scaleMod = -0.8
				vocalist_num = 1
				fade = 1.0
			}
		]
	}
	{
		type = sprite
		Pos = (0.82, 0.0)
		scale = (1.0, 0.7)
		width = 0.37
		height = 0.1
		Color = [
			255
			150
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
				scaleMod = -0.2
				vocalist_num = 1
				fade = 1.0
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
