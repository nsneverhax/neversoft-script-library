
script pre_gameserver_callback 
	script_callback_script_cfunc
endscript

script script_callback_script 
endscript

script script_postcallback_script 
	UpdateGuitarFuncs
	if NOT GameIsPaused
		GetDeltaTime \{ignore_slomo}
		Update2DParticleSystems delta_time = <delta_time>
		RunQueuedPulseEvents
		CheckBossCutoff
		if ($output_gpu_log = 1)
			GetProfileData \{cpu = 1
				Name = gpu}
			milliseconds = (<microseconds> / 1000.0)
			GetSongTime
			formatText TextName = text qs(0x8a7791b0) s = <songtime> m = <milliseconds> DontAssertForChecksums
			TextOutput text = <text>
		endif
	endif
	Change current_frame_toggle = (1 - $current_frame_toggle)
endscript

script screenelement_postcallback_script 
endscript
