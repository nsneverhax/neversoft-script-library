gp_fx_finalbattle_ampzilla_attackglow01 = {
	Pos = (4.0, 0.0, -0.0)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	Attach
	Align
	ApplyPositionOffset
	AttachObject = z_finalbattle_trg_geo_ampzilla
	bone = bone_palm_twist_r
	EmitRangeDims = (2.0, 2.0, 2.0)
	Emit_Target = (1.0, 0.0, 0.0)
	EnableRotate
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 0.0
	dragcoeff = 0.0
	LifeRange = (0.3, 0.3)
	Emit_Rate = 16.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 1.5
	EmitNum = 0
	FollowEmitter = 1.0
	EmitFunction = sawtooth
	EmitPeriod = 1.5
	SizeRange = [
		(1.0, 1.0)
		(2.0, 2.0)
	]
	SpeedRange = (0.0, 0.0)
	turbulence = (0.0, 0.0, 0.0)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 1.0
	EmitDelayStart = 0.0
	PathFollowTime = 0.2
	History = 2
	HistoryListCoordinateSpace = World
	Color = 1452212223
	LOD_Default
	QuickMaterial = {
		layoutn = 1
		layoutm = 1
		DiffuseTextureEnabled
		DiffuseTexture = ph_radialglow_01
		SpecularPower = 0
		AlphaCutoff = 1
		BlendMode = add
		aoshadow = 0.0
		QuadAnimationFPS = 0
		LightGroup = allgroups
		fadeoutnearplane = 0.0
		fadeoutdistance = 0.1
	}
	Knot = [
		(-0.998441, 0.0, -0.0)
		(-0.998441, 0.0, -0.0)
		(-0.838308, 0.0, -0.0)
		(-0.678174, 0.0, -0.0)
		(-0.518041, 0.0, -0.0)
		(-0.20208502, 0.0, -0.0)
		(0.11387099, 0.0, -0.0)
		(0.42982703, 0.0, -0.0)
		(0.530818, 0.0, -0.0)
		(0.631809, 0.0, -0.0)
		(0.73279995, 0.0, -0.0)
		(0.73279995, 0.0, -0.0)
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
		0.277489
		0.82499695
		1.0
	]
}
