
script pre_gameserver_callback 
	script_callback_script_cfunc
endscript

script script_callback_script 
endscript

script script_postcallback_script 
	UpdateGuitarFuncs
	if NOT GameIsPaused
		GetDeltaTime
		Update2DParticleSystems delta_time = <delta_time>
		RunQueuedPulseEvents
		CheckBossCutoff
		if ($output_gpu_log = 1)
			ngc_getgputimems
		endif
	endif
	Change current_frame_toggle = (1 - $current_frame_toggle)
endscript

script screenelement_postcallback_script 
endscript
