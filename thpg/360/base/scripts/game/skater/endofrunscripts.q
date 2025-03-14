
script EndOfRun_WalkingEvent 
	if currentscorepotgreaterthan \{0}
		return
	endif
	MakeSkaterGoto \{endofrun}
endscript

script Goal_EndOfRun_WalkingEvent 
	if currentscorepotgreaterthan \{0}
		return
	endif
	goal_endofrun
endscript

script CanStartEndOfRun 
	if skater :inair
		return \{false}
	endif
	if skater :nailthetrick_isinnailthex
		return \{false}
	endif
	return \{true}
endscript

script SlowSkaterToStop 
	skater :getspeed
	if (<speed> > 0)
		VibrateController port = 0 actuator = 0 percent = 0
		VibrateController port = 0 actuator = 1 percent = 0
		<anim_fudge> = 0
		begin
		if CanStartEndOfRun
			break
		else
			<anim_fudge> = 1
			wait 1 gameframe
		endif
		repeat 60
		if (<anim_fudge> = 1)
			wait 0.3 seconds
		endif
		if NOT CanStartEndOfRun
			return
		endif
		MakeSkaterGoto endofrun
		waitforevent type = endofrundone
	endif
endscript

script endofrun 
	cleareventhandlergroup `default`
	cleareventhandler playkickanim
	cleareventhandler autokick
	onexceptionrun
	if walking
		ClearAllWalkingExceptions
	endif
	onexitrun script_ClearEndofRunStarted
	endofrunstarted
	stopbalancetrick
	landskatertricks
	cleareventbuffer
	LaunchStateChangeEvent state = Skater_EndOfRun
	seteventhandler event = lostgame scr = lostgame response = switch_script
	disableplayerinput AllowCameraControl
	if innetgame
		seteventhandler event = wongame scr = wongame response = switch_script
	endif
	if skating
		if isinbail
			Baildone
		endif
		if inair
			WaitOnGround
			Skater_PlayOnGroundAnim
			SetRollingFriction 1
		else
			setstate ground
			if NOT gotparam NoBrake
				seteventhandler event = skatercollidebail scr = EndBail response = switch_script
				WaitOnGround
				SetRollingFriction 0.5
				wait 10 frames
				WaitOnGround
				Skater_PlayOnGroundAnim
				begin
				SetRollingFriction 1.0
				if speedlessthan 1.0
					if onground
						break
					endif
				endif
				waitonegameframe
				repeat
			endif
		endif
	elseif walking
		if NOT gotparam NoBrake
			if walk_ground
				walk_scaleanimspeed off
			endif
		endif
	endif
	wait 0.3 seconds
	launchevent type = endofrundone
	onexitrun
	endofrundone
	if innetgame
		if NOT gameisover
			if NOT gamemodeequals is_king
				if NOT gamemodeequals is_score_challenge
					if NOT gamemodeequals is_goal_attack
						wait 1 seconds
						if gamemodeequals is_firefight
							if NOT isobserving
								skater :remove_skater_from_world
							endif
							eliminatedyou
						elseif gamemodeequals netwalls
							if NOT isobserving
								skater :remove_skater_from_world
							endif
							eliminatedyou
						else
							wait 1 seconds
							create_panel_message id = goal_message text = "Waiting for others to finish." style = panel_message_generic_loss time = 2000
							if NOT isobserving
								EnterSurveyorMode
							endif
						endif
					endif
				endif
			endif
		endif
	endif
endscript

script script_ClearEndofRunStarted 
	clearendofrunstarted
endscript

script goal_endofrun 
	cleareventhandlergroup `default`
	onexceptionrun
	cleareventhandlergroup WalkingEndRunEvents
	onexceptionrun
	goal_endofrunstarted
	stopbalancetrick
	landskatertricks
	cleareventbuffer
	launchevent type = endofrundone
	goal_endofrundone
	if innetgame
		if NOT gameisover
			if NOT gamemodeequals is_king
				if NOT gamemodeequals is_goal_attack
					if NOT gamemodeequals is_net_nail
						if NOT gamemodeequals is_net_line
							create_panel_message id = goal_message text = "Waiting for other players to finish their runs..." style = panel_message_generic_loss
						endif
					endif
				endif
			endif
		endif
	endif
endscript

script forceendofrun 
	PostBailDone
	VibrateOff
	MakeSkaterGoto \{endofrun}
endscript

script wongame 
	if skating
		StoppedState
	endif
	endofrundone
endscript

script lostgame 
	if skating
		StoppedState
	endif
	endofrundone
endscript

script EndBail 
	endofrundone
	cleareventhandlergroup `default`
	onexceptionrun
	inbail
	turntofacevelocity
	VibrateOff
	skater_playanim anim = SK8_Bail_Spin_Fwd_F norestart blendperiod = 0.3
	wait 10 frames
	SwitchOffBoard
	wait 10 frame
	wait 10 frames
	SetRollingFriction 0.5
	vibrate actuator = 1 percent = 100 duration = 0.2
	if NOT getglobalflag flag = $BLOOD_OFF
		obj_spawnscriptlater BloodSmall
	endif
	Skater_WaitAnim percent = 75
	skater_waitanimfinished
	skater_playanim anim = GetUp_Sit_FT blendperiod = 0.1
	SetRollingFriction 0.5
	wait 50 frames
	SwitchOnBoard
	boardrotate normal
	skater_waitanimfinished
	NotifyBailDone
	notinbail
	goto endofrun
endscript
