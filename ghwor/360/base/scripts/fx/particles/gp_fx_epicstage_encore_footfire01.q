gp_fx_epicstage_encore_footfire01 = {
	Pos = (0.35497802, 0.0, -5.80239)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	Attach
	bone = Bone_Toe_R
	EmitRangeDims = (0.05, 0.02, 0.15)
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 2.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 3.0
	TargetPosition = 2.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 180.0
	selectedwind = violentwind01
	dragcoeff = 0.5
	LifeRange = (0.5, 0.7)
	Emit_Rate = 100.0
	Max = 0
	TimeSeed = 0.2
	LifeTime = 0.2
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(0.3, 0.3)
		(0.2, 0.2)
	]
	SpeedRange = (0.2, 0.4)
	turbulence = (1.0, 3.0, 2.0)
	RotVel = (-0.15, -0.05)
	RotVelTimeScale = 1.0
	EmitDelayStart = 0.0
	PathFollowTime = 0.0
	History = 2
	HistoryListCoordinateSpace = World
	Color = -1
	LOD_Default
	QuickMaterial = {
		layoutn = 1
		layoutm = 1
		DiffuseTextureEnabled
		DiffuseTexture = ph_firepuffs_alpha
		SpecularPower = 0
		Lighting
		alphacrunch
		AlphaCutoff = 1
		BlendMode = add
		Burn
		BurnValue = 0.9
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
