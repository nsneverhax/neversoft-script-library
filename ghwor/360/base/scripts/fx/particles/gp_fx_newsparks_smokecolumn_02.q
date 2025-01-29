gp_fx_newsparks_smokecolumn_02 = {
	Pos = (0.861664, -0.17740501, 6.8232727)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	EmitRangeDims = (0.0, 0.0, 0.0)
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 1.0
	dragcoeff = 0.0
	LifeRange = (0.5, 0.5)
	Emit_Rate = 0.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 2
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(0.2, 0.1)
		(0.15, 6.0)
	]
	SpeedRange = (1.0, 1.0)
	turbulence = (0.0, 0.0, 0.0)
	RotVel = (0.8, -0.8)
	RotVelTimeScale = 1.0
	EmitDelayStart = 0.0
	AlignWithPath
	PathFollowTime = 5.0
	History = 2
	HistoryListCoordinateSpace = World
	Color = -7109377
	LOD_Default
	QuickMaterial = {
		layoutn = 1
		layoutm = 1
		DiffuseTextureEnabled
		DiffuseTexture = ph_smoke_singlepuff_blend_02
		SpecularPower = 0
		Bloom
		AlphaCutoff = 1
		BlendMode = add
		SoftEdge
		SoftedgeScale = 0.2
		aoshadow = 0.0
		QuadAnimationFPS = 0
		LightGroup = allgroups
		viewports = [
			all
		]
		fadeoutnearplane = 4.0
		fadeoutdistance = 3.0
	}
	Knot = [
		(-0.412285, 0.0, -0.0)
		(-0.412285, 0.0, -0.0)
		(-0.38650003, 0.0, -0.0)
		(-0.36071503, 0.0, -0.0)
		(-0.33493003, 0.0, -0.0)
		(-0.115792, 0.0, -0.0)
		(-0.002297, 0.0, -0.0)
		(0.216841, 0.0, -0.0)
		(0.247123, 0.0, -0.0)
		(0.383048, 0.0, -0.0)
		(0.41333, 0.0, -0.0)
		(0.41333, 0.0, -0.0)
	]
	ParticleColor = [
		-2716929
		-2716929
		-2716929
		-2716929
		-2716929
		-2716929
		-2717184
		-2717184
	]
	burnpervertex = [
		1.0
		1.0
		1.0
		1.0
	]
	VertexWeight = [
		0.09369401
		0.76200897
		1.0
	]
}
