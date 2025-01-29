gp_fx_guitlast_streaks_01 = {
	Pos = (0.0, -0.748959, -0.005812)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	Attach
	ApplyPositionOffset
	AttachObject = z_modular_trg_geo_demi
	bone = bone_demi
	EmitRangeDims = (0.1, 0.1, 0.1)
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 360.0
	dragcoeff = 0.0
	LifeRange = (0.2, 0.6)
	Emit_Rate = 20.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(0.6, 0.6)
		(0.1, 0.1)
	]
	SpeedRange = (2.0, 3.0)
	turbulence = (0.0, 0.0, 0.0)
	RotVel = (0.3, -0.3)
	RotVelTimeScale = 0.3
	EmitDelayStart = 0.0
	AlignWithPath
	PathFollowTime = 5.0
	History = 2
	HistoryListCoordinateSpace = World
	Color = -2705409
	LOD_Default
	QuickMaterial = {
		layoutn = 1
		layoutm = 1
		DiffuseTextureEnabled
		DiffuseTexture = ph_radialglow_01
		SpecularPower = 0
		AlphaCutoff = 1
		BlendMode = add
		SoftEdge
		SoftedgeScale = 2.0
		aoshadow = 0.0
		QuadAnimationFPS = 0
		LightGroup = allgroups
		viewports = [
			dre
		]
		fadeoutnearplane = 0.0
		fadeoutdistance = 0.1
	}
	Knot = [
		(-1.8326808, 0.0, 0.023647001)
		(-1.8326808, 0.0, 0.023647001)
		(-1.611971, 0.0, 0.03153)
		(-1.391261, 0.0, 0.039412)
		(-1.170551, 0.0, 0.047294997)
		(-0.37441903, 0.0, 0.023647001)
		(0.421714, 0.0, -0.0)
		(1.217846, 0.0, -0.023647001)
		(1.4070259, 0.0, -0.03153)
		(1.5962061, 0.0, -0.039412)
		(1.7853861, 0.0, -0.047294997)
		(1.7853861, 0.0, -0.047294997)
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
		0.183024
		0.843087
		1.0
	]
}
