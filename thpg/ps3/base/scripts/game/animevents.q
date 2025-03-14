
script GetAnimEventTableName 
	animeventtablename = PedAnimEventTable
	return animeventtablename = <animeventtablename>
endscript
skateranimeventtable = {
	sk8_w_base_F
	Sk8_Ollie_Ollie_Base_F
	Sk8_W_SkToStndApx_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
		{
			time = 0.23
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPickUpBoard
			}
		}
	]
	Sk8_W_SkToStndLnd_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
		{
			time = 0.25
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPickUpBoard
			}
		}
	]
	Sk8_W_SkToStndTO_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
		{
			time = 0.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPickUpBoard
			}
		}
	]
	Sk8_W_SkToStndIdle_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
		{
			time = 1.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.65
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPickUpBoard
			}
		}
	]
	sk8_w_sk8tostnd_stopped_f = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPickUpBoard
			}
		}
		{
			time = 1.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 2.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
	]
	Sk8_W_SkToStndWlk_xFst_Fx = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
		{
			time = 0.22
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.34
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.36
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPickUpBoard
			}
		}
		{
			time = 0.52
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
	]
	Sk8_W_SkToStndWlk_xMed_Fx = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
		{
			time = 0.22
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.36
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.39000002
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPickUpBoard
			}
		}
		{
			time = 0.53
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
	]
	Sk8_W_SkToStndWlk_xSlw_Fx = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
		{
			time = 0.23
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.38000003
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPickUpBoard
			}
		}
		{
			time = 0.53
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
	]
	Sk8_W_StndToSk8_Stopped_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundRoll
			}
		}
		{
			time = 0.75
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.95
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPutDownBoard
			}
		}
		{
			time = 1.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	Sk8_Gnd_Oll_S_RunToSkate_Flat_D = [
		{
			time = 0.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundRoll
			}
		}
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.53
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	Sk8_Gnd_Oll_S_WalkToSkate_Flat_D = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundRoll
			}
		}
		{
			time = 0.35000002
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPutDownBoard
			}
		}
		{
			time = 0.64000005
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	Sk8_W_Wlk_xSlw_Fx = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.0
			event = FootstepParticlesL
		}
		{
			time = 0.44
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.44
			event = FootstepParticlesR
		}
	]
	Sk8_WlkStop_RF_xSlw_Fx = [
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.1
			event = FootstepParticlesL
		}
		{
			time = 0.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.6
			event = FootstepParticlesR
		}
	]
	Sk8_WlkStop_LF_xSlw_Fx = [
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.1
			event = FootstepParticlesL
		}
		{
			time = 0.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.6
			event = FootstepParticlesR
		}
	]
	Sk8_W_JumpInto_RF_xSlw_Fx = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundJump
			}
		}
	]
	Sk8_W_JumpInto_LF_xSlw_Fx = [
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundJump
			}
		}
	]
	Sk8_W_JumpInto_RF_xMed_Fx
	[
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundJump
			}
		}
	]
	Sk8_W_JumpInto_LF_xMed_Fx
	[
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundJump
			}
		}
	]
	Sk8_W_JumpInto_RF_xFst_Fx = [
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundJump
			}
		}
	]
	Sk8_W_JumpInto_LF_xFst_Fx = [
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundJump
			}
		}
	]
	sk8_w_landvaultroll_F = [
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBodyFall
			}
		}
		{
			time = 0.01
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	sk8_w_jumpidleland_D = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepLand
			}
		}
		{
			time = 0.0
			event = JumpLandParticles
		}
	]
	Sk8_W_BigJumpLandToStndIdle_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepLand
			}
		}
		{
			time = 0.0
			event = JumpLandParticles
		}
	]
	Sk8_W_JumpIdleInto_F = [
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundJump
			}
		}
	]
	Sk8_W_JumpLand_xSlw_Fx = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepLand
			}
		}
		{
			time = 0.0
			event = JumpLandParticles
		}
		{
			time = 0.55
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	Sk8_W_JumpLand_xMed_Fx = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepLand
			}
		}
		{
			time = 0.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	Sk8_W_JumpLand_xFst_Fx = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepLand
			}
		}
		{
			time = 0.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.55
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	sk8_w_vault_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.18
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	SK8_Gup_Fetal_xLx = [
		{
			time = 0.18
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 1.13
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.53
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	SK8_Gup_Fetal_xRx = [
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 1.13
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.53
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	SK8_Gup_Sprawled_xBkx = [
		{
			time = 0.18
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 1.43
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.8499999
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	SK8_Gup_Sprawled_xFwx = [
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.95
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.3499999
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	SK8_Gup_GetOnBoard1_F = [
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundRoll
			}
		}
	]
	PedM_Walk01_F = [
		{
			time = 0.2
			event = AnimSoundEvent
			params = {
				event = FootStepMetalLadder
			}
		}
	]
	Sk8_Gnd_Oll_F_Kick_Flat_D = [
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootPush
			}
		}
		{
			time = 0.1
			event = KickBoostEvent
			params = {
			}
		}
		{
			time = 0.2
			event = AnimSoundEvent
			params = {
				event = Aggro_Kick_Bad_SFX
			}
		}
	]
	Sk8_Gnd_Oll_S_Kick_Flat_D = [
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootPush
			}
		}
		{
			time = 0.1
			event = KickBoostEvent
			params = {
			}
		}
		{
			time = 0.2
			event = AnimSoundEvent
			params = {
				event = Aggro_Kick_Bad_SFX
			}
		}
	]
	Sk8_Gnd_Oll_S_KickIn_Flat_D = [
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = Aggro_Kick_Bad_SFX
			}
		}
		{
			time = 0.1
			event = Aggro_Kick_Rumble_Strong_event
		}
	]
	Sk8_Gnd_Oll_F_KickIn_Flat_D = [
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = Aggro_Kick_Bad_SFX
			}
		}
		{
			time = 0.1
			event = Aggro_Kick_Rumble_Strong_event
		}
	]
	Sk8_Gnd_Oll_S_KickRe_Flat_D = [
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = Aggro_Kick_Bad_SFX
			}
		}
		{
			time = 0.4
			event = Aggro_Kick_Rumble_Weak_event
		}
	]
	Sk8_Gnd_Oll_F_KickRe_Flat_D = [
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = Aggro_Kick_Bad_SFX
			}
		}
		{
			time = 0.4
			event = Aggro_Kick_Rumble_Weak_event
		}
	]
	SK8_Bail_Manual_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
	]
	SK8_Bail_NoseManual_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
	]
	SK8_Bail_Rail_5050_L_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
	]
	SK8_Bail_Rail_5050_R_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
	]
	SK8_Bail_Rail_BSBS_L_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
	]
	SK8_Bail_Rail_BSBS_R_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
	]
	SK8_Bail_Rail_FSBS_L_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
	]
	SK8_Bail_Rail_FSBS_R_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
	]
	SK8_Bail_Spin_Bck_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
	]
	SK8_Bail_Spin_CCW_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
	]
	SK8_Bail_Spin_CW_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
	]
	SK8_Bail_Spin_Bck_Canned_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBodyFall
			}
		}
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundSlideFall
			}
		}
		{
			time = 1.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundLegFall
			}
		}
	]
	SK8_Bail_Spin_Fwd_Canned_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
		{
			time = 0.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBodyFall
			}
		}
		{
			time = 0.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundSlideFall
			}
		}
		{
			time = 1.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundLegFall
			}
		}
	]
	SK8_Bail_Spin_CCW_Canned_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.65000004
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBodyFall
			}
		}
		{
			time = 0.65000004
			event = AnimSoundEvent
			params = {
				event = TerrainSoundSlideFall
			}
		}
	]
	SK8_Bail_Spin_CW_Canned_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBodyFall
			}
		}
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundSlideFall
			}
		}
		{
			time = 1.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundLegFall
			}
		}
	]
	SK8_Bail_Spin_Bck_KneeSlide_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
		{
			time = 0.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBodyFall
			}
		}
		{
			time = 0.25
			event = AnimSoundEvent
			params = {
				event = TerrainSoundSlideFall
			}
		}
		{
			time = 1.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepLand
			}
		}
		{
			time = 1.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
	]
	SK8_Bail_Spin_Fwd_KneeSlide_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
		{
			time = 0.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBodyFall
			}
		}
		{
			time = 0.25
			event = AnimSoundEvent
			params = {
				event = TerrainSoundSlideFall
			}
		}
		{
			time = 1.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepLand
			}
		}
		{
			time = 1.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
	]
	SK8_Bail_Spin_CCW_KneeSlide_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
		{
			time = 0.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBodyFall
			}
		}
		{
			time = 0.25
			event = AnimSoundEvent
			params = {
				event = TerrainSoundSlideFall
			}
		}
		{
			time = 2.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepLand
			}
		}
		{
			time = 2.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
	]
	SK8_Bail_Spin_Bck_Runout_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.15
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
				object = skater
			}
		}
		{
			time = 1.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoardBounce
				object = skater
			}
		}
	]
	SK8_Bail_Spin_CCW_Runout_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	SK8_Bail_Spin_CW_Runout_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
				object = skater
			}
		}
		{
			time = 0.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
				object = skater
			}
		}
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
				object = skater
			}
		}
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
				object = skater
			}
		}
		{
			time = 0.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoardBounce
				object = skater
			}
		}
		{
			time = 0.85
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
				object = skater
			}
		}
	]
	SK8_Bail_Spin_Fwd_Runout_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
				object = skater
			}
		}
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
				object = skater
			}
		}
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
				object = skater
			}
		}
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoardBounce
				object = skater
			}
		}
		{
			time = 0.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
				object = skater
			}
		}
	]
	SK8_Bail_Spin_Bck_Rollout_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBodyFall
			}
		}
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	SK8_Bail_Spin_CCW_Rollout_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBodyFall
			}
		}
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	SK8_Bail_Spin_Fwd_Rollout_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBodyFall
			}
		}
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	SK8_Bail_Spin_CW_Rollout_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBodyFall
			}
		}
		{
			time = 0.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepLand
			}
		}
		{
			time = 0.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
	]
	Sk8_W_Climb_Up_From_Stand_F = [
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
		{
			time = 1.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
	]
	Sk8_W_Climb_Down_To_Stand_F = [
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
		{
			time = 1.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
	]
	Sk8_W_Climb_Up_To_Stand_F = [
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
		{
			time = 1.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
	]
	Sk8_W_Climb_Move_vert_dummy_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
	]
	Sk8_W_Climb_Move_hor_dummy_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
	]
	Sk8_W_Climb_Move_Idle_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
	]
	Sk8_W_Climb_Move_U_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
	]
	Sk8_W_Climb_Move_D_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
	]
	Sk8_W_Climb_Move_L_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
	]
	Sk8_W_Climb_Move_R_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
	]
	Sk8_W_Climb_Move_UL_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
	]
	Sk8_W_Climb_Move_UR_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
	]
	Sk8_W_Climb_Move_DL_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
	]
	Sk8_W_Climb_Move_DR_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
	]
	Sk8_W_Hang_IdleToTop_F = [
		{
			time = 0.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 1.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
		{
			time = 2.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 2.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 3.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	Sk8_W_WallGrb_StndToIdle_F = [
		{
			time = 0.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 1.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
		{
			time = 2.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 2.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
	]
	Sk8_W_WallGrb_IdleToTop_F = [
		{
			time = 0.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 1.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
		{
			time = 2.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 2.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 3.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	sk8_w_hang_left_F = [
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
		{
			time = 1.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
	]
	sk8_w_hang_right_F = [
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
		{
			time = 1.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
	]
	sk8_w_wallgrb_left_F = [
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
		{
			time = 0.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
	]
	sk8_w_wallgrb_right_F = [
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
		{
			time = 0.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
	]
	sk8_w_wallgrb_climbup_F = [
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
		{
			time = 0.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
	]
	sk8_w_wallgrb_climbdwn_F = [
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
		{
			time = 0.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
	]
	sk8_w_wallgrb_climbright_F = [
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
		{
			time = 0.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
	]
	sk8_w_wallgrb_climbleft_F = [
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
		{
			time = 0.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
	]
	Sk8_W_Pole_ClimbOn_F = [
		{
			time = 0.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
		{
			time = 1.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
	]
	Sk8_W_LadClimbToStndIdle_F = [
		{
			time = 0.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	Sk8_W_Pole_Grabfromair_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
	]
	sk8_w_pole_climbup_f = [
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
		{
			time = 0.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 1.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
	]
	sk8_w_pole_climbdwn_f = [
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
		{
			time = 1.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
	]
	sk8_w_pole_climbslideidle_f = [
		{
			time = 0.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
		{
			time = 0.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
		{
			time = 0.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
		{
			time = 1.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
		{
			time = 1.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
	]
	Sk8_W_Pole_ClimbOff_F = [
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
	]
	sk8_w_pole_climbleft_f = [
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
		{
			time = 0.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
	]
	sk8_w_pole_climbright_f = [
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
		{
			time = 0.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundHandplant
			}
		}
	]
	runjumpland = [
		{
			time = 0.0
			event = JumpLandParticles
		}
		{
			time = 0.02
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStepRunPlusParticle
			}
		}
		{
			time = 0.35000002
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStepRunPlusParticle
			}
		}
		{
			time = 0.66
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStepRunPlusParticle
			}
		}
	]
	bigjumplandtostand = [
		{
			time = 0.0
			event = JumpLandParticles
		}
		{
			time = 0.06
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStepLandPlusParticle
			}
		}
		{
			time = 1.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
	]
	Bigjumplandtowalk = [
		{
			time = 0.0
			event = JumpLandParticles
		}
		{
			time = 0.120000005
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStepLandPlusParticle
			}
		}
	]
	bigjumplandtorun = [
		{
			time = 0.0
			event = JumpLandParticles
		}
		{
			time = 0.06
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStepLandPlusParticle
			}
		}
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStepRunPlusParticle
			}
		}
	]
	hangontothetop = [
		{
			time = 1.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 2.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
	]
	ladderclimb = [
		{
			time = 0.2
			event = AnimSoundEvent
			params = {
				event = FootStepMetalLadder
			}
		}
		{
			time = 0.35000002
			event = AnimSoundEvent
			params = {
				event = HandStepMetalLadder
			}
		}
		{
			time = 0.6
			event = AnimSoundEvent
			params = {
				event = FootStepMetalLadder
			}
		}
	]
	Sk8_W_LadFastClimb_F = [
		{
			time = 0.03
			event = AnimSoundEvent
			params = {
				event = FootStepMetalLadder
			}
		}
		{
			time = 0.65000004
			event = AnimSoundEvent
			params = {
				event = FootStepMetalLadder
			}
		}
		{
			time = 1.05
			event = AnimSoundEvent
			params = {
				event = HandStepMetalLadder
			}
		}
	]
	sk8_w_ladstndidletoclimb_F = [
		{
			time = 0.02
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	Sk8_W_LadClimbToStndIdle_F = [
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
	]
	newbraketurnleft = [
		{
			time = 0.01
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
	]
	newbraketurnright = [
		{
			time = 0.01
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
	]
	_180runskid = [
		{
			time = 0.02
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStepRunPlusParticle
			}
		}
		{
			time = 0.35000002
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.85
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	skatetostand = [
		{
			time = 0.02
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPickUpBoard
			}
		}
		{
			time = 0.42000002
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStepRunPlusParticle
			}
		}
		{
			time = 0.75
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStepRunPlusParticle
			}
		}
		{
			time = 1.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
	]
	skatetowalk = [
		{
			time = 0.02
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPickUpBoard
			}
		}
		{
			time = 0.42000002
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStepRunPlusParticle
			}
		}
		{
			time = 0.75
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	skatetoskid = [
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStepRunPlusParticle
			}
		}
		{
			time = 0.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStepRunPlusParticle
			}
		}
		{
			time = 1.4499999
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	braketostand = [
		{
			time = 0.45000002
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPickUpBoard
			}
		}
		{
			time = 0.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 1.23
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
	]
	walkslow = [
		{
			time = 0.35000002
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.35000002
			event = FootstepParticlesL
		}
		{
			time = 0.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.9
			event = FootstepParticlesR
		}
	]
	WallPlant_Ollie3 = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundWallPlant
			}
		}
		{
			time = 0.17
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStepRunPlusParticle
			}
		}
	]
	Sk8_W_JumpAirTo5050_F = [
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPutDownBoard
			}
		}
		{
			time = 0.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 0.2
			event = TerrainLandParticles
		}
		{
			time = 0.22
			event = AnimSoundEvent
			params = {
				event = TerrainSoundTurnOnSkaterGrindingSound
			}
		}
	]
	jumpairtomanual = [
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPutDownBoard
			}
		}
		{
			time = 0.55
			event = AnimSoundEvent
			params = {
				event = TerrainSoundTurnOnSkaterRollingSound
			}
		}
	]
	jumpairtonosemanual = [
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPutDownBoard
			}
		}
		{
			time = 0.55
			event = AnimSoundEvent
			params = {
				event = TerrainSoundTurnOnSkaterRollingSound
			}
		}
	]
	Vault_Roll = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = VaultRollSound
			}
		}
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStepLandPlusParticle
			}
		}
		{
			time = 1.42
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.76
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	Wallplant_Standing = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBonk
			}
		}
	]
	Walking_Wallgrab_Shimmy_Left = [
		{
			time = 0.35000002
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.66
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	Walking_Wallgrab_Shimmy_Right = [
		{
			time = 0.35000002
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.66
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	Walking_Wallgrab_FromStand = [
		{
			time = 0.66
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.68
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.13
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.25
			event = AnimSoundEvent
			params = {
				event = CatchBoardSound
			}
		}
	]
	Walking_Wallgrab_JumpBack = [
		{
			time = 0.83
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
	]
	W_Boardswitch_Standing = [
		{
			time = 0.28
			event = AnimSoundEvent
			params = {
				event = FastWhooshSound
			}
		}
		{
			time = 0.52
			event = AnimSoundEvent
			params = {
				event = CatchBoardSound
			}
		}
	]
	W_Boardswitch_Running = [
		{
			time = 0.28
			event = AnimSoundEvent
			params = {
				event = FastWhooshSound
			}
		}
		{
			time = 0.28
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStepRunPlusParticle
			}
		}
		{
			time = 0.28
			event = FootstepParticlesL
		}
		{
			time = 0.52
			event = AnimSoundEvent
			params = {
				event = CatchBoardSound
			}
		}
		{
			time = 0.52
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStepRunPlusParticle
			}
		}
		{
			time = 0.52
			event = FootstepParticlesL
		}
	]
	runoutquick = [
		{
			time = 0.01
			event = AnimSoundEvent
			params = {
				event = GenericBailBoardSoundEffect
			}
		}
		{
			time = 0.35000002
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStepRunPlusParticle
			}
		}
		{
			time = 0.45000002
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStepRunPlusParticle
			}
		}
		{
			time = 0.45000002
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 1.15
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 2.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	bail_falling_bck = [
		{
			time = 0.01
			event = AnimSoundEvent
			params = {
				event = GenericBailBoardSoundEffect
			}
		}
	]
	bail_falling_fwd = [
		{
			time = 0.01
			event = AnimSoundEvent
			params = {
				event = GenericBailBoardSoundEffect
			}
		}
	]
	getup_hk_RT_t = [
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = CatchBoardSound
			}
		}
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStepRunPlusParticle
			}
		}
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.71999997
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStepRunPlusParticle
			}
		}
	]
	getup_hk_RT_Q = [
		{
			time = 0.02
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.52
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.52
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 1.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStepRunPlusParticle
			}
		}
	]
	getup_hk_Rt = [
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.72999996
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	getup_s_turn180 = [
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = CatchBoardSound
			}
		}
		{
			time = 0.45000002
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.33
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 1.25
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStepRunPlusParticle
			}
		}
		{
			time = 1.55
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStepRunPlusParticle
			}
		}
	]
	getup_s_nopushoff = [
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.33
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
	]
	walkingslap = [
		{
			time = 0.28
			event = AnimSoundEvent
			params = {
				event = BailSlapSoundEffect
			}
		}
		{
			time = 0.57
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStepRunPlusParticle
			}
		}
		{
			time = 0.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	walkingbail = [
		{
			time = 0.01
			event = AnimSoundEvent
			params = {
				event = BailSlapSoundEffect
			}
		}
		{
			time = 0.45000002
			event = AnimSoundEvent
			params = {
				event = GenericBailBoardSoundEffect
			}
		}
		{
			time = 0.6
			event = AnimSoundEvent
			params = {
				event = GenericBailBodyFallSound
			}
		}
	]
	walkingbailgetup = [
		{
			time = 0.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 1.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 1.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	sk8_manu_cfpogo_slow_D = [
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
		{
			time = 0.95
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
		{
			time = 1.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
		{
			time = 1.8499999
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
		{
			time = 2.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
		{
			time = 2.75
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
		{
			time = 3.1499999
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
		{
			time = 3.45
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
	]
	sk8_manu_pogo_slow_D = [
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
		{
			time = 0.95
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
		{
			time = 1.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
		{
			time = 1.8499999
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
		{
			time = 2.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
		{
			time = 2.75
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
		{
			time = 3.1499999
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
		{
			time = 3.55
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
	]
	sk8_manu_sfpogo_slow_D = [
		{
			time = 0.05
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
		{
			time = 0.75
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
		{
			time = 1.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
		{
			time = 1.4499999
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
		{
			time = 1.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
	]
	sk8_manu_spacew_slow_D = [
		{
			time = 0.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundTak
			}
		}
		{
			time = 1.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundTak
			}
		}
		{
			time = 2.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundTak
			}
		}
		{
			time = 0.2
			event = SpaceWalkBoostEvent
		}
		{
			time = 1.4
			event = SpaceWalkBoostEvent
		}
		{
			time = 2.4
			event = SpaceWalkBoostEvent
		}
	]
	Sk8_Manu_Exit_Manual_1_D = [
		{
			time = 0.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoneless
			}
		}
	]
	Sk8_Manu_Exit_Manual_P_D = [
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundRevert
			}
		}
	]
	Sk8_Manu_Exit_manu_360fgflp_D = [
		{
			time = 0.95
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoneless
			}
		}
	]
	Sk8_Manu_Exit_Manu_WP_D = [
		{
			time = 0.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundWallPlant
			}
		}
	]
	Sk8_Manu_Exit_Manual_3_D = [
		{
			time = 0.65000004
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoneless
			}
		}
	]
	Sk8_Manu_Exit_manual_6_D = [
		{
			time = 0.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoneless
			}
		}
	]
	Sk8_Manu_Exit_manual_7_D = [
		{
			time = 0.25
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoneless
			}
		}
	]
	Sk8_Manu_Exit_NSmanu_1_D = [
		{
			time = 0.25
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoneless
			}
		}
	]
	Sk8_Manu_Exit_NSmanu_9_D = [
		{
			time = 0.75
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoneless
			}
		}
	]
	Sk8_Manu_Exit_NSmanu_P_D = [
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundRevert
			}
		}
	]
	Sk8_Manu_Exit_NSmanu_A_D = [
		{
			time = 0.35000002
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoneless
			}
		}
	]
	Sk8_Manu_Exit_Nose_WP_D = [
		{
			time = 0.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundWallPlant
			}
		}
	]
	Sk8_Manu_Exit_AntiCa_1_D = [
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoneless
			}
		}
	]
	Sk8_Manu_Exit_AntiCa_8_D = [
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoneless
			}
		}
		{
			time = 0.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	Sk8_Manu_Exit_Casper_1_D = [
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoneless
			}
		}
	]
	Sk8_Manu_Exit_CFPogo_1_D = [
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoneless
			}
		}
	]
	Sk8_Manu_Exit_OFNMnu_1_D = [
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoneless
			}
		}
	]
	Sk8_Manu_Exit_Pogo_1_D = [
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoneless
			}
		}
	]
	Sk8_Manu_Exit_Pogo_4_D = [
		{
			time = 0.65000004
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoneless
			}
		}
	]
	Sk8_Manu_Exit_Pogo_12_D
	Sk8_Manu_Exit_Primo_1_D = [
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoneless
			}
		}
	]
	Sk8_Manu_Exit_Primo_10_D
	Sk8_Manu_Exit_SFPogo_1_D = [
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoneless
			}
		}
	]
	Sk8_Manu_Exit_SFPogo_5_D
	Sk8_Manu_Exit_SFPogo_11_D
	Sk8_Manu_Exit_TrckSd_1_D = [
		{
			time = 0.25
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoneless
			}
		}
	]
	Sk8_Manu_Rodney_Slow_D = [
		{
			time = 0.07
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
		{
			time = 0.25
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
		{
			time = 0.75
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
	]
	Sk8_Manu_MikeV_LndO_D = [
		{
			time = 0.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundSlideOn
			}
		}
	]
	Sk8_Manu_MikeV_Slow_D = [
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepLand
			}
		}
		{
			time = 0.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepLand
			}
		}
		{
			time = 1.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
	]
	Sk8_Manu_Exit_Special_Manual_2_D = [
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
	]
	sk8_grab_ghero_init_to_D = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepLand
			}
		}
		{
			time = 0.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepLand
			}
		}
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepLand
			}
		}
		{
			time = 0.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepLand
			}
		}
		{
			time = 1.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepLand
			}
		}
	]
	Sk8_Manu_Manual_Base_F
	Sk8_Manu_NSManu_Base_F
	sk8_manu_antica_base_F
	sk8_manu_cfpogo_base_F
	sk8_manu_casper_base_F
	sk8_manu_ofmanu_base_F
	sk8_manu_primo_base_F
	sk8_manu_sfpogo_base_F
	sk8_manu_pogo_base_F
	sk8_manu_trcksd_base_F
	Sk8_Manu_Rodney_Base_F
	Sk8_Manu_MikeV_Base_F
	Sk8_Manu_AntiCa_to_AntiCa_D = [
		{
			time = 0.15
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 0.65000004
			event = AnimSoundEvent
			params = {
				event = TerrainSoundSlideOn
			}
		}
	]
	Sk8_Manu_Casper_to_Casper_D = [
		{
			time = 0.15
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 0.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundSlideOn
			}
		}
	]
	Sk8_Manu_CFpogo_to_CFpogo_D = [
		{
			time = 0.55
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 1.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundSlideOn
			}
		}
	]
	Sk8_Manu_Rail_to_Rail_D = [
		{
			time = 0.85
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 1.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundSlideOn
			}
		}
	]
	Sk8_Manu_SFpogo_to_SFpogo_D = [
		{
			time = 0.65000004
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 1.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundSlideOn
			}
		}
	]
	Sk8_Manu_Truck_to_Truck_D = [
		{
			time = 0.25
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 0.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundSlideOn
			}
		}
	]
	Sk8_Manu_OFmanu_to_OFmanu_D = [
		{
			time = 0.65000004
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 1.25
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	Sk8_Manu_OfNsMl_to_OfNsMl_D = [
		{
			time = 0.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 1.3499999
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	Sk8_Manu_Entr_Manual_1_D = [
		{
			time = 0.25
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	Sk8_Manu_Entr_Manual_A_D = [
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	Sk8_Manu_Entr_Nose_1_D = [
		{
			time = 0.25
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	Sk8_Manu_Entr_NSman_360fgflp_D = [
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	Sk8_Manu_Entr_AntiCa_1_D = [
		{
			time = 0.25
			event = AnimSoundEvent
			params = {
				event = TerrainSoundSlideOn
			}
		}
	]
	Sk8_Manu_Entr_Casper_1_D = [
		{
			time = 0.18
			event = AnimSoundEvent
			params = {
				event = TerrainSoundSlideOn
			}
		}
	]
	Sk8_Manu_Entr_Casper_6_D = [
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundSlideOn
			}
		}
	]
	Sk8_Manu_Entr_Casper_10_D = [
		{
			time = 0.05
			event = AnimSoundEvent
			params = {
				event = TerrainSoundSlideOn
			}
		}
	]
	Sk8_Manu_Entr_CFPogo_1_D = [
		{
			time = 0.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundSlideOn
			}
		}
		{
			time = 0.75
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoneless
			}
		}
		{
			time = 0.75
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
	]
	Sk8_Manu_Entr_CFpogo_4_D = [
		{
			time = 0.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundSlideOn
			}
		}
		{
			time = 0.75
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoneless
			}
		}
		{
			time = 0.75
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
	]
	Sk8_Manu_Entr_OFManu_1_D = [
		{
			time = 0.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	Sk8_Manu_Entr_OFNMnu_1_D = [
		{
			time = 0.25
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	Sk8_Manu_Entr_Pogo_1_D = [
		{
			time = 0.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundSlideOn
			}
		}
		{
			time = 0.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoneless
			}
		}
		{
			time = 0.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
	]
	Sk8_Manu_Entr_Primo_1_D = [
		{
			time = 0.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundSlideOn
			}
		}
		{
			time = 1.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
	]
	Sk8_Manu_Entr_SFPogo_1_D = [
		{
			time = 0.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundSlideOn
			}
		}
	]
	Sk8_Manu_Entr_SFpogo_3_D = [
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoneless
			}
		}
	]
	Sk8_Manu_Entr_SFpogo_8_D = [
		{
			time = 0.32000002
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepLand
			}
		}
		{
			time = 0.75
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoneless
			}
		}
		{
			time = 0.97999996
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	Sk8_Manu_Entr_TrckSd_1_D = [
		{
			time = 0.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundSlideOn
			}
		}
	]
	Sk8_Manu_Entr_TrckSd_9_D = [
		{
			time = 0.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundSlideOn
			}
		}
	]
	sk8_Flip_QuadKick_TO_D = [
		{
			time = 0.0
			event = BoardOnFire
		}
	]
	Sk8_Rail_boardBvarial_180T_F = [
		{
			time = 0.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundSlideOn
			}
		}
	]
	Sk8_Rail_boardBvarial_Fast_D = [
		{
			time = 0.2
			event = AnimSoundEvent
			params = {
				event = sk9_Roof_Scuffs
			}
		}
	]
	Sk8_Rail_boardBvarial_Slow_D = [
		{
			time = 0.2
			event = AnimSoundEvent
			params = {
				event = sk9_Roof_Scuffs
			}
		}
	]
	Sk8_Rail_boardBvarial_Base_F
}
PedAnimEventTable = {
	gped_golfer_full_swing_F = [
		{
			time = 0.8
			event = AnimSoundEvent
			params = {
				event = GolfSwing_sfx
			}
		}
	]
	PedMJudge_Happy02_F = [
		{
			time = 0.45000002
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 0.85
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 1.2
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 1.55
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 2.7
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 3.0
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
	]
	PedMJudge_Happy03_F = [
		{
			time = 0.55
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 0.8
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 1.1
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 1.37
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 1.65
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 1.9499999
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
	]
	PedMJudge_Happy04_F = [
		{
			time = 0.75
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 1.07
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 1.4
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
	]
	PedMJudge_Happy_F = [
		{
			time = 0.8
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 1.2
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 1.55
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 1.9
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 3.05
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 3.35
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
	]
	PedMJudge_NotHappy04_F = [
		{
			time = 0.63
			event = AnimSoundEvent
			params = {
				event = HeadHitTableSFX
			}
		}
		{
			time = 2.12
			event = AnimSoundEvent
			params = {
				event = HeadHitTableSFX
			}
		}
		{
			time = 3.6799998
			event = AnimSoundEvent
			params = {
				event = HeadHitTableSFX
			}
		}
	]
	PedF_01_Angry01_F = [
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 1.15
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 2.85
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 3.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedF_01_BigBumpBack_F = [
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedF_01_BigBumpForward_F = [
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.88
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.25
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedF_01_BigBumpLeft_F = [
		{
			time = 0.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedF_01_BigBumpRight_F = [
		{
			time = 0.45000002
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.88
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.19
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedF_01_BumpForward_F = [
		{
			time = 0.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedF_01_BumpLeft_F = [
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedF_01_BumpRight_F = [
		{
			time = 0.83
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedF_01_Clap_F = [
		{
			time = 0.55
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 0.78
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 1.0
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 1.22
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 1.47
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 1.72
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 2.05
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 2.29
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 2.57
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 2.83
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 3.11
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 3.35
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 3.6
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 3.85
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 4.2
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
	]
	PedF_01_Slap_F = [
		{
			time = 0.38000003
			event = AnimSoundEvent
			params = {
				event = whooshsound
			}
		}
		{
			time = 0.45000002
			event = AnimSoundEvent
			params = {
				event = BailSlapSoundEffect
			}
		}
	]
	PedF_Walk01_F = [
		{
			time = 0.05
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.565
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedF_Walk02_F = [
		{
			time = 0.05
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.585
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedF_Walk03_F = [
		{
			time = 0.05
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.59
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedFCheerleader_DodgeLeft_F = [
		{
			time = 0.25
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.65000004
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.87
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.57
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 2.1499999
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 2.58
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedFCheerleader_DodgeRight_F = [
		{
			time = 0.35000002
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.52
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.87
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedFCheerleader_Wlk_xSlw_Fdx = [
		{
			time = 0.05
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.565
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_BigBumpBack_F = [
		{
			time = 0.25
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.62
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_BigBumpForward_F = [
		{
			time = 0.35000002
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_BigBumpLeft_F = [
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.91999996
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_BigBumpRight_F = [
		{
			time = 0.25
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.05
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_BumpForward_F = [
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_BumpLeft_F = [
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.55
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_BumpRight_F = [
		{
			time = 0.48000002
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.78
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_Clap01_F = [
		{
			time = 0.55
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 0.78
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 1.0
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 1.3
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 1.57
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 1.8199999
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 2.1499999
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 2.3899999
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
	]
	PedM_Clap01_P = [
		{
			time = 0.55
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 0.78
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 1.0
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 1.3
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 1.57
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 1.8199999
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 2.1499999
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 2.3899999
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
	]
	PedM_Clap02_F = [
		{
			time = 0.35000002
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 0.62
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 0.87
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 1.14
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 1.41
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 1.6700001
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 1.9499999
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 2.1899998
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 2.44
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 2.72
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 3.02
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 3.3
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
	]
	PedM_Clap02_P = [
		{
			time = 0.35000002
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 0.62
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 0.87
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 1.14
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 1.41
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 1.6700001
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 1.9499999
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 2.1899998
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 2.44
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 2.72
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 3.02
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 3.3
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
	]
	PedM_Clap03_F = [
		{
			time = 0.35000002
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 0.65000004
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 0.91999996
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 1.2
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 1.48
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 1.7700001
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 2.1
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 2.35
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
	]
	PedM_Clap03_P = [
		{
			time = 0.35000002
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 0.65000004
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 0.91999996
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 1.2
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 1.48
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 1.7700001
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 2.1
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 2.35
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
	]
	PedM_Clap04_F = [
		{
			time = 0.55
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 0.82
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 1.1
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 1.41
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 1.72
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 2.0
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 2.3
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 2.6
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 2.9
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
	]
	PedM_Clap04_P = [
		{
			time = 0.55
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 0.82
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 1.1
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 1.41
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 1.72
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 2.0
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 2.3
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 2.6
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 2.9
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
	]
	PedM_Dive_F = [
		{
			time = 0.01
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBodyFall
			}
		}
		{
			time = 3.08
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 3.78
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_DodgeLeft01_F = [
		{
			time = 0.25
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.75
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.15
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_DodgeLeft_F = [
		{
			time = 0.25
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.55
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.95
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_DodgeRight01_F = [
		{
			time = 0.01
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 1.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
		{
			time = 1.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBodyFall
			}
		}
		{
			time = 4.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 5.38
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_DodgeRight_F = [
		{
			time = 0.25
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.55
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.95
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_FallBack01a_F = [
		{
			time = 0.01
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.54
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
		{
			time = 0.54
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBodyFall
			}
		}
		{
			time = 3.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 4.75
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 5.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 6.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_FallBack01b_F = [
		{
			time = 0.01
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.54
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
		{
			time = 0.54
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBodyFall
			}
		}
		{
			time = 3.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 5.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 6.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_FallBack_F = [
		{
			time = 0.18
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.45000002
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.54
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
		{
			time = 0.54
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBodyFall
			}
		}
		{
			time = 1.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundLegFall
			}
		}
		{
			time = 3.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 3.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_FallForward01a_F = [
		{
			time = 0.54
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBodyFall
			}
		}
		{
			time = 0.54
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
		{
			time = 5.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 6.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_FallForward01b_F = [
		{
			time = 0.54
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBodyFall
			}
		}
		{
			time = 0.54
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
		{
			time = 2.95
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 3.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 4.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 6.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 6.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 7.25
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_FallForward_F = [
		{
			time = 0.01
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.48000002
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.54
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBodyFall
			}
		}
		{
			time = 0.54
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
		{
			time = 2.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 3.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_FallLeft01a_F = [
		{
			time = 0.54
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBodyFall
			}
		}
		{
			time = 0.54
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
		{
			time = 1.9499999
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 5.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 6.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 6.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_FallLeft01b_F = [
		{
			time = 0.54
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBodyFall
			}
		}
		{
			time = 0.54
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
		{
			time = 5.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 6.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 7.15
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_FallLeft_F = [
		{
			time = 0.01
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.48000002
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.58
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBodyFall
			}
		}
		{
			time = 0.58
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
		{
			time = 0.62
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 2.85
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 3.85
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_FallRight01a_F = [
		{
			time = 0.54
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBodyFall
			}
		}
		{
			time = 0.54
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
		{
			time = 1.9499999
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 5.25
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 5.98
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 6.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_FallRight01b_F = [
		{
			time = 0.54
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBodyFall
			}
		}
		{
			time = 0.54
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
		{
			time = 3.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 6.05
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 6.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 7.15
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_FallRight_F = [
		{
			time = 0.01
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.48000002
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.58
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBodyFall
			}
		}
		{
			time = 0.58
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
		{
			time = 0.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 2.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 3.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_FloorSit_DodgeLeft_F = [
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.75
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_FloorSit_DodgeRight_F = [
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.85
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.38
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_FloorSit_FallLeft_F = [
		{
			time = 0.01
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.24000001
			event = AnimSoundEvent
			params = {
				event = TerrainSoundLegFall
			}
		}
		{
			time = 2.85
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 3.55
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_FloorSit_FallRight_F = [
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundLegFall
			}
		}
		{
			time = 1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 2.45
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 3.55
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_FrntLean_Dodge01_F = [
		{
			time = 0.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.48000002
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.85
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_FrntLean_DodgeLeft_F = [
		{
			time = 0.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.48000002
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.85
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_FrntLean_DodgeRight_F = [
		{
			time = 0.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.54
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.05
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_Gen_Punch01_F = [
		{
			time = 0.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.67
			event = AnimSoundEvent
			params = {
				event = whooshsound
			}
		}
		{
			time = 0.75
			event = AnimSoundEvent
			params = {
				event = BailSlapSoundEffect
			}
		}
		{
			time = 0.91999996
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
	]
	PedM_GPed_FallBack01a_F = [
		{
			time = 0.01
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.2
			event = AnimSoundEvent
			params = {
				event = whooshsound
			}
		}
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBodyFall
			}
		}
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
		{
			time = 2.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 2.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_GPed_FallForward01a_F = [
		{
			time = 0.01
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.2
			event = AnimSoundEvent
			params = {
				event = whooshsound
			}
		}
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBodyFall
			}
		}
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
		{
			time = 2.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 2.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_GPed_FallLeft01a_F = [
		{
			time = 0.01
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = whooshsound
			}
		}
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBodyFall
			}
		}
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
		{
			time = 2.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 3.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_GPed_FallRight01a_F = [
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = whooshsound
			}
		}
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBodyFall
			}
		}
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
		{
			time = 3.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 3.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 3.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_GPed_Knockdown01_F = [
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = whooshsound
			}
		}
		{
			time = 0.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBodyFall
			}
		}
		{
			time = 0.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
		{
			time = 1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundArmFall
			}
		}
		{
			time = 2.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_GPed_Knockdown02_F = [
		{
			time = 0.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBodyFall
			}
		}
		{
			time = 0.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
		{
			time = 0.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundArmFall
			}
		}
		{
			time = 1.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 2.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_Kick01_F = [
		{
			time = 0.05
			event = AnimSoundEvent
			params = {
				event = whooshsound
			}
		}
		{
			time = 0.2
			event = AnimSoundEvent
			params = {
				event = BailSlapSoundEffect
			}
		}
		{
			time = 0.65000004
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
	]
	PedM_Kneel_DodgeDuck_F = [
		{
			time = 0.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.05
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_Kneel_DodgeLeft_F = [
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.05
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_Kneel_DodgeRight_F = [
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_Kneel_FallForward01_F = [
		{
			time = 0.48000002
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.54
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBodyFall
			}
		}
		{
			time = 2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 2.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 3.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_Kneel_FallForward02_F = [
		{
			time = 0.48000002
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.54
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBodyFall
			}
		}
		{
			time = 0.85
			event = AnimSoundEvent
			params = {
				event = TerrainSoundArmFall
			}
		}
		{
			time = 2.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 3.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_Punch01_F = [
		{
			time = 0.05
			event = AnimSoundEvent
			params = {
				event = whooshsound
			}
		}
		{
			time = 0.2
			event = AnimSoundEvent
			params = {
				event = BailSlapSoundEffect
			}
		}
		{
			time = 0.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
	]
	PedM_Punch02_F = [
		{
			time = 0.25
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = whooshsound
			}
		}
		{
			time = 0.2
			event = AnimSoundEvent
			params = {
				event = BailSlapSoundEffect
			}
		}
		{
			time = 1.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
	]
	PedM_Punch03_F = [
		{
			time = 0.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.67
			event = AnimSoundEvent
			params = {
				event = whooshsound
			}
		}
		{
			time = 0.75
			event = AnimSoundEvent
			params = {
				event = BailSlapSoundEffect
			}
		}
		{
			time = 0.91999996
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
	]
	PedM_RegLdg_DodgeDuck_F = [
		{
			time = 0.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundJumpLand
			}
		}
		{
			time = 1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_RegLdg_DodgeLeft_F = [
		{
			time = 0.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundJumpLand
			}
		}
		{
			time = 1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_RegLdg_DodgeRight_F = [
		{
			time = 0.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundJumpLand
			}
		}
		{
			time = 1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_RegLdg_FallForward01_F = [
		{
			time = 0.48000002
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.54
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBodyFall
			}
		}
		{
			time = 0.54
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
		{
			time = 2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 2.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 3.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_RegLdg_FallForward02_F = [
		{
			time = 0.48000002
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.54
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBodyFall
			}
		}
		{
			time = 0.54
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
		{
			time = 2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 2.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 3.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_Run01_xFst_Fdx = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.26
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_Run_xFst_BLx = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.26
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_Run_xFst_BRx = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.26
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_Run_xFst_Bx = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.26
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_Run_xFst_FdLx = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.26
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_Run_xFst_FdRx = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.26
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_Run_xFst_Fdx = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.26
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_RunStpLf_xFst_BLx = [
		{
			time = 0.35000002
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_RunStpLf_xFst_BRx = [
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
	]
	PedM_RunStpLf_xFst_Bx = [
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.65000004
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_RunStpLf_xFst_FdLx = [
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.65000004
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_RunStpLf_xFst_FdRx = [
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.65000004
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_RunStpLf_xFst_Fdx = [
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.65000004
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_RunStpRf_xFst_BLx = [
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
	]
	PedM_RunStpRf_xFst_BRx = [
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.65000004
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_RunStpRf_xFst_Bx = [
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.65000004
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_RunStpRf_xFst_FdLx = [
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.65000004
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_RunStpRf_xFst_FdRx = [
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.65000004
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_RunStpRf_xFst_Fdx = [
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.65000004
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_Sit_DodgeDuck_F = [
		{
			time = 0.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.05
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_Sit_DodgeLeft01_F = [
		{
			time = 0.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.05
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_Sit_DodgeLeft02_F = [
		{
			time = 0.45000002
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_Sit_DodgeRight01_F = [
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.75
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_Sit_DodgeRight02_F = [
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.05
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.3499999
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
	]
	PedM_Sit_FallBack_F = [
		{
			time = 0.54
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBodyFall
			}
		}
		{
			time = 2.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 3.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_Sit_FallForward_F = [
		{
			time = 0.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBodyFall
			}
		}
		{
			time = 2.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 3.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_Sit_FallLeft_F = [
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBodyFall
			}
		}
		{
			time = 2.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 3.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_Sit_FallRight_F = [
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBodyFall
			}
		}
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundStop
			}
		}
		{
			time = 0.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 2.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 3.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_StndLdg_DodgeBack_F = [
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBodyFall
			}
		}
		{
			time = 0.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 1.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_StndLdg_DodgeLeft_F = [
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBodyFall
			}
		}
		{
			time = 0.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 1.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_StndLdg_DodgeRight_F = [
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.85
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_StndLdg_FallBack01_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBodyFall
			}
		}
		{
			time = 2.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 3.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_StndLdg_FallBack02_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBodyFall
			}
		}
		{
			time = 2.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 2.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_Walk_B_1_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.65000004
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_Walk_BL_1_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.65000004
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_Walk_BR_1_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.65000004
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_Walk_F_1_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.65000004
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_Walk_FdL_1_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.65000004
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_Walk_FdR_1_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.65000004
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_WallLean_DodgeLeft_F = [
		{
			time = 0.25
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.55
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.95
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_WallLean_DodgeRight_F = [
		{
			time = 0.25
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.55
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.95
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedM_WallLean_FallForward_F = [
		{
			time = 0.01
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.48000002
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.54
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBodyFall
			}
		}
		{
			time = 2.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 3.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMBlocker_MoveLeft01_F = [
		{
			time = 0.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMBlocker_MoveRight01_F = [
		{
			time = 0.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMBlocker_Run_F = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.37
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMBum_SadWalk_F = [
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.75
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMBum_WallSlam02_F = [
		{
			time = 0.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.25
			event = AnimSoundEvent
			params = {
				event = BailSlapSoundEffect
			}
		}
		{
			time = 2.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBodyFall
			}
		}
		{
			time = 6.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 6.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
	]
	PedMColonel_Wlk_xSlw_Fdx = [
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.75
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMCop_Run01_xFst_Fdx = [
		{
			time = 0.05
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMCop_Run02_xFst_Fdx = [
		{
			time = 0.05
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMCop_Run03_xFst_Fdx = [
		{
			time = 0.05
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.35000002
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMCop_Run_xFst_Fdx = [
		{
			time = 0.05
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMCop_Wlk01_xSlw_Fdx = [
		{
			time = 0.05
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMCop_Wlk02_xSlw_Fdx = [
		{
			time = 0.05
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.55
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMCop_Wlk_xSlw_Fdx = [
		{
			time = 0.05
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMDrunk_Wlk01_xSlw_Fdx = [
		{
			time = 0.05
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 1.25
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 1.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
	]
	PedMDrunk_Wlk02_xSlw_Fdx = [
		{
			time = 0.05
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.75
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 1.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 2.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 3.05
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
	]
	PedMDrunk_Wlk_xSlw_Fdx = [
		{
			time = 0.05
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.65000004
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 1.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 2.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 3.05
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
	]
	PedMGen_Wlk01_xSlw_Fdx = [
		{
			time = 0.05
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMGen_Wlk02_xSlw_Fdx = [
		{
			time = 0.05
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMGen_Wlk03_xSlw_Fdx = [
		{
			time = 0.05
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.65000004
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMGen_Wlk_xSlw_BLx = [
		{
			time = 0.05
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.65000004
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMGen_Wlk_xSlw_BRx = [
		{
			time = 0.05
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.65000004
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMGen_Wlk_xSlw_Bx = [
		{
			time = 0.05
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.65000004
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMGen_Wlk_xSlw_FdLx = [
		{
			time = 0.05
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.65000004
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMGen_Wlk_xSlw_FdRx = [
		{
			time = 0.05
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.65000004
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMGen_Wlk_xSlw_Fdx = [
		{
			time = 0.05
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.65000004
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMGen_Wlk_xSlw_Lx = [
		{
			time = 0.05
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.65000004
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMGen_Wlk_xSlw_Rx = [
		{
			time = 0.05
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.65000004
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMGen_WlkStpLf_xSlw_BLx = [
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMGen_WlkStpLf_xSlw_BRx = [
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMGen_WlkStpLf_xSlw_Bx = [
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMGen_WlkStpLf_xSlw_FdLx = [
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMGen_WlkStpLf_xSlw_FdRx = [
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMGen_WlkStpLf_xSlw_Fdx = [
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMGen_WlkStpRf_xSlw_BLx = [
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMGen_WlkStpRf_xSlw_BRx = [
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMGen_WlkStpRf_xSlw_Bx = [
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMGen_WlkStpRf_xSlw_FdLx = [
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMGen_WlkStpRf_xSlw_FdRx = [
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMGen_WlkStpRf_xSlw_Fdx = [
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMKid_Run_xFst_Fdx = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMKid_Skip_xSlw_Fdx = [
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 1.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMKid_Wlk01_xSlw_Fdx = [
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.65000004
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMKid_Wlk02_xSlw_Fdx = [
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.65000004
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMKid_Wlk_xSlw_Fdx = [
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.65000004
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMSk8_PushCycle_F = [
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootPush
			}
		}
	]
	PedMSk8_Trick01_F = [
		{
			time = 3.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPickUpBoard
			}
		}
		{
			time = 4.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 5.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	PedMSk8r_01_IdleAToSkate01_F = [
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPutDownBoard
			}
		}
	]
	PedMSk8r_01_IdleAToSkate02_F = [
		{
			time = 0.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPickUpBoard
			}
		}
		{
			time = 0.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 2.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 2.05
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 2.55
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	PedMSk8r_01_IdleBToSkate01_F = [
		{
			time = 3.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 4.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 4.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPutDownBoard
			}
		}
	]
	PedMSk8r_01_SkateToIdleA01_F = [
		{
			time = 1.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPickUpBoard
			}
		}
	]
	PedMSk8r_01_SkateToIdleA02_F = [
		{
			time = 0.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundRevert
			}
		}
		{
			time = 1.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPickUpBoard
			}
		}
	]
	PedMSk8r_01_SkateToIdleB01_F
	PedMSk8r_Mullen01_F = [
		{
			time = 2.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 3.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	PedMSk8r_Mullen02_F = [
		{
			time = 0.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 1.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 2.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 3.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootPush
			}
		}
	]
	PedMSk8r_Mullen03_F = [
		{
			time = 0.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 1.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 3.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 4.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 5.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	PedMSk8r_Mullen04a_F = [
		{
			time = 0.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 1.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 5.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 5.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	PedMSk8r_Mullen04b_F = [
		{
			time = 1.15
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 1.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	PedMSk8r_Mullen05a_F = [
		{
			time = 4.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 5.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
		{
			time = 6.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
		{
			time = 6.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
		{
			time = 6.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
	]
	PedMSk8r_Mullen05b_F = [
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
		{
			time = 0.65000004
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
		{
			time = 0.95
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
		{
			time = 1.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
		{
			time = 1.65
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
		{
			time = 2.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
		{
			time = 2.35
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
		{
			time = 2.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
		{
			time = 3.05
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
		{
			time = 3.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
		{
			time = 3.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
		{
			time = 4.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 4.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	PedMSk8r_Mullen06_F = [
		{
			time = 0.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 2.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	PedMSk8r_Mullen07_F = [
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 1.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	time = 0.9
	event = AnimSoundEvent
	params = {
		event = TerrainSoundFootstepWalk
	}
	PedMSk8r_OffBoardIdle_F
	PedMSk8r_OnBoard2TruckRun_F = [
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPickUpBoard
			}
		}
		{
			time = 1.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 2.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
	]
	PedMSk8r_OnBoard_F = [
		{
			time = 1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 2.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	PedMSk8r_OnBoardIdle_F
	PedMSk8r_OnBoardTrick01_F = [
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	PedMSk8r_OnBoardTrick02_F = [
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	PedMSk8r_OnBoardTrickStart_F = [
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 0.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	PedMSk8r_PogoEnd01_F = [
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 0.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	PedMSk8r_PogoEnd02_F = [
		{
			time = 1.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 2.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 3.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	PedMSk8r_PogoLoop_F = [
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
	]
	PedMSk8r_SkateToMullen01_F
	PedMSk8r_SkateToMullen02_F
	PedMSk8r_Trick01_F = [
		{
			time = 3.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundRevert
			}
		}
		{
			time = 4.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 5.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 7.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootPush
			}
		}
	]
	PedMSk8r_Trick02_F = [
		{
			time = 1.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 1.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 4.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 4.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	PedMSk8r_Trick03a_F = [
		{
			time = 1.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 1.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	PedMSk8r_Trick04_F = [
		{
			time = 6.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 7.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 7.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	PedMSk8r_Trick05_F = [
		{
			time = 3.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 4.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	PedMSk8r_Trick06_F = [
		{
			time = 1.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 1.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	PedMSk8r_Trick07_F = [
		{
			time = 1.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 1.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	PedMSk8r_Trick08_F = [
		{
			time = 1.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 1.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 4.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 4.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	PedMSk8r_Trick09_F
	PedMSk8r_Trick10_F
	PedMSk8r_Trick11_F = [
		{
			time = 1.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 1.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 5.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootPush
			}
		}
	]
	PedMSk8r_Trick12_F = [
		{
			time = 0.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 1.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	PedMSk8r_Trick13_F = [
		{
			time = 6.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPickUpBoard
			}
		}
		{
			time = 12.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPutDownBoard
			}
		}
	]
	PedMSk8r_Trick14_F = [
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootPush
			}
		}
		{
			time = 2.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 3.1499999
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	PedMSk8r_Trick15_F = [
		{
			time = 0.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootPush
			}
		}
		{
			time = 3.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 3.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	PedSk8r_TruckRunLoop_F = [
		{
			time = 0.35000002
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
		{
			time = 0.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
	]
	PedM_DM_Talk_Lean_A = [
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = TwoPedsLeanTalk_MF
			}
		}
	]
	PedM_Tourists01_TalkA = [
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = Tourists01_TalkA
			}
		}
	]
	PedM_DM_CarJack01 = [
		{
			time = 2.3
			event = AnimSoundEvent
			params = {
				event = carjack_sfx_01
			}
		}
		{
			time = 17.7
			event = AnimSoundEvent
			params = {
				event = carjack_sfx_02
			}
		}
	]
	PedM_ThrowingCoins01 = [
		{
			time = 8.8
			event = AnimSoundEvent
			params = {
				event = cointoss_sfx
			}
		}
	]
	PedM_ThrowingCoins02 = [
		{
			time = 4.6
			event = AnimSoundEvent
			params = {
				event = cointoss_sfx
			}
		}
		{
			time = 12.6
			event = AnimSoundEvent
			params = {
				event = cointoss_sfx
			}
		}
		{
			time = 27.4
			event = AnimSoundEvent
			params = {
				event = cointoss_sfx
			}
		}
		{
			time = 37.8
			event = AnimSoundEvent
			params = {
				event = cointoss_sfx
			}
		}
	]
	PedM_GottaPoop01 = [
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = gottapoo_sfx_01
			}
		}
		{
			time = 4.1
			event = AnimSoundEvent
			params = {
				event = gottapoo_sfx_02
			}
		}
	]
	PedMCop_DM_HarassBum01_02 = [
		{
			time = 2.6
			event = AnimSoundEvent
			params = {
				event = VO_bumharass01_a
			}
		}
		{
			time = 5.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 5.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 6.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 6.7
			event = AnimSoundEvent
			params = {
				event = SFX_bumharass01_kick1
			}
		}
		{
			time = 7.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 7.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 8.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 9.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 11.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 11.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 12.2
			event = AnimSoundEvent
			params = {
				event = SFX_bumharass01_kick2
			}
		}
		{
			time = 12.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 13.0
			event = AnimSoundEvent
			params = {
				event = SFX_bumharass01_kick2
			}
		}
		{
			time = 13.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 13.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 14.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 14.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 15.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 17.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 18.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 19.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 19.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 20.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMCop_DM_HarassBum01_03 = [
		{
			time = 1.0
			event = AnimSoundEvent
			params = {
				event = VO_bumharass01_b
			}
		}
		{
			time = 1.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 3.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 3.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 4.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 5.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 7.7
			event = AnimSoundEvent
			params = {
				event = SFX_bumharass01_push
			}
		}
		{
			time = 7.8
			event = AnimSoundEvent
			params = {
				event = VO_bumharass01_c
			}
		}
		{
			time = 11.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 15.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 16.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 17.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 17.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 18.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMSk8r_CopHarrassSk8r01a = [
		{
			time = 4.1
			event = AnimSoundEvent
			params = {
				event = VO_CopHarassSkater
			}
		}
	]
	PedMGang_DM_Arrested01 = [
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = VO_gangarrest
			}
		}
	]
	PedMGuard_StealingDeck01 = [
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = VO_stealingdeck
			}
		}
	]
	PedMPolice_DM_DrunkTest_F = [
		{
			time = 2.6
			event = AnimSoundEvent
			params = {
				event = VO_touchnose
			}
		}
	]
	PedM_DM_Accident_F = [
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = VO_caraccident
			}
		}
	]
	PedM_DM_ThrowingCoins01 = [
		{
			time = 8.8
			event = AnimSoundEvent
			params = {
				event = cointoss_sfx
			}
		}
	]
	PedM_DM_ThrowingCoins02 = [
		{
			time = 4.6
			event = AnimSoundEvent
			params = {
				event = cointoss_sfx
			}
		}
		{
			time = 12.6
			event = AnimSoundEvent
			params = {
				event = cointoss_sfx
			}
		}
		{
			time = 27.4
			event = AnimSoundEvent
			params = {
				event = cointoss_sfx
			}
		}
		{
			time = 37.9
			event = AnimSoundEvent
			params = {
				event = cointoss_sfx
			}
		}
	]
	PedM_DM_Talk_Cellphone = [
		{
			time = 4.0
			event = AnimSoundEvent
			params = {
				event = VO_CellPhoneTalk
			}
		}
	]
	PedM_DM_Talk_Cellphone02 = [
		{
			time = 4.0
			event = AnimSoundEvent
			params = {
				event = VO_CellPhoneTalk02
			}
		}
	]
	PedMCop_DM_CSI_A = [
		{
			time = 4.0
			event = AnimSoundEvent
			params = {
				event = VO_CSI_withhorrorlook01
			}
		}
	]
	PedM_DM_Talk_A = [
		{
			time = 6.1
			event = AnimSoundEvent
			params = {
				event = VO_PedM_2PedsTalk
			}
		}
	]
	PedM_DM_Talk_Sit_A = [
		{
			time = 6.0
			event = AnimSoundEvent
			params = {
				event = VO_PedM_2PedsTalk_Sit
			}
		}
	]
	PedM_DM_Talk_Sit01_A = [
		{
			time = 6.3
			event = AnimSoundEvent
			params = {
				event = VO_PedM_2PedsTalk_Sit_01
			}
		}
	]
	PedM_GuyInPlane01a = [
		{
			time = 4.2
			event = AnimSoundEvent
			params = {
				event = VO_PedM_GuyInPlane
			}
		}
	]
	PedM_RidingCannon01a = [
		{
			time = 1.8
			event = AnimSoundEvent
			params = {
				event = VO_PedM_RidingCanon01a
			}
		}
	]
	PedM_TourGuide01 = [
		{
			time = 2.0
			event = AnimSoundEvent
			params = {
				event = VO_PedM_TourGuide01
			}
		}
	]
	PedM_TourGuide02 = [
		{
			time = 2.1
			event = AnimSoundEvent
			params = {
				event = VO_PedM_TourGuide02
			}
		}
	]
	PedM_TourGuide03 = [
		{
			time = 1.9
			event = AnimSoundEvent
			params = {
				event = VO_PedM_TourGuide03
			}
		}
	]
	PedM_Tourists01_TalkA = [
		{
			time = 1.9
			event = AnimSoundEvent
			params = {
				event = VO_PedM_Tourists01_TalkA
			}
		}
	]
	PedMSk8r_DP_Talk01a = [
		{
			time = 3.9
			event = AnimSoundEvent
			params = {
				event = VO_PedMsk8r_talk01
			}
		}
	]
	PedMSk8r_DP_Talk02a = [
		{
			time = 4.0
			event = AnimSoundEvent
			params = {
				event = VO_PedMSk8r_talk02
			}
		}
	]
	PedMWorker_Talk01 = [
		{
			time = 3.9
			event = AnimSoundEvent
			params = {
				event = VO_pedmworker_talk
			}
		}
	]
	PedM_BumDance01_F = [
		{
			time = 2.6
			event = AnimSoundEvent
			params = {
				event = VO_goatbum
			}
		}
	]
	PedmBucketPlayer_play01 = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 0.2
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 0.6
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 0.7
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 0.8
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 0.9
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 1.1
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 1.3
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 1.4
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 1.5
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 1.6
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 1.7
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 1.8
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 1.9
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 2.1
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 2.3
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 2.5
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 2.6
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 2.7
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 2.8
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 2.9
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 3.0
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 3.1
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 3.4
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 3.6
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 3.7
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 3.8
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 3.9
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 4.0
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 4.2
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 4.5
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 4.6
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 4.7
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 4.8
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 5.2
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 5.3
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 5.4
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 5.5
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 5.7
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 5.9
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 6.1
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 6.2
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 6.3
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 6.4
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 6.5
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 6.6
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 6.8
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 6.9
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 7.0
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 7.1
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 7.2
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 7.3
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 7.4
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 7.6
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 7.7
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 7.8
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 7.9
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 8.1
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 8.2
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 8.3
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 8.4
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 8.6
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 8.7
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 8.8
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 8.9
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 9.1
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 9.2
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 9.3
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 9.4
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 9.6
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 9.7
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 9.8
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 9.9
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 10.1
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 10.2
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 10.3
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 10.4
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 10.5
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 10.6
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 10.7
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 10.8
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 10.9
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 11.0
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 11.1
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 11.2
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 11.3
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 11.4
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 11.5
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 11.6
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 11.7
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 11.8
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
	]
	PedmBucketPlayer_play = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 0.2
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 0.6
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 0.7
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 0.8
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 0.9
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 1.1
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 1.3
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 1.4
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 1.5
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 1.6
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 1.7
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 1.8
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 1.9
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 2.1
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 2.3
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 2.5
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 2.6
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 2.7
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 2.8
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 2.9
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 3.0
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 3.1
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 3.4
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 3.6
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 3.7
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 3.8
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 3.9
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 4.0
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 4.2
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 4.5
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 4.6
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 4.7
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 4.8
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 5.2
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 5.3
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 5.4
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 5.5
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 5.7
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 5.9
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 6.1
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 6.2
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 6.3
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 6.4
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 6.5
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 6.6
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 6.8
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 6.9
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 7.0
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 7.1
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 7.2
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 7.3
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 7.4
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 7.6
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 7.7
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 7.8
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 7.9
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 8.1
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 8.2
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 8.3
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 8.4
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 8.6
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 8.7
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 8.8
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 8.9
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 9.1
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 9.2
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 9.3
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 9.4
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 9.6
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 9.7
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 9.8
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 9.9
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 10.1
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 10.2
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 10.3
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 10.4
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 10.5
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 10.6
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 10.7
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 10.8
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 10.9
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 11.0
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 11.1
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 11.2
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 11.3
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 11.4
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 11.5
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 11.6
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 11.7
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
		{
			time = 11.8
			event = AnimSoundEvent
			params = {
				event = sk9_PED_Drumming
			}
		}
	]
	PedMSpectator_Cheer01 = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 0.6
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 1.2
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 1.8
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 2.4
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 3.0
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 3.6
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 4.2
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 4.8
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 5.4
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 6.0
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 6.6
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
	]
	PedMSpectator_Cheer03 = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 0.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 0.9
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 0.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.3
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 1.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.8
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 1.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 2.2
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 2.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 2.7
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 2.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 3.1
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 3.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 3.6
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 3.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 4.1
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 4.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 4.6
			event = AnimSoundEvent
			params = {
				event = AnimHandclaps
			}
		}
		{
			time = 4.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMSk8r_Session01a = [
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPutDownBoard
			}
		}
		{
			time = 0.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootPush
			}
		}
		{
			time = 3.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 4.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundJumpLand
			}
		}
		{
			time = 4.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoardBounce
			}
		}
		{
			time = 4.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundJumpLand
			}
		}
		{
			time = 5.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoardBounce
			}
		}
		{
			time = 6.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootPush
			}
		}
		{
			time = 8.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 9.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 9.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 11.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 11.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoardBounce
			}
		}
		{
			time = 11.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 12.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 13.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootPush
			}
		}
		{
			time = 15.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 15.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 16.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 17.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 18.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 18.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPickUpBoard
			}
		}
		{
			time = 19.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMSk8r_Session01b = [
		{
			time = 1.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 2.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundJump
			}
		}
		{
			time = 2.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 7.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 7.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 8.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 9.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 10.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 11.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 12.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 12.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootPush
			}
		}
		{
			time = 15.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundRevert
			}
		}
		{
			time = 16.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 16.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 16.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootPush
			}
		}
		{
			time = 19.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundRevert
			}
		}
		{
			time = 19.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepLand
			}
		}
	]
	PedMSk8r_Session01c = [
		{
			time = 1.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 1.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPutDownBoard
			}
		}
		{
			time = 2.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 2.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundJump
			}
		}
		{
			time = 2.55
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootPush
			}
		}
		{
			time = 4.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepLand
			}
		}
		{
			time = 4.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoneless
			}
		}
		{
			time = 5.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 6.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundRevert
			}
		}
		{
			time = 6.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 7.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 7.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 8.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 8.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootPush
			}
		}
		{
			time = 10.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 10.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 11.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 11.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPickUpBoard
			}
		}
		{
			time = 12.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepLand
			}
		}
		{
			time = 13.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPutDownBoard
			}
		}
		{
			time = 15.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMSk8r_Session01d = [
		{
			time = 1.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPutDownBoard
			}
		}
		{
			time = 1.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootPush
			}
		}
		{
			time = 5.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 6.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 7.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 8.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPickUpBoard
			}
		}
		{
			time = 8.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 9.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 9.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 10.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 10.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPutDownBoard
			}
		}
		{
			time = 12.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 12.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 13.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 14.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 15.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 15.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 15.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPickUpBoard
			}
		}
		{
			time = 15.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoardBounce
			}
		}
		{
			time = 16.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoardBounce
			}
		}
		{
			time = 16.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoardBounce
			}
		}
		{
			time = 17.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoardBounce
			}
		}
		{
			time = 18.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
	]
	PedMSk8r_Session01e = [
		{
			time = 1.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPutDownBoard
			}
		}
		{
			time = 2.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootPush
			}
		}
		{
			time = 4.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 5.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoardBounce
			}
		}
		{
			time = 5.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoardBounce
			}
		}
		{
			time = 5.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepLand
			}
		}
		{
			time = 5.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 6.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 6.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 7.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 7.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 8.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 8.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 9.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 10.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPutDownBoard
			}
		}
	]
	PedMSk8r_Session01f = [
		{
			time = 1.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPutDownBoard
			}
		}
		{
			time = 1.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootPush
			}
		}
		{
			time = 4.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 4.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoardBounce
			}
		}
		{
			time = 5.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoardBounce
			}
		}
		{
			time = 5.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepLand
			}
		}
		{
			time = 5.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 6.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 7.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoardBounce
			}
		}
		{
			time = 7.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoardBounce
			}
		}
		{
			time = 7.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoardBounce
			}
		}
		{
			time = 8.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoardBounce
			}
		}
		{
			time = 8.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoardBounce
			}
		}
		{
			time = 6.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 7.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 7.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 8.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 8.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 9.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 9.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 10.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 10.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 11.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 11.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPickUpBoard
			}
		}
		{
			time = 12.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 12.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 13.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 13.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 14.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 14.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 15.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPutDownBoard
			}
		}
	]
	PedMSk8r_Session02_End = [
		{
			time = 3.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootPush
			}
		}
		{
			time = 7.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepLand
			}
		}
		{
			time = 8.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPickUpBoard
			}
		}
		{
			time = 9.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMSk8r_Session02_Start = [
		{
			time = 1.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPutDownBoard
			}
		}
		{
			time = 1.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 2.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 2.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootPush
			}
		}
	]
	PedMSk8r_Session02_Trick00 = [
		{
			time = 1.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 2.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 2.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoardBounce
			}
		}
		{
			time = 2.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBodyFall
			}
		}
		{
			time = 3.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 4.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 4.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 5.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 5.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 6.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 6.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPickUpBoard
			}
		}
		{
			time = 7.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 7.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 8.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 8.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPutDownBoard
			}
		}
		{
			time = 8.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootPush
			}
		}
		{
			time = 11.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 12.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPickUpBoard
			}
		}
		{
			time = 13.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMSk8r_Session02_Trick01 = [
		{
			time = 2.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 2.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 2.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepLand
			}
		}
		{
			time = 3.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 3.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 4.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootPush
			}
		}
	]
	PedMSk8r_Session02_Trick02 = [
		{
			time = 2.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 2.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 3.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepLand
			}
		}
		{
			time = 3.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 3.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 3.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 3.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 4.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 5.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 5.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 6.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootPush
			}
		}
	]
	PedMSk8r_Session02_Trick03 = [
		{
			time = 2.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 2.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 3.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 3.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 4.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 4.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootPush
			}
		}
	]
	PedMSk8r_Session02_Trick04 = [
		{
			time = 2.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBodyFall
			}
		}
		{
			time = 2.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoardBounce
			}
		}
		{
			time = 5.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 5.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 6.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 6.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 7.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 8.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 9.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 9.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootPush
			}
		}
	]
	PedMSk8r_Session02_Trick05 = [
		{
			time = 1.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 1.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	PedMSk8r_Session02_Trick06 = [
		{
			time = 1.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 1.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	PedMSk8r_Session02_Trick07 = [
		{
			time = 1.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 2.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	PedMSk8r_Session02_Trick08 = [
		{
			time = 2.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 2.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	PedMSk8r_Session02_Trick09 = [
		{
			time = 1.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 1.65
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	pedmsk8r_session02_trick10 = [
		{
			time = 1.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 1.65
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	pedmsk8r_session02_trick11 = [
		{
			time = 1.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 1.65
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	PedMSk8r_FL_FLIdleToIdle01a = [
		{
			time = 0.65000004
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPutDownBoard
			}
		}
		{
			time = 1.4499999
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 1.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 2.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 3.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 4.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPickUpBoard
			}
		}
		{
			time = 5.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 6.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMSk8r_FL_Idle01a = [
	]
	PedMSk8r_FL_idle01aToFLldle = [
	]
	PedMSk8r_FL_Trick00 = [
		{
			time = 1.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 1.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 3.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 4.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 4.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 5.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 6.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPickUpBoard
			}
		}
		{
			time = 6.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 7.65
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMSk8r_FL_Trick01 = [
		{
			time = 2.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
		{
			time = 3.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
		{
			time = 3.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
		{
			time = 4.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 5.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 5.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 6.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPickUpBoard
			}
		}
		{
			time = 6.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 7.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 7.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPutDownBoard
			}
		}
		{
			time = 8.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMSk8r_FL_Trick02 = [
		{
			time = 3.1499999
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 3.35
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 4.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 4.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 4.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPickUpBoard
			}
		}
		{
			time = 5.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 5.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 6.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPutDownBoard
			}
		}
		{
			time = 6.8500004
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMSk8r_FL_Trick03 = [
		{
			time = 0.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPutDownBoard
			}
		}
		{
			time = 1.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 1.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 1.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 2.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPickUpBoard
			}
		}
		{
			time = 2.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 5.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 7.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 7.65
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 7.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoardBounce
			}
		}
		{
			time = 8.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepLand
			}
		}
		{
			time = 8.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepLand
			}
		}
		{
			time = 10.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 10.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 10.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoardBounce
			}
		}
		{
			time = 12.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPickUpBoard
			}
		}
	]
	PedMSk8r_FL_Trick04 = [
		{
			time = 1.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 2.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
		{
			time = 3.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
		{
			time = 3.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
		{
			time = 4.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 4.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 5.55
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 5.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 6.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPickUpBoard
			}
		}
	]
	PedMSk8r_FL_Trick05 = [
		{
			time = 2.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundJump
			}
		}
		{
			time = 3.6499999
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 6.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
		{
			time = 6.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
		{
			time = 7.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
		{
			time = 7.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepLand
			}
		}
		{
			time = 8.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 8.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 8.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoardBounce
			}
		}
		{
			time = 9.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 9.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoardBounce
			}
		}
		{
			time = 9.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoardBounce
			}
		}
		{
			time = 9.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 10.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 10.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoardBounce
			}
		}
		{
			time = 10.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoardBounce
			}
		}
		{
			time = 11.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPickUpBoard
			}
		}
		{
			time = 11.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 12.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 12.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 13.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 13.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 14.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 14.75
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPutDownBoard
			}
		}
	]
	PedMSk8r_FL_Trick06 = [
		{
			time = 2.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 3.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 3.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 5.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 7.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 8.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPickUpBoard
			}
		}
		{
			time = 9.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMSk8r_03_Session01 = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundRoll
			}
		}
		{
			time = 4.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPutDownBoard
			}
		}
		{
			time = 6.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 6.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 8.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 8.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 9.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 9.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 10.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 10.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 11.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 13.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 13.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 15.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 15.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 17.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPickUpBoard
			}
		}
	]
	PedMSk8r_03_Session02 = [
		{
			time = 2.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 2.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 3.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 4.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 4.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPutDownBoard
			}
		}
		{
			time = 7.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 7.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 8.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepLand
			}
		}
		{
			time = 8.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 9.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 10.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPickUpBoard
			}
		}
		{
			time = 12.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPutDownBoard
			}
		}
		{
			time = 13.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundRevert
			}
		}
		{
			time = 14.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundRevert
			}
		}
		{
			time = 16.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 19.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 20.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 20.449999
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPickUpBoard
			}
		}
		{
			time = 21.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 21.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 22.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 23.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMSk8r_03_Session03 = [
		{
			time = 2.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 3.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 3.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundJump
			}
		}
		{
			time = 4.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 5.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 7.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 8.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 8.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 10.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 10.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 12.45
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 12.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 13.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoardBounce
			}
		}
		{
			time = 13.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 14.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 14.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPickUpBoard
			}
		}
		{
			time = 15.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 16.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 17.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 17.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 18.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 18.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 19.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 20.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 20.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMSk8r_04_Session01 = [
		{
			time = 5.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPutDownBoard
			}
		}
		{
			time = 6.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 7.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 8.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 8.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 9.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 10.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 10.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 12.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 12.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 13.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 13.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 15.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPickUpBoard
			}
		}
	]
	PedMSk8r_04_Session02 = [
		{
			time = 6.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPutDownBoard
			}
		}
		{
			time = 7.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 8.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 10.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 10.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 13.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 14.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 14.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 15.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 15.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPickUpBoard
			}
		}
		{
			time = 17.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPutDownBoard
			}
		}
		{
			time = 19.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 19.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundRevert
			}
		}
		{
			time = 20.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 21.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPickUpBoard
			}
		}
	]
	PedMSk8r_04_Session03 = [
		{
			time = 3.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPutDownBoard
			}
		}
		{
			time = 7.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 7.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 8.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 9.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 10.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 11.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 11.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundBoardBounce
			}
		}
		{
			time = 12.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootPush
			}
		}
		{
			time = 14.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundRevert
			}
		}
		{
			time = 14.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 15.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 16.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootPush
			}
		}
		{
			time = 17.7
			event = AnimSoundEvent
			params = {
				event = TerrainSoundRevert
			}
		}
		{
			time = 18.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 19.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundRevert
			}
		}
		{
			time = 20.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
		{
			time = 21.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPickUpBoard
			}
		}
	]
	PedMSk8r_04_Idle01ToIdle02 = [
	]
	PedMSk8r_04_Idle02ToIdle01 = [
	]
	PedMSk8r_01_Idle01 = [
	]
	PedMSk8r_01_Idle02 = [
	]
	PedMSk8r_DP_Idle01a = [
	]
	PedMSk8r_DP_Idle01b = [
	]
	PedMSk8r_DP_Idle01c = [
		{
			time = 7.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepScuff
			}
		}
	]
	PedMSk8r_DP_Idle01d = [
		{
			time = 6.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundPogo
			}
		}
		{
			time = 9.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
		{
			time = 12.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootstepWalk
			}
		}
	]
	PedMSk8r_Sk8ToIdleToSk8 = [
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundRoll
			}
		}
	]
	PedMSk8r_AS_WalkToSk8 = [
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundRoll
			}
		}
	]
	pedmsk8_onboard01a = [
		{
			time = 0.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundRoll
			}
		}
	]
	PedMSk8r_Bench_Grind02 = [
		{
			time = 1.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 1.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundGrindOn
			}
		}
		{
			time = 2.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	PedMSk8r_Bench_Grind03 = [
		{
			time = 1.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 1.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundGrindOn
			}
		}
		{
			time = 2.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	PedMSk8r_Bench_Grind04 = [
		{
			time = 1.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 1.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundGrindOn
			}
		}
		{
			time = 2.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	PedMSk8r_Rail_Grind01 = [
		{
			time = 1.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 1.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundGrindOn
			}
		}
		{
			time = 2.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	PedMSk8r_Rail_Grind02 = [
		{
			time = 1.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 1.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundGrindOn
			}
		}
		{
			time = 2.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	PedMSk8_PushINIT = [
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootPush
			}
		}
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundRoll
			}
		}
	]
	PedMSk8_Ollie = [
		{
			time = 0.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 0.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	PedMSk8_KickFlip = [
		{
			time = 1.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 1.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	PedMSk8_heelflip = [
		{
			time = 1.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 1.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	pedmsk8_nolliekickflip = [
		{
			time = 1.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 1.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	PedMSk8_360KickFlip = [
		{
			time = 1.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 1.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	pedmsk8_fsflip = [
		{
			time = 1.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 1.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	PedMSk8r_Manual_Trick01 = [
		{
			time = 1.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 1.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	PedMSk8r_Manual_Trick02 = [
		{
			time = 1.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 1.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
	]
	PedMSk8r_Session01 = [
		{
			time = 4.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootPush
			}
		}
		{
			time = 7.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 7.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 13.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootPush
			}
		}
		{
			time = 15.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 15.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 20.5
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootPush
			}
		}
	]
	PedMSk8r_Session02 = [
		{
			time = 3.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootPush
			}
		}
		{
			time = 5.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 5.4
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 8.0
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootPush
			}
		}
		{
			time = 9.8
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 10.2
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 12.9
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootPush
			}
		}
		{
			time = 16.3
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllie
			}
		}
		{
			time = 16.6
			event = AnimSoundEvent
			params = {
				event = TerrainSoundOllieLand
			}
		}
		{
			time = 20.1
			event = AnimSoundEvent
			params = {
				event = TerrainSoundFootPush
			}
		}
	]
	PedM_HammeringFast_F = [
		{
			time = 0.17
			event = AnimSoundEvent
			params = {
				event = Concrete_Hammer
			}
		}
	]
	PedM_HammeringSlow_F = [
		{
			time = 0.17
			event = AnimSoundEvent
			params = {
				event = Concrete_Hammer
			}
		}
	]
}
ActualSkaterAnimHandlerExceptionTable = [
	{
		response = call_script
		event = AnimSoundEvent
		scr = HandleAnimSoundEvent
	}
	{
		response = call_script
		event = BoardScrapeSound
		scr = HandleBoardScrapeSound
	}
	{
		response = call_script
		event = BoardRollingSound
		scr = HandleBoardRollingSound
	}
	{
		response = call_script
		event = GenericParticles
		scr = Emit_SpecialTrickParticles
	}
	{
		response = call_script
		event = Aggro_Kick_Rumble_Weak_event
		scr = Aggro_Kick_Rumble_Weak
	}
	{
		response = call_script
		event = Aggro_Kick_Rumble_Strong_event
		scr = Aggro_Kick_Rumble_Strong
	}
	{
		response = call_script
		event = DoScreenShake
		scr = Grind_ScreenShake
	}
	{
		response = call_script
		event = BoardOnFire
		scr = SkaterParticles_BoardOnFire
	}
	{
		response = call_script
		event = FootstepParticlesR
		scr = SkaterParticles_OnRightFootstep
	}
	{
		response = call_script
		event = FootstepParticlesL
		scr = SkaterParticles_OnLeftFootstep
	}
	{
		response = call_script
		event = JumpLandParticles
		scr = SkaterParticles_JumpLand
	}
	{
		response = call_script
		event = TerrainLandParticles
		scr = SkaterParticles_TerrainLand
	}
	{
		response = call_script
		event = KickBoostEvent
		scr = HandleKickBoostEvent
	}
	{
		response = call_script
		event = SpaceWalkBoostEvent
		scr = SpacewalkBoost
	}
]
ActualPedAnimHandlerExceptionTable = [
	{
		response = call_script
		event = AnimSoundEvent
		scr = HandleAnimSoundEvent
	}
	{
		response = call_script
		event = print
		scr = HandlePrintEvent
	}
	{
		response = call_script
		event = BullGallopSounds
		scr = HandleBullGallopSounds
	}
	{
		response = call_script
		event = DoSprayPaint
		scr = HandlePedSprayPaint
	}
	{
		response = call_script
		event = DoSprayPaint
		scr = HandlePedSprayPaint
	}
]
