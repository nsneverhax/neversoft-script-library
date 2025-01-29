gp_fx_line01_attachsparkribbons_01 = {
	Pos = (-14.528249, 14.522113, -10.531492)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = textureribbontrail
	Active
	Attach
	AttachObject = z_riothouse_gfx_fx_lineghost_01
	EmitRangeDims = (0.0, 0.0, 0.0)
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, -10.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 300.0
	dragcoeff = 0.0
	LifeRange = (0.3, 1.0)
	Emit_Rate = 200.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 1.0
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 0.1
	SizeRange = [
		(0.06, 0.06)
		(0.02, 0.02)
	]
	SpeedRange = (5.0, 8.0)
	turbulence = (0.0, 0.0, 0.0)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.0
	PathFollowTime = 0.03
	History = 4
	HistoryListCoordinateSpace = World
	Color = -486558465
	LOD_Default
	QuickMaterial = {
		layoutn = 1
		layoutm = 1
		DiffuseTextureEnabled
		DiffuseTexture = JOW_Spark01
		SpecularPower = 0
		Bloom
		AlphaCutoff = 1
		BlendMode = add
		aoshadow = 0.0
		QuadAnimationFPS = 0
		LightGroup = allgroups
		fadeoutnearplane = 0.0
		fadeoutdistance = 0.1
	}
	Knot = [
		(-1.5869961, 0.0, 0.111724)
		(-1.5869961, 0.0, 0.111724)
		(-1.4003559, 0.0, 0.114843)
		(-1.213716, 0.0, 0.117961995)
		(-1.0270759, 0.0, 0.12108)
		(-0.36688104, 0.0, 0.070573)
		(0.293313, 0.0, 0.020066999)
		(0.953507, 0.0, -0.030439999)
		(1.189193, 0.0, -0.087748)
		(1.4248788, 0.0, -0.145055)
		(1.660564, 0.0, -0.20236202)
		(1.660564, 0.0, -0.20236202)
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
		0.171043
		0.777748
		1.0
	]
}
