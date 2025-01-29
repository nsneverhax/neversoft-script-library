gp_fx_finalbattle_ampzilla_footdust01 = {
	Pos = (-4.9950705, 0.0, 5.371743)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	Attach
	AttachObject = z_finalbattle_trg_geo_ampzilla
	bone = bone_toe2_r
	EmitRangeDims = (4.0, 0.1, 4.0)
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
	LifeRange = (0.8, 1.5)
	Emit_Rate = 32.0
	Max = 0
	TimeSeed = 0.4
	LifeTime = 0.0
	EmitNum = 12
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(3.0, 3.0)
		(8.0, 8.0)
	]
	SpeedRange = (10.0, 12.0)
	turbulence = (1.0, 3.0, -3.0)
	RotVel = (-0.15, -0.05)
	RotVelTimeScale = 1.0
	EmitDelayStart = 0.0
	PathFollowTime = 0.0
	History = 2
	HistoryListCoordinateSpace = World
	Color = -129
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
		1699891968
		2036685824
		1817668863
		1683645951
		1414223103
		1633248000
		825310464
		1077954560
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
