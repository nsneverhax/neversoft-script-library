
script camerablur_fastzoom_inandout 
	if NOT bg_fx_get_start_params \{viewport = bg_viewport
			effectname = depth_of_field__simplified_}
		return
	endif
	bg_fx_set_blur \{appendstrength = 1
		time = 0.1}
	wait \{0.2
		seconds}
	bg_fx_set_blur \{appendstrength = 0
		time = 0.3}
	wait \{0.2
		seconds}
	bg_fx_set_blur \{appendstrength = 0.5
		time = 0.1}
	wait \{0.1
		second}
	bg_fx_set_blur effectparams = <startvalue> time = 0.4
endscript

script camerablur_slowzoom_inandout 
	if NOT bg_fx_get_start_params \{viewport = bg_viewport
			effectname = depth_of_field__simplified_}
		return
	endif
	bg_fx_set_blur \{appendstrength = 1
		time = 0.5}
	wait \{0.4
		seconds}
	bg_fx_set_blur \{appendstrength = 0
		time = 0.4}
	wait \{0.5
		seconds}
	bg_fx_set_blur \{appendstrength = 1
		time = 0.3}
	wait \{0.3
		second}
	bg_fx_set_blur effectparams = <startvalue> time = 0.4
endscript

script camerablur_fast \{time = 0.2
		strength = 1}
	if NOT bg_fx_get_start_params \{viewport = bg_viewport
			effectname = depth_of_field__simplified_}
		return
	endif
	bg_fx_set_blur appendstrength = <strength> time = 0.01
	wait <time> second
	bg_fx_set_blur effectparams = <startvalue> time = <time>
endscript

script camerablur_focusout 
	if NOT bg_fx_get_start_params \{viewport = bg_viewport
			effectname = depth_of_field__simplified_}
		return
	endif
	bg_fx_set_blur \{appendstrength = 1
		time = 0.6}
endscript

script camerafx_whiteflash 
	if NOT bg_fx_get_start_params \{viewport = bg_viewport
			effectname = brightness___saturation}
		return
	endif
	bg_fx_set_brightness_whiteflash \{appendbrightness = 100
		time = 0}
	wait \{0.06
		second}
	if viewportexists \{id = bg_viewport}
		bg_fx_set_brightness_whiteflash effectparams = <startvalue> time = 0.06
	endif
endscript

script camerafx_blackfadein 
	if NOT bg_fx_get_start_params \{viewport = bg_viewport
			effectname = brightness___saturation}
		return
	endif
	onexitrun camerafx_blackfadein_cleanup params = {startvalue = <startvalue>}
	bg_fx_set_brightness_blackfade appendbrightness = 0 time = (<length> * 0.001)
	block
endscript

script camerafx_blackfadein_cleanup 
	if viewportexists \{id = bg_viewport}
		bg_fx_set_brightness_blackfade effectparams = <startvalue>
	endif
endscript

script camerafx_blackfadeout 
	if NOT bg_fx_get_start_params \{viewport = bg_viewport
			effectname = brightness___saturation}
		return
	endif
	bg_fx_set_brightness_blackfade \{appendbrightness = 0
		time = 0}
	wait \{1
		frame}
	bg_fx_set_brightness_blackfade effectparams = <startvalue> time = 0.75
endscript

script camerafx_blackfadeout_careerintro 
	if NOT bg_fx_get_start_params \{viewport = bg_viewport
			effectname = brightness___saturation}
		return
	endif
	bg_fx_set_brightness_blackfade \{appendbrightness = 0
		time = 0}
	wait \{1
		frame}
	bg_fx_set_brightness_blackfade effectparams = <startvalue> time = 0.5
endscript
