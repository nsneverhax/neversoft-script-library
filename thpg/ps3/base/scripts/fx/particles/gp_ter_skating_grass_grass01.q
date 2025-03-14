gp_ter_skating_grass_grass01 = {
	pos = (3.529412, 0.0, -19.831932)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	attach
	emitrangedims = (0.0, 0.1, 0.0)
	emit_target = (0.0, 0.1, 0.0)
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, -9.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	anglespread = 110.0
	liferange = (0.25, 1.0)
	emit_rate = 5.0
	max = 0
	timeseed = 3.0
	lifetime = 0.0
	emitnum = 0
	followemitter = 0.5
	fillpath
	emitfunction = sawtooth
	emitperiod = 1.0
	sizerange = [
		(0.13, 0.13)
		(0.1, 0.1)
	]
	speedrange = (1.0, 3.0)
	rotvel = (-2.0, 2.0)
	rotveltimescale = 0.5
	emitdelaystart = 0.0
	pathfollowtime = 0.0
	history = 2
	historylistcoordinatespace = world
	align_to = (1.0, 0.0, 0.0)
	rotate3d
	color = -1
	novisibilitytest
	quickmaterial = {
		texturelayout = layout2x2
		diffusetextureenabled
		diffusetexture = HJ_Grass01
		speculartexture = HJ_Grass01
		specularpower = 0
		normalmap = HJ_Grass01
		twoside
		staticshadow
		alphacutoff = 1
		blendmode = blend
		quadanimationfps = 0
	}
	knot = [
		(0.0, 0.0, 0.365176)
		(0.0, 0.0, 0.365176)
		(0.0, 0.0, 0.31879398)
		(0.0, 0.0, 0.269482)
		(0.0, 0.0, 0.22016901)
		(0.0, 0.0, -0.0047910004)
		(0.0, 0.0, -0.22975199)
		(0.0, 0.0, -0.42682105)
		(0.0, 0.0, -0.42682105)
		(0.0, 0.0, -0.579104)
		(0.0, 0.0, -0.79303294)
		(0.0, 0.0, -0.79303294)
	]
	particlecolor = [
		-723476224
		-1999399680
		-723475969
		-1999399425
		-723475969
		-1999399425
		-723476224
		-1999399680
	]
	vertexweight = [
		0.125199
		0.6838121
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
