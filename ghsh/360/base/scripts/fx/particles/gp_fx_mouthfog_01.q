gp_fx_mouthfog_01 = {
	Pos = (0.0, 0.0, -0.0)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	Attach
	ApplyPositionOffset
	bone = Bone_Tongue
	EmitRangeDims = (0.0, 0.0, 0.0)
	Emit_Target = (0.0, 0.0, 1.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.05, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 1.0
	LifeRange = (0.4, 0.6)
	Emit_Rate = 20.0
	Max = 2
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = sin
	EmitPeriod = 5.0
	SizeRange = [
		(0.03, 0.03)
		(0.5, 0.5)
	]
	SpeedRange = (0.1, 0.3)
	RotVel = (1.0, -1.0)
	RotVelTimeScale = 0.5
	EmitDelayStart = 0.0
	PathFollowTime = 0.0
	History = 2
	HistoryListCoordinateSpace = World
	Color = -1143800000
	LOD_Default
	QuickMaterial = {
		DiffuseTextureEnabled
		DiffuseTexture = ph_smoke_singlepuff_blend_02
		SpecularPower = 0
		AlphaCutoff = 1
		BlendMode = blend
		SoftEdge
		SoftedgeScale = 1.0
		Burn
		BurnValue = 0.8
		QuadAnimationFPS = 0
	}
	Knot = [
		(-13.435689, 0.0, 0.029422998)
		(-13.435689, 0.0, 0.029422998)
		(-12.927258, 0.0, 0.016345998)
		(-12.418823, 0.0, 0.003269)
		(-11.910389, 0.0, -0.009807999)
		(-8.93138, 0.0, -0.009807999)
		(-8.708487, 0.0, -0.009807999)
		(-5.729477, 0.0, -0.009807999)
		(0.144428, 0.0, -0.009807999)
		(8.774444, 0.0, -0.009807999)
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
		0.27441105
		1.0
	]
}
