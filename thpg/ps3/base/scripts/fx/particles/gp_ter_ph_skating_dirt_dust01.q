GP_TER_PH_Skating_Dirt_Dust01 = {
	pos = (412.83905, 0.0, -101.960075)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	attach
	emitrangedims = (0.1, 0.1, 0.0)
	docircularemit
	emit_target = (0.0, 1.0, 0.0)
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, 0.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = -0.4
	anglespread = 45.0
	liferange = (0.6, 1.0)
	emit_rate = 20.0
	max = 0
	timeseed = 0.0
	lifetime = 0.0
	emitnum = 0
	followemitter = 0.0
	fillpath
	emitfunction = constant
	emitperiod = 1.0
	sizerange = [
		(0.4, 0.4)
		(1.5, 1.5)
	]
	speedrange = (0.2, 0.4)
	rotvel = (2.0, -2.0)
	rotveltimescale = 0.5
	emitdelaystart = 0.0
	pathfollowtime = 0.0
	history = 2
	historylistcoordinatespace = world
	color = -1
	quickmaterial = {
		texturelayout = layout2x2
		diffusetextureenabled
		diffusetexture = jow_steam02
		specularpower = 0
		normalmap = JOW_Steam01_N
		staticshadow
		alphacutoff = 1
		blendmode = blend
		softedge
		softedgescale = 0.5
		quadanimationfps = 0
	}
	knot = [
		(0.0, 0.0, 0.365176)
		(0.0, 0.0, 0.365176)
		(0.0, 0.0, 0.121725)
		(0.0, 0.0, 0.447063)
		(0.0, 0.0, 0.203612)
		(0.0, 0.0, 0.203612)
		(0.0, 0.0, 0.120336)
		(0.0, 0.0, -0.244293)
		(0.0, 0.0, -0.349418)
		(0.0, 0.0, -0.735895)
		(0.0, 0.0, -0.79303294)
		(0.0, 0.0, -0.79303294)
	]
	particlecolor = [
		-1584109440
		2138727541
		-557019310
		-893214642
		-557019359
		-893214691
		-557019392
		-893214720
	]
	vertexweight = [
		0.18331201
		0.550342
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
