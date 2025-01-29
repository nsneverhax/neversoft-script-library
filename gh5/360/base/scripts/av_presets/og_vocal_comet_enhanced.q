og_vocal_comet_enhanced = [
	{
		Type = hypotrochoid
		Pos = (0.9, 0.0, 0.0)
		length = 0.05
		InnerRadius = 0.2
		outerradius = 0.1
		Color = [
			255
			248
			205
			0
		]
		material = og_mat_lenzflare_add
		BlendMode = blend_alphadiffuse
		thickness = 30.0
		angularvel = 523.599
		controls = [
			{
				Type = vocalspitch
				response = offsety
				scalemod = 1.0
			}
		]
	}
	{
		Type = sprite
		Pos = (0.9, 0.0, 0.0)
		Scale = (2.5, 5.0)
		width = 0.05
		height = 0.05
		Color = [
			255
			124
			58
			166
		]
		material = og_mat_flare_add
		BlendMode = blend
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = vocalspitch
				response = offsety
				scalemod = 1.0
			}
			{
				Type = vocalsnoteon
				response = greenmodulation
				scalemod = 0.5
			}
			{
				Type = vocalsnoteon
				response = redmodulation
				scalemod = -0.5
			}
		]
	}
	{
		Type = hypotrochoid
		Pos = (0.8, 0.0, 0.0)
		length = 0.0125
		InnerRadius = 0.125
		outerradius = 0.05
		Color = [
			255
			202
			57
			0
		]
		material = og_mat_flare_add
		BlendMode = blend
		thickness = 101.0
		angularvel = 10
		controls = [
			{
				Type = vocalsamplitude
				response = alphamodulation
				scalemod = 1.0
			}
			{
				Type = vocalspitch
				response = offsety
				scalemod = 1.0
			}
		]
	}
	{
		Type = hypotrochoid
		Pos = (0.8, 0.0, 0.0)
		length = 0.0125
		InnerRadius = 0.125
		outerradius = 0.15
		Color = [
			255
			202
			57
			0
		]
		material = og_mat_flare_add
		BlendMode = blend
		thickness = 101.0
		angularvel = -17.453299
		controls = [
			{
				Type = vocalsamplitude
				response = alphamodulation
				scalemod = 1.0
			}
			{
				Type = vocalspitch
				response = offsety
				scalemod = 1.0
			}
		]
	}
	{
		Type = hypotrochoid
		Pos = (0.8, 0.0, 0.0)
		length = 0.0125
		InnerRadius = 0.125
		outerradius = 0.2
		Color = [
			57
			105
			255
			0
		]
		material = og_mat_flare_add
		BlendMode = blend
		thickness = 101.0
		angularvel = -3.4906702
		controls = [
			{
				Type = vocalsamplitude
				response = alphamodulation
				scalemod = 1.0
			}
			{
				Type = vocalspitch
				response = offsety
				scalemod = 1.0
			}
		]
	}
	{
		Type = hypotrochoid
		Pos = (0.8, 0.0, 0.0)
		length = 0.0125
		InnerRadius = 0.125
		outerradius = 0.2
		Color = [
			234
			130
			255
			0
		]
		material = og_mat_flare_add
		BlendMode = blend
		thickness = 101.0
		angularvel = -5.236
		controls = [
			{
				Type = vocalsamplitude
				response = alphamodulation
				scalemod = 1.0
			}
			{
				Type = vocalspitch
				response = offsety
				scalemod = 1.0
			}
		]
	}
	{
		Type = hypotrochoid
		Pos = (0.9, 0.0, 0.0)
		length = 0.5
		InnerRadius = 0.25
		outerradius = 0.5
		Color = [
			255
			255
			255
			255
		]
		material = og_mat_flare_add
		BlendMode = add
		thickness = 20.0
		angularvel = 52.359898
		controls = [
			{
				Type = vocalspitch
				response = offsety
				scalemod = 1.0
			}
		]
	}
	{
		Type = blendprev
		offset = (-0.0075000003, -0.00074999995)
		Scale = (1.0, 1.0)
		Color = [
			255
			255
			255
			249
		]
		angle = 0
		angularvel = 0
		BlendMode = blend
	}
	{
		Type = line
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
		angularvel = 0
		controls = [
			{
				Type = vocalsamplitude
				response = alphamodulation
				scalemod = 1.0
			}
			{
				Type = frequency
				response = deform
				scalemod = -500.0
				spectrumband = 10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0
		controls = [
			{
				Type = vocalsamplitude
				response = alphamodulation
				scalemod = 1.0
			}
			{
				Type = frequency
				response = deform
				scalemod = 500.0
				spectrumband = 10
			}
		]
	}
]
