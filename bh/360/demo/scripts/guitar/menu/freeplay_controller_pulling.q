
script freeplay_controller_pulling_observer 
	requireparams \{[
			player
		]
		all}
	getplayerinfo <player> controller
	getplayerinfo <player> part
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
