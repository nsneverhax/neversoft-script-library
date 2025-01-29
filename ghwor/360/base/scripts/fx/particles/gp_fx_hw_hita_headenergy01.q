gp_fx_hw_hita_headenergy01 = {
	Pos = (0.0, 2.0, -0.0)
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
	bone = bone_head
	EmitRangeDims = (1.0, 1.0, 1.0)
	Emit_Target = (-1.0, -1.0, 0.0)
	EnableRotate
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 2.0
	dragcoeff = 0.0
	LifeRange = (0.2, 0.3)
	Emit_Rate = 64.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.5
	EmitNum = 0
	FollowEmitter = 1.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(4.0, 4.0)
		(8.0, 8.0)
	]
	SpeedRange = (0.0, 0.0)
	turbulence = (0.0, 0.0, 0.0)
	RotVel = (-2.0, 2.0)
	RotVelTimeScale = 1.0
	EmitDelayStart = 0.0
	PathFollowTime = 0.1
	History = 2
	HistoryListCoordinateSpace = World
	align_to = (1.0, 0.0, 0.0)
	Rotate3D
	Color = -13026817
	LOD_Default
	QuickMaterial = {
		layoutn = 1
		layoutm = 1
		DiffuseTextureEnabled
		DiffuseTexture = electriccircle_02
		SpecularPower = 0
		TwoSide
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
		(-0.39812198, 0.0, -0.0)
		(-0.142914, 0.0, -0.0)
		(0.112293005, 0.0, -0.0)
		(0.265416, 0.0, -0.0)
		(0.418539, 0.0, -0.0)
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
		0.66911906
		1.0
	]
}
