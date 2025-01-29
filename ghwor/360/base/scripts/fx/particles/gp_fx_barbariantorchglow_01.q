gp_fx_barbariantorchglow_01 = {
	Pos = (-12.967383, 14.058252, -9.207221)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	EmitRangeDims = (0.0, 0.1, 0.0)
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 3.0
	PerParticleWind
	EmitterVelocityWeight = 0.0
	AngleSpread = 45.0
	selectedwind = violentwind01
	dragcoeff = 0.0
	LifeRange = (0.8, 1.0)
	Emit_Rate = 2.0
	Max = 2
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(4.0, 4.0)
		(3.5, 3.5)
	]
	SpeedRange = (0.0, 0.0)
	turbulence = (0.0, 0.0, 0.0)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.0
	PathFollowTime = 0.4
	History = 2
	HistoryListCoordinateSpace = World
	Color = -103235473
	LOD_Default
	QuickMaterial = {
		layoutn = 1
		layoutm = 1
		DiffuseTextureEnabled
		DiffuseTexture = ph_radialglow_01
		SpecularPower = 0
		Lighting
		AlphaCutoff = 1
		BlendMode = add
		SoftEdge
		SoftedgeScale = 0.1
		aoshadow = 0.0
		QuadAnimationFPS = 0
		LightGroup = periphambient
		fadeoutnearplane = 0.0
		fadeoutdistance = 0.1
	}
	Knot = [
		(-0.596863, 0.0, -0.008301001)
		(-0.596863, 0.0, -0.008301001)
		(-0.51027393, 0.0, -0.008057)
		(-0.423686, 0.0, -0.007813)
		(-0.33709702, 0.0, -0.0075680004)
		(-0.21938102, 0.0, -0.00016299999)
		(-0.10166401, 0.0, 0.007243)
		(0.016052, 0.0, 0.014648)
		(0.21620701, 0.0, 0.020263998)
		(0.416362, 0.0, 0.025879001)
		(0.61651605, 0.0, 0.031494)
		(0.61651605, 0.0, 0.031494)
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
		0.0
		0.0
		0.0
		0.0
	]
	VertexWeight = [
		0.21392001
		0.505318
		1.0
	]
}
