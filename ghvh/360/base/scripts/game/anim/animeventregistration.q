
script registerallanimevents 
	registeranimevents \{track = standard
		anim_events = $animevents_standard_downloads}
	registeranimevents \{track = standard
		anim_events = $animevents_standard}
	registeranimevents \{track = tempo_matching
		dormant = true
		anim_events = $animevents_tempomatching_downloads}
	registeranimevents \{track = tempo_matching
		dormant = true
		anim_events = $animevents_tempomatching}
endscript
