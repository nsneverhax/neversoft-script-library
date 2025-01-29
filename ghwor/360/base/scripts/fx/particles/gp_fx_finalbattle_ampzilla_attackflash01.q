gp_fx_finalbattle_ampzilla_attackflash01 = {
	Pos = (4.0, 0.0, 0.081453)
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
	EmitRangeDims = (0.5, 0.5, 0.5)
	Emit_Target = (1.0, 0.0, 0.0)
	EnableRotate
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 0.0
	dragcoeff = 0.0
	LifeRange = (0.2, 0.2)
	Emit_Rate = 4.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 2
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(24.0, 24.0)
		(48.0, 48.0)
	]
	SpeedRange = (0.0, 0.0)
	turbulence = (0.0, 0.0, 0.0)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 1.0
	EmitDelayStart = 0.0
	PathFollowTime = 0.2
	History = 2
	HistoryListCoordinateSpace = World
	Color = 1452212044
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
		(-0.876912, 0.0, -0.0)
		(-0.75538296, 0.0, -0.0)
		(-0.63385403, 0.0, -0.0)
		(-0.38363704, 0.0, -0.0)
		(-0.13342, 0.0, -0.0)
		(0.116797, 0.0, -0.0)
		(0.32213104, 0.0, -0.0)
		(0.52746606, 0.0, -0.0)
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
		0.210593
		0.64418405
		1.0
	]
}
