GP_TER_Skating_DRY = {
	pos = (425.5296, 0.0, -273.6516)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	attach
	emitrangedims = (0.05, 0.0, 0.05)
	emit_target = (0.0, 1.0, 0.0)
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, -1.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	anglespread = 100.0
	liferange = (0.1, 0.2)
	emit_rate = 20.0
	max = 10
	timeseed = 0.0
	lifetime = 0.0
	emitnum = 0
	followemitter = 0.0
	fillpath
	emitfunction = sin
	emitperiod = 1.0
	sizerange = [
		(0.1, 0.1)
		(1.0, 1.0)
	]
	speedrange = (1.0, 1.0)
	rotvel = (1.0, -1.0)
	rotveltimescale = 1.0
	emitdelaystart = 0.0
	pathfollowtime = 0.05
	history = 1
	historylistcoordinatespace = world
	color = -808464525
	lod_default
	quickmaterial = {
		texturelayout = layout2x2
		diffusetextureenabled
		diffusetexture = jow_steam02
		specularpower = 0
		staticshadow
		alphacutoff = 1
		blendmode = blend
		softedge
		softedgescale = 0.5
		quadanimationfps = 0
	}
	knot = [
		(-0.269531, 0.0, 0.25048798)
		(-0.269531, 0.0, 0.25048798)
		(-0.089844, 0.0, 0.083496)
		(0.089844, 0.0, -0.083496)
		(0.269531, 0.0, -0.25048798)
		(0.269531, 0.0, -0.25048798)
	]
	particlecolor = [
		-1516400251
		1818583162
		-1516400384
		1818583040
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
