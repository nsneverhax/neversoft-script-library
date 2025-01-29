tb_global_forest_fire_1 = [
	{
		Type = sprite
		Pos = (0.5, 0.4)
		Scale = (1.0, -1.0)
		width = 1.0
		height = 1.0
		Color = [
			255
			130
			17
			255
		]
		material = tb_mat_gradient
		angle = 0
		angularvel = 0
	}
	{
		Type = sprite
		Pos = (0.2, 0.375)
		Scale = (1.0, 1.0)
		width = 0.01
		height = 0.01
		Color = [
			255
			199
			114
			0
		]
		material = og_mat_flare_add
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = constant
				response = offsety
				scalemod = 0.15
				responsefunc = costime
				timerate = 1.39626
			}
			{
				Type = constant
				response = offsetx
				scalemod = 0.015
				responsefunc = costime
				timerate = 6.98132
			}
			{
				Type = constant
				response = offsetx
				scalemod = -0.015
				responsefunc = sintime
				timerate = 6.98132
			}
			{
				Type = constant
				response = alphamodulation
				scalemod = 2.0
				responsefunc = sintime
				timerate = 1.39626
			}
		]
	}
	{
		Type = sprite
		Pos = (0.8, 0.2)
		Scale = (1.0, 1.0)
		width = 0.02
		height = 0.02
		Color = [
			255
			197
			108
			0
		]
		material = og_mat_flare_add
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = constant
				response = offsety
				scalemod = 0.15
				responsefunc = costime
				timerate = 1.39626
			}
			{
				Type = constant
				response = offsetx
				scalemod = 0.015
				responsefunc = costime
				timerate = 6.98132
			}
			{
				Type = constant
				response = offsetx
				scalemod = -0.015
				responsefunc = sintime
				timerate = 6.98132
			}
			{
				Type = constant
				response = alphamodulation
				scalemod = 2.0
				responsefunc = sintime
				timerate = 1.39626
			}
		]
	}
	{
		Type = sprite
		Pos = (0.4, 0.3)
		Scale = (1.0, 1.0)
		width = 0.01
		height = 0.01
		Color = [
			255
			199
			114
			0
		]
		material = og_mat_flare_add
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = constant
				response = offsety
				scalemod = 0.15
				responsefunc = costime
				timerate = 1.39626
			}
			{
				Type = constant
				response = offsetx
				scalemod = 0.015
				responsefunc = costime
				timerate = 6.98132
			}
			{
				Type = constant
				response = offsetx
				scalemod = -0.015
				responsefunc = sintime
				timerate = 6.98132
			}
			{
				Type = constant
				response = alphamodulation
				scalemod = 2.0
				responsefunc = sintime
				timerate = 1.39626
			}
		]
	}
	{
		Type = sprite
		Pos = (0.3, 0.275)
		Scale = (1.0, 1.0)
		width = 0.02
		height = 0.02
		Color = [
			255
			199
			114
			0
		]
		material = og_mat_flare_add
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = constant
				response = offsety
				scalemod = 0.15
				responsefunc = costime
				timeoffset = 4.2
				timerate = 1.39626
			}
			{
				Type = constant
				response = offsetx
				scalemod = 0.015
				responsefunc = costime
				timerate = 6.98132
			}
			{
				Type = constant
				response = offsetx
				scalemod = -0.015
				responsefunc = sintime
				timerate = 6.98132
			}
			{
				Type = constant
				response = alphamodulation
				scalemod = 5.7
				responsefunc = sintime
				timeoffset = 4.2
				timerate = 1.39626
			}
		]
	}
	{
		Type = sprite
		Pos = (0.6, 0.3)
		Scale = (1.0, 1.0)
		width = 0.01
		height = 0.01
		Color = [
			255
			199
			114
			0
		]
		material = og_mat_flare_add
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = constant
				response = offsety
				scalemod = 0.15
				responsefunc = costime
				timeoffset = 4.2
				timerate = 1.39626
			}
			{
				Type = constant
				response = offsetx
				scalemod = 0.015
				responsefunc = costime
				timerate = 6.98132
			}
			{
				Type = constant
				response = offsetx
				scalemod = -0.015
				responsefunc = sintime
				timerate = 6.98132
			}
			{
				Type = constant
				response = alphamodulation
				scalemod = 5.7
				responsefunc = sintime
				timeoffset = 4.2
				timerate = 1.39626
			}
		]
	}
	{
		Type = line
		Pos = (0.25, 0.55, 0.0)
		length = -0.75
		Color = [
			191
			98
			27
			255
		]
		BlendMode = blend
		thickness = 5.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = thicknessscale
				scalemod = 5.0
				spectrumband = 0
			}
			{
				Type = frequency
				response = deform
				scalemod = 100.0
				spectrumband = 0
			}
		]
	}
	{
		Type = line
		Pos = (0.75, 0.55, 0.0)
		length = 0.75
		Color = [
			110
			54
			3
			255
		]
		BlendMode = add
		thickness = 5.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = thicknessscale
				scalemod = 5.0
				spectrumband = 0
			}
			{
				Type = frequency
				response = deform
				scalemod = 100.0
				spectrumband = 0
			}
		]
	}
	{
		Type = line
		Pos = (0.75, 0.51, 0.0)
		length = 0.5
		Color = [
			44
			39
			29
			255
		]
		BlendMode = add
		thickness = 6.0
		angle = 0.0
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = -100.0
				spectrumband = 0
			}
		]
	}
	{
		Type = line
		Pos = (0.25, 0.51, 0.0)
		length = -0.5
		Color = [
			44
			39
			29
			255
		]
		BlendMode = add
		thickness = 6.0
		angle = 0.0
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 100.0
				spectrumband = 0
			}
		]
	}
	{
		Type = line
		Pos = (0.75, 0.475, 0.0)
		length = -0.5
		Color = [
			22
			16
			13
			255
		]
		BlendMode = add
		thickness = 6.0
		angle = 0.0
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 150.0
				spectrumband = 0
			}
		]
	}
	{
		Type = line
		Pos = (0.25, 0.475, 0.0)
		length = 0.5
		Color = [
			22
			16
			13
			255
		]
		BlendMode = add
		thickness = 6.0
		angle = 0.0
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = -150.0
				spectrumband = 0
			}
		]
	}
	{
		Type = line
		Pos = (0.25, 0.525, 0.0)
		length = -0.5
		Color = [
			37
			32
			27
			255
		]
		BlendMode = add
		thickness = 6.0
		angle = 0.0
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = -75.0
				spectrumband = 0
			}
		]
	}
	{
		Type = line
		Pos = (0.75, 0.525, 0.0)
		length = 0.5
		Color = [
			37
			32
			27
			255
		]
		BlendMode = add
		thickness = 6.0
		angle = 0.0
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 75.0
				spectrumband = 0
			}
		]
	}
	{
		Type = line
		Pos = (0.25, 0.525, 0.0)
		length = -0.5
		Color = [
			31
			27
			23
			255
		]
		BlendMode = add
		thickness = 6.0
		angle = 0.0
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = -125.0
				spectrumband = 0
			}
		]
	}
	{
		Type = line
		Pos = (0.75, 0.525, 0.0)
		length = 0.5
		Color = [
			31
			27
			23
			255
		]
		BlendMode = add
		thickness = 6.0
		angle = 0.0
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 125.0
				spectrumband = 0
			}
		]
	}
	{
		Type = line
		Pos = (0.25, 0.5, 0.0)
		length = -0.5
		Color = [
			18
			15
			14
			255
		]
		BlendMode = add
		thickness = 6.0
		angle = 0.0
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = -100.0
				spectrumband = 0
			}
		]
	}
	{
		Type = line
		Pos = (0.75, 0.5, 0.0)
		length = 0.5
		Color = [
			18
			15
			14
			255
		]
		BlendMode = add
		thickness = 6.0
		angle = 0.0
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				response = deform
				scalemod = 100.0
				spectrumband = 0
			}
		]
	}
	{
		Type = sprite
		Pos = (0.25, 0.425)
		Scale = (0.5, 0.5)
		width = 1.0
		height = 0.51
		Color = [
			46
			46
			46
			255
		]
		material = tb_mat_treebank_blend
		angle = 0
		angularvel = 0
	}
	{
		Type = sprite
		Pos = (0.75, 0.425)
		Scale = (0.5, 0.5)
		width = 1.0
		height = 0.51
		Color = [
			46
			46
			46
			255
		]
		material = tb_mat_treebank_blend
		angle = 0
		angularvel = 0
	}
	{
		Type = rect
		Pos = (0.5, 0.775)
		Scale = (1.0, 1.0)
		width = 1.0
		height = 0.5
		Color = [
			2
			2
			2
			255
		]
		color2 = [
			0
			0
			0
			255
		]
		BlendMode = blend
		thickness = 1.0
		angle = 0
		angularvel = 0
	}
	{
		Type = sprite
		Pos = (0.5, 0.51)
		Scale = (1.0, 1.0)
		width = 0.4
		height = 0.15
		Color = [
			233
			160
			104
			255
		]
		material = og_mat_flare_add
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequencyonbeat
				response = alphamodulation
				scalemod = -2.4
				responsefunc = costime
				timerate = 6.98132
				spectrumband = 0
			}
		]
	}
	{
		Type = sprite
		Pos = (0.2, 0.51)
		Scale = (1.0, 1.0)
		width = 0.4
		height = 0.15
		Color = [
			233
			160
			104
			255
		]
		material = og_mat_flare_add
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequencyonbeat
				response = alphamodulation
				scalemod = -2.4
				responsefunc = costime
				timerate = 6.98132
				spectrumband = 0
			}
		]
	}
	{
		Type = sprite
		Pos = (0.8, 0.51)
		Scale = (1.0, 1.0)
		width = 0.2
		height = 0.15
		Color = [
			160
			112
			75
			255
		]
		material = og_mat_flare_add
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = frequencyonbeat
				response = alphamodulation
				scalemod = -2.4
				responsefunc = costime
				timerate = 6.98132
				spectrumband = 0
			}
		]
	}
	{
		Type = sprite
		Pos = (0.4, 0.275)
		Scale = (1.0, 1.0)
		width = 0.02
		height = 0.02
		Color = [
			255
			199
			114
			0
		]
		material = og_mat_flare_add
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = constant
				response = offsety
				scalemod = 0.15
				responsefunc = costime
				timeoffset = 2.1
				timerate = 1.39626
			}
			{
				Type = constant
				response = offsetx
				scalemod = 0.015
				responsefunc = costime
				timerate = 6.98132
			}
			{
				Type = constant
				response = offsetx
				scalemod = -0.015
				responsefunc = sintime
				timerate = 6.98132
			}
			{
				Type = constant
				response = alphamodulation
				scalemod = 5.7
				responsefunc = sintime
				timeoffset = 2.1
				timerate = 1.39626
			}
		]
	}
	{
		Type = sprite
		Pos = (0.5, 0.3)
		Scale = (1.0, 1.0)
		width = 0.01
		height = 0.01
		Color = [
			255
			199
			114
			0
		]
		material = og_mat_flare_add
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = constant
				response = offsety
				scalemod = 0.15
				responsefunc = costime
				timeoffset = 2.1
				timerate = 1.39626
			}
			{
				Type = constant
				response = offsetx
				scalemod = 0.015
				responsefunc = costime
				timerate = 6.98132
			}
			{
				Type = constant
				response = offsetx
				scalemod = -0.015
				responsefunc = sintime
				timerate = 6.98132
			}
			{
				Type = constant
				response = alphamodulation
				scalemod = 5.7
				responsefunc = sintime
				timeoffset = 2.1
				timerate = 1.39626
			}
		]
	}
]
