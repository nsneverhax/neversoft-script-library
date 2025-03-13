tb_global_forest_fire_1 = [
	{
		type = sprite
		pos = (0.5, 0.4)
		scale = (1.0, -1.0)
		width = 1.0
		height = 1.0
		color = [
			255
			130
			17
			255
		]
		material = tb_mat_gradient
	}
	{
		type = sprite
		pos = (0.2, 0.375)
		width = 0.01
		height = 0.01
		color = [
			255
			199
			114
			0
		]
		material = og_mat_flare_add
		controls = [
			{
				type = constant
				response = offsety
				scalemod = 0.15
				responsefunc = costime
				timerate = 1.39626
			}
			{
				type = constant
				response = offsetx
				scalemod = 0.015
				responsefunc = costime
				timerate = 6.98132
			}
			{
				type = constant
				response = offsetx
				scalemod = -0.015
				responsefunc = sintime
				timerate = 6.98132
			}
			{
				type = constant
				response = alphamodulation
				scalemod = 2.0
				responsefunc = sintime
				timerate = 1.39626
			}
		]
	}
	{
		type = sprite
		pos = (0.8, 0.2)
		width = 0.02
		height = 0.02
		color = [
			255
			197
			108
			0
		]
		material = og_mat_flare_add
		controls = [
			{
				type = constant
				response = offsety
				scalemod = 0.15
				responsefunc = costime
				timerate = 1.39626
			}
			{
				type = constant
				response = offsetx
				scalemod = 0.015
				responsefunc = costime
				timerate = 6.98132
			}
			{
				type = constant
				response = offsetx
				scalemod = -0.015
				responsefunc = sintime
				timerate = 6.98132
			}
			{
				type = constant
				response = alphamodulation
				scalemod = 2.0
				responsefunc = sintime
				timerate = 1.39626
			}
		]
	}
	{
		type = sprite
		pos = (0.4, 0.3)
		width = 0.01
		height = 0.01
		color = [
			255
			199
			114
			0
		]
		material = og_mat_flare_add
		controls = [
			{
				type = constant
				response = offsety
				scalemod = 0.15
				responsefunc = costime
				timerate = 1.39626
			}
			{
				type = constant
				response = offsetx
				scalemod = 0.015
				responsefunc = costime
				timerate = 6.98132
			}
			{
				type = constant
				response = offsetx
				scalemod = -0.015
				responsefunc = sintime
				timerate = 6.98132
			}
			{
				type = constant
				response = alphamodulation
				scalemod = 2.0
				responsefunc = sintime
				timerate = 1.39626
			}
		]
	}
	{
		type = sprite
		pos = (0.3, 0.275)
		width = 0.02
		height = 0.02
		color = [
			255
			199
			114
			0
		]
		material = og_mat_flare_add
		controls = [
			{
				type = constant
				response = offsety
				scalemod = 0.15
				responsefunc = costime
				timeoffset = 4.2
				timerate = 1.39626
			}
			{
				type = constant
				response = offsetx
				scalemod = 0.015
				responsefunc = costime
				timerate = 6.98132
			}
			{
				type = constant
				response = offsetx
				scalemod = -0.015
				responsefunc = sintime
				timerate = 6.98132
			}
			{
				type = constant
				response = alphamodulation
				scalemod = 5.7
				responsefunc = sintime
				timeoffset = 4.2
				timerate = 1.39626
			}
		]
	}
	{
		type = sprite
		pos = (0.6, 0.3)
		width = 0.01
		height = 0.01
		color = [
			255
			199
			114
			0
		]
		material = og_mat_flare_add
		controls = [
			{
				type = constant
				response = offsety
				scalemod = 0.15
				responsefunc = costime
				timeoffset = 4.2
				timerate = 1.39626
			}
			{
				type = constant
				response = offsetx
				scalemod = 0.015
				responsefunc = costime
				timerate = 6.98132
			}
			{
				type = constant
				response = offsetx
				scalemod = -0.015
				responsefunc = sintime
				timerate = 6.98132
			}
			{
				type = constant
				response = alphamodulation
				scalemod = 5.7
				responsefunc = sintime
				timeoffset = 4.2
				timerate = 1.39626
			}
		]
	}
	{
		type = line
		pos = (0.25, 0.55, 0.0)
		length = -0.75
		color = [
			191
			98
			27
			255
		]
		thickness = 5.0
		controls = [
			{
				type = frequency
				response = thicknessscale
				scalemod = 5.0
				spectrumband = 0
			}
			{
				type = frequency
				response = deform
				scalemod = 100.0
				spectrumband = 0
			}
		]
	}
	{
		type = line
		pos = (0.75, 0.55, 0.0)
		length = 0.75
		color = [
			110
			54
			3
			255
		]
		blendmode = add
		thickness = 5.0
		controls = [
			{
				type = frequency
				response = thicknessscale
				scalemod = 5.0
				spectrumband = 0
			}
			{
				type = frequency
				response = deform
				scalemod = 100.0
				spectrumband = 0
			}
		]
	}
	{
		type = line
		pos = (0.75, 0.51, 0.0)
		length = 0.5
		color = [
			44
			39
			29
			255
		]
		blendmode = add
		thickness = 6.0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = -100.0
				spectrumband = 0
			}
		]
	}
	{
		type = line
		pos = (0.25, 0.51, 0.0)
		length = -0.5
		color = [
			44
			39
			29
			255
		]
		blendmode = add
		thickness = 6.0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 100.0
				spectrumband = 0
			}
		]
	}
	{
		type = line
		pos = (0.75, 0.475, 0.0)
		length = -0.5
		color = [
			22
			16
			13
			255
		]
		blendmode = add
		thickness = 6.0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 150.0
				spectrumband = 0
			}
		]
	}
	{
		type = line
		pos = (0.25, 0.475, 0.0)
		length = 0.5
		color = [
			22
			16
			13
			255
		]
		blendmode = add
		thickness = 6.0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = -150.0
				spectrumband = 0
			}
		]
	}
	{
		type = line
		pos = (0.25, 0.525, 0.0)
		length = -0.5
		color = [
			37
			32
			27
			255
		]
		blendmode = add
		thickness = 6.0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = -75.0
				spectrumband = 0
			}
		]
	}
	{
		type = line
		pos = (0.75, 0.525, 0.0)
		length = 0.5
		color = [
			37
			32
			27
			255
		]
		blendmode = add
		thickness = 6.0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 75.0
				spectrumband = 0
			}
		]
	}
	{
		type = line
		pos = (0.25, 0.525, 0.0)
		length = -0.5
		color = [
			31
			27
			23
			255
		]
		blendmode = add
		thickness = 6.0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = -125.0
				spectrumband = 0
			}
		]
	}
	{
		type = line
		pos = (0.75, 0.525, 0.0)
		length = 0.5
		color = [
			31
			27
			23
			255
		]
		blendmode = add
		thickness = 6.0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 125.0
				spectrumband = 0
			}
		]
	}
	{
		type = line
		pos = (0.25, 0.5, 0.0)
		length = -0.5
		color = [
			18
			15
			14
			255
		]
		blendmode = add
		thickness = 6.0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = -100.0
				spectrumband = 0
			}
		]
	}
	{
		type = line
		pos = (0.75, 0.5, 0.0)
		length = 0.5
		color = [
			18
			15
			14
			255
		]
		blendmode = add
		thickness = 6.0
		controls = [
			{
				type = frequency
				response = deform
				scalemod = 100.0
				spectrumband = 0
			}
		]
	}
	{
		type = sprite
		pos = (0.25, 0.425)
		scale = (0.5, 0.5)
		width = 1.0
		height = 0.51
		color = [
			46
			46
			46
			255
		]
		material = tb_mat_treebank_blend
	}
	{
		type = sprite
		pos = (0.75, 0.425)
		scale = (0.5, 0.5)
		width = 1.0
		height = 0.51
		color = [
			46
			46
			46
			255
		]
		material = tb_mat_treebank_blend
	}
	{
		type = rect
		pos = (0.5, 0.775)
		width = 1.0
		height = 0.5
		color = [
			2
			2
			2
			255
		]
		blendmode = blend
	}
	{
		type = sprite
		pos = (0.5, 0.51)
		width = 0.4
		height = 0.15
		color = [
			233
			160
			104
			255
		]
		material = og_mat_flare_add
		controls = [
			{
				type = frequencyonbeat
				response = alphamodulation
				scalemod = -2.4
				responsefunc = costime
				timerate = 6.98132
				spectrumband = 0
			}
		]
	}
	{
		type = sprite
		pos = (0.2, 0.51)
		width = 0.4
		height = 0.15
		color = [
			233
			160
			104
			255
		]
		material = og_mat_flare_add
		controls = [
			{
				type = frequencyonbeat
				response = alphamodulation
				scalemod = -2.4
				responsefunc = costime
				timerate = 6.98132
				spectrumband = 0
			}
		]
	}
	{
		type = sprite
		pos = (0.8, 0.51)
		width = 0.2
		height = 0.15
		color = [
			160
			112
			75
			255
		]
		material = og_mat_flare_add
		controls = [
			{
				type = frequencyonbeat
				response = alphamodulation
				scalemod = -2.4
				responsefunc = costime
				timerate = 6.98132
				spectrumband = 0
			}
		]
	}
	{
		type = sprite
		pos = (0.4, 0.275)
		width = 0.02
		height = 0.02
		color = [
			255
			199
			114
			0
		]
		material = og_mat_flare_add
		controls = [
			{
				type = constant
				response = offsety
				scalemod = 0.15
				responsefunc = costime
				timeoffset = 2.1
				timerate = 1.39626
			}
			{
				type = constant
				response = offsetx
				scalemod = 0.015
				responsefunc = costime
				timerate = 6.98132
			}
			{
				type = constant
				response = offsetx
				scalemod = -0.015
				responsefunc = sintime
				timerate = 6.98132
			}
			{
				type = constant
				response = alphamodulation
				scalemod = 5.7
				responsefunc = sintime
				timeoffset = 2.1
				timerate = 1.39626
			}
		]
	}
	{
		type = sprite
		pos = (0.5, 0.3)
		width = 0.01
		height = 0.01
		color = [
			255
			199
			114
			0
		]
		material = og_mat_flare_add
		controls = [
			{
				type = constant
				response = offsety
				scalemod = 0.15
				responsefunc = costime
				timeoffset = 2.1
				timerate = 1.39626
			}
			{
				type = constant
				response = offsetx
				scalemod = 0.015
				responsefunc = costime
				timerate = 6.98132
			}
			{
				type = constant
				response = offsetx
				scalemod = -0.015
				responsefunc = sintime
				timerate = 6.98132
			}
			{
				type = constant
				response = alphamodulation
				scalemod = 5.7
				responsefunc = sintime
				timeoffset = 2.1
				timerate = 1.39626
			}
		]
	}
]
