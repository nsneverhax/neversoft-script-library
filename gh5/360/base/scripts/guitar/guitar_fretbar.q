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
	Wait \{1
		gameframe}
	repeat
	fretbar_update_tempo_CFunc_Cleanup
endscript

script fretbar_update_hammer_on_tolerance 
	fretbar_update_hammer_on_tolerance_CFunc_Setup
	begin
	if fretbar_update_hammer_on_tolerance_CFunc
		break
	endif
	Wait \{1
		gameframe}
	repeat
	fretbar_update_hammer_on_tolerance_CFunc_Cleanup
endscript

script create_debug_measure_text 
	if NOT (<fretbar_scale> = thick)
		return
	endif
	if NOT ScreenElementExists \{id = hud_destroygroup_windowp1}
		return
	endif
	if NOT ScreenElementExists \{id = debug_measure_window}
		CreateScreenElement \{Type = ContainerElement
			parent = hud_destroygroup_windowp1
			id = debug_measure_window
			Pos = (0.0, 0.0)
			just = [
				left
				top
			]}
	endif
	formatText TextName = measure_text qs(0xc31d83ea) i = <measure>
	formatText checksumName = measure_checksum 'measuretext_%i' i = <measure>
	CreateScreenElement {
		Type = TextElement
		parent = debug_measure_window
		id = <measure_checksum>
		font = debug
		Pos = (2000.0, 32.0)
		just = [center top]
		Scale = 1.0
		rgba = [210 210 210 250]
		text = <measure_text>
		z_priority = 1.0
	}
	SpawnScriptNow move_debug_measure_text params = {<...>} id = debug_measure_text
endscript

script move_debug_measure_text 
	begin
	if CompositeObjectExists <fretbar_id>
		<fretbar_id> :Obj_GetPosition
		Pos = (<Pos> + (2.0, 0.0, 0.0))
		GetViewport2DPosFrom3D viewport = 1 Pos = <Pos>
		Pos = (<PosX> * (1.0, 0.0) + <PosY> * (0.0, 1.0))
		<measure_checksum> :legacydomorph Pos = <Pos>
		Wait \{1
			gameframe}
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
