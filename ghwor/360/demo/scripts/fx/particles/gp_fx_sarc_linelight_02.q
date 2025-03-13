gp_fx_sarc_linelight_02 = {
	pos = (0.0, 0.518488, -0.0)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	attach
	align
	applypositionoffset
	bone = bone1
	emitrangedims = (0.0, 0.0, 0.7)
	emit_target = (0.0, 1.0, 0.0)
	enablerotate
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, 0.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	radiate
	elevspread = (90.0, 90.0)
	sweepspread = (0.0, 360.0)
	dragcoeff = 0.0
	liferange = (0.3, 0.4)
	emit_rate = 60.0
	max = 0
	timeseed = 0.0
	lifetime = 3.4
	emitnum = 0
	followemitter = 0.0
	emitfunction = invsawtooth
	emitperiod = 10.0
	sizerange = [
		(0.1, 0.1)
		(0.05, 0.2)
	]
	speedrange = (0.2, 6.0)
	turbulence = (0.0, 0.0, 0.0)
	rotvel = (0.0, 0.0)
	rotveltimescale = 0.0
	emitdelaystart = 0.0
	alignwithpath
	pathfollowtime = 1.3
	history = 2
	historylistcoordinatespace = object
	color = -3038977
	lod_default
	quickmaterial = {
		layoutn = 1
		layoutm = 1
		diffusetextureenabled
		diffusetexture = ph_radialglow_01
		specularpower = 0
		bloom
		alphacutoff = 1
		blendmode = add
		softedge
		softedgescale = 0.8
		aoshadow = 0.0
		quadanimationfps = 0
		lightgroup = allgroups
		fadeoutnearplane = 0.0
		fadeoutdistance = 0.1
	}
	knot = [
		(-0.381, 0.0, -0.312298)
		(-0.381, 0.0, -0.312298)
		(-0.30132, 0.0, -0.244574)
		(-0.22164099, 0.0, -0.17685099)
		(-0.14196101, 0.0, -0.10912701)
		(-0.040358, 0.0, -0.028886)
		(0.061244994, 0.0, 0.051355)
		(0.162848, 0.0, 0.131596)
		(0.22860299, 0.0, 0.18434)
		(0.294358, 0.0, 0.23708501)
		(0.360112, 0.0, 0.28982902)
		(0.360112, 0.0, 0.28982902)
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
		0.328498
		0.7351999
		1.0
	]
}
