gp_fx_encore_dragon_glow_01 = {
	Pos = (-5.3915925, 4.6135774, 37.759842)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	EmitRangeDims = (0.1, 0.1, 0.1)
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 2.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 45.0
	LifeRange = (2.0, 2.0)
	Emit_Rate = 1.0
	Max = 1
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 1
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(8.0, 40.0)
		(12.0, 30.0)
	]
	SpeedRange = (0.1, 0.2)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.0
	PathFollowTime = 0.0
	History = 2
	HistoryListCoordinateSpace = World
	Color = -6012195
	LOD_Default
	QuickMaterial = {
		DiffuseTextureEnabled
		DiffuseTexture = ph_radialglow_01
		SpecularPower = 0
		fillburst
		AlphaCutoff = 1
		BlendMode = add
		SoftEdge
		SoftedgeScale = 0.5
		Burn
		BurnValue = 0.8
		QuadAnimationFPS = 0
	}
	Knot = [
		(-0.734559, 0.0, -0.0)
		(-0.734559, 0.0, -0.0)
		(-0.64737904, 0.0, -0.0)
		(-0.560199, 0.0, -0.0)
		(-0.473019, 0.0, -0.0)
		(-0.207393, 0.0, -0.0)
		(0.058234002, 0.0, -0.0)
		(0.32386002, 0.0, -0.0)
		(0.510479, 0.0, -0.0)
		(0.69709903, 0.0, -0.0)
		(0.883718, 0.0, -0.0)
		(0.883718, 0.0, -0.0)
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
	VertexWeight = [
		0.161616
		0.65404105
		1.0
	]
}
