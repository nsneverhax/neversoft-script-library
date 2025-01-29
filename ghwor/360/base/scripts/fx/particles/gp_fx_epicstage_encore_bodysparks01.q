gp_fx_epicstage_encore_bodysparks01 = {
	Pos = (0.35497802, 0.0, -5.001181)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	Attach
	bone = Bone_Knee_R
	EmitRangeDims = (1.0, 1.0, 1.0)
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 3.0
	PerParticleWind
	EmitterVelocityWeight = 0.0
	Radiate
	ElevSpread = (90.0, 90.0)
	SweepSpread = (0.0, 360.0)
	selectedwind = encore_bodywind01
	dragcoeff = 0.0
	LifeRange = (0.8, 1.0)
	Emit_Rate = 600.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 8.0
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 8.0
	SizeRange = [
		(0.1, 0.1)
		(0.1, 0.1)
	]
	SpeedRange = (0.0, 0.0)
	turbulence = (1.0, 3.0, 2.0)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.0
	AlignWithPath
	PathFollowTime = 0.1
	History = 2
	HistoryListCoordinateSpace = World
	Color = -1
	LOD_Default
	QuickMaterial = {
		layoutn = 1
		layoutm = 1
		DiffuseTextureEnabled
		DiffuseTexture = ph_radialglow_01
		SpecularPower = 0
		Lighting
		Bloom
		AlphaCutoff = 1
		BlendMode = add
		aoshadow = 0.0
		QuadAnimationFPS = 0
		LightGroup = blaze
		fadeoutnearplane = 0.0
		fadeoutdistance = 0.1
	}
	Knot = [
		(-0.66863203, 0.0, -0.0)
		(-0.66863203, 0.0, -0.0)
		(-0.565716, 0.0, -0.0)
		(-0.46280003, 0.0, -0.0)
		(-0.35988402, 0.0, -0.0)
		(-0.118032, 0.0, -0.0)
		(0.123821, 0.0, -0.0)
		(0.36567304, 0.0, -0.0)
		(0.46473002, 0.0, -0.0)
		(0.56378603, 0.0, -0.0)
		(0.662843, 0.0, -0.0)
		(0.662843, 0.0, -0.0)
	]
	ParticleColor = [
		-256
		-256
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
		0.231884
		0.776811
		1.0
	]
}
