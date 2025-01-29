OG_Vocals_Freeform = [
	{
		type = blendPrev
		offset = (0.01, 0.0)
		scale = (0.95, 1.1)
		Color = [
			243
			250
			243
			243
		]
		angle = 0.0
		angularVel = 0
		BlendMode = add
	}
	{
		type = hypotrochoid
		Pos = (0.31, 0.5, 0.0)
		scale = (0.1, 0.1)
		length = 0.05
		InnerRadius = 0.25
		outerRadius = 0.05
		Color = [
			44
			44
			44
			51
		]
		material = OG_Mat_Sphere_Add
		thickness = 500.0
		angularVel = -1.9198599
	}
	{
		type = hypotrochoid
		Pos = (0.31, 0.5, 0.0)
		scale = (0.5, 0.3)
		length = 0.05
		InnerRadius = 0.25
		outerRadius = 0.05
		Color = [
			31
			31
			31
			51
		]
		material = OG_Mat_Flare_add
		thickness = 200.0
		angularVel = 0.523599
	}
	{
		type = sprite
		Pos = (0.31, 0.5)
		scale = (1.0, 1.0)
		width = 0.5
		height = 0.5
		Color = [
			13
			13
			13
			255
		]
		material = OG_Mat_Flare_add
		angle = 0
		angularVel = 0.523599
	}
	{
		type = line
		Pos = (0.32000002, 0.5, 0.0)
		length = 0.0
		Color = [
			127
			108
			31
			0
		]
		BlendMode = brighten
		thickness = 1.5
		angle = 1.5708001
		angularVel = 0
		controls = [
			{
				type = vocalsamplitude
				response = lengthScale
				scaleMod = 2.0
				player = 1
			}
			{
				type = VocalsActive
				response = alphaModulation
				scaleMod = 1.0
				player = 1
			}
		]
	}
	{
		type = line
		Pos = (0.3, 0.5, 0.0)
		length = 0.0
		Color = [
			127
			108
			31
			0
		]
		BlendMode = brighten
		thickness = 1.5
		angle = 1.5708001
		angularVel = 0
		controls = [
			{
				type = vocalsamplitude
				response = lengthScale
				scaleMod = 2.0
				player = 1
			}
			{
				type = VocalsActive
				response = alphaModulation
				scaleMod = 1.0
				player = 1
			}
		]
	}
	{
		type = line
		Pos = (0.3, 0.5, 0.0)
		length = 0.0
		Color = [
			116
			96
			14
			0
		]
		BlendMode = brighten
		thickness = 1.5
		angle = 1.5708001
		angularVel = 0
		controls = [
			{
				type = vocalsamplitude
				response = lengthScale
				scaleMod = 2.0
				player = 2
			}
			{
				type = VocalsActive
				response = alphaModulation
				scaleMod = 1.0
				player = 2
			}
		]
	}
	{
		type = line
		Pos = (0.32000002, 0.5, 0.0)
		length = 0.0
		Color = [
			116
			96
			14
			0
		]
		BlendMode = brighten
		thickness = 1.5
		angle = 1.5708001
		angularVel = 0
		controls = [
			{
				type = vocalsamplitude
				response = lengthScale
				scaleMod = 2.0
				player = 2
			}
			{
				type = VocalsActive
				response = alphaModulation
				scaleMod = 1.0
				player = 2
			}
		]
	}
	{
		type = line
		Pos = (0.3, 0.5, 0.0)
		length = 0.0
		Color = [
			42
			108
			31
			0
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 1.5708001
		angularVel = 0
		controls = [
			{
				type = vocalsamplitude
				response = lengthScale
				scaleMod = 2.0
				player = 3
			}
			{
				type = VocalsActive
				response = alphaModulation
				scaleMod = 1.0
				player = 3
			}
		]
	}
	{
		type = line
		Pos = (0.32000002, 0.5, 0.0)
		length = 0.0
		Color = [
			42
			108
			31
			0
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 1.5708001
		angularVel = 0
		controls = [
			{
				type = vocalsamplitude
				response = lengthScale
				scaleMod = 2.0
				player = 3
			}
			{
				type = VocalsActive
				response = alphaModulation
				scaleMod = 1.0
				player = 3
			}
		]
	}
	{
		type = line
		Pos = (0.3, 0.5, 0.0)
		length = 0.0
		Color = [
			42
			108
			31
			0
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 1.5708001
		angularVel = 0
		controls = [
			{
				type = vocalsamplitude
				response = lengthScale
				scaleMod = 2.0
				player = 4
			}
			{
				type = VocalsActive
				response = alphaModulation
				scaleMod = 1.0
				player = 4
			}
		]
	}
	{
		type = line
		Pos = (0.32000002, 0.5, 0.0)
		length = 0.0
		Color = [
			42
			108
			31
			0
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 1.5708001
		angularVel = 0
		controls = [
			{
				type = vocalsamplitude
				response = lengthScale
				scaleMod = 2.0
				player = 4
			}
			{
				type = VocalsActive
				response = alphaModulation
				scaleMod = 1.0
				player = 4
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.0
		Color = [
			255
			133
			58
			255
		]
		BlendMode = brighten
		thickness = 2.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = History
				historyType = vocalspitch
				response = deform
				scaleMod = 100.0
				responseFunc = sinTime
				timeRate = 3.4906602
				player = 1
			}
			{
				type = vocalsnoteon
				response = alphaModulation
				scaleMod = -1.0
				player = 1
			}
			{
				type = VocalsActive
				response = lengthScale
				scaleMod = 1.0
				player = 1
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.0
		Color = [
			255
			133
			58
			255
		]
		BlendMode = brighten
		thickness = 2.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = vocalsnoteon
				response = alphaModulation
				scaleMod = -1.0
				player = 2
			}
			{
				type = History
				historyType = vocalspitch
				response = deform
				scaleMod = 100.0
				responseFunc = sinTime
				timeRate = 3.4906602
				player = 2
			}
			{
				type = VocalsActive
				response = lengthScale
				scaleMod = 1.0
				player = 2
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.0
		Color = [
			255
			133
			58
			255
		]
		BlendMode = brighten
		thickness = 2.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = vocalsnoteon
				response = alphaModulation
				scaleMod = -1.0
				player = 3
			}
			{
				type = VocalsActive
				response = lengthScale
				scaleMod = 1.0
				player = 3
			}
			{
				type = History
				historyType = vocalspitch
				response = deform
				scaleMod = 100.0
				responseFunc = sinTime
				timeRate = 3.4906602
				player = 3
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.0
		Color = [
			255
			133
			58
			255
		]
		BlendMode = brighten
		thickness = 2.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = vocalsnoteon
				response = alphaModulation
				scaleMod = -1.0
				player = 4
			}
			{
				type = VocalsActive
				response = lengthScale
				scaleMod = 1.0
				player = 4
			}
			{
				type = History
				historyType = vocalspitch
				response = deform
				scaleMod = 100.0
				responseFunc = sinTime
				timeRate = 3.4906602
				player = 4
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.0
		Color = [
			58
			255
			255
			0
		]
		BlendMode = add
		thickness = 3.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = History
				historyType = vocalspitch
				response = deform
				scaleMod = 100.0
				responseFunc = sinTime
				timeRate = 3.4906602
				player = 1
			}
			{
				type = vocalsnoteon
				response = alphaModulation
				scaleMod = 1.0
				player = 1
			}
			{
				type = constant
				response = hueModulation
				scaleMod = 0.5
				responseFunc = sinTime
			}
			{
				type = VocalsActive
				response = lengthScale
				scaleMod = 1.0
				player = 1
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.0
		Color = [
			58
			255
			255
			0
		]
		BlendMode = add
		thickness = 3.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = constant
				response = hueModulation
				scaleMod = 0.5
				responseFunc = sinTime
			}
			{
				type = vocalsnoteon
				response = alphaModulation
				scaleMod = 1.0
				player = 2
			}
			{
				type = History
				historyType = vocalspitch
				response = deform
				scaleMod = 100.0
				responseFunc = sinTime
				timeRate = 3.4906602
				player = 2
			}
			{
				type = VocalsActive
				response = lengthScale
				scaleMod = 1.0
				player = 2
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.0
		Color = [
			58
			255
			255
			0
		]
		BlendMode = add
		thickness = 3.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = constant
				response = hueModulation
				scaleMod = 0.5
				responseFunc = sinTime
			}
			{
				type = vocalsnoteon
				response = alphaModulation
				scaleMod = 1.0
				player = 3
			}
			{
				type = VocalsActive
				response = lengthScale
				scaleMod = 1.0
				player = 3
			}
			{
				type = History
				historyType = vocalspitch
				response = deform
				scaleMod = 100.0
				responseFunc = sinTime
				timeRate = 3.4906602
				player = 3
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 1.0
		Color = [
			52
			49
			255
			255
		]
		BlendMode = brighten
		thickness = 2.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 100.0
				spectrumBand = 10
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.0
		Color = [
			58
			255
			255
			0
		]
		BlendMode = add
		thickness = 3.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = constant
				response = hueModulation
				scaleMod = 0.5
				responseFunc = sinTime
			}
			{
				type = vocalsnoteon
				response = alphaModulation
				scaleMod = 1.0
				player = 4
			}
			{
				type = VocalsActive
				response = lengthScale
				scaleMod = 1.0
				player = 4
			}
			{
				type = History
				historyType = vocalspitch
				response = deform
				scaleMod = 100.0
				responseFunc = sinTime
				timeRate = 3.4906602
				player = 4
			}
		]
	}
]
