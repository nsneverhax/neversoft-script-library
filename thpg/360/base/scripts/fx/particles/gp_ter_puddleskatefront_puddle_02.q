GP_TER_PuddleSkateFront_PUDDLE_02 = {
	pos = (1.1476729, -0.024368, -0.070931)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	attach
	bone = BONE_BOARD_TRUCK_NOSE
	emitrangedims = (0.0, 0.0, 0.0)
	emit_target = (0.0, 1.0, 0.0)
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, -12.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	elevspread = (90.0, 175.0)
	sweepspread = (0.0, 360.0)
	liferange = (0.4, 0.5)
	emit_rate = 100.0
	max = 0
	timeseed = 0.0
	lifetime = 0.0
	emitnum = 0
	followemitter = 0.8
	emitfunction = constant
	emitperiod = 1.0
	sizerange = [
		(0.4, 0.4)
		(0.5, 0.5)
	]
	speedrange = (2.0, 3.0)
	rotvel = (1.5, -1.5)
	rotveltimescale = 1.0
	emitdelaystart = 0.0
	alignwithpath
	pathfollowtime = 0.0
	history = 2
	historylistcoordinatespace = world
	color = -1819045053
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
		(-0.005132, 0.0, -0.628703)
		(5E-06, 0.0, -0.72214293)
		(0.0051419996, 0.0, -0.544281)
		(0.0051419996, 0.0, -0.09024601)
		(0.0051419996, 0.0, 0.635091)
		(0.0051419996, 0.0, 1.0891271)
		(0.0051419996, 0.0, 1.0891271)
	]
	particlecolor = [
		-1701144064
		-1583243008
		-1448498689
		-926365441
		1970631936
		2038003968
	]
	vertexweight = [
		0.13860899
		1.0
	]
	updatescript = emitrate_speed
	params = {
		objid = skater
		minrate = 0.0
		maxrate = 100.0
		minspeed = 3.0
		maxspeed = 12.0
	}
}
