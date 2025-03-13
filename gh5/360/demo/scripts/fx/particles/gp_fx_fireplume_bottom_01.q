gp_fx_fireplume_bottom_01 = {
	pos = (-2.0571408, -0.23727502, 7.7425036)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	emitrangedims = (0.05, 0.1, 0.05)
	emit_target = (0.0, 1.0, 0.0)
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, 0.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	anglespread = 10.0
	dragcoeff = 0.0
	liferange = (0.5, 0.8)
	emit_rate = 40.0
	max = 0
	timeseed = 0.0
	lifetime = 1.0
	emitnum = 0
	followemitter = 0.0
	emitfunction = constant
	emitperiod = 1.0
	sizerange = [
		(0.3, 0.3)
		(0.2, 0.2)
	]
	speedrange = (2.3, 2.5)
	rotvel = (0.2, -0.2)
	rotveltimescale = 0.5
	emitdelaystart = 1.0
	pathfollowtime = 2.0
	history = 2
	historylistcoordinatespace = world
	color = -3503873
	lod_default
	quickmaterial = {
		texturelayout = layout2x2
		diffusetextureenabled
		diffusetexture = ph_fire_quad_01
		specularpower = 0
		bloom
		alphacutoff = 1
		blendmode = add
		burn
		burnvalue = 0.8
		quadanimationfps = 0
		lightgroup = allgroups
		fadeoutnearplane = 2.0
		fadeoutdistance = 1.0
	}
	knot = [
		(-0.67886907, 0.0, -0.014009)
		(-0.67886907, 0.0, -0.014009)
		(-0.63455105, 0.0, -0.0077820006)
		(-0.59023196, 0.0, -0.0015560001)
		(-0.545913, 0.0, 0.00467)
		(-0.408713, 0.0, 0.00467)
		(-0.27151302, 0.0, 0.00467)
		(-0.13431299, 0.0, 0.00467)
		(0.14347002, 0.0, 0.00467)
		(0.42125303, 0.0, 0.00467)
		(0.699036, 0.0, 0.00467)
		(0.699036, 0.0, 0.00467)
	]
	particlecolor = [
		-256
		-256
		-1
		-1
		-1
		-1
		992149504
		1543503872
	]
	vertexweight = [
		0.097347006
		0.395778
		1.0
	]
	updatescript = change_lifetime
	params = {
		smin = 0.5
		smax = 0.8
		emin = 0.05
		emax = 0.075
		delay = 0.6
		time = 0.3
		updatetime = 0.1
	}
}
