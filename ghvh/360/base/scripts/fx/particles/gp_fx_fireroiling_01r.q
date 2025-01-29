gp_fx_fireroiling_01r = {
	Pos = (-2.1970139, 1.1912951, -0.53067994)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	EmitRangeDims = (0.1, 0.1, 0.1)
	DoCircularEmit
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 5.0
	LifeRange = (1.1, 1.5)
	Emit_Rate = 8.0
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
	SpeedRange = (1.4, 1.5)
	RotVel = (-1.1, -1.0)
	RotVelTimeScale = 0.4
	EmitDelayStart = 0.0
	PathFollowTime = 0.0
	History = 2
	HistoryListCoordinateSpace = World
	Color = -51
	LOD_Default
	QuickMaterial = {
		DiffuseTextureEnabled
		DiffuseTexture = ta_fireball01
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
		(-0.77189296, 0.0, 0.018694999)
		(-0.77189296, 0.0, 0.018694999)
		(-0.674807, 0.0, 0.016343)
		(-0.57772005, 0.0, 0.013993)
		(-0.48063403, 0.0, 0.011641)
		(-0.16401298, 0.0, 0.003972)
		(0.152608, 0.0, -0.003696)
		(0.469229, 0.0, -0.011365001)
		(0.469229, 0.0, -0.011365001)
	]
	ParticleColor = [
		-256
		-256
		-1
		-51
		-256
		-256
	]
	VertexWeight = [
		0.23467399
		1.0
	]
}
