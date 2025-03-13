tb_cube_blackout = {
	bloom_params = {
		on = 1
		fullscreen = 1
		materialfilter = 0
		subtract = [
			0.8313729
			0.92548996
			1.0
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
			type = blendprev
			offset = (0.0, -0.005)
			scale = (0.98999995, 0.97999996)
			color = [
				246
				241
				253
				254
			]
			blendmode = blend
		}
		{
			type = sprite
			pos = (0.5, 0.5, 0.0)
			width = 1.0
			height = 1.0
			color = [
				7
				6
				7
				255
			]
			material = tb_mat_space_bkgrnd
			controls = [
				{
					type = frequency
					response = brightnessmodulation
					scalemod = 1.4
					responsefunc = costime
					spectrumband = 0
				}
			]
		}
		{
			type = sprite
			pos = (0.5, 0.5, 0.0)
			width = 1.0
			height = 1.0
			color = [
				187
				214
				218
				255
			]
			material = tb_mat_space3_bkgrnd
		}
		{
			type = sprite
			pos = (0.15, 0.7)
			width = 0.3
			height = 0.7
			color = [
				91
				140
				238
				0
			]
			material = tb_mat_flame_a
			controls = [
				{
					type = constant
					response = offsety
					scalemod = 0.3
					responsefunc = costime
					timerate = 2.79253
				}
				{
					type = constant
					response = offsetx
					scalemod = 0.025
					responsefunc = costime
					timerate = 1.7453301
				}
				{
					type = constant
					response = offsetx
					scalemod = -0.025
					responsefunc = sintime
					timerate = 1.7453301
				}
				{
					type = constant
					response = alphamodulation
					scalemod = 0.5
					responsefunc = sintime
					timerate = 2.79253
				}
				{
					type = constant
					response = scalexy
					scalemod = 0.5
					responsefunc = costime
					timerate = 2.79253
				}
			]
		}
		{
			type = sprite
			pos = (0.25, 0.7)
			width = 0.3
			height = 0.7
			color = [
				91
				140
				238
				0
			]
			material = tb_mat_flame_a
			controls = [
				{
					type = constant
					response = offsety
					scalemod = 0.3
					responsefunc = costime
					timeoffset = 2.2
					timerate = 2.79253
				}
				{
					type = constant
					response = offsetx
					scalemod = 0.025
					responsefunc = costime
					timeoffset = 2.2
					timerate = 1.7453301
				}
				{
					type = constant
					response = offsetx
					scalemod = -0.025
					responsefunc = sintime
					timeoffset = 2.2
					timerate = 1.7453301
				}
				{
					type = constant
					response = alphamodulation
					scalemod = 0.5
					responsefunc = sintime
					timeoffset = 2.2
					timerate = 2.79253
				}
				{
					type = constant
					response = scalexy
					scalemod = 0.5
					responsefunc = costime
					timeoffset = 2.2
					timerate = 2.79253
				}
			]
		}
		{
			type = sprite
			pos = (0.45000002, 0.7)
			width = 0.3
			height = 0.7
			color = [
				91
				140
				238
				0
			]
			material = tb_mat_flame_a
			controls = [
				{
					type = constant
					response = offsety
					scalemod = 0.3
					responsefunc = costime
					timeoffset = 3.1
					timerate = 2.79253
				}
				{
					type = constant
					response = offsetx
					scalemod = 0.025
					responsefunc = costime
					timeoffset = 3.1
					timerate = 1.7453301
				}
				{
					type = constant
					response = offsetx
					scalemod = -0.025
					responsefunc = sintime
					timeoffset = 3.1
					timerate = 1.7453301
				}
				{
					type = constant
					response = alphamodulation
					scalemod = 0.5
					responsefunc = sintime
					timeoffset = 3.1
					timerate = 2.79253
				}
				{
					type = constant
					response = scalexy
					scalemod = 0.5
					responsefunc = costime
					timeoffset = 3.1
					timerate = 2.79253
				}
			]
		}
		{
			type = sprite
			pos = (0.55, 0.7)
			width = 0.3
			height = 0.7
			color = [
				91
				140
				238
				0
			]
			material = tb_mat_flame_a
			controls = [
				{
					type = constant
					response = offsety
					scalemod = 0.4
					responsefunc = costime
					timeoffset = 4.2
					timerate = 2.79253
				}
				{
					type = constant
					response = offsetx
					scalemod = 0.025
					responsefunc = costime
					timeoffset = 4.2
					timerate = 1.7453301
				}
				{
					type = constant
					response = offsetx
					scalemod = -0.025
					responsefunc = sintime
					timeoffset = 4.2
					timerate = 1.7453301
				}
				{
					type = constant
					response = alphamodulation
					scalemod = 0.5
					responsefunc = sintime
					timeoffset = 4.2
					timerate = 2.79253
				}
				{
					type = constant
					response = scalexy
					scalemod = 0.5
					responsefunc = costime
					timeoffset = 4.2
					timerate = 2.79253
				}
			]
		}
		{
			type = sprite
			pos = (0.65000004, 0.7)
			width = 0.3
			height = 0.7
			color = [
				91
				140
				238
				0
			]
			material = tb_mat_flame_a
			controls = [
				{
					type = constant
					response = offsety
					scalemod = 0.3
					responsefunc = costime
					timeoffset = 5.2
					timerate = 2.79253
				}
				{
					type = constant
					response = offsetx
					scalemod = 0.025
					responsefunc = costime
					timeoffset = 5.2
					timerate = 1.7453301
				}
				{
					type = constant
					response = offsetx
					scalemod = -0.025
					responsefunc = sintime
					timeoffset = 5.2
					timerate = 1.7453301
				}
				{
					type = constant
					response = alphamodulation
					scalemod = 0.5
					responsefunc = sintime
					timeoffset = 5.2
					timerate = 2.79253
				}
				{
					type = constant
					response = scalexy
					scalemod = 0.5
					responsefunc = costime
					timeoffset = 5.2
					timerate = 2.79253
				}
			]
		}
		{
			type = sprite
			pos = (0.75, 0.7)
			width = 0.3
			height = 0.7
			color = [
				91
				140
				238
				0
			]
			material = tb_mat_flame_a
			controls = [
				{
					type = constant
					response = offsety
					scalemod = 0.3
					responsefunc = costime
					timeoffset = 2.7
					timerate = 2.79253
				}
				{
					type = constant
					response = offsetx
					scalemod = 0.025
					responsefunc = costime
					timeoffset = 2.7
					timerate = 1.7453301
				}
				{
					type = constant
					response = offsetx
					scalemod = -0.025
					responsefunc = sintime
					timeoffset = 2.7
					timerate = 1.7453301
				}
				{
					type = constant
					response = alphamodulation
					scalemod = 0.5
					responsefunc = sintime
					timeoffset = 2.7
					timerate = 2.79253
				}
				{
					type = constant
					response = scalexy
					scalemod = 0.5
					responsefunc = costime
					timeoffset = 2.7
					timerate = 2.79253
				}
			]
		}
		{
			type = sprite
			pos = (0.95, 0.7)
			width = 0.3
			height = 0.7
			color = [
				91
				140
				238
				0
			]
			material = tb_mat_flame_a
			controls = [
				{
					type = constant
					response = offsety
					scalemod = 0.3
					responsefunc = costime
					timeoffset = 1.7
					timerate = 2.79253
				}
				{
					type = constant
					response = offsetx
					scalemod = 0.025
					responsefunc = costime
					timeoffset = 1.7
					timerate = 1.7453301
				}
				{
					type = constant
					response = offsetx
					scalemod = -0.025
					responsefunc = sintime
					timeoffset = 1.7
					timerate = 1.7453301
				}
				{
					type = constant
					response = alphamodulation
					scalemod = 0.5
					responsefunc = sintime
					timeoffset = 1.7
					timerate = 2.79253
				}
				{
					type = constant
					response = scalexy
					scalemod = 0.5
					responsefunc = costime
					timeoffset = 1.7
					timerate = 2.79253
				}
			]
		}
		{
			type = sprite
			pos = (0.25, 0.71)
			width = 0.5
			height = 0.75
			color = [
				9
				15
				20
				255
			]
			material = tb_mat_flame_a
			angle = 1.5708001
			controls = [
				{
					type = frequencyonbeat
					response = alphamodulation
					scalemod = -1.0
					responsefunc = costime
					timerate = 6.98132
					spectrumband = 0
				}
				{
					type = constant
					response = offsetx
					scalemod = 0.05
					responsefunc = costime
					timeoffset = 3.1
					timerate = 1.7453301
				}
				{
					type = constant
					response = offsetx
					scalemod = -0.05
					responsefunc = sintime
					timeoffset = 3.1
					timerate = 1.7453301
				}
				{
					type = frequency
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
			type = sprite
			pos = (0.2, 0.71)
			width = 0.5
			height = 0.75
			color = [
				9
				15
				20
				255
			]
			material = tb_mat_flame_a
			angle = 1.5708001
			controls = [
				{
					type = frequencyonbeat
					response = alphamodulation
					scalemod = -1.0
					responsefunc = costime
					timerate = 6.98132
					spectrumband = 0
				}
				{
					type = constant
					response = offsetx
					scalemod = 0.05
					responsefunc = costime
					timeoffset = 3.1
					timerate = 1.7453301
				}
				{
					type = constant
					response = offsetx
					scalemod = -0.05
					responsefunc = sintime
					timeoffset = 3.1
					timerate = 1.7453301
				}
				{
					type = frequency
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
			type = sprite
			pos = (0.9, 0.71)
			width = 0.5
			height = 0.75
			color = [
				9
				15
				20
				255
			]
			material = tb_mat_flame_a
			angle = -1.5708001
			controls = [
				{
					type = frequencyonbeat
					response = alphamodulation
					scalemod = -1.0
					responsefunc = costime
					timerate = 6.98132
					spectrumband = 0
				}
				{
					type = constant
					response = offsetx
					scalemod = 0.05
					responsefunc = costime
					timeoffset = 3.1
					timerate = 1.7453301
				}
				{
					type = constant
					response = offsetx
					scalemod = -0.05
					responsefunc = sintime
					timeoffset = 3.1
					timerate = 1.7453301
				}
				{
					type = frequency
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
			type = sprite
			pos = (0.5, 0.7)
			width = 0.5
			height = 0.75
			color = [
				9
				15
				20
				255
			]
			material = tb_mat_flame_a
			angle = 1.5708001
			controls = [
				{
					type = frequencyonbeat
					response = alphamodulation
					scalemod = -1.0
					responsefunc = costime
					timerate = 6.98132
					spectrumband = 0
				}
				{
					type = constant
					response = offsetx
					scalemod = 0.05
					responsefunc = costime
					timeoffset = 3.1
					timerate = 1.7453301
				}
				{
					type = constant
					response = offsetx
					scalemod = -0.05
					responsefunc = sintime
					timeoffset = 3.1
					timerate = 1.7453301
				}
				{
					type = frequency
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
			type = sprite
			pos = (0.5, 0.71)
			width = 0.5
			height = -0.75
			color = [
				9
				15
				20
				255
			]
			material = tb_mat_flame_a
			angle = 1.5708001
			controls = [
				{
					type = frequencyonbeat
					response = alphamodulation
					scalemod = -1.0
					responsefunc = costime
					timerate = 6.98132
					spectrumband = 0
				}
				{
					type = constant
					response = offsetx
					scalemod = -0.05
					responsefunc = costime
					timeoffset = 3.1
					timerate = 1.7453301
				}
				{
					type = constant
					response = offsetx
					scalemod = 0.05
					responsefunc = sintime
					timeoffset = 3.1
					timerate = 1.7453301
				}
				{
					type = frequency
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
			type = sprite
			pos = (0.2, 0.71)
			width = 0.5
			height = -0.75
			color = [
				9
				15
				20
				255
			]
			material = tb_mat_flame_a
			angle = 1.5708001
			controls = [
				{
					type = frequencyonbeat
					response = alphamodulation
					scalemod = -1.0
					responsefunc = costime
					timerate = 6.98132
					spectrumband = 0
				}
				{
					type = constant
					response = offsetx
					scalemod = -0.05
					responsefunc = costime
					timeoffset = 3.1
					timerate = 1.7453301
				}
				{
					type = constant
					response = offsetx
					scalemod = 0.05
					responsefunc = sintime
					timeoffset = 3.1
					timerate = 1.7453301
				}
				{
					type = frequency
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
			type = sprite
			pos = (0.9, 0.71)
			width = 0.5
			height = -0.75
			color = [
				9
				15
				20
				255
			]
			material = tb_mat_flame_a
			angle = -1.5708001
			controls = [
				{
					type = frequencyonbeat
					response = alphamodulation
					scalemod = -1.0
					responsefunc = costime
					timerate = 6.98132
					spectrumband = 0
				}
				{
					type = constant
					response = offsetx
					scalemod = -0.05
					responsefunc = costime
					timeoffset = 3.1
					timerate = 1.7453301
				}
				{
					type = constant
					response = offsetx
					scalemod = 0.05
					responsefunc = sintime
					timeoffset = 3.1
					timerate = 1.7453301
				}
				{
					type = frequency
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
			type = sprite
			pos = (0.5, 0.7)
			width = 0.5
			height = -0.75
			color = [
				9
				15
				20
				255
			]
			material = tb_mat_flame_a
			angle = 1.5708001
			controls = [
				{
					type = frequencyonbeat
					response = alphamodulation
					scalemod = -1.0
					responsefunc = costime
					timerate = 6.98132
					spectrumband = 0
				}
				{
					type = constant
					response = offsetx
					scalemod = -0.05
					responsefunc = costime
					timeoffset = 3.1
					timerate = 1.7453301
				}
				{
					type = constant
					response = offsetx
					scalemod = 0.05
					responsefunc = sintime
					timeoffset = 3.1
					timerate = 1.7453301
				}
				{
					type = frequency
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
			type = sprite
			pos = (0.5, 0.85)
			scale = (1.0, 0.35200003)
			width = 1.0
			height = 1.0
			color = [
				253
				242
				255
				255
			]
			material = tb_mat_gradient2
		}
		{
			type = sprite
			pos = (0.1, 0.5)
			width = 0.02
			height = 0.02
			color = [
				114
				255
				234
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
			pos = (0.45000002, 0.5)
			width = 0.02
			height = 0.02
			color = [
				114
				255
				234
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
			pos = (0.75, 0.6)
			width = 0.02
			height = 0.02
			color = [
				114
				255
				234
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
			pos = (0.2, 0.57)
			width = 0.02
			height = 0.02
			color = [
				114
				255
				234
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
			pos = (0.6, 0.55)
			width = 0.02
			height = 0.02
			color = [
				114
				255
				234
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
			pos = (0.66, 0.575)
			width = 0.02
			height = 0.02
			color = [
				114
				255
				234
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
			pos = (0.4, 0.475)
			width = 0.02
			height = 0.02
			color = [
				114
				255
				234
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
			pos = (0.575, 0.525)
			width = 0.02
			height = 0.02
			color = [
				114
				255
				234
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
			pos = (0.575, 0.625)
			width = 0.02
			height = 0.02
			color = [
				114
				255
				234
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
	]
}
