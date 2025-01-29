gp_fx_nm_glow_01 = {
	Pos = (-0.00525, -0.049116, -0.0)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	Attach
	ApplyPositionOffset
	bone = bone_head
	EmitRangeDims = (0.03, 0.0, 0.03)
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 45.0
	dragcoeff = 0.0
	LifeRange = (1.4, 2.5)
	Emit_Rate = 10.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(0.2, 0.2)
		(0.2, 0.2)
	]
	SpeedRange = (0.02, 0.03)
	turbulence = (0.0, 0.0, 0.0)
	RotVel = (0.3, -0.3)
	RotVelTimeScale = 0.3
	EmitDelayStart = 0.0
	PathFollowTime = 10.0
	History = 2
	HistoryListCoordinateSpace = object
	Color = 1837843304
	LOD_Default
	QuickMaterial = {
		layoutn = 1
		layoutm = 1
		DiffuseTextureEnabled
		DiffuseTexture = ph_radialglow_01
		SpecularPower = 0
		Bloom
		fillburst
		AlphaCutoff = 1
		BlendMode = add
		SoftEdge
		SoftedgeScale = 0.01
		Burn
		BurnValue = 1.0
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
		(-0.716501, 0.0, 0.010775999)
		(-0.716501, 0.0, 0.010775999)
		(-0.65999, 0.0, 0.012251999)
		(-0.60348004, 0.0, 0.013727999)
		(-0.546969, 0.0, 0.015202999)
		(-0.353462, 0.0, 0.011938)
		(-0.15995501, 0.0, 0.008673)
		(0.033552002, 0.0, 0.0054079997)
		(0.259772, 0.0, -0.006857)
		(0.48599103, 0.0, -0.019120999)
		(0.71221095, 0.0, -0.031386003)
		(0.71221095, 0.0, -0.031386003)
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
		0.11860701
		0.524666
		1.0
	]
}
