gp_fx_norwaydragon_fire_01 = {
	pos = (0.31665203, 2.246106, -4.4125175)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	emitrangedims = (0.0, 0.1, 0.0)
	emit_target = (0.0, 1.0, 0.0)
	enablerotate
	emitangle = (10.0, 0.0, 20.0)
	force = (0.0, 0.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	anglespread = 20.0
	liferange = (0.7, 1.0)
	emit_rate = 20.0
	max = 0
	timeseed = 0.0
	lifetime = 1.5
	emitnum = 0
	followemitter = 0.0
	emitfunction = constant
	emitperiod = 1.0
	sizerange = [
		(0.5, 0.5)
		(2.0, 2.0)
	]
	speedrange = (5.0, 6.0)
	rotvel = (0.0, 0.0)
	rotveltimescale = 0.0
	emitdelaystart = 0.0
	alignwithpath
	pathfollowtime = 0.3
	history = 2
	historylistcoordinatespace = world
	color = -3699713
	lod_default
	quickmaterial = {
		texturelayout = layout2x2
		diffusetextureenabled
		diffusetexture = ph_fire_quad_01
		specularpower = 0
		bloom
		alphacutoff = 1
		blendmode = blend
		softedge
		softedgescale = 0.2
		burn
		burnvalue = 0.6
		quadanimationfps = 0
	}
	knot = [
		(-0.82557696, 0.0, -0.0)
		(-0.82557696, 0.0, -0.0)
		(-0.713797, 0.0, -0.0)
		(-0.602017, 0.0, -0.0)
		(-0.490238, 0.0, -0.0)
		(-0.30561304, 0.0, -0.0)
		(-0.120988004, 0.0, -0.0)
		(0.06363701, 0.0, -0.0)
		(0.318812, 0.0, -0.0)
		(0.573986, 0.0, -0.0)
		(0.82916003, 0.0, -0.0)
		(0.82916003, 0.0, -0.0)
	]
	particlecolor = [
		-256
		-256
		-1
		-1
		-11250433
		-8046593
		1545477632
		1597117696
	]
	vertexweight = [
		0.20265399
		0.537375
		1.0
	]
	updatescript = change_lifetime
	params = {
		smin = 0.7
		smax = 1.0
		emin = 0.1
		emax = 0.4
		delay = 0.8
		time = 0.4
		updatetime = 0.1
	}
}
