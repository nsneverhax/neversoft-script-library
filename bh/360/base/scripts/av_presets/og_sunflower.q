OG_SunFlower = [
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (0.95, 0.95)
		Color = [
			255
			255
			255
			242
		]
		angle = -0.00436332
		angularVel = 0
		BlendMode = add
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.05
		Color = [
			255
			255
			255
			255
		]
		BlendMode = brighten
		thickness = 5.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = radiusScale
				scaleMod = -0.2
				player = 1
				fade = 0.5
			}
		]
	}
	{
		type = sprite
		Pos = (0.5, 0.5, 0.0)
		scale = (0.1, 0.1)
		width = 0.5
		height = 0.5
		Color = [
			17
			11
			0
			255
		]
		material = OG_Mat_Sphere_Add
		angle = 0
		angularVel = -0.523599
		controls = [
			{
				type = noteHit
				response = redModulation
				scaleMod = 0.25
				player = 1
				fade = 0.5
			}
			{
				type = constant
				response = offsetX
				scaleMod = 0.01
				responseFunc = cosTime
			}
			{
				type = constant
				response = offsetY
				scaleMod = 0.01
				responseFunc = sinTime
			}
			{
				type = noteHit
				response = greenModulation
				scaleMod = 0.1
				player = 1
				fade = 0.1
			}
			{
				type = noteHit
				response = scaleX
				scaleMod = 1.0
				responseFunc = sinTime
				player = 1
				fade = 1.0
			}
			{
				type = noteHit
				response = scaleY
				scaleMod = 1.0
				responseFunc = sinTime
				player = 1
				fade = 1.0
			}
			{
				type = beatOn
				response = scaleX
				scaleMod = 0.5
				fade = 0.1
			}
			{
				type = beatOn
				response = scaleY
				scaleMod = 0.5
				fade = 0.1
			}
		]
	}
	{
		type = nStar2
		Pos = (0.5, 0.5, 0.0)
		nPoints = 19
		radius = 0.1
		radius2 = 1.0
		Color = [
			13
			12
			12
			255
		]
		BlendMode = add
		thickness = 1.0
		angle = 0
		angularVel = 0.872665
		controls = [
			{
				type = frequency
				response = radiusScale
				scaleMod = -0.2
				spectrumBand = 1
			}
		]
	}
]
