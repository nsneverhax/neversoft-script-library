defaultloddist1 = 20
defautsuspenddistance = 59
defaultrenderdistance = 59
DefaultVehicleRenderDistance = 80
DefautVehicleSuspendDistance = 80
GoalPedSuspendDistance = 47
GoalPedRenderDistance = 100
SkateboardSuspendDistance = 85
SkateboardRenderDistance = 85
AttackerSuspendDistance = 59
AttackerLOD_dist1 = 59
AttackerLOD_dist2 = 60
ped_fade_distance = 30.0
goalped_fade_distance = 48.0
vehicle_fade_distance = 48.0
human_common_creation_params = {
	object_type = object_type_ped
	composite_type = compositehuman
	species = human
	targeting = $targeting_human
	faction = $faction_human
	char_collision_height = 1.8
	char_collision_radius = 0.3
	anim_class = human
	inventory = $inventory_fist
	maxbonepriority = 9
	defaultcommandtarget = pedmainanimparentnode
	defaultwaittarget = pedmainanimparentnode
	animeventtablename = PedAnimEventTable
	profilecolor = 12583104
	profilebudget = 4000.0
	ragdollname = ragdoll_human
	fade_distance = $ped_fade_distance
	process_collision_script = agent_processragdollcollisions
}
human_creation_params = {
	$human_common_creation_params
	skeletonname = Sk9_PED_Regular
	suspenddistance = $defautsuspenddistance
	lod_dist1 = $defaultloddist1
	lod_dist2 = $defaultrenderdistance
	behavior_style = bv_agent
	agent_stats = stats_civilian
	navigation = $nav_ped
	char_collision = agent
	voice_profile = teenmaleskater1
	sex = male
	notice_radius = 6.0
}
dummy_creation_params = {
	$human_creation_params
	dummy_ped = true
	agent_stats = stats_dummy
	navigation = $nav_dummy
}
spectator_creation_params = {
	$human_creation_params
	dummy_ped = true
	agent_stats = stats_spectator
	navigation = $nav_ped_no_resident_collision
}
goalped_creation_params = {
	$human_creation_params
	skeletonname = SK9_PED_Goal
	suspenddistance = $GoalPedSuspendDistance
	lod_dist2 = $GoalPedRenderDistance
	agent_stats = stats_goal_ped
	navigation = $nav_ped_no_push
	anim_profile = gped_anim_profile
	compassbliptype = goal
	voice_profile = Photographer
	goal_giver = true
	fade_distance = $goalped_fade_distance
}
skater_creation_params = {
	$human_creation_params
}
criticalgoalped_creation_params = {
	$goalped_creation_params
	navigation = $nav_ped_no_resident_collision
	agent_stats = stats_critical_goal_ped
}
criticalped_creation_params = {
	$human_creation_params
	navigation = $nav_ped_no_resident_collision
	agent_stats = stats_critical_ped
}
vehicle_common_creation_params = {
	object_type = object_type_ped
	composite_type = compositevehicle
	faction = $faction_empty
	has_vision = false
	has_havok_collision = true
	collisionmode = agent
	vehicle_physics = $VehiclePhysics_Default
	nonskinned
	profilecolor = 12583104
	profilebudget = 4000.0
	fade_distance = $vehicle_fade_distance
	ripplecreator
}
vehicle_creation_params = {
	$vehicle_common_creation_params
	suspenddistance = $DefautVehicleSuspendDistance
	lod_dist1 = $defaultloddist1
	lod_dist2 = $DefaultVehicleRenderDistance
	kill_distance = $vehicle_coim_max_distance
	coim_min_offscreen_dist = $coim_vehicle_min_offscreen_dist
	behavior_style = bv_agent
	agent_stats = stats_vehicle
	navigation = $nav_vehicle
	species = vehicle
	voice_profile = Generic_Vehicle
	vehicle_sound_profile = GenericVehicle
}
obj_security_creation_params = {
	skeletonname = Sk9_PED_Regular
	tree = $gameobj_animtree
	animtargets = [
		body
		bodytimer
	]
	zones = [
		global
	]
}
