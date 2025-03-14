skater_components = [
	{
		component = suspend
	}
	{
		component = bbox
	}
	{
		component = skaterstate
	}
	{
		component = input
	}
	{
		component = debugcamera
	}
	{
		component = skaterscore
	}
	{
		component = skatermatrixqueries
	}
	{
		component = trick
	}
	{
		component = skaterphysicscontrol
	}
	{
		component = collisioncache
	}
	{
		component = skatercorephysics
	}
	{
		component = skaterrotate
	}
	{
		component = skatergap
	}
	{
		component = skateradjustphysics
	}
	{
		component = trigger
	}
	{
		component = skaterfinalizephysics
	}
	{
		component = records
	}
	{
		component = skaterstats
	}
	{
		component = bodycheck
	}
	{
		component = NailTheTrick
	}
	{
		component = nailthetrickscore
	}
	{
		component = nailthemanual
	}
	{
		component = nailthegrab
	}
	{
		component = locator
		$player_profile
	}
	{
		component = navcollision
		$player_profile
	}
	{
		component = walk
	}
	{
		component = continuousterrainparticle
		continuousterrainparticlesscript = hero_continuousterrainparticles_off
	}
	{
		component = skaterlocalnetlogic
	}
	{
		component = skaterendrun
	}
	{
		component = skaterbalancetrick
	}
	{
		component = skaterragdollcollision
	}
	{
		component = skaterragdollbail
	}
	{
		component = skaterragdollanim
	}
	{
		component = sound
	}
	{
		component = stream
	}
	{
		component = skaterloopingsound
	}
	{
		component = skaterwindsound
	}
	{
		component = movablecontact
	}
	{
		component = skaterruntimer
	}
	{
		component = timenotification
	}
	{
		component = skatermocap
	}
	{
		component = aiinfo
		$player_profile
	}
	{
		component = targetable
		$player_profile
	}
	{
		component = agent
		$player_profile
	}
	{
		component = vision
		$player_profile
	}
	{
		component = proximtrigger
		$skater_proxim_trigger_params
	}
	{
		component = skaterstatehistory
	}
	{
		component = skaterflipandrotate
	}
	{
		component = interactivewater
		interact_with_water = on
	}
	{
		component = skaterprofile
	}
	{
		component = animinfo
		active_value_set = skater
	}
	{
		component = skater_wall_game
	}
	{
		component = motion
	}
	{
		component = objectproximity
	}
	{
		component = lockobj
	}
	{
		component = displayrotation
	}
	{
		component = animtree
		animeventtablename = skateranimeventtable
		defaultcommandtarget = body
		defaultwaittarget = bodytimer
		posestoresize = $skater_pose_store_size
	}
	{
		component = skeleton
		$skaterprofile
		minbonepriority = 10
	}
	{
		component = ragdoll
		process_collision_script = ragdoll_process_collisions
		initialize_empty = false
		allow_gravity_adjustment = true
		core_rigid_body_toi_quality = true
		core_constraint_toi_quality = true
		accessory_rigid_body_toi_quality = false
		accessory_constraint_toi_quality = false
		$skaterprofile
	}
	{
		component = model
		max_scene_lights = 2
		ripplecreator
		usemodellights
	}
	{
		component = vibration
	}
	{
		component = skatersound
	}
	{
		component = animexport
	}
	{
		component = skatersoundrecording
	}
]
nonlocal_skater_components = [
	{
		component = skaterstate
	}
	{
		component = skaterscore
	}
	{
		component = skaternonlocalnetlogic
	}
	{
		component = skaterfloatingname
	}
	{
		component = skaterendrun
	}
	{
		component = skaterloopingsound
	}
	{
		component = skaterstatehistory
	}
	{
		component = skaterflipandrotate
	}
	{
		component = interactivewater
		interact_with_water = on
	}
	{
		component = skaterprofile
	}
	{
		component = skater_wall_game
	}
	{
		component = motion
	}
	{
		component = objectproximity
	}
	{
		component = sound
	}
	{
		component = stream
	}
	{
		component = lockobj
	}
	{
		component = displayrotation
	}
	{
		component = animtree
		animeventtablename = skateranimeventtable
		defaultcommandtarget = body
		defaultwaittarget = bodytimer
		posestoresize = $skater_pose_store_size
	}
	{
		component = skeleton
		$skaterprofile
		minbonepriority = 10
	}
	{
		component = ragdoll
		initialize_empty = false
		$skaterprofile
	}
	{
		component = model
		max_scene_lights = 2
		ripplecreator
		interactivewater
		usemodellights
	}
]
skaterprofile = {
	skeletonname = sk9_skater
	ragdollname = ragdoll_human
	accessoryragdollname = ragdoll_human_acc
}
Skater_Ragdoll_BoneAnimLimits = [
	{
		bone = bone_acc_shirt_back
		positive_x = false
		negative_x = false
		positive_y = true
		negative_y = true
		positive_z = false
		negative_z = false
	}
	{
		bone = bone_acc_shirt_l
		positive_x = false
		negative_x = false
		positive_y = false
		negative_y = true
		positive_z = false
		negative_z = false
	}
	{
		bone = bone_acc_shirt_r
		positive_x = false
		negative_x = false
		positive_y = true
		negative_y = false
		positive_z = false
		negative_z = false
	}
	{
		bone = bone_acc_hood
		positive_x = true
		negative_x = true
		positive_y = true
		negative_y = true
		positive_z = false
		negative_z = true
	}
	{
		bone = bone_acc_pantleg_r
		positive_x = false
		negative_x = false
		positive_y = true
		negative_y = true
		positive_z = true
		negative_z = true
	}
	{
		bone = bone_acc_pantleg_l
		positive_x = false
		negative_x = false
		positive_y = true
		negative_y = true
		positive_z = true
		negative_z = true
	}
	{
		bone = bone_acc_hair_t
		positive_x = false
		negative_x = false
		positive_y = true
		negative_y = true
		positive_z = true
		negative_z = true
	}
]
