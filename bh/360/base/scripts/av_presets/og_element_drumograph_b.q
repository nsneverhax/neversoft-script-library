OG_Element_Drumograph_B = [
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.3
		Color = [
			255
			255
			255
			255
		]
		BlendMode = subtract
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
			0
			8
			17
			255
		]
		material = OG_Mat_Sphere_Add
		angle = 0
		angularVel = 0
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
		]
	}
	{
		type = nStar2
		Pos = (0.5, 0.5, 0.0)
		nPoints = 19
		radius = 0.1
		radius2 = 1.0
		Color = [
			255
			255
			255
			255
		]
		BlendMode = brighten
		thickness = 10.0
		angle = 0
		angularVel = 0.872665
		controls = [
			{
				type = frequency
				response = radiusScale
				scaleMod = 1.0
				responseFunc = log2
				spectrumBand = 1
			}
		]
	}
	{
		type = nStar2
		Pos = (0.5, 0.5, 0.0)
		nPoints = 19
		radius = 0.1
		radius2 = 0.1
		Color = [
			255
			255
			255
			255
		]
		BlendMode = subtract
		thickness = 10.0
		angle = 0
		angularVel = 2.0944
		controls = [
			{
				type = frequency
				response = radiusScale
				scaleMod = 0.5
				responseFunc = log2
				spectrumBand = 1
			}
		]
	}
]
