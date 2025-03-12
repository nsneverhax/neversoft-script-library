
script bg_fx_set_blur \{time = 0
		viewport = bg_viewport
		effectname = depth_of_field__simplified_}
	if gotparam \{appendstrength}
		effectparams = {
			on = 1
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 0.0
			farblurend = 0.0
			strength = <appendstrength>
		}
	else
		if NOT gotparam \{effectparams}
			return
		endif
	endif
	if screenfx_fxinstanceexists viewport = <viewport> name = <effectname>
		screenfx_updatefxinstanceparams {
			<effectparams>
			viewport = <viewport>
			name = <effectname>
			time = <time>
		}
	else
		printf \{qs(0x429f7784)}
	endif
endscript

script bg_fx_set_brightness_whiteflash \{time = 0
		viewport = bg_viewport
		effectname = brightness___saturation}
	if gotparam \{appendbrightness}
		effectparams = {
			on = 1
			brightness = <appendbrightness>
			contrast = 0
			hue = 1.0
			saturation = 0.5348
			red_mix_r = 1
			red_mix_g = 0
			red_mix_b = 0
			green_mix_r = 0
			green_mix_g = 1
			green_mix_b = 0
			blue_mix_r = 0
			blue_mix_g = 0
			blue_mix_b = 1
		}
	else
		if NOT gotparam \{effectparams}
			return
		endif
	endif
	if screenfx_fxinstanceexists viewport = <viewport> name = <effectname>
		screenfx_updatefxinstanceparams {
			<effectparams>
			viewport = <viewport>
			name = <effectname>
			time = <time>
		}
	else
		printf \{qs(0x0aa7156d)}
	endif
endscript

script bg_fx_set_brightness_blackfade \{time = 0
		viewport = bg_viewport
		effectname = brightness___saturation}
	if gotparam \{appendbrightness}
		effectparams = {
			on = 1
			brightness = <appendbrightness>
		}
	else
		if NOT gotparam \{effectparams}
			return
		endif
	endif
	if screenfx_fxinstanceexists viewport = <viewport> name = <effectname>
		screenfx_updatefxinstanceparams {
			<effectparams>
			viewport = <viewport>
			name = <effectname>
			time = <time>
		}
	else
		printf \{qs(0x0aa7156d)}
	endif
endscript

script bg_fx_get_start_params 
	requireparams \{[
			effectname
			viewport
		]
		all}
	<startvalue> = {}
	<rv> = false
	if screenfx_fxinstanceexists viewport = <viewport> name = <effectname>
		if screenfx_getactivescreenfxinstances viewport = <viewport> effectname = <effectname>
			<startvalue> = <cureffect>
			<rv> = true
		endif
	endif
	return {
		<rv>
		startvalue = <startvalue>
	}
endscript
