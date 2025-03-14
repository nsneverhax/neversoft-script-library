
script BoardFlyInWaiting 
	Obj_GetAnimSpeed
	if flipped
		BoardRightVol = -12
		begin
		if issoundplaying SkaterBoardFlyInSound01
			setsoundparams SkaterBoardFlyInSound01 voll = 60 volr = <BoardRightVol> pitch = (100 * <speed>)
		endif
		BoardRightVol = (<BoardRightVol> + 2.057)
		Obj_GetAnimSpeed
		wait 1 gameframe
		repeat 35
	else
		BoardLeftVol = -12
		begin
		if issoundplaying SkaterBoardFlyInSound02
			setsoundparams SkaterBoardFlyInSound02 volr = 60 voll = <BoardLeftVol> pitch = (100 * <speed>)
		endif
		BoardLeftVol = (<BoardLeftVol> + 2.057)
		Obj_GetAnimSpeed
		wait 1 gameframe
		repeat 35
	endif
endscript
CatchBoardSound_struct = {
	default_priority = 50
	default_buss = `default`
	norepeatfor = 0.1
	instancemanagement = stop_furthest
	instancelimit = 1
}

script CatchBoardSound 
	obj_playsound SK6_BoardGrab01 vol = RandomRange (60.0, 80.0) pitch = RandomRange (90.0, 115.0)
endscript

script BoardDropSoundEffect 
	spawnterrainsound \{action = boardbounce}
endscript

script KickBoardSound 
	obj_playsound SK6_BoardGrab01 vol = RandomRange (60.0, 80.0) pitch = RandomRange (90.0, 115.0)
	RandomNoRepeat (
		@ obj_playsound sk9_BailBodyPunch01 pitch = RandomRange (80.0, 102.0) vol = RandomRange (50.0, 60.0)
		@ obj_playsound sk9_BailBodyPunch02 pitch = RandomRange (80.0, 102.0) vol = RandomRange (50.0, 60.0)
		@ obj_playsound sk9_BailBodyPunch03 pitch = RandomRange (80.0, 102.0) vol = RandomRange (50.0, 60.0)
		@ obj_playsound sk9_BailBodyPunch04 pitch = RandomRange (80.0, 102.0) vol = RandomRange (50.0, 60.0)
		)
	obj_playsound SK6_BoardSplit01 pitch = 180 vol = 15
endscript

script BoardScrapeWaiting 
	Obj_GetAnimSpeed
	if NOT flipped
		playsound SK6_BoardScrapeLong02_11 voll = 75 volr = -15 pitch = (120 * <speed>) id = SkaterBoardScrapeIn01
		BoardRightVol = -15
		begin
		if issoundplaying SkaterBoardScrapeIn01
			setsoundparams SkaterBoardScrapeIn01 voll = 75 volr = <BoardRightVol> pitch = (120 * <speed>)
		endif
		BoardRightVol = (<BoardRightVol> + 2.5709999)
		Obj_GetAnimSpeed
		wait 1 gameframe
		repeat 35
	else
		playsound SK6_BoardScrapeLong02_11 volr = 75 voll = -15 pitch = (120 * <speed>) id = SkaterBoardScrapeIn02
		BoardLeftVol = -15
		begin
		if issoundplaying SkaterBoardScrapeIn02
			setsoundparams SkaterBoardScrapeIn02 volr = 75 voll = <BoardLeftVol> pitch = (120 * <speed>)
		endif
		BoardLeftVol = (<BoardLeftVol> + 2.5709999)
		Obj_GetAnimSpeed
		wait 1 gameframe
		repeat 35
	endif
endscript

script BoardRollingInWaiting 
	Obj_GetAnimSpeed
	if flipped
		BoardRightVol = -15
		begin
		if issoundplaying SkaterBoardRollIn
			setsoundparams SkaterBoardRollIn voll = 75 volr = <BoardRightVol> pitch = (80 * <speed>)
		endif
		BoardRightVol = (<BoardRightVol> + 2.5709999)
		Obj_GetAnimSpeed
		wait 1 gameframe
		repeat 35
	else
		BoardLeftVol = -15
		begin
		if issoundplaying SkaterBoardRollIn02
			setsoundparams SkaterBoardRollIn02 volr = 75 voll = <BoardLeftVol> pitch = (80 * <speed>)
		endif
		BoardLeftVol = (<BoardLeftVol> + 2.5709999)
		Obj_GetAnimSpeed
		wait 1 gameframe
		repeat 35
	endif
endscript

script BoardSplittingSound 
	obj_playsound \{SK6_BoardSplit01
		vol = 220}
	wait \{0.05
		seconds}
	RandomNoRepeat (
		@ obj_playsound sk9_BailBodyPunch01 pitch = RandomRange (80.0, 102.0) vol = RandomRange (70.0, 80.0)
		@ obj_playsound sk9_BailBodyPunch02 pitch = RandomRange (80.0, 102.0) vol = RandomRange (70.0, 80.0)
		@ obj_playsound sk9_BailBodyPunch03 pitch = RandomRange (80.0, 102.0) vol = RandomRange (70.0, 80.0)
		@ obj_playsound sk9_BailBodyPunch04 pitch = RandomRange (80.0, 102.0) vol = RandomRange (70.0, 80.0)
		)
endscript

script TerrainSoundPutDownBoard 
	spawnterrainsound \{action = boardputdown}
endscript

script TerrainSoundPickUpBoard 
	spawnterrainsound \{action = boardpickup}
endscript

script TerrainSoundTurnOnSkaterLoopingSound 
	if skating
		spawnterrainsound \{action = roll}
	endif
endscript

script TerrainSoundTurnOffSkaterLoopingSound 
	onexitrun \{TerrainSoundTurnOffSkaterLoopingSound_exit}
	spawnterrainsound \{action = stopsounds}
endscript

script TerrainSoundTurnOffSkaterLoopingSound_exit 
	spawnterrainsound \{action = roll}
endscript

script TerrainSoundTurnOnSkaterRollingSound 
	if skating
		spawnterrainsound \{action = roll}
	endif
endscript

script TerrainSoundTurnOnSkaterGrindingSound 
	if skating
		spawnterrainsound \{action = Grind}
	endif
endscript

script TerrainSoundRevert 
	spawnterrainsound \{action = revert}
endscript

script TerrainSoundBoneless 
	spawnterrainsound \{action = boneless}
endscript

script TerrainSoundWallPlant 
	spawnterrainsound \{action = Wallplant}
endscript

script TerrainSoundBonk 
	spawnterrainsound \{action = bonk}
endscript

script TerrainSoundStop 
	spawnterrainsound \{action = stopsounds}
endscript

script TerrainSoundRoll 
	spawnterrainsound \{action = roll}
endscript

script TerrainSoundOllie 
	spawnterrainsound \{action = ollie}
endscript

script TerrainSoundOllieLand 
	spawnterrainsound \{action = ollieland}
endscript

script TerrainSoundGrindOn 
	spawnterrainsound \{action = grindon}
endscript

script TerrainSoundSlideOn 
	spawnterrainsound \{action = slideon}
endscript

script TerrainSoundSlideFall 
	spawnterrainsound \{action = slidefall}
endscript

script TerrainSoundBoardBounce 
	Bouncy_Skateboard_Bounce \{velocity = 3}
endscript

script TerrainSoundStepRunPlusParticle 
	spawnterrainsound \{action = footstep}
	SkaterParticles_CreateStepFX
endscript
TerrainSoundFootstepWalk_struct = {
	norepeatfor = 0
	instancelimit = 10
}

script TerrainSoundFootstepWalk 
	spawnterrainsound \{action = footstep}
endscript

script TerrainSoundFootstepScuff 
	spawnterrainsound \{action = scuff}
endscript

script TerrainSoundJump 
	spawnterrainsound \{action = footstepjump}
endscript

script TerrainSoundJumpLand 
	spawnterrainsound \{action = footstepland}
endscript

script TerrainSoundFootstepLand 
	spawnterrainsound \{action = footstepland}
endscript

script TerrainSoundBodyFall 
	spawnterrainsound \{action = bodyfall}
endscript

script TerrainSoundLegFall 
	spawnterrainsound \{action = legfall}
endscript

script TerrainSoundArmFall 
	spawnterrainsound \{action = armfall}
endscript

script TerrainSoundHeadFall 
	spawnterrainsound \{action = headfall}
endscript

script TerrainSoundFootPush 
	spawnterrainsound \{action = footpush}
endscript

script TerrainSoundTak 
	spawnterrainsound \{action = footpush}
endscript

script TerrainSoundPogo 
	spawnterrainsound \{action = pogo}
endscript

script TerrainSoundStepLandPlusParticle 
	spawnterrainsound \{action = footstepland}
	SkaterParticles_CreateStepFX
endscript

script TerrainSoundHandplant 
	spawnterrainsound \{action = handplant}
endscript

script AgroKick_BreathInhaleSFX 
	soundevent \{event = sk9_AgroKick_BreathInhale}
endscript
AnimHandclaps_struct = {
	default_priority = 50
	default_buss = PedClaps
	norepeatfor = 0.0
	instancemanagement = stop_furthest
	instancelimit = 8
}

script AnimHandclaps 
	soundevent \{event = sk8_handclaps}
endscript

script HeadHitTableSFX 
	obj_playsound \{sk8_wood_land_03
		vol = 60
		pitch = 120}
endscript

script GolfSwing_sfx 
	soundevent \{event = sk8_dadhouses_golfball_hit}
endscript

script FootStepMetalLadder 
	RandomNoRepeat (
		@ obj_playsound Metal_Ladder_Footstep_03 pitch = RandomRange (95.0, 105.0) vol = RandomRange (60.0, 80.0)
		@ obj_playsound Metal_Ladder_Footstep_09 pitch = RandomRange (95.0, 105.0) vol = RandomRange (60.0, 80.0)
		@ obj_playsound Metal_Ladder_Footstep_13 pitch = RandomRange (95.0, 105.0) vol = RandomRange (60.0, 80.0)
		@ obj_playsound Metal_Ladder_Footstep_16 pitch = RandomRange (95.0, 105.0) vol = RandomRange (60.0, 80.0)
		)
endscript

script HandStepMetalLadder 
	RandomNoRepeat (
		@ obj_playsound Metal_Ladder_Handstep_05 pitch = RandomRange (95.0, 105.0) vol = RandomRange (20.0, 30.0)
		@ obj_playsound Metal_Ladder_Handstep_06 pitch = RandomRange (95.0, 105.0) vol = RandomRange (20.0, 30.0)
		)
endscript

script handplant_sfx 
	RandomNoRepeat (
		@ obj_playsound \{SK8_Asphalt_Footstep_01
			vol = 80
			pitch = 200}
		@ obj_playsound \{SK8_Asphalt_Footstep_02
			vol = 80
			pitch = 200}
		@ obj_playsound \{SK8_Asphalt_Footstep_03
			vol = 80
			pitch = 200}
		)
endscript

script VaultRollSound 
endscript

script whooshsound 
	obj_playsound whoosh pitch = RandomRange (150.0, 170.0) vol = RandomRange (20.0, 40.0)
endscript

script FastWhooshSound 
	obj_playsound whoosh pitch = RandomRange (150.0, 200.0) vol = RandomRange (30.0, 50.0)
endscript

script GenericBailBodyFallSound 
	RandomNoRepeat (
		@ obj_playsound BailBodyFall01 pitch = RandomRange (95.0, 105.0) vol = RandomRange (90.0, 100.0)
		@ obj_playsound BailBodyFall02 pitch = RandomRange (95.0, 105.0) vol = RandomRange (90.0, 100.0)
		@ obj_playsound BailBodyFall03 pitch = RandomRange (95.0, 105.0) vol = RandomRange (90.0, 100.0)
		@ obj_playsound BailBodyFall04 pitch = RandomRange (95.0, 105.0) vol = RandomRange (90.0, 100.0)
		@ obj_playsound BailBodyFall05 pitch = RandomRange (95.0, 105.0) vol = RandomRange (90.0, 100.0)
		)
endscript

script GenericBailBodyPunchSound 
	RandomNoRepeat (
		@ obj_playsound sk9_BailBodyPunch01 pitch = RandomRange (80.0, 102.0) vol = RandomRange (100.0, 120.0)
		@ obj_playsound sk9_BailBodyPunch02 pitch = RandomRange (80.0, 102.0) vol = RandomRange (100.0, 120.0)
		@ obj_playsound sk9_BailBodyPunch03 pitch = RandomRange (80.0, 102.0) vol = RandomRange (100.0, 120.0)
		@ obj_playsound sk9_BailBodyPunch04 pitch = RandomRange (80.0, 102.0) vol = RandomRange (100.0, 120.0)
		)
endscript

script BailCrackingSound 
	obj_playsound BailCrack01 pitch = RandomRange (100.0, 110.0) vol = RandomRange (120.0, 130.0)
endscript

script BailSlapSoundEffect 
	obj_playsound sk9_BailSlap03 pitch = RandomRange (140.0, 170.0) vol = RandomRange (50.0, 65.0)
endscript

script GenericBailBoardSoundEffect 
endscript

script Shrek_Burp_SFX 
	obj_stopstream \{ShrekBurpStream}
endscript

script FartBurst_SFX 
endscript
