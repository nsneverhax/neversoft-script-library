gp_fx_scifi_elecexplo_sparks_01 = {
	Pos = (4.697287, 2.0851018, 0.631156)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	EmitRangeDims = (0.2, 0.2, 0.2)
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, -8.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 200.0
	BounceHeight = 0.0
	BounceCoeff = 0.5
	BounceCallbackRate = 0.0
	LifeRange = (0.6, 1.0)
	Emit_Rate = 50.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 4.0
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = sawtooth
	EmitPeriod = 1.0
	SizeRange = [
		(0.06, 0.5)
		(0.04, 0.03)
	]
	SpeedRange = (3.0, 5.0)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.0
	AlignWithPath
	PathFollowTime = 0.1
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
