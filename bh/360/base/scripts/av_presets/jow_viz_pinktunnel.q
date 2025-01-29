JOW_Viz_PinkTunnel = [
	{
		type = blendPrev
		offset = (0.0, 0.003)
		scale = (0.96999997, 0.96999997)
		Color = [
			254
			254
			254
			255
		]
		angle = 0
		angularVel = 0
		BlendMode = blend
	}
	{
		type = circle
		Pos = (0.5, 0.4, 0.0)
		radius = 0.03
		Color = [
			160
			255
			197
			0
		]
		BlendMode = blend
		thickness = 6.0
		angle = 0.0
		angularVel = 1.39626
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				player = 1
				fade = 0.05
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = -0.4
				player = 1
				gemColor = red
				fade = 0.1
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = -0.26
				player = 1
				gemColor = yellow
				fade = 0.1
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = 0.23
				player = 1
				gemColor = blue
				fade = 0.1
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = -0.33
				player = 1
				gemColor = orange
				fade = 0.1
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.4, 0.0)
		length = 0.1
		Color = [
			255
			255
			255
			255
		]
		BlendMode = subtract
		thickness = 8.0
		angle = 0
		angularVel = 1.0
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				player = 1
				fade = 0.05
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.4, 0.0)
		length = 0.1
		Color = [
			255
			255
			255
			255
		]
		BlendMode = subtract
		thickness = 8.0
		angle = 0.523599
		angularVel = 1.0
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				player = 1
				fade = 0.05
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.4, 0.0)
		length = 0.1
		Color = [
			255
			255
			255
			255
		]
		BlendMode = subtract
		thickness = 8.0
		angle = -0.523599
		angularVel = 1.0
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				player = 1
				fade = 0.05
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.4, 0.0)
		length = 0.1
		Color = [
			255
			255
			255
			255
		]
		BlendMode = subtract
		thickness = 8.0
		angle = 1.0472
		angularVel = 1.0
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				player = 1
				fade = 0.05
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.4, 0.0)
		length = 0.1
		Color = [
			255
			255
			255
			255
		]
		BlendMode = subtract
		thickness = 8.0
		angle = -1.0472
		angularVel = 1.0
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				player = 1
				fade = 0.05
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.4, 0.0)
		length = 0.1
		Color = [
			255
			255
			255
			255
		]
		BlendMode = subtract
		thickness = 8.0
		angle = 1.5708001
		angularVel = 1.0
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				player = 1
				fade = 0.05
			}
		]
	}
	{
		type = nStar2
		Pos = (0.5, 0.4, 0.0)
		nPoints = 4
		radius = 0.05
		radius2 = 0.07
		Color = [
			68
			179
			179
			255
		]
		BlendMode = blend
		thickness = 0.5
		angle = 0
		angularVel = 0.69813204
		controls = [
			{
				type = constant
				response = hueModulation
				scaleMod = 0.2
				responseFunc = sinTime
				timeRate = 1.9198599
			}
			{
				type = beatOn
				response = radius2Scale
				scaleMod = 0.02
				fade = 1.0
			}
			{
				type = beatOn
				response = radiusScale
				scaleMod = 0.0139999995
				fade = 1.0
			}
		]
	}
	{
		type = nStar2
		Pos = (0.5, 0.4, 0.0)
		nPoints = 16
		radius = 0.25
		radius2 = 0.25
		Color = [
			134
			96
			255
			63
		]
		BlendMode = add
		thickness = 0.75
		angle = 2.0944
		angularVel = 0.17453298
		controls = [
			{
				type = frequency
				response = radiusScale
				scaleMod = 0.14
				spectrumBand = 24
			}
		]
	}
	{
		type = nStar2
		Pos = (0.5, 0.4, 0.0)
		nPoints = 8
		radius = 0.15
		radius2 = 0.15
		Color = [
			174
			97
			255
			255
		]
		BlendMode = blend
		thickness = 0.75
		angle = 1.0472
		angularVel = 0.349066
		controls = [
			{
				type = constant
				response = hueModulation
				scaleMod = 0.2
				responseFunc = sinTime
				timeRate = 1.5708001
			}
		]
	}
	{
		type = hypotrochoid
		Pos = (0.5, 0.4, 0.0)
		scale = (1.6, 1.6)
		length = 0.3
		InnerRadius = 0.1
		outerRadius = 0.3
		Color = [
			255
			110
			240
			51
		]
		material = OG_Mat_Flare_add
		thickness = 40.0
		angularVel = 6.28319
		controls = [
			{
				type = frequency
				response = radiusScale
				scaleMod = 0.1
				spectrumBand = 24
			}
			{
				type = constant
				response = hueModulation
				scaleMod = 0.2
				responseFunc = sinTime
			}
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				player = 3
				fade = 0.1
			}
		]
	}
	{
		type = nStar2
		Pos = (0.5, 0.4, 0.0)
		nPoints = 8
		radius = 0.15
		radius2 = 0.15
		Color = [
			174
			97
			255
			0
		]
		BlendMode = add
		thickness = 3.0
		angle = 1.0472
		angularVel = 0.349066
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				player = 1
				fade = 0.05
			}
			{
				type = constant
				response = hueModulation
				scaleMod = 0.2
				responseFunc = sinTime
				timeRate = 1.5708001
			}
		]
	}
	{
		type = nStar2
		Pos = (0.5, 0.4, 0.0)
		nPoints = 16
		radius = 0.25
		radius2 = 0.25
		Color = [
			134
			96
			255
			0
		]
		BlendMode = add
		thickness = 3.0
		angle = 2.0944
		angularVel = 0.17453298
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				player = 2
				fade = 0.05
			}
		]
	}
]
