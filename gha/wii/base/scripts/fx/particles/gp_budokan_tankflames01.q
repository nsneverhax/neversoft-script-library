GP_Budokan_TankFlames01 = {
	Pos = (-0.2, 0.7, 0.0)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	Attach
	Align
	ApplyPositionOffset
	AttachObject = Z_Budokan_G_RMM_tanks02
	EmitRangeDims = (0.0, 0.0, 0.0)
	Emit_Target = (-5.0, 2.0, 0.0)
	EnableRotate
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (-5.0, 0.8, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 45.0
	LifeRange = (0.5, 1.25)
	Emit_Rate = 24.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 8
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(1.0, 1.25)
		(0.25, 0.5)
	]
	SpeedRange = (1.0, 1.2)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.0
	AlignWithPath
	PathFollowTime = 1.5
	History = 2
	HistoryListCoordinateSpace = World
	Color = -1
	LOD_Distances = (20.0, 30.0)
	NoVisibilityTest
	QuickMaterial = {
		TextureLayout = Layout2x2
		DiffuseTextureEnabled
		DiffuseTexture = JOW_StatueFlames01
		SpecularPower = 0
		AlphaCutoff = 24
		BlendMode = blend
		Burn
		BurnValue = 0.7
		QuadAnimationFPS = 12
	}
	Knot = [
		(-4.8371935, 0.0, -0.0)
		(-4.8371935, 0.0, -0.0)
		(-4.1530046, 0.0, -0.0)
		(-3.4688168, 0.0, -0.0)
		(-2.78463, 0.0, -0.0)
		(-1.26554, 0.0, -0.0)
		(0.253551, 0.0, -0.0)
		(1.7726411, 0.0, -0.0)
		(2.4186692, 0.0, -0.0)
		(3.0646958, 0.0, -0.0)
		(3.7107232, 0.0, -0.0)
		(3.7107232, 0.0, -0.0)
	]
	ParticleColor = [
		-3080192
		-7405568
		-10288897
		-4521729
		-16776961
		-4496385
		-16777216
		-5150208
	]
	VertexWeight = [
		0.240124
		0.773269
		1.0
	]
}
