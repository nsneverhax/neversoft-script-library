gp_fx_waterfallsplashesbottom_smoke_01 = {
	Pos = (-5.653916, -0.33725703, -1.0923821)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	EmitRangeDims = (2.0, 0.2, 0.1)
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, -8.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 45.0
	dragcoeff = 0.0
	LifeRange = (1.0, 1.5)
	Emit_Rate = 4.0
	Max = 4
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(3.0, 3.0)
		(5.0, 5.0)
	]
	SpeedRange = (1.5, 3.0)
	turbulence = (0.0, 0.0, 0.0)
	RotVel = (0.4, -0.4)
	RotVelTimeScale = 0.6
	EmitDelayStart = 0.0
	PathFollowTime = 0.3
	History = 2
	HistoryListCoordinateSpace = World
	Color = -1531657896
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
		SoftedgeScale = 0.8
		aoshadow = 0.0
		QuadAnimationFPS = 0
		LightGroup = allgroups
		fadeoutnearplane = 0.0
		fadeoutdistance = 0.1
	}
	Knot = [
		(-0.296936, 0.0, -0.81164896)
		(-0.296936, 0.0, -0.81164896)
		(-0.22074299, 0.0, -0.590824)
		(-0.14454798, 0.0, -0.36999902)
		(-0.068353, 0.0, -0.14917502)
		(0.0047280006, 0.0, 0.026934998)
		(0.077809, 0.0, 0.20304601)
		(0.150891, 0.0, 0.379156)
		(0.19937201, 0.0, 0.53008294)
		(0.247852, 0.0, 0.681011)
		(0.296332, 0.0, 0.8319379)
		(0.296332, 0.0, 0.8319379)
	]
	ParticleColor = [
		1128547328
		-256
		-655892540
		-1
		-655892630
		-1
		1128547328
		-256
	]
	burnpervertex = [
		1.0
		1.0
		1.0
		1.0
	]
	VertexWeight = [
		0.40082702
		0.727995
		1.0
	]
}
