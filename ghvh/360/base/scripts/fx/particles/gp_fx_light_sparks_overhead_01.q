gp_fx_light_sparks_overhead_01 = {
	Pos = (-0.315163, 5.9242682, 5.4209237)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	EmitRangeDims = (0.1, 0.1, 0.1)
	Emit_Target = (0.0, -0.5, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, -6.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	Radiate
	AngleSpread = 70.0
	BounceHeight = 0.0
	BounceCoeff = 0.2
	BounceCallbackRate = 0.0
	LifeRange = (2.5, 3.0)
	Emit_Rate = 150.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.2
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(0.05, 0.1)
		(0.03, 0.1)
	]
	SpeedRange = (4.5, 3.0)
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
		DiffuseTexture = JOW_Spark01
		SpecularPower = 0
		AlphaCutoff = 16
		BlendMode = add
		QuadAnimationFPS = 0
	}
	Knot = [
		(0.357504, -0.30060002, -0.022967)
		(0.357504, -0.30060002, -0.022967)
		(0.119168006, -0.100200005, -0.007656)
		(-0.119168006, 0.100200005, 0.007656)
		(-0.357504, 0.30060002, 0.022967)
		(-0.357504, 0.30060002, 0.022967)
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
