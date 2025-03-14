GP_PH_PropaneBoardFire01 = {
	pos = (323.74478, 0.0, -222.54788)
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
	force = (0.0, 0.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	anglespread = 200.0
	liferange = (0.3, 0.5)
	emit_rate = 200.0
	max = 0
	timeseed = 0.0
	lifetime = 0.0
	emitnum = 0
	followemitter = 0.0
	fillpath
	emitfunction = constant
	emitperiod = 1.0
	sizerange = [
		(0.5, 0.5)
		(0.75, 0.75)
	]
	speedrange = (0.2, 0.3)
	rotvel = (0.0, 0.0)
	rotveltimescale = 0.0
	emitdelaystart = 0.0
	alignwithpath
	pathfollowtime = -0.1
	history = 2
	historylistcoordinatespace = world
	color = -1
	lod_distances = (20.0, 20.0)
	novisibilitytest
	quickmaterial = {
		texturelayout = layout2x2
		diffusetextureenabled
		diffusetexture = PH_Fire3
		specularpower = 0
		alphacutoff = 1
		blendmode = add
		softedge
		softedgescale = 1.0
		burn
		burnvalue = 0.6
		quadanimationfps = 0
	}
	knot = [
		(-0.279968, 0.0, -0.6585241)
		(-0.279968, 0.0, -0.6585241)
		(-0.18345101, 0.0, -0.417119)
		(-0.086934, 0.0, -0.175715)
		(0.009582999, 0.0, 0.065689)
		(0.083639, 0.0, 0.231023)
		(0.15769501, 0.0, 0.39635703)
		(0.23175, 0.0, 0.561691)
		(0.23175, 0.0, 0.561691)
	]
	particlecolor = [
		-8847105
		-210177
		-8847216
		-210280
		-8847105
		-210177
	]
	vertexweight = [
		0.58933794
		1.0
	]
	updatescript = emitrate_speed
	params = {
		objid = skater
		minrate = 64.0
		maxrate = 180.0
		minspeed = 0.0
		maxspeed = 12.0
	}
}
