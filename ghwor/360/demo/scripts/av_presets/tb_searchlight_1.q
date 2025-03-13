tb_searchlight_1 = {
	viewport_params = {
		clearcolor = [
			4
			1
			11
			255
		]
		blendmode = diffuse
		alphafromgray = 1
	}
	bloom_params = {
		on = 1
		fullscreen = 1
		materialfilter = 0
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
			type = sprite
			pos = (0.5, 0.5, 0.0)
			scale = (1.0, 2.0)
			width = 1.0
			height = 1.0
			color = [
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
					type = frequencyonbeat
					response = huemodulation
					scalemod = 0.95
					spectrumband = 0
				}
			]
		}
		{
			type = nstar2
			pos = (0.0, 1.0, 0.0)
			npoints = 19
			radius = 0.05
			radius2 = 2.0
			color = [
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
			blendmode = add
			thickness = 8.0
			angle = 0
			angularvel = 0.17453298
		}
		{
			type = nstar2
			pos = (1.0, 1.0, 0.0)
			npoints = 19
			radius = 0.05
			radius2 = 2.0
			color = [
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
			blendmode = add
			thickness = 8.0
			angle = 0
			angularvel = -0.17453298
		}
	]
}
