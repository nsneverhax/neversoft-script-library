gp_fx_sparkfountain_sparks_01 = {
	Pos = (-6.6185994, 0.58740205, -2.0856233)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = textureribbontrail
	Active
	CreatedAtStart
	EmitRangeDims = (0.1, 0.1, 0.1)
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, -8.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 45.0
	dragcoeff = 0.5
	LifeRange = (0.5, 1.0)
	Emit_Rate = 100.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 20
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(0.04, 0.04)
		(0.03, 0.03)
	]
	SpeedRange = (3.0, 7.0)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.0
	PathFollowTime = 0.03
	History = 2
	HistoryListCoordinateSpace = World
	Color = -4882945
	LOD_Default
	QuickMaterial = {
		DiffuseTextureEnabled
		DiffuseTexture = JOW_Spark01
		SpecularPower = 0
		Bloom
		AlphaCutoff = 1
		BlendMode = add
		QuadAnimationFPS = 0
		LightGroup = allgroups
		fadeoutnearplane = 0.0
		fadeoutdistance = 0.1
	}
	Knot = [
		(-0.289338, 0.0, 0.003587)
		(-0.289338, 0.0, 0.003587)
		(-0.16197601, 0.0, 0.001793)
		(-0.034614995, 0.0, -0.0)
		(0.092747, 0.0, -0.001793)
		(0.147716, 0.0, -0.001793)
		(0.20268501, 0.0, -0.001793)
		(0.257654, 0.0, -0.001793)
		(0.257654, 0.0, -0.001793)
	]
	ParticleColor = [
		-1
		-1
		-1
		-1
		-256
		-256
	]
	VertexWeight = [
		0.69854105
		1.0
	]
}
