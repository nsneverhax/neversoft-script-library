gp_fx_hw_shota_energytrail01 = {
	Pos = (0.18902701, 0.0, -2.0853968)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	Attach
	Align
	AttachObject = musician1
	bone = bone_guitar_body
	EmitRangeDims = (1.0, 0.1, 0.1)
	Emit_Target = (1.0, 0.0, 0.0)
	EnableRotate
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 2.0
	dragcoeff = 0.0
	LifeRange = (0.3, 0.35000002)
	Emit_Rate = 128.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.1
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(0.02, 0.02)
		(0.05, 0.05)
	]
	SpeedRange = (16.0, 19.5)
	turbulence = (0.0, 0.0, 0.0)
	RotVel = (-0.05, 1.0)
	RotVelTimeScale = 1.0
	EmitDelayStart = 0.2
	AlignWithPath
	PathFollowTime = 0.01
	History = 2
	HistoryListCoordinateSpace = World
	Color = -10987265
	LOD_Default
	QuickMaterial = {
		TextureLayout = Layout2x2
		layoutn = 1
		layoutm = 1
		DiffuseTextureEnabled
		DiffuseTexture = ph_sparks_01
		SpecularPower = 0
		Bloom
		AlphaCutoff = 1
		BlendMode = add
		aoshadow = 0.0
		QuadAnimationFPS = 0
		LightGroup = allgroups
		fadeoutnearplane = 0.0
		fadeoutdistance = 0.1
	}
	Knot = [
		(-0.81666, 0.0, -0.0)
		(-0.81666, 0.0, -0.0)
		(-0.7622169, 0.0, -0.0)
		(-0.707773, 0.0, -0.0)
		(-0.65333, 0.0, -0.0)
		(-0.517215, 0.0, -0.0)
		(-0.381101, 0.0, -0.0)
		(-0.24498601, 0.0, -0.0)
		(0.027229998, 0.0, -0.0)
		(0.299446, 0.0, -0.0)
		(0.571662, 0.0, -0.0)
		(0.571662, 0.0, -0.0)
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
	burnpervertex = [
		1.0
		1.0
		1.0
		1.0
	]
	VertexWeight = [
		0.117646
		0.411773
		1.0
	]
}
