gp_fx_hw_shotc_muzzlerings01 = {
	Pos = (0.4, 0.0, -0.0)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	Attach
	Align
	ApplyPositionOffset
	AttachObject = musician2
	bone = BONE_GUITAR_FRET_POS
	EmitRangeDims = (0.0, 0.0, 0.0)
	Emit_Target = (-1.0, 0.0, 0.0)
	EnableRotate
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 2.0
	dragcoeff = 0.0
	LifeRange = (0.15, 0.16)
	Emit_Rate = 64.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 1.5
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(0.2, 0.2)
		(1.5, 1.5)
	]
	SpeedRange = (0.8, 1.0)
	turbulence = (0.0, 0.0, 0.0)
	RotVel = (-0.05, 1.0)
	RotVelTimeScale = 1.0
	EmitDelayStart = 0.5
	PathFollowTime = 0.1
	History = 2
	HistoryListCoordinateSpace = World
	align_to = (0.0, 0.0, 0.0)
	Color = -10987302
	LOD_Default
	QuickMaterial = {
		layoutn = 1
		layoutm = 1
		DiffuseTextureEnabled
		DiffuseTexture = electriccircle_02
		SpecularPower = 0
		TwoSide
		Bloom
		AlphaCutoff = 1
		BlendMode = add
		SoftEdge
		SoftedgeScale = 1.0
		aoshadow = 0.0
		QuadAnimationFPS = 0
		LightGroup = allgroups
		fadeoutnearplane = 0.0
		fadeoutdistance = 0.1
	}
	Knot = [
		(-0.81666, 0.0, -0.0)
		(-0.81666, 0.0, -0.0)
		(-0.7622169, 0.0, -0.0)
		(-0.707773, 0.0, -0.0)
		(-0.65333, 0.0, -0.0)
		(-0.517215, 0.0, -0.0)
		(-0.381101, 0.0, -0.0)
		(-0.24498601, 0.0, -0.0)
		(0.027229998, 0.0, -0.0)
		(0.299446, 0.0, -0.0)
		(0.571662, 0.0, -0.0)
		(0.571662, 0.0, -0.0)
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
		0.117646
		0.411773
		1.0
	]
}
