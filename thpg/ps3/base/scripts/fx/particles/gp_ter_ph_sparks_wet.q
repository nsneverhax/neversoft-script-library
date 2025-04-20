GP_TER_PH_Sparks_WET = {
	pos = (336.78076, 0.24939002, -94.782036)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	attach
	emitrangedims = (0.02, 0.1, 0.02)
	emit_target = (0.0, 1.0, 0.0)
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, -4.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = -0.7
	anglespread = 60.0
	liferange = (0.6, 1.0)
	emit_rate = 5.0
	max = 0
	timeseed = 0.0
	lifetime = 0.0
	emitnum = 0
	followemitter = 0.1
	fillpath
	emitfunction = constant
	emitperiod = 1.0
	sizerange = [
		(0.01, 0.01)
		(0.01, 0.01)
	]
	speedrange = (2.0, 4.0)
	rotvel = (0.0, 0.0)
	rotveltimescale = 0.0
	emitdelaystart = 0.0
	alignwithpath
	pathfollowtime = 0.1
	history = 2
	historylistcoordinatespace = object
	color = -1
	lod_default
	quickmaterial = {
		diffusetextureenabled
		diffusetexture = jow_spark01
		specularpower = 0
		staticshadow
		alphacutoff = 1
		blendmode = add
		quadanimationfps = 0
	}
	knot = [
		(-0.028106999, 0.0, -0.415771)
		(-0.028106999, 0.0, -0.415771)
		(-0.009359, 0.0, -0.13859)
		(0.009389, 0.0, 0.13859)
		(0.028136998, 0.0, 0.415771)
		(0.028136998, 0.0, 0.415771)
	]
	particlecolor = [
		-7729665
		-2020609
		-6136832
		-8755456
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
