
script timer_callback_script 
	if ($input_mode = play)
		playback_timer
	endif
endscript

script pre_gameserver_callback 
	script_callback_script_cfunc
endscript

script script_postcallback_script 
	updateguitarfuncs
	if NOT gameispaused
		getdeltatime \{ignore_slomo}
		update2dparticlesystems delta_time = <delta_time>
		runqueuedpulseevents
		if ($output_gpu_log = 1)
			if ($gpu_log_start_logging)
				getprofiledata \{cpu = 6
					name = gpu}
				milliseconds = (<microseconds> / 1000.0)
				if (<milliseconds> > 0.0)
					getsongtime
					lightshow_getparams
					if NOT gotparam \{previous_snapshot}
						<previous_snapshot> = none
					endif
					formattext textname = text qs(0xf3970fdf) s = <songtime> m = <milliseconds> l = <previous_snapshot> dontassertforchecksums
					textoutput text = <text>
				endif
			endif
		endif
	endif
endscript

script screenelement_postcallback_script 
endscript
