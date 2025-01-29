gp_fx_guitar_fire_01 = {
	Pos = (0.0, -0.70537895, 0.022705)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	Attach
	bone = bone_demi
	EmitRangeDims = (0.3, 0.3, 0.3)
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	Radiate
	AngleSpread = 360.0
	selectedwind = guitartest
	dragcoeff = 1.0
	LifeRange = (0.5, 0.7)
	Emit_Rate = 30.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 4.0
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(1.2, 1.2)
		(0.6, 0.6)
	]
	SpeedRange = (0.3, 0.4)
	turbulence = (1.0, 1.0, 1.0)
	RotVel = (0.6, -0.6)
	RotVelTimeScale = 1.0
	EmitDelayStart = 0.0
	PathFollowTime = 1.0
	History = 2
	HistoryListCoordinateSpace = World
	Color = -1033147537
	LOD_Default
	QuickMaterial = {
		TextureLayout = Layout2x2
		layoutn = 1
		layoutm = 1
		DiffuseTextureEnabled
		DiffuseTexture = ph_fire_quad_01
		SpecularPower = 0
		Bloom
		AlphaCutoff = 1
		BlendMode = add
		SoftEdge
		SoftedgeScale = 1.0
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
		(-0.081608005, 0.0, -0.0015220001)
		(0.055136003, 0.0, 0.013435999)
		(0.191881, 0.0, 0.028393997)
		(0.276338, 0.0, 0.030444998)
		(0.36079502, 0.0, 0.032494996)
		(0.44525102, 0.0, 0.034546)
		(0.44525102, 0.0, 0.034546)
	]
	ParticleColor = [
		-256
		-256
		-1
		-1
		-101
		-108
		-16777216
		1476395008
	]
	burnpervertex = [
		1.0
		1.0
		1.0
		1.0
	]
	VertexWeight = [
		0.230518
		0.707231
		1.0
	]
}
