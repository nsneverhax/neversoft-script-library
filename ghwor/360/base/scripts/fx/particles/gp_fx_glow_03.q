gp_fx_glow_03 = {
	Pos = (8.854227, -0.66357404, 23.027512)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	EmitRangeDims = (0.1, 0.1, 0.1)
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 45.0
	dragcoeff = 0.0
	LifeRange = (1.0, 2.0)
	Emit_Rate = 5.0
	Max = 2
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(10.0, 10.0)
		(13.0, 13.0)
	]
	SpeedRange = (0.0, 0.0)
	turbulence = (0.0, 0.0, 0.0)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.0
	PathFollowTime = 0.0
	History = 2
	HistoryListCoordinateSpace = World
	Color = 657668432
	LOD_Default
	QuickMaterial = {
		layoutn = 1
		layoutm = 1
		DiffuseTextureEnabled
		DiffuseTexture = ph_radialglow_01
		SpecularPower = 0
		AlphaCutoff = 1
		BlendMode = add
		SoftEdge
		SoftedgeScale = 0.2
		aoshadow = 0.0
		QuadAnimationFPS = 0
		LightGroup = allgroups
		fadeoutnearplane = 5.0
		fadeoutdistance = 5.0
	}
	Knot = [
		(1.0306909, 0.0, -0.0025630002)
		(1.0306909, 0.0, -0.0025630002)
		(0.90675694, 0.0, -0.017049)
		(0.782822, 0.0, -0.031535)
		(0.65888804, 0.0, -0.046021)
		(0.279987, 0.0, -0.031127999)
		(-0.098914005, 0.0, -0.016234998)
		(-0.47781602, 0.0, -0.001343)
		(-0.722465, 0.0, 0.015747)
		(-0.96711403, 0.0, 0.032836996)
		(-1.211763, 0.0, 0.049927)
		(-1.211763, 0.0, 0.049927)
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
		0.16654398
		0.672665
		1.0
	]
}
