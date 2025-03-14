GP_PH_Slums_GateSparks01 = {
	pos = (2.9367893, -0.798584, -0.0)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = textureribbontrail
	active
	createdatstart
	attach
	align
	applypositionoffset
	attachobject = z_slums_obj_parkgate2
	emitrangedims = (0.05, 0.0, 0.05)
	emit_target = (0.0, 1.0, 0.0)
	enablerotate
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, -8.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	anglespread = 100.0
	liferange = (1.0, 1.0)
	emit_rate = 100.0
	max = 0
	timeseed = 0.0
	lifetime = 0.35000002
	emitnum = 0
	followemitter = 0.2
	fillpath
	emitfunction = constant
	emitperiod = 1.0
	sizerange = [
		(0.02, 0.02)
		(0.001, 0.001)
	]
	speedrange = (2.0, 3.0)
	rotvel = (0.0, 0.0)
	rotveltimescale = 0.0
	emitdelaystart = 0.0
	alignwithpath
	pathfollowtime = 0.05
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
