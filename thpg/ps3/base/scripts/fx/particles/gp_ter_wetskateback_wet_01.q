GP_TER_WetSkateBack_WET_01 = {
	pos = (-0.0015550001, -0.114502, -0.031283)
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
	force = (0.0, -10.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	anglespread = 60.0
	liferange = (0.2, 0.3)
	emit_rate = 75.0
	max = 0
	timeseed = 0.0
	lifetime = 0.0
	emitnum = 0
	followemitter = 0.0
	fillpath
	emitfunction = constant
	emitperiod = 1.0
	sizerange = [
		(0.3, 0.3)
		(0.5, 0.5)
	]
	speedrange = (2.0, 3.0)
	rotvel = (0.2, -0.2)
	rotveltimescale = 0.0
	emitdelaystart = 0.0
	pathfollowtime = 0.0
	history = 2
	historylistcoordinatespace = world
	color = 1330597672
	lod_default
	quickmaterial = {
		diffusetextureenabled
		diffusetexture = PH_RainSplash_01
		specularpower = 0
		alphacutoff = 1
		blendmode = add
		softedge
		softedgescale = 1.0
		quadanimationfps = 0
	}
	knot = [
		(-0.010269, 0.0, -0.80656403)
		(-0.010269, 0.0, -0.80656403)
		(-0.005132, 0.0, -0.716563)
		(5E-06, 0.0, -0.62656206)
		(0.0051419996, 0.0, -0.53656)
		(0.0051419996, 0.0, 0.005335)
		(0.0051419996, 0.0, 0.547231)
		(0.0051419996, 0.0, 1.0891271)
		(0.0051419996, 0.0, 1.0891271)
	]
	particlecolor = [
		-256
		-256
		-1
		-1
		-256
		-256
	]
	vertexweight = [
		0.142629
		1.0
	]
	updatescript = emitrate_speed
	params = {
		objid = skater
		minrate = 0.0
		maxrate = 100.0
		minspeed = 4.0
		maxspeed = 7.0
	}
}
