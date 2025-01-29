og_lhc_tension = [
	{
		Type = sprite
		Pos = (0.5, 0.25)
		Scale = (0.5, 0.5)
		width = 0.5
		height = 0.125
		Color = [
			255
			28
			28
			255
		]
		material = og_mat_equation_01
		BlendMode = blend
		angle = 0
		angularvel = 0.0
		controls = [
			{
				Type = constant
				response = offsetx
				scalemod = 0.75
				responsefunc = sintime
				timerate = 0.872665
			}
			{
				Type = constant
				response = anglemod
				scalemod = 0.5
				responsefunc = sintime
				timerate = 0.872665
			}
			{
				Type = constant
				response = offsety
				scalemod = 0.25
				responsefunc = sintime
				timerate = 0.523599
			}
			{
				Type = constant
				response = scaley
				scalemod = 0.25
				responsefunc = sintime
				timerate = 1.5708001
			}
			{
				Type = constant
				response = scalex
				scalemod = 0.25
				responsefunc = sintime
				timerate = 1.5708001
			}
			{
				Type = beaton
				response = alphamodulation
				scalemod = -1.0
				fade = 0.3
			}
		]
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (1.0, 1.0)
		Color = [
			253
			249
			255
			127
		]
		angle = 0.0
		angularvel = 0.0
		BlendMode = blend
		controls = [
			{
				Type = constant
				response = scalex
				scalemod = 0.006
				responsefunc = sintime
				timerate = 3.1415896
			}
			{
				Type = constant
				response = scaley
				scalemod = 0.006
				responsefunc = sintime
				timerate = 3.1415896
			}
			{
				Type = constant
				response = offsetx
				scalemod = 0.025
				responsefunc = sintime
				timerate = 0.523599
			}
			{
				Type = constant
				response = offsety
				scalemod = 0.025
				responsefunc = costime
				timerate = 0.523599
			}
		]
	}
	{
		Type = circle
		Pos = (0.25, 0.5, 0.0)
		radius = 0.001
		Color = [
			93
			248
			130
			0
		]
		BlendMode = add
		thickness = 3.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = beaton
				response = radiusscale
				scalemod = 0.258
				fade = 0.5
			}
			{
				Type = beaton
				response = alphamodulation
				scalemod = 1.0
				fade = 0.5
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.125
		Color = [
			42
			64
			29
			255
		]
		BlendMode = add
		thickness = 3.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = constant
				response = radiusscale
				scalemod = 0.4
				responsefunc = sintime
				timerate = 1.0
			}
		]
	}
	{
		Type = sprite
		Pos = (0.5, 0.25)
		Scale = (0.5, 0.5)
		width = 1.0
		height = 0.125
		Color = [
			255
			97
			28
			255
		]
		material = og_mat_equation_02
		BlendMode = blend
		angle = 0
		angularvel = 0.0
		controls = [
			{
				Type = constant
				response = offsetx
				scalemod = 0.75
				responsefunc = costime
				timerate = 0.43633202
			}
			{
				Type = constant
				response = anglemod
				scalemod = 0.5
				responsefunc = costime
				timerate = 0.43633202
			}
			{
				Type = constant
				response = offsety
				scalemod = 0.25
				responsefunc = costime
				timerate = 0.95993096
			}
			{
				Type = constant
				response = scaley
				scalemod = 0.25
				responsefunc = costime
				timerate = 1.5708001
			}
			{
				Type = constant
				response = scalex
				scalemod = 0.25
				responsefunc = costime
				timerate = 1.5708001
			}
			{
				Type = beaton
				response = alphamodulation
				scalemod = -1.0
				fade = 0.3
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		length = 2.0
		Color = [
			169
			255
			99
			51
		]
		BlendMode = add
		thickness = 3.0
		angle = 0
		angularvel = 1.0472
		controls = [
			{
				Type = constant
				response = offsetx
				scalemod = 0.5
				responsefunc = costime
				timerate = 0.43633202
			}
			{
				Type = constant
				response = offsety
				scalemod = 0.5
				responsefunc = costime
				timerate = 0.95993096
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		length = 2.0
		Color = [
			169
			255
			99
			124
		]
		BlendMode = add
		thickness = 3.0
		angle = 0
		angularvel = 1.0472
		controls = [
			{
				Type = constant
				response = offsetx
				scalemod = 0.5
				responsefunc = costime
				timerate = 0.523599
			}
			{
				Type = constant
				response = offsety
				scalemod = 0.5
				responsefunc = costime
				timeoffset = 1.5708001
				timerate = 0.69813204
			}
		]
	}
	{
		Type = sprite
		Pos = (0.5, 0.25)
		Scale = (0.5, 0.5)
		width = 0.5
		height = 0.125
		Color = [
			255
			28
			87
			255
		]
		material = og_mat_equation_03
		BlendMode = blend
		angle = 0
		angularvel = 0.0
		controls = [
			{
				Type = constant
				response = offsetx
				scalemod = 0.75
				responsefunc = sintime
				timerate = 0.26179898
			}
			{
				Type = constant
				response = anglemod
				scalemod = 0.5
				responsefunc = sintime
				timerate = 0.26179898
			}
			{
				Type = constant
				response = offsety
				scalemod = 0.5
				responsefunc = sintime
				timerate = 0.17453298
			}
			{
				Type = constant
				response = scaley
				scalemod = 0.25
				responsefunc = sintime
				timerate = 0.43633202
			}
			{
				Type = constant
				response = scalex
				scalemod = 0.25
				responsefunc = sintime
				timerate = 0.43633202
			}
			{
				Type = beaton
				response = alphamodulation
				scalemod = -0.8
				fade = 0.5
			}
		]
	}
	{
		Type = sprite
		Pos = (0.5, 0.25)
		Scale = (1.0, 1.0)
		width = 0.5
		height = 0.125
		Color = [
			255
			28
			87
			255
		]
		material = og_mat_equation_01
		BlendMode = blend
		angle = 0
		angularvel = 0.0
		controls = [
			{
				Type = constant
				response = offsetx
				scalemod = 0.75
				responsefunc = sintime
				timeoffset = 1.5708001
				timerate = 0.872665
			}
			{
				Type = constant
				response = anglemod
				scalemod = 0.5
				responsefunc = sintime
				timeoffset = 1.5708001
				timerate = 0.872665
			}
			{
				Type = constant
				response = offsety
				scalemod = 0.25
				responsefunc = sintime
				timerate = 0.523599
			}
			{
				Type = constant
				response = scaley
				scalemod = 0.25
				responsefunc = sintime
				timerate = 1.5708001
			}
			{
				Type = constant
				response = scalex
				scalemod = 0.25
				responsefunc = sintime
				timerate = 1.5708001
			}
			{
				Type = beaton
				response = alphamodulation
				scalemod = -1.0
				fade = 0.3
			}
		]
	}
	{
		Type = sprite
		Pos = (0.5, 0.25)
		Scale = (1.0, 1.0)
		width = 1.0
		height = 0.125
		Color = [
			255
			48
			28
			255
		]
		material = og_mat_equation_02
		BlendMode = blend
		angle = 0
		angularvel = 0.0
		controls = [
			{
				Type = constant
				response = offsetx
				scalemod = 0.5
				responsefunc = costime
				timeoffset = 3.1415896
				timerate = 0.43633202
			}
			{
				Type = constant
				response = anglemod
				scalemod = 0.5
				responsefunc = costime
				timeoffset = 3.1415896
				timerate = 0.43633202
			}
			{
				Type = constant
				response = offsety
				scalemod = 0.3
				responsefunc = sintime
				timerate = 0.95993096
			}
			{
				Type = constant
				response = scaley
				scalemod = 0.25
				responsefunc = costime
				timerate = 1.5708001
			}
			{
				Type = constant
				response = scalex
				scalemod = 0.25
				responsefunc = costime
				timerate = 1.5708001
			}
			{
				Type = beaton
				response = alphamodulation
				scalemod = -1.0
				fade = 0.3
			}
		]
	}
	{
		Type = sprite
		Pos = (0.5, 0.25)
		Scale = (1.0, 1.0)
		width = 0.5
		height = 0.125
		Color = [
			255
			155
			28
			255
		]
		material = og_mat_equation_03
		BlendMode = blend
		angle = 0
		angularvel = 0.0
		controls = [
			{
				Type = constant
				response = offsetx
				scalemod = 0.75
				responsefunc = sintime
				timeoffset = 4.71239
				timerate = 0.26179898
			}
			{
				Type = constant
				response = anglemod
				scalemod = 0.5
				responsefunc = sintime
				timeoffset = 4.71239
				timerate = 0.26179898
			}
			{
				Type = constant
				response = offsety
				scalemod = 0.3
				responsefunc = sintime
				timerate = 0.20944001
			}
			{
				Type = constant
				response = scaley
				scalemod = 0.25
				responsefunc = sintime
				timerate = 0.43633202
			}
			{
				Type = constant
				response = scalex
				scalemod = 0.25
				responsefunc = sintime
				timerate = 0.43633202
			}
			{
				Type = beaton
				response = alphamodulation
				scalemod = -0.8
				fade = 0.5
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		length = 2.0
		Color = [
			169
			255
			99
			51
		]
		BlendMode = add
		thickness = 3.0
		angle = 0
		angularvel = -0.64577204
		controls = [
			{
				Type = constant
				response = offsetx
				scalemod = 0.5
				responsefunc = sintime
				timerate = 0.43633202
			}
			{
				Type = constant
				response = offsety
				scalemod = 0.5
				responsefunc = sintime
				timerate = 0.95993096
			}
		]
	}
	{
		Type = nstar2
		Pos = (0.5, 0.5, 0.0)
		npoints = 19
		radius = 0.001
		radius2 = 1.0
		Color = [
			255
			255
			255
			255
		]
		BlendMode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 2.6179898
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		length = 2.0
		Color = [
			169
			255
			99
			51
		]
		BlendMode = add
		thickness = 3.0
		angle = 0
		angularvel = 1.0995599
		controls = [
			{
				Type = constant
				response = offsetx
				scalemod = 0.5
				responsefunc = costime
				timerate = 0.64577204
			}
			{
				Type = constant
				response = offsety
				scalemod = 0.5
				responsefunc = sintime
				timerate = 0.95993096
			}
		]
	}
	{
		Type = circle
		Pos = (0.85, 0.5, 0.0)
		radius = 0.1
		Color = [
			93
			248
			130
			0
		]
		BlendMode = add
		thickness = 3.0
		angle = 0
		angularvel = 0
		controls = [
			{
				Type = beaton
				response = radiusscale
				scalemod = 0.258
				fade = 0.5
			}
			{
				Type = beaton
				response = alphamodulation
				scalemod = 1.0
				fade = 0.5
			}
		]
	}
]
