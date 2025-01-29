GP_FX_DB_Glint_02 = {
	Pos = (1.2123641, 0.46020502, 0.429504)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	type = flat
	active
	attach
	ApplyPositionOffset
	AttachObject = Z_Mall_G_RMM_mirrorball
	EmitRangeDims = (0.1, 0.1, 0.1)
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	Radiate
	AngleSpread = 360.0
	DragCoeff = 0.0
	LifeRange = (0.3, 0.6)
	Emit_Rate = 1.0
	Max = 0
	TimeSeed = 3.0
	LifeTime = 0.0
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(0.3, 0.3)
		(4.0, 4.0)
	]
	SpeedRange = (0.0, 0.0)
	RotVel = (0.2, -0.2)
	RotVelTimeScale = 0.4
	EmitDelayStart = 0.0
	PathFollowTime = 1.0
	History = 2
	HistoryListCoordinateSpace = World
	Color = -1733841153
	LOD_Default
	QuickMaterial = {
		DiffuseTextureEnabled
		DiffuseTexture = JOW_Flare02
		SpecularPower = 0
		Bloom
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
		(-0.94792205, 0.0, 0.004395)
		(-0.94792205, 0.0, 0.004395)
		(-0.837713, 0.0, 0.009928)
		(-0.727503, 0.0, 0.015462)
		(-0.617294, 0.0, 0.020995999)
		(-0.40625504, 0.0, 0.017414998)
		(-0.195216, 0.0, 0.013834999)
		(0.015823, 0.0, 0.010253999)
		(0.337112, 0.0, -0.005046)
		(0.6584011, 0.0, -0.020344999)
		(0.97969097, 0.0, -0.035644997)
		(0.97969097, 0.0, -0.035644997)
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
		0.171596
		0.49981704
		1.0
	]
}
