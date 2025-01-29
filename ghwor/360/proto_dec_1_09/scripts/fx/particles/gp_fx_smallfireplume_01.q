gp_fx_smallfireplume_01 = {
	Pos = (-3.2893069, 0.0, 5.633362)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	EmitRangeDims = (0.05, 0.1, 0.05)
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 6.0
	LifeRange = (1.0, 1.2)
	Emit_Rate = 40.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 3.0
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(0.4, 0.4)
		(0.3, 0.3)
	]
	SpeedRange = (2.3, 2.5)
	RotVel = (0.2, -0.2)
	RotVelTimeScale = 0.5
	EmitDelayStart = 0.0
	PathFollowTime = 2.0
	History = 2
	HistoryListCoordinateSpace = World
	Color = -5469953
	LOD_Default
	QuickMaterial = {
		TextureLayout = Layout2x2
		DiffuseTextureEnabled
		DiffuseTexture = ph_fire_quad_01
		SpecularPower = 0
		Bloom
		AlphaCutoff = 1
		BlendMode = add
		Burn
		BurnValue = 0.8
		QuadAnimationFPS = 0
	}
	Knot = [
		(-0.67886907, 0.0, -0.014009)
		(-0.67886907, 0.0, -0.014009)
		(-0.63455105, 0.0, -0.0077820006)
		(-0.59023196, 0.0, -0.0015560001)
		(-0.545913, 0.0, 0.00467)
		(-0.408713, 0.0, 0.00467)
		(-0.27151302, 0.0, 0.00467)
		(-0.13431299, 0.0, 0.00467)
		(0.14347002, 0.0, 0.00467)
		(0.42125303, 0.0, 0.00467)
		(0.699036, 0.0, 0.00467)
		(0.699036, 0.0, 0.00467)
	]
	ParticleColor = [
		-256
		-256
		-1
		-1
		-1
		-1
		992149504
		1543503872
	]
	VertexWeight = [
		0.097347006
		0.395778
		1.0
	]
	UpdateScript = change_lifetime
	params = {
		smin = 1.0
		smax = 1.2
		emin = 0.1
		emax = 0.2
		delay = 2.0
		time = 0.5
		updateTime = 0.1
	}
}
