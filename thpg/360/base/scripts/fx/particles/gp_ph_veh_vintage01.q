GP_PH_Veh_Vintage01 = {
	pos = (0.5912839, 0.0, -2.3856082)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	attach
	align
	applypositionoffset
	emitrangedims = (0.0, 0.0, 0.0)
	emit_target = (0.0, 0.0, -1.0)
	enablerotate
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, 1.0, 0.0)
	windcoeff = 1.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	anglespread = 20.0
	liferange = (0.3, 0.4)
	emit_rate = 50.0
	max = 0
	timeseed = 0.0
	lifetime = 0.0
	emitnum = 0
	followemitter = 0.0
	emitfunction = constant
	emitperiod = 1.0
	sizerange = [
		(0.2, 0.2)
		(0.8, 0.8)
	]
	speedrange = (0.3, 0.4)
	rotvel = (0.5, -0.5)
	rotveltimescale = 0.0
	emitdelaystart = 0.0
	pathfollowtime = 0.0
	history = 2
	historylistcoordinatespace = world
	color = -1
	lod_distances = (300.0, 300.0)
	novisibilitytest
	quickmaterial = {
		texturelayout = layout2x2
		diffusetextureenabled
		diffusetexture = jow_steam02
		specularpower = 0
		staticshadow
		alphacutoff = 1
		blendmode = blend
		softedge
		softedgescale = 1.0
		quadanimationfps = 0
	}
	knot = [
		(-0.003493, 0.0, -0.63919204)
		(-0.003493, 0.0, -0.63919204)
		(-0.003493, 0.0, -0.377228)
		(-0.003493, 0.0, -0.115264006)
		(-0.003493, 0.0, 0.1467)
		(0.0, 0.0, 0.26196396)
		(0.003493, 0.0, 0.377228)
		(0.006986, 0.0, 0.49249202)
		(0.006986, 0.0, 0.49249202)
	]
	particlecolor = [
		1633771992
		2038004211
		1633771915
		2038004101
		1633771776
		2038003968
	]
	vertexweight = [
		0.69434696
		1.0
	]
	updatescript = emitrate_speed
	params = {
		objid = parent
		minrate = 0.0
		maxrate = 64.0
		minspeed = 0.0
		maxspeed = 12.0
	}
}
