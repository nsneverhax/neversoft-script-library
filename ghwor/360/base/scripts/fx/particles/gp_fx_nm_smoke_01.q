gp_fx_nm_smoke_01 = {
	Pos = (0.0, -0.09501701, -0.0)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	Attach
	ApplyPositionOffset
	bone = bone_head
	EmitRangeDims = (0.05, 0.0, 0.05)
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 45.0
	dragcoeff = 0.2
	LifeRange = (1.0, 1.2)
	Emit_Rate = 20.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(0.1, 0.1)
		(0.4, 0.4)
	]
	SpeedRange = (0.3, 0.4)
	turbulence = (0.0, 0.0, 0.0)
	RotVel = (0.5, -0.5)
	RotVelTimeScale = 0.5
	EmitDelayStart = 0.0
	PathFollowTime = 0.6
	History = 2
	HistoryListCoordinateSpace = World
	Color = 1234126190
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
		SoftedgeScale = 0.1
		Burn
		BurnValue = 0.7
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
		(-0.686745, 0.0, 0.012251999)
		(-0.716192, 0.0, 0.013727999)
		(-0.686436, 0.0, 0.015202999)
		(-0.317392, 0.0, 0.011938)
		(-0.40782002, 0.0, 0.008673)
		(-0.038776, 0.0, 0.0054079997)
		(0.038660996, 0.0, -0.006857)
		(0.63477397, 0.0, -0.019120999)
		(0.71221095, 0.0, -0.031386003)
		(0.71221095, 0.0, -0.031386003)
	]
	ParticleColor = [
		-256
		-256
		-1
		-1
		-115
		-75
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
		0.02173
		0.474424
		1.0
	]
}
