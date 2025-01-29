gp_fx_sparkshower_flash_01 = {
	Pos = (-1.991156, 7.4327874, 1.0939251)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	EmitRangeDims = (0.5, 0.0, 0.0)
	Emit_Target = (0.0, -0.2, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 15.0
	LifeRange = (0.05, 0.1)
	Emit_Rate = 6.0
	Max = 1
	TimeSeed = 0.0
	LifeTime = 0.5
	EmitNum = 0
	FollowEmitter = 0.0
	AlwaysEmit
	EmitFunction = constant
	EmitPeriod = 0.02
	SizeRange = [
		(0.2, 0.2)
		(4.0, 4.0)
	]
	SpeedRange = (0.0, 0.0)
	RotVel = (0.2, -0.2)
	RotVelTimeScale = 0.5
	EmitDelayStart = 0.0
	PathFollowTime = 0.07
	History = 2
	HistoryListCoordinateSpace = World
	Color = -9559553
	LOD_Default
	NoVisibilityTest
	QuickMaterial = {
		DiffuseTextureEnabled
		DiffuseTexture = ph_radialglow_01
		SpecularPower = 0
		Bloom
		AlphaCutoff = 16
		BlendMode = add
		QuadAnimationFPS = 0
	}
	Knot = [
		(-0.46687204, 0.0, 0.02698)
		(-0.46687204, 0.0, 0.02698)
		(-0.15562399, 0.0, 0.008993001)
		(0.15562399, 0.0, -0.008993001)
		(0.46687204, 0.0, -0.02698)
		(0.46687204, 0.0, -0.02698)
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
