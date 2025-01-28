FLAG_IMPROV_TOGGLE = 10

script improvmode_startup 
	Change \{game_mode = improv}
	begin
	WaitForEvent \{Type = hit_notesp1}
	if (<pattern> && 65536)
		SoundEvent \{Event = Improv_Lead_Bend1}
		Printf \{'L2'}
	endif
	if (<pattern> && 4096)
		SoundEvent \{Event = Lead_Sliding_Lick}
		Printf \{'L1'}
	endif
	if (<pattern> && 256)
		SoundEvent \{Event = Lead_Real_Short3}
		Printf \{'R1'}
	endif
	if (<pattern> && 16)
		SoundEvent \{Event = Lead_Real_Short4}
		Printf \{'R2'}
	endif
	if (<pattern> && 1)
		SoundEvent \{Event = Lead_Real_Short5}
		Printf \{'X'}
	endif
	Wait \{1
		Frame}
	repeat
endscript

script improv_test_script 
	Printf \{'Firing improv test script!!!!!'}
endscript
