
script timer_callback_script 
	if ($input_mode = Play)
		playback_timer
	endif
endscript

script script_callback_script 
	script_callback_script_cfunc
endscript

script script_postcallback_script 
	UpdateGuitarFuncs
	if NOT GameIsPaused
		GetDeltaTime
		Update2DParticleSystems delta_time = <delta_time>
		RunQueuedPulseEvents
		CheckBossCutoff
		if ($output_gpu_log = 1)
			if isngc
				ngc_getgputimems
				milliseconds = <gputime>
			else
				if isps3
					GetProfileData \{cpu = 2
						Name = gpu}
				else
					GetProfileData \{cpu = 6
						Name = gpu}
				endif
			endif
			if NOT (isngc)
			endif
			GetSongTime
			formatText TextName = text 'GPU Time; %s; %m' s = <songtime> m = <milliseconds> DontAssertForChecksums
			TextOutput text = <text>
		endif
	endif
	Change current_frame_toggle = (1 - $current_frame_toggle)
endscript

script screenelement_postcallback_script 
	update_highway_prepass
endscript
