thin_fretbar_timesigs = {
	t2d4 = thin_fretbar_8note_params
	t3d4 = thin_fretbar_8note_params
	t4d4 = thin_fretbar_8note_params
	t5d4 = thin_fretbar_8note_params
	t6d4 = thin_fretbar_8note_params
	t3d8 = thin_fretbar_16note_params
	t6d8 = thin_fretbar_16note_params
	t12d8 = thin_fretbar_16note_params
}
default_thin_fretbar_8note_params_low_bpm = 1
default_thin_fretbar_8note_params_high_bpm = 180
default_thin_fretbar_16note_params_low_bpm = 1
default_thin_fretbar_16note_params_high_bpm = 120
thin_fretbar_8note_params_low_bpm = 1
thin_fretbar_8note_params_high_bpm = 180
thin_fretbar_16note_params_low_bpm = 1
thin_fretbar_16note_params_high_bpm = 120
fretbar_prefix_type = {
	thin = 'thin'
	medium = 'medium'
	thick = 'thick'
}

script create_fretbar \{scale = (40.0, 0.25)}
	create2dfretbar <...>
endscript

script fretbar_iterator 
	fretbar_iterator_cfunc_setup
	begin
	if fretbar_iterator_cfunc
		break
	endif
	wait \{1
		gameframe}
	repeat
	fretbar_iterator_cfunc_cleanup
endscript

script kill_fretbar2d 
	if screenelementexists id = <fretbar_id>
		destroygem name = <fretbar_id>
	endif
endscript

script fretbar_events 
	seteventhandler response = switch_script event = kill_objects scr = kill_fretbar2d params = {<...>} group = gem_group
endscript

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

script create_debug_measure_text 
	if NOT (<fretbar_scale> = thick)
		return
	endif
	if NOT screenelementexists \{id = hud_destroygroup_windowp1}
		return
	endif
	if NOT screenelementexists \{id = debug_measure_window}
		createscreenelement \{type = containerelement
			parent = hud_destroygroup_windowp1
			id = debug_measure_window
			pos = (0.0, 0.0)
			just = [
				left
				top
			]}
	endif
	formattext textname = measure_text "%i" i = <measure>
	formattext checksumname = measure_checksum 'measuretext_%i' i = <measure>
	createscreenelement {
		type = textelement
		parent = debug_measure_window
		id = <measure_checksum>
		font = text_a1
		pos = (2000.0, 32.0)
		just = [center top]
		scale = 1.0
		rgba = [210 210 210 250]
		text = <measure_text>
		z_priority = 1.0
	}
	spawnscriptnow move_debug_measure_text params = {<...>} id = debug_measure_text
endscript

script move_debug_measure_text 
	begin
	if compositeobjectexists <fretbar_id>
		<fretbar_id> :obj_getposition
		pos = (<pos> + (2.0, 0.0, 0.0))
		getviewport2dposfrom3d viewport = 1 pos = <pos>
		pos = (<posx> * (1.0, 0.0) + <posy> * (0.0, 1.0))
		<measure_checksum> :domorph pos = <pos>
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
