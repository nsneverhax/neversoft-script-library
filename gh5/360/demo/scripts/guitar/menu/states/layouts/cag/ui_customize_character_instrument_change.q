
script ui_create_customize_character_instrument_change \{new_data = {
		}}
	requireparams \{[
			instrument
			new_data
		]
		all}
	spawnscriptnow ui_create_customize_character_instrument_change_spawned params = <...>
endscript

script ui_deinit_customize_character_instrument_change 
	change cas_current_instrument = ($cas_default_instrument)
	change \{in_cai = 0}
endscript

script ui_instrument_load_required 
	if ((<instrument> = vocals) || (<instrument> = guitar))
		return \{false}
	endif
	if gotparam \{old_instrument}
		if ((<old_instrument> = vocals) || (<old_instrument> = guitar))
			return \{false}
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
	push_unsafe_for_shutdown \{reason = ui_create_customize_character_instrument_change_spawned}
	cascancelloading
	if gotparam \{load_required}
	endif
	cas_instrument = <instrument>
	if ((<instrument> = guitar) || (<instrument> = vocals))
		cas_instrument = guitar_and_vocals
	endif
	if getcurrentcasobject
		if gotparam \{load_required}
			<cas_object> :hide
		endif
	endif
	change cas_current_instrument = <cas_instrument>
	cas_set_object_node_pos player = ($cas_current_player) instrument = <instrument>
	rebuildcurrentcasmodel instrument = <cas_instrument>
	if gotparam \{load_required}
		cas_queue_wait
		hide_glitch \{num_frames = 20}
	elseif (<instrument> = guitar_and_vocals)
		hide_glitch \{num_frames = 15}
	endif
	if getcurrentcasobject
		switch (<instrument>)
			case guitar
			bandmanager_changestance name = <cas_object> stance = stance_select_guitar no_wait
			case bass
			bandmanager_changestance name = <cas_object> stance = stance_select_guitar no_wait
			case vocals
			bandmanager_changestance name = <cas_object> stance = stance_select_mic no_wait
			case drum
			bandmanager_changestance name = <cas_object> stance = stance_select_drum no_wait
			default
			bandmanager_changestance name = <cas_object> stance = stance_frontend no_wait
		endswitch
	endif
	if ($in_cai = 0)
		change \{in_cai = 1}
		ui_cas_precache instrument = <instrument>
		ui_event_add_params old_instrument = <instrument>
		ui_event_add_params instrument = ($cas_default_instrument)
	else
		change \{in_cai = 0}
	endif
	if gotparam \{load_required}
		wait \{4
			gameframes}
	endif
	if gotparam \{load_required}
	endif
	pop_unsafe_for_shutdown \{reason = ui_create_customize_character_instrument_change_spawned}
	set_cas_loading_setup \{setup = single}
	if ($in_cai = 1)
		printstruct <...>
		ui_event_wait event = menu_change data = {state = <new_state> <new_data>}
	else
		ui_event_wait \{event = menu_back}
	endif
endscript
