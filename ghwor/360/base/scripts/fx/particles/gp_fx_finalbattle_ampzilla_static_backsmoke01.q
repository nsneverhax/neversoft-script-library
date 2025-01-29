gp_fx_finalbattle_ampzilla_static_backsmoke01 = {
	Pos = (2.0, -4.0, -1.0)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	Attach
	Align
	ApplyPositionOffset
	AttachObject = z_finalbattle_trg_geo_ampzilla
	bone = Bone_Stomach_Lower
	EmitRangeDims = (0.5, 0.5, 0.5)
	Emit_Target = (0.5, 0.0, -1.0)
	EnableRotate
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 4.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 2.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 45.0
	selectedwind = violentwind01
	dragcoeff = 0.5
	LifeRange = (1.7, 2.0)
	Emit_Rate = 18.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 0
	FollowEmitter = 0.0
	FillPath
	EmitFunction = onoff
	EmitPeriod = 2.7
	SizeRange = [
		(2.0, 2.0)
		(6.0, 6.0)
	]
	SpeedRange = (5.0, 6.0)
	turbulence = (0.0, 0.0, 0.0)
	RotVel = (-0.15, -0.05)
	RotVelTimeScale = 1.0
	EmitDelayStart = 0.0
	PathFollowTime = 0.0
	History = 2
	HistoryListCoordinateSpace = World
	Color = 1110717695
	LOD_Default
	QuickMaterial = {
		layoutn = 1
		layoutm = 1
		DiffuseTextureEnabled
		DiffuseTexture = ph_smoke_singlepuff_blend_02
		SpecularPower = 0
		AlphaCutoff = 1
		BlendMode = blend
		Burn
		BurnValue = 1.0
		aoshadow = 0.0
		QuadAnimationFPS = 0
		LightGroup = allgroups
		fadeoutnearplane = 0.0
		fadeoutdistance = 0.1
	}
	Knot = [
		(-0.66779506, 0.0, -0.0)
		(-0.66779506, 0.0, -0.0)
		(-0.585361, 0.0, -0.0)
		(-0.50292695, 0.0, -0.0)
		(-0.42049402, 0.0, -0.0)
		(-0.269806, 0.0, -0.0)
		(-0.119119, 0.0, -0.0)
		(0.031569, 0.0, -0.0)
		(0.255332, 0.0, -0.0)
		(0.479095, 0.0, -0.0)
		(0.702859, 0.0, -0.0)
		(0.702859, 0.0, -0.0)
	]
	ParticleColor = [
		-1772730112
		-1708644352
		-1150921217
		-1739237889
		-554893313
		-1
		-256
		-858784000
	]
	burnpervertex = [
		1.0
		0.5
		0.0
		0.0
	]
	VertexWeight = [
		0.18042602
		0.510241
		1.0
	]
}
