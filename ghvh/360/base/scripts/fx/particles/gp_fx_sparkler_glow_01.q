gp_fx_sparkler_glow_01 = {
	Pos = (1.1933801, 1.457084, 3.939124)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	EmitRangeDims = (0.04, 0.2, 0.01)
	Emit_Target = (0.0, 0.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 60.0
	LifeRange = (0.15, 0.2)
	Emit_Rate = 10.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.3
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(5.0, 16.5)
		(4.0, 20.0)
	]
	SpeedRange = (0.1, 0.4)
	RotVel = (0.0, 1.0)
	RotVelTimeScale = 2.0
	EmitDelayStart = 0.2
	PathFollowTime = 0.0
	History = 2
	HistoryListCoordinateSpace = World
	Color = -6932481
	LOD_Default
	NoVisibilityTest
	QuickMaterial = {
		DiffuseTextureEnabled
		DiffuseTexture = ph_radialglow_01
		SpecularPower = 0
		fillburst
		AlphaCutoff = 16
		BlendMode = add
		Burn
		BurnValue = 0.85
		QuadAnimationFPS = 4
	}
	Knot = [
		(-0.455208, 0.0, -0.107158005)
		(-0.455208, 0.0, -0.107158005)
		(-0.151736, 0.0, -0.035720002)
		(-0.21263, 0.000174, -0.047101)
		(-0.273524, 0.00034900004, -0.058482002)
		(-0.060893998, 0.000174, -0.011382)
		(0.151736, 0.0, 0.035720002)
		(0.455208, 0.0, 0.107158005)
		(0.455208, 0.0, 0.107158005)
	]
	ParticleColor = [
		-4690724
		-1
		-19956231
		-46
		-256
		-1
	]
	VertexWeight = [
		0.27889302
		1.0
	]
}
