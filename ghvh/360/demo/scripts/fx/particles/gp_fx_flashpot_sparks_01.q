gp_fx_flashpot_sparks_01 = {
	pos = (-0.542961, 0.127141, 12.431411)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	emitrangedims = (0.03, 0.04, 0.03)
	emit_target = (0.0, 1.0, 0.0)
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, -5.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	anglespread = 12.0
	liferange = (0.8, 1.3)
	emit_rate = 1200.0
	max = 0
	timeseed = 0.0
	lifetime = 0.11
	emitnum = 0
	followemitter = 0.0
	alwaysemit
	emitfunction = constant
	emitperiod = 1.0
	sizerange = [
		(0.04, 0.025)
		(0.04, 0.05)
	]
	speedrange = (4.0, 7.0)
	rotvel = (0.0, 0.0)
	rotveltimescale = 0.0
	emitdelaystart = 0.0
	alignwithpath
	pathfollowtime = 0.09
	history = 3
	historylistcoordinatespace = world
	color = -4357377
	lod_default
	quickmaterial = {
		diffusetextureenabled
		diffusetexture = jow_spark01
		specularpower = 0
		bloom
		alphacutoff = 18
		blendmode = add
		quadanimationfps = 0
	}
	knot = [
		(-1.04373, 0.0, -0.100873)
		(-1.04373, 0.0, -0.100873)
		(-0.89906204, 0.0, -0.086893)
		(0.17762299, 0.0, 0.019448)
		(0.60445905, 0.0, 0.057839)
		(0.873444, 0.0, 0.086696)
		(0.49257702, 0.0, 0.047606)
		(1.04373, 0.0, 0.100873)
		(1.04373, 0.0, 0.100873)
	]
	particlecolor = [
		-1
		-1
		-1
		-1
		-256
		-256
	]
	vertexweight = [
		0.789535
		1.0
	]
}
