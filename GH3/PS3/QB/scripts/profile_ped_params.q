DefaultLodDist1 = 20
DefautSuspendDistance = 65
DefaultRenderDistance = 65
human_creation_params = {
	SkeletonName = GH3_Ped
	SuspendDistance = $DefautSuspendDistance
	lod_dist1 = $DefaultLodDist1
	lod_dist2 = $DefaultRenderDistance
	behavior_style = Bv_Agent
	agent_stats = stats_civilian
	targeting = $targeting_human
	Navigation = $nav_ped
	char_collision = Agent
	char_collision_height = 1.8
	char_collision_radius = 0.3
	anim_class = human
	species = human
	Inventory = $inventory_fist
	MaxBonePriority = 9
	voice_profile = TeenMaleSkater1
	faction = $faction_human
	sex = Male
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
	Zones = [
		Global
	]
}
obj_security_creation_params = {
	SkeletonName = GH3_Ped
	Tree = $GameObj_AnimTree
	AnimEventTableName = ped_animevents
	AnimTargets = [
		Body
		BodyTimer
	]
	Zones = [
		Global
	]
}
obj_police_creation_params = {
	SkeletonName = GH3_Ped
	Tree = $GameObj_AnimTree
	AnimTargets = [
		Body
		BodyTimer
	]
	Zones = [
		Global
	]
}
obj_hoop_creation_params = {
	SkeletonName = GH3_Ped
	Tree = $GameObj_AnimTree
	AnimTargets = [
		Body
		BodyTimer
	]
	Zones = [
		Global
	]
}
obj_Ven_ArtDeco_Knight1_creation_params = {
	SkeletonName = Ven_ArtDeco_Knight1
	Tree = $GameObj_AnimTree
	AnimTargets = [
		Body
		BodyTimer
	]
	AnimEventTableName = z_artdeco_animevents
	Zones = [
		Global
	]
}
obj_Ven_ArtDeco_Knight2_creation_params = {
	SkeletonName = Ven_ArtDeco_Knight2
	Tree = $GameObj_AnimTree
	AnimTargets = [
		Body
		BodyTimer
	]
	AnimEventTableName = z_artdeco_animevents
	Zones = [
		Global
	]
}
obj_Ven_ArtDeco_Dragon_creation_params = {
	SkeletonName = Ven_ArtDeco_Dragon
	Tree = $GameObj_AnimTree
	AnimTargets = [
		Body
		BodyTimer
	]
	AnimEventTableName = z_artdeco_animevents
	Zones = [
		Global
	]
}
obj_Ven_Prison_Gas_creation_params = {
	SkeletonName = Ven_Prison_Gas
	Tree = $GameObj_AnimTree
	AnimTargets = [
		Body
		BodyTimer
	]
	AnimEventTableName = z_prison_animevents
	Zones = [
		Global
	]
}
obj_dancer_creation_params = {
	SkeletonName = GH3_Ped_Dancer
	Tree = $GameObj_AnimTree
	AnimTargets = [
		Body
		BodyTimer
	]
	Zones = [
		Global
	]
}
obj_caged_creation_params = {
	SkeletonName = GH3_Ped_Dancer
	Tree = $GameObj_AnimTree
	AnimTargets = [
		Body
		BodyTimer
	]
	Zones = [
		Global
	]
}
obj_devilgirl_creation_params = {
	SkeletonName = GH3_Ped_DevilGirl
	Tree = $GameObj_RagdollAnimTree
	RagdollName = Ragdoll_DevilGirl
	accessory_bones = $DevilGirl_accessory_bones
	RagdollCollisionGroup = $RagdollCollisionGroups_DevilGirl
	initialize_empty = FALSE
	disable_collision_callbacks
	AnimTargets = [
		Body
		BodyTimer
	]
	Zones = [
		Global
	]
}
obj_puppet_creation_params = {
	SkeletonName = GH3_Guitarist_Satan
	Tree = $GameObj_AnimTree
	AnimTargets = [
		Body
		BodyTimer
	]
	Zones = [
		Global
	]
}
obj_Ven_Hell_Hammer_creation_params = {
	SkeletonName = Ven_Hell_Hammer
	Tree = $GameObj_AnimTree
	AnimTargets = [
		Body
		BodyTimer
	]
	AnimEventTableName = Z_Hell_AnimEvents
	Zones = [
		Global
	]
}
