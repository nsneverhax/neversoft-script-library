debug_peds = 0

script pedprint 
	if ($debug_peds = 1)
		printf <...>
	endif
endscript

script DieLater 
	die
endscript

script AnimScript_Example 
	pedprint "AnimScript_Example"
	Interact_MoveToAndBlock lock = true align = true movement_desc = {movement = walk_slow}
	Interact_PlayAnimAndBlock {
		anim = PedM_Lean01_IdleToLean_F
		reaction_state = transition
		blend_period = 0.2
		exit_anim = PedM_Lean01_LeanToIdle_F}
	Interact_PlayAnimAndBlock {
		anim = PedM_Lean01_Idle00_F
		reaction_state = sitting
		blend_period = 0.2
		reaction_state = normal
		exit_anim = PedM_Lean01_LeanToIdle_F}
	Interact_PlayAnimAndBlock {
		anim = PedM_Lean01_LookingAround_F
		reaction_state = normal
		blend_period = 0.2
		exit_anim = PedM_Lean01_LeanToIdle_F}
	Interact_PlayAnimAndBlock {
		anim = PedM_Lean01_LeanToIdle_F
		reaction_state = normal
		blend_period = 0.2
		reaction_state = normal}
endscript

script AnimScript_MoveTo 
	Interact_MoveToAndBlock \{lock = false
		align = false
		path_segment = true
		movement_desc = {
			movement = walk_fast
		}}
endscript

script AnimScript_Sk8rMoveTo 
	Interact_MoveToAndBlock \{lock = false
		align = true
		path_segment = true
		movement_desc = {
			movement = walk_fast
		}}
endscript

script AnimScript_Die 
	obj_spawnscriptlater \{DieLater}
endscript

script AnimScript_SetMoveSpeedFast 
	Navigation_SetMoveDescription \{speed = 80}
endscript

script AnimScript_m_h1_boostpull_PedIdle 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = ragdoll}
	Interact_MoveToAndBlock \{path_segment = true
		lock = true
		align = true
		movement_desc = {
			movement = walk_fast
		}}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_BoostPull_intro_Idle
		reaction_state = walllean
		blend_period = 0.0}
	repeat
endscript

script AnimScript_m_c1_impress_PedIdle 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = ragdoll}
	Interact_MoveToAndBlock \{path_segment = true
		lock = true
		align = true
		movement_desc = {
			movement = walk_slow
		}}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_C1_Impress_Idle
		reaction_state = walllean
		blend_period = 0.0}
	repeat
endscript

script AnimScript_m_R1_Demo_PedIdle 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = ragdoll}
	Interact_MoveToAndBlock \{path_segment = true
		lock = true
		align = true
		movement_desc = {
			movement = walk_slow
		}}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_R1_Demo_Idle
		reaction_state = walllean
		blend_period = 0.0}
	repeat
endscript

script AnimScript_m_C3_Photo2_PedIdle 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = ragdoll}
	Interact_MoveToAndBlock \{path_segment = true
		lock = true
		align = true
		movement_desc = {
			movement = walk_slow
		}}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_C3_Photo2_intro_Idle
		reaction_state = bump
		blend_period = 0.0}
	repeat
endscript

script AnimScript_testWalks 
	Interact_MoveToAndBlock \{lock = false
		align = false
		path_segment = true
		movement_desc = {
			movement = walk_fast
		}}
	AnimScript_TestWalksScript
endscript

script AnimScript_TestWalksScript 
	Interact_PlayAnimAndBlock \{anim = PedMGen_Wlk_Fd01
		reaction_state = normal
		blend_period = 0.9
		pause_movement = true
		reaction_state = normal}
endscript

script AnimScript_Arcade 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = ragdoll}
	Interact_MoveToAndBlock \{lock = false
		align = true
		movement_desc = {
			movement = walk_slow
		}}
	AnimScript_ArcadeScript
endscript

script AnimScript_ArcadeScript 
	Interact_PlayAnimAndBlock {
		anim = PedM_IdleToArcade
		reaction_state = normal
		blend_period = 0.2
	}
	Interact_PlayWeightedAnimAndBlock {
		weighted_anims = [
			{weight = 5
				anim = PedM_Arcade01
				reaction_state = normal
				blend_period = 0.2
			}
			{weight = 3
				anim = PedM_Arcade02
				reaction_state = normal
				blend_period = 0.2
			}
			{weight = 3
				anim = PedM_Arcade03
				reaction_state = normal
				blend_period = 0.2
			}]
		num_repeats = 3
	}
	Interact_PlayAnimAndBlock {
		anim = PedM_ArcadeToIdle
		reaction_state = normal
		blend_period = 0.2
		reaction_state = normal}
endscript

script AnimScript_Onlookers01 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = bumped}
	Interact_MoveToAndBlock \{lock = false
		align = true
		movement_desc = {
			movement = walk_slow
		}}
	AnimScript_Onlooker01Script
endscript

script AnimScript_Onlooker01Script 
	Interact_PlayWeightedAnimAndBlock {
		weighted_anims = [
			{weight = 5
				anim = PedM_AudienceIdle01_F
				reaction_state = normal
				blend_period = 0.2
			}
			{weight = 1
				anim = PedM_AudienceIdle02_F
				reaction_state = normal
				blend_period = 0.2
			}
			{weight = 3
				anim = PedM_AudienceIdle03_F
				reaction_state = normal
				blend_period = 0.2
			}
			{weight = 3
				anim = PedM_AudienceIdle04_F
				reaction_state = normal
				blend_period = 0.2
			}
			{weight = 3
				anim = PedM_AudienceIdle05_F
				reaction_state = normal
				blend_period = 0.2
			}]
		num_repeats = 1
	}
endscript

script AnimScript_GenMtest01 
	Interact_MoveToAndBlock lock = false align = true movement_desc = {movement = walk_slow}
	Interact_PlayWeightedAnimAndBlock {
		weighted_anims = [
			{weight = 3
				anim = PedM_Idle01_f
				reaction_state = normal
				blend_period = 0.2
			}
			{weight = 3
				anim = PedM_Idle02_F
				reaction_state = normal
				blend_period = 0.2
			}
			{weight = 3
				anim = PedM_Waiting03
				reaction_state = normal
				blend_period = 0.2
			}
			{weight = 3
				anim = PedM_Idle03_f
				reaction_state = normal
				blend_period = 0.2
			}
			{weight = 3
				anim = PedM_Idle04_f
				reaction_state = normal
				blend_period = 0.2
			}
			{weight = 3
				anim = PedM_Waiting05
				reaction_state = normal
				blend_period = 0.2
			}]
		num_repeats = 1
	}
endscript

script AnimScript_LookingAround 
	Interact_SceneInterruption type = noncritical response = ambient participate_until = ragdoll
	Interact_MoveToAndBlock lock = false align = false movement_desc = {movement = walk_slow}
	Interact_PlayWeightedAnimAndBlock {
		weighted_anims = [
			{weight = 3
				anim = PedM_LookingAround01
				reaction_state = normal
				blend_period = 0.2
			}
			{weight = 3
				anim = PedM_LookingAround02
				reaction_state = normal
				blend_period = 0.2
			}
			{weight = 3
				anim = PedM_LookingAround03
				reaction_state = normal
				blend_period = 0.2
			}
			{weight = 3
				anim = PedM_LookingAround04
				reaction_state = normal
				blend_period = 0.2
			}]
		num_repeats = 1
	}
endscript

script AnimScript_LookingAtTheMap 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = bumped}
	Interact_MoveToAndBlock \{lock = false
		align = true
		movement_desc = {
			movement = walk_slow
		}}
	Interact_PlayWeightedAnimAndBlock \{weighted_anims = [
			{
				weight = 3
				anim = PedM_LookAtMap01
				reaction_state = normal
				blend_period = 0.2
			}
			{
				weight = 3
				anim = PedM_LookAtMap01
				reaction_state = normal
				blend_period = 0.2
			}
		]
		num_repeats = 1}
endscript

script AnimScript_LookingAtTheSign 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = bumped}
	Interact_MoveToAndBlock \{lock = false
		align = true
		movement_desc = {
			movement = walk_slow
		}}
	Interact_PlayWeightedAnimAndBlock \{weighted_anims = [
			{
				weight = 3
				anim = PedM_LookAtSign01
				reaction_state = normal
				blend_period = 0.2
			}
			{
				weight = 3
				anim = PedM_LookAtSign02
				reaction_state = normal
				blend_period = 0.2
			}
		]
		num_repeats = 1}
endscript

script AnimScript_UsingCell 
	Interact_MoveToAndBlock \{lock = false
		align = true
		movement_desc = {
			movement = walk_slow
		}}
	Interact_PlayWeightedAnimAndBlock \{weighted_anims = [
			{
				weight = 3
				anim = PedM_DM_Talk_Cellphone02
				reaction_state = normal
				blend_period = 0.2
			}
			{
				weight = 3
				anim = PedM_DM_Talk_Cellphone02
				reaction_state = normal
				blend_period = 0.2
			}
		]
		num_repeats = 1}
endscript

script AnimScript_GenMWaitingNew01 
	Interact_SceneInterruption type = noncritical response = ambient participate_until = bumped
	Interact_MoveToAndBlock lock = false align = true movement_desc = {movement = walk_slow}
	Interact_PlayWeightedAnimAndBlock {
		weighted_anims = [
			{weight = 3
				anim = PedM_Idle01_f
				reaction_state = normal
				blend_period = 0.2
			}
			{weight = 3
				anim = PedM_Idle02_F
				reaction_state = normal
				blend_period = 0.2
			}
			{weight = 3
				anim = PedM_Waiting03
				reaction_state = normal
				blend_period = 0.2
			}
			{weight = 3
				anim = PedM_Idle03_f
				reaction_state = normal
				blend_period = 0.2
			}
			{weight = 3
				anim = PedM_Idle04_f
				reaction_state = normal
				blend_period = 0.2
			}
			{weight = 3
				anim = PedM_Waiting05
				reaction_state = normal
				blend_period = 0.2
			}]
		num_repeats = 1
	}
endscript

script AnimScript_DummyIdles 
	Interact_SceneInterruption type = noncritical response = ambient participate_until = bumped
	Interact_MoveToAndBlock lock = false align = false movement_desc = {movement = walk_slow}
	Interact_PlayWeightedAnimAndBlock {
		weighted_anims = [
			{weight = 3
				anim = PedM_Idle02_F
				reaction_state = normal
				blend_period = 0.2
			}
			{weight = 3
				anim = PedM_Idle01_f
				reaction_state = normal
				blend_period = 0.2
			}
			{weight = 3
				anim = PedM_Waiting05
				reaction_state = normal
				blend_period = 0.2
			}]
		num_repeats = 1
	}
endscript

script AnimScript_GenMWaitingBus 
	Interact_SceneInterruption type = noncritical response = ambient participate_until = bumped
	Interact_MoveToAndBlock lock = false align = true movement_desc = {movement = walk_slow}
	Interact_PlayWeightedAnimAndBlock {
		weighted_anims = [
			{weight = 3
				anim = PedM_Idle03_f
				reaction_state = normal
				blend_period = 0.2
			}
			{weight = 3
				anim = PedM_Waiting05
				reaction_state = normal
				blend_period = 0.2
			}
			{weight = 3
				anim = PedM_Waiting03
				reaction_state = normal
				blend_period = 0.2
			}
			{weight = 3
				anim = PedM_WaitingBus01
				reaction_state = normal
				blend_period = 0.2
			}
			{weight = 3
				anim = PedM_WaitingBus02
				reaction_state = normal
				blend_period = 0.2
			}]
		num_repeats = 1
	}
endscript

script AnimScript_GenMWaitingBus_repeats 
	Interact_SceneInterruption type = noncritical response = ambient participate_until = bumped
	Interact_MoveToAndBlock lock = false align = true movement_desc = {movement = walk_slow}
	Interact_PlayWeightedAnimAndBlock {
		weighted_anims = [
			{weight = 3
				anim = PedM_Waiting05
				reaction_state = normal
				blend_period = 0.2
			}
			{weight = 3
				anim = PedM_Waiting03
				reaction_state = normal
				blend_period = 0.2
			}
			{weight = 3
				anim = PedM_Waiting03
				reaction_state = normal
				blend_period = 0.2
			}
			{weight = 3
				anim = PedM_WaitingBus01
				reaction_state = normal
				blend_period = 0.2
			}
			{weight = 3
				anim = PedM_WaitingBus02
				reaction_state = normal
				blend_period = 0.2
			}]
		num_repeats
	}
endscript

script AnimScript_SecurityGuard01 
	Interact_SceneInterruption type = noncritical response = ambient participate_until = ragdoll
	Interact_MoveToAndBlock lock = true align = true movement_desc = {movement = walk_slow}
	begin
	Interact_PlayWeightedAnimAndBlock {
		weighted_anims = [
			{weight = 3
				anim = PedM_Waiting05
				reaction_state = normal
				blend_period = 0.2
			}
			{weight = 3
				anim = PedM_Waiting03
				reaction_state = normal
				blend_period = 0.2
			}
			{weight = 3
				anim = PedM_Waiting03
				reaction_state = normal
				blend_period = 0.2
			}
			{weight = 3
				anim = PedM_WaitingBus01
				reaction_state = normal
				blend_period = 0.2
			}
			{weight = 3
				anim = PedM_WaitingBus02
				reaction_state = normal
				blend_period = 0.2
			}]
	}
	repeat
endscript

script AnimScript_SecurityGuard02 
	Interact_SceneInterruption type = noncritical response = ambient participate_until = ragdoll
	Interact_MoveToAndBlock lock = true align = true movement_desc = {movement = walk_slow}
	begin
	Interact_PlayWeightedAnimAndBlock {
		weighted_anims = [
			{weight = 3
				anim = PedM_Waiting05
				reaction_state = normal
				blend_period = 0.2
			}
			{weight = 3
				anim = PedM_Waiting03
				reaction_state = normal
				blend_period = 0.2
			}
			{weight = 3
				anim = PedM_Waiting03
				reaction_state = normal
				blend_period = 0.2
			}
			{weight = 3
				anim = PedM_WaitingBus01
				reaction_state = normal
				blend_period = 0.2
			}
			{weight = 3
				anim = PedM_WaitingBus02
				reaction_state = normal
				blend_period = 0.2
			}]
	}
	repeat
endscript

script AnimScript_TheInfamousGoat 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = ragdoll}
	Interact_MoveToAndBlock \{lock = true
		align = true
		movement_desc = {
			movement = walk_slow
		}}
	begin
	Interact_PlayAnimAndBlock \{anim = anl_goat_idle
		reaction_state = bump
		blend_period = 0.0}
	repeat
endscript

script AnimScript_BumDances01 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = ragdoll}
	Interact_MoveToAndBlock \{lock = true
		align = true
		movement_desc = {
			movement = walk_slow
		}}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_BumDance01_F
		reaction_state = normal
		blend_period = 0.0}
	repeat
endscript

script AnimScript_BumDances02 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = ragdoll}
	Interact_MoveToAndBlock \{lock = true
		align = true
		movement_desc = {
			movement = walk_slow
		}}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_BumDance02_F
		reaction_state = normal
		blend_period = 0.0}
	repeat
endscript

script AnimScript_LookingBehindFence01 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = ragdoll}
	Interact_MoveToAndBlock \{lock = true
		align = true
		movement_desc = {
			movement = walk_slow
		}}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_BehindFence01_F
		reaction_state = normal
		blend_period = 0.0}
	repeat
endscript

script AnimScript_LookingBehindFence02 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = ragdoll}
	Interact_MoveToAndBlock \{lock = true
		align = true
		movement_desc = {
			movement = walk_slow
		}}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_BehindFence02_F
		reaction_state = normal
		blend_period = 0.0}
	repeat
endscript

script AnimScript_LookingBehindFence03 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = ragdoll}
	Interact_MoveToAndBlock \{lock = true
		align = true
		movement_desc = {
			movement = walk_slow
		}}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_BehindFence03_F
		reaction_state = normal
		blend_period = 0.0}
	repeat
endscript

script AnimScript_LookingBehindFence04 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = ragdoll}
	Interact_MoveToAndBlock \{lock = true
		align = true
		movement_desc = {
			movement = walk_slow
		}}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_BehindFence04_F
		reaction_state = normal
		blend_period = 0.0}
	repeat
endscript

script AnimScript_LookingBehindFence05 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = ragdoll}
	Interact_MoveToAndBlock \{lock = true
		align = true
		movement_desc = {
			movement = walk_slow
		}}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_BehindFence05_F
		reaction_state = normal
		blend_period = 0.0}
	repeat
endscript

script AnimScript_LookingBehindFence06 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = ragdoll}
	Interact_MoveToAndBlock \{lock = true
		align = true
		movement_desc = {
			movement = walk_slow
		}}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_BehindFence06_F
		reaction_state = normal
		blend_period = 0.0}
	repeat
endscript

script AnimScript_LookingBehindFence07 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = ragdoll}
	Interact_MoveToAndBlock \{lock = true
		align = true
		movement_desc = {
			movement = walk_slow
		}}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_BehindFence07_F
		reaction_state = normal
		blend_period = 0.0}
	repeat
endscript

script AnimScript_GottaPee 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = ragdoll}
	Interact_MoveToAndBlock \{lock = true
		align = true
		movement_desc = {
			movement = walk_slow
		}}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_GottaPee01
		reaction_state = normal
		blend_period = 0.0}
	repeat
endscript

script AnimScript_GottaPoop 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = ragdoll}
	Interact_MoveToAndBlock \{lock = true
		align = true
		movement_desc = {
			movement = walk_slow
		}}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_GottaPoop01
		reaction_state = normal
		blend_period = 0.0}
	repeat
endscript

script AnimScript_PlayingPlanes 
	Interact_SceneInterruption \{type = critical
		response = ambient
		participate_until = ragdoll}
	begin
	Interact_MoveToAndBlock \{lock = false
		align = false
		movement_desc = {
			movement = walk_slow
		}}
	Interact_PlayAnimAndBlock \{anim = PedM_PlayingPlanes01
		reaction_state = normal
		blend_period = 0.2}
	repeat
endscript

script AnimScript_GuyInPlane01a 
	Interact_SceneInterruption \{type = critical
		response = ambient
		participate_until = ragdoll}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_GuyInPlane01a
		reaction_state = dummy
		blend_period = 0.0}
	repeat
endscript

script AnimScript_GuyInPlane01b 
	Interact_SceneInterruption \{type = critical
		response = ambient
		participate_until = ragdoll}
	Interact_MoveToAndBlock \{lock = false
		align = true
		movement_desc = {
			movement = walk_slow
		}}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_GuyInPlane01b
		reaction_state = dummy
		blend_period = 0.0}
	repeat
endscript

script AnimScript_RidingCanon01a 
	Interact_SceneInterruption \{type = critical
		response = ambient
		participate_until = ragdoll}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_RidingCannon01a
		reaction_state = bump
		blend_period = 0.0}
	repeat
endscript

script AnimScript_RidingCanon01b 
	Interact_SceneInterruption \{type = critical
		response = ambient
		participate_until = ragdoll}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_RidingCannon01b
		reaction_state = dummy
		blend_period = 0.0}
	repeat
endscript

script AnimScript_PedM_ThrowingCoins01 
	Interact_MoveToAndBlock \{lock = false
		align = true
		movement_desc = {
			movement = walk_slow
		}}
	Interact_PlayAnimAndBlock \{anim = PedM_DM_ThrowingCoins01
		reaction_state = dummy
		blend_in_period = 0.4
		blend_out_period = 0.4}
endscript

script AnimScript_PedM_Talk_Cellphone02 
	Interact_MoveToAndBlock \{lock = false
		align = true
		movement_desc = {
			movement = walk_slow
		}}
	Interact_PlayAnimAndBlock \{anim = PedM_DM_Talk_Cellphone02
		reaction_state = normal
		blend_in_period = 0.4
		blend_out_period = 0.4}
endscript

script AnimScript_PedM_Talk_Cellphone 
	Interact_MoveToAndBlock \{lock = false
		align = true
		movement_desc = {
			movement = walk_slow
		}}
	Interact_PlayAnimAndBlock \{anim = PedM_DM_Talk_Cellphone
		reaction_state = normal
		blend_in_period = 0.4
		blend_out_period = 0.0}
	Interact_PlayAnimAndBlock \{anim = PedM_DM_Talk_Cellphone_01
		reaction_state = normal
		blend_in_period = 0.0
		blend_out_period = 0.4}
endscript

script AnimScript_PedMSpectator01 
	begin
	Random (@ AnimScript_PedMSpectatorAScript
		@ AnimScript_PedMSpectatorBScript
		)
	repeat 1
endscript

script AnimScript_PedMSpectatorAScript 
	Interact_MoveToAndBlock lock = false align = true movement_desc = {movement = walk_slow}
	Interact_PlayAnimAndBlock {
		anim = PedMSpectator_Cheer01
		reaction_state = normal
		blend_in_period = 0.4
		blend_out_period = 0.0
	}
	begin
	Interact_PlayAnimAndBlock {
		anim = PedMSpectator_Cheer01
		reaction_state = normal
		blend_in_period = 0.0
		blend_out_period = 0.0
	}
	repeat 4
	Interact_PlayAnimAndBlock {
		anim = PedMSpectator_Cheer01
		reaction_state = normal
		blend_in_period = 0.0
		blend_out_period = 0.4
	}
endscript

script AnimScript_PedMSpectatorBScript 
	Interact_PlayAnimAndBlock \{anim = PedMSpectator_Listen2Music01
		reaction_state = normal
		blend_in_period = 0.4
		blend_out_period = 0.0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedMSpectator_Listen2Music01
		reaction_state = normal
		blend_in_period = 0.0
		blend_out_period = 0.0}
	repeat 4
	Interact_PlayAnimAndBlock \{anim = PedMSpectator_Listen2Music01
		reaction_state = normal
		blend_in_period = 0.0
		blend_out_period = 0.4}
endscript

script AnimScript_PedMSpectator02 
	begin
	Random (@ AnimScript_PedMSpectatorCScript
		@ AnimScript_PedMSpectatorDScript
		)
	repeat 1
endscript

script AnimScript_PedMSpectatorCScript 
	Interact_MoveToAndBlock lock = false align = true movement_desc = {movement = walk_slow}
	Interact_PlayAnimAndBlock {
		anim = PedMSpectator_Cheer02
		reaction_state = normal
		blend_in_period = 0.4
		blend_out_period = 0.0
	}
	begin
	Interact_PlayAnimAndBlock {
		anim = PedMSpectator_Cheer02
		reaction_state = normal
		blend_in_period = 0.0
		blend_out_period = 0.0
	}
	repeat 4
	Interact_PlayAnimAndBlock {
		anim = PedMSpectator_Cheer02
		reaction_state = normal
		blend_in_period = 0.0
		blend_out_period = 0.4
	}
endscript

script AnimScript_PedMSpectatorDScript 
	Interact_MoveToAndBlock lock = false align = true movement_desc = {movement = walk_slow}
	Interact_PlayAnimAndBlock {
		anim = PedMSpectator_Listen2Music02
		reaction_state = normal
		blend_in_period = 0.4
		blend_out_period = 0.0
	}
	begin
	Interact_PlayAnimAndBlock {
		anim = PedMSpectator_Listen2Music02
		reaction_state = normal
		blend_in_period = 0.0
		blend_out_period = 0.0
	}
	repeat 4
	Interact_PlayAnimAndBlock {
		anim = PedMSpectator_Listen2Music02
		reaction_state = normal
		blend_in_period = 0.0
		blend_out_period = 0.4
	}
endscript

script AnimScript_PedMSpectator03 
	begin
	Random (
		@ AnimScript_PedMSpectatorFScript )

	repeat 1
endscript

script AnimScript_PedMSpectatorFScript 
	Interact_MoveToAndBlock lock = false align = true movement_desc = {movement = walk_slow}
	Interact_PlayAnimAndBlock {
		anim = PedMSpectator_Listen2Music03
		reaction_state = normal
		blend_in_period = 0.4
		blend_out_period = 0.0
	}
	begin
	Interact_PlayAnimAndBlock {
		anim = PedMSpectator_Listen2Music03
		reaction_state = normal
		blend_in_period = 0.0
		blend_out_period = 0.0
	}
	repeat 4
	Interact_PlayAnimAndBlock {
		anim = PedMSpectator_Listen2Music03
		reaction_state = normal
		blend_in_period = 0.0
		blend_out_period = 0.4
	}
endscript

script AnimScript_TouristsLookAround03 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = ragdoll}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_LookingAround03
		reaction_state = dummy
		blend_period = 0.2
		reaction_state = normal}
	repeat
endscript

script AnimScript_TouristsLookAround04 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = ragdoll}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_LookingAround04
		reaction_state = dummy
		blend_period = 0.2
		reaction_state = normal}
	repeat
endscript

script AnimScript_LookAtMap01 
	Interact_MoveToAndBlock \{lock = true
		align = true
		movement_desc = {
			movement = walk_slow
		}}
	Interact_PlayAnimAndBlock \{anim = PedM_LookAtMap01
		reaction_state = normal
		blend_period = 0.2
		reaction_state = normal}
endscript

script AnimScript_LookAtSign 
	Interact_MoveToAndBlock \{lock = true
		align = true
		movement_desc = {
			movement = walk_slow
		}}
	Interact_PlayWeightedAnimAndBlock \{weighted_anims = [
			{
				weight = 5
				anim = PedM_LookAtSign01
				reaction_state = normal
				blend_period = 0.2
			}
			{
				weight = 3
				anim = PedM_LookAtSign02
				reaction_state = normal
				blend_period = 0.2
			}
		]
		num_repeats = 3}
endscript

script AnimScript_TouristsTalkingA 
	Interact_SceneInterruption \{type = critical
		response = ambient
		participate_until = bumped}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_Tourists01_TalkA
		reaction_state = dummy
		blend_period = 0.0}
	repeat
endscript

script AnimScript_TouristsTalkingB 
	Interact_SceneInterruption \{type = critical
		response = ambient
		participate_until = bumped}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_Tourists01_TalkB
		reaction_state = dummy
		blend_period = 0.0}
	repeat
endscript

script AnimScript_TourGuide01 
	Interact_SceneInterruption \{type = critical
		response = ambient
		participate_until = bumped}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_TourGuide01
		reaction_state = dummy
		blend_period = 0.0}
	repeat
endscript

script AnimScript_TourGuide02 
	Interact_SceneInterruption \{type = critical
		response = ambient
		participate_until = bumped}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_TourGuide02
		reaction_state = dummy
		blend_period = 0.0}
	repeat
endscript

script AnimScript_TourGuide03 
	Interact_SceneInterruption \{type = critical
		response = ambient
		participate_until = bumped}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_TourGuide03
		reaction_state = dummy
		blend_period = 0.0}
	repeat
endscript

script AnimScript_LeanForwardOnBench 
	Interact_MoveToAndBlock \{lock = false
		align = true
		movement_desc = {
			movement = walk_slow
		}}
	Interact_PlayAnimAndBlock \{anim = PedM_Bench_LeanForward
		reaction_state = frontlean
		blend_in_period = 0.4
		blend_out_period = 0.4}
endscript

script AnimScript_SittingIdleInterrupt 
	Interact_MoveToAndBlock \{lock = false
		align = true
		movement_desc = {
			movement = walk_slow
		}}
	Interact_PlayAnimAndBlock \{anim = PedM_SittingIdleInturrupt_F
		reaction_state = benchsit
		blend_in_period = 0.6
		blend_out_period = 0.0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_SittingIdleInturrupt_F
		reaction_state = benchsit
		blend_in_period = 0.0
		blend_out_period = 0.0}
	repeat
endscript

script AnimScript_SittingOnBench01 
	Interact_MoveToAndBlock \{lock = false
		align = true
		movement_desc = {
			movement = walk_slow
		}}
	Interact_PlayAnimAndBlock \{anim = PedM_Bench_Sitting01
		reaction_state = benchsit
		blend_in_period = 0.4
		blend_out_period = 0.4}
endscript

script AnimScript_SittingOnBench02 
	Interact_MoveToAndBlock \{lock = false
		align = true
		movement_desc = {
			movement = walk_slow
		}}
	Interact_PlayAnimAndBlock \{anim = PedM_Bench_Sitting02
		reaction_state = benchsit
		blend_in_period = 0.4
		blend_out_period = 0.4}
endscript

script AnimScript_SubwayWaiting01 
	Interact_MoveToAndBlock \{lock = false
		align = true
		movement_desc = {
			movement = walk_slow
		}}
	Interact_PlayAnimAndBlock \{anim = PedM_SubwayWaiting01
		reaction_state = normal
		blend_in_period = 0.4
		blend_out_period = 0.4}
endscript

script AnimScript_SubwayWallLean01 
	Interact_MoveToAndBlock lock = false align = true movement_desc = {movement = walk_slow}
	Interact_PlayAnimAndBlock {
		anim = PedM_IdleToWallLean_01_F
		reaction_state = normal
		blend_in_period = 0.4
		blend_out_period = 0.4
	}
	Interact_PlayAnimAndBlock {
		anim = PedM_WallLeanIdle_01_F
		reaction_state = normal
		blend_in_period = 0.4
		blend_out_period = 0.4
	}
	Interact_PlayAnimAndBlock {
		anim = PedM_WallLeanToIdle_01_F
		reaction_state = normal
		blend_in_period = 0.4
		blend_out_period = 0.4
	}
endscript

script AnimScript_PedM_DM_FrntLean01 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = ragdoll}
	begin
	Random (@ AnimScript_PedM_DM_FrntLean01AScript
		@ AnimScript_PedM_DM_FrntLean01BScript
		)
	repeat
endscript

script AnimScript_PedM_DM_FrntLean01AScript 
	Interact_PlayAnimAndBlock \{anim = PedM_DM_FrntLean01_F
		reaction_state = frontlean
		blend_in_period = 0.4
		blend_out_period = 0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_DM_FrntLean01_F
		reaction_state = frontlean
		blend_period = 0.0}
	repeat
endscript

script AnimScript_PedM_DM_FrntLean01BScript 
	Interact_PlayAnimAndBlock \{anim = PedM_DM_FrntLean01_01_F
		reaction_state = frontlean
		blend_in_period = 0.4
		blend_out_period = 0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_DM_FrntLean01_01_F
		reaction_state = frontlean
		blend_period = 0.0}
	repeat
endscript

script AnimScript_PedM_DM_FrntLean02 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = bumped}
	begin
	Random (@ AnimScript_PedM_DM_FrntLean02AScript
		@ AnimScript_PedM_DM_FrntLean02BScript
		)
	repeat
endscript

script AnimScript_PedM_DM_FrntLean02AScript 
	Interact_PlayAnimAndBlock \{anim = PedM_DM_FrntLean02_F
		reaction_state = frontlean
		blend_in_period = 0.4
		blend_out_period = 0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_DM_FrntLean02_F
		reaction_state = frontlean
		blend_period = 0.0}
	repeat
endscript

script AnimScript_PedM_DM_FrntLean02BScript 
	Interact_PlayAnimAndBlock \{anim = PedM_DM_FrntLean02_01_F
		reaction_state = frontlean
		blend_in_period = 0.4
		blend_out_period = 0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_DM_FrntLean02_01_F
		reaction_state = frontlean
		blend_period = 0.0}
	repeat
endscript

script AnimScript_PedM_DM_FrntLean01Low 
	begin
	Random (@ AnimScript_PedM_DM_FrntLean01LowAScript
		@ AnimScript_PedM_DM_FrntLean01LowBScript
		)
	repeat
endscript

script AnimScript_PedM_DM_FrntLean01LowAScript 
	Interact_PlayAnimAndBlock \{anim = PedM_DM_FrntLean01Low_F
		reaction_state = frontlean
		blend_in_period = 0.4
		blend_out_period = 0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_DM_FrntLean01Low_F
		reaction_state = frontlean
		blend_period = 0.0}
	repeat
endscript

script AnimScript_PedM_DM_FrntLean01LowBScript 
	Interact_PlayAnimAndBlock \{anim = PedM_DM_FrntLean01Low_01_F
		reaction_state = frontlean
		blend_in_period = 0.4
		blend_out_period = 0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_DM_FrntLean01Low_01_F
		reaction_state = frontlean
		blend_period = 0.0}
	repeat
endscript

script AnimScript_PedM_DM_FrntLean01LowLow 
	begin
	Random (@ AnimScript_PedM_DM_FrntLean01LowLowAScript
		@ AnimScript_PedM_DM_FrntLean01LowLowBScript
		)
	repeat
endscript

script AnimScript_PedM_DM_FrntLean01LowLowAScript 
	Interact_PlayAnimAndBlock \{anim = PedM_DM_FrntLean01LowLow_F
		reaction_state = frontlean
		blend_in_period = 0.4
		blend_out_period = 0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_DM_FrntLean01LowLow_F
		reaction_state = frontlean
		blend_period = 0.0}
	repeat
endscript

script AnimScript_PedM_DM_FrntLean01LowLowBScript 
	Interact_PlayAnimAndBlock \{anim = PedM_DM_FrntLean01LowLow_01_F
		reaction_state = frontlean
		blend_in_period = 0.4
		blend_out_period = 0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_DM_FrntLean01LowLow_01_F
		reaction_state = frontlean
		blend_period = 0.0}
	repeat
endscript

script AnimScript_PedM_DM_FrntLean02Low 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = ragdoll}
	begin
	Random (@ AnimScript_PedM_DM_FrntLean02LowAScript
		@ AnimScript_PedM_DM_FrntLean02LowBScript
		)
	repeat
endscript

script AnimScript_PedM_DM_FrntLean02LowAScript 
	Interact_PlayAnimAndBlock \{anim = PedM_DM_FrntLean02Low_F
		reaction_state = frontlean
		blend_in_period = 0.4
		blend_out_period = 0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_DM_FrntLean02Low_F
		reaction_state = frontlean
		blend_period = 0.0}
	repeat
endscript

script AnimScript_PedM_DM_FrntLean02LowBScript 
	Interact_PlayAnimAndBlock \{anim = PedM_DM_FrntLean02Low_01_F
		reaction_state = frontlean
		blend_in_period = 0.4
		blend_out_period = 0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_DM_FrntLean02Low_01_F
		reaction_state = frontlean
		blend_period = 0.0}
	repeat
endscript

script AnimScript_PedM_DM_FrntLean02LowLow 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = ragdoll}
	begin
	Random (@ AnimScript_PedM_DM_FrntLean02LowLowAScript
		@ AnimScript_PedM_DM_FrntLean02LowLowBScript
		)
	repeat
endscript

script AnimScript_PedM_DM_FrntLean02LowLowAScript 
	Interact_PlayAnimAndBlock \{anim = PedM_DM_FrntLean02LowLow_F
		reaction_state = frontlean
		blend_in_period = 0.4
		blend_out_period = 0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_DM_FrntLean02LowLow_F
		reaction_state = frontlean
		blend_period = 0.0}
	repeat
endscript

script AnimScript_PedM_DM_FrntLean02LowLowBScript 
	Interact_PlayAnimAndBlock \{anim = PedM_DM_FrntLean02LowLow_01_F
		reaction_state = frontlean
		blend_in_period = 0.4
		blend_out_period = 0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_DM_FrntLean02LowLow_01_F
		reaction_state = frontlean
		blend_period = 0.0}
	repeat
endscript

script AnimScript_DPedM_AudienceSitB 
	Interact_SceneInterruption \{type = noncritical
		response = custom
		participate_until = ragdoll}
	ai_giveorder \{name = AnimScript_DPedM_AudienceSitB_Interact}
	blockuntilevent \{type = scene_interruption}
	ai_giveorder \{name = AnimScript_SittingIdleInterrupt}
	block
endscript

script AnimScript_DPedM_AudienceSitB_Interact 
	Interact_PlayAnimAndBlock {
		anim = PedM_DM_AudienceSitB_Idle
		reaction_state = benchsit
		blend_in_period = 0.4
		blend_out_period = 0
	}
	Interact_PlayAnimAndBlock {
		anim = PedM_DM_AudienceSitB_Idle_02
		reaction_state = benchsit
		blend_period = 0.0
	}
	Interact_PlayAnimAndBlock {
		anim = PedM_DM_AudienceSitB_Idle_01
		reaction_state = benchsit
		blend_period = 0.0
	}
	begin
	Interact_PlayAnimAndBlock {
		anim = PedM_DM_AudienceSitB_Idle
		reaction_state = benchsit
		blend_period = 0.0
	}
	Interact_PlayAnimAndBlock {
		anim = PedM_DM_AudienceSitB_Idle_02
		reaction_state = benchsit
		blend_period = 0.0
	}
	Interact_PlayAnimAndBlock {
		anim = PedM_DM_AudienceSitB_Idle_01
		reaction_state = benchsit
		blend_period = 0.0
	}
	repeat
endscript

script AnimScript_DPedM_Talk_A 
	Interact_SceneInterruption \{type = critical
		response = ambient
		participate_until = bumped}
	Interact_PlayAnimAndBlock \{anim = PedM_DM_Talk_A
		reaction_state = dummy
		blend_in_period = 0.4
		blend_out_period = 0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_DM_Talk_A
		reaction_state = dummy
		blend_period = 0.0}
	repeat
endscript

script AnimScript_DPedM_Talk_B 
	Interact_SceneInterruption \{type = critical
		response = ambient
		participate_until = bumped}
	Interact_PlayAnimAndBlock \{anim = PedM_DM_Talk_B
		reaction_state = dummy
		blend_in_period = 0.4
		blend_out_period = 0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_DM_Talk_B
		reaction_state = dummy
		blend_period = 0.0}
	repeat
endscript

script AnimScript_DPedM_Talk_Lean_A 
	Interact_SceneInterruption \{type = critical
		response = ambient
		participate_until = bumped}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_DM_Talk_Lean_A
		reaction_state = walllean
		blend_period = 0.0}
	repeat
endscript

script AnimScript_DPedM_Talk_Lean_B 
	Interact_SceneInterruption \{type = critical
		response = ambient
		participate_until = bumped}
	Interact_PlayAnimAndBlock \{anim = PedM_DM_Talk_Lean_B
		reaction_state = dummy
		blend_in_period = 0.4
		blend_out_period = 0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_DM_Talk_Lean_B
		reaction_state = dummy
		blend_period = 0.0}
	repeat
endscript

script AnimScript_DPedM_Talk_Sit_A 
	Interact_SceneInterruption \{type = critical
		response = custom
		participate_until = bumped}
	ai_giveorder \{name = AnimScript_DPedM_Talk_Sit_A_Interact}
	blockuntilevent \{type = scene_interruption}
	ai_giveorder \{name = AnimScript_SittingIdleInterrupt}
	block
endscript

script AnimScript_DPedM_Talk_Sit_A_Interact 
	Interact_SceneInterruption type = critical response = custom participate_until = bumped
	Interact_PlayAnimAndBlock {
		anim = PedM_DM_Talk_Sit_A
		reaction_state = benchsit
		blend_in_period = 0.4
		blend_out_period = 0
	}
	Interact_PlayAnimAndBlock {
		anim = PedM_DM_Talk_Sit_01_A
		reaction_state = benchsit
		blend_period = 0.0
	}
	begin
	Interact_PlayAnimAndBlock {
		anim = PedM_DM_Talk_Sit_A
		reaction_state = benchsit
		blend_period = 0.0
	}
	Interact_PlayAnimAndBlock {
		anim = PedM_DM_Talk_Sit_01_A
		reaction_state = benchsit
		blend_period = 0.0
	}
	repeat
endscript

script AnimScript_DPedM_Talk_Sit_B 
	Interact_SceneInterruption type = critical response = ambient participate_until = bumped
	Interact_PlayAnimAndBlock {
		anim = PedM_DM_Talk_Sit_B
		reaction_state = dummy
		blend_in_period = 0.4
		blend_out_period = 0
	}
	Interact_PlayAnimAndBlock {
		anim = PedM_DM_Talk_Sit_01_B
		reaction_state = dummy
		blend_period = 0.0
	}
	begin
	Interact_PlayAnimAndBlock {
		anim = PedM_DM_Talk_Sit_B
		reaction_state = dummy
		blend_period = 0.0
	}
	Interact_PlayAnimAndBlock {
		anim = PedM_DM_Talk_Sit_01_B
		reaction_state = dummy
		blend_period = 0.0
	}
	repeat
endscript

script AnimScript_DPedM_Talk_Sit01_A 
	Interact_SceneInterruption \{type = critical
		response = custom
		participate_until = bumped}
	ai_giveorder \{name = AnimScript_DPedM_Talk_Sit01_A_Interact}
	blockuntilevent \{type = scene_interruption}
	ai_giveorder \{name = AnimScript_SittingIdleInterrupt}
	block
endscript

script AnimScript_DPedM_Talk_Sit01_A_Interact 
	Interact_SceneInterruption type = critical response = custom participate_until = bumped
	Interact_PlayAnimAndBlock {
		anim = PedM_DM_Talk_Sit01_A
		reaction_state = benchsit
		blend_in_period = 0.4
		blend_out_period = 0
	}
	Interact_PlayAnimAndBlock {
		anim = PedM_DM_Talk_Sit01_01_A
		reaction_state = benchsit
		blend_period = 0.0
	}
	begin
	Interact_PlayAnimAndBlock {
		anim = PedM_DM_Talk_Sit01_A
		reaction_state = benchsit
		blend_period = 0.0
	}
	Interact_PlayAnimAndBlock {
		anim = PedM_DM_Talk_Sit01_01_A
		reaction_state = benchsit
		blend_period = 0.0
	}
	repeat
endscript

script AnimScript_DPedM_Talk_Sit01_B 
	Interact_SceneInterruption \{type = critical
		response = custom
		participate_until = bumped}
	ai_giveorder \{name = AnimScript_DPedM_Talk_Sit01_B_Interact}
	blockuntilevent \{type = scene_interruption}
	ai_giveorder \{name = AnimScript_SittingIdleInterrupt}
	block
endscript

script AnimScript_DPedM_Talk_Sit01_B_Interact 
	Interact_SceneInterruption type = critical response = custom participate_until = bumped
	Interact_PlayAnimAndBlock {
		anim = PedM_DM_Talk_Sit01_B
		reaction_state = dummy
		blend_in_period = 0.5
		blend_out_period = 0.0
		start_frame_factor = 0.1
	}
	Interact_PlayAnimAndBlock {
		anim = PedM_DM_Talk_Sit01_01_B
		reaction_state = dummy
		blend_period = 0.0
	}
	begin
	Interact_PlayAnimAndBlock {
		anim = PedM_DM_Talk_Sit01_B
		reaction_state = dummy
		blend_period = 0.0
	}
	Interact_PlayAnimAndBlock {
		anim = PedM_DM_Talk_Sit01_01_B
		reaction_state = dummy
		blend_period = 0.0
	}
	repeat
endscript

script AnimScript_DPedM_Talk_Cellphone 
	Interact_SceneInterruption type = noncritical response = ambient participate_until = bumped
	Interact_PlayAnimAndBlock {
		anim = PedM_DM_Talk_Cellphone
		reaction_state = dummy
		blend_in_period = 0.4
		blend_out_period = 0
	}
	Interact_PlayAnimAndBlock {
		anim = PedM_DM_Talk_Cellphone_01
		reaction_state = dummy
		blend_period = 0.0
	}
	begin
	Interact_PlayAnimAndBlock {
		anim = PedM_DM_Talk_Cellphone
		reaction_state = dummy
		blend_period = 0.0
	}
	Interact_PlayAnimAndBlock {
		anim = PedM_DM_Talk_Cellphone_01
		reaction_state = dummy
		blend_period = 0.0
	}
	repeat
endscript

script AnimScript_DPedM_Talk_Cellphone02 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = ragdoll}
	Interact_PlayAnimAndBlock \{anim = PedM_DM_Talk_Cellphone02
		reaction_state = dummy
		blend_in_period = 0.4
		blend_out_period = 0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_DM_Talk_Cellphone02
		reaction_state = dummy
		blend_period = 0.0}
	repeat
endscript

script AnimScript_DGenMBum_Fsitting 
	Interact_SceneInterruption type = noncritical response = ambient participate_until = ragdoll
	Interact_PlayAnimAndBlock {
		anim = PedMBum_DM_Fsitting
		reaction_state = floorsit
		blend_in_period = 0.4
		blend_out_period = 0
	}
	Interact_PlayAnimAndBlock {
		anim = PedMBum_DM_Fsitting01
		reaction_state = floorsit
		blend_period = 0.0
	}
	begin
	Interact_PlayAnimAndBlock {
		anim = PedMBum_DM_Fsitting
		reaction_state = floorsit
		blend_period = 0.0
	}
	Interact_PlayAnimAndBlock {
		anim = PedMBum_DM_Fsitting01
		reaction_state = floorsit
		blend_period = 0.0
	}
	repeat
endscript

script AnimScript_DGenMBum_Fsitting01 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = ragdoll}
	Interact_PlayAnimAndBlock \{anim = PedMBum_DM_Fsitting02
		reaction_state = floorsit02
		blend_in_period = 0.4
		blend_out_period = 0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedMBum_DM_Fsitting02
		reaction_state = floorsit02
		blend_period = 0.0}
	repeat
endscript

script AnimScript_DGenMBum_Lying 
	Interact_SceneInterruption type = noncritical response = ambient participate_until = ragdoll
	Interact_PlayAnimAndBlock {
		anim = PedMBum_DM_Lying
		reaction_state = floorlie
		blend_in_period = 0.4
		blend_out_period = 0
	}
	Interact_PlayAnimAndBlock {
		anim = PedMBum_DM_Lying01
		reaction_state = floorlie
		blend_period = 0.0
	}
	Interact_PlayAnimAndBlock {
		anim = PedMBum_DM_Lying02
		reaction_state = floorlie
		blend_period = 0.0
	}
	begin
	Interact_PlayAnimAndBlock {
		anim = PedMBum_DM_Lying
		reaction_state = floorlie
		blend_period = 0.0
	}
	Interact_PlayAnimAndBlock {
		anim = PedMBum_DM_Lying01
		reaction_state = floorlie
		blend_period = 0.0
	}
	Interact_PlayAnimAndBlock {
		anim = PedMBum_DM_Lying02
		reaction_state = floorlie
		blend_period = 0.0
	}
	repeat
endscript

script AnimScript_DGenMBum_Begging 
	Interact_SceneInterruption type = noncritical response = ambient participate_until = ragdoll
	Interact_PlayAnimAndBlock {
		anim = PedMBum_DM_Begging
		reaction_state = dummy
		blend_in_period = 0.4
		blend_out_period = 0
	}
	Interact_PlayAnimAndBlock {
		anim = PedMBum_DM_Begging01
		reaction_state = dummy
		blend_period = 0.0
	}
	begin
	Interact_PlayAnimAndBlock {
		anim = PedMBum_DM_Begging
		reaction_state = dummy
		blend_period = 0.0
	}
	Interact_PlayAnimAndBlock {
		anim = PedMBum_DM_Begging01
		reaction_state = dummy
		blend_period = 0.0
	}
	repeat
endscript

script AnimScript_DGenMBum_Harassed01 
	Interact_SceneInterruption \{type = critical
		response = custom
		participate_until = bumped}
	ai_giveorder \{name = AnimScript_DGenMBum_Harassed01_Interaction}
	blockuntilevent \{type = scene_interruption}
	ai_giveorder \{name = AnimScript_DGenMBum_Fsitting}
	block
endscript

script AnimScript_DGenMBum_Harassed01_Interaction 
	Interact_PlayAnimAndBlock {
		anim = PedMBum_DM_Harassed01_01
		reaction_state = floorlie
		blend_in_period = 0.4
		blend_out_period = 0
	}
	Interact_PlayAnimAndBlock {
		anim = PedMBum_DM_Harassed01_02
		reaction_state = floorlie
		blend_period = 0.0
	}
	Interact_PlayAnimAndBlock {
		anim = PedMBum_DM_Harassed01_03
		reaction_state = floorlie
		blend_period = 0.0
	}
	begin
	Interact_PlayAnimAndBlock {
		anim = PedMBum_DM_Harassed01_01
		reaction_state = floorlie
		blend_period = 0.0
	}
	Interact_PlayAnimAndBlock {
		anim = PedMBum_DM_Harassed01_02
		reaction_state = floorlie
		blend_period = 0.0
	}
	Interact_PlayAnimAndBlock {
		anim = PedMBum_DM_Harassed01_03
		reaction_state = floorlie
		blend_period = 0.0
	}
	repeat
endscript

script AnimScript_DGenMBum_Harassed02 
	Interact_SceneInterruption \{type = critical
		response = custom
		participate_until = bumped}
	ai_giveorder \{name = AnimScript_DGenMBum_Harassed02_Interaction}
	blockuntilevent \{type = scene_interruption}
	ai_giveorder \{name = AnimScript_DGenMBum_Fsitting}
	block
endscript

script AnimScript_DGenMBum_Harassed02_Interaction 
	Interact_PlayAnimAndBlock \{anim = PedMBum_DM_Harassed02_01
		reaction_state = floorsit
		blend_in_period = 0.4
		blend_out_period = 0}
	Interact_PlayAnimAndBlock \{anim = PedMBum_DM_Harassed02_02
		reaction_state = floorsit
		blend_period = 0.0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedMBum_DM_Harassed02_01
		reaction_state = floorsit
		blend_period = 0.0}
	Interact_PlayAnimAndBlock \{anim = PedMBum_DM_Harassed02_02
		reaction_state = floorsit
		blend_period = 0.0}
	repeat
endscript

script AnimScript_DGenMCop_HarassBum01 
	Interact_SceneInterruption type = critical response = ambient participate_until = bumped
	Interact_PlayAnimAndBlock {
		anim = PedMCop_DM_HarassBum01_01
		reaction_state = dummy
		blend_in_period = 0.4
		blend_out_period = 0
	}
	Interact_PlayAnimAndBlock {
		anim = PedMCop_DM_HarassBum01_02
		reaction_state = dummy
		blend_period = 0.0
	}
	Interact_PlayAnimAndBlock {
		anim = PedMCop_DM_HarassBum01_03
		reaction_state = dummy
		blend_period = 0.0
	}
	begin
	Interact_PlayAnimAndBlock {
		anim = PedMCop_DM_HarassBum01_01
		reaction_state = dummy
		blend_period = 0.0
	}
	Interact_PlayAnimAndBlock {
		anim = PedMCop_DM_HarassBum01_02
		reaction_state = dummy
		blend_period = 0.0
	}
	Interact_PlayAnimAndBlock {
		anim = PedMCop_DM_HarassBum01_03
		reaction_state = dummy
		blend_period = 0.0
	}
	repeat
endscript

script AnimScript_DGenMCop_HarassBum02 
	Interact_SceneInterruption type = critical response = ambient participate_until = bumped
	Interact_PlayAnimAndBlock {
		anim = PedMCop_DM_HarassBum02_01
		reaction_state = dummy
		blend_in_period = 0.4
		blend_out_period = 0
	}
	Interact_PlayAnimAndBlock {
		anim = PedMCop_DM_HarassBum02_02
		reaction_state = dummy
		blend_period = 0.0
	}
	begin
	Interact_PlayAnimAndBlock {
		anim = PedMCop_DM_HarassBum02_01
		reaction_state = dummy
		blend_period = 0.0
	}
	Interact_PlayAnimAndBlock {
		anim = PedMCop_DM_HarassBum02_02
		reaction_state = dummy
		blend_period = 0.0
	}
	repeat
endscript

script AnimScript_DPedMBucketPlayer 
	Interact_SceneInterruption \{type = critical
		response = ambient
		participate_until = ragdoll}
	begin
	Random (@ AnimScript_DPedMBucketPlayerAScript
		@ AnimScript_DPedMBucketPlayerBScript
		)
	repeat
endscript

script AnimScript_DPedMBucketPlayerAScript 
	Interact_PlayAnimAndBlock \{anim = PedmBucketPlayer_play
		reaction_state = benchsit
		blend_in_period = 0.4
		blend_out_period = 0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedmBucketPlayer_play
		reaction_state = benchsit
		blend_period = 0.0}
	repeat
endscript

script AnimScript_DPedMBucketPlayerBScript 
	Interact_PlayAnimAndBlock \{anim = PedmBucketPlayer_play01
		reaction_state = benchsit
		blend_in_period = 0.4
		blend_out_period = 0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedmBucketPlayer_play01
		reaction_state = benchsit
		blend_period = 0.0}
	repeat
endscript

script AnimScript_DPedMRobotDance 
	Interact_SceneInterruption type = critical response = ambient participate_until = ragdoll
	Interact_PlayAnimAndBlock {
		anim = PedM_DM_RobotDance_01
		reaction_state = dummy
		blend_in_period = 0.4
		blend_out_period = 0
	}
	Interact_PlayAnimAndBlock {
		anim = PedM_DM_RobotDance_02
		reaction_state = dummy
		blend_period = 0.0
	}
	begin
	Interact_PlayAnimAndBlock {
		anim = PedM_DM_RobotDance_01
		reaction_state = dummy
		blend_period = 0.0
	}
	Interact_PlayAnimAndBlock {
		anim = PedM_DM_RobotDance_02
		reaction_state = dummy
		blend_period = 0.0
	}
	repeat
endscript

script AnimScript_DPedMLookAtSign 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = bumped}
	Interact_PlayAnimAndBlock \{anim = PedM_DM_LookAtSign01
		reaction_state = dummy
		blend_in_period = 0.4
		blend_out_period = 0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_DM_LookAtSign01
		reaction_state = dummy
		blend_period = 0.0}
	repeat
endscript

script AnimScript_DPedMWorker_TalkA 
	Interact_SceneInterruption type = critical response = ambient participate_until = bumped
	Interact_PlayAnimAndBlock {
		anim = PedMWorker_Talk01
		reaction_state = dummy
		blend_in_period = 0.4
		blend_out_period = 0
	}
	Interact_PlayAnimAndBlock {
		anim = PedMWorker_Talk01_01
		reaction_state = dummy
		blend_period = 0.0
	}
	begin
	Interact_PlayAnimAndBlock {
		anim = PedMWorker_Talk01
		reaction_state = dummy
		blend_period = 0.0
	}
	Interact_PlayAnimAndBlock {
		anim = PedMWorker_Talk01_01
		reaction_state = dummy
		blend_period = 0.0
	}
	repeat
endscript

script AnimScript_DPedMWorker_TalkB 
	Interact_SceneInterruption type = critical response = ambient participate_until = bumped
	Interact_PlayAnimAndBlock {
		anim = PedMWorker_Talk02
		reaction_state = dummy
		blend_in_period = 0.4
		blend_out_period = 0
	}
	Interact_PlayAnimAndBlock {
		anim = PedMWorker_Talk02_01
		reaction_state = dummy
		blend_period = 0.0
	}
	begin
	Interact_PlayAnimAndBlock {
		anim = PedMWorker_Talk02
		reaction_state = dummy
		blend_period = 0.0
	}
	Interact_PlayAnimAndBlock {
		anim = PedMWorker_Talk02_01
		reaction_state = dummy
		blend_period = 0.0
	}
	repeat
endscript

script AnimScript_DPedMSpectator01 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = ragdoll}
	begin
	Random (@ AnimScript_DPedMSpectatorAScript
		@ AnimScript_DPedMSpectatorBScript
		)
	repeat
endscript

script AnimScript_DPedMSpectatorAScript 
	Interact_DummyEnablePush
	getrandomvalue \{name = random_start
		a = 0.0
		b = 0.3
		float}
	Interact_PlayAnimAndBlock \{anim = PedMSpectator_Cheer01
		reaction_state = dummy
		blend_in_period = 0.4
		blend_out_period = 0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedMSpectator_Cheer01
		reaction_state = dummy
		blend_in_period = 0.0
		blend_out_period = 0.0}
	repeat
endscript

script AnimScript_DPedMSpectatorBScript 
	Interact_DummyEnablePush
	getrandomvalue \{name = random_start
		a = 0.0
		b = 0.3
		float}
	Interact_PlayAnimAndBlock \{anim = PedMSpectator_Listen2Music01
		reaction_state = dummy
		blend_in_period = 0.4
		blend_out_period = 0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedMSpectator_Listen2Music01
		reaction_state = dummy
		blend_in_period = 0.0
		blend_out_period = 0.0}
	repeat
endscript

script AnimScript_DPedMSpectator02 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = ragdoll}
	begin
	Random (@ AnimScript_DPedMSpectatorCScript )

	repeat
endscript

script AnimScript_DPedMSpectatorCScript 
	Interact_DummyEnablePush
	getrandomvalue \{name = random_start
		a = 0.0
		b = 0.3
		float}
	Interact_PlayAnimAndBlock \{anim = PedMSpectator_Cheer02
		reaction_state = dummy
		blend_in_period = 0.4
		blend_out_period = 0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedMSpectator_Cheer02
		reaction_state = dummy
		blend_in_period = 0.0
		blend_out_period = 0.0}
	repeat
endscript

script AnimScript_DPedMSpectatorDScript 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = ragdoll}
	Interact_DummyEnablePush
	getrandomvalue \{name = random_start
		a = 0.0
		b = 0.3
		float}
	Interact_PlayAnimAndBlock \{anim = PedMSpectator_Listen2Music02
		reaction_state = dummy
		blend_in_period = 0.4
		blend_out_period = 0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedMSpectator_Listen2Music02
		reaction_state = dummy
		blend_in_period = 0.0
		blend_out_period = 0.0}
	repeat
endscript

script AnimScript_DPedMSpectator03 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = ragdoll}
	begin
	Random (
		@ AnimScript_DPedMSpectatorFScript )

	repeat
endscript

script AnimScript_DPedMSpectatorFScript 
	Interact_DummyEnablePush
	getrandomvalue \{name = random_start
		a = 0.0
		b = 0.3
		float}
	Interact_PlayAnimAndBlock \{anim = PedMSpectator_Listen2Music03
		reaction_state = dummy
		blend_in_period = 0.4
		blend_out_period = 0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedMSpectator_Listen2Music03
		reaction_state = dummy
		blend_in_period = 0.0
		blend_out_period = 0.0}
	repeat
endscript

script AnimScript_PedMSk9r_FlipTrick 
	Interact_SceneInterruption type = critical response = ambient participate_until = bumped
	Interact_MoveToAndBlock lock = false align = false movement_desc = {movement = walk_slow}
	Interact_PlayAnimAndBlock {
		anim = PedMSk8r_DM_FlipTrick
		reaction_state = skate
		blend_period = 0.4
		pause_movement = true
	}
	Interact_PlayAnimAndBlock {
		anim = PedMSk8r_DM_FlipTrick_02
		reaction_state = skate
		blend_period = 0.0
		pause_movement = true
	}
	Interact_PlayAnimAndBlock {
		anim = PedMSk8r_DM_FlipTrick_02
		reaction_state = skate
		blend_period = 0.0
		pause_movement = true
	}
	begin
	Interact_PlayAnimAndBlock {
		anim = PedMSk8r_DM_FlipTrick
		reaction_state = skate
		blend_period = 0.0
		pause_movement = true
	}
	Interact_PlayAnimAndBlock {
		anim = PedMSk8r_DM_FlipTrick_02
		reaction_state = skate
		blend_period = 0.0
		pause_movement = true
	}
	Interact_PlayAnimAndBlock {
		anim = PedMSk8r_DM_FlipTrick_02
		reaction_state = skate
		blend_period = 0.0
		pause_movement = true
	}
	repeat
endscript

script AnimScript_PedMSk9r_FlipTrick01 
	Interact_SceneInterruption type = critical response = ambient participate_until = bumped
	Interact_MoveToAndBlock lock = false align = false movement_desc = {movement = walk_slow}
	Interact_PlayAnimAndBlock {
		anim = PedMSk8r_DM_FlipTrick01
		reaction_state = skate
		blend_period = 0.4
		pause_movement = true
	}
	Interact_PlayAnimAndBlock {
		anim = PedMSk8r_DM_FlipTrick01_01
		reaction_state = skate
		blend_period = 0.0
		pause_movement = true
	}
	Interact_PlayAnimAndBlock {
		anim = PedMSk8r_DM_FlipTrick01_01
		reaction_state = skate
		blend_period = 0.0
		pause_movement = true
	}
	Interact_PlayAnimAndBlock {
		anim = PedMSk8r_DM_FlipTrick01_03
		reaction_state = skate
		blend_period = 0.0
		pause_movement = true
	}
	begin
	Interact_PlayAnimAndBlock {
		anim = PedMSk8r_DM_FlipTrick01
		reaction_state = skate
		blend_period = 0.0
		pause_movement = true
	}
	Interact_PlayAnimAndBlock {
		anim = PedMSk8r_DM_FlipTrick01_01
		reaction_state = skate
		blend_period = 0.0
		pause_movement = true
	}
	Interact_PlayAnimAndBlock {
		anim = PedMSk8r_DM_FlipTrick01_01
		reaction_state = skate
		blend_period = 0.0
		pause_movement = true
	}
	Interact_PlayAnimAndBlock {
		anim = PedMSk8r_DM_FlipTrick01_03
		reaction_state = skate
		blend_period = 0.0
		pause_movement = true
	}
	repeat
endscript

script AnimScript_PedMTourist_TakePic 
	Interact_SceneInterruption type = critical response = ambient participate_until = bumped
	Interact_PlayAnimAndBlock {
		anim = PedMTourist_TakePic
		reaction_state = dummy
		blend_in_period = 0.4
		blend_out_period = 0
	}
	Interact_PlayAnimAndBlock {
		anim = PedMTourist_TakePic_01
		reaction_state = dummy
		blend_period = 0.0
	}
	begin
	Interact_PlayAnimAndBlock {
		anim = PedMTourist_TakePic
		reaction_state = dummy
		blend_period = 0.0
	}
	Interact_PlayAnimAndBlock {
		anim = PedMTourist_TakePic_01
		reaction_state = dummy
		blend_period = 0.0
	}
	repeat
endscript

script AnimScript_PedMTourist_PicPose 
	Interact_SceneInterruption type = critical response = ambient participate_until = bumped
	Interact_PlayAnimAndBlock {
		anim = PedMTourist_PicPose
		reaction_state = dummy
		blend_in_period = 0.4
		blend_out_period = 0
	}
	Interact_PlayAnimAndBlock {
		anim = PedMTourist_PicPose_01
		reaction_state = dummy
		blend_period = 0.0
	}
	begin
	Interact_PlayAnimAndBlock {
		anim = PedMTourist_PicPose
		reaction_state = dummy
		blend_period = 0.0
	}
	Interact_PlayAnimAndBlock {
		anim = PedMTourist_PicPose_01
		reaction_state = dummy
		blend_period = 0.0
	}
	repeat
endscript

script AnimScript_PedMPolice_AccidentReport 
	Interact_SceneInterruption \{type = critical
		response = ambient
		participate_until = bumped}
	Interact_PlayAnimAndBlock \{anim = PedMPolice_DM_AccidentReport_F
		reaction_state = dummy
		blend_in_period = 0.4
		blend_out_period = 0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedMPolice_DM_AccidentReport_F
		reaction_state = dummy
		blend_period = 0.0}
	repeat
endscript

script AnimScript_PedM_DM_Accident 
	Interact_SceneInterruption \{type = critical
		response = ambient
		participate_until = ragdoll}
	Interact_PlayAnimAndBlock \{anim = PedM_DM_Accident_F
		reaction_state = benchsit
		blend_in_period = 0.4
		blend_out_period = 0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_DM_Accident_F
		reaction_state = benchsit
		blend_period = 0.0}
	repeat
endscript

script AnimScript_PedMPolice_DrunkTest 
	Interact_SceneInterruption \{type = critical
		response = custom
		participate_until = bumped}
	ai_giveorder \{name = AnimScript_PedMPolice_Interact}
	blockuntilevent \{type = scene_interruption}
	ai_giveorder \{name = AnimScript_PedMPolice_Interrupt}
	block
endscript

script AnimScript_PedMPolice_Interact 
	Interact_PlayAnimAndBlock \{anim = PedMPolice_DM_DrunkTest_F
		reaction_state = dummy
		blend_in_period = 0.4
		blend_out_period = 0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedMPolice_DM_DrunkTest_F
		reaction_state = dummy
		blend_period = 0.0}
	repeat
endscript

script AnimScript_PedMPolice_Interrupt 
	Interact_PlayAnimAndBlock \{anim = PedM_ClosedZones01_F
		reaction_state = dummy
		blend_in_period = 0.4
		blend_out_period = 0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_ClosedZones01_F
		reaction_state = dummy
		blend_period = 0.0}
	repeat
endscript

script AnimScript_PedM_DM_DrunkTest 
	Interact_SceneInterruption \{type = critical
		response = ambient
		participate_until = bumped}
	Interact_PlayAnimAndBlock \{anim = PedM_DM_DrunkTest_F
		reaction_state = dummy
		blend_in_period = 0.4
		blend_out_period = 0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_DM_DrunkTest_F
		reaction_state = dummy
		blend_period = 0.0}
	repeat
endscript

script AnimScript_PedM_DM_WallLean 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = bumped}
	begin
	Random (@ AnimScript_PedM_DM_WallLeanScript
		@ AnimScript_PedM_DM_WallLean01Script
		)
	repeat
endscript

script AnimScript_PedM_DM_WallLeanScript 
	Interact_PlayAnimAndBlock \{anim = PedM_DM_Lean_Idle01
		reaction_state = walllean
		blend_in_period = 0.4
		blend_out_period = 0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_DM_Lean_Idle01
		reaction_state = walllean
		blend_period = 0.0}
	repeat
endscript

script AnimScript_PedM_DM_WallLean01Script 
	Interact_PlayAnimAndBlock \{anim = PedM_DM_Lean_Idle01_01
		reaction_state = walllean
		blend_in_period = 0.4
		blend_out_period = 0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_DM_Lean_Idle01_01
		reaction_state = walllean
		blend_period = 0.0}
	repeat
endscript

script AnimScript_PedMGuard_StealingDeck 
	Interact_SceneInterruption \{type = critical
		response = ambient
		participate_until = bumped}
	Interact_PlayAnimAndBlock \{anim = PedMGuard_StealingDeck01
		reaction_state = skate
		blend_in_period = 0.4
		blend_out_period = 0
		pause_movement = true}
	begin
	Interact_PlayAnimAndBlock \{anim = PedMGuard_StealingDeck01
		reaction_state = skate
		blend_period = 0.0
		pause_movement = true}
	repeat
endscript

script AnimScript_PedMPunk_StealingDeck 
	Interact_SceneInterruption \{type = critical
		response = ambient
		participate_until = bumped}
	Interact_PlayAnimAndBlock \{anim = PedMPunk_StealingDeck01
		reaction_state = dummy
		blend_in_period = 0.4
		blend_out_period = 0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedMPunk_StealingDeck01
		reaction_state = dummy
		blend_period = 0.0}
	repeat
endscript

script AnimScript_PedM_DM_ThrowingCoins02 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = bumped}
	Interact_PlayAnimAndBlock \{anim = PedM_DM_ThrowingCoins02
		blend_in_period = 0.4
		blend_out_period = 0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_DM_ThrowingCoins02
		reaction_state = dummy
		blend_period = 0.0}
	repeat
endscript

script AnimScript_PedM_LookAtOcean01 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = bumped}
	Interact_PlayAnimAndBlock \{anim = PedM_LookAtOcean01
		reaction_state = dummy
		blend_in_period = 0.4
		blend_out_period = 0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_LookAtOcean01
		reaction_state = dummy
		blend_period = 0.0}
	repeat
endscript

script AnimScript_PedM_LookAtOcean02 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = bumped}
	Interact_PlayAnimAndBlock \{anim = PedM_LookAtOcean02
		reaction_state = dummy
		blend_in_period = 0.4
		blend_out_period = 0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_LookAtOcean02
		reaction_state = dummy
		blend_period = 0.0}
	repeat
endscript

script AnimScript_PedM_PlayPushingIn2Water01_01 
	Interact_SceneInterruption \{type = critical
		response = ambient
		participate_until = bumped}
	Interact_PlayAnimAndBlock \{anim = PedM_PlayPushingIn2Water01_01
		reaction_state = dummy
		blend_in_period = 0.4
		blend_out_period = 0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_PlayPushingIn2Water01_01
		reaction_state = dummy
		blend_period = 0.0}
	repeat
endscript

script AnimScript_PedM_PlayPushingIn2Water01_02 
	Interact_SceneInterruption \{type = critical
		response = ambient
		participate_until = bumped}
	Interact_PlayAnimAndBlock \{anim = PedM_PlayPushingIn2Water01_02
		reaction_state = dummy
		blend_in_period = 0.4
		blend_out_period = 0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_PlayPushingIn2Water01_02
		reaction_state = dummy
		blend_period = 0.0}
	repeat
endscript

script AnimScript_PedM_PlayPushingIn2Water02_01 
	Interact_SceneInterruption \{type = critical
		response = ambient
		participate_until = bumped}
	Interact_PlayAnimAndBlock \{anim = PedM_PlayPushingIn2Water02_01
		reaction_state = dummy
		blend_in_period = 0.4
		blend_out_period = 0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_PlayPushingIn2Water02_01
		reaction_state = dummy
		blend_period = 0.0}
	repeat
endscript

script AnimScript_PedM_PlayPushingIn2Water02_02 
	Interact_SceneInterruption \{type = critical
		response = ambient
		participate_until = bumped}
	Interact_PlayAnimAndBlock \{anim = PedM_PlayPushingIn2Water02_02
		reaction_state = dummy
		blend_in_period = 0.4
		blend_out_period = 0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_PlayPushingIn2Water02_02
		reaction_state = dummy
		blend_period = 0.0}
	repeat
endscript

script AnimScript_PedMCop_DM_CSI_A 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = ragdoll}
	Interact_PlayAnimAndBlock \{anim = PedMCop_DM_CSI_A
		reaction_state = dummy
		blend_in_period = 0.4
		blend_out_period = 0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedMCop_DM_CSI_A
		reaction_state = dummy
		blend_period = 0.0}
	repeat
endscript

script AnimScript_PedMCop_DM_CSI_B 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = ragdoll}
	Interact_PlayAnimAndBlock \{anim = PedMCop_DM_CSI_B
		reaction_state = dummy
		blend_in_period = 0.4
		blend_out_period = 0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedMCop_DM_CSI_B
		reaction_state = dummy
		blend_period = 0.0}
	repeat
endscript

script AnimScript_PedM_DM_HorrorLook01 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = ragdoll}
	Interact_PlayAnimAndBlock \{anim = PedM_DM_HorrorLook01
		reaction_state = dummy
		blend_in_period = 0.4
		blend_out_period = 0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_DM_HorrorLook01
		reaction_state = dummy
		blend_period = 0.0}
	repeat
endscript

script AnimScript_PedM_DM_HorrorLook02a 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = ragdoll}
	Interact_PlayAnimAndBlock \{anim = PedM_DM_HorrorLook02a
		reaction_state = dummy
		blend_in_period = 0.4
		blend_out_period = 0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_DM_HorrorLook02a
		reaction_state = dummy
		blend_period = 0.0}
	repeat
endscript

script AnimScript_PedM_DM_HorrorLook02b 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = ragdoll}
	Interact_PlayAnimAndBlock \{anim = PedM_DM_HorrorLook02b
		reaction_state = dummy
		blend_in_period = 0.4
		blend_out_period = 0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_DM_HorrorLook02b
		reaction_state = dummy
		blend_period = 0.0}
	repeat
endscript

script AnimScript_PedM_DM_TwitchingBody 
	Interact_SceneInterruption \{type = critical
		response = ambient
		participate_until = ragdoll}
	Interact_PlayAnimAndBlock \{anim = PedM_DM_TwitchingBody
		reaction_state = floorlie
		blend_in_period = 0.4
		blend_out_period = 0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_DM_TwitchingBody
		reaction_state = floorlie
		blend_period = 0.0}
	repeat
endscript

script AnimScript_PedMCop_DM_Arresting01 
	Interact_SceneInterruption \{type = critical
		response = ambient
		participate_until = ragdoll}
	Interact_PlayAnimAndBlock \{anim = PedMCop_DM_Arresting01
		reaction_state = dummy
		blend_in_period = 0.4
		blend_out_period = 0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedMCop_DM_Arresting01
		reaction_state = dummy
		blend_period = 0.0}
	repeat
endscript

script AnimScript_PedMGang_DM_Arrested01 
	Interact_SceneInterruption \{type = critical
		response = ambient
		participate_until = ragdoll}
	Interact_PlayAnimAndBlock \{anim = PedMGang_DM_Arrested01
		reaction_state = frontlean
		blend_in_period = 0.4
		blend_out_period = 0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedMGang_DM_Arrested01
		reaction_state = frontlean
		blend_period = 0.0}
	repeat
endscript

script AnimScript_PedM_DM_CarJack01 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = bumped}
	Interact_PlayAnimAndBlock \{anim = PedM_DM_CarJack01
		reaction_state = dummy
		blend_in_period = 0.4
		blend_out_period = 0}
	begin
	Interact_PlayAnimAndBlock \{anim = PedM_DM_CarJack01
		reaction_state = dummy
		blend_period = 0.0}
	repeat
endscript

script AnimScript_CopIdles00 
	Interact_MoveToAndBlock lock = false align = true movement_desc = {movement = walk_slow}
	Interact_PlayAnimAndBlock {
		anim = PedMCop_Idle_F
		reaction_state = transition
		blend_period = 0.2
		exit_anim = PedMCop_Idle_F}
	Interact_PlayWeightedAnimAndBlock {
		weighted_anims = [
			{weight = 1
				anim = PedMCop_Idle_01_F
				reaction_state = normal
				blend_period = 0.2
				exit_anim = PedMCop_Idle_F
			}
			{weight = 1
				anim = PedMCop_Idle_02_F
				reaction_state = normal
				blend_period = 0.2
				exit_anim = PedMCop_Idle_F
			}
			{weight = 1
				anim = PedMCop_Idle_04_F
				reaction_state = normal
				blend_period = 0.2
				exit_anim = PedMCop_Idle_F
			}
			{weight = 1
				anim = PedMCop_Idle_F
				reaction_state = normal
				blend_period = 0.2
				exit_anim = PedMCop_Idle_F
			}]
		num_repeats = 1
	}
	Interact_PlayAnimAndBlock {
		anim = PedMCop_Idle_F
		reaction_state = normal
		blend_period = 0.2
		reaction_state = normal}
endscript

script AnimScript_Sk8rIdle01 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = bumped}
	Interact_MoveToAndBlock \{lock = true
		align = true
		movement_desc = {
			movement = walk_slow
		}}
	begin
	Interact_PlayAnimAndBlock \{anim = PedMSk8r_01_Idle01
		reaction_state = skate
		blend_period = 0.0}
	repeat
endscript

script AnimScript_Sk8rIdle02 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = bumped}
	Interact_MoveToAndBlock \{lock = true
		align = true
		movement_desc = {
			movement = walk_slow
		}}
	begin
	Interact_PlayAnimAndBlock \{anim = PedMSk8r_02_Idle01
		reaction_state = skate
		blend_period = 0.0}
	repeat
endscript

script AnimScript_Sk8rIdle03 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = bumped}
	Interact_MoveToAndBlock \{lock = true
		align = true
		movement_desc = {
			movement = walk_slow
		}}
	begin
	Interact_PlayAnimAndBlock \{anim = PedMSk8r_FL_Idle01a
		reaction_state = skate
		blend_period = 0.0}
	repeat
endscript

script AnimScript_Sk8Idle01DP 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = bumped}
	Interact_MoveToAndBlock \{lock = false
		align = false
		movement_desc = {
			movement = walk_slow
		}}
	AnimScript_Sk8Idle01DPScript
endscript

script AnimScript_Sk8Idle01DPScript 
	begin
	Interact_PlayWeightedAnimAndBlock {
		weighted_anims = [
			{weight = 3
				anim = PedMSk8r_DP_Idle01a
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}
			{weight = 2
				anim = PedMSk8r_DP_Idle01b
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}
			{weight = 2
				anim = PedMSk8r_DP_Idle01c
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}
			{weight = 1
				anim = PedMSk8r_DP_Idle01d
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}]
		num_repeats = 1
	}
	repeat
endscript

script AnimScript_Sk8Idle01CtrlIdle 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = bumped}
	Interact_MoveToAndBlock \{lock = false
		align = true
		movement_desc = {
			movement = walk_slow
		}}
	AnimScript_Sk8Idle01CtrlIdleScript
endscript

script AnimScript_Sk8Idle01CtrlIdleScript 
	begin
	Interact_PlayWeightedAnimAndBlock {
		weighted_anims = [
			{weight = 4
				anim = PedMSk8r_DP_Idle01a
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}
			{weight = 3
				anim = PedMSk8r_DP_Idle01b
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}
			{weight = 3
				anim = PedMSk8r_DP_Idle01c
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}
			{weight = 1
				anim = PedMSk8r_DP_Idle01d
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}
		]
		num_repeats = 1
	}
	repeat
endscript

script AnimScript_Sk8Tricks01DP 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = bumped}
	Interact_MoveToAndBlock \{lock = false
		align = true
		movement_desc = {
			movement = walk_slow
		}}
	AnimScript_Sk8Tricks01DPScript
endscript

script AnimScript_Sk8Tricks01DPScript 
	Interact_PlayWeightedAnimAndBlock {
		weighted_anims = [
			{weight = 4
				anim = PedMSk8r_FL_Trick01
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}
			{weight = 3
				anim = PedMSk8r_FL_Trick02
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}
			{weight = 3
				anim = PedMSk8r_FL_Trick03
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}
			{weight = 1
				anim = PedMSk8r_FL_Trick04
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}]
		num_repeats = 5
	}
endscript

script AnimScript_Sk8Tricks02DP 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = bumped}
	Interact_MoveToAndBlock \{lock = false
		align = true
		movement_desc = {
			movement = walk_slow
		}}
	AnimScript_Sk8Tricks02DPScript
endscript

script AnimScript_Sk8Tricks02DPScript 
	begin
	Interact_PlayWeightedAnimAndBlock {
		weighted_anims = [
			{weight = 4
				anim = PedMSk8r_FL_Trick00
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}
			{weight = 3
				anim = PedMSk8r_FL_Trick01
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}
			{weight = 3
				anim = PedMSk8r_FL_Trick02
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}
			{weight = 3
				anim = PedMSk8r_FL_Trick03
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}
			{weight = 3
				anim = PedMSk8r_FL_Trick04
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}
			{weight = 3
				anim = PedMSk8r_FL_Trick05
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}
			{weight = 1
				anim = PedMSk8r_FL_Trick06
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}]
		num_repeats = 5
	}
	repeat
endscript

script AnimScript_Sk8Tricks03DP 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = bumped}
	Interact_MoveToAndBlock \{lock = false
		align = true
		movement_desc = {
			movement = walk_slow
		}}
	AnimScript_Sk8Tricks01DPScript
endscript

script AnimScript_Sk8Tricks03DPScript 
	Interact_PlayWeightedAnimAndBlock {
		weighted_anims = [
			{weight = 4
				anim = PedMSk8r_FL_Trick01
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}
			{weight = 3
				anim = PedMSk8r_FL_Trick02
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}
			{weight = 3
				anim = PedMSk8r_FL_Trick03
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}
			{weight = 1
				anim = PedMSk8r_FL_Trick04
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}]
		num_repeats = 2
	}
endscript

script AnimScript_Sk8Tricks00DP 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = bumped}
	Interact_MoveToAndBlock \{lock = false
		align = true
		movement_desc = {
			movement = walk_slow
		}}
	AnimScript_Sk8Tricks02DPScript
endscript

script AnimScript_Sk8Tricks00DPScript 
	Interact_PlayWeightedAnimAndBlock \{weighted_anims = [
			{
				weight = 1
				anim = PedMSk8r_FL_Idle01a
				reaction_state = skate
				blend_period = 0.2
				pause_movement = true
			}
		]
		num_repeats = 5}
endscript

script AnimScript_Sk8TricksA 
	Interact_SceneInterruption type = noncritical response = ambient participate_until = bumped
	Interact_MoveToAndBlock lock = false align = true movement_desc = {movement = walk_slow}
	begin
	Interact_PlayAnimAndBlock {
		anim = PedMSk8r_FL_Idle01a
		reaction_state = skate
		blend_period = 0.0
		pause_movement = true}
	Interact_PlayAnimAndBlock {
		anim = PedMSk8r_FL_Idle01aToFLIdle
		reaction_state = skate
		blend_period = 0.0
		pause_movement = true}
	AnimScript_Sk8Tricks01DPScript
	Interact_PlayAnimAndBlock {
		anim = PedMSk8r_FL_FLIdleToIdle01a
		reaction_state = skate
		blend_period = 0.0
		pause_movement = true}
	repeat
endscript

script AnimScript_Sk8TricksB 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = bumped}
	Interact_MoveToAndBlock \{lock = false
		align = true
		movement_desc = {
			movement = walk_slow
		}}
	begin
	AnimScript_Sk8Tricks00DPScript
	Interact_PlayAnimAndBlock \{anim = PedMSk8r_FL_Idle01aToFLIdle
		reaction_state = skate
		blend_period = 0.0
		pause_movement = true}
	AnimScript_Sk8Tricks03DPScript
	Interact_PlayAnimAndBlock \{anim = PedMSk8r_FL_FLIdleToIdle01a
		reaction_state = skate
		blend_period = 0.0
		pause_movement = true}
	repeat
endscript

script AnimScript_Sk8rSession01 
	Interact_SceneInterruption type = noncritical response = ambient participate_until = bumped
	Interact_MoveToAndBlock lock = arrival_only align = true path_segment = true movement_desc = {movement = walk_slow}
	Interact_PlayWeightedAnimAndBlock {
		weighted_anims = [
			{weight = 5
				anim = PedMSk8r_Session01a
				reaction_state = skate
				blend_period = 0.2
				pause_movement = true
			}
			{weight = 5
				anim = PedMSk8r_Session01b
				reaction_state = skate
				blend_period = 0.2
				pause_movement = true
			}
			{weight = 5
				anim = PedMSk8r_Session01c
				reaction_state = skate
				blend_period = 0.2
				pause_movement = true
			}
			{weight = 5
				anim = PedMSk8r_Session01d
				reaction_state = skate
				blend_period = 0.2
				pause_movement = true
			}
			{weight = 5
				anim = PedMSk8r_Session01e
				reaction_state = skate
				blend_period = 0.2
				pause_movement = true
			}
			{weight = 1
				anim = PedMSk8r_Session01f
				reaction_state = skate
				blend_period = 0.2
				pause_movement = true
			}]
		num_repeats = 1
	}
endscript

script AnimScript_Sk8rSession01Idle 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = bumped}
	Interact_MoveToAndBlock \{lock = false
		align = true
		movement_desc = {
			movement = walk_slow
		}}
	AnimScript_Sk8rSession01IdleScript
endscript

script AnimScript_Sk8rSession01IdleScript 
	Interact_PlayAnimAndBlock \{anim = PedMSk8r_Session01Idle
		reaction_state = skate
		blend_period = 0.0
		pause_movement = true}
endscript

script AnimScript_Sk8rSession01Loop 
	Interact_SceneInterruption type = noncritical response = ambient participate_until = bumped
	Interact_MoveToAndBlock lock = arrival_only align = true path_segment = true movement_desc = {movement = walk_slow}
	Interact_PlayWeightedAnimAndBlock {
		weighted_anims = [
			{weight = 5
				anim = PedMSk8r_Session01a
				reaction_state = skate
				blend_period = 0.2
				pause_movement = true
			}
			{weight = 5
				anim = PedMSk8r_Session01b
				reaction_state = skate
				blend_period = 0.2
				pause_movement = true
			}
			{weight = 5
				anim = PedMSk8r_Session01c
				reaction_state = skate
				blend_period = 0.2
				pause_movement = true
			}
			{weight = 5
				anim = PedMSk8r_Session01d
				reaction_state = skate
				blend_period = 0.2
				pause_movement = true
			}
			{weight = 5
				anim = PedMSk8r_Session01e
				reaction_state = skate
				blend_period = 0.2
				pause_movement = true
			}
			{weight = 1
				anim = PedMSk8r_Session01f
				reaction_state = skate
				blend_period = 0.2
				pause_movement = true
			}]
		num_repeats = 1
	}
endscript

script AnimScript_Sk8rSession03Loop 
	Interact_SceneInterruption type = noncritical response = ambient participate_until = bumped
	Interact_MoveToAndBlock lock = arrival_only align = true path_segment = true movement_desc = {movement = walk_slow}
	Interact_EnterSkaterScene
	onexitrun Interact_ExitSkaterScene
	begin
	Interact_PlayWeightedAnimAndBlock {
		weighted_anims = [
			{weight = 5
				anim = PedMSk8r_03_Session01
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}
			{weight = 5
				anim = PedMSk8r_03_Session02
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}
			{weight = 5
				anim = PedMSk8r_03_Session03
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}]
		num_repeats = 1
	}
	repeat
endscript

script AnimScript_Sk8rSession04Loop 
	Interact_SceneInterruption type = noncritical response = ambient participate_until = bumped
	Interact_MoveToAndBlock lock = arrival_only align = true path_segment = true movement_desc = {movement = walk_slow}
	Interact_EnterSkaterScene
	onexitrun Interact_ExitSkaterScene
	Interact_PlayWeightedAnimAndBlock {
		weighted_anims = [
			{weight = 5
				anim = PedMSk8r_04_Session01
				reaction_state = skate
				blend_period = 0.2
				pause_movement = true
			}
			{weight = 5
				anim = PedMSk8r_04_Session02
				reaction_state = skate
				blend_period = 0.2
				pause_movement = true
			}]
		num_repeats = 1
	}
	Interact_PlayAnimAndBlock {
		anim = PedMSk8r_04_Idle01ToIdle02
		reaction_state = skate
		blend_period = 0.5
		pause_movement = true}
	Interact_PlayAnimAndBlock {
		anim = PedMSk8r_04_Session03
		reaction_state = skate
		blend_period = 0.5
		pause_movement = true}
	Interact_PlayAnimAndBlock {
		anim = PedMSk8r_04_Idle02ToIdle01
		reaction_state = skate
		blend_period = 0.5
		pause_movement = true}
	Interact_PlayWeightedAnimAndBlock {
		weighted_anims = [
			{weight = 5
				anim = PedMSk8r_04_Session01
				reaction_state = skate
				blend_period = 0.2
				pause_movement = true
			}
			{weight = 5
				anim = PedMSk8r_04_Session02
				reaction_state = skate
				blend_period = 0.2
				pause_movement = true
			}]
		num_repeats = 2
	}
endscript

script AnimScript_Session02Full 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = bumped}
	Interact_MoveToAndBlock \{lock = false
		align = true
		movement_desc = {
			movement = walk_slow
		}}
	Random (@*3 AnimScript_Sk8rSession02Trick00Script
		@*3 AnimScript_Sk8rSession02Tricks
		@*7 AnimScript_Sk8rSession02Tricks
		)
endscript

script AnimScript_Sk8rSession02Trick00 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = bumped}
	Interact_MoveToAndBlock \{lock = false
		align = true
		movement_desc = {
			movement = walk_slow
		}}
	AnimScript_Sk8rSession02Trick00Script
endscript

script AnimScript_Sk8rSession02Trick00Script 
	Interact_PlayAnimAndBlock \{anim = PedMSk8r_Session02_Start
		reaction_state = skate
		blend_period = 0.4
		pause_movement = true}
	Interact_PlayAnimAndBlock \{anim = PedMSk8r_Session02_Trick00
		reaction_state = skate
		blend_period = 0.4
		pause_movement = true}
endscript

script AnimScript_Sk8rSessionNewTricks 
	Interact_PlayAnimAndBlock {
		anim = PedMSk8r_TurnAround03
		reaction_state = skate
		blend_period = 0.5
		pause_movement = true}
	Interact_PlayWeightedAnimAndBlock {
		weighted_anims = [
			{weight = 10
				anim = PedMSk8r_Session02_Trick01
				reaction_state = skate
				blend_period = 0.5
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick02
				reaction_state = skate
				blend_period = 0.5
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick03
				reaction_state = skate
				blend_period = 0.5
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick04
				reaction_state = skate
				blend_period = 0.5
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick05
				reaction_state = skate
				blend_period = 0.5
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick06
				reaction_state = skate
				blend_period = 0.5
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick07
				reaction_state = skate
				blend_period = 0.5
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick08
				reaction_state = skate
				blend_period = 0.5
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick09
				reaction_state = skate
				blend_period = 0.5
				pause_movement = true
			}
		]
		num_repeats = 1
	}
	Interact_PlayAnimAndBlock {
		anim = PedMSk8r_TurnAround05
		reaction_state = skate
		blend_period = 0.5
		pause_movement = true}
endscript

script AnimScript_Sk8rSession02Tricks 
	begin
	Interact_PlayAnimAndBlock {
		anim = PedMSk8r_Session02_Start
		reaction_state = skate
		blend_period = 0.0
		pause_movement = true}
	Interact_PlayWeightedAnimAndBlock {
		weighted_anims = [
			{weight = 10
				anim = PedMSk8r_Session02_Trick01
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick02
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick03
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick04
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}
			{weight = 3
				anim = PedMSk8r_Session02_Trick05
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}
			{weight = 3
				anim = PedMSk8r_Session02_Trick06
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}
			{weight = 3
				anim = PedMSk8r_Session02_Trick07
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}
			{weight = 6
				anim = PedMSk8r_Session02_Trick08
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}
			{weight = 7
				anim = PedMSk8r_Session02_Trick09
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}
		]
		num_repeats = 1
	}
	Interact_PlayAnimAndBlock {
		anim = PedMSk8r_Session02_End
		reaction_state = skate
		blend_period = 0.0
		pause_movement = true}
	repeat
endscript

script AnimScript_ASFlatland01 
	Interact_SceneInterruption type = noncritical response = ambient participate_until = bumped
	Interact_MoveToAndBlock lock = arrival_only align = true path_segment = true movement_desc = {movement = walk_slow}
	Interact_PlayAnimAndBlock {
		anim = PedMSk8r_FL_Sk8ToFL
		reaction_state = skate
		blend_period = 0.4
		pause_movement = true}
	Interact_PlayWeightedAnimAndBlock {
		weighted_anims = [
			{weight = 4
				anim = PedMSk8r_FL_Trick00
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}
			{weight = 3
				anim = PedMSk8r_FL_Trick01
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}
			{weight = 3
				anim = PedMSk8r_FL_Trick02
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}
			{weight = 3
				anim = PedMSk8r_FL_Trick03
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}
			{weight = 3
				anim = PedMSk8r_FL_Trick04
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}
			{weight = 3
				anim = PedMSk8r_FL_Trick05
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}
			{weight = 1
				anim = PedMSk8r_FL_Trick06
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}]
		num_repeats = 1
	}
	Interact_PlayAnimAndBlock {
		anim = PedMSk8r_FL_FLIdleToIdle01a
		reaction_state = skate
		blend_period = 0.0
		pause_movement = true}
	Interact_PlayAnimAndBlock {
		anim = PedMSk8r_FL_Idle01a
		reaction_state = skate
		blend_period = 0.0
		pause_movement = true}
	Interact_PlayAnimAndBlock {
		anim = PedMSk8r_FL_Idle01aToFLIdle
		reaction_state = skate
		blend_period = 0.0
		pause_movement = true}
	Interact_PlayAnimAndBlock {
		anim = PedMSk8r_FL_FLToSk8
		reaction_state = skate
		blend_period = 0.4
		pause_movement = true}
endscript

script AnimScript_ASFlatland02 
	Interact_SceneInterruption type = noncritical response = ambient participate_until = bumped
	Interact_MoveToAndBlock lock = arrival_only align = true path_segment = true movement_desc = {movement = walk_slow}
	Interact_PlayAnimAndBlock {
		anim = PedMSk8r_FL_Sk8ToFL
		reaction_state = skate
		blend_period = 0.4
		pause_movement = true}
	Interact_PlayWeightedAnimAndBlock {
		weighted_anims = [
			{weight = 4
				anim = PedMSk8r_FL_Trick00
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}
			{weight = 3
				anim = PedMSk8r_FL_Trick01
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}
			{weight = 3
				anim = PedMSk8r_FL_Trick02
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}
			{weight = 3
				anim = PedMSk8r_FL_Trick03
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}
			{weight = 3
				anim = PedMSk8r_FL_Trick04
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}
			{weight = 3
				anim = PedMSk8r_FL_Trick05
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}
			{weight = 1
				anim = PedMSk8r_FL_Trick06
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}]
		num_repeats = 1
	}
	Interact_PlayAnimAndBlock {
		anim = PedMSk8r_FL_FLToSk8
		reaction_state = skate
		blend_period = 0.4
		pause_movement = true}
endscript

script AnimScript_ASFlatLandTurnAround 
	Interact_SceneInterruption type = noncritical response = ambient participate_until = bumped
	Interact_MoveToAndBlock lock = arrival_only align = true path_segment = true movement_desc = {movement = walk_slow}
	Interact_PlayAnimAndBlock {
		anim = PedMSk8r_FL_Sk8ToFL
		reaction_state = skate
		blend_period = 0.4
		pause_movement = true}
	Interact_PlayWeightedAnimAndBlock {
		weighted_anims = [
			{weight = 4
				anim = PedMSk8r_FL_Trick00
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}
			{weight = 3
				anim = PedMSk8r_FL_Trick01
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}
			{weight = 3
				anim = PedMSk8r_FL_Trick02
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}
			{weight = 3
				anim = PedMSk8r_FL_Trick03
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}
			{weight = 3
				anim = PedMSk8r_FL_Trick04
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}
			{weight = 3
				anim = PedMSk8r_FL_Trick05
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}
			{weight = 1
				anim = PedMSk8r_FL_Trick06
				reaction_state = skate
				blend_period = 0.0
				pause_movement = true
			}]
		num_repeats = 2
	}
	Interact_PlayAnimAndBlock {
		anim = PedMSk8r_FL_FLToSk8
		reaction_state = skate
		blend_period = 0.0
		pause_movement = true}
	Interact_PlayAnimAndBlock {
		anim = PedMSk8r_TurnAround01
		reaction_state = skate
		blend_period = 0.4
		pause_movement = true}
endscript

script AnimScript_MainFlatlandTricks 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = bumped}
	Random (@*3 AnimScript_ASFlatlandTricks01
		@*3 AnimScript_ASFlatlandTricks02
		@*7 AnimScript_ASFlatlandTricks03
		)
endscript

script AnimScript_Sk8rSession02Idle 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = bumped}
	Interact_MoveToAndBlock \{lock = false
		align = true
		movement_desc = {
			movement = walk_slow
		}}
	AnimScript_Sk8rSession02IdleScript
endscript

script AnimScript_Sk8rSession02IdleScript 
	Interact_PlayAnimAndBlock \{anim = PedMSk8r_Session02_Idle
		reaction_state = skate
		blend_period = 0.0
		pause_movement = true}
endscript

script AnimScript_Vert01 
	Interact_SceneInterruption type = noncritical response = ambient participate_until = bumped
	Interact_MoveToAndBlock lock = arrival_only align = true path_segment = true movement_desc = {movement = walk_slow}
	Interact_EnterSkaterScene
	onexitrun Interact_ExitSkaterScene
	Interact_PlayWeightedAnimAndBlock {
		weighted_anims = [
			{weight = 5
				anim = PedMSk8r_01_VertTrick01
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 5
				anim = PedMSk8r_01_VertTrick02
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 5
				anim = PedMSk8r_01_VertTrick03
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 5
				anim = PedMSk8r_01_VertTrick04
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 5
				anim = PedMSk8r_01_VertTrick05
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 5
				anim = PedMSk8r_01_VertTrick06
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 5
				anim = PedMSk8r_01_VertTrick07
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}]
		num_repeats = 1
	}
endscript

script AnimScript_Vert02 
	Interact_SceneInterruption type = noncritical response = ambient participate_until = bumped
	Interact_MoveToAndBlock lock = arrival_only align = true path_segment = true movement_desc = {movement = walk_slow}
	Interact_EnterSkaterScene
	onexitrun Interact_ExitSkaterScene
	Interact_PlayWeightedAnimAndBlock {
		weighted_anims = [
			{weight = 5
				anim = PedMSk8r_02_VertTrick01
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 5
				anim = PedMSk8r_02_VertTrick02
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 5
				anim = PedMSk8r_02_VertTrick03
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 5
				anim = PedMSk8r_02_VertTrick04
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 5
				anim = PedMSk8r_02_VertTrick05
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 5
				anim = PedMSk8r_02_VertTrick06
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 5
				anim = PedMSk8r_02_VertTrick07
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 5
				anim = PedMSk8r_02_VertTrick08
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}]
		num_repeats = 1
	}
endscript

script AnimScript_Sk8BenchGrinds01 
	Interact_SceneInterruption type = noncritical response = ambient participate_until = bumped
	Interact_MoveToAndBlock lock = arrival_only align = true path_segment = true movement_desc = {movement = walk_slow}
	Interact_PlayWeightedAnimAndBlock {
		weighted_anims = [
			{weight = 5
				anim = PedMSk8r_Bench_Grind02
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 5
				anim = PedMSk8r_Bench_Grind03
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 5
				anim = PedMSk8r_Bench_Grind04
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}]
		num_repeats = 1
	}
endscript

script AnimScript_BenchGrindToTurnAround 
	Interact_SceneInterruption type = noncritical response = ambient participate_until = bumped
	Interact_MoveToAndBlock lock = arrival_only align = true path_segment = true movement_desc = {movement = walk_slow}
	Interact_EnterSkaterScene
	onexitrun Interact_ExitSkaterScene
	Interact_PlayWeightedAnimAndBlock {
		weighted_anims = [
			{weight = 5
				anim = PedMSk8r_Bench_Grind02
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 5
				anim = PedMSk8r_Bench_Grind03
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 5
				anim = PedMSk8r_Bench_Grind04
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}]
		num_repeats = 1
	}
	Interact_PlayAnimAndBlock {
		anim = PedMSk8r_TurnAround01
		reaction_state = skate
		blend_period = 0.4
		pause_movement = true}
endscript

script AnimScript_Sk8LedgeGrinds01 
	Interact_SceneInterruption type = noncritical response = ambient participate_until = bumped
	Interact_MoveToAndBlock lock = arrival_only align = true path_segment = true movement_desc = {movement = walk_slow}
	Interact_EnterSkaterScene
	onexitrun Interact_ExitSkaterScene
	Interact_PlayWeightedAnimAndBlock {
		weighted_anims = [
			{weight = 5
				anim = PedMSk8r_Rail_Grind01
				reaction_state = skate
				blend_period = 0.8
				pause_movement = true
			}
			{weight = 5
				anim = PedMSk8r_Rail_Grind02
				reaction_state = skate
				blend_period = 0.8
				pause_movement = true
			}]
		num_repeats = 1
	}
endscript

script AnimScript_Sk8RailGrinds01 
	Interact_SceneInterruption type = noncritical response = ambient participate_until = bumped
	Interact_MoveToAndBlock lock = arrival_only align = true path_segment = true movement_desc = {movement = walk_slow}
	Interact_EnterSkaterScene
	onexitrun Interact_ExitSkaterScene
	Interact_PlayWeightedAnimAndBlock {
		weighted_anims = [
			{weight = 5
				anim = PedMSk8r_Rail_GrindBail
				reaction_state = skate
				blend_period = 0.8
				pause_movement = true
			}
			{weight = 5
				anim = PedMSk8r_Rail_GrindBail
				reaction_state = skate
				blend_period = 0.8
				pause_movement = true
			}
			{weight = 5
				anim = PedMSk8r_Rail_GrindBail
				reaction_state = skate
				blend_period = 0.8
				pause_movement = true
			}]
		num_repeats = 1
	}
endscript

script AnimScript_LedgeGrindToTurnAround 
	Interact_SceneInterruption type = noncritical response = ambient participate_until = bumped
	Interact_MoveToAndBlock lock = arrival_only align = true path_segment = true movement_desc = {movement = walk_slow}
	Interact_EnterSkaterScene
	onexitrun Interact_ExitSkaterScene
	Interact_PlayWeightedAnimAndBlock {
		weighted_anims = [
			{weight = 5
				anim = PedMSk8r_Rail_Grind01
				reaction_state = skate
				blend_period = 0.8
				pause_movement = true
			}
			{weight = 5
				anim = PedMSk8r_Rail_Grind02
				reaction_state = skate
				blend_period = 0.8
				pause_movement = true
			}]
		num_repeats = 1
	}
	Interact_PlayAnimAndBlock {
		anim = PedMSk8r_TurnAround01
		reaction_state = skate
		blend_out_period = 0.4
		blend_period = 0.0
		pause_movement = true}
endscript

script AnimScript_Sk8ManualLedges01 
	Interact_SceneInterruption type = noncritical response = ambient participate_until = bumped
	Interact_MoveToAndBlock lock = arrival_only align = true path_segment = true movement_desc = {movement = walk_slow}
	Interact_EnterSkaterScene
	onexitrun Interact_ExitSkaterScene
	Interact_PlayWeightedAnimAndBlock {
		weighted_anims = [
			{weight = 5
				anim = PedMSk8r_Manual_Trick01
				reaction_state = skate
				blend_period = 0.8
				pause_movement = true
			}
			{weight = 5
				anim = PedMSk8r_Manual_Trick02
				reaction_state = skate
				blend_period = 0.8
				pause_movement = true
			}]
		num_repeats = 1
	}
endscript

script AnimScript_ManualLedgeToTurnAround 
	Interact_SceneInterruption type = noncritical response = ambient participate_until = bumped
	Interact_MoveToAndBlock lock = arrival_only align = true path_segment = true movement_desc = {movement = walk_slow}
	Interact_PlayWeightedAnimAndBlock {
		weighted_anims = [
			{weight = 5
				anim = PedMSk8r_Manual_Trick01
				reaction_state = skate
				blend_period = 0.8
				pause_movement = true
			}
			{weight = 5
				anim = PedMSk8r_Manual_Trick02
				reaction_state = skate
				blend_period = 0.8
				pause_movement = true
			}]
		num_repeats = 1
	}
	Interact_PlayAnimAndBlock {
		anim = PedMSk8r_TurnAround01
		reaction_state = skate
		blend_period = 0.0
		pause_movement = true}
endscript

script AnimScript_AISk8ToIdle01 
	Interact_MoveToAndBlock \{lock = false
		align = false
		path_segment = true
		movement_desc = {
			movement = walk_slow
		}}
	Interact_PlayWeightedAnimAndBlock \{weighted_anims = [
			{
				weight = 5
				anim = PedMSk8r_Sk8ToIdleToSk8
				reaction_state = skate
				blend_period = 0.8
				pause_movement = true
			}
		]
		num_repeats = 1}
endscript

script AnimScript_AiSession01 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = bumped}
	Interact_MoveToAndBlock \{lock = arrival_only
		align = true
		path_segment = true
		movement_desc = {
			movement = walk_slow
		}}
	Interact_PlayWeightedAnimAndBlock \{weighted_anims = [
			{
				weight = 5
				anim = PedMSk8r_Session01
				reaction_state = skate
				blend_period = 0.9
				pause_movement = true
			}
		]
		num_repeats = 1}
endscript

script AnimScript_AiSession02 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = bumped}
	Interact_MoveToAndBlock \{lock = arrival_only
		align = true
		path_segment = true
		movement_desc = {
			movement = walk_slow
		}}
	Interact_PlayWeightedAnimAndBlock \{weighted_anims = [
			{
				weight = 5
				anim = PedMSk8r_Session02
				reaction_state = skate
				blend_period = 0.9
				pause_movement = true
			}
		]
		num_repeats = 1}
endscript

script AnimScript_Sk8rTurnAround01 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = bumped}
	Interact_MoveToAndBlock \{lock = arrival_only
		align = false
		path_segment = true
		movement_desc = {
			movement = walk_slow
		}}
	Interact_PlayWeightedAnimAndBlock \{weighted_anims = [
			{
				weight = 5
				anim = PedMSk8r_TurnAround01
				reaction_state = skate
				blend_period = 0.9
				pause_movement = true
			}
		]
		num_repeats = 1}
endscript

script AnimScript_Sk8rTurnAround02 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = bumped}
	Interact_MoveToAndBlock \{lock = arrival_only
		align = false
		path_segment = true
		movement_desc = {
			movement = walk_slow
		}}
	Interact_PlayWeightedAnimAndBlock \{weighted_anims = [
			{
				weight = 5
				anim = PedMSk8r_TurnAround02
				reaction_state = skate
				blend_period = 0.9
				pause_movement = true
			}
		]
		num_repeats = 1}
endscript

script AnimScript_Sk8rTurnAround03 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = bumped}
	Interact_MoveToAndBlock \{lock = arrival_only
		align = false
		path_segment = true
		movement_desc = {
			movement = walk_slow
		}}
	Interact_PlayWeightedAnimAndBlock \{weighted_anims = [
			{
				weight = 5
				anim = PedMSk8r_TurnAround03
				reaction_state = skate
				blend_period = 0.9
				pause_movement = true
			}
		]
		num_repeats = 1}
endscript

script AnimScript_Sk8rTurnAround04 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = bumped}
	Interact_MoveToAndBlock \{lock = arrival_only
		align = true
		path_segment = true
		movement_desc = {
			movement = walk_slow
		}}
	Interact_PlayWeightedAnimAndBlock \{weighted_anims = [
			{
				weight = 5
				anim = PedMSk8r_TurnAround04
				reaction_state = skate
				blend_period = 0.9
				pause_movement = true
			}
		]
		num_repeats = 1}
endscript

script AnimScript_Sk8rTurnAround05 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = bumped}
	Interact_MoveToAndBlock \{lock = arrival_only
		align = false
		path_segment = true
		movement_desc = {
			movement = walk_slow
		}}
	Interact_PlayWeightedAnimAndBlock \{weighted_anims = [
			{
				weight = 5
				anim = PedMSk8r_TurnAround05
				reaction_state = skate
				blend_period = 0.9
				pause_movement = true
			}
		]
		num_repeats = 1}
endscript

script AnimScript_Sk8rOffAndOnBoard 
	Interact_SceneInterruption type = noncritical response = ambient participate_until = bumped
	Interact_MoveToAndBlock lock = arrival_only align = false path_segment = true movement_desc = {movement = walk_slow}
	Interact_PlayAnimAndBlock {
		anim = PedMSk8r_AS_Sk8ToWalk
		reaction_state = skate
		blend_period = 0.4
		pause_movement = true}
	Interact_PlayAnimAndBlock {
		anim = PedMSk8r_AS_Sk8Walk01
		reaction_state = skate
		blend_period = 0.0
		pause_movement = true}
	Interact_PlayAnimAndBlock {
		anim = PedMSk8r_AS_WalkToSk8
		reaction_state = skate
		blend_period = 0.4
		pause_movement = true}
endscript

script AnimScript_PlentyOhTricks 
	Interact_SceneInterruption type = noncritical response = ambient participate_until = bumped
	Interact_MoveToAndBlock lock = arrival_only align = false path_segment = true movement_desc = {movement = walk_slow}
	Interact_PlayWeightedAnimAndBlock {
		weighted_anims = [
			{weight = 10
				anim = PedMSk8r_Session02_Trick01
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick02
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick03
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick04
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick05
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick06
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick07
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick08
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick09
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
		]
		num_repeats = 1
	}
endscript

script AnimScript_PlentyOhTricksTurnAround 
	Interact_SceneInterruption type = noncritical response = ambient participate_until = bumped
	Interact_MoveToAndBlock lock = arrival_only align = false path_segment = true movement_desc = {movement = walk_slow}
	Interact_PlayWeightedAnimAndBlock {
		weighted_anims = [
			{weight = 10
				anim = PedMSk8r_Session02_Trick01
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick02
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick03
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick04
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick05
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick06
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick07
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick08
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick09
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
		]
		num_repeats = 1
	}
	Interact_PlayAnimAndBlock {
		anim = PedMSk8r_TurnAround01
		reaction_state = skate
		blend_period = 0.4
		pause_movement = true}
endscript

script AnimScript_PlentyOhTricksTurnAround02 
	Interact_SceneInterruption type = noncritical response = ambient participate_until = bumped
	Interact_MoveToAndBlock lock = arrival_only align = false path_segment = true movement_desc = {movement = walk_slow}
	Interact_PlayWeightedAnimAndBlock {
		weighted_anims = [
			{weight = 10
				anim = PedMSk8r_Session02_Trick01
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick02
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick03
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick04
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick05
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick06
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick07
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick08
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick09
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
		]
		num_repeats = 1
	}
	Interact_PlayAnimAndBlock {
		anim = PedMSk8r_TurnAround02
		reaction_state = skate
		blend_out_period = 0.4
		blend_period = 0.0
		pause_movement = true}
endscript

script AnimScript_PlentyOhTrickStartTurnAround 
	Interact_SceneInterruption type = noncritical response = ambient participate_until = bumped
	Interact_MoveToAndBlock lock = arrival_only align = false path_segment = true movement_desc = {movement = walk_slow}
	Interact_PlayAnimAndBlock {
		anim = PedMSk8r_TurnAround02
		reaction_state = skate
		blend_out_period = 0.4
		blend_period = 0.0
		pause_movement = true}
	Interact_PlayWeightedAnimAndBlock {
		weighted_anims = [
			{weight = 10
				anim = PedMSk8r_Session02_Trick01
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick02
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick03
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick04
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick05
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick06
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick07
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick08
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick09
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
		]
		num_repeats = 1
	}
endscript

script AnimScript_PlentyOhTrickStartTurnAround02 
	Interact_SceneInterruption type = noncritical response = ambient participate_until = bumped
	Interact_MoveToAndBlock lock = arrival_only align = false path_segment = true movement_desc = {movement = walk_slow}
	Interact_PlayAnimAndBlock {
		anim = PedMSk8r_TurnAround04
		reaction_state = skate
		blend_period = 0.4
		pause_movement = true}
	Interact_PlayWeightedAnimAndBlock {
		weighted_anims = [
			{weight = 10
				anim = PedMSk8r_Session02_Trick01
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick02
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick03
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick04
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick05
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick06
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick07
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick08
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
			{weight = 10
				anim = PedMSk8r_Session02_Trick09
				reaction_state = skate
				blend_period = 0.4
				pause_movement = true
			}
		]
		num_repeats = 1
	}
endscript

script AnimScript_MullnTrick01 
	Interact_SceneInterruption type = noncritical response = ambient participate_until = bumped
	Interact_MoveToAndBlock lock = false align = false movement_desc = {movement = walk_slow}
	Interact_PlayWeightedAnimAndBlock {
		weighted_anims = [
			{weight = 1
				anim = PedMSk8r_SkateToMullen01_F
				reaction_state = skate
				blend_period = 0.2
				pause_movement = true
			}
			{weight = 1
				anim = PedMSk8r_SkateToMullen02_F
				reaction_state = skate
				blend_period = 0.2
				pause_movement = true
			}]
		num_repeats = 1
	}
	Interact_PlayWeightedAnimAndBlock {
		weighted_anims = [
			{weight = 1
				anim = PedMSk8r_Mullen03_F
				reaction_state = skate
				blend_period = 0.2
				pause_movement = true
			}
			{weight = 1
				anim = PedMSk8r_Mullen01_F
				reaction_state = skate
				blend_period = 0.2
				pause_movement = true
			}
			{weight = 1
				anim = PedMSk8r_Mullen02_F
				reaction_state = skate
				blend_period = 0.2
				pause_movement = true
			}
			{weight = 1
				anim = PedMSk8r_Mullen04a_F
				reaction_state = skate
				blend_period = 0.2
				pause_movement = true
			}
			{weight = 1
				anim = PedMSk8r_Mullen06_F
				reaction_state = skate
				blend_period = 0.2
				pause_movement = true
			}]
		num_repeats = 1
	}
endscript

script AnimScript_MullnTrick02 
	Interact_SceneInterruption type = noncritical response = ambient participate_until = bumped
	Interact_MoveToAndBlock lock = false align = false movement_desc = {movement = walk_slow}
	Interact_PlayWeightedAnimAndBlock {
		weighted_anims = [
			{weight = 1
				anim = PedMSk8r_SkateToMullen01_F
				reaction_state = skate
				blend_period = 0.2
				pause_movement = true
			}
			{weight = 1
				anim = PedMSk8r_SkateToMullen02_F
				reaction_state = skate
				blend_period = 0.2
				pause_movement = true
			}]
		num_repeats = 1
	}
	Interact_PlayAnimAndBlock {
		anim = PedMSk8r_Mullen05a_F
		reaction_state = skate
		blend_period = 0.2
		pause_movement = true}
	Interact_PlayAnimAndBlock {
		anim = PedMSk8r_Mullen05b_F
		reaction_state = skate
		blend_period = 0.2
		pause_movement = true}
endscript

script AnimScript_Sk8rTalk01_A 
	Interact_SceneInterruption \{type = critical
		response = ambient
		participate_until = bumped}
	Interact_MoveToAndBlock \{lock = true
		align = true
		movement_desc = {
			movement = walk_slow
		}}
	begin
	Interact_PlayAnimAndBlock \{anim = PedMSk8r_DP_Talk01a
		reaction_state = skate
		blend_period = 0.0}
	repeat
endscript

script AnimScript_Sk8rTalk01_B 
	Interact_SceneInterruption \{type = critical
		response = ambient
		participate_until = bumped}
	Interact_MoveToAndBlock \{lock = true
		align = true
		movement_desc = {
			movement = walk_slow
		}}
	begin
	Interact_PlayAnimAndBlock \{anim = PedMSk8r_DP_Talk01b
		reaction_state = skate
		blend_period = 0.0}
	repeat
endscript

script AnimScript_Sk8rTalk02_A 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = bumped}
	Interact_MoveToAndBlock \{lock = true
		align = true
		movement_desc = {
			movement = walk_slow
		}}
	begin
	Interact_PlayAnimAndBlock \{anim = PedMSk8r_DP_Talk02a
		reaction_state = skate
		blend_period = 0.0}
	repeat
endscript

script AnimScript_Sk8rTalk02_B 
	Interact_SceneInterruption \{type = noncritical
		response = ambient
		participate_until = bumped}
	Interact_MoveToAndBlock \{lock = true
		align = true
		movement_desc = {
			movement = walk_slow
		}}
	begin
	Interact_PlayAnimAndBlock \{anim = PedMSk8r_DP_Talk02b
		reaction_state = skate
		blend_period = 0.0}
	repeat
endscript

script AnimScript_CopHarrasSk8r_A 
	Interact_SceneInterruption \{type = critical
		response = ambient
		participate_until = bumped}
	Interact_MoveToAndBlock \{lock = true
		align = true
		movement_desc = {
			movement = walk_slow
		}}
	begin
	Interact_PlayAnimAndBlock \{anim = PedMSk8r_CopHarrassSk8r01a
		reaction_state = skate
		blend_period = 0.0}
	repeat
endscript

script AnimScript_CopHarrasSk8r_B 
	Interact_SceneInterruption \{type = critical
		response = ambient
		participate_until = bumped}
	Interact_MoveToAndBlock \{lock = true
		align = true
		movement_desc = {
			movement = walk_slow
		}}
	begin
	Interact_PlayAnimAndBlock \{anim = PedMSk8r_CopHarrassSk8r01b
		reaction_state = normal
		blend_period = 0.0}
	repeat
endscript

script AnimScript_TestEvent1 
	begin
	Interact_PlayWeightedAnimAndBlock {
		weighted_anims = [{weight = 1
				anim = PedMSpectator_Cheer01
				reaction_state = transition
				blend_period = 0.0
				pause_movement = true
			}
			{anim = PedMSpectator_Cheer02
				reaction_state = transition
				blend_period = 0.0
				pause_movement = true
				weight = 1
			}
			{anim = PedMSpectator_Cheer03
				reaction_state = transition
				blend_period = 0.0
				pause_movement = true
				weight = 1
			}
		]
	}
	repeat
endscript

script AnimScript_TestEvent2 
	begin
	Interact_PlayAnimAndBlock \{weight = 1
		anim = PedMGuitarPlayer_Play
		reaction_state = transition
		blend_period = 0.0
		pause_movement = true}
	repeat
endscript

script Interact_MoveToAndBlock_ToGrind 
	Interact_MoveToAndBlock \{lock = arrival_only
		align = true
		path_segment = true
		movement_desc = {
			movement = walk_fast
		}}
endscript

script Interact_MoveToAndBlock_ToManual 
	Interact_MoveToAndBlock \{lock = arrival_only
		align = true
		path_segment = true
		movement_desc = {
			movement = walk_fast
		}}
endscript

script Interact_MoveToAndBlock_ToTurn 
	Interact_MoveToAndBlock \{lock = false
		align = false
		path_segment = true
		movement_desc = {
			movement = walk_fast
		}}
endscript

script Interact_MoveToAndBlock_ToVert 
	Interact_MoveToAndBlock \{lock = arrival_only
		align = true
		path_segment = true
		movement_desc = {
			movement = walk_fast
		}}
endscript

script Interact_MoveToAndBlock_ToStop 
	Interact_MoveToAndBlock \{lock = true
		align = true
		path_segment = false
		movement_desc = {
			movement = walk_fast
		}}
endscript
