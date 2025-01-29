gp_fx_spit_01 = {
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
	AttachObject = vocalist
	bone = Bone_Tongue
	EmitRangeDims = (0.0, 0.0, 0.0)
	Emit_Target = (0.0, 1.0, 0.0)
	EnableRotate
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, -5.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	Radiate
	AngleSpread = 30.0
	LifeRange = (0.3, 0.6)
	Emit_Rate = 200.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.3
	EmitNum = 0
	FollowEmitter = 0.0
	FillPath
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(0.01, 0.01)
		(0.01, 0.01)
	]
	SpeedRange = (0.5, 4.0)
	RotVel = (0.5, -0.5)
	RotVelTimeScale = 0.5
	EmitDelayStart = 0.0
	PathFollowTime = 0.0
	History = 3
	HistoryListCoordinateSpace = object
	Color = -170
	LOD_Default
	QuickMaterial = {
		DiffuseTextureEnabled
		DiffuseTexture = JOW_Spark01
		SpecularPower = 0
		AlphaCutoff = 1
		BlendMode = add
		QuadAnimationFPS = 0
	}
	Knot = [
		(-13.43569, 0.0, 0.029422998)
		(-13.43569, 0.0, 0.029422998)
		(-12.927258, 0.0, 0.016345998)
		(-12.418823, 0.0, 0.003269)
		(-11.910389, 0.0, -0.009807999)
		(-8.93138, 0.0, -0.009807999)
		(-5.952371, 0.0, -0.009807999)
		(-2.973362, 0.0, -0.009807999)
		(2.9005432, 0.0, -0.009807999)
		(8.774445, 0.0, -0.009807999)
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
