GP_PH_WaterKill01 = {
	pos = (-70.201584, 0.0, -281.50476)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	attach
	emitrangedims = (0.3, 0.0, 0.3)
	emit_target = (0.0, 1.0, 0.0)
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, -6.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	elevspread = (90.0, 160.0)
	sweepspread = (0.0, 360.0)
	liferange = (1.0, 1.5)
	emit_rate = 0.0
	max = 0
	timeseed = 0.0
	lifetime = 0.0
	emitnum = 100
	followemitter = 0.0
	emitfunction = constant
	emitperiod = 0.0
	sizerange = [
		(0.3, 0.3)
		(0.01, 0.01)
	]
	speedrange = (1.0, 4.0)
	rotvel = (4.0, -4.0)
	rotveltimescale = 5.0
	emitdelaystart = 0.0
	alignwithpath
	pathfollowtime = 0.25
	history = 1
	historylistcoordinatespace = world
	color = -1
	lod_default
	quickmaterial = {
		texturelayout = layout2x2
		diffusetextureenabled
		diffusetexture = PH_RainSplash_04
		specularpower = 0
		twoside
		alphacutoff = 1
		blendmode = add
		softedge
		softedgescale = 0.5
		quadanimationfps = 0
	}
	knot = [
		(-0.403039, 0.0, -0.775065)
		(-0.403039, 0.0, -0.775065)
		(-0.13434699, 0.0, -0.258355)
		(0.13434699, 0.0, 0.258355)
		(0.403039, 0.0, 0.775065)
		(0.403039, 0.0, 0.775065)
	]
	particlecolor = [
		2073335551
		1348429270
		1314482432
		421674240
	]
	vertexweight = [
		1.0
	]
}
