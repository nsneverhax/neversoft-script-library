gp_fx_ms_fireplacefire_01 = {
	Pos = (9.08918, 0.17236401, -3.6547308)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	splineemitter
	EmitRangeDims = (0.0, 0.0, 0.0)
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 1.0
	selectedwind = violentwind01
	dragcoeff = 0.0
	LifeRange = (1.3, 1.5)
	Emit_Rate = 30.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 1.0
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(1.3, 1.3)
		(0.7, 0.7)
	]
	SpeedRange = (2.2, 2.4)
	turbulence = (0.0, 0.0, 0.0)
	RotVel = (0.5, -0.5)
	RotVelTimeScale = 0.2
	EmitDelayStart = 0.0
	PathFollowTime = 0.4
	History = 2
	HistoryListCoordinateSpace = World
	Color = -2074525977
	LOD_Default
	QuickMaterial = {
		TextureLayout = Layout2x2
		layoutn = 1
		layoutm = 1
		DiffuseTextureEnabled
		DiffuseTexture = ph_fire_quad_01
		SpecularPower = 0
		frame0
		Bloom
		AlphaCutoff = 1
		BlendMode = add
		SoftEdge
		SoftedgeScale = 0.3
		aoshadow = 0.0
		QuadAnimationFPS = 0
		LightGroup = allgroups
		fadeoutnearplane = 0.0
		fadeoutdistance = 0.1
	}
	Knot = [
		(0.015609999, 0.0, 0.596716)
		(0.015609999, 0.0, 0.596716)
		(0.012386, 0.0, 0.510188)
		(0.009161999, 0.0, 0.42365903)
		(0.005938, 0.0, 0.33713)
		(0.008623, 0.0, 0.21921101)
		(0.011309001, 0.0, 0.10129301)
		(0.013994, 0.0, -0.016625999)
		(0.011588, 0.0, -0.216845)
		(0.009182999, 0.0, -0.41706398)
		(0.0067780004, 0.0, -0.617283)
		(0.0067780004, 0.0, -0.617283)
	]
	ParticleColor = [
		-256
		-256
		-1
		-1
		-932878849
		-931314177
		1765226240
		1210061568
	]
	burnpervertex = [
		0.0
		0.0
		0.0
		0.0
	]
	VertexWeight = [
		0.21392001
		0.505317
		1.0
	]
}
