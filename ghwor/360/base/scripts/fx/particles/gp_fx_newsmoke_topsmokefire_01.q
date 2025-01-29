gp_fx_newsmoke_topsmokefire_01 = {
	Pos = (0.894186, 1.411864, 6.88498)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	EmitRangeDims = (0.0, 0.0, 0.0)
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 40.0
	dragcoeff = 1.0
	LifeRange = (0.2, 0.2)
	Emit_Rate = 0.0
	Max = 0
	TimeSeed = 0.2
	LifeTime = 0.2
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(1.3, 1.3)
		(1.2, 1.2)
	]
	SpeedRange = (1.0, 1.2)
	turbulence = (0.8, 0.0, 0.0)
	RotVel = (0.1, -0.1)
	RotVelTimeScale = 0.5
	EmitDelayStart = 0.0
	PathFollowTime = 0.1
	History = 2
	HistoryListCoordinateSpace = World
	Color = -1078880082
	LOD_Default
	QuickMaterial = {
		layoutn = 1
		layoutm = 1
		DiffuseTextureEnabled
		DiffuseTexture = ph_fireball_01
		SpecularPower = 0
		Bloom
		AlphaCutoff = 1
		BlendMode = blend
		SoftEdge
		SoftedgeScale = 0.2
		Burn
		BurnValue = 1.0
		SortGroup = 3
		DrawOrder = 13.0
		aoshadow = 0.0
		QuadAnimationFPS = 0
		LightGroup = allgroups
		viewports = [
			all
		]
		fadeoutnearplane = 4.0
		fadeoutdistance = 3.0
	}
	Knot = [
		(-0.412285, 0.0, -0.0)
		(-0.412285, 0.0, -0.0)
		(-0.38650003, 0.0, -0.0)
		(-0.21385801, 0.0, -0.0)
		(-0.18807301, 0.0, -0.0)
		(0.031064998, 0.0, -0.0)
		(-0.106202, 0.0, -0.0)
		(0.112936, 0.0, -0.0)
		(0.14321801, 0.0, -0.0)
		(0.383048, 0.0, -0.0)
		(0.41333, 0.0, -0.0)
		(0.41333, 0.0, -0.0)
	]
	ParticleColor = [
		-256
		-256
		-1
		-1
		-88
		-112
		252645120
		370546176
	]
	burnpervertex = [
		1.0
		1.0
		1.0
		1.0
	]
	VertexWeight = [
		0.27157
		0.636157
		1.0
	]
}
