improv2_solo_part = 1

script improv2mode_startup 
	player_status = player1_status
	change \{game_mode = improv}
	change \{clean_note_multiplier = 1.0}
	change \{improv2_solo_part = 1}
	l2_counter = 0
	l1_counter = 0
	r2_counter = 0
	r1_counter = 0
	x_counter = 0
	solo_score = 0
	if NOT screenelementexists \{id = solo_text}
		createscreenelement \{type = textelement
			parent = hud_window
			id = solo_text
			font = text_a1
			pos = (48.0, 530.0)
			just = [
				left
				top
			]
			scale = 1.0
			rgba = [
				210
				210
				210
				250
			]
			text = "Solo Score: 0"
			z_priority = 100.0}
	endif
	formattext textname = run "Solo Score: %b" b = <solo_score>
	setscreenelementprops id = solo_text text = <run>
	begin
	block \{anytypes = [
			{
				type = hit_notesp1
			}
		]}
	getheldpattern controller = ($<player_status>.controller) player_status = <player_status>
	if (<hold_pattern> && 65536)
		if ($improv2_solo_part = 1)
			soundevent \{event = improv_lead_bend1}
		else
			soundevent \{event = improv_leadb_2beat1}
		endif
		l2_counter = (<l2_counter> + 1)
		if (<l2_counter> > 10)
			solo_score = (<solo_score> + 1 * $clean_note_multiplier)
		else
			if (<l2_counter> > 5)
				solo_score = (<solo_score> + 5 * $clean_note_multiplier)
			else
				solo_score = (<solo_score> + 10 * $clean_note_multiplier)
			endif
		endif
	endif
	if (<hold_pattern> && 4096)
		if ($improv2_solo_part = 1)
			soundevent \{event = lead_sliding_lick}
		else
			soundevent \{event = improv_leadb_2beat2}
		endif
		l1_counter = (<l1_counter> + 1)
		printf 'L1 %a' a = <l1_counter>
		if (<l1_counter> > 10)
			solo_score = (<solo_score> + 1 * $clean_note_multiplier)
		else
			if (<l1_counter> > 5)
				solo_score = (<solo_score> + 5 * $clean_note_multiplier)
			else
				solo_score = (<solo_score> + 10 * $clean_note_multiplier)
			endif
		endif
	endif
	if (<hold_pattern> && 256)
		stopsoundevent \{improv_lead_hold3}
		killspawnedscript name = improv2_check_held_r1 <...>
		if ($improv2_solo_part = 1)
			soundevent \{event = lead_real_short5}
			spawnscriptnow improv2_check_held_r1 params = {<...>}
		else
			soundevent \{event = improv_leadb_1beat}
		endif
		r1_counter = (<r1_counter> + 1)
		printf 'R1 %a' a = <r1_counter>
		if (<r1_counter> > 10)
			solo_score = (<solo_score> + 1 * $clean_note_multiplier)
		else
			if (<r1_counter> > 5)
				solo_score = (<solo_score> + 5 * $clean_note_multiplier)
			else
				solo_score = (<solo_score> + 10 * $clean_note_multiplier)
			endif
		endif
	endif
	if (<hold_pattern> && 16)
		stopsoundevent \{improv_lead_hold1}
		killspawnedscript name = improv2_check_held_r2 <...>
		if ($improv2_solo_part = 1)
			soundevent \{event = lead_real_short4}
			spawnscriptnow improv2_check_held_r2 params = {<...>}
		else
			soundevent \{event = improv_leadb_8th2}
		endif
		r2_counter = (<r2_counter> + 1)
		printf 'R2 %a' a = <r2_counter>
		if (<r2_counter> > 10)
			solo_score = (<solo_score> + 1 * $clean_note_multiplier)
		else
			if (<r2_counter> > 5)
				solo_score = (<solo_score> + 5 * $clean_note_multiplier)
			else
				solo_score = (<solo_score> + 10 * $clean_note_multiplier)
			endif
		endif
	endif
	if (<hold_pattern> && 1)
		stopsoundevent \{improv_lead_hold2}
		killspawnedscript name = improv2_check_held_x <...>
		if ($improv2_solo_part = 1)
			soundevent \{event = lead_real_short3}
			spawnscriptnow improv2_check_held_x params = {<...>}
		else
			soundevent \{event = improv_leadb_8th1}
		endif
		x_counter = (<x_counter> + 1)
		printf 'X %a' a = <x_counter>
		if (<x_counter> > 10)
			solo_score = (<solo_score> + 1 * $clean_note_multiplier)
		else
			if (<x_counter> > 5)
				solo_score = (<solo_score> + 5 * $clean_note_multiplier)
			else
				solo_score = (<solo_score> + 10 * $clean_note_multiplier)
			endif
		endif
	endif
	formattext textname = run "Solo Score: %b" b = <solo_score>
	setscreenelementprops id = solo_text text = <run>
	wait \{1
		frame}
	repeat
endscript

script improv2_test_script 
	printf \{'Firing improv test script!!!!!'}
endscript

script improv2_change_licks 
	printf \{'!!!!!!!!!!!!! improv2_change_licks !!!!!!!!!!!!!!!!!!!!'}
	change \{improv2_solo_part = 2}
endscript

script improv2_check_held_r1 
	printf \{'!!!!!!!!!!!!!!!!!!!!!!! improv2_check_hold_note !!!!!!!!!!!!!!'}
	wait \{20
		frames}
	getheldpattern controller = ($<player_status>.controller) player_status = <player_status>
	if (<hold_pattern> && 256)
		stopsoundevent \{lead_real_short5}
		soundevent \{event = improv_lead_hold3}
	endif
endscript

script improv2_check_held_r2 
	printf \{'!!!!!!!!!!!!!!!!!!!!!!! improv2_check_hold_note !!!!!!!!!!!!!!'}
	wait \{20
		frames}
	getheldpattern controller = ($<player_status>.controller) player_status = <player_status>
	if (<hold_pattern> && 16)
		stopsoundevent \{lead_real_short4}
		soundevent \{event = improv_lead_hold1}
	endif
endscript

script improv2_check_held_x 
	printf \{'!!!!!!!!!!!!!!!!!!!!!!! improv2_check_hold_note !!!!!!!!!!!!!!'}
	wait \{20
		frames}
	getheldpattern controller = ($<player_status>.controller) player_status = <player_status>
	if (<hold_pattern> && 1)
		stopsoundevent \{lead_real_short3}
		soundevent \{event = improv_lead_hold2}
	endif
endscript
