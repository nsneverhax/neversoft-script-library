GP_FX_FE_Fireworks_SparkleRocq = {
	Pos = (-33.85593, 0.0, -8.007345)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	type = flat
	active
	CreatedAtStart
	attach
	EmitRangeDims = (0.2, 0.2, 0.2)
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, -5.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	Radiate
	AngleSpread = 1.0
	LifeRange = (1.0, 1.5)
	Emit_Rate = 200.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.9
	EmitNum = 0
	FollowEmitter = 0.0
	AlwaysEmit
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(0.2, 0.2)
		(0.0, 0.0)
	]
	SpeedRange = (4.0, 6.0)
	RotVel = (1.0, -1.0)
	RotVelTimeScale = 1.0
	EmitDelayStart = 0.0
	PathFollowTime = 0.0
	History = 2
	HistoryListCoordinateSpace = World
	Color = -404481
	LOD_Default
	QuickMaterial = {
		DiffuseTextureEnabled
		DiffuseTexture = JOW_Spark02
		SpecularPower = 0
		Bloom
		AlphaCutoff = 1
		BlendMode = add
		QuadAnimationFPS = 0
	}
	Knot = [
		(1.004494, 0.0, -0.3009)
		(1.004494, 0.0, -0.3009)
		(0.33483106, 0.0, -0.1003)
		(-0.33483106, 0.0, 0.1003)
		(-1.004494, 0.0, 0.3009)
		(-1.004494, 0.0, 0.3009)
	]
	ParticleColor = [
		-2448385
		-1076756481
		-2448385
		-1076756481
	]
	VertexWeight = [
		1.0
	]
}
