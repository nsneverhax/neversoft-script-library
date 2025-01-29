gp_fx_electricity_finger_sparks_01 = {
	Pos = (2.8404381, 0.0, 0.715449)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	Attach
	AttachObject = GUITARIST
	bone = Bone_Hand_Index_Mid_R
	EmitRangeDims = (0.005, 0.0, 0.005)
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, -1.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 100.0
	dragcoeff = 0.0
	LifeRange = (0.2, 1.0)
	Emit_Rate = 20.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = onoff
	EmitPeriod = 1.0
	SizeRange = [
		(0.003, 0.003)
		(0.0, 0.0)
	]
	SpeedRange = (0.5, 1.0)
	turbulence = (0.0, 0.0, 0.0)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.0
	PathFollowTime = 0.0
	History = 4
	HistoryListCoordinateSpace = object
	Color = -1711308033
	LOD_Default
	QuickMaterial = {
		layoutn = 1
		layoutm = 1
		DiffuseTextureEnabled
		DiffuseTexture = JOW_Spark01
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
		(-0.662229, 0.0, 0.041456997)
		(-0.662229, 0.0, 0.041456997)
		(-0.563254, 0.0, 0.043952998)
		(-0.46428, 0.0, 0.046449)
		(-0.365305, 0.0, 0.048945)
		(-0.113479994, 0.0, 0.018586999)
		(0.138346, 0.0, -0.011771)
		(0.39017102, 0.0, -0.04213)
		(0.47256798, 0.0, -0.044177)
		(0.55496603, 0.0, -0.046225)
		(0.637363, 0.0, -0.048272)
		(0.637363, 0.0, -0.048272)
	]
	ParticleColor = [
		-1
		-1
		-1
		-1
		-1
		-1
		-1
		-1
	]
	burnpervertex = [
		1.0
		1.0
		1.0
		1.0
	]
	VertexWeight = [
		0.22756
		0.81055605
		1.0
	]
}
