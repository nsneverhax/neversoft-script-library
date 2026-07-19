Object_Default_RigidBody = {
	Bouncy
	sound_type = `default`
}
Object_Skateable_RigidBody = {
	Bouncy
	tier = interactive
}
profile_GO_Aluminum_Can = {
	Model = 'Props\\GO_Aluminum_Can\\GO_Aluminum_Can.mdl'
	CollisionMode = Geometry
	mass = 0.25
	contact_Script = Contact_TerrainEffects
	sound_type = AluminumCan
}
profile_GO_BasketBall = {
	Model = 'Props\\GO_BasketBall\\GO_BasketBall.mdl'
	CollisionMode = Geometry
	mass = 3.0
	restitution = 0.8
	contact_Script = Contact_TerrainEffects
}
profile_GO_Beer_Bottle = {
	Model = 'Props\\GO_Beer_Bottle\\GO_Beer_Bottle.mdl'
	CollisionMode = Geometry
	mass = 1.0
	contact_Script = Contact_TerrainEffects
	sound_type = GlassBottle
}
profile_GO_Cafe_Chair = {
	Model = 'Props\\GO_Cafe_Chair\\GO_Cafe_Chair.mdl'
	CollisionMode = Geometry
	mass = 6.0
	contact_Script = Contact_GO_Cafe_Chair
	sound_type = WoodChair
}
profile_GO_Cafe_Table = {
	Model = 'Props\\GO_Cafe_Table\\GO_Cafe_Table.mdl'
	CollisionMode = Geometry
	mass = 10.0
	contact_Script = Contact_TerrainEffects
	sound_type = WoodTable
}
profile_GO_Cardboard_Box = {
	Model = 'Props\\GO_Cardboard_Box\\GO_Cardboard_Box.mdl'
	CollisionMode = Geometry
	mass = 3.0
	contact_Script = Contact_TerrainEffects
	sound_type = CardboardBox
}
profile_GO_40ozGlassBottle = {
	Model = 'Props\\GO_40ozGlassBottle\\GO_40ozGlassBottle.mdl'
	CollisionMode = Geometry
	mass = 1.0
	contact_Script = Contact_TerrainEffects
	sound_type = GlassBottle
}
profile_GO_40ozBottledWater = {
	Model = 'Props\\GO_40ozBottledWater\\GO_40ozBottledWater.mdl'
	CollisionMode = Geometry
	mass = 1.0
	contact_Script = Contact_TerrainEffects
	sound_type = WaterBottle
}
profile_GO_GrecianSuburbFlowers = {
	Model = 'Props\\GO_GrecianSuburbFlowers\\GO_GrecianSuburbFlowers.mdl'
	CollisionMode = Geometry
	linear_Damping = 0.8
	mass = 40
	restitution = 0.2
	contact_Script = Contact_PottedPlant_Short
	sound_type = PottedSuburbPlant
}
profile_GO_Half_Crushed_AluminumCan = {
	Model = 'Props\\GO_Half_Crushed_AluminumCan\\GO_Half_Crushed_AluminumCan.mdl'
	CollisionMode = Geometry
	mass = 0.25
	contact_Script = Contact_TerrainEffects
	sound_type = AluminumCan
}
profile_GO_LightStandLevel = {
	Model = 'Props\\GO_LightStandLevel\\GO_LightStandLevel.mdl'
	CollisionMode = Geometry
	linear_Damping = 0.2
	Angular_Damping = 0.05
	mass = 8.0
	restitution = 0.1
	contact_Script = Contact_TerrainEffects
	sound_type = PhotoLightStand
}
profile_GO_LightStandUp45 = {
	Model = 'Props\\GO_LightStandUp45\\GO_LightStandUp45.mdl'
	CollisionMode = Geometry
	linear_Damping = 0.2
	Angular_Damping = 0.05
	mass = 8.0
	restitution = 0.1
	contact_Script = Contact_TerrainEffects
	sound_type = PhotoLightStand
}
profile_GO_MetalBarrelGreen = {
	Model = 'Props\\GO_MetalBarrelGreen\\GO_MetalBarrelGreen.mdl'
	CollisionMode = Geometry
	Angular_Damping = 1.0
	linear_Damping = 2
	mass = 100
	restitution = 0.2
	contact_Script = Contact_TerrainEffects
	sound_type = MetalDrum50Gal
}
profile_GO_Pizza_Box = {
	Model = 'Props\\GO_Pizza_Box\\GO_Pizza_Box.mdl'
	CollisionMode = Geometry
	mass = 1.0
	contact_Script = Contact_TerrainEffects
	sound_type = CardboardBox
}
profile_GO_Plywood_Small_Piece = {
	Model = 'Props\\GO_Plywood_Small_Piece\\GO_Plywood_Small_Piece.mdl'
	CollisionMode = Geometry
	linear_Damping = 0.2
	mass = 8.0
	contact_Script = Contact_Settle_Die
	deactivate_Script = Deactivate_PlywoodSmall
	sound_type = PlywoodPlank
}
profile_GO_Plywood_Medium_Piece = {
	Model = 'Props\\GO_Plywood_Medium_Piece\\GO_Plywood_Medium_Piece.mdl'
	CollisionMode = Geometry
	linear_Damping = 0.5
	mass = 20.0
	restitution = 0.2
	contact_Script = Contact_Plywood
	sound_type = PlywoodPlank
}
profile_GO_Plywood_Large_Piece = {
	Model = 'Props\\GO_Plywood_Large_Piece\\GO_Plywood_Large_Piece.mdl'
	CollisionMode = Geometry
	linear_Damping = 0.7
	mass = 30.0
	restitution = 0.2
	contact_Script = Contact_Plywood
	sound_type = PlywoodPlank
}
profile_GO_Recycle_Bin = {
	Model = 'Props\\GO_Recycle_Bin\\GO_Recycle_Bin.mdl'
	CollisionMode = Geometry
	linear_Damping = 0.2
	mass = 8
	contact_Script = Contact_TerrainEffects
	sound_type = PlasticTrashCan
}
profile_GO_RubberTrashCan = {
	Model = 'Props\\Go_RubberTrashCan\\GO_RubberTrashCan.mdl'
	CollisionMode = Geometry
	linear_Damping = 0.2
	mass = 8
	contact_Script = Contact_TerrainEffects
	sound_type = PlasticTrashCan
}
profile_GO_Snowman = {
	Model = 'Props\\GO_Snowman\\GO_Snowman.mdl'
	CollisionMode = Geometry
	linear_Damping = 0.2
	mass = 8.0
	restitution = 0.2
	contact_Script = Contact_TerrainEffects
}
profile_GO_Soda_Cup = {
	Model = 'Props\\GO_Soda_Cup\\GO_Soda_Cup.mdl'
	CollisionMode = Geometry
	mass = 1.0
	contact_Script = Contact_TerrainEffects
	sound_type = SodaCup
}
profile_Go_SuburbPlant = {
	Model = 'Props\\Go_SuburbPlant\\Go_SuburbPlant.mdl'
	CollisionMode = Geometry
	linear_Damping = 0.5
	mass = 15
	restitution = 0.2
	contact_Script = Contact_PottedPlant_Short
	sound_type = PottedSuburbPlant
}
profile_GO_TopiaryTree = {
	Model = 'Props\\GO_TopiaryTree\\GO_TopiaryTree.mdl'
	CollisionMode = Geometry
	linear_Damping = 1.4
	mass = 80
	restitution = 0.2
	contact_Script = Contact_PottedPlant_Tall
	sound_type = PottedSuburbPlant
}
profile_GO_TrafficCone = {
	Model = 'Props\\GO_TrafficCone\\GO_TrafficCone.mdl'
	CollisionMode = Geometry
	linear_Damping = 0.4
	mass = 12.0
	contact_Script = Contact_TerrainEffects
	sound_type = OrangeTrafficCone
}
profile_GO_Trash_Can = {
	Model = 'Props\\GO_Trash_Can\\GO_Trash_Can.mdl'
	CollisionMode = Geometry
	linear_Damping = 0.2
	mass = 12
	contact_Script = Contact_TerrainEffects
	sound_type = MetalTrashCan
}
profile_GO_Wreath = {
	Model = 'Props\\GO_Wreath\\GO_Wreath.mdl'
	CollisionMode = Geometry
	linear_Damping = 0.2
	mass = 1.5
	restitution = 0.2
	contact_Script = Contact_TerrainEffects
}
profile_GO_SchoolBanner = {
	Model = 'peds\\props\\school_banner_01.skin'
	SkeletonName = school_banner
	Tree = $GameObj_AnimTree
	AnimTargets = [
		Body
		BodyTimer
	]
}
profile_GO_SchoolFlag = {
	Model = 'Props\\default_flag\\flag_diagonal.skin'
	SkeletonName = flag_diagonal
	Tree = $GameObj_AnimTree
	AnimTargets = [
		Body
		BodyTimer
	]
	scale = (6.0, 6.0, 6.0)
}
profile_GO_shopsFlag = {
	Model = 'Props\\default_flag\\flag_vertical.skin'
	SkeletonName = flag_vertical
	Tree = $GameObj_AnimTree
	AnimTargets = [
		Body
		BodyTimer
	]
	scale = (4.0, 4.0, 4.0)
}
profile_GO_centerFlag01 = {
	Model = 'Props\\default_flag\\flag_diagonal.skin'
	SkeletonName = flag_diagonal
	Tree = $GameObj_AnimTree
	AnimTargets = [
		Body
		BodyTimer
	]
	scale = (6.0, 6.0, 6.0)
}
profile_GO_centerFlag02 = {
	Model = 'Props\\default_flag\\flag_vertical.skin'
	SkeletonName = flag_vertical
	Tree = $GameObj_AnimTree
	AnimTargets = [
		Body
		BodyTimer
	]
	scale = (6.0, 6.0, 6.0)
}
profile_GO_centerFlag03 = {
	Model = 'Props\\default_flag\\flag_vertical.skin'
	SkeletonName = flag_vertical
	Tree = $GameObj_AnimTree
	AnimTargets = [
		Body
		BodyTimer
	]
	scale = (6.0, 6.0, 6.0)
}
profile_SO_Ball = {
	Model = 'Props\\SO_Ball\\SO_Ball.mdl'
	CollisionMode = Geometry
	mass = 40.0
	tier = interactive
}
profile_SO_Box = {
	Model = 'Props\\SO_Box\\SO_Box.mdl'
	CollisionMode = Geometry
	mass = 40.0
	tier = interactive
}
profile_SO_Leaner = {
	Model = 'Props\\SO_Leaner\\SO_Leaner.mdl'
	CollisionMode = Geometry
	mass = 40.0
	tier = interactive
}
profile_SO_Wedge = {
	Model = 'Props\\SO_Wedge\\SO_Wedge.mdl'
	CollisionMode = Geometry
	mass = 40.0
	tier = interactive
}
profile_SO_Teter = {
	Model = 'Props\\SO_Teter\\SO_Teter.mdl'
	CollisionMode = Geometry
	mass = 40.0
	tier = interactive
}
profile_SO_Wall = {
	Model = 'Props\\SO_Wall\\SO_Wall.mdl'
	CollisionMode = Geometry
	mass = 40.0
	tier = interactive
}
profile_SO_Low_Grind = {
	Model = 'Props\\SO_Low_Grind\\SO_Low_Grind.mdl'
	CollisionMode = Geometry
	mass = 40.0
	tier = interactive
}
profile_SO_MED_QP = {
	Model = 'Props\\SO_MED_QP\\SO_MED_QP.mdl'
	CollisionMode = Geometry
	mass = 40.0
	tier = interactive
}
profile_SO_Nata_Pyramid = {
	Model = 'Props\\SO_Nata_Pyramid\\SO_Nata_Pyramid.mdl'
	CollisionMode = Geometry
	mass = 40.0
	tier = interactive
}
profile_SO_Small_Kicker = {
	Model = 'Props\\SO_Small_Kicker\\SO_Small_Kicker.mdl'
	CollisionMode = Geometry
	mass = 40.0
	tier = interactive
}
profile_SO_WallPlant = {
	Model = 'Props\\SO_WallPlant\\SO_WallPlant.mdl'
	CollisionMode = Geometry
	mass = 40.0
	tier = interactive
}
profile_SO_WallRide = {
	Model = 'Props\\SO_WallRide\\SO_WallRide.mdl'
	CollisionMode = Geometry
	mass = 40.0
	tier = interactive
}
