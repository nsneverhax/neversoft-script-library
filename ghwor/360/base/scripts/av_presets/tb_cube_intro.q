tb_cube_intro = {
	bloom_params = {
		On = 1
		fullscreen = 1
		MaterialFilter = 0
		subtract = [
			0.6235291
			0.69019604
			0.74902004
			0.0
		]
		colormodulate = [
			1.0
			1.0
			1.0
			0.8
		]
		saturaion = 1.0
	}
	primitives = [
		{
			Type = blendprev
			offset = (0.0, -0.005)
			Scale = (0.98999995, 0.97999996)
			Color = [
				239
				233
				246
				254
			]
			BlendMode = blend
		}
		{
			Type = sprite
			Pos = (0.5, 0.5, 0.0)
			width = 1.0
			height = 1.0
			Color = [
				56
				54
				62
				255
			]
			material = tb_mat_space_bkgrnd
			controls = [
				{
					Type = constant
					response = brightnessmodulation
					scalemod = 0.1
					responsefunc = sintime
					timerate = 0.872665
				}
			]
		}
		{
			Type = sprite
			Pos = (0.5, 0.5)
			width = 1.0
			height = 1.0
			Color = [
				187
				214
				218
				255
			]
			material = tb_mat_space3_bkgrnd
		}
		{
			Type = sprite
			Pos = (0.15, 0.7)
			width = 0.3
			height = 0.7
			Color = [
				100
				150
				161
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
				100
				150
				161
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
				100
				150
				161
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
				100
				150
				161
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
				100
				150
				161
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
			Pos = (0.75, 0.7)
			width = 0.3
			height = 0.7
			Color = [
				100
				150
				161
				0
			]
			material = tb_mat_flame_a
			controls = [
				{
					Type = constant
					response = offsety
					scalemod = 0.3
					responsefunc = costime
					timeoffset = 2.7
					timerate = 2.79253
				}
				{
					Type = constant
					response = offsetx
					scalemod = 0.025
					responsefunc = costime
					timeoffset = 2.7
					timerate = 1.7453301
				}
				{
					Type = constant
					response = offsetx
					scalemod = -0.025
					responsefunc = sintime
					timeoffset = 2.7
					timerate = 1.7453301
				}
				{
					Type = constant
					response = alphamodulation
					scalemod = 0.5
					responsefunc = sintime
					timeoffset = 2.7
					timerate = 2.79253
				}
				{
					Type = constant
					response = scalexy
					scalemod = 0.5
					responsefunc = costime
					timeoffset = 2.7
					timerate = 2.79253
				}
			]
		}
		{
			Type = sprite
			Pos = (0.95, 0.7)
			width = 0.3
			height = 0.7
			Color = [
				100
				150
				161
				0
			]
			material = tb_mat_flame_a
			controls = [
				{
					Type = constant
					response = offsety
					scalemod = 0.3
					responsefunc = costime
					timeoffset = 1.7
					timerate = 2.79253
				}
				{
					Type = constant
					response = offsetx
					scalemod = 0.025
					responsefunc = costime
					timeoffset = 1.7
					timerate = 1.7453301
				}
				{
					Type = constant
					response = offsetx
					scalemod = -0.025
					responsefunc = sintime
					timeoffset = 1.7
					timerate = 1.7453301
				}
				{
					Type = constant
					response = alphamodulation
					scalemod = 0.5
					responsefunc = sintime
					timeoffset = 1.7
					timerate = 2.79253
				}
				{
					Type = constant
					response = scalexy
					scalemod = 0.5
					responsefunc = costime
					timeoffset = 1.7
					timerate = 2.79253
				}
			]
		}
		{
			Type = sprite
			Pos = (0.25, 0.71)
			width = 0.5
			height = 0.75
			Color = [
				9
				15
				20
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
			Pos = (0.2, 0.71)
			width = 0.5
			height = 0.75
			Color = [
				9
				15
				20
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
				9
				15
				20
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
			Pos = (0.5, 0.7)
			width = 0.5
			height = 0.75
			Color = [
				9
				15
				20
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
			Pos = (0.5, 0.71)
			width = 0.5
			height = -0.75
			Color = [
				9
				15
				20
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
			Pos = (0.2, 0.71)
			width = 0.5
			height = -0.75
			Color = [
				9
				15
				20
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
				9
				15
				20
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
			Pos = (0.5, 0.7)
			width = 0.5
			height = -0.75
			Color = [
				9
				15
				20
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
			Pos = (0.5, 0.9)
			Scale = (1.0, 0.252)
			width = 1.0
			height = 1.0
			Color = [
				253
				242
				255
				255
			]
			material = tb_mat_gradient2
		}
		{
			Type = sprite
			Pos = (0.1, 0.5)
			width = 0.02
			height = 0.02
			Color = [
				114
				255
				234
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
			Pos = (0.45000002, 0.5)
			width = 0.02
			height = 0.02
			Color = [
				114
				255
				234
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
			Pos = (0.75, 0.6)
			width = 0.02
			height = 0.02
			Color = [
				114
				255
				234
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
			Pos = (0.2, 0.5)
			width = 0.02
			height = 0.02
			Color = [
				114
				255
				234
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
			Pos = (0.6, 0.6)
			width = 0.02
			height = 0.02
			Color = [
				114
				255
				234
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
			Pos = (0.66, 0.575)
			width = 0.02
			height = 0.02
			Color = [
				114
				255
				234
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
			Pos = (0.4, 0.575)
			width = 0.02
			height = 0.02
			Color = [
				114
				255
				234
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
			Type = sprite
			Pos = (0.275, 0.65000004)
			width = 0.02
			height = 0.02
			Color = [
				114
				255
				234
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
			Type = sprite
			Pos = (0.575, 0.61)
			width = 0.02
			height = 0.02
			Color = [
				114
				255
				234
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
	]
}
