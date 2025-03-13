bb_vocal_comet = [
	{
		type = blendprev
		offset = (-0.0075000003, -0.00074999995)
		scale = (1.0, 1.0)
		color = [
			160
			238
			10
			251
		]
		angle = 0
		angularvel = 0
		blendmode = add
		controls = [
		]
	}
	{
		type = sprite
		offset = (0.3, 0.55, 0.0)
		scale = (1.7, 0.90000296)
		width = 0.025
		height = 0.025
		color = [
			240
			253
			236
			255
		]
		material = og_mat_flare_add
		blendmode = add
		angle = 0.0
		angularvel = 0
		controls = [
			{
				type = frequency
				response = offsety
				scalemod = -0.04
				responsefunc = log10
				spectrumband = 64
			}
		]
	}
	{
		type = line
		pos = (0.26, 0.5, 0.0)
		length = 0.1
		color = [
			233
			255
			51
			255
		]
		blendmode = blend
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = waveform
				response = deform
				scalemod = 50.0
				responsefunc = costime
			}
		]
	}
	{
		type = line
		pos = (0.26, 0.61, 0.0)
		length = 0.1
		color = [
			255
			243
			58
			255
		]
		blendmode = blend
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = waveform
				response = deform
				scalemod = 50.0
				responsefunc = costime
			}
		]
	}
	{
		type = line
		pos = (0.9, 0.48000002, 0.0)
		length = 0.1
		color = [
			134
			242
			68
			216
		]
		blendmode = diffuse
		thickness = 50.0
		angle = 0.0
		angularvel = 0.0
		controls = [
			{
				type = waveform
				response = jitterdeform
				scalemod = 100.0
				responsefunc = sinlog10
			}
		]
	}
	{
		type = line
		pos = (0.55, 0.562, 0.0)
		length = 0.08
		color = [
			226
			255
			108
			255
		]
		blendmode = diffuse
		thickness = 2.9
		angle = 0
		angularvel = 0
		controls = [
			{
				type = waveform
				response = jitterdeform
				scalemod = 100.0
				responsefunc = costime
			}
		]
	}
]
