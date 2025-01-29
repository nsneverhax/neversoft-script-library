gp_fx_breakingglass_01 = {
	Pos = (0.171928, 4.666142, -5.401782)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	EmitRangeDims = (0.5, 0.5, 0.1)
	DoCircularEmit
	Emit_Target = (0.0, 0.3, 1.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, -10.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	Radiate
	AngleSpread = 200.0
	LifeRange = (1.0, 1.5)
	Emit_Rate = 200.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 0
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(0.5, 0.5)
		(0.5, 0.5)
	]
	SpeedRange = (3.0, 12.0)
	RotVel = (1.0, 1.0)
	RotVelTimeScale = 1.0
	EmitDelayStart = 0.0
	PathFollowTime = 0.0
	History = 2
	HistoryListCoordinateSpace = World
	align_to = (1.0, 0.0, 0.0)
	Rotate3D
	Color = -437918222
	LOD_Default
	QuickMaterial = {
		TextureLayout = Layout2x2
		DiffuseTextureEnabled
		DiffuseTexture = ph_glass
		SpecularPower = 0
		TwoSide
		Bloom
		AlphaCutoff = 1
		BlendMode = blend
		QuadAnimationFPS = 0
	}
	Knot = [
		(-0.40105, 0.0, -0.0)
		(-0.40105, 0.0, -0.0)
		(-0.20087801, 0.0, -0.0)
		(-0.00070699997, 0.0, -0.0)
		(0.19946502, 0.0, -0.0)
		(0.222244, 0.0, -0.0)
		(0.245023, 0.0, -0.0)
		(0.267802, 0.0, -0.0)
		(0.32441106, 0.0, -0.0)
		(0.38101903, 0.0, -0.0)
		(0.437628, 0.0, -0.0)
		(0.437628, 0.0, -0.0)
	]
	ParticleColor = [
		1887109014
		-12426692
		1887109014
		-12426692
		286402454
		520621116
		286402454
		520621116
	]
	VertexWeight = [
		0.716026
		0.797508
		1.0
	]
}
