GP_ArtDeco_PostEncore_NeckSparks01 = {
	Pos = (0.0, 0.77766997, -0.779315)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	Attach
	Align
	ApplyPositionOffset
	AttachObject = Z_ArtDeco_TRG_Geo_Dragon
	Bone = Bone_Dragon_Neck02
	EmitRangeDims = (0.3, 0.3, 0.3)
	DoCircularEmit
	Emit_Target = (0.0, 1.0, -1.0)
	EnableRotate
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, -7.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 90.0
	BounceHeight = 0.0
	BounceCoeff = 0.2
	BounceCallbackRate = 0.0
	LifeRange = (2.0, 3.0)
	Emit_Rate = 12.0
	MAX = 0
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = onoff
	EmitPeriod = 2.5
	SizeRange = [
		(0.07, 3.0)
		(0.0, 4.0)
	]
	SpeedRange = (3.0, 5.0)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.0
	AlignWithPath
	PathFollowTime = 0.04
	History = 2
	HistoryListCoordinateSpace = World
	Color = -9568001
	LOD_Default
	QuickMaterial = {
		DiffuseTextureEnabled
		DiffuseTexture = JOW_Spark01
		SpecularPower = 0
		AlphaCutoff = 96
		BlendMode = Add
		Burn
		BurnValue = 0.7
		QuadAnimationFPS = 8
	}
	Knot = [
		(-0.48496202, 0.0, -0.0)
		(-0.48496202, 0.0, -0.0)
		(-0.441017, 0.0, -0.0)
		(-0.013056999, 0.0, -0.0)
		(0.414903, 0.0, -0.0)
		(0.710889, 0.0, -0.0)
		(1.006876, 0.0, -0.0)
		(1.051219, 0.0, -0.0)
		(1.051219, 0.0, -0.0)
	]
	ParticleColor = [
		-1
		-1
		-1
		-1
		-1
		-1
	]
	VertexWeight = [
		0.585781
		1.0
	]
}
