gp_fx_poolfire_01 = {
	Pos = (3.645305, -2.4253852, 15.588816)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	splineemitter
	EmitRangeDims = (0.1, 0.1, 0.1)
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 45.0
	dragcoeff = 0.0
	LifeRange = (1.0, 2.4)
	Emit_Rate = 100.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(1.5, 1.0)
		(1.3, 3.0)
	]
	SpeedRange = (0.1, 0.1)
	turbulence = (0.0, 0.0, 0.0)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.0
	PathFollowTime = 40.0
	History = 2
	HistoryListCoordinateSpace = World
	Color = -222
	LOD_Default
	QuickMaterial = {
		TextureLayout = Layout2x2
		layoutn = 1
		layoutm = 1
		DiffuseTextureEnabled
		DiffuseTexture = ph_fire_quad_01
		SpecularPower = 0
		Bloom
		AlphaCutoff = 1
		BlendMode = add
		aoshadow = 0.0
		QuadAnimationFPS = 0
		LightGroup = allgroups
		fadeoutnearplane = 5.0
		fadeoutdistance = 4.0
	}
	Knot = [
		(-3.984503, 0.0, -5.533207)
		(-3.984503, 0.0, -5.533207)
		(-1.6999589, 0.0, -2.715136)
		(0.46852, 0.0, -6.02917)
		(2.161654, 0.0, -3.276942)
		(3.043462, 0.0, -1.843544)
		(0.849208, 0.0, -0.68135697)
		(0.36884, 0.0, 0.279378)
		(-0.100504, 0.0, 1.218066)
		(3.249598, 0.0, 1.984641)
		(2.837657, 0.0, 3.444422)
		(2.173763, 0.0, 5.797038)
		(-3.1611867, 0.0, 5.8159695)
		(-3.1117518, 0.0, 8.197965)
		(-3.1117518, 0.0, 8.197965)
	]
	ParticleColor = [
		900005632
		1560241920
		900005887
		1560242175
		900005887
		1560242175
		900005758
		1560242042
		900005632
		1560241920
	]
	burnpervertex = [
		1.0
		1.0
		1.0
		1.0
		1.0
	]
	VertexWeight = [
		0.297075
		0.479014
		0.661789
		1.0
	]
}
