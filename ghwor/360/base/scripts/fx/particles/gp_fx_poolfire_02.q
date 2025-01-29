gp_fx_poolfire_02 = {
	Pos = (-3.8998058, -2.4253852, 13.919363)
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
	LifeRange = (1.5, 2.3)
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
	Color = -238
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
		SoftEdge
		SoftedgeScale = 0.5
		aoshadow = 0.0
		QuadAnimationFPS = 0
		LightGroup = allgroups
		fadeoutnearplane = 5.0
		fadeoutdistance = 4.0
	}
	Knot = [
		(2.099135, 0.0, -6.600767)
		(2.099135, 0.0, -6.600767)
		(3.0673609, 0.0, -3.782696)
		(-2.8670259, -0.0, -5.1886907)
		(-3.9859443, 0.0, -2.0495582)
		(-4.568691, 0.0, -0.41465303)
		(-1.0638789, -0.0, -1.6750141)
		(-1.195971, -0.0, -0.057672996)
		(-1.3250309, -0.0, 1.5225528)
		(-5.253766, 0.0, 1.411595)
		(-4.841825, 0.0, 2.8713758)
		(-4.177931, 0.0, 5.2239895)
		(-0.88358, -0.0, 6.197103)
		(-0.933016, -0.0, 8.579093)
		(-0.933016, -0.0, 8.579093)
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
		0.34114796
		0.505455
		0.710736
		1.0
	]
}
