object_default_rigidbody = {
	bouncy
	sound_type = `default`
}
object_skateable_rigidbody = {
	bouncy
	tier = interactive
}
profile_go_aluminum_can = {
	model = 'Props\\GO_Aluminum_Can\\GO_Aluminum_Can.mdl'
	collisionmode = geometry
	mass = 0.25
	contact_script = contact_terraineffects
	sound_type = aluminumcan
}
profile_go_basketball = {
	model = 'Props\\GO_BasketBall\\GO_BasketBall.mdl'
	collisionmode = geometry
	mass = 3.0
	restitution = 0.8
	contact_script = contact_terraineffects
}
profile_go_beer_bottle = {
	model = 'Props\\GO_Beer_Bottle\\GO_Beer_Bottle.mdl'
	collisionmode = geometry
	mass = 1.0
	contact_script = contact_terraineffects
	sound_type = glassbottle
}
profile_go_cafe_chair = {
	model = 'Props\\GO_Cafe_Chair\\GO_Cafe_Chair.mdl'
	collisionmode = geometry
	mass = 6.0
	contact_script = contact_go_cafe_chair
	sound_type = woodchair
}
profile_go_cafe_table = {
	model = 'Props\\GO_Cafe_Table\\GO_Cafe_Table.mdl'
	collisionmode = geometry
	mass = 10.0
	contact_script = contact_terraineffects
	sound_type = woodtable
}
profile_go_cardboard_box = {
	model = 'Props\\GO_Cardboard_Box\\GO_Cardboard_Box.mdl'
	collisionmode = geometry
	mass = 3.0
	contact_script = contact_terraineffects
	sound_type = cardboardbox
}
profile_go_40ozglassbottle = {
	model = 'Props\\GO_40ozGlassBottle\\GO_40ozGlassBottle.mdl'
	collisionmode = geometry
	mass = 1.0
	contact_script = contact_terraineffects
	sound_type = glassbottle
}
profile_go_40ozbottledwater = {
	model = 'Props\\GO_40ozBottledWater\\GO_40ozBottledWater.mdl'
	collisionmode = geometry
	mass = 1.0
	contact_script = contact_terraineffects
	sound_type = waterbottle
}
profile_go_greciansuburbflowers = {
	model = 'Props\\GO_GrecianSuburbFlowers\\GO_GrecianSuburbFlowers.mdl'
	collisionmode = geometry
	linear_damping = 0.8
	mass = 40
	restitution = 0.2
	contact_script = contact_pottedplant_short
	sound_type = pottedsuburbplant
}
profile_go_half_crushed_aluminumcan = {
	model = 'Props\\GO_Half_Crushed_AluminumCan\\GO_Half_Crushed_AluminumCan.mdl'
	collisionmode = geometry
	mass = 0.25
	contact_script = contact_terraineffects
	sound_type = aluminumcan
}
profile_go_lightstandlevel = {
	model = 'Props\\GO_LightStandLevel\\GO_LightStandLevel.mdl'
	collisionmode = geometry
	linear_damping = 0.2
	angular_damping = 0.05
	mass = 8.0
	restitution = 0.1
	contact_script = contact_terraineffects
	sound_type = photolightstand
}
profile_go_lightstandup45 = {
	model = 'Props\\GO_LightStandUp45\\GO_LightStandUp45.mdl'
	collisionmode = geometry
	linear_damping = 0.2
	angular_damping = 0.05
	mass = 8.0
	restitution = 0.1
	contact_script = contact_terraineffects
	sound_type = photolightstand
}
profile_go_metalbarrelgreen = {
	model = 'Props\\GO_MetalBarrelGreen\\GO_MetalBarrelGreen.mdl'
	collisionmode = geometry
	angular_damping = 1.0
	linear_damping = 2
	mass = 100
	restitution = 0.2
	contact_script = contact_terraineffects
	sound_type = metaldrum50gal
}
profile_go_pizza_box = {
	model = 'Props\\GO_Pizza_Box\\GO_Pizza_Box.mdl'
	collisionmode = geometry
	mass = 1.0
	contact_script = contact_terraineffects
	sound_type = cardboardbox
}
profile_go_plywood_small_piece = {
	model = 'Props\\GO_Plywood_Small_Piece\\GO_Plywood_Small_Piece.mdl'
	collisionmode = geometry
	linear_damping = 0.2
	mass = 8.0
	contact_script = contact_settle_die
	deactivate_script = deactivate_plywoodsmall
	sound_type = plywoodplank
}
profile_go_plywood_medium_piece = {
	model = 'Props\\GO_Plywood_Medium_Piece\\GO_Plywood_Medium_Piece.mdl'
	collisionmode = geometry
	linear_damping = 0.5
	mass = 20.0
	restitution = 0.2
	contact_script = contact_plywood
	sound_type = plywoodplank
}
profile_go_plywood_large_piece = {
	model = 'Props\\GO_Plywood_Large_Piece\\GO_Plywood_Large_Piece.mdl'
	collisionmode = geometry
	linear_damping = 0.7
	mass = 30.0
	restitution = 0.2
	contact_script = contact_plywood
	sound_type = plywoodplank
}
profile_go_recycle_bin = {
	model = 'Props\\GO_Recycle_Bin\\GO_Recycle_Bin.mdl'
	collisionmode = geometry
	linear_damping = 0.2
	mass = 8
	contact_script = contact_terraineffects
	sound_type = plastictrashcan
}
profile_go_rubbertrashcan = {
	model = 'Props\\Go_RubberTrashCan\\GO_RubberTrashCan.mdl'
	collisionmode = geometry
	linear_damping = 0.2
	mass = 8
	contact_script = contact_terraineffects
	sound_type = plastictrashcan
}
profile_go_snowman = {
	model = 'Props\\GO_Snowman\\GO_Snowman.mdl'
	collisionmode = geometry
	linear_damping = 0.2
	mass = 8.0
	restitution = 0.2
	contact_script = contact_terraineffects
}
profile_go_soda_cup = {
	model = 'Props\\GO_Soda_Cup\\GO_Soda_Cup.mdl'
	collisionmode = geometry
	mass = 1.0
	contact_script = contact_terraineffects
	sound_type = sodacup
}
profile_go_suburbplant = {
	model = 'Props\\Go_SuburbPlant\\Go_SuburbPlant.mdl'
	collisionmode = geometry
	linear_damping = 0.5
	mass = 15
	restitution = 0.2
	contact_script = contact_pottedplant_short
	sound_type = pottedsuburbplant
}
profile_go_topiarytree = {
	model = 'Props\\GO_TopiaryTree\\GO_TopiaryTree.mdl'
	collisionmode = geometry
	linear_damping = 1.4
	mass = 80
	restitution = 0.2
	contact_script = contact_pottedplant_tall
	sound_type = pottedsuburbplant
}
profile_go_trafficcone = {
	model = 'Props\\GO_TrafficCone\\GO_TrafficCone.mdl'
	collisionmode = geometry
	linear_damping = 0.4
	mass = 12.0
	contact_script = contact_terraineffects
	sound_type = orangetrafficcone
}
profile_go_trash_can = {
	model = 'Props\\GO_Trash_Can\\GO_Trash_Can.mdl'
	collisionmode = geometry
	linear_damping = 0.2
	mass = 12
	contact_script = contact_terraineffects
	sound_type = metaltrashcan
}
profile_go_wreath = {
	model = 'Props\\GO_Wreath\\GO_Wreath.mdl'
	collisionmode = geometry
	linear_damping = 0.2
	mass = 1.5
	restitution = 0.2
	contact_script = contact_terraineffects
}
profile_go_schoolbanner = {
	model = 'peds\\props\\school_banner_01.skin'
	skeletonname = school_banner
	tree = $gameobj_animtree
	animtargets = [
		body
		bodytimer
	]
}
profile_go_schoolflag = {
	model = 'Props\\default_flag\\flag_diagonal.skin'
	skeletonname = flag_diagonal
	tree = $gameobj_animtree
	animtargets = [
		body
		bodytimer
	]
	scale = (6.0, 6.0, 6.0)
}
profile_go_shopsflag = {
	model = 'Props\\default_flag\\flag_vertical.skin'
	skeletonname = flag_vertical
	tree = $gameobj_animtree
	animtargets = [
		body
		bodytimer
	]
	scale = (4.0, 4.0, 4.0)
}
profile_go_centerflag01 = {
	model = 'Props\\default_flag\\flag_diagonal.skin'
	skeletonname = flag_diagonal
	tree = $gameobj_animtree
	animtargets = [
		body
		bodytimer
	]
	scale = (6.0, 6.0, 6.0)
}
profile_go_centerflag02 = {
	model = 'Props\\default_flag\\flag_vertical.skin'
	skeletonname = flag_vertical
	tree = $gameobj_animtree
	animtargets = [
		body
		bodytimer
	]
	scale = (6.0, 6.0, 6.0)
}
profile_go_centerflag03 = {
	model = 'Props\\default_flag\\flag_vertical.skin'
	skeletonname = flag_vertical
	tree = $gameobj_animtree
	animtargets = [
		body
		bodytimer
	]
	scale = (6.0, 6.0, 6.0)
}
profile_so_ball = {
	model = 'Props\\SO_Ball\\SO_Ball.mdl'
	collisionmode = geometry
	mass = 40.0
	tier = interactive
}
profile_so_box = {
	model = 'Props\\SO_Box\\SO_Box.mdl'
	collisionmode = geometry
	mass = 40.0
	tier = interactive
}
profile_so_leaner = {
	model = 'Props\\SO_Leaner\\SO_Leaner.mdl'
	collisionmode = geometry
	mass = 40.0
	tier = interactive
}
profile_so_wedge = {
	model = 'Props\\SO_Wedge\\SO_Wedge.mdl'
	collisionmode = geometry
	mass = 40.0
	tier = interactive
}
profile_so_teter = {
	model = 'Props\\SO_Teter\\SO_Teter.mdl'
	collisionmode = geometry
	mass = 40.0
	tier = interactive
}
profile_so_wall = {
	model = 'Props\\SO_Wall\\SO_Wall.mdl'
	collisionmode = geometry
	mass = 40.0
	tier = interactive
}
profile_so_low_grind = {
	model = 'Props\\SO_Low_Grind\\SO_Low_Grind.mdl'
	collisionmode = geometry
	mass = 40.0
	tier = interactive
}
profile_so_med_qp = {
	model = 'Props\\SO_MED_QP\\SO_MED_QP.mdl'
	collisionmode = geometry
	mass = 40.0
	tier = interactive
}
profile_so_nata_pyramid = {
	model = 'Props\\SO_Nata_Pyramid\\SO_Nata_Pyramid.mdl'
	collisionmode = geometry
	mass = 40.0
	tier = interactive
}
profile_so_small_kicker = {
	model = 'Props\\SO_Small_Kicker\\SO_Small_Kicker.mdl'
	collisionmode = geometry
	mass = 40.0
	tier = interactive
}
profile_so_wallplant = {
	model = 'Props\\SO_WallPlant\\SO_WallPlant.mdl'
	collisionmode = geometry
	mass = 40.0
	tier = interactive
}
profile_so_wallride = {
	model = 'Props\\SO_WallRide\\SO_WallRide.mdl'
	collisionmode = geometry
	mass = 40.0
	tier = interactive
}
