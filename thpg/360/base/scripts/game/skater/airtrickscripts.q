COOL_SPECIAL_TRICKS = 0
BIGDROP = 0
BIGDROP_CAM2 = 0

script fliptrick speed = 1.0 trickslack = 10 grindslack = 25 flip_stat_mod = 1.0
	if gotparam SH_Drop
		if gamemodeequals is_scavenger_hunt
			vibrate actuator = 1 percent = 80 duration = 0.25
			clientdropshobject
		endif
	endif
	LaunchStateChangeEvent state = Skater_InAir
	LaunchSubStateEntryEvent SubState = flip
	onexitrun ExitFlipTrick
	cleartricksfrom Jumptricks Jumptricks
	if gotparam FromGroundGone
		seteventhandler event = Ollied scr = TrickOllie response = call_script
	else
		cleareventhandler Ollied
		onexceptionrun
	endif
	killextratricks
	bailon
	if gotparam nospin
		nospin
	endif
	if gotparam RevertFS
		obj_setflag $FLAG_SKATER_REVERTFS
	endif
	if gotparam RevertBS
		obj_setflag $FLAG_SKATER_REVERTBS
	endif
	blendperiod = 0.2
	ExtraBlendPeriod = 0.05
	anim_getanimlength anim = (<AnimData>.tricktakeoff_anim)
	addtocumulativerecord ability = fliptrick score = 1
	if gotparam isextra
		Skater_PlayFlipTrickAnim <AnimData> isextra
	else
		Skater_PlayFlipTrickAnim <AnimData>
	endif
	if gotparam extratricks
		setextratricks tricks = <extratricks> duration = 14
	endif
	if gotparam FromGroundGone
		WaitFramesLateOllie frames = 15
		cleareventhandler Ollied
		onexceptionrun
		if NOT (<frames> = 0)
			wait <frames> frames
		endif
	else
		wait 15 frames
	endif
	if gotparam boardrotate
		if NOT isboardrotateafterset
			boardrotateafter
		else
			unsetboardrotateafter
		endif
	endif
	if gotparam rotateafter
		if NOT isrotateafterset
			rotateafter
		else
			unsetrotateafter
		endif
	endif
	if gotparam flipafter
		if NOT isflipafterset
			flipafter
		else
			unsetflipafter
		endif
	endif
	settrickname <name>
	settrickscore <score>
	display
	if gotparam isextra
		LaunchExtraMessage
	endif
	if gotparam isspecial
		LaunchSpecialMessage Cool
		broadcastevent type = SkaterEnterSpecialTrick
	endif
	if gotparam BloodFrame
		wait <BloodFrame> frames
		if gotparam GutsSound
			soundevent event = fliptrick_bail_bloodframe_sfx
		else
			soundevent event = fliptrick_bail_slap_sfx
		endif
		BloodSplat
		obj_spawnscriptlater BloodJackAss
		wait 1 frame
	endif
	if gotparam SpinSlack
		if (<length> > <SpinSlack>)
			Skater_WaitAnim framesfromend = <SpinSlack> timer = FliptrickTimer
			canspin
		endif
	endif
	if gotparam grindslack
		if (<length> * 60 > <grindslack>)
			Skater_WaitAnim framesfromend = <grindslack> timer = FliptrickTimer
		endif
	endif
	bailoff
	if (<length> * 60 > <trickslack>)
		Skater_WaitAnim framesfromend = <trickslack> timer = FliptrickTimer
	else
		Skater_WaitAnim framesfromend = 10 timer = FliptrickTimer
	endif
	if gotparam isspecial
		EndSpecial
	endif
	canspin
	DoNextTrick
	WaitAnimWhilstChecking timer = FliptrickTimer
	if gotparam flipafter
		goto Airborne params = {blendduration = (<AnimData>.AirOutBlendDuration)}
	else
		goto Airborne params = {no_anim blendduration = (<AnimData>.AirOutBlendDuration)}
	endif
endscript

script ExitFlipTrick 
	LaunchSubStateExitEvent \{SubState = flip}
	CleanUp_SpecialTrickParticles
endscript

script ExitFlipTrick_FullScreenEffect 
	Exit_FullscreenEffect
	ExitFlipTrick
endscript

script grabtrick x = -180 duration = 1.0 GrabTweak = $GRABTWEAK_MEDIUM waitpercent = 60 button = circle
	cleartricksfrom Jumptricks Jumptricks
	killextratricks
	clearextragrindtrick
	if gotparam FromGroundGone
		seteventhandler event = Ollied scr = TrickOllie response = call_script
	else
		cleareventhandler Ollied
		onexceptionrun
	endif
	if innollie
		flipandrotate
		nollieoff
		Skater_PlayOllieAnim $Ollie_data blendduration = 0.05
	endif
	bailon
	LaunchStateChangeEvent state = Skater_InAir
	LaunchSubStateEntryEvent SubState = Grab
	onexitrun ExitGrabTrick
	if gotparam FullScreenEffect
		<FullScreenEffect>
		onexitrun ExitGrab_FullScreenEffect
	endif
	if gotparam soundevent
		soundevent event = <soundevent>
	endif
	if gotparam extratricks
		setextratricks tricks = <extratricks> duration = 15
	endif
	if gotparam isextra
		Skater_PlayGrabTrickAnim <AnimData> isextra
	else
		Skater_PlayGrabTrickAnim <AnimData>
	endif
	if gotparam FromGroundGone
		WaitFramesLateOllie frames = 15
		cleareventhandler Ollied
		onexceptionrun
	endif
	Skater_WaitAnim percent = 50 timer = grabtrickintimer
	settrickname <name>
	settrickscore <score>
	display
	if gotparam isspecial
		LaunchSpecialMessage Cool
		broadcastevent type = SkaterEnterSpecialTrick
	endif
	if gotparam isextra
		LaunchExtraMessage
	endif
	Skater_WaitAnim timer = grabtrickintimer
	if NOT held circle
		if held square
			button = square
		endif
	endif
	killextratricks
	begin
	if released <button>
		break
	endif
	wait 1 gameframe
	if gotparam isspecial
		tweaktrick $GRABTWEAK_SPECIAL
	else
		tweaktrick <GrabTweak>
	endif
	repeat
	Skater_GrabHandleOllieModulation blendcurve = (<AnimData>.BlendOutCurve) blendtime = (<AnimData>.BlendOutTime)
	if gotparam boardrotate
		if NOT isboardrotateafterset
			boardrotateafter
		else
			unsetboardrotateafter
		endif
	endif
	if gotparam trickslack
		Skater_WaitAnim framesfromend = <trickslack> timer = GrabtrickTimer
	endif
	bailoff
	if gotparam isspecial
		EndSpecial
	endif
	if gotparam flipafter
		flipafter
	endif
	if gotparam rotateafter
		rotateafter
	endif
	WaitAnimWhilstChecking timer = GrabtrickTimer
	goto Airborne params = {no_anim}
endscript

script ExitGrabTrick 
	LaunchSubStateExitEvent \{SubState = Grab}
	CleanUp_SpecialTrickParticles
endscript

script ExitGrab_FullScreenEffect 
	Exit_FullscreenEffect
	ExitGrabTrick
endscript

script Air_To_Tail 
	killextratricks
	cleartrickqueue
	nospin
	cleareventhandler \{airtotail}
	onexceptionrun
	wait \{10
		gameframes}
	enterairtotail
	seteventhandler \{event = exitairtotail
		scr = Air_To_Tail_exit_in_air
		response = switch_script}
endscript

script Air_To_Tail_exit_in_air 
	cleareventhandler \{exitairtotail}
	onexceptionrun
	cleartrickqueue
	Air_To_Tail_score
	canspin
	seteventhandler \{event = airtotail
		scr = Air_To_Tail
		response = switch_script}
	goto \{Airborne}
endscript

script Air_To_Tail_score 
	settrickname \{"To Tail"}
	settrickscore \{500}
	display
	soundevent \{event = air_to_tail_sfx}
endscript
