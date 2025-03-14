Bails_Disabled = 0
bail_collision_limbs = [
	bone_ankle_r
	bone_ankle_l
	bone_palm_r
	bone_palm_l
	bone_knee_l
	bone_knee_r
	bone_neck
]
bail_collision_pelvis = [
	bone_pelvis
]
bail_fallthroughworld_limbs = [
	bone_pelvis
	bone_knee_r
	bone_neck
]
forcedbail_check_stuck_limbs = [
	bone_ankle_r
	bone_ankle_l
	bone_palm_r
	bone_palm_l
]
bail_steep_ground = 0.8

script DoingTrickBail 
	goto \{YawBail}
endscript

script YawBail 
	dir = forward
	getactualspin
	if (<spin> < 0)
		spin = (<spin> * -1)
	endif
	if landedfromvert
		spin = (<spin> + 180)
	endif
	begin
	if (<spin> > 360)
		spin = (<spin> - 360)
	else
		break
	endif
	repeat
	if flipped
		is_flipped = true
	else
		is_flipped = false
	endif
	if (<spin> < 90)
		if (<is_flipped> = true)
			is_flipped = false
		else
			is_flipped = true
		endif
	endif
	if (45 > <spin>)
		dir = nose
	else
		if (135 < <spin> && <spin> < 225)
			dir = tail
		else
			if yawingleft
				if (<is_flipped> = true)
					dir = face
				else
					dir = back
				endif
			else
				if (<is_flipped> = true)
					dir = back
				else
					dir = face
				endif
			endif
		endif
	endif
	switch <dir>
		case nose
		goto Bail_spin_FWD
		case tail
		goto Bail_Spin_BCK
		case face
		goto Bail_spin_CW
		case back
		goto Bail_spin_CCW
	endswitch
endscript

script Bail_Choose_Ramp_Script 
	if airtimelessthan \{2.5
			second}
		if speedlessthan \{15}
			if NOT speedlessthan \{10}
				setspeed \{10}
			endif
			goto <runout_script>
		else
			goto <ragdoll_script>
		endif
	else
		goto <ragdoll_script>
	endif
endscript

script Bail_spin_FWD 
	if landedfromvert
		Bail_Choose_Ramp_Script \{runout_script = Bail_Ramp_Fwd
			ragdoll_script = Bail_Ramp_Fwd}
	else
		if speedlessthan \{8}
			if airtimelessthan \{1.0
					second}
				goto \{Runout_FWD}
			else
				Random (@ goto \{Bail_Spin_FWD_Regular}
					@ goto \{Bail_Spin_BCK_Regular})
			endif
		else
			Random (@ goto \{Bail_Spin_FWD_Regular}
				@ goto \{Bail_Spin_BCK_Regular})
		endif
	endif
endscript

script Bail_Spin_BCK 
	if landedfromvert
		Bail_Choose_Ramp_Script \{runout_script = Bail_Ramp_Bck
			ragdoll_script = Bail_Ramp_Bck}
	else
		if speedlessthan \{8}
			if airtimelessthan \{1.0
					second}
				goto \{Runout_FWD}
			else
				Random (@ goto \{Bail_Spin_FWD_Regular}
					@ goto \{Bail_Spin_BCK_Regular})
			endif
		else
			Random (@ goto \{Bail_Spin_FWD_Regular}
				@ goto \{Bail_Spin_BCK_Regular})
		endif
	endif
endscript

script Bail_spin_CW 
	if landedfromvert
		Bail_Choose_Ramp_Script \{runout_script = Bail_Ramp_CW
			ragdoll_script = Bail_Ramp_CW}
	else
		if speedlessthan \{8}
			if airtimelessthan \{1.0
					second}
				goto \{Runout_CW}
			else
				goto \{Bail_Spin_CW_Regular}
			endif
		else
			goto \{Bail_Spin_CW_Regular}
		endif
	endif
endscript

script Bail_spin_CCW 
	if landedfromvert
		if airtimelessthan \{3
				second}
			goto \{Bail_Ramp_CCW}
		else
			goto \{Bail_Ramp_CCW}
		endif
	else
		if speedlessthan \{8}
			if airtimelessthan \{1.0
					second}
				goto \{Runout_CCW}
			else
				goto \{Bail_Spin_CCW_Regular}
			endif
		else
			goto \{Bail_Spin_CCW_Regular}
		endif
	endif
endscript

script force_flip_bail 
	printf \{'force_flip_bail'}
	MakeSkaterGoto \{pitchbail}
endscript

script pitchbail 
	printf channel = bail 'PitchBail'
	tail_script = Bail_Pitch_Tail
	face_script = Bail_Pitch_Face
	back_script = Bail_Pitch_Back
	nose_script = Bail_Pitch_Nose
	if NOT insplitscreengame
		if getglobalflag flag = $TAP_BUTTONS_EXPLAINED
			if NOT getglobalflag flag = $RECOVERY_BUTTONS_EXPLAINED
				ui_display_message type = instruction text = "Tip: press \\ml in the air to level out" time = 5
				setglobalflag flag = $RECOVERY_BUTTONS_EXPLAINED
			endif
		endif
	endif
	if nailthetrick_isinnailthex
		nailthetrick_sethadbailflag value = 1
	endif
	MakeSkaterGoto Bail_NoInit
endscript

script FiftyFiftyFall 
	switch <dir>
		case forward
		goto \{Bail_Falling_LT}
		case backward
		goto \{Bail_Falling_RT}
		default
		goto \{bail_falling_fwd}
	endswitch
endscript

script GrindFallLR 
	if collisioncache_getcollision \{down
			distance = 0
			height = 0
			length = 0.75
			shift = 0.15}
		no_nutter = 1
	endif
	if ledge
		no_nutter = 1
	endif
	if gotparam \{no_nutter}
		goto GrindBailFacingForwards params = {dir = <dir>}
	else
		Random (@ goto )GrindBailFacingForwards params = {dir = <dir>}
	endif
endscript

script GrindBailFacingForwards 
	switch <dir>
		case forward
		goto \{Bail_Falling_Slide_FWD_rt}
		case backward
		goto \{Bail_Falling_Slide_FWD_lt}
		default
		goto \{Bail_Falling_Slide_FWD_lt}
	endswitch
endscript

script BackwardsGrindBails 
	if collisioncache_getcollision \{down
			distance = 0
			height = 0
			length = 0.75
			shift = 0.15}
		no_nutter = 1
	endif
	if ledge
		no_nutter = 1
	endif
	if gotparam \{no_nutter}
		goto GrindBailFacingBackwards params = {dir = <dir>}
	else
		Random (@ goto )GrindBailFacingBackwards params = {dir = <dir>}
	endif
endscript

script GrindBailFacingBackwards 
	switch <dir>
		case forward
		goto \{Bail_Falling_Slide_BCK_rt}
		case backward
		goto \{Bail_Falling_Slide_BCK_lt}
		default
		goto \{Bail_Falling_Slide_BCK_lt}
	endswitch
endscript

script Nutter 
	goto \{Bail_Nutter_FWD}
endscript

script NutterBackwards 
	goto \{Bail_Nutter_BCK}
endscript

script runout 
	if speedlessthan \{9}
		goto \{Bail_RunOut_Old}
	else
		Random (@*2 goto \{Bail_RunOut_New_A}
			@ goto \{Bail_RunOut_Old})
	endif
	setrunoutbail \{runoutbail = 1}
endscript

script ManualFlatlandBailForward 
	printf \{channel = bail
		'ManualFlatland Bail Forward'}
	goto \{ManualBailFlatlandForward}
endscript

script ManualFlatlandBailBack 
	printf \{channel = bail
		'ManualFlatland Bail Back'}
	goto \{ManualBailFlatlandBack}
endscript

script ManualBail 
	printf \{channel = bail
		'Manual Bail'}
	if speedlessthan \{15}
		goto \{ManualBailSlow}
	else
		goto \{ManualBailFast}
	endif
endscript

script NoseManualBail 
	printf \{channel = bail
		'Nose Manual Bail'}
	if speedlessthan \{14}
		goto \{NoseManualBailSlow}
	else
		goto \{NoseManualBailFast}
	endif
endscript

script InvertBail 
	printf \{channel = bail
		'Invert Bail'}
	goto \{Bail_NoInit}
endscript

script BailDisabledIniter 
	wait \{10
		frames}
	MakeSkaterGoto \{SkaterInit}
endscript

script SetBailExceptions 
	seteventhandler \{event = CarBail
		scr = CarBail
		response = switch_script}
	seteventhandler \{event = bailcollision
		scr = bailcollision
		response = call_script}
	seteventhandler \{event = runhasended
		scr = endofrun
		response = switch_script}
endscript

script GeneralBail friction = 18 friction2 = 20 HeavyFriction = 100 PureAnimPercent = 0
	if ($is_changing_levels = 1)
		printf 'Argh! Preventing bail cos we are loading levels'
		return
	endif
	if getsingletag SpecialTrickFX
		obj_getid
		killspawnedscript id = SpecialTrickFX
		obj_spawnscriptlater Destroy_Board_Fire_FX params = {objid = <objid>}
	endif
	Ragdoll_Bail_Flash_Kill
	ragdoll_fixmatrix
	if invertair
		settags vertair = 1
	else
		if isinspinetransfer
			settags vertair = 1
		else
			settags vertair = 0
		endif
	endif
	printf '++ GeneralBail - (Anim: %d)' d = <Anim1> DontAssertOnChecksums
	animsave_timestamp event = {type = bailstart}
	if TerrainLogicIsLocalSkater
		soundevent event = sk8_CAS_BailInit_Grunts
	endif
	soundevent event = sk8_bailboard
	settags {
		quitbail = 0
		rotaterollout = 0
		doingrollout = 0
		flatlandbail = 0
		walkingbail = 0
	}
	if gotparam flatland
		settags flatlandbail = 1
	endif
	if walking
		settags walkingbail = 1
	endif
	if NOT gotparam ForcedBail
		if ($Bails_Disabled = 1)
			obj_spawnscriptlater BailDisabledIniter
			if onrail
				goto OffRail
			else
				goto Land2 params = {no_land = 1}
			endif
		endif
	endif
	obj_getboneposition bone = bone_stomach_lower
	skater_pos = (<x> * (1.0, 0.0, 0.0) + <y> * (0.0, 1.0, 0.0) + <z> * (0.0, 0.0, 1.0))
	obj_getboneposition bone = bone_board_deck
	board_pos = (<x> * (1.0, 0.0, 0.0) + <y> * (0.0, 1.0, 0.0) + <z> * (0.0, 0.0, 1.0))
	board_diff = (<skater_pos> - <board_pos>)
	normalizevector <board_diff>
	base_bail_moveage = (0.0, 0.03, 0.0)
	if NOT gotparam BoardAlwaysOn
		CreateBailBoard bail_board_vel = <bail_board_vel> bail_board_rot_vel = <bail_board_rot_vel>
	endif
	obj_getvelocity
	getspeed
	if (<speed> > $ragdoll_bail_velocity_cap)
		set_speed = $ragdoll_bail_velocity_cap
		printf channel = bail 'Capped ragdoll speed %f down to %c' f = <speed> c = <set_speed>
		setspeed <set_speed>
	endif
	if gotparam set_speed
		printf channel = bail '+++ Overriding ragdoll speed +++'
		normalizevector <vel>
		if NOT ragdoll_isactive
			ragdoll_setvelocitywhilemaintaininginternalvelocities vel = (<norm> * <set_speed>)
		endif
	endif
	if onrail
		setstate air
		if anim_animnodeexists id = BodyPoseCapture
			anim_command {
				target = BodyPoseCapture
				command = posecapture_capture
			}
		endif
		was_on_rail = 1
	endif
	obj_gettype
	if (<objtype> = object_type_ped)
		softassert "Ped in GeneralBail?"
	endif
	obj_setboundingsphere 2.5
	if gotparam NoBailBoard
		NoBailBoard = 1
	endif
	nollieoff
	killspecial during_bail
	clearallowlipnogrind
	addtocumulativerecord ability = bail score = 1
	setqueuetricks NoTricks
	cleartrickqueue
	killextratricks
	setmanualtricks NoTricks
	if gotparam runoutbail
		setrunoutbail runoutbail = 1
	else
		setrunoutbail runoutbail = 0
	endif
	if gotparam ForcedBail
		setforcedbail ForcedBail = 1
	else
		setforcedbail ForcedBail = 0
	endif
	if gotparam runoutbail
		inbail runout
	else
		inbail
	endif
	LaunchStateChangeEvent state = Skater_InBail
	TurnSparksOff
	VibrateOff
	cleareventhandlergroup `default`
	ClearAllWalkingExceptions
	onexceptionrun
	BailSkaterTricks <...>
	stopbalancetrick
	obj_spawnscriptnow SteepGroundBailTimer
	if gotparam ForcedBail
		board_diff = (<board_diff> * 0.05)
	else
		if gotparam Nutter
			board_diff = (<board_diff> * 0.15)
		else
			board_diff = (<board_diff> * 0.05)
		endif
	endif
	if foundbadbailcollisions
		ragdoll_bail_off_world
	endif
	if NOT gotparam runoutbail
		MoveAwayFromGeo = 0
		obj_getposition
		start_pos = <pos>
		if gotparam grindbail
			if bailmoveawayfromgeo
				MoveAwayFromGeo = 1
			endif
		else
			if bailmoveawayfromgeo do_pos_pelvis
				MoveAwayFromGeo = 1
			endif
		endif
		if (<MoveAwayFromGeo> = 1)
			obj_getposition
			getdistance posa = <start_pos> posb = <pos>
			if (<dist_atob> > 0.5)
				printf "BailMoveAwayFromGeo moved skater too far"
				ragdoll_bail_off_world
			endif
		endif
	endif
	obj_getposition
	obj_getvelocity
	getspeed
	vectorlength vector = <vel>
	ragdoll_anim_set_state initialanim
	spawnterrainsound action = stopsounds
	obj_spawnscriptnow Ragdoll_Bail_Check_Instant_Getup_Timeout
	if NOT isrunoutbail
		if gotparam nttbail
			obj_spawnscriptnow nttbail_camera_timeout
		endif
		ragdoll_setstate state = physical_motion_rigidbody_driven_pose_used
	endif
	if gotparam NoInit
		printf 'NO INIT'
	else
		setbailinitphysics
		if NOT gotparam blendduration
			if isrunoutbail
				blendduration = 0.3
			else
				blendduration = 0.2
			endif
		endif
		skater_playanim anim = <Anim1> norestart blendperiod = <blendduration>
	endif
	if NOT isrunoutbail
		Face_PlayRandomBailPose
		skaterloopingsound_settag terrainsound_oldterrainsfxid = none
	endif
	if isrunoutbail
		SetBailExceptions
		cancelrotatedisplayandupdatematrix
		if NOT getglobalflag flag = $BLOOD_OFF
			if gotparam BloodFrame
				wait <BloodFrame> frames
				obj_spawnscriptlater BloodSmall
				soundevent event = generic_bail_blood_sfx
			endif
		endif
		SetRollingFriction <friction>
		if (<PureAnimPercent> > 0)
			Bail_WaitAnim percent = <PureAnimPercent>
			obj_killspawnedscript name = SteepGroundBailTimer
			settags allow_steep_bail = 0
		endif
		if gotparam RunoutBailToRagdoll
			printf channel = bail 'RunoutBailToRagdoll %s' s = <RunoutBailToRagdoll> DontAssertOnChecksums
			goto <RunoutBailToRagdoll> params = {RunoutToRagdollGroundPush = <RunoutToRagdollGroundPush> RunoutToRagdollSpeed = <RunoutToRagdollSpeed>}
		endif
		Bail_WaitAnimFinished
		if gotparam Endpose
			goto Baildone
		endif
	else
		SetBailExceptions
		if NOT gotparam NoInit
			if (<PureAnimPercent> > 0)
				Bail_WaitAnim percent = <PureAnimPercent>
			else
				Bail_WaitAnimFinished
			endif
		endif
		if ragdoll_anim_is_state initialanim
			ragdoll_anim_set_state fullragdoll
		endif
		ragdoll_setstate state = physical_motion_ragdoll_driven_pose_used
		printf "GeneralBail"
		ragdoll_setbaseragdolldrivestate $RagdollDriveParams_Init blend_duration = 0
		if gotparam impact_impulse
			ragdoll_applyimpulse bone = <impact_bone> impulse = <impact_impulse>
		endif
		ragdollbailactivate
		pausephysics pausesound = false
		cancelrotatedisplayandupdatematrix
		ragdoll_getvelocity
		normalizevector <vel>
		if (<length> > 20)
			ragdoll_setvelocitywhilemaintaininginternalvelocities vel = (<norm> * 20)
		endif
		ragdoll_setbaseragdolldrivestate $RagdollDriveParams_Standard blend_duration = 0.3
		if gotparam NoInit
			skater_playanim anim = SK8_Bail_InAir_FlailFaceDown_F
		endif
		wait 3 gameframe
		orientation = unset
		speed_state = INIT_FAST
		getstarttime
		begin
		wait 1 gameframe
		old_speed_state = <speed_state>
		getspeed
		if (<speed> < 5)
			speed_state = slow
			old_orientation = <orientation>
			Ragoll_Bail_Get_Orientation
		else
			speed_state = fast
			if (<old_speed_state> = INIT_FAST)
				if NOT Skater_AnimComplete
					speed_state = INIT_FAST
				endif
			endif
			getstarttime
		endif
		if (<speed_state> = fast)
			if NOT (<old_speed_state> = fast)
				skater_playanim anim = SK8_Bail_InAir_FlailFaceDown_F timer_type = cycle blendperiod = 1
			endif
		elseif (<speed_state> = slow)
			ragdoll_setbaseragdolldrivestate $RagdollDriveParams_Slow blend_duration = 2.0
			update_animation = false
			if NOT (<old_speed_state> = slow)
				update_animation = true
			elseif NOT (<old_orientation> = <orientation>)
				update_animation = true
			endif
			if (<update_animation> = true)
				Bail_PlayGetupAnim anim_struct = ($Bail_Writhe_Anims.<orientation>) timer_type = cycle blendduration = 1.0 speed = 0.6
			endif
		endif
		getelapsedtime starttime = <starttime>
		if (<elapsedtime> > 1000)
			break
		endif
		repeat
	endif
	waitforragdoll
	updateterrain
	goto Baildone
endscript

script Baildone 
	cancelrotatedisplayandupdatematrix
	cleareventhandlergroup `default`
	ClearAllWalkingExceptions
	onexceptionrun
	setslomo 1.0
	if NOT isrunoutbail
		waitforragdoll
		ragdoll_anim_set_state inactive
		Face_ClearAnim blendduration = 0.1
		printf channel = bail 'BailDone - Done waiting for ragdoll'
		if NOT bailhasoffworldflag
			if NOT ragdoll_isrigidbodyposedriven
				wait 1.0 seconds
				ragdollbailrecovery
				bailorienttobones
				Ragoll_Bail_Get_Orientation
				printf "ANIM:  Bail_Getup_Anims"
				Bail_PlayGetupAnim anim_struct = ($Bail_Getup_Anims.<orientation>) blendduration = 0.4 speed = 1.0
				ragdoll_blendtoinactive blendduration = 0.6
				wait 1.0 seconds
			endif
			setbailrecovery
			baillerptoground 1
			notinbail
			setstate ground
			wait 2.7 second
			ragdollbaildeactivate
			unpausephysics
			spawnterrainsound action = stopsounds
			skaterloopingsound_settag terrainsound_oldterrainsfxid = none
			settags TagSlideFallFlag = 0
			skaterloopingsound_settag tagslidefallvelocity = -1
			skaterloopingsound_settag tagslidefallterrain = -1
			getsingletag rotaterollout
			if (<rotaterollout> = 1)
				rotate
			endif
			settags doingrollout = 0
			SetRollingFriction 0.15
			boardrotate normal
			bashoff
		endif
		unpausephysics
		SetRollingFriction `default`
	endif
	PostBailDone
endscript

script PostBailDone 
	printf channel = bail 'BailDone - Deactivating...'
	cancelrotatedisplayandupdatematrix
	physicsbaildone
	baillerptoground 0
	obj_restoreboundingsphere
	ragdoll_anim_set_state inactive
	ClearLipCombos
	NotifyBailDone
	setextrapush radius = 0
	SetRollingFriction `default`
	cleartrickqueue
	cleareventbuffer
	clearmanualtrick
	killextratricks
	enableplayerinput
	notinbail
	cleargaptricks
	ClearSkaterFlags
	lockvelocitydirection off
	restoreautokick
	canbrakeon
	Face_ClearAnim
	clearbailrecovery
	launchevent type = finished_bailing
	bailoff
	notinbail
	LaunchStateChangeEvent state = Skater_InBail
	InitializeStateChangeEvent
	unpausephysics
	updateterrain
	enablecameracontrol
	getsingletag walkingbail
	if NOT gotparam walkingbail
		<walkingbail> = 0
	endif
	if NOT (<walkingbail> = 1)
		if gotparam SkaterInit
			turntofacevelocity
			setspeed 7.5
			SwitchOnBoard
			MakeSkaterGoto SkaterInit params = {no_lurch = 1}
		else
			MakeSkaterGoto StoppedState params = {no_init = 1 from_bail = 1 dont_interrupt_current_animation = true}
		endif
	else
		SwitchOnBoard
		if gotparam SkaterInit
			MakeSkaterGoto SkaterInit params = {no_lurch = 1 walk}
		else
			CleanUp_WalkingtoSkating
		endif
	endif
endscript

script BailSkaterTricks 
	cleargaptricks
	if NOT gotparam \{recursive_general_bail_call}
		clearpanel_bailed
	endif
endscript

script SteepGroundBailTimer 
	settags \{allow_steep_bail = 0}
	wait \{0.25
		seconds}
	settags \{allow_steep_bail = 1}
endscript

script Bail_WaitAnim \{percent = 100}
	GetCurrentAnimLength
	time_to_wait = (<percent> * 0.01 * <length>)
	time_waited = 0.0
	begin
	if Skater_AnimComplete
		break
	endif
	if (<time_waited> > <time_to_wait>)
		break
	endif
	Ragdoll_Bail_Check_Instant_Getup
	getframelength
	time_waited = (<time_waited> + <frame_length>)
	wait \{1
		frame}
	repeat
endscript

script Bail_WaitAnimFinished 
	begin
	if Skater_AnimComplete
		break
	endif
	Ragdoll_Bail_Check_Instant_Getup
	wait \{1
		frame}
	repeat
endscript

script bailcollision 
	if NOT isrunoutbail
		printf \{"BailCollision"}
		ragdoll_setbaseragdolldrivestate \{$RagdollDriveParams_Standard
			blend_duration = 0}
		ragdoll_setstate \{state = physical_motion_ragdoll_driven_pose_used}
	endif
endscript
bail_getup_anim_tree = {
	type = skaterflip
	[
		{
			type = ik
			two_bone_chains = Skater_IK_Params
			[
				{
					type = timer_type
					speed = speed
					anim = default_anim
					id = bodytimer
					anim_events = on
					[
						{
							type = nestedtree
							tree = Bail_Getup_Slope_Branch
							user_params = {
								slope_default = default_anim
								slope_forward = f_anim
								slope_back = b_anim
								slope_left = l_anim
								slope_right = r_anim
							}
						}
					]
				}
			]
		}
	]
}
Bail_Getup_Slope_Branch = {
	type = applydifference
	[
		{
			type = modulate
			strength = 1
			[
				{
					type = add
					[
						{
							type = add
							[
								{
									type = skatermodulate
									timertype = slope
									slope_dir = forward
									max_slope = 45
									[
										{
											type = source
											anim = slope_forward
										}
									]
								}
								{
									type = skatermodulate
									timertype = slope
									slope_dir = back
									max_slope = 45
									[
										{
											type = source
											anim = slope_back
										}
									]
								}
							]
						}
						{
							type = add
							[
								{
									type = skatermodulate
									timertype = slope
									slope_dir = left
									max_slope = 45
									[
										{
											type = source
											anim = slope_left
										}
									]
								}
								{
									type = skatermodulate
									timertype = slope
									slope_dir = right
									max_slope = 45
									[
										{
											type = source
											anim = slope_right
										}
									]
								}
							]
						}
					]
				}
			]
		}
		{
			type = source
			anim = slope_default
		}
	]
}
Bail_Getup_Fast_Anims = {
	forward = {
		default_anim = SK8_Gup_Sprawled_xFwx
		f_anim = SK8_Gup_Sprawled_Slope_F_xDFwx
		b_anim = SK8_Gup_Sprawled_Slope_B_xDFwx
		l_anim = SK8_Gup_Sprawled_Slope_L_xDFwx
		r_anim = SK8_Gup_Sprawled_Slope_R_xDFwx
	}
	back = {
		default_anim = SK8_Gup_Sprawled_xBkx
		f_anim = SK8_Gup_Sprawled_Slope_F_xDBkx
		b_anim = SK8_Gup_Sprawled_Slope_B_xDBkx
		l_anim = SK8_Gup_Sprawled_Slope_L_xDBkx
		r_anim = SK8_Gup_Sprawled_Slope_R_xDBkx
	}
	left = {
		default_anim = SK8_Gup_Fetal_xLx
		f_anim = SK8_Gup_Fetal_Slope_F_xDLx
		b_anim = SK8_Gup_Fetal_Slope_B_xDLx
		l_anim = SK8_Gup_Fetal_Slope_L_xDLx
		r_anim = SK8_Gup_Fetal_Slope_R_xDLx
	}
	right = {
		default_anim = SK8_Gup_Fetal_xRx
		f_anim = SK8_Gup_Fetal_Slope_F_xDRx
		b_anim = SK8_Gup_Fetal_Slope_B_xDRx
		l_anim = SK8_Gup_Fetal_Slope_L_xDRx
		r_anim = SK8_Gup_Fetal_Slope_R_xDRx
	}
}
Bail_Getup_Anims = {
	forward = {
		default_anim = SK8_Gup_Sprawled_F_Slow_F
		f_anim = SK8_Gup_Sprawled_F_Slow_Slope_F_D
		b_anim = SK8_Gup_Sprawled_F_Slow_Slope_B_D
		l_anim = SK8_Gup_Sprawled_F_Slow_Slope_L_D
		r_anim = SK8_Gup_Sprawled_F_Slow_Slope_R_D
	}
	back = {
		default_anim = SK8_Gup_Sprawled_B_Slow_F
		f_anim = SK8_Gup_Sprawled_B_Slow_Slope_F_D
		b_anim = SK8_Gup_Sprawled_B_Slow_Slope_B_D
		l_anim = SK8_Gup_Sprawled_B_Slow_Slope_L_D
		r_anim = SK8_Gup_Sprawled_B_Slow_Slope_R_D
	}
	left = {
		default_anim = SK8_Gup_Fetal_L_Slow_F
		f_anim = SK8_Gup_Fetal_L_Slow_Slope_F_D
		b_anim = SK8_Gup_Fetal_L_Slow_Slope_B_D
		l_anim = SK8_Gup_Fetal_L_Slow_Slope_L_D
		r_anim = SK8_Gup_Fetal_L_Slow_Slope_R_D
	}
	right = {
		default_anim = SK8_Gup_Fetal_R_Slow_F
		f_anim = SK8_Gup_Fetal_R_Slow_Slope_F_D
		b_anim = SK8_Gup_Fetal_R_Slow_Slope_B_D
		l_anim = SK8_Gup_Fetal_R_Slow_Slope_L_D
		r_anim = SK8_Gup_Fetal_R_Slow_Slope_R_D
	}
}
Bail_Writhe_Anims = {
	forward = {
		default_anim = SK8_Bail_Write_Sprawled_F_F
		f_anim = SK8_Gup_Sprawled_Slope_F_xDFwx
		b_anim = SK8_Gup_Sprawled_Slope_B_xDFwx
		l_anim = SK8_Gup_Sprawled_Slope_L_xDFwx
		r_anim = SK8_Gup_Sprawled_Slope_R_xDFwx
	}
	back = {
		default_anim = SK8_Bail_Write_Sprawled_B_F
		f_anim = SK8_Gup_Sprawled_Slope_F_xDBkx
		b_anim = SK8_Gup_Sprawled_Slope_B_xDBkx
		l_anim = SK8_Gup_Sprawled_Slope_L_xDBkx
		r_anim = SK8_Gup_Sprawled_Slope_R_xDBkx
	}
	left = {
		default_anim = SK8_Bail_Write_Fetal_L_F
		f_anim = SK8_Gup_Fetal_Slope_F_xDLx
		b_anim = SK8_Gup_Fetal_Slope_B_xDLx
		l_anim = SK8_Gup_Fetal_Slope_L_xDLx
		r_anim = SK8_Gup_Fetal_Slope_R_xDLx
	}
	right = {
		default_anim = SK8_Bail_Write_Fetal_R_F
		f_anim = SK8_Gup_Fetal_Slope_F_xDRx
		b_anim = SK8_Gup_Fetal_Slope_B_xDRx
		l_anim = SK8_Gup_Fetal_Slope_L_xDRx
		r_anim = SK8_Gup_Fetal_Slope_R_xDRx
	}
}

script Bail_PlayGetupAnim \{speed = 1.0
		blendduration = 0.3
		timer_type = play}
	anim_command {
		target = body
		command = degenerateblend_addbranch
		params = {
			tree = $bail_getup_anim_tree
			blendduration = <blendduration>
			params = {
				<anim_struct>
				speed = <speed>
				timer_type = <timer_type>
			}
		}
	}
endscript
bail_anim_tree = {
	type = skaterflip
	[
		{
			type = play_type
			speed = speed
			anim = bail_anim
			id = bodytimer
			anim_events = on
			[
				{
					type = source
					anim = bail_anim
				}
			]
		}
	]
}

script Bail_PlayAnim speed = 1 blendduration = 0.0 finger_anim = Sk8_HND_RelaxPose_P finger_speed = 1.0
	play_type = play
	if gotparam cycle
		play_type = cycle
	endif
	anim_command {
		target = body
		command = degenerateblend_addbranch
		params = {
			tree = $bail_anim_tree
			blendduration = <blendduration>
			params = {
				bail_anim = <anim>
				finger_anim = <finger_anim>
				finger_speed = <finger_speed>
				speed = <speed>
				play_type = <play_type>
			}
		}
	}
endscript

script BloodOn \{size = 1
		radius = 1
		bone = bone_head}
endscript

script BloodOn_Down \{size = 1
		radius = 1
		name = blood_01
		bone = bone_head}
endscript

script BloodCar \{bone = bone_head}
endscript

script BloodJackAss 
endscript

script BloodSmall \{bone = bone_head}
endscript

script BloodTiny \{bone = bone_head}
endscript

script BloodSuperTiny \{bone = bone_head}
endscript

script BloodSplat 
	if NOT getglobalflag \{flag = $BLOOD_OFF}
	endif
endscript

script SwitchOnBoard 
	if NOT islocalskater
		return
	endif
	if getglobalflag \{flag = $CHEAT_INVISIBLE_BOARD}
		return
	endif
	if isforcewalkon
		switchonatomic \{cas_board}
	else
		if NOT IsBoardMissing
			if atomicishidden \{cas_board}
				switchonatomic \{cas_board}
			endif
		else
			SwitchOffBoard
		endif
	endif
	obj_getid
	manglechecksums a = bailboard b = <objid>
	if objectexists id = <mangled_id>
		<mangled_id> :die
	endif
endscript
BailBoardComponents = [
	{
		component = rigidbody
		contacts = [
			(0.1, 0.125, 0.45000002)
			(0.1, 0.125, -0.45000002)
			(-0.1, 0.125, 0.45000002)
			(-0.1, 0.125, -0.45000002)
			(0.1, 0.075, 0.32500002)
			(0.1, 0.075, -0.32500002)
			(-0.1, 0.075, 0.32500002)
			(-0.1, 0.075, -0.32500002)
		]
		friction = 0.2
		restitution = 0.1
		max_angular_vel = 5.0
		max_linear_vel = 200.0
		linear_damping = 0.0
		angular_damping = 2.0
		sound_type = skateboard
	}
	{
		component = skeleton
		skeletonname = sk9_skater
	}
	{
		component = model
		ripplecreator
	}
	{
		component = sound
	}
	{
		component = animtree
	}
	{
		component = proximtrigger
		trigger_checksum = skateboard
		cube_length = 0.4
	}
]
BailBoardBaseTree = {
	type = source
	anim = sk9_skater_default
}

script GetRandomVector 
	getrandomvalue \{a = -1
		b = 1
		name = x}
	getrandomvalue \{a = -1
		b = 1
		name = y}
	getrandomvalue \{a = -1
		b = 1
		name = z}
	return random_vector = ((1.0, 0.0, 0.0) * <x> + (0.0, 1.0, 0.0) * <y> + (0.0, 0.0, 1.0) * <z>)
endscript

script CreateBailBoard bail_board_vel = (0.0, 0.0, 0.0) bail_board_rot_vel = (0.0, 0.0, 0.0)
	if gman_getactivatedgoalid
		if (<activated_goal_id> = m_training_revman)
			return
		endif
	endif
	obj_getid
	skater_id = <objid>
	manglechecksums a = bailboard b = <skater_id>
	bail_board_id = <mangled_id>
	if compositeobjectexists <bail_board_id>
		return
	endif
	SwitchOffBoard
	bailboard_mass = 4.5
	GetCurrentSkaterProfileIndex
	GetPlayerAppearance player = <currentskaterprofileindex>
	bone_scaling = 1.0
	if structurecontains structure = <profile> body_shape
		bod_shape = (<profile>.body_shape)
		if structurecontains structure = <bod_shape> scale
			bone_scaling = (<bod_shape>.scale)
		endif
	endif
	first_bone = (($board_bone_group) [0])
	obj_getbonescale bone = <first_bone>
	x_scale = (<scale>.(1.0, 0.0, 0.0) * <bone_scaling>)
	y_scale = (<scale>.(0.0, 1.0, 0.0) * <bone_scaling>)
	z_scale = (<scale>.(0.0, 0.0, 1.0) * <bone_scaling>)
	obj_getposition
	obj_getquat
	createcompositeobject {
		components = $BailBoardComponents
		params = {
			name = <bail_board_id>
			pos = <pos>
			orientation = <quat>
			clonefrom = <skater_id>
			mass = <bailboard_mass>
			contacts_scaling = (<x_scale> * (1.0, 0.0, 0.0) + <y_scale> * (0.0, 1.0, 0.0) + <z_scale> * (0.0, 0.0, 1.0))
		}
	}
	<bail_board_id> :anim_inittree tree = $BailBoardBaseTree
	<bail_board_id> :switchoffatomic all
	<bail_board_id> :switchonatomic cas_board
	orient object = <bail_board_id> relativeto = <skater_id> bone = bone_board_deck angles = (180.0, 270.0, 90.0) degrees offset = (-0.055, -0.005, -0.01)
	getarraysize $board_bone_group
	<index> = 0
	begin
	bone = ($board_bone_group [<index>])
	<bail_board_id> :obj_setbonescale bone = <bone> scale = <x_scale> force_update
	<index> = (<index> + 1)
	repeat <array_size>
	<bail_board_id> :obj_applyscaling scale = <board_scale>
	<skater_id> :obj_getvelocity
	rot_vel = (0.0, 0.0, 0.0)
	if flipped
		bail_board_vel = (<bail_board_vel> && (-1.0, 0.0, 0.0))
	endif
	rotatevector vector = <bail_board_vel> quat = <quat>
	vel = (<vel> + <result_vector>)
	rotatevector vector = <bail_board_rot_vel> quat = <quat>
	rot_vel = (<rot_vel> + <result_vector>)
	getrandomvalue a = 0.8 b = 1.2 name = random_vel_factor
	vel = (<random_vel_factor> * <vel>)
	getrandomvalue a = 0 b = 3 name = random_vel_addition
	GetRandomVector
	vel = (<vel> + <random_vel_addition> * <random_vector>)
	getrandomvalue a = 0 b = 6 name = random_rot_vel
	GetRandomVector
	rot_vel = (<rot_vel> + <random_rot_vel> * <random_vector>)
	<bail_board_id> :rigidbody_setlinearvelocity vel = <vel>
	<bail_board_id> :rigidbody_setangularvelocity vel = <rot_vel>
endscript

script waitandkilltantrumboard 
	wait \{6
		seconds}
	BailBoard_cleanup id = <id>
endscript

script BailBoard_cleanup \{id = bailboard}
	if objectexists id = <id>
		<id> :die
	endif
endscript

script SwitchOffBoard 
	switchoffatomic \{cas_board}
	switchoffatomic \{ped_board}
	obj_getid
	manglechecksums a = bailboard b = <objid>
	if objectexists id = <mangled_id>
		<mangled_id> :die
	endif
endscript

script HideBailBoards 
	iplayer = 0
	begin
	manglechecksums a = bailboard b = <iplayer>
	if objectexists id = <mangled_id>
		<mangled_id> :hide
	endif
	iplayer = (<iplayer> + 1)
	repeat 16
endscript

script FixBadBailBoards 
	iplayer = 0
	begin
	manglechecksums a = bailboard b = <iplayer>
	if objectexists id = <mangled_id>
		<mangled_id> :switchoffatomic all
		<mangled_id> :switchonatomic cas_board
		<mangled_id> :unhide
	endif
	iplayer = (<iplayer> + 1)
	repeat 16
endscript

script CarBail 
	stopbalancetrick
	inbail
	obj_spawnscriptlater \{BloodCar}
	goto \{NoseManualBail}
endscript

script nttbail_camera_timeout 
	disablecameracontrol
	wait \{3
		seconds}
	enablecameracontrol
endscript
