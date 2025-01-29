gp_fx_sd_dg_attacka_sparks01 = {
	Pos = (42.592197, 0.0, 75.67115)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	Attach
	AttachObject = GUITARIST
	bone = bone_guitar_body
	EmitRangeDims = (2.0, 2.0, 2.0)
	DoCircularEmit
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, -9.8, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	Radiate
	AngleSpread = 360.0
	dragcoeff = 0.0
	LifeRange = (0.8, 1.2)
	Emit_Rate = 64.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 64
	FollowEmitter = 0.0
	EmitFunction = sawtooth
	EmitPeriod = 0.0
	SizeRange = [
		(0.3, 0.3)
		(0.1, 0.1)
	]
	SpeedRange = (12.0, 36.0)
	turbulence = (0.0, 0.0, 0.0)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.0
	AlignWithPath
	PathFollowTime = 0.05
	History = 2
	HistoryListCoordinateSpace = World
	Color = -10395137
	LOD_Default
	QuickMaterial = {
		TextureLayout = Layout2x2
		layoutn = 1
		layoutm = 1
		DiffuseTextureEnabled
		DiffuseTexture = ph_sparks_01
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
