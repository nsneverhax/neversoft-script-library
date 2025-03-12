gp_fx_guitar_glow_01 = {
	pos = (0.0, -0.66739005, 0.022705)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	attach
	applypositionoffset
	attachobject = z_modular_trg_geo_demi
	bone = bone_demi
	emitrangedims = (0.0, 0.0, 0.0)
	emit_target = (0.0, 1.0, 0.0)
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, 0.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	anglespread = 200.0
	selectedwind = guitartest
	dragcoeff = 1.0
	liferange = (0.2, 2.0)
	emit_rate = 8.0
	max = 2
	timeseed = 0.0
	lifetime = 0.0
	emitnum = 0
	followemitter = 0.0
	emitfunction = constant
	emitperiod = 1.0
	sizerange = [
		(2.5, 2.5)
		(5.0, 5.0)
	]
	speedrange = (0.0, 0.0)
	turbulence = (0.0, 0.0, 0.0)
	rotvel = (0.4, -0.4)
	rotveltimescale = 0.5
	emitdelaystart = 0.0
	pathfollowtime = 0.0
	history = 2
	historylistcoordinatespace = object
	color = 1074857215
	lod_default
	quickmaterial = {
		layoutn = 1
		layoutm = 1
		diffusetextureenabled
		diffusetexture = ph_radialglow_01
		specularpower = 0
		alphacutoff = 1
		blendmode = add
		softedge
		softedgescale = 0.2
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
		(-0.073405, 0.0, -0.011515)
		(0.07154301, 0.0, -0.006551)
		(0.21649201, 0.0, -0.0015870001)
		(0.292745, 0.0, 0.010457)
		(0.368998, 0.0, 0.022502)
		(0.44525102, 0.0, 0.034546)
		(0.44525102, 0.0, 0.034546)
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
		0.5
		0.5
	]
	vertexweight = [
		0.23036602
		0.7326459
		1.0
	]
}
