OG_Vocal_Comet_4P_Freeplay = [
	{
		type = blendPrev
		offset = (-0.005, 0.0)
		scale = (1.0, 1.0)
		Color = [
			255
			255
			255
			201
		]
		angle = 0
		angularVel = 0
		BlendMode = add
		controls = [
			{
				type = vocalsamplitude
				response = alphaModulation
				scaleMod = 0.1
				player = 4
			}
		]
	}
	{
		type = nStar2
		Pos = (0.89, 0.0, 0.0)
		nPoints = 5
		radius = 0.0
		radius2 = 0.0
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
				player = 1
			}
			{
				type = vocalsamplitude
				response = brightnessModulation
				scaleMod = 0.5
				player = 1
			}
			{
				type = vocalsnoteon
				response = brightnessModulation
				scaleMod = 0.5
				player = 1
			}
			{
				type = starpowerstate
				response = alphaModulation
				scaleMod = 20.0
				player = 1
				fade = 1.0
			}
			{
				type = VocalsActive
				response = radiusScale
				scaleMod = 0.01
				player = 1
			}
			{
				type = VocalsActive
				response = radius2Scale
				scaleMod = 0.0233
				player = 1
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
				player = 1
				fade = 1.0
			}
			{
				type = starpowerstate
				response = saturationModulation
				scaleMod = -0.8
				player = 2
				fade = 1.0
			}
			{
				type = starpowerstate
				response = saturationModulation
				scaleMod = -0.8
				player = 3
				fade = 1.0
			}
			{
				type = starpowerstate
				response = saturationModulation
				scaleMod = -0.8
				player = 4
				fade = 1.0
			}
		]
	}
	{
		type = sprite
		Pos = (0.89, 0.0)
		scale = (0.0, 0.0)
		width = 0.075
		height = 0.075
		Color = [
			0
			97
			255
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
				type = vocalsamplitude
				response = alphaModulation
				scaleMod = 50.0
				player = 1
			}
			{
				type = starpowerstate
				response = alphaModulation
				scaleMod = -100.0
				player = 1
				fade = 1.0
			}
			{
				type = VocalsActive
				response = scaleX
				scaleMod = 1.0
				player = 1
			}
			{
				type = vocalsphrasequality
				response = scaleY
				scaleMod = 0.8
				player = 1
			}
		]
	}
	{
		type = sprite
		Pos = (0.82, 0.0)
		scale = (0.0, 0.0)
		width = 0.1
		height = 0.1
		Color = [
			255
			170
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
				type = starpowerstate
				response = hueModulation
				scaleMod = 0.4
				player = 1
				fade = 1.0
			}
			{
				type = vocalsnoteon
				response = alphaModulation
				scaleMod = 100.0
				player = 1
			}
			{
				type = vocalsphrasequality
				response = scaleY
				scaleMod = 0.6
				player = 1
			}
			{
				type = VocalsActive
				response = scaleX
				scaleMod = 2.8
				player = 1
			}
		]
	}
	{
		type = sprite
		Pos = (0.865, 0.0)
		scale = (0.0, 0.0)
		width = 0.1
		height = 0.1
		Color = [
			0
			97
			255
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
				response = alphaModulation
				scaleMod = 100.0
				player = 1
			}
			{
				type = VocalsActive
				response = scaleX
				scaleMod = 0.3
				player = 1
			}
			{
				type = vocalsphrasequality
				response = scaleY
				scaleMod = 1.2
				player = 1
			}
		]
	}
	{
		type = nStar2
		Pos = (0.89, 0.0, 0.0)
		nPoints = 5
		radius = 0.0
		radius2 = 0.0
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
				player = 2
			}
			{
				type = vocalsamplitude
				response = brightnessModulation
				scaleMod = 0.5
				player = 2
			}
			{
				type = vocalsnoteon
				response = brightnessModulation
				scaleMod = 0.5
				player = 2
			}
			{
				type = starpowerstate
				response = alphaModulation
				scaleMod = 20.0
				player = 2
				fade = 1.0
			}
			{
				type = VocalsActive
				response = radiusScale
				scaleMod = 0.01
				player = 2
			}
			{
				type = VocalsActive
				response = radius2Scale
				scaleMod = 0.0233
				player = 2
			}
		]
	}
	{
		type = sprite
		Pos = (0.89, 0.0)
		scale = (0.0, 0.0)
		width = 0.075
		height = 0.075
		Color = [
			164
			84
			49
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
				type = vocalsamplitude
				response = alphaModulation
				scaleMod = 50.0
				player = 2
			}
			{
				type = starpowerstate
				response = alphaModulation
				scaleMod = -100.0
				player = 2
				fade = 1.0
			}
			{
				type = VocalsActive
				response = scaleX
				scaleMod = 1.0
				player = 2
			}
			{
				type = vocalsphrasequality
				response = scaleY
				scaleMod = 0.8
				player = 2
			}
		]
	}
	{
		type = sprite
		Pos = (0.865, 0.0)
		scale = (0.0, 0.0)
		width = 0.1
		height = 0.1
		Color = [
			164
			84
			49
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
				response = alphaModulation
				scaleMod = 100.0
				player = 2
			}
			{
				type = VocalsActive
				response = scaleX
				scaleMod = 0.3
				player = 2
			}
			{
				type = vocalsphrasequality
				response = scaleY
				scaleMod = 1.2
				player = 2
			}
		]
	}
	{
		type = sprite
		Pos = (0.8, 0.0)
		scale = (0.0, 0.0)
		width = 0.1
		height = 0.1
		Color = [
			255
			170
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
				type = starpowerstate
				response = hueModulation
				scaleMod = 0.4
				player = 2
				fade = 1.0
			}
			{
				type = vocalsnoteon
				response = alphaModulation
				scaleMod = 100.0
				player = 2
			}
			{
				type = vocalsphrasequality
				response = scaleY
				scaleMod = 0.6
				player = 2
			}
			{
				type = VocalsActive
				response = scaleX
				scaleMod = 2.8
				player = 2
			}
		]
	}
	{
		type = nStar2
		Pos = (0.89, 0.0, 0.0)
		nPoints = 5
		radius = 0.0
		radius2 = 0.0
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
				player = 3
			}
			{
				type = vocalsamplitude
				response = brightnessModulation
				scaleMod = 0.5
				player = 3
			}
			{
				type = vocalsnoteon
				response = brightnessModulation
				scaleMod = 0.5
				player = 3
			}
			{
				type = starpowerstate
				response = alphaModulation
				scaleMod = 20.0
				player = 3
				fade = 1.0
			}
			{
				type = VocalsActive
				response = radiusScale
				scaleMod = 0.01
				player = 3
			}
			{
				type = VocalsActive
				response = radius2Scale
				scaleMod = 0.0233
				player = 3
			}
		]
	}
	{
		type = sprite
		Pos = (0.89, 0.0)
		scale = (0.0, 0.0)
		width = 0.075
		height = 0.075
		Color = [
			130
			70
			109
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
				type = vocalsamplitude
				response = alphaModulation
				scaleMod = 50.0
				player = 3
			}
			{
				type = starpowerstate
				response = alphaModulation
				scaleMod = -100.0
				player = 3
				fade = 1.0
			}
			{
				type = VocalsActive
				response = scaleX
				scaleMod = 1.0
				player = 3
			}
			{
				type = vocalsphrasequality
				response = scaleY
				scaleMod = 0.8
				player = 3
			}
		]
	}
	{
		type = sprite
		Pos = (0.865, 0.0)
		scale = (0.0, 0.0)
		width = 0.1
		height = 0.1
		Color = [
			130
			70
			109
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
				response = alphaModulation
				scaleMod = 100.0
				player = 3
			}
			{
				type = VocalsActive
				response = scaleX
				scaleMod = 0.3
				player = 3
			}
			{
				type = vocalsphrasequality
				response = scaleY
				scaleMod = 1.2
				player = 3
			}
		]
	}
	{
		type = sprite
		Pos = (0.8, 0.0)
		scale = (0.0, 0.0)
		width = 0.1
		height = 0.1
		Color = [
			255
			170
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
				type = starpowerstate
				response = hueModulation
				scaleMod = 0.4
				player = 3
				fade = 1.0
			}
			{
				type = vocalsnoteon
				response = alphaModulation
				scaleMod = 100.0
				player = 3
			}
			{
				type = vocalsphrasequality
				response = scaleY
				scaleMod = 0.6
				player = 3
			}
			{
				type = VocalsActive
				response = scaleX
				scaleMod = 2.8
				player = 3
			}
		]
	}
	{
		type = nStar2
		Pos = (0.89, 0.0, 0.0)
		nPoints = 5
		radius = 0.0
		radius2 = 0.0
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
				player = 4
			}
			{
				type = vocalsamplitude
				response = brightnessModulation
				scaleMod = 0.5
				player = 4
			}
			{
				type = vocalsnoteon
				response = brightnessModulation
				scaleMod = 0.5
				player = 4
			}
			{
				type = starpowerstate
				response = alphaModulation
				scaleMod = 20.0
				player = 4
				fade = 1.0
			}
			{
				type = VocalsActive
				response = radiusScale
				scaleMod = 0.01
				player = 4
			}
			{
				type = VocalsActive
				response = radius2Scale
				scaleMod = 0.0233
				player = 4
			}
		]
	}
	{
		type = sprite
		Pos = (0.89, 0.0)
		scale = (0.0, 0.0)
		width = 0.075
		height = 0.075
		Color = [
			130
			120
			40
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
				type = vocalsamplitude
				response = alphaModulation
				scaleMod = 50.0
				player = 4
			}
			{
				type = starpowerstate
				response = alphaModulation
				scaleMod = -100.0
				player = 4
				fade = 1.0
			}
			{
				type = VocalsActive
				response = scaleX
				scaleMod = 1.0
				player = 4
			}
			{
				type = vocalsphrasequality
				response = scaleY
				scaleMod = 0.8
				player = 4
			}
		]
	}
	{
		type = sprite
		Pos = (0.865, 0.0)
		scale = (0.0, 0.0)
		width = 0.1
		height = 0.1
		Color = [
			130
			120
			40
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
				response = alphaModulation
				scaleMod = 100.0
				player = 4
			}
			{
				type = VocalsActive
				response = scaleX
				scaleMod = 0.3
				player = 4
			}
			{
				type = vocalsphrasequality
				response = scaleY
				scaleMod = 1.2
				player = 4
			}
		]
	}
	{
		type = sprite
		Pos = (0.8, 0.0)
		scale = (0.0, 0.0)
		width = 0.1
		height = 0.1
		Color = [
			255
			170
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
				type = starpowerstate
				response = hueModulation
				scaleMod = 0.4
				player = 4
				fade = 1.0
			}
			{
				type = vocalsnoteon
				response = alphaModulation
				scaleMod = 100.0
				player = 4
			}
			{
				type = vocalsphrasequality
				response = scaleY
				scaleMod = 0.6
				player = 4
			}
			{
				type = VocalsActive
				response = scaleX
				scaleMod = 2.8
				player = 4
			}
		]
	}
]
