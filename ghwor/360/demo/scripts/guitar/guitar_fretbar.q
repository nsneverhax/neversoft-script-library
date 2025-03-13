thin_fretbar_timesigs = {
	t1d4 = thin_fretbar_8note_params
	t2d4 = thin_fretbar_8note_params
	t3d4 = thin_fretbar_8note_params
	t4d4 = thin_fretbar_8note_params
	t5d4 = thin_fretbar_8note_params
	t6d4 = thin_fretbar_8note_params
	t7d4 = thin_fretbar_8note_params
	t8d4 = thin_fretbar_8note_params
	t9d4 = thin_fretbar_8note_params
	t10d4 = thin_fretbar_8note_params
	t11d4 = thin_fretbar_8note_params
	t12d4 = thin_fretbar_8note_params
	t1d8 = thin_fretbar_16note_params
	t2d8 = thin_fretbar_16note_params
	t3d8 = thin_fretbar_16note_params
	t4d8 = thin_fretbar_16note_params
	t5d8 = thin_fretbar_16note_params
	t6d8 = thin_fretbar_16note_params
	t7d8 = thin_fretbar_16note_params
	t8d8 = thin_fretbar_16note_params
	t9d8 = thin_fretbar_16note_params
	t10d8 = thin_fretbar_16note_params
	t11d8 = thin_fretbar_16note_params
	t12d8 = thin_fretbar_16note_params
	t7d16 = thin_fretbar_16note_params
}
default_thin_fretbar_8note_params_low_bpm = 1
default_thin_fretbar_8note_params_high_bpm = 150
default_thin_fretbar_16note_params_low_bpm = 1
default_thin_fretbar_16note_params_high_bpm = 120
thin_fretbar_8note_params_low_bpm = 1
thin_fretbar_8note_params_high_bpm = 150
thin_fretbar_16note_params_low_bpm = 1
thin_fretbar_16note_params_high_bpm = 120
fretbar_prefix_type = {
	thin = 'thin'
	medium = 'medium'
	thick = 'thick'
}

script fretbar_update_tempo 
	fretbar_update_tempo_cfunc_setup
	begin
	if fretbar_update_tempo_cfunc
		break
	endif
	wait \{1
		gameframe}
	repeat
	fretbar_update_tempo_cfunc_cleanup
endscript

script fretbar_update_hammer_on_tolerance 
	fretbar_update_hammer_on_tolerance_cfunc_setup
	begin
	if fretbar_update_hammer_on_tolerance_cfunc
		break
	endif
	wait \{1
		gameframe}
	repeat
	fretbar_update_hammer_on_tolerance_cfunc_cleanup
endscript

script move_debug_measure_text 
	begin
	if compositeobjectexists <fretbar_id>
		<fretbar_id> :obj_getposition
		pos = (<pos> + (2.0, 0.0, 0.0))
		getviewport2dposfrom3d viewport = 1 pos = <pos>
		pos = (<posx> * (1.0, 0.0) + <posy> * (0.0, 1.0))
		<measure_checksum> :legacydomorph pos = <pos>
		wait \{1
			gameframe}
	else
		destroyscreenelement id = <measure_checksum>
		break
	endif
	repeat
endscript

script destroy_debug_measure_text 
	if screenelementexists \{id = debug_measure_window}
		destroyscreenelement \{id = debug_measure_window}
	endif
	killspawnedscript \{id = debug_measure_text}
endscript
