OG_Highway_Drum_Freeform_PS3 = [
	{
		type = blendPrev
		offset = (0.0, -0.01)
		scale = (1.0, 0.98999995)
		Color = [
			250
			249
			255
			252
		]
		angle = 0
		angularVel = 0
		BlendMode = blend
	}
	{
		type = sprite
		Pos = (0.5, 0.88, 0.0)
		scale = (1.0, 1.0)
		width = 0.25
		height = 2.0
		Color = [
			1
			1
			1
			51
		]
		material = OG_Mat_Flare_add
		angle = 0
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				alldrummers
				gemColor = blue
				fade = 0.5
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.88, 0.0)
		radius = 0.01
		Color = [
			0
			95
			255
			0
		]
		BlendMode = blend
		thickness = 1.0
		angle = 0
		angularVel = 0.0
		controls = [
			{
				type = waveform
				response = deform
				scaleMod = 50.0
			}
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				alldrummers
				gemColor = blue
				fade = 0.5
			}
			{
				type = noteHit
				response = radiusScale
				scaleMod = 0.1
				alldrummers
				gemColor = blue
				fade = 0.2
			}
		]
	}
	{
		type = sprite
		Pos = (0.5, 0.88, 0.0)
		scale = (1.0, 1.0)
		width = 0.5
		height = 0.125
		Color = [
			26
			14
			14
			0
		]
		material = OG_Mat_Flare_Blend
		angle = 0
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				alldrummers
				gemColor = blue
				fade = 0.5
			}
		]
	}
	{
		type = hypotrochoid
		Pos = (0.5, 0.88, 0.0)
		scale = (0.5, 0.5)
		length = 0.05
		InnerRadius = 0.25
		outerRadius = 0.05
		Color = [
			255
			255
			255
			0
		]
		material = OG_Mat_Flare_add
		thickness = 40.0
		angularVel = 99.53539
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				alldrummers
				gemColor = blue
				fade = 0.5
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 1.0
		Color = [
			147
			0
			255
			56
		]
		BlendMode = add
		thickness = 1.0
		angle = 1.5708001
		angularVel = 0
		controls = [
			{
				type = History
				historyType = meandbs
				response = deform
				scaleMod = 600.0
				responseFunc = sinTime
				alldrummers
			}
			{
				type = gamePaused
				response = alphaModulation
				scaleMod = -0.5
				fade = 1.0
			}
		]
	}
	{
		type = circle
		Pos = (0.1, 0.88, 0.0)
		radius = 0.01
		Color = [
			202
			35
			0
			0
		]
		BlendMode = add
		thickness = 1.0
		angle = 0
		angularVel = 0.0
		controls = [
			{
				type = waveform
				response = deform
				scaleMod = 50.0
			}
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				alldrummers
				gemColor = red
				fade = 0.5
			}
			{
				type = noteHit
				response = radiusScale
				scaleMod = 0.1
				alldrummers
				gemColor = red
				fade = 0.2
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 1.0
		Color = [
			147
			0
			255
			56
		]
		BlendMode = add
		thickness = 1.0
		angle = 1.5708001
		angularVel = 0
		controls = [
			{
				type = History
				historyType = meandbs
				response = deform
				scaleMod = -600.0
				responseFunc = sinTime
				alldrummers
			}
			{
				type = gamePaused
				response = alphaModulation
				scaleMod = -0.5
				fade = 1.0
			}
		]
	}
	{
		type = sprite
		Pos = (0.1, 0.88, 0.0)
		scale = (1.0, 1.0)
		width = 0.5
		height = 2.0
		Color = [
			1
			1
			1
			25
		]
		material = OG_Mat_Flare_add
		angle = 0
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				alldrummers
				gemColor = red
				fade = 0.5
			}
		]
	}
	{
		type = sprite
		Pos = (0.1, 0.88, 0.0)
		scale = (1.0, 1.0)
		width = 0.5
		height = 0.125
		Color = [
			26
			14
			14
			0
		]
		material = OG_Mat_Flare_Blend
		angle = 0
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				alldrummers
				gemColor = red
				fade = 0.5
			}
		]
	}
	{
		type = sprite
		Pos = (0.29799998, 0.88, 0.0)
		scale = (1.0, 1.0)
		width = 0.25
		height = 2.0
		Color = [
			1
			1
			1
			51
		]
		material = OG_Mat_Flare_add
		angle = 0
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				alldrummers
				gemColor = yellow
				fade = 0.5
			}
		]
	}
	{
		type = circle
		Pos = (0.29799998, 0.88, 0.0)
		radius = 0.01
		Color = [
			255
			238
			0
			0
		]
		BlendMode = blend
		thickness = 1.0
		angle = 0
		angularVel = 0.0
		controls = [
			{
				type = waveform
				response = deform
				scaleMod = 50.0
			}
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				alldrummers
				gemColor = yellow
				fade = 0.5
			}
			{
				type = noteHit
				response = radiusScale
				scaleMod = 0.1
				alldrummers
				gemColor = yellow
				fade = 0.2
			}
		]
	}
	{
		type = sprite
		Pos = (0.29799998, 0.88, 0.0)
		scale = (1.0, 1.0)
		width = 0.5
		height = 0.125
		Color = [
			26
			14
			14
			0
		]
		material = OG_Mat_Flare_Blend
		angle = 0
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				alldrummers
				gemColor = yellow
				fade = 0.5
			}
		]
	}
	{
		type = hypotrochoid
		Pos = (0.29799998, 0.88, 0.0)
		scale = (0.5, 0.5)
		length = 0.05
		InnerRadius = 0.25
		outerRadius = 0.05
		Color = [
			255
			255
			255
			0
		]
		material = OG_Mat_Flare_add
		thickness = 30.0
		angularVel = 106.517006
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				alldrummers
				gemColor = yellow
				fade = 0.5
			}
		]
	}
	{
		type = sprite
		Pos = (0.697, 0.88, 0.0)
		scale = (1.0, 1.0)
		width = 0.25
		height = 2.0
		Color = [
			1
			1
			1
			51
		]
		material = OG_Mat_Flare_add
		angle = 0
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 0.5
				alldrummers
				gemColor = orange
				fade = 0.2
			}
		]
	}
	{
		type = circle
		Pos = (0.697, 0.88, 0.0)
		radius = 0.01
		Color = [
			255
			132
			0
			0
		]
		BlendMode = blend
		thickness = 1.0
		angle = 0
		angularVel = 0.0
		controls = [
			{
				type = waveform
				response = deform
				scaleMod = 50.0
			}
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				alldrummers
				gemColor = orange
				fade = 0.5
			}
			{
				type = noteHit
				response = radiusScale
				scaleMod = 0.1
				alldrummers
				gemColor = orange
				fade = 0.2
			}
		]
	}
	{
		type = sprite
		Pos = (0.697, 0.88, 0.0)
		scale = (1.0, 1.0)
		width = 0.5
		height = 0.125
		Color = [
			26
			14
			14
			0
		]
		material = OG_Mat_Flare_Blend
		angle = 0
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				alldrummers
				gemColor = orange
				fade = 0.5
			}
		]
	}
	{
		type = hypotrochoid
		Pos = (0.697, 0.88, 0.0)
		scale = (0.5, 0.5)
		length = 0.05
		InnerRadius = 0.25
		outerRadius = 0.05
		Color = [
			255
			255
			255
			0
		]
		material = OG_Mat_Flare_add
		thickness = 30.0
		angularVel = 82.0821
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				alldrummers
				gemColor = orange
				fade = 0.5
			}
		]
	}
	{
		type = sprite
		Pos = (0.9, 0.88, 0.0)
		scale = (1.0, 1.0)
		width = 0.25
		height = 2.0
		Color = [
			1
			1
			1
			51
		]
		material = OG_Mat_Flare_add
		angle = 0
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 0.5
				alldrummers
				gemColor = green
				fade = 0.2
			}
		]
	}
	{
		type = circle
		Pos = (0.9, 0.88, 0.0)
		radius = 0.01
		Color = [
			143
			255
			37
			0
		]
		BlendMode = blend
		thickness = 1.0
		angle = 0
		angularVel = 0.0
		controls = [
			{
				type = waveform
				response = deform
				scaleMod = 50.0
			}
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				alldrummers
				gemColor = green
				fade = 0.5
			}
			{
				type = noteHit
				response = radiusScale
				scaleMod = 0.1
				alldrummers
				gemColor = green
				fade = 0.2
			}
		]
	}
	{
		type = sprite
		Pos = (0.9, 0.88, 0.0)
		scale = (1.0, 1.0)
		width = 0.5
		height = 0.125
		Color = [
			26
			14
			14
			0
		]
		material = OG_Mat_Flare_Blend
		angle = 0
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				alldrummers
				gemColor = green
				fade = 0.5
			}
		]
	}
	{
		type = hypotrochoid
		Pos = (0.9, 0.88, 0.0)
		scale = (0.5, 0.5)
		length = 0.05
		InnerRadius = 0.25
		outerRadius = 0.05
		Color = [
			255
			255
			255
			0
		]
		material = OG_Mat_Flare_add
		thickness = 40.0
		angularVel = 116.989006
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				alldrummers
				gemColor = green
				fade = 0.5
			}
		]
	}
	{
		type = hypotrochoid
		Pos = (0.3, 0.9, 0.0)
		scale = (2.0, 0.1)
		length = 0.05
		InnerRadius = 0.25
		outerRadius = 0.05
		Color = [
			255
			255
			255
			0
		]
		material = OG_Mat_Flare_add
		thickness = 25.0
		angularVel = 99.53539
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				alldrummers
				gemColor = open
				fade = 0.5
			}
		]
	}
	{
		type = hypotrochoid
		Pos = (0.1, 0.88, 0.0)
		scale = (0.5, 0.5)
		length = 0.05
		InnerRadius = 0.25
		outerRadius = 0.05
		Color = [
			211
			246
			255
			0
		]
		material = OG_Mat_Flare_add
		thickness = 32.0
		angularVel = 125.715
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				alldrummers
				gemColor = red
				fade = 0.5
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.88, 0.0)
		length = 1.0
		Color = [
			24
			8
			119
			0
		]
		BlendMode = add
		thickness = 1.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = waveform
				response = deform
				scaleMod = 150.0
			}
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				alldrummers
				gemColor = open
				fade = 0.5
			}
		]
	}
	{
		type = sprite
		Pos = (0.3, 0.9, 0.0)
		scale = (1.0, 1.0)
		width = 3.0
		height = 0.1
		Color = [
			83
			58
			4
			0
		]
		material = OG_Mat_Flare_add
		angle = 0
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				alldrummers
				gemColor = open
				fade = 0.5
			}
		]
	}
	{
		type = sprite
		Pos = (0.3, 0.9, 0.0)
		scale = (1.0, 1.0)
		width = 4.0
		height = 0.01
		Color = [
			20
			14
			26
			0
		]
		BlendMode = add
		angle = 0
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				alldrummers
				gemColor = open
				fade = 0.5
			}
		]
	}
]
