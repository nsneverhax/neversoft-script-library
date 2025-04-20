GP_PH_Lansdowne_Leaves_01 = {
	pos = (-258.58475, 5.8842773, -130.29605)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	emitrangedims = (0.5, 0.5, 0.5)
	emit_target = (0.0, 0.5, -1.0)
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, -3.0, 0.0)
	windcoeff = 0.2
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	anglespread = 180.0
	liferange = (1.0, 2.0)
	emit_rate = 125.0
	max = 0
	timeseed = 0.0
	lifetime = 0.0
	emitnum = 0
	followemitter = 0.0
	emitfunction = constant
	emitperiod = 1.0
	sizerange = [
		(0.6, 0.6)
		(0.6, 0.6)
	]
	speedrange = (3.0, 3.5)
	rotvel = (2.0, -3.0)
	rotveltimescale = 0.0
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
		diffusetexture = PH_MapleLeaves_01
		specularpower = 0
		twoside
		alphacutoff = 1
		blendmode = blend
		quadanimationfps = 0
	}
	knot = [
		(0.248123, 0.0, -0.87789905)
		(0.248123, 0.0, -0.87789905)
		(0.15820602, 0.0, -0.560221)
		(-0.058665, 0.0, 0.215708)
		(-0.148582, 0.0, 0.533386)
		(-0.21686801, 0.0, 0.775925)
		(-0.42442402, 0.0, 0.64686406)
		(-0.22647601, 0.0, 0.802764)
		(-0.22647601, 0.0, 0.802764)
	]
	particlecolor = [
		-2611201
		-335609601
		-2611201
		-335609601
		-2611456
		-335609856
	]
	vertexweight = [
		0.79584897
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
