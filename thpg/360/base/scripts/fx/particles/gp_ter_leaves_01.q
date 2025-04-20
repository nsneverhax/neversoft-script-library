GP_TER_Leaves_01 = {
	pos = (385.39825, 0.0, -78.9212)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	attach
	emitrangedims = (0.3, 0.1, 0.3)
	emit_target = (0.0, 1.0, 0.0)
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, -4.0, 0.0)
	windcoeff = 0.05
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	anglespread = 140.0
	liferange = (1.0, 1.5)
	emit_rate = 40.0
	max = 0
	timeseed = 0.0
	lifetime = 0.0
	emitnum = 0
	followemitter = 0.5
	emitfunction = sawtooth
	emitperiod = 1.0
	sizerange = [
		(0.17, 0.17)
		(0.17, 0.17)
	]
	speedrange = (3.0, 3.7)
	rotvel = (4.0, -4.0)
	rotveltimescale = 3.0
	emitdelaystart = 0.0
	pathfollowtime = 0.0
	history = 2
	historylistcoordinatespace = world
	align_to = (1.0, 0.0, 0.0)
	rotate3d
	color = -858993409
	lod_default
	quickmaterial = {
		texturelayout = layout2x2
		diffusetextureenabled
		diffusetexture = JOW_Leaves01
		specularpower = 0
		twoside
		staticshadow
		alphacutoff = 1
		blendmode = blend
		quadanimationfps = 0
	}
	knot = [
		(-1.07251, 0.0, -0.8595661)
		(-1.07251, 0.0, -0.8595661)
		(-0.59827197, 0.0, -0.479486)
		(-0.12403401, 0.0, -0.09940701)
		(0.35020402, 0.0, 0.280672)
		(0.5909729, 0.0, 0.473637)
		(0.831741, 0.0, 0.666601)
		(1.07251, 0.0, 0.8595661)
		(1.07251, 0.0, 0.8595661)
	]
	particlecolor = [
		-1
		-1
		-1
		-1
		-256
		-256
	]
	vertexweight = [
		0.66326404
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
