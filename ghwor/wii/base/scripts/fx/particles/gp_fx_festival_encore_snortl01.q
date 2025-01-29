gp_fx_festival_encore_snortl01 = {
	Pos = (0.04, 0.15, -0.01)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	Attach
	Align
	ApplyPositionOffset
	AttachObject = power_rocker
	bone = bone_head
	EmitRangeDims = (0.0, 0.0, 0.0)
	Emit_Target = (0.0, 1.0, 0.3)
	EnableRotate
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 1.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 5.0
	dragcoeff = 3.0
	LifeRange = (0.8, 1.0)
	Emit_Rate = 64.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.4
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = invsawtooth
	EmitPeriod = 0.5
	SizeRange = [
		(0.0, 0.0)
		(0.3, 0.3)
	]
	SpeedRange = (0.8, 1.0)
	turbulence = (1.0, 3.0, -3.0)
	RotVel = (-0.15, -0.05)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.0
	PathFollowTime = 0.0
	History = 2
	HistoryListCoordinateSpace = World
	Color = -13421773
	LOD_Default
	QuickMaterial = {
		layoutn = 1
		layoutm = 1
		DiffuseTextureEnabled
		DiffuseTexture = ph_smoke_singlepuff_03_red
		SpecularPower = 0
		Lighting
		AlphaCutoff = 1
		BlendMode = blend
		SoftEdge
		SoftedgeScale = 0.2
		Burn
		BurnValue = 0.5
		aoshadow = 0.0
		QuadAnimationFPS = 0
		LightGroup = fx
		fadeoutnearplane = 0.0
		fadeoutdistance = 0.1
	}
	Knot = [
		(-0.41099, 0.0, -0.0)
		(-0.41099, 0.0, -0.0)
		(-0.36025003, 0.0, -0.0)
		(-0.30951104, 0.0, -0.0)
		(-0.258771, 0.0, -0.0)
		(-0.08371999, 0.0, -0.0)
		(0.091331005, 0.0, -0.0)
		(0.26638198, 0.0, -0.0)
		(0.312048, 0.0, -0.0)
		(0.35771304, 0.0, -0.0)
		(0.403379, 0.0, -0.0)
		(0.403379, 0.0, -0.0)
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
		0.18691601
		0.83177596
		1.0
	]
}
