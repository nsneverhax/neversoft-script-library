
script timer_callback_script 
	if ($input_mode = play)
		playback_timer
	endif
endscript

script script_callback_script 
	script_callback_script_cfunc
endscript

script script_postcallback_script 
	updateguitarfuncs
	if NOT gameispaused
		getdeltatime
		update2dparticlesystems delta_time = <delta_time>
		runqueuedpulseevents
		checkbosscutoff
		if ($output_gpu_log = 1)
			if isps3
				getprofiledata \{cpu = 2
					name = gpu}
			else
				getprofiledata \{cpu = 6
					name = gpu}
			endif
			milliseconds = (<microseconds> / 1000.0)
			getsongtime
			formattext textname = text "GPU Time; %s; %m" s = <songtime> m = <milliseconds> dontassertforchecksums
			textoutput text = <text>
		endif
	endif
endscript

script screenelement_postcallback_script 
	update_highway_prepass
endscript
