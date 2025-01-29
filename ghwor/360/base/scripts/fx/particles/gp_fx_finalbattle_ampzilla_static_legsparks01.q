gp_fx_finalbattle_ampzilla_static_legsparks01 = {
	Pos = (0.0027700001, 0.0, -0.051362)
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
	bone = Bone_Knee_L
	EmitRangeDims = (1.0, 1.0, 1.0)
	Emit_Target = (1.0, 0.0, 0.0)
	EnableRotate
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, -4.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	Radiate
	ElevSpread = (80.0, 100.0)
	SweepSpread = (0.0, 360.0)
	dragcoeff = 1.0
	LifeRange = (0.8, 1.0)
	Emit_Rate = 32.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 0
	FollowEmitter = 1.0
	EmitFunction = onoff
	EmitPeriod = 2.8
	SizeRange = [
		(0.2, 0.2)
		(0.1, 0.1)
	]
	SpeedRange = (8.0, 12.0)
	turbulence = (1.0, 3.0, -3.0)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.0
	PathFollowTime = 0.0
	History = 2
	HistoryListCoordinateSpace = World
	Color = 1452212151
	LOD_Default
	QuickMaterial = {
		TextureLayout = Layout2x2
		layoutn = 1
		layoutm = 1
		DiffuseTextureEnabled
		DiffuseTexture = ph_sparks_01
		SpecularPower = 0
		Bloom
		fillburst
		AlphaCutoff = 1
		BlendMode = add
		SoftEdge
		SoftedgeScale = 1.0
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
