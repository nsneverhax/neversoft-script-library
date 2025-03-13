
script freeplay_controller_pulling_observer \{player = !i1768515945}
	getplayerinfo <player> controller
	getplayerinfo <player> part
	getplayerinfo <player> bot_play
	if (<bot_play> = 1)
		return
	endif
	getcontrollertype controller = <controller>
	if ($allow_controller_for_all_instruments = 1 && <controller_type> = controller)
		return
	endif
	begin
	if playerinfoequals <player> freeplay_state = dropped
		return
	endif
	getactivecontrollers
	if (<active_controllers> [<controller>] = 0)
		break
	endif
	getcontrollertype controller = <controller>
	switch <part>
		case guitar
		case bass
		if (<controller_type> != guitar)
			break
		endif
		case drum
		if (<controller_type> != drum)
			break
		endif
		if playerinfoequals <player> four_lane_highway = 0
			if isrbdrum controller = <controller>
				break
			endif
		else
			if NOT isrbdrum controller = <controller>
				break
			endif
		endif
		case vocals
		if (<controller_type> != controller && <controller_type> != vocals)
			break
		endif
		if NOT playerinfoequals <player> mic_type = none
			if controllerlostmic controller = <controller>
				break
			endif
		endif
	endswitch
	wait \{1
		gameframe}
	repeat
	freeplay_drop_player_out player = <player>
endscript
