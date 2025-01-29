GP_FX_WideSparks_01 = {
	Pos = (-0.204776, 9.458668, -3.500435)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	type = flat
	active
	CreatedAtStart
	EmitRangeDims = (5.0, 0.0, 1.0)
	Emit_Target = (0.0, -1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, -4.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	Radiate
	AngleSpread = 45.0
	BounceHeight = 0.5
	BounceCoeff = 0.2
	BounceCallbackRate = 0.0
	LifeRange = (1.0, 3.0)
	Emit_Rate = 250.0
	Max = 0
	TimeSeed = 0.1
	LifeTime = 0.6
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(0.07, 0.15)
		(0.02, 0.15)
	]
	SpeedRange = (1.0, 4.0)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.0
	AlignWithPath
	PathFollowTime = 0.05
	History = 2
	HistoryListCoordinateSpace = World
	Color = -2849025
	LOD_Distances = (20.0, 30.0)
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
		(-0.24335201, 0.0, -0.0)
		(-0.019053001, 0.0, -0.0)
		(0.205247, 0.0, -0.0)
		(0.292715, 0.0, -0.0)
		(0.380183, 0.0, -0.0)
		(0.46765104, 0.0, -0.0)
		(0.46765104, 0.0, -0.0)
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
		0.719445
		1.0
	]
}
