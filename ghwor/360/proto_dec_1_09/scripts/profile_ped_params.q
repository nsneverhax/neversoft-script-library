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
obj_ven_ampzilla_creation_params = {
	skeletonname = gh_rocker_ampzilla
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
obj_ven_tentacle_creation_params = {
	skeletonname = gh_encore_tentacles
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
obj_ven_skull_creation_params = {
	skeletonname = skel_encore_skull
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
obj_ven_jet01_creation_params = {
	skeletonname = skel_encore_jet01
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
obj_ven_jet02_creation_params = {
	skeletonname = skel_encore_jet02
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
obj_ven_jet03_creation_params = {
	skeletonname = skel_encore_jet03
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
obj_ven_jet04_creation_params = {
	skeletonname = skel_encore_jet04
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
obj_ven_altar_creation_params = {
	skeletonname = skel_encore_altar
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
obj_ven_farriswheel_creation_params = {
	skeletonname = skel_encore_farriswheel
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
obj_ven_mainball_creation_params = {
	skeletonname = skel_encore_mainball
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
obj_ven_ball01_creation_params = {
	skeletonname = skel_encore_ball01
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
obj_ven_ball02_creation_params = {
	skeletonname = skel_encore_ball02
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
obj_ven_ball03_creation_params = {
	skeletonname = skel_encore_ball03
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
obj_ven_buffalo_creation_params = {
	skeletonname = gh_buffalo
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
obj_ven_pingpong_creation_params = {
	skeletonname = skel_encore_pingpong
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
obj_ven_cup_creation_params = {
	skeletonname = skel_encore_cup
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
obj_ven_arrows01_creation_params = {
	skeletonname = skel_encore_arrows01
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
obj_ven_arrows02_creation_params = {
	skeletonname = skel_encore_arrows02
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
obj_ven_arrows03_creation_params = {
	skeletonname = skel_encore_arrows03
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
obj_ven_arrows04_creation_params = {
	skeletonname = skel_encore_arrows04
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
obj_ven_arrows05_creation_params = {
	skeletonname = skel_encore_arrows05
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
obj_ven_arrows06_creation_params = {
	skeletonname = skel_encore_arrows06
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
obj_ven_arrows07_creation_params = {
	skeletonname = skel_encore_arrows07
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
obj_ven_arrow01_creation_params = {
	skeletonname = skel_encore_arrow01
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
obj_ven_cauldron_creation_params = {
	skeletonname = skel_encore_cauldron
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
obj_ven_bandart_creation_params = {
	skeletonname = skel_encore_bandart
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
obj_ven_record_creation_params = {
	skeletonname = skel_encore_record
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
obj_ven_bar_creation_params = {
	skeletonname = skel_encore_bar
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
obj_ven_chandelier_creation_params = {
	skeletonname = skel_encore_chandelier
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
obj_ven_can01_creation_params = {
	skeletonname = skel_encore_can01
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
obj_ven_can02_creation_params = {
	skeletonname = skel_encore_can02
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
obj_ven_ceilinglight_creation_params = {
	skeletonname = skel_encore_ceilinglight
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
obj_ven_bottle_creation_params = {
	skeletonname = skel_encore_bottle
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
obj_ven_griffin_creation_params = {
	skeletonname = skel_newyork_outro_griffin
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
obj_ven_mask_creation_params = {
	skeletonname = skel_encore_mask
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
obj_ven_drumriser_creation_params = {
	skeletonname = skel_encore_drumriser
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
obj_ven_freakcurtain_creation_params = {
	skeletonname = skel_encore_freakcurtain
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
obj_ven_ship_creation_params = {
	skeletonname = skel_encore_ship
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
obj_ven_crypt_creation_params = {
	skeletonname = skel_encore_crypt
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
obj_ven_norwaydoor_creation_params = {
	skeletonname = skel_encore_norwaydoor
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
obj_ven_train_creation_params = {
	skeletonname = skel_encore_train
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
