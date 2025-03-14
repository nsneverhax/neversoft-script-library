GP_TER_Skating_Carpet_Bits_01 = {
	pos = (400.62582, 0.0, -102.11841)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	attach
	emitrangedims = (0.1, 0.1, 0.1)
	emit_target = (0.0, 1.0, 0.0)
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, -4.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	radiate
	elevspread = (90.0, 270.0)
	sweepspread = (0.0, 360.0)
	liferange = (0.5, 1.0)
	emit_rate = 15.0
	max = 0
	timeseed = 0.0
	lifetime = 0.0
	emitnum = 0
	followemitter = 0.5
	emitfunction = sin
	emitperiod = 4.0
	sizerange = [
		(0.04, 0.04)
		(0.03, 0.03)
	]
	speedrange = (0.5, 1.0)
	rotvel = (-1.0, 1.0)
	rotveltimescale = 0.5
	emitdelaystart = 0.0
	pathfollowtime = 0.0
	history = 2
	historylistcoordinatespace = world
	align_to = (1.0, 0.0, 0.0)
	rotate3d
	color = -1
	lod_default
	quickmaterial = {
		texturelayout = layout2x2
		diffusetextureenabled
		diffusetexture = HJ_Grass01
		specularpower = 0
		twoside
		staticshadow
		alphacutoff = 1
		blendmode = diffuse
		quadanimationfps = 0
	}
	knot = [
		(0.32095304, 0.0, -0.77856404)
		(0.32095304, 0.0, -0.77856404)
		(0.106984, 0.0, -0.259521)
		(-0.106984, 0.0, 0.259521)
		(-0.32095304, 0.0, 0.77856404)
		(-0.32095304, 0.0, 0.77856404)
	]
	particlecolor = [
		2138601727
		-1701143809
		-674773248
		-1701144064
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
