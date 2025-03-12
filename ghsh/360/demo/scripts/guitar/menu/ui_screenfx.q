
script ui_fx_set_effect 
	requireparams \{[
			amount
			effectname
			viewport
			effectparams
			amountparamname
		]
		all}
	addparam structure_name = effectparams name = <amountparamname> value = <amount>
	<tolerance> = 0.01
	if (<amount> > <tolerance>)
		if screenfx_fxinstanceexists viewport = <viewport> name = <effectname>
			screenfx_updatefxinstanceparams {
				<effectparams>
				viewport = <viewport>
				name = <effectname>
			}
		else
			printf qs(0xaea1ec6c) s = <effectname>
			screenfx_addfxinstance {
				<effectparams>
				viewport = <viewport>
				name = <effectname>
			}
		endif
	else
		if screenfx_fxinstanceexists viewport = <viewport> name = <effectname>
			printf qs(0x47f5c3d1) s = <effectname>
			screenfx_removefxinstance viewport = <viewport> name = <effectname>
		endif
	endif
endscript

script ui_fx_get_start_value 
	requireparams \{[
			effectname
			viewport
			amountparamname
		]
		all}
	<startvalue> = 0.0
	if screenfx_fxinstanceexists viewport = <viewport> name = <effectname>
		if screenfx_getactivescreenfxinstances viewport = <viewport> effectname = <effectname>
			if structurecontains structure = <cureffect> <amountparamname>
				<startvalue> = (<cureffect>.<amountparamname>)
			endif
		endif
	endif
	return startvalue = <startvalue>
endscript

script ui_fx_adjust_effect 
	requireparams \{[
			time
			amount
			effectname
			viewport
			effectparams
			amountparamname
		]
		all}
	if (<time> = 0)
		ui_fx_set_effect {
			viewport = <viewport>
			amount = <amount>
			amountparamname = <amountparamname>
			effectname = <effectname>
			effectparams = <effectparams>
		}
	else
		ui_fx_get_start_value viewport = <viewport> effectname = <effectname> amountparamname = <amountparamname>
		requireparams \{[
				startvalue
			]
			all}
		gettruestarttime
		<starttimeseconds> = (<starttime> / 1000.0)
		begin
		gettruestarttime
		<curtimeseconds> = (<starttime> / 1000.0)
		<elapsedtimeseconds> = (<curtimeseconds> - <starttimeseconds>)
		if (<elapsedtimeseconds> >= <time>)
			<elapsedtimeseconds> = <time>
			<done> = true
		else
			<done> = false
		endif
		interpolateparameters a = {value = <startvalue>} b = {value = <amount>} proportion = (<elapsedtimeseconds> / <time>)
		ui_fx_set_effect {
			viewport = <viewport>
			amount = (<interpolated>.value)
			amountparamname = <amountparamname>
			effectname = <effectname>
			effectparams = <effectparams>
		}
		if (<done> = true)
			break
		endif
		wait \{1
			gameframes}
		repeat
	endif
endscript

script ui_fx_set_noise \{amount = 0.5
		time = 0
		viewport = ui}
	<effectparams> = {
		on = 1
		type = noise2
		color = [0.5 0.5 0.5 0.5]
		uv = [8.0 6.0 0.0 0.0]
	}
	killspawnedscript \{id = ui_fx_noise_interpolation}
	spawnscriptnow {
		ui_fx_adjust_effect
		id = ui_fx_noise_interpolation
		params = {
			viewport = <viewport>
			time = <time>
			amount = <amount>
			amountparamname = intensity
			effectname = uinoise
			effectparams = <effectparams>
		}
	}
endscript

script ui_fx_set_blur \{amount = 0.5
		time = 0
		viewport = ui}
	effectparams = {
		on = 1
		type = dof3
		nearblurend = 0.0
		farblurbegin = 0.0
		farblurend = 0.0
	}
	killspawnedscript \{id = ui_fx_dof_interpolation}
	spawnscriptnow {
		ui_fx_adjust_effect
		id = ui_fx_dof_interpolation
		params = {
			viewport = <viewport>
			time = <time>
			amount = <amount>
			amountparamname = strength
			effectname = uidof
			effectparams = <effectparams>
		}
	}
endscript
