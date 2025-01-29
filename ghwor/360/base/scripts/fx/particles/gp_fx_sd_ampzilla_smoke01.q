gp_fx_sd_ampzilla_smoke01 = {
	Pos = (41.7106, -4.0, 80.265816)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	Attach
	AttachObject = z_finalbattle_trg_geo_ampzilla
	bone = bone_shoulder_lift_r
	EmitRangeDims = (1.5, 1.5, 1.5)
	Emit_Target = (0.5, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 1.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 2.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 45.0
	selectedwind = violentwind01
	dragcoeff = 0.5
	LifeRange = (1.0, 1.2)
	Emit_Rate = 6.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 0
	FollowEmitter = 0.0
	FillPath
	EmitFunction = constant
	EmitPeriod = 1.7
	SizeRange = [
		(6.0, 6.0)
		(12.0, 12.0)
	]
	SpeedRange = (5.0, 6.0)
	turbulence = (0.0, 0.0, 0.0)
	RotVel = (-0.15, -0.05)
	RotVelTimeScale = 1.0
	EmitDelayStart = 0.0
	PathFollowTime = 0.0
	History = 2
	HistoryListCoordinateSpace = World
	Color = 1497777919
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
		-7177216
		-9079552
		-7637761
		-1451788289
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
