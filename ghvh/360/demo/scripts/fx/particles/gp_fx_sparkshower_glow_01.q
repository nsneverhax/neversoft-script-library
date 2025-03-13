gp_fx_sparkshower_glow_01 = {
	pos = (-2.033874, 7.4327874, 0.811539)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	emitrangedims = (0.5, 0.01, 0.01)
	emit_target = (0.0, 0.0, 0.0)
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, 0.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	radiate
	anglespread = 360.0
	liferange = (0.15, 0.2)
	emit_rate = 50.0
	max = 0
	timeseed = 0.0
	lifetime = 0.5
	emitnum = 0
	followemitter = 0.0
	emitfunction = constant
	emitperiod = 1.0
	sizerange = [
		(1.25, 1.25)
		(4.0, 4.0)
	]
	speedrange = (0.0, 0.0)
	rotvel = (0.0, 1.0)
	rotveltimescale = 2.0
	emitdelaystart = 0.0
	pathfollowtime = 0.0
	history = 2
	historylistcoordinatespace = world
	color = -6932481
	lod_default
	novisibilitytest
	quickmaterial = {
		diffusetextureenabled
		diffusetexture = ph_radialglow_01
		specularpower = 0
		fillburst
		alphacutoff = 16
		blendmode = add
		burn
		burnvalue = 0.85
		quadanimationfps = 4
	}
	knot = [
		(-0.45922503, 0.0, 0.088377)
		(-0.45922503, 0.0, 0.088377)
		(-0.15307502, 0.0, 0.029459)
		(-0.21329702, 0.000174, 0.043976996)
		(-0.273522, 0.00034900004, 0.058495)
		(-0.060223, 0.000174, 0.014517999)
		(0.15307502, 0.0, -0.029459)
		(0.45922503, 0.0, -0.088377)
		(0.45922503, 0.0, -0.088377)
	]
	particlecolor = [
		-4690712
		-1
		-19956237
		-36
		-256
		-1
	]
	vertexweight = [
		0.278894
		1.0
	]
}
