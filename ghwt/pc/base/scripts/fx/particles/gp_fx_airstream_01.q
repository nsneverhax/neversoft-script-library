gp_fx_airstream_01 = {
	pos = (0.0, -0.793325, -0.0)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = textureribbontrail
	active
	attach
	applypositionoffset
	emitrangedims = (0.0, 0.0, 0.0)
	emit_target = (0.0, 1.0, 0.0)
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, 0.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	radiate
	anglespread = 80.0
	liferange = (0.2, 1.0)
	emit_rate = 10.0
	max = 0
	timeseed = 0.0
	lifetime = 0.0
	emitnum = 0
	followemitter = 1.0
	fillpath
	emitfunction = onoff
	emitperiod = 0.1
	sizerange = [
		(0.15, 1.0)
		(0.05, 1.0)
	]
	speedrange = (0.0, 0.0)
	rotvel = (0.0, 0.0)
	rotveltimescale = 0.0
	emitdelaystart = 0.0
	pathfollowtime = 0.01
	history = 20
	historylistcoordinatespace = world
	color = -211
	lod_default
	quickmaterial = {
		diffusetextureenabled
		diffusetexture = ph_radialglow_01
		specularpower = 0
		alphacutoff = 1
		blendmode = add
		quadanimationfps = 0
	}
	knot = [
		(-0.72312903, 0.0, -0.0)
		(-0.72312903, 0.0, -0.0)
		(-0.54905903, 0.0, -0.0)
		(-0.374989, 0.0, -0.0)
		(-0.200919, 0.0, -0.0)
		(-0.040763, 0.0, -0.0)
		(0.119394004, 0.0, -0.0)
		(0.27955103, 0.0, -0.0)
		(0.4012, 0.0, -0.0)
		(0.52284896, 0.0, -0.0)
		(0.64449805, 0.0, -0.0)
		(0.64449805, 0.0, -0.0)
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
	vertexweight = [
		0.38183704
		0.733153
		1.0
	]
}
