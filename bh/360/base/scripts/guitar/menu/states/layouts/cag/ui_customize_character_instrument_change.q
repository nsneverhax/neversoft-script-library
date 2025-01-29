
script ui_create_customize_character_instrument_change \{new_data = {
		}}
	RequireParams \{[
			instrument
			new_data
		]
		all}
	spawnscriptnow ui_create_customize_character_instrument_change_spawned params = <...>
endscript

script ui_deinit_customize_character_instrument_change 
	Change cas_current_instrument = ($cas_default_instrument)
	Change \{in_cai = 0}
endscript

script ui_instrument_load_required 
	if ((<instrument> = vocals) || (<instrument> = guitar))
		return \{false}
	endif
	if GotParam \{old_instrument}
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
	CasCancelLoading
	if GotParam \{load_required}
	endif
	cas_instrument = <instrument>
	if ((<instrument> = guitar) || (<instrument> = vocals))
		cas_instrument = guitar_and_vocals
	endif
	if GetCurrentCASObject
		if GotParam \{load_required}
			<cas_object> :hide
		endif
	endif
	Change cas_current_instrument = <cas_instrument>
	cas_set_object_node_pos player = ($cas_current_player) instrument = <instrument>
	RebuildCurrentCASModel instrument = <cas_instrument>
	if GotParam \{load_required}
		cas_queue_wait
		hide_glitch \{num_frames = 20}
	elseif (<instrument> = guitar_and_vocals)
		hide_glitch \{num_frames = 15}
	endif
	if GetCurrentCASObject
		switch (<instrument>)
			case guitar
			bandmanager_changestance name = <cas_object> stance = Stance_Select_Guitar no_wait
			case bass
			bandmanager_changestance name = <cas_object> stance = Stance_Select_Guitar no_wait
			case vocals
			bandmanager_changestance name = <cas_object> stance = Stance_Select_Mic no_wait
			case Drum
			bandmanager_changestance name = <cas_object> stance = Stance_Select_Drum no_wait
			default
			bandmanager_changestance name = <cas_object> stance = Stance_FrontEnd no_wait
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
		wait \{4
			gameframes}
	endif
	if GotParam \{load_required}
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
