gp_fx_candleglows_06 = {
	Pos = (2.590693, 3.7596593, -5.7712097)
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
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	ElevSpread = (90.0, 270.0)
	SweepSpread = (0.0, 360.0)
	dragcoeff = 0.0
	LifeRange = (0.1, 1.0)
	Emit_Rate = 5.0
	Max = 1
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(3.0, 3.0)
		(3.0, 3.0)
	]
	SpeedRange = (0.0, 0.0)
	turbulence = (0.0, 0.0, 0.0)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.4
	PathFollowTime = 0.4
	History = 2
	HistoryListCoordinateSpace = World
	Color = -1232912070
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
		viewports = [
			tem
		]
		fadeoutnearplane = 0.0
		fadeoutdistance = 0.1
	}
	Knot = [
		(-0.595612, -0.0, -0.039496)
		(-0.595612, -0.0, -0.039496)
		(-0.50928295, -0.0, -0.032808997)
		(-0.42295203, -0.0, -0.026121998)
		(-0.33662203, -0.0, -0.019434998)
		(-0.21869001, -0.0, -0.017394997)
		(-0.100759, -0.0, -0.015357)
		(0.017173, -0.0, -0.013316999)
		(0.21713501, -0.0, -0.0028940002)
		(0.417097, 0.0, 0.0075270003)
		(0.61705905, 0.0, 0.017949)
		(0.61705905, 0.0, 0.017949)
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
		0.21392001
		0.505317
		1.0
	]
}
