gp_pinwheelsparks01 = {
	Pos = (-2.4759521, 0.0, -1.01012)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	Attach
	Align
	EmitRangeDims = (0.1, 0.1, 0.0)
	Emit_Target = (0.0, 1.0, 0.0)
	EnableRotate
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, -9.8, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 45.0
	BounceHeight = 0.0
	BounceCoeff = 0.2
	BounceCallbackRate = 0.0
	LifeRange = (0.5, 1.0)
	Emit_Rate = 384.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 0
	FollowEmitter = 0.0
	FillPath
	AlwaysEmit
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(0.05, 0.2)
		(0.0, 0.1)
	]
	SpeedRange = (3.0, 8.0)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.0
	AlignWithPath
	PathFollowTime = 0.05
	History = 2
	HistoryListCoordinateSpace = World
	align_to = (1.0, 0.0, 0.0)
	Color = -1
	LOD_Default
	NoVisibilityTest
	QuickMaterial = {
		DiffuseTextureEnabled
		DiffuseTexture = JOW_Spark01
		SpecularPower = 0
		TwoSide
		AlphaCutoff = 16
		BlendMode = add
		Burn
		BurnValue = 0.7
		QuadAnimationFPS = 0
	}
	Knot = [
		(0.0, 0.0, -0.204028)
		(0.0, 0.0, -0.204028)
		(0.0, 0.0, -0.128626)
		(0.0, 0.0, -0.214712)
		(0.0, 0.0, -0.059612997)
		(0.0, 0.0, 0.049867995)
		(0.0, 0.0, 0.128626)
		(0.0, 0.0, 0.181851)
		(0.0, 0.0, 0.181851)
	]
	ParticleColor = [
		-6202625
		-3170561
		-6074369
		-4228097
		-7069185
		-7724545
	]
	VertexWeight = [
		0.374249
		1.0
	]
}
