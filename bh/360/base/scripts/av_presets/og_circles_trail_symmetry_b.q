OG_Circles_Trail_Symmetry_B = [
	{
		type = blendPrev
		offset = (0.01, 0.0)
		scale = (-0.95, 1.1)
		Color = [
			255
			255
			255
			204
		]
		angle = 0.0
		angularVel = 0.0
		BlendMode = add
		controls = [
			{
				type = beatOn
				response = redModulation
				scaleMod = 0.1
				fade = 0.1
			}
		]
	}
	{
		type = circle
		Pos = (0.05, 0.5, 0.0)
		radius = 0.5
		Color = [
			31
			31
			63
			255
		]
		BlendMode = add
		thickness = 3.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 50.0
				responseFunc = log10
				spectrumBand = 10
			}
			{
				type = frequency
				response = greenModulation
				scaleMod = 100.0
				spectrumBand = 20
			}
			{
				type = frequency
				response = redModulation
				scaleMod = 100.0
				spectrumBand = 10
			}
			{
				type = frequency
				response = blueModulation
				scaleMod = 50.0
				spectrumBand = 15
			}
		]
	}
	{
		type = circle
		Pos = (0.25, 0.5, 0.0)
		radius = 0.1
		Color = [
			187
			121
			0
			127
		]
		BlendMode = brighten
		thickness = 20.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = redModulation
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
		radius = 0.25
		Color = [
			255
			124
			97
			25
		]
		BlendMode = blend_AlphaDiffuse
		thickness = 15.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = alphaModulation
				scaleMod = 20.0
				spectrumBand = 10
			}
		]
	}
	{
		type = circle
		Pos = (0.8, 0.5, 0.0)
		radius = 0.3
		Color = [
			114
			81
			52
			255
		]
		BlendMode = add
		thickness = 2.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 50.0
				responseFunc = sinLog10
			}
		]
	}
	{
		type = circle
		Pos = (0.125, 0.5, 0.0)
		radius = 0.05
		Color = [
			114
			105
			255
			255
		]
		BlendMode = add
		thickness = 1.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 50.0
				responseFunc = sinLog10
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 1.0
		Color = [
			130
			106
			255
			255
		]
		BlendMode = blend
		thickness = 1.0
		angle = 0.0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 50.0
				responseFunc = sinLog10
			}
		]
	}
]
