JOW_Jam_4P_SkullLightning = [
	{
		type = blendPrev
		offset = (0.0, -0.02)
		scale = (1.03, 0.997)
		Color = [
			255
			255
			255
			243
		]
		angle = 0
		angularVel = 0.0
		BlendMode = blend
	}
	{
		type = nStar2
		Pos = (0.0, 1.0, 0.0)
		nPoints = 5
		radius = -0.5
		radius2 = 0.5
		Color = [
			66
			9
			9
			255
		]
		BlendMode = blend
		thickness = 2.0
		angle = -0.349066
		angularVel = 0
		controls = [
			{
				type = frequency
				response = radiusScale
				scaleMod = 1.0
				spectrumBand = 1
			}
			{
				type = noteHit
				response = brightnessModulation
				scaleMod = 0.5
				player = 1
				fade = 0.1
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = 0.09
				player = 1
				gemColor = orange
				fade = 0.1
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = 0.63
				player = 1
				gemColor = blue
				fade = 0.1
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = 0.13499999
				player = 1
				gemColor = yellow
				fade = 0.1
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = 0.33
				player = 1
				gemColor = green
				fade = 0.1
			}
		]
	}
	{
		type = nStar2
		Pos = (1.0, 1.0, 0.0)
		nPoints = 5
		radius = -0.5
		radius2 = 0.5
		Color = [
			66
			9
			9
			255
		]
		BlendMode = blend
		thickness = 2.0
		angle = 0.349066
		angularVel = 0
		controls = [
			{
				type = frequency
				response = radiusScale
				scaleMod = 1.0
				spectrumBand = 1
			}
			{
				type = noteHit
				response = brightnessModulation
				scaleMod = 0.5
				player = 1
				fade = 0.1
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = 0.09
				player = 1
				gemColor = orange
				fade = 0.1
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = 0.63
				player = 1
				gemColor = blue
				fade = 0.1
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = 0.13499999
				player = 1
				gemColor = yellow
				fade = 0.1
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = 0.33
				player = 1
				gemColor = green
				fade = 0.1
			}
		]
	}
	{
		type = sprite
		Pos = (0.15, 0.4)
		scale = (1.0, 1.0)
		width = -0.1
		height = 0.35000002
		Color = [
			77
			61
			215
			38
		]
		material = JOW_Mat_Lightning01_Blend
		angle = 0
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 0.45000002
				player = 3
				fade = 0.1
			}
			{
				type = noteHit
				response = scaleXY
				scaleMod = 0.5
				player = 3
				fade = 0.1
			}
			{
				type = frequency
				response = offsetX
				scaleMod = 0.2
				spectrumBand = 48
			}
		]
	}
	{
		type = sprite
		Pos = (0.85, 0.4)
		scale = (1.0, 1.0)
		width = 0.1
		height = 0.35000002
		Color = [
			77
			61
			215
			38
		]
		material = JOW_Mat_Lightning01_Blend
		angle = 0
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 0.45000002
				player = 3
				fade = 0.1
			}
			{
				type = noteHit
				response = scaleXY
				scaleMod = 0.5
				player = 3
				fade = 0.1
			}
			{
				type = frequency
				response = offsetX
				scaleMod = -0.2
				spectrumBand = 48
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.03
		Color = [
			26
			26
			26
			255
		]
		BlendMode = brighten
		thickness = 6.0
		angle = 0.0
		angularVel = -1.27409
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 200.0
				deformWindowStart = 5
				spectrumBand = 1
			}
			{
				type = frequency
				response = brightnessModulation
				scaleMod = 0.1
				spectrumBand = 1
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.1
		Color = [
			26
			26
			26
			255
		]
		BlendMode = brighten
		thickness = 6.0
		angle = 1.5708001
		angularVel = 0.872665
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 200.0
				deformWindowStart = 5
				spectrumBand = 1
			}
			{
				type = frequency
				response = brightnessModulation
				scaleMod = 0.1
				spectrumBand = 1
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.15
		Color = [
			26
			26
			26
			255
		]
		BlendMode = brighten
		thickness = 6.0
		angle = 1.2566401
		angularVel = -0.75049204
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 200.0
				deformWindowStart = 5
				spectrumBand = 1
			}
			{
				type = frequency
				response = brightnessModulation
				scaleMod = 0.1
				spectrumBand = 1
			}
		]
	}
	{
		type = circle
		Pos = (0.05, 0.8, 0.0)
		radius = 0.03
		Color = [
			83
			47
			21
			0
		]
		BlendMode = add
		thickness = 12.0
		angle = 1.5708001
		angularVel = 0.69813204
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 200.0
				deformWindowStart = 5
				spectrumBand = 1
			}
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 0.7
				player = 4
				fade = 0.1
			}
		]
	}
	{
		type = circle
		Pos = (0.05, 0.8, 0.0)
		radius = 0.1
		Color = [
			51
			51
			51
			255
		]
		BlendMode = brighten
		thickness = 6.0
		angle = 1.2566401
		angularVel = -0.75049204
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 200.0
				deformWindowStart = 5
				spectrumBand = 1
			}
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 0.7
				player = 4
				fade = 0.1
			}
		]
	}
	{
		type = sprite
		Pos = (0.5, 0.5)
		scale = (1.0, 1.0)
		width = 0.7
		height = 0.7
		Color = [
			44
			22
			10
			38
		]
		material = JOW_Mat_Skull01_Add
		angle = 0
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 0.4
				player = 2
				fade = 0.05
			}
			{
				type = noteHit
				response = scaleXY
				scaleMod = 0.4
				player = 2
				fade = 0.05
			}
			{
				type = constant
				response = scaleXY
				scaleMod = 0.2
				responseFunc = sinTime
				timeRate = 0.872665
			}
			{
				type = constant
				response = offsetX
				scaleMod = 0.1
				responseFunc = sinTime
				timeRate = 0.872665
			}
			{
				type = constant
				response = offsetY
				scaleMod = 0.1
				responseFunc = cosTime
				timeRate = 0.872665
			}
		]
	}
	{
		type = circle
		Pos = (0.95, 0.8, 0.0)
		radius = 0.03
		Color = [
			83
			47
			21
			0
		]
		BlendMode = add
		thickness = 12.0
		angle = 1.5708001
		angularVel = 0.69813204
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 200.0
				deformWindowStart = 5
				spectrumBand = 1
			}
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 0.7
				player = 4
				fade = 0.1
			}
		]
	}
	{
		type = circle
		Pos = (0.95, 0.8, 0.0)
		radius = 0.1
		Color = [
			51
			51
			51
			255
		]
		BlendMode = brighten
		thickness = 6.0
		angle = 1.2566401
		angularVel = -0.75049204
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 200.0
				deformWindowStart = 5
				spectrumBand = 1
			}
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 0.7
				player = 4
				fade = 0.1
			}
		]
	}
]
