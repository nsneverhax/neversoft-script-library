GP_PH_ParkingSign_BouncySparks = {
	pos = (402.5807, 0.6929069, -98.1252)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = textureribbontrail
	active
	align
	applypositionoffset
	emitrangedims = (0.0, 0.1, 0.0)
	emit_target = (0.0, 0.0, 1.0)
	enablerotate
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, -3.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	anglespread = 90.0
	liferange = (0.3, 0.5)
	emit_rate = 3.0
	max = 0
	timeseed = 0.0
	lifetime = 0.0
	emitnum = 0
	followemitter = 0.0
	emitfunction = onoff
	emitperiod = 2.0
	sizerange = [
		(0.02, 0.02)
		(0.01, 0.01)
	]
	speedrange = (1.0, 2.0)
	rotvel = (0.0, 0.0)
	rotveltimescale = 0.5
	emitdelaystart = 0.0
	pathfollowtime = 0.0
	history = 3
	historylistcoordinatespace = world
	color = -1
	novisibilitytest
	quickmaterial = {
		diffusetextureenabled
		diffusetexture = jow_spark01
		specularpower = 0
		alphacutoff = 1
		blendmode = add
		quadanimationfps = 0
	}
	knot = [
		(-6.554622, 0.0, 6.554622)
		(-6.554622, 0.0, 6.554622)
		(-2.1848738, 0.0, 2.1848738)
		(2.1848738, 0.0, -2.1848738)
		(6.554622, 0.0, -6.554622)
		(6.554622, 0.0, -6.554622)
	]
	particlecolor = [
		-12049921
		-5168641
		-8969984
		-11460352
	]
	vertexweight = [
		1.0
	]
}
