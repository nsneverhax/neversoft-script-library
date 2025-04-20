GP_PH_Slums_TrainDust = {
	pos = (0.015398, 0.689449, 0.12115301)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	attach
	align
	applypositionoffset
	attachobject = Z_Slums_train
	emitrangedims = (2.0, 0.1, 1.0)
	emit_target = (0.0, 1.0, 0.0)
	enablerotate
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, -0.05, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	anglespread = 10.0
	liferange = (1.0, 2.0)
	emit_rate = 50.0
	max = 0
	timeseed = 0.0
	lifetime = 0.0
	emitnum = 0
	followemitter = 0.1
	emitfunction = sin
	emitperiod = 1.0
	sizerange = [
		(0.5, 0.5)
		(4.0, 4.0)
	]
	speedrange = (0.5, 0.7)
	rotvel = (0.2, -0.2)
	rotveltimescale = 0.2
	emitdelaystart = 0.0
	pathfollowtime = 0.0
	history = 2
	historylistcoordinatespace = world
	color = -1
	novisibilitytest
	quickmaterial = {
		texturelayout = layout2x2
		diffusetextureenabled
		diffusetexture = jow_steam02
		specularpower = 0
		alphacutoff = 0
		blendmode = blend
		softedge
		softedgescale = 0.3
		quadanimationfps = 0
	}
	knot = [
		(-0.0077210004, 0.0, -1.078468)
		(-0.0077210004, 0.0, -1.078468)
		(-0.003855, 0.0, -0.97194594)
		(1E-05, 0.0, 0.162773)
		(0.0038760002, 0.0, 0.269295)
		(0.0038760002, 0.0, 0.75120294)
		(0.0038760002, 0.0, 0.20491299)
		(0.0038760002, 0.0, 0.68682104)
		(0.0038760002, 0.0, 0.68682104)
	]
	particlecolor = [
		1077886285
		1633639517
		1077886285
		1633639517
		1077886208
		1633639424
	]
	vertexweight = [
		0.749834
		1.0
	]
}
