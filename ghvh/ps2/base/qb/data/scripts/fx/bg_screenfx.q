
script bg_fx_set_blur \{time = 0
		viewport = bg_viewport
		effectname = depth_of_field__simplified_}
	if GotParam \{appendstrength}
		effectparams = {
			On = 1
			nearblurbegin = 0.0
			nearblurend = 0.0
			farblurbegin = 0.0
			farblurend = 0.0
			Strength = <appendstrength>
		}
	else
		if NOT GotParam \{effectparams}
			return
		endif
	endif
	if screenFX_FXInstanceExists viewport = <viewport> Name = <effectname>
		ScreenFX_UpdateFXInstanceParams {
			<effectparams>
			viewport = <viewport>
			Name = <effectname>
			time = <time>
		}
	else

	endif
endscript

script bg_fx_set_brightness_whiteflash \{time = 0
		viewport = bg_viewport
		effectname = brightness___saturation}
	if GotParam \{appendbrightness}
		effectparams = {
			On = 1
			Brightness = <appendbrightness>
			Contrast = 0
			Hue = 1.0
			Saturation = 0.5348
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
		if NOT GotParam \{effectparams}
			return
		endif
	endif
	if screenFX_FXInstanceExists viewport = <viewport> Name = <effectname>
		ScreenFX_UpdateFXInstanceParams {
			<effectparams>
			viewport = <viewport>
			Name = <effectname>
			time = <time>
		}
	else

	endif
endscript

script bg_fx_set_brightness_blackfade \{time = 0
		viewport = bg_viewport
		effectname = brightness___saturation}
	if GotParam \{appendbrightness}
		effectparams = {
			On = 1
			Brightness = <appendbrightness>
			Contrast = 1
			Hue = 1.0
			Saturation = 0
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
		if NOT GotParam \{effectparams}
			return
		endif
	endif
	if screenFX_FXInstanceExists viewport = <viewport> Name = <effectname>
		ScreenFX_UpdateFXInstanceParams {
			<effectparams>
			viewport = <viewport>
			Name = <effectname>
			time = <time>
		}
	else

	endif
endscript

script bg_fx_get_start_params 

	<startvalue> = {}
	<rv> = FALSE
	if screenFX_FXInstanceExists viewport = <viewport> Name = <effectname>
		ScreenFX_GetActiveScreenFXInstances viewport = <viewport>
		GetArraySize \{curscreenfx}
		<i> = 0
		begin
		<cureffect> = (<curscreenfx> [<i>])
		<0x73fd75be> = (<cureffect>.Name)
		if (<0x73fd75be> = <effectname>)
			<startvalue> = <cureffect>
			<rv> = true
			break
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	return {
		<rv>
		startvalue = <startvalue>
	}
endscript
