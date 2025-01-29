gp_fx_punkstage_encore_poof02 = {
	Pos = (-1.314742, 0.0, 1.144938)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	Attach
	bone = BONE_PELVIS
	EmitRangeDims = (0.0, 0.0, 0.0)
	DoCircularEmit
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	Radiate
	AngleSpread = 360.0
	dragcoeff = 0.0
	LifeRange = (0.2, 0.3)
	Emit_Rate = 12.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 4
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(0.0, 0.0)
		(6.0, 6.0)
	]
	SpeedRange = (0.0, 0.0)
	turbulence = (0.0, 0.0, 0.0)
	RotVel = (-0.2, 0.2)
	RotVelTimeScale = 1.0
	EmitDelayStart = 0.0
	PathFollowTime = 0.0
	History = 2
	HistoryListCoordinateSpace = World
	Color = -1560318337
	LOD_Default
	QuickMaterial = {
		layoutn = 1
		layoutm = 1
		DiffuseTextureEnabled
		DiffuseTexture = ph_electricity_01
		SpecularPower = 0
		Lighting
		alphacrunch
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
		(-0.619286, 0.0, -0.0)
		(-0.619286, 0.0, -0.0)
		(-0.509028, 0.0, -0.0)
		(-0.398769, 0.0, -0.0)
		(-0.28851, 0.0, -0.0)
		(-0.092495, 0.0, -0.0)
		(0.103521, 0.0, -0.0)
		(0.299536, 0.0, -0.0)
		(0.402444, 0.0, -0.0)
		(0.505352, 0.0, -0.0)
		(0.60826105, 0.0, -0.0)
		(0.60826105, 0.0, -0.0)
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
		0.269461
		0.748503
		1.0
	]
}
