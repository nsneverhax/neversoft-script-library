gp_fx_wallsmoke_03 = {
	pos = (0.15149902, 4.1153703, -9.454585)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	emitrangedims = (4.0, 0.1, 2.0)
	emit_target = (0.0, 1.0, 0.0)
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, 0.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	anglespread = 1.0
	dragcoeff = 0.0
	liferange = (5.0, 6.0)
	emit_rate = 2.0
	max = 0
	timeseed = 0.0
	lifetime = 0.0
	emitnum = 0
	followemitter = 0.0
	emitfunction = constant
	emitperiod = 1.0
	sizerange = [
		(4.0, 4.0)
		(7.0, 7.0)
	]
	speedrange = (1.0, 1.3)
	turbulence = (0.0, 0.0, 0.0)
	rotvel = (0.2, -0.2)
	rotveltimescale = 0.2
	emitdelaystart = 0.0
	pathfollowtime = 0.0
	history = 2
	historylistcoordinatespace = world
	color = -1515870923
	lod_default
	quickmaterial = {
		layoutn = 1
		layoutm = 1
		diffusetextureenabled
		diffusetexture = ph_smoke_singlepuff_blend_02
		specularpower = 0
		lighting
		alphacutoff = 1
		blendmode = blend
		softedge
		softedgescale = 0.5
		burn
		burnvalue = 0.4
		aoshadow = 0.0
		quadanimationfps = 0
		lightgroup = allgroups
		viewports = [
			tem
		]
		fadeoutnearplane = 0.0
		fadeoutdistance = 0.1
	}
	knot = [
		(-1.7640979, 0.0, -0.058525003)
		(-1.7640979, 0.0, -0.058525003)
		(-1.496557, 0.0, -0.047376998)
		(-1.229016, 0.0, -0.036229998)
		(-0.96147496, 0.0, -0.025082001)
		(-0.703369, 0.0, 0.0083610015)
		(-0.445263, 0.0, 0.041802995)
		(-0.187157, 0.0, 0.075246006)
		(0.413097, 0.0, 0.052951)
		(1.013352, 0.0, 0.030656)
		(1.613606, 0.0, 0.0083610015)
		(1.613606, 0.0, 0.0083610015)
	]
	particlecolor = [
		0
		0
		-1
		-1
		-86
		-101
		0
		0
	]
	burnpervertex = [
		1.0
		1.0
		1.0
		1.0
	]
	vertexweight = [
		0.237239
		0.46782503
		1.0
	]
}
