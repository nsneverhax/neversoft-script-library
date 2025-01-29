GP_StarPower_Butterflies01 = {
	Pos = (0.35688803, 40.385303, 0.071379)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = V
	Active
	CreatedAtStart
	Attach
	AttachObject = GUITARIST
	Bone = BONE_PELVIS
	EmitRangeDims = (0.7, 0.7, 0.7)
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 1.0
	PerParticleWind
	EmitterVelocityWeight = 0.0
	Radiate
	ElevSpread = (90.0, 90.0)
	SweepSpread = (0.0, 360.0)
	LifeRange = (2.0, 2.5)
	Emit_Rate = 2.0
	MAX = 0
	TimeSeed = 0.5
	LifeTime = 0.0
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(0.7, 0.2)
		(0.2, 0.2)
	]
	DepthRange = (0.2, 0.2)
	SpeedRange = (0.5, 1.0)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.0
	AlignWithPath
	PathFollowTime = 0.0
	History = 2
	HistoryListCoordinateSpace = World
	align_to = (1.0, 0.0, 0.0)
	Color = -1
	NoVisibilityTest
	QuickMaterial = {
		DiffuseTextureEnabled
		DiffuseTexture = JOW_Butterflies01
		SpecularPower = 0
		TwoSide
		AlphaCutoff = 48
		BlendMode = BLEND
		Burn
		BurnValue = 0.7
		QuadAnimationFPS = 15
	}
	Knot = [
		(-5.710207, 0.0, -0.28551)
		(-5.710207, 0.0, -0.28551)
		(-5.3715625, 0.0, -0.26898497)
		(-5.032917, 0.0, -0.25246102)
		(-4.694272, 0.0, -0.235936)
		(-2.1073966, 0.0, -0.109706)
		(0.479479, 0.0, 0.016524997)
		(3.066355, 0.0, 0.142755)
		(3.9952242, 0.0, 0.142755)
		(4.9240932, 0.0, 0.142755)
		(5.852962, 0.0, 0.142755)
		(5.852962, 0.0, 0.142755)
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
	VertexWeight = [
		0.08788499
		0.759228
		1.0
	]
	UpdateScript = starPower_Butterflies
	Params = {
		sMinW = 1.0
		sMaxW = 0.2
		eMinW = 0.2
		eMaxW = 0.1
		sMinH = 0.05
		sMaxH = 0.5
		eMinH = 0.02
		eMaxH = 0.1
		cycleTime = 0.2
		updateTime = 0.02
	}
}
