gp_fx_intro03_ax_glow01 = {
	Pos = (13.128386, 0.0, 36.19771)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	Attach
	AttachObject = GUITARIST
	bone = bone_guitar_body
	EmitRangeDims = (0.0, 0.0, 0.0)
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 200.0
	selectedwind = guitartest
	dragcoeff = 1.0
	LifeRange = (0.2, 2.0)
	Emit_Rate = 8.0
	Max = 2
	TimeSeed = 0.0
	LifeTime = 12.0
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(7.0, 7.0)
		(14.0, 14.0)
	]
	SpeedRange = (0.0, 0.0)
	turbulence = (0.0, 0.0, 0.0)
	RotVel = (0.4, -0.4)
	RotVelTimeScale = 0.5
	EmitDelayStart = 0.0
	PathFollowTime = 0.0
	History = 2
	HistoryListCoordinateSpace = object
	Color = 1074857215
	LOD_Default
	QuickMaterial = {
		layoutn = 1
		layoutm = 1
		DiffuseTextureEnabled
		DiffuseTexture = ph_radialglow_01
		SpecularPower = 0
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
