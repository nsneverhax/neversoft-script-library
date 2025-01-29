gp_budokan_tankflames01 = {
	pos = (-0.908859, 0.913574, 0.012195)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	attach
	align
	applypositionoffset
	attachobject = z_budokan_g_rmm_tanks02
	emitrangedims = (0.0, 0.0, 0.0)
	emit_target = (-1.0, 0.4, 0.0)
	enablerotate
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, 0.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	anglespread = 45.0
	liferange = (0.2, 0.5)
	emit_rate = 24.0
	max = 0
	timeseed = 0.0
	lifetime = 0.0
	emitnum = 16
	followemitter = 0.0
	emitfunction = constant
	emitperiod = 1.0
	sizerange = [
		(0.1, 0.1)
		(0.6, 0.1)
	]
	speedrange = (1.0, 1.2)
	rotvel = (0.0, 0.0)
	rotveltimescale = 0.0
	emitdelaystart = 0.0
	alignwithpath
	pathfollowtime = 1.5
	history = 2
	historylistcoordinatespace = world
	color = -1
	lod_distances = (20.0, 30.0)
	novisibilitytest
	quickmaterial = {
		texturelayout = layout2x2
		diffusetextureenabled
		diffusetexture = jow_statueflames01
		specularpower = 0
		alphacutoff = 24
		blendmode = blend
		burn
		burnvalue = 0.7
		quadanimationfps = 12
	}
	knot = [
		(-4.8371935, 0.0, -0.0)
		(-4.8371935, 0.0, -0.0)
		(-4.1530046, 0.0, -0.0)
		(-3.4688168, 0.0, -0.0)
		(-2.78463, 0.0, -0.0)
		(-1.26554, 0.0, -0.0)
		(0.253551, 0.0, -0.0)
		(1.7726411, 0.0, -0.0)
		(2.4186692, 0.0, -0.0)
		(3.0646958, 0.0, -0.0)
		(3.7107232, 0.0, -0.0)
		(3.7107232, 0.0, -0.0)
	]
	particlecolor = [
		-3080192
		-7405568
		-10288897
		-4521729
		-16776961
		-4496385
		-16777216
		-5150208
	]
	vertexweight = [
		0.240124
		0.773269
		1.0
	]
}
