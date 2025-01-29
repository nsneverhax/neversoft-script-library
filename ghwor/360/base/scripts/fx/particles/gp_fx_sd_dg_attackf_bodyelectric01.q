gp_fx_sd_dg_attackf_bodyelectric01 = {
	Pos = (42.338596, 0.0, 78.269356)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	Attach
	AttachObject = z_finalbattle_trg_geo_ampzilla
	bone = Bone_Stomach_Lower
	EmitRangeDims = (4.0, 4.0, 2.0)
	DoCircularEmit
	Emit_Target = (1.0, 0.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	Radiate
	AngleSpread = 360.0
	dragcoeff = 0.5
	LifeRange = (0.1, 0.3)
	Emit_Rate = 16.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 16
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 0.0
	SizeRange = [
		(6.0, 6.0)
		(12.0, 12.0)
	]
	SpeedRange = (8.0, 16.0)
	turbulence = (1.0, 3.0, -3.0)
	RotVel = (-3.0, 3.0)
	RotVelTimeScale = 1.0
	EmitDelayStart = 0.0
	PathFollowTime = 0.025
	History = 2
	HistoryListCoordinateSpace = World
	align_to = (1.0, 0.0, 0.0)
	Rotate3D
	Color = -13026817
	LOD_Default
	QuickMaterial = {
		layoutn = 1
		layoutm = 1
		DiffuseTextureEnabled
		DiffuseTexture = electriccircle_02
		SpecularPower = 0
		TwoSide
		Bloom
		fillburst
		AlphaCutoff = 1
		BlendMode = add
		aoshadow = 0.0
		QuadAnimationFPS = 0
		LightGroup = allgroups
		fadeoutnearplane = 0.0
		fadeoutdistance = 0.1
	}
	Knot = [
		(-0.64545804, 0.0, -0.0)
		(-0.64545804, 0.0, -0.0)
		(-0.47491202, 0.0, -0.0)
		(-0.304366, 0.0, -0.0)
		(-0.13382, 0.0, -0.0)
		(0.088232, 0.0, -0.0)
		(0.310284, 0.0, -0.0)
		(0.53233594, 0.0, -0.0)
		(0.53233594, 0.0, -0.0)
	]
	ParticleColor = [
		-1
		-1
		-1
		-1
		-1
		-1
	]
	burnpervertex = [
		1.0
		1.0
		1.0
	]
	VertexWeight = [
		0.43440402
		1.0
	]
}
