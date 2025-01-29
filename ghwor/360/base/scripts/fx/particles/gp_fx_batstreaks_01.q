gp_fx_batstreaks_01 = {
	Pos = (-4.0554023, 1.130798, 1.4290069)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	Attach
	Align
	bone = BONE_PELVIS
	EmitRangeDims = (1.0, 0.0, 0.0)
	Emit_Target = (0.0, 1.0, 0.0)
	EnableRotate
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	Radiate
	AngleSpread = 360.0
	dragcoeff = 0.0
	LifeRange = (0.05, 0.3)
	Emit_Rate = 200.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 6.0
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(0.18, 0.18)
		(0.08, 0.08)
	]
	SpeedRange = (1.0, 2.0)
	turbulence = (0.0, 0.0, 0.0)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.0
	AlignWithPath
	PathFollowTime = 5.0
	History = 2
	HistoryListCoordinateSpace = World
	Color = -655228929
	LOD_Default
	QuickMaterial = {
		layoutn = 1
		layoutm = 1
		DiffuseTextureEnabled
		DiffuseTexture = ph_radialglow_01
		SpecularPower = 0
		AlphaCutoff = 1
		BlendMode = blend
		SoftEdge
		SoftedgeScale = 0.5
		SortGroup = 3
		DrawOrder = 10.0
		aoshadow = 0.0
		QuadAnimationFPS = 0
		LightGroup = allgroups
		fadeoutnearplane = 0.0
		fadeoutdistance = 0.1
	}
	Knot = [
		(0.615723, 0.0, -0.0008539999)
		(0.615723, 0.0, -0.0008539999)
		(0.52575696, 0.0, 0.0028080002)
		(0.43579102, 0.0, 0.00647)
		(0.34582502, 0.0, 0.010131999)
		(0.116659, 0.0, 0.0067140004)
		(-0.112508, 0.0, 0.003296)
		(-0.341675, 0.0, -0.000122)
		(-0.434408, 0.0, -0.003133)
		(-0.52714, 0.0, -0.0061439998)
		(-0.619873, 0.0, -0.009155)
		(-0.619873, 0.0, -0.009155)
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
		0.218537
		0.77481
		1.0
	]
}
