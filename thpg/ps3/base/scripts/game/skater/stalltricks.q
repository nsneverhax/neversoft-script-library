
script StallTrick speed = 1.0 type = Grind
	clearstallscriptflag
	if bailison
		setstate air
		goto SkateInOrBail
		killspawnedscript name = Stall_Sfx_Logic
	endif
	killextratricks
	bailoff
	cleareventhandlergroup `default`
	onexceptionrun
	cleartrickqueue
	setqueuetricks NoTricks
	seteventhandler event = offmetertop scr = SkateInOrBail response = switch_script params = {<...> FallingLeft}
	seteventhandler event = offmeterbottom scr = SkateInOrBail response = switch_script params = {<...> Fallingright}
	seteventhandler event = skatercollidebail scr = skatercollidebail response = switch_script
	seteventhandler event = madeotherskaterbail scr = MadeOtherSkaterBail_Called response = call_script
	setqueuetricks NoTricks
	seteventhandler event = Ollied scr = StallOllieOut response = switch_script params = {<...>}
	settags OutAnim = <OutAnim> InitAnim = <InitAnim> InitSpeed = <InitSpeed> anim = <anim> OneFoot = <OneFoot>
	if gotparam isspecial
		broadcastevent type = SkaterEnterSpecialTrick
		onexitrun Exit_Special
	endif
	LaunchStateChangeEvent state = Skater_OnRail
	dobalancetrick buttona = right buttonb = left type = <type> playrangeanimbackwards
	apply_acid_drop_cheese
	if NOT gotparam stall_name
		formattext textname = stall_name "%n Stall" n = <name>
	endif
	settrickname <stall_name>
	settrickscore <score>
	if gotparam isextra
		sync = 1
		isextra = 1
	else
		sync = 0
	endif
	Skater_PlayGrindAnim <AnimData> sync = <sync> isextra = <isextra>
	spawnterrainsound action = grindon
	spawnscriptnow Stall_Sfx_Logic
	display blockspin
	if NOT onstall
		if NOT onrail
			stopbalancetrick
			goto Airborne
		endif
	endif
	wait 0.5 seconds
	if gotparam extratricks
		setextratricks tricks = <extratricks> ignore = <name>
	endif
	begin
	tweaktrick 10
	wait 1 gameframe
	if NOT onstall
		if NOT onrail
			stopbalancetrick
			if onground
				landskatertricks
				goto ongroundai
			else
				goto Airborne
			endif
		endif
	endif
	repeat
endscript

script PlayStallBalancingAnim 
	dobalancetrick buttona = right buttonb = left type = <type> playrangeanimbackwards
	skater_playanim anim = <anim> wobble from = end to = start speed = <speed>
	if gotparam \{idle}
		skater_playanim anim = <anim> cycle speed = <speed>
	endif
endscript

script StallOllieOut 
	stopbalancetrick
	killextratricks
	NoRailTricks
	move z = 0.025
	move y = 0.15
	if gotparam boardrotate
		boardrotateafter
	endif
	if gotparam FlipOnOllie
		flipafter
	endif
	if gotparam RotateOnOllie
		rotateafter
	endif
	spawnterrainsound action = grindoff
	killspawnedscript name = Stall_Sfx_Logic
	if issoundplaying $truck_sfx_name
		stopsound $truck_sfx_name
	endif
	if handlelipolliedirection
		ClearLipCombos
		AllowRailTricks
		resetlandedfromvert
	else
		ClearLipCombos
		AllowRailTricks
		resetlandedfromvert
	endif
	ExitPointRailSpin stall = true
endscript
stalltricklist = grindtricklist
