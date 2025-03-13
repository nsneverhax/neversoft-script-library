gp_fx_sd_dg_attacka_glow01 = {
	pos = (41.77568, 0.0, 74.01724)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	attach
	attachobject = guitarist
	bone = bone_guitar_body
	emitrangedims = (1.0, 1.0, 1.0)
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
	liferange = (0.1, 0.2)
	emit_rate = 1.0
	max = 1
	timeseed = 0.0
	lifetime = 0.0
	emitnum = 3
	followemitter = 0.0
	emitfunction = constant
	emitperiod = 1.0
	sizerange = [
		(24.0, 24.0)
		(48.0, 48.0)
	]
	speedrange = (0.0, 0.0)
	turbulence = (0.0, 0.0, 0.0)
	rotvel = (0.5, 0.5)
	rotveltimescale = 1.0
	emitdelaystart = 0.0
	pathfollowtime = 0.5
	history = 2
	historylistcoordinatespace = world
	color = -5526721
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
