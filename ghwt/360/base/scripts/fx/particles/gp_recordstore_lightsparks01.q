gp_recordstore_lightsparks01 = {
	Pos = (0.0, -1.7865801, -0.0)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	Align
	ApplyPositionOffset
	AttachObject = z_recordstore_g_jg_hanglight01
	EmitRangeDims = (0.1, 0.1, 0.1)
	Emit_Target = (0.0, -0.5, 0.8)
	EnableRotate
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, -4.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	Radiate
	AngleSpread = 200.0
	BounceHeight = 1.0
	BounceCoeff = 0.2
	BounceCallbackRate = 0.0
	LifeRange = (1.0, 2.5)
	Emit_Rate = 200.0
	Max = 0
	TimeSeed = 0.1
	LifeTime = 0.5
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(0.06, 0.1)
		(0.0, 0.1)
	]
	SpeedRange = (0.2, 3.0)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.0
	AlignWithPath
	PathFollowTime = 0.07
	History = 2
	HistoryListCoordinateSpace = World
	Color = -7064577
	LOD_Default
	NoVisibilityTest
	QuickMaterial = {
		DiffuseTextureEnabled
		DiffuseTexture = JOW_Spark01
		SpecularPower = 0
		AlphaCutoff = 16
		BlendMode = add
		QuadAnimationFPS = 0
	}
	Knot = [
		(-0.46765104, 0.0, -0.0)
		(-0.46765104, 0.0, -0.0)
		(-0.155884, 0.0, -0.0)
		(0.155884, 0.0, -0.0)
		(0.46765104, 0.0, -0.0)
		(0.46765104, 0.0, -0.0)
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
