gp_fx_intro03_dg_armdust01 = {
	Pos = (1.0, 0.0, -0.0)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	Attach
	Align
	ApplyPositionOffset
	AttachObject = GUITARIST
	bone = Bone_Forearm_L
	EmitRangeDims = (2.0, 0.2, 0.2)
	Emit_Target = (0.0, 1.0, 0.0)
	EnableRotate
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 2.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 360.0
	selectedwind = violentwind01
	dragcoeff = 2.0
	LifeRange = (1.0, 1.5)
	Emit_Rate = 48.0
	Max = 0
	TimeSeed = 0.3
	LifeTime = 0.8
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(2.0, 2.0)
		(6.0, 6.0)
	]
	SpeedRange = (2.0, 8.0)
	turbulence = (0.0, 0.0, 0.0)
	RotVel = (-0.15, -0.05)
	RotVelTimeScale = 1.0
	EmitDelayStart = 0.0
	PathFollowTime = 0.0
	History = 2
	HistoryListCoordinateSpace = World
	Color = -180
	LOD_Default
	QuickMaterial = {
		layoutn = 1
		layoutm = 1
		DiffuseTextureEnabled
		DiffuseTexture = ph_smoke_singlepuff_blend_02
		SpecularPower = 0
		AlphaCutoff = 1
		BlendMode = blend
		aoshadow = 0.0
		QuadAnimationFPS = 0
		LightGroup = allgroups
		fadeoutnearplane = 0.0
		fadeoutdistance = 0.1
	}
	Knot = [
		(-3.315181, 0.0, -0.0)
		(-3.315181, 0.0, -0.0)
		(-2.885353, 0.0, -0.0)
		(-2.4555252, 0.0, -0.0)
		(-2.025697, 0.0, -0.0)
		(-0.839168, 0.0, -0.0)
		(0.347361, 0.0, -0.0)
		(1.53389, 0.0, -0.0)
		(2.16064, 0.0, -0.0)
		(2.7873907, 0.0, -0.0)
		(3.414142, 0.0, -0.0)
		(3.414142, 0.0, -0.0)
	]
	ParticleColor = [
		-7179264
		-11257088
		-7179009
		-7179009
		1952549631
		-1789573889
		1010388224
		1060916480
	]
	burnpervertex = [
		1.0
		1.0
		1.0
		1.0
	]
	VertexWeight = [
		0.19162199
		0.72058797
		1.0
	]
}
