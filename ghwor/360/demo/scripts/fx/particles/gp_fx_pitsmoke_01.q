gp_fx_pitsmoke_01 = {
	pos = (-7.393763, 0.284084, 3.048234)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	bone = bone_head
	emitrangedims = (0.3, 0.2, 0.3)
	emit_target = (0.0, 1.0, 0.0)
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, 0.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.15
	perparticlewind
	emittervelocityweight = 0.0
	anglespread = 20.0
	selectedwind = pitwind01
	dragcoeff = 0.01
	liferange = (1.5, 1.7)
	emit_rate = 5.0
	max = 0
	timeseed = 0.0
	lifetime = 0.0
	emitnum = 0
	followemitter = 0.0
	emitfunction = constant
	emitperiod = 1.0
	sizerange = [
		(2.6, 2.6)
		(2.0, 2.0)
	]
	speedrange = (2.0, 2.3)
	turbulence = (0.0, 0.0, 0.0)
	rotvel = (0.1, -0.1)
	rotveltimescale = 0.5
	emitdelaystart = 0.0
	pathfollowtime = 0.0
	history = 2
	historylistcoordinatespace = world
	color = -1298089585
	lod_default
	material = sys_particlefire01_sys_particlefire01
	quickmaterial = {
		layoutn = 1
		layoutm = 1
		diffusetextureenabled
		diffusetexture = ph_smoke_singlepuff_blend_02
		specularpower = 0
		alphacutoff = 1
		blendmode = blend
		softedge
		softedgescale = 0.5
		aoshadow = 0.0
		quadanimationfps = 0
		lightgroup = allgroups
		fadeoutnearplane = 3.0
		fadeoutdistance = 2.0
	}
	knot = [
		(-0.92489696, 0.0, -0.043892995)
		(-0.92489696, 0.0, -0.043892995)
		(-0.79948795, 0.0, -0.039713)
		(-0.920416, 0.0, -0.035533)
		(-0.795006, 0.0, -0.031353)
		(-0.439678, 0.0, -0.00209)
		(0.161988, 0.0, 0.027172)
		(0.51731503, 0.0, 0.056435)
		(0.663627, 0.0, 0.043893997)
		(0.80993795, 0.0, 0.031353)
		(0.95624995, 0.0, 0.018812)
		(0.95624995, 0.0, 0.018812)
	]
	particlecolor = [
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
	vertexweight = [
		0.069798
		0.76660794
		1.0
	]
}
