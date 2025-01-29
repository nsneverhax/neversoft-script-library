gp_fx_sparks_spurt_l_01 = {
	Pos = (-0.023187, 7.738103, -2.1778467)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	EmitRangeDims = (0.01, 0.01, 0.01)
	DoCircularEmit
	Emit_Target = (-1.0, 0.0, 1.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, -4.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	Radiate
	AngleSpread = 50.0
	BounceHeight = 0.0
	BounceCoeff = 0.2
	BounceCallbackRate = 0.0
	LifeRange = (1.0, 1.5)
	Emit_Rate = 150.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.2
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(0.05, 0.05)
		(0.05, 0.05)
	]
	SpeedRange = (5.5, 6.0)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.0
	AlignWithPath
	PathFollowTime = 0.07
	History = 2
	HistoryListCoordinateSpace = World
	Color = -1186305
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
		(-0.23455898, 0.40457302, -0.0)
		(-0.23455898, 0.40457302, -0.0)
		(-0.078186, 0.13485798, -0.0)
		(0.078186, -0.13485798, -0.0)
		(0.23455898, -0.40457302, -0.0)
		(0.23455898, -0.40457302, -0.0)
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
