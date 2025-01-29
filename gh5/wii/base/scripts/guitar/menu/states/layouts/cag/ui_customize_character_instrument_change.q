
script ui_create_customize_character_instrument_change \{new_data = {
		}}
	RequireParams \{[
			instrument
			new_data
		]
		all}
	SpawnScriptNow ui_create_customize_character_instrument_change_spawned params = <...>
endscript

script ui_deinit_customize_character_instrument_change 
	Change cas_current_instrument = ($cas_default_instrument)
	Change \{in_cai = 0}
endscript

script ui_instrument_load_required 
	if ((<instrument> = vocals) || (<instrument> = guitar))
		return \{FALSE}
	endif
	if GotParam \{old_instrument}
		if ((<old_instrument> = vocals) || (<old_instrument> = guitar))
			return \{FALSE}
		endif
	endif
	return \{true}
endscript

script ui_create_customize_character_instrument_change_spawned 
	if ui_instrument_load_required <...>
		load_required = 1
	else
		set_cas_loading_setup \{setup = hidden}
	endif
	mark_unsafe_for_shutdown
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
	if ((<instrument> = guitar) || (<instrument> = vocals))
		rebuildcurrentcasmodel instrument = <cas_instrument>
	else
		rebuildcurrentcasmodel instrument = <cas_instrument> force_update = 1
	endif
	if GotParam \{load_required}
		cas_queue_wait
		hide_glitch \{num_frames = 20}
	elseif (<instrument> = guitar_and_vocals)
		hide_glitch \{num_frames = 15}
	endif
	if getcurrentcasobject
		switch (<instrument>)
			case guitar
			bandmanager_changestance Name = <cas_object> stance = stance_select_guitar no_wait
			case bass
			bandmanager_changestance Name = <cas_object> stance = stance_select_guitar no_wait
			case vocals
			bandmanager_changestance Name = <cas_object> stance = stance_select_mic no_wait
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
	endif
	if GotParam \{load_required}
		Wait \{4
			gameframes}
	endif
	if GotParam \{load_required}
	endif
	mark_safe_for_shutdown
	set_cas_loading_setup \{setup = single}
	if ($in_cai = 1)
		printstruct <...>
		ui_event_wait event = menu_change data = {state = <new_state> <new_data>}
	else
		ui_event_wait \{event = menu_back}
	endif
endscript
