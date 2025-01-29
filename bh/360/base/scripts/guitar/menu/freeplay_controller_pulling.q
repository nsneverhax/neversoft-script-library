
script freeplay_controller_pulling_observer 
	RequireParams \{[
			player
		]
		all}
	GetPlayerInfo <player> controller
	GetPlayerInfo <player> part
	begin
	if PlayerInfoEquals <player> freeplay_state = dropped
		return
	endif
	GetActiveControllers
	if (<active_controllers> [<controller>] = 0)
		break
	endif
	GetControllerType controller = <controller>
	switch <part>
		case guitar
		case bass
		if (<controller_type> != guitar)
			break
		endif
		case Drum
		if (<controller_type> != Drum)
			break
		endif
		if PlayerInfoEquals <player> four_lane_highway = 0
			if IsRBDrum controller = <controller>
				break
			endif
		else
			if NOT IsRBDrum controller = <controller>
				break
			endif
		endif
		case vocals
		if (<controller_type> != controller && <controller_type> != vocals)
			break
		endif
		if NOT PlayerInfoEquals <player> mic_type = None
			if ControllerLostMic controller = <controller>
				break
			endif
		endif
	endswitch
	wait \{1
		gameframe}
	repeat
	freeplay_drop_player_out player = <player>
endscript
