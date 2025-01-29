gp_fx_rs_toplight_glow_05 = {
	Pos = (0.0, -1.937838, -0.1279)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	Attach
	Align
	ApplyPositionOffset
	AttachObject = z_recordstore_g_jg_hanglight05
	EmitRangeDims = (0.0, 0.0, 0.0)
	Emit_Target = (0.0, 1.0, 0.0)
	EnableRotate
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 45.0
	LifeRange = (0.1, 10.0)
	Emit_Rate = 10.0
	Max = 2
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(6.0, 6.0)
		(6.0, 6.0)
	]
	SpeedRange = (0.0, 0.0)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.0
	PathFollowTime = 0.0
	History = 2
	HistoryListCoordinateSpace = object
	Color = -1364362497
	LOD_Default
	QuickMaterial = {
		DiffuseTextureEnabled
		DiffuseTexture = ph_radialglow_01
		SpecularPower = 0
		fillburst
		AlphaCutoff = 1
		BlendMode = add
		Burn
		BurnValue = 0.9
		QuadAnimationFPS = 0
	}
	Knot = [
		(-1.182281, 0.0, -0.0)
		(-1.182281, 0.0, -0.0)
		(-1.1730942, 0.0, -0.0)
		(-1.163907, 0.0, -0.0)
		(-1.1547209, 0.0, -0.0)
		(-0.35208502, 0.0, -0.0)
		(0.45055002, 0.0, -0.0)
		(1.253185, 0.0, -0.0)
		(1.256064, 0.0, -0.0)
		(1.2589442, 0.0, -0.0)
		(1.261823, 0.0, -0.0)
		(1.261823, 0.0, -0.0)
	]
	ParticleColor = [
		-256
		-256
		-196
		-189
		-196
		-189
		-256
		-256
	]
	VertexWeight = [
		0.011275999
		0.996466
		1.0
	]
}
