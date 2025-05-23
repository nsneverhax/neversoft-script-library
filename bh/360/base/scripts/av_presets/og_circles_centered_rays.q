OG_Circles_Centered_Rays = [
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (0.9, 0.9)
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
		type = nStar2
		Pos = (0.5, 0.5, 0.0)
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
		Pos = (0.5, 0.5, 0.0)
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
				player = 1
				gemColor = green
				fade = 1.0
			}
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				player = 1
				gemColor = green
				fade = 1.0
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
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
				player = 1
				gemColor = red
				fade = 1.0
			}
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				player = 1
				gemColor = red
				fade = 1.0
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
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
				player = 1
				gemColor = yellow
				fade = 1.0
			}
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				player = 1
				gemColor = yellow
				fade = 1.0
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
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
				player = 1
				gemColor = blue
				fade = 1.0
			}
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				player = 1
				gemColor = blue
				fade = 1.0
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
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
				player = 1
				gemColor = orange
				fade = 1.0
			}
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				player = 1
				gemColor = orange
				fade = 1.0
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
	{
		type = nStar2
		Pos = (0.5, 0.5, 0.0)
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
]
