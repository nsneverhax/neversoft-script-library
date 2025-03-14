GP_TER_PH_RockBits_01 = {
	pos = (397.75964, 0.0, -105.305786)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	attach
	emitrangedims = (0.1, 0.0, 0.1)
	emit_target = (0.0, 1.0, 0.0)
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, -5.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	anglespread = 110.0
	liferange = (1.0, 2.0)
	emit_rate = 2.0
	max = 0
	timeseed = 0.0
	lifetime = 0.0
	emitnum = 0
	followemitter = 0.5
	fillpath
	emitfunction = sin
	emitperiod = 1.0
	sizerange = [
		(0.02, 0.02)
		(0.04, 0.04)
	]
	speedrange = (3.0, 4.0)
	rotvel = (-3.0, 3.0)
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
		1583175423
		-1549757953
		1666928640
		-1549629184
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
