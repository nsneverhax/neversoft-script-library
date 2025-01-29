OG_Element_Sparkler = [
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (0.95, 0.85)
		Color = [
			216
			160
			160
			255
		]
		angle = 0
		angularVel = 0
		BlendMode = blend
	}
	{
		type = sprite
		Pos = (0.5, 0.5, 0.0)
		scale = (0.5, 0.5)
		width = 0.5
		height = 0.5
		Color = [
			12
			17
			22
			255
		]
		material = OG_Mat_Sphere_Add
		angle = 0
		angularVel = 0
		controls = [
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
				response = scaleX
				scaleMod = 0.1
				responseFunc = sinTime
				player = 1
				fade = 0.25
			}
			{
				type = noteHit
				response = scaleY
				scaleMod = 0.1
				responseFunc = sinTime
				player = 1
				fade = 0.25
			}
			{
				type = beatOn
				response = brightnessModulation
				scaleMod = 0.1
				fade = 0.5
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
		thickness = 5.0
		angle = 0
		angularVel = 0.872665
		controls = [
			{
				type = frequency
				response = radiusScale
				scaleMod = 0.0
				spectrumBand = 1
			}
		]
	}
	{
		type = nStar2
		Pos = (0.5, 0.5, 0.0)
		nPoints = 19
		radius = -0.1
		radius2 = 0.3
		Color = [
			255
			255
			255
			255
		]
		BlendMode = subtract
		thickness = 2.0
		angle = 0
		angularVel = 2.0944
		controls = [
			{
				type = frequency
				response = radiusScale
				scaleMod = 0.0
				spectrumBand = 1
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.06
		Color = [
			255
			255
			255
			255
		]
		BlendMode = brighten
		thickness = 20.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = radiusScale
				scaleMod = 0.05
				player = 1
				fade = 0.5
			}
		]
	}
	{
		type = sprite
		Pos = (0.5, 0.5, 0.0)
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
]
