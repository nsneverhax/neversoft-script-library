
script ui_fx_set_effect 
	RequireParams \{[
			amount
			effectname
			viewport
			effectparams
			amountparamname
		]
		all}
	AddParam structure_name = effectparams Name = <amountparamname> value = <amount>
	<tolerance> = 0.01
	if (<amount> > <tolerance>)
		if screenFX_FXInstanceExists viewport = <viewport> Name = <effectname>
			ScreenFX_UpdateFXInstanceParams {
				<effectparams>
				viewport = <viewport>
				Name = <effectname>
			}
		else
			printf qs(0xaea1ec6c) s = <effectname>
			ScreenFX_AddFXInstance {
				<effectparams>
				viewport = <viewport>
				Name = <effectname>
			}
		endif
	else
		if screenFX_FXInstanceExists viewport = <viewport> Name = <effectname>
			printf qs(0x47f5c3d1) s = <effectname>
			ScreenFX_RemoveFXInstance viewport = <viewport> Name = <effectname>
		endif
	endif
endscript

script ui_fx_get_start_value 
	RequireParams \{[
			effectname
			viewport
			amountparamname
		]
		all}
	<startvalue> = 0.0
	if screenFX_FXInstanceExists viewport = <viewport> Name = <effectname>
		if ScreenFX_GetActiveScreenFXInstances viewport = <viewport> effectname = <effectname>
			if StructureContains structure = <cureffect> <amountparamname>
				<startvalue> = (<cureffect>.<amountparamname>)
			endif
		endif
	endif
	return startvalue = <startvalue>
endscript

script ui_fx_adjust_effect 
	RequireParams \{[
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
		RequireParams \{[
				startvalue
			]
			all}
		GetTrueStartTime
		<starttimeseconds> = (<starttime> / 1000.0)
		begin
		GetTrueStartTime
		<curtimeseconds> = (<starttime> / 1000.0)
		<elapsedtimeseconds> = (<curtimeseconds> - <starttimeseconds>)
		if (<elapsedtimeseconds> >= <time>)
			<elapsedtimeseconds> = <time>
			<done> = true
		else
			<done> = FALSE
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
		Wait \{1
			gameframes}
		repeat
	endif
endscript

script ui_fx_set_noise \{amount = 0.5
		time = 0
		viewport = UI}
	<effectparams> = {
		On = 1
		Type = noise2
		Color = [0.5 0.5 0.5 0.5]
		uv = [8.0 6.0 0.0 0.0]
	}
	KillSpawnedScript \{id = ui_fx_noise_interpolation}
	SpawnScriptNow {
		ui_fx_adjust_effect
		id = ui_fx_noise_interpolation
		params = {
			viewport = <viewport>
			time = <time>
			amount = <amount>
			amountparamname = Intensity
			effectname = uinoise
			effectparams = <effectparams>
		}
	}
endscript

script ui_fx_set_blur \{amount = 0.5
		time = 0
		viewport = UI}
	effectparams = {
		On = 1
		Type = dof3
		nearblurend = 0.0
		farblurbegin = 0.0
		farblurend = 0.0
	}
	KillSpawnedScript \{id = ui_fx_dof_interpolation}
	SpawnScriptNow {
		ui_fx_adjust_effect
		id = ui_fx_dof_interpolation
		params = {
			viewport = <viewport>
			time = <time>
			amount = <amount>
			amountparamname = Strength
			effectname = uidof
			effectparams = <effectparams>
		}
	}
endscript
