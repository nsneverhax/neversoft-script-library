OG_Explosives_F = [
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.0
		Color = [
			255
			255
			255
			255
		]
		BlendMode = brighten
		thickness = 3.0
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
		type = nStar2
		Pos = (0.5, 0.5, 0.0)
		nPoints = 19
		radius = 0.1
		radius2 = 1.0
		Color = [
			46
			24
			24
			255
		]
		BlendMode = add
		thickness = 5.0
		angle = 0
		angularVel = 0.872665
		controls = [
			{
				type = frequency
				response = radiusScale
				scaleMod = 0.1
				responseFunc = log10
				spectrumBand = 1
			}
		]
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (0.9, 0.9)
		Color = [
			246
			238
			255
			229
		]
		angle = 0.052359905
		angularVel = 0
		BlendMode = blend
	}
	{
		type = sprite
		Pos = (0.5, 0.5, 0.0)
		scale = (0.1, 0.1)
		width = 0.5
		height = 0.5
		Color = [
			171
			122
			60
			255
		]
		material = OG_Mat_Sphere_Add
		angle = 0
		angularVel = -0.54105204
		controls = [
			{
				type = noteHit
				response = scaleX
				scaleMod = 0.4
				responseFunc = sinLog10
				player = 1
				fade = 0.2
			}
			{
				type = noteHit
				response = scaleY
				scaleMod = 0.4
				responseFunc = sinLog10
				player = 1
				fade = 0.2
			}
		]
	}
	{
		type = sprite
		Pos = (0.5, 0.5, 0.0)
		scale = (0.1, 0.1)
		width = 1.0
		height = 1.0
		Color = [
			237
			231
			255
			204
		]
		material = OG_Mat_Sphere_B_Sub
		angle = 0
		angularVel = 3.1415896
		controls = [
			{
				type = constant
				response = scaleX
				scaleMod = 0.5
				responseFunc = sinTime
				timeRate = 1.0472
			}
			{
				type = constant
				response = scaleY
				scaleMod = 0.5
				responseFunc = cosTime
				timeRate = 1.0472
			}
		]
	}
	{
		type = nStar2
		Pos = (0.5, 0.5, 0.0)
		nPoints = 19
		radius = -1.0
		radius2 = 0.1
		Color = [
			46
			24
			24
			255
		]
		BlendMode = add
		thickness = 5.0
		angle = 0
		angularVel = 1.0472
		controls = [
			{
				type = frequency
				response = radiusScale
				scaleMod = 0.1
				responseFunc = log10
				spectrumBand = 1
			}
		]
	}
]
