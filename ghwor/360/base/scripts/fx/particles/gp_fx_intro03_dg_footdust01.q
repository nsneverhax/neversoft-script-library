gp_fx_intro03_dg_footdust01 = {
	Pos = (11.59936, 0.0, 51.6646)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	Attach
	AttachObject = GUITARIST
	bone = Bone_Toe_R
	EmitRangeDims = (1.0, 0.1, 1.0)
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	Radiate
	ElevSpread = (100.0, 120.0)
	SweepSpread = (0.0, 360.0)
	dragcoeff = 2.0
	LifeRange = (0.8, 1.2)
	Emit_Rate = 12.0
	Max = 0
	TimeSeed = 0.2
	LifeTime = 0.0
	EmitNum = 12
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(2.0, 2.0)
		(4.0, 4.0)
	]
	SpeedRange = (6.0, 8.0)
	turbulence = (1.0, 3.0, -3.0)
	RotVel = (-0.15, -0.05)
	RotVelTimeScale = 1.0
	EmitDelayStart = 0.0
	PathFollowTime = 0.0
	History = 2
	HistoryListCoordinateSpace = World
	Color = -1281921185
	LOD_Default
	QuickMaterial = {
		layoutn = 1
		layoutm = 1
		DiffuseTextureEnabled
		DiffuseTexture = ph_smoke_singlepuff_blend_02
		SpecularPower = 0
		AlphaCutoff = 1
		BlendMode = blend
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
		-1466913793
		-1466913793
		-1415080705
		1953213439
		1551084288
		1551084288
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
