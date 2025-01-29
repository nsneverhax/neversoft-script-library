gp_fx_houseband_encore_circlefire02 = {
	Pos = (-0.072145, -0.000488, 2.5829532)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	splineemitter
	EmitRangeDims = (0.0, 0.0, 0.0)
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 60.0
	dragcoeff = 0.0
	LifeRange = (1.0, 1.2)
	Emit_Rate = 180.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 1.0
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(1.2, 1.2)
		(1.5, 2.0)
	]
	SpeedRange = (2.0, 2.5)
	turbulence = (0.0, 0.0, 0.0)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.0
	PathFollowTime = 0.7
	History = 2
	HistoryListCoordinateSpace = World
	Color = -9568001
	LOD_Default
	QuickMaterial = {
		layoutn = 1
		layoutm = 1
		DiffuseTextureEnabled
		DiffuseTexture = tb_flame_1
		SpecularPower = 0
		alphacrunch
		AlphaCutoff = 1
		BlendMode = add
		Burn
		BurnValue = 0.6
		aoshadow = 0.0
		QuadAnimationFPS = 0
		LightGroup = allgroups
		fadeoutnearplane = 0.0
		fadeoutdistance = 0.1
	}
	Knot = [
		(-1.33678, 0.0, -0.046199)
		(-1.33678, 0.0, -0.046199)
		(-1.3368989, 0.0, -0.8329469)
		(-0.566481, 0.0, -1.0925689)
		(0.061836995, 0.0, -1.092857)
		(0.68048, 0.0, -1.0931411)
		(1.3632059, 0.0, -0.83515203)
		(1.3646488, 0.0, -7E-06)
		(1.366094, 0.0, 0.836706)
		(0.798597, 0.0, 0.777803)
		(0.070245005, 0.0, 0.77482104)
		(-0.63671, 0.0, 0.77192694)
		(-1.3392919, 0.0, 0.827972)
		(-1.3378739, 0.0, -0.017318)
		(-1.3378739, 0.0, -0.017318)
	]
	ParticleColor = [
		-129
		-256
		-1
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
		1.0
	]
	VertexWeight = [
		0.259777
		0.514771
		0.750916
		1.0
	]
}
