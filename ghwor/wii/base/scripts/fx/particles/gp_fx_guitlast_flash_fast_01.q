gp_fx_guitlast_flash_fast_01 = {
	Pos = (0.0, -0.88498497, -0.048079)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	Attach
	ApplyPositionOffset
	AttachObject = z_modular_trg_geo_demi
	bone = bone_demi
	EmitRangeDims = (0.0, 0.0, 0.0)
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 45.0
	dragcoeff = 0.0
	LifeRange = (0.1, 0.2)
	Emit_Rate = 8.0
	Max = 3
	TimeSeed = 0.0
	LifeTime = 0.5
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(5.0, 5.0)
		(30.0, 30.0)
	]
	SpeedRange = (0.0, 0.0)
	turbulence = (0.0, 0.0, 0.0)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.0
	PathFollowTime = 0.0
	History = 2
	HistoryListCoordinateSpace = object
	Color = -496284673
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
		SoftedgeScale = 0.3
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
		(-0.718189, -0.0, -0.0042300005)
		(-0.718189, -0.0, -0.0042300005)
		(-0.598315, -0.0, -0.0042300005)
		(-0.47844, -0.0, -0.0042300005)
		(-0.358566, -0.0, -0.0042300005)
		(-0.138561, -0.0, -0.00141)
		(0.081444, 0.0, 0.001411)
		(0.301449, 0.0, 0.0042310003)
		(0.45940104, 0.0, 0.0042310003)
		(0.617353, 0.0, 0.0042310003)
		(0.775306, 0.0, 0.0042310003)
		(0.775306, 0.0, 0.0042310003)
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
		0.24078502
		0.682731
		1.0
	]
}
