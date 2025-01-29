
script freeplay_controller_pulling_observer 
	RequireParams \{[
			Player
		]
		all}
	getplayerinfo <Player> controller
	getplayerinfo <Player> part
	begin
	if playerinfoequals <Player> freeplay_state = dropped
		return
	endif
	GetActiveControllers
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
		if playerinfoequals <Player> four_lane_highway = 0
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
		if NOT playerinfoequals <Player> mic_type = None
			if controllerlostmic controller = <controller>
				break
			endif
		endif
	endswitch
	Wait \{1
		gameframe}
	repeat
	freeplay_drop_player_out Player = <Player>
endscript
