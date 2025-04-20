
script PulseBloom time = 0.5 wait_time = 0.15
	killspawnedscript id = EndBloom_ScriptID
	killspawnedscript id = EndNTTBloom_ScriptID
	EndNTTBloom time = 0
	if NOT screenfx_fxinstanceexists viewport = 0 name = focusBSFX
		screenfx_addfxinstance {
			viewport = 0
			name = focusBSFX
			type = bright_sat
			on = 1
			contrast = 1
			red_mix = [1 0 0]
			green_mix = [0 1 0]
			blue_mix = [0 0 1]
			brightness = 1
			saturation = 1
			hue = 1
		}
	endif
	if NOT screenfx_fxinstanceexists viewport = 0 name = focusZoomFX
		screenfx_addfxinstance {
			viewport = 0
			name = focusZoomFX
			($Zero_TOD_Manager.screen_fx [2])
		}
	endif
	if NOT screenfx_fxinstanceexists viewport = 0 name = focusDOFFX
		screenfx_addfxinstance {
			viewport = 0
			name = focusDOFFX
			type = dof
			on = 1
			backdist = 1
			strength = 0
			crossfade = 0.49
		}
	endif
	if NOT screenfx_fxinstanceexists viewport = 0 name = focusBloomFX
		screenfx_addfxinstance {
			viewport = 0
			name = focusBloomFX
			($Zero_TOD_Manager.screen_fx [0])
			autoluminancemod = 0
			distancemod = 64
		}
	endif
	if screenfx_fxinstanceexists viewport = 0 name = focusBloomFX
		screenfx_updatefxinstanceparams {
			viewport = 0
			name = focusBloomFX
			time = 0.1
			bloom1 = 1
			bloom2 = 1
			strength = [255 255 255]
			color = [64 64 64]
		}
	endif
	wait <wait_time> seconds
	if screenfx_fxinstanceexists viewport = 0 name = focusBSFX
		screenfx_updatefxinstanceparams {
			viewport = 0
			name = focusZoomFX
			time = <time>
			($FocusMode_tod_manager.screen_fx [0])
		}
	endif
	if screenfx_fxinstanceexists viewport = 0 name = focusZoomFX
		screenfx_updatefxinstanceparams {
			viewport = 0
			name = focusZoomFX
			time = <time>
			($FocusMode_tod_manager.screen_fx [1])
		}
	endif
	if screenfx_fxinstanceexists viewport = 0 name = focusDOFFX
		screenfx_updatefxinstanceparams {
			viewport = 0
			name = focusDOFFX
			time = <time>
			($FocusMode_tod_manager.screen_fx [2])
		}
	endif
	if screenfx_fxinstanceexists viewport = 0 name = focusBloomFX
		screenfx_updatefxinstanceparams {
			viewport = 0
			name = focusBloomFX
			time = <time>
			($FocusMode_tod_manager.screen_fx [3])
		}
	endif
endscript

script EndBloom time = 0.5
	killspawnedscript id = PulseBloom_ScriptId
	if (<time> > 0)
		if screenfx_fxinstanceexists viewport = 0 name = focusBSFX
			screenfx_updatefxinstanceparams {
				viewport = 0
				name = focusBSFX
				time = <time>
				on = 1
				contrast = 1
				red_mix = [1 0 0]
				green_mix = [0 1 0]
				blue_mix = [0 0 1]
				brightness = 1
				saturation = 1
				hue = 1
			}
		endif
		if screenfx_fxinstanceexists viewport = 0 name = focusZoomFX
			screenfx_updatefxinstanceparams {
				viewport = 0
				name = focusZoomFX
				time = <time>
				scales = [0 0]
				inner_color = [0 0 0]
				inner_alpha = 0
				outer_color = [255 255 255]
				outer_alpha = 0
			}
		endif
		if screenfx_fxinstanceexists viewport = 0 name = focusDOFFX
			screenfx_updatefxinstanceparams {
				viewport = 0
				name = focusDOFFX
				time = <time>
				strength = 0
				backdist = 1
			}
		endif
		if screenfx_fxinstanceexists viewport = 0 name = focusBloomFX
			screenfx_updatefxinstanceparams {
				viewport = 0
				name = focusBloomFX
				time = <time>
				bloom1 = 0
				bloom2 = 0
				strength = [128 128 128]
				color = [96 96 96]
			}
		endif
		wait <time> seconds
	endif
	if screenfx_fxinstanceexists viewport = 0 name = focusBSFX
		screenfx_removefxinstance viewport = 0 name = focusBSFX
	endif
	if screenfx_fxinstanceexists viewport = 0 name = focusBloomFX
		screenfx_removefxinstance viewport = 0 name = focusBloomFX
	endif
	if screenfx_fxinstanceexists viewport = 0 name = focusDOFFX
		screenfx_removefxinstance viewport = 0 name = focusDOFFX
	endif
	if screenfx_fxinstanceexists viewport = 0 name = focusZoomFX
		screenfx_removefxinstance viewport = 0 name = focusZoomFX
	endif
endscript

script NTTBloom time = 0.5 wait_time = 0.25
	killspawnedscript id = Bloom_ScriptID
	killspawnedscript id = EndNTTBloom_ScriptID
	EndBloom time = 0
	if NOT screenfx_fxinstanceexists viewport = 0 name = NTTDOFFX
		screenfx_addfxinstance {
			viewport = 0
			name = NTTDOFFX
			type = dof
			on = 1
			backdist = 1
			strength = 0
			crossfade = 0.49
		}
	endif
	if NOT screenfx_fxinstanceexists viewport = 0 name = NTTBloomFX
		screenfx_addfxinstance {
			viewport = 0
			name = NTTBloomFX
			($Zero_TOD_Manager.screen_fx [0])
			autoluminancemod = 0
			distancemod = 64
		}
	endif
	if screenfx_fxinstanceexists viewport = 0 name = NTTBloomFX
		screenfx_updatefxinstanceparams {
			viewport = 0
			name = NTTBloomFX
			time = 0.1
			bloom1 = 1
			bloom2 = 1
			strength = [255 255 255]
			color = [64 64 64]
		}
	endif
	wait <wait_time> seconds ignoreslomo
	if ($NTT_Use_M_CU_FX = 1)
		if screenfx_fxinstanceexists viewport = 0 name = NTTDOFFX
			screenfx_updatefxinstanceparams {
				viewport = 0
				name = NTTDOFFX
				time = <time>
				($NailTheTrick_M_CU_tod_manager.screen_fx [0])
			}
		endif
		if screenfx_fxinstanceexists viewport = 0 name = NTTBloomFX
			screenfx_updatefxinstanceparams {
				viewport = 0
				name = NTTBloomFX
				time = <time>
				($NailTheTrick_M_CU_tod_manager.screen_fx [1])
			}
		endif
	else
		if screenfx_fxinstanceexists viewport = 0 name = NTTDOFFX
			screenfx_updatefxinstanceparams {
				viewport = 0
				name = NTTDOFFX
				time = <time>
				($NailTheTrick_tod_manager.screen_fx [0])
			}
		endif
		if screenfx_fxinstanceexists viewport = 0 name = NTTBloomFX
			screenfx_updatefxinstanceparams {
				viewport = 0
				name = NTTBloomFX
				time = <time>
				($NailTheTrick_tod_manager.screen_fx [1])
			}
		endif
	endif
endscript

script EndNTTBloom time = 0.5
	killspawnedscript id = NTTBloom_ScriptId
	if (<time> > 0)
		if screenfx_fxinstanceexists viewport = 0 name = NTTDOFFX
			screenfx_updatefxinstanceparams {
				viewport = 0
				name = NTTDOFFX
				time = <time>
				strength = 0
				backdist = 1
			}
		endif
		if screenfx_fxinstanceexists viewport = 0 name = NTTBloomFX
			screenfx_updatefxinstanceparams {
				viewport = 0
				name = NTTBloomFX
				time = <time>
				bloom1 = 0
				bloom2 = 0
				strength = [128 128 128]
				color = [96 96 96]
			}
		endif
		wait <time> seconds
	endif
	if screenfx_fxinstanceexists viewport = 0 name = NTTBloomFX
		screenfx_removefxinstance viewport = 0 name = NTTBloomFX
	endif
	if screenfx_fxinstanceexists viewport = 0 name = NTTDOFFX
		screenfx_removefxinstance viewport = 0 name = NTTDOFFX
	endif
endscript

script BowlBloom BowlStarttime = 0.8 percent = 1.0
	killspawnedscript id = Bloom_ScriptID
	killspawnedscript id = EndBowlBloom_ScriptID
	EndBloom time = 0
	if (<percent> < 0.15)
		EndBowlBloom BowlEndtime = 0 percent = <percent>
	endif
	if NOT screenfx_fxinstanceexists viewport = 0 name = BowlDOF
		screenfx_addfxinstance {
			viewport = 0
			name = BowlDOF
			time = <BowlStarttime>
			type = dof
			on = 1
			backdist = 0.07
			strength = (0.86 * <percent>)
			crossfade = 0.49
		}
	else
		screenfx_updatefxinstanceparams {
			viewport = 0
			name = BowlDOF
			time = <BowlStarttime>
			type = dof
			on = 1
			backdist = 0.07
			strength = (0.86 * <percent>)
			crossfade = 0.49
		}
	endif
	if NOT screenfx_fxinstanceexists viewport = 0 name = Bowlnoise
		screenfx_addfxinstance {
			viewport = 0
			name = Bowlnoise
			time = <BowlStarttime>
			type = noise
			on = 1
			intensity = (0.11 * <percent>)
			color = [249 249 249]
		}
	else
		screenfx_updatefxinstanceparams {
			viewport = 0
			name = Bowlnoise
			time = <BowlStarttime>
			type = noise
			on = 1
			intensity = (0.11 * <percent>)
			color = [249 249 249]
		}
	endif
	if NOT screenfx_fxinstanceexists viewport = 0 name = Bowlfisheye
		screenfx_addfxinstance {
			viewport = 0
			name = Bowlfisheye
			time = <BowlStarttime>
			type = fisheye
			on = 1
			warp_strength = (0.50666994 * <percent>)
		}
	else
		screenfx_updatefxinstanceparams {
			viewport = 0
			name = Bowlfisheye
			time = <BowlStarttime>
			type = fisheye
			on = 1
			warp_strength = (0.50666994 * <percent>)
		}
	endif
	if NOT screenfx_fxinstanceexists viewport = 0 name = BowlWashout
		screenfx_addfxinstance {
			viewport = 0
			name = BowlWashout
			time = <BowlStarttime>
			type = bright_sat
			on = 1
			contrast = (1.0 + (0.29 * <percent>))
			red_mix = [1 0 0]
			green_mix = [0 1 0]
			blue_mix = [0 0 1]
			brightness = (1.0 + (0.32000002 * <percent>))
			saturation = (1.0 - (0.6 * <percent>))
			hue = 1
		}
	else
		screenfx_updatefxinstanceparams {
			viewport = 0
			name = BowlWashout
			time = <BowlStarttime>
			type = bright_sat
			on = 1
			contrast = (1.0 + (0.29 * <percent>))
			red_mix = [1 0 0]
			green_mix = [0 1 0]
			blue_mix = [0 0 1]
			brightness = (1.0 + (0.32000002 * <percent>))
			saturation = (1.0 - (0.6 * <percent>))
			hue = 1
		}
	endif
endscript

script EndBowlBloom BowlEndtime = 0.8
	killspawnedscript id = BowlBloom_ScriptId
	killspawnedscript name = pi_update_darkside_slomo
	if screenfx_fxinstanceexists viewport = 0 name = BowlDOF
		screenfx_updatefxinstanceparams {
			viewport = 0
			name = BowlDOF
			time = <BowlEndtime>
			type = dof
			on = 1
			backdist = 0.07
			strength = 0.0
			crossfade = 0.49
		}
	endif
	if screenfx_fxinstanceexists viewport = 0 name = Bowlnoise
		screenfx_updatefxinstanceparams {
			viewport = 0
			name = Bowlnoise
			time = <BowlEndtime>
			type = noise
			on = 1
			intensity = 0.0
			color = [249 249 249]
		}
	endif
	if screenfx_fxinstanceexists viewport = 0 name = BowlWashout
		screenfx_updatefxinstanceparams {
			viewport = 0
			name = BowlWashout
			time = <BowlEndtime>
			type = bright_sat
			on = 1
			contrast = 1.0
			red_mix = [1 0 0]
			green_mix = [0 1 0]
			blue_mix = [0 0 1]
			brightness = 1.0
			saturation = 1.0
			hue = 1
		}
	endif
	if (<BowlEndtime> > 0)
		wait 1 gameframe
		if screenfx_fxinstanceexists viewport = 0 name = Bowlfisheye
			screenfx_updatefxinstanceparams {
				viewport = 0
				name = Bowlfisheye
				time = 0.0
				type = fisheye
				on = 1
				warp_strength = (0.57 * <percent>)
			}
		endif
		wait 1 gameframe
		if screenfx_fxinstanceexists viewport = 0 name = Bowlfisheye
			screenfx_updatefxinstanceparams {
				viewport = 0
				name = Bowlfisheye
				time = 0.0
				type = fisheye
				on = 1
				warp_strength = (0.50666994 * <percent>)
			}
		endif
		wait 1 gameframe
		if screenfx_fxinstanceexists viewport = 0 name = Bowlfisheye
			screenfx_updatefxinstanceparams {
				viewport = 0
				name = Bowlfisheye
				time = 0.0
				type = fisheye
				on = 1
				warp_strength = (0.44333 * <percent>)
			}
		endif
		wait 1 gameframe
		if screenfx_fxinstanceexists viewport = 0 name = Bowlfisheye
			screenfx_updatefxinstanceparams {
				viewport = 0
				name = Bowlfisheye
				time = 0.0
				type = fisheye
				on = 1
				warp_strength = (0.38000003 * <percent>)
			}
		endif
		wait 1 gameframe
		if screenfx_fxinstanceexists viewport = 0 name = Bowlfisheye
			screenfx_updatefxinstanceparams {
				viewport = 0
				name = Bowlfisheye
				time = 0.0
				type = fisheye
				on = 1
				warp_strength = (0.31667003 * <percent>)
			}
		endif
		wait 1 gameframe
		if screenfx_fxinstanceexists viewport = 0 name = Bowlfisheye
			screenfx_updatefxinstanceparams {
				viewport = 0
				name = Bowlfisheye
				time = 0.0
				type = fisheye
				on = 1
				warp_strength = (0.25333 * <percent>)
			}
		endif
		wait 1 gameframe
		if screenfx_fxinstanceexists viewport = 0 name = Bowlfisheye
			screenfx_updatefxinstanceparams {
				viewport = 0
				name = Bowlfisheye
				time = 0.0
				type = fisheye
				on = 1
				warp_strength = (0.19 * <percent>)
			}
		endif
		wait 1 gameframe
		if screenfx_fxinstanceexists viewport = 0 name = Bowlfisheye
			screenfx_updatefxinstanceparams {
				viewport = 0
				name = Bowlfisheye
				time = 0.0
				type = fisheye
				on = 1
				warp_strength = (0.12667 * <percent>)
			}
		endif
		wait 1 gameframe
		if screenfx_fxinstanceexists viewport = 0 name = Bowlfisheye
			screenfx_updatefxinstanceparams {
				viewport = 0
				name = Bowlfisheye
				time = 0.0
				type = fisheye
				on = 1
				warp_strength = (0.06333 * <percent>)
			}
		endif
		wait 1 gameframe
	endif
	if screenfx_fxinstanceexists viewport = 0 name = Bowlfisheye
		screenfx_updatefxinstanceparams {
			viewport = 0
			name = Bowlfisheye
			time = 0.0
			type = fisheye
			on = 1
			warp_strength = 0.0
		}
	endif
	if screenfx_fxinstanceexists viewport = 0 name = Bowlfisheye
		screenfx_removefxinstance viewport = 0 name = Bowlfisheye
	endif
	if screenfx_fxinstanceexists viewport = 0 name = BowlDOF
		screenfx_removefxinstance viewport = 0 name = BowlDOF
	endif
	if screenfx_fxinstanceexists viewport = 0 name = Bowlnoise
		screenfx_removefxinstance viewport = 0 name = Bowlnoise
	endif
	if screenfx_fxinstanceexists viewport = 0 name = BowlWashout
		screenfx_removefxinstance viewport = 0 name = BowlWashout
	endif
endscript
