gp_fx_fireplume_bottom_attach_01 = {
	Pos = (0.0, 0.0, -0.0)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	Attach
	Align
	ApplyPositionOffset
	AttachObject = vocalist
	EmitRangeDims = (0.05, 0.1, 0.05)
	Emit_Target = (0.0, 1.0, 0.0)
	EnableRotate
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 10.0
	dragcoeff = 0.0
	LifeRange = (0.5, 0.8)
	Emit_Rate = 40.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 1.0
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(0.3, 0.3)
		(0.2, 0.2)
	]
	SpeedRange = (2.3, 2.5)
	RotVel = (0.2, -0.2)
	RotVelTimeScale = 0.5
	EmitDelayStart = 1.0
	PathFollowTime = 2.0
	History = 2
	HistoryListCoordinateSpace = World
	Color = -3503873
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
		Burn
		BurnValue = 0.8
		QuadAnimationFPS = 0
		LightGroup = allgroups
		fadeoutnearplane = 2.0
		fadeoutdistance = 1.0
	}
	Knot = [
		(-0.67886907, 0.0, -0.014009)
		(-0.67886907, 0.0, -0.014009)
		(-0.63455105, 0.0, -0.0077820006)
		(-0.59023196, 0.0, -0.0015560001)
		(-0.545913, 0.0, 0.00467)
		(-0.408713, 0.0, 0.00467)
		(-0.27151302, 0.0, 0.00467)
		(-0.13431299, 0.0, 0.00467)
		(0.14347002, 0.0, 0.00467)
		(0.42125303, 0.0, 0.00467)
		(0.699036, 0.0, 0.00467)
		(0.699036, 0.0, 0.00467)
	]
	ParticleColor = [
		-256
		-256
		-1
		-1
		-1
		-1
		992149504
		1543503872
	]
	burnpervertex = [
		0.0
		0.0
		0.0
		0.0
	]
	VertexWeight = [
		0.097347006
		0.395778
		1.0
	]
	UpdateScript = change_lifetime
	params = {
		smin = 0.5
		smax = 0.8
		emin = 0.05
		emax = 0.075
		delay = 0.6
		time = 0.3
		updateTime = 0.1
	}
}
