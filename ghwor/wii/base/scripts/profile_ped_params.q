DefaultLodDist1 = 20
DefautSuspendDistance = 65
DefaultRenderDistance = 65
human_creation_params = {
	skeletonname = gh3_ped_skinny
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
	windx_animlodinterleave2 = 10
}
obj_ped_skinny_creation_params = {
	skeletonname = gh3_ped_skinny
	staticanimtree = $GameObj_AnimTree
	animnodeiddeclaration = [
		Body
		BodyTimer
	]
	composite_type = animpassgameobject
	zones = [
		Global
	]
}
obj_testlevel_creation_params = {
	staticanimtree = $GameObj_AnimTree
	animnodeiddeclaration = [
		Body
		BodyTimer
	]
	composite_type = animpassgameobject
	zones = [
		Global
	]
}
obj_ven_camera_creation_params = {
	skeletonname = gh4_camera
	staticanimtree = $GameObj_AnimTree
	animnodeiddeclaration = [
		Body
		BodyTimer
	]
	composite_type = animpasswithlockgameobject
	zones = [
		Global
	]
}
obj_ven_speakercone_creation_params = {
	composite_type = speakerconegameobject
	zones = [
		Global
	]
}
obj_ven_sarcophagus_creation_params = {
	skeletonname = sarcophagus
	staticanimtree = $GameObj_AnimTree
	animnodeiddeclaration = [
		Body
		BodyTimer
	]
	composite_type = animpassgameobject
	zones = [
		Global
	]
}
obj_ven_flesh_pieces_creation_params = {
	skeletonname = skel_flesh_pieces
	staticanimtree = $GameObj_AnimTree
	animnodeiddeclaration = [
		Body
		BodyTimer
	]
	composite_type = animpassgameobject
	zones = [
		Global
	]
}
obj_ven_ground_flesh_creation_params = {
	skeletonname = skel_flesh_pieces
	staticanimtree = $GameObj_AnimTree
	animnodeiddeclaration = [
		Body
		BodyTimer
	]
	composite_type = animpassgameobject
	zones = [
		Global
	]
}
obj_ven_rh_lever_creation_params = {
	skeletonname = skel_rh_lever
	staticanimtree = $GameObj_AnimTree
	animnodeiddeclaration = [
		Body
		BodyTimer
	]
	composite_type = animpassgameobject
	zones = [
		Global
	]
}
obj_ven_rh_table_creation_params = {
	skeletonname = skel_rh_table
	staticanimtree = $GameObj_AnimTree
	animnodeiddeclaration = [
		Body
		BodyTimer
	]
	composite_type = animpassgameobject
	zones = [
		Global
	]
}
obj_ven_hb_doors_creation_params = {
	skeletonname = skel_hb_doors
	staticanimtree = $GameObj_AnimTree
	animnodeiddeclaration = [
		Body
		BodyTimer
	]
	composite_type = animpassgameobject
	zones = [
		Global
	]
}
obj_ven_ampzilla_creation_params = {
	skeletonname = gh_rocker_ampzilla
	staticanimtree = $GameObj_AnimTree
	animnodeiddeclaration = [
		Body
		BodyTimer
	]
	composite_type = ampzillagameobject
	zones = [
		Global
	]
	geomname = ampzilla
}
obj_ven_bat_creation_params = {
	skeletonname = skel_bat_newmaletrans
	staticanimtree = $GameObj_AnimTree
	animnodeiddeclaration = [
		Body
		BodyTimer
	]
	composite_type = animpassgameobject
	zones = [
		Global
	]
}
obj_ven_window_creation_params = {
	skeletonname = skel_window_newmaletrans
	staticanimtree = $GameObj_AnimTree
	animnodeiddeclaration = [
		Body
		BodyTimer
	]
	composite_type = animpassgameobject
	zones = [
		Global
	]
}
obj_ven_psdoors_creation_params = {
	skeletonname = skel_psdoors
	staticanimtree = $GameObj_AnimTree
	animnodeiddeclaration = [
		Body
		BodyTimer
	]
	composite_type = animpassgameobject
	zones = [
		Global
	]
}
obj_ven_can_creation_params = {
	skeletonname = skel_can
	staticanimtree = $GameObj_AnimTree
	animnodeiddeclaration = [
		Body
		BodyTimer
	]
	composite_type = animpassgameobject
	zones = [
		Global
	]
}
obj_ven_demi_creation_params = {
	skeletonname = skel_demi
	staticanimtree = $GameObj_AnimTree
	animnodeiddeclaration = [
		Body
		BodyTimer
	]
	composite_type = animpassgameobject
	zones = [
		Global
	]
}
obj_ven_rock_creation_params = {
	skeletonname = skel_rock
	staticanimtree = $GameObj_AnimTree
	animnodeiddeclaration = [
		Body
		BodyTimer
	]
	composite_type = animpassgameobject
	zones = [
		Global
	]
}
obj_ven_finalbattle_rocks_creation_params = {
	skeletonname = skel_finalbattle_rocks
	staticanimtree = $GameObj_AnimTree
	animnodeiddeclaration = [
		Body
		BodyTimer
	]
	composite_type = animpassgameobject
	zones = [
		Global
	]
}
