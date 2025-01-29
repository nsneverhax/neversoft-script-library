gp_fx_guitar_flares_01 = {
	Pos = (0.09110401, -0.177593, 18.099493)
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
	AngleSpread = 45.0
	dragcoeff = 0.0
	LifeRange = (0.3, 0.5)
	Emit_Rate = 5.0
	Max = 2
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(0.1, 0.1)
		(0.3, 0.3)
	]
	SpeedRange = (0.0, 0.0)
	turbulence = (0.0, 0.0, 0.0)
	RotVel = (0.5, -0.5)
	RotVelTimeScale = 0.5
	EmitDelayStart = 0.1
	PathFollowTime = 0.0
	History = 2
	HistoryListCoordinateSpace = World
	Color = -16776961
	LOD_Default
	QuickMaterial = {
		layoutn = 1
		layoutm = 1
		DiffuseTextureEnabled
		DiffuseTexture = jow_flare02
		SpecularPower = 0
		AlphaCutoff = 1
		BlendMode = add
		SoftEdge
		SoftedgeScale = 0.1
		aoshadow = 0.0
		QuadAnimationFPS = 0
		LightGroup = allgroups
		fadeoutnearplane = 0.0
		fadeoutdistance = 0.1
	}
	Knot = [
		(-0.425308, 0.0, 0.0045720004)
		(-0.425308, 0.0, 0.0045720004)
		(-0.35823402, 0.0, 0.0045720004)
		(-0.29115996, 0.0, 0.0045720004)
		(-0.224087, 0.0, 0.0045720004)
		(-0.07164701, 0.0, 0.0045720004)
		(0.080793, 0.0, 0.0045720004)
		(0.233233, 0.0, 0.0045720004)
		(0.294209, 0.0, -0.0015260001)
		(0.355185, 0.0, -0.0076240003)
		(0.416161, 0.0, -0.0137209995)
		(0.416161, 0.0, -0.0137209995)
	]
	ParticleColor = [
		-256
		-256
		-1
		-1
		-1
		-1
		-256
		-256
	]
	burnpervertex = [
		1.0
		1.0
		1.0
		1.0
	]
	VertexWeight = [
		0.238872
		0.781761
		1.0
	]
}
