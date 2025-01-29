gp_fx_fsc_glowsmoke_01 = {
	Pos = (-2.2053783, 0.523148, -6.1750865)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	EmitRangeDims = (0.0, 0.1, 0.0)
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 70.0
	dragcoeff = 0.0
	LifeRange = (0.3, 0.6)
	Emit_Rate = 20.0
	Max = 0
	TimeSeed = 10.0
	LifeTime = 0.2
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(0.3, 0.3)
		(0.3, 0.3)
	]
	SpeedRange = (0.1, 0.7)
	RotVel = (0.3, -0.3)
	RotVelTimeScale = 0.5
	EmitDelayStart = 0.0
	PathFollowTime = 0.0
	History = 2
	HistoryListCoordinateSpace = World
	Color = -1
	LOD_Default
	QuickMaterial = {
		DiffuseTextureEnabled
		DiffuseTexture = ph_smoke_singlepuff_blend_02
		SpecularPower = 0
		AlphaCutoff = 1
		BlendMode = blend
		SoftEdge
		SoftedgeScale = 0.5
		Burn
		BurnValue = 0.2
		QuadAnimationFPS = 0
		LightGroup = allgroups
		fadeoutnearplane = 2.0
		fadeoutdistance = 1.0
	}
	Knot = [
		(-0.412285, 0.0, -0.0)
		(-0.412285, 0.0, -0.0)
		(-0.338781, 0.0, -0.0)
		(-0.265277, 0.0, -0.0)
		(-0.191772, 0.0, -0.0)
		(-0.087588, 0.0, -0.0)
		(-0.111488, 0.0, -0.0)
		(-0.007304, 0.0, -0.0)
		(0.090212, 0.0, -0.0)
		(0.31581402, 0.0, -0.0)
		(0.41333, 0.0, -0.0)
		(0.41333, 0.0, -0.0)
	]
	ParticleColor = [
		-5091329
		-1060353
		-5091329
		-1060353
		-1922880257
		-1583905537
		218562816
		923339008
	]
	VertexWeight = [
		0.26708898
		0.49052
		1.0
	]
}
