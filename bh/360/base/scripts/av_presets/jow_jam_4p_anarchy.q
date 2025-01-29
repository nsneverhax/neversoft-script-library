JOW_Jam_4P_Anarchy = [
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (0.95, 0.95)
		Color = [
			242
			242
			242
			254
		]
		angle = 0
		angularVel = 0
		BlendMode = blend
	}
	{
		type = nStar2
		Pos = (0.5, 0.4, 0.0)
		nPoints = 5
		radius = 0.01
		radius2 = 0.5
		Color = [
			123
			150
			255
			255
		]
		BlendMode = blend_AlphaDiffuse
		thickness = 1.0
		angle = 0
		angularVel = 1.7453301
		controls = [
		]
	}
	{
		type = circle
		Pos = (0.5, 0.4, 0.0)
		radius = 0.01
		Color = [
			31
			215
			0
			0
		]
		BlendMode = brighten
		thickness = 10.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = radiusScale
				scaleMod = 0.125
				player = 2
				gemColor = green
				fade = 1.0
			}
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				player = 2
				gemColor = green
				fade = 1.0
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.4, 0.0)
		radius = 0.01
		Color = [
			211
			0
			0
			0
		]
		BlendMode = brighten
		thickness = 10.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = radiusScale
				scaleMod = 0.125
				player = 2
				gemColor = red
				fade = 1.0
			}
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				player = 2
				gemColor = red
				fade = 1.0
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.4, 0.0)
		radius = 0.01
		Color = [
			255
			220
			0
			0
		]
		BlendMode = brighten
		thickness = 10.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = radiusScale
				scaleMod = 0.125
				player = 2
				gemColor = yellow
				fade = 1.0
			}
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				player = 2
				gemColor = yellow
				fade = 1.0
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.4, 0.0)
		radius = 0.01
		Color = [
			0
			62
			255
			0
		]
		BlendMode = brighten
		thickness = 10.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = radiusScale
				scaleMod = 0.125
				player = 2
				gemColor = blue
				fade = 1.0
			}
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				player = 2
				gemColor = blue
				fade = 1.0
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.4, 0.0)
		radius = 0.01
		Color = [
			255
			143
			0
			0
		]
		BlendMode = brighten
		thickness = 10.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = radiusScale
				scaleMod = 0.125
				player = 2
				gemColor = orange
				fade = 1.0
			}
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				player = 2
				gemColor = orange
				fade = 1.0
			}
		]
	}
	{
		type = sprite
		Pos = (0.5, 0.4)
		scale = (1.0, 1.0)
		width = 0.2
		height = 0.2
		Color = [
			255
			255
			255
			255
		]
		material = OG_Mat_flare_sub
		angle = 0
		angularVel = 0
	}
	{
		type = nStar2
		Pos = (0.5, 0.4, 0.0)
		nPoints = 5
		radius = 0.01
		radius2 = 0.5
		Color = [
			123
			150
			255
			255
		]
		BlendMode = blend_AlphaDiffuse
		thickness = 1.0
		angle = 0
		angularVel = -1.7453301
		controls = [
		]
	}
	{
		type = sprite
		Pos = (0.5, 0.4)
		scale = (1.0, 1.0)
		width = 0.5
		height = 0.5
		Color = [
			3
			1
			2
			127
		]
		material = JOW_Mat_Anarchy01_Add
		angle = 0
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = brightnessModulation
				scaleMod = 0.1
				player = 4
				fade = 0.2
			}
			{
				type = constant
				response = offsetX
				scaleMod = 0.2
				responseFunc = sinTime
				timeOffset = 0.00933751
				timeRate = 0.523599
			}
			{
				type = constant
				response = offsetY
				scaleMod = 0.15
				responseFunc = cosTime
				timeOffset = 0.00436332
				timeRate = 0.523599
			}
		]
	}
	{
		type = sprite
		Pos = (0.3, 0.35000002)
		scale = (1.0, 1.0)
		width = 0.05
		height = 0.075
		Color = [
			87
			126
			224
			0
		]
		material = JOW_Mat_CardsClubs01_Blend
		angle = 0.296706
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = scaleXY
				scaleMod = 2.0
				player = 1
				gemColor = green
				fade = 0.2
			}
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 0.7
				player = 1
				gemColor = green
				fade = 0.2
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = -0.24000001
				player = 1
				gemColor = green
				fade = 0.2
			}
			{
				type = constant
				response = offsetX
				scaleMod = 0.1
				responseFunc = sinTime
				timeOffset = 0.00933751
				timeRate = 1.2217301
			}
			{
				type = constant
				response = offsetY
				scaleMod = 0.05
				responseFunc = cosTime
				timeOffset = 0.00436332
				timeRate = 0.61086506
			}
			{
				type = noteHit
				response = scaleXY
				scaleMod = 2.0
				player = 1
				gemColor = open
				fade = 0.2
			}
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 0.7
				player = 1
				gemColor = open
				fade = 0.2
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = 0.15
				player = 1
				gemColor = open
				fade = 0.2
			}
		]
	}
	{
		type = sprite
		Pos = (0.7, 0.3)
		scale = (1.0, 1.0)
		width = 0.04
		height = 0.06
		Color = [
			87
			126
			224
			0
		]
		material = JOW_Mat_CardsDiamonds01_Blend
		angle = -0.15708001
		angularVel = 0
		controls = [
			{
				type = constant
				response = offsetX
				scaleMod = 0.1
				responseFunc = sinTime
				timeOffset = 0.0133256
				timeRate = 1.39626
			}
			{
				type = constant
				response = offsetY
				scaleMod = 0.05
				responseFunc = cosTime
				timeOffset = 0.019198598
				timeRate = 0.523599
			}
			{
				type = noteHit
				response = scaleXY
				scaleMod = 2.0
				player = 1
				gemColor = red
				fade = 0.2
			}
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 0.7
				player = 1
				gemColor = red
				fade = 0.2
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = -0.61
				player = 1
				gemColor = red
				fade = 0.2
			}
			{
				type = noteHit
				response = scaleXY
				scaleMod = 2.0
				player = 1
				gemColor = open
				fade = 0.2
			}
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 0.7
				player = 1
				gemColor = open
				fade = 0.2
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = 0.15
				player = 1
				gemColor = open
				fade = 0.2
			}
		]
	}
	{
		type = sprite
		Pos = (0.4, 0.3)
		scale = (1.0, 1.0)
		width = 0.04
		height = 0.06
		Color = [
			87
			126
			224
			0
		]
		material = JOW_Mat_CardsSpades01_Blend
		angle = -0.20944001
		angularVel = 0
		controls = [
			{
				type = constant
				response = offsetX
				scaleMod = 0.1
				responseFunc = sinTime
				timeOffset = 0.00061086507
				timeRate = 0.69813204
			}
			{
				type = constant
				response = offsetY
				scaleMod = 0.05
				responseFunc = cosTime
				timeOffset = 0.0296706
				timeRate = 1.2217301
			}
			{
				type = noteHit
				response = scaleXY
				scaleMod = 2.0
				player = 1
				gemColor = yellow
				fade = 0.2
			}
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 0.7
				player = 1
				gemColor = yellow
				fade = 0.2
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = -0.47
				player = 1
				gemColor = yellow
				fade = 0.2
			}
			{
				type = noteHit
				response = scaleXY
				scaleMod = 2.0
				player = 1
				gemColor = orange
				fade = 0.2
			}
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 0.7
				player = 1
				gemColor = orange
				fade = 0.2
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = -0.54
				player = 1
				gemColor = orange
				fade = 0.2
			}
		]
	}
	{
		type = sprite
		Pos = (0.6, 0.35000002)
		scale = (1.0, 1.0)
		width = 0.05
		height = 0.075
		Color = [
			87
			126
			224
			0
		]
		material = JOW_Mat_CardsHearts01_Blend
		angle = 0.418879
		angularVel = 0
		controls = [
			{
				type = constant
				response = offsetX
				scaleMod = 0.1
				responseFunc = sinTime
				timeOffset = 0.00061086507
				timeRate = 0.95993096
			}
			{
				type = constant
				response = offsetY
				scaleMod = 0.05
				responseFunc = cosTime
				timeOffset = 0.0296706
				timeRate = 1.0472
			}
			{
				type = noteHit
				response = scaleXY
				scaleMod = 2.0
				player = 1
				gemColor = blue
				fade = 0.2
			}
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 0.7
				player = 1
				gemColor = blue
				fade = 0.2
			}
			{
				type = noteHit
				response = scaleXY
				scaleMod = 2.0
				player = 1
				gemColor = orange
				fade = 0.2
			}
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 0.7
				player = 1
				gemColor = orange
				fade = 0.2
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = -0.54
				player = 1
				gemColor = orange
				fade = 0.2
			}
		]
	}
	{
		type = hypotrochoid
		Pos = (0.5, 0.4, 0.0)
		scale = (1.0, 1.0)
		length = 0.3
		InnerRadius = 0.1
		outerRadius = 0.3
		Color = [
			66
			153
			99
			0
		]
		material = JOW_Mat_Star01_Add
		thickness = 60.0
		angularVel = 6.28319
		controls = [
			{
				type = noteHit
				response = brightnessModulation
				scaleMod = 1.0
				player = 3
				fade = 0.1
			}
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				player = 3
				fade = 0.1
			}
			{
				type = frequency
				response = radiusScale
				scaleMod = 0.1
				spectrumBand = 24
			}
		]
	}
]
