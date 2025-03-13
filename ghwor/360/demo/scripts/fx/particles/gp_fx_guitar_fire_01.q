gp_fx_guitar_fire_01 = {
	pos = (0.0, -0.70537895, 0.022705)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	attach
	bone = bone_demi
	emitrangedims = (0.3, 0.3, 0.3)
	emit_target = (0.0, 1.0, 0.0)
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, 0.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	radiate
	anglespread = 360.0
	selectedwind = guitartest
	dragcoeff = 1.0
	liferange = (0.5, 0.7)
	emit_rate = 30.0
	max = 0
	timeseed = 0.0
	lifetime = 4.0
	emitnum = 0
	followemitter = 0.0
	emitfunction = constant
	emitperiod = 1.0
	sizerange = [
		(1.2, 1.2)
		(0.6, 0.6)
	]
	speedrange = (0.3, 0.4)
	turbulence = (1.0, 1.0, 1.0)
	rotvel = (0.6, -0.6)
	rotveltimescale = 1.0
	emitdelaystart = 0.0
	pathfollowtime = 1.0
	history = 2
	historylistcoordinatespace = world
	color = -1033147537
	lod_default
	quickmaterial = {
		texturelayout = layout2x2
		layoutn = 1
		layoutm = 1
		diffusetextureenabled
		diffusetexture = ph_fire_quad_01
		specularpower = 0
		bloom
		alphacutoff = 1
		blendmode = add
		softedge
		softedgescale = 1.0
		aoshadow = 0.0
		quadanimationfps = 0
		lightgroup = allgroups
		viewports = [
			all
		]
		fadeoutnearplane = 0.0
		fadeoutdistance = 0.1
	}
	knot = [
		(-0.41790798, 0.0, -0.016478999)
		(-0.41790798, 0.0, -0.016478999)
		(-0.35139, 0.0, -0.016478999)
		(-0.28487104, 0.0, -0.016478999)
		(-0.218353, 0.0, -0.016478999)
		(-0.081608005, 0.0, -0.0015220001)
		(0.055136003, 0.0, 0.013435999)
		(0.191881, 0.0, 0.028393997)
		(0.276338, 0.0, 0.030444998)
		(0.36079502, 0.0, 0.032494996)
		(0.44525102, 0.0, 0.034546)
		(0.44525102, 0.0, 0.034546)
	]
	particlecolor = [
		-256
		-256
		-1
		-1
		-101
		-108
		-16777216
		1476395008
	]
	burnpervertex = [
		1.0
		1.0
		1.0
		1.0
	]
	vertexweight = [
		0.230518
		0.707231
		1.0
	]
}
