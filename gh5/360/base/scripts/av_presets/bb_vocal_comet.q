bb_vocal_comet = [
	{
		Type = blendprev
		offset = (-0.0075000003, -0.00074999995)
		Scale = (1.0, 1.0)
		Color = [
			160
			238
			10
			251
		]
		angle = 0
		angularvel = 0
		BlendMode = add
		controls = [
		]
	}
	{
		Type = sprite
		offset = (0.3, 0.55, 0.0)
		Scale = (1.7, 0.90000296)
		width = 0.025
		height = 0.025
		Color = [
			240
			253
			236
			255
		]
		material = og_mat_flare_add
		BlendMode = add
		angle = 0.0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = offsety
				scalemod = -0.04
				responsefunc = log10
				spectrumband = 64
			}
		]
	}
	{
		Type = line
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
		angularvel = 0
		controls = [
			{
				Type = waveform
				response = deform
				scalemod = 50.0
				responsefunc = costime
			}
		]
	}
	{
		Type = line
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
		angularvel = 0
		controls = [
			{
				Type = waveform
				response = deform
				scalemod = 50.0
				responsefunc = costime
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = waveform
				response = jitterdeform
				scalemod = 100.0
				responsefunc = sinlog10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0
		controls = [
			{
				Type = waveform
				response = jitterdeform
				scalemod = 100.0
				responsefunc = costime
			}
		]
	}
]
