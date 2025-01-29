gp_fx_finalbattle_ampzilla_slamdust01 = {
	Pos = (-4.9950686, 0.0, 4.3706264)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	Attach
	AttachObject = z_finalbattle_trg_geo_ampzilla
	bone = bone_finger2_base_bend_l
	EmitRangeDims = (6.0, 0.1, 6.0)
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	Radiate
	ElevSpread = (95.0, 110.0)
	SweepSpread = (0.0, 360.0)
	dragcoeff = 2.0
	LifeRange = (1.2, 1.8)
	Emit_Rate = 48.0
	Max = 0
	TimeSeed = 0.6
	LifeTime = 0.0
	EmitNum = 48
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(4.0, 4.0)
		(12.0, 12.0)
	]
	SpeedRange = (15.0, 17.0)
	turbulence = (1.0, 3.0, -3.0)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.0
	PathFollowTime = 0.0
	History = 2
	HistoryListCoordinateSpace = World
	Color = -1448895970
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
		SoftedgeScale = 1.0
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
		0.194805
		0.44891798
		1.0
	]
}
