
script ui_create_customize_character_instrument_change \{new_data = {
		}
		instrument = !q1768515945
		old_instrument = None}
	if ($g_cas_instrument_menu_hack = 1)
		if ($in_cai = 1)
			instrument = <old_instrument>
			old_instrument = None
			force_update = 1
		endif
	endif
	if ui_instrument_load_required {
			old_instrument = <old_instrument>
			instrument = <instrument>
		}
		load_required = 1
	else
		set_cas_loading_setup \{setup = hidden}
	endif
	pushunsafeforshutdown \{context = ui_create_customize_character_instrument_change}
	cascancelloading
	if GotParam \{load_required}
	endif
	cas_instrument = <instrument>
	if ((<instrument> = guitar) || (<instrument> = vocals))
		cas_instrument = guitar_and_vocals
	endif
	if getcurrentcasobject
		if GotParam \{load_required}
			<cas_object> :Hide
		endif
	endif
	Change cas_current_instrument = <cas_instrument>
	cas_set_object_node_pos Player = ($cas_current_player) instrument = <instrument>
	rebuildcurrentcasmodel instrument = <cas_instrument> force_update = <force_update>
	if GotParam \{load_required}
		cas_queue_wait
		hide_glitch \{num_frames = 20}
	elseif (<instrument> = guitar_and_vocals)
		hide_glitch \{num_frames = 15}
	endif
	if getcurrentcasobject
		switch (<instrument>)
			case guitar
			case bass
			bandmanager_changestance Name = <cas_object> stance = stance_select_guitar no_wait
			case vocals
			bandmanager_changestance Name = <cas_object> stance = stance_select_microphone no_wait
			case drum
			bandmanager_changestance Name = <cas_object> stance = stance_select_drum no_wait
			default
			bandmanager_changestance Name = <cas_object> stance = stance_frontend no_wait
		endswitch
	endif
	if ($in_cai = 0)
		Change \{in_cai = 1}
		ui_cas_precache instrument = <instrument>
		ui_event_add_params old_instrument = <instrument>
		ui_event_add_params instrument = ($cas_default_instrument)
	else
		Change \{in_cai = 0}
		if ($g_cas_instrument_menu_hack = 1)
			if (<instrument> != drum)
				bandmanager_changestance Name = <cas_object> stance = stance_frontend no_wait
			endif
		endif
	endif
	if GotParam \{load_required}
		Wait \{4
			gameframes}
	endif
	if GotParam \{load_required}
	endif
	popunsafeforshutdown \{context = ui_create_customize_character_instrument_change}
	set_cas_loading_setup \{setup = single}
	if ($in_cai = 1)
		printstruct <...>
		ui_event_wait event = menu_change data = {state = <new_state> <new_data> old_instrument = <instrument>}
	else
		ui_event_wait \{event = menu_back}
	endif
endscript

script ui_deinit_customize_character_instrument_change 
	if ($g_cas_instrument_menu_hack = 0)
		Change cas_current_instrument = ($cas_default_instrument)
	endif
	Change \{in_cai = 0}
endscript

script ui_instrument_load_required \{instrument = !q1768515945
		old_instrument = !q1768515945}
	if ((<instrument> = vocals) || (<instrument> = guitar))
		return \{FALSE}
	endif
	if ((<old_instrument> = vocals) || (<old_instrument> = guitar))
		return \{FALSE}
	endif
	return \{true}
endscript
