
script agent_init 
	agent_getspecies
	distance_above = 2.0
	distance_below = 7.5
	obj_getid
	switch <species>
		case human
		settags bone_collision_grouping = ped_bone_grouping_1
		behavior_replacehierarchy {hierarchy = reaction
			state = Bv_SkatePedReactionBase}
		behavior_replacehierarchy {hierarchy = animation ,
			state = Bv_Anims}
		case vehicle
		<objid> :obj_getposition
		<objid> :obj_setposition position = (<pos> + (0.0, 1.0, 0.0))
		Navigation_PauseStickToGround
		Navigation_SetStickToGround distance_above = <distance_above> distance_below = <distance_below>
		case skateboard
		behavior_replacehierarchy {hierarchy = animation ,
			state = Bv_Anims_Skateboard}
		case horse
		if compositeobjectexists hero
			if hero :Ride_GetMountId
				if (<MountId> = <objid>)
					AddFlag is_mounted_by_hero
				endif
			endif
		endif
		case cow
		settags bone_collision_grouping = cow_bone_grouping_1
		behavior_replacehierarchy {hierarchy = reaction
			state = Bv_SkatePedReactionBase}
		behavior_replacehierarchy {hierarchy = animation ,
			state = Bv_Anims_Animal_NoMoveShuffle}
		CreateHorseDustParticleSystem particleParentID = <objid> params_script = JOW_PedBigAnimalDust01_particle_params
		case wolf
		settags bone_collision_grouping = wolf_bone_grouping_1
		behavior_replacehierarchy {hierarchy = reaction
			state = Bv_SkatePedReactionBase}
		behavior_replacehierarchy {hierarchy = animation ,
			state = Bv_Anims_Animal}
		CreateHorseDustParticleSystem particleParentID = <objid> params_script = JOW_PedDust01_particle_params
		case bear
		settags bone_collision_grouping = bear_bone_grouping_1
		behavior_replacehierarchy {hierarchy = reaction
			state = Bv_SkatePedReactionBase}
		behavior_replacehierarchy {hierarchy = animation ,
			state = Bv_Anims_Animal_NoMoveShuffle}
		CreateHorseDustParticleSystem particleParentID = <objid> params_script = JOW_PedBigAnimalDust01_particle_params
		case elk
		settags bone_collision_grouping = elk_bone_grouping_1
		behavior_replacehierarchy {hierarchy = reaction
			state = Bv_SkatePedReactionBase}
		behavior_replacehierarchy {hierarchy = animation ,
			state = Bv_Anims_Animal}
		CreateHorseDustParticleSystem particleParentID = <objid> params_script = JOW_PedBigAnimalDust01_particle_params
		case bird
		settags bone_collision_grouping = quail_bone_grouping_1
		behavior_replacehierarchy {hierarchy = reaction
			state = Bv_SkatePedReactionBase}
		behavior_replacehierarchy {hierarchy = animation ,
			state = Bv_Anims_Animal_NoMoveShuffle}
		case small_animal
		settags bone_collision_grouping = prairie_dog_bone_grouping_1
		behavior_replacehierarchy {hierarchy = reaction
			state = Bv_SkatePedReactionBase}
		behavior_replacehierarchy {hierarchy = animation ,
			state = Bv_Anims_Animal_NoMoveShuffle}
		CreateHorseDustParticleSystem particleParentID = <objid> params_script = JOW_PedDust01_particle_params
	endswitch
	obj_sticktoground off
endscript

script BehaviorSystem_SetDefaultHierarchies 
	behavior_replacehierarchy \{hierarchy = reaction
		state = Bv_SkatePedReactionBase}
endscript

script Agent_SetDefaultParams 
endscript
