gp_fx_fountain_glow_02 = {
	Pos = (-3.820583, 0.212041, 4.2679996)
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
	AngleSpread = 45.0
	LifeRange = (0.5, 0.5)
	Emit_Rate = 4.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 2
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(5.0, 10.0)
		(15.0, 35.0)
	]
	SpeedRange = (5.0, 2.0)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.0
	PathFollowTime = 0.0
	History = 2
	HistoryListCoordinateSpace = World
	Color = -964478343
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
		QuadAnimationFPS = 0
	}
	Knot = [
		(-0.371477, 0.0, -0.0)
		(-0.371477, 0.0, -0.0)
		(-0.155889, 0.0, -0.0)
		(0.059699, 0.0, -0.0)
		(0.275287, 0.0, -0.0)
		(0.347012, 0.0, -0.0)
		(0.418737, 0.0, -0.0)
		(0.490462, 0.0, -0.0)
		(0.490462, 0.0, -0.0)
	]
	ParticleColor = [
		-1
		-1
		-1
		-1
		-256
		-256
	]
	VertexWeight = [
		0.750359
		1.0
	]
}
