gp_fx_dragon_fireball_02 = {
	pos = (0.0, -1.4887841, 0.73460895)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	applypositionoffset
	attachobject = z_norway_g_encore_dragonhead
	emitrangedims = (0.3, 0.1, 0.0)
	emit_target = (0.0, 1.0, 0.0)
	enablerotate
	emitangle = (145.0, 0.0, 20.0)
	force = (0.0, 0.0, -0.5)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	anglespread = 70.0
	dragcoeff = 0.0
	liferange = (0.5, 0.6)
	emit_rate = 40.0
	max = 0
	timeseed = 0.0
	lifetime = 4.7
	emitnum = 0
	followemitter = 0.0
	emitfunction = constant
	emitperiod = 1.0
	sizerange = [
		(1.0, 1.0)
		(3.0, 3.0)
	]
	speedrange = (6.0, 7.0)
	rotvel = (1.0, -1.0)
	rotveltimescale = 0.6
	emitdelaystart = 0.0
	pathfollowtime = 0.1
	history = 2
	historylistcoordinatespace = object
	color = -3636737
	lod_default
	quickmaterial = {
		diffusetextureenabled
		diffusetexture = ph_fireball_01
		specularpower = 0
		alphacutoff = 1
		blendmode = add
		softedge
		softedgescale = 0.1
		quadanimationfps = 0
		lightgroup = allgroups
		fadeoutnearplane = 0.0
		fadeoutdistance = 0.1
	}
	knot = [
		(-0.47550198, 0.0, -0.0)
		(-0.47550198, 0.0, -0.0)
		(-0.386988, 0.0, -0.0)
		(-0.298475, 0.0, -0.0)
		(-0.20996101, 0.0, -0.0)
		(-0.13655598, 0.0, -0.0)
		(-0.063151, 0.0, -0.0)
		(0.010253999, 0.0, -0.0)
		(0.204969, 0.0, -0.0)
		(0.399684, 0.0, -0.0)
		(0.59439796, 0.0, -0.0)
		(0.59439796, 0.0, -0.0)
	]
	particlecolor = [
		-256
		-256
		-1
		-1
		-99
		-88
		-12500736
		-12052992
	]
	vertexweight = [
		0.24819201
		0.45402002
		1.0
	]
}
