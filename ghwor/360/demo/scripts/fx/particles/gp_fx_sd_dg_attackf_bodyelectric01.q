gp_fx_sd_dg_attackf_bodyelectric01 = {
	pos = (42.338596, 0.0, 78.269356)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	attach
	attachobject = z_finalbattle_trg_geo_ampzilla
	bone = bone_stomach_lower
	emitrangedims = (4.0, 4.0, 2.0)
	docircularemit
	emit_target = (1.0, 0.0, 0.0)
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, 0.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	radiate
	anglespread = 360.0
	dragcoeff = 0.5
	liferange = (0.1, 0.3)
	emit_rate = 16.0
	max = 0
	timeseed = 0.0
	lifetime = 0.0
	emitnum = 16
	followemitter = 0.0
	emitfunction = constant
	emitperiod = 0.0
	sizerange = [
		(6.0, 6.0)
		(12.0, 12.0)
	]
	speedrange = (8.0, 16.0)
	turbulence = (1.0, 3.0, -3.0)
	rotvel = (-3.0, 3.0)
	rotveltimescale = 1.0
	emitdelaystart = 0.0
	pathfollowtime = 0.025
	history = 2
	historylistcoordinatespace = world
	align_to = (1.0, 0.0, 0.0)
	rotate3d
	color = -13026817
	lod_default
	quickmaterial = {
		layoutn = 1
		layoutm = 1
		diffusetextureenabled
		diffusetexture = electriccircle_02
		specularpower = 0
		twoside
		bloom
		fillburst
		alphacutoff = 1
		blendmode = add
		aoshadow = 0.0
		quadanimationfps = 0
		lightgroup = allgroups
		fadeoutnearplane = 0.0
		fadeoutdistance = 0.1
	}
	knot = [
		(-0.64545804, 0.0, -0.0)
		(-0.64545804, 0.0, -0.0)
		(-0.47491202, 0.0, -0.0)
		(-0.304366, 0.0, -0.0)
		(-0.13382, 0.0, -0.0)
		(0.088232, 0.0, -0.0)
		(0.310284, 0.0, -0.0)
		(0.53233594, 0.0, -0.0)
		(0.53233594, 0.0, -0.0)
	]
	particlecolor = [
		-1
		-1
		-1
		-1
		-1
		-1
	]
	burnpervertex = [
		1.0
		1.0
		1.0
	]
	vertexweight = [
		0.43440402
		1.0
	]
}
