ClimbFromGroundState_ExceptionTable = [
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

script ClimbFromGroundState 
	reseteventhandlersfromtable \{ClimbFromGroundState_ExceptionTable
		group = WalkingStateExceptions}
	SetWalkingTrickState \{NewWalkingTrickState = off}
	LaunchStateChangeEvent \{state = Skater_InWallClimb}
	walk_scaleanimspeed \{off}
	PlayWalkAnim anim = ($wall_climb_misc.mount) speed = 1.8
	waitanimwalking
	walk_animwaitcomplete
	goto \{ClimbIdleState
		params = {
			no_stop_anim
		}}
endscript
ClimbFromAirState_ExceptionTable = [
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
	{
		response = switch_script
		event = hang
		scr = HangState
		params = {
			blend = 0.2
		}
	}
	{
		response = switch_script
		event = climb
		scr = ClimbState
	}
]

script ClimbFromAirState 
	reseteventhandlersfromtable ClimbFromAirState_ExceptionTable group = WalkingStateExceptions
	SetWalkingTrickState NewWalkingTrickState = off
	LaunchStateChangeEvent state = Skater_InWallClimb
	walk_scaleanimspeed off
	onexitrun ClimbFromAirState_exit
	walk_getprevairvertvel
	printstruct <...>
	if flipped
		prev_horiz_vel = (-1.0 * <prev_horiz_vel>)
	endif
	PlayClimbAnim {
		tree = $Climb_Land_Branch
		data = $wall_climb_land_data
		blendduration = 0.1
		dont_update = 1
		x_vel = <prev_horiz_vel>
		y_vel = <prev_vert_vel>
	}
	Skater_WaitAnim timer = climbtimer percent = 35
	walk_climblandingfinished
	seteventhandler response = switch_script event = climb scr = ClimbState group = WalkingStateExceptions
	skater_waitanimfinished timer = climbtimer
	goto ClimbIdleState params = {no_stop_anim}
endscript

script ClimbFromAirState_exit 
	walk_climblandingfinished
endscript
ClimbIdleState_ExceptionTable = [
	{
		response = switch_script
		event = hang
		scr = HangState
		params = {
			blend = 0.2
		}
	}
	{
		response = switch_script
		event = ladder
		scr = LadderMoveUpState
	}
	{
		response = switch_script
		event = jump
		scr = ClimbJumpState
	}
	{
		response = switch_script
		event = groundgone
		scr = AirState
	}
	{
		response = switch_script
		event = climb
		scr = ClimbState
	}
]

script ClimbIdleState 
	reseteventhandlersfromtable \{ClimbIdleState_ExceptionTable
		group = WalkingStateExceptions}
	seteventhandler \{event = jumprequested
		scr = JumpRequestedEvent
		group = WalkingEvents
		response = call_script}
	SetWalkingTrickState \{NewWalkingTrickState = off}
	LaunchStateChangeEvent \{state = Skater_InWallClimb}
	walk_scaleanimspeed \{off}
	PlayWalkAnim anim = ($wall_climb_misc.idle) blendperiod = 0.3 cycle tree = $Climb_single_anim_Branch
	waitanimwalking
	walk_endwallrunup
endscript
ClimbState_ExceptionTable = [
	{
		response = switch_script
		event = hang
		scr = HangState
		params = {
			blend = 0.2
		}
	}
	{
		response = switch_script
		event = ladder
		scr = LadderMoveUpState
	}
	{
		response = switch_script
		event = jump
		scr = ClimbJumpState
	}
	{
		response = switch_script
		event = groundgone
		scr = AirState
	}
	{
		response = switch_script
		event = climbidle
		scr = ClimbIdleState
	}
	{
		response = switch_script
		event = stand
		scr = StandState
	}
]

script ClimbState 
	reseteventhandlersfromtable \{ClimbState_ExceptionTable
		group = WalkingStateExceptions}
	seteventhandler \{event = jumprequested
		scr = JumpRequestedEvent
		group = WalkingEvents
		response = call_script}
	SetWalkingTrickState \{NewWalkingTrickState = off}
	LaunchStateChangeEvent \{state = Skater_InWallClimb}
	walk_scaleanimspeed \{off}
	last_anim = 0
	PlayClimbAnim \{cycle = 1
		data = $wall_climb_data}
	walk_endwallrunup
endscript

script ClimbJumpState \{blend = 0.1}
	cleareventhandlergroup
	PlayClimbAnim data = $wall_climb_jump_data tree = $Climb_Land_Branch blendduration = <blend>
	goto \{AirState
		params = {
			waittimer = climbtimer
		}}
endscript

script climbrotateawayfromwall 
	rotate \{y = 180
		duration = 0.3
		seconds}
	wait \{0.1
		seconds}
	CameraFlushButton
endscript
PoleOntoBottomState_ExceptionTable = [
	{
		response = switch_script
		event = jump
		scr = ClimbJumpState
	}
	{
		response = switch_script
		event = poleoffbottom
		scr = PoleOffBottomState
	}
]

script PoleOntoBottomState 
	reseteventhandlersfromtable \{PoleOntoBottomState_ExceptionTable
		group = WalkingStateExceptions}
	SetWalkingTrickState \{NewWalkingTrickState = off}
	LaunchStateChangeEvent \{state = Skater_InPoleClimb}
	walk_scaleanimspeed \{off}
	PlayWalkAnim \{anim = Sk8_W_Pole_ClimbOn_F
		blendperiod = 0.3
		speed = 1.0}
	walk_setanimwaitfactors \{beginanimfactor = 0
		endanimfactor = 0.2}
	Skater_WaitAnim \{timer = bodytimer
		percent = 50}
	walk_animwaitcomplete
	goto \{ClimbPoleIdleState}
endscript
PoleOntoTopState_ExceptionTable = [
	{
		response = switch_script
		event = jump
		scr = ClimbJumpState
	}
]

script PoleOntoTopState 
	reseteventhandlersfromtable \{PoleOntoTopState_ExceptionTable
		group = WalkingStateExceptions}
	SetWalkingTrickState \{NewWalkingTrickState = off}
	LaunchStateChangeEvent \{state = Skater_InPoleClimb}
	walk_scaleanimspeed \{off}
	PlayWalkAnim anim = Sk8_W_LadClimbToStndIdle_F backwards blendperiod = 0.3 speed = ($walk_parameters.ladder_anim_wait_speed)
	waitanimwalking
	walk_animwaitcomplete
	goto \{ClimbPoleIdleState}
endscript
PoleFromHangState_ExceptionTable = [
	{
		response = switch_script
		event = jump
		scr = ClimbJumpState
	}
]

script PoleFromHangState 
	reseteventhandlersfromtable \{PoleOntoTopState_ExceptionTable
		group = WalkingStateExceptions}
	SetWalkingTrickState \{NewWalkingTrickState = off}
	LaunchStateChangeEvent \{state = Skater_InPoleClimb}
	walk_scaleanimspeed \{off}
	PlayWalkAnim \{anim = sk8_w_pole_climbidle_f
		blendperiod = 0.3}
	wait \{0.3
		seconds}
	walk_animwaitcomplete
	goto \{ClimbPoleIdleState}
endscript
ClimbPoleLandState_ExceptionTable = [
	{
		response = switch_script
		event = jump
		scr = ClimbJumpState
	}
]

script ClimbPoleLandState 
	reseteventhandlersfromtable \{ClimbPoleLandState_ExceptionTable
		group = WalkingStateExceptions}
	SetWalkingTrickState \{NewWalkingTrickState = off}
	LaunchStateChangeEvent \{state = Skater_InPoleClimb}
	seteventhandler \{event = jumprequested
		scr = JumpRequestedEvent
		group = WalkingEvents
		response = call_script}
	walk_scaleanimspeed \{off}
	PlayWalkAnim \{anim = Sk8_W_Pole_Grabfromair_F
		blendperiod = 0.2}
	Skater_WaitAnim \{timer = bodytimer
		percent = 10}
	walk_animwaitcomplete
	goto \{ClimbPoleIdleState}
endscript
ClimbPoleIdleState_ExceptionTable = [
	{
		response = switch_script
		event = jump
		scr = ClimbJumpState
	}
	{
		response = switch_script
		event = groundgone
		scr = AirState
	}
	{
		response = switch_script
		event = climbuppole
		scr = ClimbUpPoleState
	}
	{
		response = switch_script
		event = climbdownpole
		scr = ClimbDownPoleState
	}
	{
		response = switch_script
		event = slidedownpole
		scr = SlideDownPoleState
	}
	{
		response = switch_script
		event = polerotateleft
		scr = PoleRotateLeftState
	}
	{
		response = switch_script
		event = polerotateright
		scr = PoleRotateRightState
	}
	{
		response = switch_script
		event = hang
		scr = HangState
		params = {
			blend = 0.2
		}
	}
	{
		response = switch_script
		event = poleoffbottom
		scr = PoleOffBottomState
	}
	{
		response = switch_script
		event = poleofftop
		scr = PoleOffTopState
	}
]

script ClimbPoleIdleState 
	reseteventhandlersfromtable \{ClimbPoleIdleState_ExceptionTable
		group = WalkingStateExceptions}
	SetWalkingTrickState \{NewWalkingTrickState = off}
	LaunchStateChangeEvent \{state = Skater_InPoleClimb}
	seteventhandler \{event = jumprequested
		scr = JumpRequestedEvent
		group = WalkingEvents
		response = call_script}
	walk_scaleanimspeed \{off}
	PlayWalkAnim \{anim = sk8_w_pole_climbidle_f
		blendperiod = 0.4
		speed = 1.0
		cycle}
	waitanimwalking
	walk_endwallrunup
endscript
ClimbUpPoleState_ExceptionTable = [
	{
		response = switch_script
		event = jump
		scr = ClimbJumpState
		params = {
			blend = 0.2
		}
	}
	{
		response = switch_script
		event = groundgone
		scr = AirState
	}
	{
		response = switch_script
		event = climbpole
		scr = ClimbPoleIdleState
	}
	{
		response = switch_script
		event = climbdownpole
		scr = ClimbDownPoleState
	}
	{
		response = switch_script
		event = slidedownpole
		scr = SlideDownPoleState
	}
	{
		response = switch_script
		event = polerotateleft
		scr = PoleRotateLeftState
	}
	{
		response = switch_script
		event = polerotateright
		scr = PoleRotateRightState
	}
	{
		response = switch_script
		event = poleofftop
		scr = PoleOffTopState
	}
	{
		response = switch_script
		event = air
		scr = AirState
	}
	{
		response = switch_script
		event = hang
		scr = HangState
		params = {
			blend = 0.2
		}
	}
]

script ClimbUpPoleState 
	cleareventhandlergroup
	SetWalkingTrickState \{NewWalkingTrickState = off}
	LaunchStateChangeEvent \{state = Skater_InPoleClimb}
	reseteventhandlersfromtable \{ClimbUpPoleState_ExceptionTable
		group = WalkingStateExceptions}
	seteventhandler \{event = jumprequested
		scr = JumpRequestedEvent
		group = WalkingEvents
		response = call_script}
	PlayWalkAnim \{anim = sk8_w_pole_climbup_f
		blendperiod = 0.4
		speed = 1.3
		cycle}
	waitanimwalking
endscript
PoleOffTopState_ExceptionTable = [
	{
		response = switch_script
		event = jump
		scr = ClimbJumpState
	}
]

script PoleOffTopState 
	reseteventhandlersfromtable \{PoleOffTopState_ExceptionTable
		group = WalkingStateExceptions}
	SetWalkingTrickState \{NewWalkingTrickState = off}
	walk_scaleanimspeed \{off}
	PlayWalkAnim anim = Sk8_W_LadClimbToStndIdle_F blendperiod = 0.3 speed = ($walk_parameters.ladder_anim_wait_speed)
	waitanimwalking
	walk_animwaitcomplete
	Skater_PlayWalkAnim
	goto \{GroundOrAirWaitState}
endscript
ClimbDownPoleState_ExceptionTable = [
	{
		response = switch_script
		event = jump
		scr = ClimbJumpState
		params = {
			blend = 0.2
		}
	}
	{
		response = switch_script
		event = groundgone
		scr = AirState
	}
	{
		response = switch_script
		event = climbpole
		scr = ClimbPoleIdleState
	}
	{
		response = switch_script
		event = climbuppole
		scr = ClimbUpPoleState
	}
	{
		response = switch_script
		event = slidedownpole
		scr = SlideDownPoleState
	}
	{
		response = switch_script
		event = polerotateleft
		scr = PoleRotateLeftState
	}
	{
		response = switch_script
		event = polerotateright
		scr = PoleRotateRightState
	}
	{
		response = switch_script
		event = poleoffbottom
		scr = PoleOffBottomState
	}
	{
		response = switch_script
		event = hang
		scr = HangState
		params = {
			blend = 0.2
		}
	}
]

script ClimbDownPoleState 
	cleareventhandlergroup
	SetWalkingTrickState \{NewWalkingTrickState = off}
	LaunchStateChangeEvent \{state = Skater_InPoleClimb}
	reseteventhandlersfromtable \{ClimbDownPoleState_ExceptionTable
		group = WalkingStateExceptions}
	seteventhandler \{event = jumprequested
		scr = JumpRequestedEvent
		group = WalkingEvents
		response = call_script}
	PlayWalkAnim \{anim = sk8_w_pole_climbdwn_f
		blendperiod = 0.4
		speed = 1.3
		cycle}
	waitanimwalking
endscript
SlideDownPoleState_ExceptionTable = [
	{
		response = switch_script
		event = jump
		scr = ClimbJumpState
		params = {
			blend = 0.2
		}
	}
	{
		response = switch_script
		event = groundgone
		scr = AirState
	}
	{
		response = switch_script
		event = climbpole
		scr = ClimbPoleIdleState
	}
	{
		response = switch_script
		event = climbuppole
		scr = ClimbUpPoleState
	}
	{
		response = switch_script
		event = climbdownpole
		scr = ClimbDownPoleState
	}
	{
		response = switch_script
		event = polerotateleft
		scr = PoleRotateLeftState
	}
	{
		response = switch_script
		event = polerotateright
		scr = PoleRotateRightState
	}
	{
		response = switch_script
		event = poleoffbottom
		scr = PoleOffBottomState
	}
]

script SlideDownPoleState 
	cleareventhandlergroup
	SetWalkingTrickState \{NewWalkingTrickState = off}
	LaunchStateChangeEvent \{state = Skater_InPoleClimb}
	reseteventhandlersfromtable \{SlideDownPoleState_ExceptionTable
		group = WalkingStateExceptions}
	seteventhandler \{event = jumprequested
		scr = JumpRequestedEvent
		group = WalkingEvents
		response = call_script}
	PlayWalkAnim \{anim = sk8_w_pole_climbslideidle_f
		blendperiod = 0.2
		speed = 1.3
		cycle}
	waitanimwalking
endscript
PoleOffBottomState_ExceptionTable = [
	{
		response = switch_script
		event = jump
		scr = ClimbJumpState
	}
]

script PoleOffBottomState 
	reseteventhandlersfromtable \{PoleOffBottomState_ExceptionTable
		group = WalkingStateExceptions}
	SetWalkingTrickState \{NewWalkingTrickState = off}
	walk_scaleanimspeed \{off}
	PlayWalkAnim anim = Sk8_W_Pole_ClimbOff_F blendperiod = 0.3 speed = ($walk_parameters.ladder_anim_wait_speed)
	walk_setanimwaitfactors \{beginanimfactor = 0
		endanimfactor = 0.5}
	Skater_WaitAnim \{timer = bodytimer
		percent = 60}
	walk_animwaitcomplete
	Skater_PlayWalkAnim \{blendperiod = 0.0}
	goto \{GroundOrAirWaitState}
endscript
PoleRotateLeftState_ExceptionTable = [
	{
		response = switch_script
		event = jump
		scr = ClimbJumpState
		params = {
			blend = 0.2
		}
	}
	{
		response = switch_script
		event = groundgone
		scr = AirState
	}
	{
		response = switch_script
		event = climbpole
		scr = ClimbPoleIdleState
	}
	{
		response = switch_script
		event = climbuppole
		scr = ClimbUpPoleState
	}
	{
		response = switch_script
		event = climbdownpole
		scr = ClimbDownPoleState
	}
	{
		response = switch_script
		event = slidedownpole
		scr = SlideDownPoleState
	}
	{
		response = switch_script
		event = polerotateright
		scr = PoleRotateRightState
	}
	{
		response = switch_script
		event = hang
		scr = HangState
		params = {
			blend = 0.2
		}
	}
]

script PoleRotateLeftState 
	cleareventhandlergroup
	SetWalkingTrickState \{NewWalkingTrickState = off}
	LaunchStateChangeEvent \{state = Skater_InPoleClimb}
	reseteventhandlersfromtable \{PoleRotateLeftState_ExceptionTable
		group = WalkingStateExceptions}
	seteventhandler \{event = jumprequested
		scr = JumpRequestedEvent
		group = WalkingEvents
		response = call_script}
	PlayWalkAnim \{anim = sk8_w_pole_climbleft_f
		blendperiod = 0.4
		speed = 1.3
		cycle}
	waitanimwalking
endscript
PoleRotateRightState_ExceptionTable = [
	{
		response = switch_script
		event = jump
		scr = ClimbJumpState
		params = {
			blend = 0.2
		}
	}
	{
		response = switch_script
		event = groundgone
		scr = AirState
	}
	{
		response = switch_script
		event = climbpole
		scr = ClimbPoleIdleState
	}
	{
		response = switch_script
		event = climbuppole
		scr = ClimbUpPoleState
	}
	{
		response = switch_script
		event = climbdownpole
		scr = ClimbDownPoleState
	}
	{
		response = switch_script
		event = slidedownpole
		scr = SlideDownPoleState
	}
	{
		response = switch_script
		event = polerotateleft
		scr = PoleRotateLeftState
	}
	{
		response = switch_script
		event = hang
		scr = HangState
		params = {
			blend = 0.2
		}
	}
]

script PoleRotateRightState 
	cleareventhandlergroup
	SetWalkingTrickState \{NewWalkingTrickState = off}
	LaunchStateChangeEvent \{state = Skater_InPoleClimb}
	reseteventhandlersfromtable \{PoleRotateRightState_ExceptionTable
		group = WalkingStateExceptions}
	seteventhandler \{event = jumprequested
		scr = JumpRequestedEvent
		group = WalkingEvents
		response = call_script}
	PlayWalkAnim \{anim = sk8_w_pole_climbright_f
		blendperiod = 0.4
		speed = 1.3
		cycle}
	waitanimwalking
endscript
HangState_ExceptionTable = [
	{
		response = switch_script
		event = hangmoveleft
		scr = HangMoveLeftState
	}
	{
		response = switch_script
		event = hangmoveright
		scr = HangMoveRightState
	}
	{
		response = switch_script
		event = air
		scr = HangDropState
	}
	{
		response = switch_script
		event = jump
		scr = HangJumpState
	}
	{
		response = switch_script
		event = pullupfromhang
		scr = PullUpFromHangState
	}
	{
		response = switch_script
		event = climbontowall
		scr = ClimbFromAirState
	}
	{
		response = switch_script
		event = ladder
		scr = LadderFromHangState
	}
	{
		response = switch_script
		event = climbpole
		scr = PoleFromHangState
	}
]

script HangState \{blend = 0.3}
	reseteventhandlersfromtable \{HangState_ExceptionTable
		group = WalkingStateExceptions}
	seteventhandler \{event = jumprequested
		scr = JumpRequestedEvent
		group = WalkingEvents
		response = call_script}
	setqueuetricks \{WalkHangTricks}
	LaunchStateChangeEvent \{state = Skater_InHang}
	walk_scaleanimspeed \{off}
	if Skater_AnimEquals \{[
				JumpToSwingHang
				JumpToWallHang
				Walking_wallGrab_FromJumpAir
			]}
		waitanimwalking
	endif
	if walk_ishangingfromwall
		AnimData = $hang_wall_data
	else
		AnimData = $hang_wire_data
	endif
	PlayHangAnim <AnimData> blendduration = <blend>
endscript
AirToHangState_ExceptionTable = [
	{
		response = switch_script
		event = hangmoveleft
		scr = HangMoveLeftState
	}
	{
		response = switch_script
		event = hangmoveright
		scr = HangMoveRightState
	}
	{
		response = switch_script
		event = air
		scr = HangDropState
	}
	{
		response = switch_script
		event = jump
		scr = HangJumpState
	}
	{
		response = switch_script
		event = pullupfromhang
		scr = PullUpFromHangState
	}
]

script AirToHangState 
	reseteventhandlersfromtable AirToHangState_ExceptionTable group = WalkingStateExceptions
	seteventhandler event = jumprequested scr = JumpRequestedEvent group = WalkingEvents response = call_script
	SetWalkingTrickState NewWalkingTrickState = off
	LaunchStateChangeEvent state = Skater_InHang
	walk_scaleanimspeed off
	if walk_ishangingfromwall
		anim = Sk8_W_WallGrab_JumpToHang_F
		settrickname "Wall Grab"
	else
		anim = Sk8_W_WireHang_JumpToHang_F
		settrickname "Wire Grab"
	endif
	if currentscorepotgreaterthan 0
		settrickscore 100
		display
	endif
	PlayWalkAnim anim = <anim> blendperiod = 0.2 speed = 1.25
	waitanimwalking
	goto HangState
endscript
HangMoveLeftState_ExceptionTable = [
	{
		response = switch_script
		event = hang
		scr = HangState
		params = {
			blend = 0.2
		}
	}
	{
		response = switch_script
		event = hangmoveright
		scr = HangMoveRightState
	}
	{
		response = switch_script
		event = air
		scr = HangDropState
	}
	{
		response = switch_script
		event = jump
		scr = HangJumpState
	}
	{
		response = switch_script
		event = pullupfromhang
		scr = PullUpFromHangState
	}
	{
		response = switch_script
		event = ladder
		scr = LadderFromHangState
	}
	{
		response = switch_script
		event = climbpole
		scr = PoleFromHangState
	}
]

script HangMoveLeftState 
	reseteventhandlersfromtable HangMoveLeftState_ExceptionTable group = WalkingStateExceptions
	seteventhandler event = jumprequested scr = JumpRequestedEvent group = WalkingEvents response = call_script
	SetWalkingTrickState NewWalkingTrickState = off
	LaunchStateChangeEvent state = Skater_InHang
	walk_scaleanimspeed hangmove
	if NOT walk_ishangingfromwall
		if NOT flipped
			AnimData = $hang_wire_right_data
		else
			AnimData = $hang_wire_left_data
		endif
	else
		if NOT flipped
			AnimData = $hang_wall_right_data
		else
			AnimData = $hang_wall_left_data
		endif
	endif
	PlayHangAnim <AnimData> blendduration = 0.2
endscript
HangMoveRightState_ExceptionTable = [
	{
		response = switch_script
		event = hang
		scr = HangState
		params = {
			blend = 0.2
		}
	}
	{
		response = switch_script
		event = hangmoveleft
		scr = HangMoveLeftState
	}
	{
		response = switch_script
		event = air
		scr = HangDropState
	}
	{
		response = switch_script
		event = jump
		scr = HangJumpState
	}
	{
		response = switch_script
		event = pullupfromhang
		scr = PullUpFromHangState
	}
	{
		response = switch_script
		event = ladder
		scr = LadderFromHangState
	}
	{
		response = switch_script
		event = climbpole
		scr = PoleFromHangState
	}
]

script HangMoveRightState 
	reseteventhandlersfromtable HangMoveRightState_ExceptionTable group = WalkingStateExceptions
	seteventhandler event = jumprequested scr = JumpRequestedEvent group = WalkingEvents response = call_script
	SetWalkingTrickState NewWalkingTrickState = off
	LaunchStateChangeEvent state = Skater_InHang
	walk_scaleanimspeed hangmove
	if NOT walk_ishangingfromwall
		if flipped
			AnimData = $hang_wire_right_data
		else
			AnimData = $hang_wire_left_data
		endif
	else
		if flipped
			AnimData = $hang_wall_right_data
		else
			AnimData = $hang_wall_left_data
		endif
	endif
	PlayHangAnim <AnimData> blendduration = 0.2
endscript
HangToAirState_ExceptionTable = [
	{
		response = switch_script
		event = land
		scr = LandState
	}
	{
		response = switch_script
		event = hang
		scr = HangState
		params = {
			blend = 0.2
		}
	}
	{
		response = switch_script
		event = ladder
		scr = LadderMoveUpState
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
		event = ladder
		scr = LadderFromHangState
	}
	{
		response = switch_script
		event = climbpole
		scr = PoleFromHangState
	}
	{
		response = switch_script
		event = climbontowall
		scr = ClimbFromAirState
	}
]

script HangDropState 
	reseteventhandlersfromtable \{HangToAirState_ExceptionTable
		group = WalkingStateExceptions}
	cleareventhandler \{jumprequested}
	onexceptionrun
	SetWalkingTrickState \{NewWalkingTrickState = air}
	walk_scaleanimspeed \{off}
	PlayWalkAnim \{anim = Sk8_W_Hang_IdleToDrop_F
		blendperiod = 0.05}
	waitanimwalking
	goto \{AirState}
endscript

script HangJumpState 
	reseteventhandlersfromtable \{HangToAirState_ExceptionTable
		group = WalkingStateExceptions}
	cleareventhandler \{jumprequested}
	onexceptionrun
	SetWalkingTrickState \{NewWalkingTrickState = air}
	walk_scaleanimspeed \{off}
	PlayWalkAnim \{anim = Sk8_W_Hang_IdleToDrop_F
		blendperiod = 0.05}
	waitanimwalking
	goto \{AirState}
endscript
PullUpFromHangState_ExceptionTable = [
	{
		response = switch_script
		event = jump
		scr = AirState
	}
]

script PullUpFromHangState 
	reseteventhandlersfromtable PullUpFromHangState_ExceptionTable group = WalkingStateExceptions
	seteventhandler event = jumprequested scr = JumpRequestedEvent group = WalkingEvents response = call_script
	SetWalkingTrickState NewWalkingTrickState = off
	LaunchStateChangeEvent state = Skater_InHang
	if NOT walk_ishangingfromwall
		anim = Sk8_W_Hang_IdleToTop_F
	else
		anim = Sk8_W_WallGrb_IdleToTop_F
	endif
	walk_scaleanimspeed off
	PlayWalkAnim anim = <anim> blendperiod = 0.05 speed = ($walk_parameters.hang_anim_wait_speed)
	Skater_WaitAnim timer = bodytimer percent = 60
	walk_animwaitcomplete
	goto GroundOrAirWaitState
endscript
DropToHangState_ExceptionTable = [
	{
		response = switch_script
		event = jump
		scr = AirState
		params = {
			blend = 0.25
		}
	}
	{
		response = switch_script
		event = ladder
		scr = LadderFromHangState
	}
	{
		response = switch_script
		event = climbpole
		scr = PoleFromHangState
	}
]

script DropToHangState 
	reseteventhandlersfromtable \{DropToHangState_ExceptionTable
		group = WalkingStateExceptions}
	SetWalkingTrickState \{NewWalkingTrickState = off}
	LaunchStateChangeEvent \{state = Skater_InHang}
	if NOT walk_ishangingfromwall
		anim = Sk8_W_Hang_StndToIdle_F
	else
		anim = Sk8_W_WallGrb_StndToIdle_F
	endif
	walk_scaleanimspeed \{off}
	PlayWalkAnim anim = <anim> blendperiod = 0.3 speed = ($walk_parameters.hang_anim_wait_speed)
	waitanimwalking
	walk_animwaitcomplete
	goto \{HangState
		params = {
			blend = 0.0
		}}
endscript
LadderOntoBottomState_ExceptionTable = [
	{
		response = switch_script
		event = jump
		scr = ClimbJumpState
	}
]

script LadderOntoBottomState 
	reseteventhandlersfromtable \{LadderOntoBottomState_ExceptionTable
		group = WalkingStateExceptions}
	SetWalkingTrickState \{NewWalkingTrickState = off}
	LaunchStateChangeEvent \{state = Skater_OnLadder}
	walk_scaleanimspeed \{off}
	PlayWalkAnim anim = sk8_w_ladstndidletoclimb_F blendperiod = 0.3 speed = ($walk_parameters.ladder_anim_wait_speed)
	waitanimwalking
	walk_animwaitcomplete
	goto \{LadderIdleState}
endscript
LadderOntoTopState_ExceptionTable = [
	{
		response = switch_script
		event = jump
		scr = ClimbJumpState
	}
]

script LadderOntoTopState 
	reseteventhandlersfromtable \{LadderOntoTopState_ExceptionTable
		group = WalkingStateExceptions}
	SetWalkingTrickState \{NewWalkingTrickState = off}
	LaunchStateChangeEvent \{state = Skater_OnLadder}
	walk_scaleanimspeed \{off}
	PlayWalkAnim anim = Sk8_W_LadClimbToStndIdle_F backwards blendperiod = 0.3 speed = ($walk_parameters.ladder_anim_wait_speed)
	waitanimwalking
	walk_animwaitcomplete
	goto \{LadderIdleState}
endscript
LadderFromHangState_ExceptionTable = [
	{
		response = switch_script
		event = jump
		scr = ClimbJumpState
	}
]

script LadderFromHangState 
	reseteventhandlersfromtable \{LadderOntoTopState_ExceptionTable
		group = WalkingStateExceptions}
	SetWalkingTrickState \{NewWalkingTrickState = off}
	LaunchStateChangeEvent \{state = Skater_OnLadder}
	walk_scaleanimspeed \{off}
	PlayWalkAnim \{anim = Sk8_W_Ladder_Land_F
		blendperiod = 0.5
		speed = 3.0}
	waitanimwalking
	walk_animwaitcomplete
	goto \{LadderIdleState}
endscript
LadderIdleState_ExceptionTable = [
	{
		response = switch_script
		event = jump
		scr = ClimbJumpState
	}
	{
		response = switch_script
		event = groundgone
		scr = AirState
	}
	{
		response = switch_script
		event = laddermoveup
		scr = LadderMoveUpState
	}
	{
		response = switch_script
		event = laddermovedown
		scr = LadderMoveDownState
	}
	{
		response = switch_script
		event = ladderslidedown
		scr = LadderSlideDownState
	}
	{
		response = switch_script
		event = hang
		scr = HangState
		params = {
			blend = 0.2
		}
	}
	{
		response = switch_script
		event = ladderofftop
		scr = LadderOffTopState
	}
	{
		response = switch_script
		event = ladderoffbottom
		scr = LadderOffBottomState
	}
]

script LadderIdleState 
	reseteventhandlersfromtable \{LadderIdleState_ExceptionTable
		group = WalkingStateExceptions}
	SetWalkingTrickState \{NewWalkingTrickState = off}
	seteventhandler \{event = jumprequested
		scr = JumpRequestedEvent
		group = WalkingEvents
		response = call_script}
	LaunchStateChangeEvent \{state = Skater_OnLadder}
	walk_scaleanimspeed \{off}
	PlayWalkAnim speed = 0 anim = Sk8_W_LadFastClimb_F blendperiod = 0.0 <...>
	waitanimwalking
	walk_endwallrunup
endscript
LadderLandState_ExceptionTable = [
	{
		response = switch_script
		event = jump
		scr = ClimbJumpState
	}
]

script LadderLandState 
	reseteventhandlersfromtable \{LadderLandState_ExceptionTable
		group = WalkingStateExceptions}
	seteventhandler \{event = jumprequested
		scr = JumpRequestedEvent
		group = WalkingEvents
		response = call_script}
	SetWalkingTrickState \{NewWalkingTrickState = off}
	LaunchStateChangeEvent \{state = Skater_OnLadder}
	walk_scaleanimspeed \{off}
	PlayWalkAnim \{anim = Sk8_W_Ladder_Land_F
		blendperiod = 0.2}
	Skater_WaitAnim \{timer = bodytimer
		percent = 10}
	walk_animwaitcomplete
	goto \{LadderIdleState}
endscript
LadderMoveUpState_ExceptionTable = [
	{
		response = switch_script
		event = laddermovedown
		scr = LadderMoveDownState
		params = {
			SyncToPreviousAnim
		}
	}
	{
		response = switch_script
		event = ladderslidedown
		scr = LadderSlideDownState
		params = {
			SyncToPreviousAnim
		}
	}
	{
		response = switch_script
		event = ladderoffbottom
		scr = LadderOffBottomState
	}
	{
		response = switch_script
		event = ladderofftop
		scr = LadderOffTopState
	}
	{
		response = switch_script
		event = ladder
		scr = LadderIdleState
		params = {
			SyncToPreviousAnim
		}
	}
	{
		response = switch_script
		event = jump
		scr = ClimbJumpState
	}
	{
		response = switch_script
		event = hang
		scr = HangState
		params = {
			blend = 0.2
		}
	}
]

script LadderMoveUpState 
	reseteventhandlersfromtable \{LadderMoveUpState_ExceptionTable
		group = WalkingStateExceptions}
	seteventhandler \{event = jumprequested
		scr = JumpRequestedEvent
		group = WalkingEvents
		response = call_script}
	SetWalkingTrickState \{NewWalkingTrickState = off}
	LaunchStateChangeEvent \{state = Skater_OnLadder}
	walk_scaleanimspeed \{off}
	PlayWalkAnim anim = Sk8_W_LadFastClimb_F cycle blendperiod = 0.3 speed = 0.96999997 <...>
	waitanimwalking
endscript
LadderMoveDownState_ExceptionTable = [
	{
		response = switch_script
		event = laddermoveup
		scr = LadderMoveUpState
		params = {
			SyncToPreviousAnim
		}
	}
	{
		response = switch_script
		event = ladderslidedown
		scr = LadderSlideDownState
		params = {
			SyncToPreviousAnim
		}
	}
	{
		response = switch_script
		event = ladderoffbottom
		scr = LadderOffBottomState
	}
	{
		response = switch_script
		event = ladderofftop
		scr = LadderOffTopState
	}
	{
		response = switch_script
		event = ladder
		scr = LadderIdleState
		params = {
			SyncToPreviousAnim
		}
	}
	{
		response = switch_script
		event = jump
		scr = ClimbJumpState
	}
	{
		response = switch_script
		event = hang
		scr = HangState
		params = {
			blend = 0.2
		}
	}
]

script LadderMoveDownState 
	reseteventhandlersfromtable \{LadderMoveDownState_ExceptionTable
		group = WalkingStateExceptions}
	seteventhandler \{event = jumprequested
		scr = JumpRequestedEvent
		group = WalkingEvents
		response = call_script}
	SetWalkingTrickState \{NewWalkingTrickState = off}
	LaunchStateChangeEvent \{state = Skater_OnLadder}
	walk_scaleanimspeed \{off}
	PlayWalkAnim anim = Sk8_W_LadFastClimb_F cycle backwards blendperiod = 0.3 speed = 0.96999997 <...>
	waitanimwalking
endscript
LadderSlideDownState_ExceptionTable = [
	{
		response = switch_script
		event = ladderoffbottom
		scr = LadderSlideOffBottomState
	}
	{
		response = switch_script
		event = jump
		scr = ClimbJumpState
	}
]

script LadderSlideDownState 
	reseteventhandlersfromtable LadderSlideDownState_ExceptionTable group = WalkingStateExceptions
	seteventhandler event = jumprequested scr = JumpRequestedEvent group = WalkingEvents response = call_script
	SetWalkingTrickState NewWalkingTrickState = off
	LaunchStateChangeEvent state = Skater_OnLadder
	walk_scaleanimspeed off
	PlayWalkAnim anim = LadderSlide_climb2slide blendperiod = 0.0 speed = 4.0
	waitanimwalking
	PlayWalkAnim anim = LadderSlide_loop blendperiod = 0.0 cycle
	begin
	if Skater_AnimComplete
		break
	endif
	if NOT held circle
		LadderSlideDownExitState
	endif
	wait 1 gameframe
	repeat
endscript

script LadderSlideDownExitState 
	reseteventhandlersfromtable \{LadderSlideDownState_ExceptionTable
		group = WalkingStateExceptions}
	PlayWalkAnim \{anim = LadderSlide_climb2slide
		backwards
		speed = 3.0}
	waitanimwalking
	if NOT gotparam \{down}
		LadderMoveUpState
	else
		LadderMoveDownState
	endif
endscript
LadderOffBottomState_ExceptionTable = [
	{
		response = switch_script
		event = jump
		scr = ClimbJumpState
	}
]

script LadderOffBottomState 
	reseteventhandlersfromtable \{LadderOffBottomState_ExceptionTable
		group = WalkingStateExceptions}
	SetWalkingTrickState \{NewWalkingTrickState = off}
	LaunchStateChangeEvent \{state = Skater_OnLadder}
	walk_scaleanimspeed \{off}
	PlayWalkAnim anim = sk8_w_ladstndidletoclimb_F backwards blendperiod = 0.3 speed = ($walk_parameters.ladder_anim_wait_speed)
	waitanimwalking
	walk_animwaitcomplete
	Skater_PlayWalkAnim \{blendperiod = 0.0}
	goto \{GroundOrAirWaitState}
endscript

script LadderSlideOffBottomState 
	reseteventhandlersfromtable \{LadderOffBottomState_ExceptionTable
		group = WalkingStateExceptions}
	SetWalkingTrickState \{NewWalkingTrickState = off}
	LaunchStateChangeEvent \{state = Skater_OnLadder}
	walk_scaleanimspeed \{off}
	PlayWalkAnim anim = LadderSlide_slide2stand blendperiod = 0.3 speed = ($walk_parameters.ladder_anim_wait_speed)
	waitanimwalking
	walk_animwaitcomplete
	rotate
	goto \{GroundOrAirWaitState}
endscript
LadderOffTopState_ExceptionTable = [
	{
		response = switch_script
		event = jump
		scr = ClimbJumpState
	}
]

script LadderOffTopState 
	reseteventhandlersfromtable \{LadderOffTopState_ExceptionTable
		group = WalkingStateExceptions}
	SetWalkingTrickState \{NewWalkingTrickState = off}
	LaunchStateChangeEvent \{state = Skater_OnLadder}
	walk_scaleanimspeed \{off}
	PlayWalkAnim anim = Sk8_W_LadClimbToStndIdle_F blendperiod = 0.3 speed = ($walk_parameters.ladder_anim_wait_speed)
	waitanimwalking
	walk_animwaitcomplete
	Skater_PlayWalkAnim
	goto \{GroundOrAirWaitState}
endscript
