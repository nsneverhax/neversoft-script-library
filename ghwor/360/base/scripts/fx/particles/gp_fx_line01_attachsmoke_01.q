gp_fx_line01_attachsmoke_01 = {
	Pos = (-14.528249, 14.373307, -10.753295)
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
	AngleSpread = 60.0
	dragcoeff = 0.0
	LifeRange = (1.0, 1.5)
	Emit_Rate = 10.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 1.5
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(2.0, 2.0)
		(7.0, 7.0)
	]
	SpeedRange = (0.5, 1.0)
	turbulence = (0.0, 0.0, 0.0)
	RotVel = (0.5, -0.5)
	RotVelTimeScale = 0.5
	EmitDelayStart = 0.0
	PathFollowTime = 4.0
	History = 3
	HistoryListCoordinateSpace = World
	Color = -1245277096
	LOD_Default
	QuickMaterial = {
		layoutn = 1
		layoutm = 1
		DiffuseTextureEnabled
		DiffuseTexture = ph_smoke_singlepuff_blend_02
		SpecularPower = 0
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
		-1
		-1
		-1701143809
		1852731135
		-1701144064
		1852730880
	]
	burnpervertex = [
		0.0
		0.0
		1.0
		1.0
	]
	VertexWeight = [
		0.246799
		0.57342905
		1.0
	]
}
