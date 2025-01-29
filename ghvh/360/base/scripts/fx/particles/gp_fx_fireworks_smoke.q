gp_fx_fireworks_smoke = {
	Pos = (-0.03769, 9.216455, -33.468906)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	EmitRangeDims = (0.5, 0.5, 0.5)
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, -0.25, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	ElevSpread = (90.0, 270.0)
	SweepSpread = (0.0, 360.0)
	LifeRange = (1.8499999, 2.25)
	Emit_Rate = 0.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 8
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(5.0, 5.0)
		(8.0, 8.0)
	]
	SpeedRange = (2.5, 5.0)
	RotVel = (-0.25, 0.25)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.0
	PathFollowTime = 0.1
	History = 0
	HistoryListCoordinateSpace = World
	Color = -848413756
	LOD_Default
	QuickMaterial = {
		DiffuseTextureEnabled
		DiffuseTexture = ta_smoke01
		SpecularPower = 0
		fillburst
		AlphaCutoff = 1
		BlendMode = add
		QuadAnimationFPS = 0
	}
	Knot = [
		(1.017125, 0.0, -0.001808)
		(1.017125, 0.0, -0.001808)
		(0.734926, 0.0, -0.01364)
		(0.452728, 0.0, -0.025473)
		(0.170528, 0.0, -0.037305)
		(-0.204826, 0.0, -0.036739998)
		(-0.58018, 0.0, -0.036174998)
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
		0.42938
		1.0
	]
}
