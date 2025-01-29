gp_fx_electrode_sparks_01 = {
	Pos = (1.0731801, 6.495943, 5.80894)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	EmitRangeDims = (0.1, 0.1, 0.1)
	Emit_Target = (0.0, -0.2, 1.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, -6.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	Radiate
	AngleSpread = 120.0
	BounceHeight = 0.0
	BounceCoeff = 0.2
	BounceCallbackRate = 0.0
	LifeRange = (1.0, 3.0)
	Emit_Rate = 150.0
	Max = 0
	TimeSeed = 0.1
	LifeTime = 0.0
	EmitNum = 150
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(0.07, 0.1)
		(0.0, 0.1)
	]
	SpeedRange = (3.5, 5.0)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.0
	AlignWithPath
	PathFollowTime = 0.07
	History = 2
	HistoryListCoordinateSpace = World
	Color = -7064577
	LOD_Default
	NoVisibilityTest
	QuickMaterial = {
		DiffuseTextureEnabled
		DiffuseTexture = JOW_Spark01
		SpecularPower = 0
		AlphaCutoff = 16
		BlendMode = add
		QuadAnimationFPS = 0
	}
	Knot = [
		(-0.35824102, -0.30060002, -0.0)
		(-0.35824102, -0.30060002, -0.0)
		(-0.119414, -0.100200005, -0.0)
		(0.119414, 0.100200005, -0.0)
		(0.35824102, 0.30060002, -0.0)
		(0.35824102, 0.30060002, -0.0)
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
