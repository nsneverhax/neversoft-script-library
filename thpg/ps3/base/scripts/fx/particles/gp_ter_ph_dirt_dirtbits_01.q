GP_TER_PH_Dirt_DirtBits_01 = {
	pos = (398.06744, 0.0, -106.427)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	attach
	emitrangedims = (0.1, 0.0, 0.0)
	emit_target = (0.0, 1.0, 0.0)
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, -2.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	anglespread = 45.0
	liferange = (1.5, 3.0)
	emit_rate = 50.0
	max = 0
	timeseed = 2.0
	lifetime = 0.0
	emitnum = 0
	followemitter = 0.0
	fillpath
	emitfunction = constant
	emitperiod = 1.0
	sizerange = [
		(0.02, 0.02)
		(0.02, 0.02)
	]
	speedrange = (0.2, 2.0)
	rotvel = (-8.0, 8.0)
	rotveltimescale = 1.0
	emitdelaystart = 0.0
	pathfollowtime = 0.0
	history = 2
	historylistcoordinatespace = world
	color = -1
	lod_default
	quickmaterial = {
		texturelayout = layout2x2
		diffusetextureenabled
		diffusetexture = PH_Gravel01
		speculartexture = PH_Gravel01
		specularpower = 0
		normalmap = PH_Gravel01_N
		staticshadow
		alphacutoff = 1
		blendmode = blend
		quadanimationfps = 0
	}
	knot = [
		(-0.13317901, 0.0, -0.50305206)
		(-0.13317901, 0.0, -0.50305206)
		(-0.044393, 0.0, -0.16768399)
		(0.044393, 0.0, 0.16768399)
		(0.13317901, 0.0, 0.50305206)
		(0.13317901, 0.0, 0.50305206)
	]
	particlecolor = [
		2137936127
		-2107359745
		2137935872
		-2107360000
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
