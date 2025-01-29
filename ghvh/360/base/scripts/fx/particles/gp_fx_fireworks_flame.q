gp_fx_fireworks_flame = {
	Pos = (-0.03769, 9.444529, -33.686237)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = textureribbontrail
	Active
	EmitRangeDims = (1.0, 1.0, 1.0)
	Emit_Target = (0.0, 0.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, -0.5, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.25
	Radiate
	ElevSpread = (90.0, 270.0)
	SweepSpread = (0.0, 360.0)
	LifeRange = (0.85, 1.65)
	Emit_Rate = 0.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 500
	FollowEmitter = 0.0
	EmitFunction = sin
	EmitPeriod = 1.0
	SizeRange = [
		(0.5, 0.5)
		(0.65000004, 0.65000004)
	]
	SpeedRange = (3.0, 8.0)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.0
	AlignWithPath
	PathFollowTime = 0.2
	History = 3
	HistoryListCoordinateSpace = World
	Color = -667471621
	LOD_Default
	QuickMaterial = {
		DiffuseTextureEnabled
		DiffuseTexture = JOW_Spark01
		SpecularPower = 0
		Bloom
		AlphaCutoff = 16
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
		-337665
		-3904769
		-337665
		-3904769
		-256
		-256
	]
	VertexWeight = [
		0.42949504
		1.0
	]
}
