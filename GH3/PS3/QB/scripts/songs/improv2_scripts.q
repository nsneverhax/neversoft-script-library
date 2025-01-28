improv2_solo_part = 1

script improv2mode_startup 
	player_status = player1_status
	Change \{game_mode = improv}
	Change \{Clean_Note_Multiplier = 1.0}
	Change \{improv2_solo_part = 1}
	L2_Counter = 0
	L1_Counter = 0
	R2_Counter = 0
	R1_Counter = 0
	X_Counter = 0
	Solo_Score = 0
	if NOT ScreenElementExists \{Id = solo_text}
		CreateScreenElement \{Type = TextElement
			PARENT = hud_window
			Id = solo_text
			font = text_A1
			Pos = (48.0, 530.0)
			just = [
				LEFT
				Top
			]
			Scale = 1.0
			rgba = [
				210
				210
				210
				250
			]
			Text = "Solo Score: 0"
			z_priority = 100.0}
	endif
	FormatText TextName = run "Solo Score: %b" B = <Solo_Score>
	SetScreenElementProps Id = solo_text Text = <run>
	begin
	Block \{anytypes = [
			{
				Type = hit_notesp1
			}
		]}
	GetHeldPattern controller = ($<player_status>.controller) player_status = <player_status>
	if (<hold_pattern> && 65536)
		if ($improv2_solo_part = 1)
			SoundEvent \{Event = Improv_Lead_Bend1}
		else
			SoundEvent \{Event = Improv_LeadB_2beat1}
		endif
		L2_Counter = (<L2_Counter> + 1)
		if (<L2_Counter> > 10)
			Solo_Score = (<Solo_Score> + 1 * $Clean_Note_Multiplier)
		else
			if (<L2_Counter> > 5)
				Solo_Score = (<Solo_Score> + 5 * $Clean_Note_Multiplier)
			else
				Solo_Score = (<Solo_Score> + 10 * $Clean_Note_Multiplier)
			endif
		endif
	endif
	if (<hold_pattern> && 4096)
		if ($improv2_solo_part = 1)
			SoundEvent \{Event = Lead_Sliding_Lick}
		else
			SoundEvent \{Event = Improv_LeadB_2beat2}
		endif
		L1_Counter = (<L1_Counter> + 1)
		Printf 'L1 %a' A = <L1_Counter>
		if (<L1_Counter> > 10)
			Solo_Score = (<Solo_Score> + 1 * $Clean_Note_Multiplier)
		else
			if (<L1_Counter> > 5)
				Solo_Score = (<Solo_Score> + 5 * $Clean_Note_Multiplier)
			else
				Solo_Score = (<Solo_Score> + 10 * $Clean_Note_Multiplier)
			endif
		endif
	endif
	if (<hold_pattern> && 256)
		StopSoundEvent \{Improv_Lead_Hold3}
		KillSpawnedScript Name = improv2_check_held_r1 <...>
		if ($improv2_solo_part = 1)
			SoundEvent \{Event = Lead_Real_Short5}
			SpawnScriptNow improv2_check_held_r1 Params = {<...>}
		else
			SoundEvent \{Event = Improv_LeadB_1beat}
		endif
		R1_Counter = (<R1_Counter> + 1)
		Printf 'R1 %a' A = <R1_Counter>
		if (<R1_Counter> > 10)
			Solo_Score = (<Solo_Score> + 1 * $Clean_Note_Multiplier)
		else
			if (<R1_Counter> > 5)
				Solo_Score = (<Solo_Score> + 5 * $Clean_Note_Multiplier)
			else
				Solo_Score = (<Solo_Score> + 10 * $Clean_Note_Multiplier)
			endif
		endif
	endif
	if (<hold_pattern> && 16)
		StopSoundEvent \{Improv_Lead_Hold1}
		KillSpawnedScript Name = improv2_check_held_r2 <...>
		if ($improv2_solo_part = 1)
			SoundEvent \{Event = Lead_Real_Short4}
			SpawnScriptNow improv2_check_held_r2 Params = {<...>}
		else
			SoundEvent \{Event = Improv_LeadB_8th2}
		endif
		R2_Counter = (<R2_Counter> + 1)
		Printf 'R2 %a' A = <R2_Counter>
		if (<R2_Counter> > 10)
			Solo_Score = (<Solo_Score> + 1 * $Clean_Note_Multiplier)
		else
			if (<R2_Counter> > 5)
				Solo_Score = (<Solo_Score> + 5 * $Clean_Note_Multiplier)
			else
				Solo_Score = (<Solo_Score> + 10 * $Clean_Note_Multiplier)
			endif
		endif
	endif
	if (<hold_pattern> && 1)
		StopSoundEvent \{Improv_Lead_Hold2}
		KillSpawnedScript Name = improv2_check_held_X <...>
		if ($improv2_solo_part = 1)
			SoundEvent \{Event = Lead_Real_Short3}
			SpawnScriptNow improv2_check_held_X Params = {<...>}
		else
			SoundEvent \{Event = Improv_LeadB_8th1}
		endif
		X_Counter = (<X_Counter> + 1)
		Printf 'X %a' A = <X_Counter>
		if (<X_Counter> > 10)
			Solo_Score = (<Solo_Score> + 1 * $Clean_Note_Multiplier)
		else
			if (<X_Counter> > 5)
				Solo_Score = (<Solo_Score> + 5 * $Clean_Note_Multiplier)
			else
				Solo_Score = (<Solo_Score> + 10 * $Clean_Note_Multiplier)
			endif
		endif
	endif
	FormatText TextName = run "Solo Score: %b" B = <Solo_Score>
	SetScreenElementProps Id = solo_text Text = <run>
	Wait \{1
		Frame}
	repeat
endscript

script improv2_test_script 
	Printf \{'Firing improv test script!!!!!'}
endscript

script improv2_change_licks 
	Printf \{'!!!!!!!!!!!!! improv2_change_licks !!!!!!!!!!!!!!!!!!!!'}
	Change \{improv2_solo_part = 2}
endscript

script improv2_check_held_r1 
	Printf \{'!!!!!!!!!!!!!!!!!!!!!!! improv2_check_hold_note !!!!!!!!!!!!!!'}
	Wait \{20
		frames}
	GetHeldPattern controller = ($<player_status>.controller) player_status = <player_status>
	if (<hold_pattern> && 256)
		StopSoundEvent \{Lead_Real_Short5}
		SoundEvent \{Event = Improv_Lead_Hold3}
	endif
endscript

script improv2_check_held_r2 
	Printf \{'!!!!!!!!!!!!!!!!!!!!!!! improv2_check_hold_note !!!!!!!!!!!!!!'}
	Wait \{20
		frames}
	GetHeldPattern controller = ($<player_status>.controller) player_status = <player_status>
	if (<hold_pattern> && 16)
		StopSoundEvent \{Lead_Real_Short4}
		SoundEvent \{Event = Improv_Lead_Hold1}
	endif
endscript

script improv2_check_held_X 
	Printf \{'!!!!!!!!!!!!!!!!!!!!!!! improv2_check_hold_note !!!!!!!!!!!!!!'}
	Wait \{20
		frames}
	GetHeldPattern controller = ($<player_status>.controller) player_status = <player_status>
	if (<hold_pattern> && 1)
		StopSoundEvent \{Lead_Real_Short3}
		SoundEvent \{Event = Improv_Lead_Hold2}
	endif
endscript
