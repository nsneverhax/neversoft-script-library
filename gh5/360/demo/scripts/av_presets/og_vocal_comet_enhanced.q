og_vocal_comet_enhanced = [
	{
		type = hypotrochoid
		pos = (0.9, 0.0, 0.0)
		length = 0.05
		innerradius = 0.2
		outerradius = 0.1
		color = [
			255
			248
			205
			0
		]
		material = og_mat_lenzflare_add
		blendmode = blend_alphadiffuse
		thickness = 30.0
		angularvel = 523.599
		controls = [
			{
				type = vocalspitch
				response = offsety
				scalemod = 1.0
			}
		]
	}
	{
		type = sprite
		pos = (0.9, 0.0, 0.0)
		scale = (2.5, 5.0)
		width = 0.05
		height = 0.05
		color = [
			255
			124
			58
			166
		]
		material = og_mat_flare_add
		blendmode = blend
		angle = 0
		angularvel = 0
		controls = [
			{
				type = vocalspitch
				response = offsety
				scalemod = 1.0
			}
			{
				type = vocalsnoteon
				response = greenmodulation
				scalemod = 0.5
			}
			{
				type = vocalsnoteon
				response = redmodulation
				scalemod = -0.5
			}
		]
	}
	{
		type = hypotrochoid
		pos = (0.8, 0.0, 0.0)
		length = 0.0125
		innerradius = 0.125
		outerradius = 0.05
		color = [
			255
			202
			57
			0
		]
		material = og_mat_flare_add
		blendmode = blend
		thickness = 101.0
		angularvel = 10
		controls = [
			{
				type = vocalsamplitude
				response = alphamodulation
				scalemod = 1.0
			}
			{
				type = vocalspitch
				response = offsety
				scalemod = 1.0
			}
		]
	}
	{
		type = hypotrochoid
		pos = (0.8, 0.0, 0.0)
		length = 0.0125
		innerradius = 0.125
		outerradius = 0.15
		color = [
			255
			202
			57
			0
		]
		material = og_mat_flare_add
		blendmode = blend
		thickness = 101.0
		angularvel = -17.453299
		controls = [
			{
				type = vocalsamplitude
				response = alphamodulation
				scalemod = 1.0
			}
			{
				type = vocalspitch
				response = offsety
				scalemod = 1.0
			}
		]
	}
	{
		type = hypotrochoid
		pos = (0.8, 0.0, 0.0)
		length = 0.0125
		innerradius = 0.125
		outerradius = 0.2
		color = [
			57
			105
			255
			0
		]
		material = og_mat_flare_add
		blendmode = blend
		thickness = 101.0
		angularvel = -3.4906702
		controls = [
			{
				type = vocalsamplitude
				response = alphamodulation
				scalemod = 1.0
			}
			{
				type = vocalspitch
				response = offsety
				scalemod = 1.0
			}
		]
	}
	{
		type = hypotrochoid
		pos = (0.8, 0.0, 0.0)
		length = 0.0125
		innerradius = 0.125
		outerradius = 0.2
		color = [
			234
			130
			255
			0
		]
		material = og_mat_flare_add
		blendmode = blend
		thickness = 101.0
		angularvel = -5.236
		controls = [
			{
				type = vocalsamplitude
				response = alphamodulation
				scalemod = 1.0
			}
			{
				type = vocalspitch
				response = offsety
				scalemod = 1.0
			}
		]
	}
	{
		type = hypotrochoid
		pos = (0.9, 0.0, 0.0)
		length = 0.5
		innerradius = 0.25
		outerradius = 0.5
		color = [
			255
			255
			255
			255
		]
		material = og_mat_flare_add
		blendmode = add
		thickness = 20.0
		angularvel = 52.359898
		controls = [
			{
				type = vocalspitch
				response = offsety
				scalemod = 1.0
			}
		]
	}
	{
		type = blendprev
		offset = (-0.0075000003, -0.00074999995)
		scale = (1.0, 1.0)
		color = [
			255
			255
			255
			249
		]
		angle = 0
		angularvel = 0
		blendmode = blend
	}
	{
		type = line
		pos = (0.5, 0.05, 0.0)
		length = 1.0
		color = [
			255
			124
			58
			0
		]
		blendmode = add
		thickness = 1.0
		angle = 0.0
		angularvel = 0
		controls = [
			{
				type = vocalsamplitude
				response = alphamodulation
				scalemod = 1.0
			}
			{
				type = frequency
				response = deform
				scalemod = -500.0
				spectrumband = 10
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.95, 0.0)
		length = 1.0
		color = [
			255
			124
			58
			0
		]
		blendmode = add
		thickness = 1.0
		angle = 0.0
		angularvel = 0
		controls = [
			{
				type = vocalsamplitude
				response = alphamodulation
				scalemod = 1.0
			}
			{
				type = frequency
				response = deform
				scalemod = 500.0
				spectrumband = 10
			}
		]
	}
]
