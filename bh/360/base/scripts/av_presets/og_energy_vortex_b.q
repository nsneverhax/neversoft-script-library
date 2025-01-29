OG_Energy_Vortex_B = [
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
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.01
		Color = [
			255
			255
			255
			255
		]
		BlendMode = brighten
		thickness = 10.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = radiusScale
				scaleMod = 1.0
				player = 1
				fade = 0.5
			}
			{
				type = waveform
				response = deform
				scaleMod = 500.0
			}
		]
	}
	{
		type = sprite
		Pos = (0.5, 0.5, 0.0)
		scale = (0.0, 0.0)
		width = 0.5
		height = 0.5
		Color = [
			255
			180
			180
			255
		]
		material = OG_Mat_Sphere_Bright
		angle = 0
		angularVel = 1.7453301
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
				response = scaleXY
				scaleMod = 1.0
				player = 1
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
			46
			24
			24
			255
		]
		BlendMode = brighten
		thickness = 1.0
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
			130
			86
			46
			255
		]
		material = OG_Mat_Sphere_Add
		angle = 0
		angularVel = -0.54105204
	}
	{
		type = sprite
		Pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 0.5
		height = 0.5
		Color = [
			202
			193
			235
			139
		]
		material = OG_Mat_Sphere_B_Sub
		angle = 0
		angularVel = 0.523599
		controls = [
			{
				type = frequency
				response = scaleXY
				scaleMod = -0.5
				spectrumBand = 10
			}
		]
	}
]
