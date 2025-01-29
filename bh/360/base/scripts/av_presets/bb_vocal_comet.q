BB_Vocal_Comet = [
	{
		type = blendPrev
		offset = (-0.0075000003, -0.00074999995)
		scale = (1.0, 1.0)
		Color = [
			160
			238
			10
			251
		]
		angle = 0
		angularVel = 0
		BlendMode = add
		controls = [
		]
	}
	{
		type = sprite
		offset = (0.3, 0.55, 0.0)
		scale = (1.7, 0.90000296)
		width = 0.025
		height = 0.025
		Color = [
			240
			253
			236
			255
		]
		material = OG_Mat_Flare_add
		BlendMode = add
		angle = 0.0
		angularVel = 0
		controls = [
			{
				type = frequency
				response = offsetY
				scaleMod = -0.04
				responseFunc = log10
				spectrumBand = 64
			}
		]
	}
	{
		type = line
		Pos = (0.26, 0.5, 0.0)
		length = 0.1
		Color = [
			233
			255
			51
			255
		]
		BlendMode = blend
		thickness = 1.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = waveform
				response = deform
				scaleMod = 50.0
				responseFunc = cosTime
			}
		]
	}
	{
		type = line
		Pos = (0.26, 0.61, 0.0)
		length = 0.1
		Color = [
			255
			243
			58
			255
		]
		BlendMode = blend
		thickness = 1.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = waveform
				response = deform
				scaleMod = 50.0
				responseFunc = cosTime
			}
		]
	}
	{
		type = line
		Pos = (0.9, 0.48000002, 0.0)
		length = 0.1
		Color = [
			134
			242
			68
			216
		]
		BlendMode = diffuse
		thickness = 50.0
		angle = 0.0
		angularVel = 0.0
		controls = [
			{
				type = waveform
				response = jitterDeform
				scaleMod = 100.0
				responseFunc = sinLog10
			}
		]
	}
	{
		type = line
		Pos = (0.55, 0.562, 0.0)
		length = 0.08
		Color = [
			226
			255
			108
			255
		]
		BlendMode = diffuse
		thickness = 2.9
		angle = 0
		angularVel = 0
		controls = [
			{
				type = waveform
				response = jitterDeform
				scaleMod = 100.0
				responseFunc = cosTime
			}
		]
	}
]
