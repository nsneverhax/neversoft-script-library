gp_fx_spit_small_01 = {
	Pos = (0.0, 0.0, -0.0)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = textureribbontrail
	Active
	CreatedAtStart
	Attach
	Align
	ApplyPositionOffset
	bone = Bone_Tongue
	EmitRangeDims = (0.0, 0.0, 0.0)
	Emit_Target = (0.0, 1.0, 0.0)
	EnableRotate
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, -2.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	Radiate
	AngleSpread = 75.0
	LifeRange = (0.05, 0.3)
	Emit_Rate = 75.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.15
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(0.007, 0.007)
		(0.005, 0.005)
	]
	SpeedRange = (0.5, 3.0)
	RotVel = (0.5, -0.5)
	RotVelTimeScale = 0.5
	EmitDelayStart = 0.0
	PathFollowTime = 0.005
	History = 1
	HistoryListCoordinateSpace = World
	Color = -875044275
	LOD_Default
	QuickMaterial = {
		DiffuseTextureEnabled
		DiffuseTexture = JOW_Spark01
		SpecularPower = 0
		AlphaCutoff = 1
		BlendMode = blend
		QuadAnimationFPS = 0
	}
	Knot = [
		(-13.435686, 0.0, 0.029422998)
		(-13.435686, 0.0, 0.029422998)
		(-12.927258, 0.0, 0.016345998)
		(-12.418823, 0.0, 0.003269)
		(-11.910389, 0.0, -0.009807999)
		(-8.93138, 0.0, -0.009807999)
		(-5.952371, 0.0, -0.009807999)
		(-2.973362, 0.0, -0.009807999)
		(2.9005432, 0.0, -0.009807999)
		(8.774441, 0.0, -0.009807999)
		(14.6483555, 0.0, -0.009807999)
		(14.6483555, 0.0, -0.009807999)
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
		0.054329004
		0.37254798
		1.0
	]
}
