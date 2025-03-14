GP_TER_Grind_WaterSpray01 = {
	pos = (414.88385, 0.0, -96.60406)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	attach
	emitrangedims = (0.1, 0.1, 0.1)
	emit_target = (0.0, 1.0, 0.0)
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, -0.5, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	anglespread = 45.0
	liferange = (0.1, 0.4)
	emit_rate = 3.0
	max = 0
	timeseed = 0.0
	lifetime = 0.0
	emitnum = 0
	followemitter = 1.0
	emitfunction = sawtooth
	emitperiod = 1.0
	sizerange = [
		(0.1, 0.1)
		(0.5, 0.5)
	]
	speedrange = (0.8, 1.0)
	rotvel = (0.0, 0.0)
	rotveltimescale = 0.0
	emitdelaystart = 0.0
	pathfollowtime = 0.0
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
		-2038003969
		1027423743
		255
		255
	]
	vertexweight = [
		1.0
	]
	updatescript = rotdir_turn
	params = {
		objid = skater
		minrot = 0.0
		maxrot = 0.3
	}
}
