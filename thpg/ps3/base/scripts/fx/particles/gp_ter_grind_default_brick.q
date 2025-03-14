gp_ter_grind_default_brick = {
	pos = (-74.00723, 0.0, -7.581228)
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
	emittervelocityweight = -0.2
	anglespread = 45.0
	liferange = (1.0, 2.0)
	emit_rate = 25.0
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
		(0.01, 0.01)
	]
	speedrange = (1.0, 2.0)
	rotvel = (-0.3, 0.3)
	rotveltimescale = 0.3
	emitdelaystart = 0.0
	pathfollowtime = 0.0
	history = 2
	historylistcoordinatespace = world
	color = -593153
	lod_default
	quickmaterial = {
		texturelayout = layout2x2
		diffusetextureenabled
		diffusetexture = PH_Gravel01
		speculartexture = PH_Gravel01
		specularpower = 0
		normalmap = PH_Gravel01
		staticshadow
		alphacutoff = 1
		blendmode = blend
		quadanimationfps = 0
	}
	knot = [
		(-75.090225, 0.0, -0.0)
		(-75.090225, 0.0, -0.0)
		(-52.707577, 0.0, -0.0)
		(-30.324903, 0.0, -0.0)
		(-7.9422297, 0.0, -0.0)
		(22.38269, 0.0, -0.0)
		(52.707584, 0.0, -0.0)
		(83.03249, 0.0, -0.0)
		(83.03249, 0.0, -0.0)
	]
	particlecolor = [
		-1302902273
		-1787403265
		-1302902273
		-1787403265
		-2143407104
		-1787403520
	]
	vertexweight = [
		0.42465705
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
