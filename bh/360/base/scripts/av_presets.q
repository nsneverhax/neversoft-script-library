AV_Test_Profile = {
	avPreset = [
		$OG_BluePhoenix
		$OG_NoteHitCircles_A
	]
	fxParam = $Default_TOD_Manager
}

script OG_Add_Visualizer 
	if ScreenFX_FXInstanceExists \{viewport = bg_viewport
			name = AVFX01}
		ScreenFX_ClearFXInstances \{viewport = bg_viewport}
	endif
	wait \{1
		frame}
	ScreenFX_AddFXInstance \{viewport = bg_viewport
		name = AVFX01
		scefName = AVFX01
		type = AudioVisualize
		on = 1
		primitives = $OG_Frequency_Clouds_C}
	ScreenFX_AddFXInstance \{viewport = bg_viewport
		name = AVFX_Bloom01
		scefName = AVFX_Bloom01
		type = bloom2
		on = 1
		materialFilter = 0
		fullScreen = 1
		subtract = [
			0
			0
			0
			0
		]
		colormodulate = [
			2.0
			2.0
			2.0
			1.0
		]
		saturation = 1.0
		equation = eq2}
endscript

script OG_Remove_Visualizer 
	ScreenFX_FXInstanceExists \{viewport = bg_viewport
		name = AVFX01}
	ScreenFX_ClearFXInstances \{viewport = bg_viewport}
endscript
OG_TunnelizerToo = [
	{
		type = blendPrev
		angularVel = 0.1
		scale = (-1.1, -1.1)
		Color = [
			254
			254
			254
			250
		]
		BlendMode = blend
	}
	{
		type = line
		Pos = (0.5, 0.05, 0.0)
		Color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 10000
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 10
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.1, 0.0)
		Color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 20
				response = blueModulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 20
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.15, 0.0)
		Color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 30
				response = blueModulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 30
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.2, 0.0)
		Color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 40
				response = blueModulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 40
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.25, 0.0)
		Color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 50
				response = blueModulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 50
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.3, 0.0)
		Color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 60
				response = blueModulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.01
		scale = (1.01, 1.01)
		Color = [
			254
			154
			54
			20
		]
		BlendMode = add
	}
]
OG_Tunnelizer = [
	{
		type = blendPrev
		angularVel = 0.1
		scale = (-1.0, -1.0)
		offset = (0.01, 0.01)
		Color = [
			254
			254
			254
			250
		]
		BlendMode = blend
	}
	{
		type = line
		Pos = (0.5, 0.05, 0.0)
		Color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 10000
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 10
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.1, 0.0)
		Color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 20
				response = blueModulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 20
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.15, 0.0)
		Color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 30
				response = blueModulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 30
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.2, 0.0)
		Color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 40
				response = blueModulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 40
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.25, 0.0)
		Color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 50
				response = blueModulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 50
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.3, 0.0)
		Color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 60
				response = blueModulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.0
		scale = (1.01, 0.97999996)
		Color = [
			80
			80
			80
			25
		]
		BlendMode = add
	}
]
OG_Testbed = [
	{
		type = blendPrev
		angularVel = 0.1
		scale = (-1.0, -1.0)
		offset = (0.0, -0.02)
		Color = [
			254
			154
			54
			255
		]
		angle = 0
		BlendMode = blend
		controls = [
			{
				type = meandbs_history
				spectrumBand = 10
				response = blueModulation
				colorscale = -80
			}
			{
				type = frequency_History
				spectrumBand = 2
				response = offsetY
				scaleMod = 1
			}
			{
				type = frequency
				spectrumBand = 5
				response = scaleX
				RespounseFunc = sinLog10
				scaleMod = -5
			}
		]
	}
	{
		type = line
		Pos = (0.35000002, 0.5, 0.0)
		Color = [
			50
			50
			200
			155
		]
		angle = 0
		length = -0.5
		thickness = 10
		angularVel = 0.0
		BlendMode = add
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 5000
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
]
OG_Bird = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (-1.0, 1.0)
		offset = (0.0, -0.019499999)
		Color = [
			254
			254
			254
			255
		]
		angle = 0
		BlendMode = blend
		nonUniformScale
		controls = [
			{
				type = frequency_History
				spectrumBand = 50
				response = offsetY
				scaleMod = 1
			}
			{
				type = frequency
				spectrumBand = 5
				response = scaleX
				RespounseFunc = sinLog10
				scaleMod = -0.5
			}
		]
	}
	{
		type = line
		Pos = (0.35000002, 0.5, 0.0)
		Color = [
			50
			50
			200
			155
		]
		angle = 0
		length = -0.5
		thickness = 10
		angularVel = 0.0
		BlendMode = add
		controls = [
			{
				type = frequency
				spectrumBand = 5
				response = deform
				DeformScale = 5000
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0
		angle = -0.11
		scale = (1.0, 1.0)
		offset = (0.0, 0.0)
		Color = [
			254
			254
			254
			100
		]
		BlendMode = add
		controls = [
			{
				type = meandbs_history
				spectrumBand = 10
				response = blueModulation
				colorscale = 80
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.0
		angle = 1
		scale = (0.90999997, 1.01)
		offset = (0.0, 0.0)
		Color = [
			254
			254
			254
			160
		]
		BlendMode = sub
	}
]
OG_Slinky = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (-1.0, 1.0)
		offset = (0.0, -0.0075000003)
		Color = [
			254
			254
			254
			255
		]
		angle = 0
		BlendMode = add
		nonUniformScale
		controls = [
			{
				type = meandbs_history
				spectrumBand = 10
				response = blueModulation
				colorscale = -80
			}
			{
				type = frequency_History
				spectrumBand = 5
				response = offsetY
				scaleMod = 0.5
			}
			{
				type = frequency
				spectrumBand = 5
				response = scaleX
				scaleMod = -0.5
			}
		]
	}
	{
		type = circle
		Pos = (0.25, 0.5, 0.0)
		Color = [
			200
			100
			50
			100
		]
		radius = 0.1
		BlendMode = add
		thickness = 5
		controls = [
			{
				type = frequency_History
				response = radiusScale
				spectrumBand = 16
				responseFunc = log10
				radiusscalemod = 0.1
			}
		]
	}
	{
		type = line
		Pos = (0.75, 0.5, 0.0)
		Color = [
			0
			50
			200
			155
		]
		angle = 0
		length = -0.5
		thickness = 3
		angularVel = 0.0
		BlendMode = add
		controls = [
			{
				type = frequency
				spectrumBand = 5
				response = deform
				DeformScale = 5000
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
]
OG_Spectrum = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (0.98999995, -1.1)
		offset = (0.002, 0.0)
		Color = [
			254
			254
			254
			254
		]
		BlendMode = blend
	}
	{
		type = circle
		Pos = (0.3, 0.5, 0.0)
		radius = 0.016499998
		Color = [
			90
			0
			120
			250
		]
		thickness = 30
		angularVel = 0.1
		controls = [
			{
				type = noteHit
				player = 1
				spectrumBand = 10
				response = blueModulation
				colorscale = 160
			}
			{
				type = noteHit
				player = 1
				spectrumBand = 20
				response = redModulation
				colorscale = 180
			}
			{
				type = noteHit
				player = 1
				spectrumBand = 30
				response = greenModulation
				colorscale = 200
			}
			{
				type = frequency
				response = radiusScale
				responseFunc = sinLog10
				radiusscalemod = 0.09
				spectrumBand = 30
			}
		]
	}
	{
		type = circle
		Pos = (0.7, 0.5, 0.0)
		radius = 0.016499998
		Color = [
			90
			0
			0
			250
		]
		thickness = 30
		controls = [
			{
				type = noteHit
				player = 2
				spectrumBand = 20
				response = redModulation
				colorscale = 1
			}
			{
				type = noteHit
				player = 2
				spectrumBand = 30
				response = greenModulation
				colorscale = 1
			}
			{
				type = noteHit
				player = 2
				spectrumBand = 10
				response = blueModulation
				colorscale = 1
			}
			{
				type = frequency
				response = radiusScale
				responseFunc = sinLog10
				radiusscalemod = 0.09
				spectrumBand = 30
			}
		]
	}
	{
		type = line
		Pos = (0.1, 0.5, 0.0)
		Color = [
			100
			0
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.9, 0.5, 0.0)
		Color = [
			100
			0
			0
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 20
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.0, 0.0)
		Color = [
			100
			0
			0
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 30
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 30
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 30
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.0, 0.0)
		Color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 40
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 40
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 40
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.0, 0.0)
		Color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 50
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 50
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 50
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.0, 0.0)
		Color = [
			200
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 60
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 60
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.0
		scale = (0.9, 1.9)
		offset = (0.002, 0.0)
		Color = [
			254
			254
			254
			80
		]
		BlendMode = add
	}
	{
		type = blendPrev
		angularVel = 0.1
		scale = (-0.90999997, -1.01)
		offset = (0.0, 0.0)
		Color = [
			254
			254
			254
			120
		]
		BlendMode = sub
		controls = [
			{
				type = beatOn
				spectrumBand = 10
				response = angularVelMod
				velscale = 1000
			}
		]
	}
]
OG_Spectrum3D_Half = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (-1.0, 1.0)
		offset = (0.0, -0.0075000003)
		Color = [
			254
			254
			254
			250
		]
		angle = 0
		BlendMode = add
		controls = [
			{
				type = meandbs_history
				spectrumBand = 10
				response = blueModulation
				colorscale = -80
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.8, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 15.0
		angularVel = 0.0
		angle = 0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 56
				response = lengthScale
				lengthscalemod = 200
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			100
			0
			0
			155
		]
		angle = 0
		length = -0.5
		thickness = 5
		angularVel = 0
		angle = 1.5707
		BlendMode = add
		controls = [
			{
				type = meandbs_history
				spectrumBand = 5
				response = deform
				DeformScale = 1000
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.95, 0.0)
		Color = [
			0
			50
			200
			155
		]
		angle = 0
		length = 0.95
		thickness = 3
		angularVel = 0.0
		BlendMode = add
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 5000
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0
		angle = 1
		scale = (1.0, 1.0)
		offset = (0.0, 0.01)
		Color = [
			254
			254
			254
			100
		]
		BlendMode = add
		controls = [
			{
				type = beatOn
				spectrumBand = 10
				response = angularVelMod
				velscale = 1000
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.1
		scale = (-0.90999997, -1.01)
		offset = (0.0, 0.0)
		Color = [
			254
			254
			254
			120
		]
		BlendMode = sub
		controls = [
			{
				type = beatOn
				spectrumBand = 10
				response = angularVelMod
				velscale = 1000
			}
		]
	}
]
OG_StrobeyBusiness = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (-1.0, 1.0)
		offset = (0.0, -0.0075000003)
		Color = [
			254
			254
			254
			250
		]
		angle = 0
		BlendMode = add
		controls = [
			{
				type = meandbs_history
				spectrumBand = 10
				response = blueModulation
				colorscale = -80
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.8, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 15.0
		angularVel = 0.0
		angle = 0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 56
				response = lengthScale
				lengthscalemod = 200
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			100
			0
			0
			155
		]
		angle = 0
		length = -0.5
		thickness = 5
		angularVel = 0
		angle = 1.5707
		BlendMode = add
		controls = [
			{
				type = meandbs_history
				spectrumBand = 5
				response = deform
				DeformScale = 1000
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.95, 0.0)
		Color = [
			0
			50
			200
			155
		]
		angle = 0
		length = 0.95
		thickness = 3
		angularVel = 0.0
		BlendMode = add
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 5000
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0
		angle = 1
		scale = (1.0, 1.0)
		offset = (0.0, 0.01)
		Color = [
			254
			254
			254
			100
		]
		BlendMode = add
		controls = [
			{
				type = beatOn
				spectrumBand = 10
				response = angularVelMod
				velscale = 1000
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.1
		scale = (-0.90999997, -1.01)
		offset = (0.0, 0.0)
		Color = [
			254
			254
			254
			120
		]
		BlendMode = sub
		controls = [
			{
				type = beatOn
				spectrumBand = 10
				response = angularVelMod
				velscale = 1000
			}
		]
	}
]
OG_RisingLandscape = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (-1.0, 1.0)
		offset = (0.0, -0.0075000003)
		Color = [
			254
			254
			254
			250
		]
		angle = 0
		BlendMode = add
		controls = [
			{
				type = meandbs_history
				spectrumBand = 10
				response = blueModulation
				colorscale = -80
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.8, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 15.0
		angularVel = 0.0
		angle = 0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 56
				response = lengthScale
				lengthscalemod = 200
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			100
			0
			0
			155
		]
		angle = 0
		length = -0.5
		thickness = 5
		angularVel = 0
		angle = 1.5707
		BlendMode = add
		controls = [
			{
				type = meandbs_history
				spectrumBand = 5
				response = deform
				DeformScale = 1000
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.95, 0.0)
		Color = [
			0
			50
			200
			155
		]
		angle = 0
		length = 0.95
		thickness = 3
		angularVel = 0.0
		BlendMode = add
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 5000
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0
		angle = 1
		scale = (1.0, 1.0)
		offset = (0.0, 0.01)
		Color = [
			254
			254
			254
			6
		]
		BlendMode = add
	}
]
OG_FullRotationAmped = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (1.0, 1.0199)
		offset = (0.0125, 0.0)
		Color = [
			254
			254
			254
			254
		]
		angle = 0
		BlendMode = add
		controls = [
			{
				type = meandbs_history
				spectrumBand = 10
				response = blueModulation
				colorscale = -80
			}
		]
	}
	{
		type = line
		Pos = (1.0, 0.0, 0.0)
		Color = [
			200
			0
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 50
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = 10
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = lengthScale
				lengthscalemod = -100
			}
		]
	}
	{
		type = line
		Pos = (1.0, 0.5, 0.0)
		Color = [
			100
			0
			0
			155
		]
		angle = 0
		length = 1
		thickness = 10
		angularVel = 0
		angle = 0
		BlendMode = add
		controls = [
			{
				type = meandbs_history
				spectrumBand = 5
				response = deform
				DeformScale = 500
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		Pos = (0.0, 0.5, 0.0)
		Color = [
			0
			50
			200
			155
		]
		angle = 0
		length = 1
		thickness = 10
		angularVel = 0.0
		BlendMode = add
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 3500
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
	{
		type = blendPrev
		angularVel = -1.1
		angle = 1
		scale = (0.98999995, 0.9)
		offset = (0.01, 0.0)
		Color = [
			254
			254
			254
			80
		]
		BlendMode = add
		controls = [
			{
				type = beatOn
				spectrumBand = 10
				response = angularVelMod
				velscale = 1000
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.1
		scale = (-0.90999997, -1.01)
		offset = (0.0, 0.0)
		Color = [
			254
			254
			254
			120
		]
		BlendMode = sub
		controls = [
			{
				type = beatOn
				spectrumBand = 10
				response = angularVelMod
				velscale = 1000
			}
		]
	}
]
OG_FullRotation = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (1.1, 1.0)
		offset = (0.025, 0.0)
		Color = [
			254
			254
			254
			254
		]
		angle = 0
		BlendMode = add
		controls = [
			{
				type = meandbs_history
				spectrumBand = 10
				response = blueModulation
				colorscale = -80
			}
		]
	}
	{
		type = line
		Pos = (1.0, 0.0, 0.0)
		Color = [
			200
			0
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 50
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = 10
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = lengthScale
				lengthscalemod = -100
			}
		]
	}
	{
		type = line
		Pos = (1.0, 0.5, 0.0)
		Color = [
			100
			0
			0
			155
		]
		angle = 0
		length = 1
		thickness = 10
		angularVel = 0
		angle = 0
		BlendMode = add
		controls = [
			{
				type = meandbs_history
				spectrumBand = 5
				response = deform
				DeformScale = 500
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		Pos = (0.0, 0.5, 0.0)
		Color = [
			0
			50
			200
			155
		]
		angle = 0
		length = 1
		thickness = 10
		angularVel = 0.0
		BlendMode = add
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 3500
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
	{
		type = blendPrev
		angularVel = -1.1
		angle = 1
		scale = (0.98999995, 0.9)
		offset = (0.01, 0.0)
		Color = [
			254
			254
			254
			80
		]
		BlendMode = add
		controls = [
			{
				type = beatOn
				spectrumBand = 10
				response = angularVelMod
				velscale = 1000
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.1
		scale = (-0.90999997, -1.01)
		offset = (0.0, 0.0)
		Color = [
			254
			254
			254
			120
		]
		BlendMode = sub
		controls = [
			{
				type = beatOn
				spectrumBand = 10
				response = angularVelMod
				velscale = 1000
			}
		]
	}
]
OG_SpinToWin = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (1.1, -1.0)
		offset = (0.025, 0.0)
		Color = [
			254
			254
			254
			254
		]
		angle = 0
		BlendMode = add
		controls = [
			{
				type = meandbs_history
				spectrumBand = 10
				response = blueModulation
				colorscale = -80
			}
		]
	}
	{
		type = line
		Pos = (1.0, 0.0, 0.0)
		Color = [
			200
			0
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 50
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = 10
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = lengthScale
				lengthscalemod = -100
			}
		]
	}
	{
		type = line
		Pos = (1.0, 0.5, 0.0)
		Color = [
			100
			0
			0
			155
		]
		angle = 0
		length = 1
		thickness = 10
		angularVel = 0
		angle = 0
		BlendMode = add
		controls = [
			{
				type = meandbs_history
				spectrumBand = 5
				response = deform
				DeformScale = 500
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		Pos = (0.0, 0.5, 0.0)
		Color = [
			0
			50
			200
			155
		]
		angle = 0
		length = 1
		thickness = 10
		angularVel = 0.0
		BlendMode = add
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 3500
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
	{
		type = blendPrev
		angularVel = -1.1
		angle = 1
		scale = (0.98999995, 0.9)
		offset = (0.01, 0.0)
		Color = [
			254
			254
			254
			80
		]
		BlendMode = add
		controls = [
			{
				type = beatOn
				spectrumBand = 10
				response = angularVelMod
				velscale = 1000
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.1
		scale = (-0.90999997, -1.01)
		offset = (0.0, 0.0)
		Color = [
			254
			254
			254
			120
		]
		BlendMode = sub
		controls = [
			{
				type = beatOn
				spectrumBand = 10
				response = angularVelMod
				velscale = 1000
			}
		]
	}
]
OG_ScarfMangle = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (1.1, -1.0)
		offset = (0.025, 0.0)
		Color = [
			254
			254
			254
			254
		]
		angle = 0
		BlendMode = add
		controls = [
			{
				type = meandbs_history
				spectrumBand = 10
				response = blueModulation
				colorscale = -80
			}
		]
	}
	{
		type = line
		Pos = (1.0, 0.0, 0.0)
		Color = [
			200
			0
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 50
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = 10
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = lengthScale
				lengthscalemod = -100
			}
		]
	}
	{
		type = line
		Pos = (1.0, 0.5, 0.0)
		Color = [
			100
			0
			0
			155
		]
		angle = 0
		length = 1
		thickness = 10
		angularVel = 0
		angle = 0
		BlendMode = add
		controls = [
			{
				type = meandbs_history
				spectrumBand = 5
				response = deform
				DeformScale = 500
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		Pos = (0.0, 0.5, 0.0)
		Color = [
			0
			50
			200
			155
		]
		angle = 0
		length = 1
		thickness = 10
		angularVel = 0.0
		BlendMode = add
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 3500
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.0
		angle = 1
		scale = (0.98999995, 0.9)
		offset = (0.01, 0.0)
		Color = [
			254
			254
			254
			80
		]
		BlendMode = add
	}
	{
		type = blendPrev
		angularVel = 0.1
		scale = (-0.90999997, -1.01)
		offset = (0.0, 0.0)
		Color = [
			254
			254
			254
			120
		]
		BlendMode = sub
		controls = [
			{
				type = beatOn
				spectrumBand = 10
				response = angularVelMod
				velscale = 1000
			}
		]
	}
]
OG_RightDominant = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (1.1, -1.0)
		offset = (0.025, 0.0)
		Color = [
			254
			254
			254
			254
		]
		angle = 0
		BlendMode = add
		controls = [
			{
				type = meandbs_history
				spectrumBand = 10
				response = blueModulation
				colorscale = -80
			}
		]
	}
	{
		type = line
		Pos = (1.0, 0.0, 0.0)
		Color = [
			200
			0
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 50
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = 10
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = lengthScale
				lengthscalemod = -100
			}
		]
	}
	{
		type = line
		Pos = (1.0, 0.5, 0.0)
		Color = [
			100
			0
			0
			155
		]
		angle = 0
		length = 1
		thickness = 10
		angularVel = 0
		angle = 0
		BlendMode = add
		controls = [
			{
				type = meandbs_history
				spectrumBand = 5
				response = deform
				DeformScale = 500
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		Pos = (0.0, 0.5, 0.0)
		Color = [
			0
			50
			200
			155
		]
		angle = 0
		length = 1
		thickness = 10
		angularVel = 0.0
		BlendMode = add
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 3500
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
]
OG_ColorSucker = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (-1.0, 1.0)
		offset = (0.0, 0.0)
		Color = [
			254
			254
			254
			255
		]
		angle = 0
		BlendMode = blend
		controls = [
			{
				type = meandbs_history
				spectrumBand = 10
				response = blueModulation
				colorscale = -80
			}
		]
	}
	{
		type = line
		Pos = (0.0, 1.0, 0.0)
		Color = [
			200
			0
			0
			255
		]
		angle = 0
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 50
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = 10
			}
			{
				type = frequency_History
				spectrumBand = 5
				response = lengthScale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			50
			30
			20
			155
		]
		length = 1
		thickness = 10
		angularVel = 0
		angle = 1.5707
		BlendMode = add
		controls = [
			{
				type = meandbs_history
				spectrumBand = 5
				response = deform
				DeformScale = 500
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -10
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.0, 0.0)
		Color = [
			0
			50
			200
			155
		]
		angle = 1.5707
		length = 1
		thickness = 10
		angularVel = 0.0
		BlendMode = add
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 3500
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.0
		scale = (0.98999995, 0.9)
		offset = (0.0, 0.01)
		Color = [
			204
			154
			254
			75
		]
		BlendMode = add
	}
	{
		type = blendPrev
		angularVel = 0.1
		scale = (-0.90999997, -1.01)
		offset = (0.0, 0.0)
		Color = [
			254
			254
			254
			105
		]
		BlendMode = sub
		controls = [
			{
				type = beatOn
				spectrumBand = 10
				response = angularVelMod
				velscale = 1000
			}
		]
	}
]
OG_ColorSucker_H = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (1.0, -1.0)
		offset = (0.0, 0.0)
		Color = [
			254
			254
			254
			255
		]
		angle = 0
		BlendMode = blend
		controls = [
			{
				type = meandbs_history
				spectrumBand = 10
				response = blueModulation
				colorscale = -80
			}
		]
	}
	{
		type = line
		Pos = (1.0, 0.0, 0.0)
		Color = [
			200
			0
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 50
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = 10
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = lengthScale
				lengthscalemod = -100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			100
			0
			0
			155
		]
		angle = 0
		length = 1
		thickness = 10
		angularVel = 0
		angle = 0
		BlendMode = add
		controls = [
			{
				type = meandbs_history
				spectrumBand = 5
				response = deform
				DeformScale = 500
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		Pos = (0.0, 0.5, 0.0)
		Color = [
			0
			50
			200
			155
		]
		angle = 0
		length = 1
		thickness = 10
		angularVel = 0.0
		BlendMode = add
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 3500
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.0
		scale = (0.98999995, 0.9)
		offset = (0.01, 0.0)
		Color = [
			254
			254
			254
			80
		]
		BlendMode = add
	}
	{
		type = blendPrev
		angularVel = 0.1
		scale = (-0.90999997, -1.01)
		offset = (0.0, 0.0)
		Color = [
			254
			254
			254
			120
		]
		BlendMode = sub
		controls = [
			{
				type = beatOn
				spectrumBand = 10
				response = angularVelMod
				velscale = 1000
			}
		]
	}
]
OG_ScarfTurn = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (-1.01, -1.01)
		offset = (0.0125, 0.0125)
		Color = [
			254
			254
			254
			255
		]
		angle = 3
		BlendMode = blend
		controls = [
			{
				type = meandbs_history
				spectrumBand = 10
				response = blueModulation
				colorscale = -80
			}
		]
	}
	{
		type = line
		Pos = (1.0, 0.0, 0.0)
		Color = [
			200
			0
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 50
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = 10
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = lengthScale
				lengthscalemod = -100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			100
			0
			0
			155
		]
		angle = 0
		length = 1
		thickness = 10
		angularVel = 0
		angle = 1.5707
		BlendMode = add
		controls = [
			{
				type = meandbs_history
				spectrumBand = 5
				response = deform
				DeformScale = 500
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		Pos = (0.0, 0.5, 0.0)
		Color = [
			0
			50
			200
			155
		]
		angle = 0
		length = 1
		thickness = 10
		angularVel = 0.0
		BlendMode = add
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 3500
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.0
		scale = (0.98999995, 0.9)
		offset = (0.01, 0.0)
		Color = [
			254
			254
			254
			80
		]
		BlendMode = add
	}
	{
		type = blendPrev
		angularVel = 0.1
		scale = (-0.90999997, -1.01)
		offset = (0.0, 0.0)
		Color = [
			254
			254
			254
			120
		]
		BlendMode = sub
		controls = [
			{
				type = beatOn
				spectrumBand = 10
				response = angularVelMod
				velscale = 1000
			}
		]
	}
]
OG_ScarfSymSpin = [
	{
		type = blendPrev
		angularVel = 0.1
		scale = (-1.01, -1.01)
		offset = (0.0125, 0.0125)
		Color = [
			254
			254
			254
			255
		]
		angle = 1
		BlendMode = blend
		controls = [
			{
				type = meandbs_history
				spectrumBand = 10
				response = blueModulation
				colorscale = -80
			}
		]
	}
	{
		type = line
		Pos = (1.0, 0.0, 0.0)
		Color = [
			200
			0
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 50
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = 10
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = lengthScale
				lengthscalemod = -100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			100
			0
			0
			155
		]
		angle = 0
		length = 1
		thickness = 10
		angularVel = 0
		angle = 1.5707
		BlendMode = add
		controls = [
			{
				type = meandbs_history
				spectrumBand = 5
				response = deform
				DeformScale = 500
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		Pos = (0.0, 0.5, 0.0)
		Color = [
			0
			50
			200
			155
		]
		angle = 0
		length = 1
		thickness = 10
		angularVel = 0.0
		BlendMode = add
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 3500
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.0
		scale = (0.98999995, 0.9)
		offset = (0.01, 0.0)
		Color = [
			254
			254
			254
			80
		]
		BlendMode = add
	}
	{
		type = blendPrev
		angularVel = 0.1
		scale = (-0.90999997, -1.01)
		offset = (0.0, 0.0)
		Color = [
			254
			254
			254
			120
		]
		BlendMode = sub
		controls = [
			{
				type = beatOn
				spectrumBand = 10
				response = angularVelMod
				velscale = 1000
			}
		]
	}
]
OG_ScarfRadial = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (-1.01, -1.01)
		offset = (0.0125, 0.0125)
		Color = [
			254
			254
			254
			255
		]
		angle = 1
		BlendMode = blend
		controls = [
			{
				type = meandbs_history
				spectrumBand = 10
				response = blueModulation
				colorscale = -80
			}
		]
	}
	{
		type = line
		Pos = (1.0, 0.0, 0.0)
		Color = [
			200
			0
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 50
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = 10
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = lengthScale
				lengthscalemod = -100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			100
			0
			0
			155
		]
		angle = 0
		length = 1
		thickness = 10
		angularVel = 0
		angle = 1.5707
		BlendMode = add
		controls = [
			{
				type = meandbs_history
				spectrumBand = 5
				response = deform
				DeformScale = 500
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		Pos = (0.0, 0.5, 0.0)
		Color = [
			0
			50
			200
			155
		]
		angle = 0
		length = 1
		thickness = 10
		angularVel = 0.0
		BlendMode = add
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 3500
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.0
		scale = (0.98999995, 0.9)
		offset = (0.01, 0.0)
		Color = [
			254
			254
			254
			80
		]
		BlendMode = add
	}
	{
		type = blendPrev
		angularVel = 0.1
		scale = (-0.90999997, -1.01)
		offset = (0.0, 0.0)
		Color = [
			254
			254
			254
			120
		]
		BlendMode = sub
		controls = [
			{
				type = beatOn
				spectrumBand = 10
				response = angularVelMod
				velscale = 1000
			}
		]
	}
]
OG_ScarfSym = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (-1.01, -1.01)
		offset = (0.0125, 0.0125)
		Color = [
			254
			254
			254
			255
		]
		angle = 0
		BlendMode = blend
		controls = [
			{
				type = meandbs_history
				spectrumBand = 10
				response = blueModulation
				colorscale = -80
			}
		]
	}
	{
		type = line
		Pos = (1.0, 0.0, 0.0)
		Color = [
			200
			0
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 50
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = 10
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = lengthScale
				lengthscalemod = -100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			100
			0
			0
			155
		]
		angle = 0
		length = 1
		thickness = 10
		angularVel = 0
		angle = 1.5707
		BlendMode = add
		controls = [
			{
				type = meandbs_history
				spectrumBand = 5
				response = deform
				DeformScale = 500
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		Pos = (0.0, 0.5, 0.0)
		Color = [
			0
			50
			200
			155
		]
		angle = 0
		length = 1
		thickness = 10
		angularVel = 0.0
		BlendMode = add
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 3500
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.0
		scale = (0.98999995, 0.9)
		offset = (0.01, 0.0)
		Color = [
			254
			254
			254
			80
		]
		BlendMode = add
	}
	{
		type = blendPrev
		angularVel = 0.1
		scale = (-0.90999997, -1.01)
		offset = (0.0, 0.0)
		Color = [
			254
			254
			254
			120
		]
		BlendMode = sub
		controls = [
			{
				type = beatOn
				spectrumBand = 10
				response = angularVelMod
				velscale = 1000
			}
		]
	}
]
OG_Scarf = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (1.01, 1.01)
		offset = (0.0125, 0.0125)
		Color = [
			254
			254
			254
			255
		]
		angle = 0
		BlendMode = blend
		controls = [
			{
				type = meandbs_history
				spectrumBand = 10
				response = blueModulation
				colorscale = -80
			}
		]
	}
	{
		type = line
		Pos = (1.0, 0.0, 0.0)
		Color = [
			200
			0
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 50
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = 10
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = lengthScale
				lengthscalemod = -100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			100
			0
			0
			155
		]
		angle = 0
		length = 1
		thickness = 10
		angularVel = 0
		angle = 1.5707
		BlendMode = add
		controls = [
			{
				type = meandbs_history
				spectrumBand = 5
				response = deform
				DeformScale = 500
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		Pos = (0.0, 0.5, 0.0)
		Color = [
			0
			50
			200
			155
		]
		angle = 0
		length = 1
		thickness = 10
		angularVel = 0.0
		BlendMode = add
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 3500
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.0
		scale = (0.98999995, 0.9)
		offset = (0.01, 0.0)
		Color = [
			254
			254
			254
			80
		]
		BlendMode = add
	}
	{
		type = blendPrev
		angularVel = 0.1
		scale = (-0.90999997, -1.01)
		offset = (0.0, 0.0)
		Color = [
			254
			254
			254
			120
		]
		BlendMode = sub
		controls = [
			{
				type = beatOn
				spectrumBand = 10
				response = angularVelMod
				velscale = 1000
			}
		]
	}
]
OG_Basin = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (-1.01, 1.05)
		offset = (0.0125, 0.01)
		Color = [
			254
			254
			254
			255
		]
		angle = 0
		BlendMode = blend
		controls = [
			{
				type = meandbs_history
				spectrumBand = 10
				response = blueModulation
				colorscale = -80
			}
		]
	}
	{
		type = line
		Pos = (1.0, 0.0, 0.0)
		Color = [
			200
			0
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 50
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = 10
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = lengthScale
				lengthscalemod = -100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			100
			0
			0
			155
		]
		angle = 0
		length = 1
		thickness = 10
		angularVel = 0
		angle = 1.5707
		BlendMode = add
		controls = [
			{
				type = meandbs_history
				spectrumBand = 5
				response = deform
				DeformScale = 500
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		Pos = (0.0, 0.5, 0.0)
		Color = [
			0
			50
			200
			155
		]
		angle = 0
		length = 1
		thickness = 10
		angularVel = 0.0
		BlendMode = add
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 1500
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
]
OG_Spectrum3D_Gold = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (1.01, -1.05)
		offset = (0.0125, 0.0)
		Color = [
			254
			254
			254
			255
		]
		angle = 0
		BlendMode = blend
		controls = [
			{
				type = meandbs_history
				spectrumBand = 10
				response = blueModulation
				colorscale = -80
			}
		]
	}
	{
		type = line
		Pos = (1.0, 0.0, 0.0)
		Color = [
			200
			0
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 50
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = 10
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = lengthScale
				lengthscalemod = -100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			100
			0
			0
			155
		]
		angle = 0
		length = 1
		thickness = 10
		angularVel = 0.0
		BlendMode = add
		controls = [
			{
				type = meandbs_history
				spectrumBand = 5
				response = deform
				DeformScale = 500
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		Pos = (0.0, 0.5, 0.0)
		Color = [
			0
			50
			200
			155
		]
		angle = 0
		length = 1
		thickness = 10
		angularVel = 0.0
		BlendMode = add
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 1500
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
]
OG_Spectrum3D_RoyBFlip_Out = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (-1.01, -1.05)
		offset = (0.0, 0.0012500001)
		Color = [
			254
			254
			254
			255
		]
		angle = 0
		BlendMode = blend
		controls = [
			{
				type = meandbs_history
				spectrumBand = 10
				response = blueModulation
				colorscale = -80
			}
			{
				type = beatOn
				spectrumBand = 10
				response = angularVelMod
				fade = 0.1
				scaleMod = 1
			}
		]
	}
	{
		type = line
		Pos = (0.125, 0.0, 0.0)
		Color = [
			200
			50
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 50
		angularVel = 0.0
		controls = [
			{
				type = beatOn
				fade = 0.1
				spectrumBand = 10
				response = blueModulation
				colorscale = 250
			}
			{
				type = beatOn
				spectrumBand = 25
				response = redModulation
				colorscale = 50
			}
			{
				type = beatOn
				spectrumBand = 5
				response = lengthScale
				lengthscalemod = -100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.85, 0.0)
		Color = [
			100
			0
			0
			155
		]
		angle = 1.5707
		length = 1
		thickness = 100
		angularVel = 0.0
		BlendMode = add
		controls = [
			{
				type = meandbs_history
				spectrumBand = 5
				response = deform
				DeformScale = 600
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -10
			}
		]
	}
	{
		type = line
		Pos = (0.255, 0.95, 0.0)
		Color = [
			0
			50
			200
			195
		]
		angle = 3.1399999
		length = 0.5
		thickness = 10
		angularVel = 0.0
		BlendMode = add
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = -2500
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		Pos = (0.255, 0.05, 0.0)
		Color = [
			0
			50
			200
			195
		]
		angle = 3.1399999
		length = 0.5
		thickness = 10
		angularVel = 0.0
		BlendMode = add
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 2500
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.05, 0.0)
		Color = [
			0
			50
			200
			195
		]
		angle = 1.5707
		length = 0.5
		thickness = 10
		angularVel = 0.0
		BlendMode = sub
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 2500
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.95, 0.0)
		Color = [
			0
			50
			200
			195
		]
		angle = -1.5707
		length = 0.5
		thickness = 10
		angularVel = 0.0
		BlendMode = sub
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = -2500
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
]
OG_Spectrum3D_RoyBFlip = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (-1.01, -1.025)
		offset = (0.0, 0.0)
		Color = [
			254
			254
			254
			255
		]
		angle = 0
		BlendMode = blend
		controls = [
			{
				type = meandbs_history
				spectrumBand = 10
				response = blueModulation
				colorscale = -80
			}
		]
	}
	{
		type = line
		Pos = (0.125, 0.0, 0.0)
		Color = [
			200
			50
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 50
		angularVel = 0.0
		controls = [
			{
				type = beatOn
				fade = 0.1
				spectrumBand = 10
				response = blueModulation
				colorscale = 250
			}
			{
				type = beatOn
				spectrumBand = 25
				response = redModulation
				colorscale = 50
			}
			{
				type = beatOn
				spectrumBand = 5
				response = lengthScale
				lengthscalemod = -100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.85, 0.0)
		Color = [
			100
			0
			0
			155
		]
		angle = 1.5707
		length = 1
		thickness = 100
		angularVel = 0.0
		BlendMode = add
		controls = [
			{
				type = meandbs_history
				spectrumBand = 5
				response = deform
				DeformScale = 600
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -10
			}
		]
	}
	{
		type = line
		Pos = (0.255, 0.95, 0.0)
		Color = [
			0
			50
			200
			195
		]
		angle = 3.1399999
		length = 0.5
		thickness = 10
		angularVel = 0.0
		BlendMode = add
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = -2500
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		Pos = (0.255, 0.05, 0.0)
		Color = [
			0
			50
			200
			195
		]
		angle = 3.1399999
		length = 0.5
		thickness = 10
		angularVel = 0.0
		BlendMode = add
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 2500
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.05, 0.0)
		Color = [
			0
			50
			200
			95
		]
		angle = 1.5707
		length = 0.5
		thickness = 3
		angularVel = 0.0
		BlendMode = sub
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 2500
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.95, 0.0)
		Color = [
			0
			50
			200
			95
		]
		angle = -1.5707
		length = 0.5
		thickness = 3
		angularVel = 0.0
		BlendMode = sub
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = -2500
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.0
		scale = (1.9, 1.9)
		offset = (0.0, 0.0)
		Color = [
			24
			24
			24
			2
		]
		angle = 0
		BlendMode = add
		controls = [
			{
				type = beatOn
				spectrumBand = 10
				response = alphaModulation
				fade = 0.1
				scaleMod = 20
			}
		]
	}
]
OG_Spectrum3D_RoyBFlip_A = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (-1.01, -1.05)
		offset = (0.0, 0.0012500001)
		Color = [
			254
			254
			254
			255
		]
		angle = 0
		BlendMode = blend
		controls = [
			{
				type = meandbs_history
				spectrumBand = 10
				response = blueModulation
				colorscale = -80
			}
			{
				type = beatOn
				spectrumBand = 10
				response = alphaModulation
				fade = 0.1
				scaleMod = 1
			}
		]
	}
	{
		type = line
		Pos = (0.125, 0.0, 0.0)
		Color = [
			200
			50
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 50
		angularVel = 0.0
		controls = [
			{
				type = beatOn
				fade = 0.1
				spectrumBand = 10
				response = blueModulation
				colorscale = 250
			}
			{
				type = beatOn
				spectrumBand = 25
				response = redModulation
				colorscale = 50
			}
			{
				type = beatOn
				spectrumBand = 5
				response = lengthScale
				lengthscalemod = -100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.85, 0.0)
		Color = [
			100
			0
			0
			155
		]
		angle = 1.5707
		length = 1
		thickness = 100
		angularVel = 0.0
		BlendMode = add
		controls = [
			{
				type = meandbs_history
				spectrumBand = 5
				response = deform
				DeformScale = 600
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -10
			}
		]
	}
	{
		type = line
		Pos = (0.255, 0.95, 0.0)
		Color = [
			0
			50
			200
			195
		]
		angle = 3.1399999
		length = 0.5
		thickness = 10
		angularVel = 0.0
		BlendMode = add
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = -2500
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		Pos = (0.255, 0.05, 0.0)
		Color = [
			0
			50
			200
			195
		]
		angle = 3.1399999
		length = 0.5
		thickness = 10
		angularVel = 0.0
		BlendMode = add
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 2500
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.05, 0.0)
		Color = [
			0
			50
			200
			195
		]
		angle = 1.5707
		length = 0.5
		thickness = 10
		angularVel = 0.0
		BlendMode = sub
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 2500
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.95, 0.0)
		Color = [
			0
			50
			200
			195
		]
		angle = -1.5707
		length = 0.5
		thickness = 10
		angularVel = 0.0
		BlendMode = sub
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = -2500
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
]
OG_Spectrum3D_RoyBGrid = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (-0.95, 1.01)
		offset = (0.0, 0.02)
		Color = [
			255
			255
			255
			250
		]
		angle = 0
		BlendMode = blend
		controls = [
			{
				type = meandbs_history
				spectrumBand = 10
				response = blueModulation
				colorscale = -80
			}
		]
	}
	{
		type = line
		Pos = (0.35000002, 0.01, 0.0)
		Color = [
			200
			0
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 100
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = 10
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = lengthScale
				lengthscalemod = -100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			200
			50
			0
			200
		]
		angle = 1.5707
		length = 1
		thickness = 10
		angularVel = 0.0
		BlendMode = add
		controls = [
			{
				type = frequency_History
				spectrumBand = 5
				response = deform
				DeformScale = 2000
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = 50
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			0
			50
			200
			155
		]
		angle = 1.5707
		length = -0.6
		thickness = 10
		angularVel = 0.0
		BlendMode = add
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 2500
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
]
OG_Spectrum3D_RoyB = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (-1.01, 1.0)
		offset = (0.0, 0.02)
		Color = [
			254
			254
			254
			255
		]
		angle = 0
		BlendMode = blend
		controls = [
			{
				type = meandbs_history
				spectrumBand = 10
				response = blueModulation
				colorscale = -80
			}
		]
	}
	{
		type = line
		Pos = (0.0, 0.0, 0.0)
		Color = [
			200
			0
			0
			255
		]
		angle = 0
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 50
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = 10
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = lengthScale
				lengthscalemod = -100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			100
			0
			0
			155
		]
		angle = 1.5707
		length = 1
		thickness = 10
		angularVel = 0.0
		BlendMode = add
		controls = [
			{
				type = frequency_History
				spectrumBand = 5
				response = deform
				DeformScale = 2500
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -10
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.35000002, 0.0)
		Color = [
			0
			50
			200
			155
		]
		angle = 1.5707
		length = -0.41
		thickness = 10
		angularVel = 0.0
		BlendMode = add
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 1000
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
]
OG_Spectrum3D_RoyB_A = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (-1.01, 1.0)
		offset = (0.0, 0.02)
		Color = [
			254
			254
			254
			255
		]
		angle = 0
		BlendMode = blend
		controls = [
			{
				type = meandbs_history
				spectrumBand = 10
				response = blueModulation
				colorscale = -80
			}
		]
	}
	{
		type = line
		Pos = (0.0, 0.0, 0.0)
		Color = [
			200
			0
			0
			255
		]
		angle = 0
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 50
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = 10
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = lengthScale
				lengthscalemod = -100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			100
			0
			0
			155
		]
		angle = 1.5707
		length = 1
		thickness = 10
		angularVel = 0.0
		BlendMode = add
		controls = [
			{
				type = frequency_History
				spectrumBand = 5
				response = deform
				DeformScale = 2500
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -10
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.35000002, 0.0)
		Color = [
			0
			50
			200
			155
		]
		angle = 1.5707
		length = -0.41
		thickness = 10
		angularVel = 0.0
		BlendMode = add
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 1000
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
]
OG_Spectrum3D_RoyBFlip_Simple = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (-1.01, 1.05)
		offset = (0.0, 0.0012500001)
		Color = [
			254
			254
			254
			255
		]
		angle = 0
		BlendMode = blend
		controls = [
			{
				type = meandbs_history
				spectrumBand = 10
				response = blueModulation
				colorscale = -80
			}
			{
				type = beatOn
				spectrumBand = 10
				response = alphaModulation
				fade = 0.1
				scaleMod = 1
			}
		]
	}
	{
		type = line
		Pos = (0.05, 0.5, 0.0)
		Color = [
			200
			100
			0
			255
		]
		angle = 1.5707
		length = 0.05
		thickness = 20
		angularVel = 0.0
		BlendMode = add
		controls = [
			{
				type = beatOn
				fade = 0.01
				spectrumBand = 5
				response = blueModulation
				colorscale = 250
			}
			{
				type = beatOn
				fade = 0.01
				spectrumBand = 25
				response = redModulation
				colorscale = 50
			}
			{
				type = frequency
				spectrumBand = 5
				response = lengthScale
				scaleMod = 30
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.85, 0.0)
		Color = [
			100
			0
			0
			155
		]
		angle = 1.5707
		length = 1
		thickness = 10
		angularVel = 0.0
		BlendMode = add
		controls = [
			{
				type = meandbs_history
				spectrumBand = 5
				response = deform
				scaleMod = 600
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -10
			}
		]
	}
	{
		type = line
		Pos = (0.255, 0.95, 0.0)
		Color = [
			0
			50
			200
			195
		]
		angle = 3.1399999
		length = 0.5
		thickness = 10
		angularVel = 0.0
		BlendMode = add
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = -2500
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
]
OG_Spectrum3D_RoyBFlip_H = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (-1.01, -1.05)
		offset = (0.0125, 0.0)
		Color = [
			254
			254
			254
			255
		]
		angle = 0
		BlendMode = blend
		controls = [
			{
				type = meandbs_history
				spectrumBand = 10
				response = blueModulation
				colorscale = -80
			}
		]
	}
	{
		type = line
		Pos = (1.0, 0.0, 0.0)
		Color = [
			200
			0
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 50
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = 10
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = lengthScale
				lengthscalemod = -100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			100
			0
			0
			155
		]
		angle = 0
		length = 1
		thickness = 10
		angularVel = 0.0
		BlendMode = add
		controls = [
			{
				type = meandbs_history
				spectrumBand = 5
				response = deform
				DeformScale = 2500
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		Pos = (0.0, 0.5, 0.0)
		Color = [
			0
			50
			200
			155
		]
		angle = 0
		length = 0.75
		thickness = 10
		angularVel = 0.0
		BlendMode = add
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 2500
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
]
OG_Spectrum3D_RoyBGrid_H = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (1.01, -1.1)
		offset = (0.0125, 0.0)
		Color = [
			254
			254
			254
			255
		]
		angle = 0
		BlendMode = blend
		controls = [
			{
				type = meandbs_history
				spectrumBand = 10
				response = blueModulation
				colorscale = -80
			}
		]
	}
	{
		type = line
		Pos = (0.0, 0.0, 0.0)
		Color = [
			200
			0
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 50
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = 10
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = lengthScale
				lengthscalemod = -100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			100
			0
			0
			155
		]
		angle = 0
		length = 1
		thickness = 10
		angularVel = 0.0
		BlendMode = add
		controls = [
			{
				type = meandbs_history
				spectrumBand = 5
				response = deform
				DeformScale = 500
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		Pos = (0.0, 0.5, 0.0)
		Color = [
			0
			50
			200
			155
		]
		angle = 0
		length = 1
		thickness = 10
		angularVel = 0.0
		BlendMode = add
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 1500
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
]
OG_Spectrum3D_PBJ = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (1.0, -1.0)
		offset = (0.01, 0.0)
		Color = [
			254
			254
			254
			254
		]
		BlendMode = blend
		controls = [
			{
				type = meandbs_history
				spectrumBand = 10
				response = blueModulation
				colorscale = -80
			}
		]
	}
	{
		type = line
		Pos = (0.1, 0.5, 0.0)
		Color = [
			100
			0
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = meandbs_history
				spectrumBand = 5
				response = blueModulation
				colorscale = -100
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
			{
				type = frequency_History
				spectrumBand = 5
				response = lengthScale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		Pos = (0.2, 0.5, 0.0)
		Color = [
			100
			0
			0
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = meandbs_history
				spectrumBand = 10
				response = blueModulation
				colorscale = -80
			}
			{
				type = meandbs_history
				spectrumBand = 10
				response = greenModulation
				colorscale = -90
			}
			{
				type = frequency_History
				spectrumBand = 10
				response = lengthScale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		Pos = (0.3, 0.5, 0.0)
		Color = [
			100
			0
			0
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = meandbs_history
				spectrumBand = 15
				response = blueModulation
				colorscale = -130
			}
			{
				type = meandbs_history
				spectrumBand = 15
				response = greenModulation
				colorscale = -150
			}
			{
				type = frequency_History
				spectrumBand = 15
				response = lengthScale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		Pos = (0.4, 0.5, 0.0)
		Color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = meandbs_history
				spectrumBand = 20
				response = blueModulation
				colorscale = -70
			}
			{
				type = meandbs_history
				spectrumBand = 20
				response = greenModulation
				colorscale = -100
			}
			{
				type = frequency_History
				spectrumBand = 20
				response = lengthScale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = meandbs_history
				spectrumBand = 25
				response = blueModulation
				colorscale = -100
			}
			{
				type = meandbs_history
				spectrumBand = 25
				response = greenModulation
				colorscale = -200
			}
			{
				type = frequency_History
				spectrumBand = 25
				response = lengthScale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		Pos = (0.6, 0.5, 0.0)
		Color = [
			200
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = meandbs_history
				spectrumBand = 30
				response = blueModulation
				colorscale = -200
			}
			{
				type = meandbs_history
				spectrumBand = 30
				response = greenModulation
				colorscale = -100
			}
			{
				type = frequency_History
				spectrumBand = 30
				response = lengthScale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			100
			0
			0
			155
		]
		angle = 0
		length = 1
		thickness = 10
		angularVel = 0.0
		BlendMode = add
		controls = [
			{
				type = meandbs_history
				spectrumBand = 5
				response = deform
				DeformScale = 300
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.25, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularVel = 0.0
	}
	{
		type = line
		Pos = (0.5, 0.35000002, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularVel = 0.0
	}
	{
		type = line
		Pos = (0.5, 0.45000002, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularVel = 0.0
	}
	{
		type = blendPrev
		angularVel = 0.0
		scale = (0.9, 0.9)
		offset = (0.02, 0.0)
		Color = [
			254
			254
			254
			100
		]
		BlendMode = add
	}
	{
		type = blendPrev
		angularVel = 0.1
		scale = (-0.90999997, -1.01)
		offset = (0.0, 0.0)
		Color = [
			254
			254
			254
			120
		]
		BlendMode = sub
		controls = [
			{
				type = beatOn
				spectrumBand = 10
				response = angularVelMod
				velscale = 1000
			}
		]
	}
]
OG_Spectrum3D_GNR = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (1.0, -1.0)
		offset = (0.01, 0.0)
		Color = [
			254
			254
			54
			254
		]
		BlendMode = blend
		controls = [
			{
				type = meandbs_history
				spectrumBand = 10
				response = blueModulation
				colorscale = -80
			}
		]
	}
	{
		type = line
		Pos = (0.1, 0.5, 0.0)
		Color = [
			100
			0
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = meandbs_history
				spectrumBand = 5
				response = blueModulation
				colorscale = -100
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = lengthScale
				lengthscalemod = -10
			}
		]
	}
	{
		type = line
		Pos = (0.2, 0.5, 0.0)
		Color = [
			100
			0
			0
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = meandbs_history
				spectrumBand = 10
				response = blueModulation
				colorscale = -80
			}
			{
				type = meandbs_history
				spectrumBand = 10
				response = greenModulation
				colorscale = -90
			}
			{
				type = meandbs_history
				spectrumBand = 10
				response = lengthScale
				lengthscalemod = -100
			}
		]
	}
	{
		type = line
		Pos = (0.3, 0.5, 0.0)
		Color = [
			100
			0
			0
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = meandbs_history
				spectrumBand = 15
				response = blueModulation
				colorscale = -30
			}
			{
				type = meandbs_history
				spectrumBand = 15
				response = greenModulation
				colorscale = -30
			}
			{
				type = meandbs_history
				spectrumBand = 15
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.4, 0.5, 0.0)
		Color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = meandbs_history
				spectrumBand = 20
				response = blueModulation
				colorscale = -70
			}
			{
				type = meandbs_history
				spectrumBand = 20
				response = greenModulation
				colorscale = -100
			}
			{
				type = meandbs_history
				spectrumBand = 20
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = meandbs_history
				spectrumBand = 25
				response = blueModulation
				colorscale = 100
			}
			{
				type = meandbs_history
				spectrumBand = 25
				response = greenModulation
				colorscale = 100
			}
			{
				type = meandbs_history
				spectrumBand = 25
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.6, 0.5, 0.0)
		Color = [
			200
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = meandbs_history
				spectrumBand = 30
				response = blueModulation
				colorscale = 100
			}
			{
				type = meandbs_history
				spectrumBand = 30
				response = greenModulation
				colorscale = 100
			}
			{
				type = meandbs_history
				spectrumBand = 30
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.1, 0.5, 0.0)
		Color = [
			100
			0
			0
			155
		]
		angle = 0
		length = 1
		thickness = 10
		angularVel = 0.0
		BlendMode = add
		controls = [
			{
				type = meandbs_history
				spectrumBand = 5
				response = deform
				DeformScale = 500
			}
			{
				type = meandbs_history
				spectrumBand = 5
				response = greenModulation
				colorscale = -50
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.25, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularVel = 0.0
	}
	{
		type = line
		Pos = (0.5, 0.35000002, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularVel = 0.0
	}
	{
		type = line
		Pos = (0.5, 0.45000002, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularVel = 0.0
	}
	{
		type = blendPrev
		angularVel = 0.0
		scale = (0.9, 0.9)
		offset = (0.02, 0.0)
		Color = [
			254
			254
			254
			80
		]
		BlendMode = add
	}
	{
		type = blendPrev
		angularVel = 0.1
		scale = (-0.90999997, -1.01)
		offset = (0.0, 0.0)
		Color = [
			254
			254
			254
			120
		]
		BlendMode = sub
		controls = [
			{
				type = beatOn
				spectrumBand = 10
				response = angularVelMod
				velscale = 1000
			}
		]
	}
]
OG_BlueRings = [
	{
		type = blendPrev
		offset = (0.0, 0.005)
		scale = (0.98999995, 0.98999995)
		Color = [
			255
			255
			255
			254
		]
		angle = -0.0
		angularVel = 0.0
		BlendMode = blend
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.01
		Color = [
			90
			0
			0
			50
		]
		thickness = 5
		angularVel = 0.0
		controls = [
			{
				type = noteHit
				player = 1
				gemColor = red
				response = blueModulation
				colorscale = 160
			}
			{
				type = noteHit
				player = 1
				gemColor = red
				response = redModulation
				colorscale = 180
			}
			{
				type = noteHit
				player = 1
				gemColor = red
				spectrumBand = 30
				response = greenModulation
				colorscale = 200
			}
			{
				type = noteHit
				player = 1
				gemColor = red
				response = radiusScale
				responseFunc = sinLog10
				radiusscalemod = 0.05
				spectrumBand = 30
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.75, 0.0)
		length = 0.001
		Color = [
			190
			50
			0
			255
		]
		thickness = 8.0
		angularVel = 0.0
		angle = 1.5707
		controls = [
			{
				type = noteHit
				player = 1
				gemColor = red
				response = blueModulation
				colorscale = 200
			}
			{
				type = noteHit
				player = 1
				gemColor = red
				response = greenModulation
				colorscale = 100
			}
			{
				type = noteHit
				player = 1
				gemColor = red
				response = lengthScale
				lengthscalemod = 10
			}
			{
				type = frequency
				spectrumBand = 10
				response = lengthScale
				lengthscalemod = 1
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.32500002, 0.0)
		radius = 0.015
		Color = [
			90
			0
			0
			1
		]
		thickness = 5
		angularVel = 0.0
		controls = [
			{
				type = noteHit
				player = 1
				gemColor = yellow
				response = blueModulation
				colorscale = 160
			}
			{
				type = noteHit
				player = 1
				gemColor = yellow
				response = redModulation
				colorscale = 180
			}
			{
				type = noteHit
				player = 1
				gemColor = yellow
				spectrumBand = 30
				response = greenModulation
				colorscale = 200
			}
			{
				type = noteHit
				player = 1
				gemColor = yellow
				response = radiusScale
				responseFunc = sinLog10
				radiusscalemod = 0.05
				spectrumBand = 30
			}
			{
				type = frequency
				spectrumBand = 10
				response = alphaModulation
				colorscale = 255
			}
		]
	}
	{
		type = line
		Pos = (0.3, 0.76, 0.0)
		length = 0.001
		Color = [
			190
			50
			0
			255
		]
		thickness = 8.0
		angularVel = 0.0
		angle = 1.5707
		controls = [
			{
				type = noteHit
				player = 1
				gemColor = yellow
				response = blueModulation
				colorscale = 200
			}
			{
				type = noteHit
				player = 1
				gemColor = yellow
				response = greenModulation
				colorscale = 100
			}
			{
				type = noteHit
				player = 1
				gemColor = yellow
				response = lengthScale
				lengthscalemod = 10
			}
			{
				type = frequency
				spectrumBand = 20
				response = lengthScale
				lengthscalemod = 1
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.25, 0.0)
		radius = 0.02
		Color = [
			190
			0
			0
			0
		]
		thickness = 3
		angularVel = 0.0
		controls = [
			{
				type = noteHit
				player = 1
				gemColor = blue
				response = blueModulation
				colorscale = 160
			}
			{
				type = noteHit
				player = 1
				gemColor = blue
				response = redModulation
				colorscale = 180
			}
			{
				type = noteHit
				player = 1
				gemColor = blue
				spectrumBand = 30
				response = greenModulation
				colorscale = 200
			}
			{
				type = noteHit
				player = 1
				gemColor = blue
				response = radiusScale
				responseFunc = sinLog10
				radiusscalemod = 0.05
				spectrumBand = 30
			}
			{
				type = frequency
				spectrumBand = 10
				response = alphaModulation
				colorscale = 160
			}
		]
	}
	{
		type = line
		Pos = (0.3, 0.77, 0.0)
		length = 0.001
		Color = [
			190
			50
			0
			255
		]
		thickness = 8.0
		angularVel = 0.0
		angle = 1.5707
		controls = [
			{
				type = noteHit
				player = 1
				gemColor = yellow
				response = blueModulation
				colorscale = 200
			}
			{
				type = noteHit
				player = 1
				gemColor = blue
				response = greenModulation
				colorscale = 100
			}
			{
				type = noteHit
				player = 1
				gemColor = blue
				response = lengthScale
				lengthscalemod = 10
			}
			{
				type = frequency
				spectrumBand = 20
				response = lengthScale
				lengthscalemod = 1
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.32500002, 0.0)
		radius = 0.025
		Color = [
			190
			0
			0
			0
		]
		thickness = 3
		angularVel = 0.0
		controls = [
			{
				type = noteHit
				player = 1
				gemColor = orange
				response = blueModulation
				colorscale = 160
			}
			{
				type = noteHit
				player = 1
				gemColor = orange
				response = redModulation
				colorscale = 180
			}
			{
				type = noteHit
				player = 1
				gemColor = orange
				spectrumBand = 30
				response = greenModulation
				colorscale = 200
			}
			{
				type = noteHit
				player = 1
				gemColor = orange
				response = radiusScale
				responseFunc = sinLog10
				radiusscalemod = 0.01
				spectrumBand = 30
			}
			{
				type = frequency
				spectrumBand = 30
				response = alphaModulation
				colorscale = 160
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.03
		Color = [
			190
			0
			0
			0
		]
		thickness = 3
		angularVel = 0.0
		controls = [
			{
				type = noteHit
				player = 1
				gemColor = green
				response = blueModulation
				colorscale = 160
			}
			{
				type = noteHit
				player = 1
				gemColor = green
				response = redModulation
				colorscale = 180
			}
			{
				type = noteHit
				player = 1
				gemColor = green
				spectrumBand = 30
				response = greenModulation
				colorscale = 200
			}
			{
				type = noteHit
				player = 1
				gemColor = green
				response = radiusScale
				responseFunc = sinLog10
				radiusscalemod = 0.01
				spectrumBand = 30
			}
			{
				type = frequency
				spectrumBand = 30
				response = alphaModulation
				colorscale = 160
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularVel = 0.0
		angle = 1.5707
		controls = [
			{
				type = noteHit
				player = 1
				gemColor = green
				response = blueModulation
				colorscale = 200
			}
			{
				type = noteHit
				player = 1
				gemColor = green
				response = greenModulation
				colorscale = 100
			}
			{
				type = noteHit
				player = 1
				gemColor = green
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.35000002, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularVel = 0.0
		angle = 0
		controls = [
			{
				type = noteHit
				player = 1
				gemColor = red
				response = blueModulation
				colorscale = 200
			}
			{
				type = noteHit
				player = 1
				gemColor = red
				response = greenModulation
				colorscale = 100
			}
			{
				type = noteHit
				player = 1
				gemColor = red
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.45000002, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularVel = 0.0
		angle = 0
		controls = [
			{
				type = noteHit
				player = 1
				gemColor = blue
				response = blueModulation
				colorscale = 200
			}
			{
				type = noteHit
				player = 1
				gemColor = blue
				response = greenModulation
				colorscale = 100
			}
			{
				type = noteHit
				player = 1
				gemColor = blue
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.55, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularVel = 0.0
		angle = 0
		controls = [
			{
				type = noteHit
				player = 1
				gemColor = orange
				response = blueModulation
				colorscale = 200
			}
			{
				type = noteHit
				player = 1
				gemColor = orange
				response = greenModulation
				colorscale = 100
			}
			{
				type = noteHit
				player = 1
				gemColor = orange
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.65000004, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularVel = 0.0
		angle = 0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 42
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.75, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularVel = 0.0
		angle = 0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 49
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (1.0, 0.9)
		Color = [
			255
			255
			255
			10
		]
		angle = 0.0
		angularVel = 1
		BlendMode = add
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (2.0, 2.0)
		Color = [
			255
			51
			53
			5
		]
		angle = 0
		angularVel = 1.1
		BlendMode = subtract
	}
]
OG_SinglePlayerCirclesArcSpiral = [
	{
		type = blendPrev
		offset = (0.0, 0.005)
		scale = (0.98999995, 0.98999995)
		Color = [
			255
			255
			255
			254
		]
		angle = -0.0
		angularVel = 0.0
		BlendMode = blend
	}
	{
		type = circle
		Pos = (0.1, 0.5, 0.0)
		radius = 0.016499998
		Color = [
			90
			0
			0
			50
		]
		thickness = 5
		angularVel = 0.0
		controls = [
			{
				type = noteHit
				player = 1
				gemColor = red
				response = blueModulation
				colorscale = 160
			}
			{
				type = noteHit
				player = 1
				gemColor = red
				response = redModulation
				colorscale = 180
			}
			{
				type = noteHit
				player = 1
				gemColor = red
				spectrumBand = 30
				response = greenModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 30
				response = alphaModulation
				colorscale = 160
			}
			{
				type = noteHit
				player = 1
				gemColor = red
				response = radiusScale
				responseFunc = sinLog10
				radiusscalemod = 1
				spectrumBand = 30
			}
		]
	}
	{
		type = line
		Pos = (0.1, 0.5, 0.0)
		length = 0.001
		Color = [
			190
			50
			0
			255
		]
		thickness = 8.0
		angularVel = 0.0
		angle = 1.5707
		controls = [
			{
				type = noteHit
				player = 1
				gemColor = red
				response = blueModulation
				colorscale = 200
			}
			{
				type = noteHit
				player = 1
				gemColor = red
				response = greenModulation
				colorscale = 100
			}
			{
				type = noteHit
				player = 1
				gemColor = red
				response = lengthScale
				lengthscalemod = 10
			}
			{
				type = frequency
				spectrumBand = 10
				response = lengthScale
				lengthscalemod = 1
			}
		]
	}
	{
		type = circle
		Pos = (0.3, 0.32500002, 0.0)
		radius = 0.016499998
		Color = [
			90
			0
			0
			1
		]
		thickness = 5
		angularVel = 0.0
		controls = [
			{
				type = noteHit
				player = 1
				gemColor = yellow
				response = blueModulation
				colorscale = 160
			}
			{
				type = noteHit
				player = 1
				gemColor = yellow
				response = redModulation
				colorscale = 180
			}
			{
				type = noteHit
				player = 1
				gemColor = yellow
				spectrumBand = 30
				response = greenModulation
				colorscale = 200
			}
			{
				type = noteHit
				player = 1
				gemColor = yellow
				response = radiusScale
				responseFunc = sinLog10
				radiusscalemod = 0.05
				spectrumBand = 30
			}
			{
				type = frequency
				spectrumBand = 10
				response = alphaModulation
				colorscale = 255
			}
		]
	}
	{
		type = line
		Pos = (0.3, 0.32500002, 0.0)
		length = 0.001
		Color = [
			190
			50
			0
			255
		]
		thickness = 8.0
		angularVel = 0.0
		angle = 1.5707
		controls = [
			{
				type = noteHit
				player = 1
				gemColor = yellow
				response = blueModulation
				colorscale = 200
			}
			{
				type = noteHit
				player = 1
				gemColor = yellow
				response = greenModulation
				colorscale = 100
			}
			{
				type = noteHit
				player = 1
				gemColor = yellow
				response = lengthScale
				lengthscalemod = 10
			}
			{
				type = frequency
				spectrumBand = 20
				response = lengthScale
				lengthscalemod = 1
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.25, 0.0)
		radius = 0.016499998
		Color = [
			90
			0
			0
			250
		]
		thickness = 5
		angularVel = 0.0
		controls = [
			{
				type = noteHit
				player = 1
				gemColor = blue
				response = blueModulation
				colorscale = 160
			}
			{
				type = noteHit
				player = 1
				gemColor = blue
				response = redModulation
				colorscale = 180
			}
			{
				type = noteHit
				player = 1
				gemColor = blue
				spectrumBand = 30
				response = greenModulation
				colorscale = 200
			}
			{
				type = noteHit
				player = 1
				gemColor = blue
				response = radiusScale
				responseFunc = sinLog10
				radiusscalemod = 0.05
				spectrumBand = 30
			}
		]
	}
	{
		type = circle
		Pos = (0.7, 0.32500002, 0.0)
		radius = 0.016499998
		Color = [
			90
			0
			0
			250
		]
		thickness = 5
		angularVel = 0.0
		controls = [
			{
				type = noteHit
				player = 1
				gemColor = orange
				response = blueModulation
				colorscale = 160
			}
			{
				type = noteHit
				player = 1
				gemColor = orange
				response = redModulation
				colorscale = 180
			}
			{
				type = noteHit
				player = 1
				gemColor = orange
				spectrumBand = 30
				response = greenModulation
				colorscale = 200
			}
			{
				type = noteHit
				player = 1
				gemColor = orange
				response = radiusScale
				responseFunc = sinLog10
				radiusscalemod = 0.01
				spectrumBand = 30
			}
		]
	}
	{
		type = circle
		Pos = (0.9, 0.5, 0.0)
		radius = 0.016499998
		Color = [
			90
			0
			0
			250
		]
		thickness = 5
		angularVel = 0.0
		controls = [
			{
				type = noteHit
				player = 1
				gemColor = green
				response = blueModulation
				colorscale = 160
			}
			{
				type = noteHit
				player = 1
				gemColor = ogreen
				response = redModulation
				colorscale = 280
			}
			{
				type = noteHit
				player = 1
				gemColor = green
				spectrumBand = 30
				response = greenModulation
				colorscale = 200
			}
			{
				type = noteHit
				player = 1
				gemColor = green
				response = radiusScale
				responseFunc = sinLog10
				radiusscalemod = 1
				spectrumBand = 30
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularVel = 0.0
		angle = 1.5707
		controls = [
			{
				type = noteHit
				player = 1
				gemColor = green
				response = blueModulation
				colorscale = 200
			}
			{
				type = noteHit
				player = 1
				gemColor = green
				response = greenModulation
				colorscale = 100
			}
			{
				type = noteHit
				player = 1
				gemColor = green
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.35000002, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularVel = 0.0
		angle = 0
		controls = [
			{
				type = noteHit
				player = 1
				gemColor = red
				response = blueModulation
				colorscale = 200
			}
			{
				type = noteHit
				player = 1
				gemColor = red
				response = greenModulation
				colorscale = 100
			}
			{
				type = noteHit
				player = 1
				gemColor = red
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.45000002, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularVel = 0.0
		angle = 0
		controls = [
			{
				type = noteHit
				player = 1
				gemColor = blue
				response = blueModulation
				colorscale = 200
			}
			{
				type = noteHit
				player = 1
				gemColor = blue
				response = greenModulation
				colorscale = 100
			}
			{
				type = noteHit
				player = 1
				gemColor = blue
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.55, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularVel = 0.0
		angle = 0
		controls = [
			{
				type = noteHit
				player = 1
				gemColor = orange
				response = blueModulation
				colorscale = 200
			}
			{
				type = noteHit
				player = 1
				gemColor = orange
				response = greenModulation
				colorscale = 100
			}
			{
				type = noteHit
				player = 1
				gemColor = orange
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.65000004, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularVel = 0.0
		angle = 0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 42
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.75, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularVel = 0.0
		angle = 0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 49
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.85, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularVel = 0.0
		angle = 0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 56
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (1.0, 0.9)
		Color = [
			255
			255
			255
			10
		]
		angle = 0.0
		angularVel = 1
		BlendMode = add
	}
]
OG_SinglePlayerCircles = [
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (0.98999995, 0.98999995)
		Color = [
			255
			255
			255
			254
		]
		angle = -0.0
		angularVel = 0.0
		BlendMode = blend
	}
	{
		type = circle
		Pos = (0.1, 0.5, 0.0)
		radius = 0.016499998
		Color = [
			90
			0
			0
			50
		]
		thickness = 5
		angularVel = 0.0
		controls = [
			{
				type = noteHit
				player = 1
				gemColor = red
				response = blueModulation
				colorscale = 160
			}
			{
				type = noteHit
				player = 1
				gemColor = red
				response = redModulation
				colorscale = 180
			}
			{
				type = noteHit
				player = 1
				gemColor = red
				spectrumBand = 30
				response = greenModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 30
				response = alphaModulation
				colorscale = 160
			}
			{
				type = noteHit
				player = 1
				gemColor = red
				response = radiusScale
				responseFunc = sinLog10
				radiusscalemod = 0.01
				spectrumBand = 30
			}
			{
				type = maxdbs
				response = radiusScale
				responseFunc = sinLog10
				radiusscalemod = 0.1
				spectrumBand = 30
			}
		]
	}
	{
		type = line
		Pos = (0.1, 0.5, 0.0)
		length = 0.001
		Color = [
			190
			50
			0
			255
		]
		thickness = 8.0
		angularVel = 0.0
		angle = 1.5707
		controls = [
			{
				type = noteHit
				player = 1
				gemColor = red
				response = blueModulation
				colorscale = 200
			}
			{
				type = noteHit
				player = 1
				gemColor = red
				response = greenModulation
				colorscale = 100
			}
			{
				type = noteHit
				player = 1
				gemColor = red
				response = lengthScale
				lengthscalemod = 10
			}
			{
				type = frequency
				spectrumBand = 10
				response = lengthScale
				lengthscalemod = 1
			}
		]
	}
	{
		type = circle
		Pos = (0.3, 0.32500002, 0.0)
		radius = 0.016499998
		Color = [
			90
			0
			0
			1
		]
		thickness = 5
		angularVel = 0.0
		controls = [
			{
				type = noteHit
				player = 1
				gemColor = yellow
				response = blueModulation
				colorscale = 160
			}
			{
				type = noteHit
				player = 1
				gemColor = yellow
				response = redModulation
				colorscale = 180
			}
			{
				type = noteHit
				player = 1
				gemColor = yellow
				spectrumBand = 30
				response = greenModulation
				colorscale = 200
			}
			{
				type = noteHit
				player = 1
				gemColor = yellow
				response = radiusScale
				responseFunc = sinLog10
				radiusscalemod = 0.01
				spectrumBand = 30
			}
			{
				type = frequency
				spectrumBand = 10
				response = alphaModulation
				colorscale = 255
			}
		]
	}
	{
		type = line
		Pos = (0.3, 0.32500002, 0.0)
		length = 0.001
		Color = [
			190
			50
			0
			255
		]
		thickness = 8.0
		angularVel = 0.0
		angle = 1.5707
		controls = [
			{
				type = noteHit
				player = 1
				gemColor = yellow
				response = blueModulation
				colorscale = 200
			}
			{
				type = noteHit
				player = 1
				gemColor = yellow
				response = greenModulation
				colorscale = 100
			}
			{
				type = noteHit
				player = 1
				gemColor = yellow
				response = lengthScale
				lengthscalemod = 10
			}
			{
				type = frequency
				spectrumBand = 20
				response = lengthScale
				lengthscalemod = 1
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.25, 0.0)
		radius = 0.016499998
		Color = [
			90
			0
			0
			250
		]
		thickness = 5
		angularVel = 0.0
		controls = [
			{
				type = noteHit
				player = 1
				gemColor = blue
				response = blueModulation
				colorscale = 160
			}
			{
				type = noteHit
				player = 1
				gemColor = blue
				response = redModulation
				colorscale = 180
			}
			{
				type = noteHit
				player = 1
				gemColor = blue
				spectrumBand = 30
				response = greenModulation
				colorscale = 200
			}
			{
				type = noteHit
				player = 1
				gemColor = blue
				response = radiusScale
				responseFunc = sinLog10
				radiusscalemod = 0.01
				spectrumBand = 30
			}
		]
	}
	{
		type = circle
		Pos = (0.7, 0.32500002, 0.0)
		radius = 0.016499998
		Color = [
			90
			0
			0
			250
		]
		thickness = 5
		angularVel = 0.0
		controls = [
			{
				type = noteHit
				player = 1
				gemColor = orange
				response = blueModulation
				colorscale = 160
			}
			{
				type = noteHit
				player = 1
				gemColor = orange
				response = redModulation
				colorscale = 180
			}
			{
				type = noteHit
				player = 1
				gemColor = orange
				spectrumBand = 30
				response = greenModulation
				colorscale = 200
			}
			{
				type = noteHit
				player = 1
				gemColor = orange
				response = radiusScale
				responseFunc = sinLog10
				radiusscalemod = 0.01
				spectrumBand = 30
			}
		]
	}
	{
		type = circle
		Pos = (0.9, 0.5, 0.0)
		radius = 0.016499998
		Color = [
			90
			0
			0
			250
		]
		thickness = 5
		angularVel = 0.0
		controls = [
			{
				type = noteHit
				player = 1
				gemColor = green
				response = blueModulation
				colorscale = 160
			}
			{
				type = noteHit
				player = 1
				gemColor = ogreen
				response = redModulation
				colorscale = 180
			}
			{
				type = noteHit
				player = 1
				gemColor = green
				spectrumBand = 30
				response = greenModulation
				colorscale = 200
			}
			{
				type = noteHit
				player = 1
				gemColor = green
				response = radiusScale
				responseFunc = sinLog10
				radiusscalemod = 1
				spectrumBand = 30
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularVel = 0.0
		angle = 1.5707
		controls = [
			{
				type = noteHit
				player = 1
				gemColor = green
				response = blueModulation
				colorscale = 200
			}
			{
				type = noteHit
				player = 1
				gemColor = green
				response = greenModulation
				colorscale = 100
			}
			{
				type = noteHit
				player = 1
				gemColor = green
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.35000002, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularVel = 0.0
		angle = 0
		controls = [
			{
				type = noteHit
				player = 1
				gemColor = red
				response = blueModulation
				colorscale = 200
			}
			{
				type = noteHit
				player = 1
				gemColor = red
				response = greenModulation
				colorscale = 100
			}
			{
				type = noteHit
				player = 1
				gemColor = red
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.45000002, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularVel = 0.0
		angle = 0
		controls = [
			{
				type = noteHit
				player = 1
				gemColor = blue
				response = blueModulation
				colorscale = 200
			}
			{
				type = noteHit
				player = 1
				gemColor = blue
				response = greenModulation
				colorscale = 100
			}
			{
				type = noteHit
				player = 1
				gemColor = blue
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.55, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularVel = 0.0
		angle = 0
		controls = [
			{
				type = noteHit
				player = 1
				gemColor = orange
				response = blueModulation
				colorscale = 200
			}
			{
				type = noteHit
				player = 1
				gemColor = orange
				response = greenModulation
				colorscale = 100
			}
			{
				type = noteHit
				player = 1
				gemColor = orange
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.65000004, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularVel = 0.0
		angle = 0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 42
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.75, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularVel = 0.0
		angle = 0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 49
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.85, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularVel = 0.0
		angle = 0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 56
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (0.99899995, -4.991)
		Color = [
			255
			255
			255
			4
		]
		angle = 0.0
		angularVel = 0.0
		BlendMode = add
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (2.0, 2.0)
		Color = [
			255
			51
			53
			10
		]
		angle = 1.575
		angularVel = -1
		BlendMode = subtract
	}
]
OG_PurpleStar = [
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (1.0, 1.0)
		Color = [
			218
			202
			205
			254
		]
		angle = 1.26
		angularVel = 0.0
		BlendMode = blend
	}
	{
		type = line
		Pos = (0.35000002, 0.5, 0.0)
		length = 0.1
		Color = [
			200
			0
			200
			255
		]
		thickness = 10.0
		angularVel = 0.0
		angle = -1.26
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = redModulation
				colorscale = 250
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 63
				response = lengthScale
				lengthscalemod = 250
			}
		]
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (5.0, 5.0)
		Color = [
			0
			0
			0
			0
		]
		angle = 0.0
		angularVel = 0.0
		BlendMode = add
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = redModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 150
			}
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 250
			}
			{
				type = frequency
				spectrumBand = 10
				response = alphaModulation
				colorscale = 45
			}
		]
	}
]
OG_BlueLines = [
	{
		type = blendPrev
		offset = (0.0, 0.01)
		scale = (0.98999995, 0.98999995)
		Color = [
			218
			202
			205
			254
		]
		angle = 0.015
		angularVel = 0.0
		BlendMode = blend
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = redModulation
				colorscale = 250
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.15, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularVel = 0.0
		angle = 0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 63
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.25, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularVel = 0.0
		angle = 0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 56
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.35000002, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularVel = 0.0
		angle = 0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 49
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.45000002, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularVel = 0.0
		angle = 0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 42
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.55, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularVel = 0.0
		angle = 0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 35
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.65000004, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularVel = 0.0
		angle = 0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 28
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.75, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularVel = 0.0
		angle = 0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 21
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.85, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularVel = 0.0
		angle = 0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 14
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.95, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularVel = 0.0
		angle = 0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 7
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (1.0099, -0.99099994)
		Color = [
			255
			255
			255
			7
		]
		angle = -0.01
		angularVel = 0.0
		BlendMode = add
	}
]
OG_Energina = [
	{
		type = blendPrev
		offset = (0.0, -0.0)
		scale = (-0.99149996, -1.1915001)
		Color = [
			218
			202
			205
			254
		]
		angle = -1.8
		angularVel = 0.0
		BlendMode = blend
		nonUniformScale
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = redModulation
				colorscale = 250
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 1.0
		Color = [
			255
			255
			255
			255
		]
		thickness = 1.0
		angle = 1.5707
		angularVel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 24.5
				responseFunc = sinLog10
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularVel = 0.0
		angle = 1.5707
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 10
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (0.98999995, 1.1)
		Color = [
			255
			255
			255
			29
		]
		angle = 0.01
		angularVel = 0.0
		BlendMode = add
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (2.0, 2.0)
		Color = [
			55
			251
			253
			38
		]
		angle = 0.01
		angularVel = -0.23
		BlendMode = subtract
	}
]
OG_BlueWavesStrobe = [
	{
		type = blendPrev
		offset = (0.0, -0.0)
		scale = (-0.99149996, -1.1915001)
		Color = [
			218
			202
			205
			254
		]
		angle = -1.8
		angularVel = 0.0
		BlendMode = blend
		nonUniformScale
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = redModulation
				colorscale = 250
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 1.0
		Color = [
			255
			255
			255
			255
		]
		thickness = 1.0
		angle = 0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 24.5
				responseFunc = sinLog10
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularVel = 0.0
		angle = 1.5707
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 10
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (0.98999995, 1.1)
		Color = [
			255
			255
			255
			29
		]
		angle = 0.01
		angularVel = 0.0
		BlendMode = add
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (2.0, 2.0)
		Color = [
			55
			251
			253
			38
		]
		angularVel = -0.23
		BlendMode = subtract
	}
]
OG_WavesRotating = [
	{
		type = blendPrev
		offset = (0.0, -0.0)
		scale = (-0.99149996, -1.1915001)
		Color = [
			218
			202
			205
			254
		]
		angle = 4.925
		angularVel = 0.01
		BlendMode = blend
		nonUniformScale
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = redModulation
				colorscale = 250
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 1.0
		Color = [
			255
			255
			255
			255
		]
		thickness = 1.0
		angle = 0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 24.5
				responseFunc = sinLog10
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularVel = 0.0
		angle = 1.5707
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 10
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (0.98999995, 1.1)
		Color = [
			255
			255
			255
			29
		]
		angle = 0.01
		angularVel = 0.0
		BlendMode = add
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (2.0, 2.0)
		Color = [
			55
			251
			253
			38
		]
		angularVel = -0.23
		BlendMode = subtract
	}
]
OG_RedWavesIn = [
	{
		type = blendPrev
		offset = (0.0, -0.0)
		scale = (-0.99149996, -1.1915001)
		Color = [
			218
			202
			205
			254
		]
		angle = 4.925
		angularVel = 0.0
		BlendMode = blend
		nonUniformScale
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = redModulation
				colorscale = 250
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 1.0
		Color = [
			255
			255
			255
			255
		]
		thickness = 1.0
		angle = 0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 24.5
				responseFunc = sinLog10
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularVel = 0.0
		angle = 1.5707
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 10
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (0.98999995, 1.1)
		Color = [
			255
			255
			255
			29
		]
		angle = 0.01
		angularVel = 0.0
		BlendMode = add
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (2.0, 2.0)
		Color = [
			55
			251
			253
			38
		]
		angularVel = -0.23
		BlendMode = subtract
	}
]
OG_RedWaves = [
	{
		type = blendPrev
		offset = (0.0, -0.0)
		scale = (-1.15, -1.1915001)
		Color = [
			218
			202
			205
			254
		]
		angle = 4.925
		angularVel = 0.0
		BlendMode = blend
		nonUniformScale
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = redModulation
				colorscale = 250
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 1.0
		Color = [
			255
			255
			255
			255
		]
		thickness = 1.0
		angle = 0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 24.5
				responseFunc = sinLog10
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularVel = 0.0
		angle = 1.5707
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 10
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (0.98999995, 1.1)
		Color = [
			255
			255
			255
			29
		]
		angle = 0.01
		angularVel = 0.0
		BlendMode = add
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (2.0, 2.0)
		Color = [
			55
			251
			253
			38
		]
		angularVel = -0.23
		BlendMode = subtract
	}
]
OG_VerticalBandsSpectrum = [
	{
		type = blendPrev
		offset = (0.0, -0.0)
		scale = (-1.15, -1.1915001)
		Color = [
			218
			202
			205
			254
		]
		angle = 4.925
		angularVel = 0.0
		BlendMode = blend
		nonUniformScale
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = redModulation
				colorscale = 250
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 1.0
		Color = [
			255
			255
			255
			255
		]
		thickness = 1.0
		angle = 0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 24.5
				responseFunc = sinLog10
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularVel = 0.0
		angle = 1.5707
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 10
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (0.98999995, 1.1)
		Color = [
			255
			255
			255
			29
		]
		angle = 0.01
		angularVel = 0.0
		BlendMode = add
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (2.0, 2.0)
		Color = [
			255
			51
			63
			38
		]
		angularVel = -0.23
		BlendMode = subtract
	}
]
OG_VerticalBandsBlue = [
	{
		type = blendPrev
		offset = (0.0, -0.0)
		scale = (-1.15, -1.1915001)
		Color = [
			218
			202
			205
			254
		]
		angle = 4.925
		angularVel = 0.0
		BlendMode = blend
		nonUniformScale
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = redModulation
				colorscale = 250
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 1.0
		Color = [
			255
			255
			255
			255
		]
		thickness = 1.0
		angle = 1.5707
		angularVel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 24.5
				responseFunc = sinLog10
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 10
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (0.98999995, 1.1)
		Color = [
			255
			255
			255
			29
		]
		angle = 0.01
		angularVel = 0.0
		BlendMode = add
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (2.0, 2.0)
		Color = [
			255
			51
			63
			38
		]
		angularVel = -0.23
		BlendMode = subtract
	}
]
OG_ColorWave = [
	{
		type = blendPrev
		offset = (0.0, -0.0)
		scale = (-1.15, -1.1915001)
		Color = [
			218
			202
			205
			254
		]
		angle = 4.925
		angularVel = 0.0
		BlendMode = blend
		nonUniformScale
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = redModulation
				colorscale = 250
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 1.0
		Color = [
			255
			255
			255
			255
		]
		thickness = 1.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 24.5
				responseFunc = sinLog10
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 10
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (0.98999995, 1.0)
		Color = [
			255
			255
			255
			25
		]
		angularVel = 0.0
		BlendMode = add
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (1.0, 1.0)
		Color = [
			255
			51
			63
			38
		]
		angularVel = 0.5
		BlendMode = subtract
	}
]
OG_BlueWaves = [
	{
		type = blendPrev
		offset = (0.0, -0.0)
		scale = (-1.15, -1.1915001)
		Color = [
			218
			252
			255
			254
		]
		angle = 4.8925004
		angularVel = 0.0
		BlendMode = blend
		nonUniformScale
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 1.0
		Color = [
			255
			255
			255
			255
		]
		thickness = 1.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 24.5
				responseFunc = sinLog10
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 10
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (0.98999995, 1.0)
		Color = [
			255
			255
			255
			25
		]
		angularVel = 0.0
		BlendMode = add
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (1.0, 1.0)
		Color = [
			255
			51
			63
			38
		]
		angularVel = 0.5
		BlendMode = subtract
	}
]
OG_BlueTapestry = [
	{
		type = blendPrev
		offset = (0.0, -0.0)
		scale = (1.15, -1.1915001)
		Color = [
			218
			252
			255
			254
		]
		angle = 4.925
		angularVel = 0.0
		BlendMode = blend
		nonUniformScale
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 1.0
		Color = [
			255
			255
			255
			255
		]
		thickness = 1.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 24.5
				responseFunc = sinLog10
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 10
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.0025000002
		Color = [
			0
			1
			1
			85
		]
		thickness = 3.0
		controls = [
			{
				type = frequency
				response = radiusScale
				responseFunc = sinLog10
				radiusscalemod = 0.09
				spectrumBand = 20
			}
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 25
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 50
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.005
		Color = [
			0
			2
			2
			85
		]
		thickness = 2.0
		controls = [
			{
				type = frequency
				response = radiusScale
				responseFunc = sinLog10
				radiusscalemod = 0.09
				spectrumBand = 30
			}
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 50
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 100
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.0125
		Color = [
			0
			3
			3
			85
		]
		thickness = 4.0
		controls = [
			{
				type = frequency
				response = radiusScale
				responseFunc = sinLog10
				radiusscalemod = 0.09
				spectrumBand = 40
			}
			{
				type = frequency
				spectrumBand = 10
				response = redModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 300
			}
		]
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (0.98999995, 1.0)
		Color = [
			255
			255
			255
			25
		]
		angularVel = 0.0
		BlendMode = add
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (1.0, 1.0)
		Color = [
			255
			51
			63
			38
		]
		angularVel = 0.5
		BlendMode = subtract
	}
]
OG_BlueElectric = [
	{
		type = blendPrev
		offset = (0.0, 0.02)
		scale = (1.015, -1.01)
		Color = [
			218
			252
			255
			254
		]
		angularVel = 0.0
		angle = 0.0
		BlendMode = blend
		nonUniformScale
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 1.0
		Color = [
			255
			255
			255
			255
		]
		thickness = 3.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 24.5
				responseFunc = sinLog10
			}
		]
	}
	{
		type = line
		Pos = (0.0, 0.5, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		angle = 1.5707
		thickness = 10.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 30
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 30
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 30
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.3, 0.5, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		angle = 1.5707
		thickness = 10.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 30
				response = redModulation
				colorscale = 300
			}
			{
				type = frequency
				spectrumBand = 30
				response = blueModulation
				colorscale = 500
			}
			{
				type = frequency
				spectrumBand = 30
				response = greenModulation
				colorscale = 400
			}
			{
				type = frequency
				spectrumBand = 30
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.7, 0.5, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		angle = 1.5707
		thickness = 10.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 30
				response = redModulation
				colorscale = 300
			}
			{
				type = frequency
				spectrumBand = 30
				response = blueModulation
				colorscale = 500
			}
			{
				type = frequency
				spectrumBand = 30
				response = greenModulation
				colorscale = 400
			}
			{
				type = frequency
				spectrumBand = 30
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (1.0, 0.5, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		angle = 1.5707
		thickness = 10.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 20
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (0.98999995, 1.1)
		Color = [
			255
			255
			255
			25
		]
		angle = 0.0
		angularVel = 0.1
		BlendMode = add
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (1.0, 1.0)
		Color = [
			255
			51
			63
			38
		]
		angularVel = 0.5
		BlendMode = subtract
	}
]
OG_LatticeDiagonal = [
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (1.01, 1.01)
		Color = [
			238
			232
			245
			255
		]
		angle = 0.05
		angularVel = 0.0
		BlendMode = blend
		nonUniformScale
		controls = [
			{
				type = frequency
				spectrumBand = 30
				response = redModulation
				colorscale = 100
			}
		]
	}
	{
		type = line
		Pos = (0.25, 0.5, 0.0)
		length = 2.0
		Color = [
			255
			255
			255
			255
		]
		thickness = 3.0
		angle = 0.5707
		angularVel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 24.5
				responseFunc = sinLog10
			}
		]
	}
	{
		type = line
		Pos = (0.75, 0.5, 0.0)
		length = 2.0
		Color = [
			255
			255
			255
			255
		]
		thickness = 3.0
		angle = 0.5707
		angularVel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 24.5
				responseFunc = sinLog10
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.1, 0.0)
		length = 0.01
		Color = [
			50
			50
			50
			255
		]
		angle = 0
		thickness = 10.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 30
				response = redModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 30
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 30
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 30
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.3, 0.0)
		length = 0.01
		Color = [
			100
			80
			20
			255
		]
		angle = 0
		thickness = 10.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 20
				response = redModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.7, 0.0)
		length = 0.01
		Color = [
			100
			80
			20
			255
		]
		angle = 0
		thickness = 10.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 20
				response = redModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.9, 0.0)
		length = 0.01
		Color = [
			100
			80
			20
			255
		]
		angle = 0
		thickness = 10.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 20
				response = redModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
]
OG_Hyper = [
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (1.0, 1.0)
		Color = [
			228
			222
			235
			254
		]
		angularVel = 0.01
		BlendMode = blend
		nonUniformScale
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 1.0
		Color = [
			255
			255
			255
			255
		]
		thickness = 3.0
		angle = 1.5707
		angularVel = 0.1
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 24.5
				responseFunc = sinLog10
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.1, 0.0)
		length = 0.01
		Color = [
			50
			50
			50
			255
		]
		angle = 0
		thickness = 10.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 30
				response = redModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 30
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 30
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 30
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.3, 0.0)
		length = 0.01
		Color = [
			100
			80
			20
			255
		]
		angle = 0
		thickness = 10.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 20
				response = redModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.7, 0.0)
		length = 0.01
		Color = [
			100
			80
			20
			255
		]
		angle = 0
		thickness = 10.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 20
				response = redModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.9, 0.0)
		length = 0.01
		Color = [
			100
			80
			20
			255
		]
		angle = 0
		thickness = 10.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 20
				response = redModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (20.0, 2.0)
		Color = [
			255
			255
			255
			35
		]
		angularVel = 0.5
		BlendMode = subtract
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (1.1119901, 1.1)
		Color = [
			255
			255
			255
			42
		]
		angularVel = 0.01
		BlendMode = add
	}
]
OG_TieDye = [
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (1.0, 1.0)
		Color = [
			228
			222
			235
			254
		]
		angularVel = 0.0
		BlendMode = blend
		nonUniformScale
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 1.0
		Color = [
			255
			255
			255
			255
		]
		thickness = 3.0
		angle = 1.5707
		angularVel = 0.1
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 24.5
				responseFunc = sinLog10
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.1, 0.0)
		length = 0.01
		Color = [
			50
			50
			50
			255
		]
		angle = 0
		thickness = 10.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 30
				response = redModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 30
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 30
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 30
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.3, 0.0)
		length = 0.01
		Color = [
			100
			80
			20
			255
		]
		angle = 0
		thickness = 10.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 20
				response = redModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.7, 0.0)
		length = 0.01
		Color = [
			100
			80
			20
			255
		]
		angle = 0
		thickness = 10.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 20
				response = redModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.9, 0.0)
		length = 0.01
		Color = [
			100
			80
			20
			255
		]
		angle = 0
		thickness = 10.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 20
				response = redModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (20.0, 2.0)
		Color = [
			255
			255
			255
			35
		]
		angularVel = 0.5
		BlendMode = subtract
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (1.1119901, 1.1)
		Color = [
			255
			255
			255
			42
		]
		angularVel = 0.01
		BlendMode = add
	}
]
OG_BlueSpiral = [
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (1.015, 1.01)
		Color = [
			208
			182
			235
			254
		]
		angularVel = 0.0
		BlendMode = blend
		nonUniformScale
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 1.0
		Color = [
			255
			255
			255
			255
		]
		thickness = 3.0
		angle = 1.5707
		angularVel = 0.1
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 24.5
				responseFunc = sinLog10
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.1, 0.0)
		length = 0.01
		Color = [
			50
			50
			50
			255
		]
		angle = 0
		thickness = 10.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 30
				response = redModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 30
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 30
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 30
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.3, 0.0)
		length = 0.01
		Color = [
			100
			80
			20
			255
		]
		angle = 0
		thickness = 10.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 20
				response = redModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.7, 0.0)
		length = 0.01
		Color = [
			100
			80
			20
			255
		]
		angle = 0
		thickness = 10.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 20
				response = redModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.9, 0.0)
		length = 0.01
		Color = [
			100
			80
			20
			255
		]
		angle = 0
		thickness = 10.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 20
				response = redModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendPrev
		offset = (0.0, 0.2)
		scale = (2.0, 2.0)
		Color = [
			255
			255
			255
			35
		]
		angularVel = 0.5
		BlendMode = subtract
	}
	{
		type = blendPrev
		offset = (0.01, 0.01)
		scale = (1.1119901, 1.1)
		Color = [
			255
			255
			255
			42
		]
		angularVel = 0.01
		BlendMode = add
	}
]
OG_BlueCross = [
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (1.015, -1.01)
		Color = [
			208
			182
			235
			254
		]
		angularVel = 0.0
		BlendMode = blend
		nonUniformScale
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 1.0
		Color = [
			255
			255
			255
			255
		]
		thickness = 3.0
		angle = 1.5707
		angularVel = 0.1
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 24.5
				responseFunc = sinLog10
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.1, 0.0)
		length = 0.01
		Color = [
			50
			50
			50
			255
		]
		angle = 0
		thickness = 10.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 30
				response = redModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 30
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 30
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 30
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.3, 0.0)
		length = 0.01
		Color = [
			100
			80
			20
			255
		]
		angle = 0
		thickness = 10.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 20
				response = redModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.7, 0.0)
		length = 0.01
		Color = [
			100
			80
			20
			255
		]
		angle = 0
		thickness = 10.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 20
				response = redModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.9, 0.0)
		length = 0.01
		Color = [
			100
			80
			20
			255
		]
		angle = 0
		thickness = 10.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 20
				response = redModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendPrev
		offset = (0.0, 0.2)
		scale = (2.0, 2.0)
		Color = [
			255
			255
			255
			35
		]
		angularVel = 0.5
		BlendMode = subtract
	}
	{
		type = blendPrev
		offset = (0.01, 0.01)
		scale = (1.1119901, -1.1)
		Color = [
			255
			255
			255
			42
		]
		angularVel = 0.01
		BlendMode = add
	}
]
OG_BluePhoenix_II = [
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (1.015, -1.01)
		Color = [
			208
			182
			235
			254
		]
		angularVel = 0.0
		BlendMode = blend
		nonUniformScale
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 1.0
		Color = [
			255
			255
			255
			255
		]
		thickness = 3.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 24.5
				responseFunc = sinLog10
			}
		]
	}
	{
		type = line
		Pos = (0.1, 0.5, 0.0)
		length = 0.01
		Color = [
			50
			50
			50
			255
		]
		angle = 1.5707
		thickness = 10.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 30
				response = redModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 30
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 30
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 30
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.3, 0.5, 0.0)
		length = 0.01
		Color = [
			100
			80
			20
			255
		]
		angle = 1.5707
		thickness = 10.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 20
				response = redModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.7, 0.5, 0.0)
		length = 0.01
		Color = [
			100
			80
			20
			255
		]
		angle = 1.5707
		thickness = 10.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 20
				response = redModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.9, 0.5, 0.0)
		length = 0.01
		Color = [
			100
			80
			20
			255
		]
		angle = 1.5707
		thickness = 10.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 20
				response = redModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendPrev
		offset = (0.0, 0.2)
		scale = (2.0, 2.0)
		Color = [
			255
			255
			255
			35
		]
		angularVel = 0.5
		BlendMode = subtract
	}
	{
		type = blendPrev
		offset = (0.01, 0.01)
		scale = (1.1119901, -1.1)
		Color = [
			255
			255
			255
			42
		]
		angularVel = 0.01
		BlendMode = add
	}
]
OG_BlueBands = [
	{
		type = blendPrev
		offset = (0.0, 0.2)
		scale = (1.15, -1.1915001)
		Color = [
			218
			252
			255
			254
		]
		angularVel = 0.0
		BlendMode = blend
		nonUniformScale
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 1.0
		Color = [
			255
			255
			255
			255
		]
		thickness = 3.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 24.5
				responseFunc = sinLog10
			}
		]
	}
	{
		type = line
		Pos = (0.0, 0.5, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		angle = 1.5707
		thickness = 10.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 30
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 30
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 30
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.3, 0.5, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		angle = 1.5707
		thickness = 10.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 20
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.7, 0.5, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		angle = 1.5707
		thickness = 10.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 20
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (1.0, 0.5, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		angle = 1.5707
		thickness = 10.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 20
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (0.98999995, 1.0)
		Color = [
			255
			255
			255
			25
		]
		angularVel = 0.0
		BlendMode = add
	}
]
OG_BlueOverload = [
	{
		type = blendPrev
		offset = (0.0, 0.02)
		scale = (1.015, -1.01)
		Color = [
			218
			252
			255
			254
		]
		angularVel = 1.0
		BlendMode = blend
		nonUniformScale
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 1.0
		Color = [
			255
			255
			255
			255
		]
		thickness = 3.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 24.5
				responseFunc = sinLog10
			}
		]
	}
	{
		type = line
		Pos = (0.0, 0.5, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		angle = 1.5707
		thickness = 10.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 30
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 30
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 30
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.3, 0.5, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		angle = 1.5707
		thickness = 10.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 20
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.7, 0.5, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		angle = 1.5707
		thickness = 10.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 20
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (1.0, 0.5, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		angle = 1.5707
		thickness = 10.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 20
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (0.98999995, 1.1)
		Color = [
			255
			255
			255
			25
		]
		angularVel = 0.0
		BlendMode = add
	}
]
OG_BlueRingsFeedbackWave = [
	{
		type = blendPrev
		offset = (0.0, -0.0)
		scale = (1.15, -1.1915001)
		Color = [
			218
			252
			255
			254
		]
		angularVel = 0.1
		BlendMode = blend
		nonUniformScale
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 1.0
		Color = [
			255
			255
			255
			255
		]
		thickness = 1.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 24.5
				responseFunc = sinLog10
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 10
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.0025000002
		Color = [
			0
			1
			1
			85
		]
		thickness = 3.0
		controls = [
			{
				type = frequency
				response = radiusScale
				responseFunc = sinLog10
				radiusscalemod = 0.09
				spectrumBand = 20
			}
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 25
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 50
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.005
		Color = [
			0
			2
			2
			85
		]
		thickness = 2.0
		controls = [
			{
				type = frequency
				response = radiusScale
				responseFunc = sinLog10
				radiusscalemod = 0.09
				spectrumBand = 30
			}
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 50
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 100
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.0125
		Color = [
			0
			3
			3
			85
		]
		thickness = 1.0
		controls = [
			{
				type = frequency
				response = radiusScale
				responseFunc = sinLog10
				radiusscalemod = 0.09
				spectrumBand = 40
			}
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 200
			}
		]
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (0.98999995, 1.0)
		Color = [
			255
			255
			255
			25
		]
		angularVel = 0.0
		BlendMode = add
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (1.0, 1.0)
		Color = [
			255
			51
			63
			38
		]
		angularVel = 0.5
		BlendMode = subtract
	}
]
OG_BlueRingsPhasing = [
	{
		type = blendPrev
		offset = (0.0, -0.01)
		scale = (3.0, -1.915)
		Color = [
			218
			252
			255
			254
		]
		angularVel = 0.1
		BlendMode = blend
		nonUniformScale
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 1.0
		Color = [
			255
			255
			255
			255
		]
		thickness = 1.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				DeformScale = 24.5
				responseFunc = sinLog10
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 10
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.025
		Color = [
			0
			1
			1
			85
		]
		thickness = 3.0
		controls = [
			{
				type = frequency
				response = radiusScale
				responseFunc = sinLog10
				radiusscalemod = 0.09
				spectrumBand = 30
			}
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 25
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 50
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.05
		Color = [
			0
			2
			2
			85
		]
		thickness = 2.0
		controls = [
			{
				type = waveform
				response = radiusScale
				radiusscalemod = 0.04
				responseFunc = log10
			}
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 50
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 100
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.125
		Color = [
			0
			3
			3
			85
		]
		thickness = 1.0
		controls = [
			{
				type = waveform
				response = radiusScale
				radiusscalemod = 0.04
				responseFunc = log10
			}
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 200
			}
		]
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (0.1, 1.0)
		Color = [
			255
			255
			255
			25
		]
		angularVel = 0.0
		BlendMode = add
	}
	{
		type = blendPrev
		offset = (0.0, 0.0)
		scale = (1.0, 1.0)
		Color = [
			255
			51
			63
			238
		]
		angularVel = 0.5
		BlendMode = subtract
	}
]
OG_Spectrum_Arches = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (1.0, 1.0)
		offset = (0.0, 0.1)
		Color = [
			255
			255
			255
			255
		]
		BlendMode = blend
	}
	{
		type = circle
		Pos = (0.0, 0.5, 0.0)
		radius = 0.65000004
		Color = [
			200
			0
			0
			255
		]
		thickness = 4
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 20
				response = redModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 30
				response = greenModulation
				colorscale = 200
			}
			{
				type = waveform
				response = deform
				responseFunc = exp
				DeformScale = 10.0
			}
			{
				type = frequency
				response = radiusScale
				responseFunc = sinLog10
				radiusscalemod = 0.3
				spectrumBand = 10
			}
		]
	}
	{
		type = line
		Pos = (0.05, 0.05, 0.0)
		Color = [
			100
			0
			20
			255
		]
		angle = 0
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 6
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 6
				response = greenModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 6
				response = lengthScale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		Pos = (0.15, 0.05, 0.0)
		Color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 0
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 12
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 12
				response = greenModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 12
				response = lengthScale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		Pos = (0.25, 0.05, 0.0)
		Color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 0
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 18
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 18
				response = greenModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 18
				response = lengthScale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		Pos = (0.35000002, 0.05, 0.0)
		Color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 0
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 24
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 24
				response = greenModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 24
				response = lengthScale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		Pos = (0.45000002, 0.05, 0.0)
		Color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 0
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 30
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 30
				response = greenModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 30
				response = lengthScale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		Pos = (0.0, 0.05, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 1
		thickness = 2
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 30
				response = deform
				responseFunc = sinLog10
				DeformScale = 50
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.15, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 1
		thickness = 2
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 30
				response = deform
				responseFunc = sinLog10
				DeformScale = 50
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.25, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 2
		thickness = 2
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 30
				response = deform
				responseFunc = sinLog10
				DeformScale = 50
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.0
		scale = (-1.1, 1.9)
		offset = (0.0, -0.1)
		Color = [
			254
			254
			254
			85
		]
		BlendMode = add
	}
	{
		type = blendPrev
		angularVel = 1
		scale = (0.9, 0.9)
		offset = (0.01, 0.0)
		Color = [
			54
			54
			54
			100
		]
		BlendMode = sub
		controls = [
			{
				type = beatOn
				spectrumBand = 10
				response = angularVelMod
				velscale = 1
			}
		]
	}
]
OG_Spectrum_Exposition_NeonChurch = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (1.0, 1.0)
		offset = (0.0, 0.1)
		Color = [
			255
			255
			255
			255
		]
		BlendMode = blend
	}
	{
		type = circle
		Pos = (0.0, 0.5, 0.0)
		radius = 0.65000004
		Color = [
			200
			0
			0
			255
		]
		thickness = 4
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 20
				response = redModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 30
				response = greenModulation
				colorscale = 200
			}
			{
				type = frequency
				response = radiusScale
				responseFunc = sinLog10
				radiusscalemod = 0.3
				spectrumBand = 10
			}
		]
	}
	{
		type = line
		Pos = (0.05, 0.05, 0.0)
		Color = [
			100
			0
			20
			255
		]
		angle = 0
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 6
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 6
				response = greenModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 6
				response = lengthScale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		Pos = (0.15, 0.05, 0.0)
		Color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 0
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 12
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 12
				response = greenModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 12
				response = lengthScale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		Pos = (0.25, 0.05, 0.0)
		Color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 0
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 18
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 18
				response = greenModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 18
				response = lengthScale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		Pos = (0.35000002, 0.05, 0.0)
		Color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 0
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 24
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 24
				response = greenModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 24
				response = lengthScale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		Pos = (0.45000002, 0.05, 0.0)
		Color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 0
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 30
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 30
				response = greenModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 30
				response = lengthScale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		Pos = (0.0, 0.05, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 1
		thickness = 2
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 30
				response = deform
				responseFunc = sinLog10
				DeformScale = 50
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.15, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 1
		thickness = 2
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 30
				response = deform
				responseFunc = sinLog10
				DeformScale = 50
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.25, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 2
		thickness = 2
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 30
				response = deform
				responseFunc = sinLog10
				DeformScale = 50
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.0
		scale = (-1.1, 1.9)
		offset = (0.0, -0.1)
		Color = [
			254
			254
			254
			85
		]
		BlendMode = add
	}
	{
		type = blendPrev
		angularVel = 1
		scale = (0.9, 0.9)
		offset = (0.01, 0.0)
		Color = [
			54
			54
			54
			80
		]
		BlendMode = sub
	}
]
OG_Spectrum_Wash_MatrixRain = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (1.0, 1.0)
		offset = (0.0, 0.1)
		Color = [
			255
			255
			255
			255
		]
		BlendMode = blend
	}
	{
		type = line
		Pos = (0.05, 0.05, 0.0)
		Color = [
			100
			0
			20
			255
		]
		angle = 0
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 6
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 6
				response = greenModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 6
				response = lengthScale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		Pos = (0.15, 0.05, 0.0)
		Color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 0
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 12
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 12
				response = greenModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 12
				response = lengthScale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		Pos = (0.25, 0.05, 0.0)
		Color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 0
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 18
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 18
				response = greenModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 18
				response = lengthScale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		Pos = (0.35000002, 0.05, 0.0)
		Color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 0
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 24
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 24
				response = greenModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 24
				response = lengthScale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		Pos = (0.45000002, 0.05, 0.0)
		Color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 0
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 30
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 30
				response = greenModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 30
				response = lengthScale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		Pos = (0.0, 0.05, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 1
		thickness = 2
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 30
				response = deform
				responseFunc = sinLog10
				DeformScale = 50
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.15, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 1
		thickness = 2
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 30
				response = deform
				responseFunc = sinLog10
				DeformScale = 50
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.25, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 2
		thickness = 2
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 30
				response = deform
				responseFunc = sinLog10
				DeformScale = 50
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.0
		scale = (-1.1, 1.9)
		offset = (0.0, -0.1)
		Color = [
			254
			254
			254
			45
		]
		BlendMode = add
	}
]
OG_Spectrum_Strobe = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (1.0, -1.01)
		offset = (0.1, 0.0)
		Color = [
			255
			255
			255
			255
		]
		BlendMode = blend
	}
	{
		type = line
		Pos = (0.1, 0.05, 0.0)
		Color = [
			100
			0
			20
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = lengthScale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		Pos = (0.1, 0.15, 0.0)
		Color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 20
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = lengthScale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		Pos = (0.1, 0.25, 0.0)
		Color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 30
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 30
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 30
				response = lengthScale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		Pos = (0.1, 0.35000002, 0.0)
		Color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 40
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 40
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 40
				response = lengthScale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		Pos = (0.1, 0.45000002, 0.0)
		Color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 50
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 50
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 50
				response = lengthScale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		Pos = (0.1, 0.55, 0.0)
		Color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 1
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 60
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 60
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.0, 0.25, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 1
		thickness = 2
		angularVel = 0.0
	}
	{
		type = line
		Pos = (0.5, 0.35000002, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 1
		thickness = 2
		angularVel = 0.0
	}
	{
		type = line
		Pos = (0.5, 0.45000002, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 2
		thickness = 2
		angularVel = 0.0
	}
	{
		type = blendPrev
		angularVel = 0.0
		scale = (-1.0, -1.1)
		offset = (0.1, 0.0)
		Color = [
			254
			254
			254
			125
		]
		BlendMode = add
	}
	{
		type = blendPrev
		angularVel = 0.1
		scale = (-0.90999997, 1.01)
		offset = (0.0, 0.0)
		Color = [
			254
			254
			254
			120
		]
		BlendMode = sub
		controls = [
			{
				type = beatOn
				spectrumBand = 10
				response = angularVelMod
				velscale = 1000
			}
		]
	}
]
OG_Spectrum_StrobeII = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (1.0, -1.01)
		offset = (0.1, 0.0)
		Color = [
			255
			255
			255
			255
		]
		BlendMode = blend
	}
	{
		type = line
		Pos = (0.1, 0.05, 0.0)
		Color = [
			100
			0
			20
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = lengthScale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		Pos = (0.1, 0.15, 0.0)
		Color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 20
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = lengthScale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		Pos = (0.1, 0.25, 0.0)
		Color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 30
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 30
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 30
				response = lengthScale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		Pos = (0.1, 0.35000002, 0.0)
		Color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 40
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 40
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 40
				response = lengthScale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		Pos = (0.1, 0.45000002, 0.0)
		Color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 50
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 50
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 50
				response = lengthScale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		Pos = (0.1, 0.55, 0.0)
		Color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 1
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 60
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 60
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.0, 0.25, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 1
		thickness = 2
		angularVel = 0.0
	}
	{
		type = line
		Pos = (0.5, 0.35000002, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 1
		thickness = 2
		angularVel = 0.0
	}
	{
		type = line
		Pos = (0.5, 0.45000002, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 2
		thickness = 2
		angularVel = 0.0
	}
	{
		type = blendPrev
		angularVel = 0.0
		scale = (-1.0, -1.1)
		offset = (0.1, 0.0)
		Color = [
			254
			254
			254
			125
		]
		BlendMode = add
	}
	{
		type = blendPrev
		angularVel = 0.1
		scale = (-0.51, 2.01)
		offset = (0.0, 0.0)
		Color = [
			254
			254
			254
			250
		]
		BlendMode = sub
		controls = [
			{
				type = beatOn
				spectrumBand = 10
				response = angularVelMod
				velscale = 1000
			}
		]
	}
]
OG_SpectrumNeonFlipBright = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (1.0, 1.01)
		offset = (0.1, 0.0)
		Color = [
			255
			255
			255
			255
		]
		BlendMode = blend
	}
	{
		type = circle
		Pos = (0.0, 0.5, 0.0)
		radius = 0.25
		Color = [
			0
			0
			0
			255
		]
		thickness = 2
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 20
				response = redModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 30
				response = greenModulation
				colorscale = 200
			}
			{
				type = waveform
				response = deform
				responseFunc = sinLog10
				DeformScale = 100.1
			}
		]
	}
	{
		type = line
		Pos = (0.1, 0.05, 0.0)
		Color = [
			100
			0
			20
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = lengthScale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		Pos = (0.1, 0.15, 0.0)
		Color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 20
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = lengthScale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		Pos = (0.1, 0.25, 0.0)
		Color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 30
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 30
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 30
				response = lengthScale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		Pos = (0.1, 0.35000002, 0.0)
		Color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 40
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 40
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 40
				response = lengthScale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		Pos = (0.1, 0.45000002, 0.0)
		Color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 50
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 50
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 50
				response = lengthScale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		Pos = (0.1, 0.55, 0.0)
		Color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 1
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 60
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 60
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.0, 0.25, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 1
		thickness = 2
		angularVel = 0.0
	}
	{
		type = line
		Pos = (0.5, 0.35000002, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 1
		thickness = 2
		angularVel = 0.0
	}
	{
		type = line
		Pos = (0.5, 0.45000002, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 2
		thickness = 2
		angularVel = 0.0
	}
	{
		type = blendPrev
		angularVel = 0.0
		scale = (1.0, -1.1)
		offset = (0.1, 0.0)
		Color = [
			254
			254
			254
			185
		]
		BlendMode = add
	}
]
OG_SpectrumNeonFlip = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (1.0, 1.01)
		offset = (0.1, 0.0)
		Color = [
			255
			255
			255
			255
		]
		BlendMode = blend
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.5
		Color = [
			0
			0
			0
			255
		]
		thickness = 2
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 20
				response = redModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 30
				response = greenModulation
				colorscale = 200
			}
			{
				type = beatOn
				response = radiusScale
				responseFunc = sinLog10
				radiusscalemod = 0.03
				spectrumBand = 10
			}
		]
	}
	{
		type = line
		Pos = (0.1, 0.05, 0.0)
		Color = [
			100
			0
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = lengthScale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		Pos = (0.1, 0.15, 0.0)
		Color = [
			100
			0
			0
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 20
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = lengthScale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		Pos = (0.1, 0.25, 0.0)
		Color = [
			100
			0
			0
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 30
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 30
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 30
				response = lengthScale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		Pos = (0.1, 0.35000002, 0.0)
		Color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 40
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 40
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 40
				response = lengthScale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		Pos = (0.1, 0.45000002, 0.0)
		Color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 50
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 50
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 50
				response = lengthScale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		Pos = (0.6, 1.0, 0.0)
		Color = [
			200
			0
			20
			255
		]
		length = 0.1
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 60
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 60
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.0, 0.25, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 1
		thickness = 2
		angularVel = 0.0
	}
	{
		type = line
		Pos = (0.5, 0.35000002, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 1
		thickness = 2
		angularVel = 0.0
	}
	{
		type = line
		Pos = (0.5, 0.45000002, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 2
		thickness = 2
		angularVel = 0.0
	}
	{
		type = blendPrev
		angularVel = 0.0
		scale = (1.0, 1.1)
		offset = (0.1, 0.0)
		Color = [
			254
			254
			254
			85
		]
		BlendMode = add
	}
]
OG_SpectrumNeon = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (1.0, 1.0)
		offset = (0.1, 0.0)
		Color = [
			250
			250
			250
			250
		]
		BlendMode = blend
	}
	{
		type = circle
		Pos = (1.0, 0.5, 0.0)
		radius = 0.5
		Color = [
			100
			150
			220
			255
		]
		thickness = 10
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 20
			}
			{
				type = frequency
				response = radiusScale
				responseFunc = sinLog10
				radiusscalemod = 0.03
				spectrumBand = 10
			}
		]
	}
	{
		type = line
		Pos = (0.1, 0.05, 0.0)
		Color = [
			100
			0
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = lengthScale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		Pos = (0.1, 0.15, 0.0)
		Color = [
			100
			0
			0
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 20
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = lengthScale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		Pos = (0.1, 0.25, 0.0)
		Color = [
			100
			0
			0
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 30
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 30
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 30
				response = lengthScale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		Pos = (0.1, 0.35000002, 0.0)
		Color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 40
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 40
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 40
				response = lengthScale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		Pos = (0.1, 0.45000002, 0.0)
		Color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 50
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 50
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 50
				response = lengthScale
				lengthscalemod = 10
			}
		]
	}
	{
		type = line
		Pos = (0.0, 0.25, 0.0)
		Color = [
			0
			220
			0
			255
		]
		length = 1.5
		thickness = 2
		angularVel = 0.0
	}
	{
		type = line
		Pos = (0.5, 0.35000002, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 1
		thickness = 2
		angularVel = 0.0
	}
	{
		type = line
		Pos = (0.5, 0.45000002, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 2
		thickness = 2
		angularVel = 0.0
	}
	{
		type = blendPrev
		angularVel = 0.0
		scale = (1.0, 1.0)
		offset = (0.1, 0.0)
		Color = [
			254
			254
			254
			85
		]
		BlendMode = add
	}
]
OG_SpectrumLattice = [
	{
		type = blendPrev
		angularVel = -0.1
		scale = (1.0, -1.0)
		offset = (0.01, 0.0)
		Color = [
			254
			254
			254
			254
		]
		BlendMode = blend
	}
	{
		type = line
		Pos = (0.1, 0.5, 0.0)
		Color = [
			100
			0
			0
			255
		]
		angle = 1.5707
		length = 2
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.2, 0.5, 0.0)
		Color = [
			100
			0
			0
			255
		]
		length = 2
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 20
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.3, 0.5, 0.0)
		Color = [
			100
			0
			0
			255
		]
		length = 2
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 30
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 30
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 30
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.4, 0.5, 0.0)
		Color = [
			100
			0
			20
			255
		]
		length = 2
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 40
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 40
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 40
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			100
			0
			20
			255
		]
		length = 2
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 50
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 50
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 50
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.6, 0.5, 0.0)
		Color = [
			200
			0
			20
			255
		]
		length = 2
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 60
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 60
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.25, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 0.5
		thickness = 2
		angularVel = 0.0
	}
	{
		type = line
		Pos = (0.5, 0.35000002, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 1
		thickness = 2
		angularVel = 0.0
	}
	{
		type = line
		Pos = (0.5, 0.45000002, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 2
		thickness = 2
		angularVel = 0.0
	}
]
OG_Spectrum3D = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (1.0, -1.0)
		offset = (0.01, 0.0)
		Color = [
			254
			254
			254
			254
		]
		BlendMode = blend
	}
	{
		type = line
		Pos = (0.1, 0.5, 0.0)
		Color = [
			100
			0
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.2, 0.5, 0.0)
		Color = [
			100
			0
			0
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 20
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.3, 0.5, 0.0)
		Color = [
			100
			0
			0
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 30
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 30
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 30
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.4, 0.5, 0.0)
		Color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 40
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 40
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 40
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 50
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 50
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 50
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.6, 0.5, 0.0)
		Color = [
			200
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 60
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 60
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.25, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularVel = 0.0
	}
	{
		type = line
		Pos = (0.5, 0.35000002, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularVel = 0.0
	}
	{
		type = line
		Pos = (0.5, 0.45000002, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularVel = 0.0
	}
	{
		type = blendPrev
		angularVel = 0.0
		scale = (0.9, 0.9)
		offset = (0.02, 0.0)
		Color = [
			254
			254
			254
			80
		]
		BlendMode = add
	}
	{
		type = blendPrev
		angularVel = 0.1
		scale = (-0.90999997, -1.01)
		offset = (0.0, 0.0)
		Color = [
			254
			254
			254
			120
		]
		BlendMode = sub
		controls = [
			{
				type = beatOn
				spectrumBand = 10
				response = angularVelMod
				velscale = 1000
			}
		]
	}
]

script _SpectrumVertical 
endscript
OG_SpectrumVertical = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (1.0, -1.0)
		offset = (0.0, 0.0)
		Color = [
			254
			254
			254
			254
		]
		BlendMode = blend
	}
	{
		type = line
		Pos = (0.1, 0.5, 0.0)
		Color = [
			100
			0
			0
			255
		]
		angle = 1.5707
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.2, 0.5, 0.0)
		Color = [
			100
			0
			0
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 20
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.3, 0.5, 0.0)
		Color = [
			100
			0
			0
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 30
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 30
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 30
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.4, 0.5, 0.0)
		Color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 40
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 40
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 40
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			100
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 50
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 50
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 50
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.6, 0.5, 0.0)
		Color = [
			200
			0
			20
			255
		]
		length = 0.01
		angle = 1.5707
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 60
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 60
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.25, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularVel = 0.0
	}
	{
		type = line
		Pos = (0.5, 0.35000002, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularVel = 0.0
	}
	{
		type = line
		Pos = (0.5, 0.45000002, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularVel = 0.0
	}
	{
		type = blendPrev
		angularVel = 0.0
		scale = (0.9, 0.9)
		offset = (-0.001, 0.002)
		Color = [
			254
			254
			254
			80
		]
		BlendMode = add
	}
	{
		type = blendPrev
		angularVel = 0.1
		scale = (-0.90999997, -1.01)
		offset = (0.0, 0.0)
		Color = [
			254
			254
			254
			120
		]
		BlendMode = sub
	}
]
OG_SpectrumRedGreen = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (1.0, -1.1)
		offset = (0.0, 0.0)
		Color = [
			254
			254
			254
			220
		]
		BlendMode = blend
	}
	{
		type = blendPrev
		angularVel = 0.0
		scale = (1.0, 1.0)
		offset = (0.01, 0.0)
		Color = [
			254
			254
			254
			15
		]
		BlendMode = add
	}
	{
		type = line
		Pos = (0.5, 0.1, 0.0)
		Color = [
			100
			0
			0
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 10
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.18, 0.0)
		Color = [
			100
			0
			0
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 20
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 20
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.26, 0.0)
		Color = [
			100
			0
			0
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 30
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 30
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 30
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.34, 0.0)
		Color = [
			100
			0
			20
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 40
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 40
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 40
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.42000002, 0.0)
		Color = [
			100
			0
			20
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 50
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 50
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 50
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			200
			0
			20
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 60
				response = blueModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 60
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			250
			200
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularVel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = sinLog10
				DeformScale = 30.1
			}
			{
				type = frequency
				spectrumBand = 10
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
]
OG_ElectricDye = [
	{
		type = blendPrev
		angularVel = 0.51
		scale = (-1.99, -1.05)
		offset = (-0.001, 0.002)
		Color = [
			254
			254
			254
			250
		]
		BlendMode = blend
	}
	{
		type = circle
		Color = [
			250
			0
			0
			255
		]
		Pos = (0.5, 0.5, 0.0)
		radius = 0.25
		thickness = 2
		controls = [
			{
				type = waveform
				response = deform
				DeformScale = 100.0
			}
			{
				type = frequency
				response = radiusScale
				responseFunc = sinLog10
				radiusscalemod = 0.01
				spectrumBand = 20
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.1, 0.0)
		Color = [
			100
			200
			0
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumBand = 10
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 10
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.11, 0.0)
		Color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 20
				response = blueModulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumBand = 20
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 20
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.120000005, 0.0)
		Color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 30
				response = blueModulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumBand = 30
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 30
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.13, 0.0)
		Color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 40
				response = blueModulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumBand = 40
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 40
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.14, 0.0)
		Color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 50
				response = blueModulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumBand = 50
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 50
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.15, 0.0)
		Color = [
			200
			200
			20
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 60
				response = blueModulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.0, 0.0)
		Color = [
			200
			250
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularVel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = sinLog10
				DeformScale = 10.1
			}
			{
				type = frequency
				spectrumBand = 10
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.0
		scale = (-0.90999997, -1.01)
		offset = (0.01, 0.01)
		Color = [
			254
			254
			254
			250
		]
		BlendMode = add
	}
	{
		type = blendPrev
		angularVel = 0.01
		scale = (-1.11, -1.5)
		offset = (-0.001, 0.002)
		Color = [
			254
			254
			254
			250
		]
		BlendMode = sub
	}
]
OG_Tronsistors = [
	{
		type = blendPrev
		angularVel = 0.01
		scale = (1.02, -1.5)
		offset = (-0.001, -0.001)
		Color = [
			254
			254
			254
			250
		]
		BlendMode = blend
	}
	{
		type = circle
		Color = [
			0
			0
			0
			255
		]
		Pos = (0.5, 0.5, 0.0)
		radius = 0.125
		thickness = 2
		controls = [
			{
				type = waveform
				response = deform
				DeformScale = 500.0
			}
			{
				type = frequency
				response = radiusScale
				responseFunc = sinLog10
				radiusscalemod = 0.01
				spectrumBand = 20
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.05, 0.0)
		Color = [
			100
			200
			0
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 10
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.1, 0.0)
		Color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 20
				response = blueModulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 20
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.11, 0.0)
		Color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 30
				response = blueModulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 30
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.120000005, 0.0)
		Color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 40
				response = blueModulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 40
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.13, 0.0)
		Color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 50
				response = blueModulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 50
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.14, 0.0)
		Color = [
			200
			200
			20
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 60
				response = blueModulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.0, 0.0)
		Color = [
			200
			250
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularVel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = sinLog10
				DeformScale = 10.1
			}
			{
				type = frequency
				spectrumBand = 10
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
]
OG_DaftName = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (-0.90999997, -1.1)
		offset = (0.01, 0.01)
		Color = [
			254
			254
			254
			250
		]
		BlendMode = blend
	}
	{
		type = circle
		Color = [
			0
			0
			0
			255
		]
		Pos = (0.5, 0.5, 0.0)
		radius = 0.125
		thickness = 2
		controls = [
			{
				type = frequency
				response = radiusScale
				responseFunc = sinLog10
				radiusscalemod = 0.01
				spectrumBand = 20
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.05, 0.0)
		Color = [
			100
			200
			0
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 10000
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 10
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.1, 0.0)
		Color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 20
				response = blueModulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 20
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.15, 0.0)
		Color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 30
				response = blueModulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 30
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.2, 0.0)
		Color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 40
				response = blueModulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 40
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.25, 0.0)
		Color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 50
				response = blueModulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 50
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.3, 0.0)
		Color = [
			200
			200
			20
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 60
				response = blueModulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.0, 0.0)
		Color = [
			200
			100
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularVel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = sinLog10
				DeformScale = 10.1
			}
			{
				type = frequency
				spectrumBand = 10
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.0
		scale = (0.90999997, 1.01)
		Color = [
			254
			154
			54
			20
		]
		BlendMode = add
	}
]
OG_DaftDodger = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (-0.90999997, -1.1)
		offset = (0.01, 0.01)
		Color = [
			254
			254
			254
			250
		]
		BlendMode = blend
	}
	{
		type = line
		Pos = (0.5, 0.05, 0.0)
		Color = [
			100
			200
			0
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 10000
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 10
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.1, 0.0)
		Color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 20
				response = blueModulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 20
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.15, 0.0)
		Color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 30
				response = blueModulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 30
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.2, 0.0)
		Color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 40
				response = blueModulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 40
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.25, 0.0)
		Color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 50
				response = blueModulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 50
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.3, 0.0)
		Color = [
			200
			200
			20
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 60
				response = blueModulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.0, 0.0)
		Color = [
			200
			100
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularVel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = sinLog10
				DeformScale = 10.1
			}
			{
				type = frequency
				spectrumBand = 10
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.0
		scale = (0.90999997, 1.01)
		Color = [
			254
			154
			54
			20
		]
		BlendMode = add
	}
]
OG_DaftSpectrum = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (1.1, -1.1)
		offset = (0.01, 0.01)
		Color = [
			254
			254
			254
			250
		]
		BlendMode = blend
	}
	{
		type = line
		Pos = (0.5, 0.05, 0.0)
		Color = [
			100
			200
			0
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 10000
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 10
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.1, 0.0)
		Color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 20
				response = blueModulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 20
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.15, 0.0)
		Color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 30
				response = blueModulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 30
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.2, 0.0)
		Color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 40
				response = blueModulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 40
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.25, 0.0)
		Color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 50
				response = blueModulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 50
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.3, 0.0)
		Color = [
			200
			200
			20
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 60
				response = blueModulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.0, 0.0)
		Color = [
			200
			100
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularVel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = sinLog10
				DeformScale = 10.1
			}
			{
				type = frequency
				spectrumBand = 10
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.0
		scale = (1.01, 1.01)
		Color = [
			254
			154
			54
			20
		]
		BlendMode = add
	}
]
OG_DaftEqualizer = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (-1.1, -1.1)
		Color = [
			254
			254
			254
			250
		]
		BlendMode = blend
	}
	{
		type = line
		Pos = (0.5, 0.05, 0.0)
		Color = [
			100
			200
			0
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 10000
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 10
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.1, 0.0)
		Color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 20
				response = blueModulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 20
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.15, 0.0)
		Color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 30
				response = blueModulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 30
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.2, 0.0)
		Color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 40
				response = blueModulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 40
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.25, 0.0)
		Color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 50
				response = blueModulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 50
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.3, 0.0)
		Color = [
			200
			200
			20
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 60
				response = blueModulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.0, 0.0)
		Color = [
			200
			100
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularVel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = sinLog10
				DeformScale = 10.1
			}
			{
				type = frequency
				spectrumBand = 10
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.0
		scale = (1.01, 1.01)
		Color = [
			254
			154
			54
			20
		]
		BlendMode = add
	}
]
OG_HorizontalAnalysis = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (-1.1, -1.1)
		Color = [
			254
			254
			254
			250
		]
		BlendMode = blend
	}
	{
		type = line
		Pos = (0.5, 0.05, 0.0)
		Color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 10000
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 10
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.1, 0.0)
		Color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 20
				response = blueModulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 20
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.15, 0.0)
		Color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 30
				response = blueModulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 30
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.2, 0.0)
		Color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 40
				response = blueModulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 40
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.25, 0.0)
		Color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 50
				response = blueModulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 50
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.3, 0.0)
		Color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularVel = 0.0
		controls = [
			{
				type = frequency
				spectrumBand = 60
				response = blueModulation
				colorscale = 1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = greenModulation
				colorscale = -1000
			}
			{
				type = frequency
				spectrumBand = 60
				response = lengthScale
				lengthscalemod = 100
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.0
		scale = (1.01, 1.01)
		Color = [
			254
			154
			54
			20
		]
		BlendMode = add
	}
]
OG_Grid = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (1.0995, 1.199)
		Color = [
			250
			250
			250
			255
		]
		BlendMode = blend
	}
	{
		type = circle
		Pos = (0.515, 0.5, 0.0)
		radius = 0.321
		controls = [
			{
				type = waveform
				response = deform
				DeformScale = 100
			}
		]
	}
	{
		type = circle
		Pos = (0.51, 0.5, 0.0)
		radius = 0.421
		controls = [
			{
				type = waveform
				response = deform
				DeformScale = 100
			}
		]
	}
	{
		type = circle
		Pos = (0.501, 0.51, 0.0)
		radius = 0.5215
		controls = [
			{
				type = waveform
				response = deform
				DeformScale = 100
			}
		]
	}
	{
		type = line
		Pos = (0.511, 0.25, 0.0)
		Color = [
			100
			0
			250
			255
		]
		length = 0.98999995
		thickness = 2
		angularVel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = sinLog10
				DeformScale = 30.1
			}
		]
	}
	{
		type = line
		Pos = (0.51199996, 0.125, 0.0)
		Color = [
			248
			168
			28
			255
		]
		length = 1
		angularVel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = log10
				DeformScale = 20.1
			}
		]
	}
	{
		type = line
		Color = [
			250
			228
			55
			255
		]
		Pos = (0.51, 0.5, 0.0)
		length = 0.97999996
		angularVel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = sinLog10
				DeformScale = 10.1
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.1
		scale = (1.2, 1.09)
		Color = [
			80
			70
			40
			35
		]
		BlendMode = add
	}
]
OG_GridSimple = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (1.0995, 1.199)
		Color = [
			250
			250
			250
			255
		]
		BlendMode = blend
	}
	{
		type = circle
		Pos = (0.515, 0.5, 0.0)
		radius = 0.021
		controls = [
			{
				type = waveform
				response = deform
				DeformScale = 100
			}
		]
	}
	{
		type = circle
		Pos = (0.51, 0.5, 0.0)
		radius = 0.0121
		controls = [
			{
				type = waveform
				response = deform
				DeformScale = 100
			}
		]
	}
	{
		type = circle
		Pos = (0.501, 0.51, 0.0)
		radius = 0.005
		controls = [
			{
				type = waveform
				response = deform
				DeformScale = 100
			}
		]
	}
	{
		type = line
		Pos = (0.511, 0.5, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularVel = 0.1
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = sinLog10
				DeformScale = 20.1
			}
		]
	}
	{
		type = line
		Pos = (0.51199996, 0.5, 0.0)
		Color = [
			248
			168
			28
			255
		]
		length = 1
		angularVel = 0.1
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = log10
				DeformScale = 20.1
			}
		]
	}
	{
		type = line
		Color = [
			250
			228
			55
			255
		]
		Pos = (0.51, 0.5, 0.0)
		length = 0.97999996
		angularVel = 0.1
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = sinLog10
				DeformScale = 10.1
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.1
		scale = (1.2, 1.09)
		Color = [
			80
			70
			40
			35
		]
		BlendMode = add
	}
]
og_rings_of_Saturn = [
	{
		type = blendPrev
		angularVel = 0.1
		scale = (-0.98999995, 0.98999995)
		Color = [
			255
			255
			254
			255
		]
		BlendMode = blend
	}
	{
		type = blendPrev
		angularVel = 0.05
		scale = (0.9919999, 0.99099994)
		Color = [
			5
			5
			5
			255
		]
		BlendMode = add
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.05
		Color = [
			0
			10
			0
			255
		]
		thickness = 5
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 20
			}
			{
				type = frequency
				response = radiusScale
				responseFunc = sinLog10
				radiusscalemod = 0.03
				spectrumBand = 10
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.08
		Color = [
			5
			5
			5
			255
		]
		thickness = 3
		controls = [
			{
				type = frequency
				spectrumBand = 32
				response = deform
				responseFunc = sinLog10
				DeformScale = 50.1
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.03
		Color = [
			5
			5
			5
			255
		]
		thickness = 10
		controls = [
			{
				type = frequency
				spectrumBand = 32
				response = deform
				responseFunc = sinLog10
				DeformScale = 50.1
			}
			{
				type = frequency
				spectrumBand = 10
				response = redModulation
				colorscale = 30
			}
			{
				type = frequency
				spectrumBand = 16
				response = greenModulation
				colorscale = 15
			}
			{
				type = frequency
				spectrumBand = 16
				response = blueModulation
				colorscale = 15
			}
		]
	}
	{
		type = line
		Color = [
			0
			0
			0
			255
		]
		Pos = (0.5, 0.55, 0.0)
		length = 0.75
		angularVel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				spectrumBand = 48
				responseFunc = log10
				DeformScale = 20
			}
			{
				type = beatOn
				response = blueModulation
				colorscale = 1
			}
		]
	}
	{
		type = line
		Color = [
			250
			0
			0
			255
		]
		Pos = (0.5, 0.55, 0.0)
		length = 0.75
		angularVel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				spectrumBand = 48
				responseFunc = log10
				DeformScale = 10
			}
			{
				type = frequency
				spectrumBand = 32
				response = greenModulation
				colorscale = 200
			}
		]
	}
]
OG_Gridlock = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (0.98499995, 1.199)
		Color = [
			250
			250
			250
			255
		]
		BlendMode = blend
	}
	{
		type = circle
		Pos = (0.515, 0.5, 0.0)
		radius = 0.021
		controls = [
			{
				type = waveform
				response = deform
				DeformScale = 100
			}
		]
	}
	{
		type = circle
		Pos = (0.51, 0.5, 0.0)
		radius = 0.0121
		controls = [
			{
				type = waveform
				response = deform
				DeformScale = 100
			}
		]
	}
	{
		type = circle
		Pos = (0.501, 0.51, 0.0)
		radius = 0.005
		controls = [
			{
				type = waveform
				response = deform
				DeformScale = 100
			}
		]
	}
	{
		type = hypotrochoid
		Color = [
			255
			0
			0
			255
		]
		Pos = (0.4515, 0.515, 0.0)
		length = 0.120000005
		outerRadius = 0.16
		InnerRadius = 0.1
		angularVel = 0.4
		thickness = 1.0
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = sinLog10
				DeformScale = 10.1
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 0.75
		thickness = 2
		angularVel = 0.024
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = sinLog10
				DeformScale = 10.1
			}
		]
	}
	{
		type = line
		Pos = (0.51, 0.5, 0.0)
		Color = [
			228
			248
			248
			255
		]
		length = 1
		angularVel = 0.025
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = log10
				DeformScale = 20.1
			}
		]
	}
	{
		type = line
		Color = [
			150
			168
			238
			255
		]
		Pos = (0.5, 0.51, 0.0)
		length = 0.25
		angularVel = 0.025999999
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = sinLog10
				DeformScale = 10.1
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.15
		scale = (1.0999, 1.0999)
		Color = [
			120
			108
			128
			25
		]
		BlendMode = add
	}
]
OG_WeaverBright = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (0.98499995, 1.199)
		Color = [
			250
			250
			250
			255
		]
		BlendMode = blend
	}
	{
		type = circle
		Pos = (0.515, 0.5, 0.0)
		radius = 0.021
		controls = [
			{
				type = waveform
				response = deform
				DeformScale = 100
			}
		]
	}
	{
		type = circle
		Pos = (0.51, 0.5, 0.0)
		radius = 0.0121
		controls = [
			{
				type = waveform
				response = deform
				DeformScale = 100
			}
		]
	}
	{
		type = circle
		Pos = (0.501, 0.51, 0.0)
		radius = 0.005
		controls = [
			{
				type = waveform
				response = deform
				DeformScale = 100
			}
		]
	}
	{
		type = hypotrochoid
		Color = [
			255
			0
			0
			255
		]
		Pos = (0.4515, 0.515, 0.0)
		length = 0.120000005
		outerRadius = 0.16
		InnerRadius = 0.1
		angularVel = 0.4
		thickness = 1.0
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = sinLog10
				DeformScale = 10.1
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 0.75
		thickness = 2
		angularVel = 0.024
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = sinLog10
				DeformScale = 10.1
			}
		]
	}
	{
		type = line
		Pos = (0.51, 0.5, 0.0)
		Color = [
			228
			248
			248
			255
		]
		length = 1
		angularVel = 0.025
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = log10
				DeformScale = 20.1
			}
		]
	}
	{
		type = line
		Color = [
			150
			168
			238
			255
		]
		Pos = (0.5, 0.51, 0.0)
		length = 0.25
		angularVel = 0.025999999
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = sinLog10
				DeformScale = 10.1
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.1
		scale = (1.0999, 0.99899995)
		Color = [
			120
			108
			128
			25
		]
		BlendMode = add
	}
]
OG_Weaver = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (0.98499995, 1.199)
		Color = [
			250
			250
			250
			255
		]
		BlendMode = blend
	}
	{
		type = circle
		Color = [
			150
			50
			250
			255
		]
		Pos = (0.515, 0.5, 0.0)
		radius = 0.21000001
		controls = [
			{
				type = waveform
				response = deform
				DeformScale = 10
			}
		]
	}
	{
		type = circle
		Color = [
			150
			50
			250
			255
		]
		Pos = (0.51, 0.5, 0.0)
		radius = 0.12100001
		controls = [
			{
				type = waveform
				response = deform
				DeformScale = 100
			}
		]
	}
	{
		type = circle
		Color = [
			150
			50
			250
			255
		]
		Pos = (0.501, 0.51, 0.0)
		radius = 0.25
		controls = [
			{
				type = waveform
				response = deform
				DeformScale = 10
			}
		]
	}
	{
		type = hypotrochoid
		Color = [
			255
			0
			0
			255
		]
		Pos = (0.4515, 0.515, 0.0)
		length = 0.120000005
		outerRadius = 0.16
		InnerRadius = 0.1
		angularVel = 4
		thickness = 1.0
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 0.75
		thickness = 2
		angularVel = 0.024
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = sinLog10
				DeformScale = 10.1
			}
		]
	}
	{
		type = line
		Pos = (0.51, 0.5, 0.0)
		Color = [
			228
			248
			248
			255
		]
		length = 1
		angularVel = 0.025
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = log10
				DeformScale = 20.1
			}
		]
	}
	{
		type = line
		Color = [
			150
			168
			238
			255
		]
		Pos = (0.5, 0.51, 0.0)
		length = 1
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = sinLog10
				DeformScale = 10.1
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.1
		scale = (1.0999, 0.99899995)
		Color = [
			120
			108
			128
			15
		]
		BlendMode = add
	}
]
OG_Envy = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (0.97999996, -0.98999995)
		Color = [
			250
			250
			250
			255
		]
		BlendMode = blend
	}
	{
		type = circle
		Color = [
			0
			0
			0
			255
		]
		Pos = (0.515, 0.5, 0.0)
		radius = 0.021
		controls = [
			{
				type = beatOn
				spectrumBand = 8
				response = redModulation
				colorscale = 200
			}
		]
	}
	{
		type = hypotrochoid
		Color = [
			225
			225
			255
			255
		]
		Pos = (0.4515, 0.515, 0.0)
		length = 0.2
		outerRadius = 0.16
		InnerRadius = 0.1
		angularVel = 1
		thickness = 5.0
	}
	{
		type = line
		Pos = (0.51, 0.5, 0.0)
		Color = [
			228
			248
			248
			255
		]
		length = 1
		angularVel = 0.025
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = log10
				DeformScale = 20.1
			}
		]
	}
	{
		type = line
		Color = [
			50
			228
			38
			255
		]
		Pos = (0.5, 0.51, 0.0)
		length = 0.25
		angularVel = 0.26
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = sinLog10
				DeformScale = 10.1
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.01
		scale = (0.99899995, 0.99899995)
		Color = [
			120
			120
			120
			12
		]
		BlendMode = add
	}
]
OG_BluePhoenix = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (0.97999996, -0.98999995)
		Color = [
			250
			250
			250
			255
		]
		BlendMode = blend
	}
	{
		type = circle
		Color = [
			0
			0
			0
			255
		]
		Pos = (0.515, 0.5, 0.0)
		radius = 0.021
		controls = [
			{
				type = beatOn
				spectrumBand = 8
				response = redModulation
				colorscale = 200
			}
			{
				type = waveform
				response = deform
				DeformScale = 400.1
			}
		]
	}
	{
		type = hypotrochoid
		Color = [
			225
			225
			255
			255
		]
		Pos = (0.4515, 0.515, 0.0)
		length = 0.2
		outerRadius = 0.16
		InnerRadius = 0.1
		angularVel = 1
		thickness = 5.0
	}
	{
		type = line
		Pos = (0.51, 0.5, 0.0)
		Color = [
			228
			248
			248
			255
		]
		length = 1
		angularVel = 0.025
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = log10
				DeformScale = 20.1
			}
		]
	}
	{
		type = line
		Color = [
			120
			130
			140
			255
		]
		Pos = (0.5, 0.51, 0.0)
		length = 0.25
		angularVel = 0.26
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = sinLog10
				DeformScale = 10.1
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.01
		scale = (0.99899995, 0.99899995)
		Color = [
			100
			128
			128
			12
		]
		BlendMode = add
	}
]
OG_DontHarshMyMellow = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (-0.97999996, -0.98999995)
		Color = [
			250
			250
			250
			255
		]
		BlendMode = blend
	}
	{
		type = circle
		Pos = (0.515, 0.5, 0.0)
		radius = 0.021
		Color = [
			0
			0
			0
			255
		]
		controls = [
			{
				type = waveform
				response = deform
				DeformScale = 10
			}
		]
	}
	{
		type = circle
		Color = [
			50
			50
			50
			255
		]
		Pos = (0.51, 0.5, 0.0)
		radius = 0.0121
		controls = [
			{
				type = waveform
				response = deform
				DeformScale = 40.1
			}
			{
				type = beatOn
				spectrumBand = 30
				response = blueModulation
				colorscale = 1
			}
		]
	}
	{
		type = circle
		Color = [
			5
			4
			0
			255
		]
		Pos = (0.501, 0.51, 0.0)
		radius = 0.005
		controls = [
			{
				type = frequency
				spectrumBand = 18
				response = deform
				responseFunc = log10
				DeformScale = 20.1
			}
		]
	}
	{
		type = hypotrochoid
		Color = [
			255
			204
			0
			255
		]
		Pos = (0.4515, 0.515, 0.0)
		length = 0.2
		outerRadius = 0.16
		InnerRadius = 0.21000001
		angularVel = 1
		thickness = 5.0
	}
	{
		type = line
		Pos = (0.51, 0.5, 0.0)
		Color = [
			228
			248
			48
			255
		]
		length = 1
		angularVel = 0.025
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = log10
				DeformScale = 10.1
			}
			{
				type = beatOn
				spectrumBand = 30
				response = blueModulation
				colorscale = 1
			}
			{
				type = beatOn
				response = lengthScale
				spectrumBand = 18
				responseFunc = sinLog10
				lengthscalemod = 0.1
			}
		]
	}
	{
		type = line
		Color = [
			150
			168
			238
			255
		]
		Pos = (0.5, 0.51, 0.0)
		length = 0.1
		angularVel = 0.025999999
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = sinLog10
				DeformScale = 10.1
			}
			{
				type = beatOn
				response = lengthScale
				spectrumBand = 18
				responseFunc = sinLog10
				lengthscalemod = 0.1
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.01
		scale = (0.99899995, 0.99899995)
		Color = [
			120
			108
			128
			15
		]
		BlendMode = add
	}
]
OG_RetinalBurn = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (1.01, 0.98999995)
		Color = [
			250
			250
			250
			255
		]
		BlendMode = blend
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.1
		Color = [
			0
			0
			0
			255
		]
		controls = [
			{
				type = waveform
				response = deform
				DeformScale = 100
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.05
		controls = [
			{
				type = frequency
				response = deform
				spectrumBand = 32
				DeformScale = 200
			}
		]
	}
	{
		type = hypotrochoid
		Color = [
			68
			168
			248
			255
		]
		Pos = (0.4515, 0.515, 0.0)
		length = 0.01
		outerRadius = 0.26
		InnerRadius = 0.1
		angularVel = 5
		thickness = 1.0
	}
	{
		type = line
		Pos = (0.25, 0.5, 0.0)
		Color = [
			228
			248
			248
			255
		]
		length = 1
		angularVel = 0.01
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = log10
				DeformScale = 10
			}
		]
	}
	{
		type = line
		Pos = (0.25, 0.51, 0.0)
		Color = [
			48
			28
			48
			255
		]
		length = 0.25
		angularVel = 0.01
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = sinLog10
				DeformScale = 10.1
			}
		]
	}
	{
		type = line
		Color = [
			20
			38
			108
			255
		]
		Pos = (0.25, 0.52, 0.0)
		length = 0.5
		angularVel = 0.01
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = sinLog10
				DeformScale = 10.1
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.1
		scale = (0.98999995, 0.98999995)
		Color = [
			120
			108
			128
			15
		]
		BlendMode = add
	}
]
OG_Chrysalis = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (1.01, 0.98999995)
		Color = [
			250
			250
			250
			255
		]
		BlendMode = blend
	}
	{
		type = circle
		Pos = (0.515, 0.5, 0.0)
		radius = 0.1
		Color = [
			0
			0
			0
			255
		]
		controls = [
			{
				type = waveform
				response = deform
				DeformScale = 100
			}
		]
	}
	{
		type = hypotrochoid
		Color = [
			68
			168
			248
			255
		]
		Pos = (0.4515, 0.515, 0.0)
		length = 0.01
		outerRadius = 0.26
		InnerRadius = 0.1
		angularVel = 5
		thickness = 1.0
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			228
			248
			248
			255
		]
		length = 1
		angularVel = 0.01
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = log10
				DeformScale = 10
			}
		]
	}
	{
		type = line
		Pos = (0.5, 0.51, 0.0)
		Color = [
			48
			28
			48
			255
		]
		length = 0.25
		angularVel = 0.01
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = sinLog10
				DeformScale = 10.1
			}
		]
	}
	{
		type = line
		Color = [
			20
			38
			108
			255
		]
		Pos = (0.5, 0.52, 0.0)
		length = 0.5
		angularVel = 0.01
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = sinLog10
				DeformScale = 10.1
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.1
		scale = (0.98999995, 0.98999995)
		Color = [
			120
			108
			128
			15
		]
		BlendMode = add
	}
]
OG_Spinner = [
	{
		type = blendPrev
		angularVel = 0.1
		scale = (1.01, 1.1)
		Color = [
			250
			220
			0
			255
		]
		BlendMode = blend
	}
	{
		type = circle
		Color = [
			250
			250
			250
			255
		]
		Pos = (0.515, 0.5, 0.0)
		radius = 0.1
		controls = [
			{
				type = waveform
				response = deform
				DeformScale = 100
			}
		]
	}
	{
		type = hypotrochoid
		Color = [
			68
			168
			248
			255
		]
		Pos = (0.4515, 0.515, 0.0)
		length = 0.01
		outerRadius = 0.16
		InnerRadius = 0.1
		angularVel = 1
		thickness = 15.0
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			228
			248
			248
			255
		]
		length = 0.1
		angularVel = 0.05
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = log10
				DeformScale = 200.1
			}
		]
	}
	{
		type = line
		Pos = (0.25, 0.4, 0.0)
		Color = [
			48
			28
			48
			255
		]
		length = 0.25
		angularVel = 0.03
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = sinLog10
				DeformScale = 10.1
			}
		]
	}
	{
		type = line
		Color = [
			20
			38
			108
			255
		]
		Pos = (0.75, 0.4, 0.0)
		length = 0.5
		angularVel = 0.012999999
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = sinLog10
				DeformScale = 10.1
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.01
		scale = (0.99899995, 0.99899995)
		Color = [
			120
			108
			128
			15
		]
		BlendMode = add
	}
]
OG_Web = [
	{
		type = blendPrev
		angularVel = 0.1
		scale = (1.01, 1.1)
		Color = [
			250
			250
			250
			255
		]
		BlendMode = blend
	}
	{
		type = circle
		Color = [
			220
			128
			28
			12
		]
		Pos = (0.55, 0.5, 0.0)
		radius = 0.25
		controls = [
			{
				type = waveform
				response = deform
				DeformScale = 100
			}
		]
	}
	{
		type = hypotrochoid
		Color = [
			68
			68
			148
			255
		]
		Pos = (0.4515, 0.515, 0.0)
		length = 0.01
		outerRadius = 0.16
		InnerRadius = 0.1
		angularVel = 1
		thickness = 15.0
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			228
			248
			248
			255
		]
		length = 0.1
		angularVel = 0.05
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = log10
				DeformScale = 200.1
			}
		]
	}
	{
		type = line
		Pos = (0.25, 0.4, 0.0)
		Color = [
			248
			228
			248
			255
		]
		length = 0.025
		angularVel = 1.3
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = sinLog10
				DeformScale = 10.1
			}
		]
	}
	{
		type = line
		Color = [
			20
			38
			108
			255
		]
		Pos = (0.75, 0.4, 0.0)
		length = 0.025
		angularVel = 2.3
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = sinLog10
				DeformScale = 10.1
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.01
		scale = (0.99899995, 0.99899995)
		Color = [
			120
			108
			128
			12
		]
		BlendMode = add
	}
]
OG_Psychoid = [
	{
		type = blendPrev
		angularVel = 0.01
		scale = (1.01, 1.1)
		Color = [
			250
			250
			250
			255
		]
		BlendMode = blend
	}
	{
		type = hypotrochoid
		Color = [
			68
			68
			148
			255
		]
		Pos = (0.4515, 0.515, 0.0)
		length = 0.01
		outerRadius = 0.2
		InnerRadius = 0.1
		angularVel = 1
		thickness = 25.0
	}
	{
		type = line
		Pos = (0.75, 0.42000002, 0.0)
		Color = [
			228
			248
			248
			255
		]
		length = 0.1
		angularVel = 0.05
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = log10
				DeformScale = 200.1
			}
		]
	}
	{
		type = circle
		Color = [
			0
			0
			0
			255
		]
		Pos = (0.55, 0.5, 0.0)
		radius = 0.125
		controls = [
			{
				type = waveform
				response = deform
				DeformScale = 100
			}
		]
	}
	{
		type = circle
		Color = [
			0
			0
			0
			255
		]
		Pos = (0.55, 0.51, 0.0)
		radius = 0.126
		controls = [
			{
				type = waveform
				response = deform
				DeformScale = 100
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.01
		scale = (0.99899995, 0.99899995)
		Color = [
			120
			108
			128
			25
		]
		BlendMode = add
	}
	{
		type = hypotrochoid
		Color = [
			0
			0
			0
			255
		]
		Pos = (0.4515, 0.515, 0.0)
		length = 0.2
		outerRadius = 0.16
		InnerRadius = 0.1
		angularVel = 1
		thickness = 25.0
	}
]
OG_Psyche = [
	{
		type = blendPrev
		angularVel = 0.01
		scale = (1.01, 1.1)
		Color = [
			250
			250
			250
			255
		]
		BlendMode = blend
	}
	{
		type = hypotrochoid
		Color = [
			68
			68
			148
			255
		]
		Pos = (0.4515, 0.515, 0.0)
		length = 0.01
		outerRadius = 0.2
		InnerRadius = 0.1
		angularVel = 1
		thickness = 25.0
	}
	{
		type = line
		Pos = (0.75, 0.42000002, 0.0)
		Color = [
			228
			248
			248
			255
		]
		length = 0.1
		angularVel = 0.05
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = log10
				DeformScale = 200.1
			}
		]
	}
	{
		type = line
		Pos = (0.75, 0.41, 0.0)
		Color = [
			68
			8
			0
			255
		]
		length = 0.25
		angularVel = 0.06
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = sinLog10
				DeformScale = 10.1
			}
		]
	}
	{
		type = line
		Color = [
			0
			68
			8
			255
		]
		Pos = (0.75, 0.4, 0.0)
		length = 0.25
		angularVel = 0.04
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = sinLog10
				DeformScale = 10.1
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.01
		scale = (0.99899995, 0.99899995)
		Color = [
			120
			108
			128
			25
		]
		BlendMode = add
	}
	{
		type = hypotrochoid
		Color = [
			0
			0
			0
			255
		]
		Pos = (0.4515, 0.515, 0.0)
		length = 0.2
		outerRadius = 0.16
		InnerRadius = 0.1
		angularVel = 1
		thickness = 25.0
	}
]
OG_EyeoftheStorm = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (0.97999996, -0.98999995)
		Color = [
			250
			250
			250
			255
		]
		BlendMode = blend
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 0.75
		thickness = 1
		angularVel = 0.5
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = sinLog10
				DeformScale = 20.1
			}
		]
	}
	{
		type = circle
		Pos = (0.515, 0.5, 0.0)
		radius = 0.021
		controls = [
			{
				type = waveform
				response = deform
				DeformScale = 100
			}
		]
	}
	{
		type = circle
		Pos = (0.51, 0.5, 0.0)
		radius = 0.0121
		controls = [
			{
				type = waveform
				response = deform
				DeformScale = 100
			}
		]
	}
	{
		type = circle
		Pos = (0.501, 0.51, 0.0)
		radius = 0.005
		controls = [
			{
				type = waveform
				response = deform
				DeformScale = 100
			}
		]
	}
	{
		type = hypotrochoid
		Color = [
			68
			68
			148
			255
		]
		Pos = (0.4515, 0.515, 0.0)
		length = 0.02
		outerRadius = 0.16
		InnerRadius = 0.1
		angularVel = 1
		thickness = 5.0
	}
	{
		type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			228
			248
			248
			255
		]
		length = 1
		angularVel = 0.025
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = log10
				DeformScale = 20.1
			}
		]
	}
	{
		type = line
		Color = [
			20
			38
			108
			255
		]
		Pos = (0.75, 0.4, 0.0)
		length = 0.25
		angularVel = 2.3
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = sinLog10
				DeformScale = 10.1
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.01
		scale = (0.99899995, 0.99899995)
		Color = [
			120
			108
			128
			15
		]
		BlendMode = add
	}
]
og_neon_tunnel = [
	{
		type = blendPrev
		angularVel = 0.0
		angle = 0.1
		scale = (0.98999995, 0.98999995)
		offset = (0.0, 0.0)
		Color = [
			255
			255
			254
			255
		]
		BlendMode = blend
	}
	{
		type = blendPrev
		angularVel = 0.0
		scale = (1.0, 0.99099994)
		offset = (0.0, 0.0)
		Color = [
			255
			5
			5
			1
		]
		BlendMode = add
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.09
		Color = [
			50
			0
			0
			255
		]
		thickness = 5
		controls = [
			{
				type = frequency
				spectrumBand = 10
				response = blueModulation
				colorscale = 10
			}
		]
	}
	{
		type = line
		Color = [
			0
			0
			0
			255
		]
		Pos = (0.5, 0.1515, 0.0)
		length = 0.75
		angularVel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				spectrumBand = 48
				responseFunc = log10
				DeformScale = 10
			}
			{
				type = frequency
				spectrumBand = 10
				response = alphaModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 11
				response = redModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 12
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 13
				response = blueModulation
				colorscale = 100
			}
		]
	}
]
green_tunnel_primitives = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (1.001, 0.99899995)
		Color = [
			245
			204
			246
			255
		]
		BlendMode = blend
	}
	{
		type = circle
		Pos = (0.25, 0.25, 0.0)
		radius = 0.1
		controls = [
			{
				type = waveform
				response = deform
				DeformScale = 100
			}
		]
	}
	{
		type = hypotrochoid
		Pos = (0.55, 0.55, 0.0)
		length = 0.01
		outerRadius = 0.15
		InnerRadius = 0.015
		angularVel = 5
		thickness = 1.0
	}
	{
		type = line
		Pos = (0.25, 0.5, 0.0)
		Color = [
			128
			148
			148
			255
		]
		length = 1
		angularVel = 0.5
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = log10
				DeformScale = 10.1
			}
		]
	}
	{
		type = hypotrochoid
		Color = [
			58
			108
			8
			255
		]
		Pos = (0.5, 0.55, 0.0)
		length = 0.1
		outerRadius = 0.15
		InnerRadius = 0.015
		angularVel = 1
		thickness = 1.0
	}
	{
		type = line
		Color = [
			20
			38
			108
			55
		]
		Pos = (0.75, 0.4, 0.0)
		length = 0.25
		angularVel = 0.03
		controls = [
			{
				type = frequency
				response = deform
				responseFunc = sinLog10
				DeformScale = 10.1
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.01
		scale = (1.01, 0.899)
		Color = [
			20
			38
			28
			128
		]
		BlendMode = add
	}
]
og_preset_1 = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (0.98999995, 0.98999995)
		Color = [
			255
			254
			254
			255
		]
		BlendMode = blend
	}
	{
		type = circle
		Color = [
			0
			0
			0
			255
		]
		Pos = (0.5, 0.45000002, 0.0)
		radius = 0.012999999
		thickness = 3
		controls = [
			{
				type = frequency
				response = deform
				spectrumBand = 28
				responseFunc = log10
				DeformScale = 15
			}
			{
				type = frequency
				spectrumBand = 32
				response = greenModulation
				colorscale = 100
			}
			{
				type = frequency
				spectrumBand = 32
				response = blueModulation
				colorscale = 200
			}
		]
	}
	{
		type = circle
		Color = [
			0
			100
			200
			255
		]
		Pos = (0.51, 0.5, 0.0)
		radius = 0.015999999
		thickness = 2
		controls = [
			{
				type = waveform
				response = radiusScale
				radiusscalemod = 10
			}
			{
				type = frequency
				spectrumBand = 8
				response = redModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 32
				response = greenModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 32
				response = blueModulation
				colorscale = 200
			}
		]
	}
	{
		type = circle
		Color = [
			55
			55
			255
			255
		]
		Pos = (0.52, 0.5, 0.0)
		radius = 0.01
		thickness = 3
	}
	{
		type = line
		Color = [
			150
			230
			250
			255
		]
		Pos = (0.5, 0.5, 0.0)
		length = 0.375
		angularVel = 0.1
		controls = [
			{
				type = frequency
				response = deform
				spectrumBand = 48
				responseFunc = sinLog10
				DeformScale = 15
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.05
		scale = (0.9919999, -0.99099994)
		Color = [
			5
			10
			15
			55
		]
		BlendMode = add
	}
]
og_lazerz = [
	{
		type = blendPrev
		angularVel = 0
		scale = (-1.1, 1.01)
		Color = [
			255
			255
			255
			255
		]
		BlendMode = blend
	}
	{
		type = line
		Color = [
			0
			0
			0
			255
		]
		Pos = (0.0, 0.45000002, 0.0)
		length = 1
		thickness = 2
		angularVel = 0.01
		controls = [
			{
				type = frequency
				response = lengthScale
				spectrumBand = 18
				responseFunc = sinLog10
				lengthscalemod = 10
			}
			{
				type = frequency
				spectrumBand = 8
				response = redModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 32
				response = greenModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 60
				response = blueModulation
				colorscale = 200
			}
		]
	}
	{
		type = line
		Color = [
			0
			0
			0
			255
		]
		Pos = (1.0, 0.55, 0.0)
		length = 1
		thickness = 2
		angularVel = 0.1
		controls = [
			{
				type = frequency
				response = lengthScale
				spectrumBand = 18
				responseFunc = sinLog10
				lengthscalemod = 10
			}
			{
				type = frequency
				spectrumBand = 8
				response = redModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 32
				response = greenModulation
				colorscale = 200
			}
			{
				type = frequency
				spectrumBand = 60
				response = blueModulation
				colorscale = 200
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.0
		scale = (1.01, -1.01)
		Color = [
			50
			50
			50
			20
		]
		BlendMode = add
	}
	{
		type = blendPrev
		angularVel = 0.0
		scale = (0.98999995, 1.2)
		Color = [
			100
			10
			10
			20
		]
		BlendMode = sub
	}
]
og_preset_10 = [
	{
		type = blendPrev
		angularVel = 0.1
		scale = (-1.0, 1.0)
		Color = [
			255
			255
			255
			255
		]
		BlendMode = blend
	}
	{
		type = line
		Color = [
			250
			200
			50
			255
		]
		Pos = (0.5, 0.75, 0.0)
		length = 1
		thickness = 2
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				spectrumBand = 18
				responseFunc = log10
				DeformScale = 20
			}
		]
	}
	{
		type = line
		Color = [
			250
			100
			50
			255
		]
		Pos = (0.5, 0.15, 0.0)
		length = 1
		thickness = 2
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				spectrumBand = 18
				responseFunc = sinLog10
				DeformScale = 20
			}
		]
	}
	{
		type = line
		Color = [
			250
			200
			250
			255
		]
		Pos = (0.5, 0.05, 0.0)
		length = 1
		thickness = 2
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				spectrumBand = 18
				responseFunc = sinLog10
				DeformScale = 0
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.0
		scale = (-1.2, 1.2)
		Color = [
			100
			100
			110
			160
		]
		BlendMode = add
	}
	{
		type = blendPrev
		angularVel = 0.1
		scale = (1.5, 1.0)
		Color = [
			110
			100
			100
			118
		]
		BlendMode = sub
	}
]
og_psychoholic = [
	{
		type = blendPrev
		angularVel = 0.01
		scale = (-1.0, 1.0)
		Color = [
			250
			250
			250
			255
		]
		BlendMode = blend
	}
	{
		type = line
		Color = [
			250
			200
			50
			255
		]
		Pos = (0.5, 0.75, 0.0)
		length = 1
		thickness = 2
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				spectrumBand = 18
				responseFunc = log10
				DeformScale = 20
			}
		]
	}
	{
		type = line
		Color = [
			250
			100
			50
			255
		]
		Pos = (0.5, 0.15, 0.0)
		length = 1
		thickness = 2
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				spectrumBand = 18
				responseFunc = sinLog10
				DeformScale = 20
			}
		]
	}
	{
		type = line
		Color = [
			250
			200
			250
			255
		]
		Pos = (0.5, 0.05, 0.0)
		length = 1
		thickness = 2
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				spectrumBand = 18
				responseFunc = sinLog10
				DeformScale = 0
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.0
		scale = (-1.2, 1.2)
		Color = [
			100
			100
			110
			160
		]
		BlendMode = add
	}
	{
		type = blendPrev
		angularVel = 0.1
		scale = (1.5, 1.0)
		Color = [
			110
			100
			100
			118
		]
		BlendMode = sub
	}
]
og_Koolaidoscope = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (1.0, 1.0)
		Color = [
			250
			250
			250
			255
		]
		BlendMode = blend
	}
	{
		type = line
		Color = [
			250
			200
			50
			255
		]
		Pos = (0.5, 0.75, 0.0)
		length = 1
		thickness = 2
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				spectrumBand = 18
				responseFunc = log10
				DeformScale = 20
			}
		]
	}
	{
		type = line
		Color = [
			250
			100
			50
			255
		]
		Pos = (0.5, 0.15, 0.0)
		length = 1
		thickness = 2
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				spectrumBand = 18
				responseFunc = sinLog10
				DeformScale = 20
			}
		]
	}
	{
		type = line
		Color = [
			250
			200
			250
			255
		]
		Pos = (0.5, 0.05, 0.0)
		length = 1
		thickness = 2
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				spectrumBand = 18
				responseFunc = sinLog10
				DeformScale = 0
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.0
		scale = (-1.2, 1.2)
		Color = [
			100
			100
			110
			160
		]
		BlendMode = add
	}
	{
		type = blendPrev
		angularVel = 0.1
		scale = (1.5, 1.0)
		Color = [
			110
			100
			100
			118
		]
		BlendMode = sub
	}
]
og_EventHorizon = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (1.0, 1.0)
		Color = [
			250
			250
			250
			255
		]
		BlendMode = blend
	}
	{
		type = line
		Color = [
			250
			200
			50
			255
		]
		Pos = (0.5, 0.75, 0.0)
		length = 1
		thickness = 2
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				spectrumBand = 18
				responseFunc = log10
				DeformScale = 20
			}
		]
	}
	{
		type = line
		Color = [
			250
			100
			50
			255
		]
		Pos = (0.5, 0.15, 0.0)
		length = 1
		thickness = 2
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				spectrumBand = 18
				responseFunc = sinLog10
				DeformScale = 20
			}
		]
	}
	{
		type = line
		Color = [
			250
			200
			250
			255
		]
		Pos = (0.5, 0.05, 0.0)
		length = 1
		thickness = 2
		angularVel = 0
		controls = [
			{
				type = frequency
				response = deform
				spectrumBand = 18
				responseFunc = sinLog10
				DeformScale = 0
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.0
		scale = (-1.2, 1.2)
		Color = [
			100
			100
			110
			20
		]
		BlendMode = add
	}
	{
		type = blendPrev
		angularVel = 10
		scale = (0.569, 0.2569)
		Color = [
			110
			100
			100
			18
		]
		BlendMode = sub
	}
]
og_preset_circleDeform = [
	{
		type = blendPrev
		angularVel = 0.01
		scale = (0.98999995, 1.0124999)
		Color = [
			250
			250
			250
			255
		]
		BlendMode = blend
		nonUniformScale
	}
	{
		type = circle
		Color = [
			50
			250
			250
			255
		]
		Pos = (0.5, 0.5, 0.0)
		radius = 0.125
		controls = [
			{
				type = waveform
				response = deform
				DeformScale = 140.0
			}
			{
				type = frequency
				response = radiusScale
				responseFunc = sinLog10
				radiusscalemod = 0.05
				spectrumBand = 20
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		Color = [
			250
			250
			50
			255
		]
		radius = 0.1
		controls = [
			{
				type = waveform
				response = deform
				DeformScale = 120.0
			}
			{
				type = frequency
				response = radiusScale
				responseFunc = sinLog10
				radiusscalemod = 0.01
				spectrumBand = 12
			}
		]
	}
	{
		type = circle
		Pos = (0.5, 0.5, 0.0)
		Color = [
			250
			50
			250
			255
		]
		radius = 0.11
		controls = [
			{
				type = waveform
				response = deform
				DeformScale = 120.0
			}
			{
				type = frequency
				response = radiusScale
				responseFunc = sinLog10
				radiusscalemod = 0.01
				spectrumBand = 48
			}
		]
	}
]
og_preset_2 = [
	{
		type = blendPrev
		angularVel = 0.0
		scale = (0.99899995, 0.99899995)
		Color = [
			255
			255
			255
			255
		]
		BlendMode = blend
	}
	{
		type = blendPrev
		angularVel = 0.0
		scale = (0.98999995, 0.98999995)
		Color = [
			204
			254
			254
			255
		]
		BlendMode = blend
	}
	{
		type = line
		Color = [
			147
			60
			255
			255
		]
		Pos = (0.5, 0.5, 0.0)
		length = 0.4
		angularVel = 0.0
		controls = [
			{
				type = frequency
				response = deform
				spectrumBand = 48
				responseFunc = log10
				DeformScale = 20
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.9
		scale = (-1.01, 1.01)
		Color = [
			254
			254
			254
			254
		]
		BlendMode = blend
	}
]
og_Love = [
	{
		type = blendPrev
		angularVel = 0
		scale = (-0.98999995, -0.98999995)
		Color = [
			255
			254
			254
			255
		]
		BlendMode = blend
	}
	{
		type = circle
		Color = [
			10
			0
			0
			255
		]
		Pos = (0.5, 0.45000002, 0.0)
		radius = 0.03
		thickness = 3
		controls = [
			{
				type = waveform
				response = deform
				responseFunc = log10
				DeformScale = 50.1
			}
		]
	}
	{
		type = circle
		Color = [
			0
			0
			0
			255
		]
		Pos = (0.51, 0.5, 0.0)
		radius = 0.06
		thickness = 3
	}
	{
		type = circle
		Color = [
			255
			155
			255
			255
		]
		Pos = (0.52, 0.5, 0.0)
		radius = 0.03
		thickness = 3
		controls = [
			{
				type = waveform
				response = deform
				responseFunc = log10
				DeformScale = 100.1
			}
		]
	}
	{
		type = line
		Color = [
			250
			200
			250
			255
		]
		Pos = (0.5, 0.55, 0.0)
		length = 0.75
		angularVel = 0.0
		controls = [
			{
				type = waveform
				response = deform
				responseFunc = log10
				DeformScale = 10.1
			}
		]
	}
	{
		type = blendPrev
		angularVel = 0.0
		scale = (-0.9919999, 0.99099994)
		Color = [
			5
			5
			5
			55
		]
		BlendMode = add
	}
]
