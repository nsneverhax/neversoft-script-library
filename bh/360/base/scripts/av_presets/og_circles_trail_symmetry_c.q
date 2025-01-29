OG_Circles_Trail_Symmetry_C = [
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (-0.98999995, 1.1)
		Color = [
			255
			255
			255
			254
		]
		angle = 0.0
		angularVel = 0.0
		BlendMode = add
		controls = [
			{
				type = beatOn
				response = alphaModulation
				scaleMod = 0.1
				fade = 0.25
			}
		]
	}
	{
		type = circle
		Pos = (0.05, 0.25, 0.0)
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
				scaleMod = 250.0
				responseFunc = log10
				spectrumBand = 10
			}
			{
				type = frequency
				response = greenModulation
				scaleMod = 0.5
				spectrumBand = 20
			}
			{
				type = frequency
				response = redModulation
				scaleMod = 0.5
				spectrumBand = 10
			}
			{
				type = frequency
				response = blueModulation
				scaleMod = 0.25
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
				scaleMod = 0.8
				player = 1
				gemColor = red
				fade = 1.0
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.25, 0.0)
		radius = 0.3
		Color = [
			255
			124
			97
			25
		]
		material = OG_Mat_Flare_add
		thickness = 15.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = alphaModulation
				scaleMod = 0.2
				spectrumBand = 10
			}
		]
	}
	{
		type = circle
		Pos = (0.8, 0.5, 0.0)
		radius = 0.31
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
				responseFunc = log10
				spectrumBand = 10
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
				scaleMod = 250.0
			}
		]
	}
]
