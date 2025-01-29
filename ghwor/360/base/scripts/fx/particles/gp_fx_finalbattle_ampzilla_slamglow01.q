gp_fx_finalbattle_ampzilla_slamglow01 = {
	Pos = (-4.98741, 0.0, 2.954456)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	Attach
	Align
	AttachObject = z_finalbattle_trg_geo_ampzilla
	bone = bone_wrist_bend_r
	EmitRangeDims = (5.0, 1.0, 1.0)
	Emit_Target = (1.0, 0.0, 0.0)
	EnableRotate
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 0.0
	dragcoeff = 0.0
	LifeRange = (0.3, 0.5)
	Emit_Rate = 4.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 4
	FollowEmitter = 1.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(12.0, 12.0)
		(52.0, 52.0)
	]
	SpeedRange = (0.0, 0.0)
	turbulence = (0.0, 0.0, 0.0)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 1.0
	EmitDelayStart = 0.0
	PathFollowTime = 0.2
	History = 2
	HistoryListCoordinateSpace = World
	Color = -1523905
	LOD_Default
	QuickMaterial = {
		layoutn = 1
		layoutm = 1
		DiffuseTextureEnabled
		DiffuseTexture = ph_radialglow_01
		SpecularPower = 0
		fillburst
		AlphaCutoff = 1
		BlendMode = add
		aoshadow = 0.0
		QuadAnimationFPS = 0
		LightGroup = allgroups
		fadeoutnearplane = 0.0
		fadeoutdistance = 0.1
	}
	Knot = [
		(-0.998441, 0.0, -0.0)
		(-0.998441, 0.0, -0.0)
		(-0.838308, 0.0, -0.0)
		(-0.9652369, 0.0, -0.0)
		(-0.805104, 0.0, -0.0)
		(-0.489148, 0.0, -0.0)
		(-0.413405, 0.0, -0.0)
		(-0.097449005, 0.0, -0.0)
		(0.0035420002, 0.0, -0.0)
		(0.631809, 0.0, -0.0)
		(0.73279995, 0.0, -0.0)
		(0.73279995, 0.0, -0.0)
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
		0.111675
		0.520431
		1.0
	]
}
