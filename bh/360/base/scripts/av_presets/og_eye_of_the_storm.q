OG_Eye_Of_The_Storm = [
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (0.98999995, 0.98999995)
		Color = [
			227
			217
			230
			255
		]
		angle = 0
		angularVel = 0
		BlendMode = add
	}
	{
		type = sprite
		Pos = (0.5, 0.5, 0.0)
		scale = (0.1, 1.0)
		width = 0.5
		height = 0.5
		Color = [
			8
			8
			9
			255
		]
		material = OG_Mat_Sphere_Add
		angle = 0
		angularVel = 2.0944
	}
	{
		type = sprite
		Pos = (0.5, 0.5, 0.0)
		scale = (0.25, 0.5)
		width = 0.5
		height = 0.5
		Color = [
			115
			113
			119
			255
		]
		material = OG_Mat_Sphere_Sub
		angle = 0
		angularVel = 0.27925304
		controls = [
			{
				type = noteHit
				response = greenModulation
				scaleMod = 0.1
				player = 1
				gemColor = green
				fade = 0.25
			}
			{
				type = frequency
				response = scaleXY
				scaleMod = -0.5
				spectrumBand = 10
			}
		]
	}
	{
		type = sprite
		Pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 0.5
		height = 0.5
		Color = [
			70
			58
			50
			194
		]
		material = OG_Mat_Flare_add
		angle = 0
		angularVel = -1.7453301
		controls = [
			{
				type = noteHit
				response = redModulation
				scaleMod = 0.125
				player = 1
				gemColor = red
				fade = 1.0
			}
			{
				type = frequency
				response = scaleXY
				scaleMod = 1.0
				spectrumBand = 0
			}
		]
	}
	{
		type = nStar2
		Pos = (0.5, 0.5, 0.0)
		nPoints = 19
		radius = -0.1
		radius2 = 1.0
		Color = [
			82
			180
			49
			255
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularVel = 2.0944
		controls = [
			{
				type = frequency
				response = radiusScale
				scaleMod = -0.5
				spectrumBand = 4
			}
		]
	}
]
