gp_fx_line01_attachelectric_01 = {
	Pos = (-14.528249, 14.373307, -10.596434)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	Attach
	AttachObject = z_riothouse_gfx_fx_lineghost_01
	EmitRangeDims = (0.0, 0.0, 0.0)
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 360.0
	dragcoeff = 0.0
	LifeRange = (0.1, 0.3)
	Emit_Rate = 300.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 1.0
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(0.3, 0.3)
		(1.0, 1.5)
	]
	SpeedRange = (0.2, 0.2)
	turbulence = (0.0, 0.0, 0.0)
	RotVel = (2.0, -2.0)
	RotVelTimeScale = 2.0
	EmitDelayStart = 0.0
	PathFollowTime = 4.0
	History = 8
	HistoryListCoordinateSpace = World
	align_to = (1.0, 0.0, 0.0)
	Rotate3D
	Color = -419446785
	LOD_Default
	QuickMaterial = {
		layoutn = 1
		layoutm = 1
		DiffuseTextureEnabled
		DiffuseTexture = electriccircle_02
		SpecularPower = 0
		TwoSide
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
		(-1.6138, 0.0, 0.10919201)
		(-1.6138, 0.0, 0.10919201)
		(-1.3613989, 0.0, 0.088114)
		(-1.108999, 0.0, 0.06703701)
		(-0.856598, 0.0, 0.045959)
		(-0.524241, 0.0, 0.0023400001)
		(-0.191884, 0.0, -0.041279998)
		(0.14047201, 0.0, -0.0849)
		(0.57821697, 0.0, -0.080017)
		(1.0159609, 0.0, -0.07513401)
		(1.453705, 0.0, -0.070251)
		(1.453705, 0.0, -0.070251)
	]
	ParticleColor = [
		-256
		-256
		-256
		-256
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
		0.246799
		0.57342905
		1.0
	]
}
