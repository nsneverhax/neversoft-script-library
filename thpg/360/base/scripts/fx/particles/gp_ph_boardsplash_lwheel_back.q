GP_PH_BoardSplash_LWheel_Back = {
	pos = (0.21276702, 0.0, -0.0)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	attach
	emitrangedims = (0.0, 0.0, 0.0)
	emit_target = (0.0, 1.0, 0.0)
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, 4.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	anglespread = 45.0
	liferange = (0.2, 0.3)
	emit_rate = 20.0
	max = 0
	timeseed = 0.0
	lifetime = 0.0
	emitnum = 0
	followemitter = 0.4
	fillpath
	emitfunction = sawtooth
	emitperiod = 3.0
	sizerange = [
		(0.05, 0.05)
		(0.8, 0.8)
	]
	speedrange = (0.8, 1.0)
	rotvel = (0.3, 0.3)
	rotveltimescale = 1.0
	emitdelaystart = 0.0
	pathfollowtime = 0.5
	history = 2
	historylistcoordinatespace = world
	color = -1
	lod_default
	quickmaterial = {
		diffusetextureenabled
		diffusetexture = PH_RainSplash_01
		specularpower = 0
		twoside
		alphacutoff = 1
		blendmode = add
		softedge
		softedgescale = 1.0
		quadanimationfps = 0
	}
	knot = [
		(0.26306197, 0.0, -0.833046)
		(0.26306197, 0.0, -0.833046)
		(0.087687, 0.0, -0.277682)
		(-0.087687, 0.0, 0.277682)
		(-0.26306197, 0.0, 0.833046)
		(-0.26306197, 0.0, 0.833046)
	]
	particlecolor = [
		-2038004065
		1027423638
		0
		0
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
