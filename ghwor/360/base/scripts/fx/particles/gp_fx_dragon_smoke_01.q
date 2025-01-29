gp_fx_dragon_smoke_01 = {
	Pos = (0.0, -1.573477, 0.94021)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	Attach
	ApplyPositionOffset
	AttachObject = z_norway_g_encore_dragonhead
	EmitRangeDims = (0.3, 0.1, 0.0)
	Emit_Target = (0.0, 1.0, 0.0)
	EnableRotate
	EmitAngle = (145.0, 0.0, 20.0)
	Force = (0.0, 2.0, -0.5)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 45.0
	dragcoeff = 0.0
	LifeRange = (2.0, 3.0)
	Emit_Rate = 15.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 2.0
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(1.0, 1.0)
		(3.0, 3.0)
	]
	SpeedRange = (1.0, 3.0)
	RotVel = (1.0, -1.0)
	RotVelTimeScale = 0.3
	EmitDelayStart = 0.0
	PathFollowTime = 0.1
	History = 2
	HistoryListCoordinateSpace = object
	Color = 892084223
	LOD_Default
	QuickMaterial = {
		DiffuseTextureEnabled
		DiffuseTexture = ph_smoke_singlepuff_blend_02
		SpecularPower = 0
		AlphaCutoff = 1
		BlendMode = blend
		SoftEdge
		SoftedgeScale = 0.2
		Burn
		BurnValue = 0.2
		QuadAnimationFPS = 0
		LightGroup = allgroups
		fadeoutnearplane = 0.0
		fadeoutdistance = 0.1
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
		-1
		-1
		-12303360
		-12052992
	]
	VertexWeight = [
		0.24819201
		0.45402002
		1.0
	]
}
