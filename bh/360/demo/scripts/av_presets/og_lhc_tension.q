og_lhc_tension = [
	{
		type = sprite
		pos = (0.5, 0.25)
		scale = (0.5, 0.5)
		width = 0.5
		height = 0.125
		color = [
			255
			28
			28
			255
		]
		material = og_mat_equation_01
		blendmode = blend
		angle = 0
		angularvel = 0.0
		controls = [
			{
				type = constant
				response = offsetx
				scalemod = 0.75
				responsefunc = sintime
				timerate = 0.872665
			}
			{
				type = constant
				response = anglemod
				scalemod = 0.5
				responsefunc = sintime
				timerate = 0.872665
			}
			{
				type = constant
				response = offsety
				scalemod = 0.25
				responsefunc = sintime
				timerate = 0.523599
			}
			{
				type = constant
				response = scaley
				scalemod = 0.25
				responsefunc = sintime
				timerate = 1.5708001
			}
			{
				type = constant
				response = scalex
				scalemod = 0.25
				responsefunc = sintime
				timerate = 1.5708001
			}
			{
				type = beaton
				response = alphamodulation
				scalemod = -1.0
				fade = 0.3
			}
		]
	}
	{
		type = blendprev
		offset = (0.0, 0.0)
		scale = (1.0, 1.0)
		color = [
			253
			249
			255
			127
		]
		angle = 0.0
		angularvel = 0.0
		blendmode = blend
		controls = [
			{
				type = constant
				response = scalex
				scalemod = 0.006
				responsefunc = sintime
				timerate = 3.1415896
			}
			{
				type = constant
				response = scaley
				scalemod = 0.006
				responsefunc = sintime
				timerate = 3.1415896
			}
			{
				type = constant
				response = offsetx
				scalemod = 0.025
				responsefunc = sintime
				timerate = 0.523599
			}
			{
				type = constant
				response = offsety
				scalemod = 0.025
				responsefunc = costime
				timerate = 0.523599
			}
		]
	}
	{
		type = circle
		pos = (0.25, 0.5, 0.0)
		radius = 0.001
		color = [
			93
			248
			130
			0
		]
		blendmode = add
		thickness = 3.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = beaton
				response = radiusscale
				scalemod = 0.258
				fade = 0.5
			}
			{
				type = beaton
				response = alphamodulation
				scalemod = 1.0
				fade = 0.5
			}
		]
	}
	{
		type = circle
		pos = (0.5, 0.5, 0.0)
		radius = 0.125
		color = [
			42
			64
			29
			255
		]
		blendmode = add
		thickness = 3.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = constant
				response = radiusscale
				scalemod = 0.4
				responsefunc = sintime
				timerate = 1.0
			}
		]
	}
	{
		type = sprite
		pos = (0.5, 0.25)
		scale = (0.5, 0.5)
		width = 1.0
		height = 0.125
		color = [
			255
			97
			28
			255
		]
		material = og_mat_equation_02
		blendmode = blend
		angle = 0
		angularvel = 0.0
		controls = [
			{
				type = constant
				response = offsetx
				scalemod = 0.75
				responsefunc = costime
				timerate = 0.43633202
			}
			{
				type = constant
				response = anglemod
				scalemod = 0.5
				responsefunc = costime
				timerate = 0.43633202
			}
			{
				type = constant
				response = offsety
				scalemod = 0.25
				responsefunc = costime
				timerate = 0.95993096
			}
			{
				type = constant
				response = scaley
				scalemod = 0.25
				responsefunc = costime
				timerate = 1.5708001
			}
			{
				type = constant
				response = scalex
				scalemod = 0.25
				responsefunc = costime
				timerate = 1.5708001
			}
			{
				type = beaton
				response = alphamodulation
				scalemod = -1.0
				fade = 0.3
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 2.0
		color = [
			169
			255
			99
			51
		]
		blendmode = add
		thickness = 3.0
		angle = 0
		angularvel = 1.0472
		controls = [
			{
				type = constant
				response = offsetx
				scalemod = 0.5
				responsefunc = costime
				timerate = 0.43633202
			}
			{
				type = constant
				response = offsety
				scalemod = 0.5
				responsefunc = costime
				timerate = 0.95993096
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 2.0
		color = [
			169
			255
			99
			124
		]
		blendmode = add
		thickness = 3.0
		angle = 0
		angularvel = 1.0472
		controls = [
			{
				type = constant
				response = offsetx
				scalemod = 0.5
				responsefunc = costime
				timerate = 0.523599
			}
			{
				type = constant
				response = offsety
				scalemod = 0.5
				responsefunc = costime
				timeoffset = 1.5708001
				timerate = 0.69813204
			}
		]
	}
	{
		type = sprite
		pos = (0.5, 0.25)
		scale = (0.5, 0.5)
		width = 0.5
		height = 0.125
		color = [
			255
			28
			87
			255
		]
		material = og_mat_equation_03
		blendmode = blend
		angle = 0
		angularvel = 0.0
		controls = [
			{
				type = constant
				response = offsetx
				scalemod = 0.75
				responsefunc = sintime
				timerate = 0.26179898
			}
			{
				type = constant
				response = anglemod
				scalemod = 0.5
				responsefunc = sintime
				timerate = 0.26179898
			}
			{
				type = constant
				response = offsety
				scalemod = 0.5
				responsefunc = sintime
				timerate = 0.17453298
			}
			{
				type = constant
				response = scaley
				scalemod = 0.25
				responsefunc = sintime
				timerate = 0.43633202
			}
			{
				type = constant
				response = scalex
				scalemod = 0.25
				responsefunc = sintime
				timerate = 0.43633202
			}
			{
				type = beaton
				response = alphamodulation
				scalemod = -0.8
				fade = 0.5
			}
		]
	}
	{
		type = sprite
		pos = (0.5, 0.25)
		scale = (1.0, 1.0)
		width = 0.5
		height = 0.125
		color = [
			255
			28
			87
			255
		]
		material = og_mat_equation_01
		blendmode = blend
		angle = 0
		angularvel = 0.0
		controls = [
			{
				type = constant
				response = offsetx
				scalemod = 0.75
				responsefunc = sintime
				timeoffset = 1.5708001
				timerate = 0.872665
			}
			{
				type = constant
				response = anglemod
				scalemod = 0.5
				responsefunc = sintime
				timeoffset = 1.5708001
				timerate = 0.872665
			}
			{
				type = constant
				response = offsety
				scalemod = 0.25
				responsefunc = sintime
				timerate = 0.523599
			}
			{
				type = constant
				response = scaley
				scalemod = 0.25
				responsefunc = sintime
				timerate = 1.5708001
			}
			{
				type = constant
				response = scalex
				scalemod = 0.25
				responsefunc = sintime
				timerate = 1.5708001
			}
			{
				type = beaton
				response = alphamodulation
				scalemod = -1.0
				fade = 0.3
			}
		]
	}
	{
		type = sprite
		pos = (0.5, 0.25)
		scale = (1.0, 1.0)
		width = 1.0
		height = 0.125
		color = [
			255
			48
			28
			255
		]
		material = og_mat_equation_02
		blendmode = blend
		angle = 0
		angularvel = 0.0
		controls = [
			{
				type = constant
				response = offsetx
				scalemod = 0.5
				responsefunc = costime
				timeoffset = 3.1415896
				timerate = 0.43633202
			}
			{
				type = constant
				response = anglemod
				scalemod = 0.5
				responsefunc = costime
				timeoffset = 3.1415896
				timerate = 0.43633202
			}
			{
				type = constant
				response = offsety
				scalemod = 0.3
				responsefunc = sintime
				timerate = 0.95993096
			}
			{
				type = constant
				response = scaley
				scalemod = 0.25
				responsefunc = costime
				timerate = 1.5708001
			}
			{
				type = constant
				response = scalex
				scalemod = 0.25
				responsefunc = costime
				timerate = 1.5708001
			}
			{
				type = beaton
				response = alphamodulation
				scalemod = -1.0
				fade = 0.3
			}
		]
	}
	{
		type = sprite
		pos = (0.5, 0.25)
		scale = (1.0, 1.0)
		width = 0.5
		height = 0.125
		color = [
			255
			155
			28
			255
		]
		material = og_mat_equation_03
		blendmode = blend
		angle = 0
		angularvel = 0.0
		controls = [
			{
				type = constant
				response = offsetx
				scalemod = 0.75
				responsefunc = sintime
				timeoffset = 4.71239
				timerate = 0.26179898
			}
			{
				type = constant
				response = anglemod
				scalemod = 0.5
				responsefunc = sintime
				timeoffset = 4.71239
				timerate = 0.26179898
			}
			{
				type = constant
				response = offsety
				scalemod = 0.3
				responsefunc = sintime
				timerate = 0.20944001
			}
			{
				type = constant
				response = scaley
				scalemod = 0.25
				responsefunc = sintime
				timerate = 0.43633202
			}
			{
				type = constant
				response = scalex
				scalemod = 0.25
				responsefunc = sintime
				timerate = 0.43633202
			}
			{
				type = beaton
				response = alphamodulation
				scalemod = -0.8
				fade = 0.5
			}
		]
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 2.0
		color = [
			169
			255
			99
			51
		]
		blendmode = add
		thickness = 3.0
		angle = 0
		angularvel = -0.64577204
		controls = [
			{
				type = constant
				response = offsetx
				scalemod = 0.5
				responsefunc = sintime
				timerate = 0.43633202
			}
			{
				type = constant
				response = offsety
				scalemod = 0.5
				responsefunc = sintime
				timerate = 0.95993096
			}
		]
	}
	{
		type = nstar2
		pos = (0.5, 0.5, 0.0)
		npoints = 19
		radius = 0.001
		radius2 = 1.0
		color = [
			255
			255
			255
			255
		]
		blendmode = brighten
		thickness = 1.0
		angle = 0
		angularvel = 2.6179898
	}
	{
		type = line
		pos = (0.5, 0.5, 0.0)
		length = 2.0
		color = [
			169
			255
			99
			51
		]
		blendmode = add
		thickness = 3.0
		angle = 0
		angularvel = 1.0995599
		controls = [
			{
				type = constant
				response = offsetx
				scalemod = 0.5
				responsefunc = costime
				timerate = 0.64577204
			}
			{
				type = constant
				response = offsety
				scalemod = 0.5
				responsefunc = sintime
				timerate = 0.95993096
			}
		]
	}
	{
		type = circle
		pos = (0.85, 0.5, 0.0)
		radius = 0.1
		color = [
			93
			248
			130
			0
		]
		blendmode = add
		thickness = 3.0
		angle = 0
		angularvel = 0
		controls = [
			{
				type = beaton
				response = radiusscale
				scalemod = 0.258
				fade = 0.5
			}
			{
				type = beaton
				response = alphamodulation
				scalemod = 1.0
				fade = 0.5
			}
		]
	}
]
