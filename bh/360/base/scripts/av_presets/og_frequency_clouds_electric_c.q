OG_Frequency_Clouds_Electric_C = [
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (0.98999995, 0.98999995)
		Color = [
			242
			240
			240
			255
		]
		angle = 0.0
		angularVel = 0
		BlendMode = blend
		controls = [
		]
	}
	{
		type = line
		Pos = (0.75, 0.5, 0.0)
		length = 0.5
		Color = [
			219
			161
			255
			0
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 200.0
				spectrumBand = 0
			}
			{
				type = beatOn
				response = alphaModulation
				scaleMod = 1.0
				fade = 0.1
			}
		]
	}
	{
		type = line
		Pos = (0.25, 0.5, 0.0)
		length = -0.5
		Color = [
			106
			149
			255
			0
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = -100.0
				spectrumBand = 0
			}
			{
				type = beatOn
				response = alphaModulation
				scaleMod = 1.0
				fade = 0.1
			}
		]
	}
	{
		type = line
		Pos = (0.25, 0.5, 0.0)
		length = -0.5
		Color = [
			219
			161
			255
			0
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = -200.0
				spectrumBand = 0
			}
			{
				type = beatOn
				response = alphaModulation
				scaleMod = 1.0
				fade = 0.1
			}
		]
	}
	{
		type = line
		Pos = (0.75, 0.5, 0.0)
		length = 0.5
		Color = [
			106
			149
			255
			0
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 100.0
				spectrumBand = 0
			}
			{
				type = beatOn
				response = alphaModulation
				scaleMod = 1.0
				fade = 0.1
			}
		]
	}
	{
		type = line
		Pos = (0.75, 0.5, 0.0)
		length = 0.5
		Color = [
			219
			161
			255
			0
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = -200.0
				spectrumBand = 0
			}
			{
				type = beatOn
				response = alphaModulation
				scaleMod = 1.0
				fade = 0.1
			}
		]
	}
	{
		type = line
		Pos = (0.25, 0.5, 0.0)
		length = -0.5
		Color = [
			106
			149
			255
			0
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 100.0
				spectrumBand = 0
			}
			{
				type = beatOn
				response = alphaModulation
				scaleMod = 1.0
				fade = 0.1
			}
		]
	}
	{
		type = line
		Pos = (0.25, 0.5, 0.0)
		length = -0.5
		Color = [
			219
			161
			255
			0
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = 200.0
				spectrumBand = 0
			}
			{
				type = beatOn
				response = alphaModulation
				scaleMod = 1.0
				fade = 0.1
			}
		]
	}
	{
		type = line
		Pos = (0.75, 0.5, 0.0)
		length = 0.5
		Color = [
			106
			149
			255
			0
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				scaleMod = -100.0
				spectrumBand = 0
			}
			{
				type = beatOn
				response = alphaModulation
				scaleMod = 1.0
				fade = 0.1
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.001
		Color = [
			255
			245
			182
			0
		]
		BlendMode = brighten
		thickness = 2.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency_History
				response = deform
				scaleMod = 600.0
				spectrumBand = 2
			}
			{
				type = beatOn
				response = alphaModulation
				scaleMod = 1.0
				fade = 0.1
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.1
		Color = [
			255
			110
			0
			255
		]
		BlendMode = brighten
		thickness = 2.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = frequency_History
				response = deform
				scaleMod = 600.0
				spectrumBand = 1
			}
		]
	}
	{
		type = sprite
		Pos = (0.5, 0.5, 0.0)
		scale = (0.5, 0.5)
		width = 0.5
		height = 0.5
		Color = [
			241
			214
			255
			0
		]
		material = OG_Mat_Sphere_Add
		angle = 0
		angularVel = 0.523599
		controls = [
			{
				type = beatOn
				response = alphaModulation
				scaleMod = 0.02
				fade = 1.0
			}
		]
	}
]
