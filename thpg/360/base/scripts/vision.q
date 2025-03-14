
script Vision_Set 
	if gotparam \{lose_dist}
		Vision_SetGainVisionDist {distance = <lose_dist>}
	endif
	if gotparam \{gain_dist}
		Vision_SetLoseVisionDist {distance = <gain_dist>}
	endif
	if gotparam \{shape}
		Vision_SetShape shape = <shape>
	endif
	if gotparam \{enable_los}
		Vision_EnableLOS
	else
		if gotparam \{disable_los}
			Vision_DisableLOS
		endif
	endif
endscript

script Vision_SetDistances 
	if gotparam \{lose_dist}
		Vision_SetGainVisionDist {distance = <lose_dist>}
	endif
	if gotparam \{gain_dist}
		Vision_SetLoseVisionDist {distance = <gain_dist>}
	endif
endscript
