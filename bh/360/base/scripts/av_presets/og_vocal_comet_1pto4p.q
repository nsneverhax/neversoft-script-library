OG_Vocal_Comet_1Pto4P = [
	{
		type = sprite
		Pos = (0.89, 0.0, 0.0)
		scale = (1.0, 0.6)
		width = 0.075
		height = 0.075
		Color = [
			246
			255
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
				player = 1
			}
			{
				type = vocalsnoteon
				response = greenModulation
				scaleMod = 0.5
				player = 1
			}
			{
				type = vocalsnoteon
				response = redModulation
				scaleMod = -0.5
				player = 1
			}
			{
				type = vocalsamplitude
				response = alphaModulation
				scaleMod = 10.0
				player = 1
			}
			{
				type = vocalsnoteon
				response = brightnessModulation
				scaleMod = 25.0
				player = 1
			}
			{
				type = starpowerstate
				response = hueModulation
				scaleMod = 0.2
				player = 1
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
				player = 1
			}
			{
				type = vocalsnoteon
				response = alphaModulation
				scaleMod = 2.0
				player = 1
			}
			{
				type = starpowerstate
				response = blueModulation
				scaleMod = 1.0
				player = 1
				fade = 1.0
			}
			{
				type = starpowerstate
				response = redModulation
				scaleMod = -1.0
				player = 1
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
			143
		]
		angle = 0
		angularVel = 0
		BlendMode = add
		controls = [
			{
				type = vocalsnoteon
				response = alphaModulation
				scaleMod = 0.4
				player = 1
			}
			{
				type = vocalsnoteon
				response = alphaModulation
				scaleMod = 0.4
				player = 2
			}
			{
				type = vocalsnoteon
				response = alphaModulation
				scaleMod = 0.4
				player = 3
			}
			{
				type = vocalsnoteon
				response = alphaModulation
				scaleMod = 0.4
				player = 4
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
				type = vocalsnoteon
				response = greenModulation
				scaleMod = 0.5
				player = 1
			}
			{
				type = vocalsnoteon
				response = redModulation
				scaleMod = -0.5
				player = 1
			}
			{
				type = waveform
				response = deform
				scaleMod = 75.0
			}
			{
				type = starpowerstate
				response = blueModulation
				scaleMod = 1.0
				player = 1
				fade = 1.0
			}
			{
				type = starpowerstate
				response = redModulation
				scaleMod = -1.0
				player = 1
				fade = 1.0
			}
			{
				type = vocalsnoteon
				response = alphaModulation
				scaleMod = -0.8
				player = 1
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
				player = 2
			}
			{
				type = vocalsnoteon
				response = alphaModulation
				scaleMod = 2.0
				player = 2
			}
			{
				type = starpowerstate
				response = blueModulation
				scaleMod = 1.0
				player = 2
				fade = 1.0
			}
			{
				type = starpowerstate
				response = redModulation
				scaleMod = -1.0
				player = 2
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
				player = 2
			}
			{
				type = vocalsnoteon
				response = alphaModulation
				scaleMod = 2.0
				player = 2
			}
			{
				type = starpowerstate
				response = blueModulation
				scaleMod = 1.0
				player = 2
				fade = 1.0
			}
			{
				type = starpowerstate
				response = redModulation
				scaleMod = -1.0
				player = 2
				fade = 1.0
			}
		]
	}
	{
		type = sprite
		Pos = (0.89, 0.0, 0.0)
		scale = (1.0, 0.6)
		width = 0.075
		height = 0.075
		Color = [
			246
			255
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
				player = 2
			}
			{
				type = vocalsnoteon
				response = greenModulation
				scaleMod = 0.5
				player = 2
			}
			{
				type = vocalsnoteon
				response = redModulation
				scaleMod = -0.5
				player = 2
			}
			{
				type = vocalsamplitude
				response = alphaModulation
				scaleMod = 10.0
				player = 2
			}
			{
				type = vocalsnoteon
				response = brightnessModulation
				scaleMod = 25.0
				player = 2
			}
			{
				type = starpowerstate
				response = hueModulation
				scaleMod = 0.2
				player = 2
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
				type = vocalsnoteon
				response = greenModulation
				scaleMod = 0.5
				player = 2
			}
			{
				type = vocalsnoteon
				response = redModulation
				scaleMod = -0.5
				player = 2
			}
			{
				type = waveform
				response = deform
				scaleMod = 75.0
				player = 2
			}
			{
				type = vocalsnoteon
				response = alphaModulation
				scaleMod = -0.8
				player = 2
			}
			{
				type = starpowerstate
				response = blueModulation
				scaleMod = 1.0
				player = 2
				fade = 1.0
			}
			{
				type = starpowerstate
				response = redModulation
				scaleMod = -1.0
				player = 2
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
				player = 3
			}
			{
				type = vocalsnoteon
				response = alphaModulation
				scaleMod = 2.0
				player = 3
			}
			{
				type = starpowerstate
				response = blueModulation
				scaleMod = 1.0
				player = 3
				fade = 1.0
			}
			{
				type = starpowerstate
				response = redModulation
				scaleMod = -1.0
				player = 3
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
				player = 3
			}
			{
				type = vocalsnoteon
				response = alphaModulation
				scaleMod = 2.0
				player = 3
			}
			{
				type = starpowerstate
				response = blueModulation
				scaleMod = 1.0
				player = 3
				fade = 1.0
			}
			{
				type = starpowerstate
				response = redModulation
				scaleMod = -1.0
				player = 3
				fade = 1.0
			}
		]
	}
	{
		type = sprite
		Pos = (0.89, 0.0, 0.0)
		scale = (1.0, 0.6)
		width = 0.075
		height = 0.075
		Color = [
			246
			255
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
				player = 3
			}
			{
				type = vocalsnoteon
				response = greenModulation
				scaleMod = 0.5
				player = 3
			}
			{
				type = vocalsnoteon
				response = redModulation
				scaleMod = -0.5
				player = 3
			}
			{
				type = vocalsamplitude
				response = alphaModulation
				scaleMod = 10.0
				player = 3
			}
			{
				type = vocalsnoteon
				response = brightnessModulation
				scaleMod = 25.0
				player = 3
			}
			{
				type = starpowerstate
				response = hueModulation
				scaleMod = 0.2
				player = 3
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
				type = vocalsnoteon
				response = greenModulation
				scaleMod = 0.5
				player = 3
			}
			{
				type = vocalsnoteon
				response = redModulation
				scaleMod = -0.5
				player = 3
			}
			{
				type = waveform
				response = deform
				scaleMod = 75.0
				player = 3
			}
			{
				type = vocalsnoteon
				response = alphaModulation
				scaleMod = -0.8
				player = 3
			}
			{
				type = starpowerstate
				response = blueModulation
				scaleMod = 1.0
				player = 3
				fade = 1.0
			}
			{
				type = starpowerstate
				response = redModulation
				scaleMod = -1.0
				player = 3
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
				player = 4
			}
			{
				type = vocalsnoteon
				response = alphaModulation
				scaleMod = 2.0
				player = 4
			}
			{
				type = starpowerstate
				response = blueModulation
				scaleMod = 1.0
				player = 4
				fade = 1.0
			}
			{
				type = starpowerstate
				response = redModulation
				scaleMod = -1.0
				player = 4
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
				player = 4
			}
			{
				type = vocalsnoteon
				response = alphaModulation
				scaleMod = 2.0
				player = 4
			}
			{
				type = starpowerstate
				response = blueModulation
				scaleMod = 1.0
				player = 4
				fade = 1.0
			}
			{
				type = starpowerstate
				response = redModulation
				scaleMod = -1.0
				player = 4
				fade = 1.0
			}
		]
	}
	{
		type = sprite
		Pos = (0.89, 0.0, 0.0)
		scale = (1.0, 0.6)
		width = 0.075
		height = 0.075
		Color = [
			246
			255
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
				player = 4
			}
			{
				type = vocalsnoteon
				response = greenModulation
				scaleMod = 0.5
				player = 4
			}
			{
				type = vocalsnoteon
				response = redModulation
				scaleMod = -0.5
				player = 4
			}
			{
				type = vocalsamplitude
				response = alphaModulation
				scaleMod = 10.0
				player = 4
			}
			{
				type = vocalsnoteon
				response = brightnessModulation
				scaleMod = 25.0
				player = 4
			}
			{
				type = starpowerstate
				response = hueModulation
				scaleMod = 0.2
				player = 4
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
				type = vocalsnoteon
				response = greenModulation
				scaleMod = 0.5
				player = 4
			}
			{
				type = vocalsnoteon
				response = redModulation
				scaleMod = -0.5
				player = 4
			}
			{
				type = waveform
				response = deform
				scaleMod = 75.0
				player = 4
			}
			{
				type = vocalsnoteon
				response = alphaModulation
				scaleMod = -0.8
				player = 4
			}
			{
				type = starpowerstate
				response = blueModulation
				scaleMod = 1.0
				player = 4
				fade = 1.0
			}
			{
				type = starpowerstate
				response = redModulation
				scaleMod = -1.0
				player = 4
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
				player = 1
			}
			{
				type = vocalsnoteon
				response = alphaModulation
				scaleMod = 2.0
				player = 1
			}
			{
				type = starpowerstate
				response = blueModulation
				scaleMod = 1.0
				player = 1
				fade = 1.0
			}
			{
				type = starpowerstate
				response = redModulation
				scaleMod = -1.0
				player = 1
				fade = 1.0
			}
		]
	}
]
