JOW_Jam_4P_RainbowRoad = [
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (0.92999995, 0.97999996)
		Color = [
			255
			255
			255
			253
		]
		angle = 0
		angularVel = 0.0
		BlendMode = blend
		controls = [
		]
	}
	{
		type = sprite
		Pos = (0.499, 1.0)
		scale = (1.0, 1.0)
		width = 0.1
		height = 1.0
		Color = [
			255
			255
			255
			0
		]
		material = OG_Mat_Sphere_Add
		angle = 0
		angularVel = -0.00349066
		controls = [
			{
				type = constant
				response = hueModulation
				scaleMod = 0.5
				responseFunc = cosTime
			}
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 0.04
				player = 3
				fade = 1.0
			}
			{
				type = noteHit
				response = scaleXY
				scaleMod = 0.1
				player = 3
				fade = 1.0
			}
		]
	}
	{
		type = line
		Pos = (0.499, 0.5, 0.0)
		length = 0.4
		Color = [
			0
			255
			255
			255
		]
		BlendMode = blend
		thickness = 1.0
		angle = 4.71239
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 100.0
				deformWindowStart = 3
				spectrumBand = 24
			}
			{
				type = constant
				response = hueModulation
				scaleMod = 0.5
				responseFunc = cosTime
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.4
		Color = [
			0
			255
			255
			255
		]
		BlendMode = blend
		thickness = 1.0
		angle = 4.71239
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = -100.0
				deformWindowStart = 3
				spectrumBand = 0
			}
			{
				type = constant
				response = hueModulation
				scaleMod = 0.5
				responseFunc = cosTime
			}
		]
	}
	{
		type = circle
		Pos = (0.499, -0.8, 0.0)
		radius = 0.65000004
		Color = [
			255
			255
			255
			0
		]
		BlendMode = brighten
		thickness = 2.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = radiusScale
				scaleMod = 0.05
				player = 4
				fade = 1.0
			}
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				player = 4
				fade = 1.0
			}
			{
				type = waveform
				response = deform
				scaleMod = 100.0
			}
		]
	}
	{
		type = circle
		Pos = (0.499, 0.3, 0.0)
		radius = 0.0
		Color = [
			255
			255
			255
			255
		]
		BlendMode = brighten
		thickness = 2.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = radiusScale
				scaleMod = 0.05
				player = 1
				fade = 1.0
			}
			{
				type = waveform
				response = deform
				scaleMod = 50.0
				player = 1
			}
		]
	}
	{
		type = circle
		Pos = (0.499, 0.7, 0.0)
		radius = 0.0
		Color = [
			255
			255
			255
			255
		]
		BlendMode = brighten
		thickness = 2.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = radiusScale
				scaleMod = 0.05
				player = 1
				fade = 1.0
			}
			{
				type = waveform
				response = deform
				scaleMod = 50.0
				player = 1
			}
		]
	}
	{
		type = hypotrochoid
		Pos = (0.499, 0.5, 0.0)
		scale = (0.5, 0.5)
		length = 0.15
		InnerRadius = 0.15
		outerRadius = 0.35000002
		Color = [
			102
			102
			102
			0
		]
		material = OG_Mat_Flare_add
		thickness = 60.0
		angularVel = 1.7453301
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				player = 2
				fade = 1.0
			}
			{
				type = noteHit
				response = scaleXY
				scaleMod = 0.1
				player = 2
				fade = 1.0
			}
		]
	}
	{
		type = hypotrochoid
		Pos = (0.499, 0.5, 0.0)
		scale = (0.5, 0.5)
		length = 0.15
		InnerRadius = 0.15
		outerRadius = 0.35000002
		Color = [
			102
			102
			102
			0
		]
		material = OG_Mat_Flare_add
		thickness = 60.0
		angularVel = -1.7453301
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				player = 2
				fade = 1.0
			}
			{
				type = noteHit
				response = scaleXY
				scaleMod = 0.1
				player = 2
				fade = 1.0
			}
		]
	}
]
