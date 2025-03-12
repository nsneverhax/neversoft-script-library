gp_fx_sparkshower_flash_01 = {
	pos = (-1.991156, 7.4327874, 1.0939251)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	emitrangedims = (0.5, 0.0, 0.0)
	emit_target = (0.0, -0.2, 0.0)
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, 0.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	anglespread = 15.0
	liferange = (0.05, 0.1)
	emit_rate = 6.0
	max = 1
	timeseed = 0.0
	lifetime = 0.5
	emitnum = 0
	followemitter = 0.0
	alwaysemit
	emitfunction = constant
	emitperiod = 0.02
	sizerange = [
		(0.2, 0.2)
		(4.0, 4.0)
	]
	speedrange = (0.0, 0.0)
	rotvel = (0.2, -0.2)
	rotveltimescale = 0.5
	emitdelaystart = 0.0
	pathfollowtime = 0.07
	history = 2
	historylistcoordinatespace = world
	color = -9559553
	lod_default
	novisibilitytest
	quickmaterial = {
		diffusetextureenabled
		diffusetexture = ph_radialglow_01
		specularpower = 0
		bloom
		alphacutoff = 16
		blendmode = add
		quadanimationfps = 0
	}
	knot = [
		(-0.46687204, 0.0, 0.02698)
		(-0.46687204, 0.0, 0.02698)
		(-0.15562399, 0.0, 0.008993001)
		(0.15562399, 0.0, -0.008993001)
		(0.46687204, 0.0, -0.02698)
		(0.46687204, 0.0, -0.02698)
	]
	particlecolor = [
		-1
		-1
		-1
		-1
	]
	vertexweight = [
		1.0
	]
}
