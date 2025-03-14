TRICK_PRELOAD_TIME = 160
Jumptricks = [
	{
		trigger = {
			TapTwiceRelease
			up
			x
			550
		}
		trickslot = JumpSlot
	}
	{
		trigger = {
			TapTwiceRelease
			upleft
			x
			550
		}
		trickslot = JumpSlot
	}
	{
		trigger = {
			TapTwiceRelease
			upright
			x
			550
		}
		trickslot = JumpSlot
	}
	{
		trigger = {
			PressAndRelease
			up
			x
			300
		}
		scr = nocomply
		params = {
			name = "No Comply"
			score = 100
		}
	}
]
Trick_Boneless = {
	scr = boneless
	params = {
		name = "Boneless"
		anim = boneless
		score = 250
	}
}
Trick_Fastplant = {
	scr = boneless
	params = {
		name = "Fastplant"
		anim = Fastplant
		score = 250
	}
}
Trick_Beanplant = {
	scr = boneless
	params = {
		name = "Beanplant"
		anim = Beanplant
		score = 250
	}
}
GroundTricks = [
	{
		trigger = {
			TripleInOrder
			a = down
			b = down
			r1
			500
		}
		scr = Quick180
	}
	{
		trigger = {
			Press
			r2
			20
		}
		scr = ToggleSwitchRegular
	}
	{
		trigger = {
			Press
			twistimpulseright
			20
		}
		scr = ToggleSwitchRegular
	}
	{
		trigger = {
			Press
			twistimpulseleft
			20
		}
		scr = ToggleSwitchRegular
	}
	{
		$Enter_CAP_Trigger
		scr = Enter_CAP_mode
	}
	{
		trigger = {
			TimedPress
			l3
			200
		}
		scr = ToggleNollieRegular
	}
]
WalkToSkateTransition_GroundTricks = [
]
NoTricks = [
]
Trick_Revert = {
	scr = revert
	params = {
		FSName = "FS Revert"
		BSName = "BS Revert"
		score = 100
	}
}
Trick_Pivot = {
	scr = revert
	params = {
		FSName = "FS Pivot"
		BSName = "BS Pivot"
		score = 100
	}
}
Reverts_Flat = [
	{
		trigger = {
			Press
			r2
			600
		}
		$Trick_Pivot
	}
	{
		trigger = {
			Press
			twistimpulseright
			600
		}
		$Trick_Pivot
	}
	{
		trigger = {
			Press
			twistimpulseleft
			600
		}
		$Trick_Pivot
	}
]
Reverts_Vert = [
	{
		trigger = {
			Press
			r2
			600
		}
		$Trick_Revert
	}
	{
		trigger = {
			Press
			twistimpulseright
			600
		}
		$Trick_Revert
	}
	{
		trigger = {
			Press
			twistimpulseleft
			600
		}
		$Trick_Revert
	}
]

script SetExtraTricks_Reverts \{duration = 20}
	if NOT getglobalflag \{flag = $FLAG_EXPERT_MODE_NO_REVERTS}
		if NOT ((innetgame) && (getglobalflag flag = $flag_g_expert_mode_no_reverts))
			if NOT waslastlandingvert
				setextratricks tricks = Reverts_Flat duration = <duration>
			else
				setextratricks tricks = Reverts_Vert duration = <duration>
			endif
		endif
	endif
endscript

script revert 
	if inair
		goto Airborne params = {no_anim}
	endif
	onexitrun ExitRevert
	inrevert
	ClearLipCombos
	killextratricks
	OnGroundExceptions NoEndRun
	LaunchStateChangeEvent state = Skater_InRevert
	obj_spawnscriptlater CessTrail params = {repeat_times = 10}
	playcesssound
	vibrate actuator = 0 percent = 80 duration = 0.5
	vibrate actuator = 1 percent = 80 duration = 0.1
	cleareventhandler Ollied
	onexceptionrun
	overridecancelground off
	if NOT gotparam no_special_friction
		Revert_ScuffSpeed
	endif
	cankickoff
	cleartrickqueue
	setqueuetricks SkateToWalkTricks
	if NOT waslastlandingvert
		SetSkaterAirManualTricks NoNose
	else
		SetSkaterAirManualTricks
	endif
	nollieoff
	if obj_flagset $FLAG_SKATER_REVERTFS
		obj_clearflag $FLAG_SKATER_REVERTFS
		name = <FSName>
	else
		if obj_flagset $FLAG_SKATER_REVERTBS
			backside = 1
			obj_clearflag $FLAG_SKATER_REVERTBS
			name = <BSName>
		else
			if NOT lastspinwas frontside
				name = <FSName>
			else
				backside = 1
				name = <BSName>
			endif
		endif
	endif
	seteventhandler event = Ollied scr = RevertWaitAndOllie response = switch_script params = {name = <name> score = <score>}
	PlayRevertAnim backside = <backside>
	seteventhandler event = Ollied scr = RevertLateOllie response = switch_script
	Skater_WaitAnim percent = 45 timer = groundlandtimer
	settrickname <name>
	settrickscore <score>
	display blockspin
	setqueuetricks GroundTricks
	resetlandedfromvert
	seteventhandler event = playkickanim scr = playkickanim group = OngroundAnims response = call_script
	seteventhandler event = PlayBrakeAnim scr = PlayBrakeAnim group = OngroundAnims response = call_script
	begin
	donextmanualtrick FromAir FromRevert
	wait 0.1 seconds
	repeat 4
	cankickon
	donextmanualtrick FromAir FromRevert
	DoNextTrick
	OnGroundExceptions
	landskatertricks
	cleareventbuffer
	skater_waitanimfinished timer = groundlandtimer
	if NOT anim_animnodeexists id = braketimer
		if NOT anim_animnodeexists id = kicktimer
			playidleanim
		endif
	endif
	goto ongroundai params = {no_anim}
endscript

script RevertWaitAndOllie 
	Skater_WaitAnim \{percent = 20
		timer = groundlandtimer}
	flip
	settrickname <name>
	settrickscore <score>
	display \{blockspin}
	goto \{ollie}
endscript

script RevertLateOllie 
	wait \{1
		gameframe}
	goto \{ollie}
endscript

script ExitRevert 
	outrevert
	cankickon
	settrickname \{""}
	settrickscore \{0}
	display \{blockspin}
endscript

script ExitRevert_and_KillBlend 
	BlendperiodOut \{0}
	ExitRevert
endscript

script Revert_ScuffSpeed 
	setspecialfriction \{[
			0.0
			0.0
			0.05
			0.1
			0.2
			0.3
			0.4
		]
		duration = 0.66700006}
endscript

script ToggleSwitchRegular 
	if NOT gotparam stopped
		OnGroundExceptions
		cleareventhandler stopped
		blendduration = 0.3
	else
		Skater_WaitAnim timer = groundlandtimer percent = 15
		blendduration = 0.3
		stopped = 1
	endif
	setqueuetricks NoTricks
	ClearTrickQueues
	cleareventhandler Ollied
	onexceptionrun
	nollieoff
	obj_spawnscriptlater CessTrail params = {delay = 3}
	vibrate actuator = 0 percent = 80 duration = 0.5
	vibrate actuator = 1 percent = 80 duration = 0.1
	landskatertricks DontKillFocus
	if leftpressed
		if flipped
			backside = 1
		endif
	else
		if rightpressed
			if NOT flipped
				backside = 1
			endif
		endif
	endif
	if NOT ishidden
		playcesssound
	endif
	onexitrun CessNoBlend
	cankickoff
	PlayRevertAnim backside = <backside> Cess = 1 stopped = <stopped>
	if gotparam stopped
		Skater_WaitAnim percent = 45 timer = groundlandtimer
		cankickon
		onexitrun
		goto StoppedState
	endif
	if NOT GoalManager_GoalShouldExpire
		seteventhandler event = Ollied scr = ollie response = switch_script params = {NoDoNextTrick}
	endif
	setqueuetricks GroundTricks
	body_check_set_tricks
	Skater_WaitAnim percent = 45 timer = groundlandtimer
	onexitrun
	cankickon
	seteventhandler event = playkickanim scr = playkickanim group = OngroundAnims response = call_script
	seteventhandler event = PlayBrakeAnim scr = PlayBrakeAnim group = OngroundAnims response = call_script
	WaitAnimWhilstChecking AndManuals timer = groundlandtimer
	if anim_animnodeexists id = braketimer
		goto ongroundai params = {no_anim}
	elseif anim_animnodeexists id = kicktimer
		goto ongroundai params = {no_anim}
	else
		playidleanim
		body_check_set_tricks state = ground
		goto ongroundai
	endif
endscript

script CessNoBlend 
	cankickon
endscript

script PlayRevertAnim blendduration = 0.2
	if innollie
		nollieoff
	endif
	if gotparam stopped
		blendduration = 0.2
	endif
	onexitrun PlayRevertAnim_exit
	boardrotate
	Skater_PlayOnGroundAnim {sync = 0 revert Cess = <Cess> backside = <backside> mirror = 1 blendduration = <blendduration> percent = 20 dont_spawn no_idles = 1 no_events}
	flip
	onexitrun
	boardrotate
	Skater_PlayOnGroundAnim {sync = 1 revert Cess = <Cess> backside = <backside> blendduration = 0 no_idles = 1 no_events}
endscript

script PlayRevertAnim_exit 
	boardrotate
endscript

script Quick180 
	OnGroundExceptions
	setqueuetricks NoTricks
	ClearTrickQueues
	if NOT GoalManager_GoalShouldExpire
		seteventhandler event = Ollied scr = ollie response = switch_script params = {NoDoNextTrick}
	endif
	nollieoff
	obj_spawnscriptlater CessTrail params = {delay = 3}
	vibrate actuator = 0 percent = 80 duration = 0.5
	vibrate actuator = 1 percent = 80 duration = 0.1
	landskatertricks DontKillFocus
	NoRailTricks
	angle = 180
	if leftpressed
		if flipped
			backside = 1
		endif
	else
		if rightpressed
			angle = -180
			if NOT flipped
				backside = 1
			endif
		else
			if flipped
				angle = -180
			endif
		endif
	endif
	if gotparam backside
		skater_playanim anim = Sk8_Gnd_Oll_F_BSBert_F
	else
		skater_playanim anim = Sk8_Gnd_Oll_F_FSBert_F
	endif
	rotate y = <angle> duration = 0.3 seconds
	playcesssound
	WaitAnimWhilstChecking AndManuals
	goto ongroundai
endscript
carvetrickstruct = {
	tap
	l1
	300
}

script carve 
	LaunchStateChangeEvent state = Skater_InCarve
	carve_animation
	obj_spawnscriptlater Carve_Sound
	stopbalancetrick
	ClearTrickQueues
	SetSkaterGroundTricks
	onexitrun carve_score
	count = 0
	begin
	if NOT iscarving
		break
	endif
	if (<count> < 10)
		if held r1
			stopcarving
			MakeSkaterGoto CheckforSwitchMode
		endif
	elseif (<count> = 10)
		carve_score
		onexitrun
	elseif (<count> > 20)
		if skaterprofile_isabilityactive ability = bowl_combo
			donextmanualtrick
		endif
	endif
	DoNextTrick
	count = (<count> + 1)
	wait 1 gameframe
	repeat
	Skater_PlayOnGroundAnim {no_land}
	post_carve_or_slash_trick_checker carve = true
	goto ongroundai
endscript

script carve_score 
	GetNumberOfTrickOccurrences \{tricktext = 'Carve'}
	if (<number_of_occurrences> < 3)
		settrickname \{"Carve"}
		settrickscore \{1000}
		display \{blockspin}
	endif
endscript

script post_carve_or_slash_trick_checker frames = 15
	onexitrun blend_in_below_body_ik params = {blendduration = 0.05 strength = 0.0}
	seteventhandler event = groundgone scr = groundgone response = call_script
	if NOT gotparam carve
		no_anim = true
		frames = 60
		cleartrickqueue
		seteventhandler event = carve scr = carve response = call_script
	endif
	if skaterprofile_isabilityactive ability = bowl_combo
		begin
		wait 1 gameframe
		donextmanualtrick
		if NOT gotparam carve
			DoNextTrick
		endif
		repeat <frames>
	endif
	landskatertricks
	goto ongroundai params = {no_anim = <no_anim>}
endscript

script carve_animation 
	if innollie
		nollieoff
	endif
	Skater_PlayOnGroundAnim \{extradata = $Carve_Data
		no_events}
	cleareventhandlergroup \{OngroundAnims}
endscript

script UnLockVelocityDirection 
	lockvelocitydirection \{off}
	exitpowerslide
	SetRollingFriction \{`default`}
endscript

script CessTrail repeat_times = 20
	if speedgreaterthan 5
		if gotparam delay
			wait <delay> frames
		endif
		begin
		if NOT onground
			break
		else
			texturesplat size = 0.28 radius = 0 bone = bone_board_truck_back material = sys_skidmark_sys_skidmark trail lifetime = 15
			texturesplat size = 0.28 radius = 0 bone = BONE_BOARD_TRUCK_NOSE material = sys_skidmark_sys_skidmark trail lifetime = 15
		endif
		wait 1 game frame
		repeat <repeat_times>
	endif
endscript

script ToggleNollieRegular 
	if innollie
		goto OnGroundNollieAI params = {no_anim}
	endif
	OnGroundExceptions
	ClearTrickQueues
	ApplyStanceToggle Nollie = <Nollie>
	if NOT GoalManager_GoalShouldExpire
		seteventhandler event = Ollied scr = ollie response = switch_script
	endif
	Skater_PlayOnGroundAnim {
		data = $NollieOnGround_data
		extradata = $ollie_to_nollie_data
		no_idles = 1}
	begin
	if Skater_AnimComplete timer = groundlandtimer
		break
	endif
	DoNextTrick
	wait 1 gameframe
	repeat
	if innollie
		playidleanim
		goto OnGroundNollieAI params = {no_anim}
	endif
endscript

script ApplyStanceToggle 
	if innollie
		nollieoff
	else
		nollieon
	endif
	if onground
		if currentscorepotgreaterthan \{0}
			landskatertricks
		endif
	endif
endscript

script Nollie 
	OllieBalanceTrickCheeseCheck
	if NOT gotparam NoDoNextTrick
		DoNextTrick
	endif
	cleartrickqueue
	cleareventbuffer buttons = $dpad olderthan = $TRICK_PRELOAD_TIME
	jump
	InAirExceptions
	vibrate actuator = 1 percent = 50 duration = 0.05
	nollieon
	static_tree_ik_on
	settrickname "Nollie"
	settrickscore 200
	Skater_PlayOllieAnim $Nollie_data
	display blockspin noswitch
	settrickname ""
	settrickscore 0
	display spinonly
	bailoff
	goto Airborne params = {no_anim}
endscript

script NollieNoDisplay \{OutSpeed = 1}
	OllieBalanceTrickCheeseCheck
	stopbalancetrick
	cleartrickqueue
	cleareventbuffer \{buttons = $dpad
		olderthan = $TRICK_PRELOAD_TIME}
	settrickname \{""}
	settrickscore \{0}
	display \{spinonly}
	jump
	InAirExceptions
	vibrate \{actuator = 1
		percent = 80
		duration = 0.05}
	nollieon
	static_tree_ik_on
	Skater_PlayOllieAnim \{$Nollie_data}
	bailoff
	goto \{Airborne
		params = {
			no_anim
		}}
endscript
dpad = [
	up
	down
	left
	right
	upright
	upleft
	downright
	downleft
]

script ollie OutSpeed = 1 blendout = 0.3
	cleartricksfrom GrindBodyCheckTricks
	if doingbalancetrick
		if NOT innollie
			use_manual_ollie = 1
		endif
	endif
	OllieBalanceTrickCheeseCheck
	if onrail
		RailBlendDuration = 0.125
	endif
	stopbalancetrick
	stopskitch
	TurnSparksOff
	if NOT gotparam NoDoNextTrick
		DoNextTrick
	endif
	cleartrickqueue
	setqueuetricks NoTricks
	cleareventbuffer buttons = $dpad olderthan = $TRICK_PRELOAD_TIME
	cleareventbuffer buttons = [x] olderthan = 0
	if innollie
		settrickname "Nollie"
		settrickscore 200
		display blockspin noswitch
	else
	endif
	settrickname ""
	settrickscore 0
	display spinonly
	aggro_ollie_check
	static_tree_ik_on
	vibrate actuator = 1 percent = 50 duration = 0.05
	if gotparam FromLip
		printf "came from lip=================="
		skater_playanim anim = <OutAnim> blendperiod = 0.0
		BlendperiodOut 0
	else
		if gotparam OutAnim
			if gotparam SyncOutAnimToPreviousAnim
				skater_playanim anim = <OutAnim> blendperiod = <blendout> speed = <OutSpeed> SyncToPreviousAnim
			else
				if gotparam NoBlend
					skater_playanim anim = <OutAnim> blendperiod = 0.0 speed = <OutSpeed>
				else
					skater_playanim anim = <OutAnim> blendperiod = <blendout> speed = <OutSpeed>
				endif
			endif
		else
			if inair
				if invertair
					vert = 1
				endif
			elseif onground
				if lastpolywasvert
					vert = 1
				endif
			endif
			if gotparam vert
				Skater_PlayOllieAnim $Vert_data blendduration = <RailBlendDuration>
			else
				if innollie
					Skater_PlayOllieAnim $Nollie_data blendduration = <RailBlendDuration>
				else
					if gotparam use_manual_ollie
						Skater_PlayOllieAnim $ManualOllie_data blendduration = <RailBlendDuration>
					else
						Skater_PlayOllieAnim $Ollie_data blendduration = <RailBlendDuration>
					endif
				endif
			endif
		endif
	endif
	if NOT gotparam jumpspeed
		jump
	else
		jump speed = <jumpspeed>
	endif
	InAirExceptions
	if gotparam boardrotate
		BlendperiodOut 0
		boardrotateafter
	endif
	if gotparam rotateafter
		rotateafter
	endif
	if gotparam flipafter
		printf "=========flipping the skater in Ollie"
		flipafter
	endif
	if gotparam NoBlend
		BlendperiodOut 0
	endif
	if gotparam boost
		exitstallboost
	endif
	if gotparam WaitOnOlliePercent
		bailon
	endif
	animsave_timestamp event = {type = ollie}
	bailoff
	goto Airborne params = {no_anim}
endscript

script aggro_ollie_check 
	if anim_animnodeexists \{id = kicktimer}
		if anim_command \{target = kicktimer
				command = kicktimer_iskicking}
			if incontrolledkick
				GetSkaterVelocity
				anim_command \{target = kicktimer
					command = kicktimer_getnumconsecutivekicks}
				if (<num_consecutive_kicks> > 3.0)
					num_consecutive_kicks = 3.0
				endif
				mult = (1.0 + ($aggro_kick_ollie_forward_vel_boost * (<num_consecutive_kicks> / 3.0)))
				SetSkaterVelocity vel_x = (<vel_x> * <mult>) vel_y = <vel_y> vel_z = (<vel_z> * <mult>)
			endif
		endif
	endif
endscript

script nocomply 
	cleartrickqueue
	cleareventbuffer buttons = $dpad olderthan = $TRICK_PRELOAD_TIME
	jump nocomply bonelessheight
	nollieoff
	InAirExceptions
	vibrate actuator = 1 percent = 80 duration = 0.05
	settrickname <name>
	settrickscore <score>
	display blockspin
	settrickname ""
	settrickscore 0
	display spinonly
	bailoff
	aggro_ollie_check
	static_tree_ik_on
	Skater_PlayOllieAnim $NoComply_data
	WaitAnimWhilstChecking
	goto Airborne params = {no_anim}
endscript

script boneless anim = boneless name = "Boneless" score = 250
	cleartrickqueue
	cleareventbuffer buttons = $dpad olderthan = $TRICK_PRELOAD_TIME
	jump bonelessheight
	nollieoff
	InAirExceptions
	vibrate actuator = 1 percent = 80 duration = 0.1
	spawnterrainsound action = boneless
	settrickname <name>
	settrickscore <score>
	aggro_ollie_check
	static_tree_ik_on
	Skater_PlayOllieAnim $Boneless_data
	display blockspin
	settrickname ""
	settrickscore 0
	display spinonly
	bailoff
	WaitAnimWhilstChecking
	goto Airborne params = {no_anim}
endscript

script GroundPlant anim = boneless name = "Foot Plant" score = 250
	cleartrickqueue
	jump bonelessheight
	nollieoff
	InAirExceptions
	vibrate actuator = 1 percent = 80 duration = 0.1
	spawnterrainsound action = boneless
	settrickname <name>
	settrickscore <score>
	launchevent broadcast type = SkaterEnterFootplant
	static_tree_ik_on
	Skater_PlayOllieAnim $Footplant_data
	display blockspin
	settrickname ""
	settrickscore 0
	display spinonly
	skatercorephysics_notifygroundplant
	Revert_ScuffSpeed
	bailoff
	WaitAnimWhilstChecking
	goto Airborne params = {no_anim}
endscript

script CanGroundPlant 
	skatercorephysics_gettimesincelastgroundplant
	if (<time_since_last_ground_plant> > 1000)
		return \{true}
	else
		return \{false}
	endif
endscript

script mikevboneless_exit 
	flip
endscript

script sendtauntmessage 
	GetPreferenceString pref_type = taunt <string_id>
	SendChatMessage string = <ui_string>
endscript

script taunt 
	landskatertricks
	cleareventhandler \{Ollied}
	onexceptionrun
	skater_playanim anim = <anim> blendperiod = 0.3
	GetPreferenceString pref_type = taunt <string_id>
	if innetgame
		SendChatMessage string = <ui_string>
	endif
	wait \{10
		game
		frame}
	OnGroundExceptions
	if speedlessthan \{0.025}
		SetRollingFriction \{2.5}
		WaitAnimWhilstChecking \{AndManuals}
		goto \{StoppedState}
	else
		WaitAnimWhilstChecking \{AndManuals}
		goto \{ongroundai}
	endif
endscript

script props 
	goto \{ongroundai}
endscript
SkitchExceptionTable = [
	{
		response = call_script
		event = madeotherskaterbail
		scr = MadeOtherSkaterBail_Called
	}
	{
		response = switch_script
		event = offmetertop
		scr = SkitchOut
	}
	{
		response = switch_script
		event = offmeterbottom
		scr = SkitchOut
	}
	{
		response = switch_script
		event = CarBail
		scr = CarBail
	}
	{
		response = switch_script
		event = skatercollidebail
		scr = skatercollidebail
	}
]

script skitch 
	stopbalancetrick
	resetlandedfromvert
	killextratricks
	if cancelrotatedisplayandupdatematrix
		change flip_backwards_dont_blend = 1
	endif
	onexceptionrun
	reseteventhandlersfromtable SkitchExceptionTable
	seteventhandler event = Ollied scr = ollie response = switch_script params = {<...>}
	LaunchStateChangeEvent state = Skater_Skitching
	cleartrickqueue
	setqueuetricks NoTricks
	clearmanualtrick
	setmanualtricks NoTricks
	startskitch
	startbalancetrick
	skater_playanim anim = SkitchInit
	skater_waitanimfinished
	change flip_backwards_dont_blend = 0
	soundevent event = skitch_start_sound_sfx
	settrickname "\\c2Skitchin\\C0"
	settrickscore 500
	display blockspin
	dobalancetrick buttona = right buttonb = left type = skitch tweak = 5
	skater_playanim anim = SkitchRange wobble
	seteventhandler event = skitchleft scr = SkitchAnimLeft response = call_script
	seteventhandler event = skitchright scr = SkitchAnimRight response = call_script
	begin
	overridelimits max = 45 friction = 0 time = 5 gravity = 0
	if Skater_AnimComplete
		skater_playanim anim = SkitchRange wobble norestart
	endif
	if held down
		obj_spawnscriptlater NoBrake_Timer
		goto SkitchOut
	endif
	waitonegameframe
	repeat
endscript

script SkitchAnimLeft 
	skater_playanim \{anim = SkitchMoveLeft
		from = 20
		norestart
		speed = 2
		blendperiod = 0.1}
endscript

script SkitchAnimRight 
	skater_playanim \{anim = SkitchMoveRight
		from = 20
		norestart
		speed = 2
		blendperiod = 0.1}
endscript

script SkitchOut 
	stopskitch
	stopbalancetrick
	skater_playanim \{anim = SkitchInit
		backwards}
	OnGroundExceptions
	cleareventhandler \{skitched}
	onexceptionrun
	landskatertricks
	skater_waitanimfinished
	goto \{ongroundai}
endscript

script NoBrake_Timer 
	canbrakeoff
	wait \{0.5
		seconds}
	canbrakeon
endscript

script OllieBalanceTrickCheeseCheck 
	if NOT doingbalancetrick
		if NOT onrail
			if NOT InManual
				return
			endif
		endif
	endif
	getstateduration
	if (<state_duration> < 0.3)
		printf \{"you cheesed it"}
		AdjustBalance \{TimeAdd = 2.0
			speedmult = 2.0
			leanmult = 1.5}
	endif
endscript
