GP_FX_TrainSmoke_02 = {
	Pos = (0.0, -1.5, 0.0)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	type = flat
	active
	CreatedAtStart
	attach
	ApplyPositionOffset
	EmitRangeDims = (1.0, 0.2, 0.1)
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.3, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 120.0
	LifeRange = (1.0, 3.0)
	Emit_Rate = 30.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 7.0
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(3.0, 3.0)
		(5.0, 5.0)
	]
	SpeedRange = (1.0, 2.0)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.0
	PathFollowTime = 0.0
	History = 2
	HistoryListCoordinateSpace = World
	Color = 2037274931
	LOD_Default
	QuickMaterial = {
		DiffuseTextureEnabled
		DiffuseTexture = PH_Smoke_SinglePuff_Blend_02
		SpecularPower = 0
		AlphaCutoff = 1
		BlendMode = blend
		SoftEdge
		SoftedgeScale = 0.5
		Burn
		BurnValue = 0.4
		QuadAnimationFPS = 0
	}
	Knot = [
		(-0.941619, 0.0, -0.0)
		(-0.941619, 0.0, -0.0)
		(-0.812029, 0.0, -0.0)
		(-0.68243796, 0.0, -0.0)
		(-0.552848, 0.0, -0.0)
		(-0.38448003, 0.0, -0.0)
		(-0.216112, 0.0, -0.0)
		(-0.047744, 0.0, -0.0)
		(0.26741302, 0.0, -0.0)
		(0.582569, 0.0, -0.0)
		(0.89772505, 0.0, -0.0)
		(0.89772505, 0.0, -0.0)
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
		0.21136402
		0.48597503
		1.0
	]
}
