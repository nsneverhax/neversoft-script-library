gp_fx_topsparks_radiate_01 = {
	pos = (-0.79653895, 7.20774, -5.461702)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	emitrangedims = (0.1, 0.1, 0.1)
	emit_target = (0.0, 0.0, 1.0)
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, -4.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	radiate
	anglespread = 150.0
	bounceheight = 0.0
	bouncecoeff = 0.2
	bouncecallbackrate = 0.0
	dragcoeff = 0.3
	liferange = (3.0, 5.0)
	emit_rate = 200.0
	max = 0
	timeseed = 0.0
	lifetime = 4.0
	emitnum = 0
	followemitter = 0.0
	emitfunction = onoff
	emitperiod = 1.0
	sizerange = [
		(0.07, 0.1)
		(0.0, 0.1)
	]
	speedrange = (1.5, 8.0)
	rotvel = (0.0, 0.0)
	rotveltimescale = 0.0
	emitdelaystart = 0.0
	alignwithpath
	pathfollowtime = 0.07
	history = 2
	historylistcoordinatespace = world
	color = -2716673
	lod_default
	novisibilitytest
	quickmaterial = {
		diffusetextureenabled
		diffusetexture = jow_spark01
		specularpower = 0
		bloom
		alphacutoff = 16
		blendmode = add
		quadanimationfps = 0
		lightgroup = allgroups
		fadeoutnearplane = 0.0
		fadeoutdistance = 0.1
	}
	knot = [
		(-0.46765104, 0.0, -0.0)
		(-0.46765104, 0.0, -0.0)
		(-0.155884, 0.0, -0.0)
		(0.155884, 0.0, -0.0)
		(0.46765104, 0.0, -0.0)
		(0.46765104, 0.0, -0.0)
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
