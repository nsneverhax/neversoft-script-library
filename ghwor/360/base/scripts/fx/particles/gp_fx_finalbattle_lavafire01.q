gp_fx_finalbattle_lavafire01 = {
	Pos = (11.088223, -0.269531, 16.467833)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	EmitRangeDims = (0.5, 0.5, 0.5)
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, -2.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 45.0
	dragcoeff = 1.0
	LifeRange = (1.0, 1.5)
	Emit_Rate = 64.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.1
	EmitNum = 0
	FollowEmitter = 3.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(1.0, 2.0)
		(3.0, 6.0)
	]
	SpeedRange = (1.0, 4.0)
	turbulence = (1.0, 3.0, -3.0)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.0
	PathFollowTime = 0.2
	History = 2
	HistoryListCoordinateSpace = World
	Color = -9893377
	LOD_Default
	QuickMaterial = {
		TextureLayout = Layout2x2
		layoutn = 1
		layoutm = 1
		DiffuseTextureEnabled
		DiffuseTexture = jow_lava_quad_01
		SpecularPower = 0
		AlphaCutoff = 1
		BlendMode = add
		SoftEdge
		SoftedgeScale = 0.2
		Burn
		BurnValue = 0.6
		aoshadow = 0.0
		QuadAnimationFPS = 0
		LightGroup = allgroups
		fadeoutnearplane = 0.0
		fadeoutdistance = 0.1
	}
	Knot = [
		(-0.704706, 0.0, -0.0)
		(-0.704706, 0.0, -0.0)
		(-0.433666, 0.0, -0.0)
		(-0.162625, 0.0, -0.0)
		(0.108416, 0.0, -0.0)
		(0.27104, 0.0, -0.0)
		(0.433664, 0.0, -0.0)
		(0.5962889, 0.0, -0.0)
		(0.5962889, 0.0, -0.0)
	]
	ParticleColor = [
		-1
		-1
		-1
		-1
		-1825821696
		-1423365888
	]
	burnpervertex = [
		1.0
		1.0
		1.0
	]
	VertexWeight = [
		0.625
		1.0
	]
}
