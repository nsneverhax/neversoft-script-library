GP_TER_BoardSplash_RWheel_Back = {
	pos = (-0.16504899, 0.0, -0.0)
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
	enablerotate
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, 4.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	anglespread = 45.0
	liferange = (0.1, 0.2)
	emit_rate = 15.0
	max = 0
	timeseed = 0.0
	lifetime = 0.0
	emitnum = 0
	followemitter = 0.4
	fillpath
	emitfunction = constant
	emitperiod = 1.0
	sizerange = [
		(0.2, 0.2)
		(0.9, 0.9)
	]
	speedrange = (0.8, 1.0)
	rotvel = (-0.8, -0.6)
	rotveltimescale = 0.0
	emitdelaystart = 0.0
	pathfollowtime = 0.5
	history = 2
	historylistcoordinatespace = world
	color = -1
	lod_default
	quickmaterial = {
		diffusetextureenabled
		diffusetexture = PH_RainSplash_02
		specularpower = 0
		twoside
		softedge
		alphacutoff = 1
		blendmode = add
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
		-2038003969
		1027423743
		255
		255
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
