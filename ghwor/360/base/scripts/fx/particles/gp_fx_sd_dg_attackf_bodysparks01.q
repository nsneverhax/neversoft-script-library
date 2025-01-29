gp_fx_sd_dg_attackf_bodysparks01 = {
	Pos = (42.339096, 0.0, 77.94541)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	Attach
	AttachObject = z_finalbattle_trg_geo_ampzilla
	bone = Bone_Stomach_Lower
	EmitRangeDims = (6.0, 6.0, 3.0)
	DoCircularEmit
	Emit_Target = (1.0, 0.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, -9.81, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 2.0
	EmitterVelocityWeight = 0.0
	Radiate
	AngleSpread = 360.0
	selectedwind = violentwind01
	dragcoeff = 0.5
	LifeRange = (1.5, 2.0)
	Emit_Rate = 128.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 128
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 0.0
	SizeRange = [
		(0.2, 0.2)
		(0.1, 0.1)
	]
	SpeedRange = (8.0, 24.0)
	turbulence = (1.0, 3.0, -3.0)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.4
	AlignWithPath
	PathFollowTime = 0.025
	History = 2
	HistoryListCoordinateSpace = World
	Color = -13026817
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
