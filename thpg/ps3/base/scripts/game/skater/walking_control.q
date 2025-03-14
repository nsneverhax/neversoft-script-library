
script SwitchToWalkingPhysics 
	flip_skater_if_180_off
	broadcastevent type = SkaterExitSkating
	killspawnedscript name = wait_and_pause_runtimer
	ClearTrickQueues
	skaterphysicscontrol_switchskatingtowalking
	skaterloopingsound_turnoff
	enableinputevents
	broadcastevent type = SkaterEnterWalking
	killextratricks
	nollieoff
	obj_spawnscriptlater ClearLipLock
	settrickname ""
	settrickscore 0
	display blockspin
	agent_disabletrampling
	if NOT infrontend
		getcurrentlevel
		if NOT (<level> = load_z_bedroom)
			if NOT gman_hasactivegoals
				if NOT insplitscreengame
					if NOT getglobalflag flag = $SWITCH_TO_SKATING_BUTTONS_EXPLAINED
						ui_display_message {type = instruction_general
							text = "Tip: Press \\be and \\bf to skate"
							time = 5
						}
						setglobalflag flag = $SWITCH_TO_SKATING_BUTTONS_EXPLAINED
					endif
				endif
			endif
		endif
	endif
endscript

script ClearLipLock 
	clearallowlipnogrind
	wait \{15
		frames}
	clearallowlipnogrind
endscript

script SwitchToSkatingPhysics 
	broadcastevent \{type = SkaterExitWalking}
	ClearAllWalkingExceptions
	cleartrickqueue
	obj_killspawnedscript \{id = ComboRunOutTrickDisplayDelay}
	obj_killspawnedscript \{id = ActivateGroundTricksDelay}
	setprops \{remove_tags = [
			WalkingGroundTricksInactive
		]}
	settrickname \{""}
	settrickscore \{0}
	display \{blockspin}
	obj_spawnscriptlater \{wait_and_pause_runtimer}
	skaterphysicscontrol_switchwalkingtoskating
	broadcastevent \{type = SkaterEnterSkating}
	agent_enabletrampling
endscript

script wait_and_pause_runtimer 
	if NOT onrail
		skater_waitanimfinished
	endif
	runtimer_pause
endscript
WalkGroundTricks = [
	{
		$SwitchControl_Trigger
		scr = WalkingRunToSkating
	}
]
StanceToggleTricks = [
	{
		trigger = {
			InOrder
			a = r2
			b = r2
			300
		}
		scr = walking_stance_toggle
	}
]
WalkNoBoardGroundTricks = [
]
WalkAirTricks = [
	{
		$SwitchControl_Trigger
		scr = WalkingAirToSkating
	}
]
WalkHangTricks = [
]

script beginwalkinggenerictrickinair 
	if walk_air
		AirOrWall = 1
	endif
	if walk_wall
		AirOrWall = 1
	endif
	if gotparam \{AirOrWall}
		if NOT IsBoardMissing
			BeginWalkingGenericTrick
		endif
	endif
	if gotparam \{callback}
		<callback> <...>
	endif
endscript

script BeginWalkingGenericTrick 
	CleanUp_WalkingtoSkating
	if NOT onground
		PerhapsAwardCaveman
	endif
endscript

script BeginWalkingManualTrick 
	walk_scaleanimspeed \{off}
	CleanUp_WalkingtoSkating
	PerhapsAwardCaveman
endscript

script WalkingToRailTrick 
	SetRollingFriction \{0.0}
	walk_scaleanimspeed \{off}
	settags \{GrindPlayCavemanAnim}
	seteventhandler \{event = pointrailspin
		scr = pointrailspin
		response = switch_script}
	PerhapsAwardCaveman \{HaveNotSwitchedPhysicsStatesYet}
	settrickname \{""}
	settrickscore \{0}
	display \{blockspin}
	CleanUp_WalkingtoSkating
endscript

script WalkingAirToTransitionTrick 
	cleareventhandler \{AcidDrop}
	onexceptionrun
	walk_scaleanimspeed \{off}
	CleanUp_WalkingtoSkating
	Skater_PlayOllieAnim \{$Ollie_data}
	Skater_PlayFlipTrickAnim \{$caveman_data}
	WaitAnimWhilstChecking \{timer = FliptrickTimer}
	goto \{Airborne
		params = {
			NoSkateToWalkTricks
			no_anim
		}}
endscript

script WalkingRunToSkating 
	BeginWalkingGenericTrick
	skaterloopingsound_turnoff
	onexitrun WalkingRunToSkating_exit
	setqueuetricks Jumptricks WalkToSkateTransition_GroundTricks
	played_idle_transition = false
	getspeed
	if (<speed> < 0.25)
		played_idle_transition = true
		setspeed 0.0
		SetRollingFriction 1000
		Skate_PlayWalkToSkate
		wait_timer = bodytimer
	else
		skaterloopingsound_turnon
		Skater_PlayOnGroundAnim data = $OnGround_data extradata = $Run_To_Skate_Data no_events
		wait_timer = groundlandtimer
	endif
	seteventhandler event = FlailHitWall scr = FlailVibrate response = call_script
	seteventhandler event = FlailLeft scr = FlailVibrate response = call_script
	seteventhandler event = FlailRight scr = FlailVibrate response = call_script
	cleareventhandler runhasended
	cleareventhandler goalhasended
	cleareventhandler stopped
	cleareventhandler Ollied
	onexceptionrun
	wait $CavemanBailDuration seconds
	seteventhandler event = Ollied scr = ollie response = switch_script params = {<...>}
	begin
	DoNextTrick
	donextmanualtrick
	if Skater_AnimComplete timer = <wait_timer>
		break
	endif
	if (<played_idle_transition> = true)
		setspeed 0.0
		SetRollingFriction 1000
	endif
	wait 1 gameframe
	repeat
	SetRollingFriction `default`
	landskatertricks
	getspeed
	if ((<speed> < 0.25) && (<played_idle_transition> = true))
		if NOT onground
			setstate ground
		endif
		goto StoppedState params = {no_init = 1}
	else
		if anim_animnodeexists id = curbsnapextras
			no_anim = no_anim
		endif
		goto ongroundai params = {<no_anim>}
	endif
endscript

script WalkingRunToSkating_exit 
	skaterloopingsound_turnon
endscript

script WalkingAirToSkating 
	walk_scaleanimspeed \{off}
	Skater_PlayOllieAnim \{$Ollie_data}
	Skater_PlayFlipTrickAnim \{$caveman_data}
	wait \{$CavemanBailDuration
		seconds}
	WaitAnimWhilstChecking \{timer = FliptrickTimer}
	goto \{Airborne
		params = {
			NoSkateToWalkTricks
			no_anim
		}}
endscript

script ComboRunOutTrickDisplayDelay 
	obj_getid
	seteventhandler event = SkaterExitCombo scr = FilterSkaterExitComboEvent response = call_script params = {ThisSkaterId = <objid>}
	settrickname \{"Combo Run Out"}
	settrickscore \{$COMBO_RUNOUT_SCORE}
	display \{blockspin}
endscript

script FilterSkaterExitComboEvent 
	if (<skaterid> = <ThisSkaterId>)
		goto \{nullscript}
	endif
endscript

script PerhapsAwardCaveman \{name = "Caveman"}
	if NOT gotparam \{HaveNotSwitchedPhysicsStatesYet}
		getpreviousphysicsstateduration
		if (<previousphysicsstateduration> > $RunOutTrickDelay)
			settrickname <name>
			settrickscore \{$CAVEMAN_SCORE}
			display
		endif
	else
		gettimesincephysicsswitch
		if (<timesincephysicsswitch> > $RunOutTrickDelay)
			settrickname <name>
			settrickscore \{$CAVEMAN_SCORE}
			display
		endif
	endif
endscript

script ActivateGroundTricksDelay 
	wait \{$CavemanBailDuration
		seconds}
	setprops \{remove_tags = [
			WalkingGroundTricksInactive
		]}
	if walk_ground
		SetWalkingGroundTricks
	endif
endscript

script SetWalkingGroundTricks 
	if NOT IsBoardMissing
		getsingletag \{WalkingGroundTricksInactive}
		if NOT gotparam \{WalkingGroundTricksInactive}
			if gotparam \{AllowStanceToggle}
				setqueuetricks \{WalkGroundTricks
					StanceToggleTricks
					StoppedConstructionTrick}
			else
				setqueuetricks \{WalkGroundTricks
					StoppedConstructionTrick}
			endif
		else
			setqueuetricks \{NoTricks}
		endif
	else
		setqueuetricks \{WalkNoBoardGroundTricks}
	endif
	setextragrindtricks \{NoTricks}
	setmanualtricks \{NoTricks}
endscript

script SetWalkingAirTricks 
	if NOT IsBoardMissing
		setqueuetricks \{special = SpecialTricks
			airtricks
			WalkAirTricks}
		setextragrindtricks \{special = SpecialGrindTricks
			grindtricks}
		if NOT getglobalflag \{flag = $FLAG_EXPERT_MODE_NO_MANUALS}
			if NOT ((innetgame) && (getglobalflag flag = $flag_g_expert_mode_no_manuals))
				setmanualtricks \{special = SpecialManualTricks
					GroundManualTricks}
			else
				setmanualtricks \{NoTricks}
			endif
		else
			setmanualtricks \{NoTricks}
		endif
	else
		setqueuetricks \{NoTricks}
		setextragrindtricks \{NoTricks}
		setmanualtricks \{NoTricks}
	endif
endscript

script SetWalkingOffTricks 
	setqueuetricks \{NoTricks}
	setextragrindtricks \{NoTricks}
	setmanualtricks \{NoTricks}
endscript

script SetWalkingTrickState NewWalkingTrickState = ground WalkingTricksState = unset
	getsingletag WalkingTricksState
	ClearTrickQueues
	switch <NewWalkingTrickState>
		case ground
		cleareventhandlergroup WalkingTransitionTrickExceptions
		onexceptionrun
		seteventhandler event = AcidDrop scr = WalkingAirToTransitionTrick group = WalkingTransitionTrickExceptions response = switch_script
		seteventhandler event = rail scr = WalkingToRailTrick group = WalkingTransitionTrickExceptions response = switch_script
		runtimer_unpause
		seteventhandler event = runtimerup scr = Walk_LandSkaterTricks group = RunTimerEvents respose = call_script
		seteventhandler event = runhasended scr = EndOfRun_WalkingEvent group = WalkingEndRunEvents respose = call_script
		seteventhandler event = goalhasended scr = Goal_EndOfRun_WalkingEvent group = WalkingEndRunEvents respose = call_script
		resetlandedfromvert
		LaunchStateChangeEvent state = Skater_OnGround
		SetWalkingGroundTricks
		case air
		cleareventbuffer buttons = [up down] olderthan = 0
		cleareventhandlergroup WalkingTransitionTrickExceptions
		seteventhandler event = AcidDrop scr = WalkingAirToTransitionTrick group = WalkingTransitionTrickExceptions response = switch_script
		seteventhandler event = rail scr = WalkingToRailTrick group = WalkingTransitionTrickExceptions response = switch_script
		cleareventhandlergroup WalkingEndRunEvents
		cleareventhandlergroup RunTimerEvents
		onexceptionrun
		LaunchStateChangeEvent state = Skater_InAir
		SetWalkingAirTricks
		case off
		cleareventhandlergroup WalkingTransitionTrickExceptions
		onexceptionrun
		runtimer_unpause
		seteventhandler event = runtimerup scr = Walk_LandSkaterTricks group = RunTimerEvents respose = call_script
		seteventhandler event = runhasended scr = EndOfRun_WalkingEvent group = WalkingEndRunEvents respose = call_script
		seteventhandler event = goalhasended scr = Goal_EndOfRun_WalkingEvent group = WalkingEndRunEvents respose = call_script
		resetlandedfromvert
		SetWalkingOffTricks
	endswitch
	settags WalkingTricksState = <NewWalkingTrickState>
endscript

script Walk_LandSkaterTricks 
	landskatertricks
	obj_killspawnedscript \{id = ComboRunOutTrickDisplayDelay}
endscript

script waitanimwalking 
	begin
	donextmanualtrick \{scripttorunfirst = BeginWalkingManualTrick
		FromWalk}
	DoNextTrick
	if Skater_AnimComplete
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script WaitWalking 
	begin
	donextmanualtrick \{scripttorunfirst = BeginWalkingManualTrick
		FromWalk}
	DoNextTrick
	wait \{1
		gameframe}
	repeat
endscript

script PlayWalkAnim 
	skater_playanim <...>
	if IsBoardMissing
		if NOT isforcewalkon
			appendsuffixtochecksum base = <anim> suffixstring = '_Partial'
			if anim_animexists anim = <appended_id>
				Skater_PlayNoBoardOverlayAnim anim = <appended_id>
				return
			endif
		endif
	endif
	Skater_NoBoardOverlayAnimOff
endscript
runningturnleftanim = FastRun_LeanLeft_D
runningturnrightanim = FastRun_LeanRight_D

script waitwalkingframe 
	donextmanualtrick \{scripttorunfirst = BeginWalkingManualTrick
		FromWalk}
	DoNextTrick
	wait \{1
		gameframe}
endscript

script waitanimwalkingframe 
	donextmanualtrick \{scripttorunfirst = BeginWalkingManualTrick
		FromWalk}
	DoNextTrick
	if Skater_AnimComplete
		return
	endif
	wait \{1
		gameframe}
endscript

script ClearAllWalkingExceptions 
	cleareventhandlergroup \{WalkingStateExceptions}
	cleareventhandlergroup \{WalkingEvents}
	cleareventhandlergroup \{WalkingEndRunEvents}
	cleareventhandlergroup \{WalkingTransitionTrickExceptions}
	cleareventhandlergroup \{WalkingCollideEvents}
	cleareventhandlergroup \{RunTimerEvents}
	onexceptionrun
endscript
JustStoppedSkatingState_ExceptionTable = [
	{
		response = switch_script
		event = run
		scr = SkateToRunState
	}
	{
		response = switch_script
		event = stand
		scr = SkateToStandState
	}
	{
		response = switch_script
		event = skid
		scr = SkateToStandState
	}
	{
		response = switch_script
		event = land
		scr = LandState
	}
	{
		response = switch_script
		event = air
		scr = SkateToAirState
	}
	{
		response = switch_script
		event = jump
		scr = SkateToAirState
	}
	{
		response = switch_script
		event = walkoffedge
		scr = SkateToAirState
	}
	{
		response = switch_script
		event = droptohang
		scr = DropToHangState
	}
	{
		response = switch_script
		event = rail
		scr = WalkingToRailTrick
	}
	{
		response = switch_script
		event = Wallplant
		scr = WallplantState
	}
	{
		response = switch_script
		event = wallrunup
		scr = WallRunUpState
	}
	{
		response = switch_script
		event = wallrunright
		scr = WallRunRightState
	}
	{
		response = switch_script
		event = wallrunleft
		scr = WallRunLeftState
	}
	{
		response = switch_script
		event = ladderontobottom
		scr = LadderOntoBottomState
	}
	{
		response = switch_script
		event = ladderontotop
		scr = LadderOntoTopState
	}
	{
		response = switch_script
		event = hang
		scr = AirToHangState
	}
	{
		response = switch_script
		event = ladder
		scr = LadderLandState
	}
	{
		response = switch_script
		event = climbontowall
		scr = ClimbFromGroundState
	}
]
JustStoppedSkatingState_Restart_ExceptionTable = [
	{
		response = switch_script
		event = run
		scr = StandState
	}
	{
		response = switch_script
		event = stand
		scr = StandState
	}
	{
		response = switch_script
		event = skid
		scr = StandState
	}
	{
		response = switch_script
		event = land
		scr = StandState
	}
	{
		response = switch_script
		event = air
		scr = AirState
	}
	{
		response = switch_script
		event = jump
		scr = AirState
	}
	{
		response = switch_script
		event = walkoffedge
		scr = AirState
	}
	{
		response = switch_script
		event = droptohang
		scr = DropToHangState
	}
	{
		response = switch_script
		event = rail
		scr = WalkingToRailTrick
	}
	{
		response = switch_script
		event = Wallplant
		scr = WallplantState
	}
	{
		response = switch_script
		event = wallrunup
		scr = WallRunUpState
	}
	{
		response = switch_script
		event = wallrunright
		scr = WallRunRightState
	}
	{
		response = switch_script
		event = wallrunleft
		scr = WallRunLeftState
	}
	{
		response = switch_script
		event = ladderontobottom
		scr = LadderOntoBottomState
	}
	{
		response = switch_script
		event = ladderontotop
		scr = LadderOntoTopState
	}
	{
		response = switch_script
		event = hang
		scr = HangState
	}
	{
		response = switch_script
		event = ladder
		scr = LadderLandState
	}
	{
		response = switch_script
		event = climbontowall
		scr = ClimbFromGroundState
	}
]
StoppedConstructionTrick = [
	{
		$SwitchControl_Trigger
		scr = StandState
	}
	{
		$Enter_CAP_Trigger
		scr = Enter_CAP_mode
	}
]

script JustStoppedSkatingState 
	if NOT gotparam restart
		reseteventhandlersfromtable JustStoppedSkatingState_ExceptionTable group = WalkingStateExceptions
		seteventhandler event = AcidDrop scr = WalkingAirToTransitionTrick group = WalkingTransitionTrickExceptions response = switch_script
	else
		reseteventhandlersfromtable JustStoppedSkatingState_Restart_ExceptionTable group = WalkingStateExceptions
		seteventhandler event = AcidDrop scr = WalkingAirToTransitionTrick group = WalkingTransitionTrickExceptions response = switch_script
		BlendperiodOut 0
		getcameraid
		<cameraid> :walkcamera_reset
	endif
	seteventhandler event = trigger_l2 scr = CameraFlushButton group = WalkingEvents response = call_script
	seteventhandler event = release_x scr = JumpButton group = WalkingEvents response = call_script
	seteventhandler event = madeotherskaterbail scr = MadeOtherSkaterBailWalk group = WalkingCollideEvents response = call_script
	seteventhandler event = skatercollidebail scr = skatercollidebail group = WalkingCollideEvents response = switch_script
	settags WalkingGroundTricksInactive
	obj_spawnscriptlater ActivateGroundTricksDelay id = ActivateGroundTricksDelay
	SetWalkingTrickState NewWalkingTrickState = unset
	walk_resetpeakheight
	if currentscorepotgreaterthan 0
		obj_spawnscriptlater ComboRunOutTrickDisplayDelay id = ComboRunOutTrickDisplayDelay
	endif
	WaitWalking
endscript
SkateToRunState_ExceptionTable = [
	{
		response = switch_script
		event = stand
		scr = SkateToStandState
		params = {
			sync = 1
		}
	}
	{
		response = switch_script
		event = skid
		scr = SkateToStandState
		params = {
			sync = 1
		}
	}
	{
		response = switch_script
		event = ladderontobottom
		scr = LadderOntoBottomState
	}
	{
		response = switch_script
		event = ladderontotop
		scr = LadderOntoTopState
	}
	{
		response = switch_script
		event = jump
		scr = RunJumpState
	}
	{
		response = switch_script
		event = highhop
		scr = RunHighHopState
	}
	{
		response = switch_script
		event = walkoffedge
		scr = AirState
	}
	{
		response = switch_script
		event = droptohang
		scr = DropToHangState
	}
]

script SkateToRunState \{sync = 0}
	reseteventhandlersfromtable \{SkateToRunState_ExceptionTable
		group = WalkingStateExceptions}
	seteventhandler \{event = jumprequested
		scr = JumpRequestedEvent
		group = WalkingEvents
		response = call_script}
	SetWalkingTrickState \{NewWalkingTrickState = ground}
	walk_scaleanimspeed \{off}
	Skater_PlayWalkAnim
	Skate_AddSkateToWalkBranch sync = <sync>
	begin
	if Skater_AnimComplete
		break
	endif
	wait \{1
		gameframe}
	repeat
	Skater_PlayWalkAnim \{blendduration = 0.0}
	Skate_GotoWalkSpeedCycleBranch
	goto \{RunState
		params = {
			DontPlayWalkAnim
		}}
endscript
SkateToStandState_ExceptionTable = [
	{
		response = switch_script
		event = run
		scr = SkateToRunState
		params = {
			sync = 1
		}
	}
	{
		response = switch_script
		event = ladderontobottom
		scr = LadderOntoBottomState
	}
	{
		response = switch_script
		event = ladderontotop
		scr = LadderOntoTopState
	}
	{
		response = switch_script
		event = jump
		scr = RunJumpState
	}
	{
		response = switch_script
		event = highhop
		scr = RunHighHopState
	}
	{
		response = switch_script
		event = walkoffedge
		scr = AirState
	}
	{
		response = switch_script
		event = droptohang
		scr = DropToHangState
	}
	{
		response = switch_script
		event = poleontobottom
		scr = PoleOntoBottomState
	}
	{
		response = switch_script
		event = poleontotop
		scr = PoleOntoTopState
	}
]

script SkateToStandState 
	reseteventhandlersfromtable SkateToStandState_ExceptionTable group = WalkingStateExceptions
	seteventhandler event = jumprequested scr = JumpRequestedEvent group = WalkingEvents response = call_script
	SetWalkingTrickState NewWalkingTrickState = ground
	walk_scaleanimspeed off
	getspeed
	if (<speed> > 0.25)
		removeparameter speed
		Skater_PlaySkateToWalkAnim speed = 1.4 anim = Sk8_W_SkToStndIdle_F blendperiod = 0.1 <...>
	else
		removeparameter speed
		Skater_PlaySkateToWalkAnim anim = sk8_w_sk8tostnd_stopped_f blendperiod = 0.1 speed = 1.4 <...>
	endif
	begin
	if Skater_AnimComplete
		break
	endif
	wait 1 gameframe
	repeat
	waitanimwalking
	goto StandState
endscript
SkateToAirState_ExceptionTable = [
	{
		response = switch_script
		event = land
		scr = LandState
	}
	{
		response = switch_script
		event = hang
		scr = AirToHangState
	}
	{
		response = switch_script
		event = ladder
		scr = LadderLandState
	}
	{
		response = switch_script
		event = Wallplant
		scr = WallplantState
	}
	{
		response = switch_script
		event = wallrunright
		scr = WallRunRightState
	}
	{
		response = switch_script
		event = wallrunleft
		scr = WallRunLeftState
	}
	{
		response = switch_script
		event = climbpole
		scr = ClimbPoleLandState
	}
	{
		response = switch_script
		event = climbontowall
		scr = ClimbFromAirState
	}
]

script SkateToAirState 
	reseteventhandlersfromtable \{SkateToAirState_ExceptionTable
		group = WalkingStateExceptions}
	walk_scaleanimspeed \{off}
	Skater_PlayAirAnim \{$InAir_skate_to_air_data}
	wait \{5
		gameframes}
	SetWalkingTrickState \{NewWalkingTrickState = air}
	waitanimwalking
	goto \{AirState}
endscript
RunState_ExceptionTable = [
	{
		response = switch_script
		event = stand
		scr = StopState
	}
	{
		response = switch_script
		event = ladderontobottom
		scr = LadderOntoBottomState
	}
	{
		response = switch_script
		event = ladderontotop
		scr = LadderOntoTopState
	}
	{
		response = switch_script
		event = jump
		scr = RunJumpState
	}
	{
		response = switch_script
		event = highhop
		scr = RunHighHopState
	}
	{
		response = switch_script
		event = walkoffedge
		scr = AirState
	}
	{
		response = switch_script
		event = droptohang
		scr = DropToHangState
	}
	{
		response = switch_script
		event = ride
		scr = StandToRideState
	}
	{
		response = switch_script
		event = wallrunup
		scr = WallRunUpState
	}
	{
		response = switch_script
		event = wallrunright
		scr = WallRunRightState
	}
	{
		response = switch_script
		event = wallrunleft
		scr = WallRunLeftState
	}
	{
		response = switch_script
		event = climbontowall
		scr = ClimbFromGroundState
	}
	{
		response = switch_script
		event = poleontobottom
		scr = PoleOntoBottomState
	}
	{
		response = switch_script
		event = poleontotop
		scr = PoleOntoTopState
	}
]
RunStateIndoor_ExceptionTable = [
	{
		response = switch_script
		event = stand
		scr = StopState
		params = {
			indoor
		}
	}
]

script RunState 
	if NOT walk_isindoors
		reseteventhandlersfromtable RunState_ExceptionTable group = WalkingStateExceptions
		if gotparam NoSkid
			seteventhandler event = skid scr = StopState group = WalkingStateExceptions response = switch_script
		else
			seteventhandler event = skid scr = SkidState group = WalkingStateExceptions response = switch_script
		endif
		seteventhandler event = jumprequested scr = JumpRequestedEvent group = WalkingEvents response = call_script
		SetWalkingTrickState NewWalkingTrickState = ground
		SetWalkingGroundTricks
		onexitrun RunState_exit
	else
		reseteventhandlersfromtable RunStateIndoor_ExceptionTable group = WalkingStateExceptions
	endif
	walk_endgroundtrick
	if NOT gotparam DontPlayWalkAnim
		Skater_PlayWalkAnim
		if NOT walk_isindoors
			Skate_StartWalkSpeedBranch
		endif
	endif
	if NOT walk_isindoors
		SetWalkingGroundTricks AllowStanceToggle
	endif
	begin
	waitwalkingframe
	repeat
endscript

script RunState_exit 
	SetWalkingGroundTricks
endscript

script walk_which_foot_is_forward 
	if anim_animnodeexists \{id = bodytimer}
		anim_command \{target = bodytimer
			command = timer_getframefactor}
		if (<framefactor> < 0.3 || <framefactor> > 0.8)
			return \{foot = right}
		else
			return \{foot = left}
		endif
	endif
endscript
StandState_ExceptionTable = [
	{
		response = switch_script
		event = run
		scr = RunState
	}
	{
		response = switch_script
		event = ladderontobottom
		scr = LadderOntoBottomState
	}
	{
		response = switch_script
		event = ladderontotop
		scr = LadderOntoTopState
	}
	{
		response = switch_script
		event = jump
		scr = StandJumpState
	}
	{
		response = switch_script
		event = walkoffedge
		scr = AirState
	}
	{
		response = switch_script
		event = droptohang
		scr = DropToHangState
	}
	{
		response = switch_script
		event = ride
		scr = StandToRideState
	}
	{
		response = switch_script
		event = wallrunup
		scr = WallRunUpState
	}
	{
		response = switch_script
		event = wallrunright
		scr = WallRunRightState
	}
	{
		response = switch_script
		event = wallrunleft
		scr = WallRunLeftState
	}
	{
		response = switch_script
		event = climbontowall
		scr = ClimbFromGroundState
	}
	{
		response = switch_script
		event = poleontobottom
		scr = PoleOntoBottomState
	}
	{
		response = switch_script
		event = poleontotop
		scr = PoleOntoTopState
	}
	{
		response = switch_script
		event = highhop
		scr = RunHighHopState
	}
]
StandStateIndoor_ExceptionTable = [
	{
		response = switch_script
		event = run
		scr = RunState
		params = {
			indoor
		}
	}
]

script StopState 
	if NOT walk_isindoors
		reseteventhandlersfromtable StandState_ExceptionTable group = WalkingStateExceptions
		seteventhandler event = jumprequested scr = JumpRequestedEvent group = WalkingEvents response = call_script
		SetWalkingTrickState NewWalkingTrickState = ground
		walk_endgroundtrick
	else
		reseteventhandlersfromtable StandStateIndoor_ExceptionTable group = WalkingStateExceptions
	endif
	getspeed
	setspeed (0.45000002 * <speed>)
	obj_killspawnedscript name = Skate_RemoveWalkSpeedBranch
	Skater_TurnOffSwitchBoard
	Skate_PlayStopAnim
	Skater_PlayWalkAnim
	SetWalkingGroundTricks AllowStanceToggle
	begin
	waitanimwalking
	wait 1 gameframe
	repeat
endscript

script StandState 
	if NOT walk_isindoors
		reseteventhandlersfromtable StandState_ExceptionTable group = WalkingStateExceptions
		seteventhandler event = jumprequested scr = JumpRequestedEvent group = WalkingEvents response = call_script
		SetWalkingTrickState NewWalkingTrickState = ground
		walk_endgroundtrick
	else
		reseteventhandlersfromtable StandStateIndoor_ExceptionTable group = WalkingStateExceptions
	endif
	getspeed
	setspeed (0.45000002 * <speed>)
	obj_killspawnedscript name = Skate_RemoveWalkSpeedBranch
	walk_scaleanimspeed off
	Skater_PlayWalkAnim
	SetWalkingGroundTricks AllowStanceToggle
	onexitrun StandState_Exit
	begin
	waitanimwalking
	wait 1 gameframe
	repeat
endscript

script StandState_Exit 
	SetWalkingGroundTricks
endscript
SkidState_ExceptionTable = [
	{
		response = switch_script
		event = stand
		scr = StandState
	}
	{
		response = switch_script
		event = run
		scr = RunState
	}
	{
		response = switch_script
		event = ladderontobottom
		scr = LadderOntoBottomState
	}
	{
		response = switch_script
		event = ladderontotop
		scr = LadderOntoTopState
	}
	{
		response = switch_script
		event = jump
		scr = RunJumpState
	}
	{
		response = switch_script
		event = highhop
		scr = RunHighHopState
	}
	{
		response = switch_script
		event = walkoffedge
		scr = AirState
	}
	{
		response = switch_script
		event = droptohang
		scr = DropToHangState
	}
	{
		response = switch_script
		event = ride
		scr = StandToRideState
	}
	{
		response = switch_script
		event = wallrunup
		scr = WallRunUpState
	}
	{
		response = switch_script
		event = wallrunright
		scr = WallRunRightState
	}
	{
		response = switch_script
		event = wallrunleft
		scr = WallRunLeftState
	}
]

script SkidState 
	reseteventhandlersfromtable \{SkidState_ExceptionTable
		group = WalkingStateExceptions}
	seteventhandler \{event = jumprequested
		scr = JumpRequestedEvent
		group = WalkingEvents
		response = call_script}
	SetWalkingTrickState \{NewWalkingTrickState = ground}
	walk_scaleanimspeed \{off}
	PlayWalkAnim \{anim = _180runskid
		norestart
		blendperiod = 0.1}
	waitanimwalking
	goto \{StandState}
endscript
GroundPunchState_ExceptionTable = [
	{
		response = switch_script
		event = ladderontobottom
		scr = LadderOntoBottomState
	}
	{
		response = switch_script
		event = ladderontotop
		scr = LadderOntoTopState
	}
	{
		response = switch_script
		event = jump
		scr = RunJumpState
	}
	{
		response = switch_script
		event = walkoffedge
		scr = AirState
	}
	{
		response = switch_script
		event = droptohang
		scr = DropToHangState
	}
	{
		response = switch_script
		event = ride
		scr = StandToRideState
	}
]

script GroundPunchState 
	reseteventhandlersfromtable \{GroundPunchState_ExceptionTable
		group = WalkingStateExceptions}
	seteventhandler \{event = jumprequested
		scr = JumpRequestedEvent
		group = WalkingEvents
		response = call_script}
	SetWalkingTrickState \{NewWalkingTrickState = ground}
	walk_scaleanimspeed \{off}
	goto \{StandState}
endscript
AirPunchState_ExceptionTable = [
	{
		response = switch_script
		event = land
		scr = LandState
	}
	{
		response = switch_script
		event = hang
		scr = AirToHangState
	}
	{
		response = switch_script
		event = ladder
		scr = LadderLandState
	}
	{
		response = switch_script
		event = jump
		scr = RunJumpState
	}
	{
		response = switch_script
		event = Wallplant
		scr = WallplantState
	}
	{
		response = switch_script
		event = wallrunup
		scr = WallRunUpState
	}
	{
		response = switch_script
		event = wallrunright
		scr = WallRunRightState
	}
	{
		response = switch_script
		event = wallrunleft
		scr = WallRunLeftState
	}
]

script AirPunchState 
	reseteventhandlersfromtable \{AirPunchState_ExceptionTable
		group = WalkingStateExceptions}
	SetWalkingTrickState \{NewWalkingTrickState = air}
	walk_scaleanimspeed \{off}
	goto \{GroundOrAirWaitState}
endscript
RunJumpState_ExceptionTable = [
	{
		response = switch_script
		event = land
		scr = LandState
	}
	{
		response = switch_script
		event = hang
		scr = AirToHangState
	}
	{
		response = switch_script
		event = ladder
		scr = LadderLandState
	}
	{
		response = switch_script
		event = Wallplant
		scr = WallplantState
	}
	{
		response = switch_script
		event = wallrunup
		scr = WallRunUpState
	}
	{
		response = switch_script
		event = wallrunright
		scr = WallRunRightState
	}
	{
		response = switch_script
		event = wallrunleft
		scr = WallRunLeftState
	}
	{
		response = switch_script
		event = climbpole
		scr = ClimbPoleLandState
	}
	{
		response = switch_script
		event = climbontowall
		scr = ClimbFromAirState
	}
]

script RunJumpState anim = Sk8_W_JumpInto_RF_xFst_Fx Hopspeed = 1.0
	reseteventhandlersfromtable RunJumpState_ExceptionTable group = WalkingStateExceptions
	if NOT gotparam NoTricks
		SetWalkingTrickState NewWalkingTrickState = air
	endif
	onexitrun cleanup_double_jump
	if NOT gotparam vault
		getspeed
		if (<speed> < 1.0)
			Skater_PlayAirAnim $InAir_data
		else
			if (<speed> < 5.0)
				if NOT gotparam vault
					walk_which_foot_is_forward
					if gotparam foot
						if (<foot> = right)
							Skater_PlayAirAnim $InAir_slow_right_data
						else
							Skater_PlayAirAnim $InAir_slow_left_data
						endif
					else
						Skater_PlayAirAnim $InAir_slow_right_data
					endif
				endif
			else
				if (<speed> < 6.5)
					if NOT gotparam vault
						walk_which_foot_is_forward
						if gotparam foot
							if (<foot> = right)
								Skater_PlayAirAnim $InAir_med_right_data
							else
								Skater_PlayAirAnim $InAir_med_left_data
							endif
						else
							Skater_PlayAirAnim $InAir_med_right_data
						endif
					endif
				else
					if NOT gotparam vault
						walk_which_foot_is_forward
						if gotparam foot
							if (<foot> = right)
								Skater_PlayAirAnim $InAir_fast_right_data
							else
								Skater_PlayAirAnim $InAir_fast_left_data
							endif
						else
							Skater_PlayAirAnim $InAir_fast_right_data
						endif
					endif
				endif
			endif
		endif
		waitanimwalking
	else
		walk_scaleanimspeed off
		PlayWalkAnim anim = <anim> blendperiod = 0.01 speed = <Hopspeed>
		waitanimwalking
		Skater_PlayAirAnim $InAir_vault_data noground = 1
	endif
	goto AirState params = {no_anim}
endscript

script RunHighHopState 
	cleareventhandler \{highhop}
	onexceptionrun
	broadcastevent \{type = RunVault}
	RunJumpState <...> anim = sk8_w_vault_F vault = vault Hopspeed = 1.3 NoTricks = 1
endscript
StandJumpState_ExceptionTable = [
	{
		response = switch_script
		event = land
		scr = LandState
	}
	{
		response = switch_script
		event = hang
		scr = AirToHangState
	}
	{
		response = switch_script
		event = ladder
		scr = LadderLandState
	}
	{
		response = switch_script
		event = Wallplant
		scr = WallplantState
	}
	{
		response = switch_script
		event = wallrunup
		scr = WallRunUpState
	}
	{
		response = switch_script
		event = wallrunright
		scr = WallRunRightState
	}
	{
		response = switch_script
		event = wallrunleft
		scr = WallRunLeftState
	}
	{
		response = switch_script
		event = climbpole
		scr = ClimbPoleLandState
	}
	{
		response = switch_script
		event = climbontowall
		scr = ClimbFromAirState
	}
]

script StandJumpState 
	reseteventhandlersfromtable \{StandJumpState_ExceptionTable
		group = WalkingStateExceptions}
	SetWalkingTrickState \{NewWalkingTrickState = air}
	onexitrun \{cleanup_double_jump}
	Skater_PlayAirAnim \{$InAir_data}
	waitanimwalking
	goto \{AirState
		params = {
			no_anim
		}}
endscript

script cleanup_double_jump 
	cleareventhandler \{trigger_x}
endscript
AirState_ExceptionTable = [
	{
		response = switch_script
		event = land
		scr = LandState
	}
	{
		response = switch_script
		event = hang
		scr = AirToHangState
	}
	{
		response = switch_script
		event = ladder
		scr = LadderLandState
	}
	{
		response = switch_script
		event = jump
		scr = RunJumpState
	}
	{
		response = switch_script
		event = Wallplant
		scr = WallplantState
	}
	{
		response = switch_script
		event = wallrunup
		scr = WallRunUpState
	}
	{
		response = switch_script
		event = wallrunright
		scr = WallRunRightState
	}
	{
		response = switch_script
		event = wallrunleft
		scr = WallRunLeftState
	}
	{
		response = switch_script
		event = climbontowall
		scr = ClimbFromAirState
	}
	{
		response = switch_script
		event = climbpole
		scr = ClimbPoleLandState
	}
]

script AirState \{blend = 1.0}
	reseteventhandlersfromtable \{AirState_ExceptionTable
		group = WalkingStateExceptions}
	SetWalkingTrickState \{NewWalkingTrickState = air}
	if gotparam \{waittimer}
		skater_waitanimfinished timer = <waittimer>
	endif
	if NOT gotparam \{no_anim}
		Skater_PlayAirAnim $InAir_data groundgone = 1 blendduration = <blend>
	endif
	WaitWalking
endscript
LandState_ExceptionTable = [
	{
		response = switch_script
		event = stand
		scr = StandLandState
	}
	{
		response = switch_script
		event = run
		scr = RunLandState
	}
	{
		response = switch_script
		event = skid
		scr = SkidState
	}
	{
		response = switch_script
		event = ladderontobottom
		scr = LadderOntoBottomState
	}
	{
		response = switch_script
		event = ladderontotop
		scr = LadderOntoTopState
	}
	{
		response = switch_script
		event = jump
		scr = RunJumpState
	}
	{
		response = switch_script
		event = highhop
		scr = RunHighHopState
	}
	{
		response = switch_script
		event = walkoffedge
		scr = AirState
	}
	{
		response = switch_script
		event = droptohang
		scr = DropToHangState
	}
	{
		response = switch_script
		event = wallrunup
		scr = WallRunUpState
	}
	{
		response = switch_script
		event = wallrunright
		scr = WallRunRightState
	}
	{
		response = switch_script
		event = wallrunleft
		scr = WallRunLeftState
	}
	{
		response = switch_script
		event = climbontowall
		scr = ClimbFromGroundState
	}
	{
		response = switch_script
		event = poleontobottom
		scr = PoleOntoBottomState
	}
	{
		response = switch_script
		event = poleontotop
		scr = PoleOntoTopState
	}
]

script LandState 
	reseteventhandlersfromtable \{LandState_ExceptionTable
		group = WalkingStateExceptions}
	getspeed
	if (<speed> < 2.0)
		seteventhandler \{event = run
			scr = StandLandState
			group = WalkingEvents
			response = call_script}
	endif
	SetWalkingTrickState \{NewWalkingTrickState = ground}
	seteventhandler \{event = jumprequested
		scr = JumpRequestedEvent
		group = WalkingEvents
		response = call_script}
	if NOT currentscorepotgreaterthan \{0}
		GMan_Land
	endif
	WaitWalking
endscript
StandLandState_ExceptionTable = [
	{
		response = switch_script
		event = run
		scr = RunState
	}
	{
		response = switch_script
		event = skid
		scr = SkidState
	}
	{
		response = switch_script
		event = ladderontobottom
		scr = LadderOntoBottomState
	}
	{
		response = switch_script
		event = ladderontotop
		scr = LadderOntoTopState
	}
	{
		response = switch_script
		event = jump
		scr = StandJumpState
	}
	{
		response = switch_script
		event = walkoffedge
		scr = AirState
	}
	{
		response = switch_script
		event = droptohang
		scr = DropToHangState
	}
	{
		response = switch_script
		event = wallrunup
		scr = WallRunUpState
	}
	{
		response = switch_script
		event = wallrunright
		scr = WallRunRightState
	}
	{
		response = switch_script
		event = wallrunleft
		scr = WallRunLeftState
	}
	{
		response = switch_script
		event = poleontobottom
		scr = PoleOntoBottomState
	}
	{
		response = switch_script
		event = poleontotop
		scr = PoleOntoTopState
	}
]

script StandLandState 
	reseteventhandlersfromtable \{StandLandState_ExceptionTable
		group = WalkingStateExceptions}
	SetWalkingTrickState \{NewWalkingTrickState = ground}
	getspeed
	setspeed (<speed> / 2.0)
	walk_scaleanimspeed \{off}
	walk_getheightdrop
	Skater_PlayWalkAnim \{blendduration = 0.1}
	Skate_AddStandLandBranch
	setspeed (<speed> / 4.0)
	waitanimwalking
	walk_resetpeakheight
	goto \{StandState}
endscript
RunLandState_ExceptionTable = [
	{
		response = switch_script
		event = stand
		scr = StopState
	}
	{
		response = switch_script
		event = skid
		scr = SkidState
	}
	{
		response = switch_script
		event = ladderontobottom
		scr = LadderOntoBottomState
	}
	{
		response = switch_script
		event = ladderontotop
		scr = LadderOntoTopState
	}
	{
		response = switch_script
		event = jump
		scr = RunJumpState
	}
	{
		response = switch_script
		event = highhop
		scr = RunHighHopState
	}
	{
		response = switch_script
		event = walkoffedge
		scr = AirState
	}
	{
		response = switch_script
		event = droptohang
		scr = DropToHangState
	}
	{
		response = switch_script
		event = wallrunup
		scr = WallRunUpState
	}
	{
		response = switch_script
		event = wallrunright
		scr = WallRunRightState
	}
	{
		response = switch_script
		event = wallrunleft
		scr = WallRunLeftState
	}
	{
		response = switch_script
		event = climbontowall
		scr = ClimbFromGroundState
	}
	{
		response = switch_script
		event = poleontobottom
		scr = PoleOntoBottomState
	}
	{
		response = switch_script
		event = poleontotop
		scr = PoleOntoTopState
	}
]

script RunLandState 
	SetWalkingTrickState \{NewWalkingTrickState = ground}
	reseteventhandlersfromtable \{RunLandState_ExceptionTable
		group = WalkingStateExceptions}
	getspeed
	walk_resetpeakheight
	Skater_PlayWalkAnim \{blendduration = 0.15}
	Skate_AddLandBranch
	goto \{RunState
		params = {
			DontPlayWalkAnim
		}}
endscript

script GroundRollCleanup 
	walk_setforwardcontrollock \{off}
endscript

script WalkBailState 
	cleartrickqueue
	cleareventhandlergroup WalkingStateExceptions
	onexceptionrun
	BailSkaterTricks
	disableplayerinput AllowCameraControl
	inbail
	if NOT IsBoardMissing
		CreateBailBoard
	endif
	walk_scaleanimspeed off
	PlayWalkAnim anim = walkingbail
	skater_waitanimfinished
	PlayWalkAnim anim = walkingbail pingpong from = end speed = 0.8 blendperiod = 0.1
	waitforevent type = stand
	PlayWalkAnim anim = walkingbailgetup
	skater_waitanimfinished
	SwitchOnBoard
	Baildone
	goto StandState
endscript
GroundOrAirWaitState_ExceptionTable = [
	{
		response = switch_script
		event = run
		scr = RunState
	}
	{
		response = switch_script
		event = stand
		scr = StandState
	}
	{
		response = switch_script
		event = skid
		scr = SkidState
	}
	{
		response = switch_script
		event = hang
		scr = AirToHangState
	}
	{
		response = switch_script
		event = ladder
		scr = LadderLandState
	}
	{
		response = switch_script
		event = ladderontobottom
		scr = LadderOntoBottomState
	}
	{
		response = switch_script
		event = ladderontotop
		scr = LadderOntoTopState
	}
	{
		response = switch_script
		event = land
		scr = LandState
	}
	{
		response = switch_script
		event = air
		scr = AirState
	}
	{
		response = switch_script
		event = jump
		scr = StandJumpState
	}
	{
		response = switch_script
		event = walkoffedge
		scr = AirState
	}
	{
		response = switch_script
		event = droptohang
		scr = DropToHangState
	}
	{
		response = switch_script
		event = rail
		scr = WalkingToRailTrick
	}
	{
		response = switch_script
		event = Wallplant
		scr = WallplantState
	}
	{
		response = switch_script
		event = wallrunup
		scr = WallRunUpState
	}
	{
		response = switch_script
		event = wallrunright
		scr = WallRunRightState
	}
	{
		response = switch_script
		event = wallrunleft
		scr = WallRunLeftState
	}
]

script GroundOrAirWaitState 
	reseteventhandlersfromtable \{GroundOrAirWaitState_ExceptionTable
		group = WalkingStateExceptions}
	seteventhandler \{event = AcidDrop
		scr = WalkingAirToTransitionTrick
		group = WalkingTransitionTrickExceptions
		response = switch_script}
	WaitWalking
endscript

script StandToRideState 
	ClearAllWalkingExceptions
	goto \{RideState}
endscript

script RideState 
	cleareventhandlergroup \{WalkingStateExceptions}
	onexceptionrun
	seteventhandler \{event = stand
		scr = RideToStandState
		group = WalkingStateExceptions
		response = switch_script}
	begin
	wait \{1
		gameframe}
	repeat
endscript

script RideToStandState 
	cleareventhandlergroup \{WalkingStateExceptions}
	onexceptionrun
	goto \{StandState}
endscript

script CameraFlushButton 
	getcameraid
	<cameraid> :walkcamera_flushrequest
endscript

script JumpButton 
	launchevent \{type = jumprequested}
endscript

script JumpRequestedEvent 
	cleareventhandler jumprequested
	if NOT walking
		return
	endif
	walk_getstate
	switch <state>
		case walking_ground
		case walking_wall
		case walking_ladder
		case walking_climb
		case walking_climb_pole
		case walking_animwait
		walk_jump
		launchevent type = jump
		case walking_air
		walk_getstatetime
		if (<statetime> < $skater_late_jump_slop)
			walk_jump
			launchevent type = jump
		endif
		case walking_hang
		walk_getstateduration
		if (<stateduration> > 0.5)
			walk_jump
			launchevent type = jump
		else
			walk_getpreviousstate
			if NOT (<previousstate> = walking_air)
				walk_jump
				launchevent type = jump
			else
				seteventhandler event = jumprequested scr = JumpRequestedEvent group = WalkingEvents response = call_script
			endif
		endif
	endswitch
endscript

script flip_skater_if_180_off 
	if invertair
		return
	endif
	if InManual
		return
	endif
	getactualspin
	begin
	if ((<spin> > 360) || (<spin> = 360))
		spin = (<spin> - 360)
	else
		break
	endif
	repeat
	if (<spin> < 270)
		if (<spin> > 90)
			flipafter
			rotateafter
			BlendperiodOut \{0}
		endif
	endif
endscript

script walking_stance_toggle 
	ClearTrickQueues
	setqueuetricks \{NoTricks}
	walk_startgroundtrick
	getspeed
	if (<speed> > 0.25)
		MakeSkaterGoto \{StanceToggleRunning
			params = {
				blendperiod = 0
			}}
	else
		MakeSkaterGoto \{StanceToggleStanding
			params = {
				blendperiod = 0
			}}
	endif
endscript
StanceToggleRunning_ExceptionTable = [
	{
		response = switch_script
		event = skid
		scr = StanceToggleStanding
		params = {
			SyncToPreviousAnim
		}
	}
	{
		response = switch_script
		event = walkoffedge
		scr = AirState
	}
]

script StanceToggleRunning 
	reseteventhandlersfromtable \{StanceToggleRunning_ExceptionTable
		group = WalkingStateExceptions}
	Skater_PlaySwitchBoard
	flip
	boardrotate
	wait \{1
		gameframe}
	Skater_TurnOffSwitchBoard
	Skater_PlayWalkAnim \{sync = 1
		blendduration = 0.1}
	Skate_GotoWalkSpeedCycleBranch \{sync = 1}
	SetWalkingGroundTricks \{AllowStanceToggle}
	walk_endgroundtrick
	MakeSkaterGoto \{RunState
		params = {
			DontPlayWalkAnim
		}}
endscript

script StanceToggleGotoRun 
	flip
	boardrotate
	wait \{1
		gameframe}
	MakeSkaterGoto \{RunState}
endscript
StanceToggleStanding_ExceptionTable = [
	{
		response = switch_script
		event = run
		scr = StanceToggleGotoRun
	}
	{
		response = switch_script
		event = walkoffedge
		scr = AirState
	}
]

script StanceToggleStanding 
	reseteventhandlersfromtable \{StanceToggleStanding_ExceptionTable
		group = WalkingStateExceptions}
	skater_playanim anim = sk8_w_switchboard_F from = <from> speed = <speed> blendperiod = <blendperiod>
	skater_waitanimfinished
	flip
	boardrotate
	wait \{1
		gameframe}
	Skater_TurnOffSwitchBoard
	SetWalkingGroundTricks \{AllowStanceToggle}
	walk_endgroundtrick
	MakeSkaterGoto \{StandState}
endscript
WalkIndoorState_ExceptionTable = [
	{
		response = switch_script
		event = run
		scr = RunState
		params = {
			indoor
		}
	}
	{
		response = switch_script
		event = stand
		scr = StopState
		params = {
			indoor
		}
	}
]

script WalkIndoorState 
	ClearTrickQueues
	setqueuetricks \{NoTricks}
	ClearAllWalkingExceptions
	walk_enterindoors
	reseteventhandlersfromtable \{WalkIndoorState_ExceptionTable
		group = WalkingStateExceptions}
endscript

script walking_wallplant_switch 
	MakeSkaterGoto \{walking_wallplant_switch2}
endscript

script walking_wallplant_switch2 
	walk_scaleanimspeed \{off}
	skater_playanim \{anim = JumpAirToAirIdle
		speed = 3.0}
	CleanUp_WalkingtoSkating
	WaitAnimWhilstChecking
	rotate \{y
		angle = 180}
	walkingwallplant
	goto \{Airborne
		params = {
			NoSkateToWalkTricks
		}}
endscript
WallplantState_ExceptionTable = [
	{
		response = switch_script
		event = land
		scr = LandState
	}
	{
		response = switch_script
		event = hang
		scr = AirToHangState
	}
	{
		response = switch_script
		event = ladder
		scr = LadderLandState
	}
	{
		response = switch_script
		event = Wallplant
		scr = WallplantState
	}
	{
		response = switch_script
		event = wallrunup
		scr = WallRunUpState
	}
	{
		response = switch_script
		event = wallrunright
		scr = WallRunRightState
	}
	{
		response = switch_script
		event = wallrunleft
		scr = WallRunLeftState
	}
]

script WallplantState 
	reseteventhandlersfromtable \{WallplantState_ExceptionTable
		group = WalkingStateExceptions}
	SetWalkingTrickState \{NewWalkingTrickState = air}
	broadcastevent \{type = SkaterWallplant}
	if currentscorepotgreaterthan \{0}
		settrickname \{"Wall Jump"}
		settrickscore \{100}
		display
	endif
	walk_scaleanimspeed \{off}
	PlayWalkAnim \{anim = Jump_DoubleJump
		blendperiod = 0.02}
	waitanimwalking
	goto \{AirState}
endscript
WallflipState_ExceptionTable = [
	{
		response = switch_script
		event = land
		scr = LandState
	}
]

script WallflipState 
	reseteventhandlersfromtable \{WallflipState_ExceptionTable
		group = WalkingStateExceptions}
	SetWalkingTrickState \{NewWalkingTrickState = air}
	broadcastevent \{type = SkaterWallplant}
	settrickname \{"Wall Flip"}
	settrickscore \{100}
	display
	onexitrun \{WallflipState_exit}
	walk_setforwardcontrollock \{on}
	broadcastevent \{type = wallflip}
	walk_scaleanimspeed \{off}
	PlayWalkAnim \{anim = Walking_WallFlip
		blendperiod = 0.0}
	Skater_WaitAnim \{percent = 50}
	SetWalkingAirTricks
	waitanimwalking
	goto \{AirState}
endscript

script WallflipState_exit 
	walk_setforwardcontrollock \{off}
	runtimer_addtime \{1.0}
endscript
WallRunUpState_ExceptionTable = [
	{
		response = switch_script
		event = hang
		scr = AirToHangState
	}
	{
		response = switch_script
		event = ladder
		scr = LadderLandState
	}
	{
		response = switch_script
		event = jump
		scr = AirState
	}
	{
		response = switch_script
		event = groundgone
		scr = AirState
	}
]

script WallRunUpState 
	reseteventhandlersfromtable WallRunUpState_ExceptionTable group = WalkingStateExceptions
	seteventhandler event = jumprequested scr = JumpRequestedEvent group = WalkingEvents response = call_script
	SetWalkingTrickState NewWalkingTrickState = off
	LaunchStateChangeEvent state = Skater_OnWall
	walk_setforwardcontrollock on
	onexitrun WallRunUpState_exit
	broadcastevent type = EnterWallRunUp
	walk_scaleanimspeed off
	PlayWalkAnim anim = Sk8_W_WallRunUp_F blendperiod = 0.02 speed = 0.8
	settrickname "Wall Run-up"
	settrickscore 100
	display
	waitanimwalking
	walk_endwallrunup
endscript

script WallRunUpState_exit 
	walk_setforwardcontrollock \{off}
endscript

script show_wallrun_prompt 
	if NOT insplitscreengame
		if NOT gman_getactivatedgoalid
			ui_display_message \{type = instruction
				text = $str_w_c_0
				time = 5}
		endif
	endif
endscript
