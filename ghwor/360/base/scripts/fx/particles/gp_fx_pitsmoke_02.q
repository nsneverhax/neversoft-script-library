gp_fx_pitsmoke_02 = {
	Pos = (7.176987, 0.284084, 3.048234)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	bone = bone_head
	EmitRangeDims = (0.1, 0.2, 0.1)
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.2
	PerParticleWind
	EmitterVelocityWeight = 0.0
	AngleSpread = 30.0
	selectedwind = pitwind02
	dragcoeff = 0.01
	LifeRange = (1.5, 1.7)
	Emit_Rate = 8.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(2.6, 2.6)
		(2.0, 2.0)
	]
	SpeedRange = (2.0, 2.3)
	turbulence = (0.0, 0.0, 0.0)
	RotVel = (0.1, -0.1)
	RotVelTimeScale = 0.5
	EmitDelayStart = 0.0
	PathFollowTime = 0.0
	History = 2
	HistoryListCoordinateSpace = World
	Color = -1298089640
	LOD_Default
	material = sys_particlefire01_sys_particlefire01
	QuickMaterial = {
		layoutn = 1
		layoutm = 1
		DiffuseTextureEnabled
		DiffuseTexture = ph_smoke_singlepuff_blend_02
		SpecularPower = 0
		AlphaCutoff = 1
		BlendMode = blend
		SoftEdge
		SoftedgeScale = 0.5
		aoshadow = 0.0
		QuadAnimationFPS = 0
		LightGroup = allgroups
		fadeoutnearplane = 3.0
		fadeoutdistance = 2.0
	}
	Knot = [
		(-0.92489696, 0.0, -0.043892995)
		(-0.92489696, 0.0, -0.043892995)
		(-0.79948795, 0.0, -0.039713)
		(-0.920416, 0.0, -0.035533)
		(-0.795006, 0.0, -0.031353)
		(-0.439678, 0.0, -0.00209)
		(0.161988, 0.0, 0.027172)
		(0.51731503, 0.0, 0.056435)
		(0.663627, 0.0, 0.043893997)
		(0.80993795, 0.0, 0.031353)
		(0.95624995, 0.0, 0.018812)
		(0.95624995, 0.0, 0.018812)
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
		0.069798
		0.76660794
		1.0
	]
}
