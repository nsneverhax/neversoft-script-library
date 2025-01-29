gp_fx_hw_hita_shouldersmoke01 = {
	Pos = (3.939845, 0.0, -1.757013)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	Attach
	AttachObject = z_finalbattle_trg_geo_ampzilla
	bone = bone_shoulder_twist_l
	EmitRangeDims = (1.0, 1.0, 1.0)
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 1.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 45.0
	dragcoeff = 0.0
	LifeRange = (1.5, 2.0)
	Emit_Rate = 16.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 1.0
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.8
	SizeRange = [
		(3.0, 3.0)
		(8.0, 8.0)
	]
	SpeedRange = (3.0, 3.5)
	turbulence = (0.0, 0.0, 0.0)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.9
	PathFollowTime = 0.0
	History = 2
	HistoryListCoordinateSpace = World
	Color = 1110717695
	LOD_Default
	QuickMaterial = {
		layoutn = 1
		layoutm = 1
		DiffuseTextureEnabled
		DiffuseTexture = ph_smoke_singlepuff_blend_02
		SpecularPower = 0
		AlphaCutoff = 1
		BlendMode = add
		SoftEdge
		SoftedgeScale = 0.5
		Burn
		BurnValue = 1.0
		aoshadow = 0.0
		QuadAnimationFPS = 0
		LightGroup = allgroups
		fadeoutnearplane = 0.0
		fadeoutdistance = 0.1
	}
	Knot = [
		(-0.64545804, 0.0, -0.0)
		(-0.64545804, 0.0, -0.0)
		(-0.577048, 0.0, -0.0)
		(-0.50863796, 0.0, -0.0)
		(-0.440228, 0.0, -0.0)
		(-0.338092, 0.0, -0.0)
		(-0.235956, 0.0, -0.0)
		(-0.13382, 0.0, -0.0)
		(0.088232, 0.0, -0.0)
		(0.310284, 0.0, -0.0)
		(0.53233594, 0.0, -0.0)
		(0.53233594, 0.0, -0.0)
	]
	ParticleColor = [
		-9868801
		-10263553
		-8684545
		-1
		-1
		-841613313
		-924844288
		-1143800064
	]
	burnpervertex = [
		1.0
		0.5
		0.0
		0.0
	]
	VertexWeight = [
		0.17424999
		0.43440402
		1.0
	]
}
