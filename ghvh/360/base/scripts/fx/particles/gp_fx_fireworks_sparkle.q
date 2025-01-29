gp_fx_fireworks_sparkle = {
	Pos = (-0.03769, 8.955257, -33.258293)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	EmitRangeDims = (0.25, 0.25, 0.25)
	DoCircularEmit
	Emit_Target = (0.0, 0.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, -0.5, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	Radiate
	ElevSpread = (90.0, 270.0)
	SweepSpread = (0.0, 360.0)
	LifeRange = (1.5, 2.0)
	Emit_Rate = 10.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 200
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(0.75, 0.75)
		(1.25, 1.25)
	]
	SpeedRange = (4.5, 7.25)
	RotVel = (1.0, 2.0)
	RotVelTimeScale = 60.0
	EmitDelayStart = 0.0
	PathFollowTime = 0.1
	History = 0
	HistoryListCoordinateSpace = World
	Color = -2729477
	LOD_Default
	QuickMaterial = {
		DiffuseTextureEnabled
		DiffuseTexture = JOW_Spark02
		SpecularPower = 0
		Bloom
		AlphaCutoff = 1
		BlendMode = add
		Burn
		BurnValue = 1.0
		QuadAnimationFPS = 0
	}
	Knot = [
		(1.017125, 0.0, -0.001808)
		(1.017125, 0.0, -0.001808)
		(0.6575541, 0.0, 0.011267)
		(0.530101, 0.0, -0.050380003)
		(0.170528, 0.0, -0.037305)
		(-0.127453, 0.0, -0.061646994)
		(-0.6575531, 0.0, -0.011268)
		(-0.955534, 0.0, -0.035609998)
		(-0.955534, 0.0, -0.035609998)
	]
	ParticleColor = [
		-977272833
		-7497729
		-977272833
		-7497729
		-256
		-256
	]
	VertexWeight = [
		0.42949504
		1.0
	]
}
