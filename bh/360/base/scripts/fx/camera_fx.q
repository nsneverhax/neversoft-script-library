
script CameraBlur_FastZoom_InandOut 
	if NOT BG_fx_get_start_params \{viewport = bg_viewport
			effectname = Depth_of_Field__simplified_}
		return
	endif
	BG_fx_set_blur \{appendStrength = 1
		time = 0.1}
	wait \{0.2
		seconds}
	BG_fx_set_blur \{appendStrength = 0
		time = 0.3}
	wait \{0.2
		seconds}
	BG_fx_set_blur \{appendStrength = 0.5
		time = 0.1}
	wait \{0.1
		second}
	BG_fx_set_blur effectParams = <startValue> time = 0.4
endscript

script CameraBlur_SlowZoom_InandOut 
	if NOT BG_fx_get_start_params \{viewport = bg_viewport
			effectname = Depth_of_Field__simplified_}
		return
	endif
	BG_fx_set_blur \{appendStrength = 1
		time = 0.5}
	wait \{0.4
		seconds}
	BG_fx_set_blur \{appendStrength = 0
		time = 0.4}
	wait \{0.5
		seconds}
	BG_fx_set_blur \{appendStrength = 1
		time = 0.3}
	wait \{0.3
		second}
	BG_fx_set_blur effectParams = <startValue> time = 0.4
endscript

script CameraBlur_FocusIn 
	if NOT BG_fx_get_start_params \{viewport = bg_viewport
			effectname = Depth_of_Field__simplified_}
		return
	endif
	BG_fx_set_blur \{appendStrength = 1
		time = 0}
	wait \{0.1
		second}
	BG_fx_set_blur effectParams = <startValue> time = 0.5
endscript

script CameraBlur_FocusOut 
	if NOT BG_fx_get_start_params \{viewport = bg_viewport
			effectname = Depth_of_Field__simplified_}
		return
	endif
	BG_fx_set_blur \{appendStrength = 1
		time = 0.6}
endscript

script CameraFX_WhiteFlash 
	if NOT BG_fx_get_start_params \{viewport = bg_viewport
			effectname = Brightness___Saturation}
		return
	endif
	BG_fx_set_brightness_WhiteFlash \{appendBrightness = 100
		time = 0}
	wait \{0.06
		second}
	if ViewportExists \{id = bg_viewport}
		BG_fx_set_brightness_WhiteFlash effectParams = <startValue> time = 0.06
	endif
endscript

script CameraFX_BlackFadeIn 
	if NOT BG_fx_get_start_params \{viewport = bg_viewport
			effectname = Brightness___Saturation}
		return
	endif
	OnExitRun CameraFX_BlackFadeIn_Cleanup params = {startValue = <startValue>}
	BG_fx_set_brightness_BlackFade appendBrightness = 0 time = (<length> * 0.001)
	Block
endscript

script CameraFX_BlackFadeIn_Cleanup 
	if ViewportExists \{id = bg_viewport}
		BG_fx_set_brightness_BlackFade effectParams = <startValue>
	endif
endscript

script CameraFX_BlackFadeOut 
	if NOT BG_fx_get_start_params \{viewport = bg_viewport
			effectname = Brightness___Saturation}
		return
	endif
	BG_fx_set_brightness_BlackFade \{appendBrightness = 0
		time = 0}
	wait \{1
		frame}
	BG_fx_set_brightness_BlackFade effectParams = <startValue> time = 0.75
endscript

script CameraFX_BlackFadeOut_CareerIntro 
	if NOT BG_fx_get_start_params \{viewport = bg_viewport
			effectname = Brightness___Saturation}
		return
	endif
	BG_fx_set_brightness_BlackFade \{appendBrightness = 0
		time = 0}
	wait \{1
		frame}
	BG_fx_set_brightness_BlackFade effectParams = <startValue> time = 0.5
endscript
