LIPTRICK_DISPLAY_WAIT = 15
DefaultLipTrick = {
	name = "Invert"
	score = 450
	AnimData = $invert_data
	flipafter
	RevertBS
	extratricks = InvertExtras
}
Trick_Invert = {
	scr = InvertTrick
	params = {
		name = "Invert"
		score = 450
		AnimData = $invert_data
		flipafter
		RevertBS
		extratricks = InvertExtras
	}
}
Trick_SadPlant = {
	scr = InvertTrick
	params = {
		name = "SadPlant"
		score = 450
		AnimData = $SadPlant_data
		flipafter
		RevertBS
		extratricks = SadplantExtras
	}
}
Trick_Gymnast = {
	scr = InvertTrick
	params = {
		name = "Gymnast"
		score = 450
		AnimData = $Gymnast_data
		flipafter
		RevertBS
		extratricks = GymnastExtras
	}
}
Trick_Tailbone = {
	scr = InvertTrick
	params = {
		name = "Tailbone"
		score = 450
		AnimData = $Tailbone_data
		flipafter
		RevertBS
		extratricks = TailboneExtras
	}
}
Trick_OneFootInvert = {
	scr = InvertTrick
	params = {
		name = "OneFoot Invert"
		score = 450
		AnimData = $OneFootInvert_data
		RevertBS
		extratricks = OneFootInvertExtras
	}
}
Trick_Andrecht = {
	scr = InvertTrick
	params = {
		name = "Andrecht"
		score = 450
		AnimData = $Andrecht_data
		flipafter
		RevertBS
		extratricks = InvertExtras
	}
}
Trick_Eggplant = {
	scr = InvertTrick
	params = {
		name = "Eggplant"
		score = 1500
		isspecial
		AnimData = $Eggplant_data
		flipafter
		RevertBS
	}
}
Trick_KFAndrecht = {
	scr = InvertTrick
	params = {
		name = "Kickflip to Andrecht"
		score = 1500
		isspecial
		AnimData = $KFAndrecht_data
		flipafter
		RevertBS
		extratricks = InvertExtras
	}
}
Trick_Losi = {
	scr = InvertTrick
	params = {
		name = "Losi"
		score = 1500
		AnimData = $Losi_data
		RevertBS
		isspecial
	}
}
Trick_MillerFlip = {
	scr = InvertTrick
	params = {
		name = "Miller Flip"
		score = 1500
		isspecial
		AnimData = $MillerFlip_data
		RevertBS
	}
}
Trick_FSInvert = {
	scr = InvertTrick
	params = {
		name = "FrontSide Invert"
		score = 1500
		isspecial
		AnimData = $FSInvert_data
		flipafter
		RevertBS
	}
}
SpecialLipTricks = [
	{
		trigger = {
			TripleInOrder
			up
			right
			triangle
			1000
		}
		trickslot = SpLip_U_R_Triangle
	}
	{
		trigger = {
			TripleInOrder
			up
			down
			triangle
			1000
		}
		trickslot = SpLip_U_D_Triangle
	}
	{
		trigger = {
			TripleInOrder
			up
			left
			triangle
			1000
		}
		trickslot = SpLip_U_L_Triangle
	}
	{
		trigger = {
			TripleInOrder
			right
			up
			triangle
			1000
		}
		trickslot = SpLip_R_U_Triangle
	}
	{
		trigger = {
			TripleInOrder
			right
			down
			triangle
			1000
		}
		trickslot = SpLip_R_D_Triangle
	}
	{
		trigger = {
			TripleInOrder
			right
			left
			triangle
			1000
		}
		trickslot = SpLip_R_L_Triangle
	}
	{
		trigger = {
			TripleInOrder
			down
			up
			triangle
			1000
		}
		trickslot = SpLip_D_U_Triangle
	}
	{
		trigger = {
			TripleInOrder
			down
			right
			triangle
			1000
		}
		trickslot = SpLip_D_R_Triangle
	}
	{
		trigger = {
			TripleInOrder
			down
			left
			triangle
			1000
		}
		trickslot = SpLip_D_L_Triangle
	}
	{
		trigger = {
			TripleInOrder
			left
			up
			triangle
			1000
		}
		trickslot = SpLip_L_U_Triangle
	}
	{
		trigger = {
			TripleInOrder
			left
			right
			triangle
			1000
		}
		trickslot = SpLip_L_R_Triangle
	}
	{
		trigger = {
			TripleInOrder
			left
			down
			triangle
			1000
		}
		trickslot = SpLip_L_D_Triangle
	}
	{
		trigger = {
			TripleInOrder
			a = up
			b = up
			triangle
			1000
		}
		trickslot = SpLip_U_U_Triangle
	}
]
liptricks = [
	{
		trigger = {
			Press
			upleft
			500
		}
		trickslot = Lip_TriangleUL
	}
	{
		trigger = {
			Press
			upright
			500
		}
		trickslot = Lip_TriangleUR
	}
	{
		trigger = {
			Press
			downleft
			500
		}
		trickslot = Lip_TriangleDL
	}
	{
		trigger = {
			Press
			downright
			500
		}
		trickslot = Lip_TriangleDR
	}
	{
		trigger = {
			Press
			left
			500
		}
		trickslot = Lip_TriangleL
	}
	{
		trigger = {
			Press
			right
			500
		}
		trickslot = Lip_TriangleR
	}
	{
		trigger = {
			Press
			down
			500
		}
		trickslot = Lip_TriangleD
	}
	{
		trigger = {
			Press
			up
			500
		}
		trickslot = Lip_TriangleU
	}
	{
		trigger = {
			Press
			triangle
			500
		}
		scr = InvertTrick
		params = $DefaultLipTrick
	}
]
ComboLipTricks = [
	{
		trigger = {
			Press
			upleft
			500
		}
		trickslot = Lip_TriangleUL
	}
	{
		trigger = {
			Press
			upright
			500
		}
		trickslot = Lip_TriangleUR
	}
	{
		trigger = {
			Press
			downleft
			500
		}
		trickslot = Lip_TriangleDL
	}
	{
		trigger = {
			Press
			downright
			500
		}
		trickslot = Lip_TriangleDR
	}
	{
		trigger = {
			Press
			left
			500
		}
		trickslot = Lip_TriangleL
	}
	{
		trigger = {
			Press
			right
			500
		}
		trickslot = Lip_TriangleR
	}
	{
		trigger = {
			Press
			down
			500
		}
		trickslot = Lip_TriangleD
	}
	{
		trigger = {
			Press
			up
			500
		}
		trickslot = Lip_TriangleU
	}
	{
		trigger = {
			Press
			triangle
			500
		}
		$DefaultLipTrick
	}
]
InvertExtras = [
	{
		trigger = {
			InOrder
			a = square
			b = square
			300
		}
		$Trick_SadPlant
	}
	{
		trigger = {
			InOrder
			a = circle
			b = circle
			300
		}
		$Trick_Tailbone
	}
	{
		trigger = {
			InOrder
			circle
			square
			300
		}
		$Trick_OneFootInvert
	}
	{
		trigger = {
			InOrder
			square
			circle
			300
		}
		$Trick_Gymnast
	}
]
SadplantExtras = [
	{
		trigger = {
			InOrder
			a = square
			b = square
			300
		}
		$Trick_Invert
	}
	{
		trigger = {
			InOrder
			a = circle
			b = circle
			300
		}
		$Trick_Tailbone
	}
	{
		trigger = {
			InOrder
			circle
			square
			300
		}
		$Trick_OneFootInvert
	}
	{
		trigger = {
			InOrder
			square
			circle
			300
		}
		$Trick_Gymnast
	}
]
TailboneExtras = [
	{
		trigger = {
			InOrder
			a = square
			b = square
			300
		}
		$Trick_SadPlant
	}
	{
		trigger = {
			InOrder
			a = circle
			b = circle
			300
		}
		$Trick_Invert
	}
	{
		trigger = {
			InOrder
			circle
			square
			300
		}
		$Trick_OneFootInvert
	}
	{
		trigger = {
			InOrder
			square
			circle
			300
		}
		$Trick_Gymnast
	}
]
OneFootInvertExtras = [
	{
		trigger = {
			InOrder
			a = square
			b = square
			300
		}
		$Trick_SadPlant
	}
	{
		trigger = {
			InOrder
			a = circle
			b = circle
			300
		}
		$Trick_Tailbone
	}
	{
		trigger = {
			InOrder
			circle
			square
			300
		}
		$Trick_Invert
	}
	{
		trigger = {
			InOrder
			square
			circle
			300
		}
		$Trick_Gymnast
	}
]
GymnastExtras = [
	{
		trigger = {
			InOrder
			a = square
			b = square
			300
		}
		$Trick_SadPlant
	}
	{
		trigger = {
			InOrder
			a = circle
			b = circle
			300
		}
		$Trick_Tailbone
	}
	{
		trigger = {
			InOrder
			circle
			square
			300
		}
		$Trick_OneFootInvert
	}
	{
		trigger = {
			InOrder
			square
			circle
			300
		}
		$Trick_Invert
	}
]

script liptrick params = $DefaultLipTrick
	cleareventhandlergroup `default`
	onexceptionrun
	seteventhandler event = skatercollidebail scr = skatercollidebail response = switch_script
	cleartrickqueue
	killextratricks
	cancelrotatedisplay
	if obj_flagset $FLAG_SKATER_LIPCOMBO
		setqueuetricks special = SpecialLipTricks ComboLipTricks
	else
		setqueuetricks special = SpecialLipTricks liptricks
	endif
	usegrindevents
	begin
	wait 1 gameframe
	DoNextTrick
	repeat 2
	cleareventhandlergroup `default`
	onexceptionrun
	seteventhandler event = skatercollidebail scr = skatercollidebail response = switch_script
	cleartrickqueue
	setqueuetricks NoTricks
	goto InvertTrick params = {<params>}
endscript

script InvertTrick speed = 1.0
	if bailison
		setstate air
		goto LipBail
	endif
	killextratricks
	bailoff
	setstate lip
	cleareventhandlergroup `default`
	onexceptionrun
	cleartrickqueue
	setqueuetricks NoTricks
	if obj_flagset $FLAG_SKATER_LIPTRICK_CAM_REVERSED
		seteventhandler event = offmetertop scr = LipOut response = switch_script params = {<...>}
		seteventhandler event = offmeterbottom scr = LipBail response = switch_script params = {<...>}
	else
		seteventhandler event = offmeterbottom scr = LipOut response = switch_script params = {<...>}
		seteventhandler event = offmetertop scr = LipBail response = switch_script params = {<...>}
	endif
	seteventhandler event = skatercollidebail scr = skatercollidebail response = switch_script
	seteventhandler event = madeotherskaterbail scr = MadeOtherSkaterBail_Called
	LaunchStateChangeEvent state = Skater_OnLip
	setqueuetricks NoTricks
	seteventhandler event = Ollied scr = OllieLipOut response = switch_script params = {<...>}
	getterrain
	settrickname <name>
	settrickscore <score>
	if gotparam isspecial
		broadcastevent type = SkaterEnterSpecialTrick
		onexitrun Exit_Special
	endif
	if gotparam isextra
		LaunchExtraMessage
		index = 0
		value = (<AnimData>.struct)
		index_struct = {SadPlant_data = 0 Tailbone_data = 1 OneFootInvert_data = 2 Gymnast_data = 3 invert_data = 4}
		index = (<index_struct>.<value>)
		gettransitionanimarray
		anim = (<transition_anims> [<index>])
		Skater_BlendInvertBalance blendcurve = [0.0 , 1.0] blendtime = 0.3
		Skater_PlayInvertAnim anim = <anim>
	else
		Skater_PlayInvertAnim anim = (<AnimData>.init_anim)
	endif
	if gotparam isspecial
		LaunchSpecialMessage
	endif
	if gotparam RevertFS
		obj_setflag $FLAG_SKATER_REVERTFS
	endif
	if gotparam RevertBS
		obj_setflag $FLAG_SKATER_REVERTBS
	endif
	if gotparam isextra
		skater_waitanimfinished
		rangeblendduration = 0.15
	else
		wait (<AnimData>.init_skip_time) seconds
		rangeblendduration = 0.0
	endif
	display blockspin
	if structurecontains structure = (<AnimData>) range_anim
		dobalancetrick buttona = right buttonb = left type = lip playrangeanimbackwards
		Skater_PlayInvertRangeAnim <AnimData> blendduration = <rangeblendduration>
		if gotparam extratricks
			settransitionanimarray (<AnimData>.trans_anims)
			setextratricks tricks = <extratricks> ignore = <name>
		endif
		begin
		tweaktrick 10
		wait 1 gameframe
		repeat
	else
		skater_waitanimfinished
		goto LipOut params = {<...>}
	endif
endscript

script LipOut 
	cleareventhandler Ollied
	onexceptionrun
	ClearLipCombos
	stopbalancetrick
	killextratricks
	seteventhandler event = landed scr = LipLand response = switch_script params = {<...>}
	Skater_PlayInvertAnim anim = (<AnimData>.out_anim)
	if NOT gotparam flipafter
		flipafter
	endif
	if gotparam boardrotate
		boardrotateafter
	endif
	skater_waitanimfinished
	setstate air
	rotate
	move y = 0.1
	SetSkaterVelocity vel_x = 0.0 vel_y = -8.0 vel_z = 0.0
	DoNextTrick
	NoRailTricks
	InAirExceptions
	seteventhandler event = landed scr = LipLand response = switch_script params = {<...>}
	seteventhandler event = groundgone scr = groundgone response = switch_script
	if onground
		landskatertricks
		donextmanualtrick
	else
		clearmanualtrick
	endif
	if inair
		Skater_PlayOllieAnim $Ollie_data groundgone = 1 blendduration = 0.0
		setlandedfromvert
		goto Airborne params = {no_anim = 1}
	else
		landskatertricks
		goto ongroundai
	endif
endscript

script OllieLipOut 
	cleareventhandler Ollied
	onexceptionrun
	ClearLipCombos
	stopbalancetrick
	killextratricks
	seteventhandler event = landed scr = LipLand response = switch_script params = {<...>}
	Skater_PlayInvertAnim anim = (<AnimData>.out_anim)
	if NOT gotparam flipafter
		flipafter
	endif
	if gotparam boardrotate
		boardrotateafter
	endif
	setstate air
	move z = 0.025
	move y = <y>
	trigger_jump_boost speed = 10 no_sound
	NoRailTricks
	InAirExceptions
	seteventhandler event = landed scr = LipLand response = switch_script params = {<...>}
	seteventhandler event = groundgone scr = groundgone response = switch_script
	Skater_WaitAnim percent = 50
	DoNextTrick
	skater_waitanimfinished
	rotate
	Skater_PlayOllieAnim $Ollie_data groundgone = 1 blendduration = 0.0
	if onground
		landskatertricks
		donextmanualtrick
	else
		clearmanualtrick
	endif
	if inair
		setlandedfromvert
		goto Airborne params = {no_anim = 1}
	else
		landskatertricks
		goto ongroundai
	endif
endscript

script ClearLipCombos 
	clearallowlipnogrind
	obj_clearflag \{$FLAG_SKATER_LIPCOMBO}
endscript

script LipLand 
	overridecancelground
	cleartrickqueue
	setqueuetricks \{NoTricks}
	AllowRailTricks
	rotate
	if NOT isflipafterset
		flipafter
	endif
	SetExtraTricks_Reverts
	setlandedfromvert
	goto \{land}
endscript

script LipBail 
	printf \{channel = bail
		"Lip Bail"}
	stopbalancetrick
	move \{z = 0.025}
	move \{y = 0.15}
	setstate \{air}
	if gotparam \{FlipOnOllie}
		flipafter
	endif
	if gotparam \{RotateOnOllie}
		rotateafter
	endif
	if gotparam \{BAILSCRIPT}
		goto <BAILSCRIPT>
	else
		goto \{InvertBail}
	endif
endscript

script SetUpLipCombo 
	wait \{0.3
		seconds}
	obj_setflag \{$FLAG_SKATER_LIPCOMBO}
	AllowRailTricks
	allowlipnogrind
	wait \{0.3
		seconds}
	if inair
		clearallowlipnogrind
		obj_clearflag \{$FLAG_SKATER_LIPCOMBO}
		NoRailTricks
	endif
endscript

script CopingHit \{CopingHit = 1}
	wait <CopingHit> frames
	if ((<terrain> = 3) || (<terrain> = 4))
	else
		playbonksound
	endif
endscript
