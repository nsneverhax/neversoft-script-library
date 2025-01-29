gp_fx_ambflower_yellow_streaksparks_02 = {
	Pos = (1.0680549, 29.830847, -5.5145025)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = textureribbontrail
	Active
	CreatedAtStart
	EmitRangeDims = (0.2, 0.2, 0.2)
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, -6.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	Radiate
	AngleSpread = 360.0
	dragcoeff = 1.5
	LifeRange = (1.0, 2.0)
	Emit_Rate = 0.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.2
	EmitNum = 70
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(0.2, 0.1)
		(0.1, 0.1)
	]
	SpeedRange = (10.0, 13.0)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.0
	PathFollowTime = 0.0
	History = 13
	HistoryListCoordinateSpace = World
	Color = -995841
	LOD_Default
	QuickMaterial = {
		DiffuseTextureEnabled
		DiffuseTexture = JOW_Spark01
		SpecularPower = 0
		Bloom
		AlphaCutoff = 1
		BlendMode = add
		QuadAnimationFPS = 0
		LightGroup = None
	}
	Knot = [
		(-0.5952379, 0.0, -0.031328)
		(-0.5952379, 0.0, -0.031328)
		(-0.198413, 0.0, -0.010443)
		(0.198413, 0.0, 0.010443)
		(0.5952379, 0.0, 0.031329002)
		(0.5952379, 0.0, 0.031329002)
	]
	ParticleColor = [
		-1
		-1
		-256
		-256
	]
	VertexWeight = [
		1.0
	]
}
