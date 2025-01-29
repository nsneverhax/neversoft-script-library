GP_FX_NorwayDragon_Fire_01 = {
	Pos = (0.31665203, 2.246106, -4.4125175)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	type = flat
	active
	CreatedAtStart
	EmitRangeDims = (0.0, 0.1, 0.0)
	Emit_Target = (0.0, 1.0, 0.0)
	EnableRotate
	EmitAngle = (10.0, 0.0, 20.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 20.0
	LifeRange = (0.7, 1.0)
	Emit_Rate = 20.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 1.5
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(0.5, 0.5)
		(2.0, 2.0)
	]
	SpeedRange = (5.0, 6.0)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.0
	AlignWithPath
	PathFollowTime = 0.3
	History = 2
	HistoryListCoordinateSpace = World
	Color = -3699713
	LOD_Default
	QuickMaterial = {
		TextureLayout = Layout2x2
		DiffuseTextureEnabled
		DiffuseTexture = PH_Fire_Quad_01
		SpecularPower = 0
		Bloom
		AlphaCutoff = 1
		BlendMode = blend
		SoftEdge
		SoftedgeScale = 0.2
		Burn
		BurnValue = 0.6
		QuadAnimationFPS = 0
	}
	Knot = [
		(-0.82557696, 0.0, -0.0)
		(-0.82557696, 0.0, -0.0)
		(-0.713797, 0.0, -0.0)
		(-0.602017, 0.0, -0.0)
		(-0.490238, 0.0, -0.0)
		(-0.30561304, 0.0, -0.0)
		(-0.120988004, 0.0, -0.0)
		(0.06363701, 0.0, -0.0)
		(0.318812, 0.0, -0.0)
		(0.573986, 0.0, -0.0)
		(0.82916003, 0.0, -0.0)
		(0.82916003, 0.0, -0.0)
	]
	ParticleColor = [
		-256
		-256
		-1
		-1
		-11250433
		-8046593
		1545477632
		1597117696
	]
	VertexWeight = [
		0.20265399
		0.537375
		1.0
	]
	UpdateScript = Change_LifeTime
	params = {
		sMin = 0.7
		sMax = 1.0
		eMin = 0.1
		eMax = 0.4
		delay = 0.8
		time = 0.4
		updateTime = 0.1
	}
}
