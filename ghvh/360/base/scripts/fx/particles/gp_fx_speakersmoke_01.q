gp_fx_speakersmoke_01 = {
	Pos = (4.00343, 2.4120402, -1.4324518)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	EmitRangeDims = (0.2, 0.2, 0.2)
	DoCircularEmit
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 45.0
	LifeRange = (5.0, 7.0)
	Emit_Rate = 2.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(0.5, 0.5)
		(1.2, 1.2)
	]
	SpeedRange = (0.18, 0.21000001)
	RotVel = (0.2, -0.2)
	RotVelTimeScale = 0.4
	EmitDelayStart = 0.0
	PathFollowTime = 0.0
	History = 2
	HistoryListCoordinateSpace = World
	Color = -1213950342
	LOD_Default
	QuickMaterial = {
		DiffuseTextureEnabled
		DiffuseTexture = ph_smoke_singlepuff_blend_02
		SpecularPower = 0
		AlphaCutoff = 1
		BlendMode = blend
		SoftEdge
		SoftedgeScale = 0.3
		Burn
		BurnValue = 0.5
		QuadAnimationFPS = 0
	}
	Knot = [
		(-0.79607993, 0.0, -0.47971)
		(-0.79607993, 0.0, -0.47971)
		(-0.695951, 0.0, -0.419374)
		(-0.595823, 0.0, -0.35903704)
		(-0.495694, 0.0, -0.298701)
		(-0.16915199, 0.0, -0.10193001)
		(0.15739001, 0.0, 0.094842)
		(0.48393202, 0.0, 0.291613)
		(0.48393202, 0.0, 0.291613)
	]
	ParticleColor = [
		-256
		-256
		-218
		-205
		-256
		-256
	]
	VertexWeight = [
		0.23467399
		1.0
	]
}
