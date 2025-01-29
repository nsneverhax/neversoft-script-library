gp_fx_sparkshower_glow_01 = {
	Pos = (-2.033874, 7.4327874, 0.811539)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	EmitRangeDims = (0.5, 0.01, 0.01)
	Emit_Target = (0.0, 0.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	Radiate
	AngleSpread = 360.0
	LifeRange = (0.15, 0.2)
	Emit_Rate = 50.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.5
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(1.25, 1.25)
		(4.0, 4.0)
	]
	SpeedRange = (0.0, 0.0)
	RotVel = (0.0, 1.0)
	RotVelTimeScale = 2.0
	EmitDelayStart = 0.0
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
		(-0.45922503, 0.0, 0.088377)
		(-0.45922503, 0.0, 0.088377)
		(-0.15307502, 0.0, 0.029459)
		(-0.21329702, 0.000174, 0.043976996)
		(-0.273522, 0.00034900004, 0.058495)
		(-0.060223, 0.000174, 0.014517999)
		(0.15307502, 0.0, -0.029459)
		(0.45922503, 0.0, -0.088377)
		(0.45922503, 0.0, -0.088377)
	]
	ParticleColor = [
		-4690712
		-1
		-19956237
		-36
		-256
		-1
	]
	VertexWeight = [
		0.278894
		1.0
	]
}
