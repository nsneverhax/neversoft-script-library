defaultloddist1 = 20
defautsuspenddistance = 65
defaultrenderdistance = 65
human_creation_params = {
	skeletonname = gh3_ped_skinny
	suspenddistance = $defautsuspenddistance
	lod_dist1 = $defaultloddist1
	lod_dist2 = $defaultrenderdistance
	behavior_style = bv_agent
	agent_stats = stats_civilian
	targeting = $targeting_human
	navigation = $nav_ped
	char_collision = agent
	char_collision_height = 1.8
	char_collision_radius = 0.3
	anim_class = human
	species = human
	inventory = $inventory_fist
	maxbonepriority = 9
	voice_profile = teenmaleskater1
	faction = $faction_human
	sex = male
	notice_radius = 6.0
	animlodinterleave2 = 6
	ps3_animlodinterleave2 = 10
	xenon_animlodinterleave2 = 10
	windx_animlodinterleave2 = 10
}
obj_ped_skinny_creation_params = {
	skeletonname = gh3_ped_skinny
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_testlevel_creation_params = {
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_camera_creation_params = {
	skeletonname = gh4_camera
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpasswithlockgameobject
	zones = [
		global
	]
}
obj_ven_speakercone_creation_params = {
	composite_type = speakerconegameobject
	zones = [
		global
	]
}
obj_ven_sarcophagus_creation_params = {
	skeletonname = sarcophagus
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_flesh_pieces_creation_params = {
	skeletonname = skel_flesh_pieces
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_ground_flesh_creation_params = {
	skeletonname = skel_flesh_pieces
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_rh_lever_creation_params = {
	skeletonname = skel_rh_lever
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_rh_table_creation_params = {
	skeletonname = skel_rh_table
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_hb_doors_creation_params = {
	skeletonname = skel_hb_doors
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_ampzilla_creation_params = {
	skeletonname = gh_rocker_ampzilla
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = ampzillagameobject
	zones = [
		global
	]
	geomname = ampzilla
}
obj_ven_bat_creation_params = {
	skeletonname = skel_bat_newmaletrans
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_window_creation_params = {
	skeletonname = skel_window_newmaletrans
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_tentacle_creation_params = {
	skeletonname = gh_encore_tentacles
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_skull_creation_params = {
	skeletonname = skel_encore_skull
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_jet01_creation_params = {
	skeletonname = skel_encore_jet01
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_jet02_creation_params = {
	skeletonname = skel_encore_jet02
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_jet03_creation_params = {
	skeletonname = skel_encore_jet03
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_jet04_creation_params = {
	skeletonname = skel_encore_jet04
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_altar_creation_params = {
	skeletonname = skel_encore_altar
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_farriswheel_creation_params = {
	skeletonname = skel_encore_farriswheel
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_mainball_creation_params = {
	skeletonname = skel_encore_mainball
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_ball01_creation_params = {
	skeletonname = skel_encore_ball01
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_ball02_creation_params = {
	skeletonname = skel_encore_ball02
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_ball03_creation_params = {
	skeletonname = skel_encore_ball03
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_buffalo_creation_params = {
	skeletonname = gh_buffalo
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_pingpong_creation_params = {
	skeletonname = skel_encore_pingpong
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_cup_creation_params = {
	skeletonname = skel_encore_cup
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_arrows01_creation_params = {
	skeletonname = skel_encore_arrows01
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_arrows02_creation_params = {
	skeletonname = skel_encore_arrows02
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_arrows03_creation_params = {
	skeletonname = skel_encore_arrows03
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_arrows04_creation_params = {
	skeletonname = skel_encore_arrows04
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_arrows05_creation_params = {
	skeletonname = skel_encore_arrows05
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_arrows06_creation_params = {
	skeletonname = skel_encore_arrows06
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_arrows07_creation_params = {
	skeletonname = skel_encore_arrows07
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_arrow01_creation_params = {
	skeletonname = skel_encore_arrow01
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_cauldron_creation_params = {
	skeletonname = skel_encore_cauldron
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_bandart_creation_params = {
	skeletonname = skel_encore_bandart
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_record_creation_params = {
	skeletonname = skel_encore_record
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_bar_creation_params = {
	skeletonname = skel_encore_bar
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_chandelier_creation_params = {
	skeletonname = skel_encore_chandelier
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_can01_creation_params = {
	skeletonname = skel_encore_can01
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_can02_creation_params = {
	skeletonname = skel_encore_can02
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_ceilinglight_creation_params = {
	skeletonname = skel_encore_ceilinglight
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_bottle_creation_params = {
	skeletonname = skel_encore_bottle
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_griffin_creation_params = {
	skeletonname = skel_newyork_outro_griffin
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_mask_creation_params = {
	skeletonname = skel_encore_mask
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_drumriser_creation_params = {
	skeletonname = skel_encore_drumriser
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_freakcurtain_creation_params = {
	skeletonname = skel_encore_freakcurtain
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_ship_creation_params = {
	skeletonname = skel_encore_ship
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_crypt_creation_params = {
	skeletonname = skel_encore_crypt
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_norwaydoor_creation_params = {
	skeletonname = skel_encore_norwaydoor
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_train_creation_params = {
	skeletonname = skel_encore_train
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_psdoors_creation_params = {
	skeletonname = skel_psdoors
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_can_creation_params = {
	skeletonname = skel_can
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_demi_creation_params = {
	skeletonname = skel_demi
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_rock_creation_params = {
	skeletonname = skel_rock
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
obj_ven_finalbattle_rocks_creation_params = {
	skeletonname = skel_finalbattle_rocks
	staticanimtree = $gameobj_animtree
	animnodeiddeclaration = [
		body
		bodytimer
	]
	composite_type = animpassgameobject
	zones = [
		global
	]
}
