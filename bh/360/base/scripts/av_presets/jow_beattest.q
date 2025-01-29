JOW_BeatTest = [
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (0.98999995, 0.98999995)
		Color = [
			255
			255
			255
			254
		]
		angle = 0
		angularVel = 0
		BlendMode = blend
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.2
		Color = [
			255
			255
			255
			255
		]
		BlendMode = blend
		thickness = 1.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = beatOn
				response = radiusScale
				scaleMod = 0.2
				fade = 1.0
			}
		]
	}
]
