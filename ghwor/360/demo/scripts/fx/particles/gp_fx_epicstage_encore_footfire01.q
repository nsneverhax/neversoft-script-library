gp_fx_epicstage_encore_footfire01 = {
	pos = (0.35497802, 0.0, -5.80239)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	attach
	bone = bone_toe_r
	emitrangedims = (0.05, 0.02, 0.15)
	emit_target = (0.0, 1.0, 0.0)
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, 2.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 3.0
	targetposition = 2.0
	emittervelocityweight = 0.0
	anglespread = 180.0
	selectedwind = violentwind01
	dragcoeff = 0.5
	liferange = (0.5, 0.7)
	emit_rate = 100.0
	max = 0
	timeseed = 0.2
	lifetime = 0.2
	emitnum = 0
	followemitter = 0.0
	emitfunction = constant
	emitperiod = 1.0
	sizerange = [
		(0.3, 0.3)
		(0.2, 0.2)
	]
	speedrange = (0.2, 0.4)
	turbulence = (1.0, 3.0, 2.0)
	rotvel = (-0.15, -0.05)
	rotveltimescale = 1.0
	emitdelaystart = 0.0
	pathfollowtime = 0.0
	history = 2
	historylistcoordinatespace = world
	color = -1
	lod_default
	quickmaterial = {
		layoutn = 1
		layoutm = 1
		diffusetextureenabled
		diffusetexture = ph_firepuffs_alpha
		specularpower = 0
		lighting
		alphacrunch
		alphacutoff = 1
		blendmode = add
		burn
		burnvalue = 0.9
		aoshadow = 0.0
		quadanimationfps = 0
		lightgroup = blaze
		fadeoutnearplane = 0.0
		fadeoutdistance = 0.1
	}
	knot = [
		(-0.66863203, 0.0, -0.0)
		(-0.66863203, 0.0, -0.0)
		(-0.565716, 0.0, -0.0)
		(-0.46280003, 0.0, -0.0)
		(-0.35988402, 0.0, -0.0)
		(-0.118032, 0.0, -0.0)
		(0.123821, 0.0, -0.0)
		(0.36567304, 0.0, -0.0)
		(0.46473002, 0.0, -0.0)
		(0.56378603, 0.0, -0.0)
		(0.662843, 0.0, -0.0)
		(0.662843, 0.0, -0.0)
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
		0.231884
		0.776811
		1.0
	]
}
