SwitchControl_Trigger = {
	trigger = {
		PressTwoAnyOrder
		l1
		r1
		500
	}
}
CAVEMAN_SCORE = 750
COMBO_RUNOUT_SCORE = 50
CavemanBailDuration = 0.3
RunOutTrickDelay = 0.75

script RunTimerController_Reset 
	runtimer_getruntimercontrollerid
	obj_killspawnedscript id = <runtimercontrollerid>
	obj_spawnscriptlater RunTimerController_Start id = <runtimercontrollerid> pausewithobject
	runtimer_getruntimerid
	obj_killspawnedscript id = (<runtimerid> + 2)
	hide_run_timer id = <runtimerid>
endscript

script RunTimerController_Start 
	cleareventhandlergroup \{RunTimeController}
	onexceptionrun
	seteventhandler \{event = showruntimer
		scr = RunTimerController_Displayed
		group = RunTimeController
		response = switch_script}
	block
endscript

script RunTimerController_Displayed 
	cleareventhandlergroup RunTimeController
	onexceptionrun
	seteventhandler event = hideruntimer scr = RunTimerController_Hidden group = RunTimeController response = switch_script
	FadingSpawned = 0
	SoundCounter = 0
	SoundWait = 4
	soundtype = 0
	runtimer_getfactorcomplete
	RotationAngle = (360 * <factorcomplete>)
	runtimer_getruntimerid
	show_run_timer id = <runtimerid> rot_angle = <RotationAngle>
	begin
	doscreenelementmorph id = {<runtimerid> child = 0} rot_angle = (<RotationAngle> * -1 - 45)
	hide_run_timer_piece id = <runtimerid> rot_angle = <RotationAngle>
	if (<FadingSpawned> = 0)
		if (<RotationAngle> < 140)
			obj_spawnscriptlater blink_run_timer id = (<runtimerid> + 2) params = {id = <runtimerid>} pausewithobject
			FadingSpawned = 1
		endif
	endif
	if NOT gotparam no_sounds
		if (<SoundCounter> > <SoundWait>)
			if (<soundtype> = 0)
				soundevent event = clock_tick_down_sfx
				soundtype = 1
			else
				soundevent event = clock_tick_up_sfx
				soundtype = 0
			endif
			SoundCounter = 0
		else
			SoundCounter = (<SoundCounter> + 1)
		endif
	endif
	if (<RotationAngle> < 270)
		if (<RotationAngle> < 180)
			if (<RotationAngle> < 90)
				SoundWait = 1
			else
				SoundWait = 2
			endif
		else
			SoundWait = 3
		endif
	endif
	wait 1 gameframe
	runtimer_getfactorcomplete
	RotationAngle = (360 * <factorcomplete>)
	if (<factorcomplete> = 1.0)
		runtimer_pause
	endif
	repeat
endscript

script RunTimerController_Hidden 
	cleareventhandlergroup \{RunTimeController}
	onexceptionrun
	seteventhandler \{event = showruntimer
		scr = RunTimerController_Displayed
		group = RunTimeController
		response = switch_script}
	runtimer_getruntimerid
	obj_killspawnedscript id = (<runtimerid> + 2)
	soft_hide_run_timer id = <runtimerid>
	block
endscript

script CleanUp_WalkingtoSkating 
	AllowRailTricks
	unsetboardmissing
	SwitchOnBoard
	skaterloopingsound_turnon
	seteventhandler \{event = pointrail
		scr = PointRailWalkingToSkating
		response = switch_script}
	SwitchToSkatingPhysics
	if inair
		setqueuetricks \{NoTricks}
		InAirExceptions \{NoSkateToWalkTricks}
	else
		OnGroundExceptions
	endif
endscript

script PointRailWalkingToSkating 
	setqueuetricks \{NoTricks}
	goto \{pointrail}
endscript

script switch_ongroundai newscript = land
	if skaterisflipping
		dont_switch = 1
	endif
	if skaterisupsidedown
		dont_switch = 1
	endif
	if gotparam dont_switch
		if walking
			goto GroundOrAirWaitState
		else
			if inair
				goto Airborne
			else
				goto ongroundai
			endif
		endif
	endif
	unhide
	cleareventhandlergroup `default`
	onexceptionrun
	ClearTrickQueues
	notinbail
	switch <newscript>
		case ongroundai
		SetRollingFriction `default`
		SwitchOnBoard
		stopbalancetrick
		CleanUp_WalkingtoSkating
		if inair
			goto Airborne
		else
			goto ongroundai
		endif
		case Walking_onGroundAi
		if innollie
			if inair
				flipandrotate
			endif
		endif
		SwitchOnBoard
		SwitchToWalkingPhysics
		stopbalancetrick
		AllowRailTricks
		if NOT currentscorepotgreaterthan 0
			killspecial
		endif
		if gotparam restart
			goto JustStoppedSkatingState params = {restart}
		else
			goto JustStoppedSkatingState
		endif
		default
		scriptassert "Bad NewScript passed to Switch_OnGroundAi"
	endswitch
endscript

script CheckforSwitchMode \{newscript = ongroundai}
	if walking
		goto \{switch_ongroundai
			params = {
				newscript = ongroundai
			}}
	else
		goto \{switch_ongroundai
			params = {
				newscript = Walking_onGroundAi
			}}
	endif
endscript
