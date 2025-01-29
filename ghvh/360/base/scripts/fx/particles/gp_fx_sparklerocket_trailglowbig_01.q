gp_fx_sparklerocket_trailglowbig_01 = {
	Pos = (-11.067985, 0.182012, 5.949456)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	EmitRangeDims = (0.001, 0.001, 0.001)
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, -5.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	Radiate
	AngleSpread = 1.0
	LifeRange = (1.6, 1.8)
	Emit_Rate = 150.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.9
	EmitNum = 0
	FollowEmitter = 0.0
	AlwaysEmit
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(1.5, 1.5)
		(0.3, 0.3)
	]
	SpeedRange = (4.0, 6.0)
	RotVel = (1.0, -1.0)
	RotVelTimeScale = 1.0
	EmitDelayStart = 0.0
	PathFollowTime = 0.0
	History = 2
	HistoryListCoordinateSpace = World
	Color = -2444519
	LOD_Default
	QuickMaterial = {
		DiffuseTextureEnabled
		DiffuseTexture = ta_smoke_02
		SpecularPower = 0
		Bloom
		fillburst
		AlphaCutoff = 1
		BlendMode = blend
		Burn
		BurnValue = 0.2
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
