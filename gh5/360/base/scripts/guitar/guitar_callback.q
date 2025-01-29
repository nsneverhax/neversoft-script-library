
script timer_callback_script 
	if ($input_mode = Play)
		playback_timer
	endif
endscript

script pre_gameserver_callback 
	script_callback_script_cfunc
endscript

script script_postcallback_script 
	UpdateGuitarFuncs
	if NOT GameIsPaused
		GetDeltaTime \{ignore_slomo}
		Update2DParticleSystems delta_time = <delta_time>
		RunQueuedPulseEvents
		if ($output_gpu_log = 1)
			if ($gpu_log_start_logging)
				GetProfileData \{cpu = 6
					Name = gpu}
				milliseconds = (<microseconds> / 1000.0)
				if (<milliseconds> > 0.0)
					GetSongTime
					formatText TextName = text qs(0x8a7791b0) s = <songtime> m = <milliseconds> DontAssertForChecksums
					TextOutput text = <text>
				endif
			endif
		endif
	endif
endscript

script screenelement_postcallback_script 
endscript
