flag_improv_toggle = 10

script improvmode_startup 
	change \{game_mode = improv}
	begin
	waitforevent \{type = hit_notesp1}
	if (<pattern> && 65536)
		soundevent \{event = improv_lead_bend1}
		printf \{'L2'}
	endif
	if (<pattern> && 4096)
		soundevent \{event = lead_sliding_lick}
		printf \{'L1'}
	endif
	if (<pattern> && 256)
		soundevent \{event = lead_real_short3}
		printf \{'R1'}
	endif
	if (<pattern> && 16)
		soundevent \{event = lead_real_short4}
		printf \{'R2'}
	endif
	if (<pattern> && 1)
		soundevent \{event = lead_real_short5}
		printf \{'X'}
	endif
	wait \{1
		frame}
	repeat
endscript

script improv_test_script 
	printf \{'Firing improv test script!!!!!'}
endscript
