DefaultLodDist1 = 20
DefautSuspendDistance = 65
DefaultRenderDistance = 65
human_creation_params = {
	skeletonname = GH3_ped
	SuspendDistance = $DefautSuspendDistance
	lod_dist1 = $DefaultLodDist1
	lod_dist2 = $DefaultRenderDistance
	behavior_style = Bv_Agent
	agent_stats = stats_civilian
	targeting = $targeting_human
	navigation = $nav_ped
	char_collision = Agent
	char_collision_height = 1.8
	char_collision_radius = 0.3
	anim_class = human
	species = human
	inventory = $inventory_fist
	MaxBonePriority = 9
	voice_profile = TeenMaleSkater1
	faction = $faction_human
	sex = male
	notice_radius = 6.0
	AnimLODInterleave2 = 6
	PS3_AnimLODInterleave2 = 10
	Xenon_AnimLODInterleave2 = 10
}
obj_testlevel_creation_params = {
	Tree = $GameObj_AnimTree
	AnimTargets = [
		Body
		BodyTimer
	]
	zones = [
		Global
	]
}
obj_ven_camera_creation_params = {
	skeletonname = gh3_camera
	Tree = $GameObj_AnimTree
	AnimTargets = [
		Body
		BodyTimer
	]
	zones = [
		Global
	]
}
obj_ven_record_creation_params = {
	skeletonname = skel_encore_record
	Tree = $GameObj_AnimTree
	AnimTargets = [
		Body
		BodyTimer
	]
	zones = [
		Global
	]
}
