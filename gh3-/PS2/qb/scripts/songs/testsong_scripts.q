
script testsongmode_startup 
	begin
	waitforevent \{type = hit_notes}
	if controllermake \{l2}
		if controllerpressed \{l1}
			soundevent \{event = improv_pentatonic_chord_d5_g5}
			stopsoundevent \{improv_pentatonic_single_note_g7}
			stopsoundevent \{improv_pentatonic_single_note_b5}
		else
			soundevent \{event = improv_pentatonic_single_note_g7}
		endif
		printf \{'L2'}
	endif
	if controllermake \{l1}
		if controllerpressed \{l2}
			soundevent \{event = improv_pentatonic_chord_d5_g5}
			stopsoundevent \{improv_pentatonic_single_note_g7}
			stopsoundevent \{improv_pentatonic_single_note_b5}
		else
			if controllerpressed \{r1}
				soundevent \{event = improv_pentatonic_chord_d7_g7}
				stopsoundevent \{improv_pentatonic_single_note_b5}
				stopsoundevent \{improv_pentatonic_single_note_b8}
			else
				soundevent \{event = improv_pentatonic_single_note_b5}
			endif
		endif
		printf \{'L1'}
	endif
	if controllermake \{r1}
		if controllerpressed \{l1}
			soundevent \{event = improv_pentatonic_chord_d7_g7}
			stopsoundevent \{improv_pentatonic_single_note_b5}
			stopsoundevent \{improv_pentatonic_single_note_b8}
		else
			if controllerpressed \{r2}
				soundevent \{event = improv_pentatonic_chord_b5_ee5}
				stopsoundevent \{improv_pentatonic_single_note_b8}
				stopsoundevent \{improv_pentatonic_single_note_ee5}
			else
				soundevent \{event = improv_pentatonic_single_note_b8}
			endif
		endif
		printf \{'R1'}
	endif
	if controllermake \{r2}
		if controllerpressed \{r1}
			soundevent \{event = improv_pentatonic_chord_b5_ee5}
			stopsoundevent \{improv_pentatonic_single_note_b8}
			stopsoundevent \{improv_pentatonic_single_note_ee5}
		else
			if controllerpressed \{x}
				soundevent \{event = improv_pentatonic_chord_b8_ee8}
				stopsoundevent \{improv_pentatonic_single_note_ee5}
				stopsoundevent \{improv_pentatonic_single_note_ee8}
			else
				soundevent \{event = improv_pentatonic_single_note_ee5}
			endif
		endif
		printf \{'R2'}
	endif
	if controllermake \{x}
		if controllerpressed \{r2}
			soundevent \{event = improv_pentatonic_chord_b8_ee8}
			stopsoundevent \{improv_pentatonic_single_note_ee5}
			stopsoundevent \{improv_pentatonic_single_note_ee8}
		else
			soundevent \{event = improv_pentatonic_single_note_ee8}
			if ($current_song = testsong)
				printf \{'%a'
					a = current_song}
			endif
		endif
		printf \{'X'}
	endif
	wait \{1
		frame}
	if NOT controllerpressed \{l2}
		stopsoundevent \{improv_pentatonic_single_note_g7}
	endif
	if NOT controllerpressed \{l1}
		stopsoundevent \{improv_pentatonic_single_note_b5}
	endif
	if NOT controllerpressed \{r1}
		stopsoundevent \{improv_pentatonic_single_note_b8}
	endif
	if NOT controllerpressed \{r2}
		stopsoundevent \{improv_pentatonic_single_note_ee5}
	endif
	if NOT controllerpressed \{x}
		stopsoundevent \{improv_pentatonic_single_note_ee8}
	endif
	repeat
endscript
