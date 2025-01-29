ISOLATE_2D_RENDER = 0
pix_output = 0
gp_explosion_energy01_sparks02 = {
	Pos = (4.10814, 0.0, 8.215465)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	Attach
	EmitRangeDims = (0.5, 0.5, 0.5)
	DoCircularEmit
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 360.0
	LifeRange = (0.1, 0.3)
	Emit_Rate = 100.0
	Max = 0
	TimeSeed = 0.1
	LifeTime = 0.0
	EmitNum = 8
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(2.0, 2.0)
		(3.0, 3.0)
	]
	SpeedRange = (10.0, 12.0)
	RotVel = (-0.2, 0.2)
	RotVelTimeScale = 1.0
	EmitDelayStart = 0.0
	PathFollowTime = 0.0
	History = 2
	HistoryListCoordinateSpace = World
	Color = -7996417
	LOD_Default
	QuickMaterial = {
		TextureLayout = layout1x2
		DiffuseTextureEnabled
		DiffuseTexture = jow_splatter01
		SpecularPower = 0
		AlphaCutoff = 1
		BlendMode = add
		QuadAnimationFPS = 0
	}
	Knot = [
		(-1.722729, 0.0, -0.0)
		(-1.722729, 0.0, -0.0)
		(-1.16097, 0.0, -0.0)
		(-1.089128, 0.0, -0.0)
		(-0.52737, 0.0, -0.0)
		(0.071839005, 0.0, -0.0)
		(1.1609659, 0.0, -0.0)
		(1.760176, 0.0, -0.0)
		(1.760176, 0.0, -0.0)
	]
	ParticleColor = [
		-1
		-1
		-1
		-1
		-256
		-256
	]
	VertexWeight = [
		0.343208
		1.0
	]
}
gp_pwr_earth_long_projectile_out_explosion02 = {
	Pos = (4.9795074, 0.0, 9.2645035)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	Attach
	EmitRangeDims = (3.0, 0.0, 3.0)
	DoCircularEmit
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.5, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	Radiate
	ElevSpread = (110.0, 140.0)
	SweepSpread = (0.0, 360.0)
	LifeRange = (0.6, 1.0)
	Emit_Rate = 0.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 32
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(2.0, 2.0)
		(4.0, 4.0)
	]
	SpeedRange = (1.0, 1.5)
	RotVel = (-0.2, 0.2)
	RotVelTimeScale = 1.0
	EmitDelayStart = 0.0
	PathFollowTime = 2.0
	History = 20
	HistoryListCoordinateSpace = World
	Color = -1891753436
	LOD_Default
	QuickMaterial = {
		DiffuseTextureEnabled
		DiffuseTexture = jow_explosion01
		SpecularPower = 0
		AlphaCutoff = 12
		BlendMode = add
		SortGroup = 3
		DrawOrder = 12.0
		QuadAnimationFPS = 0
	}
	Knot = [
		(-1.722729, 0.0, -0.0)
		(-1.722729, 0.0, -0.0)
		(-1.16097, 0.0, -0.0)
		(-0.886428, 0.0, -0.0)
		(-0.32467005, 0.0, -0.0)
		(0.27454, 0.0, -0.0)
		(1.1609659, 0.0, -0.0)
		(1.760176, 0.0, -0.0)
		(1.760176, 0.0, -0.0)
	]
	ParticleColor = [
		-1044266497
		-303174145
		-1212696577
		-1
		-1027423744
		-256
	]
	VertexWeight = [
		0.401406
		1.0
	]
}
