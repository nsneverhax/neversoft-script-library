gp_fx_fsc_glowsmoke_01 = {
	pos = (-2.2053783, 0.523148, -6.1750865)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	emitrangedims = (0.0, 0.1, 0.0)
	emit_target = (0.0, 1.0, 0.0)
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, 0.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	anglespread = 70.0
	dragcoeff = 0.0
	liferange = (0.3, 0.6)
	emit_rate = 20.0
	max = 0
	timeseed = 10.0
	lifetime = 0.2
	emitnum = 0
	followemitter = 0.0
	emitfunction = constant
	emitperiod = 1.0
	sizerange = [
		(0.3, 0.3)
		(0.3, 0.3)
	]
	speedrange = (0.1, 0.7)
	rotvel = (0.3, -0.3)
	rotveltimescale = 0.5
	emitdelaystart = 0.0
	pathfollowtime = 0.0
	history = 2
	historylistcoordinatespace = world
	color = -1
	lod_default
	quickmaterial = {
		diffusetextureenabled
		diffusetexture = ph_smoke_singlepuff_blend_02
		specularpower = 0
		alphacutoff = 1
		blendmode = blend
		softedge
		softedgescale = 0.5
		burn
		burnvalue = 0.2
		quadanimationfps = 0
		lightgroup = allgroups
		fadeoutnearplane = 2.0
		fadeoutdistance = 1.0
	}
	knot = [
		(-0.412285, 0.0, -0.0)
		(-0.412285, 0.0, -0.0)
		(-0.338781, 0.0, -0.0)
		(-0.265277, 0.0, -0.0)
		(-0.191772, 0.0, -0.0)
		(-0.087588, 0.0, -0.0)
		(-0.111488, 0.0, -0.0)
		(-0.007304, 0.0, -0.0)
		(0.090212, 0.0, -0.0)
		(0.31581402, 0.0, -0.0)
		(0.41333, 0.0, -0.0)
		(0.41333, 0.0, -0.0)
	]
	particlecolor = [
		-5091329
		-1060353
		-5091329
		-1060353
		-1922880257
		-1583905537
		218562816
		923339008
	]
	vertexweight = [
		0.26708898
		0.49052
		1.0
	]
}
