gp_fx_candleglow_06 = {
	Pos = (1.8883371, -3.2291958, 0.007348)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	Attach
	Align
	ApplyPositionOffset
	AttachObject = z_cathedral_g_chandparent
	EmitRangeDims = (0.02, 0.02, 0.02)
	Emit_Target = (0.0, 1.0, 0.0)
	EnableRotate
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 45.0
	LifeRange = (1.3, 1.8)
	Emit_Rate = 10.0
	Max = 1
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(4.0, 5.0)
		(4.0, 5.0)
	]
	SpeedRange = (0.0, 0.0)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.0
	PathFollowTime = 0.0
	History = 2
	HistoryListCoordinateSpace = object
	Color = -154308097
	LOD_Default
	QuickMaterial = {
		DiffuseTextureEnabled
		DiffuseTexture = ph_radialglow_01
		SpecularPower = 0
		AlphaCutoff = 1
		BlendMode = add
		SoftEdge
		SoftedgeScale = 0.1
		Burn
		BurnValue = 0.9
		QuadAnimationFPS = 0
	}
	Knot = [
		(-1.182281, 0.0, -0.0)
		(-1.182281, 0.0, -0.0)
		(-1.147748, 0.0, -0.0)
		(-1.1132141, 0.0, -0.0)
		(-1.078681, 0.0, -0.0)
		(-0.344742, 0.0, -0.0)
		(0.38919702, 0.0, -0.0)
		(1.1231371, 0.0, -0.0)
		(1.1693649, 0.0, -0.0)
		(1.215594, 0.0, -0.0)
		(1.261823, 0.0, -0.0)
		(1.261823, 0.0, -0.0)
	]
	ParticleColor = [
		-256
		0
		-196
		-189
		-196
		-189
		-256
		0
	]
	VertexWeight = [
		0.042388
		0.943257
		1.0
	]
}
