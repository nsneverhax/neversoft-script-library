gp_fx_intro03_ax_sparks01 = {
	pos = (4.8175225, 0.0, 56.98297)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	attach
	attachobject = guitarist
	bone = bone_guitar_body
	emitrangedims = (5.0, 5.0, 5.0)
	docircularemit
	emit_target = (0.0, 1.0, 0.0)
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, 0.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	radiate
	anglespread = 360.0
	dragcoeff = 0.0
	liferange = (0.3, 0.4)
	emit_rate = 80.0
	max = 0
	timeseed = 0.0
	lifetime = 1.6
	emitnum = 0
	followemitter = 0.0
	emitfunction = sawtooth
	emitperiod = 1.6
	sizerange = [
		(0.5, 0.5)
		(0.5, 0.5)
	]
	speedrange = (64.0, 72.0)
	turbulence = (0.0, 0.0, 0.0)
	rotvel = (0.0, 0.0)
	rotveltimescale = 0.0
	emitdelaystart = 0.0
	alignwithpath
	pathfollowtime = 0.15
	history = 2
	historylistcoordinatespace = world
	color = -5206657
	lod_default
	quickmaterial = {
		texturelayout = layout2x2
		layoutn = 1
		layoutm = 1
		diffusetextureenabled
		diffusetexture = ph_sparks_01
		specularpower = 0
		bloom
		alphacutoff = 1
		blendmode = add
		softedge
		softedgescale = 0.2
		aoshadow = 0.0
		quadanimationfps = 0
		lightgroup = allgroups
		fadeoutnearplane = 0.0
		fadeoutdistance = 0.1
	}
	knot = [
		(-1.010263, 0.0, -0.0)
		(-1.010263, 0.0, -0.0)
		(-0.797576, 0.0, -0.0)
		(-0.584889, 0.0, -0.0)
		(-0.372202, 0.0, -0.0)
		(-0.15951501, 0.0, -0.0)
		(0.053172, 0.0, -0.0)
		(0.265859, 0.0, -0.0)
		(0.54944104, 0.0, -0.0)
		(0.833024, 0.0, -0.0)
		(1.1166071, 0.0, -0.0)
		(1.1166071, 0.0, -0.0)
	]
	particlecolor = [
		-1
		-1
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
		0.3
		0.6
		1.0
	]
}
