gp_fx_hw_hita_towersparks01 = {
	Pos = (2.0, 11.5, -4.0)
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
	bone = bone_platform04
	EmitRangeDims = (0.0, 0.0, 0.0)
	Emit_Target = (1.0, 0.0, 0.0)
	EnableRotate
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, -9.81, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	Radiate
	AngleSpread = 360.0
	dragcoeff = 0.5
	LifeRange = (1.5, 2.0)
	Emit_Rate = 0.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 24
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 2.8
	SizeRange = [
		(0.2, 0.2)
		(0.1, 0.1)
	]
	SpeedRange = (8.0, 12.0)
	turbulence = (1.0, 3.0, -3.0)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.7
	PathFollowTime = 0.0
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
