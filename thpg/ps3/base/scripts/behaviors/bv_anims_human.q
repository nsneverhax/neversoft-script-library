
script Start_Persistent_Smoke_Effects 
	obj_getid
	obj_spawnscriptnow Weapon_SFX_Gunshot_Gattlin_Loop
	if NOT inventory_getactiveitemid
		return
	endif
	if NOT inventory_getequippeditemobjid
		return
	endif
	system = (GatlingGunShootParticles01 + <objid>)
	if compositeobjectexists <system>
		<system> :die
	endif
	createfastparticlesystem name = GatlingGunShootParticles01 objid = <objid> params_script = JOW_Ped_GatlingSmoke01_fast_particle_params
	system = (GatlingGunShootParticles02 + <objid>)
	if compositeobjectexists <system>
		<system> :die
	endif
	createfastparticlesystem name = GatlingGunShootParticles02 objid = <objid> params_script = JOW_Ped_GatlingSparks01_fast_particle_params
	system = (GatlingGunShootParticles03 + <objid>)
	if compositeobjectexists <system>
		<system> :die
	endif
	createfastparticlesystem name = GatlingGunShootParticles03 objid = <objid> params_script = JOW_Ped_GatlingCasings01_fast_particle_params
endscript

script Stop_Persistent_Smoke_Effects 
	obj_getid
	obj_spawnscriptlater Weapon_SFX_Gunshot_Gattlin_Release
	system = (GatlingGunShootParticles01 + <objid>)
	if compositeobjectexists <system>
		<system> :setemitrate 0.0
		<system> :destroyifempty
	endif
	system = (GatlingGunShootParticles02 + <objid>)
	if compositeobjectexists <system>
		<system> :setemitrate 0.0
		<system> :destroyifempty
	endif
	system = (GatlingGunShootParticles03 + <objid>)
	if compositeobjectexists <system>
		<system> :setemitrate 0.0
		<system> :destroyifempty
	endif
endscript

script PlayItemAnim 
	if NOT inventory_getequippeditemobjid
		return
	endif
	if <item_obj_id> :containscomponent {name = skeleton}
		<item_obj_id> :skeleton_getskeletonname
		if (<skeletonname> = <skeleton_name>)
			<item_obj_id> :anim_command {target = FixedWeaponBlender
				command = degenerateblend_addbranch
				params = {blendduration = <blend_duration>
					tree = $Fixed_Weapon_AnimBranch
					params = {my_timer_type = <timer_type> my_anim = <anim_name>}
				}
			}
		endif
	endif
endscript

script PlayCannonUseAnim 
	skeleton_getskeletonname
	switch <skeletonname>
		case MortarCannon
		anim_name = Obj_MortarCannon_Recoil
		case Cannon_Large
		anim_name = Obj_Cannon_Large_Recoil
	endswitch
	PlayItemAnim {skeleton_name = <skeletonname>
		timer_type = play
		blend_duration = 0.1
		anim_name = <anim_name>}
endscript

script PlayGatlingGunIdleAnim 
	PlayItemAnim \{skeleton_name = GatlingGun
		timer_type = cycle
		blend_duration = 0.4
		anim_name = Obj_Gatling_Idle}
endscript

script PlayGatlingGunUseAnim 
	PlayItemAnim \{skeleton_name = GatlingGun
		timer_type = cycle
		blend_duration = 0.4
		anim_name = Obj_Gatling_Fire}
endscript

script RegisterBehaviors_Anims_Human 
	registerstate {
		name = Bv_Anims_Human
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = lower state = Bv_Anims_Human_Lower}
					{replacement = upper state = Bv_Anims_Human_Upper}
					{replacement = fall state = Bv_GenEvents_IsFalling}]}
			{events = [StartGatlingGunAnims] ,
				responses = [{replacement = this state = Bv_Anims_Human_GatlingGun}]}
			{events = [StartOnFireAnims] ,
				responses = [{replacement = this state = Bv_Anims_Human_OnFire}]}
			{events = [got_isfalling] ,
				responses = [{replacement = this state = Bv_Anims_Human_Falling}]}
		]}
endscript

script RegisterBehaviors_Anims_Human_Falling 
	registerstate \{name = Bv_Anims_Human_Falling
		task = {
			name = Task_HumanAnims
			params = {
				human_anim_stage = lower
				anim_set_id = Human_Move_Air
				blend_in_dur = 0.4
				blend_out_dur = 0.4
				finished_event_id = HumanAnims_Lower_Finished
			}
		}
		transitions = [
			{
				events = [
					enter_behavior
				]
				responses = [
					{
						replacement = fall
						state = Bv_GenEvents_IsFalling
					}
				]
			}
			{
				events = [
					lost_isfalling
				]
				responses = [
					{
						replacement = this
						state = Bv_Anims_Human_LandFromFall
					}
				]
			}
		]}
endscript

script RegisterBehaviors_Anims_Human_Land 
	registerstate \{name = Bv_Anims_Human_LandFromFall
		task = {
			name = Task_HumanAnims
			params = {
				human_anim_stage = lower
				anim_set_id = Human_Move_Land
				blend_in_dur = 0.4
				blend_out_dur = 0.4
				finished_event_id = HumanAnims_HumanLandFinished
			}
		}
		transitions = [
			{
				events = [
					HumanAnims_HumanLandFinished
					RiderLand_Finished
				]
				responses = [
					{
						replacement = this
						state = Bv_Anims_Human
					}
				]
			}
		]}
endscript

script RegisterBehaviors_Anims_Human_OnFire 
	registerstate {
		name = Bv_Anims_Human_OnFire
		task = {name = Task_HumanAnims
			params = {human_anim_stage = lower
				anim_set_id = Human_Move_OnFire
				blend_in_dur = 0.4
				blend_out_dur = 0.4
				finished_event_id = HumanAnims_Lower_Finished}}
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = child state = Bv_Anims_Human_OnFire_Child}]}
			{events = [StopOnFireAnims] ,
				responses = [{replacement = this state = Bv_Anims_Human}]}
		]}
	registerstate {
		name = Bv_Anims_Human_OnFire_Child
		task = {name = Task_HumanAnims
			params = {human_anim_stage = upper
				anim_set_id = Human_Move_OnFire_SpeedAssociation_Shuffle
				blend_in_dur = 0.4
				blend_out_dur = 0.4
				finished_event_id = HumanAnims_Lower_Finished}}
	}
endscript

script RegisterBehaviors_Anims_Human_GatlingGun 
	registerstate {
		name = Bv_Anims_Human_GatlingGun
		transitions = [{events = [enter_behavior AutoUseEquippedItem_Loop_StopUse] ,
				responses = [{replacement = human_anim state = Bv_Anims_Human_GatlingGun_Idle}]}
			{conditions = [{name = agent_hasclearaim result = true}]
				responses = [{replacement = human_anim state = Bv_Anims_Human_GatlingGun_Use}]}
			{events = [StopGatlingGunAnims] ,
				responses = [{replacement = this state = Bv_Anims_Human}]}
		]}
	registerstate {
		name = Bv_Anims_Human_GatlingGun_Idle
		task = {name = Task_HumanAnims
			params = {human_anim_stage = lower
				anim_set_id = Human_Move_GatlingGun
				blend_in_dur = 0.4
				blend_out_dur = 0.4
				finished_event_id = HumanAnims_Lower_Finished}}
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = item_anim state = PlayGatlingGunIdleAnim}]}
		]}
	registerstate {
		name = Bv_Anims_Human_GatlingGun_Use
		task = {name = Task_HumanAnims
			params = {human_anim_stage = lower
				anim_set_id = Human_Use_GatlingGun
				blend_in_dur = 0.4
				blend_out_dur = 0.4
				finished_event_id = HumanAnims_Lower_Finished}}
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = effects state = Start_Persistent_Smoke_Effects}
					{replacement = item_anim state = PlayGatlingGunUseAnim}]}
			{events = [exit_behavior] ,
				responses = [{replacement = effects state = Stop_Persistent_Smoke_Effects}]}
		]}
endscript

script RegisterBehaviors_Anims_Human_Lower 
	registerstate {
		name = Bv_Anims_Human_Lower
		task = {name = Task_HumanAnims
			params = {human_anim_stage = lower
				anim_set_id = Human_Move
				blend_in_dur = 0.4
				blend_out_dur = 0.4
				finished_event_id = HumanAnims_Lower_Finished}}
		transitions = [
		]}
	registerstate {
		name = Bv_Anims_Human_Jump
		task = {name = Task_HumanAnims
			params = {human_anim_stage = lower
				anim_set_id = Human_Move_Jump
				blend_in_dur = 0.4
				blend_out_dur = 0.4
				finished_event_id = LowerAnim_Finished}}
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = jumping state = Bv_GenEvents_IsJumping}]}
			{events = [LowerAnim_Finished] ,
				responses = [{replacement = this state = Bv_Anims_Human_Air}]}
			{events = [lost_isjumping] ,
				responses = [{replacement = this state = Bv_Anims_Human_Land}]}
		]}
	registerstate {
		name = Bv_Anims_Human_Air
		task = {name = Task_HumanAnims
			params = {human_anim_stage = lower
				blend_in_dur = 0.4
				blend_out_dur = 0.4
				anim_set_id = Human_Move_Air}}
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = jumping state = Bv_GenEvents_IsJumping}]}
			{events = [lost_isjumping] ,
				responses = [{replacement = this state = Bv_Anims_Human_Land}]}
		]}
	registerstate {
		name = Bv_Anims_Human_Land
		task = {name = Task_HumanAnims
			params = {human_anim_stage = lower
				anim_set_id = Human_Move_Land
				blend_in_dur = 0.4
				blend_out_dur = 0.4
				finished_event_id = LowerAnim_Finished}}
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = jumping state = Bv_GenEvents_IsJumping}]}
			{events = [LowerAnim_Finished] ,
				responses = [{replacement = this state = Bv_Anims_Human_Lower}]}
			{events = [got_isjumping] ,
				responses = [{replacement = this state = Bv_Anims_Human_Jump}]}
		]}
	registerstate {
		name = Bv_Anims_Human_Lower_Hostage
		task = {name = Task_HumanAnims
			params = {human_anim_stage = lower
				anim_set_id = Human_Move_Pistol_Hostage
				blend_in_dur = 0.4
				blend_out_dur = 0.4
				finished_event_id = HumanAnims_Lower_Finished}}
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = hostage state = Bv_GenEvents_HasHostage}]}
			{events = [Lost_HasHostage] ,
				responses = [{replacement = this state = Bv_Anims_Human_Lower}]}
			{events = [PlayAnim_HostageIdleToStruggle] ,
				responses = [{replacement = this state = Bv_Anims_Human_Lower_Hostage_IdleToStruggle}]}
		]}
	registerstate {
		name = Bv_Anims_Human_Lower_Hostage_IdleToStruggle
		task = {name = Task_HumanAnims
			params = {human_anim_stage = lower
				anim_set_id = Human_Move_Pistol_Hostage_IdleToStruggle
				blend_in_dur = 0.4
				blend_out_dur = 0.4
				finished_event_id = HumanAnims_Lower_Finished}}
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = hostage state = Bv_GenEvents_HasHostage}]}
			{events = [Lost_HasHostage] ,
				responses = [{replacement = this state = Bv_Anims_Human_Lower}]}
			{events = [HumanAnims_Lower_Finished] ,
				responses = [{replacement = this state = Bv_Anims_Human_Lower_Hostage_Struggle}]}
			{events = [PlayAnim_HostageStruggleToIdle] ,
				responses = [{replacement = this state = Bv_Anims_Human_Lower_Hostage_StruggleToIdle}]}
		]}
	registerstate {
		name = Bv_Anims_Human_Lower_Hostage_Struggle
		task = {name = Task_HumanAnims
			params = {human_anim_stage = lower
				anim_set_id = Human_Move_Pistol_Hostage_Struggle
				blend_in_dur = 0.4
				blend_out_dur = 0.4
				finished_event_id = HumanAnims_Lower_Finished}}
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = hostage state = Bv_GenEvents_HasHostage}]}
			{events = [Lost_HasHostage] ,
				responses = [{replacement = this state = Bv_Anims_Human_Lower}]}
			{events = [PlayAnim_HostageStruggleToIdle] ,
				responses = [{replacement = this state = Bv_Anims_Human_Lower_Hostage_StruggleToIdle}]}
		]}
	registerstate {
		name = Bv_Anims_Human_Lower_Hostage_StruggleToIdle
		task = {name = Task_HumanAnims
			params = {human_anim_stage = lower
				anim_set_id = Human_Move_Pistol_Hostage_StruggleToIdle
				blend_in_dur = 0.4
				blend_out_dur = 0.4
				finished_event_id = HumanAnims_Lower_Finished}}
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = hostage state = Bv_GenEvents_HasHostage}]}
			{events = [Lost_HasHostage] ,
				responses = [{replacement = this state = Bv_Anims_Human_Lower}]}
			{events = [HumanAnims_Lower_Finished] ,
				responses = [{replacement = this state = Bv_Anims_Human_Lower_Hostage}]}
		]}
	registerstate {
		name = Bv_Anims_Human_Lower_LeanLeft
		task = {name = Task_HumanAnims
			params = {human_anim_stage = lower
				anim_set_id = Human_Move_LeanLeft_ItemAssociation
				blend_in_dur = 0.4
				blend_out_dur = 0.4
			}}
		transitions = [{events = [StopLeanAnim] ,
				responses = [{replacement = this state = Bv_Anims_Human_Lower}]}
		]}
	registerstate {
		name = Bv_Anims_Human_Lower_LeanRight
		task = {name = Task_HumanAnims
			params = {human_anim_stage = lower
				anim_set_id = Human_Move_LeanRight_ItemAssociation
				blend_in_dur = 0.4
				blend_out_dur = 0.4
			}}
		transitions = [{events = [StopLeanAnim] ,
				responses = [{replacement = this state = Bv_Anims_Human_Lower}]}
		]}
endscript

script RegisterBehaviors_Anims_Human_Upper 
	registerstate {
		name = Bv_Anims_Human_Upper
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = child state = Bv_Anims_Human_Upper_Blank}]}
		]}
	registerstate {
		name = Bv_Anims_Human_Upper_Blank
		transitions = [{events = [playanim_reload] ,
				recur = true ,
				responses = [{replacement = this state = Bv_Anims_Human_Upper_Reload}]}
			{events = [playanim_use] ,
				recur = true ,
				responses = [{replacement = this state = Bv_Anims_Human_Upper_Use}]}
			{events = [playanim_equip] ,
				recur = true ,
				responses = [{replacement = this state = Bv_Anims_Human_Upper_Equip}]}
			{events = [playanim_unequip] ,
				recur = true ,
				responses = [{replacement = this state = Bv_Anims_Human_Upper_Unequip}]}
		]}
	registerstate {
		name = Bv_Anims_Human_Upper_Reload
		task = {name = Task_GenEvents
			params = {event_gen_id = HasHostage}}
		transitions = [{events = [Lost_HasHostage] ,
				responses = [{replacement = child state = Bv_Anims_Human_Upper_Reload_Ground}]
			}
			{events = [HumanAnims_Upper_Finished] ,
				recur = true ,
				responses = [{replacement = this state = Bv_Anims_Human_Upper_Blank}]}
			{events = [playanim_reload] ,
				recur = true ,
				responses = [{replacement = this state = Bv_Anims_Human_Upper_Reload}]}
			{events = [playanim_use] ,
				recur = true ,
				responses = [{replacement = this state = Bv_Anims_Human_Upper_Use}]}
			{events = [playanim_equip] ,
				recur = true ,
				responses = [{replacement = this state = Bv_Anims_Human_Upper_Equip}]}
			{events = [playanim_unequip] ,
				recur = true ,
				responses = [{replacement = this state = Bv_Anims_Human_Upper_Unequip}]}
		]}
	registerstate {
		name = Bv_Anims_Human_Upper_Reload_Ground
		task = {name = Task_HumanAnims
			params = {human_anim_stage = upper
				anim_set_id = Human_Reload
				blend_in_dur = 0.4
				blend_out_dur = 0.4
				finished_event_id = HumanAnims_Upper_Finished}}}
	registerstate {
		name = Bv_Anims_Human_Upper_Equip
		task = {name = Task_HumanAnims
			params = {human_anim_stage = upper
				anim_set_id = Human_Equip
				blend_in_dur = 0.4
				blend_out_dur = 0.4
				finished_event_id = HumanAnims_Upper_Finished}}
		transitions = [{events = [HumanAnims_Upper_Finished] ,
				recur = true ,
				responses = [{replacement = this state = Bv_Anims_Human_Upper_Blank}]}
			{events = [playanim_reload] ,
				recur = true ,
				responses = [{replacement = this state = Bv_Anims_Human_Upper_Reload}]}
			{events = [playanim_use] ,
				recur = true ,
				responses = [{replacement = this state = Bv_Anims_Human_Upper_Use}]}
			{events = [playanim_equip] ,
				recur = true ,
				responses = [{replacement = this state = Bv_Anims_Human_Upper_Equip}]}
			{events = [playanim_unequip] ,
				recur = true ,
				responses = [{replacement = this state = Bv_Anims_Human_Upper_Unequip}]}
		]}
	registerstate {
		name = Bv_Anims_Human_Upper_Unequip
		task = {name = Task_HumanAnims
			params = {human_anim_stage = upper
				anim_set_id = Human_Unequip
				blend_in_dur = 0.4
				blend_out_dur = 0.4
				finished_event_id = HumanAnims_Upper_Finished}}
		transitions = [{events = [HumanAnims_Upper_Finished] ,
				recur = true ,
				responses = [{replacement = this state = Bv_Anims_Human_Upper_Blank}]}
			{events = [playanim_reload] ,
				recur = true ,
				responses = [{replacement = this state = Bv_Anims_Human_Upper_Reload}]}
			{events = [playanim_use] ,
				recur = true ,
				responses = [{replacement = this state = Bv_Anims_Human_Upper_Use}]}
			{events = [playanim_equip] ,
				recur = true ,
				responses = [{replacement = this state = Bv_Anims_Human_Upper_Equip}]}
			{events = [playanim_unequip] ,
				recur = true ,
				responses = [{replacement = this state = Bv_Anims_Human_Upper_Unequip}]}
		]}
	registerstate {
		name = Bv_Anims_Human_Upper_Use
		task = {name = Task_GenEvents
			params = {event_gen_id = item_anim_type}}
		transitions = [{events = [item_anim_type_none] ,
				responses = [{replacement = child state = bv_blank}]}
			{events = [item_anim_type_fist] ,
				responses = [{replacement = child state = bv_blank}]}
			{events = [item_anim_type_knife] ,
				responses = [{replacement = child state = bv_blank}]}
			{events = [item_anim_type_axe] ,
				responses = [{replacement = child state = bv_blank}]}
			{events = [item_anim_type_torch] ,
				responses = [{replacement = child state = bv_blank}]}
			{events = [item_anim_type_bow] ,
				responses = [{replacement = child state = Bv_Anims_Human_Upper_Use_Bow}]}
			{events = [item_anim_type_pistol] ,
				responses = [{replacement = child state = Bv_Anims_Human_Upper_Use_Pistol}]}
			{events = [item_anim_type_rifle] ,
				responses = [{replacement = child state = Bv_Anims_Human_Upper_Use_Rifle}]}
			{events = [item_anim_type_explosive] ,
				responses = [{replacement = child state = Bv_Anims_Human_Upper_Use_Explosive}]}
			{events = [item_anim_type_cannon] ,
				responses = [{replacement = child state = Bv_Anims_Human_Upper_Use_Cannon}]}
			{events = [HumanAnims_Upper_Finished] ,
				recur = true ,
				responses = [{replacement = this state = Bv_Anims_Human_Upper_Blank}]}
			{events = [playanim_reload] ,
				recur = true ,
				responses = [{replacement = this state = Bv_Anims_Human_Upper_Reload}]}
			{events = [playanim_equip] ,
				recur = true ,
				responses = [{replacement = this state = Bv_Anims_Human_Upper_Equip}]}
			{events = [playanim_unequip] ,
				recur = true ,
				responses = [{replacement = this state = Bv_Anims_Human_Upper_Unequip}]}
		]}
endscript

script RegisterBehaviors_Anims_Human_Upper_Use_Fist 
	registerstate \{name = Bv_Anims_Human_Upper_Use_Fist
		task = {
			name = Task_HumanAnims
			params = {
				human_anim_stage = upper
				anim_set_id = Human_Use_Fist_Association
				blend_in_dur = 0.4
				blend_out_dur = 0.4
				finished_event_id = HumanAnims_Upper_Finished
			}
		}
		transitions = [
			{
				events = [
					playanim_use
				]
				recur = true
				responses = [
					{
						replacement = this
						state = Bv_Anims_Human_Upper_Use_Fist
					}
				]
			}
		]}
endscript

script RegisterBehaviors_Anims_Human_Upper_Use_Knife 
	registerstate {
		name = Bv_Anims_Human_Upper_Use_Knife
		task = {name = Task_HumanAnims
			params = {human_anim_stage = upper
				anim_set_id = Human_Use_Knife
				blend_in_dur = 0.4
				blend_out_dur = 0.4
				finished_event_id = HumanAnims_Upper_Finished}}
		transitions = [{events = [playanim_use] ,
				recur = true ,
				responses = [{replacement = this state = Bv_Anims_Human_Upper_Use_Knife_2}]}
		]}
	registerstate {
		name = Bv_Anims_Human_Upper_Use_Knife_2
		task = {name = Task_HumanAnims
			params = {human_anim_stage = upper
				anim_set_id = Human_Use_Knife_2
				blend_in_dur = 0.4
				blend_out_dur = 0.4
				finished_event_id = HumanAnims_Upper_Finished}}
		transitions = [{events = [playanim_use] ,
				recur = true ,
				responses = [{replacement = this state = Bv_Anims_Human_Upper_Use_Knife_3}]}
		]}
	registerstate {
		name = Bv_Anims_Human_Upper_Use_Knife_3
		task = {name = Task_HumanAnims
			params = {human_anim_stage = upper
				anim_set_id = Human_Use_Knife_3
				blend_in_dur = 0.4
				blend_out_dur = 0.4
				finished_event_id = HumanAnims_Upper_Finished}}
		transitions = [{events = [playanim_use] ,
				recur = true ,
				responses = [{replacement = this state = Bv_Anims_Human_Upper_Use_Knife}]}
		]}
endscript

script RegisterBehaviors_Anims_Human_Upper_Use_Axe 
	registerstate {
		name = Bv_Anims_Human_Upper_Use_Axe
		task = {name = Task_HumanAnims
			params = {human_anim_stage = upper
				anim_set_id = Human_Use_Axe_Association
				blend_in_dur = 0.4
				blend_out_dur = 0.4
				finished_event_id = HumanAnims_Upper_Finished}}
		transitions = [{events = [playanim_use] ,
				recur = true ,
				responses = [{replacement = this state = Bv_Anims_Human_Upper_Use_Axe_2}]}
		]}
	registerstate {
		name = Bv_Anims_Human_Upper_Use_Axe_2
		task = {name = Task_HumanAnims
			params = {human_anim_stage = upper
				anim_set_id = Human_Use_Axe_Association_2
				blend_in_dur = 0.4
				blend_out_dur = 0.4
				finished_event_id = HumanAnims_Upper_Finished}}
		transitions = [{events = [playanim_use] ,
				recur = true ,
				responses = [{replacement = this state = Bv_Anims_Human_Upper_Use_Axe}]}
		]}
endscript

script RegisterBehaviors_Anims_Human_Upper_Use_Torch 
	registerstate \{name = Bv_Anims_Human_Upper_Use_Torch
		task = {
			name = Task_HumanAnims
			params = {
				human_anim_stage = upper
				anim_set_id = Human_Use_Torch_Association
				blend_in_dur = 0.4
				blend_out_dur = 0.4
				finished_event_id = HumanAnims_Upper_Finished
			}
		}
		transitions = [
			{
				events = [
					playanim_use
				]
				recur = true
				responses = [
					{
						replacement = this
						state = Bv_Anims_Human_Upper_Use_Torch
					}
				]
			}
		]}
endscript

script RegisterBehaviors_Anims_Human_Upper_Use_Bow 
	registerstate {
		name = Bv_Anims_Human_Upper_Use_Bow
		task = {name = Task_HumanAnims
			params = {human_anim_stage = upper
				anim_set_id = Human_Use_Bow_Association
				blend_in_dur = 0.4
				blend_out_dur = 0.4
				finished_event_id = HumanAnims_Upper_Finished}}
		transitions = [{events = [playanim_use] ,
				recur = true ,
				responses = [{replacement = this state = Bv_Anims_Human_Upper_Use_Bow}]}
		]}
	registerstate {
		name = Bv_Anims_Human_UpperLeanLeft_Use_Bow
		task = {name = Task_HumanAnims
			params = {human_anim_stage = upper
				anim_set_id = Human_Use_Bow_LeanLeft_MoveAssociation
				blend_in_dur = 0.4
				blend_out_dur = 0.4
				finished_event_id = HumanAnims_Upper_Finished}}
		transitions = [{events = [playanim_use] ,
				recur = true ,
				responses = [{replacement = this state = Bv_Anims_Human_UpperLeanLeft_Use_Bow}]}
		]}
	registerstate {
		name = Bv_Anims_Human_UpperLeanRight_Use_Bow
		task = {name = Task_HumanAnims
			params = {human_anim_stage = upper
				anim_set_id = Human_Use_Bow_LeanRight_MoveAssociation
				blend_in_dur = 0.4
				blend_out_dur = 0.4
				finished_event_id = HumanAnims_Upper_Finished}}
		transitions = [{events = [playanim_use] ,
				recur = true ,
				responses = [{replacement = this state = Bv_Anims_Human_UpperLeanRight_Use_Bow}]}
		]}
endscript

script RegisterBehaviors_Anims_Human_Upper_Use_Pistol 
	registerstate {
		name = Bv_Anims_Human_Upper_Use_Pistol
		task = {name = Task_GenEvents
			params = {event_gen_id = HasHostage}}
		transitions = [{events = [Lost_HasHostage] ,
				responses = [{replacement = this state = Bv_Anims_Human_Upper_Use_Pistol_Ground}]}
			{events = [Got_HasHostage] ,
				responses = [{replacement = this state = Bv_Anims_Human_Upper_Use_Pistol_Hostage}]}
		]}
	registerstate {
		name = Bv_Anims_Human_Upper_Use_Pistol_Ground
		task = {name = Task_HumanAnims
			params = {human_anim_stage = upper
				anim_set_id = Human_Use_Pistol
				blend_in_dur = 0.4
				blend_out_dur = 0.4
				finished_event_id = HumanAnims_Upper_Finished}}
		transitions = [{events = [playanim_use] ,
				recur = true ,
				responses = [{replacement = this state = Bv_Anims_Human_Upper_Use_Pistol}]}
		]}
	registerstate {
		name = Bv_Anims_Human_Upper_Use_Pistol_Hostage
		transitions = [{events = [playanim_use] ,
				recur = true ,
				responses = [{replacement = this state = Bv_Anims_Human_Upper_Use_Pistol}]}
		]}
	registerstate {
		name = Bv_Anims_Human_Upper_Use_Pistol
		task = {name = Task_GenEvents
			params = {event_gen_id = HasHostage}}
		transitions = [{events = [Lost_HasHostage] ,
				responses = [{replacement = this state = Bv_Anims_Human_Upper_Use_Pistol_Ground}]}
			{events = [Got_HasHostage] ,
				responses = [{replacement = this state = Bv_Anims_Human_Upper_Use_Pistol_Hostage}]}
		]}
	registerstate {
		name = Bv_Anims_Human_UpperLeanLeft_Use_Pistol
		task = {name = Task_HumanAnims
			params = {human_anim_stage = upper
				anim_set_id = Human_Use_Pistol_LeanLeft_MoveAssociation
				blend_in_dur = 0.4
				blend_out_dur = 0.4
				finished_event_id = HumanAnims_Upper_Finished}}
		transitions = [{events = [playanim_use] ,
				recur = true ,
				responses = [{replacement = this state = Bv_Anims_Human_UpperLeanLeft_Use_Pistol}]}
		]}
	registerstate {
		name = Bv_Anims_Human_UpperLeanRight_Use_Pistol
		task = {name = Task_HumanAnims
			params = {human_anim_stage = upper
				anim_set_id = Human_Use_Pistol_LeanRight_MoveAssociation
				blend_in_dur = 0.4
				blend_out_dur = 0.4
				finished_event_id = HumanAnims_Upper_Finished}}
		transitions = [{events = [playanim_use] ,
				recur = true ,
				responses = [{replacement = this state = Bv_Anims_Human_UpperLeanRight_Use_Pistol}]}
		]}
endscript

script RegisterBehaviors_Anims_Human_Upper_Use_Rifle 
	registerstate {
		name = Bv_Anims_Human_Upper_Use_Rifle
		task = {name = Task_HumanAnims
			params = {human_anim_stage = upper
				anim_set_id = Human_Use_Rifle
				blend_in_dur = 0.4
				blend_out_dur = 0.4
				finished_event_id = HumanAnims_Upper_Finished}}
		transitions = [{events = [playanim_use] ,
				recur = true ,
				responses = [{replacement = this state = Bv_Anims_Human_Upper_Use_Rifle}]}
		]}
	registerstate {
		name = Bv_Anims_Human_UpperLeanLeft_Use_Rifle
		task = {name = Task_HumanAnims
			params = {human_anim_stage = upper
				anim_set_id = Human_Use_Rifle_LeanLeft_MoveAssociation
				blend_in_dur = 0.4
				blend_out_dur = 0.4
				finished_event_id = HumanAnims_Upper_Finished}}
		transitions = [{events = [playanim_use] ,
				recur = true ,
				responses = [{replacement = this state = Bv_Anims_Human_UpperLeanLeft_Use_Rifle}]}
		]}
	registerstate {
		name = Bv_Anims_Human_UpperLeanRight_Use_Rifle
		task = {name = Task_HumanAnims
			params = {human_anim_stage = upper
				anim_set_id = Human_Use_Rifle_LeanRight_MoveAssociation
				blend_in_dur = 0.4
				blend_out_dur = 0.4
				finished_event_id = HumanAnims_Upper_Finished}}
		transitions = [{events = [playanim_use] ,
				recur = true ,
				responses = [{replacement = this state = Bv_Anims_Human_UpperLeanRight_Use_Rifle}]}
		]}
endscript

script RegisterBehaviors_Anims_Human_Upper_Use_Explosive 
	registerstate {
		name = Bv_Anims_Human_Upper_Use_Explosive
		task = {name = Task_HumanAnims
			params = {human_anim_stage = upper
				anim_set_id = Human_Use_Explosive_Hold_Association
				blend_in_dur = 0.4
				blend_out_dur = 0.4
				finished_event_id = HumanAnims_Upper_Finished}}
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = timer state = Bv_Anims_Human_Upper_Use_Explosive_HoldTimer}]}
			{events = [playanim_use] ,
				recur = true ,
				responses = [{replacement = this state = Bv_Anims_Human_Upper_Use_Explosive}]}
			{events = [Use_Explosive_Hold_TimedOut] ,
				recur = true ,
				responses = [{replacement = this state = Bv_Anims_Human_Upper_Use_Explosive_Throw}]}
		]}
	registerstate {
		name = Bv_Anims_Human_Upper_Use_Explosive_HoldTimer
		task = {name = Task_GenEvents_Timer
			params = {min_duration_secs = 1
				max_duration_secs = 1
				event_id = Use_Explosive_Hold_TimedOut}}
		transitions = []}
	registerstate {
		name = Bv_Anims_Human_Upper_Use_Explosive_Throw
		task = {name = Task_HumanAnims
			params = {human_anim_stage = upper
				anim_set_id = Human_Use_Explosive_Throw_Association
				blend_in_dur = 0.4
				blend_out_dur = 0.4
				finished_event_id = HumanAnims_Upper_Finished}}
		transitions = [{events = [playanim_use] ,
				recur = true ,
				responses = [{replacement = this state = Bv_Anims_Human_Upper_Use_Explosive}]}
		]}
endscript

script RegisterBehaviors_Anims_Human_Upper_Use_Cannon 
	registerstate \{name = Bv_Anims_Human_Upper_Use_Cannon
		task = {
			name = task_runscript
			params = {
				script_name = PlayCannonUseAnim
			}
		}
		transitions = [
			{
				events = [
					playanim_use
				]
				recur = true
				responses = [
					{
						replacement = this
						state = Bv_Anims_Human_Upper_Use_Cannon
					}
				]
			}
		]}
endscript
