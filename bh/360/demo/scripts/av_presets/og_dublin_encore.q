og_dublin_encore = [
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (0.88, 0.88)
		color = [
			242
			255
			237
			249
		]
		angle = 0.0
		angularvel = 0.0
		blendmode = blend
		controls = [
			{
				type = constant
				response = anglemod
				scalemod = 0.1
				responsefunc = sintime
				timerate = 0.872665
			}
			{
				type = constant
				response = scaley
				scalemod = 0.05
				responsefunc = costime
				timerate = 1.0472
			}
			{
				type = constant
				response = scalex
				scalemod = 0.05
				responsefunc = costime
				timerate = 0.872665
			}
			{
				type = constant
				response = offsety
				scalemod = 0.01
				responsefunc = costime
				timerate = 0.523599
			}
			{
				type = constant
				response = offsetx
				scalemod = 0.01
				responsefunc = costime
				timerate = 0.349066
			}
		]
	}
	{
		type = sprite
		pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 1.0
		height = 1.0
		color = [
			22
			22
			22
			0
		]
		material = og_mat_flare_add
		angle = 0
		angularvel = 0
		controls = [
			{
				type = constant
				response = offsetx
				scalemod = 0.05
				responsefunc = sintime
				timeoffset = 1.5708001
				timerate = 0.69813204
			}
			{
				type = constant
				response = offsety
				scalemod = 0.05
				responsefunc = costime
				timeoffset = 1.5708001
				timerate = 0.349066
			}
			{
				type = beaton
				response = alphamodulation
				scalemod = 1.0
				responsefunc = costime
				fade = 0.1
			}
		]
	}
	{
		type = sprite
		pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 0.125
		height = 0.125
		color = [
			255
			255
			255
			127
		]
		material = og_mat_dublin_shamrock
		angle = 0
		angularvel = 0.0
		controls = [
			{
				type = constant
				response = offsetx
				scalemod = 0.05
				responsefunc = sintime
				timeoffset = 4.71239
				timerate = 0.43633202
			}
			{
				type = constant
				response = offsety
				scalemod = 0.05
				responsefunc = costime
				timeoffset = 4.71239
				timerate = 0.61086506
			}
		]
	}
	{
		type = sprite
		pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 0.125
		height = 0.125
		color = [
			255
			255
			255
			127
		]
		material = og_mat_dublin_shamrock
		angle = 0
		angularvel = 0.0
		controls = [
			{
				type = constant
				response = offsetx
				scalemod = 0.05
				responsefunc = sintime
				timeoffset = 1.5708001
				timerate = 0.69813204
			}
			{
				type = constant
				response = offsety
				scalemod = 0.05
				responsefunc = costime
				timeoffset = 1.5708001
				timerate = 0.349066
			}
		]
	}
	{
		type = sprite
		pos = (0.5, 0.5, 0.0)
		scale = (1.0, 1.0)
		width = 1.0
		height = 1.0
		color = [
			22
			18
			0
			0
		]
		material = og_mat_flare_add
		angle = 0
		angularvel = 3.1415896
		controls = [
			{
				type = constant
				response = offsetx
				scalemod = 0.05
				responsefunc = sintime
				timeoffset = 4.71239
				timerate = 0.43633202
			}
			{
				type = constant
				response = offsety
				scalemod = 0.05
				responsefunc = costime
				timeoffset = 4.71239
				timerate = 0.61086506
			}
			{
				type = beaton
				response = alphamodulation
				scalemod = 1.0
				responsefunc = costime
				fade = 0.1
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.1
		color = [
			123
			71
			71
			255
		]
		blendmode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = constant
				response = offsetx
				scalemod = 0.05
				responsefunc = sintime
				timeoffset = 1.5708001
				timerate = 0.69813204
			}
			{
				type = constant
				response = offsety
				scalemod = 0.05
				responsefunc = costime
				timeoffset = 1.5708001
				timerate = 0.349066
			}
			{
				type = waveform
				response = deform
				scalemod = 500.0
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.1
		color = [
			138
			80
			80
			255
		]
		blendmode = brighten
		thickness = 1.0
		angle = 3.1415896
		angularvel = 0
		controls = [
			{
				type = constant
				response = offsetx
				scalemod = 0.05
				responsefunc = sintime
				timeoffset = 4.71239
				timerate = 0.43633202
			}
			{
				type = constant
				response = offsety
				scalemod = 0.05
				responsefunc = costime
				timeoffset = 4.71239
				timerate = 0.61086506
			}
			{
				type = waveform
				response = deform
				scalemod = 500.0
			}
		]
	}
]
