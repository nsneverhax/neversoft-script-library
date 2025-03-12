gp_fx_sd_dg_attackf_bodysparks01 = {
	pos = (42.339096, 0.0, 77.94541)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	attach
	attachobject = z_finalbattle_trg_geo_ampzilla
	bone = bone_stomach_lower
	emitrangedims = (6.0, 6.0, 3.0)
	docircularemit
	emit_target = (1.0, 0.0, 0.0)
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, -9.81, 0.0)
	windcoeff = 0.0
	localwindcoeff = 2.0
	emittervelocityweight = 0.0
	radiate
	anglespread = 360.0
	selectedwind = violentwind01
	dragcoeff = 0.5
	liferange = (1.5, 2.0)
	emit_rate = 128.0
	max = 0
	timeseed = 0.0
	lifetime = 0.0
	emitnum = 128
	followemitter = 0.0
	emitfunction = constant
	emitperiod = 0.0
	sizerange = [
		(0.2, 0.2)
		(0.1, 0.1)
	]
	speedrange = (8.0, 24.0)
	turbulence = (1.0, 3.0, -3.0)
	rotvel = (0.0, 0.0)
	rotveltimescale = 0.0
	emitdelaystart = 0.4
	alignwithpath
	pathfollowtime = 0.025
	history = 2
	historylistcoordinatespace = world
	color = -13026817
	lod_default
	quickmaterial = {
		texturelayout = layout2x2
		layoutn = 1
		layoutm = 1
		diffusetextureenabled
		diffusetexture = ph_sparks_01
		specularpower = 0
		bloom
		fillburst
		alphacutoff = 1
		blendmode = add
		softedge
		softedgescale = 1.0
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
