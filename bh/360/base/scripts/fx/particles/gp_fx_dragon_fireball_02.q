GP_FX_Dragon_Fireball_02 = {
	Pos = (0.0, -1.4887841, 0.73460895)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	type = flat
	active
	ApplyPositionOffset
	AttachObject = z_norway_G_ENCORE_DragonHead
	EmitRangeDims = (0.3, 0.1, 0.0)
	Emit_Target = (0.0, 1.0, 0.0)
	EnableRotate
	EmitAngle = (145.0, 0.0, 20.0)
	Force = (0.0, 0.0, -0.5)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 70.0
	DragCoeff = 0.0
	LifeRange = (0.5, 0.6)
	Emit_Rate = 40.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 4.7
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(1.0, 1.0)
		(3.0, 3.0)
	]
	SpeedRange = (6.0, 7.0)
	RotVel = (1.0, -1.0)
	RotVelTimeScale = 0.6
	EmitDelayStart = 0.0
	PathFollowTime = 0.1
	History = 2
	HistoryListCoordinateSpace = Object
	Color = -3636737
	LOD_Default
	QuickMaterial = {
		DiffuseTextureEnabled
		DiffuseTexture = PH_FireBall_01
		SpecularPower = 0
		AlphaCutoff = 1
		BlendMode = add
		SoftEdge
		SoftedgeScale = 0.1
		QuadAnimationFPS = 0
		LightGroup = AllGroups
		FadeoutNearPlane = 0.0
		FadeoutDistance = 0.1
	}
	Knot = [
		(-0.47550198, 0.0, -0.0)
		(-0.47550198, 0.0, -0.0)
		(-0.386988, 0.0, -0.0)
		(-0.298475, 0.0, -0.0)
		(-0.20996101, 0.0, -0.0)
		(-0.13655598, 0.0, -0.0)
		(-0.063151, 0.0, -0.0)
		(0.010253999, 0.0, -0.0)
		(0.204969, 0.0, -0.0)
		(0.399684, 0.0, -0.0)
		(0.59439796, 0.0, -0.0)
		(0.59439796, 0.0, -0.0)
	]
	ParticleColor = [
		-256
		-256
		-1
		-1
		-99
		-88
		-12500736
		-12052992
	]
	VertexWeight = [
		0.24819201
		0.45402002
		1.0
	]
}
