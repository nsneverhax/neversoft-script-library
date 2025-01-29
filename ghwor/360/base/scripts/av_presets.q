av_test_profile = {
	avpreset = [
		$og_bluephoenix
		$og_notehitcircles_a
	]
	fxParam = $Default_TOD_Manager
}

script og_add_visualizer 
	if screenFX_FXInstanceExists \{viewport = bg_viewport
			Name = avfx01}
		ScreenFX_ClearFXInstances \{viewport = bg_viewport}
	endif
	Wait \{1
		Frame}
	ScreenFX_AddFXInstance \{viewport = bg_viewport
		Name = avfx01
		scefName = avfx01
		Type = audiovisualize
		On = 1
		primitives = $og_frequency_clouds_c}
	ScreenFX_AddFXInstance \{viewport = bg_viewport
		Name = avfx_bloom01
		scefName = avfx_bloom01
		Type = Bloom2
		On = 1
		MaterialFilter = 0
		fullscreen = 1
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
		Saturation = 1.0
		equation = eq2}
endscript

script og_remove_visualizer 
	screenFX_FXInstanceExists \{viewport = bg_viewport
		Name = avfx01}
	ScreenFX_ClearFXInstances \{viewport = bg_viewport}
endscript
og_tunnelizertoo = [
	{
		Type = blendprev
		angularvel = 0.1
		Scale = (-1.1, -1.1)
		Color = [
			254
			254
			254
			250
		]
		BlendMode = blend
	}
	{
		Type = line
		Pos = (0.5, 0.05, 0.0)
		Color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 10000
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.1, 0.0)
		Color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.15, 0.0)
		Color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.2, 0.0)
		Color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 40
				response = bluemodulation
				colorscale = 1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 40
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.25, 0.0)
		Color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 50
				response = bluemodulation
				colorscale = 1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 50
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.3, 0.0)
		Color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 60
				response = bluemodulation
				colorscale = 1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.01
		Scale = (1.01, 1.01)
		Color = [
			254
			154
			54
			20
		]
		BlendMode = add
	}
]
og_tunnelizer = [
	{
		Type = blendprev
		angularvel = 0.1
		Scale = (-1.0, -1.0)
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
		Type = line
		Pos = (0.5, 0.05, 0.0)
		Color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 10000
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.1, 0.0)
		Color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.15, 0.0)
		Color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.2, 0.0)
		Color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 40
				response = bluemodulation
				colorscale = 1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 40
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.25, 0.0)
		Color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 50
				response = bluemodulation
				colorscale = 1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 50
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.3, 0.0)
		Color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 60
				response = bluemodulation
				colorscale = 1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (1.01, 0.97999996)
		Color = [
			80
			80
			80
			25
		]
		BlendMode = add
	}
]
og_testbed = [
	{
		Type = blendprev
		angularvel = 0.1
		Scale = (-1.0, -1.0)
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
				Type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
			{
				Type = frequency_history
				spectrumband = 2
				response = offsety
				scalemod = 1
			}
			{
				Type = frequency
				spectrumband = 5
				response = scalex
				respounsefunc = sinlog10
				scalemod = -5
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = add
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 5000
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
]
og_bird = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (-1.0, 1.0)
		offset = (0.0, -0.019499999)
		Color = [
			254
			254
			254
			255
		]
		angle = 0
		BlendMode = blend
		nonuniformscale
		controls = [
			{
				Type = frequency_history
				spectrumband = 50
				response = offsety
				scalemod = 1
			}
			{
				Type = frequency
				spectrumband = 5
				response = scalex
				respounsefunc = sinlog10
				scalemod = -0.5
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = add
		controls = [
			{
				Type = frequency
				spectrumband = 5
				response = deform
				deformscale = 5000
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0
		angle = -0.11
		Scale = (1.0, 1.0)
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
				Type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = 80
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.0
		angle = 1
		Scale = (0.90999997, 1.01)
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
og_slinky = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (-1.0, 1.0)
		offset = (0.0, -0.0075000003)
		Color = [
			254
			254
			254
			255
		]
		angle = 0
		BlendMode = add
		nonuniformscale
		controls = [
			{
				Type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
			{
				Type = frequency_history
				spectrumband = 5
				response = offsety
				scalemod = 0.5
			}
			{
				Type = frequency
				spectrumband = 5
				response = scalex
				scalemod = -0.5
			}
		]
	}
	{
		Type = circle
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
				Type = frequency_history
				response = radiusscale
				spectrumband = 16
				responsefunc = log10
				radiusscalemod = 0.1
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = add
		controls = [
			{
				Type = frequency
				spectrumband = 5
				response = deform
				deformscale = 5000
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
]
og_spectrum = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (0.98999995, -1.1)
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
		Type = circle
		Pos = (0.3, 0.5, 0.0)
		radius = 0.016499998
		Color = [
			90
			0
			120
			250
		]
		thickness = 30
		angularvel = 0.1
		controls = [
			{
				Type = notehit
				Player = 1
				spectrumband = 10
				response = bluemodulation
				colorscale = 160
			}
			{
				Type = notehit
				Player = 1
				spectrumband = 20
				response = redmodulation
				colorscale = 180
			}
			{
				Type = notehit
				Player = 1
				spectrumband = 30
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = frequency
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.09
				spectrumband = 30
			}
		]
	}
	{
		Type = circle
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
				Type = notehit
				Player = 2
				spectrumband = 20
				response = redmodulation
				colorscale = 1
			}
			{
				Type = notehit
				Player = 2
				spectrumband = 30
				response = greenmodulation
				colorscale = 1
			}
			{
				Type = notehit
				Player = 2
				spectrumband = 10
				response = bluemodulation
				colorscale = 1
			}
			{
				Type = frequency
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.09
				spectrumband = 30
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 40
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 40
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 40
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 50
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 50
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 50
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 60
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 60
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (0.9, 1.9)
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
		Type = blendprev
		angularvel = 0.1
		Scale = (-0.90999997, -1.01)
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
				Type = beaton
				spectrumband = 10
				response = angularvelmod
				velscale = 1000
			}
		]
	}
]
og_spectrum3d_half = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (-1.0, 1.0)
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
				Type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.8, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 15.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 56
				response = lengthscale
				lengthscalemod = 200
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			100
			0
			0
			155
		]
		length = -0.5
		thickness = 5
		angularvel = 0
		angle = 1.5707
		BlendMode = add
		controls = [
			{
				Type = meandbs_history
				spectrumband = 5
				response = deform
				deformscale = 1000
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = add
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 5000
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0
		angle = 1
		Scale = (1.0, 1.0)
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
				Type = beaton
				spectrumband = 10
				response = angularvelmod
				velscale = 1000
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.1
		Scale = (-0.90999997, -1.01)
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
				Type = beaton
				spectrumband = 10
				response = angularvelmod
				velscale = 1000
			}
		]
	}
]
og_strobeybusiness = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (-1.0, 1.0)
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
				Type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.8, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 15.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 56
				response = lengthscale
				lengthscalemod = 200
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			100
			0
			0
			155
		]
		length = -0.5
		thickness = 5
		angularvel = 0
		angle = 1.5707
		BlendMode = add
		controls = [
			{
				Type = meandbs_history
				spectrumband = 5
				response = deform
				deformscale = 1000
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = add
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 5000
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0
		angle = 1
		Scale = (1.0, 1.0)
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
				Type = beaton
				spectrumband = 10
				response = angularvelmod
				velscale = 1000
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.1
		Scale = (-0.90999997, -1.01)
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
				Type = beaton
				spectrumband = 10
				response = angularvelmod
				velscale = 1000
			}
		]
	}
]
og_risinglandscape = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (-1.0, 1.0)
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
				Type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.8, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 15.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 56
				response = lengthscale
				lengthscalemod = 200
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			100
			0
			0
			155
		]
		length = -0.5
		thickness = 5
		angularvel = 0
		angle = 1.5707
		BlendMode = add
		controls = [
			{
				Type = meandbs_history
				spectrumband = 5
				response = deform
				deformscale = 1000
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = add
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 5000
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0
		angle = 1
		Scale = (1.0, 1.0)
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
og_fullrotationamped = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (1.0, 1.0199)
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
				Type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 50
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = 10
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = lengthscale
				lengthscalemod = -100
			}
		]
	}
	{
		Type = line
		Pos = (1.0, 0.5, 0.0)
		Color = [
			100
			0
			0
			155
		]
		length = 1
		thickness = 10
		angularvel = 0
		angle = 0
		BlendMode = add
		controls = [
			{
				Type = meandbs_history
				spectrumband = 5
				response = deform
				deformscale = 500
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = add
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 3500
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		Type = blendprev
		angularvel = -1.1
		angle = 1
		Scale = (0.98999995, 0.9)
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
				Type = beaton
				spectrumband = 10
				response = angularvelmod
				velscale = 1000
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.1
		Scale = (-0.90999997, -1.01)
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
				Type = beaton
				spectrumband = 10
				response = angularvelmod
				velscale = 1000
			}
		]
	}
]
og_fullrotation = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (1.1, 1.0)
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
				Type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 50
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = 10
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = lengthscale
				lengthscalemod = -100
			}
		]
	}
	{
		Type = line
		Pos = (1.0, 0.5, 0.0)
		Color = [
			100
			0
			0
			155
		]
		length = 1
		thickness = 10
		angularvel = 0
		angle = 0
		BlendMode = add
		controls = [
			{
				Type = meandbs_history
				spectrumband = 5
				response = deform
				deformscale = 500
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = add
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 3500
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		Type = blendprev
		angularvel = -1.1
		angle = 1
		Scale = (0.98999995, 0.9)
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
				Type = beaton
				spectrumband = 10
				response = angularvelmod
				velscale = 1000
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.1
		Scale = (-0.90999997, -1.01)
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
				Type = beaton
				spectrumband = 10
				response = angularvelmod
				velscale = 1000
			}
		]
	}
]
og_spintowin = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (1.1, -1.0)
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
				Type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 50
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = 10
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = lengthscale
				lengthscalemod = -100
			}
		]
	}
	{
		Type = line
		Pos = (1.0, 0.5, 0.0)
		Color = [
			100
			0
			0
			155
		]
		length = 1
		thickness = 10
		angularvel = 0
		angle = 0
		BlendMode = add
		controls = [
			{
				Type = meandbs_history
				spectrumband = 5
				response = deform
				deformscale = 500
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = add
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 3500
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		Type = blendprev
		angularvel = -1.1
		angle = 1
		Scale = (0.98999995, 0.9)
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
				Type = beaton
				spectrumband = 10
				response = angularvelmod
				velscale = 1000
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.1
		Scale = (-0.90999997, -1.01)
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
				Type = beaton
				spectrumband = 10
				response = angularvelmod
				velscale = 1000
			}
		]
	}
]
og_scarfmangle = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (1.1, -1.0)
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
				Type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 50
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = 10
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = lengthscale
				lengthscalemod = -100
			}
		]
	}
	{
		Type = line
		Pos = (1.0, 0.5, 0.0)
		Color = [
			100
			0
			0
			155
		]
		length = 1
		thickness = 10
		angularvel = 0
		angle = 0
		BlendMode = add
		controls = [
			{
				Type = meandbs_history
				spectrumband = 5
				response = deform
				deformscale = 500
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = add
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 3500
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.0
		angle = 1
		Scale = (0.98999995, 0.9)
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
		Type = blendprev
		angularvel = 0.1
		Scale = (-0.90999997, -1.01)
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
				Type = beaton
				spectrumband = 10
				response = angularvelmod
				velscale = 1000
			}
		]
	}
]
og_rightdominant = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (1.1, -1.0)
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
				Type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 50
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = 10
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = lengthscale
				lengthscalemod = -100
			}
		]
	}
	{
		Type = line
		Pos = (1.0, 0.5, 0.0)
		Color = [
			100
			0
			0
			155
		]
		length = 1
		thickness = 10
		angularvel = 0
		angle = 0
		BlendMode = add
		controls = [
			{
				Type = meandbs_history
				spectrumband = 5
				response = deform
				deformscale = 500
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = add
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 3500
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
]
og_colorsucker = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (-1.0, 1.0)
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
				Type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 50
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = 10
			}
			{
				Type = frequency_history
				spectrumband = 5
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			50
			30
			20
			155
		]
		length = 1
		thickness = 10
		angularvel = 0
		angle = 1.5707
		BlendMode = add
		controls = [
			{
				Type = meandbs_history
				spectrumband = 5
				response = deform
				deformscale = 500
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = add
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 3500
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (0.98999995, 0.9)
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
		Type = blendprev
		angularvel = 0.1
		Scale = (-0.90999997, -1.01)
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
				Type = beaton
				spectrumband = 10
				response = angularvelmod
				velscale = 1000
			}
		]
	}
]
og_colorsucker_h = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (1.0, -1.0)
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
				Type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 50
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = 10
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = lengthscale
				lengthscalemod = -100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			100
			0
			0
			155
		]
		length = 1
		thickness = 10
		angularvel = 0
		angle = 0
		BlendMode = add
		controls = [
			{
				Type = meandbs_history
				spectrumband = 5
				response = deform
				deformscale = 500
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = add
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 3500
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (0.98999995, 0.9)
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
		Type = blendprev
		angularvel = 0.1
		Scale = (-0.90999997, -1.01)
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
				Type = beaton
				spectrumband = 10
				response = angularvelmod
				velscale = 1000
			}
		]
	}
]
og_scarfturn = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (-1.01, -1.01)
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
				Type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 50
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = 10
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = lengthscale
				lengthscalemod = -100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			100
			0
			0
			155
		]
		length = 1
		thickness = 10
		angularvel = 0
		angle = 1.5707
		BlendMode = add
		controls = [
			{
				Type = meandbs_history
				spectrumband = 5
				response = deform
				deformscale = 500
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = add
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 3500
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (0.98999995, 0.9)
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
		Type = blendprev
		angularvel = 0.1
		Scale = (-0.90999997, -1.01)
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
				Type = beaton
				spectrumband = 10
				response = angularvelmod
				velscale = 1000
			}
		]
	}
]
og_scarfsymspin = [
	{
		Type = blendprev
		angularvel = 0.1
		Scale = (-1.01, -1.01)
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
				Type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 50
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = 10
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = lengthscale
				lengthscalemod = -100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			100
			0
			0
			155
		]
		length = 1
		thickness = 10
		angularvel = 0
		angle = 1.5707
		BlendMode = add
		controls = [
			{
				Type = meandbs_history
				spectrumband = 5
				response = deform
				deformscale = 500
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = add
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 3500
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (0.98999995, 0.9)
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
		Type = blendprev
		angularvel = 0.1
		Scale = (-0.90999997, -1.01)
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
				Type = beaton
				spectrumband = 10
				response = angularvelmod
				velscale = 1000
			}
		]
	}
]
og_scarfradial = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (-1.01, -1.01)
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
				Type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 50
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = 10
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = lengthscale
				lengthscalemod = -100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			100
			0
			0
			155
		]
		length = 1
		thickness = 10
		angularvel = 0
		angle = 1.5707
		BlendMode = add
		controls = [
			{
				Type = meandbs_history
				spectrumband = 5
				response = deform
				deformscale = 500
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = add
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 3500
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (0.98999995, 0.9)
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
		Type = blendprev
		angularvel = 0.1
		Scale = (-0.90999997, -1.01)
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
				Type = beaton
				spectrumband = 10
				response = angularvelmod
				velscale = 1000
			}
		]
	}
]
og_scarfsym = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (-1.01, -1.01)
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
				Type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 50
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = 10
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = lengthscale
				lengthscalemod = -100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			100
			0
			0
			155
		]
		length = 1
		thickness = 10
		angularvel = 0
		angle = 1.5707
		BlendMode = add
		controls = [
			{
				Type = meandbs_history
				spectrumband = 5
				response = deform
				deformscale = 500
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = add
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 3500
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (0.98999995, 0.9)
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
		Type = blendprev
		angularvel = 0.1
		Scale = (-0.90999997, -1.01)
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
				Type = beaton
				spectrumband = 10
				response = angularvelmod
				velscale = 1000
			}
		]
	}
]
og_scarf = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (1.01, 1.01)
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
				Type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 50
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = 10
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = lengthscale
				lengthscalemod = -100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			100
			0
			0
			155
		]
		length = 1
		thickness = 10
		angularvel = 0
		angle = 1.5707
		BlendMode = add
		controls = [
			{
				Type = meandbs_history
				spectrumband = 5
				response = deform
				deformscale = 500
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = add
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 3500
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (0.98999995, 0.9)
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
		Type = blendprev
		angularvel = 0.1
		Scale = (-0.90999997, -1.01)
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
				Type = beaton
				spectrumband = 10
				response = angularvelmod
				velscale = 1000
			}
		]
	}
]
og_basin = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (-1.01, 1.05)
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
				Type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 50
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = 10
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = lengthscale
				lengthscalemod = -100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			100
			0
			0
			155
		]
		length = 1
		thickness = 10
		angularvel = 0
		angle = 1.5707
		BlendMode = add
		controls = [
			{
				Type = meandbs_history
				spectrumband = 5
				response = deform
				deformscale = 500
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = add
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 1500
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
]
og_spectrum3d_gold = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (1.01, -1.05)
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
				Type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 50
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = 10
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = lengthscale
				lengthscalemod = -100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = add
		controls = [
			{
				Type = meandbs_history
				spectrumband = 5
				response = deform
				deformscale = 500
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = add
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 1500
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
]
og_spectrum3d_roybflip_out = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (-1.01, -1.05)
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
				Type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
			{
				Type = beaton
				spectrumband = 10
				response = angularvelmod
				fade = 0.1
				scalemod = 1
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = beaton
				fade = 0.1
				spectrumband = 10
				response = bluemodulation
				colorscale = 250
			}
			{
				Type = beaton
				spectrumband = 25
				response = redmodulation
				colorscale = 50
			}
			{
				Type = beaton
				spectrumband = 5
				response = lengthscale
				lengthscalemod = -100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = add
		controls = [
			{
				Type = meandbs_history
				spectrumband = 5
				response = deform
				deformscale = 600
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = add
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = -2500
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = add
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 2500
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = sub
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 2500
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = sub
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = -2500
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
]
og_spectrum3d_roybflip = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (-1.01, -1.025)
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
				Type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = beaton
				fade = 0.1
				spectrumband = 10
				response = bluemodulation
				colorscale = 250
			}
			{
				Type = beaton
				spectrumband = 25
				response = redmodulation
				colorscale = 50
			}
			{
				Type = beaton
				spectrumband = 5
				response = lengthscale
				lengthscalemod = -100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = add
		controls = [
			{
				Type = meandbs_history
				spectrumband = 5
				response = deform
				deformscale = 600
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = add
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = -2500
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = add
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 2500
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = sub
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 2500
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = sub
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = -2500
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (1.9, 1.9)
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
				Type = beaton
				spectrumband = 10
				response = alphamodulation
				fade = 0.1
				scalemod = 20
			}
		]
	}
]
og_spectrum3d_roybflip_a = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (-1.01, -1.05)
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
				Type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
			{
				Type = beaton
				spectrumband = 10
				response = alphamodulation
				fade = 0.1
				scalemod = 1
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = beaton
				fade = 0.1
				spectrumband = 10
				response = bluemodulation
				colorscale = 250
			}
			{
				Type = beaton
				spectrumband = 25
				response = redmodulation
				colorscale = 50
			}
			{
				Type = beaton
				spectrumband = 5
				response = lengthscale
				lengthscalemod = -100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = add
		controls = [
			{
				Type = meandbs_history
				spectrumband = 5
				response = deform
				deformscale = 600
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = add
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = -2500
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = add
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 2500
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = sub
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 2500
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = sub
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = -2500
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
]
og_spectrum3d_roybgrid = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (-0.95, 1.01)
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
				Type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = 10
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = lengthscale
				lengthscalemod = -100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = add
		controls = [
			{
				Type = frequency_history
				spectrumband = 5
				response = deform
				deformscale = 2000
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = 50
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = add
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 2500
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
]
og_spectrum3d_royb = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (-1.01, 1.0)
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
				Type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 50
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = 10
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = lengthscale
				lengthscalemod = -100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = add
		controls = [
			{
				Type = frequency_history
				spectrumband = 5
				response = deform
				deformscale = 2500
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = add
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 1000
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
]
og_spectrum3d_royb_a = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (-1.01, 1.0)
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
				Type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 50
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = 10
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = lengthscale
				lengthscalemod = -100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = add
		controls = [
			{
				Type = frequency_history
				spectrumband = 5
				response = deform
				deformscale = 2500
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = add
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 1000
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
]
og_spectrum3d_roybflip_simple = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (-1.01, 1.05)
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
				Type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
			{
				Type = beaton
				spectrumband = 10
				response = alphamodulation
				fade = 0.1
				scalemod = 1
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = add
		controls = [
			{
				Type = beaton
				fade = 0.01
				spectrumband = 5
				response = bluemodulation
				colorscale = 250
			}
			{
				Type = beaton
				fade = 0.01
				spectrumband = 25
				response = redmodulation
				colorscale = 50
			}
			{
				Type = frequency
				spectrumband = 5
				response = lengthscale
				scalemod = 30
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = add
		controls = [
			{
				Type = meandbs_history
				spectrumband = 5
				response = deform
				scalemod = 600
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = add
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = -2500
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
]
og_spectrum3d_roybflip_h = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (-1.01, -1.05)
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
				Type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 50
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = 10
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = lengthscale
				lengthscalemod = -100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = add
		controls = [
			{
				Type = meandbs_history
				spectrumband = 5
				response = deform
				deformscale = 2500
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = add
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 2500
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
]
og_spectrum3d_roybgrid_h = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (1.01, -1.1)
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
				Type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 50
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = 10
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = lengthscale
				lengthscalemod = -100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = add
		controls = [
			{
				Type = meandbs_history
				spectrumband = 5
				response = deform
				deformscale = 500
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = add
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 1500
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
]
og_spectrum3d_pbj = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (1.0, -1.0)
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
				Type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = meandbs_history
				spectrumband = 5
				response = bluemodulation
				colorscale = -100
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
			{
				Type = frequency_history
				spectrumband = 5
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
			{
				Type = meandbs_history
				spectrumband = 10
				response = greenmodulation
				colorscale = -90
			}
			{
				Type = frequency_history
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = meandbs_history
				spectrumband = 15
				response = bluemodulation
				colorscale = -130
			}
			{
				Type = meandbs_history
				spectrumband = 15
				response = greenmodulation
				colorscale = -150
			}
			{
				Type = frequency_history
				spectrumband = 15
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = meandbs_history
				spectrumband = 20
				response = bluemodulation
				colorscale = -70
			}
			{
				Type = meandbs_history
				spectrumband = 20
				response = greenmodulation
				colorscale = -100
			}
			{
				Type = frequency_history
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = meandbs_history
				spectrumband = 25
				response = bluemodulation
				colorscale = -100
			}
			{
				Type = meandbs_history
				spectrumband = 25
				response = greenmodulation
				colorscale = -200
			}
			{
				Type = frequency_history
				spectrumband = 25
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = meandbs_history
				spectrumband = 30
				response = bluemodulation
				colorscale = -200
			}
			{
				Type = meandbs_history
				spectrumband = 30
				response = greenmodulation
				colorscale = -100
			}
			{
				Type = frequency_history
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = add
		controls = [
			{
				Type = meandbs_history
				spectrumband = 5
				response = deform
				deformscale = 300
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.25, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularvel = 0.0
	}
	{
		Type = line
		Pos = (0.5, 0.35000002, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularvel = 0.0
	}
	{
		Type = line
		Pos = (0.5, 0.45000002, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularvel = 0.0
	}
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (0.9, 0.9)
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
		Type = blendprev
		angularvel = 0.1
		Scale = (-0.90999997, -1.01)
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
				Type = beaton
				spectrumband = 10
				response = angularvelmod
				velscale = 1000
			}
		]
	}
]
og_spectrum3d_gnr = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (1.0, -1.0)
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
				Type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = meandbs_history
				spectrumband = 5
				response = bluemodulation
				colorscale = -100
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = lengthscale
				lengthscalemod = -10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = meandbs_history
				spectrumband = 10
				response = bluemodulation
				colorscale = -80
			}
			{
				Type = meandbs_history
				spectrumband = 10
				response = greenmodulation
				colorscale = -90
			}
			{
				Type = meandbs_history
				spectrumband = 10
				response = lengthscale
				lengthscalemod = -100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = meandbs_history
				spectrumband = 15
				response = bluemodulation
				colorscale = -30
			}
			{
				Type = meandbs_history
				spectrumband = 15
				response = greenmodulation
				colorscale = -30
			}
			{
				Type = meandbs_history
				spectrumband = 15
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = meandbs_history
				spectrumband = 20
				response = bluemodulation
				colorscale = -70
			}
			{
				Type = meandbs_history
				spectrumband = 20
				response = greenmodulation
				colorscale = -100
			}
			{
				Type = meandbs_history
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = meandbs_history
				spectrumband = 25
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = meandbs_history
				spectrumband = 25
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = meandbs_history
				spectrumband = 25
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = meandbs_history
				spectrumband = 30
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = meandbs_history
				spectrumband = 30
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = meandbs_history
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		BlendMode = add
		controls = [
			{
				Type = meandbs_history
				spectrumband = 5
				response = deform
				deformscale = 500
			}
			{
				Type = meandbs_history
				spectrumband = 5
				response = greenmodulation
				colorscale = -50
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.25, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularvel = 0.0
	}
	{
		Type = line
		Pos = (0.5, 0.35000002, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularvel = 0.0
	}
	{
		Type = line
		Pos = (0.5, 0.45000002, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularvel = 0.0
	}
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (0.9, 0.9)
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
		Type = blendprev
		angularvel = 0.1
		Scale = (-0.90999997, -1.01)
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
				Type = beaton
				spectrumband = 10
				response = angularvelmod
				velscale = 1000
			}
		]
	}
]
og_bluerings = [
	{
		Type = blendprev
		offset = (0.0, 0.005)
		Scale = (0.98999995, 0.98999995)
		Color = [
			255
			255
			255
			254
		]
		angle = -0.0
		angularvel = 0.0
		BlendMode = blend
	}
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.01
		Color = [
			90
			0
			0
			50
		]
		thickness = 5
		angularvel = 0.0
		controls = [
			{
				Type = notehit
				Player = 1
				gemcolor = red
				response = bluemodulation
				colorscale = 160
			}
			{
				Type = notehit
				Player = 1
				gemcolor = red
				response = redmodulation
				colorscale = 180
			}
			{
				Type = notehit
				Player = 1
				gemcolor = red
				spectrumband = 30
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = notehit
				Player = 1
				gemcolor = red
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.05
				spectrumband = 30
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.75, 0.0)
		length = 0.001
		Color = [
			190
			50
			0
			255
		]
		thickness = 8.0
		angularvel = 0.0
		angle = 1.5707
		controls = [
			{
				Type = notehit
				Player = 1
				gemcolor = red
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = notehit
				Player = 1
				gemcolor = red
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = notehit
				Player = 1
				gemcolor = red
				response = lengthscale
				lengthscalemod = 10
			}
			{
				Type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 1
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.32500002, 0.0)
		radius = 0.015
		Color = [
			90
			0
			0
			1
		]
		thickness = 5
		angularvel = 0.0
		controls = [
			{
				Type = notehit
				Player = 1
				gemcolor = yellow
				response = bluemodulation
				colorscale = 160
			}
			{
				Type = notehit
				Player = 1
				gemcolor = yellow
				response = redmodulation
				colorscale = 180
			}
			{
				Type = notehit
				Player = 1
				gemcolor = yellow
				spectrumband = 30
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = notehit
				Player = 1
				gemcolor = yellow
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.05
				spectrumband = 30
			}
			{
				Type = frequency
				spectrumband = 10
				response = alphamodulation
				colorscale = 255
			}
		]
	}
	{
		Type = line
		Pos = (0.3, 0.76, 0.0)
		length = 0.001
		Color = [
			190
			50
			0
			255
		]
		thickness = 8.0
		angularvel = 0.0
		angle = 1.5707
		controls = [
			{
				Type = notehit
				Player = 1
				gemcolor = yellow
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = notehit
				Player = 1
				gemcolor = yellow
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = notehit
				Player = 1
				gemcolor = yellow
				response = lengthscale
				lengthscalemod = 10
			}
			{
				Type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 1
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.25, 0.0)
		radius = 0.02
		Color = [
			190
			0
			0
			0
		]
		thickness = 3
		angularvel = 0.0
		controls = [
			{
				Type = notehit
				Player = 1
				gemcolor = blue
				response = bluemodulation
				colorscale = 160
			}
			{
				Type = notehit
				Player = 1
				gemcolor = blue
				response = redmodulation
				colorscale = 180
			}
			{
				Type = notehit
				Player = 1
				gemcolor = blue
				spectrumband = 30
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = notehit
				Player = 1
				gemcolor = blue
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.05
				spectrumband = 30
			}
			{
				Type = frequency
				spectrumband = 10
				response = alphamodulation
				colorscale = 160
			}
		]
	}
	{
		Type = line
		Pos = (0.3, 0.77, 0.0)
		length = 0.001
		Color = [
			190
			50
			0
			255
		]
		thickness = 8.0
		angularvel = 0.0
		angle = 1.5707
		controls = [
			{
				Type = notehit
				Player = 1
				gemcolor = yellow
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = notehit
				Player = 1
				gemcolor = blue
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = notehit
				Player = 1
				gemcolor = blue
				response = lengthscale
				lengthscalemod = 10
			}
			{
				Type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 1
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.32500002, 0.0)
		radius = 0.025
		Color = [
			190
			0
			0
			0
		]
		thickness = 3
		angularvel = 0.0
		controls = [
			{
				Type = notehit
				Player = 1
				gemcolor = orange
				response = bluemodulation
				colorscale = 160
			}
			{
				Type = notehit
				Player = 1
				gemcolor = orange
				response = redmodulation
				colorscale = 180
			}
			{
				Type = notehit
				Player = 1
				gemcolor = orange
				spectrumband = 30
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = notehit
				Player = 1
				gemcolor = orange
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.01
				spectrumband = 30
			}
			{
				Type = frequency
				spectrumband = 30
				response = alphamodulation
				colorscale = 160
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.03
		Color = [
			190
			0
			0
			0
		]
		thickness = 3
		angularvel = 0.0
		controls = [
			{
				Type = notehit
				Player = 1
				gemcolor = green
				response = bluemodulation
				colorscale = 160
			}
			{
				Type = notehit
				Player = 1
				gemcolor = green
				response = redmodulation
				colorscale = 180
			}
			{
				Type = notehit
				Player = 1
				gemcolor = green
				spectrumband = 30
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = notehit
				Player = 1
				gemcolor = green
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.01
				spectrumband = 30
			}
			{
				Type = frequency
				spectrumband = 30
				response = alphamodulation
				colorscale = 160
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 1.5707
		controls = [
			{
				Type = notehit
				Player = 1
				gemcolor = green
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = notehit
				Player = 1
				gemcolor = green
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = notehit
				Player = 1
				gemcolor = green
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.35000002, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				Type = notehit
				Player = 1
				gemcolor = red
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = notehit
				Player = 1
				gemcolor = red
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = notehit
				Player = 1
				gemcolor = red
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.45000002, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				Type = notehit
				Player = 1
				gemcolor = blue
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = notehit
				Player = 1
				gemcolor = blue
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = notehit
				Player = 1
				gemcolor = blue
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.55, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				Type = notehit
				Player = 1
				gemcolor = orange
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = notehit
				Player = 1
				gemcolor = orange
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = notehit
				Player = 1
				gemcolor = orange
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.65000004, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 42
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.75, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 49
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (1.0, 0.9)
		Color = [
			255
			255
			255
			10
		]
		angle = 0.0
		angularvel = 1
		BlendMode = add
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (2.0, 2.0)
		Color = [
			255
			51
			53
			5
		]
		angle = 0
		angularvel = 1.1
		BlendMode = subtract
	}
]
og_singleplayercirclesarcspiral = [
	{
		Type = blendprev
		offset = (0.0, 0.005)
		Scale = (0.98999995, 0.98999995)
		Color = [
			255
			255
			255
			254
		]
		angle = -0.0
		angularvel = 0.0
		BlendMode = blend
	}
	{
		Type = circle
		Pos = (0.1, 0.5, 0.0)
		radius = 0.016499998
		Color = [
			90
			0
			0
			50
		]
		thickness = 5
		angularvel = 0.0
		controls = [
			{
				Type = notehit
				Player = 1
				gemcolor = red
				response = bluemodulation
				colorscale = 160
			}
			{
				Type = notehit
				Player = 1
				gemcolor = red
				response = redmodulation
				colorscale = 180
			}
			{
				Type = notehit
				Player = 1
				gemcolor = red
				spectrumband = 30
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 30
				response = alphamodulation
				colorscale = 160
			}
			{
				Type = notehit
				Player = 1
				gemcolor = red
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 1
				spectrumband = 30
			}
		]
	}
	{
		Type = line
		Pos = (0.1, 0.5, 0.0)
		length = 0.001
		Color = [
			190
			50
			0
			255
		]
		thickness = 8.0
		angularvel = 0.0
		angle = 1.5707
		controls = [
			{
				Type = notehit
				Player = 1
				gemcolor = red
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = notehit
				Player = 1
				gemcolor = red
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = notehit
				Player = 1
				gemcolor = red
				response = lengthscale
				lengthscalemod = 10
			}
			{
				Type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 1
			}
		]
	}
	{
		Type = circle
		Pos = (0.3, 0.32500002, 0.0)
		radius = 0.016499998
		Color = [
			90
			0
			0
			1
		]
		thickness = 5
		angularvel = 0.0
		controls = [
			{
				Type = notehit
				Player = 1
				gemcolor = yellow
				response = bluemodulation
				colorscale = 160
			}
			{
				Type = notehit
				Player = 1
				gemcolor = yellow
				response = redmodulation
				colorscale = 180
			}
			{
				Type = notehit
				Player = 1
				gemcolor = yellow
				spectrumband = 30
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = notehit
				Player = 1
				gemcolor = yellow
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.05
				spectrumband = 30
			}
			{
				Type = frequency
				spectrumband = 10
				response = alphamodulation
				colorscale = 255
			}
		]
	}
	{
		Type = line
		Pos = (0.3, 0.32500002, 0.0)
		length = 0.001
		Color = [
			190
			50
			0
			255
		]
		thickness = 8.0
		angularvel = 0.0
		angle = 1.5707
		controls = [
			{
				Type = notehit
				Player = 1
				gemcolor = yellow
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = notehit
				Player = 1
				gemcolor = yellow
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = notehit
				Player = 1
				gemcolor = yellow
				response = lengthscale
				lengthscalemod = 10
			}
			{
				Type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 1
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.25, 0.0)
		radius = 0.016499998
		Color = [
			90
			0
			0
			250
		]
		thickness = 5
		angularvel = 0.0
		controls = [
			{
				Type = notehit
				Player = 1
				gemcolor = blue
				response = bluemodulation
				colorscale = 160
			}
			{
				Type = notehit
				Player = 1
				gemcolor = blue
				response = redmodulation
				colorscale = 180
			}
			{
				Type = notehit
				Player = 1
				gemcolor = blue
				spectrumband = 30
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = notehit
				Player = 1
				gemcolor = blue
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.05
				spectrumband = 30
			}
		]
	}
	{
		Type = circle
		Pos = (0.7, 0.32500002, 0.0)
		radius = 0.016499998
		Color = [
			90
			0
			0
			250
		]
		thickness = 5
		angularvel = 0.0
		controls = [
			{
				Type = notehit
				Player = 1
				gemcolor = orange
				response = bluemodulation
				colorscale = 160
			}
			{
				Type = notehit
				Player = 1
				gemcolor = orange
				response = redmodulation
				colorscale = 180
			}
			{
				Type = notehit
				Player = 1
				gemcolor = orange
				spectrumband = 30
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = notehit
				Player = 1
				gemcolor = orange
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.01
				spectrumband = 30
			}
		]
	}
	{
		Type = circle
		Pos = (0.9, 0.5, 0.0)
		radius = 0.016499998
		Color = [
			90
			0
			0
			250
		]
		thickness = 5
		angularvel = 0.0
		controls = [
			{
				Type = notehit
				Player = 1
				gemcolor = green
				response = bluemodulation
				colorscale = 160
			}
			{
				Type = notehit
				Player = 1
				gemcolor = ogreen
				response = redmodulation
				colorscale = 280
			}
			{
				Type = notehit
				Player = 1
				gemcolor = green
				spectrumband = 30
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = notehit
				Player = 1
				gemcolor = green
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 1
				spectrumband = 30
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 1.5707
		controls = [
			{
				Type = notehit
				Player = 1
				gemcolor = green
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = notehit
				Player = 1
				gemcolor = green
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = notehit
				Player = 1
				gemcolor = green
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.35000002, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				Type = notehit
				Player = 1
				gemcolor = red
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = notehit
				Player = 1
				gemcolor = red
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = notehit
				Player = 1
				gemcolor = red
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.45000002, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				Type = notehit
				Player = 1
				gemcolor = blue
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = notehit
				Player = 1
				gemcolor = blue
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = notehit
				Player = 1
				gemcolor = blue
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.55, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				Type = notehit
				Player = 1
				gemcolor = orange
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = notehit
				Player = 1
				gemcolor = orange
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = notehit
				Player = 1
				gemcolor = orange
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.65000004, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 42
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.75, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 49
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.85, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 56
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (1.0, 0.9)
		Color = [
			255
			255
			255
			10
		]
		angle = 0.0
		angularvel = 1
		BlendMode = add
	}
]
og_singleplayercircles = [
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (0.98999995, 0.98999995)
		Color = [
			255
			255
			255
			254
		]
		angle = -0.0
		angularvel = 0.0
		BlendMode = blend
	}
	{
		Type = circle
		Pos = (0.1, 0.5, 0.0)
		radius = 0.016499998
		Color = [
			90
			0
			0
			50
		]
		thickness = 5
		angularvel = 0.0
		controls = [
			{
				Type = notehit
				Player = 1
				gemcolor = red
				response = bluemodulation
				colorscale = 160
			}
			{
				Type = notehit
				Player = 1
				gemcolor = red
				response = redmodulation
				colorscale = 180
			}
			{
				Type = notehit
				Player = 1
				gemcolor = red
				spectrumband = 30
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 30
				response = alphamodulation
				colorscale = 160
			}
			{
				Type = notehit
				Player = 1
				gemcolor = red
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.01
				spectrumband = 30
			}
			{
				Type = maxdbs
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.1
				spectrumband = 30
			}
		]
	}
	{
		Type = line
		Pos = (0.1, 0.5, 0.0)
		length = 0.001
		Color = [
			190
			50
			0
			255
		]
		thickness = 8.0
		angularvel = 0.0
		angle = 1.5707
		controls = [
			{
				Type = notehit
				Player = 1
				gemcolor = red
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = notehit
				Player = 1
				gemcolor = red
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = notehit
				Player = 1
				gemcolor = red
				response = lengthscale
				lengthscalemod = 10
			}
			{
				Type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 1
			}
		]
	}
	{
		Type = circle
		Pos = (0.3, 0.32500002, 0.0)
		radius = 0.016499998
		Color = [
			90
			0
			0
			1
		]
		thickness = 5
		angularvel = 0.0
		controls = [
			{
				Type = notehit
				Player = 1
				gemcolor = yellow
				response = bluemodulation
				colorscale = 160
			}
			{
				Type = notehit
				Player = 1
				gemcolor = yellow
				response = redmodulation
				colorscale = 180
			}
			{
				Type = notehit
				Player = 1
				gemcolor = yellow
				spectrumband = 30
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = notehit
				Player = 1
				gemcolor = yellow
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.01
				spectrumband = 30
			}
			{
				Type = frequency
				spectrumband = 10
				response = alphamodulation
				colorscale = 255
			}
		]
	}
	{
		Type = line
		Pos = (0.3, 0.32500002, 0.0)
		length = 0.001
		Color = [
			190
			50
			0
			255
		]
		thickness = 8.0
		angularvel = 0.0
		angle = 1.5707
		controls = [
			{
				Type = notehit
				Player = 1
				gemcolor = yellow
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = notehit
				Player = 1
				gemcolor = yellow
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = notehit
				Player = 1
				gemcolor = yellow
				response = lengthscale
				lengthscalemod = 10
			}
			{
				Type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 1
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.25, 0.0)
		radius = 0.016499998
		Color = [
			90
			0
			0
			250
		]
		thickness = 5
		angularvel = 0.0
		controls = [
			{
				Type = notehit
				Player = 1
				gemcolor = blue
				response = bluemodulation
				colorscale = 160
			}
			{
				Type = notehit
				Player = 1
				gemcolor = blue
				response = redmodulation
				colorscale = 180
			}
			{
				Type = notehit
				Player = 1
				gemcolor = blue
				spectrumband = 30
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = notehit
				Player = 1
				gemcolor = blue
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.01
				spectrumband = 30
			}
		]
	}
	{
		Type = circle
		Pos = (0.7, 0.32500002, 0.0)
		radius = 0.016499998
		Color = [
			90
			0
			0
			250
		]
		thickness = 5
		angularvel = 0.0
		controls = [
			{
				Type = notehit
				Player = 1
				gemcolor = orange
				response = bluemodulation
				colorscale = 160
			}
			{
				Type = notehit
				Player = 1
				gemcolor = orange
				response = redmodulation
				colorscale = 180
			}
			{
				Type = notehit
				Player = 1
				gemcolor = orange
				spectrumband = 30
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = notehit
				Player = 1
				gemcolor = orange
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.01
				spectrumband = 30
			}
		]
	}
	{
		Type = circle
		Pos = (0.9, 0.5, 0.0)
		radius = 0.016499998
		Color = [
			90
			0
			0
			250
		]
		thickness = 5
		angularvel = 0.0
		controls = [
			{
				Type = notehit
				Player = 1
				gemcolor = green
				response = bluemodulation
				colorscale = 160
			}
			{
				Type = notehit
				Player = 1
				gemcolor = ogreen
				response = redmodulation
				colorscale = 180
			}
			{
				Type = notehit
				Player = 1
				gemcolor = green
				spectrumband = 30
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = notehit
				Player = 1
				gemcolor = green
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 1
				spectrumband = 30
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 1.5707
		controls = [
			{
				Type = notehit
				Player = 1
				gemcolor = green
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = notehit
				Player = 1
				gemcolor = green
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = notehit
				Player = 1
				gemcolor = green
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.35000002, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				Type = notehit
				Player = 1
				gemcolor = red
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = notehit
				Player = 1
				gemcolor = red
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = notehit
				Player = 1
				gemcolor = red
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.45000002, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				Type = notehit
				Player = 1
				gemcolor = blue
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = notehit
				Player = 1
				gemcolor = blue
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = notehit
				Player = 1
				gemcolor = blue
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.55, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				Type = notehit
				Player = 1
				gemcolor = orange
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = notehit
				Player = 1
				gemcolor = orange
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = notehit
				Player = 1
				gemcolor = orange
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.65000004, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 42
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.75, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 49
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.85, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 56
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (0.99899995, -4.991)
		Color = [
			255
			255
			255
			4
		]
		angle = 0.0
		angularvel = 0.0
		BlendMode = add
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (2.0, 2.0)
		Color = [
			255
			51
			53
			10
		]
		angle = 1.575
		angularvel = -1
		BlendMode = subtract
	}
]
og_purplestar = [
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (1.0, 1.0)
		Color = [
			218
			202
			205
			254
		]
		angle = 1.26
		angularvel = 0.0
		BlendMode = blend
	}
	{
		Type = line
		Pos = (0.35000002, 0.5, 0.0)
		length = 0.1
		Color = [
			200
			0
			200
			255
		]
		thickness = 10.0
		angularvel = 0.0
		angle = -1.26
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = redmodulation
				colorscale = 250
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 63
				response = lengthscale
				lengthscalemod = 250
			}
		]
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (5.0, 5.0)
		Color = [
			0
			0
			0
			0
		]
		angle = 0.0
		angularvel = 0.0
		BlendMode = add
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = redmodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 150
			}
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 250
			}
			{
				Type = frequency
				spectrumband = 10
				response = alphamodulation
				colorscale = 45
			}
		]
	}
]
og_bluelines = [
	{
		Type = blendprev
		offset = (0.0, 0.01)
		Scale = (0.98999995, 0.98999995)
		Color = [
			218
			202
			205
			254
		]
		angle = 0.015
		angularvel = 0.0
		BlendMode = blend
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = redmodulation
				colorscale = 250
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.15, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 63
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.25, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 56
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.35000002, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 49
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.45000002, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 42
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.55, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 35
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.65000004, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 28
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.75, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 21
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.85, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 14
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.95, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 7
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (1.0099, -0.99099994)
		Color = [
			255
			255
			255
			7
		]
		angle = -0.01
		angularvel = 0.0
		BlendMode = add
	}
]
og_energina = [
	{
		Type = blendprev
		offset = (0.0, -0.0)
		Scale = (-0.99149996, -1.1915001)
		Color = [
			218
			202
			205
			254
		]
		angle = -1.8
		angularvel = 0.0
		BlendMode = blend
		nonuniformscale
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = redmodulation
				colorscale = 250
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 24.5
				responsefunc = sinlog10
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 1.5707
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (0.98999995, 1.1)
		Color = [
			255
			255
			255
			29
		]
		angle = 0.01
		angularvel = 0.0
		BlendMode = add
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (2.0, 2.0)
		Color = [
			55
			251
			253
			38
		]
		angle = 0.01
		angularvel = -0.23
		BlendMode = subtract
	}
]
og_bluewavesstrobe = [
	{
		Type = blendprev
		offset = (0.0, -0.0)
		Scale = (-0.99149996, -1.1915001)
		Color = [
			218
			202
			205
			254
		]
		angle = -1.8
		angularvel = 0.0
		BlendMode = blend
		nonuniformscale
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = redmodulation
				colorscale = 250
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 24.5
				responsefunc = sinlog10
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 1.5707
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (0.98999995, 1.1)
		Color = [
			255
			255
			255
			29
		]
		angle = 0.01
		angularvel = 0.0
		BlendMode = add
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (2.0, 2.0)
		Color = [
			55
			251
			253
			38
		]
		angularvel = -0.23
		BlendMode = subtract
	}
]
og_wavesrotating = [
	{
		Type = blendprev
		offset = (0.0, -0.0)
		Scale = (-0.99149996, -1.1915001)
		Color = [
			218
			202
			205
			254
		]
		angle = 4.925
		angularvel = 0.01
		BlendMode = blend
		nonuniformscale
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = redmodulation
				colorscale = 250
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 24.5
				responsefunc = sinlog10
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 1.5707
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (0.98999995, 1.1)
		Color = [
			255
			255
			255
			29
		]
		angle = 0.01
		angularvel = 0.0
		BlendMode = add
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (2.0, 2.0)
		Color = [
			55
			251
			253
			38
		]
		angularvel = -0.23
		BlendMode = subtract
	}
]
og_redwavesin = [
	{
		Type = blendprev
		offset = (0.0, -0.0)
		Scale = (-0.99149996, -1.1915001)
		Color = [
			218
			202
			205
			254
		]
		angle = 4.925
		angularvel = 0.0
		BlendMode = blend
		nonuniformscale
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = redmodulation
				colorscale = 250
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 24.5
				responsefunc = sinlog10
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 1.5707
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (0.98999995, 1.1)
		Color = [
			255
			255
			255
			29
		]
		angle = 0.01
		angularvel = 0.0
		BlendMode = add
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (2.0, 2.0)
		Color = [
			55
			251
			253
			38
		]
		angularvel = -0.23
		BlendMode = subtract
	}
]
og_redwaves = [
	{
		Type = blendprev
		offset = (0.0, -0.0)
		Scale = (-1.15, -1.1915001)
		Color = [
			218
			202
			205
			254
		]
		angle = 4.925
		angularvel = 0.0
		BlendMode = blend
		nonuniformscale
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = redmodulation
				colorscale = 250
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 24.5
				responsefunc = sinlog10
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 1.5707
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (0.98999995, 1.1)
		Color = [
			255
			255
			255
			29
		]
		angle = 0.01
		angularvel = 0.0
		BlendMode = add
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (2.0, 2.0)
		Color = [
			55
			251
			253
			38
		]
		angularvel = -0.23
		BlendMode = subtract
	}
]
og_verticalbandsspectrum = [
	{
		Type = blendprev
		offset = (0.0, -0.0)
		Scale = (-1.15, -1.1915001)
		Color = [
			218
			202
			205
			254
		]
		angle = 4.925
		angularvel = 0.0
		BlendMode = blend
		nonuniformscale
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = redmodulation
				colorscale = 250
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 24.5
				responsefunc = sinlog10
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		angle = 1.5707
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (0.98999995, 1.1)
		Color = [
			255
			255
			255
			29
		]
		angle = 0.01
		angularvel = 0.0
		BlendMode = add
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (2.0, 2.0)
		Color = [
			255
			51
			63
			38
		]
		angularvel = -0.23
		BlendMode = subtract
	}
]
og_verticalbandsblue = [
	{
		Type = blendprev
		offset = (0.0, -0.0)
		Scale = (-1.15, -1.1915001)
		Color = [
			218
			202
			205
			254
		]
		angle = 4.925
		angularvel = 0.0
		BlendMode = blend
		nonuniformscale
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = redmodulation
				colorscale = 250
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 24.5
				responsefunc = sinlog10
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (0.98999995, 1.1)
		Color = [
			255
			255
			255
			29
		]
		angle = 0.01
		angularvel = 0.0
		BlendMode = add
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (2.0, 2.0)
		Color = [
			255
			51
			63
			38
		]
		angularvel = -0.23
		BlendMode = subtract
	}
]
og_colorwave = [
	{
		Type = blendprev
		offset = (0.0, -0.0)
		Scale = (-1.15, -1.1915001)
		Color = [
			218
			202
			205
			254
		]
		angle = 4.925
		angularvel = 0.0
		BlendMode = blend
		nonuniformscale
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = redmodulation
				colorscale = 250
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		length = 1.0
		Color = [
			255
			255
			255
			255
		]
		thickness = 1.0
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 24.5
				responsefunc = sinlog10
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (0.98999995, 1.0)
		Color = [
			255
			255
			255
			25
		]
		angularvel = 0.0
		BlendMode = add
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (1.0, 1.0)
		Color = [
			255
			51
			63
			38
		]
		angularvel = 0.5
		BlendMode = subtract
	}
]
og_bluewaves = [
	{
		Type = blendprev
		offset = (0.0, -0.0)
		Scale = (-1.15, -1.1915001)
		Color = [
			218
			252
			255
			254
		]
		angle = 4.8925004
		angularvel = 0.0
		BlendMode = blend
		nonuniformscale
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		length = 1.0
		Color = [
			255
			255
			255
			255
		]
		thickness = 1.0
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 24.5
				responsefunc = sinlog10
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (0.98999995, 1.0)
		Color = [
			255
			255
			255
			25
		]
		angularvel = 0.0
		BlendMode = add
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (1.0, 1.0)
		Color = [
			255
			51
			63
			38
		]
		angularvel = 0.5
		BlendMode = subtract
	}
]
og_bluetapestry = [
	{
		Type = blendprev
		offset = (0.0, -0.0)
		Scale = (1.15, -1.1915001)
		Color = [
			218
			252
			255
			254
		]
		angle = 4.925
		angularvel = 0.0
		BlendMode = blend
		nonuniformscale
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		length = 1.0
		Color = [
			255
			255
			255
			255
		]
		thickness = 1.0
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 24.5
				responsefunc = sinlog10
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = circle
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
				Type = frequency
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.09
				spectrumband = 20
			}
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 25
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 50
			}
		]
	}
	{
		Type = circle
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
				Type = frequency
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.09
				spectrumband = 30
			}
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 50
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
		]
	}
	{
		Type = circle
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
				Type = frequency
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.09
				spectrumband = 40
			}
			{
				Type = frequency
				spectrumband = 10
				response = redmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 300
			}
		]
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (0.98999995, 1.0)
		Color = [
			255
			255
			255
			25
		]
		angularvel = 0.0
		BlendMode = add
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (1.0, 1.0)
		Color = [
			255
			51
			63
			38
		]
		angularvel = 0.5
		BlendMode = subtract
	}
]
og_blueelectric = [
	{
		Type = blendprev
		offset = (0.0, 0.02)
		Scale = (1.015, -1.01)
		Color = [
			218
			252
			255
			254
		]
		angularvel = 0.0
		angle = 0.0
		BlendMode = blend
		nonuniformscale
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		length = 1.0
		Color = [
			255
			255
			255
			255
		]
		thickness = 3.0
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 24.5
				responsefunc = sinlog10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 30
				response = redmodulation
				colorscale = 300
			}
			{
				Type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 500
			}
			{
				Type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 400
			}
			{
				Type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 30
				response = redmodulation
				colorscale = 300
			}
			{
				Type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 500
			}
			{
				Type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 400
			}
			{
				Type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (0.98999995, 1.1)
		Color = [
			255
			255
			255
			25
		]
		angle = 0.0
		angularvel = 0.1
		BlendMode = add
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (1.0, 1.0)
		Color = [
			255
			51
			63
			38
		]
		angularvel = 0.5
		BlendMode = subtract
	}
]
og_latticediagonal = [
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (1.01, 1.01)
		Color = [
			238
			232
			245
			255
		]
		angle = 0.05
		angularvel = 0.0
		BlendMode = blend
		nonuniformscale
		controls = [
			{
				Type = frequency
				spectrumband = 30
				response = redmodulation
				colorscale = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 24.5
				responsefunc = sinlog10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 24.5
				responsefunc = sinlog10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 30
				response = redmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 20
				response = redmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 20
				response = redmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 20
				response = redmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
]
og_hyper = [
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (1.0, 1.0)
		Color = [
			228
			222
			235
			254
		]
		angularvel = 0.01
		BlendMode = blend
		nonuniformscale
	}
	{
		Type = line
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
		angularvel = 0.1
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 24.5
				responsefunc = sinlog10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 30
				response = redmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 20
				response = redmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 20
				response = redmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 20
				response = redmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (20.0, 2.0)
		Color = [
			255
			255
			255
			35
		]
		angularvel = 0.5
		BlendMode = subtract
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (1.1119901, 1.1)
		Color = [
			255
			255
			255
			42
		]
		angularvel = 0.01
		BlendMode = add
	}
]
og_tiedye = [
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (1.0, 1.0)
		Color = [
			228
			222
			235
			254
		]
		angularvel = 0.0
		BlendMode = blend
		nonuniformscale
	}
	{
		Type = line
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
		angularvel = 0.1
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 24.5
				responsefunc = sinlog10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 30
				response = redmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 20
				response = redmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 20
				response = redmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 20
				response = redmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (20.0, 2.0)
		Color = [
			255
			255
			255
			35
		]
		angularvel = 0.5
		BlendMode = subtract
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (1.1119901, 1.1)
		Color = [
			255
			255
			255
			42
		]
		angularvel = 0.01
		BlendMode = add
	}
]
og_bluespiral = [
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (1.015, 1.01)
		Color = [
			208
			182
			235
			254
		]
		angularvel = 0.0
		BlendMode = blend
		nonuniformscale
	}
	{
		Type = line
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
		angularvel = 0.1
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 24.5
				responsefunc = sinlog10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 30
				response = redmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 20
				response = redmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 20
				response = redmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 20
				response = redmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = blendprev
		offset = (0.0, 0.2)
		Scale = (2.0, 2.0)
		Color = [
			255
			255
			255
			35
		]
		angularvel = 0.5
		BlendMode = subtract
	}
	{
		Type = blendprev
		offset = (0.01, 0.01)
		Scale = (1.1119901, 1.1)
		Color = [
			255
			255
			255
			42
		]
		angularvel = 0.01
		BlendMode = add
	}
]
og_bluecross = [
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (1.015, -1.01)
		Color = [
			208
			182
			235
			254
		]
		angularvel = 0.0
		BlendMode = blend
		nonuniformscale
	}
	{
		Type = line
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
		angularvel = 0.1
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 24.5
				responsefunc = sinlog10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 30
				response = redmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 20
				response = redmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 20
				response = redmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 20
				response = redmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = blendprev
		offset = (0.0, 0.2)
		Scale = (2.0, 2.0)
		Color = [
			255
			255
			255
			35
		]
		angularvel = 0.5
		BlendMode = subtract
	}
	{
		Type = blendprev
		offset = (0.01, 0.01)
		Scale = (1.1119901, -1.1)
		Color = [
			255
			255
			255
			42
		]
		angularvel = 0.01
		BlendMode = add
	}
]
og_bluephoenix_ii = [
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (1.015, -1.01)
		Color = [
			208
			182
			235
			254
		]
		angularvel = 0.0
		BlendMode = blend
		nonuniformscale
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		length = 1.0
		Color = [
			255
			255
			255
			255
		]
		thickness = 3.0
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 24.5
				responsefunc = sinlog10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 30
				response = redmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 20
				response = redmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 20
				response = redmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 20
				response = redmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = blendprev
		offset = (0.0, 0.2)
		Scale = (2.0, 2.0)
		Color = [
			255
			255
			255
			35
		]
		angularvel = 0.5
		BlendMode = subtract
	}
	{
		Type = blendprev
		offset = (0.01, 0.01)
		Scale = (1.1119901, -1.1)
		Color = [
			255
			255
			255
			42
		]
		angularvel = 0.01
		BlendMode = add
	}
]
og_bluebands = [
	{
		Type = blendprev
		offset = (0.0, 0.2)
		Scale = (1.15, -1.1915001)
		Color = [
			218
			252
			255
			254
		]
		angularvel = 0.0
		BlendMode = blend
		nonuniformscale
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		length = 1.0
		Color = [
			255
			255
			255
			255
		]
		thickness = 3.0
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 24.5
				responsefunc = sinlog10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (0.98999995, 1.0)
		Color = [
			255
			255
			255
			25
		]
		angularvel = 0.0
		BlendMode = add
	}
]
og_blueoverload = [
	{
		Type = blendprev
		offset = (0.0, 0.02)
		Scale = (1.015, -1.01)
		Color = [
			218
			252
			255
			254
		]
		angularvel = 1.0
		BlendMode = blend
		nonuniformscale
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		length = 1.0
		Color = [
			255
			255
			255
			255
		]
		thickness = 3.0
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 24.5
				responsefunc = sinlog10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (0.98999995, 1.1)
		Color = [
			255
			255
			255
			25
		]
		angularvel = 0.0
		BlendMode = add
	}
]
og_blueringsfeedbackwave = [
	{
		Type = blendprev
		offset = (0.0, -0.0)
		Scale = (1.15, -1.1915001)
		Color = [
			218
			252
			255
			254
		]
		angularvel = 0.1
		BlendMode = blend
		nonuniformscale
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		length = 1.0
		Color = [
			255
			255
			255
			255
		]
		thickness = 1.0
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 24.5
				responsefunc = sinlog10
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = circle
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
				Type = frequency
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.09
				spectrumband = 20
			}
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 25
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 50
			}
		]
	}
	{
		Type = circle
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
				Type = frequency
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.09
				spectrumband = 30
			}
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 50
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
		]
	}
	{
		Type = circle
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
				Type = frequency
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.09
				spectrumband = 40
			}
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 200
			}
		]
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (0.98999995, 1.0)
		Color = [
			255
			255
			255
			25
		]
		angularvel = 0.0
		BlendMode = add
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (1.0, 1.0)
		Color = [
			255
			51
			63
			38
		]
		angularvel = 0.5
		BlendMode = subtract
	}
]
og_blueringsphasing = [
	{
		Type = blendprev
		offset = (0.0, -0.01)
		Scale = (3.0, -1.915)
		Color = [
			218
			252
			255
			254
		]
		angularvel = 0.1
		BlendMode = blend
		nonuniformscale
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		length = 1.0
		Color = [
			255
			255
			255
			255
		]
		thickness = 1.0
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				response = deform
				deformscale = 24.5
				responsefunc = sinlog10
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		length = 0.01
		Color = [
			0
			0
			0
			255
		]
		thickness = 1.0
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = circle
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
				Type = frequency
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.09
				spectrumband = 30
			}
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 25
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 50
			}
		]
	}
	{
		Type = circle
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
				Type = waveform
				response = radiusscale
				radiusscalemod = 0.04
				responsefunc = log10
			}
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 50
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 100
			}
		]
	}
	{
		Type = circle
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
				Type = waveform
				response = radiusscale
				radiusscalemod = 0.04
				responsefunc = log10
			}
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 200
			}
		]
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (0.1, 1.0)
		Color = [
			255
			255
			255
			25
		]
		angularvel = 0.0
		BlendMode = add
	}
	{
		Type = blendprev
		offset = (0.0, 0.0)
		Scale = (1.0, 1.0)
		Color = [
			255
			51
			63
			238
		]
		angularvel = 0.5
		BlendMode = subtract
	}
]
og_spectrum_arches = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (1.0, 1.0)
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
		Type = circle
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
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 20
				response = redmodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = waveform
				response = deform
				responsefunc = exp
				deformscale = 10.0
			}
			{
				Type = frequency
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.3
				spectrumband = 10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 6
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 6
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 6
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 12
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 12
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 12
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 18
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 18
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 18
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 24
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 24
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 24
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		Type = line
		Pos = (0.0, 0.05, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 1
		thickness = 2
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 30
				response = deform
				responsefunc = sinlog10
				deformscale = 50
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.15, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 1
		thickness = 2
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 30
				response = deform
				responsefunc = sinlog10
				deformscale = 50
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.25, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 2
		thickness = 2
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 30
				response = deform
				responsefunc = sinlog10
				deformscale = 50
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (-1.1, 1.9)
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
		Type = blendprev
		angularvel = 1
		Scale = (0.9, 0.9)
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
				Type = beaton
				spectrumband = 10
				response = angularvelmod
				velscale = 1
			}
		]
	}
]
og_spectrum_exposition_neonchurch = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (1.0, 1.0)
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
		Type = circle
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
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 20
				response = redmodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = frequency
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.3
				spectrumband = 10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 6
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 6
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 6
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 12
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 12
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 12
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 18
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 18
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 18
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 24
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 24
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 24
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		Type = line
		Pos = (0.0, 0.05, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 1
		thickness = 2
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 30
				response = deform
				responsefunc = sinlog10
				deformscale = 50
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.15, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 1
		thickness = 2
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 30
				response = deform
				responsefunc = sinlog10
				deformscale = 50
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.25, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 2
		thickness = 2
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 30
				response = deform
				responsefunc = sinlog10
				deformscale = 50
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (-1.1, 1.9)
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
		Type = blendprev
		angularvel = 1
		Scale = (0.9, 0.9)
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
og_spectrum_wash_matrixrain = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (1.0, 1.0)
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
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 6
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 6
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 6
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 12
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 12
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 12
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 18
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 18
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 18
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 24
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 24
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 24
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		Type = line
		Pos = (0.0, 0.05, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 1
		thickness = 2
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 30
				response = deform
				responsefunc = sinlog10
				deformscale = 50
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.15, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 1
		thickness = 2
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 30
				response = deform
				responsefunc = sinlog10
				deformscale = 50
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.25, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 2
		thickness = 2
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 30
				response = deform
				responsefunc = sinlog10
				deformscale = 50
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (-1.1, 1.9)
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
og_spectrum_strobe = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (1.0, -1.01)
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
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 40
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 40
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 40
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 50
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 50
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 50
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 60
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 60
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.0, 0.25, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 1
		thickness = 2
		angularvel = 0.0
	}
	{
		Type = line
		Pos = (0.5, 0.35000002, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 1
		thickness = 2
		angularvel = 0.0
	}
	{
		Type = line
		Pos = (0.5, 0.45000002, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 2
		thickness = 2
		angularvel = 0.0
	}
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (-1.0, -1.1)
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
		Type = blendprev
		angularvel = 0.1
		Scale = (-0.90999997, 1.01)
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
				Type = beaton
				spectrumband = 10
				response = angularvelmod
				velscale = 1000
			}
		]
	}
]
og_spectrum_strobeii = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (1.0, -1.01)
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
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 40
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 40
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 40
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 50
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 50
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 50
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 60
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 60
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.0, 0.25, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 1
		thickness = 2
		angularvel = 0.0
	}
	{
		Type = line
		Pos = (0.5, 0.35000002, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 1
		thickness = 2
		angularvel = 0.0
	}
	{
		Type = line
		Pos = (0.5, 0.45000002, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 2
		thickness = 2
		angularvel = 0.0
	}
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (-1.0, -1.1)
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
		Type = blendprev
		angularvel = 0.1
		Scale = (-0.51, 2.01)
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
				Type = beaton
				spectrumband = 10
				response = angularvelmod
				velscale = 1000
			}
		]
	}
]
og_spectrumneonflipbright = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (1.0, 1.01)
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
		Type = circle
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
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 20
				response = redmodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = waveform
				response = deform
				responsefunc = sinlog10
				deformscale = 100.1
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 40
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 40
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 40
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 50
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 50
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 50
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 60
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 60
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.0, 0.25, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 1
		thickness = 2
		angularvel = 0.0
	}
	{
		Type = line
		Pos = (0.5, 0.35000002, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 1
		thickness = 2
		angularvel = 0.0
	}
	{
		Type = line
		Pos = (0.5, 0.45000002, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 2
		thickness = 2
		angularvel = 0.0
	}
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (1.0, -1.1)
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
og_spectrumneonflip = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (1.0, 1.01)
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
		Type = circle
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
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 20
				response = redmodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = beaton
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.03
				spectrumband = 10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 40
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 40
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 40
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 50
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 50
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 50
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 60
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 60
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.0, 0.25, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 1
		thickness = 2
		angularvel = 0.0
	}
	{
		Type = line
		Pos = (0.5, 0.35000002, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 1
		thickness = 2
		angularvel = 0.0
	}
	{
		Type = line
		Pos = (0.5, 0.45000002, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 2
		thickness = 2
		angularvel = 0.0
	}
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (1.0, 1.1)
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
og_spectrumneon = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (1.0, 1.0)
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
		Type = circle
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
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 20
			}
			{
				Type = frequency
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.03
				spectrumband = 10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 40
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 40
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 40
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 50
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 50
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 50
				response = lengthscale
				lengthscalemod = 10
			}
		]
	}
	{
		Type = line
		Pos = (0.0, 0.25, 0.0)
		Color = [
			0
			220
			0
			255
		]
		length = 1.5
		thickness = 2
		angularvel = 0.0
	}
	{
		Type = line
		Pos = (0.5, 0.35000002, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 1
		thickness = 2
		angularvel = 0.0
	}
	{
		Type = line
		Pos = (0.5, 0.45000002, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 2
		thickness = 2
		angularvel = 0.0
	}
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (1.0, 1.0)
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
og_spectrumlattice = [
	{
		Type = blendprev
		angularvel = -0.1
		Scale = (1.0, -1.0)
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
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 40
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 40
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 40
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 50
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 50
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 50
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 60
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 60
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.25, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 0.5
		thickness = 2
		angularvel = 0.0
	}
	{
		Type = line
		Pos = (0.5, 0.35000002, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 1
		thickness = 2
		angularvel = 0.0
	}
	{
		Type = line
		Pos = (0.5, 0.45000002, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 2
		thickness = 2
		angularvel = 0.0
	}
]
og_spectrum3d = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (1.0, -1.0)
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
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 40
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 40
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 40
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 50
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 50
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 50
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 60
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 60
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.25, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularvel = 0.0
	}
	{
		Type = line
		Pos = (0.5, 0.35000002, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularvel = 0.0
	}
	{
		Type = line
		Pos = (0.5, 0.45000002, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularvel = 0.0
	}
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (0.9, 0.9)
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
		Type = blendprev
		angularvel = 0.1
		Scale = (-0.90999997, -1.01)
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
				Type = beaton
				spectrumband = 10
				response = angularvelmod
				velscale = 1000
			}
		]
	}
]

script _spectrumvertical 
endscript
og_spectrumvertical = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (1.0, -1.0)
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
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 40
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 40
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 40
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 50
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 50
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 50
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
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
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 60
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 60
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.25, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularvel = 0.0
	}
	{
		Type = line
		Pos = (0.5, 0.35000002, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularvel = 0.0
	}
	{
		Type = line
		Pos = (0.5, 0.45000002, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularvel = 0.0
	}
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (0.9, 0.9)
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
		Type = blendprev
		angularvel = 0.1
		Scale = (-0.90999997, -1.01)
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
og_spectrumredgreen = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (1.0, -1.1)
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
		Type = blendprev
		angularvel = 0.0
		Scale = (1.0, 1.0)
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
		Type = line
		Pos = (0.5, 0.1, 0.0)
		Color = [
			100
			0
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.18, 0.0)
		Color = [
			100
			0
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.26, 0.0)
		Color = [
			100
			0
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.34, 0.0)
		Color = [
			100
			0
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 40
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 40
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 40
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.42000002, 0.0)
		Color = [
			100
			0
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 50
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 50
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 50
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			200
			0
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 60
				response = bluemodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 60
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			250
			200
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 30.1
			}
			{
				Type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
]
og_electricdye = [
	{
		Type = blendprev
		angularvel = 0.51
		Scale = (-1.99, -1.05)
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
		Type = circle
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
				Type = waveform
				response = deform
				deformscale = 100.0
			}
			{
				Type = frequency
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.01
				spectrumband = 20
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.1, 0.0)
		Color = [
			100
			200
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 1000
			}
			{
				Type = frequency
				spectrumband = 10
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.11, 0.0)
		Color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 1000
			}
			{
				Type = frequency
				spectrumband = 20
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.120000005, 0.0)
		Color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 1000
			}
			{
				Type = frequency
				spectrumband = 30
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.13, 0.0)
		Color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 40
				response = bluemodulation
				colorscale = 1000
			}
			{
				Type = frequency
				spectrumband = 40
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 40
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.14, 0.0)
		Color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 50
				response = bluemodulation
				colorscale = 1000
			}
			{
				Type = frequency
				spectrumband = 50
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 50
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.15, 0.0)
		Color = [
			200
			200
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 60
				response = bluemodulation
				colorscale = 1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.0, 0.0)
		Color = [
			200
			250
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
			{
				Type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (-0.90999997, -1.01)
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
		Type = blendprev
		angularvel = 0.01
		Scale = (-1.11, -1.5)
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
og_tronsistors = [
	{
		Type = blendprev
		angularvel = 0.01
		Scale = (1.02, -1.5)
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
		Type = circle
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
				Type = waveform
				response = deform
				deformscale = 500.0
			}
			{
				Type = frequency
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.01
				spectrumband = 20
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.05, 0.0)
		Color = [
			100
			200
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.1, 0.0)
		Color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.11, 0.0)
		Color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.120000005, 0.0)
		Color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 40
				response = bluemodulation
				colorscale = 1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 40
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.13, 0.0)
		Color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 50
				response = bluemodulation
				colorscale = 1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 50
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.14, 0.0)
		Color = [
			200
			200
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 60
				response = bluemodulation
				colorscale = 1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.0, 0.0)
		Color = [
			200
			250
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
			{
				Type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
]
og_daftname = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (-0.90999997, -1.1)
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
		Type = circle
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
				Type = frequency
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.01
				spectrumband = 20
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.05, 0.0)
		Color = [
			100
			200
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 10000
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.1, 0.0)
		Color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.15, 0.0)
		Color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.2, 0.0)
		Color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 40
				response = bluemodulation
				colorscale = 1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 40
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.25, 0.0)
		Color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 50
				response = bluemodulation
				colorscale = 1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 50
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.3, 0.0)
		Color = [
			200
			200
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 60
				response = bluemodulation
				colorscale = 1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.0, 0.0)
		Color = [
			200
			100
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
			{
				Type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (0.90999997, 1.01)
		Color = [
			254
			154
			54
			20
		]
		BlendMode = add
	}
]
og_daftdodger = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (-0.90999997, -1.1)
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
		Type = line
		Pos = (0.5, 0.05, 0.0)
		Color = [
			100
			200
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 10000
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.1, 0.0)
		Color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.15, 0.0)
		Color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.2, 0.0)
		Color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 40
				response = bluemodulation
				colorscale = 1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 40
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.25, 0.0)
		Color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 50
				response = bluemodulation
				colorscale = 1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 50
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.3, 0.0)
		Color = [
			200
			200
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 60
				response = bluemodulation
				colorscale = 1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.0, 0.0)
		Color = [
			200
			100
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
			{
				Type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (0.90999997, 1.01)
		Color = [
			254
			154
			54
			20
		]
		BlendMode = add
	}
]
og_daftspectrum = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (1.1, -1.1)
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
		Type = line
		Pos = (0.5, 0.05, 0.0)
		Color = [
			100
			200
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 10000
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.1, 0.0)
		Color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.15, 0.0)
		Color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.2, 0.0)
		Color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 40
				response = bluemodulation
				colorscale = 1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 40
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.25, 0.0)
		Color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 50
				response = bluemodulation
				colorscale = 1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 50
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.3, 0.0)
		Color = [
			200
			200
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 60
				response = bluemodulation
				colorscale = 1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.0, 0.0)
		Color = [
			200
			100
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
			{
				Type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (1.01, 1.01)
		Color = [
			254
			154
			54
			20
		]
		BlendMode = add
	}
]
og_daftequalizer = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (-1.1, -1.1)
		Color = [
			254
			254
			254
			250
		]
		BlendMode = blend
	}
	{
		Type = line
		Pos = (0.5, 0.05, 0.0)
		Color = [
			100
			200
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 10000
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.1, 0.0)
		Color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.15, 0.0)
		Color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.2, 0.0)
		Color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 40
				response = bluemodulation
				colorscale = 1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 40
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.25, 0.0)
		Color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 50
				response = bluemodulation
				colorscale = 1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 50
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.3, 0.0)
		Color = [
			200
			200
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 60
				response = bluemodulation
				colorscale = 1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.0, 0.0)
		Color = [
			200
			100
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
			{
				Type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (1.01, 1.01)
		Color = [
			254
			154
			54
			20
		]
		BlendMode = add
	}
]
og_horizontalanalysis = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (-1.1, -1.1)
		Color = [
			254
			254
			254
			250
		]
		BlendMode = blend
	}
	{
		Type = line
		Pos = (0.5, 0.05, 0.0)
		Color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 10000
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 10
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.1, 0.0)
		Color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 20
				response = bluemodulation
				colorscale = 1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 20
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.15, 0.0)
		Color = [
			100
			100
			0
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 30
				response = bluemodulation
				colorscale = 1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 30
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.2, 0.0)
		Color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 40
				response = bluemodulation
				colorscale = 1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 40
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.25, 0.0)
		Color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 50
				response = bluemodulation
				colorscale = 1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 50
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.3, 0.0)
		Color = [
			100
			100
			20
			255
		]
		length = 0.01
		thickness = 10
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				spectrumband = 60
				response = bluemodulation
				colorscale = 1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = greenmodulation
				colorscale = -1000
			}
			{
				Type = frequency
				spectrumband = 60
				response = lengthscale
				lengthscalemod = 100
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (1.01, 1.01)
		Color = [
			254
			154
			54
			20
		]
		BlendMode = add
	}
]
og_grid = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (1.0995, 1.199)
		Color = [
			250
			250
			250
			255
		]
		BlendMode = blend
	}
	{
		Type = circle
		Pos = (0.515, 0.5, 0.0)
		radius = 0.321
		controls = [
			{
				Type = waveform
				response = deform
				deformscale = 100
			}
		]
	}
	{
		Type = circle
		Pos = (0.51, 0.5, 0.0)
		radius = 0.421
		controls = [
			{
				Type = waveform
				response = deform
				deformscale = 100
			}
		]
	}
	{
		Type = circle
		Pos = (0.501, 0.51, 0.0)
		radius = 0.5215
		controls = [
			{
				Type = waveform
				response = deform
				deformscale = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.511, 0.25, 0.0)
		Color = [
			100
			0
			250
			255
		]
		length = 0.98999995
		thickness = 2
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 30.1
			}
		]
	}
	{
		Type = line
		Pos = (0.51199996, 0.125, 0.0)
		Color = [
			248
			168
			28
			255
		]
		length = 1
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = log10
				deformscale = 20.1
			}
		]
	}
	{
		Type = line
		Color = [
			250
			228
			55
			255
		]
		Pos = (0.51, 0.5, 0.0)
		length = 0.97999996
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.1
		Scale = (1.2, 1.09)
		Color = [
			80
			70
			40
			35
		]
		BlendMode = add
	}
]
og_gridsimple = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (1.0995, 1.199)
		Color = [
			250
			250
			250
			255
		]
		BlendMode = blend
	}
	{
		Type = circle
		Pos = (0.515, 0.5, 0.0)
		radius = 0.021
		controls = [
			{
				Type = waveform
				response = deform
				deformscale = 100
			}
		]
	}
	{
		Type = circle
		Pos = (0.51, 0.5, 0.0)
		radius = 0.0121
		controls = [
			{
				Type = waveform
				response = deform
				deformscale = 100
			}
		]
	}
	{
		Type = circle
		Pos = (0.501, 0.51, 0.0)
		radius = 0.005
		controls = [
			{
				Type = waveform
				response = deform
				deformscale = 100
			}
		]
	}
	{
		Type = line
		Pos = (0.511, 0.5, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 0.98999995
		thickness = 2
		angularvel = 0.1
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 20.1
			}
		]
	}
	{
		Type = line
		Pos = (0.51199996, 0.5, 0.0)
		Color = [
			248
			168
			28
			255
		]
		length = 1
		angularvel = 0.1
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = log10
				deformscale = 20.1
			}
		]
	}
	{
		Type = line
		Color = [
			250
			228
			55
			255
		]
		Pos = (0.51, 0.5, 0.0)
		length = 0.97999996
		angularvel = 0.1
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.1
		Scale = (1.2, 1.09)
		Color = [
			80
			70
			40
			35
		]
		BlendMode = add
	}
]
og_rings_of_saturn = [
	{
		Type = blendprev
		angularvel = 0.1
		Scale = (-0.98999995, 0.98999995)
		Color = [
			255
			255
			254
			255
		]
		BlendMode = blend
	}
	{
		Type = blendprev
		angularvel = 0.05
		Scale = (0.9919999, 0.99099994)
		Color = [
			5
			5
			5
			255
		]
		BlendMode = add
	}
	{
		Type = circle
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
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 20
			}
			{
				Type = frequency
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.03
				spectrumband = 10
			}
		]
	}
	{
		Type = circle
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
				Type = frequency
				spectrumband = 32
				response = deform
				responsefunc = sinlog10
				deformscale = 50.1
			}
		]
	}
	{
		Type = circle
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
				Type = frequency
				spectrumband = 32
				response = deform
				responsefunc = sinlog10
				deformscale = 50.1
			}
			{
				Type = frequency
				spectrumband = 10
				response = redmodulation
				colorscale = 30
			}
			{
				Type = frequency
				spectrumband = 16
				response = greenmodulation
				colorscale = 15
			}
			{
				Type = frequency
				spectrumband = 16
				response = bluemodulation
				colorscale = 15
			}
		]
	}
	{
		Type = line
		Color = [
			0
			0
			0
			255
		]
		Pos = (0.5, 0.55, 0.0)
		length = 0.75
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				response = deform
				spectrumband = 48
				responsefunc = log10
				deformscale = 20
			}
			{
				Type = beaton
				response = bluemodulation
				colorscale = 1
			}
		]
	}
	{
		Type = line
		Color = [
			250
			0
			0
			255
		]
		Pos = (0.5, 0.55, 0.0)
		length = 0.75
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				response = deform
				spectrumband = 48
				responsefunc = log10
				deformscale = 10
			}
			{
				Type = frequency
				spectrumband = 32
				response = greenmodulation
				colorscale = 200
			}
		]
	}
]
og_gridlock = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (0.98499995, 1.199)
		Color = [
			250
			250
			250
			255
		]
		BlendMode = blend
	}
	{
		Type = circle
		Pos = (0.515, 0.5, 0.0)
		radius = 0.021
		controls = [
			{
				Type = waveform
				response = deform
				deformscale = 100
			}
		]
	}
	{
		Type = circle
		Pos = (0.51, 0.5, 0.0)
		radius = 0.0121
		controls = [
			{
				Type = waveform
				response = deform
				deformscale = 100
			}
		]
	}
	{
		Type = circle
		Pos = (0.501, 0.51, 0.0)
		radius = 0.005
		controls = [
			{
				Type = waveform
				response = deform
				deformscale = 100
			}
		]
	}
	{
		Type = hypotrochoid
		Color = [
			255
			0
			0
			255
		]
		Pos = (0.4515, 0.515, 0.0)
		length = 0.120000005
		outerradius = 0.16
		InnerRadius = 0.1
		angularvel = 0.4
		thickness = 1.0
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 0.75
		thickness = 2
		angularvel = 0.024
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
		]
	}
	{
		Type = line
		Pos = (0.51, 0.5, 0.0)
		Color = [
			228
			248
			248
			255
		]
		length = 1
		angularvel = 0.025
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = log10
				deformscale = 20.1
			}
		]
	}
	{
		Type = line
		Color = [
			150
			168
			238
			255
		]
		Pos = (0.5, 0.51, 0.0)
		length = 0.25
		angularvel = 0.025999999
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.15
		Scale = (1.0999, 1.0999)
		Color = [
			120
			108
			128
			25
		]
		BlendMode = add
	}
]
og_weaverbright = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (0.98499995, 1.199)
		Color = [
			250
			250
			250
			255
		]
		BlendMode = blend
	}
	{
		Type = circle
		Pos = (0.515, 0.5, 0.0)
		radius = 0.021
		controls = [
			{
				Type = waveform
				response = deform
				deformscale = 100
			}
		]
	}
	{
		Type = circle
		Pos = (0.51, 0.5, 0.0)
		radius = 0.0121
		controls = [
			{
				Type = waveform
				response = deform
				deformscale = 100
			}
		]
	}
	{
		Type = circle
		Pos = (0.501, 0.51, 0.0)
		radius = 0.005
		controls = [
			{
				Type = waveform
				response = deform
				deformscale = 100
			}
		]
	}
	{
		Type = hypotrochoid
		Color = [
			255
			0
			0
			255
		]
		Pos = (0.4515, 0.515, 0.0)
		length = 0.120000005
		outerradius = 0.16
		InnerRadius = 0.1
		angularvel = 0.4
		thickness = 1.0
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 0.75
		thickness = 2
		angularvel = 0.024
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
		]
	}
	{
		Type = line
		Pos = (0.51, 0.5, 0.0)
		Color = [
			228
			248
			248
			255
		]
		length = 1
		angularvel = 0.025
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = log10
				deformscale = 20.1
			}
		]
	}
	{
		Type = line
		Color = [
			150
			168
			238
			255
		]
		Pos = (0.5, 0.51, 0.0)
		length = 0.25
		angularvel = 0.025999999
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.1
		Scale = (1.0999, 0.99899995)
		Color = [
			120
			108
			128
			25
		]
		BlendMode = add
	}
]
og_weaver = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (0.98499995, 1.199)
		Color = [
			250
			250
			250
			255
		]
		BlendMode = blend
	}
	{
		Type = circle
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
				Type = waveform
				response = deform
				deformscale = 10
			}
		]
	}
	{
		Type = circle
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
				Type = waveform
				response = deform
				deformscale = 100
			}
		]
	}
	{
		Type = circle
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
				Type = waveform
				response = deform
				deformscale = 10
			}
		]
	}
	{
		Type = hypotrochoid
		Color = [
			255
			0
			0
			255
		]
		Pos = (0.4515, 0.515, 0.0)
		length = 0.120000005
		outerradius = 0.16
		InnerRadius = 0.1
		angularvel = 4
		thickness = 1.0
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 0.75
		thickness = 2
		angularvel = 0.024
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
		]
	}
	{
		Type = line
		Pos = (0.51, 0.5, 0.0)
		Color = [
			228
			248
			248
			255
		]
		length = 1
		angularvel = 0.025
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = log10
				deformscale = 20.1
			}
		]
	}
	{
		Type = line
		Color = [
			150
			168
			238
			255
		]
		Pos = (0.5, 0.51, 0.0)
		length = 1
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.1
		Scale = (1.0999, 0.99899995)
		Color = [
			120
			108
			128
			15
		]
		BlendMode = add
	}
]
og_envy = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (0.97999996, -0.98999995)
		Color = [
			250
			250
			250
			255
		]
		BlendMode = blend
	}
	{
		Type = circle
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
				Type = beaton
				spectrumband = 8
				response = redmodulation
				colorscale = 200
			}
		]
	}
	{
		Type = hypotrochoid
		Color = [
			225
			225
			255
			255
		]
		Pos = (0.4515, 0.515, 0.0)
		length = 0.2
		outerradius = 0.16
		InnerRadius = 0.1
		angularvel = 1
		thickness = 5.0
	}
	{
		Type = line
		Pos = (0.51, 0.5, 0.0)
		Color = [
			228
			248
			248
			255
		]
		length = 1
		angularvel = 0.025
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = log10
				deformscale = 20.1
			}
		]
	}
	{
		Type = line
		Color = [
			50
			228
			38
			255
		]
		Pos = (0.5, 0.51, 0.0)
		length = 0.25
		angularvel = 0.26
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.01
		Scale = (0.99899995, 0.99899995)
		Color = [
			120
			120
			120
			12
		]
		BlendMode = add
	}
]
og_bluephoenix = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (0.97999996, -0.98999995)
		Color = [
			250
			250
			250
			255
		]
		BlendMode = blend
	}
	{
		Type = circle
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
				Type = beaton
				spectrumband = 8
				response = redmodulation
				colorscale = 200
			}
			{
				Type = waveform
				response = deform
				deformscale = 400.1
			}
		]
	}
	{
		Type = hypotrochoid
		Color = [
			225
			225
			255
			255
		]
		Pos = (0.4515, 0.515, 0.0)
		length = 0.2
		outerradius = 0.16
		InnerRadius = 0.1
		angularvel = 1
		thickness = 5.0
	}
	{
		Type = line
		Pos = (0.51, 0.5, 0.0)
		Color = [
			228
			248
			248
			255
		]
		length = 1
		angularvel = 0.025
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = log10
				deformscale = 20.1
			}
		]
	}
	{
		Type = line
		Color = [
			120
			130
			140
			255
		]
		Pos = (0.5, 0.51, 0.0)
		length = 0.25
		angularvel = 0.26
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.01
		Scale = (0.99899995, 0.99899995)
		Color = [
			100
			128
			128
			12
		]
		BlendMode = add
	}
]
og_dontharshmymellow = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (-0.97999996, -0.98999995)
		Color = [
			250
			250
			250
			255
		]
		BlendMode = blend
	}
	{
		Type = circle
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
				Type = waveform
				response = deform
				deformscale = 10
			}
		]
	}
	{
		Type = circle
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
				Type = waveform
				response = deform
				deformscale = 40.1
			}
			{
				Type = beaton
				spectrumband = 30
				response = bluemodulation
				colorscale = 1
			}
		]
	}
	{
		Type = circle
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
				Type = frequency
				spectrumband = 18
				response = deform
				responsefunc = log10
				deformscale = 20.1
			}
		]
	}
	{
		Type = hypotrochoid
		Color = [
			255
			204
			0
			255
		]
		Pos = (0.4515, 0.515, 0.0)
		length = 0.2
		outerradius = 0.16
		InnerRadius = 0.21000001
		angularvel = 1
		thickness = 5.0
	}
	{
		Type = line
		Pos = (0.51, 0.5, 0.0)
		Color = [
			228
			248
			48
			255
		]
		length = 1
		angularvel = 0.025
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = log10
				deformscale = 10.1
			}
			{
				Type = beaton
				spectrumband = 30
				response = bluemodulation
				colorscale = 1
			}
			{
				Type = beaton
				response = lengthscale
				spectrumband = 18
				responsefunc = sinlog10
				lengthscalemod = 0.1
			}
		]
	}
	{
		Type = line
		Color = [
			150
			168
			238
			255
		]
		Pos = (0.5, 0.51, 0.0)
		length = 0.1
		angularvel = 0.025999999
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
			{
				Type = beaton
				response = lengthscale
				spectrumband = 18
				responsefunc = sinlog10
				lengthscalemod = 0.1
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.01
		Scale = (0.99899995, 0.99899995)
		Color = [
			120
			108
			128
			15
		]
		BlendMode = add
	}
]
og_retinalburn = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (1.01, 0.98999995)
		Color = [
			250
			250
			250
			255
		]
		BlendMode = blend
	}
	{
		Type = circle
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
				Type = waveform
				response = deform
				deformscale = 100
			}
		]
	}
	{
		Type = circle
		Pos = (0.5, 0.5, 0.0)
		radius = 0.05
		controls = [
			{
				Type = frequency
				response = deform
				spectrumband = 32
				deformscale = 200
			}
		]
	}
	{
		Type = hypotrochoid
		Color = [
			68
			168
			248
			255
		]
		Pos = (0.4515, 0.515, 0.0)
		length = 0.01
		outerradius = 0.26
		InnerRadius = 0.1
		angularvel = 5
		thickness = 1.0
	}
	{
		Type = line
		Pos = (0.25, 0.5, 0.0)
		Color = [
			228
			248
			248
			255
		]
		length = 1
		angularvel = 0.01
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = log10
				deformscale = 10
			}
		]
	}
	{
		Type = line
		Pos = (0.25, 0.51, 0.0)
		Color = [
			48
			28
			48
			255
		]
		length = 0.25
		angularvel = 0.01
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
		]
	}
	{
		Type = line
		Color = [
			20
			38
			108
			255
		]
		Pos = (0.25, 0.52, 0.0)
		length = 0.5
		angularvel = 0.01
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.1
		Scale = (0.98999995, 0.98999995)
		Color = [
			120
			108
			128
			15
		]
		BlendMode = add
	}
]
og_chrysalis = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (1.01, 0.98999995)
		Color = [
			250
			250
			250
			255
		]
		BlendMode = blend
	}
	{
		Type = circle
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
				Type = waveform
				response = deform
				deformscale = 100
			}
		]
	}
	{
		Type = hypotrochoid
		Color = [
			68
			168
			248
			255
		]
		Pos = (0.4515, 0.515, 0.0)
		length = 0.01
		outerradius = 0.26
		InnerRadius = 0.1
		angularvel = 5
		thickness = 1.0
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			228
			248
			248
			255
		]
		length = 1
		angularvel = 0.01
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = log10
				deformscale = 10
			}
		]
	}
	{
		Type = line
		Pos = (0.5, 0.51, 0.0)
		Color = [
			48
			28
			48
			255
		]
		length = 0.25
		angularvel = 0.01
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
		]
	}
	{
		Type = line
		Color = [
			20
			38
			108
			255
		]
		Pos = (0.5, 0.52, 0.0)
		length = 0.5
		angularvel = 0.01
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.1
		Scale = (0.98999995, 0.98999995)
		Color = [
			120
			108
			128
			15
		]
		BlendMode = add
	}
]
og_spinner = [
	{
		Type = blendprev
		angularvel = 0.1
		Scale = (1.01, 1.1)
		Color = [
			250
			220
			0
			255
		]
		BlendMode = blend
	}
	{
		Type = circle
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
				Type = waveform
				response = deform
				deformscale = 100
			}
		]
	}
	{
		Type = hypotrochoid
		Color = [
			68
			168
			248
			255
		]
		Pos = (0.4515, 0.515, 0.0)
		length = 0.01
		outerradius = 0.16
		InnerRadius = 0.1
		angularvel = 1
		thickness = 15.0
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			228
			248
			248
			255
		]
		length = 0.1
		angularvel = 0.05
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = log10
				deformscale = 200.1
			}
		]
	}
	{
		Type = line
		Pos = (0.25, 0.4, 0.0)
		Color = [
			48
			28
			48
			255
		]
		length = 0.25
		angularvel = 0.03
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
		]
	}
	{
		Type = line
		Color = [
			20
			38
			108
			255
		]
		Pos = (0.75, 0.4, 0.0)
		length = 0.5
		angularvel = 0.012999999
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.01
		Scale = (0.99899995, 0.99899995)
		Color = [
			120
			108
			128
			15
		]
		BlendMode = add
	}
]
og_web = [
	{
		Type = blendprev
		angularvel = 0.1
		Scale = (1.01, 1.1)
		Color = [
			250
			250
			250
			255
		]
		BlendMode = blend
	}
	{
		Type = circle
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
				Type = waveform
				response = deform
				deformscale = 100
			}
		]
	}
	{
		Type = hypotrochoid
		Color = [
			68
			68
			148
			255
		]
		Pos = (0.4515, 0.515, 0.0)
		length = 0.01
		outerradius = 0.16
		InnerRadius = 0.1
		angularvel = 1
		thickness = 15.0
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			228
			248
			248
			255
		]
		length = 0.1
		angularvel = 0.05
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = log10
				deformscale = 200.1
			}
		]
	}
	{
		Type = line
		Pos = (0.25, 0.4, 0.0)
		Color = [
			248
			228
			248
			255
		]
		length = 0.025
		angularvel = 1.3
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
		]
	}
	{
		Type = line
		Color = [
			20
			38
			108
			255
		]
		Pos = (0.75, 0.4, 0.0)
		length = 0.025
		angularvel = 2.3
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.01
		Scale = (0.99899995, 0.99899995)
		Color = [
			120
			108
			128
			12
		]
		BlendMode = add
	}
]
og_psychoid = [
	{
		Type = blendprev
		angularvel = 0.01
		Scale = (1.01, 1.1)
		Color = [
			250
			250
			250
			255
		]
		BlendMode = blend
	}
	{
		Type = hypotrochoid
		Color = [
			68
			68
			148
			255
		]
		Pos = (0.4515, 0.515, 0.0)
		length = 0.01
		outerradius = 0.2
		InnerRadius = 0.1
		angularvel = 1
		thickness = 25.0
	}
	{
		Type = line
		Pos = (0.75, 0.42000002, 0.0)
		Color = [
			228
			248
			248
			255
		]
		length = 0.1
		angularvel = 0.05
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = log10
				deformscale = 200.1
			}
		]
	}
	{
		Type = circle
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
				Type = waveform
				response = deform
				deformscale = 100
			}
		]
	}
	{
		Type = circle
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
				Type = waveform
				response = deform
				deformscale = 100
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.01
		Scale = (0.99899995, 0.99899995)
		Color = [
			120
			108
			128
			25
		]
		BlendMode = add
	}
	{
		Type = hypotrochoid
		Color = [
			0
			0
			0
			255
		]
		Pos = (0.4515, 0.515, 0.0)
		length = 0.2
		outerradius = 0.16
		InnerRadius = 0.1
		angularvel = 1
		thickness = 25.0
	}
]
og_psyche = [
	{
		Type = blendprev
		angularvel = 0.01
		Scale = (1.01, 1.1)
		Color = [
			250
			250
			250
			255
		]
		BlendMode = blend
	}
	{
		Type = hypotrochoid
		Color = [
			68
			68
			148
			255
		]
		Pos = (0.4515, 0.515, 0.0)
		length = 0.01
		outerradius = 0.2
		InnerRadius = 0.1
		angularvel = 1
		thickness = 25.0
	}
	{
		Type = line
		Pos = (0.75, 0.42000002, 0.0)
		Color = [
			228
			248
			248
			255
		]
		length = 0.1
		angularvel = 0.05
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = log10
				deformscale = 200.1
			}
		]
	}
	{
		Type = line
		Pos = (0.75, 0.41, 0.0)
		Color = [
			68
			8
			0
			255
		]
		length = 0.25
		angularvel = 0.06
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
		]
	}
	{
		Type = line
		Color = [
			0
			68
			8
			255
		]
		Pos = (0.75, 0.4, 0.0)
		length = 0.25
		angularvel = 0.04
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.01
		Scale = (0.99899995, 0.99899995)
		Color = [
			120
			108
			128
			25
		]
		BlendMode = add
	}
	{
		Type = hypotrochoid
		Color = [
			0
			0
			0
			255
		]
		Pos = (0.4515, 0.515, 0.0)
		length = 0.2
		outerradius = 0.16
		InnerRadius = 0.1
		angularvel = 1
		thickness = 25.0
	}
]
og_eyeofthestorm = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (0.97999996, -0.98999995)
		Color = [
			250
			250
			250
			255
		]
		BlendMode = blend
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			0
			0
			0
			255
		]
		length = 0.75
		thickness = 1
		angularvel = 0.5
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 20.1
			}
		]
	}
	{
		Type = circle
		Pos = (0.515, 0.5, 0.0)
		radius = 0.021
		controls = [
			{
				Type = waveform
				response = deform
				deformscale = 100
			}
		]
	}
	{
		Type = circle
		Pos = (0.51, 0.5, 0.0)
		radius = 0.0121
		controls = [
			{
				Type = waveform
				response = deform
				deformscale = 100
			}
		]
	}
	{
		Type = circle
		Pos = (0.501, 0.51, 0.0)
		radius = 0.005
		controls = [
			{
				Type = waveform
				response = deform
				deformscale = 100
			}
		]
	}
	{
		Type = hypotrochoid
		Color = [
			68
			68
			148
			255
		]
		Pos = (0.4515, 0.515, 0.0)
		length = 0.02
		outerradius = 0.16
		InnerRadius = 0.1
		angularvel = 1
		thickness = 5.0
	}
	{
		Type = line
		Pos = (0.5, 0.5, 0.0)
		Color = [
			228
			248
			248
			255
		]
		length = 1
		angularvel = 0.025
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = log10
				deformscale = 20.1
			}
		]
	}
	{
		Type = line
		Color = [
			20
			38
			108
			255
		]
		Pos = (0.75, 0.4, 0.0)
		length = 0.25
		angularvel = 2.3
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.01
		Scale = (0.99899995, 0.99899995)
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
		Type = blendprev
		angularvel = 0.0
		angle = 0.1
		Scale = (0.98999995, 0.98999995)
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
		Type = blendprev
		angularvel = 0.0
		Scale = (1.0, 0.99099994)
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
		Type = circle
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
				Type = frequency
				spectrumband = 10
				response = bluemodulation
				colorscale = 10
			}
		]
	}
	{
		Type = line
		Color = [
			0
			0
			0
			255
		]
		Pos = (0.5, 0.1515, 0.0)
		length = 0.75
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				response = deform
				spectrumband = 48
				responsefunc = log10
				deformscale = 10
			}
			{
				Type = frequency
				spectrumband = 10
				response = alphamodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 11
				response = redmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 12
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 13
				response = bluemodulation
				colorscale = 100
			}
		]
	}
]
green_tunnel_primitives = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (1.001, 0.99899995)
		Color = [
			245
			204
			246
			255
		]
		BlendMode = blend
	}
	{
		Type = circle
		Pos = (0.25, 0.25, 0.0)
		radius = 0.1
		controls = [
			{
				Type = waveform
				response = deform
				deformscale = 100
			}
		]
	}
	{
		Type = hypotrochoid
		Pos = (0.55, 0.55, 0.0)
		length = 0.01
		outerradius = 0.15
		InnerRadius = 0.015
		angularvel = 5
		thickness = 1.0
	}
	{
		Type = line
		Pos = (0.25, 0.5, 0.0)
		Color = [
			128
			148
			148
			255
		]
		length = 1
		angularvel = 0.5
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = log10
				deformscale = 10.1
			}
		]
	}
	{
		Type = hypotrochoid
		Color = [
			58
			108
			8
			255
		]
		Pos = (0.5, 0.55, 0.0)
		length = 0.1
		outerradius = 0.15
		InnerRadius = 0.015
		angularvel = 1
		thickness = 1.0
	}
	{
		Type = line
		Color = [
			20
			38
			108
			55
		]
		Pos = (0.75, 0.4, 0.0)
		length = 0.25
		angularvel = 0.03
		controls = [
			{
				Type = frequency
				response = deform
				responsefunc = sinlog10
				deformscale = 10.1
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.01
		Scale = (1.01, 0.899)
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
		Type = blendprev
		angularvel = 0.0
		Scale = (0.98999995, 0.98999995)
		Color = [
			255
			254
			254
			255
		]
		BlendMode = blend
	}
	{
		Type = circle
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
				Type = frequency
				response = deform
				spectrumband = 28
				responsefunc = log10
				deformscale = 15
			}
			{
				Type = frequency
				spectrumband = 32
				response = greenmodulation
				colorscale = 100
			}
			{
				Type = frequency
				spectrumband = 32
				response = bluemodulation
				colorscale = 200
			}
		]
	}
	{
		Type = circle
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
				Type = waveform
				response = radiusscale
				radiusscalemod = 10
			}
			{
				Type = frequency
				spectrumband = 8
				response = redmodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 32
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 32
				response = bluemodulation
				colorscale = 200
			}
		]
	}
	{
		Type = circle
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
		Type = line
		Color = [
			150
			230
			250
			255
		]
		Pos = (0.5, 0.5, 0.0)
		length = 0.375
		angularvel = 0.1
		controls = [
			{
				Type = frequency
				response = deform
				spectrumband = 48
				responsefunc = sinlog10
				deformscale = 15
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.05
		Scale = (0.9919999, -0.99099994)
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
		Type = blendprev
		angularvel = 0
		Scale = (-1.1, 1.01)
		Color = [
			255
			255
			255
			255
		]
		BlendMode = blend
	}
	{
		Type = line
		Color = [
			0
			0
			0
			255
		]
		Pos = (0.0, 0.45000002, 0.0)
		length = 1
		thickness = 2
		angularvel = 0.01
		controls = [
			{
				Type = frequency
				response = lengthscale
				spectrumband = 18
				responsefunc = sinlog10
				lengthscalemod = 10
			}
			{
				Type = frequency
				spectrumband = 8
				response = redmodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 32
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 60
				response = bluemodulation
				colorscale = 200
			}
		]
	}
	{
		Type = line
		Color = [
			0
			0
			0
			255
		]
		Pos = (1.0, 0.55, 0.0)
		length = 1
		thickness = 2
		angularvel = 0.1
		controls = [
			{
				Type = frequency
				response = lengthscale
				spectrumband = 18
				responsefunc = sinlog10
				lengthscalemod = 10
			}
			{
				Type = frequency
				spectrumband = 8
				response = redmodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 32
				response = greenmodulation
				colorscale = 200
			}
			{
				Type = frequency
				spectrumband = 60
				response = bluemodulation
				colorscale = 200
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (1.01, -1.01)
		Color = [
			50
			50
			50
			20
		]
		BlendMode = add
	}
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (0.98999995, 1.2)
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
		Type = blendprev
		angularvel = 0.1
		Scale = (-1.0, 1.0)
		Color = [
			255
			255
			255
			255
		]
		BlendMode = blend
	}
	{
		Type = line
		Color = [
			250
			200
			50
			255
		]
		Pos = (0.5, 0.75, 0.0)
		length = 1
		thickness = 2
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				spectrumband = 18
				responsefunc = log10
				deformscale = 20
			}
		]
	}
	{
		Type = line
		Color = [
			250
			100
			50
			255
		]
		Pos = (0.5, 0.15, 0.0)
		length = 1
		thickness = 2
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				spectrumband = 18
				responsefunc = sinlog10
				deformscale = 20
			}
		]
	}
	{
		Type = line
		Color = [
			250
			200
			250
			255
		]
		Pos = (0.5, 0.05, 0.0)
		length = 1
		thickness = 2
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				spectrumband = 18
				responsefunc = sinlog10
				deformscale = 0
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (-1.2, 1.2)
		Color = [
			100
			100
			110
			160
		]
		BlendMode = add
	}
	{
		Type = blendprev
		angularvel = 0.1
		Scale = (1.5, 1.0)
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
		Type = blendprev
		angularvel = 0.01
		Scale = (-1.0, 1.0)
		Color = [
			250
			250
			250
			255
		]
		BlendMode = blend
	}
	{
		Type = line
		Color = [
			250
			200
			50
			255
		]
		Pos = (0.5, 0.75, 0.0)
		length = 1
		thickness = 2
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				spectrumband = 18
				responsefunc = log10
				deformscale = 20
			}
		]
	}
	{
		Type = line
		Color = [
			250
			100
			50
			255
		]
		Pos = (0.5, 0.15, 0.0)
		length = 1
		thickness = 2
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				spectrumband = 18
				responsefunc = sinlog10
				deformscale = 20
			}
		]
	}
	{
		Type = line
		Color = [
			250
			200
			250
			255
		]
		Pos = (0.5, 0.05, 0.0)
		length = 1
		thickness = 2
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				spectrumband = 18
				responsefunc = sinlog10
				deformscale = 0
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (-1.2, 1.2)
		Color = [
			100
			100
			110
			160
		]
		BlendMode = add
	}
	{
		Type = blendprev
		angularvel = 0.1
		Scale = (1.5, 1.0)
		Color = [
			110
			100
			100
			118
		]
		BlendMode = sub
	}
]
og_koolaidoscope = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (1.0, 1.0)
		Color = [
			250
			250
			250
			255
		]
		BlendMode = blend
	}
	{
		Type = line
		Color = [
			250
			200
			50
			255
		]
		Pos = (0.5, 0.75, 0.0)
		length = 1
		thickness = 2
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				spectrumband = 18
				responsefunc = log10
				deformscale = 20
			}
		]
	}
	{
		Type = line
		Color = [
			250
			100
			50
			255
		]
		Pos = (0.5, 0.15, 0.0)
		length = 1
		thickness = 2
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				spectrumband = 18
				responsefunc = sinlog10
				deformscale = 20
			}
		]
	}
	{
		Type = line
		Color = [
			250
			200
			250
			255
		]
		Pos = (0.5, 0.05, 0.0)
		length = 1
		thickness = 2
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				spectrumband = 18
				responsefunc = sinlog10
				deformscale = 0
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (-1.2, 1.2)
		Color = [
			100
			100
			110
			160
		]
		BlendMode = add
	}
	{
		Type = blendprev
		angularvel = 0.1
		Scale = (1.5, 1.0)
		Color = [
			110
			100
			100
			118
		]
		BlendMode = sub
	}
]
og_eventhorizon = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (1.0, 1.0)
		Color = [
			250
			250
			250
			255
		]
		BlendMode = blend
	}
	{
		Type = line
		Color = [
			250
			200
			50
			255
		]
		Pos = (0.5, 0.75, 0.0)
		length = 1
		thickness = 2
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				spectrumband = 18
				responsefunc = log10
				deformscale = 20
			}
		]
	}
	{
		Type = line
		Color = [
			250
			100
			50
			255
		]
		Pos = (0.5, 0.15, 0.0)
		length = 1
		thickness = 2
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				spectrumband = 18
				responsefunc = sinlog10
				deformscale = 20
			}
		]
	}
	{
		Type = line
		Color = [
			250
			200
			250
			255
		]
		Pos = (0.5, 0.05, 0.0)
		length = 1
		thickness = 2
		angularvel = 0
		controls = [
			{
				Type = frequency
				response = deform
				spectrumband = 18
				responsefunc = sinlog10
				deformscale = 0
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (-1.2, 1.2)
		Color = [
			100
			100
			110
			20
		]
		BlendMode = add
	}
	{
		Type = blendprev
		angularvel = 10
		Scale = (0.569, 0.2569)
		Color = [
			110
			100
			100
			18
		]
		BlendMode = sub
	}
]
og_preset_circledeform = [
	{
		Type = blendprev
		angularvel = 0.01
		Scale = (0.98999995, 1.0124999)
		Color = [
			250
			250
			250
			255
		]
		BlendMode = blend
		nonuniformscale
	}
	{
		Type = circle
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
				Type = waveform
				response = deform
				deformscale = 140.0
			}
			{
				Type = frequency
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.05
				spectrumband = 20
			}
		]
	}
	{
		Type = circle
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
				Type = waveform
				response = deform
				deformscale = 120.0
			}
			{
				Type = frequency
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.01
				spectrumband = 12
			}
		]
	}
	{
		Type = circle
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
				Type = waveform
				response = deform
				deformscale = 120.0
			}
			{
				Type = frequency
				response = radiusscale
				responsefunc = sinlog10
				radiusscalemod = 0.01
				spectrumband = 48
			}
		]
	}
]
og_preset_2 = [
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (0.99899995, 0.99899995)
		Color = [
			255
			255
			255
			255
		]
		BlendMode = blend
	}
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (0.98999995, 0.98999995)
		Color = [
			204
			254
			254
			255
		]
		BlendMode = blend
	}
	{
		Type = line
		Color = [
			147
			60
			255
			255
		]
		Pos = (0.5, 0.5, 0.0)
		length = 0.4
		angularvel = 0.0
		controls = [
			{
				Type = frequency
				response = deform
				spectrumband = 48
				responsefunc = log10
				deformscale = 20
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.9
		Scale = (-1.01, 1.01)
		Color = [
			254
			254
			254
			254
		]
		BlendMode = blend
	}
]
og_love = [
	{
		Type = blendprev
		angularvel = 0
		Scale = (-0.98999995, -0.98999995)
		Color = [
			255
			254
			254
			255
		]
		BlendMode = blend
	}
	{
		Type = circle
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
				Type = waveform
				response = deform
				responsefunc = log10
				deformscale = 50.1
			}
		]
	}
	{
		Type = circle
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
		Type = circle
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
				Type = waveform
				response = deform
				responsefunc = log10
				deformscale = 100.1
			}
		]
	}
	{
		Type = line
		Color = [
			250
			200
			250
			255
		]
		Pos = (0.5, 0.55, 0.0)
		length = 0.75
		angularvel = 0.0
		controls = [
			{
				Type = waveform
				response = deform
				responsefunc = log10
				deformscale = 10.1
			}
		]
	}
	{
		Type = blendprev
		angularvel = 0.0
		Scale = (-0.9919999, 0.99099994)
		Color = [
			5
			5
			5
			55
		]
		BlendMode = add
	}
]
