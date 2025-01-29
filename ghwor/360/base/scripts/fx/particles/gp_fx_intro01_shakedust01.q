gp_fx_intro01_shakedust01 = {
	Pos = (18.8508, -0.99572796, 63.48782)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	EmitRangeDims = (3.0, 0.1, 3.0)
	DoCircularEmit
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, -0.3, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 1.0
	EmitterVelocityWeight = 0.0
	Radiate
	ElevSpread = (100.0, 120.0)
	SweepSpread = (0.0, 360.0)
	selectedwind = violentwind01
	dragcoeff = 1.0
	LifeRange = (3.0, 4.0)
	Emit_Rate = 32.0
	Max = 0
	TimeSeed = 1.0
	LifeTime = 0.0
	EmitNum = 48
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(1.5, 1.5)
		(3.0, 3.0)
	]
	SpeedRange = (1.1, 1.7)
	turbulence = (1.0, 3.0, -3.0)
	RotVel = (-0.15, -0.05)
	RotVelTimeScale = 1.0
	EmitDelayStart = 0.0
	PathFollowTime = 0.0
	History = 2
	HistoryListCoordinateSpace = World
	Color = -522133428
	LOD_Default
	QuickMaterial = {
		layoutn = 1
		layoutm = 1
		DiffuseTextureEnabled
		DiffuseTexture = ph_smoke_singlepuff_blend_02
		SpecularPower = 0
		AlphaCutoff = 1
		BlendMode = blend
		SoftEdge
		SoftedgeScale = 0.5
		aoshadow = 0.0
		QuadAnimationFPS = 0
		LightGroup = allgroups
		fadeoutnearplane = 0.0
		fadeoutdistance = 0.1
	}
	Knot = [
		(-1.031919, 0.0, -0.0)
		(-1.031919, 0.0, -0.0)
		(-0.89152205, 0.0, -0.0)
		(-0.75112504, 0.0, -0.0)
		(-0.610728, 0.0, -0.0)
		(-0.427587, 0.0, -0.0)
		(-0.24444601, 0.0, -0.0)
		(-0.061306, 0.0, -0.0)
		(0.335862, 0.0, -0.0)
		(0.73302996, 0.0, -0.0)
		(1.130198, 0.0, -0.0)
		(1.130198, 0.0, -0.0)
	]
	ParticleColor = [
		1699891968
		2036685824
		1817668863
		1683645951
		1414223103
		1633248000
		825310464
		1077954560
	]
	burnpervertex = [
		1.0
		1.0
		1.0
		1.0
	]
	VertexWeight = [
		0.194805
		0.44891798
		1.0
	]
}
