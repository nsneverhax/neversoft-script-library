JOW_PowerRings = [
	{
		type = blendPrev
		offset = (0.0, -0.001)
		scale = (0.95, 0.96999997)
		Color = [
			242
			250
			255
			204
		]
		angle = 0
		angularVel = 0.0
		BlendMode = blend
		controls = [
			{
				type = rockmeterstatus
				response = alphaModulation
				scaleMod = 1.0
				vocalist_num = 1
				fade = 1.0
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.125
		Color = [
			114
			167
			255
			255
		]
		BlendMode = blend
		thickness = 2.0
		angle = 1.5708001
		angularVel = 0.0
		controls = [
			{
				type = waveform
				response = deform
				scaleMod = 60.0
				responseFunc = sinTime
			}
			{
				type = History
				historyType = frequency
				response = redModulation
				scaleMod = 6.0
				spectrumBand = 0
			}
		]
	}
	{
		type = line
		Pos = (0.55, 0.5, 0.0)
		length = 0.06
		Color = [
			114
			167
			255
			255
		]
		BlendMode = blend
		thickness = 2.0
		angle = 1.5708001
		angularVel = 0
		controls = [
			{
				type = waveform
				response = deform
				scaleMod = 120.0
				responseFunc = sinTime
			}
			{
				type = History
				historyType = frequency
				response = redModulation
				scaleMod = 6.0
				spectrumBand = 0
			}
		]
	}
	{
		type = line
		Pos = (0.45000002, 0.5, 0.0)
		length = 0.06
		Color = [
			114
			167
			255
			255
		]
		BlendMode = blend
		thickness = 2.0
		angle = 1.5708001
		angularVel = 0
		controls = [
			{
				type = waveform
				response = deform
				scaleMod = 120.0
				responseFunc = sinTime
			}
			{
				type = History
				historyType = frequency
				response = redModulation
				scaleMod = 6.0
				spectrumBand = 0
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.65000004, 0.0)
		radius = 0.0
		Color = [
			108
			255
			131
			0
		]
		BlendMode = blend
		thickness = 4.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				player = 1
				gemColor = green
				fade = 1.0
			}
			{
				type = History
				historyType = frequency
				response = offsetY
				scaleMod = -0.0125
				responseFunc = sinTime
				spectrumBand = 2
			}
			{
				type = waveform
				response = deform
				scaleMod = 15.0
			}
			{
				type = rockmeterstatus
				response = radiusScale
				scaleMod = 0.04
				player = 1
				fade = 1.0
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.65000004, 0.0)
		radius = 0.005
		Color = [
			255
			108
			108
			0
		]
		BlendMode = blend
		thickness = 4.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				player = 1
				gemColor = red
				fade = 1.0
			}
			{
				type = History
				historyType = frequency
				response = offsetY
				scaleMod = -0.0125
				responseFunc = sinTime
				spectrumBand = 2
			}
			{
				type = waveform
				response = deform
				scaleMod = 15.0
			}
			{
				type = rockmeterstatus
				response = radiusScale
				scaleMod = 0.04
				player = 1
				fade = 1.0
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.65000004, 0.0)
		radius = 0.01
		Color = [
			255
			229
			108
			0
		]
		BlendMode = blend
		thickness = 4.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				player = 1
				gemColor = yellow
				fade = 1.0
			}
			{
				type = History
				historyType = frequency
				response = offsetY
				scaleMod = -0.0125
				responseFunc = sinTime
				spectrumBand = 2
			}
			{
				type = waveform
				response = deform
				scaleMod = 15.0
			}
			{
				type = rockmeterstatus
				response = radiusScale
				scaleMod = 0.04
				player = 1
				fade = 1.0
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.65000004, 0.0)
		radius = 0.015
		Color = [
			108
			144
			255
			0
		]
		BlendMode = blend
		thickness = 4.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				player = 1
				gemColor = blue
				fade = 1.0
			}
			{
				type = History
				historyType = frequency
				response = offsetY
				scaleMod = -0.0125
				responseFunc = sinTime
				spectrumBand = 2
			}
			{
				type = waveform
				response = deform
				scaleMod = 15.0
			}
			{
				type = rockmeterstatus
				response = radiusScale
				scaleMod = 0.04
				player = 1
				fade = 1.0
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.65000004, 0.0)
		radius = 0.02
		Color = [
			255
			184
			108
			0
		]
		BlendMode = blend
		thickness = 4.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				player = 1
				gemColor = orange
				fade = 1.0
			}
			{
				type = History
				historyType = frequency
				response = offsetY
				scaleMod = -0.0125
				responseFunc = sinTime
				spectrumBand = 2
			}
			{
				type = waveform
				response = deform
				scaleMod = 15.0
			}
			{
				type = rockmeterstatus
				response = radiusScale
				scaleMod = 0.04
				player = 1
				fade = 1.0
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.35000002, 0.0)
		radius = 0.0
		Color = [
			108
			255
			131
			0
		]
		BlendMode = blend
		thickness = 4.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				player = 1
				gemColor = green
				fade = 1.0
			}
			{
				type = History
				historyType = frequency
				response = offsetY
				scaleMod = 0.0125
				responseFunc = sinTime
				spectrumBand = 2
			}
			{
				type = waveform
				response = deform
				scaleMod = 15.0
			}
			{
				type = rockmeterstatus
				response = radiusScale
				scaleMod = 0.04
				player = 1
				fade = 1.0
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.35000002, 0.0)
		radius = 0.005
		Color = [
			255
			108
			108
			0
		]
		BlendMode = blend
		thickness = 4.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				player = 1
				gemColor = red
				fade = 1.0
			}
			{
				type = History
				historyType = frequency
				response = offsetY
				scaleMod = 0.0125
				responseFunc = sinTime
				spectrumBand = 2
			}
			{
				type = waveform
				response = deform
				scaleMod = 15.0
			}
			{
				type = rockmeterstatus
				response = radiusScale
				scaleMod = 0.04
				player = 1
				fade = 1.0
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.35000002, 0.0)
		radius = 0.01
		Color = [
			255
			229
			108
			0
		]
		BlendMode = blend
		thickness = 4.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				player = 1
				gemColor = yellow
				fade = 1.0
			}
			{
				type = History
				historyType = frequency
				response = offsetY
				scaleMod = 0.0125
				responseFunc = sinTime
				spectrumBand = 2
			}
			{
				type = waveform
				response = deform
				scaleMod = 15.0
			}
			{
				type = rockmeterstatus
				response = radiusScale
				scaleMod = 0.04
				player = 1
				fade = 1.0
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.35000002, 0.0)
		radius = 0.015
		Color = [
			108
			144
			255
			0
		]
		BlendMode = blend
		thickness = 4.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				player = 1
				gemColor = blue
				fade = 1.0
			}
			{
				type = History
				historyType = frequency
				response = offsetY
				scaleMod = 0.0125
				responseFunc = sinTime
				spectrumBand = 2
			}
			{
				type = waveform
				response = deform
				scaleMod = 15.0
			}
			{
				type = rockmeterstatus
				response = radiusScale
				scaleMod = 0.04
				player = 1
				fade = 1.0
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.35000002, 0.0)
		radius = 0.02
		Color = [
			255
			184
			108
			0
		]
		BlendMode = blend
		thickness = 4.0
		angle = 0
		angularVel = 0
		controls = [
			{
				type = noteHit
				response = alphaModulation
				scaleMod = 1.0
				player = 1
				gemColor = orange
				fade = 1.0
			}
			{
				type = History
				historyType = frequency
				response = offsetY
				scaleMod = 0.0125
				responseFunc = sinTime
				spectrumBand = 2
			}
			{
				type = waveform
				response = deform
				scaleMod = 15.0
			}
			{
				type = rockmeterstatus
				response = radiusScale
				scaleMod = 0.04
				player = 1
				fade = 1.0
			}
		]
	}
	{
		type = nStar2
		Pos = (0.5, 0.5, 0.0)
		nPoints = 19
		radius = 0.3
		radius2 = -0.02
		Color = [
			255
			255
			255
			255
		]
		BlendMode = subtract
		thickness = 0.5
		angle = 0
		angularVel = -0.69813204
		controls = [
			{
				type = noteHit
				response = radius2Scale
				scaleMod = 0.02
				player = 1
				fade = 1.0
			}
		]
	}
]
