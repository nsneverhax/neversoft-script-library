gp_fx_nm_glow_01 = {
	pos = (-0.00525, -0.049116, -0.0)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	attach
	applypositionoffset
	bone = bone_head
	emitrangedims = (0.03, 0.0, 0.03)
	emit_target = (0.0, 1.0, 0.0)
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, 0.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	anglespread = 45.0
	dragcoeff = 0.0
	liferange = (1.4, 2.5)
	emit_rate = 10.0
	max = 0
	timeseed = 0.0
	lifetime = 0.0
	emitnum = 0
	followemitter = 0.0
	emitfunction = constant
	emitperiod = 1.0
	sizerange = [
		(0.2, 0.2)
		(0.2, 0.2)
	]
	speedrange = (0.02, 0.03)
	turbulence = (0.0, 0.0, 0.0)
	rotvel = (0.3, -0.3)
	rotveltimescale = 0.3
	emitdelaystart = 0.0
	pathfollowtime = 10.0
	history = 2
	historylistcoordinatespace = object
	color = 1837843304
	lod_default
	quickmaterial = {
		layoutn = 1
		layoutm = 1
		diffusetextureenabled
		diffusetexture = ph_radialglow_01
		specularpower = 0
		bloom
		fillburst
		alphacutoff = 1
		blendmode = add
		softedge
		softedgescale = 0.01
		burn
		burnvalue = 1.0
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
		(-0.65999, 0.0, 0.012251999)
		(-0.60348004, 0.0, 0.013727999)
		(-0.546969, 0.0, 0.015202999)
		(-0.353462, 0.0, 0.011938)
		(-0.15995501, 0.0, 0.008673)
		(0.033552002, 0.0, 0.0054079997)
		(0.259772, 0.0, -0.006857)
		(0.48599103, 0.0, -0.019120999)
		(0.71221095, 0.0, -0.031386003)
		(0.71221095, 0.0, -0.031386003)
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
		0.11860701
		0.524666
		1.0
	]
}
