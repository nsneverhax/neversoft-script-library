GP_WaterSplash02 = {
	pos = (0.0, 0.120000005, -0.0)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	attach
	applypositionoffset
	emitrangedims = (0.15, 0.0, 0.15)
	docircularemit
	emit_target = (0.0, 1.0, 0.0)
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, -1.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	radiate
	elevspread = (90.0, 100.0)
	sweepspread = (0.0, 360.0)
	liferange = (0.2, 0.3)
	emit_rate = 32.0
	max = 0
	timeseed = 0.0
	lifetime = 0.0
	emitnum = 0
	followemitter = 0.0
	emitfunction = constant
	emitperiod = 0.0
	sizerange = [
		(0.4, 0.4)
		(0.8, 0.8)
	]
	speedrange = (0.3, 0.5)
	rotvel = (0.0, 0.0)
	rotveltimescale = 0.0
	emitdelaystart = 0.0
	pathfollowtime = 1.0
	history = 4
	historylistcoordinatespace = world
	color = -1
	lod_default
	quickmaterial = {
		diffusetextureenabled
		diffusetexture = JOW_Splash01
		specularpower = 0
		softedge
		alphacutoff = 1
		blendmode = blend
		quadanimationfps = 0
	}
	knot = [
		(0.0, 0.0, 0.17208101)
		(0.0, 0.0, 0.17208101)
		(0.0, 0.0, 0.05736)
		(0.0, 0.0, -0.05736)
		(0.0, 0.0, -0.17208101)
		(0.0, 0.0, -0.17208101)
	]
	particlecolor = [
		-1
		-1
		-256
		-256
	]
	vertexweight = [
		1.0
	]
}
