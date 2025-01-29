gp_fx_finalbattle_ampzilla_static_headglow01 = {
	Pos = (4.0, 2.0, -0.0)
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
	bone = Bone_Jaw
	EmitRangeDims = (3.5, 1.2, 1.2)
	Emit_Target = (1.0, 0.0, 0.0)
	EnableRotate
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	Radiate
	ElevSpread = (80.0, 100.0)
	SweepSpread = (0.0, 360.0)
	dragcoeff = 0.0
	LifeRange = (0.1, 0.2)
	Emit_Rate = 18.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 0
	FollowEmitter = 1.0
	EmitFunction = onoff
	EmitPeriod = 1.5
	SizeRange = [
		(1.0, 1.0)
		(2.0, 2.0)
	]
	SpeedRange = (0.0, 0.0)
	turbulence = (0.0, 0.0, 0.0)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.0
	PathFollowTime = 0.0
	History = 2
	HistoryListCoordinateSpace = World
	Color = 1452212144
	LOD_Default
	QuickMaterial = {
		layoutn = 1
		layoutm = 1
		DiffuseTextureEnabled
		DiffuseTexture = jow_flare02
		SpecularPower = 0
		Bloom
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
		(-0.64545804, 0.0, -0.0)
		(-0.64545804, 0.0, -0.0)
		(-0.47491202, 0.0, -0.0)
		(-0.304366, 0.0, -0.0)
		(-0.13382, 0.0, -0.0)
		(0.088232, 0.0, -0.0)
		(0.310284, 0.0, -0.0)
		(0.53233594, 0.0, -0.0)
		(0.53233594, 0.0, -0.0)
	]
	ParticleColor = [
		-1
		-1
		-1
		-1
		-1
		-1
	]
	burnpervertex = [
		1.0
		1.0
		1.0
	]
	VertexWeight = [
		0.43440402
		1.0
	]
}
