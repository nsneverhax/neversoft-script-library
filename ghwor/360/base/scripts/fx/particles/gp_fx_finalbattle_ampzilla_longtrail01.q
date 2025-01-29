gp_fx_finalbattle_ampzilla_longtrail01 = {
	Pos = (-5.0, 0.0, -0.0)
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
	Radiate
	AngleSpread = 0.0
	dragcoeff = 0.0
	LifeRange = (0.4, 0.4)
	Emit_Rate = 24.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 3.5
	EmitNum = 0
	FollowEmitter = 1.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(1.0, 1.0)
		(1.0, 1.0)
	]
	SpeedRange = (90.0, 90.0)
	turbulence = (0.0, 0.0, 0.0)
	RotVel = (-5.0, 5.0)
	RotVelTimeScale = 1.0
	EmitDelayStart = 0.0
	AlignWithPath
	PathFollowTime = 0.2
	History = 2
	HistoryListCoordinateSpace = World
	align_to = (0.0, 0.0, 0.0)
	Color = 1452212223
	LOD_Default
	QuickMaterial = {
		layoutn = 1
		layoutm = 1
		DiffuseTextureEnabled
		DiffuseTexture = ph_electricity_01
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
		(-0.998441, 0.0, -0.0)
		(-0.998441, 0.0, -0.0)
		(-0.57708, 0.0, -0.0)
		(-0.15572, 0.0, -0.0)
		(0.26564, 0.0, -0.0)
		(0.42136, 0.0, -0.0)
		(0.57708, 0.0, -0.0)
		(0.73279995, 0.0, -0.0)
		(0.73279995, 0.0, -0.0)
	]
	ParticleColor = [
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
	]
	VertexWeight = [
		0.730159
		1.0
	]
}
