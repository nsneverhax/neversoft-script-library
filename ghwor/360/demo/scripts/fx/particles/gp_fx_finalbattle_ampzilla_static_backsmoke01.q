gp_fx_finalbattle_ampzilla_static_backsmoke01 = {
	pos = (2.0, -4.0, -1.0)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	attach
	align
	applypositionoffset
	attachobject = z_finalbattle_trg_geo_ampzilla
	bone = bone_stomach_lower
	emitrangedims = (0.5, 0.5, 0.5)
	emit_target = (0.5, 0.0, -1.0)
	enablerotate
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, 4.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 2.0
	emittervelocityweight = 0.0
	anglespread = 45.0
	selectedwind = violentwind01
	dragcoeff = 0.5
	liferange = (1.7, 2.0)
	emit_rate = 18.0
	max = 0
	timeseed = 0.0
	lifetime = 0.0
	emitnum = 0
	followemitter = 0.0
	fillpath
	emitfunction = onoff
	emitperiod = 2.7
	sizerange = [
		(2.0, 2.0)
		(6.0, 6.0)
	]
	speedrange = (5.0, 6.0)
	turbulence = (0.0, 0.0, 0.0)
	rotvel = (-0.15, -0.05)
	rotveltimescale = 1.0
	emitdelaystart = 0.0
	pathfollowtime = 0.0
	history = 2
	historylistcoordinatespace = world
	color = 1110717695
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
		-1772730112
		-1708644352
		-1150921217
		-1739237889
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
