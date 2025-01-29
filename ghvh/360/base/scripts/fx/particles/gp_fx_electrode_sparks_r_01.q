gp_fx_electrode_sparks_r_01 = {
	Pos = (1.0731801, 5.4882245, -2.662153)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	EmitRangeDims = (0.1, 0.1, 0.1)
	Emit_Target = (0.0, 0.0, 0.0)
	EnableRotate
	EmitAngle = (0.0, 0.0, -15.0)
	Force = (0.0, -5.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	Radiate
	AngleSpread = 60.0
	BounceHeight = 0.0
	BounceCoeff = 0.2
	BounceCallbackRate = 0.0
	LifeRange = (1.0, 1.5)
	Emit_Rate = 300.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.120000005
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(0.07, 0.1)
		(0.05, 0.1)
	]
	SpeedRange = (4.0, 3.0)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.0
	AlignWithPath
	PathFollowTime = 0.04
	History = 2
	HistoryListCoordinateSpace = World
	Color = -726273
	LOD_Default
	NoVisibilityTest
	QuickMaterial = {
		DiffuseTextureEnabled
		DiffuseTexture = ta_spark_02
		SpecularPower = 0
		Bloom
		AlphaCutoff = 16
		BlendMode = add
		QuadAnimationFPS = 0
	}
	Knot = [
		(0.46765104, -0.0, -0.0)
		(0.46765104, -0.0, -0.0)
		(0.155884, 0.0, -0.0)
		(-0.155884, -0.0, -0.0)
		(-0.46765104, 0.0, -0.0)
		(-0.46765104, 0.0, -0.0)
	]
	ParticleColor = [
		-1
		-1
		-1
		-1
	]
	VertexWeight = [
		1.0
	]
}
