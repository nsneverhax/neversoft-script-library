tb_global_zoom_tunnel_2 = {
	audio_params = {
		main = {
			waveform_dampening = 0
			spectrum_dampening = 0
			spectrum_decay_amount = 0.75
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
			Scale = (1.0, 1.5)
			width = 1.0
			height = 1.0
			Color = [
				74
				0
				112
				255
			]
			material = tb_mat_gradient
			angle = 0
			angularvel = 0
		}
		{
			Type = circle
			Pos = (0.5, 0.5, 0.0)
			radius = 0.02
			Color = [
				88
				75
				17
				22
			]
			color2 = [
				255
				132
				0
				255
			]
			BlendMode = blend
			thickness = 1.0
			angle = 0
			angularvel = 0.26179898
			controls = [
				{
					Type = beaton
					response = radiusscale
					scalemod = 0.01
					fade = 0.1
				}
			]
		}
		{
			Type = blendprev
			offset = (0.0, 0.0)
			Scale = (0.895, 0.895)
			Color = [
				252
				252
				252
				254
			]
			angle = 0.0
			angularvel = 0.0
			BlendMode = blend
			controls = [
				{
					Type = beaton
					response = green2modulation
					scalemod = 3.4
					responsefunc = sintimescalerate
					fade = 0.3
				}
			]
		}
		{
			Type = sprite
			Pos = (0.5, 0.5, 0.0)
			Scale = (0.01, 0.01)
			width = 0.75
			height = 0.75
			Color = [
				255
				241
				227
				133
			]
			material = og_mat_sphere_add
			angle = 0
			angularvel = 1.5708001
			controls = [
				{
					Type = frequency
					response = radiusscale
					scalemod = 0.5
					spectrumband = 0
				}
				{
					Type = frequencyonbeat
					response = green2modulation
					scalemod = 1.0
					spectrumband = 0
				}
			]
		}
	]
}
