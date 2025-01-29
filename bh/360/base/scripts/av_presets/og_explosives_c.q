OG_Explosives_C = [
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (0.9, 0.9)
		Color = [
			144
			106
			187
			229
		]
		angle = 0.052359905
		angularVel = 0
		BlendMode = blend
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (1.0, 1.0)
		Color = [
			40
			5
			0
			254
		]
		angle = 0.0
		angularVel = 6.28319
		BlendMode = subtract
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.001
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
				type = noteHit
				response = radiusScale
				scaleMod = -0.2
				player = 1
				fade = 0.5
			}
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
			51
			51
			51
			255
		]
		BlendMode = add
		thickness = 10.0
		angle = 0
		angularVel = 0.872665
		controls = [
			{
				type = frequency
				response = radiusScale
				scaleMod = 0.1
				spectrumBand = 1
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
			171
			122
			60
			255
		]
		material = OG_Mat_Sphere_Add
		angle = 0
		angularVel = -0.54105204
	}
	{
		type = sprite
		Pos = (0.5, 0.5)
		scale = (1.0, 1.0)
		width = 1.0
		height = 1.0
		Color = [
			128
			96
			235
			204
		]
		material = OG_Mat_Sphere_B_Sub
		angle = 0
		angularVel = 0.523599
		controls = [
			{
				type = beatOn
				response = scaleX
				scaleMod = -1.0
				fade = 0.5
			}
			{
				type = beatOn
				response = scaleY
				scaleMod = 0.2
				fade = 0.5
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
			51
			51
			51
			255
		]
		BlendMode = add
		thickness = 3.0
		angle = 0
		angularVel = 1.0472
		controls = [
			{
				type = frequency
				response = radiusScale
				scaleMod = 0.1
				spectrumBand = 1
			}
		]
	}
]
