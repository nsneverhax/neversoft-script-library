GP_PH_Puddle_WaterSpray = {
	pos = (336.78076, 0.24939002, -94.782036)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = textureribbontrail
	active
	createdatstart
	attach
	emitrangedims = (0.1, 0.1, 0.1)
	emit_target = (0.0, 1.0, 0.0)
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, -6.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	anglespread = 120.0
	liferange = (0.1, 1.0)
	emit_rate = 100.0
	max = 0
	timeseed = 0.0
	lifetime = 0.0
	emitnum = 0
	followemitter = 0.0
	emitfunction = constant
	emitperiod = 0.0
	sizerange = [
		(0.4, 0.4)
		(0.05, 0.05)
	]
	speedrange = (2.0, 3.0)
	rotvel = (0.0, 0.0)
	rotveltimescale = 0.0
	emitdelaystart = 0.0
	pathfollowtime = 0.0
	history = 7
	historylistcoordinatespace = object
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
		(0.26306197, 0.0, -0.833046)
		(0.26306197, 0.0, -0.833046)
		(0.087687, 0.0, -0.277682)
		(-0.087687, 0.0, 0.277682)
		(-0.26306197, 0.0, 0.833046)
		(-0.26306197, 0.0, 0.833046)
	]
	particlecolor = [
		1653839615
		1046111743
		1314482432
		421674240
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
