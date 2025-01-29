tb_searchlight_1 = {
	viewport_params = {
		clearcolor = [
			4
			1
			11
			255
		]
		BlendMode = diffuse
		alphafromgray = 1
	}
	bloom_params = {
		On = 1
		fullscreen = 1
		MaterialFilter = 0
		subtract = [
			0
			0
			0
			0
		]
		colormodulate = [
			1.0
			1.0
			1.0
			0.8
		]
		saturaion = 1.0
	}
	audio_params = {
		main = {
			waveform_dampening = 2
			spectrum_dampening = 0
			spectrum_decay_amount = 0.85
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
			Type = sprite
			Pos = (0.5, 0.5, 0.0)
			Scale = (1.0, 2.0)
			width = 1.0
			height = 1.0
			Color = [
				25
				34
				103
				255
			]
			material = tb_mat_gradient
			angle = 0
			angularvel = 0
			controls = [
				{
					Type = frequencyonbeat
					response = huemodulation
					scalemod = 0.95
					spectrumband = 0
				}
			]
		}
		{
			Type = nstar2
			Pos = (0.0, 1.0, 0.0)
			npoints = 19
			radius = 0.05
			radius2 = 2.0
			Color = [
				87
				90
				0
				255
			]
			color2 = [
				240
				71
				232
				139
			]
			BlendMode = add
			thickness = 8.0
			angle = 0
			angularvel = 0.17453298
		}
		{
			Type = nstar2
			Pos = (1.0, 1.0, 0.0)
			npoints = 19
			radius = 0.05
			radius2 = 2.0
			Color = [
				87
				90
				0
				255
			]
			color2 = [
				240
				71
				232
				139
			]
			BlendMode = add
			thickness = 8.0
			angle = 0
			angularvel = -0.17453298
		}
	]
}
