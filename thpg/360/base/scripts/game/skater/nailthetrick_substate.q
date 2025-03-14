NttSubStateExceptions = [
	{
		response = switch_script
		event = NailTheTrick
		scr = nail_the_trick
	}
	{
		response = switch_script
		event = landed
		scr = nail_bail_forced_bail
		params = {
			BoardAlwaysOn = 0
			sub_state
		}
	}
	{
		response = switch_script
		event = pointrail
		scr = pointrail
	}
	{
		response = switch_script
		event = pointrailspin
		scr = pointrailspin
	}
]

script nttss_should_update_for_sub_state 
	if isinnailthegrab
		return \{false}
	endif
	if isinnailthemanual
		return \{false}
	endif
	return \{true}
endscript

script nttss_trick_from_sub_state 
	if gotparam \{from_nail_the_grab}
		nailthegrab_startgrabtofliptrick
	endif
endscript

script nttss_bail_exit_logic 
	sub = 0
	if nailthegrab_istryingtoexit \{check_finger_flip}
		<sub> = 1
	endif
	if gotparam \{from_sub_state_in_ntt}
		<sub> = 1
	endif
	if (<sub> = 1)
		ntt_sub_state_exit_hack \{no_exit}
	endif
endscript

script nttss_get_enter_from_nail_sub_state 
	if gotparam \{from_nail_the_grab}
		enter_from_nail_sub_state = 1
	endif
	if gotparam \{from_nail_the_manual}
		enter_from_nail_sub_state = 1
	endif
	return <...>
endscript

script nttss_get_exit_to_nail_sub_state 
	if isinnailthegrab
		exit_to_nail_sub_state = 1
	endif
	if isinnailthemanual
		exit_to_nail_sub_state = 1
	endif
	return <...>
endscript

script nttss_start_sub_state 
	nailthetrick_decelerateboardroatation \{decelerate_adj = 0.1}
	reseteventhandlersfromtable \{NttSubStateExceptions}
	setqueuetricks \{NttAbortCommand}
endscript

script nttss_landed_state_default_exit 
	ntt_exit \{force_full_exit
		from_sub_state}
	ntt_cam_exit
endscript
