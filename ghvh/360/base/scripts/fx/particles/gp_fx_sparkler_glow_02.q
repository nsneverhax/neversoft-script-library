gp_fx_sparkler_glow_02 = {
	Pos = (0.530825, 0.182012, -0.39143103)
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
		(5.0, 6.5)
		(4.0, 5.0)
	]
	SpeedRange = (0.1, 0.4)
	RotVel = (0.0, 1.0)
	RotVelTimeScale = 2.0
	EmitDelayStart = 0.2
	PathFollowTime = 0.0
	History = 2
	HistoryListCoordinateSpace = World
	Color = -1056513
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
		(-0.46375102, 0.0, -0.060270995)
		(-0.46375102, 0.0, -0.060270995)
		(-0.15458399, 0.0, -0.020091)
		(-0.21632001, 0.000174, -0.025215)
		(-0.278056, 0.00034900004, -0.030338999)
		(-0.061736, 0.000174, -0.0051249997)
		(0.15458399, 0.0, 0.020091)
		(0.46375102, 0.0, 0.060270995)
		(0.46375102, 0.0, 0.060270995)
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
		0.278894
		1.0
	]
}
