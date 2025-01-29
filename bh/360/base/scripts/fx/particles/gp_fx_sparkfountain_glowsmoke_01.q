GP_FX_SparkFountain_GlowSmoke_01 = {
	Pos = (-6.620094, 0.523148, -2.0906482)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	type = flat
	active
	CreatedAtStart
	EmitRangeDims = (0.0, 0.2, 0.0)
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 70.0
	DragCoeff = 0.0
	LifeRange = (1.0, 2.0)
	Emit_Rate = 10.0
	Max = 0
	TimeSeed = 0.4
	LifeTime = 0.7
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(0.3, 0.3)
		(0.7, 0.7)
	]
	SpeedRange = (0.4, 0.6)
	RotVel = (0.4, -0.4)
	RotVelTimeScale = 0.5
	EmitDelayStart = 0.0
	PathFollowTime = 0.0
	History = 2
	HistoryListCoordinateSpace = World
	Color = -1
	LOD_Default
	QuickMaterial = {
		DiffuseTextureEnabled
		DiffuseTexture = PH_Smoke_SinglePuff_Blend_02
		SpecularPower = 0
		AlphaCutoff = 1
		BlendMode = blend
		SoftEdge
		SoftedgeScale = 1.0
		Burn
		BurnValue = 0.5
		QuadAnimationFPS = 0
		LightGroup = AllGroups
		FadeoutNearPlane = 0.0
		FadeoutDistance = 0.1
	}
	Knot = [
		(-0.412285, 0.0, -0.0)
		(-0.412285, 0.0, -0.0)
		(-0.338781, 0.0, -0.0)
		(-0.303058, 0.0, -0.0)
		(-0.22955298, 0.0, -0.0)
		(-0.12536901, 0.0, -0.0)
		(-0.092346, 0.0, -0.0)
		(0.011837999, 0.0, -0.0)
		(0.109354004, 0.0, -0.0)
		(0.31581402, 0.0, -0.0)
		(0.41333, 0.0, -0.0)
		(0.41333, 0.0, -0.0)
	]
	ParticleColor = [
		-5091329
		-1060353
		-5091329
		-1060353
		-5091329
		-1060353
		806946048
		990513664
	]
	VertexWeight = [
		0.221328
		0.513706
		1.0
	]
}
