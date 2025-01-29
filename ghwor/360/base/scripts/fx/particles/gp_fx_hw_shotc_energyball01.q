gp_fx_hw_shotc_energyball01 = {
	Pos = (5.901907, 0.0, -2.5689409)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	Attach
	Align
	AttachObject = musician2
	bone = BONE_GUITAR_FRET_POS
	EmitRangeDims = (0.0, 0.0, 0.0)
	Emit_Target = (1.0, 0.0, 0.0)
	EnableRotate
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 5.0
	BounceHeight = 0.0
	BounceCoeff = 0.5
	BounceCallbackRate = 0.0
	dragcoeff = 0.0
	LifeRange = (1.0, 1.0)
	Emit_Rate = 160.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 1.5
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(0.03, 0.1)
		(1.0, 0.1)
	]
	SpeedRange = (20.0, 21.0)
	turbulence = (0.0, 0.0, 0.0)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.5
	AlignWithPath
	PathFollowTime = 0.1
	History = 2
	HistoryListCoordinateSpace = World
	Color = -11057012
	LOD_Default
	QuickMaterial = {
		layoutn = 1
		layoutm = 1
		DiffuseTextureEnabled
		DiffuseTexture = electricball_01
		SpecularPower = 0
		AlphaCutoff = 1
		BlendMode = add
		aoshadow = 0.0
		QuadAnimationFPS = 0
		LightGroup = allgroups
		fadeoutnearplane = 0.0
		fadeoutdistance = 0.1
	}
	Knot = [
		(-0.81666, 0.0, -0.0)
		(-0.81666, 0.0, -0.0)
		(-0.7622169, 0.0, -0.0)
		(-0.707773, 0.0, -0.0)
		(-0.65333, 0.0, -0.0)
		(-0.39812198, 0.0, -0.0)
		(-0.142914, 0.0, -0.0)
		(0.112293005, 0.0, -0.0)
		(0.265416, 0.0, -0.0)
		(0.418539, 0.0, -0.0)
		(0.571662, 0.0, -0.0)
		(0.571662, 0.0, -0.0)
	]
	ParticleColor = [
		-88
		-1
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
		0.117646
		0.66911906
		1.0
	]
}
