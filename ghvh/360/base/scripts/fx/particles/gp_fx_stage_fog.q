gp_fx_stage_fog = {
	Pos = (1.9614259, 0.343507, 1.402897)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	EmitRangeDims = (6.0, 0.0, 3.5)
	Emit_Target = (0.0, 0.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.15, 0.2)
	WindCoeff = 0.5
	LocalWindCoeff = 1.0
	EmitterVelocityWeight = 0.0
	ElevSpread = (90.0, 90.0)
	SweepSpread = (260.0, 280.0)
	LifeRange = (1.75, 2.25)
	Emit_Rate = 12.5
	Max = 60
	TimeSeed = 20.0
	LifeTime = 0.0
	EmitNum = 0
	FollowEmitter = 0.0
	AlwaysEmit
	EmitFunction = constant
	EmitPeriod = 0.0
	SizeRange = [
		(2.0, 2.0)
		(2.5, 2.5)
	]
	SpeedRange = (0.0, 0.0)
	RotVel = (0.1, -0.1)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.0
	PathFollowTime = 0.0
	History = 2
	HistoryListCoordinateSpace = World
	Color = -1463499943
	LOD_Default
	QuickMaterial = {
		DiffuseTextureEnabled
		DiffuseTexture = ta_smoke01
		SpecularPower = 0
		perpixellighting
		AlphaCutoff = 1
		BlendMode = blend
		Burn
		BurnValue = 0.5
		QuadAnimationFPS = 0
	}
	Knot = [
		(-0.57761204, 0.0, -0.34806398)
		(-0.57761204, 0.0, -0.34806398)
		(-0.49720103, 0.0, -0.299609)
		(-0.458282, 0.0, -0.27785802)
		(-0.37787104, 0.0, -0.229403)
		(-0.211534, 0.0, -0.12916902)
		(0.172507, 0.0, 0.105715)
		(0.338844, 0.0, 0.205948)
		(0.47661403, 0.0, 0.28896698)
		(0.43817, 0.0, 0.264037)
		(0.57593995, 0.0, 0.347056)
		(0.57593995, 0.0, 0.347056)
	]
	ParticleColor = [
		-256
		-256
		-1
		-154
		-1
		-176
		-256
		-256
	]
	VertexWeight = [
		0.172503
		0.79513794
		1.0
	]
}
