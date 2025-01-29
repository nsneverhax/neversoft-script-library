GP_FX_Fireworks_SparkleRocket_Smoke_02 = {
	Pos = (-7.3774095, 0.0, 0.099911004)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	type = flat
	active
	CreatedAtStart
	EmitRangeDims = (0.1, 0.1, 0.1)
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 1.0
	LifeRange = (1.2, 1.6)
	Emit_Rate = 200.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 1.0
	EmitNum = 0
	FollowEmitter = 0.0
	AlwaysEmit
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(0.6, 0.6)
		(1.0, 1.0)
	]
	SpeedRange = (1.0, 1.3)
	RotVel = (0.5, -0.5)
	RotVelTimeScale = 0.3
	EmitDelayStart = 0.0
	PathFollowTime = 0.0
	History = 2
	HistoryListCoordinateSpace = World
	Color = -1256640
	LOD_Default
	QuickMaterial = {
		DiffuseTextureEnabled
		DiffuseTexture = PH_Smoke_SinglePuff_Blend_02
		SpecularPower = 0
		AlphaCutoff = 1
		BlendMode = blend
		Burn
		BurnValue = 0.4
		QuadAnimationFPS = 0
	}
	Knot = [
		(-0.48883003, 0.0, 0.17903)
		(-0.48883003, 0.0, 0.17903)
		(-0.33989704, 0.0, 0.117797)
		(-0.19096501, 0.0, 0.056563)
		(-0.042032998, 0.0, -0.00467)
		(0.148933, 0.0, -0.061232995)
		(0.33989802, 0.0, -0.117797)
		(0.530863, 0.0, -0.17436)
		(0.530863, 0.0, -0.17436)
	]
	ParticleColor = [
		-475906560
		-4235776
		-1734829825
		-1
		-1734830080
		-256
	]
	VertexWeight = [
		0.447061
		1.0
	]
}
