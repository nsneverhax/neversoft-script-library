
script 0x56423850 \{chromatic = 0}


	if NOT GuitarGetAnalogueInfo controller = <controller>
		return \{FALSE}
	endif
	if GotParam \{rhythm}
		if (<chromatic> = 0)
			return
		endif
		0xa82719a9 = 0
	else
		0xa82719a9 = <chromatic>
	endif
	<spc_v_dist> = <righty>
	jam_calc_line_rot Player = <Player> spc_v_dist = <spc_v_dist>
	if NOT (<0xa82719a9> = 1)
		if (<line_rot> <= 30)
			new_tilt = 0
		else
			new_tilt = 1
		endif
	else
		if (<line_rot> <= 1)
			new_tilt = 0
		elseif (<line_rot> > 1 && <line_rot> < 40)
			new_tilt = 1
		elseif (<line_rot> >= 40 && <line_rot> < 80)
			new_tilt = 2
		else
			new_tilt = 3
		endif
	endif
	if GotParam \{melody}
		Change jam_tilt_melody = <new_tilt>
	elseif GotParam \{rhythm}
		Change jam_tilt_rhythm = <new_tilt>
	elseif GotParam \{lead}
		Change jam_tilt_lead = <new_tilt>
	else

		Change jam_tilt_bass = <new_tilt>
	endif
	return \{true}
endscript
