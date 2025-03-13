quickplay_whammy_rewind_enable = 0
quickplay_rewind = 0
quickplay_rewind_end_of_song = 0
quickplay_rewind_leadin_fretbar = 5000
quickplay_rewind_leadin_fillarray = 5000

script quickplay_whammy_rewind 
	onexitrun \{quickplay_whammy_rewind_onexit}
	rewinding = 0
	change \{quickplay_rewind_end_of_song = 0}
	begin
	getsongtimems
	enable = 1
	if scriptisrunning \{guitarevent_songwon_spawned}
		enable = 0
	endif
	if scriptisrunning \{guitarevent_songfailed_spawned}
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
			if controllerpressed down <controller>
				<len> = 0.6
			endif
		else
			if guitargetanalogueinfo controller = <controller>
				if isguitarcontroller controller = <controller>
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
		mathpow <len> exp = ($jam_whammy_curve)
		result = (<pow> * $jam_whammy_max_rewind_per_frame_ms)
		if (<result> < 0)
			result = 0
		endif
		getsongtimems
		<new_time> = (<time> - <result>)
		casttointeger \{new_time}
		if (<new_time> < 0)
			new_time = 0
		endif
		change \{quickplay_rewind = 1}
		reset_song_time starttime = <new_time>
	else
		if (<rewinding> = 1)
			do_gh3_unpause \{seek_on_unpause}
			change \{pause_grace_period = -1.0}
		endif
		change \{quickplay_rewind = 0}
		rewinding = 0
	endif
	wait \{1
		gameframe}
	if ($quickplay_rewind_end_of_song = 1)
		if (<rewinding> = 1)
			do_gh3_unpause \{seek_on_unpause}
			change \{pause_grace_period = -1.0}
		endif
		change \{quickplay_rewind = 0}
		rewinding = 0
		return
	endif
	repeat
endscript

script quickplay_whammy_rewind_onexit 
	change \{quickplay_rewind = 0}
endscript
