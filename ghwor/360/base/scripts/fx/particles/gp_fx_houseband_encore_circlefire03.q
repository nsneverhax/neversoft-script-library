gp_fx_houseband_encore_circlefire03 = {
	Pos = (0.0, 0.0, -0.125861)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	ApplyPositionOffset
	splineemitter
	EmitRangeDims = (0.0, 0.0, 0.0)
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 45.0
	dragcoeff = 0.0
	LifeRange = (1.0, 1.2)
	Emit_Rate = 120.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 6.0
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
		(-0.730181, 0.0, -0.565186)
		(-0.730181, 0.0, -0.565186)
		(-0.73029995, 0.0, -0.798186)
		(-0.84729904, 0.0, -1.6115559)
		(0.061836995, 0.0, -1.6118442)
		(0.9569739, 0.0, -1.612128)
		(0.83122796, 0.0, -0.794319)
		(0.8326709, 0.0, -0.56881905)
		(0.83411604, 0.0, -0.342896)
		(0.34120598, 0.0, -0.13472798)
		(0.070245005, 0.0, -0.13770999)
		(-0.192756, 0.0, -0.140605)
		(-0.734106, 0.0, -0.316002)
		(-0.7312749, 0.0, -0.53630495)
		(-0.7312749, 0.0, -0.53630495)
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
		0.31116197
		0.618736
		0.8078241
		1.0
	]
}
