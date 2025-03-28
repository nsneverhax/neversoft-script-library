og_dublin_encore_flare = [
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (0.88, 0.88)
		Color = [
			255
			255
			255
			249
		]
		angle = 0.0
		angularvel = 0.0
		BlendMode = blend
		controls = [
			{
				Type = constant
				response = anglemod
				scalemod = 0.1
				responsefunc = sintime
				timerate = 0.872665
			}
			{
				Type = constant
				response = scaley
				scalemod = 0.05
				responsefunc = costime
				timerate = 1.0472
			}
			{
				Type = constant
				response = scalex
				scalemod = 0.05
				responsefunc = costime
				timerate = 0.872665
			}
			{
				Type = constant
				response = offsety
				scalemod = 0.01
				responsefunc = costime
				timerate = 0.523599
			}
			{
				Type = constant
				response = offsetx
				scalemod = 0.01
				responsefunc = costime
				timerate = 0.349066
			}
		]
	}
	{
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		Scale = (1.0, 1.0)
		width = 1.0
		height = 1.0
		Color = [
			48
			48
			48
			0
		]
		material = og_mat_flare_add
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = constant
				response = offsetx
				scalemod = 0.05
				responsefunc = sintime
				timeoffset = 1.5708001
				timerate = 0.69813204
			}
			{
				Type = constant
				response = offsety
				scalemod = 0.05
				responsefunc = costime
				timeoffset = 1.5708001
				timerate = 0.349066
			}
			{
				Type = beaton
				response = alphamodulation
				scalemod = 1.0
				responsefunc = costime
				fade = 0.1
			}
		]
	}
	{
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		Scale = (1.0, 1.0)
		width = 0.125
		height = 0.125
		Color = [
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
				Type = constant
				response = offsetx
				scalemod = 0.05
				responsefunc = sintime
				timeoffset = 4.71239
				timerate = 0.43633202
			}
			{
				Type = constant
				response = offsety
				scalemod = 0.05
				responsefunc = costime
				timeoffset = 4.71239
				timerate = 0.61086506
			}
		]
	}
	{
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		Scale = (1.0, 1.0)
		width = 0.125
		height = 0.125
		Color = [
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
				Type = constant
				response = offsetx
				scalemod = 0.05
				responsefunc = sintime
				timeoffset = 1.5708001
				timerate = 0.69813204
			}
			{
				Type = constant
				response = offsety
				scalemod = 0.05
				responsefunc = costime
				timeoffset = 1.5708001
				timerate = 0.349066
			}
		]
	}
	{
		Type = sprite
		Pos = (0.5, 0.5, 0.0)
		Scale = (1.0, 1.0)
		width = 1.0
		height = 1.0
		Color = [
			123
			123
			123
			0
		]
		material = og_mat_flare_add
		angle = 0
		angularvel = 3.1415896
		controls = [
			{
				Type = constant
				response = offsetx
				scalemod = 0.05
				responsefunc = sintime
				timeoffset = 4.71239
				timerate = 0.43633202
			}
			{
				Type = constant
				response = offsety
				scalemod = 0.05
				responsefunc = costime
				timeoffset = 4.71239
				timerate = 0.61086506
			}
			{
				Type = beaton
				response = alphamodulation
				scalemod = 1.0
				responsefunc = costime
				fade = 0.1
			}
		]
	}
]
