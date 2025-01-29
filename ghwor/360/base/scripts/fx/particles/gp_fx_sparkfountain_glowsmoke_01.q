gp_fx_sparkfountain_glowsmoke_01 = {
	Pos = (-6.620094, 0.523148, -2.0906482)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	EmitRangeDims = (0.0, 0.2, 0.0)
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 70.0
	dragcoeff = 0.0
	LifeRange = (0.5, 1.3)
	Emit_Rate = 20.0
	Max = 0
	TimeSeed = 10.0
	LifeTime = 0.2
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(0.5, 0.5)
		(0.5, 0.5)
	]
	SpeedRange = (0.3, 0.4)
	RotVel = (0.4, -0.4)
	RotVelTimeScale = 0.5
	EmitDelayStart = 0.0
	PathFollowTime = 0.0
	History = 2
	HistoryListCoordinateSpace = World
	Color = -1
	LOD_Default
	QuickMaterial = {
		TextureLayout = Layout2x2
		DiffuseTextureEnabled
		DiffuseTexture = ph_smoke_singlepuff_blend_02
		SpecularPower = 0
		AlphaCutoff = 1
		BlendMode = blend
		SoftEdge
		SoftedgeScale = 0.5
		Burn
		BurnValue = 0.5
		QuadAnimationFPS = 0
		LightGroup = allgroups
		fadeoutnearplane = 0.0
		fadeoutdistance = 0.1
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
		0.221329
		0.513706
		1.0
	]
}
