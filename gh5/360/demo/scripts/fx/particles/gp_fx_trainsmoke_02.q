gp_fx_trainsmoke_02 = {
	pos = (0.0, -1.5, 0.0)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	attach
	applypositionoffset
	emitrangedims = (1.0, 0.2, 0.1)
	emit_target = (0.0, 1.0, 0.0)
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, 0.3, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	anglespread = 120.0
	liferange = (1.0, 3.0)
	emit_rate = 30.0
	max = 0
	timeseed = 0.0
	lifetime = 7.0
	emitnum = 0
	followemitter = 0.0
	emitfunction = constant
	emitperiod = 1.0
	sizerange = [
		(3.0, 3.0)
		(5.0, 5.0)
	]
	speedrange = (1.0, 2.0)
	rotvel = (0.0, 0.0)
	rotveltimescale = 0.0
	emitdelaystart = 0.0
	pathfollowtime = 0.0
	history = 2
	historylistcoordinatespace = world
	color = 2037274931
	lod_default
	quickmaterial = {
		diffusetextureenabled
		diffusetexture = ph_smoke_singlepuff_blend_02
		specularpower = 0
		alphacutoff = 1
		blendmode = blend
		softedge
		softedgescale = 0.5
		burn
		burnvalue = 0.4
		quadanimationfps = 0
	}
	knot = [
		(-0.941619, 0.0, -0.0)
		(-0.941619, 0.0, -0.0)
		(-0.812029, 0.0, -0.0)
		(-0.68243796, 0.0, -0.0)
		(-0.552848, 0.0, -0.0)
		(-0.38448003, 0.0, -0.0)
		(-0.216112, 0.0, -0.0)
		(-0.047744, 0.0, -0.0)
		(0.26741302, 0.0, -0.0)
		(0.582569, 0.0, -0.0)
		(0.89772505, 0.0, -0.0)
		(0.89772505, 0.0, -0.0)
	]
	particlecolor = [
		-256
		-256
		-1
		-1
		-1
		-1
		-256
		-256
	]
	vertexweight = [
		0.21136402
		0.48597503
		1.0
	]
}
