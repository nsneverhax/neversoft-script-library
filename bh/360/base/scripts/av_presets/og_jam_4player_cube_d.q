OG_Jam_4Player_Cube_D = [
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (1.01, 1.01)
		Color = [
			250
			251
			255
			252
		]
		angle = 0.0
		angularVel = 0
		BlendMode = add
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 0.1
				player = 1
				fade = 1.0
			}
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 0.1
				player = 2
				fade = 1.0
			}
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 0.1
				player = 3
				fade = 1.0
			}
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 0.1
				player = 4
				fade = 1.0
			}
		]
	}
	{
		type = sprite
		Pos = (0.5, 0.4)
		scale = (1.0, 1.0)
		width = 0.1
		height = 0.1
		Color = [
			255
			225
			97
			51
		]
		material = OG_Mat_Sphere_Add
		angle = 0
		angularVel = 1.7453301
		controls = [
		]
	}
	{
		type = nStar2
		Pos = (0.5, 0.4, 0.0)
		nPoints = 5
		radius = 0.0
		radius2 = 0.5
		Color = [
			68
			68
			68
			22
		]
		BlendMode = subtract
		thickness = 3.0
		angle = 0
		angularVel = 174.533
	}
	{
		type = sprite
		Pos = (0.5, 0.4)
		scale = (1.0, 1.0)
		width = 0.5
		height = 0.5
		Color = [
			255
			205
			128
			3
		]
		material = OG_Mat_LenzFlare_Add
		angle = 0
		angularVel = 0.872665
		controls = [
			{
				type = beatOn
				response = alphaModulation
				scaleMod = 0.065
				fade = 0.1
			}
		]
	}
	{
		type = nStar2
		Pos = (0.5, 0.4, 0.0)
		nPoints = 5
		radius = 0.1
		radius2 = 0.5
		Color = [
			30
			19
			55
			255
		]
		BlendMode = brighten
		thickness = 3.0
		angle = 0
		angularVel = 0.872665
		controls = [
		]
	}
	{
		type = circle
		Pos = (0.5, 0.4, 0.0)
		radius = 0.01
		Color = [
			13
			1
			0
			121
		]
		material = OG_Mat_Sphere_Add
		thickness = 3.0
		angle = 1.5708001
		angularVel = 3.0
		controls = [
			{
				type = noteHit
				response = brightnessModulation
				scaleMod = 1.0
				player = 1
				fade = 0.25
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = 0.6
				player = 1
				gemColor = blue
				fade = 1.0
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = 0.345
				player = 1
				gemColor = green
				fade = 1.0
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = 0.143
				player = 1
				gemColor = yellow
				fade = 1.0
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = 0.08
				player = 1
				gemColor = orange
				fade = 1.0
			}
			{
				type = waveform
				response = deform
				scaleMod = 500.0
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.4, 0.0)
		radius = 0.01
		Color = [
			13
			1
			0
			121
		]
		material = OG_Mat_Flare_Brighten
		thickness = 3.0
		angle = 0.78539795
		angularVel = 3.0
		controls = [
			{
				type = noteHit
				response = brightnessModulation
				scaleMod = 0.1
				player = 2
				fade = 0.25
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = 0.6
				player = 2
				gemColor = blue
				fade = 1.0
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = 0.345
				player = 2
				gemColor = green
				fade = 1.0
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = 0.143
				player = 2
				gemColor = yellow
				fade = 1.0
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = 0.08
				player = 2
				gemColor = orange
				fade = 1.0
			}
			{
				type = waveform
				response = deform
				scaleMod = 500.0
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.4, 0.0)
		radius = 0.01
		Color = [
			13
			1
			0
			121
		]
		material = OG_Mat_Flare_add
		thickness = 3.0
		angle = -0.78539795
		angularVel = 3.0
		controls = [
			{
				type = noteHit
				response = brightnessModulation
				scaleMod = 1.0
				player = 3
				fade = 0.25
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = 0.6
				player = 3
				gemColor = blue
				fade = 1.0
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = 0.345
				player = 3
				gemColor = green
				fade = 1.0
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = 0.143
				player = 3
				gemColor = yellow
				fade = 1.0
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = 0.08
				player = 3
				gemColor = orange
				fade = 1.0
			}
			{
				type = waveform
				response = deform
				scaleMod = 500.0
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.4, 0.0)
		radius = 0.1
		Color = [
			13
			1
			0
			121
		]
		material = OG_Mat_Flare_add
		thickness = 3.0
		angle = -1.5708001
		angularVel = 3.0
		controls = [
			{
				type = noteHit
				response = brightnessModulation
				scaleMod = 1.0
				player = 4
				fade = 0.25
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = 0.6
				player = 4
				gemColor = blue
				fade = 1.0
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = 0.345
				player = 4
				gemColor = green
				fade = 1.0
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = 0.143
				player = 4
				gemColor = yellow
				fade = 1.0
			}
			{
				type = noteHit
				response = hueModulation
				scaleMod = 0.08
				player = 4
				gemColor = orange
				fade = 1.0
			}
			{
				type = waveform
				response = deform
				scaleMod = 500.0
			}
		]
	}
	{
		type = nStar2
		Pos = (0.5, 0.4, 0.0)
		nPoints = 3
		radius = 0.15
		radius2 = 0.2
		Color = [
			204
			186
			102
			255
		]
		BlendMode = add
		thickness = 1.0
		angle = 0
		angularVel = 0.17453298
		controls = [
			{
				type = constant
				response = radiusScale
				scaleMod = 0.15
				responseFunc = sinTime
				timeRate = 0.715585
			}
			{
				type = constant
				response = hueModulation
				scaleMod = 0.1
				responseFunc = sinTime
				timeOffset = 3.1415896
			}
		]
	}
	{
		type = nStar2
		Pos = (0.5, 0.4, 0.0)
		nPoints = 3
		radius = 0.15
		radius2 = 0.2
		Color = [
			64
			102
			255
			255
		]
		BlendMode = add
		thickness = 1.0
		angle = 0
		angularVel = 0.17453298
		controls = [
			{
				type = constant
				response = radiusScale
				scaleMod = 0.15
				responseFunc = sinTime
				timeOffset = 3.1415896
				timeRate = 0.69813204
			}
			{
				type = constant
				response = hueModulation
				scaleMod = 0.1
				responseFunc = sinTime
				timeRate = 0.523599
			}
		]
	}
	{
		type = sprite
		Pos = (0.5, 0.4)
		scale = (1.0, 1.0)
		width = 0.1
		height = 0.1
		Color = [
			255
			201
			187
			51
		]
		material = OG_Mat_Sphere_B_Add
		angle = 0
		angularVel = -1.7453301
		controls = [
		]
	}
	{
		type = sprite
		Pos = (0.5, 0.4)
		scale = (1.0, 1.0)
		width = 0.1
		height = 0.1
		Color = [
			244
			237
			237
			106
		]
		material = OG_Mat_Sphere_B_Sub
		angle = 0
		angularVel = -0.872665
		controls = [
		]
	}
]
