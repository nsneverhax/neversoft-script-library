gp_p_momentsmoke_01 = {
	Pos = (-0.104171, 0.0, 3.724189)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	Attach
	EmitRangeDims = (0.1, 0.1, 0.1)
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.05, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	ElevSpread = (90.0, 90.0)
	SweepSpread = (0.0, 360.0)
	dragcoeff = 0.0
	LifeRange = (4.0, 5.0)
	Emit_Rate = 10.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 5.0
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(1.0, 1.0)
		(2.0, 2.0)
	]
	SpeedRange = (0.3, 0.4)
	RotVel = (0.3, -0.3)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.0
	PathFollowTime = 0.0
	History = 2
	HistoryListCoordinateSpace = World
	Color = -741092541
	LOD_Default
	QuickMaterial = {
		layoutn = 1
		layoutm = 1
		DiffuseTextureEnabled
		DiffuseTexture = ph_smoke_singlepuff_blend_02
		SpecularPower = 0
		AlphaCutoff = 1
		BlendMode = blend
		SoftEdge
		SoftedgeScale = 0.3
		QuadAnimationFPS = 0
		LightGroup = allgroups
		fadeoutnearplane = 1.0
		fadeoutdistance = 1.0
	}
	Knot = [
		(-1.0522509, 0.0, -0.009974)
		(-1.0522509, 0.0, -0.009974)
		(-0.90264195, 0.0, -0.0066489996)
		(-0.753033, 0.0, -0.003325)
		(-0.6034241, 0.0, -0.0)
		(-0.24103701, 0.0, -0.0)
		(0.121350005, 0.0, -0.0)
		(0.483736, 0.0, -0.0)
		(0.713137, 0.0, 0.003324)
		(0.94253796, 0.0, 0.0066489996)
		(1.1719391, 0.0, 0.009974)
		(1.1719391, 0.0, 0.009974)
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
		0.0
		0.0
		0.0
		0.0
	]
	VertexWeight = [
		0.201827
		0.690576
		1.0
	]
}
