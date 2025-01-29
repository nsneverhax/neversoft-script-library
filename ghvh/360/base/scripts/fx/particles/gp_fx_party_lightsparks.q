gp_fx_party_lightsparks = {
	Pos = (3.4956622, 6.3831663, -2.13492)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	EmitRangeDims = (0.1, 0.1, 0.1)
	Emit_Target = (0.0, 0.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, -5.0, 0.0)
	WindCoeff = 0.6
	LocalWindCoeff = 1.1
	PerParticleWind
	EmitterVelocityWeight = 0.0
	Radiate
	ElevSpread = (90.0, 270.0)
	SweepSpread = (0.0, 360.0)
	LifeRange = (1.0, 1.65)
	Emit_Rate = 200.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.15
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(0.035, 0.075)
		(0.035, 0.115)
	]
	SpeedRange = (0.75, 1.25)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.0
	AlignWithPath
	PathFollowTime = 0.07
	History = 2
	HistoryListCoordinateSpace = World
	Color = -803841
	LOD_Default
	NoVisibilityTest
	QuickMaterial = {
		DiffuseTextureEnabled
		DiffuseTexture = JOW_Spark01
		SpecularPower = 0
		Bloom
		AlphaCutoff = 16
		BlendMode = add
		QuadAnimationFPS = 0
	}
	Knot = [
		(-0.46765104, 0.0, -0.0)
		(-0.46765104, 0.0, -0.0)
		(-0.155884, 0.0, -0.0)
		(0.015655, 0.000449, 0.0028750002)
		(0.18719502, 0.00089699996, 0.00575)
		(0.171539, 0.000449, 0.0028750002)
		(0.155884, 0.0, -0.0)
		(0.46765104, 0.0, -0.0)
		(0.46765104, 0.0, -0.0)
	]
	ParticleColor = [
		-9145089
		-1
		-2039585
		-256
		-205
		-1
	]
	VertexWeight = [
		0.6896
		1.0
	]
}
