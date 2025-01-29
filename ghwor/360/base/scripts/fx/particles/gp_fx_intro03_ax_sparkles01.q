gp_fx_intro03_ax_sparkles01 = {
	Pos = (13.115206, 0.0, 35.8219)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	Attach
	Align
	AttachObject = GUITARIST
	bone = bone_guitar_body
	EmitRangeDims = (3.5, 2.0, 3.0)
	DoCircularEmit
	Emit_Target = (0.0, 1.0, 0.0)
	EnableRotate
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 360.0
	dragcoeff = 1.0
	LifeRange = (1.0, 1.5)
	Emit_Rate = 200.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 12.0
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(0.6, 0.6)
		(0.1, 0.1)
	]
	SpeedRange = (0.3, 2.0)
	turbulence = (1.0, 1.0, 1.0)
	RotVel = (1.0, -1.0)
	RotVelTimeScale = 0.5
	EmitDelayStart = 0.0
	PathFollowTime = 0.0
	History = 2
	HistoryListCoordinateSpace = World
	Color = -4542209
	LOD_Default
	QuickMaterial = {
		layoutn = 1
		layoutm = 1
		DiffuseTextureEnabled
		DiffuseTexture = jow_flare02
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
		0.5
		0.5
	]
	VertexWeight = [
		0.23036602
		0.7326469
		1.0
	]
}
