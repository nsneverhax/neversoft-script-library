tb_cube_pyro = [
	{
		Type = sprite
		Pos = (0.5, 0.4)
		Scale = (1.0, -1.0)
		width = 1.0
		height = 1.0
		Color = [
			138
			71
			4
			255
		]
		material = tb_mat_gradient
		controls = [
			{
				Type = constant
				response = brightnessmodulation
				scalemod = 0.1
				responsefunc = costime
				timerate = 0.872665
			}
		]
	}
	{
		Type = sprite
		Pos = (0.2, 0.375)
		width = 0.01
		height = 0.01
		Color = [
			255
			199
			114
			0
		]
		material = og_mat_flare_add
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
		width = 0.02
		height = 0.02
		Color = [
			255
			197
			108
			0
		]
		material = og_mat_flare_add
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
		width = 0.01
		height = 0.01
		Color = [
			255
			199
			114
			0
		]
		material = og_mat_flare_add
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
		width = 0.02
		height = 0.02
		Color = [
			255
			199
			114
			0
		]
		material = og_mat_flare_add
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
		Pos = (0.75, 0.565, 0.0)
		length = 0.75
		Color = [
			191
			98
			27
			255
		]
		thickness = 5.0
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
		Pos = (0.25, 0.565, 0.0)
		length = -0.75
		Color = [
			110
			54
			3
			255
		]
		BlendMode = add
		thickness = 5.0
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
		Type = sprite
		Pos = (0.6, 0.3)
		width = 0.01
		height = 0.01
		Color = [
			255
			199
			114
			0
		]
		material = og_mat_flare_add
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
		Pos = (0.75, 0.571, 0.0)
		length = 0.5
		Color = [
			44
			39
			29
			255
		]
		BlendMode = add
		thickness = 6.0
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
		Pos = (0.25, 0.571, 0.0)
		length = -0.5
		Color = [
			44
			39
			29
			255
		]
		BlendMode = add
		thickness = 6.0
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
		Pos = (0.75, 0.525, 0.0)
		length = -0.5
		Color = [
			22
			16
			13
			255
		]
		BlendMode = add
		thickness = 6.0
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
		Pos = (0.25, 0.525, 0.0)
		length = 0.5
		Color = [
			22
			16
			13
			255
		]
		BlendMode = add
		thickness = 6.0
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
		Pos = (0.25, 0.575, 0.0)
		length = -0.5
		Color = [
			37
			32
			27
			255
		]
		BlendMode = add
		thickness = 6.0
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
		Pos = (0.75, 0.575, 0.0)
		length = 0.5
		Color = [
			37
			32
			27
			255
		]
		BlendMode = add
		thickness = 6.0
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
		Pos = (0.25, 0.575, 0.0)
		length = -0.5
		Color = [
			31
			27
			23
			255
		]
		BlendMode = add
		thickness = 6.0
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
		Pos = (0.75, 0.575, 0.0)
		length = 0.5
		Color = [
			31
			27
			23
			255
		]
		BlendMode = add
		thickness = 6.0
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
		Pos = (0.25, 0.55, 0.0)
		length = -0.5
		Color = [
			18
			15
			14
			255
		]
		BlendMode = add
		thickness = 6.0
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
		Pos = (0.75, 0.55, 0.0)
		length = 0.5
		Color = [
			18
			15
			14
			255
		]
		BlendMode = add
		thickness = 6.0
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
		Pos = (0.5, 0.551)
		width = 0.4
		height = 0.15
		Color = [
			233
			160
			104
			255
		]
		material = og_mat_flare_add
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
		Pos = (0.2, 0.551)
		width = 0.4
		height = 0.15
		Color = [
			233
			160
			104
			255
		]
		material = og_mat_flare_add
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
		Pos = (0.8, 0.551)
		width = 0.2
		height = 0.15
		Color = [
			160
			112
			75
			255
		]
		material = og_mat_flare_add
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
		width = 0.02
		height = 0.02
		Color = [
			255
			199
			114
			0
		]
		material = og_mat_flare_add
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
		width = 0.01
		height = 0.01
		Color = [
			255
			199
			114
			0
		]
		material = og_mat_flare_add
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
		Pos = (0.5, 0.7)
		width = 0.5
		height = -0.75
		Color = [
			37
			25
			17
			255
		]
		material = tb_mat_flame_a
		angle = 1.5708001
		controls = [
			{
				Type = frequencyonbeat
				response = alphamodulation
				scalemod = -1.0
				responsefunc = costime
				timerate = 6.98132
				spectrumband = 0
			}
			{
				Type = constant
				response = offsetx
				scalemod = -0.05
				responsefunc = costime
				timeoffset = 3.1
				timerate = 1.7453301
			}
			{
				Type = constant
				response = offsetx
				scalemod = 0.05
				responsefunc = sintime
				timeoffset = 3.1
				timerate = 1.7453301
			}
			{
				Type = frequency
				response = scaley
				scalemod = 0.9
				responsefunc = sintime
				timeoffset = 3.1
				timerate = 2.79253
				spectrumband = 0
			}
		]
	}
	{
		Type = sprite
		Pos = (0.9, 0.71)
		width = 0.5
		height = -0.75
		Color = [
			37
			25
			17
			255
		]
		material = tb_mat_flame_a
		angle = -1.5708001
		controls = [
			{
				Type = frequencyonbeat
				response = alphamodulation
				scalemod = -1.0
				responsefunc = costime
				timerate = 6.98132
				spectrumband = 0
			}
			{
				Type = constant
				response = offsetx
				scalemod = -0.05
				responsefunc = costime
				timeoffset = 3.1
				timerate = 1.7453301
			}
			{
				Type = constant
				response = offsetx
				scalemod = 0.05
				responsefunc = sintime
				timeoffset = 3.1
				timerate = 1.7453301
			}
			{
				Type = frequency
				response = scaley
				scalemod = 0.9
				responsefunc = sintime
				timeoffset = 3.1
				timerate = 2.79253
				spectrumband = 0
			}
		]
	}
	{
		Type = sprite
		Pos = (0.2, 0.71)
		width = 0.5
		height = -0.75
		Color = [
			37
			25
			17
			255
		]
		material = tb_mat_flame_a
		angle = 1.5708001
		controls = [
			{
				Type = frequencyonbeat
				response = alphamodulation
				scalemod = -1.0
				responsefunc = costime
				timerate = 6.98132
				spectrumband = 0
			}
			{
				Type = constant
				response = offsetx
				scalemod = -0.05
				responsefunc = costime
				timeoffset = 3.1
				timerate = 1.7453301
			}
			{
				Type = constant
				response = offsetx
				scalemod = 0.05
				responsefunc = sintime
				timeoffset = 3.1
				timerate = 1.7453301
			}
			{
				Type = frequency
				response = scaley
				scalemod = 0.9
				responsefunc = sintime
				timeoffset = 3.1
				timerate = 2.79253
				spectrumband = 0
			}
		]
	}
	{
		Type = sprite
		Pos = (0.5, 0.71)
		width = 0.5
		height = -0.75
		Color = [
			37
			25
			17
			255
		]
		material = tb_mat_flame_a
		angle = 1.5708001
		controls = [
			{
				Type = frequencyonbeat
				response = alphamodulation
				scalemod = -1.0
				responsefunc = costime
				timerate = 6.98132
				spectrumband = 0
			}
			{
				Type = constant
				response = offsetx
				scalemod = -0.05
				responsefunc = costime
				timeoffset = 3.1
				timerate = 1.7453301
			}
			{
				Type = constant
				response = offsetx
				scalemod = 0.05
				responsefunc = sintime
				timeoffset = 3.1
				timerate = 1.7453301
			}
			{
				Type = frequency
				response = scaley
				scalemod = 0.9
				responsefunc = sintime
				timeoffset = 3.1
				timerate = 2.79253
				spectrumband = 0
			}
		]
	}
	{
		Type = sprite
		Pos = (0.5, 0.7)
		width = 0.5
		height = 0.75
		Color = [
			46
			32
			21
			255
		]
		material = tb_mat_flame_a
		angle = 1.5708001
		controls = [
			{
				Type = frequencyonbeat
				response = alphamodulation
				scalemod = -1.0
				responsefunc = costime
				timerate = 6.98132
				spectrumband = 0
			}
			{
				Type = constant
				response = offsetx
				scalemod = 0.05
				responsefunc = costime
				timeoffset = 3.1
				timerate = 1.7453301
			}
			{
				Type = constant
				response = offsetx
				scalemod = -0.05
				responsefunc = sintime
				timeoffset = 3.1
				timerate = 1.7453301
			}
			{
				Type = frequency
				response = scaley
				scalemod = 1.0
				responsefunc = costime
				timeoffset = 3.1
				timerate = 2.79253
				spectrumband = 0
			}
		]
	}
	{
		Type = sprite
		Pos = (0.9, 0.71)
		width = 0.5
		height = 0.75
		Color = [
			46
			32
			21
			255
		]
		material = tb_mat_flame_a
		angle = -1.5708001
		controls = [
			{
				Type = frequencyonbeat
				response = alphamodulation
				scalemod = -1.0
				responsefunc = costime
				timerate = 6.98132
				spectrumband = 0
			}
			{
				Type = constant
				response = offsetx
				scalemod = 0.05
				responsefunc = costime
				timeoffset = 3.1
				timerate = 1.7453301
			}
			{
				Type = constant
				response = offsetx
				scalemod = -0.05
				responsefunc = sintime
				timeoffset = 3.1
				timerate = 1.7453301
			}
			{
				Type = frequency
				response = scaley
				scalemod = 1.0
				responsefunc = costime
				timeoffset = 3.1
				timerate = 2.79253
				spectrumband = 0
			}
		]
	}
	{
		Type = sprite
		Pos = (0.2, 0.71)
		width = 0.5
		height = 0.75
		Color = [
			46
			32
			21
			255
		]
		material = tb_mat_flame_a
		angle = 1.5708001
		controls = [
			{
				Type = frequencyonbeat
				response = alphamodulation
				scalemod = -1.0
				responsefunc = costime
				timerate = 6.98132
				spectrumband = 0
			}
			{
				Type = constant
				response = offsetx
				scalemod = 0.05
				responsefunc = costime
				timeoffset = 3.1
				timerate = 1.7453301
			}
			{
				Type = constant
				response = offsetx
				scalemod = -0.05
				responsefunc = sintime
				timeoffset = 3.1
				timerate = 1.7453301
			}
			{
				Type = frequency
				response = scaley
				scalemod = 1.0
				responsefunc = costime
				timeoffset = 3.1
				timerate = 2.79253
				spectrumband = 0
			}
		]
	}
	{
		Type = sprite
		Pos = (0.25, 0.71)
		width = 0.5
		height = 0.75
		Color = [
			46
			32
			21
			255
		]
		material = tb_mat_flame_a
		angle = 1.5708001
		controls = [
			{
				Type = frequencyonbeat
				response = alphamodulation
				scalemod = -1.0
				responsefunc = costime
				timerate = 6.98132
				spectrumband = 0
			}
			{
				Type = constant
				response = offsetx
				scalemod = 0.05
				responsefunc = costime
				timeoffset = 3.1
				timerate = 1.7453301
			}
			{
				Type = constant
				response = offsetx
				scalemod = -0.05
				responsefunc = sintime
				timeoffset = 3.1
				timerate = 1.7453301
			}
			{
				Type = frequency
				response = scaley
				scalemod = 1.0
				responsefunc = costime
				timeoffset = 3.1
				timerate = 2.79253
				spectrumband = 0
			}
		]
	}
	{
		Type = sprite
		Pos = (0.15, 0.7)
		width = 0.3
		height = 0.7
		Color = [
			255
			199
			114
			0
		]
		material = tb_mat_flame_a
		controls = [
			{
				Type = constant
				response = offsety
				scalemod = 0.3
				responsefunc = costime
				timerate = 2.79253
			}
			{
				Type = constant
				response = offsetx
				scalemod = 0.025
				responsefunc = costime
				timerate = 1.7453301
			}
			{
				Type = constant
				response = offsetx
				scalemod = -0.025
				responsefunc = sintime
				timerate = 1.7453301
			}
			{
				Type = constant
				response = alphamodulation
				scalemod = 0.5
				responsefunc = sintime
				timerate = 2.79253
			}
			{
				Type = constant
				response = scalexy
				scalemod = 0.5
				responsefunc = costime
				timerate = 2.79253
			}
		]
	}
	{
		Type = sprite
		Pos = (0.25, 0.7)
		width = 0.3
		height = 0.7
		Color = [
			255
			199
			114
			0
		]
		material = tb_mat_flame_a
		controls = [
			{
				Type = constant
				response = offsety
				scalemod = 0.3
				responsefunc = costime
				timeoffset = 2.2
				timerate = 2.79253
			}
			{
				Type = constant
				response = offsetx
				scalemod = 0.025
				responsefunc = costime
				timeoffset = 2.2
				timerate = 1.7453301
			}
			{
				Type = constant
				response = offsetx
				scalemod = -0.025
				responsefunc = sintime
				timeoffset = 2.2
				timerate = 1.7453301
			}
			{
				Type = constant
				response = alphamodulation
				scalemod = 0.5
				responsefunc = sintime
				timeoffset = 2.2
				timerate = 2.79253
			}
			{
				Type = constant
				response = scalexy
				scalemod = 0.5
				responsefunc = costime
				timeoffset = 2.2
				timerate = 2.79253
			}
		]
	}
	{
		Type = sprite
		Pos = (0.45000002, 0.7)
		width = 0.3
		height = 0.7
		Color = [
			255
			199
			114
			0
		]
		material = tb_mat_flame_a
		controls = [
			{
				Type = constant
				response = offsety
				scalemod = 0.3
				responsefunc = costime
				timeoffset = 3.1
				timerate = 2.79253
			}
			{
				Type = constant
				response = offsetx
				scalemod = 0.025
				responsefunc = costime
				timeoffset = 3.1
				timerate = 1.7453301
			}
			{
				Type = constant
				response = offsetx
				scalemod = -0.025
				responsefunc = sintime
				timeoffset = 3.1
				timerate = 1.7453301
			}
			{
				Type = constant
				response = alphamodulation
				scalemod = 0.5
				responsefunc = sintime
				timeoffset = 3.1
				timerate = 2.79253
			}
			{
				Type = constant
				response = scalexy
				scalemod = 0.5
				responsefunc = costime
				timeoffset = 3.1
				timerate = 2.79253
			}
		]
	}
	{
		Type = sprite
		Pos = (0.55, 0.7)
		width = 0.3
		height = 0.7
		Color = [
			255
			199
			114
			0
		]
		material = tb_mat_flame_a
		controls = [
			{
				Type = constant
				response = offsety
				scalemod = 0.4
				responsefunc = costime
				timeoffset = 4.2
				timerate = 2.79253
			}
			{
				Type = constant
				response = offsetx
				scalemod = 0.025
				responsefunc = costime
				timeoffset = 4.2
				timerate = 1.7453301
			}
			{
				Type = constant
				response = offsetx
				scalemod = -0.025
				responsefunc = sintime
				timeoffset = 4.2
				timerate = 1.7453301
			}
			{
				Type = constant
				response = alphamodulation
				scalemod = 0.5
				responsefunc = sintime
				timeoffset = 4.2
				timerate = 2.79253
			}
			{
				Type = constant
				response = scalexy
				scalemod = 0.5
				responsefunc = costime
				timeoffset = 4.2
				timerate = 2.79253
			}
		]
	}
	{
		Type = sprite
		Pos = (0.65000004, 0.7)
		width = 0.3
		height = 0.7
		Color = [
			255
			199
			114
			0
		]
		material = tb_mat_flame_a
		controls = [
			{
				Type = constant
				response = offsety
				scalemod = 0.3
				responsefunc = costime
				timeoffset = 5.2
				timerate = 2.79253
			}
			{
				Type = constant
				response = offsetx
				scalemod = 0.025
				responsefunc = costime
				timeoffset = 5.2
				timerate = 1.7453301
			}
			{
				Type = constant
				response = offsetx
				scalemod = -0.025
				responsefunc = sintime
				timeoffset = 5.2
				timerate = 1.7453301
			}
			{
				Type = constant
				response = alphamodulation
				scalemod = 0.5
				responsefunc = sintime
				timeoffset = 5.2
				timerate = 2.79253
			}
			{
				Type = constant
				response = scalexy
				scalemod = 0.5
				responsefunc = costime
				timeoffset = 5.2
				timerate = 2.79253
			}
		]
	}
	{
		Type = sprite
		Pos = (0.25, 0.476)
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
	}
	{
		Type = sprite
		Pos = (0.75, 0.476)
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
	}
	{
		Type = rect
		Pos = (0.5, 0.825)
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
	}
]
