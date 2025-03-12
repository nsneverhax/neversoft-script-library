gp_fx_partylight_sparks_bounce = {
	pos = (3.7144532, 1.160887, -2.802793)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	attach
	emitrangedims = (0.1, 0.1, 0.1)
	emit_target = (0.0, 0.0, 0.0)
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, -6.0, 0.0)
	windcoeff = 0.6
	localwindcoeff = 1.1
	perparticlewind
	emittervelocityweight = 0.0
	radiate
	elevspread = (90.0, 270.0)
	sweepspread = (0.0, 360.0)
	bounceheight = 0.0
	bouncecoeff = 0.425
	bouncecallbackrate = 0.0
	liferange = (1.5, 2.0)
	emit_rate = 350.0
	max = 0
	timeseed = 0.0
	lifetime = 0.15
	emitnum = 0
	followemitter = 0.0
	emitfunction = constant
	emitperiod = 1.0
	sizerange = [
		(0.035, 0.07)
		(0.035, 0.105000004)
	]
	speedrange = (0.75, 1.25)
	rotvel = (0.0, 0.0)
	rotveltimescale = 0.0
	emitdelaystart = 0.0
	alignwithpath
	pathfollowtime = 0.07
	history = 2
	historylistcoordinatespace = world
	color = -803841
	lod_default
	novisibilitytest
	quickmaterial = {
		diffusetextureenabled
		diffusetexture = jow_spark01
		specularpower = 0
		bloom
		alphacutoff = 16
		blendmode = add
		quadanimationfps = 0
	}
	knot = [
		(-0.46765104, 0.0, -0.0)
		(-0.46765104, 0.0, -0.0)
		(-0.155884, 0.0, -0.0)
		(0.015655, 0.000449, 0.0028750002)
		(0.18719502, 0.00089699996, 0.00575)
		(0.171539, 0.000449, 0.0028750002)
		(0.155884, 0.0, -0.0)
		(0.46765104, 0.0, -0.0)
		(0.46765104, 0.0, -0.0)
	]
	particlecolor = [
		-9145089
		-1
		-2039585
		-256
		-205
		-1
	]
	vertexweight = [
		0.6896
		1.0
	]
}
