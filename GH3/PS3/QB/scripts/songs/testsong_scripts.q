
script testsongmode_startup 
	begin
	WaitForEvent \{Type = hit_notes}
	if ControllerMake \{L2}
		if ControllerPressed \{L1}
			SoundEvent \{Event = Improv_Pentatonic_Chord_D5_G5}
			StopSoundEvent \{Improv_Pentatonic_Single_Note_G7}
			StopSoundEvent \{Improv_Pentatonic_Single_Note_B5}
		else
			SoundEvent \{Event = Improv_Pentatonic_Single_Note_G7}
		endif
		Printf \{'L2'}
	endif
	if ControllerMake \{L1}
		if ControllerPressed \{L2}
			SoundEvent \{Event = Improv_Pentatonic_Chord_D5_G5}
			StopSoundEvent \{Improv_Pentatonic_Single_Note_G7}
			StopSoundEvent \{Improv_Pentatonic_Single_Note_B5}
		else
			if ControllerPressed \{R1}
				SoundEvent \{Event = Improv_Pentatonic_Chord_D7_G7}
				StopSoundEvent \{Improv_Pentatonic_Single_Note_B5}
				StopSoundEvent \{Improv_Pentatonic_Single_Note_B8}
			else
				SoundEvent \{Event = Improv_Pentatonic_Single_Note_B5}
			endif
		endif
		Printf \{'L1'}
	endif
	if ControllerMake \{R1}
		if ControllerPressed \{L1}
			SoundEvent \{Event = Improv_Pentatonic_Chord_D7_G7}
			StopSoundEvent \{Improv_Pentatonic_Single_Note_B5}
			StopSoundEvent \{Improv_Pentatonic_Single_Note_B8}
		else
			if ControllerPressed \{R2}
				SoundEvent \{Event = Improv_Pentatonic_Chord_B5_EE5}
				StopSoundEvent \{Improv_Pentatonic_Single_Note_B8}
				StopSoundEvent \{Improv_Pentatonic_Single_Note_EE5}
			else
				SoundEvent \{Event = Improv_Pentatonic_Single_Note_B8}
			endif
		endif
		Printf \{'R1'}
	endif
	if ControllerMake \{R2}
		if ControllerPressed \{R1}
			SoundEvent \{Event = Improv_Pentatonic_Chord_B5_EE5}
			StopSoundEvent \{Improv_Pentatonic_Single_Note_B8}
			StopSoundEvent \{Improv_Pentatonic_Single_Note_EE5}
		else
			if ControllerPressed \{X}
				SoundEvent \{Event = Improv_Pentatonic_Chord_B8_EE8}
				StopSoundEvent \{Improv_Pentatonic_Single_Note_EE5}
				StopSoundEvent \{Improv_Pentatonic_Single_Note_EE8}
			else
				SoundEvent \{Event = Improv_Pentatonic_Single_Note_EE5}
			endif
		endif
		Printf \{'R2'}
	endif
	if ControllerMake \{X}
		if ControllerPressed \{R2}
			SoundEvent \{Event = Improv_Pentatonic_Chord_B8_EE8}
			StopSoundEvent \{Improv_Pentatonic_Single_Note_EE5}
			StopSoundEvent \{Improv_Pentatonic_Single_Note_EE8}
		else
			SoundEvent \{Event = Improv_Pentatonic_Single_Note_EE8}
			if ($current_song = testsong)
				Printf \{'%a'
					A = current_song}
			endif
		endif
		Printf \{'X'}
	endif
	Wait \{1
		Frame}
	if NOT ControllerPressed \{L2}
		StopSoundEvent \{Improv_Pentatonic_Single_Note_G7}
	endif
	if NOT ControllerPressed \{L1}
		StopSoundEvent \{Improv_Pentatonic_Single_Note_B5}
	endif
	if NOT ControllerPressed \{R1}
		StopSoundEvent \{Improv_Pentatonic_Single_Note_B8}
	endif
	if NOT ControllerPressed \{R2}
		StopSoundEvent \{Improv_Pentatonic_Single_Note_EE5}
	endif
	if NOT ControllerPressed \{X}
		StopSoundEvent \{Improv_Pentatonic_Single_Note_EE8}
	endif
	repeat
endscript
