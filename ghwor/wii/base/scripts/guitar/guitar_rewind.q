quickplay_whammy_rewind_enable = 0
quickplay_rewind = 0
quickplay_rewind_end_of_song = 0
quickplay_rewind_leadin_fretbar = 5000
quickplay_rewind_leadin_fillarray = 5000

script quickplay_whammy_rewind 
	OnExitRun \{quickplay_whammy_rewind_onexit}
	rewinding = 0
	Change \{quickplay_rewind_end_of_song = 0}
	begin
	GetSongTimeMs
	enable = 1
	if ScriptIsRunning \{GuitarEvent_SongWon_Spawned}
		enable = 0
	endif
	if ScriptIsRunning \{GuitarEvent_SongFailed_Spawned}
		enable = 0
	endif
	if (<time> < 0)
		enable = 0
	endif
	len = 0
	if (<enable> = 1)
		getplayerinfo \{1
			controller}
		if isdrumcontroller controller = <controller>
			if ControllerPressed down <controller>
				<len> = 0.6
			endif
		else
			if GuitarGetAnalogueInfo controller = <controller>
				if IsGuitarController controller = <controller>
					<len> = ((<rightx> + 1.0) / 2.0)
				else
					if (<leftlength> > 0)
						<len> = <leftlength>
					else
						if (<rightlength> > 0)
							<len> = <rightlength>
						else
							<len> = 0
						endif
					endif
				endif
			endif
		endif
	endif
	if (<len> > 0.1)
		if (<rewinding> = 0)
			do_gh3_pause
		endif
		unpausespawnedscript \{gem_array_stepper}
		rewinding = 1
		MathPow <len> exp = ($jam_whammy_curve)
		Result = (<pow> * $jam_whammy_max_rewind_per_frame_ms)
		if (<Result> < 0)
			Result = 0
		endif
		GetSongTimeMs
		<new_time> = (<time> - <Result>)
		CastToInteger \{new_time}
		if (<new_time> < 0)
			new_time = 0
		endif
		Change \{quickplay_rewind = 1}
		reset_song_time starttime = <new_time>
	else
		if (<rewinding> = 1)
			do_gh3_unpause \{seek_on_unpause}
			Change \{pause_grace_period = -1.0}
		endif
		Change \{quickplay_rewind = 0}
		rewinding = 0
	endif
	Wait \{1
		gameframe}
	if ($quickplay_rewind_end_of_song = 1)
		if (<rewinding> = 1)
			do_gh3_unpause \{seek_on_unpause}
			Change \{pause_grace_period = -1.0}
		endif
		Change \{quickplay_rewind = 0}
		rewinding = 0
		return
	endif
	repeat
endscript

script quickplay_whammy_rewind_onexit 
	Change \{quickplay_rewind = 0}
endscript
