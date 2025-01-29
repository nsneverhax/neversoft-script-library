gp_fx_guitar_whisps_01 = {
	Pos = (0.0, -0.71327996, -0.0)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = textureribbontrail
	Active
	CreatedAtStart
	Attach
	ApplyPositionOffset
	bone = bone_demi
	EmitRangeDims = (0.1, 0.1, 0.1)
	Emit_Target = (1.0, 0.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 20.0
	PerParticleWind
	EmitterVelocityWeight = 0.0
	AngleSpread = 360.0
	selectedwind = guitartest
	dragcoeff = 0.0
	LifeRange = (3.0, 3.0)
	Emit_Rate = 10.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(0.1, 0.1)
		(0.09, 0.09)
	]
	SpeedRange = (8.0, 10.0)
	turbulence = (0.0, 0.0, 0.0)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.0
	PathFollowTime = 0.0
	History = 10
	HistoryListCoordinateSpace = World
	Color = -2250449
	LOD_Default
	QuickMaterial = {
		layoutn = 1
		layoutm = 1
		DiffuseTextureEnabled
		DiffuseTexture = JOW_Spark01
		SpecularPower = 0
		Bloom
		AlphaCutoff = 1
		BlendMode = add
		SoftEdge
		SoftedgeScale = 0.2
		aoshadow = 0.0
		QuadAnimationFPS = 0
		LightGroup = allgroups
		viewports = [
			all
		]
		fadeoutnearplane = 0.0
		fadeoutdistance = 0.1
	}
	Knot = [
		(-0.41790798, 0.0, -0.016478999)
		(-0.41790798, 0.0, -0.016478999)
		(-0.35139, 0.0, -0.016478999)
		(-0.28487104, 0.0, -0.016478999)
		(-0.218353, 0.0, -0.016478999)
		(-0.073405, 0.0, -0.011515)
		(0.07154301, 0.0, -0.006551)
		(0.21649201, 0.0, -0.0015870001)
		(0.292745, 0.0, 0.010457)
		(0.368998, 0.0, 0.022502)
		(0.44525102, 0.0, 0.034546)
		(0.44525102, 0.0, 0.034546)
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
		0.23036602
		0.7326469
		1.0
	]
}
