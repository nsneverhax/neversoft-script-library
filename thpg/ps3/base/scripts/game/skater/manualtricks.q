MANUAL_DISPLAY_WAIT = 25
ROTATEY_TRIGGER_TIME = 300
TRIGGER_MANUAL_BRANCHFLIP = {
	InOrder
	a = square
	b = square
	300
}
AIR_MANUAL_DURATION = 1000
AIR_MANUAL_TIMING = 400
Manual_wobble_params = {
	wobbleampa = {
		(0.05, 0.05)
		$STATS_MANUAL
	}
	wobbleampb = {
		(0.04, 0.04)
		$STATS_MANUAL
	}
	wobblek1 = {
		(0.0022, 0.0022)
		$STATS_MANUAL
	}
	wobblek2 = {
		(0.0017, 0.0017)
		$STATS_MANUAL
	}
	spazfactor = {
		(1.0, 1.0)
		$STATS_MANUAL
	}
}
SpecialManualTricks = [
	{
		trigger = {
			TripleInOrder
			up
			right
			triangle
			400
		}
		duration = 700
		trickslot = SpMan_U_R_Triangle
	}
	{
		trigger = {
			TripleInOrder
			up
			down
			triangle
			400
		}
		duration = 700
		trickslot = SpMan_U_D_Triangle
	}
	{
		trigger = {
			TripleInOrder
			up
			left
			triangle
			400
		}
		duration = 700
		trickslot = SpMan_U_L_Triangle
	}
	{
		trigger = {
			TripleInOrder
			right
			up
			triangle
			400
		}
		duration = 700
		trickslot = SpMan_R_U_Triangle
	}
	{
		trigger = {
			TripleInOrder
			right
			down
			triangle
			400
		}
		duration = 700
		trickslot = SpMan_R_D_Triangle
	}
	{
		trigger = {
			TripleInOrder
			right
			left
			triangle
			400
		}
		duration = 700
		trickslot = SpMan_R_L_Triangle
	}
	{
		trigger = {
			TripleInOrder
			down
			up
			triangle
			400
		}
		duration = 700
		trickslot = SpMan_D_U_Triangle
	}
	{
		trigger = {
			TripleInOrder
			down
			right
			triangle
			400
		}
		duration = 700
		trickslot = SpMan_D_R_Triangle
	}
	{
		trigger = {
			TripleInOrder
			down
			left
			triangle
			400
		}
		duration = 700
		trickslot = SpMan_D_L_Triangle
	}
	{
		trigger = {
			TripleInOrder
			left
			up
			triangle
			400
		}
		duration = 700
		trickslot = SpMan_L_U_Triangle
	}
	{
		trigger = {
			TripleInOrder
			left
			right
			triangle
			400
		}
		duration = 700
		trickslot = SpMan_L_R_Triangle
	}
	{
		trigger = {
			TripleInOrder
			left
			down
			triangle
			400
		}
		duration = 700
		trickslot = SpMan_L_D_Triangle
	}
]
manualtricks = [
	{
		trigger = {
			InOrder
			up
			down
			400
		}
		duration = 700
		$Trick_Manual
	}
	{
		trigger = {
			InOrder
			down
			up
			400
		}
		duration = 700
		$Trick_NoseManual
	}
	{
		trigger = {
			inorderwithlockout
			tiltimpulseup
			tiltimpulsedown
			220
			100
		}
		duration = 700
		$Trick_Manual
	}
	{
		trigger = {
			inorderwithlockout
			tiltimpulsedown
			tiltimpulseup
			220
			100
		}
		duration = 700
		$Trick_NoseManual
	}
	{
		trigger = {
			InOrder
			up
			downright
			400
		}
		duration = 700
		$Trick_Manual
	}
	{
		trigger = {
			InOrder
			up
			downleft
			400
		}
		duration = 700
		$Trick_Manual
	}
	{
		trigger = {
			InOrder
			down
			upright
			400
		}
		duration = 700
		$Trick_NoseManual
	}
	{
		trigger = {
			InOrder
			down
			upleft
			400
		}
		duration = 700
		$Trick_NoseManual
	}
	{
		trigger = {
			InOrder
			upleft
			down
			400
		}
		duration = 700
		$Trick_Manual
	}
	{
		trigger = {
			InOrder
			upright
			down
			400
		}
		duration = 700
		$Trick_Manual
	}
	{
		trigger = {
			InOrder
			downleft
			up
			400
		}
		duration = 700
		$Trick_NoseManual
	}
	{
		trigger = {
			InOrder
			downright
			up
			400
		}
		duration = 700
		$Trick_NoseManual
	}
]
GroundManualTricks = [
	{
		trigger = {
			InOrder
			up
			down
			220
		}
		$Trick_Manual
	}
	{
		trigger = {
			InOrder
			down
			up
			220
		}
		$Trick_NoseManual
	}
	{
		trigger = {
			inorderwithlockout
			tiltimpulseup
			tiltimpulsedown
			220
			100
		}
		$Trick_Manual
	}
	{
		trigger = {
			inorderwithlockout
			tiltimpulsedown
			tiltimpulseup
			220
			100
		}
		$Trick_NoseManual
	}
	{
		trigger = {
			InOrder
			up
			downright
			220
		}
		$Trick_Manual
	}
	{
		trigger = {
			InOrder
			up
			downleft
			220
		}
		$Trick_Manual
	}
	{
		trigger = {
			InOrder
			down
			upright
			220
		}
		$Trick_NoseManual
	}
	{
		trigger = {
			InOrder
			down
			upleft
			220
		}
		$Trick_NoseManual
	}
	{
		trigger = {
			InOrder
			upleft
			down
			220
		}
		$Trick_Manual
	}
	{
		trigger = {
			InOrder
			upright
			down
			220
		}
		$Trick_Manual
	}
	{
		trigger = {
			InOrder
			downleft
			up
			220
		}
		$Trick_NoseManual
	}
	{
		trigger = {
			InOrder
			downright
			up
			220
		}
		$Trick_NoseManual
	}
]
GroundRevertManualTricks = [
	{
		trigger = {
			InOrder
			up
			down
			220
		}
		$Trick_Manual
	}
	{
		trigger = {
			InOrder
			down
			up
			220
		}
		$Trick_Manual
	}
	{
		trigger = {
			inorderwithlockout
			tiltimpulseup
			tiltimpulsedown
			220
			80
		}
		$Trick_Manual
	}
	{
		trigger = {
			inorderwithlockout
			tiltimpulsedown
			tiltimpulseup
			220
			80
		}
		$Trick_NoseManual
	}
]
Trick_Manual = {
	scr = Manual
	params = {
		name = "Manual"
		score = 100
		AnimData = $manual_data
		ExtraTricks2 = ManualBranches
		extratricks = FlatlandBranches
		CheckCheese
		AllowWallpush
	}
}
Trick_NoseManual = {
	scr = nosemanual
	params = {
		name = "Nose Manual"
		score = 100
		AnimData = $nosemanual_data
		ExtraTricks2 = NoseManualBranches
		extratricks = FlatlandBranches
		CheckCheese
		AllowWallpush
	}
}
Trick_DogWalk = {
	scr = flatland
	params = {
		name = "Dog Walk"
		score = 1500
		isspecial
		AnimData = $Rodney_data
		CheckCheese
	}
}
Trick_RussianBoneless = {
	scr = flatland
	params = {
		name = "Russian Boneless"
		score = 1500
		isspecial
		AnimData = $MikeV_data
		CheckCheese
	}
}
Trick_NosegrabManual = {
	scr = flatland
	params = {
		name = "One Foot Nosegrab Manual"
		score = 1500
		isspecial
		AnimData = $Staab_data
		CheckCheese
	}
}
Trick_MoshManual = {
	scr = flatland
	params = {
		name = "Mosh Manual"
		score = 1500
		isspecial
		AnimData = $Mosh_data
		CheckCheese
		bodycheck
	}
}
Trick_NTMSpecial = {
	scr = flatland
	params = {
		callback = NTMSpecialScript
		name = "Nail The Manual"
		score = 1500
		isspecial
		AnimData = $manual_data
		CheckCheese
		dont_score
	}
}
Trick_LuchadorSpecial = {
	scr = flatland
	params = {
		callback = LuchadorSpecialScript
		name = "Luchador"
		score = 1500
		isspecial
		AnimData = $manual_data
		CheckCheese
		dont_score
	}
}
Trick_NoComplyManual = {
	scr = flatland
	params = {
		callback = NoComplyManual
		name = "No Comply Manual"
		score = 1500
		isspecial
		AnimData = $manual_data
		CheckCheese
		dont_score
	}
}
Trick_MCASpecialManual = {
	scr = flatland
	params = {
		name = "MCA Manual"
		score = 1500
		isspecial
		AnimData = $MCA_data
		CheckCheese
	}
}
FlatlandBranches = [
	{
		trigger = {
			InOrder
			square
			circle
			300
		}
		$Trick_AntiCasper
	}
	{
		trigger = {
			InOrder
			square
			circle
			300
		}
		$Trick_NoseManual
	}
	{
		trigger = {
			InOrder
			square
			triangle
			300
		}
		$Trick_Casper
	}
	{
		trigger = {
			InOrder
			square
			triangle
			300
		}
		$Trick_Manual
	}
	{
		trigger = {
			InOrder
			circle
			square
			300
		}
		$Trick_Rail
	}
	{
		trigger = {
			InOrder
			circle
			square
			300
		}
		$Trick_Manual
	}
	{
		trigger = {
			InOrder
			circle
			triangle
			300
		}
		$Trick_OneFootManual
	}
	{
		trigger = {
			InOrder
			circle
			triangle
			300
		}
		$Trick_OneFootNosemanual
	}
	{
		trigger = {
			InOrder
			a = triangle
			b = triangle
			300
		}
		$Trick_Pogo
	}
	{
		trigger = {
			InOrder
			a = triangle
			b = triangle
			300
		}
		$Trick_Manual
	}
	{
		trigger = {
			InOrder
			triangle
			square
			300
		}
		$Trick_Truckstand
	}
	{
		trigger = {
			InOrder
			triangle
			square
			300
		}
		$Trick_Manual
	}
	{
		trigger = {
			InOrder
			triangle
			circle
			300
		}
		$Trick_SwitchFootPogo
	}
	{
		trigger = {
			InOrder
			triangle
			circle
			300
		}
		$Trick_Manual
	}
	{
		trigger = {
			InOrder
			a = circle
			b = circle
			300
		}
		$Trick_CrossfootPogo
	}
	{
		trigger = {
			InOrder
			a = circle
			b = circle
			300
		}
		$Trick_Manual
	}
	{
		trigger = {
			TripleInOrder
			left
			right
			square
			500
		}
		$Trick_Spacewalk
	}
]
Trick_Casper = {
	scr = flatland
	params = {
		name = "Casper"
		score = 1100
		AnimData = $Casper_Data
		offmeterbottom = NoseManualBail
		boardrotate
		extratricks = FlatlandBranches
		ExtraTricks2 = CasperBranches
	}
}
Trick_AntiCasper = {
	scr = flatland
	params = {
		name = "Anti Casper"
		score = 1100
		AnimData = $AntiCasper_Data
		Nollie
		boardrotate
		extratricks = FlatlandBranches
		ExtraTricks2 = AntiCasperBranches
	}
}
Trick_SwitchFootPogo = {
	scr = flatland
	params = {
		name = "Switch Foot Pogo"
		score = 800
		AnimData = $SwitchFootPogo_Data
		extratricks = FlatlandBranches
		ExtraTricks2 = SwitchFootPogo_Branches
	}
}
Trick_Pogo = {
	scr = flatland
	params = {
		name = "Pogo"
		score = 750
		AnimData = $Pogo_Data
		extratricks = FlatlandBranches
		boardrotate
		ExtraTricks2 = PogoBranches
	}
}
Trick_Rail = {
	scr = flatland
	params = {
		name = "Rail"
		score = 1050
		AnimData = $Rail_Data
		extratricks = FlatlandBranches
		ExtraTricks2 = Rail_Branches
		isextra
	}
}
Trick_OneFootNosemanual = {
	scr = nosemanual
	params = {
		name = "One Foot Nose Manual"
		score = 1050
		AnimData = $OneFootNosemanual_Data
		isextra
		extratricks = OneFootNoseManualBranches
		ExtraTricks2 = FlatlandBranches
	}
}
Trick_OneFootManual = {
	scr = Manual
	params = {
		name = "One Foot Manual"
		score = 1050
		AnimData = $OneFootManual_Data
		extratricks = OneFootManualBranches
		ExtraTricks2 = FlatlandBranches
		isextra
	}
}
Trick_Spacewalk = {
	scr = Manual
	params = {
		name = "Spacewalk"
		score = 1200
		AnimData = $Spacewalk_Data
		ExtraTricks2 = ManualBranches
		extratricks = FlatlandBranches
		AllowWallpush
	}
}
Trick_Truckstand = {
	scr = flatland
	params = {
		name = "Truckstand"
		score = 800
		AnimData = $Truckstand_Data
		extratricks = FlatlandBranches
		ExtraTricks2 = TruckstandBranches
	}
}
Trick_CrossfootPogo = {
	scr = flatland
	params = {
		name = "Crossfoot Pogo"
		score = 1100
		AnimData = $CrossfootPogo_Data
		WaitOnOlliePercent = 10
		extratricks = FlatlandBranches
		ExtraTricks2 = CrossfootPogoBranches
	}
}
NoseManualBranches = [
	{
		trigger = {
			Press
			r2
			200
		}
		$Trick_Gturn
	}
	{
		trigger = $TRIGGER_MANUAL_BRANCHFLIP
		$Trick_360ShoveManual
	}
	{
		trigger = {
			InOrder
			circle
			triangle
			300
		}
		$Trick_OneFootNosemanual
	}
	{
		trigger = {
			Press
			twistimpulseright
			60
		}
		$Trick_Gturn
	}
	{
		trigger = {
			Press
			twistimpulseleft
			60
		}
		$Trick_Gturn
	}
]
ManualBranches = [
	{
		trigger = {
			Press
			r2
			200
		}
		$Trick_Gturn2
	}
	{
		trigger = $TRIGGER_MANUAL_BRANCHFLIP
		$Trick_360FlipNoseManual
	}
	{
		trigger = {
			InOrder
			circle
			triangle
			300
		}
		$Trick_OneFootManual
	}
	{
		trigger = {
			Press
			twistimpulseright
			60
		}
		$Trick_Gturn2
	}
	{
		trigger = {
			Press
			twistimpulseleft
			60
		}
		$Trick_Gturn2
	}
]
Trick_Gturn = {
	scr = Manual
	params = {
		name = "Nose Pivot"
		score = 250
		isextra
		pivot
		transition_start = NoseManual_out_Pivot
		transition_end = Manual_in_Pivot
		AnimData = $manual_data
		trickslack = 0
		playcesssound
		extratricks = FlatlandBranches
		ExtraTricks2 = ManualBranches
		TimeAdd = 1
		speedmult = 1.0
		AllowWallpush
	}
}
Trick_Gturn2 = {
	scr = nosemanual
	params = {
		name = "Pivot"
		score = 250
		isextra
		pivot
		transition_start = Manual_out_Pivot
		transition_end = NoseManual_in_Pivot
		AnimData = $nosemanual_data
		trickslack = 0
		playcesssound
		extratricks = FlatlandBranches
		ExtraTricks2 = NoseManualBranches
		TimeAdd = 1
		speedmult = 1.0
		AllowWallpush
	}
}
Trick_360ShoveManual = {
	scr = Manual
	params = {
		name = "360 Shove Manual"
		score = 750
		isextra
		transition_start = NoseManual_out_To_Manual
		transition_end = Manual_in_From_Nose
		AnimData = $manual_data
		trickslack = 0
		extratricks = FlatlandBranches
		ExtraTricks2 = ManualBranches
		TimeAdd = 0
		speedmult = 1.0
	}
}
Trick_360FlipNoseManual = {
	scr = nosemanual
	params = {
		name = "360 Fingerflip"
		score = 750
		isextra
		transition_start = Manual_out_To_Nose
		transition_end = NoseManual_in_From_Manual
		AnimData = $nosemanual_data
		trickslack = 0
		extratricks = FlatlandBranches
		ExtraTricks2 = NoseManualBranches
		TimeAdd = 0
		speedmult = 1.0
	}
}
PogoBranches = [
	{
		trigger = $TRIGGER_MANUAL_BRANCHFLIP
		$Trick_PogoFlip
	}
	{
		trigger = {
			Press
			l2
			ROTATEY_TRIGGER_TIME
		}
		scr = ManualSpin
		params = {
			$PogoSpin_params
			reverse_spin
		}
	}
	{
		trigger = {
			Press
			r2
			ROTATEY_TRIGGER_TIME
		}
		scr = ManualSpin
		params = {
			$PogoSpin_params
		}
	}
	{
		trigger = {
			InOrder
			a = circle
			b = circle
			400
		}
		scr = ManualFlip
		params = {
			name = "Hair Flip"
			score = 1500
			AnimData = $Truckstand_flip_2
			ExtraTricks2 = FlatlandBranches
			extratricks = PogoBranches
			parent = "Pogo"
			trickslack = 0
			isextra
		}
	}
]
PogoSpin_params = {
	name = "Pogo Spin"
	score = 100
	RotateY
	extratricks = FlatlandBranches
	ExtraTricks2 = PogoBranches
	parent = "Pogo"
	trickslack = 0
	isextra
}
Trick_PogoFlip = {
	scr = ManualFlip
	params = {
		name = "Wrap Around"
		score = 500
		AnimData = $Pogo_flip_1
		speed = 1.5
		OutSpeed = 1.5
		extratricks = FlatlandBranches
		ExtraTricks2 = PogoBranches
		parent = "Pogo"
		trickslack = 0
		isextra
	}
}
SwitchFootPogo_Branches = [
	{
		trigger = $TRIGGER_MANUAL_BRANCHFLIP
		scr = ManualFlip
		params = {
			name = "Switch Foot Pogo Flip"
			score = 500
			AnimData = $SwitchFootPogo_flip_1
			extratricks = FlatlandBranches
			ExtraTricks2 = SwitchFootPogo_Branches
			parent = "Switch Foot Pogo"
			trickslack = 0
			isextra
		}
	}
	{
		trigger = {
			Press
			l2
			ROTATEY_TRIGGER_TIME
		}
		scr = ManualSpin
		params = {
			$SwitchFootPogoSpin_params
			reverse_spin
		}
	}
	{
		trigger = {
			Press
			r2
			ROTATEY_TRIGGER_TIME
		}
		scr = ManualSpin
		params = {
			$SwitchFootPogoSpin_params
		}
	}
]
SwitchFootPogoSpin_params = {
	name = "Switch Foot Pogo Spin"
	score = 100
	RotateY
	extratricks = FlatlandBranches
	ExtraTricks2 = SwitchFootPogo_Branches
	parent = "Switch Foot Pogo"
	trickslack = 0
	isextra
}
Rail_Branches = [
	{
		trigger = $TRIGGER_MANUAL_BRANCHFLIP
		scr = ManualFlip
		params = {
			name = "Rail Flip"
			score = 500
			AnimData = $Rail_flip_1
			extratricks = FlatlandBranches
			ExtraTricks2 = Rail_Branches
			parent = "Rail"
			trickslack = 0
			isextra
			boardrotate = 1
		}
	}
]
CasperBranches = [
	{
		trigger = $TRIGGER_MANUAL_BRANCHFLIP
		scr = ManualFlip
		params = {
			name = "Casper Flip"
			score = 500
			AnimData = $Casper_flip_1
			speed = 0.85
			extratricks = FlatlandBranches
			ExtraTricks2 = CasperBranches
			parent = "Casper"
			blend = 0.0
			trickslack = 0
			boardrotate = 1
			isextra
		}
	}
	{
		trigger = {
			Press
			l2
			ROTATEY_TRIGGER_TIME
		}
		scr = ManualSpin
		params = {
			$CasperSpin_params
			reverse_spin
		}
	}
	{
		trigger = {
			Press
			r2
			ROTATEY_TRIGGER_TIME
		}
		scr = ManualSpin
		params = {
			$CasperSpin_params
		}
	}
]
CasperSpin_params = {
	name = "Casper Spin"
	score = 100
	RotateY
	extratricks = FlatlandBranches
	ExtraTricks2 = CasperBranches
	parent = "Casper"
	trickslack = 0
	boardrotate = 1
	isextra
}
AntiCasperBranches = [
	{
		trigger = $TRIGGER_MANUAL_BRANCHFLIP
		scr = ManualFlip
		params = {
			name = "Anti Casper Flip"
			score = 500
			AnimData = $AntiCasper_flip_1
			speed = 0.7
			extratricks = FlatlandBranches
			ExtraTricks2 = AntiCasperBranches
			parent = "Anti Casper"
			blend = 0.0
			trickslack = 0
			boardrotate = 1
			isextra
			Nollie
		}
	}
	{
		trigger = {
			Press
			l2
			ROTATEY_TRIGGER_TIME
		}
		scr = ManualSpin
		params = {
			$AntiCasperSpin_params
			reverse_spin
		}
	}
	{
		trigger = {
			Press
			r2
			ROTATEY_TRIGGER_TIME
		}
		scr = ManualSpin
		params = {
			$AntiCasperSpin_params
		}
	}
]
AntiCasperSpin_params = {
	name = "Anti Casper Spin"
	score = 100
	RotateY
	extratricks = FlatlandBranches
	ExtraTricks2 = AntiCasperBranches
	parent = "Anti Casper"
	trickslack = 0
	boardrotate = 1
	isextra
	Nollie
}
TruckstandBranches = [
	{
		trigger = $TRIGGER_MANUAL_BRANCHFLIP
		scr = ManualFlip
		params = {
			name = "Truckstand Flip"
			score = 500
			AnimData = $Truckstand_flip_1
			extratricks = FlatlandBranches
			ExtraTricks2 = TruckstandBranches
			parent = "TruckStand"
			trickslack = 0
			isextra
		}
	}
	{
		trigger = {
			Press
			l2
			ROTATEY_TRIGGER_TIME
		}
		scr = ManualSpin
		params = {
			$TruckSpin_params
			reverse_spin
		}
	}
	{
		trigger = {
			Press
			r2
			ROTATEY_TRIGGER_TIME
		}
		scr = ManualSpin
		params = {
			$TruckSpin_params
		}
	}
]
TruckSpin_params = {
	name = "TruckSpin"
	score = 100
	RotateY
	extratricks = FlatlandBranches
	ExtraTricks2 = TruckstandBranches
	parent = "TruckStand"
	trickslack = 0
	isextra
}
CrossfootPogoBranches = [
	{
		trigger = $TRIGGER_MANUAL_BRANCHFLIP
		scr = ManualFlip
		params = {
			name = "Crossfoot Pogo Flip"
			score = 500
			AnimData = $CrossfootPogo_flip_1
			extratricks = FlatlandBranches
			ExtraTricks2 = CrossfootPogoBranches
			parent = "Crossfoot Pogo"
			trickslack = 0
			isextra
		}
	}
]
OneFootNoseManualBranches = [
	{
		trigger = $TRIGGER_MANUAL_BRANCHFLIP
		scr = ManualFlip
		params = {
			name = "One Foot Nose Flip"
			score = 500
			AnimData = $OneFootNose_flip_1
			extratricks = FlatlandBranches
			ExtraTricks2 = OneFootNoseManualBranches
			parent = "One Foot Nose Manual"
			trickslack = 0
			isextra
		}
	}
]
OneFootManualBranches = [
	{
		trigger = $TRIGGER_MANUAL_BRANCHFLIP
		scr = ManualFlip
		params = {
			name = "One Foot Flip"
			score = 500
			AnimData = $OneFoot_flip_1
			extratricks = FlatlandBranches
			ExtraTricks2 = OneFootManualBranches
			parent = "One Foot Manual"
			trickslack = 0
			isextra
		}
	}
]

script WalkAir_Manual 
	InAirExceptions
	removeparameter \{FromWalk}
	seteventhandler event = landed scr = WalkAir_Manual_Land response = switch_script params = {SkipInitAnim <...>}
	killextratricks
	cleartrickqueue
	setqueuetricks \{NoTricks}
	settags \{caveman_anim}
	Skater_PlayOllieAnim \{$Ollie_data}
	Skater_PlayFlipTrickAnim \{$caveman_data}
	block
endscript

script WalkAir_Manual_Land 
	land \{walk_manual}
	goto Manual params = {<...>}
endscript
ManualExceptionTable = [
	{
		response = switch_script
		event = groundgone
		scr = groundgone
		params = {
			NoBoneless
		}
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
		response = call_script
		event = madeotherskaterbail
		scr = MadeOtherSkaterBail_Called
	}
]

script nosemanual \{offmetertop = NoseManualBail
		offmeterbottom = ManualLand}
	Manual <...> type = nosemanual Nollie = 1
endscript

script flatland \{offmetertop = ManualFlatlandBailForward
		offmeterbottom = ManualFlatlandBailBack}
	Manual <...> type = flatland
endscript

script Manual blendperiod = 0.6 speed = 1.0 type = Manual offmetertop = ManualLand offmeterbottom = ManualBail
	if Skater_AnimEquals [Sk8_Gnd_Oll_S_RunToSkate_Flat_D Sk8_Gnd_Oll_S_WalkToSkate_Flat_D Sk8_W_StndToSk8_Stopped_F]
		skater_waitanimfinished
	endif
	if gotparam FromWalk
		goto WalkAir_Manual params = {<...>}
	endif
	getsingletag caveman_anim
	if gotparam caveman_anim
		removetags [caveman_anim]
		if anim_animnodeexists id = FliptrickTimer
			Skater_WaitAnim timer = FliptrickTimer percent = 40
			blendperiod = 0.2
		endif
	endif
	killextratricks
	settrickname ""
	settrickscore 0
	display blockspin
	natasresetrotation
	if landedfromvert
		if NOT landedonbank
			goto land
		endif
	endif
	ClearLipCombos
	resetlandedfromvert
	reseteventhandlersfromtable ManualExceptionTable
	if gotparam Nollie
		if NOT gotparam pivot
			seteventhandler event = Ollied scr = NollieNoDisplay response = switch_script params = {<...>}
		endif
		nollieon
	else
		nollieoff
		if NOT gotparam pivot
			seteventhandler event = Ollied scr = ollie response = switch_script params = {<...>}
		endif
	endif
	seteventhandler event = offmetertop scr = <offmeterbottom> response = switch_script params = {<...>}
	seteventhandler event = offmeterbottom scr = <offmetertop> response = switch_script params = {<...>}
	onexceptionrun CheckForNewTrick_ManualOut
	LaunchStateChangeEvent state = Skater_InManual
	if doingbalancetrick
		if NOT gotparam no_transition
			if NOT gotparam transition_start
				getlastanimdata
				appendsuffixtochecksum base = <prev_data> suffixstring = '_data'
				<prev_data> = <appended_id>
				value = (<AnimData>.struct)
				num = ((<prev_data>.transitions).<value>)
				formattext checksumname = transition_start '%s_out_%n' s = (<prev_data>.string) n = <num>
				formattext checksumname = transition_end '%s_in_%n' s = (<AnimData>.string) n = <num>
				if NOT globalexists name = <transition_start> type = structure
					removeparameter transition_start
				endif
				if NOT globalexists name = <transition_end> type = structure
					removeparameter transition_end
				endif
			endif
			if gotparam transition_start
				Skater_PlayManualTransitionAnim data = $<transition_start>
				if structurecontains structure = $<transition_start> flipafter
					flipafter
				endif
				if structurecontains structure = $<transition_start> boardrotate
					boardrotateafter
				endif
				skater_waitanimfinished timer = manualextratimer
			endif
		endif
		setbalancetricktype <type>
	endif
	cleartrickqueue
	if NOT getglobalflag flag = $FLAG_EXPERT_MODE_NO_WALKING
		if NOT ((innetgame) && (getglobalflag flag = $flag_g_expert_mode_no_walking))
			setqueuetricks SkateToWalkTricks
		else
			setqueuetricks NoTricks
		endif
	else
		setqueuetricks NoTricks
	endif
	if gotparam AllowWallpush
		if gotparam Nollie
			seteventhandler event = Wallpush scr = Manual_Wallpush response = switch_script
		else
			seteventhandler event = Wallpush scr = Manual_Wallpush response = switch_script params = {ToNoseManual}
		endif
	else
		seteventhandler event = Wallpush scr = Manual_CancelWallpushEvent response = call_script
	endif
	if gotparam isspecial
		broadcastevent type = SkaterEnterSpecialTrick
		setmanualtricks NoTricks
	else
		if gotparam isextra
			setmanualtricks NoTricks
		else
			if ($EXPERT_MODE_NO_MANUALS = 0)
				setmanualtricks NoTricks special = SpecialManualTricks
			else
				setmanualtricks NoTricks
			endif
		endif
	endif
	startbalancetrick
	vibrate actuator = 1 percent = 25
	onexitrun KillManualVibration
	if gotparam FullScreenEffect
		<FullScreenEffect>
		if gotparam isspecial
			onexitrun Exit_FullScreenEffect_and_Special
		else
			onexitrun Exit_FullscreenEffect
		endif
	else
		if gotparam isspecial
			onexitrun Exit_Special_Manual
			if gotparam bodycheck
				obj_spawnscriptlater body_check_manual
			endif
		endif
	endif
	if structurecontains structure = <AnimData> friction
		SetRollingFriction (<AnimData>.friction)
	else
		SetRollingFriction -0.01
	endif
	if gotparam isspecial
		tweak = 5
	else
		tweak = 1
	endif
	dobalancetrick buttona = up buttonb = down type = <type> tweak = <tweak>
	formattext checksumname = checksum '%s' s = (<AnimData>.string)
	setlastanimdata <checksum>
	if NOT gotparam AllowRepeat
		ignore = <name>
	else
		ignore = "none"
	endif
	if gotparam transition_end
		LaunchExtraMessage
		settrickname <name>
		settrickscore <score>
		if NOT gotparam pivot
			display blockspin
		else
			display blockspin nomult
		endif
		Skater_PlayManualAnim {<AnimData> no_land blendduration = 0 sync = 1}
		Skater_PlayManualTransitionAnim data = $<transition_end> blendduration = 0
		if structurecontains structure = $<transition_end> min_percent
			min_percent = (($<transition_end>).min_percent)
		else
			min_percent = 80
		endif
		Skater_WaitAnim timer = manualextratimer percent = <min_percent>
		SetManualExtraTricks ignore = <ignore> extratricks = <extratricks> ExtraTricks2 = <ExtraTricks2>
		if gotparam pivot
			if gotparam Nollie
				seteventhandler event = Ollied scr = NollieNoDisplay response = switch_script params = {<...>}
			else
				seteventhandler event = Ollied scr = ollie response = switch_script params = {<...>}
			endif
		endif
		WaitAnimWhilstChecking timer = manualextratimer
		Skater_BlankManualExtraAnim
	else
		SetManualExtraTricks ignore = <ignore> extratricks = <extratricks> ExtraTricks2 = <ExtraTricks2>
		if gotparam FromRevert
			no_land = 1
			blendperiod = 0.25
		else
			if NOT gotparam FromAir
				no_land = 1
				blendperiod = 0.35000002
			endif
		endif
		Skater_PlayManualAnim <AnimData> no_land = <no_land> blendduration = <blendperiod>
	endif
	if obj_flagset $FLAG_SKATER_MANUALCHEESE
		if NOT gotparam isextra
			GetManualCheese
			ManualCheese = (<ManualCheese> + 1)
			settags ManualCheese = <ManualCheese>
			printf "Manual Cheese ============================= %c" c = <ManualCheese>
			if (<ManualCheese> > 1)
				AdjustBalance TimeAdd = 2 speedmult = 2 leanmult = 1.2
			endif
		endif
	else
		obj_setflag $FLAG_SKATER_MANUALCHEESE
		settags ManualCheese = 0
	endif
	if gotparam CheckCheese
		if gotparam isextra
			wait $MANUAL_DISPLAY_WAIT frames
		else
			wait 13 frames
		endif
	else
		wait $MANUAL_DISPLAY_WAIT frames
	endif
	if NOT gotparam isspecial
		if NOT gotparam isextra
			donextmanualtrick
		endif
	endif
	if gotparam callback
		goto <callback>
	endif
	if NOT gotparam transition_end
		if NOT gotparam dont_score
			settrickname <name>
			settrickscore <score>
			display blockspin
		endif
	endif
	if gotparam isspecial
		LaunchSpecialMessage
	endif
	if gotparam FlipGraphic
		boardrotate
	endif
	if gotparam SproingFlip
		BlendperiodOut 0
		flipafter
	endif
	if gotparam NoBlend
		BlendperiodOut 0
	endif
	if gotparam spawnscript
		obj_killspawnedscript name = <spawnscript>
		obj_spawnscriptlater <spawnscript>
	endif
	if gotparam loop_script
		begin
		<loop_script>
		repeat
	else
		WaitWhilstChecking_ForPressure <...>
	endif
endscript

script SpacewalkBoost \{max = 5}
	getspeed
	if (<speed> < <max>)
		setspeed (<speed> + 3.0)
	endif
endscript

script WaitWhilstChecking_ForPressure 
	begin
	DoNextTrick
	wait \{1
		game
		frame}
	repeat
endscript

script CheckForNewTrick_ManualOut 
	restoreevents \{usedby = extra
		duration = 100}
	ManualOut
endscript

script Exit_Special_Manual 
	obj_killspawnedscript \{name = body_check_manual}
	KillManualVibration
	Exit_Special
endscript

script KillManualVibration 
	vibrate \{actuator = 1
		percent = 0}
endscript

script ManualOut 
	if gotparam \{madeotherskaterbail}
	else
		killextratricks
	endif
	settrickname \{""}
	settrickscore \{0}
	display \{blockspin}
endscript
in_manual_land = 0
flip_backwards_dont_blend = 0

script ManualLand_Cleanup 
	settags \{in_manual_land = 0}
endscript

script ManualLand 
	settags in_manual_land = 1
	change flip_backwards_dont_blend = 0
	onexitrun ManualLand_Cleanup
	VibrateOff
	seteventhandler event = runhasended scr = endofrun response = switch_script
	seteventhandler event = goalhasended scr = goal_endofrun response = switch_script
	if GoalManager_GoalShouldExpire
		cleareventhandler Ollied
		onexceptionrun
	endif
	landskatertricks
	cleareventbuffer
	cleartrickqueue
	killextratricks
	seteventhandler event = Wallpush scr = Ground_Wallpush response = switch_script
	stopbalancetrick
	change flip_backwards_dont_blend = 0
	settags in_manual_land = 0
	goto ongroundai
endscript

script ManualFlip grindslack = 25 trickslack = 10 displaypercent = 50 TimeAdd = 0 speedmult = 1 speed = 1.0 blend = 0.3
	vibrate actuator = 1 percent = 25
	onexitrun KillManualVibration
	anim = (<AnimData>.anim)
	if gotparam Nollie
		nollieon
		seteventhandler event = Ollied scr = NollieNoDisplay response = switch_script
	else
		nollieoff
		seteventhandler event = Ollied scr = ollie response = switch_script params = {anim = <anim> boardrotate = <boardrotate> flipafter = <flipafter> NoBlend = <NoBlend>}
	endif
	if gotparam offmetertop
		seteventhandler event = offmetertop scr = <offmetertop> response = switch_script params = {<...>}
		seteventhandler event = offmeterbottom scr = <offmeterbottom> response = switch_script params = {<...>}
	endif
	if gotparam AllowWallpush
		if gotparam Nollie
			seteventhandler event = Wallpush scr = Manual_Wallpush response = switch_script
		else
			seteventhandler event = Wallpush scr = Manual_Wallpush response = switch_script params = {ToNoseManual}
		endif
	else
		seteventhandler event = Wallpush scr = Manual_CancelWallpushEvent response = call_script
	endif
	killextratricks
	onexceptionrun ManualOut
	bailon
	settrickname <name>
	settrickscore <score>
	AdjustBalance TimeAdd = <TimeAdd> speedmult = <speedmult>
	Skater_PlayManualTransitionAnim data = <AnimData> blendduration = 0.1
	wait 5 gameframes
	if gotparam playcesssound
		soundevent event = manual_foleymove_cess_sfx
	endif
	if gotparam isextra
		if NOT gotparam playcesssound
			LaunchExtraMessage
		endif
	endif
	if gotparam isspecial
		LaunchSpecialMessage
	endif
	wait $MANUAL_DISPLAY_WAIT frames
	if NOT gotparam NoDisplay
		display blockspin
	endif
	if gotparam flipafter
		flipafter
	endif
	if gotparam boardrotate
		boardrotateafter
	endif
	skater_waitanimfinished timer = manualextratimer
	Skater_BlankManualExtraAnim
	if NOT gotparam AllowRepeat
		ignore = <parent>
	else
		ignore = "none"
	endif
	SetManualExtraTricks ignore = <ignore> extratricks = <extratricks> ExtraTricks2 = <ExtraTricks2>
	bailoff
	if gotparam NewAnimData
		Skater_PlayManualAnim <NewAnimData> sync = 1
		formattext checksumname = checksum '%s' s = (<NewAnimData>.string)
		setlastanimdata <checksum>
	endif
	if NOT gotparam no_wait
		WaitWhilstChecking_ForPressure <...>
	endif
endscript

script ManualSpin grindslack = 25 trickslack = 10 displaypercent = 50 TimeAdd = 0 speedmult = 1 speed = 1.0 blend = 0.3
	vibrate actuator = 1 percent = 25
	onexitrun KillManualVibration
	if gotparam Nollie
		nollieon
		seteventhandler event = Ollied scr = NollieNoDisplay response = switch_script
	else
		nollieoff
		seteventhandler event = Ollied scr = ollie response = switch_script params = {anim = <anim> OutAnim = <OutAnim> boardrotate = <boardrotate> flipafter = <flipafter> NoBlend = <NoBlend>}
	endif
	if gotparam offmetertop
		seteventhandler event = offmetertop scr = <offmetertop> response = switch_script params = {<...>}
		seteventhandler event = offmeterbottom scr = <offmeterbottom> response = switch_script params = {<...>}
	endif
	if gotparam AllowWallpush
		if gotparam Nollie
			seteventhandler event = Wallpush scr = Manual_Wallpush response = switch_script
		else
			seteventhandler event = Wallpush scr = Manual_Wallpush response = switch_script params = {ToNoseManual}
		endif
	else
		seteventhandler event = Wallpush scr = Manual_CancelWallpushEvent response = call_script
	endif
	killextratricks
	onexceptionrun ManualOut
	bailon
	settrickname <name>
	settrickscore <score>
	AdjustBalance TimeAdd = <TimeAdd> speedmult = <speedmult>
	if gotparam reverse_spin
		endangle = 360.0
	else
		endangle = -360.0
	endif
	rotatedisplay {y duration = 0.75 seconds startangle = 0.0 endangle = <endangle> sinepower = 1 rotationoffset = (0.0, 1.0, 0.0)}
	wait 0.7 seconds
	if gotparam playcesssound
		soundevent event = manual_foleymove_cess_sfx
	endif
	if gotparam isspecial
		LaunchSpecialMessage
	endif
	if NOT gotparam NoDisplay
		if gotparam RotateY
			display addspin = 360
		else
			display blockspin
		endif
	endif
	if NOT gotparam AllowRepeat
		ignore = <parent>
	else
		ignore = "none"
	endif
	SetManualExtraTricks ignore = <ignore> extratricks = <extratricks> ExtraTricks2 = <ExtraTricks2>
	if gotparam flipafter
		flipafter
	endif
	if gotparam boardrotate
		boardrotateafter
	endif
	bailoff
	WaitWhilstChecking_ForPressure <...>
endscript

script SetManualExtraTricks \{ignore = "none"}
	GetBalanceTrickType
	if NOT (<trick_type> = flatland)
		body_check_set_tricks \{state = Manual}
	endif
	if gotparam \{ExtraTricks2}
		setextratricks <ExtraTricks2> <extratricks> ignore = <ignore>
	elseif gotparam \{extratricks}
		setextratricks tricks = <extratricks> ignore = <ignore>
	endif
endscript

script GetManualCheese 
	gettags
	return ManualCheese = <ManualCheese>
endscript

script manual_turnaround 
	gettags
	obj_spawnscriptlater manual_turnaround2 params = {<...>}
endscript

script manual_turnaround2 \{time = 0.4}
	turntofacevelocity
	if yawingright
		angle = 180
	else
		if yawingleft
			angle = -180
		else
			angle = Random (@ 180 @ -180 )
		endif
	endif
	rotatedisplay y duration = <time> seconds startangle = <angle> endangle = 0
	wait (<time> + 0.5) seconds
	endmanualturnaround
endscript

script NTMSpecialScript 
	goto flatland params = {
		name = ($Trick_NTMSpecial.params.name)
		score = ($Trick_NTMSpecial.params.score)
		transition_start = Manual_out_Special_1
		transition_end = Casper_in_Special_1
		AnimData = $Casper_Data
		isspecial
		CheckCheese
	}
endscript

script LuchadorSpecialScript 
	goto flatland params = {
		name = ($Trick_LuchadorSpecial.params.name)
		score = ($Trick_LuchadorSpecial.params.score)
		transition_start = Manual_out_Special_2
		transition_end = SwitchFootPogo_in_Special_2
		AnimData = $SwitchFootPogo_Data
		isspecial
		CheckCheese
	}
endscript

script NoComplyManual 
	goto flatland params = {
		name = ($Trick_NoComplyManual.params.name)
		score = ($Trick_NoComplyManual.params.score)
		AnimData = $manual_data
		isspecial
		CheckCheese
		loop_script = NoComplyManual_loop_script
	}
endscript

script NoComplyManual_loop_script 
	Skater_PlayManualTransitionAnim \{data = $Manual_flip_Special_1
		blendduration = 0.1}
	skater_waitanimfinished \{timer = manualextratimer}
	getspeed
	setspeed (<speed> + 3.0)
	DoNextTrick
endscript
