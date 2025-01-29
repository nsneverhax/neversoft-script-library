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
	LifeRange = (0.8, 1.2)
	Emit_Rate = 3.0
	emitterindependent = 1
	Max = 2
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = onoff
	SizeRange = [
		(0.06, 0.06)
		(0.2, 0.2)
	]
	SpeedRange = (0.1, 0.3)
	RotVel = (1.0, -1.0)
	RotVelTimeScale = 0.5
	EmitDelayStart = 0.0
	PathFollowTime = 0.0
	History = 2
	HistoryListCoordinateSpace = World
	Color = -1143800040
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
