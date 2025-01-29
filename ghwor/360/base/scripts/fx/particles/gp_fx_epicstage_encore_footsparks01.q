gp_fx_epicstage_encore_footsparks01 = {
	Pos = (0.0, 0.0, 0.21484399)
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
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 2.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 45.0
	selectedwind = violentwind01
	dragcoeff = 0.5
	LifeRange = (1.0, 1.2)
	Emit_Rate = 150.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.2
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(0.01, 0.01)
		(0.01, 0.01)
	]
	SpeedRange = (1.0, 1.5)
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
		TextureLayout = Layout2x2
		layoutn = 1
		layoutm = 1
		DiffuseTextureEnabled
		DiffuseTexture = ph_sparks_01
		SpecularPower = 0
		Lighting
		alphacrunch
		Bloom
		AlphaCutoff = 1
		BlendMode = add
		SortGroup = 3
		DrawOrder = 11.0
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
