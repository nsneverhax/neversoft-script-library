gp_fx_nm_smoke_01 = {
	pos = (0.0, -0.09501701, -0.0)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	attach
	applypositionoffset
	bone = bone_head
	emitrangedims = (0.05, 0.0, 0.05)
	emit_target = (0.0, 1.0, 0.0)
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, 0.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	anglespread = 45.0
	dragcoeff = 0.2
	liferange = (1.0, 1.2)
	emit_rate = 20.0
	max = 0
	timeseed = 0.0
	lifetime = 0.0
	emitnum = 0
	followemitter = 0.0
	emitfunction = constant
	emitperiod = 1.0
	sizerange = [
		(0.1, 0.1)
		(0.4, 0.4)
	]
	speedrange = (0.3, 0.4)
	turbulence = (0.0, 0.0, 0.0)
	rotvel = (0.5, -0.5)
	rotveltimescale = 0.5
	emitdelaystart = 0.0
	pathfollowtime = 0.6
	history = 2
	historylistcoordinatespace = world
	color = 1234126190
	lod_default
	quickmaterial = {
		layoutn = 1
		layoutm = 1
		diffusetextureenabled
		diffusetexture = ph_smoke_singlepuff_blend_02
		specularpower = 0
		alphacutoff = 1
		blendmode = blend
		softedge
		softedgescale = 0.1
		burn
		burnvalue = 0.7
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
		(-0.716501, 0.0, 0.010775999)
		(-0.716501, 0.0, 0.010775999)
		(-0.686745, 0.0, 0.012251999)
		(-0.716192, 0.0, 0.013727999)
		(-0.686436, 0.0, 0.015202999)
		(-0.317392, 0.0, 0.011938)
		(-0.40782002, 0.0, 0.008673)
		(-0.038776, 0.0, 0.0054079997)
		(0.038660996, 0.0, -0.006857)
		(0.63477397, 0.0, -0.019120999)
		(0.71221095, 0.0, -0.031386003)
		(0.71221095, 0.0, -0.031386003)
	]
	particlecolor = [
		-256
		-256
		-1
		-1
		-115
		-75
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
		0.02173
		0.474424
		1.0
	]
}
