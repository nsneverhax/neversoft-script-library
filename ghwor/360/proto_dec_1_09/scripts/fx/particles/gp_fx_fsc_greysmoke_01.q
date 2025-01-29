gp_fx_fsc_greysmoke_01 = {
	Pos = (-2.2053783, 1.889367, -6.1750865)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	EmitRangeDims = (0.2, 0.0, 0.0)
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, -0.2, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 35.0
	dragcoeff = 0.5
	LifeRange = (1.5, 1.7)
	Emit_Rate = 10.0
	Max = 0
	TimeSeed = 0.8
	LifeTime = 0.2
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(0.5, 0.5)
		(1.75, 1.75)
	]
	SpeedRange = (1.8, 2.1)
	RotVel = (0.7, -0.7)
	RotVelTimeScale = 0.6
	EmitDelayStart = 0.0
	PathFollowTime = 0.0
	History = 2
	HistoryListCoordinateSpace = World
	Color = -404232247
	LOD_Default
	QuickMaterial = {
		DiffuseTextureEnabled
		DiffuseTexture = ph_smoke_singlepuff_blend_02
		SpecularPower = 0
		Lighting
		fakeambientocclusion
		AlphaCutoff = 1
		BlendMode = blend
		SoftEdge
		SoftedgeScale = 0.2
		Burn
		BurnValue = 0.16
		QuadAnimationFPS = 0
		LightGroup = None
		fadeoutnearplane = 2.0
		fadeoutdistance = 1.0
	}
	Knot = [
		(-0.412285, 0.0, -0.0)
		(-0.412285, 0.0, -0.0)
		(-0.38650003, 0.0, -0.0)
		(-0.36071503, 0.0, -0.0)
		(-0.33493003, 0.0, -0.0)
		(-0.115792, 0.0, -0.0)
		(-0.28623304, 0.0, -0.0)
		(-0.067095004, 0.0, -0.0)
		(-0.036812995, 0.0, -0.0)
		(0.383048, 0.0, -0.0)
		(0.41333, 0.0, -0.0)
		(0.41333, 0.0, -0.0)
	]
	ParticleColor = [
		-256
		-1414812928
		-1
		-1768515841
		-1
		-1397969665
		-256
		-1296911872
	]
	VertexWeight = [
		0.09369401
		0.41809997
		1.0
	]
}
