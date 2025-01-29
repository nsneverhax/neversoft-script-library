gp_fx_finalbattle_ampzilla_slambits01 = {
	Pos = (-4.9950695, 0.0, 3.758622)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	Attach
	AttachObject = z_finalbattle_trg_geo_ampzilla
	bone = bone_finger2_base_bend_l
	EmitRangeDims = (6.0, 0.1, 6.0)
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, -9.81, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	Radiate
	ElevSpread = (100.0, 130.0)
	SweepSpread = (0.0, 360.0)
	dragcoeff = 0.0
	LifeRange = (1.2, 1.8)
	Emit_Rate = 24.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 12
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(0.5, 0.5)
		(0.3, 0.3)
	]
	SpeedRange = (8.0, 24.0)
	turbulence = (1.0, 3.0, -3.0)
	RotVel = (-5.0, 5.0)
	RotVelTimeScale = 1.0
	EmitDelayStart = 0.0
	PathFollowTime = 0.0
	History = 2
	HistoryListCoordinateSpace = World
	Color = 808133375
	LOD_Default
	QuickMaterial = {
		TextureLayout = Layout2x2
		layoutn = 1
		layoutm = 1
		DiffuseTextureEnabled
		DiffuseTexture = HJ_Factory_Broken_Brick
		SpecularPower = 0
		Lighting
		AlphaCutoff = 1
		BlendMode = blend
		aoshadow = 0.0
		QuadAnimationFPS = 0
		LightGroup = allgroups
		fadeoutnearplane = 0.0
		fadeoutdistance = 0.1
	}
	Knot = [
		(-1.031919, 0.0, -0.0)
		(-1.031919, 0.0, -0.0)
		(-0.89152205, 0.0, -0.0)
		(-0.929765, 0.0, -0.0)
		(-0.789368, 0.0, -0.0)
		(-0.606227, 0.0, -0.0)
		(0.6445311, 0.0, -0.0)
		(0.827671, 0.0, -0.0)
		(1.224839, 0.0, -0.0)
		(0.73302996, 0.0, -0.0)
		(1.130198, 0.0, -0.0)
		(1.130198, 0.0, -0.0)
	]
	ParticleColor = [
		-256
		-256
		-1
		-1
		-1
		-1
		-256
		-256
	]
	burnpervertex = [
		1.0
		1.0
		1.0
		1.0
	]
	VertexWeight = [
		0.10906801
		0.83620596
		1.0
	]
}
