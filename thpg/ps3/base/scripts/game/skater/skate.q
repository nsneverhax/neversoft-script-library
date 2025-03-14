EXPERT_MODE_NO_REVERTS = 0
EXPERT_MODE_NO_WALKING = 0
EXPERT_MODE_NO_MANUALS = 0
score_landing_clean = 1000
score_landing_sloppy = -500
perfect_landing_slop = 8
defaulttrickdurationqueued = 2000

script SkaterInit 
	cleareventhandlergroup all_groups
	onexceptionrun
	if NOT gotparam no_board
		SwitchOnBoard
	else
		SwitchOffBoard
	endif
	ntt_fail_safe_cleanup
	GetCurrentSkaterHeapId
	formattext checksumname = heap_name 'SkaterHeap%i' i = <heapid>
	mempushcontext <heap_name>
	if NOT gotparam no_lurch
		init_skater_anim_tree
	endif
	mempopcontext
	obj_stopstream
	unpause
	spawnterrainsound action = stopsounds
	if NOT gotparam no_board
		if NOT inair
			spawnterrainsound action = roll
		endif
	endif
	unhide
	unpausephysics
	notinbail
	bailoff
	ragdollbaildeactivate
	physicsbaildone
	bashoff
	nollieoff
	NotifyBailDone
	ClearLipCombos
	AllowRailTricks
	obj_killspawnedscript name = SetUpLipCombo
	ClearTrickQueues
	obj_killspawnedscript name = GetBonus_exit
	walk_resetpeakheight
	walk_exitindoors
	walk_endgroundtrick
	cancelrotatedisplayandupdatematrix
	ntt_reset_for_skater_init
	animinfo_resetcachedactivevalues
	if ($skater_cheat_all_abilities = 1)
		AbilityFlags_GiveAllAbilities
		careerfunc func = setallriggerpiecesavailability
		careerfunc func = setallcribpiecesavailability
	endif
	resetlandedfromvert
	BlendperiodOut 0
	ragdoll_rebuildragdoll
	ragdoll_markforreset
	ragdoll_setboneanimlimits state = $Skater_Ragdoll_BoneAnimLimits
	ragdoll_setboneragdolldrivestate state = $ragdolldriveparams_perbonestate
	ragdoll_setgravity acceleration = -10.0
	baillerptoground 0
	cas_update_ragdoll_bones
	ragdoll_anim_set_state inactive
	clearbailrecovery
	skeleton_setcustomboneunactivelist $custonunactivebonelist_skaterstandard
	settags AcidDropCheese = 0 in_manual_land = 0
	unsetforcewalk
	resetisflipping
	InitializeStateChangeEvent
	if NOT gotparam NoEndRun
		seteventhandler event = runhasended scr = endofrun response = switch_script
		seteventhandler event = goalhasended scr = goal_endofrun response = switch_script
	endif
	stopbalancetrick
	if Skitching
		stopskitch
		setstate ground
	endif
	seteventhandler event = KillingSkater scr = KillingSkater group = KillingSkaterGroup response = call_script
	seteventhandler event = DumpSkaterEventHandlerTable scr = DumpSkaterEventHandlerTable group = DebugSkaterGroup response = call_script
	VibrateOff
	ClearSkaterFlags
	cancelrotatedisplay
	obj_killspawnedscript name = BloodSmall
	obj_killspawnedscript name = BloodSplat
	obj_killspawnedscript name = SkaterBloodOn
	obj_killspawnedscript name = Setup_Skater_Wind
	obj_spawnscript Setup_Skater_Wind
	RunTimerController_Reset
	ResetSkaterParticleSystems
	lockvelocitydirection off
	canbrakeon
	restoreautokick
	overridelimits end
	setslomo 1
	kill_blur
	killextratricks
	RetinaBurnOff
	clearskatercamoverride
	landskatertricks
	set_skater_anim_handlers
	set_skater_particle_handlers
	removeparameter skater_num
	if (<heapid> = 0)
		score_multiplier_container_id = score_multiplier_container
		trick_text_container_id = trick_text_container
		the_trick_text_id = the_trick_text
		the_score_pot_text_id = the_score_pot_text
		the_score_id = the_score
	else
		score_multiplier_container_id = (score_multiplier_container + 1)
		trick_text_container_id = (trick_text_container + 1)
		the_trick_text_id = (the_trick_text + 1)
		the_score_pot_text_id = (the_score_pot_text + 1)
		the_score_id = (the_score + 1)
		skater_num = <heapid>
	endif
	spawnscriptnow reset_trick_string params = {
		instant
		score_multiplier_container_id = <score_multiplier_container_id>
		trick_text_container_id = <trick_text_container_id>
		the_trick_text_id = <the_trick_text_id>
		the_score_pot_text_id = <the_score_pot_text_id>
		the_score_id = <the_score_id>
		skater_num = <skater_num>
	}
	enableinputevents
	if gotparam ReturnControl
		return
	endif
	anim_command command = degenerateblend_setnextblendduration params = {0.0}
	anim_command command = degenerateblend_setcurrentframeblendduration params = {0.0}
	GetCurrentSkaterProfileIndex
	GetSingleSkaterProfileInfo player = <currentskaterprofileindex> name
	if (<name> = custom_story)
		if NOT infrontend
			Face_PlayLoopingIdleAnims
		else
			Face_KillLoopingIdleAnims
			Face_ClearAnim
		endif
	else
		Face_KillLoopingIdleAnims
		Face_ClearAnim
	endif
	if IsBoardMissing
		<walk> = 1
	endif
	if NOT gotparam cleanup
		if NOT gotparam walk
			goto switch_ongroundai params = {newscript = ongroundai restart}
		else
			walk_setstate ground
			goto switch_ongroundai params = {newscript = Walking_onGroundAi restart}
		endif
	endif
endscript

script clientskaterinit 
	switchoffatomic \{special_item}
	GetCurrentSkaterHeapId
	formattext checksumname = heap_name 'SkaterHeap%i' i = <heapid>
	obj_getid
	mempushcontext <heap_name>
	init_nonlocal_skater_anim_tree
	mempopcontext
	ragdoll_setnetaccessorybones \{accessory_bones = $skater_accessory_bones}
endscript

script DumpSkaterEventHandlerTable 
	PrintEventHandlerTable
endscript

script KillingSkater 
	cleareventhandlergroup \{`default`}
	onexceptionrun
	cleareventhandlergroup \{group = RunTimerEvents}
	cleareventhandlergroup \{group = WalkingEndRunEvents}
	onexceptionrun
endscript
OnGroundExceptionTable = [
	{
		response = switch_script
		event = groundgone
		scr = groundgone
	}
	{
		response = switch_script
		event = Ollied
		scr = ollie
	}
	{
		response = switch_script
		event = FlailHitWall
		scr = FlailHitWall
	}
	{
		response = switch_script
		event = FlailLeft
		scr = FlailLeft
	}
	{
		response = switch_script
		event = FlailRight
		scr = FlailRight
	}
	{
		response = switch_script
		event = Carplant
		scr = Carplant
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
	{
		response = switch_script
		event = skitched
		scr = skitch
	}
	{
		response = switch_script
		event = madeotherskaterbail
		scr = madeotherskaterbail
	}
	{
		response = switch_script
		event = Wallpush
		scr = Ground_Wallpush
	}
	{
		response = switch_script
		event = stopped
		scr = StoppedState
	}
]

script HandleEndRunCases 
	seteventhandler \{event = runhasended
		scr = endofrun
		response = switch_script}
	seteventhandler \{event = goalhasended
		scr = goal_endofrun
		response = switch_script}
	if GoalManager_GoalShouldExpire
		cleareventhandler \{Ollied}
		cleareventhandler \{groundgone}
		cleareventhandler \{Wallpush}
		onexceptionrun
		cleartricksfrom \{Jumptricks}
	endif
endscript

script OnGroundExceptions 
	onexceptionrun
	reseteventhandlersfromtable OnGroundExceptionTable
	enableinputevents
	if NOT gotparam NoEndRun
		HandleEndRunCases
	endif
	SwitchOnBoard
	SetSkaterGroundTricks
	seteventhandler event = carve scr = carve response = call_script
	LaunchStateChangeEvent state = Skater_OnGround
	VibrateOff
	enableplayerinput
	bailoff
	bashoff
	SetRollingFriction `default`
	canspin
	AllowRailTricks
	obj_clearflag $FLAG_SKATER_MANUALCHEESE
	BloodParticlesOff
	if NOT gotparam NoEndRun
		resetlandedfromvert
	endif
endscript

script SetSkaterGroundTricks 
	detect_dodgy_ragdoll_state
	if gotparam NoSkateToWalkTricks
		setqueuetricks Jumptricks GroundTricks
	else
		if innetgame
			if NOT getglobalflag flag = $flag_g_expert_mode_no_walking
				if NOT getglobalflag flag = $FLAG_EXPERT_MODE_NO_WALKING
					setqueuetricks Jumptricks SkateToWalkTricks GroundTricks
				else
					setqueuetricks Jumptricks GroundTricks
				endif
			else
				setqueuetricks Jumptricks GroundTricks
			endif
		else
			if NOT getglobalflag flag = $FLAG_EXPERT_MODE_NO_WALKING
				setqueuetricks Jumptricks SkateToWalkTricks GroundTricks
			else
				setqueuetricks Jumptricks GroundTricks
			endif
		endif
	endif
	setextragrindtricks special = SpecialGrindTricks grindtricks
	if NOT ispumpactive
		if NOT getglobalflag flag = $FLAG_EXPERT_MODE_NO_MANUALS
			if NOT ((innetgame) && (getglobalflag flag = $flag_g_expert_mode_no_manuals))
				setmanualtricks special = SpecialManualTricks GroundManualTricks
			endif
		endif
	endif
	body_check_set_tricks state = ground
endscript
InAirExceptionTable = [
	{
		response = switch_script
		event = landed
		scr = land
	}
	{
		response = switch_script
		event = wallrideleft
		scr = wallride
		params = {
			left
		}
	}
	{
		response = switch_script
		event = wallrideright
		scr = wallride
		params = {
			right
		}
	}
	{
		response = switch_script
		event = Wallplant
		scr = Air_WallPlant
	}
	{
		response = switch_script
		event = vert_wallplant
		scr = vert_wallplant
	}
	{
		response = switch_script
		event = pointrail
		scr = pointrail
	}
	{
		response = switch_script
		event = pointrailspin
		scr = pointrailspin
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
	{
		response = call_script
		event = Carplant
		scr = Carplant
	}
	{
		response = call_script
		event = madeotherskaterbail
		scr = MadeOtherSkaterBailAir
	}
	{
		response = call_script
		event = airtotail
		scr = Air_To_Tail
	}
	{
		response = switch_script
		event = NailTheTrick
		scr = nail_the_trick
	}
	{
		response = call_script
		event = SpineTransfer
		scr = skaterawardtransfer
	}
	{
		response = call_script
		event = hiptransfer
		scr = skaterawardhiptransfer
	}
	{
		response = call_script
		event = banktransfer
		scr = skaterawardtransfertobank
	}
]

script InAirExceptions 
	onexceptionrun
	reseteventhandlersfromtable \{InAirExceptionTable}
	SetSkaterAirTricks NoSkateToWalkTricks = <NoSkateToWalkTricks> <...>
	LaunchStateChangeEvent \{state = Skater_InAir}
	if NOT gotparam \{AllowVibration}
		VibrateOff
	endif
	enableplayerinput
	bailoff
	bashoff
	SetRollingFriction \{`default`}
	setstate \{air}
	canspin
	overridecancelground \{off}
endscript

script SetSkaterAirManualTricks 
	if NOT getglobalflag \{flag = $FLAG_EXPERT_MODE_NO_MANUALS}
		if NOT ((innetgame) && (getglobalflag flag = $flag_g_expert_mode_no_manuals))
			if NOT ispumpactive
				if gotparam \{NoNose}
					setmanualtricks \{GroundRevertManualTricks}
				else
					setmanualtricks \{special = SpecialManualTricks
						manualtricks}
				endif
			endif
		endif
	endif
endscript

script SetSkaterAirTricks 
	detect_dodgy_ragdoll_state
	if insplitscreengame
		if gamemodeequals is_horse
			nail_tricks = NttTricks
		endif
	else
		nail_tricks = NttTricks
	endif
	if gotparam AllowWallplantOllie
		wallplant_tricks = WallplantOllie
	endif
	if NOT gotparam NoSkateToWalkTricks
		if NOT ((getglobalflag flag = $FLAG_EXPERT_MODE_NO_WALKING) || ((innetgame) && (getglobalflag flag = $flag_g_expert_mode_no_walking)))
			skate_to_walk_tricks = SkateToWalkTricks
		endif
	endif
	setqueuetricks special = SpecialTricks airtricks <nail_tricks> <skate_to_walk_tricks> <wallplant_tricks>
	setextragrindtricks special = SpecialGrindTricks grindtricks
	SetSkaterAirManualTricks
	body_check_set_tricks state = air
endscript

script ClearTrickQueues 
	cleartrickqueue
	clearmanualtrick
	clearextragrindtrick
endscript

script ongroundai Coasting = 0 Pushes = 0 PressureTimer = 0
	if NOT onground
		setstate ground
		spawnterrainsound action = roll
	endif
	if NOT gotparam stopped_exit
		getspeed
		if (<speed> = 0)
			goto StoppedState
		endif
	endif
	OnGroundExceptions
	nollieoff
	if NOT gotparam no_anim
		Skater_PlayOnGroundAnim sync = 1 blendduration = <blend> no_land = 1
	endif
	if gotparam stopped_exit
		cleareventhandler stopped
		if gotparam start_kick
			HandleKickBoostEvent kick_time_offset = 0.5
		endif
		if speedlessthan 2.0
			setspeed 2.0
		endif
		Skater_WaitAnim percent = 40 timer = groundlandtimer
		SetRollingFriction `default`
		OnGroundExceptions
		if held up
			kicknboost = 1
		elseif held x
			kicknboost = 1
		endif
		if gotparam kicknboost
			playkickanim
			if speedlessthan 4.0
				setspeed 4.0
			endif
		endif
		seteventhandler event = playkickanim scr = playkickanim group = OngroundAnims response = call_script
		seteventhandler event = PlayBrakeAnim scr = PlayBrakeAnim group = OngroundAnims response = call_script
	endif
	begin
	DoNextTrick
	donextmanualtrick
	waitonegameframe
	if innetgame
		CheckforNetBrake
	endif
	repeat
endscript

script CheckforNetBrake 
	if innetgame
		getpreferencechecksum pref_type = network auto_brake
		if (<checksum> = boolean_true)
			if screenelementexists id = current_menu_anchor
				goto NetBrake
			endif
			if screenelementexists id = dialog_box_anchor
				goto NetBrake
			endif
			if screenelementexists id = quit_dialog_anchor
				goto NetBrake
			endif
			if screenelementexists id = controller_unplugged_dialog_anchor
				goto NetBrake
			endif
			if istrue $paused_for_hardware
				goto NetBrake
			endif
		endif
	endif
endscript

script NetBrake 
	SetRollingFriction 0.5
	onexceptionrun NetBrake_out
	begin
	if speedlessthan 0.125
		StoppedState
	endif
	if objectexists id = current_menu_anchor
		waitonegameframe
	else
		if objectexists id = dialog_box_anchor
			waitonegameframe
		else
			if objectexists id = controller_unplugged_dialog_anchor
				waitonegameframe
			else
				if istrue $paused_for_hardware
					waitonegameframe
				else
					break
				endif
			endif
		endif
	endif
	repeat
	SetRollingFriction `default`
	if speedlessthan 0.125
		goto StoppedState
	else
		if innollie
			goto OnGroundNollieAI
		else
			goto ongroundai
		endif
	endif
endscript

script NetBrake_out 
	SetRollingFriction \{`default`}
endscript
StoppedStateExceptionTable = [
	{
		response = call_script
		event = Ollied
		scr = StoppedStateMaybeOllie
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
	{
		response = switch_script
		event = madeotherskaterbail
		scr = madeotherskaterbail
	}
	{
		response = switch_script
		event = runhasended
		scr = endofrun
	}
	{
		response = switch_script
		event = goalhasended
		scr = goal_endofrun
	}
]
StoppedTricks = [
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
		params = {
			stopped
		}
	}
]
StoppedSwitchTrick = [
	{
		$SwitchControl_Trigger
		scr = StoppedStateExitKillVelocity
	}
	{
		$Enter_CAP_Trigger
		scr = Enter_CAP_mode
	}
]

script StoppedState dont_interrupt_current_animation = false
	if gamemodeequals is_mocap
		return
	endif
	SetRollingFriction 2.5
	cleareventhandlergroup `default`
	onexceptionrun
	cleareventbuffer
	landskatertricks
	onexitrun StoppedStateExit
	settags allow_stopped_ollie = false
	reseteventhandlersfromtable StoppedStateExceptionTable
	cleartricksfrom GroundTricks
	if ((getglobalflag flag = $FLAG_EXPERT_MODE_NO_WALKING) || ((innetgame) && (getglobalflag flag = $flag_g_expert_mode_no_walking)))
		setqueuetricks StoppedTricks
	else
		setqueuetricks StoppedTricks StoppedSwitchTrick
	endif
	body_check_set_tricks
	if NOT ispumpactive
		setmanualtricks special = SpecialManualTricks GroundManualTricks
	endif
	nollieoff
	if NOT gotparam blendduration
		blendduration = ($Stopped_data.blendduration)
	endif
	if (<dont_interrupt_current_animation> = false)
		Skater_PlayStoppedAnim no_init = <no_init> blendduration = <blendduration>
		playing_stopped_anims = true
	else
		playing_stopped_anims = false
	endif
	wait <blendduration> seconds
	if gotparam from_bail
		SwitchOnBoard
	endif
	begin
	wait 1 gameframe
	if (<playing_stopped_anims> = false)
		if anim_animnodeexists id = bodytimer
			if anim_command target = bodytimer command = timer_isanimcomplete
				Skater_PlayStoppedAnim no_init = 1 blendduration = 0.3
				playing_stopped_anims = true
			endif
		endif
	endif
	DoNextTrick
	onexitrun
	donextmanualtrick
	onexitrun StoppedStateExit
	if held up
		break
	endif
	if input_tilt_steering_uppressed
		break
	endif
	if isps3
		if NOT input_tilt_steering_downpressed
			if NOT held down
				if held x
					break
				endif
			endif
		endif
	else
		if NOT held down
			if NOT held downright
				if NOT held downleft
					if held x
						break
					endif
					if held r1
						start_kick = 1
						break
					endif
				endif
			endif
		endif
	endif
	repeat
	MakeSkaterGoto ongroundai params = {no_anim stopped_exit start_kick = <start_kick>}
endscript

script StoppedStateExit 
	if IsObjectDestructing
		return
	endif
	SwitchOnBoard
	spawnterrainsound \{action = stopsounds}
	spawnterrainsound \{action = roll}
	Skater_PlayOnGroundAnim \{stopped_out
		no_events}
endscript

script StoppedStateMaybeOllie 
	if getsingletag \{allow_stopped_ollie}
		if (<allow_stopped_ollie> = false)
			settags \{allow_stopped_ollie = true}
			return
		endif
	endif
	goto \{ollie}
endscript

script StoppedStateExitKillVelocity 
	setspeed \{0.0}
	spawnterrainsound \{action = stopsounds}
	CheckforSwitchMode
endscript

script BrakeDone 
	SetRollingFriction \{`default`}
endscript

script OnGroundNollieAI 
	setstate \{ground}
	OnGroundExceptions
	nollieon
	if NOT GoalManager_GoalShouldExpire
		seteventhandler \{event = Ollied
			scr = Nollie
			response = switch_script}
	endif
	if NOT gotparam \{no_anim}
		Skater_PlayOnGroundAnim \{sync = 1
			data = $NollieOnGround_data}
	endif
	begin
	DoNextTrick
	donextmanualtrick
	CheckforNetBrake
	waitonegameframe
	repeat
endscript

script FlailExceptions 
	seteventhandler event = CarBail scr = CarBail response = switch_script
	seteventhandler event = skatercollidebail scr = skatercollidebail response = switch_script
	seteventhandler event = runhasended scr = endofrun response = switch_script
	seteventhandler event = goalhasended scr = goal_endofrun response = switch_script
	if GoalManager_GoalShouldExpire
		cleareventhandler Ollied
		cleareventhandler groundgone
		cleartricksfrom Jumptricks
	endif
	cleareventhandler Wallpush
	onexceptionrun
	cleartrickqueue
	clearmanualtrick
	cleareventbuffer
	landskatertricks
endscript

script FlailHitWall 
	Baildone
	goto \{FlailLeft}
endscript

script handle_flail_nollie 
	if innollie
		nollieoff
		Skater_PlayOnGroundAnim \{sync = 0
			no_land = 1
			blendduration = 0.05}
	endif
endscript

script FlailLeft 
	handle_flail_nollie
	stopbalancetrick
	FlailExceptions
	FlailVibrate
	nollieoff
	stopcarving
	cleareventhandler FlailLeft
	cleareventhandler FlailRight
	cleareventhandler FlailHitWall
	if cancelrotatedisplayandupdatematrix
		change flip_backwards_dont_blend = 1
	endif
	if anim_animnodeexists id = kicktimer
		if anim_command target = kicktimer command = kicktimer_iskicking
			dont_flail = 1
		endif
	endif
	if NOT gotparam dont_flail
		Skater_PlayExtraOnGroundBranch data = $flailleft_data
	endif
	change flip_backwards_dont_blend = 0
	goto ongroundai
endscript

script FlailRight 
	handle_flail_nollie
	stopbalancetrick
	FlailExceptions
	FlailVibrate
	nollieoff
	stopcarving
	cleareventhandler FlailLeft
	cleareventhandler FlailRight
	cleareventhandler FlailHitWall
	if cancelrotatedisplayandupdatematrix
		change flip_backwards_dont_blend = 1
	endif
	if anim_animnodeexists id = kicktimer
		if anim_command target = kicktimer command = kicktimer_iskicking
			dont_flail = 1
		endif
	endif
	if NOT gotparam dont_flail
		Skater_PlayExtraOnGroundBranch data = $flailright_data
	endif
	change flip_backwards_dont_blend = 0
	goto ongroundai
endscript

script FlailVibrate 
	if speedgreaterthan \{15}
		vibrate \{actuator = 1
			percent = 80
			duration = 0.25}
	else
		vibrate \{actuator = 1
			percent = 50
			duration = 0.15}
	endif
endscript

script BailGroundGone 
	Baildone
	groundgone
endscript

script groundgone 
	if ($is_changing_levels = 0)
		nollieoff
		InAirExceptions
		stopbalancetrick
		seteventhandler event = Ollied scr = ollie response = switch_script
		cleartricksfrom GroundTricks
		if gotparam NoBoneless
			SetSkaterAirTricks
		else
			if ((getglobalflag flag = $FLAG_EXPERT_MODE_NO_WALKING) || ((innetgame) && (getglobalflag flag = $flag_g_expert_mode_no_walking)))
				setqueuetricks special = SpecialTricks airtricks Jumptricks
			else
				setqueuetricks special = SpecialTricks airtricks Jumptricks SkateToWalkTricks
			endif
		endif
		pose_capture = 1
		if lastwallridelessthan 500
			forceairmatrixlerp lerp_time = 1.0
			pose_capture = 0
		endif
		if lastpolywasvert
			Skater_PlayOllieAnim $Vert_data pose_capture = <pose_capture>
		else
			Skater_PlayOllieAnim $Ollie_data groundgone = 1 pose_capture = <pose_capture>
		endif
		settrickname ""
		settrickscore 0
		display spinonly
		WaitAnimWhilstCheckingLateOllie
		SetSkaterAirTricks
		cleareventhandler Ollied
		onexceptionrun
		goto Airborne params = {no_anim = 1}
	endif
endscript

script WaitAnimWhilstCheckingLateOllie 
	begin
	if airtimegreaterthan \{$skater_late_jump_slop}
		return
	endif
	DoNextTrick \{trickparams = {
			FromGroundGone
		}}
	wait \{1
		gameframe}
	repeat
endscript

script WaitFramesLateOllie 
	begin
	if (<frames> = 0)
		return \{frames = 0}
	endif
	if airtimegreaterthan \{$skater_late_jump_slop}
		return frames = <frames>
	endif
	frames = (<frames> - 1)
	wait \{1
		gameframe}
	repeat
endscript

script TrickOllie 
	jump
endscript

script Airborne 
	InAirExceptions <...>
	if NOT gotparam \{skip_ik_off}
		static_tree_ik_off
	endif
	if NOT gotparam \{no_anim}
		Skater_PlayOllieAnim $Ollie_data sync = 1 blendduration = <blendduration>
	endif
	begin
	wait \{1
		gameframe}
	DoNextTrick
	repeat
endscript

script pitch_bail_check 
	printf channel = bail 'Pitch_Bail_Check'
	if isinbail
		return
	endif
	if ($Bails_Disabled = 0)
		if absolutepitchgreaterthan 60
			if pitchgreaterthan 60
				printf channel = bail 'Pitch_Bail_Check - Pitchbail'
				obj_spawnscriptnow pitchbail
				return
			endif
		endif
		if doingflip
			printf channel = bail 'Pitch_Bail_Check - DOING A FLIP'
			obj_spawnscriptnow pitchbail
			return
		endif
	endif
endscript

script land 
	if isinbail
		return
	endif
	easy_no_bail = 0
	setlandedperfect false
	killskatercamanim name = BIGDROP
	cancelrotatedisplay
	if ($Bails_Disabled)
		cleartrickqueue
		killextratricks
	else
		if NOT gotparam no_bail
			if speedgreaterthan 12.5
				if yawbetween (60.0, 120.0)
					goto YawBail
				endif
			endif
			if absolutepitchgreaterthan 60
				if pitchgreaterthan 60
					printf "REAL PITCH BAIL"
					goto pitchbail
				endif
			endif
			if landedfromspine
				getmatrixnormal
				if (<y> > 0.95)
					printf "Bailing due to landing from spine onto flat ground"
					goto pitchbail
				endif
			endif
			if rollgreaterthan 50
				goto DoingTrickBail
			endif
			if NOT gotparam walk_manual
				if doingtrick
					printf "DOING A TRICK"
					goto DoingTrickBail
				endif
			endif
			if doingflip
				printf "DOING A FLIP"
				goto pitchbail
			endif
		endif
	endif
	if gotparam walk_manual
		return
	endif
	if gotparam NoBlend
		BlendperiodOut 0
	endif
	if gotparam ForceBlendperiodOut
		BlendperiodOut <ForceBlendperiodOut>
	endif
	if NOT gotparam no_shake
		obj_spawnscriptlater land_effect_fire
	endif
	if gotparam no_anim
		no_anim = 1
	else
		no_anim = 0
	endif
	if gotparam IgnoreAirTime
		goto Land2 params = {IgnoreAirTime no_anim = <no_anim>}
	else
		if airtimelessthan 0.2 seconds
			goto Land2 params = {LittleAir no_anim = <no_anim>}
		else
			goto Land2 params = {RevertTime = <RevertTime> no_anim = <no_anim>}
		endif
	endif
endscript

script RevertWindow_LandSkaterTricks 
	overridecancelground \{off}
	if NOT gotparam \{Ollied}
		landskatertricks
	endif
endscript

script exit_land2 
	if gotparam \{kill_extra}
		kill_extra_tricks
	endif
	static_tree_ik_off
endscript

script Land2 RevertTime = 5 no_anim = 0
	if NOT skaterisflipping
		DoPerfectCheck
	endif
	AllowRailTricks
	nollieoff
	ClearLipCombos
	animsave_timestamp event = {type = landed}
	obj_spawnscriptlater SkaterParticles_TerrainLand
	if landedonbank
		setlastlandingground
		donextmanualtrick FromAir
	else
		if NOT landedfromvert
			setlastlandingground
			donextmanualtrick FromAir
		else
			setlastlandingvert
		endif
	endif
	overridecancelground
	obj_clearflag $FLAG_SKATER_MANUALCHEESE
	onexitrun exit_land2
	getspeed
	if (<speed> > 6.3500004)
		SetExtraTricks_Reverts
		onexitrun exit_land2 params = {kill_extra_tricks}
	endif
	if (<no_anim> = 0)
		static_tree_ik_on
		Skater_PlayOnGroundAnim sync = 0 no_land = <no_land> no_events
	endif
	cleartrickqueue
	SetSkaterAirManualTricks
	OnGroundExceptions NoEndRun
	if CanGroundPlant
		seteventhandler response = switch_script event = Ollied scr = GroundPlant
		onexceptionrun RevertWindow_LandSkaterTricks
	else
		onexceptionrun landskatertricks
	endif
	if GoalManager_GoalShouldExpire
		cleareventhandler Ollied
		cleareventhandler groundgone
		cleareventhandler Wallpush
		onexceptionrun
		cleartricksfrom Jumptricks
		setqueuetricks NoTricks
	endif
	if NOT gotparam NoReverts
		getmultiplier
		if (<multiplier> > 7)
			if (<speed> > 12)
				obj_spawnscriptlater sk8_CAS_Land_Grunts
			endif
		endif
		if landedfromvert
			resetlandedfromvert
			if landedonbank
				begin
				donextmanualtrick FromAir
				wait 1
				repeat 3
				seteventhandler event = playkickanim scr = playkickanim group = OngroundAnims response = call_script
				begin
				donextmanualtrick FromAir
				wait 1
				repeat 7
			else
				begin
				wait 1
				repeat <RevertTime>
			endif
		else
			begin
			donextmanualtrick FromAir
			wait 1
			repeat 3
			seteventhandler event = playkickanim scr = playkickanim group = OngroundAnims response = call_script
			begin
			donextmanualtrick FromAir
			wait 1
			repeat 7
		endif
	endif
	seteventhandler event = playkickanim scr = playkickanim group = OngroundAnims response = call_script
	seteventhandler event = PlayBrakeAnim scr = PlayBrakeAnim group = OngroundAnims response = call_script
	cleartricksfrom Jumptricks
	killextratricks
	if anim_animnodeexists id = kicktimer
		if NOT anim_command target = kicktimer command = kicktimer_iskicking
			dont_land_tricks = 1
		endif
	endif
	if NOT gotparam dont_land_tricks
		landskatertricks
	endif
	onexceptionrun
	OnGroundExceptions
	CheckforNetBrake
	WaitAnimWhilstChecking AndManuals timer = groundlandtimer
	if innollie
		goto OnGroundNollieAI params = {no_anim = 1}
	else
		goto ongroundai params = {no_anim = 1}
	endif
endscript

script kill_extra_tricks 
	killextratricks
endscript

script landskatertricks 
	if getglobalflag flag = $CHEAT_ALWAYS_COMBO
		if NOT walking
			return
		endif
	endif
	GetSkaterNumber
	GetBonusValue skater = <skaternumber>
	if gotparam bonus
		if (<bonus> > 0)
			settrickname ""
			settrickscore <bonus>
			display blockspin nodegrade noswitch
		endif
	endif
	if currentscorepotgreaterthan 1500
		soundevent event = LandPointsSound
	endif
	checkgaptricks
	cleargaptricks notinsameframe
	if gotparam no_balance_reset
		clearpanel_landed no_balance_reset
	else
		clearpanel_landed
	endif
	clearmanualtrick
	overridecancelground off
	resetspin
	obj_clearflag $FLAG_SKATER_REVERTCHEESE
	if NOT gotparam DontKillFocus
		killspecial
	endif
endscript

script DoPerfectCheck 
	doperfectcheck2
	if (<achieved_min_spin> = 1)
		addtocumulativerecord \{ability = total_landings
			score = 1}
	endif
	switch <perfect>
		case 1
		setlandedperfect \{true}
		AwardPerfect
		case 2
		AwardSloppy
		default
	endswitch
endscript

script doperfectcheck2 
	perfect = 0
	achieved_min_spin = 0
	if currentscorepotgreaterthan 1
		getactualspin
		<achieved_min_spin> = 0
		if NOT landedonbank
			if landedfromvert
				landedVert = 1
			endif
		endif
		if gotparam landedVert
			if (<spin> > (359.0 - ($skater_physics.spin_count_slop)))
				<achieved_min_spin> = 1
			endif
		else
			if (<spin> > (179.0 - ($skater_physics.spin_count_slop)))
				<achieved_min_spin> = 1
			endif
		endif
		if (<achieved_min_spin> = 1)
			casttointeger spin
			if ((<spin> < 180) && (<spin> > (179 - ($perfect_landing_slop))))
				<perfect> = 1
			else
				mod a = <spin> b = 180
				if (<mod> > 90)
					<mod> = (180 - <mod>)
				endif
				if (<mod> < (($perfect_landing_slop) + 1))
					<perfect> = 1
				else
					if (<mod> > 46)
						<perfect> = 2
					endif
				endif
			endif
		endif
	endif
	return perfect = <perfect> achieved_min_spin = <achieved_min_spin>
endscript

script AwardPerfect NoBlockSpin = 0
	GMan_PassPerfectTrick
	if NOT hide_any_hud_display
		if NOT insplitscreengame
			ui_display_message type = alert text = "Clean! +1000 Points" color = green
		else
			PerfectSloppy_2p text = "Clean!" rgba = [80 180 120 220]
		endif
	endif
	broadcastevent type = SkaterLandedClean
	settrickname ""
	settrickscore $score_landing_clean
	if (<NoBlockSpin> = 0)
		display blockspin nodegrade
	else
		display nodegrade
	endif
	soundevent event = play_perfect_landing_sound_sfx
	addtocumulativerecord ability = cleanlanding score = 1
endscript

script SloppyLandingEvent NoBlockSpin = 0
	GMan_PassSloppyTrick
	if NOT hide_any_hud_display
		if NOT insplitscreengame
			ui_display_message type = alert text = "Sloppy! -500 Points" color = red
		else
			PerfectSloppy_2p text = "Sloppy!" rgba = [180 120 80 255]
		endif
	endif
	broadcastevent type = SkaterLandedSloppy
	settrickname ""
	settrickscore $score_landing_sloppy
	if (<NoBlockSpin> = 0)
		display blockspin nodegrade
	else
		display nodegrade
	endif
	soundevent event = play_sloppy_sound_sfx
	addtocumulativerecord ability = sloppylanding score = 1
endscript

script AwardSloppy 
	SkaterGetBaseScore
	if (<base_score> > (-1 * $score_landing_sloppy))
		SloppyLandingEvent
	endif
endscript

script GetBonus score = 100 text = "Bonus!" rgba = ($goal_career_ui_scheme.main)
	if NOT hide_any_hud_display
		if NOT insplitscreengame
			formattext textname = text2 "%t: %i Points" i = <score> t = <text>
			ui_display_message type = alert text = <text2> color = bluelt
		else
			PerfectSloppy_2p text = <text> rgba = <rgba>
		endif
	endif
	GetSkaterNumber
	AddBonus <score> skater = <skaternumber>
	obj_spawnscriptlater GetBonus_exit params = {<...>}
endscript

script GetBonus_exit 
	if onground
		if NOT doingbalancetrick
			if NOT currentscorepotgreaterthan \{0}
				settrickname <text>
				settrickscore <score>
				display \{blockspin
					nodegrade
					noswitch}
				clearpanel_landed
			endif
		endif
	endif
endscript

script PerfectSloppy_2p style = shuffle_style
	ScriptGetScreenMode
	GetSkaterNumber
	switch <screen_mode>
		case split_vertical
		switch <skaternumber>
			case 0
			create_panel_message text = <text> id = perfect rgba = <rgb> pos = (147.0, 340.0) style = <style> parent = player1_panel_container
			case 1
			create_panel_message text = <text> id = perfect_p2 rgba = <rgb> pos = (147.0, 340.0) style = <style> parent = player2_panel_container
		endswitch
		case split_horizontal
		switch <skaternumber>
			case 0
			create_panel_message text = <text> id = perfect rgba = <rgb> pos = (307.0, 154.0) style = <style> parent = player1_panel_container
			case 1
			create_panel_message text = <text> id = perfect_p2 rgba = <rgb> pos = (307.0, 375.0) style = <style> parent = player2_panel_container
		endswitch
	endswitch
endscript

script shuffle_style 
	domorph time = 0 scale = (0.0, 0.0) alpha = 0 rot_angle = 0
	domorph time = 0.2 scale = 0.5 alpha = 0.5 anim = ease_in
	domorph time = 0.02 scale = 0.75 alpha = 1.0 anim = ease_in
	domorph time = 0.05 scale = 0.65000004
	domorph time = 0.05 scale = 0.7 anim = ease_out
	domorph time = 2.0 scale = 0.75 anim = ease_out
	domorph time = 0.05 scale = 0.8
	domorph time = 0.05 scale = 0.65000004 alpha = 0.5
	domorph time = 0.1 scale = (12.0, 0.0) alpha = 0 anim = ease_in
	die
endscript

script sloppy_style 
	domorph time = 0 scale = (0.0, 0.0) alpha = 0 rot_angle = 0
	domorph time = 0.2 scale = 0.3 alpha = 0.5 anim = ease_in
	domorph time = 0.02 scale = 0.55 alpha = 1.0 anim = ease_in
	domorph time = 0.05 scale = 0.45000002
	domorph time = 0.05 scale = 0.5 anim = ease_out
	domorph time = 2.0 scale = 0.55 anim = ease_out
	domorph time = 0.05 scale = 0.6
	domorph time = 0.05 scale = 0.45000002 alpha = 0.5
	domorph time = 0.1 scale = (12.0, 0.0) alpha = 0 anim = ease_in
	die
endscript

script focustimelimit_style 
	setprops rgba = [100 248 100 128]
	domorph time = 0 pos = (128.0, 500.0) scale = (0.0, 0.0) relative_scale
	domorph time = 0.1 scale = (1.2, 1.0) relative_scale
	domorph time = 0.02 alpha = 0
	domorph time = 0.05 alpha = 1
	domorph time = 0.05 alpha = 0
	domorph time = 0.03 alpha = 1
	domorph time = 0.05 alpha = 0
	domorph time = 0.05 alpha = 1
	domorph time = 0.04 alpha = 0
	domorph time = 0.05 alpha = 1
	domorph time = 0.05 alpha = 0
	domorph time = 0.03 alpha = 1
	domorph time = 0.05 alpha = 0
	domorph time = 0.05 alpha = 1
	domorph time = 0.04 alpha = 0
	domorph time = 0.05 alpha = 1
	domorph time = 0.05 alpha = 0
	domorph time = 0.02 alpha = 1
	domorph time = 1 alpha = 0
	die
endscript

script WaitOnGround 
	begin
	if onground
		break
	endif
	waitonegameframe
	repeat
endscript

script VibrateOff 
	vibrate \{off}
endscript

script Carplant 
	stopbalancetrick
	cleareventhandlergroup \{`default`}
	onexceptionrun
	InAirExceptions
	cleareventhandler \{Carplant}
	onexceptionrun
	obj_spawnscriptlater \{CarSparks}
	docarplantboost
	settrickname \{"Car Plant"}
	settrickscore \{400}
	display
	if NOT doingtrick
		skater_playanim \{anim = Beanplant
			blendperiod = 0.3}
		WaitAnimWhilstChecking
		goto \{Airborne}
	endif
endscript

script CarSparks 
	SetSparksTruckFromNollie
	TurnSparksOn
	wait \{0.333
		seconds}
	seteventhandler \{event = Carplant
		scr = Carplant
		response = switch_script}
	wait \{3
		seconds}
	TurnSparksOff
endscript

script freezeskater 
	SwitchOnBoard
	cleareventhandlergroup \{`default`}
	onexceptionrun
	setqueuetricks \{NoTricks}
	disableplayerinput
	SetRollingFriction \{10000}
	skater_playanim \{anim = `default`}
endscript

script FlailingFall 
	inbail
	cleareventhandlergroup \{`default`}
	onexceptionrun
	setqueuetricks \{NoTricks}
	disableplayerinput \{AllowCameraControl}
	skater_playanim \{anim = StretchtoFlailingFall
		blendperiod = 0.3}
	BailSkaterTricks
	Skater_WaitAnim \{percent = 90}
	SwitchOffBoard
	skater_waitanimfinished
	skater_playanim \{anim = FlailingFall
		cycle}
endscript

script RestartSkaterExceptions 
	AllowRailTricks
	boardrotate \{normal}
	cleareventhandlergroup \{`default`}
	onexceptionrun
	cleartrickqueue
	setqueuetricks \{NoTricks}
	clearmanualtrick
	cleareventbuffer
	SwitchOnBoard
endscript

script LaunchSpecialMessage text = "Special Trick" vol = 50 pitch = 100
	if inmultiplayergame
		if NOT getglobalflag flag = $SOUNDS_SPECIALSOUNDS_OFF
			soundevent event = special_sound_in_multiplayer_game
		endif
	else
		if (getglobalflag flag = $CHEAT_COOL_SPECIAL_TRICKS)
			if gotparam Cool
				setslomo 0.6
				pulse_blur start = 0 end = 150 speed = 10
				if NOT getglobalflag flag = $SOUNDS_SPECIALSOUNDS_OFF
					soundevent event = special_sound_in_slowmo_cool
				endif
				onexceptionrun killspecial
			else
				if NOT getglobalflag flag = $SOUNDS_SPECIALSOUNDS_OFF
					soundevent event = special_sound_in_otherm_modes
				endif
			endif
		else
			if NOT getglobalflag flag = $SOUNDS_SPECIALSOUNDS_OFF
				soundevent event = special_sound_in_otherm_modes
			endif
		endif
	endif
endscript

script LaunchExtraMessage \{text = "Hidden Combo!"}
	if NOT getglobalflag \{flag = $SOUNDS_SPECIALSOUNDS_OFF}
		printf \{"TRICKS_EXTRA_TRICK_2"}
		soundevent \{event = ExtraTrick_SFX_InstanceLimiting}
	endif
endscript
TRANSFER_POINTS = 250
ACID_DROP_POINTS = 250
ACID_BOMB_POINTS = 350

script skaterawardtransfer \{name = "Spine Transfer"}
	if NOT inair
		return
	endif
	settrickname <name>
	settrickscore \{$TRANSFER_POINTS}
	display \{nodegrade}
	LaunchSubStateEntryEvent \{SubState = Transfer}
endscript

script skaterawardhiptransfer 
	skaterawardtransfer \{name = "Hip Transfer"}
endscript

script skaterawardtransfertobank 
	skaterawardtransfer \{name = "Transfer to Bank"}
endscript

script skateraciddroptriggered 
	LaunchSubStateEntryEvent SubState = AcidDrop
	if NOT gotparam auto_drop
		if NOT gotparam bank_drop
			settrickname "Acid Drop"
		else
			settrickname "Bank Drop"
		endif
		if (<dropheight> < 9)
			settrickscore $ACID_DROP_POINTS
		else
			settrickscore $ACID_BOMB_POINTS
		endif
		display nodegrade
	else
	endif
	obj_spawnscriptlater AcidParticlesOn
	obj_killspawnedscript name = HandleAcidDropCheese
	obj_spawnscriptlater HandleAcidDropCheese
endscript

script HandleAcidDropCheese 
	settags \{AcidDropCheese = 1}
	wait \{1
		second}
	settags \{AcidDropCheese = 0}
endscript

script HandleKickBoostEvent 
	if NOT incontrolledkick
		return
	endif
	if NOT anim_animnodeexists id = kicktimer
		return
	endif
	if NOT anim_command target = kicktimer command = kicktimer_lastkickwasgood
		return
	endif
	if NOT onground
		return
	endif
	anim_command {
		target = kicktimer
		command = kicktimer_getkicktimeoffset
	}
	if (<kick_time_offset> > 0.5)
		kick_time_offset = 0.5
	endif
	mult = (1 - (2 * <kick_time_offset>))
	soundevent event = sk9_agro_woosh_SFX
	soundevent event = sk9_AgroKick_BreathInhale
	if NOT getglobalflag flag = $cheat_sim_mode
		kick_boost_threshold = ($skater_physics.kick_boost_threshold)
		kick_boost_increase = ($skater_physics.kick_boost_increase)
	else
		kick_boost_threshold = ($sim_mode_physics.kick_boost_threshold)
		kick_boost_increase = ($sim_mode_physics.kick_boost_increase)
	endif
	getspeed
	if (<speed> > <kick_boost_threshold>)
		return
	endif
	boost = (<mult> * <kick_boost_increase>)
	new_speed = (<speed> + <boost>)
	soundevent event = sk9_AgroKick_BoostWhoosh BoostSFXvol = <boost>
	if (<new_speed> > <kick_boost_threshold>)
		new_speed = (<kick_boost_threshold>)
	endif
	SetSkaterVelocity <new_speed>
endscript

script aggro_good_kick 
	if gotparam \{strength}
		if NOT insplitscreengame
			strength = ((0.25 - <strength>))
			if (<strength> < 0)
				strength = 0
			endif
			Create_AgroKickFX strength = <strength>
			Aggro_Kick_Rumble_Strong
		endif
	endif
endscript

script Aggro_Kick_Rumble_Weak 
	if incontrolledkick
		vibrate \{actuator = 0
			percent = 100
			duration = 0.15}
	endif
endscript

script Aggro_Kick_Rumble_Strong 
	if incontrolledkick
		vibrate \{actuator = 1
			percent = 100
			duration = 0.15}
	endif
endscript

script aggro_bad_kick 
	getspeed
	if (<speed> > 3.0)
		SetSkaterVelocity (<speed> * (1.0 - (<factor> * $skater_physics.kick_bad_kick_drag)))
	else
		SetSkaterVelocity \{3.0}
	endif
	soundevent \{event = Aggro_Kick_Bad_Switcher}
endscript

script aggro_kick_score 
	if skatercurrentscorepotgreaterthan 0
		return
	endif
	if NOT skaterprofile_isabilityactive ability = aggro_score
		return
	endif
	if (<offset> > 0.1)
		offset = 0.1
	elseif (<offset> < 0)
		offset = 0
	endif
	min = 500
	max = 10000
	score = (((<max> - <min>) * (1.0 - (10 * <offset>))) + <min>)
	casttointeger score
	settrickname "Aggro Kick"
	settrickscore <score>
	display blockspin
endscript

script aggro_kick_kill_score 
	BailSkaterTricks
endscript

script aggro_manual_wall_boost 
	if gotparam nosemanual
		if gotparam backside
			AnimData = $wall_push_bs_nose_data
		else
			AnimData = $wall_push_fs_nose_data
		endif
	else
		if gotparam backside
			AnimData = $wall_push_bs_data
		else
			AnimData = $wall_push_fs_data
		endif
	endif
	if gotparam car
		name = "Aggro Skitch Boost"
		soundevent event = sk9_car_boost_SFX
	else
		name = "Aggro Push"
		soundevent event = sk9_wall_boost_SFX
	endif
	ManualFlip {
		name = <name>
		score = 100
		AnimData = <AnimData>
		extratricks = FlatlandBranches
		ExtraTricks2 = ManualBranches
		parent = "Manual"
		trickslack = 0
		isextra
	}
	AdjustBalance TimeAdd = -1.0 speedmult = 1.0 leanmult = 1.0
endscript

script aggro_wall_boost 
	if gotparam \{backside}
		anim = sk8_ground_ollie_skitboost_BS_F
	else
		anim = sk8_ground_ollie_skitboost_FS_F
	endif
	skater_playanim anim = <anim>
	settrickscore \{100}
	settrickname \{"Aggro Skitch Boost"}
	display \{blockspin}
	landskatertricks
	skater_waitanimfinished
	goto \{ongroundai}
endscript

script player_cleanup 
	obj_getid
	printf 'player_cleanup - %s' s = <objid> DontAssertOnChecksums
	manglechecksums a = bailboard b = <objid>
	if objectexists id = <mangled_id>
		<mangled_id> :die
	endif
	if islocalskater
		SkaterInit \{cleanup}
	endif
endscript

script AwardPumpBonus 
	if gotparam \{dir}
		if (<dir> = down)
			ui_display_message \{type = alert
				text = "Pump Down +100 Points"
				color = red}
		else
			ui_display_message \{type = alert
				text = "Pump Up +100 Points"
				color = black}
		endif
	endif
endscript

script EnterPumpMode 
	obj_spawnscriptlater \{BowlBloom}
	skatercam0 :sc_setmode \{mode = 3}
	setslomo ($skater_physics.bowl_mode_slomo_percent)
	getspeed
	if (<speed> < 5.0)
		setspeed \{6.0}
	endif
	clearmanualtrick
	StartPumpScore
endscript

script StartPumpScore 
	settrickname \{"Pump"}
	settrickscore \{100}
	display
endscript

script exitpumpmode 
	obj_spawnscriptlater \{EndBowlBloom}
	skatercam0 :sc_setmode \{mode = 2}
	setslomo \{1.0}
	if onground
		landskatertricks
	endif
endscript

script IGC_BigDrop \{time = 0.1}
	ccam_domorph {
		lockto = skater
		pos = (1.9190409, 0.381963, 0.398059)
		quat = (0.014725999, -0.78019696, -0.101381)
		fov = 72.0
		motion = smooth
		time = <time>
	}
	ccam_waitmorph
	wait \{0.3
		seconds}
	igc_camera_movetoplayer time = <time>
	wait <time> seconds
	skater :toggle_focus2
endscript

script IGC_BigDrop_SkaterCam 
	setskatercamoverride \{heading = 0
		tilt = -0.0
		time = 0.01}
	wait \{0.7
		seconds}
	clearskatercamoverride
	toggle_focus2
endscript

script PedKnockdown 
	obj_spawnscriptlater \{BloodSmall}
	ForcedBailLogicStuff impact_impulse = <impact_impulse> impact_bone = <impact_bone>
endscript
