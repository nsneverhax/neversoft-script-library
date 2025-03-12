gp_fx_electrode_sparks_r_01 = {
	pos = (1.0731801, 5.4882245, -2.662153)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	emitrangedims = (0.1, 0.1, 0.1)
	emit_target = (0.0, 0.0, 0.0)
	enablerotate
	emitangle = (0.0, 0.0, -15.0)
	force = (0.0, -5.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	radiate
	anglespread = 60.0
	bounceheight = 0.0
	bouncecoeff = 0.2
	bouncecallbackrate = 0.0
	liferange = (1.0, 1.5)
	emit_rate = 300.0
	max = 0
	timeseed = 0.0
	lifetime = 0.120000005
	emitnum = 0
	followemitter = 0.0
	emitfunction = constant
	emitperiod = 1.0
	sizerange = [
		(0.07, 0.1)
		(0.05, 0.1)
	]
	speedrange = (4.0, 3.0)
	rotvel = (0.0, 0.0)
	rotveltimescale = 0.0
	emitdelaystart = 0.0
	alignwithpath
	pathfollowtime = 0.04
	history = 2
	historylistcoordinatespace = world
	color = -726273
	lod_default
	novisibilitytest
	quickmaterial = {
		diffusetextureenabled
		diffusetexture = ta_spark_02
		specularpower = 0
		bloom
		alphacutoff = 16
		blendmode = add
		quadanimationfps = 0
	}
	knot = [
		(0.46765104, -0.0, -0.0)
		(0.46765104, -0.0, -0.0)
		(0.155884, 0.0, -0.0)
		(-0.155884, -0.0, -0.0)
		(-0.46765104, 0.0, -0.0)
		(-0.46765104, 0.0, -0.0)
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
