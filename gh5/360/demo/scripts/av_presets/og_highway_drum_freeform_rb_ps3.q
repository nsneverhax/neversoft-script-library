og_highway_drum_freeform_rb_ps3 = [
	{
		type = blendprev
		offset = (0.0, -0.01)
		scale = (1.0, 0.98999995)
		color = [
			250
			249
			255
			252
		]
		angle = 0
		angularvel = 0
		blendmode = blend
	}
	{
		type = sprite
		pos = (0.6225, 0.88, 0.0)
		scale = (1.0, 1.0)
		width = 0.25
		height = 2.0
		color = [
			1
			1
			1
			51
		]
		material = og_mat_flare_add
		angle = 0
		angularvel = 0
		controls = [
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				alldrummers
				gemcolor = blue
				fade = 0.5
			}
		]
	}
	{
		type = circle
		pos = (0.6225, 0.88, 0.0)
		radius = 0.01
		color = [
			0
			95
			255
			0
		]
		blendmode = blend
		thickness = 1.0
		angle = 0
		angularvel = 0.0
		controls = [
			{
				type = waveform
				response = deform
				scalemod = 50.0
			}
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				alldrummers
				gemcolor = blue
				fade = 0.5
			}
			{
				type = notehit
				response = radiusscale
				scalemod = 0.1
				alldrummers
				gemcolor = blue
				fade = 0.2
			}
		]
	}
	{
		type = sprite
		pos = (0.6225, 0.88, 0.0)
		scale = (1.0, 1.0)
		width = 0.5
		height = 0.125
		color = [
			26
			14
			14
			0
		]
		material = og_mat_flare_blend
		angle = 0
		angularvel = 0
		controls = [
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				alldrummers
				gemcolor = blue
				fade = 0.5
			}
		]
	}
	{
		type = hypotrochoid
		pos = (0.6225, 0.88, 0.0)
		scale = (0.5, 0.5)
		length = 0.05
		innerradius = 0.25
		outerradius = 0.05
		color = [
			255
			255
			255
			0
		]
		material = og_mat_flare_add
		thickness = 40.0
		angularvel = 99.53539
		controls = [
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				alldrummers
				gemcolor = blue
				fade = 0.5
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 1.0
		color = [
			147
			0
			255
			56
		]
		blendmode = add
		thickness = 1.0
		angle = 1.5708001
		angularvel = 0
		controls = [
			{
				type = history
				historytype = meandbs
				response = deform
				scalemod = 600.0
				responsefunc = sintime
				alldrummers
			}
			{
				type = gamepaused
				response = alphamodulation
				scalemod = -0.5
				fade = 1.0
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 1.0
		color = [
			147
			0
			255
			56
		]
		blendmode = add
		thickness = 1.0
		angle = 1.5708001
		angularvel = 0
		controls = [
			{
				type = history
				historytype = meandbs
				response = deform
				scalemod = -600.0
				responsefunc = sintime
				alldrummers
			}
			{
				type = gamepaused
				response = alphamodulation
				scalemod = -0.5
				fade = 1.0
			}
		]
	}
	{
		type = sprite
		pos = (0.125, 0.88, 0.0)
		scale = (1.0, 1.0)
		width = 0.5
		height = 2.0
		color = [
			1
			1
			1
			25
		]
		material = og_mat_flare_add
		angle = 0
		angularvel = 0
		controls = [
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				alldrummers
				gemcolor = red
				fade = 0.5
			}
		]
	}
	{
		type = circle
		pos = (0.125, 0.88, 0.0)
		radius = 0.01
		color = [
			202
			35
			0
			0
		]
		blendmode = add
		thickness = 1.0
		angle = 0
		angularvel = 0.0
		controls = [
			{
				type = waveform
				response = deform
				scalemod = 50.0
			}
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				alldrummers
				gemcolor = red
				fade = 0.5
			}
			{
				type = notehit
				response = radiusscale
				scalemod = 0.1
				alldrummers
				gemcolor = red
				fade = 0.2
			}
		]
	}
	{
		type = sprite
		pos = (0.125, 0.88, 0.0)
		scale = (1.0, 1.0)
		width = 0.5
		height = 0.125
		color = [
			26
			14
			14
			0
		]
		material = og_mat_flare_blend
		angle = 0
		angularvel = 0
		controls = [
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				alldrummers
				gemcolor = red
				fade = 0.5
			}
		]
	}
	{
		type = sprite
		pos = (0.37600002, 0.88, 0.0)
		scale = (1.0, 1.0)
		width = 0.25
		height = 2.0
		color = [
			1
			1
			1
			51
		]
		material = og_mat_flare_add
		angle = 0
		angularvel = 0
		controls = [
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				alldrummers
				gemcolor = yellow
				fade = 0.5
			}
		]
	}
	{
		type = circle
		pos = (0.37600002, 0.88, 0.0)
		radius = 0.01
		color = [
			255
			238
			0
			0
		]
		blendmode = blend
		thickness = 1.0
		angle = 0
		angularvel = 0.0
		controls = [
			{
				type = waveform
				response = deform
				scalemod = 50.0
			}
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				alldrummers
				gemcolor = yellow
				fade = 0.5
			}
			{
				type = notehit
				response = radiusscale
				scalemod = 0.1
				alldrummers
				gemcolor = yellow
				fade = 0.2
			}
		]
	}
	{
		type = sprite
		pos = (0.37600002, 0.88, 0.0)
		scale = (1.0, 1.0)
		width = 0.5
		height = 0.125
		color = [
			26
			14
			14
			0
		]
		material = og_mat_flare_blend
		angle = 0
		angularvel = 0
		controls = [
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				alldrummers
				gemcolor = yellow
				fade = 0.5
			}
		]
	}
	{
		type = hypotrochoid
		pos = (0.37600002, 0.88, 0.0)
		scale = (0.5, 0.5)
		length = 0.05
		innerradius = 0.25
		outerradius = 0.05
		color = [
			255
			255
			255
			0
		]
		material = og_mat_flare_add
		thickness = 30.0
		angularvel = 106.517006
		controls = [
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				alldrummers
				gemcolor = yellow
				fade = 0.5
			}
		]
	}
	{
		type = sprite
		pos = (0.875, 0.88, 0.0)
		scale = (1.0, 1.0)
		width = 0.25
		height = 2.0
		color = [
			1
			1
			1
			51
		]
		material = og_mat_flare_add
		angle = 0
		angularvel = 0
		controls = [
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				alldrummers
				gemcolor = green
				fade = 0.2
			}
		]
	}
	{
		type = circle
		pos = (0.875, 0.88, 0.0)
		radius = 0.01
		color = [
			143
			255
			37
			0
		]
		blendmode = blend
		thickness = 1.0
		angle = 0
		angularvel = 0.0
		controls = [
			{
				type = waveform
				response = deform
				scalemod = 50.0
			}
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				alldrummers
				gemcolor = green
				fade = 0.5
			}
			{
				type = notehit
				response = radiusscale
				scalemod = 0.1
				alldrummers
				gemcolor = green
				fade = 0.2
			}
		]
	}
	{
		type = sprite
		pos = (0.875, 0.88, 0.0)
		scale = (1.0, 1.0)
		width = 0.5
		height = 0.125
		color = [
			26
			14
			14
			0
		]
		material = og_mat_flare_blend
		angle = 0
		angularvel = 0
		controls = [
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				alldrummers
				gemcolor = green
				fade = 0.5
			}
		]
	}
	{
		type = hypotrochoid
		pos = (0.875, 0.88, 0.0)
		scale = (0.5, 0.5)
		length = 0.05
		innerradius = 0.25
		outerradius = 0.05
		color = [
			255
			255
			255
			0
		]
		material = og_mat_flare_add
		thickness = 40.0
		angularvel = 116.989006
		controls = [
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				alldrummers
				gemcolor = green
				fade = 0.5
			}
		]
	}
	{
		type = hypotrochoid
		pos = (0.3, 0.9, 0.0)
		scale = (2.0, 0.1)
		length = 0.05
		innerradius = 0.25
		outerradius = 0.05
		color = [
			255
			255
			255
			0
		]
		material = og_mat_flare_add
		thickness = 25.0
		angularvel = 99.53539
		controls = [
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				alldrummers
				gemcolor = open
				fade = 0.5
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.88, 0.0)
		length = 1.0
		color = [
			24
			8
			119
			0
		]
		blendmode = add
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = waveform
				response = deform
				scalemod = 150.0
			}
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				alldrummers
				gemcolor = open
				fade = 0.5
			}
		]
	}
	{
		type = sprite
		pos = (0.3, 0.9, 0.0)
		scale = (1.0, 1.0)
		width = 3.0
		height = 0.1
		color = [
			83
			58
			4
			0
		]
		material = og_mat_flare_add
		angle = 0
		angularvel = 0
		controls = [
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				alldrummers
				gemcolor = open
				fade = 0.5
			}
		]
	}
	{
		type = sprite
		pos = (0.3, 0.9, 0.0)
		scale = (1.0, 1.0)
		width = 4.0
		height = 0.01
		color = [
			20
			14
			26
			0
		]
		blendmode = add
		angle = 0
		angularvel = 0
		controls = [
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				alldrummers
				gemcolor = open
				fade = 0.5
			}
		]
	}
	{
		type = hypotrochoid
		pos = (0.125, 0.88, 0.0)
		scale = (0.5, 0.5)
		length = 0.05
		innerradius = 0.25
		outerradius = 0.05
		color = [
			255
			255
			255
			0
		]
		material = og_mat_flare_add
		thickness = 32.0
		angularvel = 125.715
		controls = [
			{
				type = notehit
				response = alphamodulation
				scalemod = 1.0
				alldrummers
				gemcolor = red
				fade = 0.5
			}
		]
	}
]
