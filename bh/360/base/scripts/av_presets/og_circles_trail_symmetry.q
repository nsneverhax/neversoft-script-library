OG_Circles_Trail_Symmetry = [
	{
		type = blendPrev
		offset = (0.01, 0.0)
		scale = (-0.95, -1.1)
		Color = [
			255
			255
			255
			229
		]
		angle = 0.0
		angularVel = 0.0
		BlendMode = add
		controls = [
		]
	}
	{
		type = circle
		Pos = (0.75, 0.5, 0.0)
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
				scaleMod = 10.0
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
			66
			84
			141
			127
		]
		BlendMode = diffuse
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
			207
			154
			143
			0
		]
		BlendMode = diffuse
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
		Pos = (0.75, 0.5, 0.0)
		radius = 0.3
		Color = [
			114
			106
			98
			255
		]
		BlendMode = brighten
		thickness = 20.0
		angle = 0
		angularVel = 0
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
