GP_PH_Slums_Train_Sparks2 = {
	pos = (-0.30967304, 0.0, -4.0674562)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	attach
	align
	applypositionoffset
	attachobject = z_slums_train2
	emitrangedims = (1.0, 0.0, 0.0)
	emit_target = (0.0, 0.7, -1.0)
	enablerotate
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, -5.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	anglespread = 40.0
	liferange = (0.7, 0.9)
	emit_rate = 100.0
	max = 0
	timeseed = 0.0
	lifetime = 6.0
	emitnum = 0
	followemitter = 0.53
	fillpath
	emitfunction = sawtooth
	emitperiod = 2.0
	sizerange = [
		(0.1, 0.1)
		(0.0, 0.0)
	]
	speedrange = (4.0, 6.0)
	rotvel = (0.0, 0.0)
	rotveltimescale = 0.0
	emitdelaystart = 0.0
	alignwithpath
	pathfollowtime = 0.1
	history = 2
	historylistcoordinatespace = world
	color = -1
	lod_default
	quickmaterial = {
		diffusetextureenabled
		diffusetexture = jow_spark01
		specularpower = 0
		alphacutoff = 1
		blendmode = add
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
		-11924481
		-4964097
		-11924736
		-4964352
	]
	vertexweight = [
		1.0
	]
}
