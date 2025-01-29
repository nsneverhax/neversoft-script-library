gp_fx_flashpot_glow_01 = {
	Pos = (-0.438454, 0.127141, 9.548815)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	EmitRangeDims = (0.01, 0.1, 0.01)
	Emit_Target = (0.0, 1.0, 0.0)
	EnableRotate
	EmitAngle = (0.0, -1.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 0.0
	LifeRange = (1.0, 1.0)
	Emit_Rate = 1.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 1
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(3.0, 15.0)
		(5.0, 16.0)
	]
	SpeedRange = (3.5, 3.5)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.0
	PathFollowTime = 0.0
	History = 2
	HistoryListCoordinateSpace = World
	Color = -1120257
	LOD_Default
	QuickMaterial = {
		DiffuseTextureEnabled
		DiffuseTexture = ph_radialglow_01
		SpecularPower = 0
		fillburst
		AlphaCutoff = 1
		BlendMode = add
		SoftEdge
		SoftedgeScale = 0.1
		QuadAnimationFPS = 0
	}
	Knot = [
		(-0.371477, 0.0, -0.0)
		(-0.371477, 0.0, -0.0)
		(-0.155889, 0.0, -0.0)
		(0.059699, 0.0, -0.0)
		(0.275287, 0.0, -0.0)
		(0.347012, 0.0, -0.0)
		(0.418737, 0.0, -0.0)
		(0.490462, 0.0, -0.0)
		(0.490462, 0.0, -0.0)
	]
	ParticleColor = [
		-78
		-78
		-1
		-1
		-256
		-256
	]
	VertexWeight = [
		0.750359
		1.0
	]
}
