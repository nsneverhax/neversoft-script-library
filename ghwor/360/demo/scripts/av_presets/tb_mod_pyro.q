tb_mod_pyro = {
	audio_params = {
		main = {
			waveform_dampening = 10
			spectrum_dampening = 5
			spectrum_decay_amount = 1.0
			spectrum_normalize = 1
			spectrum_windowing = 1
		}
		p1 = {
			raw_audio_dampening = 0
		}
		p2 = {
			raw_audio_dampening = 0
		}
		p3 = {
			raw_audio_dampening = 0
		}
		p4 = {
			raw_audio_dampening = 0
		}
	}
	primitives = [
		{
			type = sprite
			pos = (0.5, 0.4)
			scale = (1.0, -1.0)
			width = 1.0
			height = 1.0
			color = [
				61
				31
				2
				255
			]
			material = tb_mat_gradient
			angle = 0
			angularvel = 0
			controls = [
				{
					type = constant
					response = brightnessmodulation
					scalemod = 0.1
					responsefunc = costime
					timerate = 0.872665
				}
			]
		}
		{
			type = sprite
			pos = (0.1, 0.3)
			scale = (1.0, 1.0)
			width = 0.02
			height = 0.02
			color = [
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
			pos = (0.75, 0.2)
			scale = (1.0, 1.0)
			width = 0.02
			height = 0.02
			color = [
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
			pos = (0.45000002, 0.3)
			scale = (1.0, 1.0)
			width = 0.02
			height = 0.02
			color = [
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
			pos = (0.4, 0.275)
			scale = (1.0, 1.0)
			width = 0.02
			height = 0.02
			color = [
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
			pos = (0.575, 0.3)
			scale = (1.0, 1.0)
			width = 0.02
			height = 0.02
			color = [
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
			pos = (0.25, 0.71)
			scale = (1.0, 1.0)
			width = 0.5
			height = 0.75
			color = [
				46
				32
				21
				255
			]
			material = tb_mat_flame_a
			angle = 1.5708001
			angularvel = 0
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
			scale = (1.0, 1.0)
			width = 0.5
			height = 0.75
			color = [
				46
				32
				21
				255
			]
			material = tb_mat_flame_a
			angle = 1.5708001
			angularvel = 0
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
			scale = (1.0, 1.0)
			width = 0.5
			height = 0.75
			color = [
				46
				32
				21
				255
			]
			material = tb_mat_flame_a
			angle = -1.5708001
			angularvel = 0
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
			pos = (0.66, 0.275)
			scale = (1.0, 1.0)
			width = 0.02
			height = 0.02
			color = [
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
			pos = (0.2, 0.3)
			scale = (1.0, 1.0)
			width = 0.02
			height = 0.02
			color = [
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
			pos = (0.5, 0.7)
			scale = (1.0, 1.0)
			width = 0.5
			height = 0.75
			color = [
				46
				32
				21
				255
			]
			material = tb_mat_flame_a
			angle = 1.5708001
			angularvel = 0
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
			pos = (0.15, 0.7)
			scale = (1.0, 1.0)
			width = 0.3
			height = 0.7
			color = [
				255
				199
				114
				0
			]
			material = tb_mat_flame_a
			angle = 0
			angularvel = 0
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
			scale = (1.0, 1.0)
			width = 0.3
			height = 0.7
			color = [
				255
				199
				114
				0
			]
			material = tb_mat_flame_a
			angle = 0
			angularvel = 0
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
			pos = (0.575, 0.3)
			scale = (1.0, 1.0)
			width = 0.02
			height = 0.02
			color = [
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
			scale = (1.0, 1.0)
			width = 0.02
			height = 0.02
			color = [
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
			pos = (0.45000002, 0.7)
			scale = (1.0, 1.0)
			width = 0.3
			height = 0.7
			color = [
				255
				199
				114
				0
			]
			material = tb_mat_flame_a
			angle = 0
			angularvel = 0
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
			scale = (1.0, 1.0)
			width = 0.3
			height = 0.7
			color = [
				255
				199
				114
				0
			]
			material = tb_mat_flame_a
			angle = 0
			angularvel = 0
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
			scale = (1.0, 1.0)
			width = 0.3
			height = 0.7
			color = [
				255
				199
				114
				0
			]
			material = tb_mat_flame_a
			angle = 0
			angularvel = 0
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
			scale = (1.0, 1.0)
			width = 0.3
			height = 0.7
			color = [
				255
				199
				114
				0
			]
			material = tb_mat_flame_a
			angle = 0
			angularvel = 0
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
			scale = (1.0, 1.0)
			width = 0.3
			height = 0.7
			color = [
				255
				199
				114
				0
			]
			material = tb_mat_flame_a
			angle = 0
			angularvel = 0
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
			pos = (0.5, 0.7)
			scale = (1.0, 1.0)
			width = 0.5
			height = -0.75
			color = [
				37
				25
				17
				255
			]
			material = tb_mat_flame_a
			angle = 1.5708001
			angularvel = 0
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
			scale = (1.0, 1.0)
			width = 0.5
			height = -0.75
			color = [
				37
				25
				17
				255
			]
			material = tb_mat_flame_a
			angle = -1.5708001
			angularvel = 0
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
			scale = (1.0, 1.0)
			width = 0.5
			height = -0.75
			color = [
				37
				25
				17
				255
			]
			material = tb_mat_flame_a
			angle = 1.5708001
			angularvel = 0
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
			pos = (0.5, 0.71)
			scale = (1.0, 1.0)
			width = 0.5
			height = -0.75
			color = [
				37
				25
				17
				255
			]
			material = tb_mat_flame_a
			angle = 1.5708001
			angularvel = 0
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
	]
}
