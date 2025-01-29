gp_fx_finalbattle_ampzilla_slamsparks01 = {
	Pos = (-4.9995785, 0.0, 3.2017891)
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
	EmitRangeDims = (8.0, 2.0, 2.0)
	Emit_Target = (1.0, 0.0, 0.0)
	EnableRotate
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, -4.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	Radiate
	ElevSpread = (100.0, 120.0)
	SweepSpread = (0.0, 360.0)
	dragcoeff = 0.5
	LifeRange = (0.5, 0.7)
	Emit_Rate = 60.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 60
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(0.4, 0.4)
		(0.2, 0.2)
	]
	SpeedRange = (8.0, 24.0)
	turbulence = (0.0, 0.0, 0.0)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.0
	PathFollowTime = 0.2
	History = 2
	HistoryListCoordinateSpace = World
	Color = -2518017
	LOD_Default
	QuickMaterial = {
		TextureLayout = Layout2x2
		layoutn = 1
		layoutm = 1
		DiffuseTextureEnabled
		DiffuseTexture = ph_sparks_01
		SpecularPower = 0
		Bloom
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
		(-0.88197595, 0.0, -0.0)
		(-0.74664897, 0.0, -0.0)
		(-0.479638, 0.0, -0.0)
		(-0.09543601, 0.0, -0.0)
		(0.22051999, 0.0, -0.0)
		(0.32151103, 0.0, -0.0)
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
		0.14544
		0.704097
		1.0
	]
}
