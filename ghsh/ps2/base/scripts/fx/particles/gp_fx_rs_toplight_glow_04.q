gp_fx_rs_toplight_glow_04 = {
	Pos = (0.0, -1.937838, -0.093969)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	Attach
	Align
	ApplyPositionOffset
	AttachObject = z_recordstore_g_jg_hanglight04
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
		(-1.174514, 0.0, -0.0)
		(-1.1667471, 0.0, -0.0)
		(-1.15898, 0.0, -0.0)
		(-0.35927904, 0.0, -0.0)
		(0.44042102, 0.0, -0.0)
		(1.2401221, 0.0, -0.0)
		(1.2473559, 0.0, -0.0)
		(1.2545888, 0.0, -0.0)
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
		0.0095339995
		0.991121
		1.0
	]
}
