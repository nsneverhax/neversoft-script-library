GP_ButtonStarShower01 = {
	Pos = (200.0, -99.75674, 4.7122226)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	EmitRangeDims = (0.4, 0.0, 0.4)
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, -15.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	Radiate
	AngleSpread = 30.0
	BounceHeight = -99.9
	BounceCoeff = 0.6
	LifeRange = (1.0, 1.5)
	Emit_Rate = 24.0
	MAX = 0
	TimeSeed = 0.3
	LifeTime = 0.0
	EmitNum = 20
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(0.2, 0.2)
		(0.15, 0.15)
	]
	SpeedRange = (4.0, 6.0)
	RotVel = (-6.0, 6.0)
	RotVelTimeScale = 1.0
	EmitDelayStart = 0.0
	PathFollowTime = 0.0
	History = 2
	HistoryListCoordinateSpace = World
	Rotate3D
	Color = -3267073
	LOD_Default
	QuickMaterial = {
		DiffuseTextureEnabled
		DiffuseTexture = JOW_ButtonStar02
		SpecularPower = 0
		TwoSide
		AlphaCutoff = 32
		BlendMode = BLEND
		QuadAnimationFPS = 0
	}
	Knot = [
		(-0.61986405, 0.0, -0.0)
		(-0.61986405, 0.0, -0.0)
		(-0.36443204, 0.0, -0.0)
		(-0.12410301, 0.0, -0.0)
		(0.131329, 0.0, -0.0)
		(0.24032901, 0.0, -0.0)
		(0.36443204, 0.0, -0.0)
		(0.47343102, 0.0, -0.0)
		(0.47343102, 0.0, -0.0)
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
		0.68709105
		1.0
	]
}
