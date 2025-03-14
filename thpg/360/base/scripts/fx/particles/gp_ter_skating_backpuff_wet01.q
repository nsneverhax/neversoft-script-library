GP_TER_Skating_BackPuff_WET01 = {
	pos = (-0.0054929997, 0.0, 0.0016340001)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	attach
	emitrangedims = (0.1, 0.0, 0.1)
	emit_target = (0.0, 1.0, 0.0)
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, 0.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	anglespread = 100.0
	liferange = (0.1, 0.3)
	emit_rate = 20.0
	max = 0
	timeseed = 0.0
	lifetime = 0.0
	emitnum = 0
	followemitter = 0.5
	emitfunction = sawtooth
	emitperiod = 10.0
	sizerange = [
		(0.1, 0.1)
		(0.4, 0.4)
	]
	speedrange = (1.0, 1.0)
	rotvel = (0.3, -0.3)
	rotveltimescale = 0.0
	emitdelaystart = 0.0
	pathfollowtime = 0.1
	history = 2
	historylistcoordinatespace = world
	color = -1
	lod_default
	quickmaterial = {
		diffusetextureenabled
		diffusetexture = ph_firepuffs
		specularpower = 0
		alphacutoff = 1
		blendmode = add
		softedge
		softedgescale = 1.0
		quadanimationfps = 0
	}
	knot = [
		(-0.013825999, 0.0, -0.96781105)
		(-0.013825999, 0.0, -0.96781105)
		(-0.004609, 0.0, -0.32260403)
		(0.004609, 0.0, 0.32260403)
		(0.013825999, 0.0, 0.96781105)
		(0.013825999, 0.0, 0.96781105)
	]
	particlecolor = [
		-1060052873
		1854316630
		-1060052992
		1854316544
	]
	vertexweight = [
		1.0
	]
	updatescript = emitrate_speed
	params = {
		objid = skater
		minrate = 0.0
		maxrate = 64.0
		minspeed = 0.0
		maxspeed = 12.0
	}
}
