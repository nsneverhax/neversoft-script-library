terrainsound_defaultdropoff = 40
TerrainSound_DefaultFootStepDropoff = 15
sfx_terrains = {
	sfx_id_default = {
		roll = {
			sound = [
				Sk8_Asphalt_Slow_01
			]
			minvol = 0
			maxvol = 75
			minpitch = 70
			maxpitch = 85
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = linear
			volumecurve = inv_exponential
			pitchchangepercentageonturning = 110
			volsmoothfactorup = 1
			volsmoothfactordown = 1
			skaterbuss = Rolling
			pedbuss = PedRolling
			fastloop = on
			fastsound = [
				Sk8_Asphalt_Fast_01
			]
			fastminvol = 0
			fastmaxvol = 75
			fastminpitch = 90
			fastmaxpitch = 100
			fastdropoff = $terrainsound_defaultdropoff
			fastdropoff_function = linear
			fastdropoff_function = linear
			fastpitchcurve = exponential
			fastvolumecurve = exponential
			fastskaterbuss = Rolling
			fastpedbuss = PedRolling
			clickklack = off
			clackmeters = 3
			clickklackontrans = on
			clickklackfrontsound = [
				Sk8_Terr_Sidewalk_Click_01
				Sk8_Terr_Sidewalk_Click_02
				Sk8_Terr_Sidewalk_Click_03
				Sk8_Terr_Sidewalk_Click_04
				Sk8_Terr_Sidewalk_Click_05
				Sk8_Terr_Sidewalk_Click_06
				Sk8_Terr_Sidewalk_Click_07
			]
			clickklackbacksound = [
				Sk8_Terr_Sidewalk_Clack_01
				Sk8_Terr_Sidewalk_Clack_02
				Sk8_Terr_Sidewalk_Clack_03
				Sk8_Terr_Sidewalk_Clack_04
				Sk8_Terr_Sidewalk_Clack_05
				Sk8_Terr_Sidewalk_Clack_06
				Sk8_Terr_Sidewalk_Clack_07
			]
			clickminvol = 30
			clickmaxvol = 50
			clickminpitch = 60
			clickmaxpitch = 85
			clickdropoff = $terrainsound_defaultdropoff
			clickdropoff_function = linear
			clickskaterbuss = ClickClacks
			clickpedbuss = PedClickClacks
			soundontrans = off
			transitionsound = [
			]
			transminvol = 90
			transmaxvol = 100
			transminpitch = 40
			transmaxpitch = 180
			transdropoff = $terrainsound_defaultdropoff
			transdropoff_function = linear
			soundonexit = off
			exitsound = [
			]
			exitminvol = 90
			exitmaxvol = 100
			exitminpitch = 80
			exitmaxpitch = 130
			exitdropoff = $terrainsound_defaultdropoff
			exitdropoff_function = linear
			transskaterbuss = TransitionSounds
			transpedbuss = PedTransitionSounds
		}
		Grind = {
			sound = [
				sk9_Conc_Grind_Proto
				sk9_Conc_Grind_Proto2
				sk9_Conc_Grind_Proto3
			]
			minvol = 0
			maxvol = 80
			minpitch = 85
			maxpitch = 90
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = inv_exponential
			volumecurve = inv_exponential
			skaterbuss = Grinding
			pedbuss = PedGrinding
		}
		slide = {
			sound = [
				sk8_terr_conc_slide_nose
			]
			minvol = 0
			maxvol = 90
			minpitch = 90
			maxpitch = 90
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = inv_exponential
			volumecurve = inv_exponential
			skaterbuss = Sliding
			pedbuss = PedSliding
		}
		slidefall = {
			sound = [
				sk8_Generic_SlideFall_Ver2
			]
			minvol = 0
			maxvol = 25
			minpitch = 60
			maxpitch = 140
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			pitchcurve = linear
			volumecurve = linear
			volsmoothfactorup = 2
			volsmoothfactordown = 6
			skaterbuss = BailSlide
			pedbuss = PedBailSlide
			terrainsweetener = off
			terrainsweetenersound = [
				sk8_terr_water_roll_loop
			]
			sweetminvol = 0
			sweetmaxvol = 200
			sweetminpitch = 60
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			sweetpitchcurve = linear
			sweetvolumecurve = exponential
			sweetskaterbuss = BailSlide
			sweetpedbuss = PedBailSlide
			soundontrans = off
			transitionsound = [
				sk8_terr_water_exit_01
				sk8_terr_water_exit_03
			]
			transminvol = 0
			transmaxvol = 100
			transminpitch = 80
			transmaxpitch = 120
			transdropoff = $terrainsound_defaultdropoff
			transdropoff_function = linear
			transskaterbuss = TransitionSounds
			transpedbuss = PedTransitionSounds
		}
		footstep = {
			walksound = [
				SK8_Asphalt_Footstep_01
				SK8_Asphalt_Footstep_02
				SK8_Asphalt_Footstep_03
			]
			runsound = [
				SK8_Asphalt_Runstep_01
				SK8_Asphalt_Runstep_02
				SK8_Asphalt_Runstep_03
				SK8_Asphalt_Runstep_04
			]
			minvol = 60
			maxvol = 80
			minpitch = 90
			maxpitch = 110
			dropoff = $TerrainSound_DefaultFootStepDropoff
			dropoff_function = linear
			skaterbuss = Footsteps
			pedbuss = PedFootsteps
			footsteplayer = off
			layersound = [
			]
			layerpercentchance = 10
			layervol = 20
			layerpitch = 100
			layerdropoff = $terrainsound_defaultdropoff
			layerdropoff_function = linear
			layerskaterbuss = footsteplayer
			layerpedbuss = PedFootstepLayer
		}
		bodyfall = {
			sound = [
				sk9_bodyfall_torso_01
				sk9_bodyfall_torso_02
			]
			minvol = 30
			maxvol = 100
			minpitch = 80
			maxpitch = 120
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			sweetener = off
			sweetsound = [
			]
			sweetpercentchance = 100
			waittime = 0
			sweetminvol = 40
			sweetmaxvol = 80
			sweetminpitch = 90
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			LowEndSweetener = on
			lowendsweetsound = [
				sk9_BailBodyPunch01
				sk9_BailBodyPunch02
				sk9_BailBodyPunch03
				sk9_BailBodyPunch04
			]
			lowendminvol = 0
			lowendmaxvol = 80
			lowendminpitch = 90
			lowendmaxpitch = 110
			lowenddropoff = $terrainsound_defaultdropoff
			lowenddropoff_function = linear
			skaterbuss = BodyFalls
			pedbuss = PedBodyFalls
			sweetskaterbuss = Sweetners
			sweetpedbuss = PedSweetners
			lowendskaterbuss = LowEnd
			lowendpedbuss = PedLowEnd
		}
		headfall = {
			sound = [
				sk9_bodyfall_head
			]
			minvol = 30
			maxvol = 100
			minpitch = 80
			maxpitch = 120
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			sweetener = off
			sweetsound = [
			]
			sweetpercentchance = 100
			waittime = 0
			sweetminvol = 40
			sweetmaxvol = 80
			sweetminpitch = 90
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			LowEndSweetener = off
			lowendsweetsound = [
			]
			lowendminvol = 0
			lowendmaxvol = 100
			lowendminpitch = 90
			lowendmaxpitch = 110
			lowenddropoff = $terrainsound_defaultdropoff
			lowenddropoff_function = linear
			skaterbuss = BodyFalls
			pedbuss = PedBodyFalls
			sweetskaterbuss = Sweetners
			sweetpedbuss = PedSweetners
			lowendskaterbuss = LowEnd
			lowendpedbuss = PedLowEnd
		}
		legfall = {
			sound = [
				sk9_bodyfall_leg_01
				sk9_bodyfall_leg_02
				sk9_bodyfall_leg_03
				sk9_bodyfall_leg_04
			]
			minvol = 30
			maxvol = 100
			minpitch = 80
			maxpitch = 120
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			sweetener = off
			sweetsound = [
			]
			sweetpercentchance = 100
			waittime = 0
			sweetminvol = 40
			sweetmaxvol = 80
			sweetminpitch = 90
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			LowEndSweetener = off
			lowendsweetsound = [
			]
			lowendminvol = 0
			lowendmaxvol = 100
			lowendminpitch = 90
			lowendmaxpitch = 110
			lowenddropoff = $terrainsound_defaultdropoff
			lowenddropoff_function = linear
			skaterbuss = BodyFalls
			pedbuss = PedBodyFalls
			sweetskaterbuss = Sweetners
			sweetpedbuss = PedSweetners
			lowendskaterbuss = LowEnd
			lowendpedbuss = PedLowEnd
		}
		armfall = {
			sound = [
				sk9_bodyfall_arm_01
				sk9_bodyfall_arm_02
				sk9_bodyfall_arm_03
			]
			minvol = 30
			maxvol = 100
			minpitch = 80
			maxpitch = 120
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			sweetener = off
			sweetsound = [
			]
			sweetpercentchance = 100
			waittime = 0
			sweetminvol = 40
			sweetmaxvol = 80
			sweetminpitch = 90
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			LowEndSweetener = off
			lowendsweetsound = [
			]
			lowendminvol = 0
			lowendmaxvol = 100
			lowendminpitch = 90
			lowendmaxpitch = 110
			lowenddropoff = $terrainsound_defaultdropoff
			lowenddropoff_function = linear
			skaterbuss = BodyFalls
			pedbuss = PedBodyFalls
			sweetskaterbuss = Sweetners
			sweetpedbuss = PedSweetners
			lowendskaterbuss = LowEnd
			lowendpedbuss = PedLowEnd
		}
		nutsfall = {
			sound = [
				BailCrack01
			]
			minvol = 30
			maxvol = 100
			minpitch = 80
			maxpitch = 120
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			sweetener = off
			sweetsound = [
			]
			sweetpercentchance = 100
			waittime = 0
			sweetminvol = 40
			sweetmaxvol = 80
			sweetminpitch = 90
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			LowEndSweetener = off
			lowendsweetsound = [
			]
			lowendminvol = 0
			lowendmaxvol = 100
			lowendminpitch = 90
			lowendmaxpitch = 110
			lowenddropoff = $terrainsound_defaultdropoff
			lowenddropoff_function = linear
			skaterbuss = BodyFalls
			pedbuss = PedBodyFalls
			sweetskaterbuss = Sweetners
			sweetpedbuss = PedSweetners
			lowendskaterbuss = LowEnd
			lowendpedbuss = PedLowEnd
		}
		bonk = {
			sound = [
				BailBodyFall01
				BailBodyFall02
				BailBodyFall03
				BailBodyFall04
				BailBodyFall05
			]
			minvol = 70
			maxvol = 100
			minpitch = 90
			maxpitch = 110
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			sweetener = off
			sweetsound = [
			]
			sweetpercentchance = 100
			waittime = 1
			sweetminvol = 85
			sweetmaxvol = 100
			sweetminpitch = 90
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			LowEndSweetener = on
			lowendsweetsound = [
				sk9_BailBodyPunch02
			]
			lowendminvol = 20
			lowendmaxvol = 65
			lowendminpitch = 90
			lowendmaxpitch = 110
			lowenddropoff = $terrainsound_defaultdropoff
			lowenddropoff_function = linear
			skaterbuss = BodyFalls
			pedbuss = PedBodyFalls
			sweetskaterbuss = Sweetners
			sweetpedbuss = PedSweetners
			lowendskaterbuss = LowEnd
			lowendpedbuss = PedLowEnd
		}
		footpush = {
			sound = [
				SK8_Asphalt_Pushes_01
				SK8_Asphalt_Pushes_07
			]
			minvol = 90
			maxvol = 120
			minpitch = 70
			maxpitch = 100
			pitchcurve = exponential
			volumecurve = exponential
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPush
			pedbuss = PedBoardPush
		}
		ollie = {
			sound = [
				SK8_Asphalt_Ollie_01
				SK8_Asphalt_Ollie_03
				SK8_Asphalt_Ollie_04
				SK9_Asphalt_Ollie_05
				SK9_Asphalt_Ollie_06
				SK9_Asphalt_Ollie_07
			]
			minvol = 200
			maxvol = 250
			minpitch = 95
			maxpitch = 110
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = SkaterOllies
			pedbuss = PedOlliesLands
		}
		ollieland = {
			sound = [
				SK8_Asphalt_Land_05
				SK8_Asphalt_Land_06
				SK8_Asphalt_Land_07
				SK8_Asphalt_Land_09
			]
			minvol = 90
			maxvol = 110
			minpitch = 80
			maxpitch = 120
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = SkaterLands
			pedbuss = PedOlliesLands
		}
		grindon = {
			sound = [
				sk8_terr_sidewalk_grnd_n_01
			]
			minvol = 85
			maxvol = 100
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		grindoff = {
			sound = [
				sk8_terr_sidewlk_grnd_ff_02
			]
			minvol = 70
			maxvol = 85
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		slideon = {
			sound = [
				sk8_terr_sidewlk_N_sld_n_01
			]
			minvol = 80
			maxvol = 100
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		slideoff = {
			sound = [
				sk8_terr_sidewlk_N_sld_ff01
			]
			minvol = 70
			maxvol = 90
			minpitch = 70
			maxpitch = 90
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		revert = {
			sound = [
				SK8_Asphalt_Revert_A_04
				SK8_Asphalt_Revert_A_05
			]
			minvol = 70
			maxvol = 80
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = Reverts
			pedbuss = PedReverts
		}
		pogo = {
			sound = [
				SK8_Asphalt_Land_05
			]
			minvol = 20
			maxvol = 30
			minpitch = 140
			maxpitch = 160
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = pogo
			pedbuss = PedPogo
		}
		footstepjump = {
			sound = [
				ScuffStepConc01
				ScuffStepConc02
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		footstepland = {
			sound = [
				SK8_Asphalt_FootLand_01
				SK8_Asphalt_FootLand_02
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		scuff = {
			sound = [
				ScuffStepConc01
				ScuffStepConc02
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		wallride = {
			sound = [
				SK8_Asphalt_Revert_A_04
				SK8_Asphalt_Revert_A_05
			]
			minvol = 40
			maxvol = 90
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = wallride
			pedbuss = PedWallRide
		}
		boneless = {
			sound = [
				SK8_Asphalt_Boneless_02
				SK8_Asphalt_Boneless_04
			]
			minvol = 80
			maxvol = 90
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = boneless
			pedbuss = PedBoneless
		}
		boardpickup = {
			sound = [
				SK8_Asphalt_KickUp_03
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPickupPutdown
			pedbuss = PedBoardPickupPutdown
		}
		boardputdown = {
			sound = [
				Sk8_Conc_PutDown_01
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPickupPutdown
			pedbuss = PedBoardPickupPutdown
		}
		handplant = {
			sound = [
				sk8_terr_dirt_feet_walk_01
				sk8_terr_dirt_feet_walk_02
				sk8_terr_dirt_feet_walk_03
			]
			minvol = 200
			maxvol = 220
			minpitch = 150
			maxpitch = 160
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
	}
	SFX_ID_SIDEWALK_2FT = {
		roll = {
			sound = [
				sk8_Sidewalk_Slow
			]
			minvol = 0
			maxvol = 40
			minpitch = 85
			maxpitch = 100
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = linear
			volumecurve = inv_exponential
			pitchchangepercentageonturning = 108
			volsmoothfactorup = 1
			volsmoothfactordown = 1
			skaterbuss = Rolling
			pedbuss = PedRolling
			fastloop = on
			fastsound = [
				sk8_Sidewalk_Fast
			]
			fastminvol = 0
			fastmaxvol = 40
			fastminpitch = 90
			fastmaxpitch = 100
			fastdropoff = $terrainsound_defaultdropoff
			fastdropoff_function = linear
			fastpitchcurve = exponential
			fastvolumecurve = exponential
			fastskaterbuss = Rolling
			fastpedbuss = PedRolling
			clickklack = on
			clackmeters = 1.5
			clickklackontrans = on
			clickklackfrontsound = [
				Sk8_Terr_Sidewalk_Click_01
				Sk8_Terr_Sidewalk_Click_02
				Sk8_Terr_Sidewalk_Click_03
				Sk8_Terr_Sidewalk_Click_04
				Sk8_Terr_Sidewalk_Click_05
				Sk8_Terr_Sidewalk_Click_06
				Sk8_Terr_Sidewalk_Click_07
			]
			clickklackbacksound = [
				Sk8_Terr_Sidewalk_Clack_01
				Sk8_Terr_Sidewalk_Clack_02
				Sk8_Terr_Sidewalk_Clack_03
				Sk8_Terr_Sidewalk_Clack_04
				Sk8_Terr_Sidewalk_Clack_05
				Sk8_Terr_Sidewalk_Clack_06
				Sk8_Terr_Sidewalk_Clack_07
			]
			clickminvol = 25
			clickmaxvol = 65
			clickminpitch = 60
			clickmaxpitch = 85
			clickdropoff = $terrainsound_defaultdropoff
			clickdropoff_function = linear
			clickskaterbuss = ClickClacks
			clickpedbuss = PedClickClacks
		}
	}
	SFX_ID_SIDEWALK_4FT = {
		roll = {
			sound = [
				sk8_Sidewalk_Slow
			]
			minvol = 0
			maxvol = 40
			minpitch = 85
			maxpitch = 100
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = linear
			volumecurve = inv_exponential
			pitchchangepercentageonturning = 108
			volsmoothfactorup = 1
			volsmoothfactordown = 1
			skaterbuss = Rolling
			pedbuss = PedRolling
			fastloop = on
			fastsound = [
				sk8_Sidewalk_Fast
			]
			fastminvol = 0
			fastmaxvol = 40
			fastminpitch = 90
			fastmaxpitch = 100
			fastdropoff = $terrainsound_defaultdropoff
			fastdropoff_function = linear
			fastpitchcurve = exponential
			fastvolumecurve = exponential
			fastskaterbuss = Rolling
			fastpedbuss = PedRolling
			clickklack = on
			clackmeters = 3.25
			clickklackontrans = on
			clickklackfrontsound = [
				Sk8_Terr_Sidewalk_Click_01
				Sk8_Terr_Sidewalk_Click_02
				Sk8_Terr_Sidewalk_Click_03
				Sk8_Terr_Sidewalk_Click_04
				Sk8_Terr_Sidewalk_Click_05
				Sk8_Terr_Sidewalk_Click_06
				Sk8_Terr_Sidewalk_Click_07
			]
			clickklackbacksound = [
				Sk8_Terr_Sidewalk_Clack_01
				Sk8_Terr_Sidewalk_Clack_02
				Sk8_Terr_Sidewalk_Clack_03
				Sk8_Terr_Sidewalk_Clack_04
				Sk8_Terr_Sidewalk_Clack_05
				Sk8_Terr_Sidewalk_Clack_06
				Sk8_Terr_Sidewalk_Clack_07
			]
			clickminvol = 25
			clickmaxvol = 65
			clickminpitch = 60
			clickmaxpitch = 85
			clickdropoff = $terrainsound_defaultdropoff
			clickdropoff_function = linear
			clickskaterbuss = ClickClacks
			clickpedbuss = PedClickClacks
		}
	}
	SFX_ID_SIDEWALK_8FT = {
		roll = {
			sound = [
				sk8_Sidewalk_Slow
			]
			minvol = 0
			maxvol = 40
			minpitch = 85
			maxpitch = 100
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = linear
			volumecurve = inv_exponential
			pitchchangepercentageonturning = 108
			volsmoothfactorup = 1
			volsmoothfactordown = 1
			skaterbuss = Rolling
			pedbuss = PedRolling
			fastloop = on
			fastsound = [
				sk8_Sidewalk_Fast
			]
			fastminvol = 0
			fastmaxvol = 40
			fastminpitch = 90
			fastmaxpitch = 100
			fastdropoff = $terrainsound_defaultdropoff
			fastdropoff_function = linear
			fastpitchcurve = exponential
			fastvolumecurve = exponential
			fastskaterbuss = Rolling
			fastpedbuss = PedRolling
			clickklack = on
			clackmeters = 4
			clickklackontrans = on
			clickklackfrontsound = [
				Sk8_Terr_Sidewalk_Click_01
				Sk8_Terr_Sidewalk_Click_02
				Sk8_Terr_Sidewalk_Click_03
				Sk8_Terr_Sidewalk_Click_04
				Sk8_Terr_Sidewalk_Click_05
				Sk8_Terr_Sidewalk_Click_06
				Sk8_Terr_Sidewalk_Click_07
			]
			clickklackbacksound = [
				Sk8_Terr_Sidewalk_Clack_01
				Sk8_Terr_Sidewalk_Clack_02
				Sk8_Terr_Sidewalk_Clack_03
				Sk8_Terr_Sidewalk_Clack_04
				Sk8_Terr_Sidewalk_Clack_05
				Sk8_Terr_Sidewalk_Clack_06
				Sk8_Terr_Sidewalk_Clack_07
			]
			clickminvol = 25
			clickmaxvol = 65
			clickminpitch = 60
			clickmaxpitch = 85
			clickdropoff = $terrainsound_defaultdropoff
			clickdropoff_function = linear
			clickskaterbuss = ClickClacks
			clickpedbuss = PedClickClacks
		}
	}
	SFX_ID_CONCSMOOTH = {
		roll = {
			sound = [
				sk8_Sidewalk_Slow
			]
			minvol = 0
			maxvol = 40
			minpitch = 85
			maxpitch = 100
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = linear
			volumecurve = inv_exponential
			pitchchangepercentageonturning = 108
			volsmoothfactorup = 1
			volsmoothfactordown = 1
			skaterbuss = Rolling
			pedbuss = PedRolling
			fastloop = on
			fastsound = [
				sk8_Sidewalk_Fast
			]
			fastminvol = 0
			fastmaxvol = 40
			fastminpitch = 90
			fastmaxpitch = 100
			fastdropoff = $terrainsound_defaultdropoff
			fastdropoff_function = linear
			fastpitchcurve = exponential
			fastvolumecurve = exponential
			fastskaterbuss = Rolling
			fastpedbuss = PedRolling
		}
	}
	SFX_ID_CONCROUGH = {
		roll = {
			sound = [
				Sk8_Asphalt_Slow_01
			]
			minvol = 0
			maxvol = 75
			minpitch = 70
			maxpitch = 85
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = linear
			volumecurve = inv_exponential
			pitchchangepercentageonturning = 110
			volsmoothfactorup = 1
			volsmoothfactordown = 1
			skaterbuss = Rolling
			pedbuss = PedRolling
			fastloop = on
			fastsound = [
				Sk8_Asphalt_Fast_01
			]
			fastminvol = 0
			fastmaxvol = 75
			fastminpitch = 90
			fastmaxpitch = 100
			fastdropoff = $terrainsound_defaultdropoff
			fastdropoff_function = linear
			fastdropoff_function = linear
			fastpitchcurve = exponential
			fastvolumecurve = exponential
			fastskaterbuss = Rolling
			fastpedbuss = PedRolling
		}
	}
	SFX_ID_GLASS = {
		roll = {
			sound = [
				sk8_Sidewalk_Slow
			]
			minvol = 0
			maxvol = 40
			minpitch = 85
			maxpitch = 100
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = linear
			volumecurve = inv_exponential
			pitchchangepercentageonturning = 108
			volsmoothfactorup = 1
			volsmoothfactordown = 1
			skaterbuss = Rolling
			pedbuss = PedRolling
			fastloop = on
			fastsound = [
				sk8_Sidewalk_Fast
			]
			fastminvol = 0
			fastmaxvol = 40
			fastminpitch = 90
			fastmaxpitch = 100
			fastdropoff = $terrainsound_defaultdropoff
			fastdropoff_function = linear
			fastpitchcurve = exponential
			fastvolumecurve = exponential
			fastskaterbuss = Rolling
			fastpedbuss = PedRolling
			clickklack = on
			clackmeters = 1
			clickklackontrans = on
			clickklackfrontsound = [
				Sk8_Terr_Wood_Click_01
				Sk8_Terr_Wood_Click_02
				Sk8_Terr_Wood_Click_03
				Sk8_Terr_Wood_Click_04
				Sk8_Terr_Wood_Click_05
			]
			clickklackbacksound = [
				Sk8_Terr_Wood_Clack_01
				Sk8_Terr_Wood_Clack_02
				Sk8_Terr_Wood_Clack_03
				Sk8_Terr_Wood_Clack_04
				Sk8_Terr_Wood_Clack_05
			]
			clickminvol = 60
			clickmaxvol = 90
			clickminpitch = 70
			clickmaxpitch = 100
			clickdropoff = $terrainsound_defaultdropoff
			clickdropoff_function = linear
			clickskaterbuss = ClickClacks
			clickpedbuss = PedClickClacks
		}
		bonk = {
			sound = [
				sk8_GlassBonk_01
				sk8_GlassBonk_02
			]
			minvol = 80
			maxvol = 100
			minpitch = 60
			maxpitch = 140
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			sweetener = off
			sweetsound = [
			]
			sweetpercentchance = 100
			waittime = 1
			sweetminvol = 85
			sweetmaxvol = 100
			sweetminpitch = 90
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			LowEndSweetener = on
			lowendsweetsound = [
				sk9_BailBodyPunch02
			]
			lowendminvol = 20
			lowendmaxvol = 65
			lowendminpitch = 90
			lowendmaxpitch = 110
			lowenddropoff = $terrainsound_defaultdropoff
			lowenddropoff_function = linear
			skaterbuss = BodyFalls
			pedbuss = PedBodyFalls
			sweetskaterbuss = Sweetners
			sweetpedbuss = PedSweetners
			lowendskaterbuss = LowEnd
			lowendpedbuss = PedLowEnd
		}
		ollie = {
			sound = [
				sk8_Plastic_Ollie_01
			]
			minvol = 120
			maxvol = 160
			minpitch = 85
			maxpitch = 100
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = SkaterOllies
			pedbuss = PedOlliesLands
		}
		ollieland = {
			sound = [
				sk8_Plastic_Ollie_Land_11
			]
			minvol = 120
			maxvol = 160
			minpitch = 80
			maxpitch = 120
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = SkaterLands
			pedbuss = PedOlliesLands
		}
	}
	SFX_ID_TILE_6IN = {
		roll = {
			sound = [
				sk8_Sidewalk_Slow
			]
			minvol = 0
			maxvol = 40
			minpitch = 85
			maxpitch = 100
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = linear
			volumecurve = inv_exponential
			pitchchangepercentageonturning = 108
			volsmoothfactorup = 1
			volsmoothfactordown = 1
			skaterbuss = Rolling
			pedbuss = PedRolling
			fastloop = on
			fastsound = [
				sk8_Sidewalk_Fast
			]
			fastminvol = 0
			fastmaxvol = 40
			fastminpitch = 90
			fastmaxpitch = 100
			fastdropoff = $terrainsound_defaultdropoff
			fastdropoff_function = linear
			fastpitchcurve = exponential
			fastvolumecurve = exponential
			fastskaterbuss = Rolling
			fastpedbuss = PedRolling
			clickklack = on
			clackmeters = 0.6
			clickklackontrans = on
			clickklackfrontsound = [
				sk8_terr_tile_click_01
				sk8_terr_tile_click_02
				sk8_terr_tile_click_03
				sk8_terr_tile_click_04
				sk8_terr_tile_click_05
			]
			clickklackbacksound = [
				sk8_terr_tile_clack_01
				sk8_terr_tile_clack_02
				sk8_terr_tile_clack_03
				sk8_terr_tile_clack_04
				sk8_terr_tile_clack_05
			]
			clickminvol = 10
			clickmaxvol = 25
			clickminpitch = 60
			clickmaxpitch = 80
			clickdropoff = $terrainsound_defaultdropoff
			clickdropoff_function = linear
			clickskaterbuss = ClickClacks
			clickpedbuss = PedClickClacks
		}
	}
	SFX_ID_TILE_2FT = {
		roll = {
			sound = [
				sk8_Sidewalk_Slow
			]
			minvol = 0
			maxvol = 40
			minpitch = 85
			maxpitch = 100
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = linear
			volumecurve = inv_exponential
			pitchchangepercentageonturning = 108
			volsmoothfactorup = 1
			volsmoothfactordown = 1
			skaterbuss = Rolling
			pedbuss = PedRolling
			fastloop = on
			fastsound = [
				sk8_Sidewalk_Fast
			]
			fastminvol = 0
			fastmaxvol = 40
			fastminpitch = 90
			fastmaxpitch = 100
			fastdropoff = $terrainsound_defaultdropoff
			fastdropoff_function = linear
			fastpitchcurve = exponential
			fastvolumecurve = exponential
			fastskaterbuss = Rolling
			fastpedbuss = PedRolling
			clickklack = on
			clackmeters = 1.25
			clickklackontrans = on
			clickklackfrontsound = [
				sk8_terr_tile_click_01
				sk8_terr_tile_click_02
				sk8_terr_tile_click_03
				sk8_terr_tile_click_04
				sk8_terr_tile_click_05
			]
			clickklackbacksound = [
				sk8_terr_tile_clack_01
				sk8_terr_tile_clack_02
				sk8_terr_tile_clack_03
				sk8_terr_tile_clack_04
				sk8_terr_tile_clack_05
			]
			clickminvol = 10
			clickmaxvol = 20
			clickminpitch = 60
			clickmaxpitch = 80
			clickdropoff = $terrainsound_defaultdropoff
			clickdropoff_function = linear
			clickskaterbuss = ClickClacks
			clickpedbuss = PedClickClacks
		}
	}
	SFX_ID_TILE_4FT = {
		roll = {
			sound = [
				sk8_Sidewalk_Slow
			]
			minvol = 0
			maxvol = 40
			minpitch = 85
			maxpitch = 100
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = linear
			volumecurve = inv_exponential
			pitchchangepercentageonturning = 108
			volsmoothfactorup = 1
			volsmoothfactordown = 1
			skaterbuss = Rolling
			pedbuss = PedRolling
			fastloop = on
			fastsound = [
				sk8_Sidewalk_Fast
			]
			fastminvol = 0
			fastmaxvol = 40
			fastminpitch = 90
			fastmaxpitch = 100
			fastdropoff = $terrainsound_defaultdropoff
			fastdropoff_function = linear
			fastpitchcurve = exponential
			fastvolumecurve = exponential
			fastskaterbuss = Rolling
			fastpedbuss = PedRolling
			clickklack = on
			clackmeters = 3
			clickklackontrans = on
			clickklackfrontsound = [
				Sk8_Terr_Sidewalk_Click_01
				Sk8_Terr_Sidewalk_Click_02
				Sk8_Terr_Sidewalk_Click_03
				Sk8_Terr_Sidewalk_Click_04
				Sk8_Terr_Sidewalk_Click_05
				Sk8_Terr_Sidewalk_Click_06
				Sk8_Terr_Sidewalk_Click_07
			]
			clickklackbacksound = [
				Sk8_Terr_Sidewalk_Clack_01
				Sk8_Terr_Sidewalk_Clack_02
				Sk8_Terr_Sidewalk_Clack_03
				Sk8_Terr_Sidewalk_Clack_04
				Sk8_Terr_Sidewalk_Clack_05
				Sk8_Terr_Sidewalk_Clack_06
				Sk8_Terr_Sidewalk_Clack_07
			]
			clickminvol = 20
			clickmaxvol = 40
			clickminpitch = 60
			clickmaxpitch = 85
			clickdropoff = $terrainsound_defaultdropoff
			clickdropoff_function = linear
			clickskaterbuss = ClickClacks
			clickpedbuss = PedClickClacks
		}
	}
	SFX_ID_ASPHALT = {
	}
	SFX_ID_ASPHALTROUGH = {
		roll = {
			sound = [
				Sk8_Asphalt_Slow_01
			]
			minvol = 0
			maxvol = 75
			minpitch = 60
			maxpitch = 75
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = linear
			volumecurve = inv_exponential
			pitchchangepercentageonturning = 110
			volsmoothfactorup = 1
			volsmoothfactordown = 1
			skaterbuss = Rolling
			pedbuss = PedRolling
			fastloop = on
			fastsound = [
				Sk8_Asphalt_Fast_01
			]
			fastminvol = 0
			fastmaxvol = 100
			fastminpitch = 60
			fastmaxpitch = 75
			fastdropoff = $terrainsound_defaultdropoff
			fastdropoff_function = linear
			fastdropoff_function = linear
			fastpitchcurve = exponential
			fastvolumecurve = exponential
			fastskaterbuss = Rolling
			fastpedbuss = PedRolling
		}
	}
	SFX_ID_DIRT = {
		roll = {
			sound = [
				sk8_terr_hard_dirt_slow
			]
			minvol = 0
			maxvol = 90
			minpitch = 75
			maxpitch = 90
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = linear
			volumecurve = inv_exponential
			pitchchangepercentageonturning = 105
			volsmoothfactorup = 0
			volsmoothfactordown = 2
			skaterbuss = Rolling
			pedbuss = PedRolling
			fastloop = on
			fastsound = [
				sk8_terr_hard_dirt_fast
			]
			fastminvol = 0
			fastmaxvol = 100
			fastminpitch = 100
			fastmaxpitch = 100
			fastdropoff = $terrainsound_defaultdropoff
			fastdropoff_function = linear
			fastpitchcurve = exponential
			fastvolumecurve = exponential
			fastskaterbuss = Rolling
			fastpedbuss = PedRolling
		}
		footpush = {
			sound = [
				SK8_Grass_Pushes_02
			]
			minvol = 60
			maxvol = 110
			minpitch = 70
			maxpitch = 100
			pitchcurve = exponential
			volumecurve = exponential
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPush
			pedbuss = PedBoardPush
		}
		footstep = {
			walksound = [
				sk8_terr_dirt_feet_walk_01
				sk8_terr_dirt_feet_walk_02
				sk8_terr_dirt_feet_walk_03
			]
			runsound = [
				sk8_terr_dirt_feet_run_01
				sk8_terr_dirt_feet_run_02
				sk8_terr_dirt_feet_run_03
				sk8_terr_dirt_feet_run_04
			]
			minvol = 30
			maxvol = 70
			minpitch = 90
			maxpitch = 110
			dropoff = $TerrainSound_DefaultFootStepDropoff
			dropoff_function = linear
			skaterbuss = Footsteps
			pedbuss = PedFootsteps
			footsteplayer = off
			layersound = [
			]
			layerpercentchance = 10
			layervol = 20
			layerpitch = 100
			layerdropoff = $terrainsound_defaultdropoff
			layerdropoff_function = linear
			layerskaterbuss = footsteplayer
			layerpedbuss = PedFootstepLayer
		}
		ollie = {
			sound = [
				sk8_terr_dirt_ollie
			]
			minvol = 100
			maxvol = 100
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = SkaterOllies
			pedbuss = PedOlliesLands
		}
		ollieland = {
			sound = [
				sk8_terr_dirt_board_land_02
				sk8_terr_dirt_board_land_04
			]
			minvol = 90
			maxvol = 110
			minpitch = 80
			maxpitch = 120
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = SkaterLands
			pedbuss = PedOlliesLands
		}
		revert = {
			sound = [
				sk8_terr_dirt_revert_01
				sk8_terr_dirt_revert_05
			]
			minvol = 60
			maxvol = 80
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = Reverts
			pedbuss = PedReverts
		}
		footstepjump = {
			sound = [
				sk8_terr_dirt_feet_jump_05
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		footstepland = {
			sound = [
				sk8_terr_dirt_feet_land_02
				sk8_terr_dirt_feet_land_03
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		scuff = {
			sound = [
				sk8_terr_dirt_feet_scuff_02
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		boneless = {
			sound = [
				sk8_terr_dirt_boneless_05
			]
			minvol = 40
			maxvol = 50
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = boneless
			pedbuss = PedBoneless
		}
		boardpickup = {
			sound = [
				sk8_terr_dirt_kickup_03
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPickupPutdown
			pedbuss = PedBoardPickupPutdown
		}
		boardputdown = {
			sound = [
				sk8_terr_dirt_ptdwn_mvng_04
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPickupPutdown
			pedbuss = PedBoardPickupPutdown
		}
	}
	SFX_ID_GRASS = {
		roll = {
			sound = [
				sk8_terr_grass_slow_01
			]
			minvol = 0
			maxvol = 100
			minpitch = 65
			maxpitch = 80
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = linear
			volumecurve = inv_exponential
			pitchchangepercentageonturning = 135
			volsmoothfactorup = 0
			volsmoothfactordown = 3
			skaterbuss = Rolling
			pedbuss = PedRolling
			fastloop = on
			fastsound = [
				sk8_terr_grass_fast_01
			]
			fastminvol = 0
			fastmaxvol = 60
			fastminpitch = 90
			fastmaxpitch = 100
			fastdropoff = $terrainsound_defaultdropoff
			fastdropoff_function = linear
			fastpitchcurve = exponential
			fastvolumecurve = exponential
			fastskaterbuss = Rolling
			fastpedbuss = PedRolling
		}
		slide = {
			sound = [
				sk8_terr_hard_dirt_fast
			]
			minvol = 0
			maxvol = 90
			minpitch = 75
			maxpitch = 90
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = linear
			volumecurve = inv_exponential
			pitchchangepercentageonturning = 105
			volsmoothfactorup = 0
			volsmoothfactordown = 2
			skaterbuss = Sliding
			pedbuss = PedSliding
		}
		footpush = {
			sound = [
				SK8_Grass_Pushes_02
			]
			minvol = 60
			maxvol = 110
			minpitch = 70
			maxpitch = 100
			pitchcurve = exponential
			volumecurve = exponential
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPush
			pedbuss = PedBoardPush
		}
		slidefall = {
			sound = [
				sk8_terr_grass_slow_01
			]
			minvol = 0
			maxvol = 100
			minpitch = 60
			maxpitch = 140
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			pitchcurve = linear
			volumecurve = linear
			volsmoothfactorup = 2
			volsmoothfactordown = 6
			skaterbuss = BailSlide
			pedbuss = PedBailSlide
			terrainsweetener = off
			terrainsweetenersound = [
				sk8_terr_water_roll_loop
			]
			sweetminvol = 0
			sweetmaxvol = 200
			sweetminpitch = 60
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			sweetpitchcurve = linear
			sweetvolumecurve = exponential
			sweetskaterbuss = BailSlide
			sweetpedbuss = PedBailSlide
		}
		footstep = {
			walksound = [
				sk8_terr_grass_walk_thck_01
				sk8_terr_grass_walk_thck_02
				sk8_terr_grass_walk_thck_03
			]
			runsound = [
				sk8_terr_grass_run_thick_01
				sk8_terr_grass_run_thick_02
				sk8_terr_grass_run_thick_03
				sk8_terr_grass_run_thick_04
			]
			minvol = 5
			maxvol = 20
			minpitch = 90
			maxpitch = 110
			dropoff = $TerrainSound_DefaultFootStepDropoff
			dropoff_function = linear
			skaterbuss = Footsteps
			pedbuss = PedFootsteps
			footsteplayer = off
			layersound = [
			]
			layerpercentchance = 10
			layervol = 20
			layerpitch = 100
			layerdropoff = $terrainsound_defaultdropoff
			layerdropoff_function = linear
			layerskaterbuss = footsteplayer
			layerpedbuss = PedFootstepLayer
		}
		bodyfall = {
			sound = [
				sk9_bodyfall_torso_01
				sk9_bodyfall_torso_02
			]
			minvol = 10
			maxvol = 30
			minpitch = 80
			maxpitch = 120
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			sweetener = on
			sweetsound = [
				sk8_terr_grass_run_thick_01
				sk8_terr_grass_run_thick_02
				sk8_terr_grass_run_thick_03
				sk8_terr_grass_run_thick_04
			]
			sweetpercentchance = 100
			waittime = 0.01
			sweetminvol = 50
			sweetmaxvol = 100
			sweetminpitch = 90
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			LowEndSweetener = on
			lowendsweetsound = [
				sk9_BailBodyPunch01
				sk9_BailBodyPunch02
				sk9_BailBodyPunch03
				sk9_BailBodyPunch04
			]
			lowendminvol = 0
			lowendmaxvol = 80
			lowendminpitch = 90
			lowendmaxpitch = 110
			lowenddropoff = $terrainsound_defaultdropoff
			lowenddropoff_function = linear
			skaterbuss = BodyFalls
			pedbuss = PedBodyFalls
			sweetskaterbuss = Sweetners
			sweetpedbuss = PedSweetners
			lowendskaterbuss = LowEnd
			lowendpedbuss = PedLowEnd
		}
		headfall = {
			sound = [
				sk9_bodyfall_head
			]
			minvol = 10
			maxvol = 30
			minpitch = 80
			maxpitch = 120
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			sweetener = on
			sweetsound = [
				sk8_terr_grass_run_thick_01
				sk8_terr_grass_run_thick_02
				sk8_terr_grass_run_thick_03
				sk8_terr_grass_run_thick_04
			]
			sweetpercentchance = 100
			waittime = 0.01
			sweetminvol = 50
			sweetmaxvol = 100
			sweetminpitch = 90
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			LowEndSweetener = off
			lowendsweetsound = [
			]
			lowendminvol = 0
			lowendmaxvol = 100
			lowendminpitch = 90
			lowendmaxpitch = 110
			lowenddropoff = $terrainsound_defaultdropoff
			lowenddropoff_function = linear
			skaterbuss = BodyFalls
			pedbuss = PedBodyFalls
			sweetskaterbuss = Sweetners
			sweetpedbuss = PedSweetners
			lowendskaterbuss = LowEnd
			lowendpedbuss = PedLowEnd
		}
		legfall = {
			sound = [
				sk9_bodyfall_leg_01
				sk9_bodyfall_leg_02
				sk9_bodyfall_leg_03
				sk9_bodyfall_leg_04
			]
			minvol = 10
			maxvol = 30
			minpitch = 80
			maxpitch = 120
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			sweetener = on
			sweetsound = [
				sk8_terr_grass_run_thick_01
				sk8_terr_grass_run_thick_02
				sk8_terr_grass_run_thick_03
				sk8_terr_grass_run_thick_04
			]
			sweetpercentchance = 100
			waittime = 0.01
			sweetminvol = 50
			sweetmaxvol = 100
			sweetminpitch = 90
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			LowEndSweetener = off
			lowendsweetsound = [
			]
			lowendminvol = 0
			lowendmaxvol = 100
			lowendminpitch = 90
			lowendmaxpitch = 110
			lowenddropoff = $terrainsound_defaultdropoff
			lowenddropoff_function = linear
			skaterbuss = BodyFalls
			pedbuss = PedBodyFalls
			sweetskaterbuss = Sweetners
			sweetpedbuss = PedSweetners
			lowendskaterbuss = LowEnd
			lowendpedbuss = PedLowEnd
		}
		armfall = {
			sound = [
				sk9_bodyfall_arm_01
				sk9_bodyfall_arm_02
				sk9_bodyfall_arm_03
			]
			minvol = 10
			maxvol = 30
			minpitch = 80
			maxpitch = 120
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			sweetener = on
			sweetsound = [
				sk8_terr_grass_run_thick_01
				sk8_terr_grass_run_thick_02
				sk8_terr_grass_run_thick_03
				sk8_terr_grass_run_thick_04
			]
			sweetpercentchance = 100
			waittime = 0.01
			sweetminvol = 50
			sweetmaxvol = 100
			sweetminpitch = 90
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			LowEndSweetener = off
			lowendsweetsound = [
			]
			lowendminvol = 0
			lowendmaxvol = 100
			lowendminpitch = 90
			lowendmaxpitch = 110
			lowenddropoff = $terrainsound_defaultdropoff
			lowenddropoff_function = linear
			skaterbuss = BodyFalls
			pedbuss = PedBodyFalls
			sweetskaterbuss = Sweetners
			sweetpedbuss = PedSweetners
			lowendskaterbuss = LowEnd
			lowendpedbuss = PedLowEnd
		}
		nutsfall = {
			sound = [
				BailCrack01
			]
			minvol = 10
			maxvol = 30
			minpitch = 80
			maxpitch = 120
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			sweetener = on
			sweetsound = [
				sk8_terr_grass_run_thick_01
				sk8_terr_grass_run_thick_02
				sk8_terr_grass_run_thick_03
				sk8_terr_grass_run_thick_04
			]
			sweetpercentchance = 100
			waittime = 0.01
			sweetminvol = 50
			sweetmaxvol = 100
			sweetminpitch = 90
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			LowEndSweetener = off
			lowendsweetsound = [
			]
			lowendminvol = 0
			lowendmaxvol = 100
			lowendminpitch = 90
			lowendmaxpitch = 110
			lowenddropoff = $terrainsound_defaultdropoff
			lowenddropoff_function = linear
			skaterbuss = BodyFalls
			pedbuss = PedBodyFalls
			sweetskaterbuss = Sweetners
			sweetpedbuss = PedSweetners
			lowendskaterbuss = LowEnd
			lowendpedbuss = PedLowEnd
		}
		ollie = {
			sound = [
				GrassTemp_03
			]
			minvol = 100
			maxvol = 100
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = SkaterOllies
			pedbuss = PedOlliesLands
		}
		ollieland = {
			sound = [
				sk8_terr_grass_board_lnd_03
				sk8_terr_grass_board_lnd_04
			]
			minvol = 40
			maxvol = 90
			minpitch = 80
			maxpitch = 120
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = SkaterLands
			pedbuss = PedOlliesLands
		}
		slideon = {
			sound = [
				sk8_terr_roof_slide_on_09
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		slideoff = {
			sound = [
				sk8_wood_land_03
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		revert = {
			sound = [
				sk8_terr_grass_revert_02
				sk8_terr_grass_revert_05
			]
			minvol = 40
			maxvol = 50
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = Reverts
			pedbuss = PedReverts
		}
		footstepjump = {
			sound = [
				sk8_terr_grass_feet_jump_05
			]
			minvol = 120
			maxvol = 130
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		footstepland = {
			sound = [
				sk8_terr_grass_feet_land_02
				sk8_terr_grass_feet_land_04
			]
			minvol = 50
			maxvol = 80
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		scuff = {
			sound = [
				sk8_terr_grass_feet_scff_04
			]
			minvol = 5
			maxvol = 10
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		boneless = {
			sound = [
				sk8_terr_grass_boneless_04
			]
			minvol = 50
			maxvol = 60
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = boneless
			pedbuss = PedBoneless
		}
		boardpickup = {
			sound = [
				sk8_terr_grass_kickup_04
			]
			minvol = 40
			maxvol = 50
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPickupPutdown
			pedbuss = PedBoardPickupPutdown
		}
		boardputdown = {
			sound = [
				sk8_terr_grass_putdown_02
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPickupPutdown
			pedbuss = PedBoardPickupPutdown
		}
		handplant = {
			sound = [
				Metal_Ladder_Footstep_03
				Metal_Ladder_Footstep_09
				Metal_Ladder_Footstep_13
				Metal_Ladder_Footstep_16
				Metal_Ladder_Handstep_05
				Metal_Ladder_Handstep_06
			]
			minvol = 105
			maxvol = 115
			minpitch = 110
			maxpitch = 135
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
	}
	SFX_ID_CANVASAWNING = {
		roll = {
			sound = [
				Sk9_Canvas_Tent_Roll_Tone2
			]
			minvol = 0
			maxvol = 60
			minpitch = 105
			maxpitch = 120
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = linear
			volumecurve = inv_exponential
			pitchchangepercentageonturning = 120
			volsmoothfactorup = 1
			volsmoothfactordown = 1
			skaterbuss = Rolling
			pedbuss = PedRolling
			fastloop = off
			fastsound = [
				sk8_terr_grass_fast_01
			]
			fastminvol = 0
			fastmaxvol = 60
			fastminpitch = 90
			fastmaxpitch = 100
			fastdropoff = $terrainsound_defaultdropoff
			fastdropoff_function = linear
			fastpitchcurve = exponential
			fastvolumecurve = exponential
			fastskaterbuss = Rolling
			fastpedbuss = PedRolling
		}
		bonk = {
			sound = [
				Sk9_Canvas_Bonk_02
			]
			minvol = 125
			maxvol = 150
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			sweetener = off
			sweetsound = [
			]
			sweetpercentchance = 100
			waittime = 1
			sweetminvol = 85
			sweetmaxvol = 100
			sweetminpitch = 90
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			LowEndSweetener = on
			lowendsweetsound = [
				sk9_BailBodyPunch02
			]
			lowendminvol = 20
			lowendmaxvol = 45
			lowendminpitch = 90
			lowendmaxpitch = 110
			lowenddropoff = $terrainsound_defaultdropoff
			lowenddropoff_function = linear
			skaterbuss = BodyFalls
			pedbuss = PedBodyFalls
			sweetskaterbuss = Sweetners
			sweetpedbuss = PedSweetners
			lowendskaterbuss = LowEnd
			lowendpedbuss = PedLowEnd
		}
		footstep = {
			walksound = [
				sk8_terr_grass_walk_thck_01
				sk8_terr_grass_walk_thck_02
				sk8_terr_grass_walk_thck_03
			]
			runsound = [
				sk8_terr_grass_run_thick_01
				sk8_terr_grass_run_thick_02
				sk8_terr_grass_run_thick_03
				sk8_terr_grass_run_thick_04
			]
			minvol = 2
			maxvol = 5
			minpitch = 150
			maxpitch = 180
			dropoff = $TerrainSound_DefaultFootStepDropoff
			dropoff_function = linear
			skaterbuss = Footsteps
			pedbuss = PedFootsteps
			footsteplayer = on
			layersound = [
				Sk9_Canvas_Footstep_01
				Sk9_Canvas_Footstep_02
				Sk9_Canvas_Footstep_03
				Sk9_Canvas_Footstep_04
			]
			layerpercentchance = 100
			layervol = 20
			layerpitch = 100
			layerdropoff = $terrainsound_defaultdropoff
			layerdropoff_function = linear
			layerskaterbuss = footsteplayer
			layerpedbuss = PedFootstepLayer
		}
		ollie = {
			sound = [
				GrassTemp_03
			]
			minvol = 70
			maxvol = 80
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = SkaterOllies
			pedbuss = PedOlliesLands
		}
		ollieland = {
			sound = [
				sk9_Canvas_Ollie_Land_01
				sk9_Canvas_Ollie_Land_02
			]
			minvol = 80
			maxvol = 110
			minpitch = 80
			maxpitch = 120
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = SkaterLands
			pedbuss = PedOlliesLands
		}
		revert = {
			sound = [
				sk8_terr_grass_revert_02
				sk8_terr_grass_revert_05
			]
			minvol = 40
			maxvol = 50
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = Reverts
			pedbuss = PedReverts
		}
		footstepjump = {
			sound = [
				sk8_terr_grass_feet_jump_05
			]
			minvol = 50
			maxvol = 70
			minpitch = 140
			maxpitch = 160
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		footstepland = {
			sound = [
				sk9_Canvas_Ollie_Land_01
				sk9_Canvas_Ollie_Land_02
			]
			minvol = 30
			maxvol = 40
			minpitch = 80
			maxpitch = 100
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		scuff = {
			sound = [
				sk8_terr_grass_feet_scff_04
			]
			minvol = 5
			maxvol = 10
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		boneless = {
			sound = [
				sk8_terr_grass_boneless_04
			]
			minvol = 50
			maxvol = 60
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = boneless
			pedbuss = PedBoneless
		}
		boardpickup = {
			sound = [
				sk8_terr_grass_kickup_04
			]
			minvol = 20
			maxvol = 40
			minpitch = 140
			maxpitch = 160
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPickupPutdown
			pedbuss = PedBoardPickupPutdown
		}
		boardputdown = {
			sound = [
				sk8_terr_grass_putdown_02
			]
			minvol = 60
			maxvol = 80
			minpitch = 140
			maxpitch = 160
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPickupPutdown
			pedbuss = PedBoardPickupPutdown
		}
		handplant = {
			sound = [
				sk8_terr_dirt_feet_walk_01
				sk8_terr_dirt_feet_walk_02
				sk8_terr_dirt_feet_walk_03
			]
			minvol = 120
			maxvol = 140
			minpitch = 150
			maxpitch = 160
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
	}
	SFX_ID_CARPET = {
		roll = {
			sound = [
				sk8_Carpet_Loop_Slow
			]
			minvol = 0
			maxvol = 20
			minpitch = 105
			maxpitch = 120
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = linear
			volumecurve = inv_exponential
			pitchchangepercentageonturning = 120
			volsmoothfactorup = 1
			volsmoothfactordown = 1
			skaterbuss = Rolling
			pedbuss = PedRolling
			fastloop = off
			fastsound = [
				sk8_terr_grass_fast_01
			]
			fastminvol = 0
			fastmaxvol = 60
			fastminpitch = 90
			fastmaxpitch = 100
			fastdropoff = $terrainsound_defaultdropoff
			fastdropoff_function = linear
			fastpitchcurve = exponential
			fastvolumecurve = exponential
			fastskaterbuss = Rolling
			fastpedbuss = PedRolling
		}
		Grind = {
			sound = [
				sk8_terr_grass_fast_01
			]
			minvol = 0
			maxvol = 70
			minpitch = 80
			maxpitch = 90
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = inv_exponential
			volumecurve = inv_exponential
			skaterbuss = Grinding
			pedbuss = PedGrinding
		}
		slide = {
			sound = [
				sk8_terr_grass_fast_01
			]
			minvol = 0
			maxvol = 70
			minpitch = 70
			maxpitch = 80
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = inv_exponential
			volumecurve = inv_exponential
			skaterbuss = Grinding
			pedbuss = PedGrinding
		}
		bonk = {
			sound = [
				GrassTemp_03
			]
			minvol = 35
			maxvol = 50
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			sweetener = off
			sweetsound = [
			]
			sweetpercentchance = 100
			waittime = 1
			sweetminvol = 85
			sweetmaxvol = 100
			sweetminpitch = 90
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			LowEndSweetener = Of
			lowendsweetsound = [
				sk9_BailBodyPunch02
			]
			lowendminvol = 20
			lowendmaxvol = 45
			lowendminpitch = 90
			lowendmaxpitch = 110
			lowenddropoff = $terrainsound_defaultdropoff
			lowenddropoff_function = linear
			skaterbuss = BodyFalls
			pedbuss = PedBodyFalls
			sweetskaterbuss = Sweetners
			sweetpedbuss = PedSweetners
			lowendskaterbuss = LowEnd
			lowendpedbuss = PedLowEnd
		}
		footstep = {
			walksound = [
				sk8_terr_grass_walk_thck_01
				sk8_terr_grass_walk_thck_02
				sk8_terr_grass_walk_thck_03
			]
			runsound = [
				sk8_terr_grass_run_thick_01
				sk8_terr_grass_run_thick_02
				sk8_terr_grass_run_thick_03
				sk8_terr_grass_run_thick_04
			]
			minvol = 2
			maxvol = 8
			minpitch = 150
			maxpitch = 180
			dropoff = $TerrainSound_DefaultFootStepDropoff
			dropoff_function = linear
			skaterbuss = Footsteps
			pedbuss = PedFootsteps
			footsteplayer = off
			layersound = [
			]
			layerpercentchance = 10
			layervol = 20
			layerpitch = 100
			layerdropoff = $terrainsound_defaultdropoff
			layerdropoff_function = linear
			layerskaterbuss = footsteplayer
			layerpedbuss = PedFootstepLayer
		}
		ollie = {
			sound = [
				GrassTemp_03
			]
			minvol = 70
			maxvol = 80
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = SkaterOllies
			pedbuss = PedOlliesLands
		}
		ollieland = {
			sound = [
				sk8_terr_grass_board_lnd_03
				sk8_terr_grass_board_lnd_04
			]
			minvol = 40
			maxvol = 70
			minpitch = 80
			maxpitch = 120
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = SkaterLands
			pedbuss = PedOlliesLands
		}
		grindon = {
			sound = [
				sk8_terr_grass_board_lnd_03
			]
			minvol = 80
			maxvol = 90
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		grindoff = {
			sound = [
				GrassTemp_03
			]
			minvol = 80
			maxvol = 90
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		slideon = {
			sound = [
				sk8_terr_grass_board_lnd_04
			]
			minvol = 80
			maxvol = 90
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		slideoff = {
			sound = [
				GrassTemp_03
			]
			minvol = 80
			maxvol = 90
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		revert = {
			sound = [
				sk8_terr_grass_revert_02
				sk8_terr_grass_revert_05
			]
			minvol = 40
			maxvol = 50
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = Reverts
			pedbuss = PedReverts
		}
		footstepjump = {
			sound = [
				sk8_terr_grass_feet_jump_05
			]
			minvol = 30
			maxvol = 50
			minpitch = 140
			maxpitch = 160
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		footstepland = {
			sound = [
				sk8_terr_grass_feet_land_02
				sk8_terr_grass_feet_land_04
			]
			minvol = 20
			maxvol = 30
			minpitch = 140
			maxpitch = 160
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		scuff = {
			sound = [
				sk8_terr_grass_feet_scff_04
			]
			minvol = 5
			maxvol = 10
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		boneless = {
			sound = [
				sk8_terr_grass_boneless_04
			]
			minvol = 50
			maxvol = 60
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = boneless
			pedbuss = PedBoneless
		}
		boardpickup = {
			sound = [
				sk8_terr_grass_kickup_04
			]
			minvol = 20
			maxvol = 40
			minpitch = 140
			maxpitch = 160
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPickupPutdown
			pedbuss = PedBoardPickupPutdown
		}
		boardputdown = {
			sound = [
				sk8_terr_grass_putdown_02
			]
			minvol = 60
			maxvol = 80
			minpitch = 140
			maxpitch = 160
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPickupPutdown
			pedbuss = PedBoardPickupPutdown
		}
	}
	SFX_ID_BRICK_6IN = {
		roll = {
			sound = [
				Sk8_Asphalt_Slow_01
			]
			minvol = 0
			maxvol = 80
			minpitch = 60
			maxpitch = 75
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = linear
			volumecurve = inv_exponential
			pitchchangepercentageonturning = 110
			volsmoothfactorup = 1
			volsmoothfactordown = 1
			skaterbuss = Rolling
			pedbuss = PedRolling
			fastloop = on
			fastsound = [
				Sk8_Asphalt_Fast_01
			]
			fastminvol = 0
			fastmaxvol = 100
			fastminpitch = 60
			fastmaxpitch = 75
			fastdropoff = $terrainsound_defaultdropoff
			fastdropoff_function = linear
			fastdropoff_function = linear
			fastpitchcurve = exponential
			fastvolumecurve = exponential
			fastskaterbuss = Rolling
			fastpedbuss = PedRolling
			clickklack = on
			clackmeters = 0.5
			clickklackontrans = on
			clickklackfrontsound = [
				Sk8_Terr_Sidewalk_Click_01
				Sk8_Terr_Sidewalk_Click_02
				Sk8_Terr_Sidewalk_Click_03
				Sk8_Terr_Sidewalk_Click_04
				Sk8_Terr_Sidewalk_Click_05
				Sk8_Terr_Sidewalk_Click_06
				Sk8_Terr_Sidewalk_Click_07
			]
			clickklackbacksound = [
				Sk8_Terr_Sidewalk_Clack_01
				Sk8_Terr_Sidewalk_Clack_02
				Sk8_Terr_Sidewalk_Clack_03
				Sk8_Terr_Sidewalk_Clack_04
				Sk8_Terr_Sidewalk_Clack_05
				Sk8_Terr_Sidewalk_Clack_06
				Sk8_Terr_Sidewalk_Clack_07
			]
			clickminvol = 0
			clickmaxvol = 45
			clickminpitch = 55
			clickmaxpitch = 70
			clickdropoff = $terrainsound_defaultdropoff
			clickdropoff_function = linear
			clickskaterbuss = ClickClacks
			clickpedbuss = PedClickClacks
		}
		bonk = {
			sound = [
				sk8_bonk_wood_01
				sk8_bonk_wood_02
				sk8_bonk_wood_03
				sk8_bonk_wood_04
				sk8_bonk_wood_05
			]
			minvol = 80
			maxvol = 100
			minpitch = 90
			maxpitch = 110
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			sweetener = off
			sweetsound = [
			]
			sweetpercentchance = 100
			waittime = 1
			sweetminvol = 85
			sweetmaxvol = 100
			sweetminpitch = 90
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			LowEndSweetener = on
			lowendsweetsound = [
				sk9_BailBodyPunch02
			]
			lowendminvol = 20
			lowendmaxvol = 45
			lowendminpitch = 90
			lowendmaxpitch = 110
			lowenddropoff = $terrainsound_defaultdropoff
			lowenddropoff_function = linear
			skaterbuss = BodyFalls
			pedbuss = PedBodyFalls
			sweetskaterbuss = Sweetners
			sweetpedbuss = PedSweetners
			lowendskaterbuss = LowEnd
			lowendpedbuss = PedLowEnd
		}
		Grind = {
			sound = [
				sk8_terr_concrete_grind
			]
			minvol = 0
			maxvol = 40
			minpitch = 85
			maxpitch = 90
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = inv_exponential
			volumecurve = inv_exponential
			skaterbuss = Grinding
			pedbuss = PedGrinding
			clickklack = on
			clackmeters = 0.65000004
			clickklackontrans = on
			clickklackfrontsound = [
				Sk8_Terr_Sidewalk_Click_01
				Sk8_Terr_Sidewalk_Click_02
				Sk8_Terr_Sidewalk_Click_03
				Sk8_Terr_Sidewalk_Click_04
				Sk8_Terr_Sidewalk_Click_05
				Sk8_Terr_Sidewalk_Click_06
				Sk8_Terr_Sidewalk_Click_07
			]
			clickklackbacksound = [
				Sk8_Terr_Sidewalk_Clack_01
				Sk8_Terr_Sidewalk_Clack_02
				Sk8_Terr_Sidewalk_Clack_03
				Sk8_Terr_Sidewalk_Clack_04
				Sk8_Terr_Sidewalk_Clack_05
				Sk8_Terr_Sidewalk_Clack_06
				Sk8_Terr_Sidewalk_Clack_07
			]
			clickminvol = 50
			clickmaxvol = 80
			clickminpitch = 70
			clickmaxpitch = 100
			clickdropoff = $terrainsound_defaultdropoff
			clickdropoff_function = linear
			clickskaterbuss = ClickClacks
			clickpedbuss = PedClickClacks
		}
		slide = {
			sound = [
				sk8_terr_conc_slide_nose
			]
			minvol = 0
			maxvol = 40
			minpitch = 90
			maxpitch = 90
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = inv_exponential
			volumecurve = inv_exponential
			skaterbuss = Sliding
			pedbuss = PedSliding
			clickklack = on
			clackmeters = 0.75
			clickklackontrans = on
			clickklackfrontsound = [
				Sk8_Terr_Sidewalk_Click_01
				Sk8_Terr_Sidewalk_Click_02
				Sk8_Terr_Sidewalk_Click_03
				Sk8_Terr_Sidewalk_Click_04
				Sk8_Terr_Sidewalk_Click_05
				Sk8_Terr_Sidewalk_Click_06
				Sk8_Terr_Sidewalk_Click_07
			]
			clickklackbacksound = [
				Sk8_Terr_Sidewalk_Clack_01
				Sk8_Terr_Sidewalk_Clack_02
				Sk8_Terr_Sidewalk_Clack_03
				Sk8_Terr_Sidewalk_Clack_04
				Sk8_Terr_Sidewalk_Clack_05
				Sk8_Terr_Sidewalk_Clack_06
				Sk8_Terr_Sidewalk_Clack_07
			]
			clickminvol = 70
			clickmaxvol = 100
			clickminpitch = 80
			clickmaxpitch = 100
			clickdropoff = $terrainsound_defaultdropoff
			clickdropoff_function = linear
			clickskaterbuss = ClickClacks
			clickpedbuss = PedClickClacks
		}
		grindon = {
			sound = [
				sk8_terr_sidewalk_grnd_n_01
				sk8_terr_sidewalk_grnd_n_02
				sk8_terr_sidewalk_grnd_n_03
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		grindoff = {
			sound = [
				sk8_terr_sidewlk_grnd_ff_02
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		slideon = {
			sound = [
				sk8_terr_sidewlk_N_sld_n_01
				sk8_terr_sidewlk_N_sld_n_02
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		slideoff = {
			sound = [
				sk8_terr_sidewlk_N_sld_ff02
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
	}
	SFX_ID_BRICK_1FT = {
		roll = {
			sound = [
				Sk8_Asphalt_Slow_01
			]
			minvol = 0
			maxvol = 70
			minpitch = 60
			maxpitch = 75
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = linear
			volumecurve = inv_exponential
			pitchchangepercentageonturning = 110
			volsmoothfactorup = 1
			volsmoothfactordown = 1
			skaterbuss = Rolling
			pedbuss = PedRolling
			fastloop = on
			fastsound = [
				Sk8_Asphalt_Fast_01
			]
			fastminvol = 0
			fastmaxvol = 50
			fastminpitch = 90
			fastmaxpitch = 100
			fastdropoff = $terrainsound_defaultdropoff
			fastdropoff_function = linear
			fastpitchcurve = exponential
			fastvolumecurve = exponential
			fastskaterbuss = Rolling
			fastpedbuss = PedRolling
			clickklack = on
			clackmeters = 0.75
			clickklackontrans = on
			clickklackfrontsound = [
				Sk8_Terr_Sidewalk_Click_01
				Sk8_Terr_Sidewalk_Click_02
				Sk8_Terr_Sidewalk_Click_03
				Sk8_Terr_Sidewalk_Click_04
				Sk8_Terr_Sidewalk_Click_05
				Sk8_Terr_Sidewalk_Click_06
				Sk8_Terr_Sidewalk_Click_07
			]
			clickklackbacksound = [
				Sk8_Terr_Sidewalk_Clack_01
				Sk8_Terr_Sidewalk_Clack_02
				Sk8_Terr_Sidewalk_Clack_03
				Sk8_Terr_Sidewalk_Clack_04
				Sk8_Terr_Sidewalk_Clack_05
				Sk8_Terr_Sidewalk_Clack_06
				Sk8_Terr_Sidewalk_Clack_07
			]
			clickminvol = 20
			clickmaxvol = 40
			clickminpitch = 70
			clickmaxpitch = 90
			clickdropoff = $terrainsound_defaultdropoff
			clickdropoff_function = linear
			clickskaterbuss = ClickClacks
			clickpedbuss = PedClickClacks
		}
	}
	SFX_ID_BRICK_2FT = {
		roll = {
			sound = [
				Sk8_Asphalt_Slow_01
			]
			minvol = 0
			maxvol = 60
			minpitch = 60
			maxpitch = 75
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = linear
			volumecurve = inv_exponential
			pitchchangepercentageonturning = 110
			volsmoothfactorup = 1
			volsmoothfactordown = 1
			skaterbuss = Rolling
			pedbuss = PedRolling
			fastloop = on
			fastsound = [
				Sk8_Asphalt_Fast_01
			]
			fastminvol = 0
			fastmaxvol = 50
			fastminpitch = 90
			fastmaxpitch = 100
			fastdropoff = $terrainsound_defaultdropoff
			fastdropoff_function = linear
			fastpitchcurve = exponential
			fastvolumecurve = exponential
			fastskaterbuss = Rolling
			fastpedbuss = PedRolling
			clickklack = on
			clackmeters = 1.4
			clickklackontrans = on
			clickklackfrontsound = [
				Sk8_Terr_Sidewalk_Click_01
				Sk8_Terr_Sidewalk_Click_02
				Sk8_Terr_Sidewalk_Click_03
				Sk8_Terr_Sidewalk_Click_04
				Sk8_Terr_Sidewalk_Click_05
				Sk8_Terr_Sidewalk_Click_06
				Sk8_Terr_Sidewalk_Click_07
			]
			clickklackbacksound = [
				Sk8_Terr_Sidewalk_Clack_01
				Sk8_Terr_Sidewalk_Clack_02
				Sk8_Terr_Sidewalk_Clack_03
				Sk8_Terr_Sidewalk_Clack_04
				Sk8_Terr_Sidewalk_Clack_05
				Sk8_Terr_Sidewalk_Clack_06
				Sk8_Terr_Sidewalk_Clack_07
			]
			clickminvol = 35
			clickmaxvol = 50
			clickminpitch = 70
			clickmaxpitch = 90
			clickdropoff = $terrainsound_defaultdropoff
			clickdropoff_function = linear
			clickskaterbuss = ClickClacks
			clickpedbuss = PedClickClacks
		}
	}
	SFX_ID_WATERSHALLOW = {
		roll = {
			sound = [
				sk8_terr_water_roll_loop
			]
			minvol = 0
			maxvol = 50
			minpitch = 90
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = linear
			volumecurve = inv_exponential
			pitchchangepercentageonturning = 110
			volsmoothfactorup = 2
			volsmoothfactordown = 10
			skaterbuss = Rolling
			pedbuss = PedRolling
			fastloop = on
			fastsound = [
				sk8_terr_water_roll_fast
			]
			fastminvol = 0
			fastmaxvol = 40
			fastminpitch = 90
			fastmaxpitch = 100
			fastdropoff = $terrainsound_defaultdropoff
			fastdropoff_function = linear
			fastpitchcurve = exponential
			fastvolumecurve = exponential
			fastskaterbuss = Rolling
			fastpedbuss = PedRolling
			soundontrans = on
			transitionsound = [
				sk8_terr_water_enter_08
				sk8_terr_water_enter_10
				sk8_terr_water_enter_12
				sk8_terr_water_enter_13
				sk8_terr_water_enter_15
			]
			transminvol = 85
			transmaxvol = 110
			transminpitch = 70
			transmaxpitch = 120
			transdropoff = $terrainsound_defaultdropoff
			transdropoff_function = linear
			soundonexit = on
			exitsound = [
				sk8_terr_water_exit_01
				sk8_terr_water_exit_03
			]
			exitminvol = 65
			exitmaxvol = 85
			exitminpitch = 80
			exitmaxpitch = 120
			exitdropoff = $terrainsound_defaultdropoff
			exitdropoff_function = linear
			transskaterbuss = TransitionSounds
			transpedbuss = PedTransitionSounds
		}
		bonk = {
			sound = [
				BailBodyFall01
				BailBodyFall02
				BailBodyFall03
				BailBodyFall04
				BailBodyFall05
			]
			minvol = 60
			maxvol = 80
			minpitch = 90
			maxpitch = 110
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			sweetener = on
			sweetsound = [
				sk8_terr_water_exit_01
				sk8_terr_water_exit_03
			]
			sweetpercentchance = 100
			waittime = 0.1
			sweetminvol = 85
			sweetmaxvol = 100
			sweetminpitch = 90
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			LowEndSweetener = off
			lowendsweetsound = [
				sk9_BailBodyPunch02
			]
			lowendminvol = 20
			lowendmaxvol = 65
			lowendminpitch = 90
			lowendmaxpitch = 110
			lowenddropoff = $terrainsound_defaultdropoff
			lowenddropoff_function = linear
			skaterbuss = BodyFalls
			pedbuss = PedBodyFalls
			sweetskaterbuss = Sweetners
			sweetpedbuss = PedSweetners
			lowendskaterbuss = LowEnd
			lowendpedbuss = PedLowEnd
		}
		slidefall = {
			sound = [
				sk8_terr_water_roll_loop
			]
			minvol = 0
			maxvol = 40
			minpitch = 60
			maxpitch = 140
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			pitchcurve = linear
			volumecurve = inv_exponential
			volsmoothfactorup = 2
			volsmoothfactordown = 30
			skaterbuss = BailSlide
			pedbuss = PedBailSlide
			terrainsweetener = off
			terrainsweetenersound = [
				sk8_terr_water_roll_loop
			]
			sweetminvol = 0
			sweetmaxvol = 200
			sweetminpitch = 60
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			sweetpitchcurve = linear
			sweetvolumecurve = exponential
			sweetskaterbuss = BailSlide
			sweetpedbuss = PedBailSlide
		}
		footpush = {
			sound = [
				SK8_Water_Pushes_01
			]
			minvol = 75
			maxvol = 100
			minpitch = 70
			maxpitch = 100
			pitchcurve = exponential
			volumecurve = exponential
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPush
			pedbuss = PedBoardPush
		}
		footstep = {
			walksound = [
				sk8_terr_water_feet_walk_04
				sk8_terr_water_feet_walk_08
				sk8_terr_water_feet_walk_12
				sk8_terr_water_feet_walk_13
			]
			runsound = [
				sk8_terr_water_feet_runC_01
				sk8_terr_water_feet_runC_02
				sk8_terr_water_feet_runC_03
				sk8_terr_water_feet_runC_04
				sk8_terr_water_feet_runC_05
				sk8_terr_water_feet_runC_06
			]
			minvol = 25
			maxvol = 50
			minpitch = 90
			maxpitch = 110
			dropoff = $TerrainSound_DefaultFootStepDropoff
			dropoff_function = linear
			skaterbuss = Footsteps
			pedbuss = PedFootsteps
			footsteplayer = off
			layersound = [
			]
			layerpercentchance = 10
			layervol = 20
			layerpitch = 100
			layerdropoff = $terrainsound_defaultdropoff
			layerdropoff_function = linear
			layerskaterbuss = footsteplayer
			layerpedbuss = PedFootstepLayer
		}
		bodyfall = {
			sound = [
				sk8_terr_water_enter_08
				sk8_terr_water_enter_10
				sk8_terr_water_enter_12
				sk8_terr_water_enter_13
				sk8_terr_water_enter_15
			]
			minvol = 50
			maxvol = 90
			minpitch = 90
			maxpitch = 110
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			sweetener = off
			sweetsound = [
			]
			sweetpercentchance = 100
			waittime = 0
			sweetminvol = 40
			sweetmaxvol = 80
			sweetminpitch = 90
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			LowEndSweetener = off
			lowendsweetsound = [
			]
			lowendminvol = 0
			lowendmaxvol = 100
			lowendminpitch = 90
			lowendmaxpitch = 110
			lowenddropoff = $terrainsound_defaultdropoff
			lowenddropoff_function = linear
			skaterbuss = BodyFalls
			pedbuss = PedBodyFalls
			sweetskaterbuss = Sweetners
			sweetpedbuss = PedSweetners
			lowendskaterbuss = LowEnd
			lowendpedbuss = PedLowEnd
		}
		headfall = {
			sound = [
				sk8_terr_water_exit_01
				sk8_terr_water_exit_03
			]
			minvol = 50
			maxvol = 90
			minpitch = 90
			maxpitch = 110
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			sweetener = off
			sweetsound = [
			]
			sweetpercentchance = 100
			waittime = 0
			sweetminvol = 40
			sweetmaxvol = 80
			sweetminpitch = 90
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			LowEndSweetener = off
			lowendsweetsound = [
			]
			lowendminvol = 0
			lowendmaxvol = 100
			lowendminpitch = 90
			lowendmaxpitch = 110
			lowenddropoff = $terrainsound_defaultdropoff
			lowenddropoff_function = linear
			skaterbuss = BodyFalls
			pedbuss = PedBodyFalls
			sweetskaterbuss = Sweetners
			sweetpedbuss = PedSweetners
			lowendskaterbuss = LowEnd
			lowendpedbuss = PedLowEnd
		}
		legfall = {
			sound = [
				sk8_terr_water_enter_08
				sk8_terr_water_enter_10
				sk8_terr_water_enter_12
				sk8_terr_water_enter_13
				sk8_terr_water_enter_15
			]
			minvol = 50
			maxvol = 90
			minpitch = 90
			maxpitch = 110
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			sweetener = off
			sweetsound = [
			]
			sweetpercentchance = 100
			waittime = 0
			sweetminvol = 40
			sweetmaxvol = 80
			sweetminpitch = 90
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			LowEndSweetener = off
			lowendsweetsound = [
			]
			lowendminvol = 0
			lowendmaxvol = 100
			lowendminpitch = 90
			lowendmaxpitch = 110
			lowenddropoff = $terrainsound_defaultdropoff
			lowenddropoff_function = linear
			skaterbuss = BodyFalls
			pedbuss = PedBodyFalls
			sweetskaterbuss = Sweetners
			sweetpedbuss = PedSweetners
			lowendskaterbuss = LowEnd
			lowendpedbuss = PedLowEnd
		}
		armfall = {
			sound = [
				sk8_terr_water_exit_01
				sk8_terr_water_exit_03
			]
			minvol = 50
			maxvol = 90
			minpitch = 90
			maxpitch = 110
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			sweetener = off
			sweetsound = [
			]
			sweetpercentchance = 100
			waittime = 0
			sweetminvol = 40
			sweetmaxvol = 80
			sweetminpitch = 90
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			LowEndSweetener = off
			lowendsweetsound = [
			]
			lowendminvol = 0
			lowendmaxvol = 100
			lowendminpitch = 90
			lowendmaxpitch = 110
			lowenddropoff = $terrainsound_defaultdropoff
			lowenddropoff_function = linear
			skaterbuss = BodyFalls
			pedbuss = PedBodyFalls
			sweetskaterbuss = Sweetners
			sweetpedbuss = PedSweetners
			lowendskaterbuss = LowEnd
			lowendpedbuss = PedLowEnd
		}
		nutsfall = {
			sound = [
				sk8_terr_water_exit_01
				sk8_terr_water_exit_03
			]
			minvol = 50
			maxvol = 90
			minpitch = 90
			maxpitch = 110
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			sweetener = off
			sweetsound = [
			]
			sweetpercentchance = 100
			waittime = 0
			sweetminvol = 40
			sweetmaxvol = 80
			sweetminpitch = 90
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			LowEndSweetener = off
			lowendsweetsound = [
			]
			lowendminvol = 0
			lowendmaxvol = 100
			lowendminpitch = 90
			lowendmaxpitch = 110
			lowenddropoff = $terrainsound_defaultdropoff
			lowenddropoff_function = linear
			skaterbuss = BodyFalls
			pedbuss = PedBodyFalls
			sweetskaterbuss = Sweetners
			sweetpedbuss = PedSweetners
			lowendskaterbuss = LowEnd
			lowendpedbuss = PedLowEnd
		}
		ollie = {
			sound = [
				SK8_Asphalt_Ollie_01
				SK8_Asphalt_Ollie_03
				SK8_Asphalt_Ollie_04
				SK9_Asphalt_Ollie_05
				SK9_Asphalt_Ollie_06
				SK9_Asphalt_Ollie_07
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = SkaterOllies
			pedbuss = PedOlliesLands
		}
		ollieland = {
			sound = [
				SK8_Asphalt_Land_05
				SK8_Asphalt_Land_06
				SK8_Asphalt_Land_07
				SK8_Asphalt_Land_09
			]
			minvol = 90
			maxvol = 110
			minpitch = 50
			maxpitch = 80
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = SkaterLands
			pedbuss = PedOlliesLands
		}
		revert = {
			sound = [
				SK8_Water_Pushes_01
			]
			minvol = 70
			maxvol = 100
			minpitch = 125
			maxpitch = 155
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = Reverts
			pedbuss = PedReverts
		}
		pogo = {
			sound = [
				sk8_terr_water_feet_runC_01
				sk8_terr_water_feet_runC_02
				sk8_terr_water_feet_runC_03
				sk8_terr_water_feet_runC_04
				sk8_terr_water_feet_runC_05
				sk8_terr_water_feet_runC_06
			]
			minvol = 20
			maxvol = 30
			minpitch = 140
			maxpitch = 160
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = pogo
			pedbuss = PedPogo
		}
		footstepjump = {
			sound = [
				sk8_terr_water_exit_01
				sk8_terr_water_exit_03
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		footstepland = {
			sound = [
				sk8_terr_water_enter_08
				sk8_terr_water_enter_10
				sk8_terr_water_enter_12
				sk8_terr_water_enter_13
				sk8_terr_water_enter_15
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		scuff = {
			sound = [
				SK8_Water_Pushes_01
			]
			minvol = 95
			maxvol = 105
			minpitch = 125
			maxpitch = 145
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		boneless = {
			sound = [
				SK8_Asphalt_Boneless_02
				SK8_Asphalt_Boneless_04
			]
			minvol = 80
			maxvol = 90
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = boneless
			pedbuss = PedBoneless
		}
		boardpickup = {
			sound = [
				SK8_Asphalt_KickUp_03
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPickupPutdown
			pedbuss = PedBoardPickupPutdown
		}
		boardputdown = {
			sound = [
				Sk8_Conc_PutDown_01
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPickupPutdown
			pedbuss = PedBoardPickupPutdown
		}
	}
	SFX_ID_SHALLOWWATERPOOLTILE = {
		roll = {
			sound = [
				sk8_terr_water_roll_loop
			]
			minvol = 0
			maxvol = 50
			minpitch = 90
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = linear
			volumecurve = inv_exponential
			pitchchangepercentageonturning = 110
			volsmoothfactorup = 2
			volsmoothfactordown = 10
			skaterbuss = Rolling
			pedbuss = PedRolling
			fastloop = on
			fastsound = [
				sk8_terr_water_roll_fast
			]
			fastminvol = 0
			fastmaxvol = 40
			fastminpitch = 90
			fastmaxpitch = 100
			fastdropoff = $terrainsound_defaultdropoff
			fastdropoff_function = linear
			fastpitchcurve = exponential
			fastvolumecurve = exponential
			fastskaterbuss = Rolling
			fastpedbuss = PedRolling
			clickklack = on
			clackmeters = 0.4
			clickklackontrans = on
			clickklackfrontsound = [
				sk8_terr_tile_click_01
				sk8_terr_tile_click_02
				sk8_terr_tile_click_03
				sk8_terr_tile_click_04
				sk8_terr_tile_click_05
			]
			clickklackbacksound = [
				sk8_terr_tile_clack_01
				sk8_terr_tile_clack_02
				sk8_terr_tile_clack_03
				sk8_terr_tile_clack_04
				sk8_terr_tile_clack_05
			]
			clickminvol = 10
			clickmaxvol = 20
			clickminpitch = 60
			clickmaxpitch = 80
			clickdropoff = $terrainsound_defaultdropoff
			clickdropoff_function = linear
			clickskaterbuss = ClickClacks
			clickpedbuss = PedClickClacks
			soundontrans = on
			transitionsound = [
				sk8_terr_water_enter_08
				sk8_terr_water_enter_10
				sk8_terr_water_enter_12
				sk8_terr_water_enter_13
				sk8_terr_water_enter_15
			]
			transminvol = 85
			transmaxvol = 110
			transminpitch = 70
			transmaxpitch = 120
			transdropoff = $terrainsound_defaultdropoff
			transdropoff_function = linear
			soundonexit = on
			exitsound = [
				sk8_terr_water_exit_01
				sk8_terr_water_exit_03
			]
			exitminvol = 65
			exitmaxvol = 85
			exitminpitch = 80
			exitmaxpitch = 120
			exitdropoff = $terrainsound_defaultdropoff
			exitdropoff_function = linear
			transskaterbuss = TransitionSounds
			transpedbuss = PedTransitionSounds
		}
		bonk = {
			sound = [
				BailBodyFall01
				BailBodyFall02
				BailBodyFall03
				BailBodyFall04
				BailBodyFall05
			]
			minvol = 60
			maxvol = 80
			minpitch = 90
			maxpitch = 110
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			sweetener = on
			sweetsound = [
				sk8_terr_water_exit_01
				sk8_terr_water_exit_03
			]
			sweetpercentchance = 100
			waittime = 0.1
			sweetminvol = 85
			sweetmaxvol = 100
			sweetminpitch = 90
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			LowEndSweetener = off
			lowendsweetsound = [
				sk9_BailBodyPunch02
			]
			lowendminvol = 20
			lowendmaxvol = 65
			lowendminpitch = 90
			lowendmaxpitch = 110
			lowenddropoff = $terrainsound_defaultdropoff
			lowenddropoff_function = linear
			skaterbuss = BodyFalls
			pedbuss = PedBodyFalls
			sweetskaterbuss = Sweetners
			sweetpedbuss = PedSweetners
			lowendskaterbuss = LowEnd
			lowendpedbuss = PedLowEnd
		}
		slidefall = {
			sound = [
				sk8_terr_water_roll_loop
			]
			minvol = 0
			maxvol = 40
			minpitch = 60
			maxpitch = 140
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			pitchcurve = linear
			volumecurve = inv_exponential
			volsmoothfactorup = 2
			volsmoothfactordown = 30
			skaterbuss = BailSlide
			pedbuss = PedBailSlide
			terrainsweetener = off
			terrainsweetenersound = [
				sk8_terr_water_roll_loop
			]
			sweetminvol = 0
			sweetmaxvol = 200
			sweetminpitch = 60
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			sweetpitchcurve = linear
			sweetvolumecurve = exponential
			sweetskaterbuss = BailSlide
			sweetpedbuss = PedBailSlide
		}
		footpush = {
			sound = [
				SK8_Water_Pushes_01
			]
			minvol = 75
			maxvol = 100
			minpitch = 70
			maxpitch = 100
			pitchcurve = exponential
			volumecurve = exponential
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPush
			pedbuss = PedBoardPush
		}
		footstep = {
			walksound = [
				sk8_terr_water_feet_walk_04
				sk8_terr_water_feet_walk_08
				sk8_terr_water_feet_walk_12
				sk8_terr_water_feet_walk_13
			]
			runsound = [
				sk8_terr_water_feet_runC_01
				sk8_terr_water_feet_runC_02
				sk8_terr_water_feet_runC_03
				sk8_terr_water_feet_runC_04
				sk8_terr_water_feet_runC_05
				sk8_terr_water_feet_runC_06
			]
			minvol = 25
			maxvol = 50
			minpitch = 90
			maxpitch = 110
			dropoff = $TerrainSound_DefaultFootStepDropoff
			dropoff_function = linear
			skaterbuss = Footsteps
			pedbuss = PedFootsteps
			footsteplayer = off
			layersound = [
			]
			layerpercentchance = 10
			layervol = 20
			layerpitch = 100
			layerdropoff = $terrainsound_defaultdropoff
			layerdropoff_function = linear
			layerskaterbuss = footsteplayer
			layerpedbuss = PedFootstepLayer
		}
		bodyfall = {
			sound = [
				sk8_terr_water_enter_08
				sk8_terr_water_enter_10
				sk8_terr_water_enter_12
				sk8_terr_water_enter_13
				sk8_terr_water_enter_15
			]
			minvol = 50
			maxvol = 90
			minpitch = 90
			maxpitch = 110
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			sweetener = off
			sweetsound = [
			]
			sweetpercentchance = 100
			waittime = 0
			sweetminvol = 40
			sweetmaxvol = 80
			sweetminpitch = 90
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			LowEndSweetener = off
			lowendsweetsound = [
			]
			lowendminvol = 0
			lowendmaxvol = 100
			lowendminpitch = 90
			lowendmaxpitch = 110
			lowenddropoff = $terrainsound_defaultdropoff
			lowenddropoff_function = linear
			skaterbuss = BodyFalls
			pedbuss = PedBodyFalls
			sweetskaterbuss = Sweetners
			sweetpedbuss = PedSweetners
			lowendskaterbuss = LowEnd
			lowendpedbuss = PedLowEnd
		}
		headfall = {
			sound = [
				sk8_terr_water_exit_01
				sk8_terr_water_exit_03
			]
			minvol = 50
			maxvol = 90
			minpitch = 90
			maxpitch = 110
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			sweetener = off
			sweetsound = [
			]
			sweetpercentchance = 100
			waittime = 0
			sweetminvol = 40
			sweetmaxvol = 80
			sweetminpitch = 90
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			LowEndSweetener = off
			lowendsweetsound = [
			]
			lowendminvol = 0
			lowendmaxvol = 100
			lowendminpitch = 90
			lowendmaxpitch = 110
			lowenddropoff = $terrainsound_defaultdropoff
			lowenddropoff_function = linear
			skaterbuss = BodyFalls
			pedbuss = PedBodyFalls
			sweetskaterbuss = Sweetners
			sweetpedbuss = PedSweetners
			lowendskaterbuss = LowEnd
			lowendpedbuss = PedLowEnd
		}
		legfall = {
			sound = [
				sk8_terr_water_enter_08
				sk8_terr_water_enter_10
				sk8_terr_water_enter_12
				sk8_terr_water_enter_13
				sk8_terr_water_enter_15
			]
			minvol = 50
			maxvol = 90
			minpitch = 90
			maxpitch = 110
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			sweetener = off
			sweetsound = [
			]
			sweetpercentchance = 100
			waittime = 0
			sweetminvol = 40
			sweetmaxvol = 80
			sweetminpitch = 90
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			LowEndSweetener = off
			lowendsweetsound = [
			]
			lowendminvol = 0
			lowendmaxvol = 100
			lowendminpitch = 90
			lowendmaxpitch = 110
			lowenddropoff = $terrainsound_defaultdropoff
			lowenddropoff_function = linear
			skaterbuss = BodyFalls
			pedbuss = PedBodyFalls
			sweetskaterbuss = Sweetners
			sweetpedbuss = PedSweetners
			lowendskaterbuss = LowEnd
			lowendpedbuss = PedLowEnd
		}
		armfall = {
			sound = [
				sk8_terr_water_exit_01
				sk8_terr_water_exit_03
			]
			minvol = 50
			maxvol = 90
			minpitch = 90
			maxpitch = 110
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			sweetener = off
			sweetsound = [
			]
			sweetpercentchance = 100
			waittime = 0
			sweetminvol = 40
			sweetmaxvol = 80
			sweetminpitch = 90
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			LowEndSweetener = off
			lowendsweetsound = [
			]
			lowendminvol = 0
			lowendmaxvol = 100
			lowendminpitch = 90
			lowendmaxpitch = 110
			lowenddropoff = $terrainsound_defaultdropoff
			lowenddropoff_function = linear
			skaterbuss = BodyFalls
			pedbuss = PedBodyFalls
			sweetskaterbuss = Sweetners
			sweetpedbuss = PedSweetners
			lowendskaterbuss = LowEnd
			lowendpedbuss = PedLowEnd
		}
		nutsfall = {
			sound = [
				sk8_terr_water_exit_01
				sk8_terr_water_exit_03
			]
			minvol = 50
			maxvol = 90
			minpitch = 90
			maxpitch = 110
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			sweetener = off
			sweetsound = [
			]
			sweetpercentchance = 100
			waittime = 0
			sweetminvol = 40
			sweetmaxvol = 80
			sweetminpitch = 90
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			LowEndSweetener = off
			lowendsweetsound = [
			]
			lowendminvol = 0
			lowendmaxvol = 100
			lowendminpitch = 90
			lowendmaxpitch = 110
			lowenddropoff = $terrainsound_defaultdropoff
			lowenddropoff_function = linear
			skaterbuss = BodyFalls
			pedbuss = PedBodyFalls
			sweetskaterbuss = Sweetners
			sweetpedbuss = PedSweetners
			lowendskaterbuss = LowEnd
			lowendpedbuss = PedLowEnd
		}
		ollie = {
			sound = [
				SK8_Asphalt_Ollie_01
				SK8_Asphalt_Ollie_03
				SK8_Asphalt_Ollie_04
				SK9_Asphalt_Ollie_05
				SK9_Asphalt_Ollie_06
				SK9_Asphalt_Ollie_07
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = SkaterOllies
			pedbuss = PedOlliesLands
		}
		ollieland = {
			sound = [
				SK8_Asphalt_Land_05
				SK8_Asphalt_Land_06
				SK8_Asphalt_Land_07
				SK8_Asphalt_Land_09
			]
			minvol = 90
			maxvol = 110
			minpitch = 50
			maxpitch = 80
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = SkaterLands
			pedbuss = PedOlliesLands
		}
		revert = {
			sound = [
				SK8_Water_Pushes_01
			]
			minvol = 70
			maxvol = 100
			minpitch = 125
			maxpitch = 155
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = Reverts
			pedbuss = PedReverts
		}
		pogo = {
			sound = [
				sk8_terr_water_feet_runC_01
				sk8_terr_water_feet_runC_02
				sk8_terr_water_feet_runC_03
				sk8_terr_water_feet_runC_04
				sk8_terr_water_feet_runC_05
				sk8_terr_water_feet_runC_06
			]
			minvol = 20
			maxvol = 30
			minpitch = 140
			maxpitch = 160
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = pogo
			pedbuss = PedPogo
		}
		footstepjump = {
			sound = [
				sk8_terr_water_exit_01
				sk8_terr_water_exit_03
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		footstepland = {
			sound = [
				sk8_terr_water_enter_08
				sk8_terr_water_enter_10
				sk8_terr_water_enter_12
				sk8_terr_water_enter_13
				sk8_terr_water_enter_15
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		scuff = {
			sound = [
				SK8_Water_Pushes_01
			]
			minvol = 95
			maxvol = 105
			minpitch = 125
			maxpitch = 145
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		boneless = {
			sound = [
				SK8_Asphalt_Boneless_02
				SK8_Asphalt_Boneless_04
			]
			minvol = 80
			maxvol = 90
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = boneless
			pedbuss = PedBoneless
		}
		boardpickup = {
			sound = [
				SK8_Asphalt_KickUp_03
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPickupPutdown
			pedbuss = PedBoardPickupPutdown
		}
		boardputdown = {
			sound = [
				Sk8_Conc_PutDown_01
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPickupPutdown
			pedbuss = PedBoardPickupPutdown
		}
	}
	SFX_ID_WOODPLYWOOD = {
		roll = {
			sound = [
				sk8_Temp_Wood_Loop
			]
			minvol = 0
			maxvol = 50
			minpitch = 80
			maxpitch = 100
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = linear
			volumecurve = inv_exponential
			pitchchangepercentageonturning = 110
			volsmoothfactorup = 1
			volsmoothfactordown = 1
			skaterbuss = Rolling
			pedbuss = PedRolling
			fastloop = on
			fastsound = [
				sk8_Temp_Wood_Fast
			]
			fastminvol = 0
			fastmaxvol = 50
			fastminpitch = 90
			fastmaxpitch = 100
			fastdropoff = $terrainsound_defaultdropoff
			fastdropoff_function = linear
			fastpitchcurve = exponential
			fastvolumecurve = exponential
			fastskaterbuss = Rolling
			fastpedbuss = PedRolling
			clickklack = on
			clackmeters = 3
			clickklackontrans = on
			clickklackfrontsound = [
				Sk8_Terr_Wood_Click_01
				Sk8_Terr_Wood_Click_02
				Sk8_Terr_Wood_Click_03
				Sk8_Terr_Wood_Click_04
				Sk8_Terr_Wood_Click_05
			]
			clickklackbacksound = [
				Sk8_Terr_Wood_Clack_01
				Sk8_Terr_Wood_Clack_02
				Sk8_Terr_Wood_Clack_03
				Sk8_Terr_Wood_Clack_04
				Sk8_Terr_Wood_Clack_05
			]
			clickminvol = 15
			clickmaxvol = 30
			clickminpitch = 70
			clickmaxpitch = 100
			clickdropoff = $terrainsound_defaultdropoff
			clickdropoff_function = linear
			clickskaterbuss = ClickClacks
			clickpedbuss = PedClickClacks
		}
		bonk = {
			sound = [
				sk8_bonk_wood_01
				sk8_bonk_wood_02
				sk8_bonk_wood_03
				sk8_bonk_wood_04
				sk8_bonk_wood_05
			]
			minvol = 80
			maxvol = 100
			minpitch = 90
			maxpitch = 110
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			sweetener = off
			sweetsound = [
			]
			sweetpercentchance = 100
			waittime = 1
			sweetminvol = 85
			sweetmaxvol = 100
			sweetminpitch = 90
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			LowEndSweetener = on
			lowendsweetsound = [
				sk9_BailBodyPunch02
			]
			lowendminvol = 20
			lowendmaxvol = 45
			lowendminpitch = 90
			lowendmaxpitch = 110
			lowenddropoff = $terrainsound_defaultdropoff
			lowenddropoff_function = linear
			skaterbuss = BodyFalls
			pedbuss = PedBodyFalls
			sweetskaterbuss = Sweetners
			sweetpedbuss = PedSweetners
			lowendskaterbuss = LowEnd
			lowendpedbuss = PedLowEnd
		}
		Grind = {
			sound = [
				SK9_Wood_Grind_Proto
			]
			minvol = 0
			maxvol = 80
			minpitch = 85
			maxpitch = 90
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = inv_exponential
			volumecurve = inv_exponential
			skaterbuss = Grinding
			pedbuss = PedGrinding
		}
		slide = {
			sound = [
				sk8_SolidWood_Slide_01
			]
			minvol = 0
			maxvol = 80
			minpitch = 90
			maxpitch = 90
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = inv_exponential
			volumecurve = inv_exponential
			skaterbuss = Sliding
			pedbuss = PedSliding
		}
		footstep = {
			walksound = [
				sk8_wood_feet_walk_01
				sk8_wood_feet_walk_02
				sk8_wood_feet_walk_03
			]
			runsound = [
				sk8_wood_feet_run_01
				sk8_wood_feet_run_02
				sk8_wood_feet_run_03
				sk8_wood_feet_run_04
			]
			minvol = 15
			maxvol = 30
			minpitch = 90
			maxpitch = 110
			dropoff = $TerrainSound_DefaultFootStepDropoff
			dropoff_function = linear
			skaterbuss = Footsteps
			pedbuss = PedFootsteps
			footsteplayer = off
			layersound = [
			]
			layerpercentchance = 10
			layervol = 20
			layerpitch = 100
			layerdropoff = $terrainsound_defaultdropoff
			layerdropoff_function = linear
			layerskaterbuss = footsteplayer
			layerpedbuss = PedFootstepLayer
		}
		ollie = {
			sound = [
				sk8_wood_ollie_02
				sk8_wood_ollie_03
			]
			minvol = 150
			maxvol = 200
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = SkaterOllies
			pedbuss = PedOlliesLands
		}
		ollieland = {
			sound = [
				sk8_wood_land_03
			]
			minvol = 90
			maxvol = 110
			minpitch = 80
			maxpitch = 120
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = SkaterLands
			pedbuss = PedOlliesLands
		}
		grindon = {
			sound = [
				sk8_wood_ollie_02
				sk8_wood_ollie_03
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		grindoff = {
			sound = [
				sk8_wood_land_03
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		slideon = {
			sound = [
				sk8_wood_ollie_02
				sk8_wood_ollie_03
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		slideoff = {
			sound = [
				sk8_wood_land_03
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		revert = {
			sound = [
				sk8_wood_revert_01
				sk8_wood_revert_02
			]
			minvol = 80
			maxvol = 100
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = Reverts
			pedbuss = PedReverts
		}
		pogo = {
			sound = [
				Plywood_Hit_03
				Plywood_Hit_04
				Plywood_Hit_06
			]
			minvol = 30
			maxvol = 50
			minpitch = 75
			maxpitch = 85
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = pogo
			pedbuss = PedPogo
		}
		footstepjump = {
			sound = [
				sk8_wood_feet_jump_04
			]
			minvol = 40
			maxvol = 60
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		footstepland = {
			sound = [
				sk8_wood_feet_land_01
				sk8_wood_feet_land_02
			]
			minvol = 70
			maxvol = 90
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		scuff = {
			sound = [
				sk8_wood_feet_scuff_02
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		boneless = {
			sound = [
				sk8_wood_Boneless_03
			]
			minvol = 80
			maxvol = 90
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = boneless
			pedbuss = PedBoneless
		}
		boardpickup = {
			sound = [
				sk8_wood_pickup_02
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPickupPutdown
			pedbuss = PedBoardPickupPutdown
		}
		boardputdown = {
			sound = [
				sk8_wood_putdown_03
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPickupPutdown
			pedbuss = PedBoardPickupPutdown
		}
	}
	SFX_ID_SHINGLES = {
		roll = {
			sound = [
				RollWoodPier
			]
			minvol = 0
			maxvol = 50
			minpitch = 90
			maxpitch = 120
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = linear
			volumecurve = inv_exponential
			pitchchangepercentageonturning = 110
			volsmoothfactorup = 1
			volsmoothfactordown = 1
			skaterbuss = Rolling
			pedbuss = PedRolling
			fastloop = on
			fastsound = [
				sk8_Temp_Wood_Fast
			]
			fastminvol = 0
			fastmaxvol = 50
			fastminpitch = 90
			fastmaxpitch = 100
			fastdropoff = $terrainsound_defaultdropoff
			fastdropoff_function = linear
			fastpitchcurve = exponential
			fastvolumecurve = exponential
			fastskaterbuss = Rolling
			fastpedbuss = PedRolling
			clickklack = on
			clackmeters = 0.5
			clickklackontrans = on
			clickklackfrontsound = [
				Sk8_Terr_Wood_Click_01
				Sk8_Terr_Wood_Click_02
				Sk8_Terr_Wood_Click_03
				Sk8_Terr_Wood_Click_04
				Sk8_Terr_Wood_Click_05
			]
			clickklackbacksound = [
				Sk8_Terr_Wood_Clack_01
				Sk8_Terr_Wood_Clack_02
				Sk8_Terr_Wood_Clack_03
				Sk8_Terr_Wood_Clack_04
				Sk8_Terr_Wood_Clack_05
			]
			clickminvol = 35
			clickmaxvol = 60
			clickminpitch = 70
			clickmaxpitch = 100
			clickdropoff = $terrainsound_defaultdropoff
			clickdropoff_function = linear
			clickskaterbuss = ClickClacks
			clickpedbuss = PedClickClacks
		}
		bonk = {
			sound = [
				sk8_bonk_wood_01
				sk8_bonk_wood_02
				sk8_bonk_wood_03
				sk8_bonk_wood_04
				sk8_bonk_wood_05
			]
			minvol = 80
			maxvol = 100
			minpitch = 90
			maxpitch = 110
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			sweetener = off
			sweetsound = [
			]
			sweetpercentchance = 100
			waittime = 1
			sweetminvol = 85
			sweetmaxvol = 100
			sweetminpitch = 90
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			LowEndSweetener = on
			lowendsweetsound = [
				sk9_BailBodyPunch02
			]
			lowendminvol = 20
			lowendmaxvol = 45
			lowendminpitch = 90
			lowendmaxpitch = 110
			lowenddropoff = $terrainsound_defaultdropoff
			lowenddropoff_function = linear
			skaterbuss = BodyFalls
			pedbuss = PedBodyFalls
			sweetskaterbuss = Sweetners
			sweetpedbuss = PedSweetners
			lowendskaterbuss = LowEnd
			lowendpedbuss = PedLowEnd
		}
		Grind = {
			sound = [
				SK9_Wood_Grind_Proto
			]
			minvol = 0
			maxvol = 80
			minpitch = 85
			maxpitch = 90
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = inv_exponential
			volumecurve = inv_exponential
			skaterbuss = Grinding
			pedbuss = PedGrinding
		}
		slide = {
			sound = [
				sk8_SolidWood_Slide_01
			]
			minvol = 0
			maxvol = 80
			minpitch = 90
			maxpitch = 90
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = inv_exponential
			volumecurve = inv_exponential
			skaterbuss = Sliding
			pedbuss = PedSliding
		}
		footstep = {
			walksound = [
				sk8_wood_feet_walk_01
				sk8_wood_feet_walk_02
				sk8_wood_feet_walk_03
			]
			runsound = [
				sk8_wood_feet_run_01
				sk8_wood_feet_run_02
				sk8_wood_feet_run_03
				sk8_wood_feet_run_04
			]
			minvol = 15
			maxvol = 30
			minpitch = 90
			maxpitch = 110
			dropoff = $TerrainSound_DefaultFootStepDropoff
			dropoff_function = linear
			skaterbuss = Footsteps
			pedbuss = PedFootsteps
			footsteplayer = off
			layersound = [
			]
			layerpercentchance = 10
			layervol = 20
			layerpitch = 100
			layerdropoff = $terrainsound_defaultdropoff
			layerdropoff_function = linear
			layerskaterbuss = footsteplayer
			layerpedbuss = PedFootstepLayer
		}
		ollie = {
			sound = [
				sk8_wood_ollie_02
				sk8_wood_ollie_03
			]
			minvol = 150
			maxvol = 200
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = SkaterOllies
			pedbuss = PedOlliesLands
		}
		ollieland = {
			sound = [
				sk8_wood_land_03
			]
			minvol = 90
			maxvol = 110
			minpitch = 80
			maxpitch = 120
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = SkaterLands
			pedbuss = PedOlliesLands
		}
		grindon = {
			sound = [
				sk8_WoodSolid_GrindOn_01
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		grindoff = {
			sound = [
				sk8_WoodSolid_GrindOff_03
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		slideon = {
			sound = [
				sk8_WoodSolid_SlideOn_01
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		slideoff = {
			sound = [
				sk8_WoodSolid_SlideOff_01
				sk8_WoodSolid_SlideOff_02
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		revert = {
			sound = [
				sk8_wood_revert_01
				sk8_wood_revert_02
			]
			minvol = 80
			maxvol = 100
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = Reverts
			pedbuss = PedReverts
		}
		pogo = {
			sound = [
				Plywood_Hit_03
				Plywood_Hit_04
				Plywood_Hit_06
			]
			minvol = 30
			maxvol = 50
			minpitch = 75
			maxpitch = 85
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = pogo
			pedbuss = PedPogo
		}
		footstepjump = {
			sound = [
				sk8_wood_feet_jump_04
			]
			minvol = 40
			maxvol = 60
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		footstepland = {
			sound = [
				sk8_wood_feet_land_01
				sk8_wood_feet_land_02
			]
			minvol = 70
			maxvol = 90
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		scuff = {
			sound = [
				sk8_wood_feet_scuff_02
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		boneless = {
			sound = [
				sk8_wood_Boneless_03
			]
			minvol = 80
			maxvol = 90
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = boneless
			pedbuss = PedBoneless
		}
		boardpickup = {
			sound = [
				sk8_wood_pickup_02
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPickupPutdown
			pedbuss = PedBoardPickupPutdown
		}
		boardputdown = {
			sound = [
				sk8_wood_putdown_03
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPickupPutdown
			pedbuss = PedBoardPickupPutdown
		}
	}
	SFX_ID_SHINGLESWOOD = {
		roll = {
			sound = [
				RollWoodPier
			]
			minvol = 0
			maxvol = 50
			minpitch = 90
			maxpitch = 120
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = linear
			volumecurve = inv_exponential
			pitchchangepercentageonturning = 110
			volsmoothfactorup = 1
			volsmoothfactordown = 1
			skaterbuss = Rolling
			pedbuss = PedRolling
			fastloop = on
			fastsound = [
				sk8_Temp_Wood_Fast
			]
			fastminvol = 0
			fastmaxvol = 50
			fastminpitch = 90
			fastmaxpitch = 100
			fastdropoff = $terrainsound_defaultdropoff
			fastdropoff_function = linear
			fastpitchcurve = exponential
			fastvolumecurve = exponential
			fastskaterbuss = Rolling
			fastpedbuss = PedRolling
			clickklack = on
			clackmeters = 0.5
			clickklackontrans = on
			clickklackfrontsound = [
				Sk8_Terr_Wood_Click_01
				Sk8_Terr_Wood_Click_02
				Sk8_Terr_Wood_Click_03
				Sk8_Terr_Wood_Click_04
				Sk8_Terr_Wood_Click_05
			]
			clickklackbacksound = [
				Sk8_Terr_Wood_Clack_01
				Sk8_Terr_Wood_Clack_02
				Sk8_Terr_Wood_Clack_03
				Sk8_Terr_Wood_Clack_04
				Sk8_Terr_Wood_Clack_05
			]
			clickminvol = 35
			clickmaxvol = 60
			clickminpitch = 70
			clickmaxpitch = 100
			clickdropoff = $terrainsound_defaultdropoff
			clickdropoff_function = linear
			clickskaterbuss = ClickClacks
			clickpedbuss = PedClickClacks
		}
		bonk = {
			sound = [
				sk8_bonk_wood_01
				sk8_bonk_wood_02
				sk8_bonk_wood_03
				sk8_bonk_wood_04
				sk8_bonk_wood_05
			]
			minvol = 80
			maxvol = 100
			minpitch = 90
			maxpitch = 110
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			sweetener = off
			sweetsound = [
			]
			sweetpercentchance = 100
			waittime = 1
			sweetminvol = 85
			sweetmaxvol = 100
			sweetminpitch = 90
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			LowEndSweetener = on
			lowendsweetsound = [
				sk9_BailBodyPunch02
			]
			lowendminvol = 20
			lowendmaxvol = 45
			lowendminpitch = 90
			lowendmaxpitch = 110
			lowenddropoff = $terrainsound_defaultdropoff
			lowenddropoff_function = linear
			skaterbuss = BodyFalls
			pedbuss = PedBodyFalls
			sweetskaterbuss = Sweetners
			sweetpedbuss = PedSweetners
			lowendskaterbuss = LowEnd
			lowendpedbuss = PedLowEnd
		}
		Grind = {
			sound = [
				SK9_Wood_Grind_Proto
			]
			minvol = 0
			maxvol = 80
			minpitch = 85
			maxpitch = 90
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = inv_exponential
			volumecurve = inv_exponential
			skaterbuss = Grinding
			pedbuss = PedGrinding
		}
		slide = {
			sound = [
				sk8_SolidWood_Slide_01
			]
			minvol = 0
			maxvol = 80
			minpitch = 90
			maxpitch = 90
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = inv_exponential
			volumecurve = inv_exponential
			skaterbuss = Sliding
			pedbuss = PedSliding
		}
		footstep = {
			walksound = [
				sk8_wood_feet_walk_01
				sk8_wood_feet_walk_02
				sk8_wood_feet_walk_03
			]
			runsound = [
				sk8_wood_feet_run_01
				sk8_wood_feet_run_02
				sk8_wood_feet_run_03
				sk8_wood_feet_run_04
			]
			minvol = 15
			maxvol = 30
			minpitch = 90
			maxpitch = 110
			dropoff = $TerrainSound_DefaultFootStepDropoff
			dropoff_function = linear
			skaterbuss = Footsteps
			pedbuss = PedFootsteps
			footsteplayer = off
			layersound = [
			]
			layerpercentchance = 10
			layervol = 20
			layerpitch = 100
			layerdropoff = $terrainsound_defaultdropoff
			layerdropoff_function = linear
			layerskaterbuss = footsteplayer
			layerpedbuss = PedFootstepLayer
		}
		ollie = {
			sound = [
				sk8_wood_ollie_02
				sk8_wood_ollie_03
			]
			minvol = 150
			maxvol = 200
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = SkaterOllies
			pedbuss = PedOlliesLands
		}
		ollieland = {
			sound = [
				sk8_wood_land_03
			]
			minvol = 90
			maxvol = 110
			minpitch = 80
			maxpitch = 120
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = SkaterLands
			pedbuss = PedOlliesLands
		}
		grindon = {
			sound = [
				sk8_WoodSolid_GrindOn_01
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		grindoff = {
			sound = [
				sk8_WoodSolid_GrindOff_03
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		slideon = {
			sound = [
				sk8_WoodSolid_SlideOn_01
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		slideoff = {
			sound = [
				sk8_WoodSolid_SlideOff_01
				sk8_WoodSolid_SlideOff_02
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		revert = {
			sound = [
				sk8_wood_revert_01
				sk8_wood_revert_02
			]
			minvol = 80
			maxvol = 100
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = Reverts
			pedbuss = PedReverts
		}
		pogo = {
			sound = [
				Plywood_Hit_03
				Plywood_Hit_04
				Plywood_Hit_06
			]
			minvol = 30
			maxvol = 50
			minpitch = 75
			maxpitch = 85
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = pogo
			pedbuss = PedPogo
		}
		footstepjump = {
			sound = [
				sk8_wood_feet_jump_04
			]
			minvol = 40
			maxvol = 60
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		footstepland = {
			sound = [
				sk8_wood_feet_land_01
				sk8_wood_feet_land_02
			]
			minvol = 70
			maxvol = 90
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		scuff = {
			sound = [
				sk8_wood_feet_scuff_02
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		boneless = {
			sound = [
				sk8_wood_Boneless_03
			]
			minvol = 80
			maxvol = 90
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = boneless
			pedbuss = PedBoneless
		}
		boardpickup = {
			sound = [
				sk8_wood_pickup_02
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPickupPutdown
			pedbuss = PedBoardPickupPutdown
		}
		boardputdown = {
			sound = [
				sk8_wood_putdown_03
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPickupPutdown
			pedbuss = PedBoardPickupPutdown
		}
	}
	SFX_ID_WOODDECK = {
		roll = {
			sound = [
				RollWoodPier
			]
			minvol = 0
			maxvol = 50
			minpitch = 90
			maxpitch = 120
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = linear
			volumecurve = inv_exponential
			pitchchangepercentageonturning = 110
			volsmoothfactorup = 1
			volsmoothfactordown = 1
			skaterbuss = Rolling
			pedbuss = PedRolling
			fastloop = on
			fastsound = [
				sk8_Temp_Wood_Fast
			]
			fastminvol = 0
			fastmaxvol = 50
			fastminpitch = 90
			fastmaxpitch = 100
			fastdropoff = $terrainsound_defaultdropoff
			fastdropoff_function = linear
			fastpitchcurve = exponential
			fastvolumecurve = exponential
			fastskaterbuss = Rolling
			fastpedbuss = PedRolling
			clickklack = on
			clackmeters = 2
			clickklackontrans = on
			clickklackfrontsound = [
				Sk8_Terr_Wood_Click_01
				Sk8_Terr_Wood_Click_02
				Sk8_Terr_Wood_Click_03
				Sk8_Terr_Wood_Click_04
				Sk8_Terr_Wood_Click_05
			]
			clickklackbacksound = [
				Sk8_Terr_Wood_Clack_01
				Sk8_Terr_Wood_Clack_02
				Sk8_Terr_Wood_Clack_03
				Sk8_Terr_Wood_Clack_04
				Sk8_Terr_Wood_Clack_05
			]
			clickminvol = 15
			clickmaxvol = 30
			clickminpitch = 70
			clickmaxpitch = 100
			clickdropoff = $terrainsound_defaultdropoff
			clickdropoff_function = linear
			clickskaterbuss = ClickClacks
			clickpedbuss = PedClickClacks
		}
		bonk = {
			sound = [
				sk8_bonk_wood_01
				sk8_bonk_wood_02
				sk8_bonk_wood_03
				sk8_bonk_wood_04
				sk8_bonk_wood_05
			]
			minvol = 80
			maxvol = 100
			minpitch = 90
			maxpitch = 110
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			sweetener = off
			sweetsound = [
			]
			sweetpercentchance = 100
			waittime = 1
			sweetminvol = 85
			sweetmaxvol = 100
			sweetminpitch = 90
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			LowEndSweetener = on
			lowendsweetsound = [
				sk9_BailBodyPunch02
			]
			lowendminvol = 20
			lowendmaxvol = 45
			lowendminpitch = 90
			lowendmaxpitch = 110
			lowenddropoff = $terrainsound_defaultdropoff
			lowenddropoff_function = linear
			skaterbuss = BodyFalls
			pedbuss = PedBodyFalls
			sweetskaterbuss = Sweetners
			sweetpedbuss = PedSweetners
			lowendskaterbuss = LowEnd
			lowendpedbuss = PedLowEnd
		}
		Grind = {
			sound = [
				SK9_Wood_Grind_Proto
			]
			minvol = 0
			maxvol = 80
			minpitch = 85
			maxpitch = 90
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = inv_exponential
			volumecurve = inv_exponential
			skaterbuss = Grinding
			pedbuss = PedGrinding
		}
		slide = {
			sound = [
				sk8_SolidWood_Slide_01
			]
			minvol = 0
			maxvol = 80
			minpitch = 90
			maxpitch = 90
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = inv_exponential
			volumecurve = inv_exponential
			skaterbuss = Sliding
			pedbuss = PedSliding
		}
		footstep = {
			walksound = [
				sk8_wood_feet_walk_01
				sk8_wood_feet_walk_02
				sk8_wood_feet_walk_03
			]
			runsound = [
				sk8_wood_feet_run_01
				sk8_wood_feet_run_02
				sk8_wood_feet_run_03
				sk8_wood_feet_run_04
			]
			minvol = 15
			maxvol = 30
			minpitch = 90
			maxpitch = 110
			dropoff = $TerrainSound_DefaultFootStepDropoff
			dropoff_function = linear
			skaterbuss = Footsteps
			pedbuss = PedFootsteps
			footsteplayer = off
			layersound = [
			]
			layerpercentchance = 10
			layervol = 20
			layerpitch = 100
			layerdropoff = $terrainsound_defaultdropoff
			layerdropoff_function = linear
			layerskaterbuss = footsteplayer
			layerpedbuss = PedFootstepLayer
		}
		ollie = {
			sound = [
				sk8_wood_ollie_02
				sk8_wood_ollie_03
			]
			minvol = 150
			maxvol = 200
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = SkaterOllies
			pedbuss = PedOlliesLands
		}
		ollieland = {
			sound = [
				sk8_wood_land_03
			]
			minvol = 90
			maxvol = 110
			minpitch = 80
			maxpitch = 120
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = SkaterLands
			pedbuss = PedOlliesLands
		}
		grindon = {
			sound = [
				sk8_WoodSolid_GrindOn_01
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		grindoff = {
			sound = [
				sk8_WoodSolid_GrindOff_03
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		slideon = {
			sound = [
				sk8_WoodSolid_SlideOn_01
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		slideoff = {
			sound = [
				sk8_WoodSolid_SlideOff_01
				sk8_WoodSolid_SlideOff_02
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		revert = {
			sound = [
				sk8_wood_revert_01
				sk8_wood_revert_02
			]
			minvol = 80
			maxvol = 100
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = Reverts
			pedbuss = PedReverts
		}
		pogo = {
			sound = [
				Plywood_Hit_03
				Plywood_Hit_04
				Plywood_Hit_06
			]
			minvol = 30
			maxvol = 50
			minpitch = 75
			maxpitch = 85
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = pogo
			pedbuss = PedPogo
		}
		footstepjump = {
			sound = [
				sk8_wood_feet_jump_04
			]
			minvol = 40
			maxvol = 60
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		footstepland = {
			sound = [
				sk8_wood_feet_land_01
				sk8_wood_feet_land_02
			]
			minvol = 70
			maxvol = 90
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		scuff = {
			sound = [
				sk8_wood_feet_scuff_02
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		boneless = {
			sound = [
				sk8_wood_Boneless_03
			]
			minvol = 80
			maxvol = 90
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = boneless
			pedbuss = PedBoneless
		}
		boardpickup = {
			sound = [
				sk8_wood_pickup_02
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPickupPutdown
			pedbuss = PedBoardPickupPutdown
		}
		boardputdown = {
			sound = [
				sk8_wood_putdown_03
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPickupPutdown
			pedbuss = PedBoardPickupPutdown
		}
	}
	SFX_ID_WOOD = {
		roll = {
			sound = [
				RollWoodPier
			]
			minvol = 0
			maxvol = 50
			minpitch = 90
			maxpitch = 120
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = linear
			volumecurve = inv_exponential
			pitchchangepercentageonturning = 110
			volsmoothfactorup = 1
			volsmoothfactordown = 1
			skaterbuss = Rolling
			pedbuss = PedRolling
			fastloop = on
			fastsound = [
				sk8_Temp_Wood_Fast
			]
			fastminvol = 0
			fastmaxvol = 50
			fastminpitch = 90
			fastmaxpitch = 100
			fastdropoff = $terrainsound_defaultdropoff
			fastdropoff_function = linear
			fastpitchcurve = exponential
			fastvolumecurve = exponential
			fastskaterbuss = Rolling
			fastpedbuss = PedRolling
			clickklack = on
			clackmeters = 2
			clickklackontrans = on
			clickklackfrontsound = [
				Sk8_Terr_Wood_Click_01
				Sk8_Terr_Wood_Click_02
				Sk8_Terr_Wood_Click_03
				Sk8_Terr_Wood_Click_04
				Sk8_Terr_Wood_Click_05
			]
			clickklackbacksound = [
				Sk8_Terr_Wood_Clack_01
				Sk8_Terr_Wood_Clack_02
				Sk8_Terr_Wood_Clack_03
				Sk8_Terr_Wood_Clack_04
				Sk8_Terr_Wood_Clack_05
			]
			clickminvol = 15
			clickmaxvol = 30
			clickminpitch = 70
			clickmaxpitch = 100
			clickdropoff = $terrainsound_defaultdropoff
			clickdropoff_function = linear
			clickskaterbuss = ClickClacks
			clickpedbuss = PedClickClacks
		}
		bonk = {
			sound = [
				sk8_bonk_wood_01
				sk8_bonk_wood_02
				sk8_bonk_wood_03
				sk8_bonk_wood_04
				sk8_bonk_wood_05
			]
			minvol = 80
			maxvol = 100
			minpitch = 90
			maxpitch = 110
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			sweetener = off
			sweetsound = [
			]
			sweetpercentchance = 100
			waittime = 1
			sweetminvol = 85
			sweetmaxvol = 100
			sweetminpitch = 90
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			LowEndSweetener = on
			lowendsweetsound = [
				sk9_BailBodyPunch02
			]
			lowendminvol = 20
			lowendmaxvol = 45
			lowendminpitch = 90
			lowendmaxpitch = 110
			lowenddropoff = $terrainsound_defaultdropoff
			lowenddropoff_function = linear
			skaterbuss = BodyFalls
			pedbuss = PedBodyFalls
			sweetskaterbuss = Sweetners
			sweetpedbuss = PedSweetners
			lowendskaterbuss = LowEnd
			lowendpedbuss = PedLowEnd
		}
		Grind = {
			sound = [
				SK9_Wood_Grind_Proto
			]
			minvol = 0
			maxvol = 80
			minpitch = 85
			maxpitch = 90
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = inv_exponential
			volumecurve = inv_exponential
			skaterbuss = Grinding
			pedbuss = PedGrinding
		}
		slide = {
			sound = [
				sk8_SolidWood_Slide_01
			]
			minvol = 0
			maxvol = 80
			minpitch = 90
			maxpitch = 90
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = inv_exponential
			volumecurve = inv_exponential
			skaterbuss = Sliding
			pedbuss = PedSliding
		}
		footstep = {
			walksound = [
				sk8_wood_feet_walk_01
				sk8_wood_feet_walk_02
				sk8_wood_feet_walk_03
			]
			runsound = [
				sk8_wood_feet_run_01
				sk8_wood_feet_run_02
				sk8_wood_feet_run_03
				sk8_wood_feet_run_04
			]
			minvol = 15
			maxvol = 30
			minpitch = 90
			maxpitch = 110
			dropoff = $TerrainSound_DefaultFootStepDropoff
			dropoff_function = linear
			skaterbuss = Footsteps
			pedbuss = PedFootsteps
			footsteplayer = off
			layersound = [
			]
			layerpercentchance = 10
			layervol = 20
			layerpitch = 100
			layerdropoff = $terrainsound_defaultdropoff
			layerdropoff_function = linear
			layerskaterbuss = footsteplayer
			layerpedbuss = PedFootstepLayer
		}
		ollie = {
			sound = [
				sk8_wood_ollie_02
				sk8_wood_ollie_03
			]
			minvol = 150
			maxvol = 200
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = SkaterOllies
			pedbuss = PedOlliesLands
		}
		ollieland = {
			sound = [
				sk8_wood_land_03
			]
			minvol = 90
			maxvol = 110
			minpitch = 80
			maxpitch = 120
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = SkaterLands
			pedbuss = PedOlliesLands
		}
		grindon = {
			sound = [
				sk8_WoodSolid_GrindOn_01
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		grindoff = {
			sound = [
				sk8_WoodSolid_GrindOff_03
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		slideon = {
			sound = [
				sk8_WoodSolid_SlideOn_01
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		slideoff = {
			sound = [
				sk8_WoodSolid_SlideOff_01
				sk8_WoodSolid_SlideOff_02
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		revert = {
			sound = [
				sk8_wood_revert_01
				sk8_wood_revert_02
			]
			minvol = 80
			maxvol = 100
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = Reverts
			pedbuss = PedReverts
		}
		pogo = {
			sound = [
				Plywood_Hit_03
				Plywood_Hit_04
				Plywood_Hit_06
			]
			minvol = 30
			maxvol = 50
			minpitch = 75
			maxpitch = 85
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = pogo
			pedbuss = PedPogo
		}
		footstepjump = {
			sound = [
				sk8_wood_feet_jump_04
			]
			minvol = 40
			maxvol = 60
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		footstepland = {
			sound = [
				sk8_wood_feet_land_01
				sk8_wood_feet_land_02
			]
			minvol = 70
			maxvol = 90
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		scuff = {
			sound = [
				sk8_wood_feet_scuff_02
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		boneless = {
			sound = [
				sk8_wood_Boneless_03
			]
			minvol = 80
			maxvol = 90
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = boneless
			pedbuss = PedBoneless
		}
		boardpickup = {
			sound = [
				sk8_wood_pickup_02
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPickupPutdown
			pedbuss = PedBoardPickupPutdown
		}
		boardputdown = {
			sound = [
				sk8_wood_putdown_03
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPickupPutdown
			pedbuss = PedBoardPickupPutdown
		}
	}
	SFX_ID_WOODTABLE = {
		roll = {
			sound = [
				RollWoodPier
			]
			minvol = 0
			maxvol = 50
			minpitch = 90
			maxpitch = 120
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = linear
			volumecurve = inv_exponential
			pitchchangepercentageonturning = 110
			volsmoothfactorup = 1
			volsmoothfactordown = 1
			skaterbuss = Rolling
			pedbuss = PedRolling
			fastloop = on
			fastsound = [
				sk8_Temp_Wood_Fast
			]
			fastminvol = 0
			fastmaxvol = 50
			fastminpitch = 90
			fastmaxpitch = 100
			fastdropoff = $terrainsound_defaultdropoff
			fastdropoff_function = linear
			fastpitchcurve = exponential
			fastvolumecurve = exponential
			fastskaterbuss = Rolling
			fastpedbuss = PedRolling
			clickklack = on
			clackmeters = 2
			clickklackontrans = on
			clickklackfrontsound = [
				Sk8_Terr_Wood_Click_01
				Sk8_Terr_Wood_Click_02
				Sk8_Terr_Wood_Click_03
				Sk8_Terr_Wood_Click_04
				Sk8_Terr_Wood_Click_05
			]
			clickklackbacksound = [
				Sk8_Terr_Wood_Clack_01
				Sk8_Terr_Wood_Clack_02
				Sk8_Terr_Wood_Clack_03
				Sk8_Terr_Wood_Clack_04
				Sk8_Terr_Wood_Clack_05
			]
			clickminvol = 15
			clickmaxvol = 30
			clickminpitch = 70
			clickmaxpitch = 100
			clickdropoff = $terrainsound_defaultdropoff
			clickdropoff_function = linear
			clickskaterbuss = ClickClacks
			clickpedbuss = PedClickClacks
		}
		bonk = {
			sound = [
				sk8_bonk_wood_01
				sk8_bonk_wood_02
				sk8_bonk_wood_03
				sk8_bonk_wood_04
				sk8_bonk_wood_05
			]
			minvol = 80
			maxvol = 100
			minpitch = 90
			maxpitch = 110
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			sweetener = off
			sweetsound = [
			]
			sweetpercentchance = 100
			waittime = 1
			sweetminvol = 85
			sweetmaxvol = 100
			sweetminpitch = 90
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			LowEndSweetener = on
			lowendsweetsound = [
				sk9_BailBodyPunch02
			]
			lowendminvol = 20
			lowendmaxvol = 45
			lowendminpitch = 90
			lowendmaxpitch = 110
			lowenddropoff = $terrainsound_defaultdropoff
			lowenddropoff_function = linear
			skaterbuss = BodyFalls
			pedbuss = PedBodyFalls
			sweetskaterbuss = Sweetners
			sweetpedbuss = PedSweetners
			lowendskaterbuss = LowEnd
			lowendpedbuss = PedLowEnd
		}
		Grind = {
			sound = [
				SK9_Wood_Grind_Proto
			]
			minvol = 0
			maxvol = 80
			minpitch = 85
			maxpitch = 90
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = inv_exponential
			volumecurve = inv_exponential
			skaterbuss = Grinding
			pedbuss = PedGrinding
		}
		slide = {
			sound = [
				sk8_SolidWood_Slide_01
			]
			minvol = 0
			maxvol = 80
			minpitch = 90
			maxpitch = 90
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = inv_exponential
			volumecurve = inv_exponential
			skaterbuss = Sliding
			pedbuss = PedSliding
		}
		footstep = {
			walksound = [
				sk8_wood_feet_walk_01
				sk8_wood_feet_walk_02
				sk8_wood_feet_walk_03
			]
			runsound = [
				sk8_wood_feet_run_01
				sk8_wood_feet_run_02
				sk8_wood_feet_run_03
				sk8_wood_feet_run_04
			]
			minvol = 15
			maxvol = 30
			minpitch = 90
			maxpitch = 110
			dropoff = $TerrainSound_DefaultFootStepDropoff
			dropoff_function = linear
			skaterbuss = Footsteps
			pedbuss = PedFootsteps
			footsteplayer = off
			layersound = [
			]
			layerpercentchance = 10
			layervol = 20
			layerpitch = 100
			layerdropoff = $terrainsound_defaultdropoff
			layerdropoff_function = linear
			layerskaterbuss = footsteplayer
			layerpedbuss = PedFootstepLayer
		}
		ollie = {
			sound = [
				sk8_wood_ollie_02
				sk8_wood_ollie_03
			]
			minvol = 150
			maxvol = 200
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = SkaterOllies
			pedbuss = PedOlliesLands
		}
		ollieland = {
			sound = [
				sk8_wood_land_03
			]
			minvol = 90
			maxvol = 110
			minpitch = 80
			maxpitch = 120
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = SkaterLands
			pedbuss = PedOlliesLands
		}
		grindon = {
			sound = [
				sk8_WoodSolid_GrindOn_01
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		grindoff = {
			sound = [
				sk8_WoodSolid_GrindOff_03
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		slideon = {
			sound = [
				sk8_WoodSolid_SlideOn_01
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		slideoff = {
			sound = [
				sk8_WoodSolid_SlideOff_01
				sk8_WoodSolid_SlideOff_02
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		revert = {
			sound = [
				sk8_wood_revert_01
				sk8_wood_revert_02
			]
			minvol = 80
			maxvol = 100
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = Reverts
			pedbuss = PedReverts
		}
		pogo = {
			sound = [
				Plywood_Hit_03
				Plywood_Hit_04
				Plywood_Hit_06
			]
			minvol = 30
			maxvol = 50
			minpitch = 75
			maxpitch = 85
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = pogo
			pedbuss = PedPogo
		}
		footstepjump = {
			sound = [
				sk8_wood_feet_jump_04
			]
			minvol = 40
			maxvol = 60
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		footstepland = {
			sound = [
				sk8_wood_feet_land_01
				sk8_wood_feet_land_02
			]
			minvol = 70
			maxvol = 90
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		scuff = {
			sound = [
				sk8_wood_feet_scuff_02
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		boneless = {
			sound = [
				sk8_wood_Boneless_03
			]
			minvol = 80
			maxvol = 90
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = boneless
			pedbuss = PedBoneless
		}
		boardpickup = {
			sound = [
				sk8_wood_pickup_02
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPickupPutdown
			pedbuss = PedBoardPickupPutdown
		}
		boardputdown = {
			sound = [
				sk8_wood_putdown_03
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPickupPutdown
			pedbuss = PedBoardPickupPutdown
		}
	}
	SFX_ID_METALTIN = {
		roll = {
			sound = [
				sk8_terr_metal_roll_loop
			]
			minvol = 0
			maxvol = 100
			minpitch = 85
			maxpitch = 85
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = linear
			volumecurve = inv_exponential
			pitchchangepercentageonturning = 115
			volsmoothfactorup = 1
			volsmoothfactordown = 1
			skaterbuss = Rolling
			pedbuss = PedRolling
			fastloop = on
			fastsound = [
				sk8_terr_metal_roll_fast
			]
			fastminvol = 0
			fastmaxvol = 100
			fastminpitch = 90
			fastmaxpitch = 100
			fastdropoff = $terrainsound_defaultdropoff
			fastdropoff_function = linear
			fastpitchcurve = exponential
			fastvolumecurve = exponential
			fastskaterbuss = Rolling
			fastpedbuss = PedRolling
		}
		bonk = {
			sound = [
				sk8_bonk_metal_01
				sk8_bonk_metal_02
				sk8_bonk_metal_03
			]
			minvol = 80
			maxvol = 100
			minpitch = 90
			maxpitch = 110
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			sweetener = off
			sweetsound = [
			]
			sweetpercentchance = 100
			waittime = 1
			sweetminvol = 85
			sweetmaxvol = 100
			sweetminpitch = 90
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			LowEndSweetener = on
			lowendsweetsound = [
				sk9_BailBodyPunch02
			]
			lowendminvol = 20
			lowendmaxvol = 65
			lowendminpitch = 90
			lowendmaxpitch = 110
			lowenddropoff = $terrainsound_defaultdropoff
			lowenddropoff_function = linear
			skaterbuss = BodyFalls
			pedbuss = PedBodyFalls
			sweetskaterbuss = Sweetners
			sweetpedbuss = PedSweetners
			lowendskaterbuss = LowEnd
			lowendpedbuss = PedLowEnd
		}
		footpush = {
			sound = [
				sk8_Met_Revert_03
				sk8_Met_Revert_05
			]
			minvol = 80
			maxvol = 100
			minpitch = 70
			maxpitch = 100
			pitchcurve = exponential
			volumecurve = exponential
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPush
			pedbuss = PedBoardPush
		}
		Grind = {
			sound = [
				sk8_terr_metal_grind_loop
			]
			minvol = 0
			maxvol = 80
			minpitch = 85
			maxpitch = 90
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = inv_exponential
			volumecurve = inv_exponential
			skaterbuss = Grinding
			pedbuss = PedGrinding
		}
		slide = {
			sound = [
				sk8_terr_metal_slide_loop
			]
			minvol = 0
			maxvol = 150
			minpitch = 90
			maxpitch = 90
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = inv_exponential
			volumecurve = inv_exponential
			skaterbuss = Sliding
			pedbuss = PedSliding
		}
		footstep = {
			walksound = [
				sk8_terr_metal_feet_walk_01
				sk8_terr_metal_feet_walk_04
				sk8_terr_metal_feet_walk_06
			]
			runsound = [
				sk8_terr_metal_feet_run_01
				sk8_terr_metal_feet_run_03
				sk8_terr_metal_feet_run_06
				sk8_terr_metal_feet_run_08
			]
			minvol = 90
			maxvol = 110
			minpitch = 90
			maxpitch = 110
			dropoff = $TerrainSound_DefaultFootStepDropoff
			dropoff_function = linear
			skaterbuss = Footsteps
			pedbuss = PedFootsteps
			footsteplayer = off
			layersound = [
			]
			layerpercentchance = 10
			layervol = 20
			layerpitch = 100
			layerdropoff = $terrainsound_defaultdropoff
			layerdropoff_function = linear
			layerskaterbuss = footsteplayer
			layerpedbuss = PedFootstepLayer
		}
		ollie = {
			sound = [
				sk8_terr_metal_ollie_03
			]
			minvol = 150
			maxvol = 200
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = SkaterOllies
			pedbuss = PedOlliesLands
		}
		ollieland = {
			sound = [
				sk8_terr_metal_ollie_lnd_01
				sk8_terr_metal_ollie_lnd_04
			]
			minvol = 110
			maxvol = 200
			minpitch = 80
			maxpitch = 120
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = SkaterLands
			pedbuss = PedOlliesLands
		}
		grindon = {
			sound = [
				sk8_terr_metal_grind_on_01
			]
			minvol = 90
			maxvol = 110
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		grindoff = {
			sound = [
				sk8_terr_metal_grind_off_03
				sk8_terr_metal_grind_off_04
			]
			minvol = 85
			maxvol = 95
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		slideon = {
			sound = [
				sk8_terr_metal_grind_on_01
			]
			minvol = 90
			maxvol = 110
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		slideoff = {
			sound = [
				sk8_terr_metal_grind_off_03
				sk8_terr_metal_grind_off_04
			]
			minvol = 85
			maxvol = 95
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		revert = {
			sound = [
				sk8_Met_Revert_03
				sk8_Met_Revert_05
			]
			minvol = 130
			maxvol = 160
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = Reverts
			pedbuss = PedReverts
		}
		pogo = {
			sound = [
				sk8_metalgrate_dull_01
				sk8_metalgrate_dull_02
				sk8_metalgrate_dull_03
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = pogo
			pedbuss = PedPogo
		}
		footstepjump = {
			sound = [
				sk8_terr_metal_feet_jump_03
			]
			minvol = 110
			maxvol = 130
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		footstepland = {
			sound = [
				sk8_terr_metal_feet_land_02
				sk8_terr_metal_feet_land_03
			]
			minvol = 140
			maxvol = 160
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		scuff = {
			sound = [
				sk8_terr_metal_feet_scff_05
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		boneless = {
			sound = [
				sk8_terr_metal_boneless_06
			]
			minvol = 80
			maxvol = 90
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = boneless
			pedbuss = PedBoneless
		}
		boardpickup = {
			sound = [
				sk8_terr_metal_pickup_03
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPickupPutdown
			pedbuss = PedBoardPickupPutdown
		}
		boardputdown = {
			sound = [
				sk8_terr_metal_putdown_01
				sk8_terr_metal_putdown_07
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPickupPutdown
			pedbuss = PedBoardPickupPutdown
		}
		handplant = {
			sound = [
				Metal_Ladder_Footstep_03
				Metal_Ladder_Footstep_09
				Metal_Ladder_Footstep_13
				Metal_Ladder_Footstep_16
				Metal_Ladder_Handstep_05
				Metal_Ladder_Handstep_06
			]
			minvol = 105
			maxvol = 115
			minpitch = 110
			maxpitch = 135
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
	}
	SFX_ID_METALTHIN = {
		roll = {
			sound = [
				sk8_terr_metal_roll_loop
			]
			minvol = 0
			maxvol = 100
			minpitch = 85
			maxpitch = 85
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = linear
			volumecurve = inv_exponential
			pitchchangepercentageonturning = 115
			volsmoothfactorup = 1
			volsmoothfactordown = 1
			skaterbuss = Rolling
			pedbuss = PedRolling
			fastloop = on
			fastsound = [
				sk8_terr_metal_roll_fast
			]
			fastminvol = 0
			fastmaxvol = 100
			fastminpitch = 90
			fastmaxpitch = 100
			fastdropoff = $terrainsound_defaultdropoff
			fastdropoff_function = linear
			fastpitchcurve = exponential
			fastvolumecurve = exponential
			fastskaterbuss = Rolling
			fastpedbuss = PedRolling
		}
		bonk = {
			sound = [
				sk8_bonk_metal_01
				sk8_bonk_metal_02
				sk8_bonk_metal_03
			]
			minvol = 80
			maxvol = 100
			minpitch = 90
			maxpitch = 110
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			sweetener = off
			sweetsound = [
			]
			sweetpercentchance = 100
			waittime = 1
			sweetminvol = 85
			sweetmaxvol = 100
			sweetminpitch = 90
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			LowEndSweetener = on
			lowendsweetsound = [
				sk9_BailBodyPunch02
			]
			lowendminvol = 20
			lowendmaxvol = 65
			lowendminpitch = 90
			lowendmaxpitch = 110
			lowenddropoff = $terrainsound_defaultdropoff
			lowenddropoff_function = linear
			skaterbuss = BodyFalls
			pedbuss = PedBodyFalls
			sweetskaterbuss = Sweetners
			sweetpedbuss = PedSweetners
			lowendskaterbuss = LowEnd
			lowendpedbuss = PedLowEnd
		}
		footpush = {
			sound = [
				sk8_Met_Revert_03
				sk8_Met_Revert_05
			]
			minvol = 80
			maxvol = 100
			minpitch = 70
			maxpitch = 100
			pitchcurve = exponential
			volumecurve = exponential
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPush
			pedbuss = PedBoardPush
		}
		Grind = {
			sound = [
				sk8_terr_metal_grind_loop
			]
			minvol = 0
			maxvol = 80
			minpitch = 85
			maxpitch = 90
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = inv_exponential
			volumecurve = inv_exponential
			skaterbuss = Grinding
			pedbuss = PedGrinding
		}
		slide = {
			sound = [
				sk8_terr_metal_slide_loop
			]
			minvol = 0
			maxvol = 80
			minpitch = 90
			maxpitch = 90
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = inv_exponential
			volumecurve = inv_exponential
			skaterbuss = Sliding
			pedbuss = PedSliding
		}
		footstep = {
			walksound = [
				sk8_terr_metal_feet_walk_01
				sk8_terr_metal_feet_walk_04
				sk8_terr_metal_feet_walk_06
			]
			runsound = [
				sk8_terr_metal_feet_run_01
				sk8_terr_metal_feet_run_03
				sk8_terr_metal_feet_run_06
				sk8_terr_metal_feet_run_08
			]
			minvol = 90
			maxvol = 110
			minpitch = 90
			maxpitch = 110
			dropoff = $TerrainSound_DefaultFootStepDropoff
			dropoff_function = linear
			skaterbuss = Footsteps
			pedbuss = PedFootsteps
			footsteplayer = off
			layersound = [
			]
			layerpercentchance = 10
			layervol = 20
			layerpitch = 100
			layerdropoff = $terrainsound_defaultdropoff
			layerdropoff_function = linear
			layerskaterbuss = footsteplayer
			layerpedbuss = PedFootstepLayer
		}
		ollie = {
			sound = [
				sk8_terr_metal_ollie_03
			]
			minvol = 150
			maxvol = 200
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = SkaterOllies
			pedbuss = PedOlliesLands
		}
		ollieland = {
			sound = [
				sk8_terr_metal_ollie_lnd_01
				sk8_terr_metal_ollie_lnd_04
			]
			minvol = 110
			maxvol = 200
			minpitch = 80
			maxpitch = 120
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = SkaterLands
			pedbuss = PedOlliesLands
		}
		grindon = {
			sound = [
				sk8_terr_metal_grind_on_01
			]
			minvol = 110
			maxvol = 120
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		grindoff = {
			sound = [
				sk8_terr_metal_grind_off_03
				sk8_terr_metal_grind_off_04
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		slideon = {
			sound = [
				sk8_terr_metal_grind_on_01
			]
			minvol = 110
			maxvol = 120
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		slideoff = {
			sound = [
				sk8_terr_metal_grind_off_03
				sk8_terr_metal_grind_off_04
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		revert = {
			sound = [
				sk8_Met_Revert_03
				sk8_Met_Revert_05
			]
			minvol = 130
			maxvol = 160
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = Reverts
			pedbuss = PedReverts
		}
		pogo = {
			sound = [
				sk8_metalgrate_dull_01
				sk8_metalgrate_dull_02
				sk8_metalgrate_dull_03
			]
			minvol = 95
			maxvol = 100
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = pogo
			pedbuss = PedPogo
		}
		footstepjump = {
			sound = [
				sk8_terr_metal_feet_jump_03
			]
			minvol = 110
			maxvol = 130
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		footstepland = {
			sound = [
				sk8_terr_metal_feet_land_02
				sk8_terr_metal_feet_land_03
			]
			minvol = 140
			maxvol = 160
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		scuff = {
			sound = [
				sk8_terr_metal_feet_scff_05
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		boneless = {
			sound = [
				sk8_terr_metal_boneless_06
			]
			minvol = 80
			maxvol = 90
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = boneless
			pedbuss = PedBoneless
		}
		boardpickup = {
			sound = [
				sk8_terr_metal_pickup_03
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPickupPutdown
			pedbuss = PedBoardPickupPutdown
		}
		boardputdown = {
			sound = [
				sk8_terr_metal_putdown_01
				sk8_terr_metal_putdown_07
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPickupPutdown
			pedbuss = PedBoardPickupPutdown
		}
		handplant = {
			sound = [
				Metal_Ladder_Footstep_03
				Metal_Ladder_Footstep_09
				Metal_Ladder_Footstep_13
				Metal_Ladder_Footstep_16
				Metal_Ladder_Handstep_05
				Metal_Ladder_Handstep_06
			]
			minvol = 105
			maxvol = 115
			minpitch = 110
			maxpitch = 135
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
	}
	SFX_ID_METAL = {
		roll = {
			sound = [
				sk8_terr_metal_roll_loop
			]
			minvol = 0
			maxvol = 60
			minpitch = 150
			maxpitch = 165
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = linear
			volumecurve = inv_exponential
			pitchchangepercentageonturning = 115
			volsmoothfactorup = 1
			volsmoothfactordown = 1
			skaterbuss = Rolling
			pedbuss = PedRolling
			fastloop = on
			fastsound = [
				sk8_terr_metal_roll_fast
			]
			fastminvol = 0
			fastmaxvol = 100
			fastminpitch = 105
			fastmaxpitch = 120
			fastdropoff = $terrainsound_defaultdropoff
			fastdropoff_function = linear
			fastpitchcurve = exponential
			fastvolumecurve = exponential
			fastskaterbuss = Rolling
			fastpedbuss = PedRolling
			clickklack = on
			clackmeters = 0.5
			clickklackontrans = on
			clickklackfrontsound = [
				sk8_terr_metal_click_lng_01
				sk8_terr_metal_click_lng_02
				sk8_terr_metal_click_lng_03
			]
			clickklackbacksound = [
				sk8_terr_metal_clack_lng_01
				sk8_terr_metal_clack_lng_02
				sk8_terr_metal_clack_lng_03
			]
			clickminvol = 15
			clickmaxvol = 40
			clickminpitch = 100
			clickmaxpitch = 120
			clickdropoff = $terrainsound_defaultdropoff
			clickdropoff_function = linear
			clickskaterbuss = ClickClacks
			clickpedbuss = PedClickClacks
		}
		bonk = {
			sound = [
				sk8_bonk_metal_01
				sk8_bonk_metal_02
				sk8_bonk_metal_03
			]
			minvol = 80
			maxvol = 100
			minpitch = 90
			maxpitch = 110
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			sweetener = off
			sweetsound = [
			]
			sweetpercentchance = 100
			waittime = 1
			sweetminvol = 85
			sweetmaxvol = 100
			sweetminpitch = 90
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			LowEndSweetener = on
			lowendsweetsound = [
				sk9_BailBodyPunch02
			]
			lowendminvol = 20
			lowendmaxvol = 65
			lowendminpitch = 90
			lowendmaxpitch = 110
			lowenddropoff = $terrainsound_defaultdropoff
			lowenddropoff_function = linear
			skaterbuss = BodyFalls
			pedbuss = PedBodyFalls
			sweetskaterbuss = Sweetners
			sweetpedbuss = PedSweetners
			lowendskaterbuss = LowEnd
			lowendpedbuss = PedLowEnd
		}
		footpush = {
			sound = [
				sk8_Met_Revert_03
				sk8_Met_Revert_05
			]
			minvol = 80
			maxvol = 100
			minpitch = 90
			maxpitch = 120
			pitchcurve = exponential
			volumecurve = exponential
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPush
			pedbuss = PedBoardPush
		}
		Grind = {
			sound = [
				sk8_metalpole_grind_01
			]
			minvol = 0
			maxvol = 90
			minpitch = 105
			maxpitch = 110
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = inv_exponential
			volumecurve = inv_exponential
			skaterbuss = Grinding
			pedbuss = PedGrinding
		}
		slide = {
			sound = [
				sk8_metalpole_slide_01
			]
			minvol = 0
			maxvol = 65
			minpitch = 80
			maxpitch = 120
			dropoff = 150
			dropoff_function = exponential
			pitchcurve = inv_exponential
			volumecurve = inv_exponential
			skaterbuss = Sliding
			pedbuss = PedSliding
		}
		footstep = {
			walksound = [
				sk8_terr_metal_feet_walk_01
				sk8_terr_metal_feet_walk_04
				sk8_terr_metal_feet_walk_06
			]
			runsound = [
				sk8_terr_metal_feet_run_01
				sk8_terr_metal_feet_run_03
				sk8_terr_metal_feet_run_06
				sk8_terr_metal_feet_run_08
			]
			minvol = 90
			maxvol = 110
			minpitch = 90
			maxpitch = 110
			dropoff = $TerrainSound_DefaultFootStepDropoff
			dropoff_function = linear
			skaterbuss = Footsteps
			pedbuss = PedFootsteps
			footsteplayer = off
			layersound = [
			]
			layerpercentchance = 10
			layervol = 20
			layerpitch = 100
			layerdropoff = $terrainsound_defaultdropoff
			layerdropoff_function = linear
			layerskaterbuss = footsteplayer
			layerpedbuss = PedFootstepLayer
		}
		ollie = {
			sound = [
				sk8_terr_metal_ollie_03
			]
			minvol = 150
			maxvol = 200
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = SkaterOllies
			pedbuss = PedOlliesLands
		}
		ollieland = {
			sound = [
				sk8_terr_metal_ollie_lnd_01
				sk8_terr_metal_ollie_lnd_04
			]
			minvol = 80
			maxvol = 100
			minpitch = 140
			maxpitch = 160
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = SkaterLands
			pedbuss = PedOlliesLands
		}
		grindon = {
			sound = [
				sk8_metalpole_grindon_02
			]
			minvol = 80
			maxvol = 120
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		grindoff = {
			sound = [
				sk8_metalpole_grindoff_02
			]
			minvol = 105
			maxvol = 115
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		slideon = {
			sound = [
				sk8_metalpole_slideon_02
			]
			minvol = 120
			maxvol = 130
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		slideoff = {
			sound = [
				sk8_metalpole_slideoff_02
			]
			minvol = 105
			maxvol = 115
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		revert = {
			sound = [
				sk8_Met_Revert_03
				sk8_Met_Revert_05
			]
			minvol = 130
			maxvol = 160
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = Reverts
			pedbuss = PedReverts
		}
		pogo = {
			sound = [
				sk8_metalgrate_dull_01
				sk8_metalgrate_dull_02
				sk8_metalgrate_dull_03
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = pogo
			pedbuss = PedPogo
		}
		footstepjump = {
			sound = [
				sk8_terr_metal_feet_jump_03
			]
			minvol = 110
			maxvol = 130
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		footstepland = {
			sound = [
				sk8_terr_metal_feet_land_02
				sk8_terr_metal_feet_land_03
			]
			minvol = 140
			maxvol = 160
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		scuff = {
			sound = [
				sk8_terr_metal_feet_scff_05
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		boneless = {
			sound = [
				sk8_terr_metal_boneless_06
			]
			minvol = 80
			maxvol = 90
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = boneless
			pedbuss = PedBoneless
		}
		boardpickup = {
			sound = [
				sk8_terr_metal_pickup_03
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPickupPutdown
			pedbuss = PedBoardPickupPutdown
		}
		boardputdown = {
			sound = [
				sk8_terr_metal_putdown_01
				sk8_terr_metal_putdown_07
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPickupPutdown
			pedbuss = PedBoardPickupPutdown
		}
		handplant = {
			sound = [
				Metal_Ladder_Footstep_03
				Metal_Ladder_Footstep_09
				Metal_Ladder_Footstep_13
				Metal_Ladder_Footstep_16
				Metal_Ladder_Handstep_05
				Metal_Ladder_Handstep_06
			]
			minvol = 105
			maxvol = 115
			minpitch = 110
			maxpitch = 135
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
	}
	SFX_ID_METALGRATE = {
		roll = {
			sound = [
				sk8_terr_metal_roll_loop
			]
			minvol = 0
			maxvol = 60
			minpitch = 150
			maxpitch = 165
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = linear
			volumecurve = inv_exponential
			pitchchangepercentageonturning = 115
			volsmoothfactorup = 1
			volsmoothfactordown = 1
			skaterbuss = Rolling
			pedbuss = PedRolling
			fastloop = on
			fastsound = [
				sk8_terr_metal_roll_fast
			]
			fastminvol = 0
			fastmaxvol = 60
			fastminpitch = 105
			fastmaxpitch = 120
			fastdropoff = $terrainsound_defaultdropoff
			fastdropoff_function = linear
			fastpitchcurve = exponential
			fastvolumecurve = exponential
			fastskaterbuss = Rolling
			fastpedbuss = PedRolling
			clickklack = on
			clackmeters = 0.7
			clickklackontrans = on
			clickklackfrontsound = [
				sk8_metalgrate_dull_01
				sk8_metalgrate_dull_02
			]
			clickklackbacksound = [
				sk8_metalgrate_dull_03
			]
			clickminvol = 15
			clickmaxvol = 40
			clickminpitch = 135
			clickmaxpitch = 140
			clickdropoff = $terrainsound_defaultdropoff
			clickdropoff_function = linear
			clickskaterbuss = ClickClacks
			clickpedbuss = PedClickClacks
		}
		bonk = {
			sound = [
				sk8_bonk_metal_01
				sk8_bonk_metal_02
				sk8_bonk_metal_03
			]
			minvol = 80
			maxvol = 100
			minpitch = 90
			maxpitch = 110
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			sweetener = off
			sweetsound = [
			]
			sweetpercentchance = 100
			waittime = 1
			sweetminvol = 85
			sweetmaxvol = 100
			sweetminpitch = 90
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			LowEndSweetener = on
			lowendsweetsound = [
				sk9_BailBodyPunch02
			]
			lowendminvol = 20
			lowendmaxvol = 65
			lowendminpitch = 90
			lowendmaxpitch = 110
			lowenddropoff = $terrainsound_defaultdropoff
			lowenddropoff_function = linear
			skaterbuss = BodyFalls
			pedbuss = PedBodyFalls
			sweetskaterbuss = Sweetners
			sweetpedbuss = PedSweetners
			lowendskaterbuss = LowEnd
			lowendpedbuss = PedLowEnd
		}
		footpush = {
			sound = [
				sk8_Met_Revert_03
				sk8_Met_Revert_05
			]
			minvol = 80
			maxvol = 100
			minpitch = 90
			maxpitch = 120
			pitchcurve = exponential
			volumecurve = exponential
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPush
			pedbuss = PedBoardPush
		}
		Grind = {
			sound = [
				sk8_metalpole_grind_01
			]
			minvol = 0
			maxvol = 90
			minpitch = 105
			maxpitch = 110
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = inv_exponential
			volumecurve = inv_exponential
			skaterbuss = Grinding
			pedbuss = PedGrinding
		}
		slide = {
			sound = [
				sk8_metalpole_slide_01
			]
			minvol = 0
			maxvol = 65
			minpitch = 80
			maxpitch = 120
			dropoff = 150
			dropoff_function = exponential
			pitchcurve = inv_exponential
			volumecurve = inv_exponential
			skaterbuss = Sliding
			pedbuss = PedSliding
		}
		footstep = {
			walksound = [
				sk8_terr_metal_feet_walk_01
				sk8_terr_metal_feet_walk_04
				sk8_terr_metal_feet_walk_06
			]
			runsound = [
				sk8_terr_metal_feet_run_01
				sk8_terr_metal_feet_run_03
				sk8_terr_metal_feet_run_06
				sk8_terr_metal_feet_run_08
			]
			minvol = 90
			maxvol = 110
			minpitch = 90
			maxpitch = 110
			dropoff = $TerrainSound_DefaultFootStepDropoff
			dropoff_function = linear
			skaterbuss = Footsteps
			pedbuss = PedFootsteps
			footsteplayer = off
			layersound = [
			]
			layerpercentchance = 10
			layervol = 20
			layerpitch = 100
			layerdropoff = $terrainsound_defaultdropoff
			layerdropoff_function = linear
			layerskaterbuss = footsteplayer
			layerpedbuss = PedFootstepLayer
		}
		ollie = {
			sound = [
				sk8_terr_metal_ollie_03
			]
			minvol = 150
			maxvol = 200
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = SkaterOllies
			pedbuss = PedOlliesLands
		}
		ollieland = {
			sound = [
				sk8_terr_metal_ollie_lnd_01
				sk8_terr_metal_ollie_lnd_04
			]
			minvol = 110
			maxvol = 200
			minpitch = 180
			maxpitch = 200
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = SkaterLands
			pedbuss = PedOlliesLands
		}
		grindon = {
			sound = [
				sk8_terr_metal_grind_on_01
			]
			minvol = 110
			maxvol = 120
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		grindoff = {
			sound = [
				sk8_terr_metal_grind_off_03
				sk8_terr_metal_grind_off_04
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		slideon = {
			sound = [
				sk8_terr_metal_grind_on_01
			]
			minvol = 110
			maxvol = 120
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		slideoff = {
			sound = [
				sk8_terr_metal_grind_off_03
				sk8_terr_metal_grind_off_04
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		revert = {
			sound = [
				sk8_Met_Revert_03
				sk8_Met_Revert_05
			]
			minvol = 130
			maxvol = 160
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = Reverts
			pedbuss = PedReverts
		}
		pogo = {
			sound = [
				sk8_metalgrate_dull_01
				sk8_metalgrate_dull_02
				sk8_metalgrate_dull_03
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = pogo
			pedbuss = PedPogo
		}
		footstepjump = {
			sound = [
				sk8_terr_metal_feet_jump_03
			]
			minvol = 110
			maxvol = 130
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		footstepland = {
			sound = [
				sk8_terr_metal_feet_land_02
				sk8_terr_metal_feet_land_03
			]
			minvol = 140
			maxvol = 160
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		scuff = {
			sound = [
				sk8_terr_metal_feet_scff_05
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		boneless = {
			sound = [
				sk8_terr_metal_boneless_06
			]
			minvol = 80
			maxvol = 90
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = boneless
			pedbuss = PedBoneless
		}
		boardpickup = {
			sound = [
				sk8_terr_metal_pickup_03
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPickupPutdown
			pedbuss = PedBoardPickupPutdown
		}
		boardputdown = {
			sound = [
				sk8_terr_metal_putdown_01
				sk8_terr_metal_putdown_07
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPickupPutdown
			pedbuss = PedBoardPickupPutdown
		}
		handplant = {
			sound = [
				Metal_Ladder_Footstep_03
				Metal_Ladder_Footstep_09
				Metal_Ladder_Footstep_13
				Metal_Ladder_Footstep_16
				Metal_Ladder_Handstep_05
				Metal_Ladder_Handstep_06
			]
			minvol = 105
			maxvol = 115
			minpitch = 110
			maxpitch = 135
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
	}
	SFX_ID_METALCAR = {
		roll = {
			sound = [
				sk8_terr_metal_roll_loop
			]
			minvol = 0
			maxvol = 80
			minpitch = 70
			maxpitch = 85
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = linear
			volumecurve = inv_exponential
			pitchchangepercentageonturning = 115
			volsmoothfactorup = 1
			volsmoothfactordown = 1
			skaterbuss = Rolling
			pedbuss = PedRolling
			fastloop = on
			fastsound = [
				sk8_terr_metal_roll_fast
			]
			fastminvol = 0
			fastmaxvol = 80
			fastminpitch = 90
			fastmaxpitch = 100
			fastdropoff = $terrainsound_defaultdropoff
			fastdropoff_function = linear
			fastpitchcurve = exponential
			fastvolumecurve = exponential
			fastskaterbuss = Rolling
			fastpedbuss = PedRolling
		}
		bonk = {
			sound = [
				sk8_bonk_metal_01
				sk8_bonk_metal_02
				sk8_bonk_metal_03
			]
			minvol = 80
			maxvol = 100
			minpitch = 90
			maxpitch = 110
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			sweetener = off
			sweetsound = [
			]
			sweetpercentchance = 100
			waittime = 1
			sweetminvol = 85
			sweetmaxvol = 100
			sweetminpitch = 90
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			LowEndSweetener = on
			lowendsweetsound = [
				sk9_BailBodyPunch02
			]
			lowendminvol = 20
			lowendmaxvol = 65
			lowendminpitch = 90
			lowendmaxpitch = 110
			lowenddropoff = $terrainsound_defaultdropoff
			lowenddropoff_function = linear
			skaterbuss = BodyFalls
			pedbuss = PedBodyFalls
			sweetskaterbuss = Sweetners
			sweetpedbuss = PedSweetners
			lowendskaterbuss = LowEnd
			lowendpedbuss = PedLowEnd
		}
		footpush = {
			sound = [
				sk8_Met_Revert_03
				sk8_Met_Revert_05
			]
			minvol = 80
			maxvol = 100
			minpitch = 70
			maxpitch = 100
			pitchcurve = exponential
			volumecurve = exponential
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPush
			pedbuss = PedBoardPush
		}
		Grind = {
			sound = [
				sk8_terr_metal_grind_loop
			]
			minvol = 0
			maxvol = 80
			minpitch = 85
			maxpitch = 90
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = inv_exponential
			volumecurve = inv_exponential
			skaterbuss = Grinding
			pedbuss = PedGrinding
		}
		slide = {
			sound = [
				sk8_terr_metal_slide_loop
			]
			minvol = 0
			maxvol = 80
			minpitch = 90
			maxpitch = 90
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = inv_exponential
			volumecurve = inv_exponential
			skaterbuss = Sliding
			pedbuss = PedSliding
		}
		footstep = {
			walksound = [
				SK8_CarHood_Footstep_01
				SK8_CarHood_Footstep_02
				SK8_CarHood_Footstep_03
			]
			runsound = [
				SK8_CarHood_Runstep_01
				SK8_CarHood_Runstep_02
				SK8_CarHood_Runstep_03
				SK8_CarHood_Runstep_04
			]
			minvol = 90
			maxvol = 110
			minpitch = 90
			maxpitch = 110
			dropoff = $TerrainSound_DefaultFootStepDropoff
			dropoff_function = linear
			skaterbuss = Footsteps
			pedbuss = PedFootsteps
			footsteplayer = off
			layersound = [
			]
			layerpercentchance = 10
			layervol = 20
			layerpitch = 100
			layerdropoff = $terrainsound_defaultdropoff
			layerdropoff_function = linear
			layerskaterbuss = footsteplayer
			layerpedbuss = PedFootstepLayer
		}
		ollie = {
			sound = [
				sk8_Plastic_Ollie_01
			]
			minvol = 150
			maxvol = 200
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = SkaterOllies
			pedbuss = PedOlliesLands
		}
		ollieland = {
			sound = [
				SK8_CarHood_Land_01
			]
			minvol = 110
			maxvol = 150
			minpitch = 80
			maxpitch = 120
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = SkaterLands
			pedbuss = PedOlliesLands
		}
		grindon = {
			sound = [
				sk8_terr_metal_grind_on_01
			]
			minvol = 110
			maxvol = 120
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		grindoff = {
			sound = [
				sk8_terr_metal_grind_off_03
				sk8_terr_metal_grind_off_04
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		slideon = {
			sound = [
				sk8_terr_metal_grind_on_01
			]
			minvol = 110
			maxvol = 120
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		slideoff = {
			sound = [
				sk8_terr_metal_grind_off_03
				sk8_terr_metal_grind_off_04
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		revert = {
			sound = [
				sk8_CarHood_Revert_01
				sk8_CarHood_Revert_02
			]
			minvol = 130
			maxvol = 160
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = Reverts
			pedbuss = PedReverts
		}
		pogo = {
			sound = [
				sk8_metalgrate_dull_01
				sk8_metalgrate_dull_02
				sk8_metalgrate_dull_03
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = pogo
			pedbuss = PedPogo
		}
		footstepjump = {
			sound = [
				sk8_CarHood_footJump_01
			]
			minvol = 110
			maxvol = 130
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		footstepland = {
			sound = [
				sk8_CarHood_Footland_01
			]
			minvol = 140
			maxvol = 160
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		scuff = {
			sound = [
				sk8_CarHood_FootScuff_01
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		boneless = {
			sound = [
				sk8_terr_metal_boneless_06
			]
			minvol = 80
			maxvol = 90
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = boneless
			pedbuss = PedBoneless
		}
		boardpickup = {
			sound = [
				SK8_Asphalt_KickUp_03
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPickupPutdown
			pedbuss = PedBoardPickupPutdown
		}
		boardputdown = {
			sound = [
				Sk8_CarHood_PutDown_01
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPickupPutdown
			pedbuss = PedBoardPickupPutdown
		}
		handplant = {
			sound = [
				Metal_Ladder_Footstep_03
				Metal_Ladder_Footstep_09
				Metal_Ladder_Footstep_13
				Metal_Ladder_Footstep_16
				Metal_Ladder_Handstep_05
				Metal_Ladder_Handstep_06
			]
			minvol = 105
			maxvol = 115
			minpitch = 110
			maxpitch = 135
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
	}
	SFX_ID_GLASSWINDSHIELD = {
		footstep = {
			walksound = [
				sk8_terr_car_windshld_ft_01
				sk8_terr_car_windshld_ft_02
				sk8_terr_car_windshld_ft_03
			]
			runsound = [
				sk8_terr_car_windshld_ft_01
				sk8_terr_car_windshld_ft_02
				sk8_terr_car_windshld_ft_03
			]
			minvol = 90
			maxvol = 110
			minpitch = 90
			maxpitch = 110
			dropoff = $TerrainSound_DefaultFootStepDropoff
			dropoff_function = linear
			skaterbuss = Footsteps
			pedbuss = PedFootsteps
			footsteplayer = off
			layersound = [
			]
			layerpercentchance = 10
			layervol = 20
			layerpitch = 100
			layerdropoff = $terrainsound_defaultdropoff
			layerdropoff_function = linear
			layerskaterbuss = footsteplayer
			layerpedbuss = PedFootstepLayer
		}
		footstepjump = {
			sound = [
				sk8_terr_windshield_jump_01
			]
			minvol = 50
			maxvol = 75
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		footstepland = {
			sound = [
				sk8_ter_winshield_land_01
			]
			minvol = 50
			maxvol = 75
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
	}
	SFX_ID_ROPE = {
		Grind = {
			sound = [
				sk8_rope_grind_03
			]
			minvol = 0
			maxvol = 100
			minpitch = 110
			maxpitch = 135
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = inv_exponential
			volumecurve = inv_exponential
			skaterbuss = Grinding
			pedbuss = PedGrinding
		}
		slide = {
			sound = [
				sk8_rope_slide_TEMP_03
			]
			minvol = 0
			maxvol = 100
			minpitch = 90
			maxpitch = 90
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = inv_exponential
			volumecurve = inv_exponential
			skaterbuss = Sliding
			pedbuss = PedSliding
		}
		grindon = {
			sound = [
				sk8_rope_grindon_02
			]
			minvol = 40
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		grindoff = {
			sound = [
				sk8_rope_grindoff_01
			]
			minvol = 30
			maxvol = 50
			minpitch = 125
			maxpitch = 145
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		slideon = {
			sound = [
				sk8_rope_slideon_01
			]
			minvol = 30
			maxvol = 50
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		slideoff = {
			sound = [
				sk8_rope_slideoff_02
			]
			minvol = 40
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
	}
	SFX_ID_ELECTRICWIRE = {
		Grind = {
			sound = [
				GrindWireSpark
			]
			minvol = 0
			maxvol = 80
			minpitch = 85
			maxpitch = 90
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = inv_exponential
			volumecurve = inv_exponential
			skaterbuss = Grinding
			pedbuss = PedGrinding
		}
		slide = {
			sound = [
				GrindWireSpark
			]
			minvol = 0
			maxvol = 80
			minpitch = 90
			maxpitch = 90
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = inv_exponential
			volumecurve = inv_exponential
			skaterbuss = Sliding
			pedbuss = PedSliding
		}
		grindon = {
			sound = [
				LandWireSpark
			]
			minvol = 60
			maxvol = 80
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		grindoff = {
			sound = [
				sk8_terr_metal_grind_off_03
				sk8_terr_metal_grind_off_04
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		slideon = {
			sound = [
				LandWireSpark
			]
			minvol = 60
			maxvol = 80
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		slideoff = {
			sound = [
				sk8_terr_metal_grind_off_03
				sk8_terr_metal_grind_off_04
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		handplant = {
			sound = [
				Wire_Climb_5
				Wire_Climb_4
				Wire_Climb_3
				Wire_Climb_2
				Wire_Climb_1
			]
			minvol = 250
			maxvol = 350
			minpitch = 100
			maxpitch = 110
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
	}
	SFX_ID_METALPOLE = {
		handplant = {
			sound = [
				Metal_Ladder_Footstep_03
				Metal_Ladder_Footstep_09
				Metal_Ladder_Footstep_13
				Metal_Ladder_Footstep_16
				Metal_Ladder_Handstep_05
				Metal_Ladder_Handstep_06
			]
			minvol = 105
			maxvol = 115
			minpitch = 110
			maxpitch = 135
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		bonk = {
			sound = [
				sk8_bonk_metal_01
				sk8_bonk_metal_02
				sk8_bonk_metal_03
			]
			minvol = 80
			maxvol = 100
			minpitch = 90
			maxpitch = 110
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			sweetener = off
			sweetsound = [
			]
			sweetpercentchance = 100
			waittime = 1
			sweetminvol = 85
			sweetmaxvol = 100
			sweetminpitch = 90
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			LowEndSweetener = on
			lowendsweetsound = [
				sk9_BailBodyPunch02
			]
			lowendminvol = 20
			lowendmaxvol = 65
			lowendminpitch = 90
			lowendmaxpitch = 110
			lowenddropoff = $terrainsound_defaultdropoff
			lowenddropoff_function = linear
			skaterbuss = BodyFalls
			pedbuss = PedBodyFalls
			sweetskaterbuss = Sweetners
			sweetpedbuss = PedSweetners
			lowendskaterbuss = LowEnd
			lowendpedbuss = PedLowEnd
		}
		Grind = {
			sound = [
				sk9_Metal_Pole_Grind_01
			]
			minvol = 0
			maxvol = 90
			minpitch = 90
			maxpitch = 100
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = inv_exponential
			volumecurve = inv_exponential
			skaterbuss = Grinding
			pedbuss = PedGrinding
		}
		slide = {
			sound = [
				sk8_metalpole_slide_01
			]
			minvol = 0
			maxvol = 65
			minpitch = 80
			maxpitch = 120
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = inv_exponential
			volumecurve = inv_exponential
			skaterbuss = Sliding
			pedbuss = PedSliding
		}
		grindon = {
			sound = [
				sk8_metalpole_grindon_02
			]
			minvol = 70
			maxvol = 100
			minpitch = 100
			maxpitch = 125
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		grindoff = {
			sound = [
				sk8_metalpole_grindoff_02
			]
			minvol = 90
			maxvol = 120
			minpitch = 100
			maxpitch = 125
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		slideon = {
			sound = [
				sk8_metalpole_slideon_02
			]
			minvol = 70
			maxvol = 100
			minpitch = 100
			maxpitch = 125
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		slideoff = {
			sound = [
				sk8_metalpole_slideoff_02
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 115
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
	}
	SFX_ID_WOODFENCE = {
		bonk = {
			sound = [
				sk8_bonk_wood_01
				sk8_bonk_wood_02
				sk8_bonk_wood_03
				sk8_bonk_wood_04
				sk8_bonk_wood_05
			]
			minvol = 80
			maxvol = 100
			minpitch = 90
			maxpitch = 110
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			sweetener = off
			sweetsound = [
			]
			sweetpercentchance = 100
			waittime = 1
			sweetminvol = 85
			sweetmaxvol = 100
			sweetminpitch = 90
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			LowEndSweetener = on
			lowendsweetsound = [
				sk9_BailBodyPunch02
			]
			lowendminvol = 20
			lowendmaxvol = 45
			lowendminpitch = 90
			lowendmaxpitch = 110
			lowenddropoff = $terrainsound_defaultdropoff
			lowenddropoff_function = linear
			skaterbuss = BodyFalls
			pedbuss = PedBodyFalls
			sweetskaterbuss = Sweetners
			sweetpedbuss = PedSweetners
			lowendskaterbuss = LowEnd
			lowendpedbuss = PedLowEnd
		}
		Grind = {
			sound = [
				SK9_Wood_Grind_Proto
			]
			minvol = 0
			maxvol = 40
			minpitch = 85
			maxpitch = 90
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = inv_exponential
			volumecurve = inv_exponential
			skaterbuss = Grinding
			pedbuss = PedGrinding
			clickklack = on
			clackmeters = 0.75
			clickklackontrans = on
			clickklackfrontsound = [
				sk8_terr_fence_grnd_clck_01
				sk8_terr_fence_grnd_clck_02
				sk8_terr_fence_grnd_clck_03
				sk8_terr_fence_grnd_clck_04
			]
			clickklackbacksound = [
				sk8_terr_fence_grnd_clck_08
				sk8_terr_fence_grnd_clck_09
				sk8_terr_fence_grnd_clck_10
				sk8_terr_fence_grnd_clck_11
			]
			clickminvol = 50
			clickmaxvol = 80
			clickminpitch = 70
			clickmaxpitch = 100
			clickdropoff = $terrainsound_defaultdropoff
			clickdropoff_function = linear
			clickskaterbuss = ClickClacks
			clickpedbuss = PedClickClacks
		}
		slide = {
			sound = [
				sk8_SolidWood_Slide_01
			]
			minvol = 0
			maxvol = 40
			minpitch = 90
			maxpitch = 90
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = inv_exponential
			volumecurve = inv_exponential
			skaterbuss = Sliding
			pedbuss = PedSliding
			clickklack = on
			clackmeters = 0.75
			clickklackontrans = on
			clickklackfrontsound = [
				sk8_terr_fence_slid_clck_01
				sk8_terr_fence_slid_clck_02
				sk8_terr_fence_slid_clck_03
				sk8_terr_fence_slid_clck_04
			]
			clickklackbacksound = [
				sk8_terr_fence_slid_clck_09
				sk8_terr_fence_slid_clck_10
				sk8_terr_fence_slid_clck_11
				sk8_terr_fence_slid_clck_12
			]
			clickminvol = 70
			clickmaxvol = 100
			clickminpitch = 80
			clickmaxpitch = 100
			clickdropoff = $terrainsound_defaultdropoff
			clickdropoff_function = linear
			clickskaterbuss = ClickClacks
			clickpedbuss = PedClickClacks
		}
		grindon = {
			sound = [
				sk8_wood_ollie_02
				sk8_wood_ollie_03
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		grindoff = {
			sound = [
				sk8_wood_land_03
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		slideon = {
			sound = [
				sk8_wood_ollie_02
				sk8_wood_ollie_03
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		slideoff = {
			sound = [
				sk8_wood_land_03
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
	}
	SFX_ID_SAND = {
		roll = {
			sound = [
				RollSand2
			]
			minvol = 0
			maxvol = 50
			minpitch = 70
			maxpitch = 85
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = linear
			volumecurve = inv_exponential
			pitchchangepercentageonturning = 115
			volsmoothfactorup = 0
			volsmoothfactordown = 3
			skaterbuss = Rolling
			pedbuss = PedRolling
			fastloop = off
			fastsound = [
				sk8_terr_metal_roll_fast
			]
			fastminvol = 0
			fastmaxvol = 80
			fastminpitch = 90
			fastmaxpitch = 100
			fastdropoff = $terrainsound_defaultdropoff
			fastdropoff_function = linear
			fastdropoff_function = linear
			fastpitchcurve = exponential
			fastvolumecurve = exponential
			fastskaterbuss = Rolling
			fastpedbuss = PedRolling
		}
		footstep = {
			walksound = [
				sk8_terr_grass_walk_thck_01
				sk8_terr_grass_walk_thck_02
				sk8_terr_grass_walk_thck_03
			]
			runsound = [
				sk8_terr_grass_run_thick_01
				sk8_terr_grass_run_thick_02
				sk8_terr_grass_run_thick_03
				sk8_terr_grass_run_thick_04
			]
			minvol = 1
			maxvol = 7
			minpitch = 60
			maxpitch = 80
			dropoff = $TerrainSound_DefaultFootStepDropoff
			dropoff_function = linear
			skaterbuss = Footsteps
			pedbuss = PedFootsteps
			footsteplayer = off
			layersound = [
			]
			layerpercentchance = 10
			layervol = 20
			layerpitch = 100
			layerdropoff = $terrainsound_defaultdropoff
			layerdropoff_function = linear
			layerskaterbuss = footsteplayer
			layerpedbuss = PedFootstepLayer
		}
		ollie = {
			sound = [
				sk8_terr_dirt_ollie
			]
			minvol = 100
			maxvol = 100
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = SkaterOllies
			pedbuss = PedOlliesLands
		}
		ollieland = {
			sound = [
				sk8_terr_grass_board_lnd_03
				sk8_terr_grass_board_lnd_04
			]
			minvol = 30
			maxvol = 60
			minpitch = 70
			maxpitch = 100
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = SkaterLands
			pedbuss = PedOlliesLands
		}
		revert = {
			sound = [
				sk8_terr_dirt_revert_01
				sk8_terr_dirt_revert_05
			]
			minvol = 60
			maxvol = 80
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = Reverts
			pedbuss = PedReverts
		}
		footstepjump = {
			sound = [
				sk8_terr_dirt_feet_jump_05
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		footstepland = {
			sound = [
				sk8_terr_dirt_feet_land_02
				sk8_terr_dirt_feet_land_03
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		scuff = {
			sound = [
				sk8_terr_dirt_feet_scuff_02
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		boneless = {
			sound = [
				sk8_terr_dirt_boneless_05
			]
			minvol = 40
			maxvol = 50
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = boneless
			pedbuss = PedBoneless
		}
		boardpickup = {
			sound = [
				sk8_terr_dirt_kickup_03
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPickupPutdown
			pedbuss = PedBoardPickupPutdown
		}
		boardputdown = {
			sound = [
				sk8_terr_dirt_ptdwn_mvng_04
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPickupPutdown
			pedbuss = PedBoardPickupPutdown
		}
	}
	SFX_ID_CHAINLINKFENCE = {
		roll = {
			sound = [
				sk8_roll_chainlink
			]
			minvol = 0
			maxvol = 100
			minpitch = 90
			maxpitch = 100
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = linear
			volumecurve = inv_exponential
			pitchchangepercentageonturning = 105
			volsmoothfactorup = 1
			volsmoothfactordown = 1
			skaterbuss = Rolling
			pedbuss = PedRolling
			fastloop = on
			fastsound = [
				sk8_terr_metal_roll_fast
			]
			fastminvol = 0
			fastmaxvol = 60
			fastminpitch = 105
			fastmaxpitch = 120
			fastdropoff = $terrainsound_defaultdropoff
			fastdropoff_function = linear
			fastpitchcurve = exponential
			fastvolumecurve = exponential
			fastskaterbuss = Rolling
			fastpedbuss = PedRolling
		}
		bonk = {
			sound = [
				sk8_bonk_ChainlinkFence_03
				sk8_bonk_ChainlinkFence_04
				sk8_bonk_ChainlinkFence_05
				sk8_bonk_ChainlinkFence_06
			]
			minvol = 80
			maxvol = 100
			minpitch = 90
			maxpitch = 110
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			sweetener = off
			sweetsound = [
			]
			sweetpercentchance = 100
			waittime = 1
			sweetminvol = 85
			sweetmaxvol = 100
			sweetminpitch = 90
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			LowEndSweetener = off
			lowendsweetsound = [
				sk9_BailBodyPunch02
			]
			lowendminvol = 10
			lowendmaxvol = 35
			lowendminpitch = 90
			lowendmaxpitch = 110
			lowenddropoff = $terrainsound_defaultdropoff
			lowenddropoff_function = linear
			skaterbuss = BodyFalls
			pedbuss = PedBodyFalls
			sweetskaterbuss = Sweetners
			sweetpedbuss = PedSweetners
			lowendskaterbuss = LowEnd
			lowendpedbuss = PedLowEnd
		}
		Grind = {
			sound = [
				sk9_Metal_Pole_Grind_01
			]
			minvol = 0
			maxvol = 60
			minpitch = 95
			maxpitch = 110
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = inv_exponential
			volumecurve = inv_exponential
			skaterbuss = Grinding
			pedbuss = PedGrinding
		}
		slide = {
			sound = [
				sk8_metalpole_slide_01
			]
			minvol = 0
			maxvol = 40
			minpitch = 90
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = inv_exponential
			volumecurve = inv_exponential
			skaterbuss = Sliding
			pedbuss = PedSliding
		}
		grindon = {
			sound = [
				sk8_bonk_ChainlinkFence_06
				sk8_bonk_ChainlinkFence_04
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		grindoff = {
			sound = [
				sk8_bonk_ChainlinkFence_03
				sk8_bonk_ChainlinkFence_05
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		slideon = {
			sound = [
				sk8_bonk_ChainlinkFence_06
				sk8_bonk_ChainlinkFence_04
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		slideoff = {
			sound = [
				sk8_bonk_ChainlinkFence_03
				sk8_bonk_ChainlinkFence_05
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		wallride = {
			sound = [
				sk8_Chainlink
			]
			minvol = 40
			maxvol = 90
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = wallride
			pedbuss = PedWallRide
		}
		handplant = {
			sound = [
				Metal_Ladder_Footstep_03
				Metal_Ladder_Footstep_09
				Metal_Ladder_Footstep_13
				Metal_Ladder_Footstep_16
				Metal_Ladder_Handstep_05
				Metal_Ladder_Handstep_06
			]
			minvol = 105
			maxvol = 115
			minpitch = 110
			maxpitch = 135
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
	}
	SFX_ID_CHAIN = {
		Grind = {
			sound = [
				sk8_roll_chainlink
			]
			minvol = 20
			maxvol = 100
			minpitch = 95
			maxpitch = 110
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = inv_exponential
			volumecurve = inv_exponential
			skaterbuss = Grinding
			pedbuss = PedGrinding
			clickklack = on
			clackmeters = 2
			clickklackontrans = on
			clickklackfrontsound = [
				sk8_metalgrate_sharp_01
				sk8_metalgrate_sharp_02
			]
			clickklackbacksound = [
				sk8_metalgrate_sharp_01
				sk8_metalgrate_sharp_02
			]
			clickminvol = 30
			clickmaxvol = 50
			clickminpitch = 80
			clickmaxpitch = 110
			clickdropoff = $terrainsound_defaultdropoff
			clickdropoff_function = linear
			clickskaterbuss = ClickClacks
			clickpedbuss = PedClickClacks
		}
		slide = {
			sound = [
				sk8_metalpole_slide_01
			]
			minvol = 0
			maxvol = 40
			minpitch = 105
			maxpitch = 125
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = inv_exponential
			volumecurve = inv_exponential
			skaterbuss = Sliding
			pedbuss = PedSliding
			clickklack = on
			clackmeters = 2
			clickklackontrans = on
			clickklackfrontsound = [
				sk8_metalgrate_sharp_01
				sk8_metalgrate_sharp_02
			]
			clickklackbacksound = [
				sk8_metalgrate_sharp_01
				sk8_metalgrate_sharp_02
			]
			clickminvol = 30
			clickmaxvol = 50
			clickminpitch = 80
			clickmaxpitch = 110
			clickdropoff = $terrainsound_defaultdropoff
			clickdropoff_function = linear
			clickskaterbuss = ClickClacks
			clickpedbuss = PedClickClacks
		}
		grindon = {
			sound = [
				sk8_metalpole_grindon_02
			]
			minvol = 70
			maxvol = 110
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		grindoff = {
			sound = [
				sk8_metalpole_grindoff_02
			]
			minvol = 105
			maxvol = 115
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		slideon = {
			sound = [
				sk8_metalpole_slideon_02
			]
			minvol = 120
			maxvol = 130
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		slideoff = {
			sound = [
				sk8_metalpole_slideoff_02
			]
			minvol = 105
			maxvol = 115
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
	}
	SFX_ID_CORRPLASTIC = {
		bonk = {
			sound = [
				sk8_bonk_plastic_02
				sk8_bonk_plastic_03
			]
			minvol = 80
			maxvol = 100
			minpitch = 90
			maxpitch = 110
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			sweetener = off
			sweetsound = [
			]
			sweetpercentchance = 100
			waittime = 1
			sweetminvol = 85
			sweetmaxvol = 100
			sweetminpitch = 90
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			LowEndSweetener = off
			lowendsweetsound = [
				sk9_BailBodyPunch02
			]
			lowendminvol = 10
			lowendmaxvol = 35
			lowendminpitch = 90
			lowendmaxpitch = 110
			lowenddropoff = $terrainsound_defaultdropoff
			lowenddropoff_function = linear
			skaterbuss = BodyFalls
			pedbuss = PedBodyFalls
			sweetskaterbuss = Sweetners
			sweetpedbuss = PedSweetners
			lowendskaterbuss = LowEnd
			lowendpedbuss = PedLowEnd
		}
		Grind = {
			sound = [
				sk8_ter_plastic_grind_loop
			]
			minvol = 0
			maxvol = 70
			minpitch = 95
			maxpitch = 120
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = inv_exponential
			volumecurve = inv_exponential
			skaterbuss = Grinding
			pedbuss = PedGrinding
			clickklack = on
			clackmeters = 0.75
			clickklackontrans = on
			clickklackfrontsound = [
				sk8_terr_tile_click_01
				sk8_terr_tile_click_02
				sk8_terr_tile_click_03
				sk8_terr_tile_click_04
				sk8_terr_tile_click_05
			]
			clickklackbacksound = [
				sk8_terr_tile_clack_01
				sk8_terr_tile_clack_02
				sk8_terr_tile_clack_03
				sk8_terr_tile_clack_04
				sk8_terr_tile_clack_05
			]
			clickminvol = 30
			clickmaxvol = 50
			clickminpitch = 70
			clickmaxpitch = 100
			clickdropoff = $terrainsound_defaultdropoff
			clickdropoff_function = linear
			clickskaterbuss = ClickClacks
			clickpedbuss = PedClickClacks
		}
		slide = {
			sound = [
				sk8_ter_plastic_slide_loop
			]
			minvol = 0
			maxvol = 40
			minpitch = 85
			maxpitch = 100
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = inv_exponential
			volumecurve = inv_exponential
			skaterbuss = Sliding
			pedbuss = PedSliding
			clickklack = on
			clackmeters = 0.75
			clickklackontrans = on
			clickklackfrontsound = [
				sk8_terr_tile_click_01
				sk8_terr_tile_click_02
				sk8_terr_tile_click_03
				sk8_terr_tile_click_04
				sk8_terr_tile_click_05
			]
			clickklackbacksound = [
				sk8_terr_tile_clack_01
				sk8_terr_tile_clack_02
				sk8_terr_tile_clack_03
				sk8_terr_tile_clack_04
				sk8_terr_tile_clack_05
			]
			clickminvol = 30
			clickmaxvol = 50
			clickminpitch = 70
			clickmaxpitch = 100
			clickdropoff = $terrainsound_defaultdropoff
			clickdropoff_function = linear
			clickskaterbuss = ClickClacks
			clickpedbuss = PedClickClacks
		}
		grindon = {
			sound = [
				sk8_terr_plastic_grnd_on_04
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		grindoff = {
			sound = [
				sk8_terr_plastic_grind_off_09
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		slideon = {
			sound = [
				sk8_terr_plastic_slide_n_05
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		slideoff = {
			sound = [
				sk8_terr_plastic_slid_ff_05
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
	}
	SFX_ID_RUBBER = {
		Grind = {
			sound = [
				sk8_ter_plastic_grind_loop
			]
			minvol = 0
			maxvol = 70
			minpitch = 95
			maxpitch = 120
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = inv_exponential
			volumecurve = inv_exponential
			skaterbuss = Grinding
			pedbuss = PedGrinding
		}
		slide = {
			sound = [
				sk8_ter_plastic_slide_loop
			]
			minvol = 0
			maxvol = 40
			minpitch = 65
			maxpitch = 85
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = inv_exponential
			volumecurve = inv_exponential
			skaterbuss = Sliding
			pedbuss = PedSliding
		}
		grindon = {
			sound = [
				sk8_terr_plastic_grnd_on_04
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		grindoff = {
			sound = [
				sk8_terr_plastic_grind_off_09
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		slideon = {
			sound = [
				sk8_terr_plastic_slide_n_05
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		slideoff = {
			sound = [
				sk8_terr_plastic_grind_off_09
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
	}
	SFX_ID_MUD = {
		roll = {
			sound = [
				SK9_mud_roll_slow
			]
			minvol = 0
			maxvol = 75
			minpitch = 85
			maxpitch = 100
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = linear
			volumecurve = inv_exponential
			pitchchangepercentageonturning = 110
			volsmoothfactorup = 1
			volsmoothfactordown = 1
			skaterbuss = Rolling
			pedbuss = PedRolling
			fastloop = off
			fastsound = [
				Sk8_Asphalt_Fast_01
			]
			fastminvol = 0
			fastmaxvol = 75
			fastminpitch = 90
			fastmaxpitch = 100
			fastdropoff = $terrainsound_defaultdropoff
			fastdropoff_function = linear
			fastdropoff_function = linear
			fastpitchcurve = exponential
			fastvolumecurve = exponential
			fastskaterbuss = Rolling
			fastpedbuss = PedRolling
		}
		slide = {
			sound = [
				sk9_Mud_Slide_forpogo
			]
			minvol = 0
			maxvol = 90
			minpitch = 100
			maxpitch = 100
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = inv_exponential
			volumecurve = inv_exponential
			skaterbuss = Sliding
			pedbuss = PedSliding
		}
		slidefall = {
			sound = [
				sk9_Mud_Slide_forpogo
			]
			minvol = 0
			maxvol = 80
			minpitch = 60
			maxpitch = 140
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			pitchcurve = linear
			volumecurve = linear
			volsmoothfactorup = 2
			volsmoothfactordown = 6
			skaterbuss = BailSlide
			pedbuss = PedBailSlide
			terrainsweetener = off
			terrainsweetenersound = [
				sk8_terr_water_roll_loop
			]
			sweetminvol = 0
			sweetmaxvol = 200
			sweetminpitch = 60
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			sweetpitchcurve = linear
			sweetvolumecurve = exponential
			sweetskaterbuss = BailSlide
			sweetpedbuss = PedBailSlide
		}
		footstep = {
			walksound = [
				sk8_terr_dirt_feet_walk_01
				sk8_terr_dirt_feet_walk_02
				sk8_terr_dirt_feet_walk_03
			]
			runsound = [
				sk8_terr_dirt_feet_run_01
				sk8_terr_dirt_feet_run_02
				sk8_terr_dirt_feet_run_03
				sk8_terr_dirt_feet_run_04
			]
			minvol = 20
			maxvol = 30
			minpitch = 90
			maxpitch = 110
			dropoff = $TerrainSound_DefaultFootStepDropoff
			dropoff_function = linear
			skaterbuss = Footsteps
			pedbuss = PedFootsteps
			footsteplayer = on
			layersound = [
				SK9_mud_fs_layer_01
				SK9_mud_fs_layer_03
				SK9_mud_fs_layer_04
				SK9_mud_fs_layer_05
			]
			layerpercentchance = 100
			layervol = 25
			layerpitch = 100
			layerdropoff = $terrainsound_defaultdropoff
			layerdropoff_function = linear
			layerskaterbuss = footsteplayer
			layerpedbuss = PedFootstepLayer
		}
		bodyfall = {
			sound = [
				sk9_bodyfall_torso_01
				sk9_bodyfall_torso_02
			]
			minvol = 10
			maxvol = 30
			minpitch = 80
			maxpitch = 120
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			sweetener = on
			sweetsound = [
				SK9_mud_fs_layer_01
				SK9_mud_fs_layer_03
				SK9_mud_fs_layer_04
				SK9_mud_fs_layer_05
			]
			sweetpercentchance = 100
			waittime = 0.01
			sweetminvol = 30
			sweetmaxvol = 70
			sweetminpitch = 90
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			LowEndSweetener = on
			lowendsweetsound = [
				sk9_BailBodyPunch01
				sk9_BailBodyPunch02
				sk9_BailBodyPunch03
				sk9_BailBodyPunch04
			]
			lowendminvol = 0
			lowendmaxvol = 80
			lowendminpitch = 90
			lowendmaxpitch = 110
			lowenddropoff = $terrainsound_defaultdropoff
			lowenddropoff_function = linear
			skaterbuss = BodyFalls
			pedbuss = PedBodyFalls
			sweetskaterbuss = Sweetners
			sweetpedbuss = PedSweetners
			lowendskaterbuss = LowEnd
			lowendpedbuss = PedLowEnd
		}
		headfall = {
			sound = [
				sk9_bodyfall_head
			]
			minvol = 10
			maxvol = 30
			minpitch = 80
			maxpitch = 120
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			sweetener = on
			sweetsound = [
				SK9_mud_fs_layer_01
				SK9_mud_fs_layer_03
				SK9_mud_fs_layer_04
				SK9_mud_fs_layer_05
			]
			sweetpercentchance = 100
			waittime = 0.01
			sweetminvol = 30
			sweetmaxvol = 70
			sweetminpitch = 90
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			LowEndSweetener = off
			lowendsweetsound = [
			]
			lowendminvol = 0
			lowendmaxvol = 100
			lowendminpitch = 90
			lowendmaxpitch = 110
			lowenddropoff = $terrainsound_defaultdropoff
			lowenddropoff_function = linear
			skaterbuss = BodyFalls
			pedbuss = PedBodyFalls
			sweetskaterbuss = Sweetners
			sweetpedbuss = PedSweetners
			lowendskaterbuss = LowEnd
			lowendpedbuss = PedLowEnd
		}
		legfall = {
			sound = [
				sk9_bodyfall_leg_01
				sk9_bodyfall_leg_02
				sk9_bodyfall_leg_03
				sk9_bodyfall_leg_04
			]
			minvol = 10
			maxvol = 30
			minpitch = 80
			maxpitch = 120
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			sweetener = on
			sweetsound = [
				SK9_mud_fs_layer_01
				SK9_mud_fs_layer_03
				SK9_mud_fs_layer_04
				SK9_mud_fs_layer_05
			]
			sweetpercentchance = 100
			waittime = 0.01
			sweetminvol = 30
			sweetmaxvol = 70
			sweetminpitch = 90
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			LowEndSweetener = off
			lowendsweetsound = [
			]
			lowendminvol = 0
			lowendmaxvol = 100
			lowendminpitch = 90
			lowendmaxpitch = 110
			lowenddropoff = $terrainsound_defaultdropoff
			lowenddropoff_function = linear
			skaterbuss = BodyFalls
			pedbuss = PedBodyFalls
			sweetskaterbuss = Sweetners
			sweetpedbuss = PedSweetners
			lowendskaterbuss = LowEnd
			lowendpedbuss = PedLowEnd
		}
		armfall = {
			sound = [
				sk9_bodyfall_arm_01
				sk9_bodyfall_arm_02
				sk9_bodyfall_arm_03
			]
			minvol = 10
			maxvol = 30
			minpitch = 80
			maxpitch = 120
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			sweetener = on
			sweetsound = [
				SK9_mud_fs_layer_01
				SK9_mud_fs_layer_03
				SK9_mud_fs_layer_04
				SK9_mud_fs_layer_05
			]
			sweetpercentchance = 100
			waittime = 0.01
			sweetminvol = 30
			sweetmaxvol = 70
			sweetminpitch = 90
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			LowEndSweetener = off
			lowendsweetsound = [
			]
			lowendminvol = 0
			lowendmaxvol = 100
			lowendminpitch = 90
			lowendmaxpitch = 110
			lowenddropoff = $terrainsound_defaultdropoff
			lowenddropoff_function = linear
			skaterbuss = BodyFalls
			pedbuss = PedBodyFalls
			sweetskaterbuss = Sweetners
			sweetpedbuss = PedSweetners
			lowendskaterbuss = LowEnd
			lowendpedbuss = PedLowEnd
		}
		nutsfall = {
			sound = [
				BailCrack01
			]
			minvol = 10
			maxvol = 30
			minpitch = 80
			maxpitch = 120
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			sweetener = on
			sweetsound = [
				SK9_mud_fs_layer_01
				SK9_mud_fs_layer_03
				SK9_mud_fs_layer_04
				SK9_mud_fs_layer_05
			]
			sweetpercentchance = 100
			waittime = 0.01
			sweetminvol = 30
			sweetmaxvol = 70
			sweetminpitch = 90
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			LowEndSweetener = off
			lowendsweetsound = [
			]
			lowendminvol = 0
			lowendmaxvol = 100
			lowendminpitch = 90
			lowendmaxpitch = 110
			lowenddropoff = $terrainsound_defaultdropoff
			lowenddropoff_function = linear
			skaterbuss = BodyFalls
			pedbuss = PedBodyFalls
			sweetskaterbuss = Sweetners
			sweetpedbuss = PedSweetners
			lowendskaterbuss = LowEnd
			lowendpedbuss = PedLowEnd
		}
		footpush = {
			sound = [
				SK8_Grass_Pushes_02
			]
			minvol = 60
			maxvol = 110
			minpitch = 70
			maxpitch = 100
			pitchcurve = exponential
			volumecurve = exponential
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPush
			pedbuss = PedBoardPush
		}
		ollie = {
			sound = [
				sk9_mud_ollie_01
			]
			minvol = 100
			maxvol = 100
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = SkaterOllies
			pedbuss = PedOlliesLands
		}
		ollieland = {
			sound = [
				sk9_mud_ollie_land_01
			]
			minvol = 90
			maxvol = 110
			minpitch = 80
			maxpitch = 120
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = SkaterLands
			pedbuss = PedOlliesLands
		}
		slideon = {
			sound = [
				SK9_mud_fs_layer_03
			]
			minvol = 80
			maxvol = 100
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		revert = {
			sound = [
				SK9_mud_revert_01
			]
			minvol = 60
			maxvol = 80
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = Reverts
			pedbuss = PedReverts
		}
		pogo = {
			sound = [
				SK9_mud_FeetLand_01
				SK9_mud_FeetLand_02
			]
			minvol = 30
			maxvol = 45
			minpitch = 80
			maxpitch = 90
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = pogo
			pedbuss = PedPogo
		}
		footstepjump = {
			sound = [
				SK9_mud_FeetJump_01
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		footstepland = {
			sound = [
				SK9_mud_FeetLand_01
				SK9_mud_FeetLand_02
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		scuff = {
			sound = [
				SK9_mud_fs_layer_01
				SK9_mud_fs_layer_03
			]
			minvol = 45
			maxvol = 55
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		boneless = {
			sound = [
				SK9_mud_Boneless_01
			]
			minvol = 50
			maxvol = 60
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = boneless
			pedbuss = PedBoneless
		}
		boardpickup = {
			sound = [
				sk8_terr_dirt_kickup_03
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPickupPutdown
			pedbuss = PedBoardPickupPutdown
		}
		boardputdown = {
			sound = [
				sk9_mud_ollie_land_01
			]
			minvol = 50
			maxvol = 60
			minpitch = 110
			maxpitch = 120
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPickupPutdown
			pedbuss = PedBoardPickupPutdown
		}
		handplant = {
			sound = [
				sk8_terr_dirt_feet_walk_01
				sk8_terr_dirt_feet_walk_02
				sk8_terr_dirt_feet_walk_03
			]
			minvol = 160
			maxvol = 180
			minpitch = 150
			maxpitch = 160
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
	}
	SFX_ID_WOODHOLLOW_4FT = {
		roll = {
			sound = [
				sk8_Temp_Wood_Loop
			]
			minvol = 0
			maxvol = 50
			minpitch = 80
			maxpitch = 100
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = linear
			volumecurve = inv_exponential
			pitchchangepercentageonturning = 110
			volsmoothfactorup = 1
			volsmoothfactordown = 1
			skaterbuss = Rolling
			pedbuss = PedRolling
			fastloop = on
			fastsound = [
				sk8_Temp_Wood_Fast
			]
			fastminvol = 0
			fastmaxvol = 50
			fastminpitch = 90
			fastmaxpitch = 100
			fastdropoff = $terrainsound_defaultdropoff
			fastdropoff_function = linear
			fastpitchcurve = exponential
			fastvolumecurve = exponential
			fastskaterbuss = Rolling
			fastpedbuss = PedRolling
			clickklack = on
			clackmeters = 1.5
			clickklackontrans = on
			clickklackfrontsound = [
				Sk8_Terr_Wood_Click_01
				Sk8_Terr_Wood_Click_02
				Sk8_Terr_Wood_Click_03
				Sk8_Terr_Wood_Click_04
				Sk8_Terr_Wood_Click_05
			]
			clickklackbacksound = [
				Sk8_Terr_Wood_Clack_01
				Sk8_Terr_Wood_Clack_02
				Sk8_Terr_Wood_Clack_03
				Sk8_Terr_Wood_Clack_04
				Sk8_Terr_Wood_Clack_05
			]
			clickminvol = 30
			clickmaxvol = 60
			clickminpitch = 70
			clickmaxpitch = 100
			clickdropoff = $terrainsound_defaultdropoff
			clickdropoff_function = linear
			clickskaterbuss = ClickClacks
			clickpedbuss = PedClickClacks
		}
		Grind = {
			sound = [
				sk8_SolidWood_Grind_01
			]
			minvol = 0
			maxvol = 80
			minpitch = 85
			maxpitch = 90
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = inv_exponential
			volumecurve = inv_exponential
			skaterbuss = GrindingSliding
			pedbuss = PedGrindingSliding
		}
		slide = {
			sound = [
				sk8_SolidWood_Slide_01
			]
			minvol = 0
			maxvol = 80
			minpitch = 90
			maxpitch = 90
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = inv_exponential
			volumecurve = inv_exponential
			skaterbuss = GrindingSliding
			pedbuss = PedGrindingSliding
		}
		footstep = {
			walksound = [
				sk8_wood_feet_walk_01
				sk8_wood_feet_walk_02
				sk8_wood_feet_walk_03
			]
			runsound = [
				sk8_wood_feet_run_01
				sk8_wood_feet_run_02
				sk8_wood_feet_run_03
				sk8_wood_feet_run_04
			]
			minvol = 15
			maxvol = 30
			minpitch = 90
			maxpitch = 110
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = Footsteps
			pedbuss = PedFootsteps
			footsteplayer = off
			layersound = [
			]
			layerpercentchance = 10
			layervol = 20
			layerpitch = 100
			layerdropoff = $terrainsound_defaultdropoff
			layerdropoff_function = linear
			layerskaterbuss = footsteplayer
			layerpedbuss = PedFootstepLayer
		}
		bonk = {
			sound = [
				BailBodyFall01
				BailBodyFall02
				BailBodyFall03
				BailBodyFall04
				BailBodyFall05
			]
			minvol = 80
			maxvol = 150
			minpitch = 90
			maxpitch = 110
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			sweetener = off
			sweetsound = [
				sk8_bonk_wood_01
				sk8_bonk_wood_02
				sk8_bonk_wood_03
				sk8_bonk_wood_04
				sk8_bonk_wood_05
			]
			sweetpercentchance = 100
			waittime = 0
			sweetminvol = 40
			sweetmaxvol = 80
			sweetminpitch = 90
			sweetmaxpitch = 140
			sweetdropoff = $terrainsound_defaultdropoff
			sweetdropoff_function = linear
			LowEndSweetener = off
			lowendsweetsound = [
			]
			lowendminvol = 0
			lowendmaxvol = 100
			lowendminpitch = 90
			lowendmaxpitch = 110
			lowenddropoff = $terrainsound_defaultdropoff
			lowenddropoff_function = linear
			skaterbuss = BodyFalls
			pedbuss = PedBodyFalls
			sweetskaterbuss = Sweetners
			sweetpedbuss = PedSweetners
			lowendskaterbuss = LowEnd
			lowendpedbuss = PedLowEnd
		}
		ollie = {
			sound = [
				sk8_wood_ollie_02
				sk8_wood_ollie_03
			]
			minvol = 150
			maxvol = 200
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = OlliesLands
			pedbuss = PedOlliesLands
		}
		ollieland = {
			sound = [
				sk8_wood_land_03
			]
			minvol = 90
			maxvol = 110
			minpitch = 80
			maxpitch = 120
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = OlliesLands
			pedbuss = PedOlliesLands
		}
		grindon = {
			sound = [
				sk8_wood_ollie_02
				sk8_wood_ollie_03
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		grindoff = {
			sound = [
				sk8_wood_land_03
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		slideon = {
			sound = [
				sk8_wood_ollie_02
				sk8_wood_ollie_03
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		slideoff = {
			sound = [
				sk8_wood_land_03
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		revert = {
			sound = [
				sk8_wood_revert_01
				sk8_wood_revert_02
			]
			minvol = 80
			maxvol = 100
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = Reverts
			pedbuss = PedReverts
		}
		pogo = {
			sound = [
				sk8_wood_pogo_01
				sk8_wood_pogo_02
				sk8_wood_pogo_03
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = pogo
			pedbuss = PedPogo
		}
		footstepjump = {
			sound = [
				sk8_wood_feet_jump_04
			]
			minvol = 40
			maxvol = 60
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		footstepland = {
			sound = [
				sk8_wood_feet_land_01
				sk8_wood_feet_land_02
			]
			minvol = 70
			maxvol = 90
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		scuff = {
			sound = [
				sk8_wood_feet_scuff_02
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		boneless = {
			sound = [
				sk8_wood_Boneless_03
			]
			minvol = 80
			maxvol = 90
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = boneless
			pedbuss = PedBoneless
		}
		boardpickup = {
			sound = [
				sk8_wood_pickup_02
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPickupPutdown
			pedbuss = PedBoardPickupPutdown
		}
		boardputdown = {
			sound = [
				sk8_wood_putdown_03
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPickupPutdown
			pedbuss = PedBoardPickupPutdown
		}
	}
	SFX_ID_ROOFTOP = {
		roll = {
			sound = [
				sk8_Temp_Wood_Loop
			]
			minvol = 0
			maxvol = 50
			minpitch = 80
			maxpitch = 100
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = linear
			volumecurve = inv_exponential
			pitchchangepercentageonturning = 110
			volsmoothfactorup = 1
			volsmoothfactordown = 1
			skaterbuss = Rolling
			pedbuss = PedRolling
			fastloop = on
			fastsound = [
				sk8_Temp_Wood_Fast
			]
			fastminvol = 0
			fastmaxvol = 50
			fastminpitch = 90
			fastmaxpitch = 100
			fastdropoff = $terrainsound_defaultdropoff
			fastdropoff_function = linear
			fastpitchcurve = exponential
			fastvolumecurve = exponential
			fastskaterbuss = Rolling
			fastpedbuss = PedRolling
		}
		Grind = {
			sound = [
				sk8_SolidWood_Grind_01
			]
			minvol = 0
			maxvol = 80
			minpitch = 85
			maxpitch = 90
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = inv_exponential
			volumecurve = inv_exponential
			skaterbuss = GrindingSliding
			pedbuss = PedGrindingSliding
		}
		slide = {
			sound = [
				sk8_SolidWood_Slide_01
			]
			minvol = 0
			maxvol = 80
			minpitch = 90
			maxpitch = 90
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = exponential
			pitchcurve = inv_exponential
			volumecurve = inv_exponential
			skaterbuss = GrindingSliding
			pedbuss = PedGrindingSliding
		}
		footstep = {
			walksound = [
				sk8_wood_feet_walk_01
				sk8_wood_feet_walk_02
				sk8_wood_feet_walk_03
			]
			runsound = [
				sk8_wood_feet_run_01
				sk8_wood_feet_run_02
				sk8_wood_feet_run_03
				sk8_wood_feet_run_04
			]
			minvol = 15
			maxvol = 30
			minpitch = 90
			maxpitch = 110
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = Footsteps
			pedbuss = PedFootsteps
			footsteplayer = off
			layersound = [
			]
			layerpercentchance = 10
			layervol = 20
			layerpitch = 100
			layerdropoff = $terrainsound_defaultdropoff
			layerdropoff_function = linear
			layerskaterbuss = footsteplayer
			layerpedbuss = PedFootstepLayer
		}
		bonk = {
			sound = [
				BailBodyFall01
				BailBodyFall02
				BailBodyFall03
				BailBodyFall04
				BailBodyFall05
			]
			minvol = 80
			maxvol = 150
			minpitch = 90
			maxpitch = 110
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BodyFalls
			pedbuss = PedBodyFalls
			sweetskaterbuss = Sweetners
			sweetpedbuss = PedSweetners
			lowendskaterbuss = LowEnd
			lowendpedbuss = PedLowEnd
		}
		ollie = {
			sound = [
				sk8_wood_ollie_02
				sk8_wood_ollie_03
			]
			minvol = 150
			maxvol = 200
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = OlliesLands
			pedbuss = PedOlliesLands
		}
		ollieland = {
			sound = [
				sk8_wood_land_03
			]
			minvol = 90
			maxvol = 110
			minpitch = 80
			maxpitch = 120
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = OlliesLands
			pedbuss = PedOlliesLands
		}
		grindon = {
			sound = [
				sk8_wood_ollie_02
				sk8_wood_ollie_03
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		grindoff = {
			sound = [
				sk8_wood_land_03
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		slideon = {
			sound = [
				sk8_wood_ollie_02
				sk8_wood_ollie_03
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		slideoff = {
			sound = [
				sk8_wood_land_03
			]
			minvol = 50
			maxvol = 70
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = ONsOFFs
			pedbuss = PedONsOFFs
		}
		revert = {
			sound = [
				sk8_wood_revert_01
				sk8_wood_revert_02
			]
			minvol = 80
			maxvol = 100
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = Reverts
			pedbuss = PedReverts
		}
		pogo = {
			sound = [
				sk8_wood_pogo_01
				sk8_wood_pogo_02
				sk8_wood_pogo_03
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = pogo
			pedbuss = PedPogo
		}
		footstepjump = {
			sound = [
				sk8_wood_feet_jump_04
			]
			minvol = 40
			maxvol = 60
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		footstepland = {
			sound = [
				sk8_wood_feet_land_01
				sk8_wood_feet_land_02
			]
			minvol = 70
			maxvol = 90
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		scuff = {
			sound = [
				sk8_wood_feet_scuff_02
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = FootJumpsLandsScuffs
			pedbuss = PedFootJumpsLandsScuffs
		}
		boneless = {
			sound = [
				sk8_wood_Boneless_03
			]
			minvol = 80
			maxvol = 90
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = boneless
			pedbuss = PedBoneless
		}
		boardpickup = {
			sound = [
				sk8_wood_pickup_02
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPickupPutdown
			pedbuss = PedBoardPickupPutdown
		}
		boardputdown = {
			sound = [
				sk8_wood_putdown_03
			]
			minvol = 95
			maxvol = 105
			minpitch = 95
			maxpitch = 105
			dropoff = $terrainsound_defaultdropoff
			dropoff_function = linear
			skaterbuss = BoardPickupPutdown
			pedbuss = PedBoardPickupPutdown
		}
	}
}
