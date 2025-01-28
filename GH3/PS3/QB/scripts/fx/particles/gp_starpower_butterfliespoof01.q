GP_StarPower_ButterfliesPoof01 = {
	Pos = (0.35688803, 36.271244, 0.071379)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	Attach
	AttachObject = GUITARIST
	Bone = BONE_PELVIS
	EmitRangeDims = (0.0, 0.7, 0.0)
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, -1.5, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	Radiate
	ElevSpread = (70.0, 160.0)
	SweepSpread = (0.0, 360.0)
	LifeRange = (1.0, 2.0)
	Emit_Rate = 32.0
	MAX = 0
	TimeSeed = 0.2
	LifeTime = 0.0
	EmitNum = 32
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(0.05, 1.0)
		(0.0, 2.0)
	]
	SpeedRange = (2.0, 3.0)
	RotVel = (-0.5, 0.5)
	RotVelTimeScale = 1.0
	EmitDelayStart = 0.0
	AlignWithPath
	PathFollowTime = 0.2
	History = 12
	HistoryListCoordinateSpace = World
	Color = -16743169
	LOD_Default
	QuickMaterial = {
		DiffuseTextureEnabled
		DiffuseTexture = JOW_Spark01
		SpecularPower = 0
		AlphaCutoff = 48
		BlendMode = BLEND
		Burn
		BurnValue = 0.8
		QuadAnimationFPS = 0
	}
	Knot = [
		(-0.48496202, 0.0, -0.0)
		(-0.48496202, 0.0, -0.0)
		(-0.46225402, 0.0, -0.0)
		(-0.20386702, 0.0, -0.0)
		(-0.0021040002, 0.0, -0.0)
		(0.271848, 0.0, -0.0)
		(0.228238, 0.0, -0.0)
		(0.365742, 0.0, -0.0)
		(0.595752, 0.0, -0.0)
		(1.006876, 0.0, -0.0)
		(1.051219, 0.0, -0.0)
		(1.051219, 0.0, -0.0)
	]
	ParticleColor = [
		-1
		-1
		-1
		-1
		-1
		-1
		-256
		-256
	]
	VertexWeight = [
		0.314324
		0.553779
		1.0
	]
}
