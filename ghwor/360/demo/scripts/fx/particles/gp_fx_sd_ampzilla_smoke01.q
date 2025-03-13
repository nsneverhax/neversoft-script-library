gp_fx_sd_ampzilla_smoke01 = {
	pos = (41.7106, -4.0, 80.265816)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	attach
	attachobject = z_finalbattle_trg_geo_ampzilla
	bone = bone_shoulder_lift_r
	emitrangedims = (1.5, 1.5, 1.5)
	emit_target = (0.5, 1.0, 0.0)
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, 1.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 2.0
	emittervelocityweight = 0.0
	anglespread = 45.0
	selectedwind = violentwind01
	dragcoeff = 0.5
	liferange = (1.0, 1.2)
	emit_rate = 6.0
	max = 0
	timeseed = 0.0
	lifetime = 0.0
	emitnum = 0
	followemitter = 0.0
	fillpath
	emitfunction = constant
	emitperiod = 1.7
	sizerange = [
		(6.0, 6.0)
		(12.0, 12.0)
	]
	speedrange = (5.0, 6.0)
	turbulence = (0.0, 0.0, 0.0)
	rotvel = (-0.15, -0.05)
	rotveltimescale = 1.0
	emitdelaystart = 0.0
	pathfollowtime = 0.0
	history = 2
	historylistcoordinatespace = world
	color = 1497777919
	lod_default
	quickmaterial = {
		layoutn = 1
		layoutm = 1
		diffusetextureenabled
		diffusetexture = ph_smoke_singlepuff_blend_02
		specularpower = 0
		alphacutoff = 1
		blendmode = blend
		burn
		burnvalue = 1.0
		aoshadow = 0.0
		quadanimationfps = 0
		lightgroup = allgroups
		fadeoutnearplane = 0.0
		fadeoutdistance = 0.1
	}
	knot = [
		(-0.66779506, 0.0, -0.0)
		(-0.66779506, 0.0, -0.0)
		(-0.585361, 0.0, -0.0)
		(-0.50292695, 0.0, -0.0)
		(-0.42049402, 0.0, -0.0)
		(-0.269806, 0.0, -0.0)
		(-0.119119, 0.0, -0.0)
		(0.031569, 0.0, -0.0)
		(0.255332, 0.0, -0.0)
		(0.479095, 0.0, -0.0)
		(0.702859, 0.0, -0.0)
		(0.702859, 0.0, -0.0)
	]
	particlecolor = [
		-7177216
		-9079552
		-7637761
		-1451788289
		-554893313
		-1
		-256
		-858784000
	]
	burnpervertex = [
		1.0
		0.5
		0.0
		0.0
	]
	vertexweight = [
		0.18042602
		0.510241
		1.0
	]
}
