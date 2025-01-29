GP_FX_MouthStar_01 = {
	Pos = (-0.022460999, 0.0, 5.00708)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	type = flat
	active
	CreatedAtStart
	attach
	bone = Bone_Tongue
	EmitRangeDims = (0.0, 0.0, 0.0)
	Emit_Target = (1.0, 0.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 0.0
	DragCoeff = 0.0
	LifeRange = (0.5, 0.5)
	Emit_Rate = 2.0
	Max = 1
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 1
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(0.05, 0.05)
		(1.0, 1.0)
	]
	SpeedRange = (2.0, 2.0)
	RotVel = (0.0, 0.0)
	RotVelTimeScale = 0.0
	EmitDelayStart = 0.0
	PathFollowTime = 0.0
	History = 2
	HistoryListCoordinateSpace = World
	Color = -11546369
	LOD_Default
	QuickMaterial = {
		TextureLayout = Layout2x2
		DiffuseTextureEnabled
		DiffuseTexture = PH_StarExplode_01
		SpecularPower = 0
		AlphaCutoff = 1
		BlendMode = add
		QuadAnimationFPS = 8
		LightGroup = AllGroups
		FadeoutNearPlane = 0.0
		FadeoutDistance = 0.1
	}
	Knot = [
		(-4.76451, 0.0, 0.044528)
		(-4.76451, 0.0, 0.044528)
		(-3.873948, 0.0, 0.044528)
		(-2.983385, 0.0, 0.044528)
		(-2.0928218, 0.0, 0.044528)
		(-0.54918003, 0.0, -0.014842999)
		(0.994461, 0.0, -0.074213006)
		(2.5381029, 0.0, -0.133584)
		(3.1318116, 0.0, -0.074213006)
		(3.7255201, 0.0, -0.014842999)
		(4.319229, 0.0, 0.044528)
		(4.319229, 0.0, 0.044528)
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
	VertexWeight = [
		0.29371998
		0.80321
		1.0
	]
	UpdateScript = Emit_Towards_Camera
	params = {
		viewport = bg_viewport
		updateTime = 0.1
	}
}
