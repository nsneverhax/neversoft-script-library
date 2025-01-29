gp_fx_flashpot_sparks_01 = {
	Pos = (-0.542961, 0.127141, 12.431411)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	EmitRangeDims = (0.03, 0.04, 0.03)
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, -5.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 12.0
	LifeRange = (0.8, 1.3)
	Emit_Rate = 1200.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.11
	EmitNum = 0
	FollowEmitter = 0.0
	AlwaysEmit
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(0.04, 0.025)
		(0.04, 0.05)
	]
	SpeedRange = (4.0, 7.0)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.0
	AlignWithPath
	PathFollowTime = 0.09
	History = 3
	HistoryListCoordinateSpace = World
	Color = -4357377
	LOD_Default
	QuickMaterial = {
		DiffuseTextureEnabled
		DiffuseTexture = JOW_Spark01
		SpecularPower = 0
		Bloom
		AlphaCutoff = 18
		BlendMode = add
		QuadAnimationFPS = 0
	}
	Knot = [
		(-1.04373, 0.0, -0.100873)
		(-1.04373, 0.0, -0.100873)
		(-0.89906204, 0.0, -0.086893)
		(0.17762299, 0.0, 0.019448)
		(0.60445905, 0.0, 0.057839)
		(0.873444, 0.0, 0.086696)
		(0.49257702, 0.0, 0.047606)
		(1.04373, 0.0, 0.100873)
		(1.04373, 0.0, 0.100873)
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
		0.789535
		1.0
	]
}
