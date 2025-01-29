OG_Vocal_Comet_Enhanced = [
	{
		type = hypotrochoid
		Pos = (0.9, 0.0, 0.0)
		length = 0.05
		InnerRadius = 0.2
		outerRadius = 0.1
		Color = [
			255
			248
			205
			0
		]
		material = OG_Mat_LenzFlare_Add
		BlendMode = blend_AlphaDiffuse
		thickness = 30.0
		angularVel = 523.599
		controls = [
			{
				type = vocalspitch
				response = offsetY
				scaleMod = 1.0
			}
		]
	}
	{
		type = sprite
		Pos = (0.9, 0.0, 0.0)
		scale = (2.5, 5.0)
		width = 0.05
		height = 0.05
		Color = [
			255
			124
			58
			166
		]
		material = OG_Mat_Flare_add
		BlendMode = blend
		angle = 0
		angularVel = 0
		controls = [
			{
				type = vocalspitch
				response = offsetY
				scaleMod = 1.0
			}
			{
				type = vocalsnoteon
				response = greenModulation
				scaleMod = 0.5
			}
			{
				type = vocalsnoteon
				response = redModulation
				scaleMod = -0.5
			}
		]
	}
	{
		type = hypotrochoid
		Pos = (0.8, 0.0, 0.0)
		length = 0.0125
		InnerRadius = 0.125
		outerRadius = 0.05
		Color = [
			255
			202
			57
			0
		]
		material = OG_Mat_Flare_add
		BlendMode = blend
		thickness = 101.0
		angularVel = 10
		controls = [
			{
				type = vocalsamplitude
				response = alphaModulation
				scaleMod = 1.0
			}
			{
				type = vocalspitch
				response = offsetY
				scaleMod = 1.0
			}
		]
	}
	{
		type = hypotrochoid
		Pos = (0.8, 0.0, 0.0)
		length = 0.0125
		InnerRadius = 0.125
		outerRadius = 0.15
		Color = [
			255
			202
			57
			0
		]
		material = OG_Mat_Flare_add
		BlendMode = blend
		thickness = 101.0
		angularVel = -17.453299
		controls = [
			{
				type = vocalsamplitude
				response = alphaModulation
				scaleMod = 1.0
			}
			{
				type = vocalspitch
				response = offsetY
				scaleMod = 1.0
			}
		]
	}
	{
		type = hypotrochoid
		Pos = (0.8, 0.0, 0.0)
		length = 0.0125
		InnerRadius = 0.125
		outerRadius = 0.2
		Color = [
			57
			105
			255
			0
		]
		material = OG_Mat_Flare_add
		BlendMode = blend
		thickness = 101.0
		angularVel = -3.4906702
		controls = [
			{
				type = vocalsamplitude
				response = alphaModulation
				scaleMod = 1.0
			}
			{
				type = vocalspitch
				response = offsetY
				scaleMod = 1.0
			}
		]
	}
	{
		type = hypotrochoid
		Pos = (0.8, 0.0, 0.0)
		length = 0.0125
		InnerRadius = 0.125
		outerRadius = 0.2
		Color = [
			234
			130
			255
			0
		]
		material = OG_Mat_Flare_add
		BlendMode = blend
		thickness = 101.0
		angularVel = -5.236
		controls = [
			{
				type = vocalsamplitude
				response = alphaModulation
				scaleMod = 1.0
			}
			{
				type = vocalspitch
				response = offsetY
				scaleMod = 1.0
			}
		]
	}
	{
		type = hypotrochoid
		Pos = (0.9, 0.0, 0.0)
		length = 0.5
		InnerRadius = 0.25
		outerRadius = 0.5
		Color = [
			255
			255
			255
			255
		]
		material = OG_Mat_Flare_add
		BlendMode = add
		thickness = 20.0
		angularVel = 52.359898
		controls = [
			{
				type = vocalspitch
				response = offsetY
				scaleMod = 1.0
			}
		]
	}
	{
		type = blendPrev
		offset = (-0.0075000003, -0.00074999995)
		scale = (1.0, 1.0)
		Color = [
			255
			255
			255
			249
		]
		angle = 0
		angularVel = 0
		BlendMode = blend
	}
	{
		type = line
		Pos = (0.5, 0.05, 0.0)
		length = 1.0
		Color = [
			255
			124
			58
			0
		]
		BlendMode = add
		thickness = 1.0
		angle = 0.0
		angularVel = 0
		controls = [
			{
				type = vocalsamplitude
				response = alphaModulation
				scaleMod = 1.0
			}
			{
				type = frequency
				response = deform
				scaleMod = -500.0
				spectrumBand = 10
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.95, 0.0)
		length = 1.0
		Color = [
			255
			124
			58
			0
		]
		BlendMode = add
		thickness = 1.0
		angle = 0.0
		angularVel = 0
		controls = [
			{
				type = vocalsamplitude
				response = alphaModulation
				scaleMod = 1.0
			}
			{
				type = frequency
				response = deform
				scaleMod = 500.0
				spectrumBand = 10
			}
		]
	}
]
