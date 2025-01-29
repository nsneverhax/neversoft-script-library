gp_fx_intro03_ax_glow02 = {
	Pos = (4.8175225, 0.0, 56.59215)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	Attach
	AttachObject = GUITARIST
	bone = bone_guitar_body
	EmitRangeDims = (0.1, 0.1, 0.1)
	DoCircularEmit
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	Radiate
	AngleSpread = 360.0
	dragcoeff = 0.0
	LifeRange = (2.1, 2.1)
	Emit_Rate = 1.0
	Max = 1
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 1
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(4.0, 4.0)
		(160.0, 160.0)
	]
	SpeedRange = (0.0, 0.0)
	turbulence = (0.0, 0.0, 0.0)
	RotVel = (0.5, 0.5)
	RotVelTimeScale = 1.0
	EmitDelayStart = 0.0
	PathFollowTime = 0.5
	History = 2
	HistoryListCoordinateSpace = World
	Color = -5206594
	LOD_Default
	QuickMaterial = {
		layoutn = 1
		layoutm = 1
		DiffuseTextureEnabled
		DiffuseTexture = jow_flare02
		SpecularPower = 0
		Bloom
		AlphaCutoff = 1
		BlendMode = add
		SoftEdge
		SoftedgeScale = 0.2
		aoshadow = 0.0
		QuadAnimationFPS = 0
		LightGroup = allgroups
		fadeoutnearplane = 0.0
		fadeoutdistance = 0.1
	}
	Knot = [
		(-1.010263, 0.0, -0.0)
		(-1.010263, 0.0, -0.0)
		(-0.797576, 0.0, -0.0)
		(-0.584889, 0.0, -0.0)
		(-0.372202, 0.0, -0.0)
		(-0.15951501, 0.0, -0.0)
		(0.053172, 0.0, -0.0)
		(0.265859, 0.0, -0.0)
		(0.54944104, 0.0, -0.0)
		(0.833024, 0.0, -0.0)
		(1.1166071, 0.0, -0.0)
		(1.1166071, 0.0, -0.0)
	]
	ParticleColor = [
		-1
		-1
		-1
		-1
		-1
		-1
		-256
		-256
	]
	burnpervertex = [
		1.0
		1.0
		1.0
		1.0
	]
	VertexWeight = [
		0.3
		0.6
		1.0
	]
}
