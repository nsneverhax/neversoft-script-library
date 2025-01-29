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
	fretbar_update_tempo_CFunc_Setup
	begin
	if fretbar_update_tempo_CFunc
		break
	endif
	WaitOneGameFrame
	repeat
	fretbar_update_tempo_CFunc_Cleanup
endscript

script fretbar_update_hammer_on_tolerance 
	fretbar_update_hammer_on_tolerance_CFunc_Setup
	begin
	if fretbar_update_hammer_on_tolerance_CFunc
		break
	endif
	WaitOneGameFrame
	repeat
	fretbar_update_hammer_on_tolerance_CFunc_Cleanup
endscript

script create_debug_measure_text 
	ScriptAssert \{'create_debug_measure_text: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script move_debug_measure_text 
	begin
	if CompositeObjectExists <fretbar_id>
		<fretbar_id> :Obj_GetPosition
		Pos = (<Pos> + (2.0, 0.0, 0.0))
		GetViewport2DPosFrom3D viewport = 1 Pos = <Pos>
		Pos = (<PosX> * (1.0, 0.0) + <PosY> * (0.0, 1.0))
		<measure_checksum> :legacydomorph Pos = <Pos>
		WaitOneGameFrame
	else
		DestroyScreenElement id = <measure_checksum>
		break
	endif
	repeat
endscript

script destroy_debug_measure_text 
	if ScreenElementExists \{id = debug_measure_window}
		DestroyScreenElement \{id = debug_measure_window}
	endif
	KillSpawnedScript \{id = debug_measure_text}
endscript
