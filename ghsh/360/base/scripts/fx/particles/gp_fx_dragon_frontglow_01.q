gp_fx_dragon_frontglow_01 = {
	Pos = (1.2160541, 2.6435058, -3.571584)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	EmitRangeDims = (0.1, 0.1, 0.1)
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 1.0
	LifeRange = (2.0, 2.0)
	Emit_Rate = 1.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 1
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(12.0, 20.0)
		(10.0, 20.0)
	]
	SpeedRange = (3.3, 3.3)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.3
	PathFollowTime = 0.0
	History = 2
	HistoryListCoordinateSpace = World
	Color = -3511643
	LOD_Default
	QuickMaterial = {
		DiffuseTextureEnabled
		DiffuseTexture = ph_radialglow_01
		SpecularPower = 0
		fillburst
		AlphaCutoff = 1
		BlendMode = add
		SoftEdge
		SoftedgeScale = 0.1
		Burn
		BurnValue = 0.6
		QuadAnimationFPS = 0
	}
	Knot = [
		(-0.371477, 0.0, -0.0)
		(-0.371477, 0.0, -0.0)
		(-0.17533399, 0.0, -0.0)
		(-0.124423005, 0.0, -0.0)
		(0.038351, 0.0, -0.0)
		(0.11401, 0.0, -0.0)
		(0.39929202, 0.0, -0.0)
		(0.490462, 0.0, -0.0)
		(0.490462, 0.0, -0.0)
	]
	ParticleColor = [
		-256
		-256
		-1
		-1
		-256
		-256
	]
	VertexWeight = [
		0.475472
		1.0
	]
}
