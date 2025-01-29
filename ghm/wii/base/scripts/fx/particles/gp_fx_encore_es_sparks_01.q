gp_fx_encore_es_sparks_01 = {
	Pos = (-1.6694379, 0.38791105, 3.987647)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = textureribbontrail
	Active
	CreatedAtStart
	EmitRangeDims = (0.3, 0.2, 0.3)
	Emit_Target = (0.0, 1.0, 0.0)
	EnableRotate
	EmitAngle = (20.0, 0.0, 0.0)
	Force = (0.0, -5.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	ElevSpread = (120.0, 150.0)
	SweepSpread = (0.0, 180.0)
	LifeRange = (0.2, 0.5)
	Emit_Rate = 200.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 1.0
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(0.04, 0.1)
		(0.02, 0.03)
	]
	SpeedRange = (4.0, 7.0)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.0
	PathFollowTime = 0.0
	History = 3
	HistoryListCoordinateSpace = World
	Color = -2514689
	LOD_Default
	NoVisibilityTest
	QuickMaterial = {
		DiffuseTextureEnabled
		DiffuseTexture = JOW_Spark01
		SpecularPower = 0
		Bloom
		AlphaCutoff = 55
		BlendMode = add
		QuadAnimationFPS = 0
	}
	Knot = [
		(0.30060002, 0.0, -0.358242)
		(0.30060002, 0.0, -0.358242)
		(0.100201, 0.0, -0.119414)
		(-0.100201, 0.0, 0.119414)
		(-0.30060002, 0.0, 0.358242)
		(-0.30060002, 0.0, 0.358242)
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
