
script RegisterAllAnimEvents 
	RegisterAnimEvents \{track = standard
		anim_events = $AnimEvents_standard_Downloads}
	RegisterAnimEvents \{track = standard
		anim_events = $AnimEvents_standard}
	RegisterAnimEvents \{track = tempo_matching
		dormant = true
		anim_events = $AnimEvents_TempoMatching_Downloads}
	RegisterAnimEvents \{track = tempo_matching
		dormant = true
		anim_events = $AnimEvents_TempoMatching}
endscript
